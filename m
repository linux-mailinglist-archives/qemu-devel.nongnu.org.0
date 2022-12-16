Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C951364F55F
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 00:56:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6KXy-0004DS-IL; Fri, 16 Dec 2022 18:55:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6KXw-0004Cx-NF
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 18:55:20 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6KXt-0003mj-Sz
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 18:55:20 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 hd14-20020a17090b458e00b0021909875bccso9459285pjb.1
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 15:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7HuX3umh1vhBvWljz78x6kDREymcel4L0smmP2tLTq4=;
 b=UjHCp9Hqau7UvqHqt6qgyAYFKvgF8JLA+o8he+aBUxdUU5jbElTyxRdbfZ5lSuOODH
 p9iIJuPH5gOQbgfH9CCP5wRm2fDjMsR19QUGmdWQXfC/kD+vTBKtLkspJnyvmRnh/uJL
 eWuJntVY7PxIJ+qATQomvaQ/IqI0HIludzgZKDgIwGOgZrEhihdZ0do9oEJXHXpRUptH
 Q1K22YVIIN3kKLKVlhqjRVmh+dknG0/q0j1qT/r/sJPZHNkTVV7URArjb/dpdooFTbr/
 gTyOmHUbBtykeJq4wcRhiGtevynpAOTjW9C4VUkfsTL+bk8bLQaa1KrrE8J0SPpSBdkZ
 sEeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7HuX3umh1vhBvWljz78x6kDREymcel4L0smmP2tLTq4=;
 b=j4xopUrzPVx4iD580g0dhF/Mq+h53+KMIiELj7VmkIbmezVyJTEpKY9tduwd7Iy22q
 Yoh7W19rKkc1AIyG7Z/z49IVMpy4miCtMuIhytRe4h5KBNByGaKGPClZwIBMn44/mB8e
 Vqd6ENIbyIt2rW7kBkoec4ciSfGJSL6dVp+94bhwd62jdmz26QshHU5NV9YM33V7Vr4l
 0hIqrF3muD3JF5GMNUqY3TvVjrH1u8a/LwewXkXO+T+S8Yvyule5TR4pEWwPVDdr2gdK
 /YeqRMRflotxQ0qguhQKKKQt+y3hBPoSf5qHzvAl9pQOe/IfKFk1ZLHmUxcQ3tivtKOo
 QmOA==
X-Gm-Message-State: AFqh2krkUurJjK3nhpKGJg38WPooHwEwr42Bz9dk0ICfQBmbjhDkIO35
 GcRPjJO7WcdKiQT3l61fRjz/ZTiW1D/nKbgt
X-Google-Smtp-Source: AMrXdXuGjJ0x29sLSApkKnTT41gYG8nMVf9NkQIkGUkxVVvjaCCHY7BbrQVpvLsy3F9bOZp0bRQp/w==
X-Received: by 2002:a17:902:7d93:b0:189:b4d0:aee with SMTP id
 a19-20020a1709027d9300b00189b4d00aeemr183082plm.67.1671234906434; 
 Fri, 16 Dec 2022 15:55:06 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 ik30-20020a170902ab1e00b001897d30143asm2132311plb.289.2022.12.16.15.55.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 15:55:05 -0800 (PST)
Message-ID: <cd66ec49-c095-98c7-0239-48db53364c86@linaro.org>
Date: Fri, 16 Dec 2022 15:55:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/2] hw/arm/smmu-common: Reduce smmu_inv_notifiers_mr()
 scope
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Peter Maydell <peter.maydell@linaro.org>, Eric Auger <eric.auger@redhat.com>
References: <20221216214924.4711-1-philmd@linaro.org>
 <20221216214924.4711-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216214924.4711-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 12/16/22 13:49, Philippe Mathieu-Daudé wrote:
> This function is not used anywhere outside this file,
> so we can make the function "static void".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

