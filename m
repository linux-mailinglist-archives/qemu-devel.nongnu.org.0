Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 177CE6BBCE1
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 20:01:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcWM8-0004Sz-0g; Wed, 15 Mar 2023 15:00:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pcWM6-0004Sj-FW
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 15:00:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pcWM3-0006NS-GV
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 15:00:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678906806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hS06+wdb6KVUxp17QyuDVnpC6128/Ye0/XS/GZJb9/g=;
 b=A1gwF1U6PRaAkInLtq45Y5UO66WdryswPziANoi6w6TFr7edylQkOI8sMe9pG1Yxhfoe/V
 0KalvMdAbdxyC2L4ng2yKGTAnap2nNrrzXTYLnU1atAzRFC8//yi1dMxt9kOnO1g858skA
 aLF4IJ6f6INxW93uLzRzyWc/DJ7z3bQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-byWQF9KiMs2AWq7NmGedTg-1; Wed, 15 Mar 2023 15:00:02 -0400
X-MC-Unique: byWQF9KiMs2AWq7NmGedTg-1
Received: by mail-wm1-f69.google.com with SMTP id
 o31-20020a05600c511f00b003ed2ed2acb5so1418179wms.0
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 12:00:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678906800;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hS06+wdb6KVUxp17QyuDVnpC6128/Ye0/XS/GZJb9/g=;
 b=AW00U01m6WgkcARrpdeJRyzWb1ZY/DG+c8DERv3IPWLLQe2+zfYLLO1WtDjaj/mRYM
 rP/8prVhE7oalpsAsgMrwTbaVI9FcefhGfpqkq6Wg1Ec6Xv7Aty+x9KvBh9F9fQttk89
 xUy/2a5Uo9f2pr7iMhP2huRKVZsaZ0sLMd/IjJMxOA3xIyU3h4FcExT2EXzF8kO6r90d
 R0Ih6gIVBs9DMAeeaSjr5fxDO+6+mlqYtzyY7rrq6KWKnLleLx2ov8ik5cuI7727LIP3
 ROkz6PWsIWirhfQsT+c2qsB5By+Cn3gC95Qb8NP07UN00FZDwl0xu2Knjl2fcqnUYYEj
 yIPw==
X-Gm-Message-State: AO0yUKUYXNpRMy4vZZ1MtBbobVzTmpjvEPtyPEYmxcu3lHwb5kbM45eg
 cVKYmx1GoizjaPBEKIQzpGWzUWkLkZT17UKc57ggxh4kUpYjxV4PYotjgnGVMGos4v8ph6IGdQL
 aEfkjbSJddAsLsC0=
X-Received: by 2002:a5d:6851:0:b0:2c5:3cd2:b8e with SMTP id
 o17-20020a5d6851000000b002c53cd20b8emr2557355wrw.1.1678906800724; 
 Wed, 15 Mar 2023 12:00:00 -0700 (PDT)
X-Google-Smtp-Source: AK7set/81H25xUdMnoVfbd/f5ULJ4jRqTbL80vy87SK5udKvVCtv+KX7zS3pO9m9YK81PoFbsVxK5A==
X-Received: by 2002:a5d:6851:0:b0:2c5:3cd2:b8e with SMTP id
 o17-20020a5d6851000000b002c53cd20b8emr2557341wrw.1.1678906800481; 
 Wed, 15 Mar 2023 12:00:00 -0700 (PDT)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a5d4f89000000b002c707b336c9sm5321671wru.36.2023.03.15.11.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 11:59:59 -0700 (PDT)
Date: Wed, 15 Mar 2023 18:59:57 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, bcain@quicinc.com,
 ling1.xu@intel.com, zhou.zhao@intel.com, jun.i.jin@intel.com
Subject: Re: [PATCH RESEND v2 2/2] migration/xbzrle: fix out-of-bounds write
 with axv512
