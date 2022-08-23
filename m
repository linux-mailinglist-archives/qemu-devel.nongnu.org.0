Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E5159EE85
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 23:58:00 +0200 (CEST)
Received: from localhost ([::1]:52062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQbuJ-0006N6-GY
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 17:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQbtH-0004if-O7
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 17:56:55 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:39841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQbtG-0000I5-2c
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 17:56:55 -0400
Received: by mail-pg1-x534.google.com with SMTP id q9so4343812pgq.6
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 14:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=kNOHwpDqMggVPXfAKt47Nmp8rDHxWzziIcur6Tp0rZ8=;
 b=udcKBV8rat03IfqlW9+OKLHmaYhW3a81qFXBrl3rF6WtR19OmblW2lESR0oCqbFCrT
 2HPbCwoLSmEO3tbjxIfdzl5WQyLXavB53MMsd7qbFUAxstFS2wGr93cgjLQaYDXd85dD
 SgIZ/TWB8KuHPyx94NDBNU0qXce8hVPuJgeop6YiYK1yByF7lHvTao+WOsX+oHDRXyw8
 YekHRAa5RZgQzljAEUdJWWWOp40qj46bPv6g1q1PONXs8xVqtiHXjHCCWl75dlnoQM9m
 NI0n77hsfeRySyLJKl2qxRSqdNc4B53sRlAWM+4dZniuQnq/wOH9G/iQccyg6yj6VdjC
 IOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=kNOHwpDqMggVPXfAKt47Nmp8rDHxWzziIcur6Tp0rZ8=;
 b=x6nYgSd5hkU8l0rjGmnFyaeStjan2tOHblXTBk8JEZ9nWusH7Vr90+YMzdemNCVfbJ
 FA3835O22y1Fou+mTpVG7+/bjUZBesmA9SvRNaGSeDbzJ4vnuYhFW3lAzAoEMQltz+7D
 PQEE1HhVSOtcz33H/gvnP6vgCIO5xB/f0NrxkvuncGnfA/t84rQzQ/5oFKA844jPW+hP
 IR9BKVcB53bt79f7S7s7QPlTCRbPflW7nHKU+HXRnLq3os1RwPsPS28Lf9ImBr1N3dCe
 81bv9W5AThhHxj7XtaH2ziNNW2Z67egxm+Om5M7Rn69A9l3Pxtpwwqyps/w0CKGGO5iU
 YvUg==
X-Gm-Message-State: ACgBeo2ZuCVwi1MPuCF5MMkjfTHu+FGIz0Vk+2xMe3LEpbmGfhiV2Lgx
 MooYBvlMQZlmkbtReitfNz54pw==
X-Google-Smtp-Source: AA6agR7F+qr9xwL//BbI8mGSbC8j7SkwgNwQ8Bwjcc+f5bZUXk1+Oo9LGHdXNMmD4BxNcBlklck6NA==
X-Received: by 2002:a63:5620:0:b0:429:9ad7:b4f2 with SMTP id
 k32-20020a635620000000b004299ad7b4f2mr21653077pgb.162.1661291812567; 
 Tue, 23 Aug 2022 14:56:52 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9?
 ([2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a17090ae4cd00b001fabcd994c1sm11836179pju.9.2022.08.23.14.56.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 14:56:51 -0700 (PDT)
Message-ID: <aa67609d-da9d-7f36-e617-43f60bc907f6@linaro.org>
Date: Tue, 23 Aug 2022 14:56:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/2] target/arm: armv7m_load_kernel() improvements
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shiny Saana <shinysaana@gmail.com>
References: <20220823160417.3858216-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220823160417.3858216-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/23/22 09:04, Peter Maydell wrote:
> Two small patches to armv7m_load_kernel().  The first is just getting
> rid of some dead code, that I noticed while working on the function.
> The second is to make boards pass armv7m_load_kernel() the base
> address for loading guest (non-ELF) binaries.  At the moment we
> assume all M-profile boards start at address 0; this happens to be
> true for all the ones we implement right now, but it's not true in
> general.  In particular the Teeny board has its ROM at 0x0020_0000.
> 
> I thought about having armv7m_load_kernel() be "clever" and ask the
> CPU what init-svtor/init-nsvtor were set to, but that seems like it
> might have unanticipated consequences[*].  "Just pass the base address"
> is simpler and is how A-profile does it (though for A-profile it's
> the loader_start field in struct arm_boot_info rather than an extra
> argument).
> 
> [*] eg where the board has the rom/flash aliased at both address
> 0 and some other address, and init-svtor points at an alias;
> also Secure vs NonSecure address spaces and loading...

Thanks, queued to target-arm.next.


r~

