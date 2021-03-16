Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6917633D680
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 16:09:00 +0100 (CET)
Received: from localhost ([::1]:46282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMBJb-0000Wv-Fm
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 11:08:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMBIK-000882-04
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:07:40 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:42629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMBII-00039I-B7
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:07:39 -0400
Received: by mail-qt1-x82c.google.com with SMTP id l13so11860658qtu.9
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 08:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mU2UTvC2h1JsJsvg+raT6xisMpRUMwtOBVGDb4u75UA=;
 b=LRPrHWSlZj314Ih0AKT3MW2crTK5loj3PhrvsxHQDY+nRatyh2onWe33aLHIz4vgP3
 ApoyCiwdt6bTRTdJMX/YByNVUsuTdHlupM2tAvLOgJjdgGbq0d4DPWxQfS3diSzFGkPA
 mCGwjn0drEXNtAlOc2mdIAAEbacvgJKejmmV2lcNWg5HVYwsQqMTdnKzRFv4EKado7jE
 0jnDqnKMSpdmR87GgdT+FbD1Nh6hgHFHO8673sRbWFxbyOVmhJk2Sa8WucOZW9ZCqkjY
 cbJ5GEaJaeRFZny+ut79TyJEslCBEDMLX1xfZ/D5pnvbotgPh1sfxS/H1ZMAESiVb+0k
 MK+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mU2UTvC2h1JsJsvg+raT6xisMpRUMwtOBVGDb4u75UA=;
 b=WnzRhzhlkQnQu0ADvvh8Po2WN3U41QHvSMW57sUorL1djbRlc2AuvHBmdyN98ukbr0
 DBGh1Fq+0OCxSj52zpCEHIVeQBE75UVdxB3g/e8RtFngwcv5z2+lLOWMMQigzCZr61Ri
 U7VBljPyWmfRiazSVMNhlfugoRg8y/XWhNR2AXU1MVARaSVLbGJaOvJToQt6QHHXwpjn
 C4jzOWTjk/njbsMLuMFIpbGbsWg4eZApex3boVhiqr0bWJbg8RCMV2K/oVNG2oPnM5ZA
 W8uw8mMlj3d7pCynm/l2qlCCGRobuehTErflO63AFfyVklspVDCk4WfZHdethWZURwb2
 VHqQ==
X-Gm-Message-State: AOAM53297IJqjkPHYbpDMa9vr/wwLv3f1CyHGB6g0HDb3M1ESSnw8Zev
 /2okiXSup1TdfIxXrMmajP0OLFkk3xFWLELN
X-Google-Smtp-Source: ABdhPJxZociFQClvwHRMuoAtJdjloVQuHcpFsv72LpdgkkRx2iOHhdqGRGSU7BW82j/fA1aSFpN1fQ==
X-Received: by 2002:ac8:44b2:: with SMTP id a18mr89634qto.285.1615907257230;
 Tue, 16 Mar 2021 08:07:37 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id b22sm15422110qkk.45.2021.03.16.08.07.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 08:07:36 -0700 (PDT)
Subject: Re: Bug in tlbi_aa64_vae2is_write: tlbbits_for_regime called with
 swapped ARMMMUIdx_ values?
To: Rebecca Cran <rebecca@nuviainc.com>
References: <54fb8499-0758-a554-6103-5b56d784fda3@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fd1e329b-1a1e-f669-95aa-9a35c5311a08@linaro.org>
Date: Tue, 16 Mar 2021 09:07:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <54fb8499-0758-a554-6103-5b56d784fda3@nuviainc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 11:33 PM, Rebecca Cran wrote:
> I noticed the following in tlbi_aa64_vae2is_write: it appears that when calling 
> tlbbits_for_regime the ARMMMUIdx values are swapped?
> 
> static void tlbi_aa64_vae2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                                     uint64_t value)
> {
>      CPUState *cs = env_cpu(env);
>      uint64_t pageaddr = sextract64(value << 12, 0, 56);
>      bool secure = arm_is_secure_below_el3(env);
>      int mask = secure ? ARMMMUIdxBit_SE2 : ARMMMUIdxBit_E2;
>      int bits = tlbbits_for_regime(env, secure ? ARMMMUIdx_E2 : ARMMMUIdx_SE2,

Yep, good catch.

r~

>                                    pageaddr);
> 
>      tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr, mask, bits);
> }
> 


