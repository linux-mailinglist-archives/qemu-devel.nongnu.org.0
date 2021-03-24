Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DD63484B6
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 23:39:07 +0100 (CET)
Received: from localhost ([::1]:37328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPC9a-0000i6-8X
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 18:39:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPC8L-0000GD-6T
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 18:37:49 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:36767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPC8J-00028O-Qt
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 18:37:48 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 g8-20020a9d6c480000b02901b65ca2432cso131671otq.3
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 15:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Vmfd3Wr+m82ECQNtvMN2k4HstkSNXOYk/CF2cn1+dyo=;
 b=hfM9ORPcaNur/dqVZAflt1VC+vbC9Ts3IW2UHLrZ7Vu3aSqi9jN8zc3VZfPvrbLxdj
 TaovsUkUMEzpo80x84HKVX0BZZB+jgCSCyJ2ocCSTRV6SRY0HNY95d2CiMFpQBUj9qyp
 ldq174xhxs/FQKuHQDUExH6ecOXecIRXJo3pXL4924xt5mnILrY6NJVnKRkvITXeFksK
 eSE9+kGv7Em/avQjtayLC1Fs1IokDRN7XRmkJDDa3E69xqq5sSnG5YjiBsIXvUj7mMql
 Sj4vvU1ZK+uZ5u2IwuFrZbrnO/x1aA1abmQ3yYmtBlcjulbTPG00DWe2CrdI4v4YjcMo
 TxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vmfd3Wr+m82ECQNtvMN2k4HstkSNXOYk/CF2cn1+dyo=;
 b=A2OhswI4r0nuEMv6NYN45xWGz+G2Pv6Tj7VsztnTNuUlEJmZY38StzTIaM7x9gwQYR
 CciUszD2o6DjYybnRzGUJaQkfJw8tmk1DUTMig58jieIDwjra81Llfy5BKih3eb0cAJ2
 v9Sn5uqwot33QZM8qGm0PpXDSNa76a75YFlT8Wb7ULAi6Miz+AGsSy9jKvreGvyicOhP
 6FPSLJ5hNoFDh0lwQltPQ4ecAdsFI92G857/OPFonTsjIIUuHuLFolCs4MbyYCfm/n8v
 RxKOFxddbJU96LCobZniQv4Ww4gCyTuqcbnQCfbXNug2Y7YAyLD2QzRc3m21PJ30ssYE
 fxWQ==
X-Gm-Message-State: AOAM531kmXopamQx5l6YC5yMe72LhvpVghEmfGF7YQ/XHk1gVT7YVmEV
 kB3US5pEwwrcDfVDELDPQLgjhg==
X-Google-Smtp-Source: ABdhPJwJ+u+xO4jPxAqgmDNekMYU4AygeNawFGs37as9cN0mVUWHy0RpdvtfdMz95qusXZRenQ+oHA==
X-Received: by 2002:a9d:6a14:: with SMTP id g20mr4871690otn.205.1616625466598; 
 Wed, 24 Mar 2021 15:37:46 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id z25sm912112otj.68.2021.03.24.15.37.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 15:37:46 -0700 (PDT)
Subject: Re: [RFC v11 34/55] target/arm: remove broad "else" statements when
 checking accels
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-27-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ca8be073-c49e-c836-d031-95a3961dfe0a@linaro.org>
Date: Wed, 24 Mar 2021 16:37:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323154639.23477-27-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
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
Cc: Olaf Hering <olaf@aepfle.de>, Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Julien Grall <jgrall@amazon.com>,
 qemu-devel@nongnu.org, Olaf Hering <OHering@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 9:46 AM, Claudio Fontana wrote:
> @@ -296,7 +297,8 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
>                */
>               bitmap_andnot(tmp, kvm_supported, cpu->sve_vq_init, max_vq);
>               bitmap_or(cpu->sve_vq_map, cpu->sve_vq_map, tmp, max_vq);
> -        } else {
> +        }
> +        if (tcg_enabled()) {

Better as else if, I think.

r~

