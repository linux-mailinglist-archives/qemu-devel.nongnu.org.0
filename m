Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD275701B0E
	for <lists+qemu-devel@lfdr.de>; Sun, 14 May 2023 03:25:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1py0T7-0007te-Jf; Sat, 13 May 2023 21:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1py0T5-0007tG-7G
 for qemu-devel@nongnu.org; Sat, 13 May 2023 21:24:11 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1py0T3-0004t1-Ey
 for qemu-devel@nongnu.org; Sat, 13 May 2023 21:24:10 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-53202149ae2so376010a12.3
 for <qemu-devel@nongnu.org>; Sat, 13 May 2023 18:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684027447; x=1686619447;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jPGM3MqseMnQjncWi8WsTuDPPlTK1Qbi+ea6EUXRNnU=;
 b=hOdsq8qbnNyT3TYspWlhekdXHkNyV30qCOv+mAf+Bg6SnLncIGzVj3erTn2EVRjYNu
 oj6Whr9AfiY6UmVtfem/04U15HyFqPaxs2IG/MsHImW5zbH8tJNYiC7ZAAyxcolq3OIl
 eEaievukbFiBL9fsRXeU6S0zOLMs23ci7uCZQqH7/L+ztQ4Icy/Y3o9RzKQHuES6n2MH
 4LbWnlPTzyZ2i3ckqFN+fBHjQM/mQy4XM8SC8rfdfGEK2q/pVm8M1ytQ7DLVRSEvy37s
 ftDSKyWDhIkCz3twpu09VJoYQAbJw81OioMtX+3yyzbBlmcHA+AYTZ7tM5PLoMFZ16F9
 Wr1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684027447; x=1686619447;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jPGM3MqseMnQjncWi8WsTuDPPlTK1Qbi+ea6EUXRNnU=;
 b=JOfMQeZFe3QoVhOuHfPCDsGDmj32xowuNZ4HeT1aQI/WlzrJQ7QWDsZHeXi2lUkewP
 nHdKD7xu2CNrbUyfuKo71dP+zjCcSNgbRDOJ+4XUpml0zpYNZnB679Yu68eyC3Izezad
 Sw2PeIbv1qAnxcbC0OOpwjTp/7XcX0AZpyrK/u0QBTAfCCG83opbbeIAjhRgAD7o9XOd
 Li6LfsCTj+QmLrlcktCES1mMyy/CJRD+aMuEOudKJe+tHozQ2hUYn4igSyZlXlGvDs1+
 P9OUBH/EIDz0LyEl66RCgHXDRP0z8/ieBRl2MwarWD4gHN9sepC+p0ydp56Z2SrET7jk
 VaMA==
X-Gm-Message-State: AC+VfDxQFSPakIDEFbRocaaYPJik6YoyOkJGf9P2JqI/QmQW3D+gWVm8
 qo08iIpGl9fbtbXEp80CAI0jwg==
X-Google-Smtp-Source: ACHHUZ7JSNjQqvQa2o1C/hEw4gnffW+4feFA9Z6hmf8GTT1ERbImECJE4DSJXnxsxfvKAsHdXbeFdw==
X-Received: by 2002:a17:902:e5c3:b0:1ad:fa2e:17fc with SMTP id
 u3-20020a170902e5c300b001adfa2e17fcmr4635409plf.2.1684027447085; 
 Sat, 13 May 2023 18:24:07 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:5b03:bb2:1811:391a?
 ([2602:ae:1598:4c01:5b03:bb2:1811:391a])
 by smtp.gmail.com with ESMTPSA id
 jj18-20020a170903049200b001ac2f98e953sm10394001plb.216.2023.05.13.18.24.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 May 2023 18:24:06 -0700 (PDT)
Message-ID: <c01de2fb-85c6-ce08-3e33-0e7861434ebd@linaro.org>
Date: Sat, 13 May 2023 18:24:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 0/3] OpenRISC FPU Updates for 8.1
To: Stafford Horne <shorne@gmail.com>, QEMU Development <qemu-devel@nongnu.org>
References: <20230513080534.580800-1-shorne@gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230513080534.580800-1-shorne@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.923,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/13/23 01:05, Stafford Horne wrote:
> The following changes since commit c1eb2ddf0f8075faddc5f7c3d39feae3e8e9d6b4:
> 
>    Update version for v8.0.0 release (2023-04-19 17:27:13 +0100)
> 
> are available in the Git repository at:
> 
>    https://github.com/stffrdhrn/qemu.git  tags/or1k-pull-request-20230513
> 
> for you to fetch changes up to 874c52991e1fbe020812b4b15440b6875369aacf:
> 
>    target/openrisc: Setup FPU for detecting tininess before rounding (2023-05-11 15:40:28 +0100)
> 
> ----------------------------------------------------------------
> OpenRISC FPU Updates for 8.1
> 
> A few fixes and updates to bring OpenRISC inline with the latest
> architecture spec updates:
> 
>   - Allow FPCSR to be accessed in user mode
>   - Select tininess detection before rounding
>   - Fix FPE Exception PC value

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/8.1 as appropriate.


r~


