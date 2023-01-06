Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB33660623
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 19:02:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDr1x-0001MI-Fj; Fri, 06 Jan 2023 13:01:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pDr1o-0001Lq-Jn
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 13:01:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pDr1k-0006Aw-OR
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 13:01:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673028070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4p08aKxSGo8yCRE7+dppzSBhsMzKEKHJD1O0cxXcC6s=;
 b=FoXmTRwP95Adr8rPJaqebu8H3FY/YCaNHnzfBiOi2+8PLFhhONrxRcyJgZTrx7qYCKYVCy
 uRl9uGTm+o0bWUmdPujXFLmBy8lTidTwMLIahf7J4AT7x2lhbYhoh26jeaSWyYxROaJ/7c
 ZwVmELCcx19iDQIt1+5pwsJxklj9G/Q=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-144-8erfBd7MPjeW3w5HdgrlKA-1; Fri, 06 Jan 2023 13:01:08 -0500
X-MC-Unique: 8erfBd7MPjeW3w5HdgrlKA-1
Received: by mail-il1-f199.google.com with SMTP id
 c11-20020a056e020bcb00b0030be9d07d63so1509191ilu.0
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 10:01:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4p08aKxSGo8yCRE7+dppzSBhsMzKEKHJD1O0cxXcC6s=;
 b=Gv7XmX/WuhFyt+zurTb5vkHx+h8ajtlLvqkxIk6EDrjtMtsq9O5t/aZ8sWctrDQ5oS
 OR+sm9Q/udCU2T7iDP4i9X8UbbhvhMLwktc8/uTRJAnHmtvRuD2ZfR35b9UsC1tjiZZ1
 o7n3xZlcZ1mtr6NXR60Zj0ksE+/aNw3+p+4S/8/uHZ2LWcYHSk/CCsry+swVw43mLUN/
 jZ+6pmNUNVyv7Mk2WHCezOq22x2JIzFRcRHae/d5RWVYUVuMrP9xi2Nja3z/kzjZJYHO
 OCriypIyoB5Ed3bZZR+EFpjslAm5dE4mLhpX3L+DeUkOmmlSrzrsOPX1F2C4NaEYowQv
 T/ZQ==
X-Gm-Message-State: AFqh2koCSSmGLKMGmHl4i90Klo7Mg/yre7tPdgMoshnN2ZHni3hEigCt
 5abyJXiS5CqQNX28H2UMeWOLmkzmyHYqrIyw9QKyth7zxo9PnafD+Ejofmz3TJzKTUUmYLnxw73
 cKUOhBGgp0hUW7cU=
X-Received: by 2002:a5d:9f57:0:b0:6dd:9df2:504e with SMTP id
 u23-20020a5d9f57000000b006dd9df2504emr32705999iot.18.1673028067841; 
 Fri, 06 Jan 2023 10:01:07 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuQXS3Cca45TG41P+gWTxpeHI+weZUfOig+AOe/MQUKK1+FMJyshq7GxCe5BGrs+lMUOJkpmA==
X-Received: by 2002:a5d:9f57:0:b0:6dd:9df2:504e with SMTP id
 u23-20020a5d9f57000000b006dd9df2504emr32705984iot.18.1673028067619; 
 Fri, 06 Jan 2023 10:01:07 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-39-70-52-228-144.dsl.bell.ca.
 [70.52.228.144]) by smtp.gmail.com with ESMTPSA id
 v27-20020a056602059b00b006bb57cfcb88sm520620iox.44.2023.01.06.10.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 10:01:06 -0800 (PST)
Date: Fri, 6 Jan 2023 13:01:03 -0500
From: Peter Xu <peterx@redhat.com>
To: Ted Chen <znscnchen@gmail.com>
Cc: pbonzini@redhat.com, david@redhat.com, philmd@linaro.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] memory: dump HPA and access type of ramblocks
Message-ID: <Y7hh37KTO5BcPs7z@x1n>
References: <20221205120712.269013-1-znscnchen@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221205120712.269013-1-znscnchen@gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since I applied this twice already to my local trees, let me ping for Ted
to make sure it's not lost..

On Mon, Dec 05, 2022 at 08:07:12PM +0800, Ted Chen wrote:
> It's convenient to dump HVA and RW/RO status of a ramblock in "info ramblock"
> for debug purpose.
> 
> Before:
>             Offset               Used              Total
> 0x0000000000000000 0x0000000400000000 0x0000000400000000
> 
> After:
>             Offset               Used              Total                HVA  RO
> 0x0000000000000000 0x0000000400000000 0x0000000400000000 0x00007f12ebe00000  rw
> 
> Signed-off-by: Ted Chen <znscnchen@gmail.com>
> ---
>  softmmu/physmem.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 1b606a3002..fed4dfb72c 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -1316,15 +1316,21 @@ GString *ram_block_format(void)
>      GString *buf = g_string_new("");
>  
>      RCU_READ_LOCK_GUARD();
> -    g_string_append_printf(buf, "%24s %8s  %18s %18s %18s\n",
> -                           "Block Name", "PSize", "Offset", "Used", "Total");
> +    g_string_append_printf(buf, "%24s %8s  %18s %18s %18s %18s %3s\n",
> +                           "Block Name", "PSize", "Offset", "Used", "Total",
> +                           "HVA", "RO");
> +
>      RAMBLOCK_FOREACH(block) {
>          psize = size_to_str(block->page_size);
>          g_string_append_printf(buf, "%24s %8s  0x%016" PRIx64 " 0x%016" PRIx64
> -                               " 0x%016" PRIx64 "\n", block->idstr, psize,
> +                               " 0x%016" PRIx64 " 0x%016" PRIx64 " %3s\n",
> +                               block->idstr, psize,
>                                 (uint64_t)block->offset,
>                                 (uint64_t)block->used_length,
> -                               (uint64_t)block->max_length);
> +                               (uint64_t)block->max_length,
> +                               (uint64_t)block->host,
> +                               block->mr->readonly ? "ro" : "rw");
> +
>          g_free(psize);
>      }
>  
> -- 
> 2.34.1
> 

-- 
Peter Xu


