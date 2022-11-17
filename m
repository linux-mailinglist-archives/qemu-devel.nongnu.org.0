Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC7C62DA1A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 13:01:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovdZg-00060L-6V; Thu, 17 Nov 2022 07:00:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ovdZW-0005wp-F2
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 07:00:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ovdZU-0005qP-FZ
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 07:00:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668686443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g+Qq4oACUvhMUnJ4LB5qXsviLuIK5ln7ncUxyFy9QAQ=;
 b=YpquIGE5V5UMclBqZWneI0SG6ow9vRYfg+Ny2xxcMo2o3mgvlN4qnyaYCdsfseD3yYIuXH
 4m84TLCgMolbEfbVqIIAmFEOwHbNVuRO6gyFMM1cFx4XLsy4lYaCzIoHutb5KrQG2WJtyG
 rNnxA77AFSJB/2+jUURTpWeHseHml1Y=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-202-NVSjVrW1Mki0DEUYJ8kqKw-1; Thu, 17 Nov 2022 07:00:42 -0500
X-MC-Unique: NVSjVrW1Mki0DEUYJ8kqKw-1
Received: by mail-wr1-f70.google.com with SMTP id
 w11-20020adfbacb000000b002418a90da01so608601wrg.16
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 04:00:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g+Qq4oACUvhMUnJ4LB5qXsviLuIK5ln7ncUxyFy9QAQ=;
 b=zrGYTybAG7vX0SXdlwLwt/vpWmkrZbCmK+MiDse9IsMV9VpJdzaO42hF5/0oOraAMd
 7Os2OYuScEF8iVrjNtHTz7xfLwgBeDMvIhJhX13oaB76vV3lPmFFJpXdra2tSUrJ826Q
 w1FCy/Elvd4naEAM5L7xYFPotkOgUXkdPNYxY1hxtvWZIP8sme5Q88WCEoNDdwWwSpAl
 Ue8fSzNBCgChEaqIj9pzsVw3/yiUEGU2crlXE2uEcr2QriiTplYM8hfmAQAkzX19rzSn
 nX6HS8Idle5KAaB+e6Dgb4pHpkNZOm8PKssa23mrYWfv7AAZToWQgqh6pumQXae9h66Z
 5OCQ==
X-Gm-Message-State: ANoB5pnIjKRzFyuY4oy114OR4AmN05OWwVoEAkJcupWobFY1YPwSAp7A
 nEd/gRsxOseD9EV3xlMMgsbKkozHde586ZxYwiKyHDe+S6Eku1a+2ZaT9fGXJRUlv1EkVKzl3M5
 MS8FcoPGvhXVa7Dk=
X-Received: by 2002:a1c:6a02:0:b0:3cf:71e4:75b with SMTP id
 f2-20020a1c6a02000000b003cf71e4075bmr1536971wmc.114.1668686441062; 
 Thu, 17 Nov 2022 04:00:41 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6+mx1RkSRQXWp0Cw2TIoL1rh23/e485xphsX/LStvLnA5fLieZPbIi9KgTKtG+hM8mNyjNJQ==
X-Received: by 2002:a1c:6a02:0:b0:3cf:71e4:75b with SMTP id
 f2-20020a1c6a02000000b003cf71e4075bmr1536952wmc.114.1668686440839; 
 Thu, 17 Nov 2022 04:00:40 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-177-4.web.vodafone.de. [109.43.177.4])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a5d6943000000b002383e977920sm759411wrw.110.2022.11.17.04.00.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 04:00:40 -0800 (PST)
Message-ID: <f7472193-f80c-49b7-f776-358cdea40b7a@redhat.com>
Date: Thu, 17 Nov 2022 13:00:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH for-7.2] tests/avocado/boot_linux.py: Bump aarch64 virt
 test timeout to 720s
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20221117111628.911686-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221117111628.911686-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 17/11/2022 12.16, Peter Maydell wrote:
> The two tests
> tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv2
> tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv3
> 
> take quite a long time to run, and the current timeout of 240s
> is not enough for the tests to complete on slow machines:
> we've seen these tests time out in the gitlab CI in the
> 'avocado-system-alpine' CI job, for instance. The timeout
> is also insufficient for running the test with a debug build
> of QEMU: on my machine the tests take over 10 minutes to run
> in that config.
> 
> Push the timeout up to 720s so that the test definitely has
> enough time to complete.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   tests/avocado/boot_linux.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
> index 571d33882ae..32adae6ff6a 100644
> --- a/tests/avocado/boot_linux.py
> +++ b/tests/avocado/boot_linux.py
> @@ -64,7 +64,7 @@ class BootLinuxAarch64(LinuxTest):
>       :avocado: tags=machine:virt
>       :avocado: tags=machine:gic-version=2
>       """
> -    timeout = 240
> +    timeout = 720

Looking at some random older builds:

  https://gitlab.com/qemu-project/qemu/-/jobs/2897087089#L175
  https://gitlab.com/qemu-project/qemu/-/jobs/2897087091#L173

... it seems like the tests took 330 - 350 seconds to finish in the past in 
the gitlab-CI, so the timeout of 720 seconds should be fine for the 
gitlab-CI. Thus:

Reviewed-by: Thomas Huth <thuth@redhat.com>



