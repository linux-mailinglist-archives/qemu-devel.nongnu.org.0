Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 573CB35E060
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 15:43:23 +0200 (CEST)
Received: from localhost ([::1]:43242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWJK6-0005LV-EK
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 09:43:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lWJIE-0004Q6-46
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 09:41:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lWJI9-0006Ua-5m
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 09:41:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618321278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S1G7/w62Jx2n46tCB9uK51XmiS5SEV1xJPPirwiz80g=;
 b=Ywlq7buuMZVpnL9HEYFWMVk1i23tpdFeI58v2YBWzdpxhoHFF8vKuUpUz+Dn5mEQXrkT0O
 VUGCH1c7c9lOGRb3wDfpD55p7ASYWtwEwnrbOvDFZ/aRVWyftDHiMkK8qzbcC9d7eFqIDp
 lMp791IfEH+ooXxLc5WhYJE9HkmOOvo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-R6u5UhJ-Pdunn6JJwdbLDw-1; Tue, 13 Apr 2021 09:41:13 -0400
X-MC-Unique: R6u5UhJ-Pdunn6JJwdbLDw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6680F10054F6;
 Tue, 13 Apr 2021 13:41:12 +0000 (UTC)
Received: from [10.3.114.86] (ovpn-114-86.phx2.redhat.com [10.3.114.86])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED57860C04;
 Tue, 13 Apr 2021 13:41:11 +0000 (UTC)
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20210413132324.24043-1-kwolf@redhat.com>
 <20210413132324.24043-2-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH 1/2] block: Add BDRV_O_NO_SHARE for blk_new_open()
Message-ID: <da50e485-75be-17ce-85c4-357b3401fd7f@redhat.com>
Date: Tue, 13 Apr 2021 08:41:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210413132324.24043-2-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: xuwei@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 8:23 AM, Kevin Wolf wrote:
> Normally, blk_new_open() just shares all permissions. This was fine
> originally when permissions only protected against uses in the same
> process because no other part of the code would actually get to access
> the block nodes opened with blk_new_open(). However, since we use it for
> file locking now, unsharing permissions becomes desirable.
> 
> Add a new BDRV_O_NO_SHARE flag that is used in blk_new_open() to unshare
> any permissions that can be unshared.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  include/block/block.h |  1 +
>  block/block-backend.c | 19 +++++++++++++------
>  2 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/include/block/block.h b/include/block/block.h
> index b3f6e509d4..735db05a39 100644
> --- a/include/block/block.h
> +++ b/include/block/block.h
> @@ -101,6 +101,7 @@ typedef struct HDGeometry {
>      uint32_t cylinders;
>  } HDGeometry;
>  
> +#define BDRV_O_NO_SHARE    0x0001 /* don't share permissons */
>  #define BDRV_O_RDWR        0x0002

Huh. We originally created BDRV_O_RDONLY = 0 and BDRV_O_RDWR = 2 back in
commit 83f6409109 (in 2006); I see no reason why we skipped 1 at that
time (maybe to allow BDRV_O_WRONLY? but who would use it), so exploiting
it now seems fine.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


