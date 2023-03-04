Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E826AABE2
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 19:33:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYWg4-0006SX-C3; Sat, 04 Mar 2023 13:32:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYWfs-0006S9-OJ
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 13:32:05 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYWfq-0005Wq-CU
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 13:32:04 -0500
Received: by mail-pl1-x634.google.com with SMTP id v11so6082810plz.8
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 10:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677954711;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bulkSGPJ6VyVftI1vRqgnfVnT39A3+JTLAfb6Dzyx/g=;
 b=SR7Cx29BsBZEsSTCsQ0nrVyAO1eV3QIOltcu9yFTc0a5quymmvqF52ZEmqJc9qz4dK
 SVO/udn/aB4fP1edy/h4aGq4YfCV0ufjMyl4wGR2yPAdCPrKfChZp7Uv3E/kFcvStRuh
 KsgEP+n/biQnaJHNIN8XTkaqSU7ZzuNEK/rTPVZ77gG+B1+56JR581SEflwAnNnR/Ox2
 jKSBKk0Bprs+5MPzzk64QtUJIFDToQcQK0V5XBrogsPTMPDVu9aQ1ssLcmqWwg74B35a
 6Z0JcPi8hkNELSiAPBlramoNNVy6MSh94fVa/yxHGyIFfvX66/POvSLc3sv7rD13vmL8
 b3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677954711;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bulkSGPJ6VyVftI1vRqgnfVnT39A3+JTLAfb6Dzyx/g=;
 b=qEiIlg9fxJxL4VN+os5JjnCdzos20va8l2AoB/uJxSvVYtlfUGZMuTGSPZlO+cGpMW
 jNaGmFFpVpHWir9L2G1ftLiGSgVonF8R7Z4gdT5kitU5KSlD137vkUCbCrcgoJCvnDj1
 JMcYI4PiJTU2h8+CKLwEl5VLzmDYfXeoGejLBsqXfreJHeuCXqQ4CQ+CWeXo1HJS8tnQ
 MIRjoYbrs2AQR2Gl53a5xusBowWf+DudVlyR7iJHHSLR0NkCFR+ERzKhwEn1ABMNrKol
 fFBtUZIpPJFHz70vwhUSevs2TKoO3RGYSsru//7js5P6bZkyu3171BGI4PRs86eyvnVR
 7P8A==
X-Gm-Message-State: AO0yUKXYlhegJ/M5t9u15p2qSMcHo19H3c5B37FEcqyDe8VS7O3vtWDf
 wJQ6MEeJqEQqFMp5BIqu3tf2vg==
X-Google-Smtp-Source: AK7set/fJFlwn9FY1/GKiH2p0Rm0aO3rEcZ508s5sBOfHkEJo69d6bVmqZCKKo0WdoJ2ktezesNuFw==
X-Received: by 2002:a05:6a20:7348:b0:cc:9010:9ed with SMTP id
 v8-20020a056a20734800b000cc901009edmr7113466pzc.31.1677954711036; 
 Sat, 04 Mar 2023 10:31:51 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:62b1:64d8:8207:f04e?
 ([2602:ae:154a:9f01:62b1:64d8:8207:f04e])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a63d94e000000b0050362744b63sm3480681pgj.90.2023.03.04.10.31.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Mar 2023 10:31:50 -0800 (PST)
Message-ID: <0c4191e0-5bea-340c-cf9d-1da4745ded2b@linaro.org>
Date: Sat, 4 Mar 2023 10:31:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] tcg: Link branches to the labels
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "anjo@rev.ng" <anjo@rev.ng>
References: <20230303223056.966286-1-richard.henderson@linaro.org>
 <20230303223056.966286-2-richard.henderson@linaro.org>
 <SN4PR0201MB880817781D443D160C6EF817DEB39@SN4PR0201MB8808.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <SN4PR0201MB880817781D443D160C6EF817DEB39@SN4PR0201MB8808.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 3/3/23 15:26, Taylor Simpson wrote:
>> +/* Generic ops.  */
>> +
>> +static void last_is_label_use(TCGLabel *l) {
> 
> It would be more clear to name this function "add_label_use".

I've used "add_last_as_label_use" to emphasize where the use is coming from.
Thanks.

r~


