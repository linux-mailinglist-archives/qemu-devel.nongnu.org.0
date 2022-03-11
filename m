Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2ECC4D6811
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 18:54:29 +0100 (CET)
Received: from localhost ([::1]:37804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSjTA-00061s-Dj
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 12:54:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSjRO-0004jz-Vp
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 12:52:39 -0500
Received: from [2607:f8b0:4864:20::1031] (port=52148
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSjRN-0006hc-H5
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 12:52:38 -0500
Received: by mail-pj1-x1031.google.com with SMTP id cx5so8819539pjb.1
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 09:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=H22LKxt9oIc/s29MW07gH9j3Xg5M/haxMeIR9n7aSGY=;
 b=Je9i20mkiqEpQd05VyfwdnP3aJwCMxdiySuCBSReajjiWMLE+oRsrqa9fwjPACweBF
 9eHf+sTIY9zaZxglHPy14x9vfaha/NvVQfj0l5Isulnetf451NtUeLAFoE6RFxrBmUYf
 S2ziBS9cfULhB9zBqGssWWNBeTH7XWr0MZStXhkKGp5kX1PiOXbop+jH9bGIqrTXnfa9
 DQB0rB2cvQuD+o4UrtlWGIbFT2v3SkdyTx+vIb1IcK2j5XLu+cqR4EOmiYsnQ3B1x1Ll
 /alg8JHvMjTuXzhZKc5pHvEy/WoAeYqdaN5Z459Mm9m5apmembWRww5kzxLAntVNLsWm
 VgLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=H22LKxt9oIc/s29MW07gH9j3Xg5M/haxMeIR9n7aSGY=;
 b=L+cvT7Sa/5MVMxXuyzCPInVTkZA6CSZ082tAR1S+e0/mVnn8hgqIJAZVs4Buhbf/MQ
 G61+go5GAZazWybtVSn8Vq2NP5RGCsnScCJYiy2xFYkanlVpwgray+MMXD4yh29dBVzR
 tPN5K2FZhEPKfahyN8h1L/iwY6II5ogJLy441aTTNtPPVF3gvzRTXhbC4lxIFeHvuM2v
 e1db/jVxs5t5f5uOfTAUIA9n54FRKCTcAzQd5eS2IJELbu824OF1ZZ3LAAbE1t+Bl8LO
 XexAbzJ539nsp8NhVUef1NBLYSNB/jV2W86Rap4xYbvKrj7b5vUlM2ZJ97CHjFIB/uM7
 u/qg==
X-Gm-Message-State: AOAM532lbw6XqOxqbDEaJeP3wWELlSz22g1fVaB3IpvNpXtzSFumATV9
 ZD8Dj2KahLSIy3r9/h6pvwqm/Q==
X-Google-Smtp-Source: ABdhPJz+Wihg1b9NNDeYZW3rp1+NUmM/MulETsta2i2RDIHTUthTxCMc7rdllEEzaGZNPm5eZtPd4g==
X-Received: by 2002:a17:90b:4b4a:b0:1bf:83d:6805 with SMTP id
 mi10-20020a17090b4b4a00b001bf083d6805mr23624593pjb.174.1647021155747; 
 Fri, 11 Mar 2022 09:52:35 -0800 (PST)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 r32-20020a17090a43a300b001bf48047434sm9881173pjg.32.2022.03.11.09.52.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Mar 2022 09:52:35 -0800 (PST)
Message-ID: <9de9866a-658a-6ecc-6e78-be6ab35dc18c@linaro.org>
Date: Fri, 11 Mar 2022 09:52:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] tcg/arm: Don't emit UNPREDICTABLE LDRD with Rm == Rt or
 Rt+1
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220311075300.609094-1-richard.henderson@linaro.org>
 <87mthw4mbk.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87mthw4mbk.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/22 06:02, Alex Bennée wrote:
> A wider question. Is this something that can be handled the constraints
> done by the register allocator? I assume that avoid direct aliasing if
> needed?

No.  We do have "allocate a non-overlapping register"; we don't have "allocate an aligned 
register pair", which *would* be helpful.

However, in this specific case "addend" is completely invisible to the register allocator, 
coming entirely from the backend's tlb implementation (or guest_base).


r~

