Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9A334BDB2
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 19:33:30 +0200 (CEST)
Received: from localhost ([::1]:52492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQZI0-0000BR-Id
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 13:33:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQZBJ-0005Ue-B5
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 13:26:35 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:35489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQZBB-0000xt-KF
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 13:26:31 -0400
Received: by mail-oi1-x22f.google.com with SMTP id x2so11006952oiv.2
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 10:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9AotppdkRu6cAk9MWDMZAScCmQiqaJvcuNaXAHHovKo=;
 b=MjHKOTVBY/10LCfs1j2YER0Z5nLXTRDf0hoW8wo+MIOC0YtD0OpH0Krv4xWzQAzwU1
 t4ExJ6xW+/qrXfhgK3j7PRCP8I2PLk18mO5avRkFj+S5/x4tS8NKrEnwgFLWqNv1EAnp
 1GBcqGeOQc25cEEILibll0tfCPf2K1t+Yunf2UZSNcE0b3R3FqCd6Mc9jcL79BfmDsRs
 6MEeTFnh9x/BG7XEGuRGR9NkqZ7gNR5vjis+EeRLnW4FUuXqfCPCfpi6ClPx3mZebos1
 AouJN4AUnmiP6Do/fD0NESnc8LcHxb0Hfc/mPjTTSlK/tE23j9G9FHPlYTeSZC18Sj3d
 snrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9AotppdkRu6cAk9MWDMZAScCmQiqaJvcuNaXAHHovKo=;
 b=FnJWfvZBEVhkCdWheKvOPfGhZ2FVtOr0MDLdGbY2uanW3Wy3eaNwgEbCNSR7Lm5i4b
 b8zhS2KcLBZ6bCVNecFVEs0VWfHO+TjE3Vyc8ERuycb5t/kMz6u0vMA7NrW1Ls/MwnaH
 0xBWGj0Ifvi24GUtLL+PAqS482DzN3bDiJDAC10wndqMRloipAydiKzgoTS1k9PuPyWZ
 g8EroY5VOSNuRhFsuhx5GBERNix+jtybW2Sq54xnp8troHvzmwE37FiGB9QRMKS52M0D
 0CuPh3vd4bM0Ts0XXTrOL6idvORNn5g61nvU4zlJjesaC5nWiyrVoN9fSA+74WOZ3BTd
 1+6Q==
X-Gm-Message-State: AOAM530OGk8z9iHsbyxvC5Dr3fPoXIxVY00Q5twuiFLZkdKfqDAI80mj
 IWdSv9CeEbFsGRc3u+FT0JpW7Q==
X-Google-Smtp-Source: ABdhPJzXutalw6rrVuc5IPNDTO1btIK2hARSk2cUYKl2p5Lvj35BUO0CGGaO9/2sImbtrbs5ebvo8Q==
X-Received: by 2002:a05:6808:140c:: with SMTP id
 w12mr16353688oiv.8.1616952384640; 
 Sun, 28 Mar 2021 10:26:24 -0700 (PDT)
Received: from [192.168.211.34] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id d26sm3291825oos.32.2021.03.28.10.26.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 10:26:24 -0700 (PDT)
Subject: Re: [RFC v12 44/65] tests: do not run qom-test on all machines for
 ARM KVM-only
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-45-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9e282db8-3d49-2102-87da-947fd7b97d64@linaro.org>
Date: Sun, 28 Mar 2021 11:26:18 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-45-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
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
> +
> +        if (strcmp(arch, "arm") == 0 || strcmp(arch, "aarch64") == 0) {
> +            add_machine_test_case("virt");
> +            goto add_machine_test_done;
> +        }
> +    }
> +#endif /* !CONFIG_TCG */
> +
>       qtest_cb_for_every_machine(add_machine_test_case, g_test_quick());
> +    goto add_machine_test_done;
>   
> + add_machine_test_done:

And again.

r~

