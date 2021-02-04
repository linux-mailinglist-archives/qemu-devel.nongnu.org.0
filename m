Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EAD30EAB4
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 04:11:50 +0100 (CET)
Received: from localhost ([::1]:39936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7V3d-0004zn-Mz
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 22:11:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Uaw-0002n9-VD
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 21:42:10 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:50855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Uav-00042q-BI
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 21:42:10 -0500
Received: by mail-pj1-x1035.google.com with SMTP id cl8so851768pjb.0
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 18:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=I55MTN5yNBYEDGrUiTuBPIT8GSmSrwW/ZOFxiXJ44c0=;
 b=V9DMW/AlwG7PFatvi+wKVwg5UWkpDhG7C4QL3ObZmL10xtSsMUAbW/rtVt/t22ZGOf
 jMI7ujhC5NaBZPmRX+Hdpk9CqR1CazGBWDtnlDj+I77xIacIm5xhghG4mG390xfGowAA
 GL+fvm+DdXVednpWVR5Y/G6DV2tf3l7puUDoFGneMLbQer9Gnv1APzJOpHjzOquV1ZGO
 KoQAY0wUqgGmWZucjwLN5CfHk1BotTWacOGhXXkwBp5OgzmyPH6ClTYNGbKCRTm+pqSb
 lu7p/eknixPPy1ENVC/WGxYZZqh+qjOvTnLRUMBBWEFvWz9FkbxnWdBukmQ0WuWvazSu
 6BIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I55MTN5yNBYEDGrUiTuBPIT8GSmSrwW/ZOFxiXJ44c0=;
 b=n9iitNzEDlSbQmcWSoYJGQcaTGzalZjmVnucMz9cdYm/WzQHwLON4XV/6o30WVYcFt
 KRrkWLywJqxIiSaaJZKEKB9pix8k5XIJatETzAcjqVUYY8e+xAujY9KPPhi8uLZhyJkU
 ESNQ2+eJXuLDqAWjFk12aJOnf/TSqWbqCL8JBbwONnMY4yKYlSmeYaNimWf4cQGe5Zh2
 N9eqUKOpV5fgFaRsIM7fOtq+jPifg0WWoky6zsK1wEKEm8Onhrj8XXGj6aiGm1Q9m+Xv
 33hgXgVyvfnwnF654dvk9xLKmvxZjr24hJhOExB8s85OcZgavQfGh7rp3Fla9G7Ua2Yc
 JoMg==
X-Gm-Message-State: AOAM532yjAPRHCm9plK/DeoRLewVxFlXJPEQPUEuzXrskKstLJESofEh
 yLxZvVqalemuXdGJdHwXICpuAw==
X-Google-Smtp-Source: ABdhPJysYzWDrZVwT6NYskxiYZDQND2S0Fc2iUF8oqL62pH37TM1qUZpSpsmybtYpp4UavvqCqnfYw==
X-Received: by 2002:a17:90a:4fe6:: with SMTP id
 q93mr6075995pjh.16.1612406527990; 
 Wed, 03 Feb 2021 18:42:07 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id lr7sm3274745pjb.56.2021.02.03.18.42.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 18:42:07 -0800 (PST)
Subject: Re: [PATCH 3/5] target/sh4: Pass mmu_idx to get_physical_address()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210127232151.3523581-1-f4bug@amsat.org>
 <20210127232151.3523581-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4eba66bb-f970-f112-d3fd-fc368cc3053d@linaro.org>
Date: Wed, 3 Feb 2021 16:42:03 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210127232151.3523581-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.178,
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
Cc: Joe Komlodi <komlodi@xilinx.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/21 1:21 PM, Philippe Mathieu-Daudé wrote:
> get_mmu_address() and get_physical_address() don't use their
> 'int access_type' argument: remove it along with  ACCESS_INT
> in superh_cpu_tlb_fill().

Sure.

> Pass the MMU index along, as other targets do.

But if it's unused, why?


r~

