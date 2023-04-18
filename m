Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A50ED6E5AF4
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 09:51:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pog5w-0005eN-5d; Tue, 18 Apr 2023 03:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pog5t-0005eE-RW
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 03:49:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pog5r-0007nB-Rk
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 03:49:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681804177;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=N5tuD7Wrl9gS2DaDRQFHLfbB7UBp9oJl1mQeg/v6gHo=;
 b=hEqQ5fv0Rg0E3QiDGVbAxdsPFampGq0VGtFVcogmrrY0uC58hWjO27GlVuUlO6IpNI4Lkf
 T1xoljzPU8ZPsOMahrZdH/nQVia+UMiZv3dq4xwfp51FAXRop53YkiFkH8nEJJmMFFHg8W
 DqosqeFZaFw3DaeVgbeMUXfqwsg7U+4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-lP9PF780OqWTjQcY5Zc7-A-1; Tue, 18 Apr 2023 03:49:36 -0400
X-MC-Unique: lP9PF780OqWTjQcY5Zc7-A-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f1745d08b5so4923955e9.1
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 00:49:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681804175; x=1684396175;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N5tuD7Wrl9gS2DaDRQFHLfbB7UBp9oJl1mQeg/v6gHo=;
 b=VH0xd46grBUaUUCyy+5W/8lpUYwUmhqf0pvCWS0JSw0KI3kUXH+fy+N+UQJFFlB7le
 4f8dVFlSYXJC5t1Tx0gsivgWsERFmW/eJg8VfIQockESSYNX9W1iBLqWinbfUtiwEJ7n
 Cor3be3j3HvZ4+cIc934ncUC4II2ZRpd2TtMTawthGhcoeD+WdkikFmRfQieVMcfg6a7
 jHIYOv1xj3tnxd0TGVwp4RRZKArHEpWvuBsqEFM10Y81bnMGRjqBmPblO2bcTDjBmzTt
 peCkc4nPX6Fi17/uavFCNZ91Ep+EhO4kx451rh71AkGuZ9pd+zkpA7sqSi1gH8++L0yu
 Xb8A==
X-Gm-Message-State: AAQBX9eUgRESyWzVhTzqAD2djTlEpCoJtFI22HbVyMBGgFCijtwex/74
 w2L6kVhyN3RHkoMzX2DTic9bxcGPo5plsiaUqeJeriuH1UUtSOEf+a19rR3zNOSa2/2KOrSZJJG
 eVa9ICWkIkZVOPKs=
X-Received: by 2002:adf:cc8e:0:b0:2f9:9222:4a93 with SMTP id
 p14-20020adfcc8e000000b002f992224a93mr1102721wrj.38.1681804175056; 
 Tue, 18 Apr 2023 00:49:35 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z7/6yr4/nn94t21ML11p5t7uoDarISAuOl8k8ZIrwDL5VMKwwBrSfY7u97XEwLmmfrWkueFg==
X-Received: by 2002:adf:cc8e:0:b0:2f9:9222:4a93 with SMTP id
 p14-20020adfcc8e000000b002f992224a93mr1102703wrj.38.1681804174693; 
 Tue, 18 Apr 2023 00:49:34 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 b11-20020a5d4d8b000000b002c7066a6f77sm12348237wru.31.2023.04.18.00.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 00:49:33 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "you.chen" <you.chen@intel.com>
Cc: qemu-devel@nongnu.org,  "dennis . wu" <dennis.wu@intel.com>,  "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>,  Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 2/2] migration: add support for qatzip compression
 when doing live migration
In-Reply-To: <20230417083935.415782-3-you.chen@intel.com> (you chen's message
 of "Mon, 17 Apr 2023 16:39:35 +0800")
References: <20230417083935.415782-1-you.chen@intel.com>
 <20230417083935.415782-3-you.chen@intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 18 Apr 2023 09:49:32 +0200
Message-ID: <87a5z53a0j.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

"you.chen" <you.chen@intel.com> wrote:
> Add config and logics to use qatzip for page compression, in order to
> support qatzip compression better, we collect multipe pages together
> to do qatzip compression for best performance.
> And we use compile option CONFIG_QATZIP to determine whether should qatzip related code be compiled or not.
>
> Co-developed-by: dennis.wu <dennis.wu@intel.com>
> Signed-off-by: you.chen <you.chen@intel.com>

two questions:
a - why are you using this?  I guess that because it is faster, but you
    are not telling.
b - why are you using it with compression thread instead of multifd
    compression?  probably just another method.


[...]

