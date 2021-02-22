Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D15D232108E
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 06:53:44 +0100 (CET)
Received: from localhost ([::1]:38806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE4AB-0006Tj-TY
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 00:53:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lE48q-00061Q-7S
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 00:52:20 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:50763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lE48o-0002Vg-5m
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 00:52:19 -0500
Received: by mail-pj1-x102e.google.com with SMTP id b15so3214162pjb.0
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 21:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JN/H/geFmlRm4YVMe7naT9YD/uaHfJ2uG4nmn5mzalY=;
 b=r//GT612xpfWz8431dB59QiNXZrjy5rfPaUDTdzGX1erHMk9F9vwrdvFSI1oRTD+ph
 c6ZrSyOAy+YjpF0hhXVTy+oGzj/MI6H/IqBvMQmjCs5ji9Ln5LPTdFhg2x0UYYi9GicC
 XAkewnbK1bm2UvA5teJmqyvVmC5WTi8JkYArXzhVWZYejQ6iKS+slucg4C2cK4G4QmNk
 nPaJZABk/kefhSpILk3dJuhkmXTrppj+0lTaKNarhubeddNce9zA6iWwkm7+tjPjei2N
 ThiPFsmJC0xrLpCWyDz4+TUX5ORB1YAKVNLyxsG1sw18AzJ0aOOtKwtCQy5Dz/LWi05Q
 W99A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JN/H/geFmlRm4YVMe7naT9YD/uaHfJ2uG4nmn5mzalY=;
 b=WoB+nS04v6NKkyGN5/xXYGswWgfVNTe1Jrwb/QS7y+rqXIp3/0//z3TtdjslkcEVXK
 wdJrK5qp3aFN2UorB6eRDPaZSooI8VcxvmmGDp0C06/5fCES7XV4Q2r9wtCW0k3Z6P6I
 mKf+jlXk/DGKiMdeaNBzcJ0nRhDpH0rJes8e2oSTyLdse6V3GJGhgvNDBSXJfnbDqahO
 fKeLIanPWtZb7CPPFsd/SbGpCOEnf7yma3fZ5A0OI8BjS6elrMt5dL12MFLunoeDPTlQ
 ZK5kpTs5EYqlTKrV3uaWE/QsDnS8jhXj4g+QOFWcZgS/RDsEojalr6IvPLKk5TabBuug
 9cHw==
X-Gm-Message-State: AOAM531h6TZP+aOMkLkYTIs7CqBz+FcYxyTBmp/fvLFh4L0f2NitnoiE
 UmMrnhVBLnqcyb3yP7VQHQACNHFBiZ8Kww==
X-Google-Smtp-Source: ABdhPJzH4QHze4/1KT+sYWVLCyAzWh1UXLn/fjGvwkId424i2C9y2iBOCmeFYgX7b8NqiJaLAeBm3A==
X-Received: by 2002:a17:90a:5d8a:: with SMTP id
 t10mr21219737pji.144.1613973136662; 
 Sun, 21 Feb 2021 21:52:16 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id lw4sm16038787pjb.16.2021.02.21.21.52.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 21:52:16 -0800 (PST)
Subject: Re: [RFC v1 23/38] target/arm: move arm_mmu_idx_el to common-cpu
To: Claudio Fontana <cfontana@suse.de>
References: <20210221092449.7545-1-cfontana@suse.de>
 <20210221092449.7545-24-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <32486388-0f63-770c-ec21-02c7df246e64@linaro.org>
Date: Sun, 21 Feb 2021 21:52:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210221092449.7545-24-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

On 2/21/21 1:24 AM, Claudio Fontana wrote:
> From: Claudio Fontana <cfontana@centriq4.arch.suse.de>
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  target/arm/cpu-common.c | 51 +++++++++++++++++++++++++++++++++++++++++
>  target/arm/tcg/helper.c | 51 -----------------------------------------
>  2 files changed, 51 insertions(+), 51 deletions(-)

How does this escape from tcg code?  I think this is indicative of something
else escaping first.


r~

