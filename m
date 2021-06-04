Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC2D39C36B
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 00:23:50 +0200 (CEST)
Received: from localhost ([::1]:43044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpIEH-0001El-55
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 18:23:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpIDS-0000Ke-GB
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 18:22:58 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:41612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpIDQ-0006ic-0d
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 18:22:58 -0400
Received: by mail-pg1-x52c.google.com with SMTP id r1so8950611pgk.8
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 15:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/vVU8pBQVJDjKO3VMXMlpL20KJGeRAcgu4Dt+exOHmQ=;
 b=eKIaX+gCVuxaG/Teu7QlbOIbN/Aw/UBO99y4uGgsPM8b07R+bimkCHcGNSd6bXtSNz
 uCEXnBmf1GdZn+74gdYycB20X7yfSkE+LMeUEY8tv1MCE1iSwtabaOkFoCcOYsYsR9vq
 jyUiIb/UR2t1MjR9KGKJyWdHXIYoY6jNetGpEOy9ZjTTEBqBhECOg0bdha/xMytWLDWg
 2u62nJiEEch/KwNlhztoufE8A+MFz004EOFaILyR9khD7YAl9m/RABiJpwfoVWXHkMm+
 zexdh7o20EIQUi6C4PQh1KBH480NkqXqnggTDJMsSouKLgQvkSFdUTGoll1WHUTTUW34
 Z9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/vVU8pBQVJDjKO3VMXMlpL20KJGeRAcgu4Dt+exOHmQ=;
 b=i/VsAiERdhJdHPXhDDKShXe2FNemNn/iMgxP5enI/rmzNSgTOxWpzPq7j88hnx3fWi
 sdOhc4npuwJRSPWJM7LFpF9p67ZdWA54+rbkuxZVpJ2cpCCQY1DBjaDG76FF7RqOHGJL
 Q8wQpjjVD+idsKZe7LfuWuUoJD6TfxSuWyXlNu7OEulBvHIsCUruuaiGblgE8KOOA/XV
 +OJYPoSScIPBI8tnEfNA9kILCa5oj+APrdRJ7CVKWyhTzlp18BaRjjO2GfWnzjSRuIdK
 vZIBcOVRZeHND1J+JMVABB1f1AQ5Qdi5gkPujyeSImWZ1bMnHJLeCEZRuWnshtPWMen6
 SDNQ==
X-Gm-Message-State: AOAM531OiXMUNRIsTfIsTqZca30L4cSCWhAO3ykoxd9k0bCAQmyL29+m
 07JEU3b7FQoMi1Zn7eqcINHHvQ==
X-Google-Smtp-Source: ABdhPJzMO9k4y8hdcfgUNgNYt4AzZTUpgVbKoOee7yIX9GgBNQOOQ5fbIj9S8vLm/awZCZSRhlyqyQ==
X-Received: by 2002:a62:1c48:0:b029:2ea:1c13:e229 with SMTP id
 c69-20020a621c480000b02902ea1c13e229mr6766749pfc.17.1622845374013; 
 Fri, 04 Jun 2021 15:22:54 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 c24sm2574921pfn.63.2021.06.04.15.22.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 15:22:53 -0700 (PDT)
Subject: Re: [PATCH v16 37/99] target/arm: move sve_zcr_len_for_el to
 common_cpu
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-38-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <de00c5c1-6c76-7618-6c73-b8283736ff4d@linaro.org>
Date: Fri, 4 Jun 2021 15:22:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-38-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> it is required by arch-dump.c and cpu.c, so apparently
> we need this for KVM too
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/cpu-common.c | 43 +++++++++++++++++++++++++++++++++++++++++
>   target/arm/tcg/helper.c | 33 -------------------------------
>   2 files changed, 43 insertions(+), 33 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

