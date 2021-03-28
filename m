Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC2C34BDA1
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 19:30:25 +0200 (CEST)
Received: from localhost ([::1]:48096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQZF2-0006Xf-8q
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 13:30:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQZAt-0005NI-MS
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 13:26:09 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:35668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQZAk-0000iZ-2r
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 13:26:07 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 v24-20020a9d69d80000b02901b9aec33371so10101229oto.2
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 10:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xYstbb+yrJeU/wsdrtNxP7c9pLkaAaaruGtN0ihyzPc=;
 b=zcA/ATmHciOCNqY4hXQIlB6s/AeA2n7hKk//htSQntHtgSxn9eQ1dV3j8xNzWk0YmD
 HbFDiqGeCQ0OyVFgqSgsDdb42mVc4LWOpHLdm3IyT2orItihwCIAlYQ6czmvbbt3Jv2c
 a/PYeeE1yfmoJNgn6MNFyIrGTynRtRtE9weuOG3mk8G4hQUBJW+IsRyFOdBQZx10nRkb
 QJmU/QMgoh4jjbJQ5Q1g3/4Lbbqo1oA8njr6uNsb9Kuwz0Rc14oMjQe5LLLZSbQc2OIZ
 5Kl1RFXhA1ZLbExItJfeQp8Nu4VfMB6eJADybQC8UYbleUs9J5N9Eyccsi9YBhD90OYN
 GHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xYstbb+yrJeU/wsdrtNxP7c9pLkaAaaruGtN0ihyzPc=;
 b=P5a00RF6GZDzDmCPlkHGCMkxRPdJPIHVSrTNJ5uJG/cGdo5ie0jlLO6k/UA2Xd3lEU
 GVbrB27c/1+sW8D+Z3us8aArlUQuIj5OhAFZavTnvcaLeFW6zUAKjC84TN/vSVcczdLt
 /LGGr8mTFHrBLcfwB3onyIoHoBx5G6HeOXQCX9EUiE06NJCySNiOFhvO6QNscsdcl56Q
 nm03uLmEM9203D/GE/t+BP7/CAEYGaNgeqx+03iijCsS/BmVtWfqt9ZsxXazo+buuCYD
 ySEu6ifuPoLQRwYB9dVV/AXhF9e1/opCgsw1r7eumoIBXgjAhIPeKcrOHphHPQwdISAK
 rVgw==
X-Gm-Message-State: AOAM5313AqpwV/FieJLbu/RENF9oT1e05dyh4CMWQ5OHVYph/GX7DK4O
 l8io7ZsP3P2SEQ9OQyiMcMGFkA==
X-Google-Smtp-Source: ABdhPJw2rOGb5Gzk6Ic3mziAwylzZx7bJB1cgrH4fdCxZ2x8NRPUQ+tYaBNjCQx3mARk0dnqDN4N6g==
X-Received: by 2002:a9d:2f45:: with SMTP id h63mr19414494otb.372.1616952351791; 
 Sun, 28 Mar 2021 10:25:51 -0700 (PDT)
Received: from [192.168.211.34] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id y10sm3729352oto.18.2021.03.28.10.25.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 10:25:51 -0700 (PDT)
Subject: Re: [RFC v12 43/65] tests: device-introspect-test: cope with ARM
 TCG-only devices
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-44-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a40530b8-f064-f1f9-0a50-a8015e3f0fcc@linaro.org>
Date: Sun, 28 Mar 2021 11:25:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-44-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:36 PM, Claudio Fontana wrote:
> +#ifndef CONFIG_TCG
> +    {
> +        const char *arch = qtest_get_arch();
> +        if (strcmp(arch, "arm") == 0 || strcmp(arch, "aarch64") == 0) {
> +            goto add_machine_test_done;
> +        }
> +    }
> +#endif /* !CONFIG_TCG */
>       if (g_test_quick()) {
>           qtest_add_data_func("device/introspect/concrete/defaults/none",
>                               g_strdup(common_args), test_device_intro_concrete);
>       } else {
>           qtest_cb_for_every_machine(add_machine_test_case, true);
>       }
> +    goto add_machine_test_done;
>   
> + add_machine_test_done:

Likewise with the ifdef and goto ugliness.

r~