>      MigrationState *s;
> @@ -4451,6 +4470,8 @@ static Property migration_properties[] = {
>      DEFINE_PROP_UINT8("x-compress-threads", MigrationState,
>                        parameters.compress_threads,
>                        DEFAULT_MIGRATE_COMPRESS_THREAD_COUNT),
> +    DEFINE_PROP_BOOL("x-compress-with-qat", MigrationState,
> +                      parameters.compress_with_qat, false),
>      DEFINE_PROP_BOOL("x-compress-wait-thread", MigrationState,
>                        parameters.compress_wait_thread, true),
>      DEFINE_PROP_UINT8("x-decompress-threads", MigrationState,
> @@ -4580,6 +4601,7 @@ static void migration_instance_init(Object *obj)
>      params->has_compress_level = true;
>      params->has_compress_threads = true;
>      params->has_compress_wait_thread = true;
> +    params->has_compress_with_qat = true;
>      params->has_decompress_threads = true;
>      params->has_throttle_trigger_threshold = true;
>      params->has_cpu_throttle_initial = true;

If you use it as a parameter, this bits are ok, but I still think that
it will work better with a multifd compression method.

> -#define IO_BUF_SIZE 32768
> +#ifdef CONFIG_QATZIP
> +#define IO_BUF_SIZE (512 * KiB)
> +#else
> +#define IO_BUF_SIZE (32 * KiB)
> +#endif

1st part that it is already weird O:-)
I mean, we are supposed to not have bigger buffers.

> +uint8_t *qemu_get_pos(QEMUFile *f)
> +{
> +    return f->buf + f->buf_index;
> +}
> +

I know I shouldn't ask, but why do you need this.
/me looks later in the patch.

> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -117,6 +117,20 @@ static void __attribute__((constructor)) init_cpu_flag(void)
>  
>  XBZRLECacheStats xbzrle_counters;
>  
> +/* define the max page number to compress together */
> +#define MULTI_PAGE_NUM 64

You get 64 pages to compress with just using multifd, nothing else needed.

> +#define COMP_BUF_SIZE (TARGET_PAGE_SIZE *  MULTI_PAGE_NUM * 2)
> +#define DECOMP_BUF_SIZE (TARGET_PAGE_SIZE *  MULTI_PAGE_NUM)
> +
> +typedef struct MultiPageAddr {
> +    /* real pages that will compress together */
> +    uint64_t pages;
> +    /* the last index of the addr*/
> +    uint64_t last_idx;
> +    /* each address might contain contineous pages*/
> +    uint64_t addr[MULTI_PAGE_NUM];
> +} MultiPageAddr;
> +
>  /* used by the search for pages to send */
>  struct PageSearchStatus {
>      /* The migration channel used for a specific host page */
> @@ -127,6 +141,12 @@ struct PageSearchStatus {
>      RAMBlock    *block;
>      /* Current page to search from */
>      unsigned long page;
> +    /*
> +     * multi page search from current page
> +     * for compress together with qatzip
> +     * stream APIs
> +     */
> +    MultiPageAddr mpa;
>      /* Set once we wrap around */
>      bool         complete_round;
>      /* Whether we're sending a host page */
> @@ -506,6 +526,15 @@ struct CompressParam {
>      /* internally used fields */
>      z_stream stream;
>      uint8_t *originbuf;
> +
> +#ifdef CONFIG_QATZIP
> +    /*multi page address for compression*/
> +    MultiPageAddr mpa;
> +    QzSession_T qzsess;
> +    uint8_t *decompbuf;
> +    uint8_t *compbuf;
> +    /* QzStream_T qzstream; */
> +#endif
>  };
>  typedef struct CompressParam CompressParam;
>  
> @@ -518,6 +547,15 @@ struct DecompressParam {
>      uint8_t *compbuf;
>      int len;
>      z_stream stream;
> +    RAMBlock *block;
> +
> +#ifdef CONFIG_QATZIP

Aside.  I would expect to detect at configure time if QATZIP is available.

> +    /* decompress multi pages with qzlib*/
> +    QzSession_T qzsess;
> +    /* QzStream_T qzstream; */
> +    uint8_t *decompbuf; /* buffer after decompress */

The comment is wrong. You uses this variable on do_compress_ram_page,
that has nothing to do with decompression.

> +    MultiPageAddr mpa;   /* destination */
> +#endif
>  };

I am not going looking after this.  We already have a mechanism to look
for several pages.

See multifd_queue_page().

We have to options here:
- multifd_queue_page() is better, you need to generalize it and wrote
  this on top of that.
- yours is better.  Then you need to write multifd one on top of that.

What I don't want is two different mechanisms to collect the next 64
dirty pages. I will even consider good that you _always_ search for
multiple pages, let say 64 that are the ones that we have now in both
multifd and your approach and you do a for loop in case that it is
normal precopy.

Another note, I am not a big far of:

#ifdef CONFIG_QATZIP
            if (migrate_compress_with_qat()) {
                do_compress_ram_page_multiple(param->file, &param->qzsess,
                    param->decompbuf, param->compbuf, block, &param->mpa);
            } else {
#endif
                zero_page = do_compress_ram_page(param->file,
                    &param->stream, block, offset, param->originbuf);
                param->zero_page = zero_page;
#ifdef CONFIG_QATZIP
            }
#endif

Two ifdefs and an if mixed, ouch.

Suggestions:
- Just create a function that calls one or another.
- You add another function call to migration_ops, and you add the proper
  function there during initialization.

Another nitbit:
- You are dropping the zero page optimization, you are just compressing
  it.
- See how it is done on my zero pages on multifd on the list.
  a - we only sent the page address for a zero page (hard to win sending
      zero bytes for a page)
  b - I don't know how QzSession_T works, but I guess that it is going
      to be a loosy equivalent of how zlib works.  Notice that
      compression code does:

do_compress_ram_page() -> qemu_put_compression_data() -> ...

static int qemu_compress_data(z_stream *stream, uint8_t *dest, size_t dest_len,
                              const uint8_t *source, size_t source_len)
{
    int err;

    err = deflateReset(stream);
    if (err != Z_OK) {
        return -1;
    }

    stream->avail_in = source_len;
    stream->next_in = (uint8_t *)source;
    stream->avail_out = dest_len;
    stream->next_out = dest;

    err = deflate(stream, Z_FINISH);
    if (err != Z_STREAM_END) {
        return -1;
    }

    return stream->next_out - dest;
}

I can't see the equivalent of deflateReset on your code (remember that I
don't understand qat).  Rememeber that the number of threads for
compression and decompression can be different, so it is not necessary
that you have the same dicctionaries on destination on the thread that
you are using.  That is one of the reasons why multifd-zlib is much,
much better at compression that compression threads.
a- it uses 64pages at a time
b- as recv thread is paired with the same send thread, we don't need to
   reset the dictionaries, and that makes things much, much better.
   I thought it was a bug the 1st time that I saw that it compressed 64
   pages to less than 64bytes O:-)

Later, Juan.


