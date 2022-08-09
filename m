Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C7258E022
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 21:24:38 +0200 (CEST)
Received: from localhost ([::1]:41528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLUqD-0002jm-HX
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 15:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oLUj1-0003s1-4u
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 15:17:12 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:37491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oLUiy-00065e-L4
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 15:17:10 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 w11-20020a17090a380b00b001f73f75a1feso7719856pjb.2
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 12:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=8UoYu7oT6YmUou99hQcZTnSUcrXDMc6hFp/3nTzi6Dc=;
 b=W6ySV1JR2J3dlmB5QP5vcxSiS2MrjJ0YVpj0Zxm2/5wYwNNovz6+EqryeJXp5qi1Bl
 ImUXr6lyfLB2l96z+FigjEIk93oLSSzGpJOGzJTkxihwOMG0Qj6EnwTfVJ070JUd4jgX
 SHvOmx/sxbwOuHcEZDnNyl2QtjkqTXyvGWqPibJPDjrSTsiM+SHXaSraN4xyz5kxmC02
 mh53EnZZ9lR33JsgXuZmCb4AQsrTgdgaTe4Mt6P4HgapETqCd61N9DSgA4ms9UIAStS5
 q0byWUMiaUnmbPGWlfEQZ5H78wKQlSH54wPaRKztOp9zWpwhqNbweJjGYkmxjjk05tVk
 rMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8UoYu7oT6YmUou99hQcZTnSUcrXDMc6hFp/3nTzi6Dc=;
 b=YXMsd/bJWK/MeRWOYs7R0PyvrRa081VVm88Zo+rYBEls/qmKbRsqnPPLa95KNRaOl9
 y/UxkOzi43TkZyH17l5dxPz2YMJy4/zEi+jgngenX5GmD1Gr6LBnogqSos93riRsJHrl
 XS5ypoS60g822UrzGOaMtPZhosVR66UONbCxSzJu5tHAjE+jicRLqBYcK2PAV3lnFLNs
 4lAhkE9ed4RbFlMyWR26gwQxc9MfQkGVWgXnB6SysgamzsyADuN4WdKVMw9bIQemhG21
 OKtnTNOQBGXIqZAL+1X6N8mxerBHXBwggsPWhYYaMf8Ej5aVV3VPElxua5clWu3KUtY1
 m7Qw==
X-Gm-Message-State: ACgBeo2h87hyBQCWHKu9/31tVaxj3EdTsPzFGU3GuiqLvi4SE/n0vEJ3
 Fd/ggHILSCq1+GQOtjYCB+crWw==
X-Google-Smtp-Source: AA6agR5kcX7x0HPCl941PApM3tZ4QXLVNWwxAYz9h6AqitwzgDMlm+XES/onZ7Oo91pOvj0m9sXk/Q==
X-Received: by 2002:a17:90b:1894:b0:1f5:1041:a4ed with SMTP id
 mn20-20020a17090b189400b001f51041a4edmr27667779pjb.125.1660072627070; 
 Tue, 09 Aug 2022 12:17:07 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:409:90e8:ee9:8fec?
 ([2602:ae:154e:e201:409:90e8:ee9:8fec])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a170902f69100b0016a091eb88esm11285941plg.126.2022.08.09.12.17.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Aug 2022 12:17:06 -0700 (PDT)
Message-ID: <d56920b3-a180-e751-0f2c-ee91d9d5c049@linaro.org>
Date: Tue, 9 Aug 2022 12:17:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 0/1] target-arm queue
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220809121307.560286-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220809121307.560286-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

On 8/9/22 05:13, Peter Maydell wrote:
> Just one bugfix patch for this rc:
> 
> The following changes since commit ca5f3d4df1b47d7f66a109cdb504e83dfd7ec433:
> 
>    Merge tag 'pull-la-20220808' of https://gitlab.com/rth7680/qemu into staging (2022-08-08 19:51:12 -0700)
> 
> are available in the Git repository at:
> 
>    https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220809
> 
> for you to fetch changes up to c7f26ded6d5065e4116f630f6a490b55f6c5f58e:
> 
>    icount: Take iothread lock when running QEMU timers (2022-08-09 10:55:14 +0100)
> 
> ----------------------------------------------------------------
> target-arm queue:
>   * icount: Take iothread lock when running QEMU timers

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Peter Maydell (1):
>        icount: Take iothread lock when running QEMU timers
> 
>   accel/tcg/tcg-accel-ops-icount.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 


