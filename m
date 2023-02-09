Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D764691163
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 20:32:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQCdO-00073R-KH; Thu, 09 Feb 2023 14:31:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQCdG-0006zZ-2K
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 14:30:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQCdE-0007uJ-57
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 14:30:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675971053;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=+DSVQSi3gfaAgcQtvyqSpmcehwr3/bIGrp4MA3Ngy8E=;
 b=O4JgIWXjJKdaPZRbeXGcH4KSkNHBIvAw7NyBJEUsGKnvUtUGgjZ5UQQDSW7i8RLRlP3icG
 U/YN5a/gi7x5qmX+MBw0kKs6knljNWf9m9JE+uODTE16mvBbh9tURh3W+XQkNXjvJrcFxs
 Ll9Lo3em4jlzeLTr09EDWAz/1LpFl5Y=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-660-bEvYFWrYPYSllP-sN-gKFg-1; Thu, 09 Feb 2023 14:30:52 -0500
X-MC-Unique: bEvYFWrYPYSllP-sN-gKFg-1
Received: by mail-wr1-f69.google.com with SMTP id
 p7-20020a5d48c7000000b002c53d342406so681406wrs.2
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 11:30:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+DSVQSi3gfaAgcQtvyqSpmcehwr3/bIGrp4MA3Ngy8E=;
 b=dArgtbMul4mBDXjOROkaNAcoNEfnHvuWqpIBf+6Kil15BDvUwbxMm2ovi9FgJwJu6+
 SuNQv3CsbQ2iBYSTrf9fm8GS8BK1e955p/380D2/GO3OtcNEx6tTo44jGK6ibA/DCDHC
 3C1iDm3citE/v157SsViRokCIjBS1EXx88VmhwOgqQTI9wbJ2Xg0aMoDgHasufV063Sl
 VQbrK2zrUxsjPbSEszKCVtvt4W5fr4B973mm6HiMJBAenxDG+g4CP7+AQcK8gQffwxID
 LHJrTlncpGj0JkCU4LI55nsniLarKlMhyfuUU8ykf9IIp4tU5Fx5H/DL4hvB3DaiCfIq
 N6IQ==
X-Gm-Message-State: AO0yUKV779c9q+UQSsdNluNnbrHHnfGQL1K3YR5VOrw39KA4EKzFqNNG
 YJXNsQi0wLkDNwTNivVzsYIQzPJ0T/M11z6+dTKrLSsvdC8/kUppiGhEc2QHFmODp1WfUWH0F0K
 4IpqMx7QfqhwWMXk=
X-Received: by 2002:a5d:5192:0:b0:2c2:d59d:d36e with SMTP id
 k18-20020a5d5192000000b002c2d59dd36emr11529790wrv.58.1675971051251; 
 Thu, 09 Feb 2023 11:30:51 -0800 (PST)
X-Google-Smtp-Source: AK7set/F7Jnbsk6/3S19tjXB/9P6ZXknW6hxv0T5cEhfj18KAnmSo6LcJVl1eIAvrbVUACxxGepi/g==
X-Received: by 2002:a5d:5192:0:b0:2c2:d59d:d36e with SMTP id
 k18-20020a5d5192000000b002c2d59dd36emr11529778wrv.58.1675971051053; 
 Thu, 09 Feb 2023 11:30:51 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 b4-20020adfee84000000b002bfb0c5527esm1931013wro.109.2023.02.09.11.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 11:30:50 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: ling xu <ling1.xu@intel.com>
Cc: qemu-devel@nongnu.org,  dgilbert@redhat.com,  Zhou Zhao
 <zhou.zhao@intel.com>,  Jun Jin <jun.i.jin@intel.com>
Subject: Re: [PATCH v7 1/2] AVX512 support for xbzrle_encode_buffer
In-Reply-To: <20221116152923.1087185-2-ling1.xu@intel.com> (ling xu's message
 of "Wed, 16 Nov 2022 23:29:22 +0800")
References: <20221116152923.1087185-1-ling1.xu@intel.com>
 <20221116152923.1087185-2-ling1.xu@intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 09 Feb 2023 20:30:49 +0100
Message-ID: <87a61m3ac6.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

