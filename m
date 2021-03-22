Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 665D734491E
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 16:20:15 +0100 (CET)
Received: from localhost ([::1]:45112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOMLm-0004Au-E0
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 11:20:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOMFZ-0000ua-K3
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:13:49 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:43668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOMFV-0005m5-5q
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:13:49 -0400
Received: by mail-qt1-x82a.google.com with SMTP id s2so12552434qtx.10
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 08:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hetBlz7c0fabQ1NKd7qf2+1VqDTEOnGYPx9uRGG/E0E=;
 b=E0EIChz6Q3oxifs5Wa45Ip5a6J+oqj7DUR9SSsk9q10J2Uo4GqfXvoeBoU/PnfDxjy
 EzXxcqn39BOhWKt7f/jZPekAe22hoQRp+WRcu27V0GlHAUaEmS69T8HPhrd5LO6zo2Rj
 wbPgLRczXdkRvdMKIqNU3IcBoN6kji+nI2BL4YzJNocrcniduJhs4/dLReLKF5Bu2kjO
 txi/owqxR6qY16l1Jd9F6O+iGmtxlZ/qPTUDVWuv9DnlrjfcDfFtEkSu4E5Ny1Qf2X0A
 JZtqJG7TpW8QSUlrQuwjQPS/q7xjG+ihE+SPPqp/5FC8tFpIG61/RCe5gFad8ec/bTyQ
 kWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hetBlz7c0fabQ1NKd7qf2+1VqDTEOnGYPx9uRGG/E0E=;
 b=LRJikRv5jNzmThhFPqWQva+CosrhfACEpyGnto0PyOpdFmQ+Ub+zeIvWJDmyR9/tnq
 AL5kGLYY5LgN9a15NTl5COBT7Yc8jgfEMeHn0JXZuz/Bcm2j3GUw82k4GdqNOoKMz7gG
 tTeRyyTth7VotnvFfQAsmEcZL+7P4m0uT9YIuyOn6evgz7hypVhPVrK/F+fKkBdq/FjM
 HZSrjmGkql0rBmPUdNFWPykwfKxmSv1KyUagVj98FR4YcSJD5blmYffLFoCo6vd831S+
 aoVR+J6ITQTUA3eCbV10nQL0ZQNm4uCfWidllJSiKGWHbFcBbyjd5RmWRPlqsR6OvDcc
 TI/Q==
X-Gm-Message-State: AOAM532WVcdmsjE1ZR7XsGrSywvi/fp2in15+TxQKu2ZewMl5EJMzz+t
 43jmUC3d7dCeme0/DFlQQXdKhg==
X-Google-Smtp-Source: ABdhPJw4UavCzlNM8sSDmhuc/DhgZMmR/zx1kUxfTmHmXPfsQ+hycimeUG1lz/pstNfgWpH0wM6Oow==
X-Received: by 2002:aed:2e62:: with SMTP id j89mr353004qtd.310.1616426022754; 
 Mon, 22 Mar 2021 08:13:42 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id z5sm9306509qtc.42.2021.03.22.08.13.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 08:13:42 -0700 (PDT)
Subject: Re: [PATCH v3 for-6.0 1/2] tcg: Do not set guard pages on the rx
 portion of code_gen_buffer
To: Roman Bolshakov <r.bolshakov@yadro.com>
References: <20210320165720.1813545-1-richard.henderson@linaro.org>
 <20210320165720.1813545-2-richard.henderson@linaro.org>
 <YFiiBAwESsbf2lOZ@SPB-NB-133.local>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <da13f32f-97d3-df87-286d-d12b1eff8520@linaro.org>
Date: Mon, 22 Mar 2021 09:13:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YFiiBAwESsbf2lOZ@SPB-NB-133.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
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
Cc: qemu-devel@nongnu.org, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/21 7:56 AM, Roman Bolshakov wrote:
>   - What does mean that rx might be covered by huge pages? (perhaps I'm
>     missing some context)

Huge pages are where a single level (n-1) page table entry covers the entire 
span that would be covered by m * level n page table entries.

On x86, this is a 2MB hugepage, vs 512 4kB pages.  Most modern cpus support 
something similar.

See qemu_madvise(..., QEMU_MADV_HUGEPAGE).


r~

