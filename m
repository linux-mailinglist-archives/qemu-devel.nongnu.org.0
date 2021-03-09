Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92889332814
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 15:06:12 +0100 (CET)
Received: from localhost ([::1]:42112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJczz-0005Lw-KU
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 09:06:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJcxZ-0003l0-6d
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:03:41 -0500
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:38194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJcxU-0003aR-Pw
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:03:40 -0500
Received: by mail-ot1-x332.google.com with SMTP id a17so12898175oto.5
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4CUYfA8f66MhOf2HGkSg7aSDL7jxO2XHj36vOFx9ajY=;
 b=Z+s/LBWqGQJM9GsLXUolqd78m4cUmAvYhDspwez62rAHRKckKcCh6Y24z7QtOOOPIk
 ymV67uSISdFSSOCH3+9PmNd9LQil9p0ZlJzLlcyQM33YDHWFEJp6N9Wwl/NisxJJOd+8
 dvqOsuGdr6YCse/Kjo5gETVUjJuhwCPfMbmIgShq70snil20RtC4dhubJulE/kcLR+hP
 8YcUrXUzGNn7cLwVfh0Gz59lC/0DVD1ufRcyzHNL25Y7t64iEEe4sFrjt7MfVtcG8e0v
 mM5Z/KVCW6A1gg3ZcFRMMPVusVEKXYE91ijAuYqzGdK8nAlg0HRbuOH9Xsfwz7tAIH4n
 1JFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4CUYfA8f66MhOf2HGkSg7aSDL7jxO2XHj36vOFx9ajY=;
 b=LCjcK7UiDDK2QMtEyanxV1mmyC49nlIpKbD2VXLiP0FXAHKOiZDqKTSQHl3wTEsEEr
 2HVJgoUKLr3C+E/+g86CN1eSFLSct0241ksqu3w91/Vk5GVKNPy2HWF4nCTcdAArlMZG
 0Jcv/qF8O5hpyi69hnfEsrCZ1kOtRXPBtsj+2RvpdBoCHgWiu3208ppJU3icu/EqrQp7
 /kz8L6yfFGLnPiSbaN9qiJLJb/QCUR2Gk9cmr0vnIaAw3JBIP/nK3BOr+T4+22CiDLqR
 Rp7M83l4981D+K8S3Fogti/qS7OnX19B+YZ5075lNj/I0KpThoYteHuagoYUDZqDpLJc
 ZmLw==
X-Gm-Message-State: AOAM531m774XiKFjeZdazW8oLMjnQQlZCpTbgMR1yhoUZYBd6vf/s7j9
 056GYSiqCuJ892zzylQeUx2tkg==
X-Google-Smtp-Source: ABdhPJw1J0HY+CKdStF3R6290DU9Ri/gxHeKG7D1tZE5h2twvD+42aL/uX5kIMz7dksPaHEIPwVBWQ==
X-Received: by 2002:a9d:73d0:: with SMTP id m16mr13423347otk.172.1615298612452; 
 Tue, 09 Mar 2021 06:03:32 -0800 (PST)
Received: from [192.168.3.43] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id l17sm548015otb.57.2021.03.09.06.03.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 06:03:31 -0800 (PST)
Subject: Re: [PATCH] util/osdep: Avoid mprotect() RWX->NONE on Big Sur 11.2
To: Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
References: <20210210105527.74943-1-r.bolshakov@yadro.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4c5e6294-5354-e7e1-7ea4-96762721d094@linaro.org>
Date: Tue, 9 Mar 2021 06:03:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210210105527.74943-1-r.bolshakov@yadro.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/21 2:55 AM, Roman Bolshakov wrote:
> There's a change in mprotect() behaviour [1] in the latest macOS on M1
> and it's not yet clear if it's going to be fixed by Apple. For now we
> can avoid unsupported mprotect() calls. QEMU and qtests work fine
> without it.
> 
> 1.https://gist.github.com/hikalium/75ae822466ee4da13cbbe486498a191f

This is an unfortunate OS bug.

But I can use this as an opportunity to tidy up some memory management, and in 
the process go from NONE -> {RX,RW} instead.


r~

