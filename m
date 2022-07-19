Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 871175798A3
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 13:40:40 +0200 (CEST)
Received: from localhost ([::1]:50002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDlah-0000mh-LH
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 07:40:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oDlXo-0007Q4-3R
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 07:37:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oDlXl-0004rd-3y
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 07:37:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658230656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u7l4TMAIFvwMGRMPfq8+QzTblNCzz0PKd4lZnMIntDw=;
 b=Gbnp6M/OeMjMyWj+zj+ySGIGeGOE/kgTpSCQN3cDB+Qi5f3iu0Z9WfIk0XDvpU3DTNp8vM
 4BR0GqTqLl/ekY+LBosGgo2CMHoLxUEOTagAEsGC26ywrEgC5XgzczUiMVfDJhCBCDlI5g
 vwCUtK5RHV45HWRzmfjj3MQkPv0w8yA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-nSCsnbEFMW63G2wxQefqtw-1; Tue, 19 Jul 2022 07:37:35 -0400
X-MC-Unique: nSCsnbEFMW63G2wxQefqtw-1
Received: by mail-wr1-f72.google.com with SMTP id
 d13-20020adfa34d000000b0021e3c8834a3so312907wrb.10
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 04:37:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=u7l4TMAIFvwMGRMPfq8+QzTblNCzz0PKd4lZnMIntDw=;
 b=f1VZh9NJoG4K0wAMduP+8CxAOnKaha3gEXme0+Yce/pZnyKgWwd4erjapCn7AzJv7z
 S1F/epFVWPDFRd+SnKPO92oYTaBDcY5Q7KL7dA1A3KEqsGNirdL+U+TI6wsZkqYKhiup
 65l5mBHjsK0e7fO7eeBEwfCQN/PWsVPjCGI1crNtH0FS88jK9Ha5otvunxr/PC3tCHRc
 DQZHIOxRJV6KZXlueQWzTHxibbYglRr+UWzgGIHTdbXdtvXrOspdZ7s+Sr0HKLtNuQoE
 rG90qiJcHmexsdMft8ay4XPqMsIHVPpBJa9Gs3W8gYLJyC1Tr8WY2HZTPru4eeH8DB2u
 yoMw==
X-Gm-Message-State: AJIora8XxpYBWluEOMHZu+MXYHrZQDXf7NQ0B37/lNdEDc9WbM3C89+4
 FWqh6vsSgY5GKOJzzERzNxUvdzi+CLFNajsLX7GdnBHJfYlSZJzXhzKTDqtjsF2f4EGuuR+pVL8
 Oy8Tlo7bfEQ3lvFU=
X-Received: by 2002:a5d:6489:0:b0:21d:a9a1:3511 with SMTP id
 o9-20020a5d6489000000b0021da9a13511mr25564415wri.626.1658230653765; 
 Tue, 19 Jul 2022 04:37:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sE/P7pcDO/kLefmou0G9iqbqGABvCm21wQ49ihijIB8ls754CERHnG4OFyniYslDvrVjkiwg==
X-Received: by 2002:a5d:6489:0:b0:21d:a9a1:3511 with SMTP id
 o9-20020a5d6489000000b0021da9a13511mr25564401wri.626.1658230653456; 
 Tue, 19 Jul 2022 04:37:33 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 f2-20020a1c6a02000000b003a2e89d1fb5sm21040157wmc.42.2022.07.19.04.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 04:37:32 -0700 (PDT)
Date: Tue, 19 Jul 2022 12:37:30 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3] multifd: Copy pages before compressing them with zlib
Message-ID: <YtaXenPX8gPYeWna@work-vm>
References: <20220705203559.2960949-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220705203559.2960949-1-iii@linux.ibm.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Ilya Leoshkevich (iii@linux.ibm.com) wrote:
> zlib_send_prepare() compresses pages of a running VM. zlib does not
> make any thread-safety guarantees with respect to changing deflate()
> input concurrently with deflate() [1].
> 
> One can observe problems due to this with the IBM zEnterprise Data
> Compression accelerator capable zlib [2]. When the hardware
> acceleration is enabled, migration/multifd/tcp/plain/zlib test fails
> intermittently [3] due to sliding window corruption. The accelerator's
> architecture explicitly discourages concurrent accesses [4]:
> 
>     Page 26-57, "Other Conditions":
> 
>     As observed by this CPU, other CPUs, and channel
>     programs, references to the parameter block, first,
>     second, and third operands may be multiple-access
>     references, accesses to these storage locations are
>     not necessarily block-concurrent, and the sequence
>     of these accesses or references is undefined.
> 
> Mark Adler pointed out that vanilla zlib performs double fetches under
> certain circumstances as well [5], therefore we need to copy data
> before passing it to deflate().
> 
> [1] https://zlib.net/manual.html
> [2] https://github.com/madler/zlib/pull/410
> [3] https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg03988.html
> [4] http://publibfp.dhe.ibm.com/epubs/pdf/a227832c.pdf
> [5] https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg00889.html
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>

