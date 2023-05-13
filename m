Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2286C7014AA
	for <lists+qemu-devel@lfdr.de>; Sat, 13 May 2023 08:37:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxirg-0006E4-PO; Sat, 13 May 2023 02:36:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxirc-0006Dn-Qt
 for qemu-devel@nongnu.org; Sat, 13 May 2023 02:36:21 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxirb-0001wx-7n
 for qemu-devel@nongnu.org; Sat, 13 May 2023 02:36:20 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f50020e0f8so1185085e9.0
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 23:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683959765; x=1686551765;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gjwG0PDT1T/ZsdjXyUh664feugGzRf1Vg7lZ0tZzlwo=;
 b=znDkjDOsXgAs4xzzOxqYfCIdLLQeTyL2BJdHZt/mlT6Lj7car3DJw73psUGMa5+2Nj
 GOaG6doYcjUi0aoAMpbmCeZOILyXhjpFFLzF8K9TKHE070wqgLZazyY0+gDSRId9BC9h
 LDihpBQCDGrdxUusZEzLZ+AI/hcY8SzJJwZRjm0cr+DEvvOYQX7Xt6oU9iNfj4wrZeU4
 vmFbO5D2oTzGXj0UUBlK8hc9dWEV0Q+a9VVpAdZFT1SqpuD/NnvqeVZL1wQymQFcwBLb
 N6fDY+UJq3TekNzetLVJEK/M7CG74N8P3wcsVn7c2/12eZsHNWcU0GYUyF2lNO+i3Hw5
 Dlsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683959765; x=1686551765;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gjwG0PDT1T/ZsdjXyUh664feugGzRf1Vg7lZ0tZzlwo=;
 b=UuROZp68LZJhWEOWWBpGkbvd3qPOWb0nlSRF/Ca3S6wQdg6Ynlv48Cc9bkjerhvyak
 QIdWXsbYKmoBqT0OBBIfIBX0XCXvVhpAjf8f5/tvKKbctsL0rqS/SrjIqwufJ5apadef
 47gtLmxcne+fN4d2dg3SVDkxuQYOLnGJvPvjd1gtFcQVFp5eAR8id0GWScZ6DImW6E+3
 Ezqc2OM/88wSfX86OPOeVF2TzokATae9qW5oqZRWxXNwkkT5mD0HjKuzb3CXzfCWNgn+
 uymxcRmVy1pBf/SG09qS2Qt9vZkdp4W3SYg83StZR/mblG3fpU40L7u+E4LMKpuiMkBn
 VCKA==
X-Gm-Message-State: AC+VfDx3WwwL+J6M40Qac+z7YWa+SXWuuyOnK7NLWunx1ZIBNi8e/DPk
 1DVlgf5EYPd1S4CjQV5QhYFdxFWuuRiKfu166cH/wQ==
X-Google-Smtp-Source: ACHHUZ46JyKBtK+QilAz739xY9jAlPvJ3KfZZSyNl2T8FLJyVolC1Qx/OA6bCr5tEgRjAhK0DtDz7w==
X-Received: by 2002:a05:600c:4e44:b0:3f4:9a86:f2ab with SMTP id
 e4-20020a05600c4e4400b003f49a86f2abmr7894256wmq.17.1683959765229; 
 Fri, 12 May 2023 23:36:05 -0700 (PDT)
Received: from [192.168.190.227] ([83.98.42.3])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003f42bb3a5adsm12916449wmc.4.2023.05.12.23.36.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 May 2023 23:36:04 -0700 (PDT)
Message-ID: <5a556e67-b536-2fcb-81dd-13ea50d6f7d6@linaro.org>
Date: Sat, 13 May 2023 07:36:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 0/9] Linux user for 8.1 patches
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20230512112238.85272-1-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230512112238.85272-1-laurent@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.845,
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

On 5/12/23 12:22, Laurent Vivier wrote:
> The following changes since commit 7c18f2d663521f1b31b821a13358ce38075eaf7d:
> 
>    Merge tag 'for-upstream' ofhttps://gitlab.com/bonzini/qemu  into staging (2023-04-29 23:07:17 +0100)
> 
> are available in the Git repository at:
> 
>    https://github.com/vivier/qemu.git  tags/linux-user-for-8.1-pull-request
> 
> for you to fetch changes up to 3e7f6c76d529dd4096d043cbd16593e40b469e70:
> 
>    linux-user: fix getgroups/setgroups allocations (2023-05-05 14:37:05 +0200)
> 
> ----------------------------------------------------------------
> linux-user pull request 20230512
> 
> add open_tree(), move_mount()
> add /proc/cpuinfo for riscv
> fixes and cleanup

Has CI failures:

https://gitlab.com/qemu-project/qemu/-/jobs/4277490874#L884

  9191 |             ret = get_errno(move_mount(arg1, p2, arg3, p4, arg5));
       |                             ^~~~~~~~~~
../linux-user/syscall.c:9191:29: error: nested extern declaration of 'move_mount' 
[-Werror=nested-externs]
../linux-user/syscall.c:9219:29: error: implicit declaration of function 'open_tree' 
[-Werror=implicit-function-declaration]
  9219 |             ret = get_errno(open_tree(arg1, p2, host_flags));
       |                             ^~~~~~~~~



r~

