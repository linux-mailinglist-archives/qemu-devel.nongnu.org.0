Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAF1316F7F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 20:04:01 +0100 (CET)
Received: from localhost ([::1]:48082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9umN-0004bD-AN
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 14:03:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9ukg-00046r-M6
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 14:02:17 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:45084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9uke-0003Nd-GD
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 14:02:14 -0500
Received: by mail-pl1-x62b.google.com with SMTP id b8so1713316plh.12
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 11:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WTyd5Siaj2+GtN+nhGIsMjM1WMLt66awV2Ljp3YtNWc=;
 b=caP8mHraYa0EGreHq/mYdLbalcyaU1XOoZgF94pLxOqqdfsN/vl0wCp7WMkg/7O7Dx
 20/BSBjqmbjwKPCG2XntntPW2y9U5EpQCa17PU2v6hRc1uTTiKVqSxWHBZ5+BrjOrfLf
 SkHf2IaSxZT/YNRd98y50eu+J6qXa9k/+ibf42vLNHLUDU/EhApLLr3Wz9QX9X6xrYAp
 fQs++RmWReAFOmc6fKfSaZw/hHJvGF/IDLXvCF70IXiGNfOTz3dRM7Ycx/qug8RYEOzy
 XFVCuWbw3AxHUCFoTyWN0Hhd3TLrpny505etVoA9xC1P/HrS2xBOOAVDeRJCOY79I612
 ADpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WTyd5Siaj2+GtN+nhGIsMjM1WMLt66awV2Ljp3YtNWc=;
 b=b/dPpBfw5hNnkolLjbV6wLffenjRnMlg39cZl/EngmxlprjYh2OEL11Dr/EdiPX3Wa
 gKXGeXo1Uc5g1HS3fsXTy0U6q5VVYpC8+5oJ6ONsMVe4s4z8ZdyH7YHEuphVs5NkI0/f
 nM3AzEKvoCUJUVD2Ge0U0jrSkGfTH+DRT6rMFZbxmjUrHZmfZxyS/KP2yQ/FlAty9Ix1
 szu0toZMtOEzkkJJrM5MJub6eXfgqV1vL/LxriyeJDtv637coMNu6481W7t8Eebvb6bF
 FCfuBSwaN5AOCcqmhnEmc31NGOhcVGhu+leDV+zwgX4qFtCWASnSrQiB312J15Jj35q7
 TkOA==
X-Gm-Message-State: AOAM531ovBhcyjGtlpvH52yxaXSUd0OVv6xnoKT/EQLt8JjH9fYSrB22
 12VNrX0TXkJZpSuoUHuEVFwsJg==
X-Google-Smtp-Source: ABdhPJydQShIgVOyFYrBp7/lrZmwr3i0a+feEGQ/cPZatyFXb58EHHa49tjWBVz7+SOH73yJhoAGrQ==
X-Received: by 2002:a17:902:6b45:b029:e0:7a3:a8c with SMTP id
 g5-20020a1709026b45b02900e007a30a8cmr4411858plt.1.1612983730363; 
 Wed, 10 Feb 2021 11:02:10 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 b17sm3010726pfb.75.2021.02.10.11.02.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Feb 2021 11:02:09 -0800 (PST)
Subject: Re: [PATCH 0/1] tricore: fixed faulty conditions for extr and imask
To: David Brenken <david.brenken@efs-auto.org>, qemu-devel@nongnu.org
References: <20210210082650.5516-1-david.brenken@efs-auto.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c2854d29-8926-ae13-fbf7-77197728ae96@linaro.org>
Date: Wed, 10 Feb 2021 11:02:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210210082650.5516-1-david.brenken@efs-auto.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.211,
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
Cc: kbastian@mail.uni-paderborn.de,
 Andreas Konopik <andreas.konopik@efs-auto.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/21 12:26 AM, David Brenken wrote:
> From: Andreas Konopik <andreas.konopik@efs-auto.de>
> 
> Hello together,
> 
> we have fixed a few conditions leading to incorrect intermediate code
> generation. RCPW_IMASK, RRPW_EXTR, RRPW_EXTR_U and RRPW_IMASK invoke
> undefined behavior for "pos + width > 32", which is also checked in
> tcg_gen_extract_tl(). RRRW_EXTR_U invokes undefined behavior for
> "width == 0", hence we removed that condition.

This is incorrect, because "undefined behavior" should not include a qemu abort.

You could raise a guest exception, you could treat the faulty instruction as a
nop, you could truncate the inputs to avoid the abort, you could write
0xdeadbeef to the destination.

Or you could fix the couple of faulty conditions and leave the rest of the code
as-is.


r~

