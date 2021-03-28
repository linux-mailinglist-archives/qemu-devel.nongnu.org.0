Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5582A34BD58
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 18:51:19 +0200 (CEST)
Received: from localhost ([::1]:47214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQYdC-0000Aq-D0
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 12:51:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQYad-0007tW-6Z
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 12:48:39 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:39684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQYaX-0000bF-IA
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 12:48:38 -0400
Received: by mail-oi1-x234.google.com with SMTP id i81so10914760oif.6
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 09:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bpvXBfuCRjDDUniW3Dfns3wjb6vAkNtqNTUB4xXwzUw=;
 b=BkThfnQOn69QY9wx/mNA4zATe84O4DVGDmTHC93WduhJ9kEnYdY4u0dBlxnX/WGANU
 eLR33//b90S2uBmdHeG1zrS4DmtQSqKTh/LgoHumlRV6gcdDkHPkpb5jI0hluw+fUPEN
 GDOLLOeom+GQQ+kkUhrcqRVEto2YsRJBzvoxxROgligIGslkCVu1GVW20uXd5cyEaPrF
 H/48fha/q3EYmRGlrA0QkKrxaTB10jIBChAkSvjA+nMmsuBvP5jXnuUkKdTZtXzNtqya
 gOjjOm8LcRJBiYGJMQkN1KBYX73dMX+25ryU+fcF5yYbg4vRwdDTuH0lTXEyko8nmP3T
 1Emg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bpvXBfuCRjDDUniW3Dfns3wjb6vAkNtqNTUB4xXwzUw=;
 b=rpa+tQGSnWUfVL2yscwgViHERU7wctZpWLEY63etCkUHPJqBKpPubey3u5D5ySZOCc
 XFCt/dX3BSM7WNXVdqkGFnBpqwyfSwiZWzhnD4c08VGb5xrKc/oOcy5NByKd53CZdoYF
 ZUd6Lov5cY/VOKENcjFQNI4riykRW9uKrtiGenTbDyrPu8hv8cPCd+4y7ydVdIAkDV3U
 gG6NtcHv/Gsx/DHMTB0GXZe9vAJBp4bLfGfCVfPRvnJBOJXZuGeB6ZohPgf/o3dYjnbd
 sCAxYsPhHse1HyzICh5H0Aj5Ax/KqR72RjAz7C7QF7yDhzZBCNS+kAWG6CXOp3VNsvIj
 VHHg==
X-Gm-Message-State: AOAM530ZtonwA+1vBxlpjnmHIJMCJFV5FuJNSZ51nI7bm107lBxTgXAi
 W55iwaGcHCyX5NCjqzUcxn/mHw==
X-Google-Smtp-Source: ABdhPJz/RQtEpqPNziAfd6MVE4wRMBqhxTLvCEsngrpSfAlGX5KGoCT0TaP1g66rRciH6JCReRit3Q==
X-Received: by 2002:a05:6808:993:: with SMTP id
 a19mr15706271oic.73.1616950112280; 
 Sun, 28 Mar 2021 09:48:32 -0700 (PDT)
Received: from [192.168.211.34] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id z199sm2315032ooa.39.2021.03.28.09.48.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 09:48:31 -0700 (PDT)
Subject: Re: [RFC v12 32/65] target/arm: move TCGCPUOps to tcg/tcg-cpu.c
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-33-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6529fb48-cfcb-5fc8-2001-fa0c8cef9d35@linaro.org>
Date: Sun, 28 Mar 2021 10:48:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-33-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x234.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:36 PM, Claudio Fontana wrote:
> move the TCGCPUOps interface to tcg/tcg-cpu.c
> in preparation for the addition of the TCG accel-cpu class.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/cpu.h           |   1 -
>   target/arm/internals.h     |   5 -
>   target/arm/tcg/tcg-cpu.h   |   6 +
>   target/arm/cpu-sysemu.c    |   4 +
>   target/arm/cpu.c           | 209 +--------------------------------
>   target/arm/cpu_tcg.c       |   2 +-
>   target/arm/tcg/helper.c    |   1 +
>   target/arm/tcg/tcg-cpu.c   | 229 +++++++++++++++++++++++++++++++++++++
>   target/arm/tcg/meson.build |   1 +
>   9 files changed, 244 insertions(+), 214 deletions(-)
>   create mode 100644 target/arm/tcg/tcg-cpu.c

I'm confused about the differing placement of arm_tcg_ops and arm_v7m_tcg_ops. 
  It seems like one or the other is a mistake.


r~

