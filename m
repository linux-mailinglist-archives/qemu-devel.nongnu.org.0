Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3089C6EB7CC
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 09:32:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pq7iL-0003m2-7B; Sat, 22 Apr 2023 03:31:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pq7iJ-0003lu-HL
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 03:31:19 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pq7iH-0000he-Em
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 03:31:19 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-2f7c281a015so1528466f8f.1
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 00:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682148674; x=1684740674;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pY8anCMaDz5k7cXlNWm5nFr9D2znJj/aqbfFxUwLDq8=;
 b=PQvLNdwL/6zolu/4Hsso4GmecE9hPCgtSonNC8La19mquAk69XJn9pCXS4LRpjAEAh
 tnY4BuJP/OL1O2QTawxt80BKxbEvTzfrdntjJKowhsV5/DXqElzek7rrj+s+R208YoV/
 n/arD8aZU2HBRmrIVznqOGGpmV5x5xIgJLxwiTXOJdPiaEXKone8YflrKfQC4g+noLpS
 +3a1e4i+Pjlj7XQ6A/j1uUCu2CPSowDAffx25629J/zv60fChvsxtOnT3FSaYLs6qgej
 bBmitdeOfVDMfhrCrw629pdG6BjeZLhufjKFmdwY5rhBjyQmtut1GkLUrHqOBFrAJB3L
 4SCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682148674; x=1684740674;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pY8anCMaDz5k7cXlNWm5nFr9D2znJj/aqbfFxUwLDq8=;
 b=AWFHuenWi34pySk9AlcChiUf6CbrnQjc2Fm3I8Oro1KoqMWHk6VrBbKXOjM24MvP5a
 8F463O7N6GxWzMPqK2qyfq9Gj1ssSJVQQpzQ4ng/m6W0x6DOXQNiWdwJLl4riXgztNzw
 +Bm8D7QP6UQT/VsO47WQb2TeGXAM0QQZ129VSLC0hfdBA8DFErl87pBwDPQLW1pgt6UW
 KRynX2Ycw3pERQhvwoPddA8YzaWPJfRBVel3HcZidLi9pQnOr76PB3yji4LNG3BIMJJ4
 ynL8iAo4L/SphqTdff0DSr105E2FnjGAEHoddCbtWes+QtH5himoxWy8wKhhd9nEKp6N
 H+PA==
X-Gm-Message-State: AAQBX9f/qoRdRhBeeBviW3Wwb1xID3OBlYMbXWK6KalJ1XFEGJdjo1lX
 UMpYmeCQ1gLHgK/3wV92pZwbYA==
X-Google-Smtp-Source: AKy350aIOuqSDQsisVwLDfdfhYiFeY36arUWHNTk9KNHvKxgipPJeRCrmlCCP/o3ewHxqLA2Y8TZIQ==
X-Received: by 2002:adf:dc44:0:b0:2f8:5d73:dbf0 with SMTP id
 m4-20020adfdc44000000b002f85d73dbf0mr5386688wrj.27.1682148674240; 
 Sat, 22 Apr 2023 00:31:14 -0700 (PDT)
Received: from [10.43.12.195] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 p14-20020a05600c358e00b003f188f608b9sm7149340wmq.8.2023.04.22.00.31.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Apr 2023 00:31:13 -0700 (PDT)
Message-ID: <3cd08f9b-3b60-3687-d277-08f78d6b777f@linaro.org>
Date: Sat, 22 Apr 2023 08:31:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 00/25] First batch of misc patches for QEMU 8.1
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20230421093316.17941-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230421093316.17941-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/21/23 10:32, Paolo Bonzini wrote:
> The following changes since commit 2d82c32b2ceaca3dc3da5e36e10976f34bfcb598:
> 
>    Open 8.1 development tree (2023-04-20 10:05:25 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/bonzini/qemu.git  tags/for-upstream
> 
> for you to fetch changes up to 5f9efbbcf6fc77e583254389124437d981ad76b9:
> 
>    tests: lcitool: Switch to OpenSUSE Leap 15.4 (2023-04-20 11:17:36 +0200)
> 
> ----------------------------------------------------------------
> * Optional use of Meson wrap for slirp
> * Coverity fixes
> * Avoid -Werror=maybe-uninitialized
> * Mark coroutine QMP command functions as coroutine_fn
> * Mark functions that suspend as coroutine_mixed_fn
> * target/i386: Fix SGX CPUID leaf
> * First batch of qatomic_mb_read() removal
> * Small atomic.rst improvement
> * NBD cleanup
> * Update libvirt-ci submodule

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/8.1 as appropriate.


r~


