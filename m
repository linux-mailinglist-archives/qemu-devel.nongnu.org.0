Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 416692DB6AA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 23:53:02 +0100 (CET)
Received: from localhost ([::1]:38490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpJBl-00077C-0Z
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 17:53:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpJ9T-0006NC-DU
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:50:39 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:44328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpJ9R-00017w-Py
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:50:38 -0500
Received: by mail-oi1-x22f.google.com with SMTP id d189so25197490oig.11
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 14:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XGgO9tR3CDeSlatzhvyUgrRh4Ded+QEKSHAJcNXlOdQ=;
 b=bcP4lWo56O8wHCShyakPx9veZCJCzz+JUSeAUFq5N5ZnBpCIkVfAp4VrLi4mpoJCdW
 VeZtO3TDd95d8Retgi12RI8E2lTU881HTZE9kVPo0gFryFBn7nzk39nvWJK7HfWrbI9N
 kO+N2BaAOlykk0tR74lt4Ini4gJislBQowei1T+GMBLalpAYVqLjxIw6/M73kijuU1m/
 2to3wQPL25eEdzqnetxLy27wezVtHFA7U0MegAwT1OBvxzapk1jIezZoWzVeB0GO7tDy
 kEvNKUQvmR4Ua1b+ORWaD8+wT9PGtRtpGsmtc0EHitaTSioyJmkVdZqZRQK2ctNedTbb
 f5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XGgO9tR3CDeSlatzhvyUgrRh4Ded+QEKSHAJcNXlOdQ=;
 b=UpA2OaHHxkwjdYbhewToSGehddCn5/qUQ8xPG63SYQkdA4EDhKe+GeaWRyWBhYCT2K
 AybtDQUlXSrVwpFc8O0ncZixg7ymy+Q5CTe2Wm4EzKzAFsK1vf9Kpt8siudZ7bImxZpB
 LgyROROMF+nAV91a+MQIKD7cLuRgjBAz1i1jT3B2z9GQ40WNvfWM2dKoy+AhX2TpQ9HB
 QMNc2g5RoETlMfXVKgSk0V8WoeqwUqit6bTDRC8SUkNNuTkXhm3Eoe0zQCK6C+Xf7hWI
 VkrdJLTUQCRYSwdSJ/hrqr3jqViWEv+ziwNYQaCJFQN4iDrNpdxu8Zjpl5UUrM0yg9ZZ
 sNBA==
X-Gm-Message-State: AOAM531xrIfUfGlcgx5z4M1I2o0fIZYxJ+1F4vKtn6E7gRZmxEkpSeQx
 dN9gujMdNa6KLSruEUD7NjS2b21rrwMEHE9J
X-Google-Smtp-Source: ABdhPJxKynPrmrlTzOlsaTfmzyjWgPbWQUzx5kqJNqXx6U9/Yx71Op1sfaG/WkR+nIQEfCoAvgFKbA==
X-Received: by 2002:aca:4257:: with SMTP id p84mr589484oia.176.1608072636470; 
 Tue, 15 Dec 2020 14:50:36 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id m29sm36362oof.20.2020.12.15.14.50.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 14:50:35 -0800 (PST)
Subject: Re: [PATCH v4 17/43] tcg: Add --accel tcg,split-wx property
To: Joelle van Dyne <j@getutm.app>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-18-richard.henderson@linaro.org>
 <CA+E+eSDE=_zwJaQm05R2E1y2k0up2sNRgX86iOaLzLiw82_eQA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0bd5517d-29d5-d5fd-3049-98aa91d3f5c8@linaro.org>
Date: Tue, 15 Dec 2020 16:50:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+E+eSDE=_zwJaQm05R2E1y2k0up2sNRgX86iOaLzLiw82_eQA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/20 8:05 PM, Joelle van Dyne wrote:
> Should qemu-options.hx be updated?

Yep, good catch.


r~

