Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D630F32EF15
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 16:39:48 +0100 (CET)
Received: from localhost ([::1]:48562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lICYN-0004jX-SX
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 10:39:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lICGS-0003v8-9X
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:21:16 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:50588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lICGQ-0004b7-I8
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:21:15 -0500
Received: by mail-pj1-x1031.google.com with SMTP id b15so2058283pjb.0
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 07:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/V+0t/fNT36uB5DQe6YoeIW6tfydD0FS5xxzdWz4/M0=;
 b=QC41DJdua9I8yqiIFMoQ3vPO9HSHdBHoyfocRspbx8wNBaixMHASu41EaxYetGH0oO
 dRLr77/vIo4qC0taRzVfWQ6JJjSqjbjv7BULk2ZzOqLOxB94URuRzq1ne3WbzCXozKcb
 g0R0oKnxIFdNLtFDpDZkpPMPVNqufZJGPsrdgtRqNp2E4D1Sw0Com1VqhmS69FJjk1yO
 +PpRP/keymbwpd6lxWWtdKbOIRtMSCkq8F3XQ6HPfAgYZ7TotfDTRK3YDPbu87IsdhGg
 0pRnQMchA2e8IVPHturJzKvOeeNES5B9aBTpSomCMMoPTtFBJBnsVNG33agQcjEiFe1v
 sT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/V+0t/fNT36uB5DQe6YoeIW6tfydD0FS5xxzdWz4/M0=;
 b=NMeFLVMMbxUeaM3yb+lNFS/kYZhwhPm8IiwvAN5oDb5arBke11q2FZPdDkMRIhCe1K
 l9z8ymwm/4BXe4c46pvPHfa3xmrdhQ3POn5BXAyQGxm4rRZgk8GQY7A2lJ2xTypGjg1U
 ytLaaLEPQNumrRJHNcYBxbw0+2x6Mx1yA5pmeX+D/JAoBqCRWZMkC6m4+TE+Nx+ZXQUj
 5E5hqCdXuXgb99/fV4LFuXz8QtSm+vBxExpfpLtNXPDCN+mGryAucLrrpUy5v6QfaPfb
 HpMa4Qfr11uU2GZh/Ai2puOq5W33DLKzhgYKo15D6DRWrF6Xdrvq3maKY8lnuUlscpEd
 OEuA==
X-Gm-Message-State: AOAM533KAMYiKog8F6RL0pohR/S2j7MDW3tZkpKpqQwyDadVuQO3/Y1n
 vFH7s62hO3dq+FiYjf2xxSD0+w==
X-Google-Smtp-Source: ABdhPJwyMgkzCI/qA6gCKZnQm961fv/wsbAyszBJ+dlWHWAjrA5NJd3lSoLdXmswlxnif4BvD9bHMQ==
X-Received: by 2002:a17:90a:f184:: with SMTP id
 bv4mr10477831pjb.43.1614957673018; 
 Fri, 05 Mar 2021 07:21:13 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id k128sm2851878pfd.137.2021.03.05.07.21.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 07:21:12 -0800 (PST)
Subject: Re: [PATCH 03/27] tcg/aarch64: Fix generation of "scalar" vector
 operations
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
 <20210302175741.1079851-4-richard.henderson@linaro.org>
 <CAFEAcA99rVOBmvuffHWR==Z4KsdsfatbNHTXA+=pu5vXkxqtgg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8532c409-3389-3ec8-9a6b-1a85202cbafc@linaro.org>
Date: Fri, 5 Mar 2021 07:21:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA99rVOBmvuffHWR==Z4KsdsfatbNHTXA+=pu5vXkxqtgg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/5/21 6:35 AM, Peter Maydell wrote:
> None of these I36nn section numbers match up with the current Arm ARM,
> incidentally.

No, they're off the A.a document.

> #define FMT_I3611(U, OPCODE) (0x5e200400 | ((U) << 29) | ((OPCODE) << 11))
> 
> and then
>    I3611_SQADD     = FMT_I3611(0, 0b00001),
>    I3611_SQSUB     = FMT_I3611(0, 0b00101),
> 
> etc, instead of the raw
>    I3611_SQADD     = 0x5e200c00,
>    I3611_SQSUB     = 0x5e202c00,

Not a bad idea.


r~

