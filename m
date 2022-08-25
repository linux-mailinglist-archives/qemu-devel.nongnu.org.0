Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F9C5A1007
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 14:11:57 +0200 (CEST)
Received: from localhost ([::1]:48340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRBiG-0002GP-PA
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 08:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRBak-0005sa-NV
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 08:04:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRBac-00022j-Ly
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 08:04:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661429040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7ivUAdWhN5asoorI+sbNHkCxTrvY+CZaOXN5zHWZm90=;
 b=Wm2oC08ZjuUtXlmX3N2MITpOa3QvrCLJUsLo/+iv6KgGgwBVpkMX0AwpLDo7R8CQQtbIqx
 K8LRBn6njPExhHKISBlubDW1PhwMSHJLaIilz+AdiZKrbbU57avmrgaQMN8dvupLtB/XJz
 JhmnJmZX2MJz+luAsxV8S3Azyr3Ee/M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-266-Aw0K7fSEOAi3zJXuz-6Fyw-1; Thu, 25 Aug 2022 08:03:59 -0400
X-MC-Unique: Aw0K7fSEOAi3zJXuz-6Fyw-1
Received: by mail-wr1-f72.google.com with SMTP id
 m2-20020adfc582000000b0021e28acded7so3354774wrg.13
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 05:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=7ivUAdWhN5asoorI+sbNHkCxTrvY+CZaOXN5zHWZm90=;
 b=zPJPGtsPanETU7diJfv1ELUtopJ2IEHt9DKqQEjat/es0ALKb+lJQT3PVf1fCsdogB
 19pS3UEyt/d3mPR4z0s3jsD9GJmqlWeycXqbSqBpv8t+ZVh0FSYsgOTQHptnP7PIC4xE
 thib7980oaHNZnkG7bGL/BYyyJUojm8Nqd//7/eLsc9IK4cS1fPrG4LeJAj9PkHF2jjE
 Ubd5n+Xwb6OIJ1V1oj5jPHtJj4+rwJAI1EW+59c3pOhlUCBtokJ6rfTZlIbfvLdZL8vc
 y/oGGI1+RhddMDzrp02iXZ4E+ey6W27Epy9+4fTLCl9rjoyOonw3L8B3i9wyiVN7U6Dr
 M2aw==
X-Gm-Message-State: ACgBeo3L2MOwJmqYRRn3n/SpLgim1tzEe4uHlSCx3gOSabsoGnWF1vNF
 dQcCePnGuY+014DTFHTHU4GwPDwZkgjMFGUxF1GvB9FW/HYRXTQWjrVfCdrq2hfHRnX8xPefgLl
 DdF8CQ6ofTQrR4to=
X-Received: by 2002:a05:600c:214d:b0:3a5:ce18:bb71 with SMTP id
 v13-20020a05600c214d00b003a5ce18bb71mr2198506wml.1.1661429038253; 
 Thu, 25 Aug 2022 05:03:58 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4zTNmsEv3TwdadLKhV5NtgI8qlmIfbjP4WxlrGzESDhZzKoUiwdNoOb1oo6Eb4Kbzxbc4QpQ==
X-Received: by 2002:a05:600c:214d:b0:3a5:ce18:bb71 with SMTP id
 v13-20020a05600c214d00b003a5ce18bb71mr2198487wml.1.1661429038043; 
 Thu, 25 Aug 2022 05:03:58 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-177.web.vodafone.de.
 [109.43.177.177]) by smtp.gmail.com with ESMTPSA id
 q9-20020adfdfc9000000b0021d221daccfsm19488573wrn.78.2022.08.25.05.03.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 05:03:57 -0700 (PDT)
Message-ID: <77ca7370-4cb5-b393-f7fb-2a01ec644285@redhat.com>
Date: Thu, 25 Aug 2022 14:03:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 30/51] tests: Skip iotests and qtest when
 '--without-default-devices'
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-31-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220824094029.1634519-31-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 24/08/2022 11.40, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> When QEMU is configured with '--without-default-devices', we should
> not build and run iotests and qtest because devices used by these
> test cases are not built in.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   tests/qemu-iotests/meson.build | 5 +++++
>   tests/qtest/meson.build        | 5 +++++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.build
> index 323a4acb6a..38d9a874d2 100644
> --- a/tests/qemu-iotests/meson.build
> +++ b/tests/qemu-iotests/meson.build
> @@ -2,6 +2,11 @@ if not have_tools or targetos == 'windows' or get_option('gprof')
>     subdir_done()
>   endif
>   
> +# Skip iotests if configured without a default selection of devices
> +if not get_option('default_devices')
> +  subdir_done()
> +endif
> +
>   foreach cflag: config_host['QEMU_CFLAGS'].split()
>     if cflag.startswith('-fsanitize') and \
>        not cflag.contains('safe-stack') and not cflag.contains('cfi-icall')
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index c97da5a062..0291b3966c 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -4,6 +4,11 @@ if not config_host.has_key('CONFIG_POSIX')
>     subdir_done()
>   endif
>   
> +# Skip QTests if configured without a default selection of devices
> +if not get_option('default_devices')
> +  subdir_done()
> +endif
> +
>   slow_qtests = {
>     'ahci-test' : 60,
>     'bios-tables-test' : 120,

That's a very big hammer already ... I'd prefer if we could work on the 
tests instead to adapt for the availability of devices instead (we've done 
quite a lot of work in this area in the past already, but apparently still 
not enough yet ...)

  Thomas


