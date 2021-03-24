Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6F0347AAB
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 15:29:28 +0100 (CET)
Received: from localhost ([::1]:39408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP4Vj-0004HE-3Y
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 10:29:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lP4Sy-0001Mz-8i
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:26:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lP4Sv-0004vW-1A
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:26:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616595990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S5iHfEIA3GDjFPgq6a/QcVRkgfVxVhxuHiiap4dnpak=;
 b=cVaG4Sngt+xPkKg9JGVAzUlNTQnOPk+1OwSERzhkZCbHOyh2k41fLTNnf8S+8Udpi/48HL
 jgxASVuZh9uLJkD5BcAQsVwUsEIz29OIQB4CFLVuz/u6P0OgtLrLlEWJZQahCavL75i9N3
 ecZ6+tt9v9E3a5n5nnB+o0mGwEkPhrc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-JpIFyHNDOLm70nHH17b7yA-1; Wed, 24 Mar 2021 10:26:28 -0400
X-MC-Unique: JpIFyHNDOLm70nHH17b7yA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA4A280197D;
 Wed, 24 Mar 2021 14:25:59 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-161.ams2.redhat.com
 [10.36.113.161])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 93F405D766;
 Wed, 24 Mar 2021 14:25:58 +0000 (UTC)
Subject: Re: [PATCH 2/6] block/vdi: Don't assume that blocks are larger than
 VdiHeader
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210317180013.235231-1-pbonzini@redhat.com>
 <20210317180013.235231-3-pbonzini@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <082a32cc-c09e-522d-429d-49a1727c81f5@redhat.com>
Date: Wed, 24 Mar 2021 15:25:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210317180013.235231-3-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
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
Cc: david.edmondson@oracle.com, kwolf@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.03.21 19:00, Paolo Bonzini wrote:
> From: David Edmondson <david.edmondson@oracle.com>
> 
> Given that the block size is read from the header of the VDI file, a
> wide variety of sizes might be seen. Rather than re-using a block
> sized memory region when writing the VDI header, allocate an
> appropriately sized buffer.
> 
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> Message-Id: <20210309144015.557477-3-david.edmondson@oracle.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   block/vdi.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/block/vdi.c b/block/vdi.c
> index 2a6dc26124..548f8a057b 100644
> --- a/block/vdi.c
> +++ b/block/vdi.c
> @@ -696,18 +696,20 @@ nonallocating_write:
>   
>       if (block) {
>           /* One or more new blocks were allocated. */
> -        VdiHeader *header = (VdiHeader *) block;
> +        VdiHeader *header;
>           uint8_t *base;
>           uint64_t offset;
>           uint32_t n_sectors;
>   
> +        g_free(block);

This logic (checking @block != NULL) was a bit weird before and this 
just seems to accomodate it.  We probably shouldn’t check @block, but 
some boolean, and *block should be freed after the while () loop.

Considering the “if (block)” was there already and it’d be weird to keep 
that check if *block were freed by that point, I suppose this isn’t 
making it worse, though, so:

Reviewed-by: Max Reitz <mreitz@redhat.com>

> +        header = g_malloc(sizeof(*header));
> +
>           logout("now writing modified header\n");
>           assert(VDI_IS_ALLOCATED(bmap_first));
>           *header = s->header;
>           vdi_header_to_le(header);
> -        ret = bdrv_pwrite(bs->file, 0, block, sizeof(VdiHeader));
> -        g_free(block);
> -        block = NULL;
> +        ret = bdrv_pwrite(bs->file, 0, header, sizeof(*header));
> +        g_free(header);
>   
>           if (ret < 0) {
>               return ret;
> 


