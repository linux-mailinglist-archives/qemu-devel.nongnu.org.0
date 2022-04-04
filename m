Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 770FB4F13C0
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 13:22:12 +0200 (CEST)
Received: from localhost ([::1]:36526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbKmh-0002W3-3g
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 07:22:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nbKkz-0001Oh-OI
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 07:20:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nbKkv-00036L-6l
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 07:20:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649071219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G2o5PmzkqF2YqGmDRVRh5IgnkZzUuEwFJ4PsHtridsA=;
 b=fGK1cqSbFNqITfeCtZhEHmiSW9PD6nJSk2c3+SiT+62suLNZygUV7Y4oSpN8558KBGvRcx
 Ub+CVY/p8cJD76UIbgKlPTd37nlEhvQpGnowMQ0M/Y7a3LxekxRRpt1v6yGFPHjRbU34gm
 u2U/Tc+koDCuCX7DnwwFALoURz+LgM8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501-HaksiFRBM5icuhuZeFQC4A-1; Mon, 04 Apr 2022 07:20:19 -0400
X-MC-Unique: HaksiFRBM5icuhuZeFQC4A-1
Received: by mail-wr1-f70.google.com with SMTP id
 i64-20020adf90c6000000b00203f2b5e090so1633628wri.9
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 04:20:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=G2o5PmzkqF2YqGmDRVRh5IgnkZzUuEwFJ4PsHtridsA=;
 b=grbi0EJQpBcmXeNBprRoIgCYrBZ03AmyLcgxw+mDYy4JZcTBc7BqIm5p0aOr5PLckE
 VdLq+w8uUQsinygRC/Ij+tRdTGPNCgwIa0LcZuVeKmAD6pqOwxGnGxY7BLPXkcPZApBF
 nxxfBrO69wmrB+05EofQaZ1IHz56Jt6q8jCF0VAYHlSb6QJ9jXZTiBeZD9GreT8FyJ+R
 b9aGFQlhvo+nZGJWtttzMTEwZtnJdyGiWEx3+ndxqUCWBNq9W3+nTgmOBc16Y9uqV15O
 IzBg0pkAQ5JHgaPiYheANFYD6vKumzQ25tNvIqPboPGGjdkSHbbZReNwwoIVkyRLOs2h
 5Flg==
X-Gm-Message-State: AOAM533oc1KvBN57Lg1UaKRT5lT2hKxOjIovJ7QaLHZUUtMsxdtmn1+p
 J6H8DdcRPIkg3+stI0MZdLzgruCpV6BaUYOi9BQI9znej5steOlGyA0DM8K0PNJQ8AYbFMvhP+2
 yPq2e/Yf8hABmbj4=
X-Received: by 2002:adf:f212:0:b0:206:35e:8711 with SMTP id
 p18-20020adff212000000b00206035e8711mr7824238wro.78.1649071217753; 
 Mon, 04 Apr 2022 04:20:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9GaRc/+NgvQZU5rg6/wLitmQW0NnxXBvqtqrgIcKdFKRWfSVYo35z5fgN3vwMX81vOYLL3g==
X-Received: by 2002:adf:f212:0:b0:206:35e:8711 with SMTP id
 p18-20020adff212000000b00206035e8711mr7824205wro.78.1649071217409; 
 Mon, 04 Apr 2022 04:20:17 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 z5-20020a05600c0a0500b0037bb8df81a2sm19890124wmp.13.2022.04.04.04.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 04:20:16 -0700 (PDT)
Date: Mon, 4 Apr 2022 12:20:14 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: Re: [PATCH] multifd: Copy pages before compressing them with zlib
Message-ID: <YkrUbt8Z+N5uenDT@work-vm>
References: <20220329152123.493731-1-iii@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20220329152123.493731-1-iii@linux.ibm.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, thuth@redhat.com,
 f.ebner@proxmox.com,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, s.reiter@proxmox.com,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org, peterx@redhat.com,
 qemu-s390x@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philippe.mathieu.daude@gmail.com>,
 hreitz@redhat.com, Christian Borntraeger <borntraeger@linux.ibm.com>,
 jinpu.wang@ionos.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Ilya Leoshkevich (iii@linux.ibm.com) wrote:
> zlib_send_prepare() compresses pages of a running VM. zlib does not
> make any thread-safety guarantees with respect to changing deflate()
> input concurrently with deflate() [1].
> 
> One can observe problems due to this with the IBM zEnterprise Data
> Compression accelerator capable zlib [2]. When the hardware
> acceleration is enabled, migration/multifd/tcp/zlib test fails
> intermittently [3] due to sliding window corruption.
> 
> At the moment this problem occurs only with this accelerator, since
> its architecture explicitly discourages concurrent accesses [4]:
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
> Still, it might affect other platforms due to a future zlib update.
> Therefore, copy the page being compressed into a private buffer before
> passing it to zlib.

While this might work around the problem; your explanation doesn't quite
fit with the symptoms; or if they do, then you have a separate problem.

The live migration code relies on the fact that the source is running
and changing it's memory as the data is transmitted; however it also
relies on the fact that if this happens the 'dirty' flag is set _after_
those changes causing another round of migration and retransmission of
the (now stable) data.

We don't expect the load of the data for the first page write to be
correct, consistent etc - we just rely on the retransmission to be
correct when the page is stable.

If your compressor hardware is doing something undefined during the
first case that's fine; as long as it works fine in the stable case
where the data isn't changing.

Adding the extra copy is going to slow everyone else dowmn; and since
there's plenty of pthread lockingin those multifd I'm expecting them
to get reasonably defined ordering and thus be safe from multi threading
problems (please correct us if we've actually done something wrong in
the locking there).

IMHO your accelerator when called from a zlib call needs to behave
the same as if it was the software implementation; i.e. if we've got
pthread calls in there that are enforcing ordering then that should be
fine; your accelerator implementation needs to add a barrier of some
type or an internal copy, not penalise everyone else.

Dave



> 
> [1] https://zlib.net/manual.html
> [2] https://github.com/madler/zlib/pull/410
> [3] https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg03988.html
> [4] http://publibfp.dhe.ibm.com/epubs/pdf/a227832c.pdf
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
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
> 2.35.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


