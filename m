Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9796EC161
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 19:30:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqdXC-0003YH-7U; Sun, 23 Apr 2023 13:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqdX6-0003Xz-CF
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 13:29:52 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqdX4-0006gO-BP
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 13:29:51 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f1cfed93e2so6725655e9.3
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 10:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682270988; x=1684862988;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vy+LkO2F79FswqTFSCebBlVjFW29nE/gGmTcKIJcSWA=;
 b=GCrVmR4ASRfspC4Ba1g2lGb6SG4mIneYataz7uTV0ES6W9tprgbOdutrfFVqcHG0j/
 xjcM0QxM331HpsUTMt3JhK+RxZtSz0Ti0ygzVLhZXYSQmAl+8zvuPfnaR/wQ7+gEAZ39
 RUoyAINpgppkiWUQOt2HLK7+qStJCMWhJKj2MK3IYfbsKaeDqCC14TOMmQeAJrQNPlj5
 47TSCK7CmSpQVSUy/f6f9A0wDe6g5nlKhtBq5hrEdN3Oa0B12QFOgCJ7CiWiUheRvj8D
 x94nJgfk0WzELSVicA3ylC+zo7j6GibVudMcjYz7UyPKfBxSkVH071X2stQikqvlSObc
 2A+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682270988; x=1684862988;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vy+LkO2F79FswqTFSCebBlVjFW29nE/gGmTcKIJcSWA=;
 b=VjZQXfjrg2LoQq2inh/jyLTuirQLYnYGUyvvu7UzC9fXG0bqDqtNhBxDdz7LVhtDFw
 K2UDmKTEI1Y9F/s4RSiCV3nKRM/zQq58v43r9rXnDJKu+0LYeYXx3O1go3d0SndwgTrY
 ZnWUlr909/XDE5to4YEWxbr6jpxF6lbF/2q1wqMgR+uA+zCSFG5arldU2xDLSu09jnn0
 YTCHHs88yX58E+4IVSKouOCYDGN7hU09LPcNk0LdLz+pGeUFT5eWGdU3H7Hg0dSV8OWw
 Rv8vDtLykrlMh17A7/JemcdMjXEHHKDivA8YSl/+FvngUFUOFY7l0RNuS4Uf6Uy1p4rp
 zfpQ==
X-Gm-Message-State: AAQBX9d1LBcQjTLkdOfvrwxDZXMu3KWrFIV64YdyRrSBtiFkufS+cwDx
 QTJppwD/79ffTTAD73xweuoBZA==
X-Google-Smtp-Source: AKy350bYHHmv20hGG3dinr7mCSZuzpXp/uU1NIv5hftYis5bHobWHdeaEpafvIAbM6l7fYdgVDX/5Q==
X-Received: by 2002:a05:600c:364c:b0:3f1:95af:172c with SMTP id
 y12-20020a05600c364c00b003f195af172cmr4118900wmq.41.1682270988376; 
 Sun, 23 Apr 2023 10:29:48 -0700 (PDT)
Received: from [192.168.252.175] (8.red-88-29-167.dynamicip.rima-tde.net.
 [88.29.167.8]) by smtp.gmail.com with ESMTPSA id
 l7-20020a5d4bc7000000b002fefe2edb72sm9036736wrt.17.2023.04.23.10.29.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 10:29:47 -0700 (PDT)
Message-ID: <fe84e730-88e6-3b68-1929-758868757c68@linaro.org>
Date: Sun, 23 Apr 2023 19:29:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 7/8] cpu: Replace target_ulong with vaddr in
 tb_invalidate_phys_addr()
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: ale@rev.ng, pbonzini@redhat.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com
References: <20230420212850.20400-1-anjo@rev.ng>
 <20230420212850.20400-8-anjo@rev.ng>
 <19f888bd-f0f4-2307-90c1-744f16ca77c2@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <19f888bd-f0f4-2307-90c1-744f16ca77c2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.143,
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

On 23/4/23 11:14, Richard Henderson wrote:
> On 4/20/23 22:28, Anton Johansson wrote:
>> -void tb_invalidate_phys_addr(target_ulong addr)
>> +void tb_invalidate_phys_addr(vaddr addr)
> 
> Hmm.  This isn't a virtual address, so 'vaddr' isn't right.
> I'm sure we have something more appropriate.

tb_page_addr_t?

