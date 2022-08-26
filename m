Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D9F5A3028
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 21:47:30 +0200 (CEST)
Received: from localhost ([::1]:39712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRfIe-0002Tf-QB
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 15:47:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRfGD-0000zZ-Eb
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 15:44:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRfGA-0000H5-Qw
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 15:44:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661543093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SZGKaVhdzuO3+A8o9Mu2g3nRuhW2L42MPpQQw1mhpEY=;
 b=Fi85wL3UAPhTUZ1wQE8lZg09VL9vXGX9EnjvizDAvu9c3q8OcuOsXJMauFExvIUecVgyYI
 gAR3/swe//GLBFbz8Ms1kCChnq+kkA3QsUfr5X/d3RHGJj2foYtS9+XF0GYd09OQ0y22bv
 jGLDqVWFQAk61t4KBEBL36qpi1CuW24=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-580-M9O-N6v4MeSRRzCpZdH-Gg-1; Fri, 26 Aug 2022 15:44:52 -0400
X-MC-Unique: M9O-N6v4MeSRRzCpZdH-Gg-1
Received: by mail-wr1-f71.google.com with SMTP id
 j12-20020adfff8c000000b002265dcdfad7so258859wrr.2
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 12:44:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=SZGKaVhdzuO3+A8o9Mu2g3nRuhW2L42MPpQQw1mhpEY=;
 b=4hJ1XjLDV9mCX/Z3Jowa5HGMp6rBb7oPR2apnhrFGapsHgchJ+WXimkE+ypOjqSQl5
 RC55aDx3RIChmX8w8wBeVNL6SFIs2r3S/i2ya31WxmiRdLFCqoQrGr5/q8AoHU6J6kWX
 yfmXhx7SvPDCGuC7ca7HPOBxkTnN/OGp87waArgrJ0ZTAfhofu/O2FNqP4WPdgcZlBi7
 F4OIPQ64V/PyNLN0u5v3Ap8gTwxp4UN/6pcu1rtzOV8m91dQ8Ty1gt+Ig25I7fKI2Vzc
 QkABEirEH/AjIQ2p4oHEBjMMwo9J5EOIIydzBkQiGJ4QYvCt8L8jCxY80bM+Qh63YuVr
 0Efg==
X-Gm-Message-State: ACgBeo1hCvnTWLnnA5vVAZN7PToda6c4zBrvFO7LhzhOQUgiT5yTgKiG
 DctfuRTLkGvWcZGVcYjqoYNmPFm44vXh+3fxrJzB/F3YY55mgcrTpxZjciDhh1DqKKwCaev37kr
 PyaE1ZDq1omI7dec=
X-Received: by 2002:a1c:3842:0:b0:3a6:632b:6165 with SMTP id
 f63-20020a1c3842000000b003a6632b6165mr634701wma.100.1661543091226; 
 Fri, 26 Aug 2022 12:44:51 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7V7o2VYji1g4gO3BGdOFVRs85mxk1rXPmE+3Ppw5lUZRsko0ife18oVyQJ50xoC27nivVZPA==
X-Received: by 2002:a1c:3842:0:b0:3a6:632b:6165 with SMTP id
 f63-20020a1c3842000000b003a6632b6165mr634688wma.100.1661543090985; 
 Fri, 26 Aug 2022 12:44:50 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-60.customers.d1-online.com.
 [80.187.98.60]) by smtp.gmail.com with ESMTPSA id
 l8-20020a5d4108000000b0021eed2414c9sm523002wrp.40.2022.08.26.12.44.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 12:44:50 -0700 (PDT)
Message-ID: <47466a1a-9163-0192-eb27-d37bde434828@redhat.com>
Date: Fri, 26 Aug 2022 21:44:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 02/25] tests/avocado: reduce the default timeout to 120s
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
 <20220826172128.353798-3-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220826172128.353798-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/08/2022 19.21, Alex Bennée wrote:
> We should be aiming to keep our tests under 2 minutes so lets reduce
> the default timeout to that. Tests that we know take longer should
> explicitly set a longer timeout.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/avocado/avocado_qemu/__init__.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
> index 9d17a287cf..0efd2bd212 100644
> --- a/tests/avocado/avocado_qemu/__init__.py
> +++ b/tests/avocado/avocado_qemu/__init__.py
> @@ -229,7 +229,7 @@ def exec_command_and_wait_for_pattern(test, command,
>   class QemuBaseTest(avocado.Test):
>   
>       # default timeout for all tests, can be overridden
> -    timeout = 900
> +    timeout = 120

Did you try this on gitlab already? I guess it will fail in
some cases, e.g.:

  https://gitlab.com/qemu-project/qemu/-/jobs/2928561388

there are some tests that run definitely longer, e.g.:

  (005/192) tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv2:  PASS (342.26 s)
  (006/192) tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv3:  PASS (330.37 s)

and I can't spot a "timeout = ..." in that file.

  Thomas