ling xu <ling1.xu@intel.com> wrote:
> This commit is the same with [PATCH v6 1/2], and provides avx512 support for xbzrle_encode_buffer
> function to accelerate xbzrle encoding speed. Runtime check of avx512
> support and benchmark for this feature are added. Compared with C
> version of xbzrle_encode_buffer function, avx512 version can achieve
> 50%-70% performance improvement on benchmarking. In addition, if dirty
> data is randomly located in 4K page, the avx512 version can achieve
> almost 140% performance gain.
>
> Signed-off-by: ling xu <ling1.xu@intel.com>
> Co-authored-by: Zhou Zhao <zhou.zhao@intel.com>
> Co-authored-by: Jun Jin <jun.i.jin@intel.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

But there were a lot of "but's":

> diff --git a/meson.build b/meson.build
> index cf3e517e56..d0d28f5c9e 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2344,6 +2344,22 @@ config_host_data.set('CONFIG_AVX512F_OPT', get_option('avx512f') \
>      int main(int argc, char *argv[]) { return bar(argv[argc - 1]); }
>    '''), error_message: 'AVX512F not available').allowed())
>  
> +config_host_data.set('CONFIG_AVX512BW_OPT', get_option('avx512bw') \
> +  .require(have_cpuid_h, error_message: 'cpuid.h not available, cannot enable AVX512BW') \
> +  .require(cc.links('''
> +    #pragma GCC push_options
> +    #pragma GCC target("avx512bw")
> +    #include <cpuid.h>
> +    #include <immintrin.h>
> +    static int bar(void *a) {
> +
> +      __m512i *x = a;
> +      __m512i res= _mm512_abs_epi8(*x);
> +      return res[1];
> +    }
> +    int main(int argc, char *argv[]) { return bar(argv[0]); }
> +  '''), error_message: 'AVX512BW not available').allowed())
> +
>  have_pvrdma = get_option('pvrdma') \
>    .require(rdma.found(), error_message: 'PVRDMA requires OpenFabrics libraries') \
>    .require(cc.compiles(gnu_source_prefix + '''

This file misses:

@@ -3783,6 +3799,7 @@ summary_info += {'debug stack usage': get_option('debug_stack_usage')}
 summary_info += {'mutex debugging':   get_option('debug_mutex')}
 summary_info += {'memory allocator':  get_option('malloc')}
 summary_info += {'avx2 optimization': config_host_data.get('CONFIG_AVX2_OPT')}
+summary_info += {'avx512bw optimization': config_host_data.get('CONFIG_AVX512BW_OPT')}
 summary_info += {'avx512f optimization': config_host_data.get('CONFIG_AVX512F_OPT')}
 summary_info += {'gprof enabled':     get_option('gprof')}
 summary_info += {'gcov':              get_option('b_coverage')}
diff --git a/meson_options.txt b/meson_options.txt
index 559a571b6b..e5f199119e 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -104,6 +104,8 @@ option('avx2', type: 'feature', value: 'auto',
        description: 'AVX2 optimizations')
 option('avx512f', type: 'feature', value: 'disabled',
        description: 'AVX512F optimizations')
+option('avx512bw', type: 'feature', value: 'auto',
+       description: 'AVX512BW optimizations')
 option('keyring', type: 'feature', value: 'auto',
        description: 'Linux keyring support')

And you are missing:

diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 0f71e92dcb..c2982ea087 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -70,6 +70,7 @@ meson_options_help() {
   printf "%s\n" '  attr            attr/xattr support'
   printf "%s\n" '  auth-pam        PAM access control'
   printf "%s\n" '  avx2            AVX2 optimizations'
+  printf "%s\n" '  avx512bw        AVX512BW optimizations'
   printf "%s\n" '  avx512f         AVX512F optimizations'
   printf "%s\n" '  blkio           libblkio block device driver'
   printf "%s\n" '  bochs           bochs image format support'
@@ -198,6 +199,8 @@ _meson_option_parse() {
     --disable-auth-pam) printf "%s" -Dauth_pam=disabled ;;
     --enable-avx2) printf "%s" -Davx2=enabled ;;
     --disable-avx2) printf "%s" -Davx2=disabled ;;
+    --enable-avx512bw) printf "%s" -Davx512bw=enabled ;;
+    --disable-avx512bw) printf "%s" -Davx512bw=disabled ;;
     --enable-avx512f) printf "%s" -Davx512f=enabled ;;
     --disable-avx512f) printf "%s" -Davx512f=disabled ;;
     --enable-gcov) printf "%s" -Db_coverage=true ;;


