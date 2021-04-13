Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D5B35E7D1
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 22:52:04 +0200 (CEST)
Received: from localhost ([::1]:37026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWQ0w-0005Pe-Ih
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 16:52:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWPyu-0004Z9-0i
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 16:49:57 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:38740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWPys-0002ad-Db
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 16:49:55 -0400
Received: by mail-wr1-x436.google.com with SMTP id w4so14003517wrt.5
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 13:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OfO3e+U5yGfYY2F5Io2EzNxlliLVTCzoyfvRTt6i9Ko=;
 b=Ud4c57Y/4PDZ0YghqvWmg25+vJvFuSmvj+yVG+CmNIHqDJlmbssZB+oP/ClrUEJm4y
 EuzYtv4yThLrwm2Ow3pblsjKWky+mc6GnAkkcTB47NBLSA32zGcwTwMSk9YzejF0rRXR
 Z4kdnmPnYW+zwzq4FGk7Rtg0FicAQ36++bVZciRV5EU5OF2vvybhCCeuRNKz7m9cvupb
 HovfyI4qkqXxE9y7Ubq1Bh+XlESdT+3+iqYS8HhKBY0Pyx8RVOVx9cazBcT77TbotKIH
 n75ngF2OFDx2XhTNB6zn50rChgNHGuQwjBAjS/7Xd79/RXYfrMfiSEkfOaT9zypNyiCi
 bANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OfO3e+U5yGfYY2F5Io2EzNxlliLVTCzoyfvRTt6i9Ko=;
 b=qJDl2PxcnjH4fI5GFEVp0bgXMop7YJ0Ucr4ZlOE/AHlHcoJVhyN/OJuYKWoVVCl62a
 tBNhIbkpCAmuMJ9IpRFz9uBflFkE0hL05MQ/syJX1cW0u1c01SU8LoxykDh2BdKJFCyi
 0V7HpizLSRYyFwfPnUlWIfOFjKeTIPR5EfLkFTkr4KT+95IrCfpQaMkF/TXeQWV9jSj8
 nXaqkua3jVN/Fkf4tuioz/D22K/ue2iz/E+evByUW1lFSFnQV7f/mlIDQWXtwZuQr0tu
 2ImyaCtOCSMfGjyJ0Kz6TV2lbPxEfk3nqTHImmfuqR9BcC+acaASF93xkQv2TEowwbTW
 Vkzw==
X-Gm-Message-State: AOAM532zIshmiOPirjAq6HrFxSZr/2I65HMnwZc+DwM+DNxcQ/RN5qAm
 3kS5M6jVz35KoShWydMFxGE=
X-Google-Smtp-Source: ABdhPJzzJE1jAkmoHq8pnaEXX0mSdSdFaMmRSdIGYtmWjYIRiikbZonMK+8a2oZcEx7grHa7nbGzXg==
X-Received: by 2002:adf:e843:: with SMTP id d3mr39295909wrn.56.1618346992948; 
 Tue, 13 Apr 2021 13:49:52 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id c8sm3308811wmb.34.2021.04.13.13.49.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 13:49:52 -0700 (PDT)
Subject: Re: [RFC v12 03/65] arm: tcg: only build under CONFIG_TCG
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-4-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b358544a-d550-97c3-917a-0aaeb85ce34b@amsat.org>
Date: Tue, 13 Apr 2021 22:49:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-4-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 8:35 PM, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/arm/tcg/meson.build | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
> index 0bd4e9d954..3b4146d079 100644
> --- a/target/arm/tcg/meson.build
> +++ b/target/arm/tcg/meson.build
> @@ -12,9 +12,9 @@ gen = [
>    decodetree.process('t16.decode', extra_args: ['-w', '16', '--static-decode=disas_t16']),
>  ]
>  
> -arm_ss.add(gen)
> +arm_ss.add(when: 'CONFIG_TCG', if_true: gen)
>  
> -arm_ss.add(files(
> +arm_ss.add(when: 'CONFIG_TCG', if_true: files(
>    'translate.c',
>    'helper.c',
>    'iwmmxt_helper.c',
> @@ -28,7 +28,7 @@ arm_ss.add(files(
>    'debug_helper.c',
>  ))
>  
> -arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
> +arm_ss.add(when: ['TARGET_AARCH64','CONFIG_TCG'], if_true: files(
>    'translate-a64.c',
>    'translate-sve.c',
>    'helper-a64.c',
> 

Isn't it clearer to use in target/arm/meson.build:

if 'CONFIG_TCG' in config_all
  subdir('tcg')
endif

?

Similarly in the next patch for target/arm/tcg/meson.build:

if have_user
  subdir('user')
endif
if have_system
  subdir('sysemu')
endif

