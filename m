Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B1C5EDDB5
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 15:32:31 +0200 (CEST)
Received: from localhost ([::1]:40364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odXAn-000062-TL
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 09:32:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odVLc-0005e3-IR
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 07:35:33 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:51852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odVLZ-0006Dq-LK
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 07:35:28 -0400
Received: by mail-pj1-x102a.google.com with SMTP id u12so3691644pjj.1
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 04:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=r8IqrwMJaYmHX+XSsXZZnvJxUXWIfyI1O0Jpp/SCUuM=;
 b=sa8o3Siu+N4SCQthb5DVmc9zB+tNikThSTIZsThQRq6E/7IBOnANnKCALUq09YhA67
 6aX3y1glx7uKJUEstS71D+e8wmVp3aThxJjIYIXBDhd0JIXslucrpavVisX+JDbd2Qk7
 Ca+7r7YLZxrEY429R8X+7XTBpfZ8FeP0VLzVimz3D5xP1gXRzBfPsRQzEUn8S0w0cOWK
 fDNbzkX114dl30KaGyYWCi0/ridIoQ17mb57YfLPjDz7GyPlU+6a11N8R984tXsuIKv/
 0jXWz0inaTj/1OlZgyoBCWiPGJeG5CZ9YLR0qGzdP9+izLVMFXhLNXpf/2WUDISgJ6uT
 yisg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=r8IqrwMJaYmHX+XSsXZZnvJxUXWIfyI1O0Jpp/SCUuM=;
 b=s4ajyppLOUTV07ZHEpY9GFe0BwpOXzqrRUBcYZU/Lv/ORPL/EJ/pJI81LrETNnmb+o
 PVdtVNtO3Q3+MoJYfuoYml+vQ+1+Q9QKc9efkBSmM9ISTnb2brxnXxvUussUe8xeuOPh
 lqgWTz4YHZa+Y0I8oD51UwSkPVvXugddKsNlLfUFyaEpiafpWy7/W3+QVuSLQm8hf0LI
 DnuOMQm2tMf2qFrTkv0zGTfwVcNp1cZf65/3+xsWboiEzDy0eaAmleV+EdKJfJwqlPki
 fWuq8SHxFvi+0HjtULam1HKXMl1RQ76/hKqfMGWTQDwKw+XeKnSE4Y3YbulBPOYGryF1
 0R7w==
X-Gm-Message-State: ACrzQf2ij274m3qz3KJtGVHCrYQj8yiF2NeuWTFMxNSCo3Mn3XGc0kP/
 iBaLbkdt1JvwwdlYdnS6ZJrDgQ==
X-Google-Smtp-Source: AMsMyM4GY/2SAjjqoXzkxkDl3lq4E04+Gm2JQLojZTFjPHQc6a2f7wh+zd4RlS2ZgdjrUmoXmS0K3A==
X-Received: by 2002:a17:903:124e:b0:179:da2f:244e with SMTP id
 u14-20020a170903124e00b00179da2f244emr16005059plh.169.1664364923611; 
 Wed, 28 Sep 2022 04:35:23 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a170902f78f00b0016c9e5f291bsm3414626pln.111.2022.09.28.04.35.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 04:35:22 -0700 (PDT)
Message-ID: <dc6f2278-6a0f-b04d-c50d-e5e6e6111ea2@linaro.org>
Date: Wed, 28 Sep 2022 04:35:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] linux-user: fix bug about missing signum convert of
 sigqueue
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>
Cc: fanwj@mail.ustc.edu.cn, qemu-devel@nongnu.org
References: <7819f62a.51d7c.182f21781c5.Coremail.fanwj@mail.ustc.edu.cn>
 <9bed9eaf-1b30-27d8-42b9-332a62f2922c@linaro.org>
 <bd9994bb-86e9-4518-f61d-a34f33e4bef9@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <bd9994bb-86e9-4518-f61d-a34f33e4bef9@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/27/22 00:36, Laurent Vivier wrote:
> Le 05/09/2022 à 19:54, Richard Henderson a écrit :
>> On 8/31/22 05:10, fanwj@mail.ustc.edu.cn wrote:
>>>  From 4ebe8a67ed7c4b1220957b2b67a62ba60e0e80ec Mon Sep 17 00:00:00 2001
>>> From: fanwenjie <fanwj@mail.ustc.edu.cn>
>>> Date: Wed, 31 Aug 2022 11:55:25 +0800
>>> Subject: [PATCH] linux-user: fix bug about missing signum convert of sigqueue
>>>
>>> Signed-off-by: fanwenjie <fanwj@mail.ustc.edu.cn>
>>
>> Queued to linux-user-next.
> 
> I'm preparing a PR, do you want I take it?

Yes please, though I may have been too slow for this one.


r~

