Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E83F321BF6
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 16:58:09 +0100 (CET)
Received: from localhost ([::1]:58078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEDb3-0006BN-Vi
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 10:58:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEDXy-00044Y-Gc
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 10:54:55 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:50619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEDXv-0003Aq-AX
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 10:54:54 -0500
Received: by mail-pj1-x1033.google.com with SMTP id b15so4304167pjb.0
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 07:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=srQsM6c+4E10QPBOW02GoWBMokhJqxscyUvpbYHgr+Y=;
 b=U+bcX2oPpJ+KikeA9hl/vpfkQhullL6BOdJncB9lQDoqYt56/JhG7MxkN1Z4pYd/6P
 ZBqMgZrO7kLRZyA0+b7EYlOtc9uEHV94qsP0fBnIOIC49ltEobe4hlb7gcblxNOIL7ET
 1aA2q5pv2K/TMessmyRqdkJaM7UI7mhPKKETqnnKCdunMTkOPKEwBM7tDol/+T20e8n7
 zVgizeAbGIvD4w30A+quxfXyW4eDKeV3HqREKJ9IN8hKqNLShuciba4pe6k4CETqy8bH
 uRtcWHq3UAYwDRTwY++YL+AsrrypPze3b88GgWfDHGAW9tevG3AjffVLQJ62My61F26P
 4ebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=srQsM6c+4E10QPBOW02GoWBMokhJqxscyUvpbYHgr+Y=;
 b=OUk6s43Eunx4dgFPWC35QOlIWgAMFFsTL0qHQYoEmq8ISPuP3lk3UV87gjSGrWPqZT
 byiAmLAOEKM+XRuNzoVI3xWHk1G+9NVMcsUObyR4kpRAPGcQqQCs919wqwLX8Ub+XJ2J
 ByQN4isFxOpMzQd+EaH0KnkcWB5Aene0MiGxf2I+1/zPiHAIcRuliDXVVP6iYpfRlu5X
 zhPxnSmVjhU0pYgyeyb4r88FBmkxbR9zovcUf2P+vxV2dJYFp4ePutBK6cEfPwJe3xSC
 sfT1wlrqAf/8Zboo5culCuydexrCyogfeJ/0ijwfclSQKJBhwxH7/vzfP/lPjfXkQTfQ
 WwXQ==
X-Gm-Message-State: AOAM533e/NM/jV4210exJmd7BVbqO7kp+B+SgefgjxeFhwDx77CMZsgc
 nQRrLqcYVYoTqyS+z9QV8zr8bpv0At6Spg==
X-Google-Smtp-Source: ABdhPJzCg+tmemgzeO7mZ46fGaY+OlZic/HaEApP/14GLbMzbh+bKJEr/gGP5KOn/bbzl78nP2ZUyA==
X-Received: by 2002:a17:90a:5601:: with SMTP id
 r1mr24036230pjf.236.1614009289279; 
 Mon, 22 Feb 2021 07:54:49 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id j201sm9137566pfd.143.2021.02.22.07.54.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 07:54:48 -0800 (PST)
Subject: Re: [RFC v1 05/38] target/arm: wrap arm_cpu_exec_interrupt in
 CONFIG_TCG
To: Claudio Fontana <cfontana@suse.de>
References: <20210221092449.7545-1-cfontana@suse.de>
 <20210221092449.7545-6-cfontana@suse.de>
 <38cb9c63-1138-2081-933e-03f6997a50fe@linaro.org>
 <ec2fa580-d4b3-14db-3d5f-001cbdc71946@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0e100d15-4f6b-bfa8-1fae-d831ae32e2f9@linaro.org>
Date: Mon, 22 Feb 2021 07:54:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ec2fa580-d4b3-14db-3d5f-001cbdc71946@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 12:31 AM, Claudio Fontana wrote:
> actually this is a fix for an error I introduced when adding TCGOps:
> 
> arm_cpu_exec_interrupt should be wrapped in the ifdef, as it uses tcg_ops, which is TCG-only.
> Maybe I should extract this and make it a standalone fix.
> 
> Currently, there is no real issue because the non-TCG build is not working for ARM anyway,
> and that's why the issue went undetected.

If it doesn't cause a current problem, then let's not bother with a standalone
patch.  But I wouldn't bother with the ifdef either, but instead move the
function to an appropriate file.


r~

