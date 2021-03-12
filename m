Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E25D3388C4
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:35:28 +0100 (CET)
Received: from localhost ([::1]:36070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKeCd-0000dT-IJ
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:35:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKe5x-00022D-TN
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:28:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKe5w-0007c3-1z
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:28:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615541311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qYJUa3tg4qauQOU3VewczwWGCbpwnp/h/dvTJwtsOe8=;
 b=W0wS+sTg16lFQgV/rrp5lK2zCM4ql/uMWCUolRksiB3HrvHT0v9yNvX7kC0IZRGznM7vpZ
 seTDmdF0k42dE+Owi+v9ZORy4/2wrdEf8hiZ5Vu8Wb9mGb2TYoEjUErw4pzGgZPbNIvF5B
 9CcPFx2++NQJOpdUJ87VoiS+9frQrM8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-Vw69qTxDM-m6reOk3eBSTQ-1; Fri, 12 Mar 2021 04:28:29 -0500
X-MC-Unique: Vw69qTxDM-m6reOk3eBSTQ-1
Received: by mail-wm1-f70.google.com with SMTP id v5so5104084wml.9
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 01:28:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qYJUa3tg4qauQOU3VewczwWGCbpwnp/h/dvTJwtsOe8=;
 b=ob2KodBfJejVIsyMhJ/CxLqvaWqeIY0TpMB/pPS3bORKoLq2znjI1qx+dr1f8MCu2+
 OVYEWCOwZg42UqfBe3f9C7Q3BGatZ88B/wy2Ct3oikLRjIdq+ONanRA11ze8cYSdRO1K
 MPz1zRui5hBDRWs80OQXR1JUw2xLGAhCFG/u8LeSiAgHPM4f9eHo5SQ0kIAlJfvOWd/c
 SHy7l2bdAlHiimMufp9J0eMJ/jvQzKBBHiedYw66RMyIJke9WXvDMZ5Zy9slpWRB8Orj
 MID+SvN0lNPsDG2U8Pk5tHUFkSJlnPUWp6x+TCJ1FKnrsYJTTLnoDSsBM1rNElgQg2vC
 VbMA==
X-Gm-Message-State: AOAM533Q1hbjg/ApB/lHFyg/z8jrGAQi26Xw5zBfWnkxk7UNDvgNsRJn
 lD9rMt9FTDuTuu39mTiN5e1p/1G81nc6wo/4YvqK60arbVNdCieYTa/vufKYtGVqNPqUwL5TNbj
 GA9aupYqbFLLjA9g=
X-Received: by 2002:adf:fb91:: with SMTP id a17mr12846122wrr.93.1615541308757; 
 Fri, 12 Mar 2021 01:28:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpOx23XvlnS/C3S8+NISt/tBX4zAqwYp+/qmpEkAWYV3C/0OXBbilLOkQUysk1+7e9AWHs2g==
X-Received: by 2002:adf:fb91:: with SMTP id a17mr12846103wrr.93.1615541308584; 
 Fri, 12 Mar 2021 01:28:28 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id h25sm1798626wml.32.2021.03.12.01.28.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 01:28:28 -0800 (PST)
Subject: Re: [PATCH] tests: Move benchmarks into a separate folder
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210312092238.79509-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8f8e205a-1ce3-0d2e-7c4b-ff32766e1544@redhat.com>
Date: Fri, 12 Mar 2021 10:28:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210312092238.79509-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Longpeng <longpeng2@huawei.com>, "Emilio G . Cota" <cota@braap.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/03/21 10:22, Thomas Huth wrote:
> Make it clear that these files are related to benchmarks by moving
> them into a new folder called "bench".
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   Based-on: 20210310063314.1049838-1-thuth@redhat.com
> 
>   tests/{ => bench}/atomic64-bench.c          |  0
>   tests/{ => bench}/atomic_add-bench.c        |  0
>   tests/{ => bench}/benchmark-crypto-cipher.c |  0
>   tests/{ => bench}/benchmark-crypto-hash.c   |  0
>   tests/{ => bench}/benchmark-crypto-hmac.c   |  0
>   tests/bench/meson.build                     | 34 +++++++++++++++++++++
>   tests/{ => bench}/qht-bench.c               |  0
>   tests/meson.build                           | 34 +--------------------
>   8 files changed, 35 insertions(+), 33 deletions(-)
>   rename tests/{ => bench}/atomic64-bench.c (100%)
>   rename tests/{ => bench}/atomic_add-bench.c (100%)
>   rename tests/{ => bench}/benchmark-crypto-cipher.c (100%)
>   rename tests/{ => bench}/benchmark-crypto-hash.c (100%)
>   rename tests/{ => bench}/benchmark-crypto-hmac.c (100%)
>   create mode 100644 tests/bench/meson.build
>   rename tests/{ => bench}/qht-bench.c (100%)
> 
> diff --git a/tests/atomic64-bench.c b/tests/bench/atomic64-bench.c
> similarity index 100%
> rename from tests/atomic64-bench.c
> rename to tests/bench/atomic64-bench.c
> diff --git a/tests/atomic_add-bench.c b/tests/bench/atomic_add-bench.c
> similarity index 100%
> rename from tests/atomic_add-bench.c
> rename to tests/bench/atomic_add-bench.c
> diff --git a/tests/benchmark-crypto-cipher.c b/tests/bench/benchmark-crypto-cipher.c
> similarity index 100%
> rename from tests/benchmark-crypto-cipher.c
> rename to tests/bench/benchmark-crypto-cipher.c
> diff --git a/tests/benchmark-crypto-hash.c b/tests/bench/benchmark-crypto-hash.c
> similarity index 100%
> rename from tests/benchmark-crypto-hash.c
> rename to tests/bench/benchmark-crypto-hash.c
> diff --git a/tests/benchmark-crypto-hmac.c b/tests/bench/benchmark-crypto-hmac.c
> similarity index 100%
> rename from tests/benchmark-crypto-hmac.c
> rename to tests/bench/benchmark-crypto-hmac.c
> diff --git a/tests/bench/meson.build b/tests/bench/meson.build
> new file mode 100644
> index 0000000000..00b3c209dc
> --- /dev/null
> +++ b/tests/bench/meson.build
> @@ -0,0 +1,34 @@
> +
> +qht_bench = executable('qht-bench',
> +                       sources: 'qht-bench.c',
> +                       dependencies: [qemuutil])
> +
> +executable('atomic_add-bench',
> +           sources: files('atomic_add-bench.c'),
> +           dependencies: [qemuutil],
> +           build_by_default: false)
> +
> +executable('atomic64-bench',
> +           sources: files('atomic64-bench.c'),
> +           dependencies: [qemuutil],
> +           build_by_default: false)
> +
> +benchs = {}
> +
> +if have_block
> +  benchs += {
> +     'benchmark-crypto-hash': [crypto],
> +     'benchmark-crypto-hmac': [crypto],
> +     'benchmark-crypto-cipher': [crypto],
> +  }
> +endif
> +
> +foreach bench_name, deps: benchs
> +  exe = executable(bench_name, bench_name + '.c',
> +                   dependencies: [qemuutil] + deps)
> +  benchmark(bench_name, exe,
> +            args: ['--tap', '-k'],
> +            protocol: 'tap',
> +            timeout: 0,
> +            suite: ['speed'])
> +endforeach
> diff --git a/tests/qht-bench.c b/tests/bench/qht-bench.c
> similarity index 100%
> rename from tests/qht-bench.c
> rename to tests/bench/qht-bench.c
> diff --git a/tests/meson.build b/tests/meson.build
> index af43fd1eaf..55a7b08275 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -1,18 +1,6 @@
>   py3 = import('python').find_installation()
>   
> -qht_bench = executable('qht-bench',
> -                       sources: 'qht-bench.c',
> -                       dependencies: [qemuutil])
> -
> -executable('atomic_add-bench',
> -           sources: files('atomic_add-bench.c'),
> -           dependencies: [qemuutil],
> -           build_by_default: false)
> -
> -executable('atomic64-bench',
> -           sources: files('atomic64-bench.c'),
> -           dependencies: [qemuutil],
> -           build_by_default: false)
> +subdir('bench')
>   
>   test_qapi_outputs = [
>     'qapi-builtin-types.c',
> @@ -73,26 +61,6 @@ test_deps = {
>     'test-qht-par': qht_bench,
>   }
>   
> -benchs = {}
> -
> -if have_block
> -  benchs += {
> -     'benchmark-crypto-hash': [crypto],
> -     'benchmark-crypto-hmac': [crypto],
> -     'benchmark-crypto-cipher': [crypto],
> -  }
> -endif
> -
> -foreach bench_name, deps: benchs
> -  exe = executable(bench_name, bench_name + '.c',
> -                   dependencies: [qemuutil] + deps)
> -  benchmark(bench_name, exe,
> -            args: ['--tap', '-k'],
> -            protocol: 'tap',
> -            timeout: 0,
> -            suite: ['speed'])
> -endforeach
> -
>   if have_tools and 'CONFIG_VHOST_USER' in config_host and 'CONFIG_LINUX' in config_host
>     executable('vhost-user-bridge',
>                sources: files('vhost-user-bridge.c'),
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>


