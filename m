Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAE6370382
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 00:32:20 +0200 (CEST)
Received: from localhost ([::1]:34552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcbgJ-0006Ir-V2
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 18:32:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcbdn-0005MN-Ly
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 18:29:43 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:39888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcbdh-0000Tj-CK
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 18:29:43 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 z6-20020a17090a1706b0290155e8a752d8so2486816pjd.4
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 15:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zsEzWsN3pPAgjeAcvJd2z6Hy+m+c5yzeXbyLzkLCTvg=;
 b=VjDfcIdJnsu0xjed6V+XRvDTA2c75GtrbhQ79s/XvCUc8UPvX5DFx7F0lR/fPKW2Gy
 DPWBGQyNmSSSoilhjY1Cjy7EjD3gVxrT9xYMwJ99MnT9Q0xXBZddr7nca8g2ZicBq5ir
 RHYEDF1NWMRfIoBd+KVvMboGCS7+gejGJ802Kt9ZK/VBHTPscX4HjrIjF/yVJ+WLcOL9
 wn1BuKps2J02U/Jdrio0TyfHsXLImBM8ubGDRf7tjfM2Q82mEtnTKx1mhfZM3j4xOV42
 +BbUwMwf5Bo6cEzNPfGgy25tZEmgPb6Lbf5qa9KilJa6Px69I9ew+8z597WQfIAiISK3
 eAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zsEzWsN3pPAgjeAcvJd2z6Hy+m+c5yzeXbyLzkLCTvg=;
 b=bibPLPM/vgS7s7aHLfsOhjFCMaPWERpGtyPHi6Nd/f5kDtAJir+X7g3JW7NWykFFe0
 mZwE6EAbgEGO/nnmADpzl4ecuOSHzcivHLuOzpzD/s//EptHnJFMJ27TjLaGq6qZhxdC
 e088a+HzOt+wnPWf5A7+v9H3pILV//CRbZLZZ/7VymG3BSmAScKQ/J+Iya1BpI35fLGt
 BuKPvUao5IKUbXbieMSWongKc//MdgFQ9MWgsj9bC2QtfXND5L0hq8/jbetoapbNBgq5
 DrluE3YrOWP7N8dTSuajfi17snQdJ7sXUUssXATQCqhkFbg6ynv28gmeGq+RAS3oaymJ
 Ru3Q==
X-Gm-Message-State: AOAM533KbNpsE3AqoaGoL+p/IyKF99gG5uw+mMPbeoceEjlnMZ91je/9
 +Sx+40R+byiBJs4bnN3HE18CsA==
X-Google-Smtp-Source: ABdhPJwVmz+YbDU/lAw0cvD881PtzyA/U/qc9/UtnpanudopZ07pulj1Jqd6QovPaREn/tHSvNX3Ug==
X-Received: by 2002:a17:90b:2394:: with SMTP id
 mr20mr7277981pjb.167.1619821775752; 
 Fri, 30 Apr 2021 15:29:35 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e8sm2932244pfv.177.2021.04.30.15.29.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 15:29:35 -0700 (PDT)
Subject: Re: [PATCH v3 25/30] target/ppc: Move ADDI, ADDIS to decodetree,
 implement PADDI
To: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
 <20210430011543.1017113-26-richard.henderson@linaro.org>
 <CP2PR80MB3668052FF0C559D6D092B0C7DA5E9@CP2PR80MB3668.lamprd80.prod.outlook.com>
 <dbe523e8-3482-1ead-082a-7829c1551be9@linaro.org>
 <CP2PR80MB366816D43C01D14799FB3325DA5E9@CP2PR80MB3668.lamprd80.prod.outlook.com>
 <88c4159e-1272-43d7-b0c5-cbac16f8fbec@linaro.org>
 <CP2PR80MB3668BB4E7E2F524D3BEAC18ADA5E9@CP2PR80MB3668.lamprd80.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fabc793e-768d-5c4b-6158-0b67b83f4655@linaro.org>
Date: Fri, 30 Apr 2021 15:29:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CP2PR80MB3668BB4E7E2F524D3BEAC18ADA5E9@CP2PR80MB3668.lamprd80.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: "f4bug@amsat.org" <f4bug@amsat.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "lagarcia@br.ibm.com" <lagarcia@br.ibm.com>,
 Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/21 1:32 PM, Luis Fernando Fujita Pires wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
>> On 4/30/21 11:45 AM, Luis Fernando Fujita Pires wrote:
>>> I think we can already pass multiple files to decodetree.py and it will handle
>> them correctly. I just didn't find a way to do that from the meson build files,
>> which assume decodetree will always use a single input file.
>>
>> Oh, riscv does this via extra_args:.
>>
>> r~
> 
> The build system probably will fail to detect that a rebuild is needed if the file passed in through extra_args is changed though, right?

Oh, true.  Good thing there are patches for riscv to remove that.  :-P


r~