Queued, thank you!

Dave

> ---
> 
> v1: https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg06841.html
> v1 -> v2: Rebase, mention Mark Adler's reply in the commit message.
> 
> v2: https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg00627.html
> v2 -> v3: Get rid of pointer maths (David).
>           Use a more relevant link to Mark Adler's comment (Peter).
> 
>  migration/multifd-zlib.c | 38 ++++++++++++++++++++++++++++++--------
>  1 file changed, 30 insertions(+), 8 deletions(-)
> 
> diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
> index 3a7ae44485..18213a9513 100644
> --- a/migration/multifd-zlib.c
> +++ b/migration/multifd-zlib.c
> @@ -27,6 +27,8 @@ struct zlib_data {
>      uint8_t *zbuff;
>      /* size of compressed buffer */
>      uint32_t zbuff_len;
> +    /* uncompressed buffer of size qemu_target_page_size() */
> +    uint8_t *buf;
>  };
>  
>  /* Multifd zlib compression */
> @@ -45,26 +47,38 @@ static int zlib_send_setup(MultiFDSendParams *p, Error **errp)
>  {
>      struct zlib_data *z = g_new0(struct zlib_data, 1);
>      z_stream *zs = &z->zs;
> +    const char *err_msg;
>  
>      zs->zalloc = Z_NULL;
>      zs->zfree = Z_NULL;
>      zs->opaque = Z_NULL;
>      if (deflateInit(zs, migrate_multifd_zlib_level()) != Z_OK) {
> -        g_free(z);
> -        error_setg(errp, "multifd %u: deflate init failed", p->id);
> -        return -1;
> +        err_msg = "deflate init failed";
> +        goto err_free_z;
>      }
>      /* This is the maxium size of the compressed buffer */
>      z->zbuff_len = compressBound(MULTIFD_PACKET_SIZE);
>      z->zbuff = g_try_malloc(z->zbuff_len);
>      if (!z->zbuff) {
> -        deflateEnd(&z->zs);
> -        g_free(z);
> -        error_setg(errp, "multifd %u: out of memory for zbuff", p->id);
> -        return -1;
> +        err_msg = "out of memory for zbuff";
> +        goto err_deflate_end;
> +    }
> +    z->buf = g_try_malloc(qemu_target_page_size());
> +    if (!z->buf) {
> +        err_msg = "out of memory for buf";
> +        goto err_free_zbuff;
>      }
>      p->data = z;
>      return 0;
> +
> +err_free_zbuff:
> +    g_free(z->zbuff);
> +err_deflate_end:
> +    deflateEnd(&z->zs);
> +err_free_z:
> +    g_free(z);
> +    error_setg(errp, "multifd %u: %s", p->id, err_msg);
> +    return -1;
>  }
>  
>  /**
> @@ -82,6 +96,8 @@ static void zlib_send_cleanup(MultiFDSendParams *p, Error **errp)
>      deflateEnd(&z->zs);
>      g_free(z->zbuff);
>      z->zbuff = NULL;
> +    g_free(z->buf);
> +    z->buf = NULL;
>      g_free(p->data);
>      p->data = NULL;
>  }
> @@ -114,8 +130,14 @@ static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
>              flush = Z_SYNC_FLUSH;
>          }
>  
> +        /*
> +         * Since the VM might be running, the page may be changing concurrently
> +         * with compression. zlib does not guarantee that this is safe,
> +         * therefore copy the page before calling deflate().
> +         */
> +        memcpy(z->buf, p->pages->block->host + p->normal[i], page_size);
>          zs->avail_in = page_size;
> -        zs->next_in = p->pages->block->host + p->normal[i];
> +        zs->next_in = z->buf;
>  
>          zs->avail_out = available;
>          zs->next_out = z->zbuff + out_size;
> -- 
> 2.35.3
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


