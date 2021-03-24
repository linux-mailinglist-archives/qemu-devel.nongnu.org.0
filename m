Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 933FB34805D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 19:22:53 +0100 (CET)
Received: from localhost ([::1]:34628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP89c-0000s1-CC
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 14:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP85u-0007kY-NY
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:19:04 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:35819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP85s-0003EZ-JD
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:19:01 -0400
Received: by mail-oi1-x229.google.com with SMTP id x2so21753733oiv.2
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 11:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=thSvxrhyt6vGswnkuiZWFbZKrrw7VtC4EADskRlmhnk=;
 b=i7SkwtyIunWuxslrSdjuVnwA1D/e8/khG1JxO4XFiAkIkgaDypHCjHHpDWxHr3MGFU
 eD4Axj80BU9jGgh7Ptz8598IIxXoZ1mgY4vSXvm74ArEW2rJjct0iF0Z3pOa5WyKJB75
 5TZvmrb3wKnaGD5sHk82KbvBAOM+oIi6Cy2vnHwP3l7UVikcMaWoZUFqoTUCxC4QWVjg
 hS6DpwjQDzib7dik/Gge3SnLFPgyE1gE83C7n004QY171lXPFVacaw31TAfFZsYAKxl4
 tOPmGUe1VZdyMo/lhFIHtKTcTt5k1fb2ZlLB2k5zKVnnki9VG8dZrR4v+T2raPyCsu6k
 N7hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=thSvxrhyt6vGswnkuiZWFbZKrrw7VtC4EADskRlmhnk=;
 b=UtLeh8IvvTrx314pMnv805Xg+9sUigbGNhyHwszWXGbI+epLp3wFx7HMpKU89DGUpz
 rxBKVk4eXIcmeLYGfSJJfh27yLm5ARVDUgl2Ev1Maq2L9RDmkE7E1dQpgZQXS+ChXZDU
 cxPPnUzECnggRVneLTdmvFG1Mu/U78FdtcPM2jj2IGSs9WzX+P7wLaM1A5VHf6wxG6cS
 tmtXM2KhJUA0SJZk4VTfRR8c+GJab0u/bqrKMrCoUKXIzC8ipUrgvG7cIqzfA2XtVNBZ
 S7gMC9NYxvz80l7QtJWmLEJxpF8+4GVZtl7vFl0/n0DusmdyG5yUfBVDMcYa7U+0CB7Y
 IndQ==
X-Gm-Message-State: AOAM5321/2C5bNDz+Ny0hLTd0NEz8f2RWvYk/H3mvMf9s0H2bXjMU9qB
 wnJKV0xQlc2dB5E0tPlQfwEN6g==
X-Google-Smtp-Source: ABdhPJx2LrTn3ui5F+sb0vR4C1GN3Av+E9M6YEYSdIfvAiMNFck/Ncql2so+nodtGe0YQSu0stR5Eg==
X-Received: by 2002:aca:ab44:: with SMTP id u65mr3130010oie.122.1616609938225; 
 Wed, 24 Mar 2021 11:18:58 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id g18sm694064otl.16.2021.03.24.11.18.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 11:18:57 -0700 (PDT)
Subject: Re: [RFC v11 04/55] target/arm: tcg: add sysemu and user subdirs
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323151749.21299-5-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c10ad9ed-3ba8-e860-bba0-3799f81baa52@linaro.org>
Date: Wed, 24 Mar 2021 12:18:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323151749.21299-5-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 9:16 AM, Claudio Fontana wrote:
> +arm_softmmu_ss.add(when: ['CONFIG_TCG','CONFIG_SOFTMMU'], if_true: files(
> +))
> diff --git a/target/arm/tcg/user/meson.build b/target/arm/tcg/user/meson.build
> new file mode 100644
> index 0000000000..d70a51ea9a
> --- /dev/null
> +++ b/target/arm/tcg/user/meson.build
> @@ -0,0 +1,3 @@
> +
> +arm_user_ss.add(when: ['CONFIG_TCG','CONFIG_USER_ONLY'], if_true: files(

Actually, surely the CONFIG_USER_ONLY and CONFIG_SOFTMMU tests are redundant 
with the variables, as they are eventually added to target_softmmu_arch and 
target_user_arch.


r~

