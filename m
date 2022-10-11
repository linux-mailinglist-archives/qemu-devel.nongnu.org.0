Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A87A5FB557
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 16:53:41 +0200 (CEST)
Received: from localhost ([::1]:51584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiGdX-00051t-Hb
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 10:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiGYA-0001Ry-FT
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 10:48:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiGRZ-0003xH-R6
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 10:41:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665499276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AzXxEtr1NPxG3KBsTphFD3c+dk0gvBPHG19K0phW0pQ=;
 b=EsSUPXPxXDBJQ253rYYV20U/9zwsFg8q7JTwu955sWeVQix1v/Yligqs4hjJ/55tZhojJl
 x3QXYHT0JENaBlWFjvJxPrkNg6gjR6BBaDCmPjl6xfRQDO/tsMs83UXDkSf4/EY4Z9ieOC
 RSx5DoWXJ7t5ctUVbF+JEhGSgDt2Qs8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-548-jp4GsNTmO92tnzf74k5RRw-1; Tue, 11 Oct 2022 10:41:15 -0400
X-MC-Unique: jp4GsNTmO92tnzf74k5RRw-1
Received: by mail-wm1-f72.google.com with SMTP id
 k21-20020a7bc415000000b003b4fac53006so3803008wmi.3
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 07:41:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AzXxEtr1NPxG3KBsTphFD3c+dk0gvBPHG19K0phW0pQ=;
 b=j9Ql1WR1cb+6SFosZPaHsJyJWytabAouivTR/wIH2f5kc1bvgQLHi36FNpo8C0tqU0
 Zvr5L+rAWpizDdRej+pJA/UVwc+K0+Yy0Oy6DT2PBlJVzqv1NG4N11oq3urn9GyoyKTU
 UYDtnn4ZUXhm/GRDndO7ea8Pik6fVD99TzR5lkJilNFlL7zQ+IkaLI6yPXKDadLc/W1R
 Qt3IwaLf7L6zaCl5+E7GMDeCISj6Vrb/K9EgOb39LZde+sH0wNF8R6PKPEspjt2rykji
 82+3vHbHYlskn360PTCQeyblUi1fG3/qvDAmEXmlqSwoB409MMNuSBdTlXO8SdJLXNUd
 vfNg==
X-Gm-Message-State: ACrzQf3k7waOgthxoibz8EW2A1FYp4mwpXBjpMka07Xs5Ox5DmowusCy
 mCGZe1G3V4k+vl6wu/zKq/z1364TfFuon6U/ZhrvzzA/VRar/3/jc/KNpwDMkE6jx3SF9G9phyS
 jeH+MYA7dezCUClA=
X-Received: by 2002:a5d:4e4f:0:b0:22e:3e3a:a65d with SMTP id
 r15-20020a5d4e4f000000b0022e3e3aa65dmr15739843wrt.115.1665499274516; 
 Tue, 11 Oct 2022 07:41:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7On2nfamtxQXe8qrmgieHRDE02GzC+jv3HLaAAIVQ1WLlbP61GOuCFhLiaCm/N61nasHEXIQ==
X-Received: by 2002:a5d:4e4f:0:b0:22e:3e3a:a65d with SMTP id
 r15-20020a5d4e4f000000b0022e3e3aa65dmr15739824wrt.115.1665499274309; 
 Tue, 11 Oct 2022 07:41:14 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-11.web.vodafone.de.
 [109.43.176.11]) by smtp.gmail.com with ESMTPSA id
 z5-20020a056000110500b0022b11a27e39sm11338325wrw.1.2022.10.11.07.41.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 07:41:13 -0700 (PDT)
Message-ID: <e80726cc-633d-435c-7a2a-5cae43624282@redhat.com>
Date: Tue, 11 Oct 2022 16:41:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
 <20221006151927.2079583-18-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v5 17/18] .gitlab-ci.d/windows.yml: Increase the timeout
 to 90 minutes
In-Reply-To: <20221006151927.2079583-18-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.934, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/10/2022 17.19, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> commit 9f8e6cad65a6 ("gitlab-ci: Speed up the msys2-64bit job by using --without-default-devices"
> changed to compile QEMU with the --without-default-devices switch for
> the msys2-64bit job, due to the build could not complete within the
> project timeout (1h), and also mentioned that a bigger timeout was
> getting ignored on the shared Gitlab-CI Windows runners.
> 
> However as of today it seems the shared Gitlab-CI Windows runners does
> honor the job timeout, and the runner has the timeout limit of 2h, so
> let's increase the timeout to 90 minutes and drop the configure switch
> "--without-default-devices" to get a larger build coverage.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
> (no changes since v2)
> 
> Changes in v2:
> - Change the timeout limit to 90 minutes
> 
>   .gitlab-ci.d/windows.yml | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
> index a3e7a37022..093276ddbc 100644
> --- a/.gitlab-ci.d/windows.yml
> +++ b/.gitlab-ci.d/windows.yml
> @@ -10,7 +10,7 @@
>         - ${CI_PROJECT_DIR}/msys64/var/cache
>     needs: []
>     stage: build
> -  timeout: 70m
> +  timeout: 90m
>     before_script:
>     - If ( !(Test-Path -Path msys64\var\cache ) ) {
>         mkdir msys64\var\cache
> @@ -60,7 +60,7 @@ msys2-64bit:
>     - $env:MSYSTEM = 'MINGW64'     # Start a 64 bit Mingw environment
>     - $env:MSYS = 'winsymlinks:native' # Enable native Windows symlink
>     - .\msys64\usr\bin\bash -lc './configure --target-list=x86_64-softmmu
> -      --enable-capstone --without-default-devices'
> +      --enable-capstone'
>     - .\msys64\usr\bin\bash -lc 'make'
>     - .\msys64\usr\bin\bash -lc 'make check || { cat build/meson-logs/testlog.txt; exit 1; } ;'
>   

I just gave your patch set a try in the gitlab-CI, and for me it even did 
not finish within 90 minutes:

  https://gitlab.com/thuth/qemu/-/jobs/3156107033

I think we have to do something different if we want to run the qtests in 
this CI pipeline ... e.g. disable some subsystems? Try if compiling with 
"-O1" is faster than compiling with "-O2" ? Use a different target-list ? 
(well, the latter would be a pity since we would lose compile-testing the 
HAX and WHPX support) ... Sorry, I've got no really good clue here :-/

Additionally, there was also this error in line 2792:

ERROR:../tests/unit/test-aio.c:501:test_timer_schedule: assertion failed: 
(aio_poll(ctx, true))

Is that something new?

  Thomas


