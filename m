Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B7B1D1FE2
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 22:14:52 +0200 (CEST)
Received: from localhost ([::1]:50264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYxmF-00072A-GW
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 16:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jYxlU-0006Pe-Os
 for qemu-devel@nongnu.org; Wed, 13 May 2020 16:14:04 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:46711
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jYxlS-0002Jc-LV
 for qemu-devel@nongnu.org; Wed, 13 May 2020 16:14:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589400840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S51McUSQkVNGVHcZ7RER/pKa0a9QibuKEWneMBzyi2A=;
 b=Yg9GMtoSrYz+RILKYaWOcfoTOpOdZnzaDc2CttyA5vkGSAk60k150AtP2ygBIn6I7hAnnX
 YlsYbVAD1wUDlS4xQE+3DSLhlSBGZVNfI7Q65MSYM/CVKKOQLZ33uDGAgZSkqjhyw+dcGO
 Ng4K2xpDXhvubFF3p5WYWjnFbrYgoEc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-aGSdncUVOwiibkhPOlTjhA-1; Wed, 13 May 2020 16:13:56 -0400
X-MC-Unique: aGSdncUVOwiibkhPOlTjhA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD7FD18A0760;
 Wed, 13 May 2020 20:13:55 +0000 (UTC)
Received: from [10.3.116.145] (ovpn-116-145.phx2.redhat.com [10.3.116.145])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 624E02B5B8;
 Wed, 13 May 2020 20:13:55 +0000 (UTC)
Subject: Re: [PATCH v4 10/34] block: Add generic bdrv_inherited_options()
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20200513110544.176672-1-mreitz@redhat.com>
 <20200513110544.176672-11-mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <04311eed-d5e6-6935-bdac-33b2070be8c9@redhat.com>
Date: Wed, 13 May 2020 15:13:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200513110544.176672-11-mreitz@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 03:05:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

On 5/13/20 6:05 AM, Max Reitz wrote:
> After the series this patch belongs to, we want to have a common
> BdrvChildClass that encompasses all of child_file, child_format, and
> child_backing.  Such a single class needs a single .inherit_options()
> implementation, and this patch introduces it.
> 
> The next patch will show how the existing implementations can fall back
> to it just by passing appropriate BdrvChildRole and parent_is_format
> values.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   block.c | 81 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 81 insertions(+)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


