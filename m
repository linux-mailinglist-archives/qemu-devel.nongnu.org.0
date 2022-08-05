Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7AB58A94C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 12:15:18 +0200 (CEST)
Received: from localhost ([::1]:59648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJuMP-0006CQ-W9
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 06:15:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJu2b-0008Nk-KI
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:54:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJu2X-0003rh-SN
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:54:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659693285;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vnxzk9w4YZJ6EhBmPGrsKmX4wGI4KM4tpyev00FKOP0=;
 b=Poh/QEF6mW6nADRmvhfY+5lBoYE9gUWExa17OwvV6FYByzBT0uD2zlQ6yQqkfQ/GuZIYGh
 5ip6dQAL/F2qotFU4uuvUn+v1MUxFdz0+kbm4XJcgiBTuhksB1Bztmx2ohikLHOfPrK1wQ
 lAWaRdsL1Q1zjZmYho9MLy2Sgy+u8TI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-qd6cwV8YMWegjkGEc2RJsg-1; Fri, 05 Aug 2022 05:54:42 -0400
X-MC-Unique: qd6cwV8YMWegjkGEc2RJsg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D9375280048C;
 Fri,  5 Aug 2022 09:54:41 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 46C7F492CA2;
 Fri,  5 Aug 2022 09:54:40 +0000 (UTC)
Date: Fri, 5 Aug 2022 10:54:37 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Zhao, Zhou" <zhou.zhao@intel.com>
Cc: "Xu, Ling1" <ling1.xu@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "Jin, Jun I" <jun.i.jin@intel.com>
Subject: Re: [PATCH v2 1/2] Update AVX512 support for xbzrle_encode_buffer
 function
Message-ID: <Yuzo3bY7aYYYwdGY@redhat.com>
References: <20220805042508.1196041-1-ling1.xu@intel.com>
 <20220805042508.1196041-2-ling1.xu@intel.com>
 <YuzVr2+FN/yoxcx5@redhat.com>
 <DM6PR11MB2812BE75098C7C676472F660F59E9@DM6PR11MB2812.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM6PR11MB2812BE75098C7C676472F660F59E9@DM6PR11MB2812.namprd11.prod.outlook.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 05, 2022 at 08:37:27AM +0000, Zhao, Zhou wrote:
> Hi:
>  Its convenient for other guys if they need use other avx flag,
> they need not change the meson file again.  So we all disable
> that avx flag in that meson option file exclude for that
> "avx512_bw" that we used.

I don't think that's enough justification to be adding 200 lines
of unused code to meson.build.

If anyone in future needs to check for other avx flags, it is
trivial for them to cut+paste the avx512_bw check and make the
suitable changes.

This patch should only add the check that it actually needs to
use.

> 
> -----Original Message-----
> From: Daniel P. Berrangé <berrange@redhat.com> 
> Sent: Friday, August 5, 2022 4:33 PM
> To: Xu, Ling1 <ling1.xu@intel.com>
> Cc: qemu-devel@nongnu.org; quintela@redhat.com; dgilbert@redhat.com; Zhao, Zhou <zhou.zhao@intel.com>; Jin, Jun I <jun.i.jin@intel.com>
> Subject: Re: [PATCH v2 1/2] Update AVX512 support for xbzrle_encode_buffer function
> 
> On Fri, Aug 05, 2022 at 12:25:07PM +0800, ling xu wrote:
> > This commit adds runtime check of AVX512 on running machine, and 
> > implements AVX512 of xbzrle_encode_buffer function to accelerate xbzrle encoding speed.
> > Compared with C version of xbzrle_encode_buffer function, AVX512
> > version can achieve almost 60%-70% performance improvement on unit 
> > test provided by qemu. In addition, we provide one more unit test 
> > called "test_encode_decode_random", in which dirty data are randomly 
> > located in 4K page, and this case can achieve almost 140% performance gain.
> > 
> > Signed-off-by: ling xu <ling1.xu@intel.com>
> > Co-authored-by: Zhou Zhao <zhou.zhao@intel.com>
> > Co-authored-by: Jun Jin <jun.i.jin@intel.com>
> > ---
> >  meson.build        | 211 +++++++++++++++++++++++++++++++++++++++++++++
> >  meson_options.txt  |  28 ++++++
> >  migration/ram.c    |  41 +++++++++
> >  migration/xbzrle.c | 181 ++++++++++++++++++++++++++++++++++++++
> >  migration/xbzrle.h |   4 +
> >  5 files changed, 465 insertions(+)
> > 
> > diff --git a/meson.build b/meson.build index 294e9a8f32..9228df2442 
> > 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -2262,6 +2262,217 @@ config_host_data.set('CONFIG_AVX512F_OPT', get_option('avx512f') \
> >      int main(int argc, char *argv[]) { return bar(argv[0]); }
> >    '''), error_message: 'AVX512F not available').allowed())
> >  
> > +config_host_data.set('CONFIG_AVX512BW_OPT', get_option('avx512bw') \
> > +  .require(have_cpuid_h, error_message: 'cpuid.h not available, 
> > +cannot enable AVX512BW') \
> > +  .require(cc.links('''
> > +    #pragma GCC push_options
> > +    #pragma GCC target("avx512bw")
> > +    #include <cpuid.h>
> > +    #include <immintrin.h>
> > +    static int bar(void *a) {
> > +
> > +      __m512i x = *(__m512i *)a;
> > +      __m512i res= _mm512_abs_epi8(x);
> > +      return res[1];
> > +    }
> > +    int main(int argc, char *argv[]) { return bar(argv[0]); }  '''), 
> > + error_message: 'AVX512BW not available').allowed())
> > +
> 
> This check makes sense as the later code is looking at CONFIG_AVX512BW_OPT.
> 
> 
> > +config_host_data.set('CONFIG_AVX512CD_OPT', get_option('avx512cd') \
> > +  .require(have_cpuid_h, error_message: 'cpuid.h not available, 
> > +cannot enable AVX512CD') \
> > +  .require(cc.links('''
> > +    #pragma GCC push_options
> > +    #pragma GCC target("avx512cd")
> > +    #include <cpuid.h>
> > +    #include <immintrin.h>
> > +    static int bar(void *a) {
> > +
> > +      __m512i x = *(__m512i *)a;
> > +      __mmask16 k;
> > +      __m512i res= _mm512_maskz_lzcnt_epi32 (k, x);
> > +      return res[1];
> > +    }
> > +    int main(int argc, char *argv[]) { return bar(argv[0]); }  '''), 
> > + error_message: 'AVX512CD not available').allowed())
> > +
> > +config_host_data.set('CONFIG_AVX512DQ_OPT', get_option('avx512dq') \
> > +  .require(have_cpuid_h, error_message: 'cpuid.h not available, 
> > +cannot enable AVX512D') \
> > +  .require(cc.links('''
> > +    #pragma GCC push_options
> > +    #pragma GCC target("avx512dq")
> > +    #include <cpuid.h>
> > +    #include <immintrin.h>
> > +    static int bar(void *a) {
> > +
> > +      __mmask x = *(__mmask *)a;
> > +      __mmask8 b;
> > +      return _kxor_mask8(x,b);
> > +    }
> > +    int main(int argc, char *argv[]) { return bar(argv[0]); }  '''), 
> > + error_message: 'AVX512DQ not available').allowed())
> > +
> > +config_host_data.set('CONFIG_AVX512ER_OPT', get_option('avx512er') \
> > +  .require(have_cpuid_h, error_message: 'cpuid.h not available, 
> > +cannot enable AVX512ER') \
> > +  .require(cc.links('''
> > +    #pragma GCC push_options
> > +    #pragma GCC target("avx512er")
> > +    #include <cpuid.h>
> > +    #include <immintrin.h>
> > +    static int bar(void *a) {
> > +
> > +      __m512d x = *(__m512d *)a;
> > +      __m512d res=_mm512_rsqrt28_pd(x);
> > +      return res[1];
> > +    }
> > +    int main(int argc, char *argv[]) { return bar(argv[0]); }  '''), 
> > + error_message: 'AVX512ER not available').allowed())
> > +
> > +
> > +config_host_data.set('CONFIG_AVX512IFMA52_OPT', 
> > +get_option('avx512ifma52') \
> > +  .require(have_cpuid_h, error_message: 'cpuid.h not available, 
> > +cannot enable AVX512ER') \
> > +  .require(cc.links('''
> > +    #pragma GCC push_options
> > +    #pragma GCC target("avx512ifma")
> > +    #include <cpuid.h>
> > +    #include <immintrin.h>
> > +    static int bar(void *a) {
> > +
> > +      __m512i x = *(__m512i *)a;
> > +      __m512i b,c;
> > +      __m512i res= _mm512_madd52lo_epu64 (x, b, c);
> > +      return res[1];
> > +    }
> > +    int main(int argc, char *argv[]) { return bar(argv[0]); }  '''), 
> > + error_message: 'AVX512IFMA52 not available').allowed())
> > +
> > +
> > +config_host_data.set('CONFIG_AVX512PF_OPT', get_option('avx512pf') \
> > +  .require(have_cpuid_h, error_message: 'cpuid.h not available, 
> > +cannot enable AVX512PF') \
> > +  .require(cc.links('''
> > +    #pragma GCC push_options
> > +    #pragma GCC target("avx512pf")
> > +    #include <cpuid.h>
> > +    #include <immintrin.h>
> > +    static void bar(void *a) {
> > +      char* base_addr;
> > +      __mmask8 k;
> > +      __m512i vindex = *(__m512i *)a;
> > +      _mm512_mask_prefetch_i64scatter_pd (base_addr, k, vindex, 1, 2);
> > +    }
> > +    int main(int argc, char *argv[]) { bar(argv[0]); return 0;}
> > +  '''), error_message: 'AVX512PF not available').allowed())
> > +
> > +
> > +config_host_data.set('CONFIG_AVX512VPOPCNTDQ_OPT', 
> > +get_option('avx512vpopcntdq') \
> > +  .require(have_cpuid_h, error_message: 'cpuid.h not available, 
> > +cannot enable AVX512VPOPCNTDQ') \
> > +  .require(cc.links('''
> > +    #pragma GCC push_options
> > +    #pragma GCC target("avx512vpopcntdq")
> > +    #include <cpuid.h>
> > +    #include <immintrin.h>
> > +    static int bar(void *a) {
> > +      __m512i x = *(__m512i *)a;
> > +      __mmask8 k;
> > +      __m512i res= _mm512_maskz_popcnt_epi64(k,a);
> > +     return res[0];
> > +    }
> > +    int main(int argc, char *argv[]) { bar(argv[0]); return 0;}
> > +  '''), error_message: 'AVX512VPOPCNTDQ not available').allowed())
> > +
> > +
> > +config_host_data.set('CONFIG_AVX5124VNNIW_OPT', 
> > +get_option('avx5124vnniw') \
> > +  .require(have_cpuid_h, error_message: 'cpuid.h not available, 
> > +cannot enable AVX5124VNNIW') \
> > +  .require(cc.links('''
> > +    #pragma GCC push_options
> > +    #pragma GCC target("avx5124vnniw")
> > +    #include <cpuid.h>
> > +    #include <immintrin.h>
> > +    static int bar(void *a) {
> > +     __m512i x = *(__m512i *)a,b,c,d,e;
> > +     __m128 g;
> > +     __m512i res= _mm512_4dpwssd_epi32 (x, b, c, d, e, &g);
> > +     return res[0];
> > +    }
> > +    int main(int argc, char *argv[]) { bar(argv[0]); return 0;}
> > +  '''), error_message: 'AVX5124VNNIW not available').allowed())
> > +
> > +
> > +config_host_data.set('CONFIG_AVX512BITALG_OPT', 
> > +get_option('avx512bitalg') \
> > +  .require(have_cpuid_h, error_message: 'cpuid.h not available, 
> > +cannot enable AVX512BITALG') \
> > +  .require(cc.links('''
> > +    #pragma GCC push_options
> > +    #pragma GCC target("avx512bitalg")
> > +    #include <cpuid.h>
> > +    #include <immintrin.h>
> > +    static int bar(void *a) {
> > +    __m512i x  = *(__m512i *)a,b,c,d,e;
> > +    __m512i res= _mm512_popcnt_epi16 (x);
> > +    return res[0];
> > +    }
> > +    int main(int argc, char *argv[]) { bar(argv[0]); return 0;}
> > +  '''), error_message: 'AVX512BITALG not available').allowed())
> > +
> > +config_host_data.set('CONFIG_AVX512VBMI_OPT', 
> > +get_option('avx512vbmi') \
> > +  .require(have_cpuid_h, error_message: 'cpuid.h not available, 
> > +cannot enable AVX512VBMI') \
> > +  .require(cc.links('''
> > +    #pragma GCC push_options
> > +    #pragma GCC target("avx512vbmi")
> > +    #include <cpuid.h>
> > +    #include <immintrin.h>
> > +    static int bar(void *a) {
> > +    __m512i x  = *(__m512i *)a,b,c;
> > +    __m512i res=  _mm512_permutex2var_epi8  (x, b, c);
> > +    return res[0];
> > +    }
> > +    int main(int argc, char *argv[]) { bar(argv[0]); return 0;}
> > +  '''), error_message: 'AVX512VBMI not available').allowed())
> > +
> > +config_host_data.set('CONFIG_AVX512VBMI2_OPT', 
> > +get_option('avx512vbmi2') \
> > +  .require(have_cpuid_h, error_message: 'cpuid.h not available, 
> > +cannot enable AVX512VBMI') \
> > +  .require(cc.links('''
> > +    #pragma GCC push_options
> > +    #pragma GCC target("avx512vbmi2")
> > +    #include <cpuid.h>
> > +    #include <immintrin.h>
> > +    static int bar(void *a) {
> > +    __m512i x  = *(__m512i *)a,b,c;
> > +    __m512i res=  _mm512_shrdv_epi64  (x, b, c);
> > +    return res[0];
> > +    }
> > +    int main(int argc, char *argv[]) { bar(argv[0]); return 0;}
> > +  '''), error_message: 'AVX512VBMI2 not available').allowed())
> > +
> > +config_host_data.set('CONFIG_AVX512VNNI_OPT', 
> > +get_option('avx512vnni') \
> > +  .require(have_cpuid_h, error_message: 'cpuid.h not available, 
> > +cannot enable AVX512VNNI') \
> > +  .require(cc.links('''
> > +    #pragma GCC push_options
> > +    #pragma GCC target("avx512vnni")
> > +    #include <cpuid.h>
> > +    #include <immintrin.h>
> > +    static int bar(void *a) {
> > +    __m512i x  = *(__m512i *)a,b,c;
> > +    __mmask16 k;
> > +    __m512i res=  _mm512_maskz_dpwssds_epi32 (k,x, b, c);
> > +    return res[0];
> > +    }
> > +    int main(int argc, char *argv[]) { bar(argv[0]); return 0;}
> > +  '''), error_message: 'AVX512VNNI not available').allowed())
> > +
> > +config_host_data.set('CONFIG_AVX512FP16_OPT', 
> > +get_option('avx512fp16') \
> > +  .require(have_cpuid_h, error_message: 'cpuid.h not available, 
> > +cannot enable AVX512FP16') \
> > +  .require(cc.links('''
> > +    #pragma GCC push_options
> > +    #pragma GCC target("avx512fp16")
> > +    #include <cpuid.h>
> > +    #include <immintrin.h>
> > +    static int bar(void *a) {
> > +    __m128h x= *(__m128h *)a;
> > +    __m128 res=  _mm_castph_ps (x);
> > +    return res[0];
> > +    }
> > +    int main(int argc, char *argv[]) { bar(argv[0]); return 0;}
> > +  '''), error_message: 'AVX512fp16 not available').allowed())
> > +
> 
> 
> What are all these checks for though ?  Nothing makes use of the CONFIG_AVX512*_OPT options they're adding.  We shouldn't add them unless they're going to be used.
> 
> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


