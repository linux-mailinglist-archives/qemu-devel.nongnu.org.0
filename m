Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 319965F6E26
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 21:24:30 +0200 (CEST)
Received: from localhost ([::1]:34196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogWTt-0004Rg-An
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 15:24:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogWRX-0001W8-2i
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 15:22:05 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:40521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogWRV-0002x7-Ay
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 15:22:02 -0400
Received: by mail-pg1-x52d.google.com with SMTP id 2so2679956pgl.7
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 12:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=6rgfF62HogBrjGMyE15gh3RWrV5peLUPWhqCc+tfGvY=;
 b=W0s8l/qcfovYnttMPJWHG7zXPTG3qbmF1PzDTaBo8EWzsT7Wu0Gj+RgJRXDJ5sDZwN
 byeAbXbvX3cOQFwYddSnqTZg/fMe5qlxzhOeWJsW3URMYhEtny1FSNAuqc6YPjA5zrhh
 GcLlUNw5kY0/qlNwrGet0mv3T3mozmlfZ/zeO4tHrp+nua6FNzpdxrcAnrpvUVF1M65P
 iOyTtmCsu9wRWlwZ7xkNyGAip5ecrD82Jlfd0G1bVIWHMOv/ErKPN7qI/gCJIVqqvtwz
 1Fvx49Wfu0F3cpWyi9WdK8IttUHftQ5XyGE1/7mMs3K12T0kO2pg4i1SMP84195qUefp
 uiTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=6rgfF62HogBrjGMyE15gh3RWrV5peLUPWhqCc+tfGvY=;
 b=R1lJiE7KJ0yrahdWZfpUZOiJ12tZTqoPlBbLWmnw2THvMt7wqWwzjaC1dTKtr2/nwj
 L10CJU0bH5/gkZXpSL3f+/MkBNruw5j4tKw+eckCIxZE4T6dCsMMffn8PFxCrg0oZWpt
 GwvTF69zTidB+KBwASncYmcFaJJiC43gGQejdJax8QdLaWK+YUixfgvyhVrGugL+wuP5
 kVUaAqOmbYfgITnANe83bFhlP7hvrG6MBZLb6Kdm6cJkCtA2IkHXJRZJu7YkIDrR7XFJ
 VqBTAHMRBbMQUJRz95SRw3TkZBrQSgYQ9Mre5DgB5CObsotfBZdnVliDQ9ySL6I4DAtd
 R+pg==
X-Gm-Message-State: ACrzQf0rlC9+eZErDSpiKEsXO6MhI+t8EiRWzzhHEsjyMgjIYQJQTzQr
 TMGQydAxFztsjw7hGeqrtHZqrw==
X-Google-Smtp-Source: AMsMyM5leEGrrIRYAzFKXt9CiOMHWdfZUEJCy9yUcOteejdaWPVXCkkE43i19RJuDb5TdKGnk0j9rw==
X-Received: by 2002:a63:2ac4:0:b0:41d:95d8:45b6 with SMTP id
 q187-20020a632ac4000000b0041d95d845b6mr1223087pgq.132.1665084118715; 
 Thu, 06 Oct 2022 12:21:58 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:bc82:8006:f19e:85e?
 ([2602:47:d49d:ec01:bc82:8006:f19e:85e])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a170902ecc400b00179f370dbe7sm12743498plh.287.2022.10.06.12.21.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Oct 2022 12:21:58 -0700 (PDT)
Message-ID: <9fdf450f-ece9-31c4-415c-2cf93b9165b0@linaro.org>
Date: Thu, 6 Oct 2022 12:21:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 25/42] target/arm: Move ARMMMUIdx_Stage2 to a real tlb
 mmu_idx
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-26-richard.henderson@linaro.org>
 <CAFEAcA_iLb=T3Gwy6WSRzrW-LFck7rmjv=Y2yNFOwOGjP7assg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_iLb=T3Gwy6WSRzrW-LFck7rmjv=Y2yNFOwOGjP7assg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.435,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/6/22 08:46, Peter Maydell wrote:
> Side note, looks like we didn't update vttbr_write() to know about
> the EL2&0 MMU indexes ?

EL2&0 is a single-stage regime, unaffected by VTTBR.


r~

