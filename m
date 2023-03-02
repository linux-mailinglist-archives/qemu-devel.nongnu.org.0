Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EECA56A8A6E
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 21:31:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXpYm-0004WW-Mr; Thu, 02 Mar 2023 15:29:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXpYi-0004WJ-OR
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 15:29:48 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXpYT-00060G-RA
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 15:29:48 -0500
Received: by mail-pl1-x633.google.com with SMTP id i10so505070plr.9
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 12:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0JKv8RpyJ+viJhK9MA6SkF8wdzOxlXzPMnu/XUJz9ww=;
 b=StdwLeRxXl6Mdrus4CeViHMbOw9O7DMYT7j9hIdODhFPSZNzB0ZZDr6mU2kNafirkn
 ChIPpoCDDDO/CiKKVCOdVKFzrfqlvATXqt+tRYAR1hDjAVQ8Zzqn6DqrCfq7mrnwQrbn
 AdCLuB3L0HDrbxddGG39RuRyZFVMQLq66tmllsqHLTDOtBs3/929fP0lg/bElkRXd4g6
 tjuteYiifaY+yEuEQPD2SsvCFeOstpWG7hK4UNUt8SxQcOT67+J8tMeFzBOnQALIqmFf
 gQq6S8Ch7VUHWjedFydpntI+AnaBSEfmnYGPCJ4u/xyxoup4AL+PbWCW1KX9dhfdcXYe
 gZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0JKv8RpyJ+viJhK9MA6SkF8wdzOxlXzPMnu/XUJz9ww=;
 b=erhX+t7wNN0mJEVYGwZFWCn9SKd17KoVJQfkgmI1Zfs3PGc6NFQwehRC2uiN3B1DH9
 tIt0Wu5iAXMaBXSXe9HaR9IfoZSKjdRr+fpTtxT5AorAvWlU97+hDuLoNduJASZuInwO
 P+HKt12ff/HI9+F9omChxzimEvM+GABXixD3TVib8U6Na6G3R/hf2EUDryOFBwg0HVDx
 2KaTfhnxmaoJAbgQAt8y5P9SYQqP4n6G6QfEJM2Q3AiuTfk5rNhxpXQAIFN8EZJQjqM5
 PAFtxJu3ghuxl9hLsPMlQ9wcfUiQeExmsMH+jhSOm0RkPHDYhm7vCZZS+v74GoTXMHIp
 N/GQ==
X-Gm-Message-State: AO0yUKW2s9s+Ytrpte5OgQ3ubet3dp3aYUkS1x0H+BQvH2/zJRF1GIbr
 79/1djsr5ens13UEe234Jhl/YQ==
X-Google-Smtp-Source: AK7set9wa0ixORe1WwF1E+CHpK4WS1Mw8Tm3XWJv8w++AMU4bv6nMApzyVqUJecxItGGPUikHw4izg==
X-Received: by 2002:a17:902:c40d:b0:19c:e3dd:db3c with SMTP id
 k13-20020a170902c40d00b0019ce3dddb3cmr3881263plk.20.1677788969361; 
 Thu, 02 Mar 2023 12:29:29 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce?
 ([2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a170902ec8f00b001994554099esm94225plg.173.2023.03.02.12.29.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 12:29:28 -0800 (PST)
Message-ID: <ea57591d-a424-fc70-67f7-20d20dcec574@linaro.org>
Date: Thu, 2 Mar 2023 12:29:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 04/26] gdbstub: clean-up indent on gdb_exit
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230302190846.2593720-1-alex.bennee@linaro.org>
 <20230302190846.2593720-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230302190846.2593720-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 3/2/23 09:08, Alex Bennée wrote:
> Otherwise checkpatch will throw a hissy fit on the later patches that
> split this function up.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   gdbstub/gdbstub.c | 28 ++++++++++++++--------------
>   1 file changed, 14 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

