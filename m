Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1868625633B
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Aug 2020 00:54:12 +0200 (CEST)
Received: from localhost ([::1]:41396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBnG6-0007AH-N8
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 18:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBnFN-0006co-EV
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 18:53:25 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:36077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBnFL-0002mn-QP
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 18:53:25 -0400
Received: by mail-pf1-x443.google.com with SMTP id m8so1380148pfh.3
 for <qemu-devel@nongnu.org>; Fri, 28 Aug 2020 15:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qZMBGY1sYFrOWoXC23RgfrMfKmeOv0aCQr6EtuQHPUo=;
 b=G0POt68Ji8gQlonMjJWKCKTD5LmlzCTuh34V1n71xEvxgT1C9Z3Ilgwn1wqL/uI7xO
 4OPHbiGUEggPbJ1AE+7j8NU67cFgJMnGHMICAbsWPAszp81gfrk2GmZ4QkUDRAiheUJU
 do0D+MERfSr3IYWZa2dSa1yztzdq9N2wL2vC9iir6XC5UagTSA/w+z7Dc6vrYNHVr2Ts
 EUdg+qGsQKyNPlAiWcpo6WZvYN9IW3yFVNzUf00sbQ6GgSHTPladFzFuv62EnT7o7Oy0
 iFqI6mE+5yH3oJ+tD3ZD4uCfK2D1wczb2pRzAHDdGSL6wElD8uSVbR6RRKeUkCZIygRE
 TopQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qZMBGY1sYFrOWoXC23RgfrMfKmeOv0aCQr6EtuQHPUo=;
 b=rINJWE6iJLRKA4pamDnG+7c+R///fvMCvFNl7IFr8w8CZM6/yesh4076xRP5T2Yd+7
 uWlvPQN2rx2Rjy/Gb+Sr47z0CvdphBt7hIusx6VW5STyfV7vF2UjhkkR31d3IVbr6CSR
 fNwFdyOBNo2Q0uot51CyPsx6GhH4KLaOfWiA1K+444Qc5PCfLw4xNmaLXzfN2PV4m52R
 K2Mzzg/vzAZDux2cEEHjSnU/9Po92IklOttm4QPc131192adOV9HrZn2mPDTDSUyl/xR
 w8ojn7cP+6f8o3hMvgz3KDQFZJIzsjbj88YWoybX7dr9dvhxp0nvd2boubao8v9uCzfN
 8v2w==
X-Gm-Message-State: AOAM530DhliznCEImbuPkTqOEDNJYdNFStVMJ9zB1q8d3a/sT/tkSXvR
 sff/7w10GJVmBUyGXVHVu3M9FkoPgoD9ig==
X-Google-Smtp-Source: ABdhPJxHrYKRJpg3FbeUffv+XejmOuWANf662ICuERjhqSrGRQ2fcJXb3sKfN/j+521ShM75KxgKuw==
X-Received: by 2002:a65:6897:: with SMTP id e23mr721892pgt.103.1598655201523; 
 Fri, 28 Aug 2020 15:53:21 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id y7sm338105pjm.3.2020.08.28.15.53.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 15:53:20 -0700 (PDT)
Subject: Re: [PATCH v2 24/45] target/arm: Implement fp16 for Neon VRECPE,
 VRSQRTE using gvec
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200828183354.27913-1-peter.maydell@linaro.org>
 <20200828183354.27913-25-peter.maydell@linaro.org>
 <55675521-a61c-186c-599f-7373e9165184@linaro.org>
 <CAFEAcA87JLog+Ly5wvRi2bOvwDvFVL5mjpnkeB3h+pckbnNMmQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2007993d-9f64-dca5-5fd9-510c87cd8e86@linaro.org>
Date: Fri, 28 Aug 2020 15:53:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA87JLog+Ly5wvRi2bOvwDvFVL5mjpnkeB3h+pckbnNMmQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/28/20 2:40 PM, Peter Maydell wrote:
> The other approach would be to standardize on "the decodetree pattern
> always converts the size to the data-type size, regardless of how
> it's encoded in the insn fields", and then you could check against
> MO_16 here. Would that be better ?

That might be clearer, yes.  Otherwise it's hard to tell what "size" means
without looking at the manual for each instance.


r~

