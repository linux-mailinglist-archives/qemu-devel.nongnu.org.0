Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5471A652AF5
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 02:26:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7npk-0005Ec-Cx; Tue, 20 Dec 2022 20:23:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7npa-0005Cw-NW
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 20:23:38 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7npZ-0007cM-36
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 20:23:38 -0500
Received: by mail-pf1-x431.google.com with SMTP id t18so9662556pfq.13
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 17:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uCkp37zRSFjLG/vM79nxx1drROk+Rt3/OhdwamPp7PA=;
 b=jmNA+hwn9beXvoFWUk/HALWv8RqFRBUvi7mLM5zL80VLQtBuR3cezbZA5Nea4wEqp/
 wSbEfSObTnjRXjuycAbX6Hk6RzzSHlwe6VEt5d97qyPetx69b3+FOfsaqurHWsZs+QnB
 rSZCWSFy/aLA4y2oxUhiakN0V58v+rx//Wo1rEEhyNrdCcW+lbVEREMnToLIL7JpPBWE
 SBr7N4yU+qPt5JD7fY/wDXc9k9O5WDrx8VbnwQeW3T5/BqWUFUbDtqmRESPBE8PuitZq
 50P0WcdCGPDRy9duOGY0mec3lYfEfa2bFmRQVUMyhF6vk1HTCpexwwVVdJoktJu2i1Rl
 LF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uCkp37zRSFjLG/vM79nxx1drROk+Rt3/OhdwamPp7PA=;
 b=e1HBtdKVllWfiu8jxE3OS8O33umAQMu1OXpaUWRI50d6ZeqRGIhvb8Z+2QaGzzBpUy
 YWALkjrmQy6aOeFDEUcGQlUxnitQvhHkOFMk99ofsYqxJsXgy9A9eT6qzqx6V9PuHKCr
 wArY7CuWwZe89uZeyiOg7FED2GknOVZh9cCE0uZRv9x4hu0l/ZP1AyC0EAecSABicDnM
 vHrrnajn71z57/cM5urCnn+YFC7w/LQFM5r1+5DCDGVkw6OunpD2pKZ5AX/uxo/aonLs
 qS2WwVKo9nm4PJFV/t+FjQIRSC/ZQdUz4H9rzlTk8VyLZKyZD+mdBX8VoFV0KQ93e4eu
 qsCw==
X-Gm-Message-State: AFqh2ko0r1fUrlEVh3suahVOi6hV8y25gbBwNJQ4rEVqJwhQkB23lBDv
 lqSni7UAqvNBZV6DUXQU/8/j3A==
X-Google-Smtp-Source: AMrXdXv+N5BHgswNINYH9uD+4vvDGjvja4pjkh/93gMxAisQHx929xoRpECQp2bh0T+RNyJ3bSBwmQ==
X-Received: by 2002:aa7:943a:0:b0:578:202d:a33e with SMTP id
 y26-20020aa7943a000000b00578202da33emr539348pfo.20.1671585814943; 
 Tue, 20 Dec 2022 17:23:34 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:3efa:624c:5fb:32c0?
 ([2602:47:d48c:8101:3efa:624c:5fb:32c0])
 by smtp.gmail.com with ESMTPSA id
 w7-20020aa79a07000000b0056c2e497b02sm9536409pfj.173.2022.12.20.17.23.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 17:23:34 -0800 (PST)
Message-ID: <767c0371-50d1-424d-96d0-9ea47c2bbd6b@linaro.org>
Date: Tue, 20 Dec 2022 17:23:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 5/5] target/arm: only perform TCG cpu and machine inits
 if TCG enabled
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20221220220426.8827-1-farosas@suse.de>
 <20221220220426.8827-6-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221220220426.8827-6-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/20/22 14:04, Fabiano Rosas wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> of note, cpreg lists were previously initialized by TCG first,
> and then thrown away and replaced with the data coming from KVM.
> 
> Now we just initialize once, either for TCG or for KVM.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> [moved arm_cpu_register_gdb_regs_for_features out of tcg_enabled]
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> Reviewed-by: Richard Henderson<richard.henderson@linaro.org>
> ---
> Originally from:
> [RFC v14 16/80] target/arm: only perform TCG cpu and machine inits if
> TCG enabled
> https://lore.kernel.org/r/20210416162824.25131-17-cfontana@suse.de
> ---
>   target/arm/cpu.c     | 31 +++++++++++++++++-------------
>   target/arm/kvm.c     | 18 +++++++++---------
>   target/arm/kvm_arm.h |  3 +--
>   target/arm/machine.c | 45 +++++++++++++++++++++++++-------------------
>   4 files changed, 54 insertions(+), 43 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