Message-ID: <ZBIVrff9V3puUkQ9@work-vm>
References: <cover.1678733663.git.quic_mathbern@quicinc.com>
 <08a655a31d3161e76c4fceaf43e8960e751cdf87.1678733663.git.quic_mathbern@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08a655a31d3161e76c4fceaf43e8960e751cdf87.1678733663.git.quic_mathbern@quicinc.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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

* Matheus Tavares Bernardino (quic_mathbern@quicinc.com) wrote:
> xbzrle_encode_buffer_avx512() checks for overflows too scarcely in its
> outer loop, causing out-of-bounds writes:
> 
> $ ../configure --target-list=aarch64-softmmu --enable-sanitizers --enable-avx512bw
> $ make tests/unit/test-xbzrle && ./tests/unit/test-xbzrle
> 
> ==5518==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x62100000b100 at pc 0x561109a7714d bp 0x7ffed712a440 sp 0x7ffed712a430
> WRITE of size 1 at 0x62100000b100 thread T0
>     #0 0x561109a7714c in uleb128_encode_small ../util/cutils.c:831
>     #1 0x561109b67f6a in xbzrle_encode_buffer_avx512 ../migration/xbzrle.c:275
>     #2 0x5611099a7428 in test_encode_decode_overflow ../tests/unit/test-xbzrle.c:153
>     #3 0x7fb2fb65a58d  (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x7a58d)
>     #4 0x7fb2fb65a333  (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x7a333)
>     #5 0x7fb2fb65aa79 in g_test_run_suite (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x7aa79)
>     #6 0x7fb2fb65aa94 in g_test_run (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x7aa94)
>     #7 0x5611099a3a23 in main ../tests/unit/test-xbzrle.c:218
>     #8 0x7fb2fa78c082 in __libc_start_main (/lib/x86_64-linux-gnu/libc.so.6+0x24082)
>     #9 0x5611099a608d in _start (/qemu/build/tests/unit/test-xbzrle+0x28408d)
> 
> 0x62100000b100 is located 0 bytes to the right of 4096-byte region [0x62100000a100,0x62100000b100)
> allocated by thread T0 here:
>     #0 0x7fb2fb823a06 in __interceptor_calloc ../../../../src/libsanitizer/asan/asan_malloc_linux.cc:153
>     #1 0x7fb2fb637ef0 in g_malloc0 (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x57ef0)
> 
> Fix that by performing the overflow check in the inner loop, instead.
> 
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> ---
>  migration/xbzrle.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/migration/xbzrle.c b/migration/xbzrle.c
> index 21b92d4eae..c6f8b20917 100644
> --- a/migration/xbzrle.c
> +++ b/migration/xbzrle.c
> @@ -197,10 +197,6 @@ int xbzrle_encode_buffer_avx512(uint8_t *old_buf, uint8_t *new_buf, int slen,
>      __m512i r = _mm512_set1_epi32(0);
>  
>      while (count512s) {
> -        if (d + 2 > dlen) {
> -            return -1;
> -        }
> -
>          int bytes_to_check = 64;
>          uint64_t mask = 0xffffffffffffffff;
>          if (count512s == 1) {
> @@ -216,6 +212,9 @@ int xbzrle_encode_buffer_avx512(uint8_t *old_buf, uint8_t *new_buf, int slen,
>  
>          bool is_same = (comp & 0x1);
>          while (bytes_to_check) {
> +            if (d + 2 > dlen) {
> +                return -1;
> +            }

I agree that's better, so:

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>


but is it sufficient?
In that bytes_to_check loop there are 4 calls to uleb128_encode_small
with another one just off the end of the loop.
I've not figured out all the legal combos, but I'm pretty sure at least
a few can trigger in one iteration - so don't we need those checks
before ecah call?

Dave

>              if (is_same) {
>                  if (nzrun_len) {
>                      d += uleb128_encode_small(dst + d, nzrun_len);
> -- 
> 2.39.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


