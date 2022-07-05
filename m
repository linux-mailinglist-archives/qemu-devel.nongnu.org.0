Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1036B567299
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 17:28:56 +0200 (CEST)
Received: from localhost ([::1]:59738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8kTu-0001xL-Lj
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 11:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o8kSR-0000er-PB
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 11:27:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o8kSO-0005fm-20
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 11:27:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657034839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zxsnP9mdvS3x0JBnt7MvyB2R1Q3HE2nTLsbtwVI2kTs=;
 b=Wl+omU62ynwUFkO3bo2NRPH3kWoxqxIpru+8yHLkSdxbmKW6vOLf770vkNJrFXwygxYA0n
 5C06tX4GSmFB/VzjN1VTY8OLdpmNnl2Zg/3DRzO+DvifIpGBILq2XH5lZe/bEvla1P7d35
 Mx1KEjHK/5lX/AxgsyJUMsw1UxX7hpI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-sBC-40sqPnOBOmv-ohZJOQ-1; Tue, 05 Jul 2022 11:27:11 -0400
X-MC-Unique: sBC-40sqPnOBOmv-ohZJOQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 p6-20020a05600c358600b003a0483b3c2eso6922764wmq.3
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 08:27:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zxsnP9mdvS3x0JBnt7MvyB2R1Q3HE2nTLsbtwVI2kTs=;
 b=sw92GNI+YJZz2fLkieuwozANfWu3O7/yegnKFFTHDB0I1XLslS6D18W/vU9LnB6n0C
 Cd4qpk9qUmQzEZ4KEFv0sGYTuvfD/v95MlZFvDQgMXpB2lmJvory8PNqSNroS7VnayVa
 Arz53lxykNvlpnXJdPuXNDabGQKHSuGUFdf98MwS7169sebxWQmSn64Qud3hRyT9N0dR
 Hf413sv83+NqkuyK1Rlk0s1rLw5sqkaE/O4yIPrNsGtT3Vs279S3TSTK3rrAnL1dO3E7
 h2ut3ClbIPJobo6CtL776k9KN2YZUnLQRX1j99dKPv0z/zh83iVGUwtURGqDUal1Dqhd
 cePQ==
X-Gm-Message-State: AJIora8GvInR0aqKvw48fk8MzP1hqCK+Umb8wSu2d3NsnSZLNKtRABfV
 b6hfTw6IUYK2ECp4c2lzmsOkVDeVaLyI3TAlijd5LCTB6ciY0eOk5VBdEpYjf3MpBx6huf9xNe0
 9VQaOEMorZq5/eWk=
X-Received: by 2002:a5d:48cf:0:b0:210:1229:2e7 with SMTP id
 p15-20020a5d48cf000000b00210122902e7mr32631806wrs.567.1657034830284; 
 Tue, 05 Jul 2022 08:27:10 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sO1Vf3ghLzCXioJIildcKDxRcjvW6sXKHh6denyFBgqtUKSCepg2e11JRluq7SOK+acO1BUA==
X-Received: by 2002:a5d:48cf:0:b0:210:1229:2e7 with SMTP id
 p15-20020a5d48cf000000b00210122902e7mr32631782wrs.567.1657034830002; 
 Tue, 05 Jul 2022 08:27:10 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 r15-20020a0560001b8f00b0021d74906683sm1924000wru.28.2022.07.05.08.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 08:27:09 -0700 (PDT)
Date: Tue, 5 Jul 2022 16:27:07 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH] multifd: Copy pages before compressing them with zlib
Message-ID: <YsRYS7PdeMohyUDi@work-vm>
References: <20220704164112.2890137-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220704164112.2890137-1-iii@linux.ibm.com>
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

Thanks for fixing that!

> [1] https://zlib.net/manual.html
> [2] https://github.com/madler/zlib/pull/410
> [3] https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg03988.html
> [4] http://publibfp.dhe.ibm.com/epubs/pdf/a227832c.pdf
> [5] https://gitlab.com/qemu-project/qemu/-/issues/1099
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
> 
> v1: https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg06841.html
> v1 -> v2: Rebase, mention Mark Adler's reply in the commit message.
> 
>  migration/multifd-zlib.c | 35 ++++++++++++++++++++++-------------
>  1 file changed, 22 insertions(+), 13 deletions(-)
> 
> diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
> index 3a7ae44485..b6b22b7d1f 100644
> --- a/migration/multifd-zlib.c
> +++ b/migration/multifd-zlib.c
> @@ -27,6 +27,8 @@ struct zlib_data {
>      uint8_t *zbuff;
>      /* size of compressed buffer */
>      uint32_t zbuff_len;
> +    /* uncompressed buffer */
> +    uint8_t buf[];
>  };
>  
>  /* Multifd zlib compression */
> @@ -43,9 +45,18 @@ struct zlib_data {
>   */
>  static int zlib_send_setup(MultiFDSendParams *p, Error **errp)
>  {
> -    struct zlib_data *z = g_new0(struct zlib_data, 1);
> -    z_stream *zs = &z->zs;
> +    /* This is the maximum size of the compressed buffer */
> +    uint32_t zbuff_len = compressBound(MULTIFD_PACKET_SIZE);
> +    size_t buf_len = qemu_target_page_size();
> +    struct zlib_data *z;
> +    z_stream *zs;
>  
> +    z = g_try_malloc0(sizeof(struct zlib_data) + buf_len + zbuff_len);

So I think this works; but wouldn't life be easier if you just used
separate malloc's for the buffers?  You've got a lot of hairy pointer
maths below that would go away if they were separate.

Dave

> +    if (!z) {
> +        error_setg(errp, "multifd %u: out of memory for zlib_data", p->id);
> +        return -1;
> +    }
> +    zs = &z->zs;
>      zs->zalloc = Z_NULL;
>      zs->zfree = Z_NULL;
>      zs->opaque = Z_NULL;
> @@ -54,15 +65,8 @@ static int zlib_send_setup(MultiFDSendParams *p, Error **errp)
>          error_setg(errp, "multifd %u: deflate init failed", p->id);
>          return -1;
>      }
> -    /* This is the maxium size of the compressed buffer */
> -    z->zbuff_len = compressBound(MULTIFD_PACKET_SIZE);
> -    z->zbuff = g_try_malloc(z->zbuff_len);
> -    if (!z->zbuff) {
> -        deflateEnd(&z->zs);
> -        g_free(z);
> -        error_setg(errp, "multifd %u: out of memory for zbuff", p->id);
> -        return -1;
> -    }
> +    z->zbuff_len = zbuff_len;
> +    z->zbuff = z->buf + buf_len;
>      p->data = z;
>      return 0;
>  }
> @@ -80,7 +84,6 @@ static void zlib_send_cleanup(MultiFDSendParams *p, Error **errp)
>      struct zlib_data *z = p->data;
>  
>      deflateEnd(&z->zs);
> -    g_free(z->zbuff);
>      z->zbuff = NULL;
>      g_free(p->data);
>      p->data = NULL;
> @@ -114,8 +117,14 @@ static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
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
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


