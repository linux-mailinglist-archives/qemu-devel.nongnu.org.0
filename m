Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5A53E2676
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 10:52:29 +0200 (CEST)
Received: from localhost ([::1]:37148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBvae-0008Ro-N7
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 04:52:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBvZg-0007gW-Q9
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 04:51:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBvZf-0000I5-CS
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 04:51:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628239886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p4EzdVgKOJgSKeIrgmz+E8h2vkL68FgNkMcy8T24LSU=;
 b=BRoWt7vgnl1VEohIpmsuYJqEIVyageZqng/gf74wYHo/NnkoaziBGOZ03pNTjw0zqkAFrO
 nqdFz8JG+/f4FJPcHEwt3QO7/lSaf4Sq+VDhMnQuobSRw4gUwlxRX7YoJ+/FFsm4EV++QD
 kO/7zrr+PYysV4iwOSkEGBTvVA28Jqg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-cXSYRDu1NAiWL0SisgERLg-1; Fri, 06 Aug 2021 04:51:23 -0400
X-MC-Unique: cXSYRDu1NAiWL0SisgERLg-1
Received: by mail-wm1-f72.google.com with SMTP id
 a18-20020a05600c2252b02902531dcdc68fso3622975wmm.6
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 01:51:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p4EzdVgKOJgSKeIrgmz+E8h2vkL68FgNkMcy8T24LSU=;
 b=r2TkkB8LeI/9XaPQksf6Z0VTWKXPZwUQyLyiZL/vhttso6MnrNeiUXyzzonpqvNhHN
 oR1vCH9Pgohy4QAOZwTeMzfrrztHJ711BFKXE/aY6sWAk8BfxRURSRbcfCU1blyP3/aS
 shreWo7PxJcTmcUshwXdrUTo6msGHw4du5qyxFTW5/6TdfY0RNM12iC2PxykFZBKFtRt
 j2LrYFdgcIj+4PnGk8A0+bEgFk/w0hrsvli5/zaOT7mrEzN7nLpInegVeMOiGYcYfr8i
 g+vorNyDQCRGziYf5b79gD0/XJ+9RE9oFvRqSGx7a4jIkmNnaAnKHC0lwcSjkBsxNsg/
 r9qA==
X-Gm-Message-State: AOAM531MYCT5mXMobGSkUmPfemPjvrFeKtsyGqxsuQk+SCiDa0meZ55B
 OfATDnltPbUyWb4RFhUCGden+LD20VQH7K/DHBKUEC3egb5drrOiYhjhA1j1WXQc+7lebKvIdGA
 lhy/3o7+OY8MmvHY=
X-Received: by 2002:a1c:f214:: with SMTP id s20mr2107302wmc.14.1628239882677; 
 Fri, 06 Aug 2021 01:51:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXS8VtMwlZlTVziXPUMyvsRs4vJeEIWTdbH/gOaLrk8ZnSGs4vM/A9Fu3HI/dKlKoVZyOOQQ==
X-Received: by 2002:a1c:f214:: with SMTP id s20mr2107285wmc.14.1628239882502; 
 Fri, 06 Aug 2021 01:51:22 -0700 (PDT)
Received: from thuth.remote.csb
 (dynamic-046-114-147-107.46.114.pool.telefonica.de. [46.114.147.107])
 by smtp.gmail.com with ESMTPSA id o28sm4619222wms.14.2021.08.06.01.51.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 01:51:22 -0700 (PDT)
Subject: Re: [PATCH v1 10/12] hw/s390x/s390-skeys: use memory mapping to
 detect which storage keys to dump
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210805152804.100333-1-david@redhat.com>
 <20210805152804.100333-11-david@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <90931da4-234f-5f83-60f2-5ada3ead1e00@redhat.com>
Date: Fri, 6 Aug 2021 10:51:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210805152804.100333-11-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/08/2021 17.28, David Hildenbrand wrote:
> Handle it similar to migration. Assert that we're holding the BQL, to
> make sure we don't see concurrent modifications.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   hw/s390x/s390-skeys.c | 50 ++++++++++++++++++++++++++-----------------
>   1 file changed, 30 insertions(+), 20 deletions(-)
> 
> diff --git a/hw/s390x/s390-skeys.c b/hw/s390x/s390-skeys.c
> index 250685a95a..56a47fe180 100644
> --- a/hw/s390x/s390-skeys.c
> +++ b/hw/s390x/s390-skeys.c
> @@ -110,11 +110,10 @@ void qmp_dump_skeys(const char *filename, Error **errp)
>   {
>       S390SKeysState *ss = s390_get_skeys_device();
>       S390SKeysClass *skeyclass = S390_SKEYS_GET_CLASS(ss);
> -    MachineState *ms = MACHINE(qdev_get_machine());
> -    const uint64_t total_count = ms->ram_size / TARGET_PAGE_SIZE;
> -    uint64_t handled_count = 0, cur_count;
> +    GuestPhysBlockList guest_phys_blocks;
> +    GuestPhysBlock *block;
> +    uint64_t pages, gfn;
>       Error *lerr = NULL;
> -    vaddr cur_gfn = 0;
>       uint8_t *buf;
>       int ret;
>       int fd;
> @@ -145,28 +144,39 @@ void qmp_dump_skeys(const char *filename, Error **errp)
>           goto out;
>       }
>   
> -    /* we'll only dump initial memory for now */
> -    while (handled_count < total_count) {
> -        /* Calculate how many keys to ask for & handle overflow case */
> -        cur_count = MIN(total_count - handled_count, S390_SKEYS_BUFFER_SIZE);
> +    assert(qemu_mutex_iothread_locked());
> +    guest_phys_blocks_init(&guest_phys_blocks);
> +    guest_phys_blocks_append(&guest_phys_blocks);
>   
> -        ret = skeyclass->get_skeys(ss, cur_gfn, cur_count, buf);
> -        if (ret < 0) {
> -            error_setg(errp, "get_keys error %d", ret);
> -            goto out_free;
> -        }
> +    QTAILQ_FOREACH(block, &guest_phys_blocks.head, next) {
> +        assert(QEMU_IS_ALIGNED(block->target_start, TARGET_PAGE_SIZE));
> +        assert(QEMU_IS_ALIGNED(block->target_end, TARGET_PAGE_SIZE));
>   
> -        /* write keys to stream */
> -        write_keys(f, buf, cur_gfn, cur_count, &lerr);
> -        if (lerr) {
> -            goto out_free;
> -        }
> +        gfn = block->target_start / TARGET_PAGE_SIZE;
> +        pages = (block->target_end - block->target_start) / TARGET_PAGE_SIZE;
>   
> -        cur_gfn += cur_count;
> -        handled_count += cur_count;
> +        while (pages) {
> +            const uint64_t cur_pages = MIN(pages, S390_SKEYS_BUFFER_SIZE);
> +
> +            ret = skeyclass->get_skeys(ss, gfn, cur_pages, buf);
> +            if (ret < 0) {
> +                error_setg_errno(errp, -ret, "get_keys error");
> +                goto out_free;
> +            }
> +
> +            /* write keys to stream */
> +            write_keys(f, buf, gfn, cur_pages, &lerr);
> +            if (lerr) {
> +                goto out_free;
> +            }
> +
> +            gfn += cur_pages;
> +            pages -= cur_pages;
> +        }
>       }
>   
>   out_free:
> +    guest_phys_blocks_free(&guest_phys_blocks);
>       error_propagate(errp, lerr);
>       g_free(buf);
>   out:
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


