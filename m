Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD173C1447
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 15:27:31 +0200 (CEST)
Received: from localhost ([::1]:44264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1U3u-0008H6-6j
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 09:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1U2s-0007Cx-AD
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 09:26:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1U2q-0004Gz-1U
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 09:26:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625750783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WJS0Ysw/OvwMi1s2Mbyh7OR1c/+ws0yHJZpll6dqTTw=;
 b=CEGPaMXD704Mwj6OW5eehku9CHqEVjSOpj8VkY23xb6uY52QFpiecIXcWWHsc8mqiVzbcU
 SYZlykkbK/CkNbA5OX6kfnYAGoIVJJGQXKHg6ZjQSIZ7HyXfY/rhY/TUr9JYLJTVpJi1Oe
 7JI/dwBRhq0zSzE7ZBTmPXadQsBm04M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-wBtlSFOFO4CVTnGiKLEZ8w-1; Thu, 08 Jul 2021 09:26:20 -0400
X-MC-Unique: wBtlSFOFO4CVTnGiKLEZ8w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8151A824F89;
 Thu,  8 Jul 2021 13:26:18 +0000 (UTC)
Received: from redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE80D189C4;
 Thu,  8 Jul 2021 13:26:16 +0000 (UTC)
Date: Thu, 8 Jul 2021 08:26:15 -0500
From: Eric Blake <eblake@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v6 1/6] qcow2: Fix dangling pointer after reopen for 'file'
Message-ID: <20210708132615.g4hhii4qsxuxq2uz@redhat.com>
References: <20210708114709.206487-1-kwolf@redhat.com>
 <20210708114709.206487-2-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210708114709.206487-2-kwolf@redhat.com>
User-Agent: NeoMutt/20210205-556-f84451-dirty
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: vsementsov@virtuozzo.com, berto@igalia.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 08, 2021 at 01:47:04PM +0200, Kevin Wolf wrote:
> Without an external data file, s->data_file is a second pointer with the
> same value as bs->file. When changing bs->file to a different BdrvChild
> and freeing the old BdrvChild, s->data_file must also be updated,
> otherwise it points to freed memory and causes crashes.
> 
> This problem was caught by iotests case 245.
> 
> Fixes: df2b7086f169239ebad5d150efa29c9bb6d4f820
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  block/qcow2.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


