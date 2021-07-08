Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE8B3C1921
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 20:22:32 +0200 (CEST)
Received: from localhost ([::1]:45960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1YfP-00044m-HQ
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 14:22:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1Ycf-0001LT-6Z
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:19:41 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:43778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1Ycb-0005vW-6i
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:19:40 -0400
Received: by mail-pg1-x52d.google.com with SMTP id y4so4590776pgl.10
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 11:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VrpEooJUBgWodBkeVy3ILwaYjivSU9o4BNbRk0T/6SU=;
 b=th0vZOJdCDsemWzE4ZdZR7POsv+O8lrR1XJxjb+v2mErzT9+l4RV88zKZFuZQmi0h+
 4Lof4WMS//kLydtHY4pUi5rGKNrMkiDm+hiVsT+cEcI9Y2eyMeTbJub5B5jSBdCacFJL
 u0Wi7kEiW7LbgEzlSfiNkRjWwNMkfIdQCwqsxQfDKFXO06zga3R9FmAG/Yol78tO4V/O
 b9RHA0mhEaHHtO8WMupTj5qILLkICd9y3+9HAFrIXb4W6FfHcEV8/vcahk8o9iWuRCEu
 XjIGA7ib7ai2zMTi16avwelVqEe0vKXHO5vID/Ay6+gORc7YHr9K8Cki+iuxpEs3p/x/
 bXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VrpEooJUBgWodBkeVy3ILwaYjivSU9o4BNbRk0T/6SU=;
 b=f4YUXvGaf9+Z3FMXqLGb9kwpJFerRFilWKaPuZIz/7RpWHTjBQ89PE6QbY1ivTdYQv
 EsvjXZwfhfd5bIPaDkBo/tSjzWyD2l99FzirMwIXjjPVE/j8KikGB5UJm/FRYld69gLK
 unTBbxBKB9+KMC+U5IEbK+GPpcS4lBQ2bquIisZKn3T58WVpeApnnM+bxiaUPsDUPVzj
 LtXOKZdN+8QiAocKPWBm3Z4Qjh1/PBWo1Y5BaxteePi3vrhxP9nfFO7zA2lvc5Z+U0eV
 HbhFTBSkf7PXAuaGLPMH0A4V/YA/HUF7s4tNPQQVfX8ACI2G2AiGbRjoirAmn81B5052
 s8Fw==
X-Gm-Message-State: AOAM530Q47jw9mklgNfBKZknFgf6J9biDsWg4/bb1u/uusfDwk+eUarx
 IBiLmvV4KEzLI736uaKkTLjaIw==
X-Google-Smtp-Source: ABdhPJxZclmjkZSbLH8qOsBU2iNcTzKPvsSsPN62wCQF7KRT350E5HjUlCj3VLKj24OgzsGbLWCoQQ==
X-Received: by 2002:a63:e604:: with SMTP id g4mr33164000pgh.282.1625768375380; 
 Thu, 08 Jul 2021 11:19:35 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id c13sm3326942pfo.211.2021.07.08.11.19.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 11:19:35 -0700 (PDT)
Subject: Re: [PATCH v8 3/3] target/i386: Correct implementation for FCS, FIP, 
 FDS and FDP
To: Ziqiao Kong <ziqiaokong@gmail.com>
References: <20210707222452.591810-1-richard.henderson@linaro.org>
 <20210707222452.591810-4-richard.henderson@linaro.org>
 <CAM0BWNBMHvokWceJadbEp+5C+8FZmBDy44vztFu9bsKCh0mNXQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <665079c7-b4b1-5a7c-9212-09fea5ed8844@linaro.org>
Date: Thu, 8 Jul 2021 11:19:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAM0BWNBMHvokWceJadbEp+5C+8FZmBDy44vztFu9bsKCh0mNXQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/7/21 7:24 PM, Ziqiao Kong wrote:
> Hello!
> 
> Thanks for applying fixes for me. Is there anything else I should do?

No, all good.


r~

