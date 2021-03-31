Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC15C350830
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 22:29:21 +0200 (CEST)
Received: from localhost ([::1]:41158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRhSr-00082P-18
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 16:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lRhQe-0006AU-0p
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 16:27:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lRhQa-0002Yh-RI
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 16:27:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617222415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z9BdL1xV4jpK3CrQOOKanTTN1nVWQJk3jYZ34i/z9jQ=;
 b=f/KwfxEeY6v7n+z5nOGug9+ErifPD9Ecocp44yvKL3Bf5bPpmSe96T/hhhhp22WRFleJMf
 Nr5nZS8h1bLgveZnaCROlM+XOmyW63GdexK+sEkaR5rZxUqO5x9fyOgc+Uu+3KYYWJ9K3+
 83vYXFvOPlyraOQjJj3GvtVaQ0QVhZc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-u3OnI4hxNvmWkjd954a69g-1; Wed, 31 Mar 2021 16:26:51 -0400
X-MC-Unique: u3OnI4hxNvmWkjd954a69g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4D99190B2A1;
 Wed, 31 Mar 2021 20:26:50 +0000 (UTC)
Received: from [10.3.113.141] (ovpn-113-141.phx2.redhat.com [10.3.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 58A04A845C;
 Wed, 31 Mar 2021 20:26:50 +0000 (UTC)
Subject: Re: [PATCH] iotests: Test mirror-top filter permissions
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210331122815.51491-1-mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <be081604-e7c7-1784-f865-7ad850ae76ca@redhat.com>
Date: Wed, 31 Mar 2021 15:26:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210331122815.51491-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/31/21 7:28 AM, Max Reitz wrote:
> Add a test accompanying commit 53431b9086b2832ca1aeff0c55e186e9ed79bd11
> ("block/mirror: Fix mirror_top's permissions").
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  tests/qemu-iotests/tests/mirror-top-perms     | 121 ++++++++++++++++++
>  tests/qemu-iotests/tests/mirror-top-perms.out |   5 +
>  2 files changed, 126 insertions(+)
>  create mode 100755 tests/qemu-iotests/tests/mirror-top-perms
>  create mode 100644 tests/qemu-iotests/tests/mirror-top-perms.out

Safe for -rc2 if you want to get it in.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


