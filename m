Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AD5364CF7
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 23:21:28 +0200 (CEST)
Received: from localhost ([::1]:46560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYbKh-0005NO-PO
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 17:21:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYajP-0002sd-38
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:42:55 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:51971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYajN-0002Mu-33
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:42:54 -0400
Received: by mail-wm1-x334.google.com with SMTP id z6so1131267wmg.1
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 13:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dMT7YHA0gkC0JknwKDiVLa22QnPnnRvrAvwd8nyxGtk=;
 b=jgUeYAR3kgI5XaG41mTCXj8KwMYLf6LbYkkfylzUGrOYpDMX+cY3Oy5edE1jlCS1G3
 41n7nM+afoBofNhSYXsZ/lEQcW0m5kw5KQEPohv8bWcmKP/eKpTUF/9jfYN9jJLgn6jN
 55qkJlOl6jH0NUNsupjnbAjTDmu03ECTYfUnaYH5HZ865YvSR+d2Y0qGGLaHHpItjdFU
 TbsntbHG/+YaM7vyEr0zcM93nZKv/2u3XdPvxDgwk+CMbHwSkm/FGaDSwJ8sjjLz57O/
 yWD+ZhlMcsaBCIhgKcvzDeV5g5iFyJB7kBbwLwJLU5Z+rQET0mXWe9QJWZJVFP9nt7kf
 isfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dMT7YHA0gkC0JknwKDiVLa22QnPnnRvrAvwd8nyxGtk=;
 b=rfyzIUHFONgexQ/zmocPgzJXYX7VXmQy9y/iArKrzZodCNWYC0ri9t21mR/2+Hl3rF
 LSex/SjoSnZoPRdw+XB3vGOBj+FVfnWRnj1gjsRRMFi7vvWspnPGL5BS5dpSn5E92qlt
 f1foQaeEeSMFtzR3sIdh5iP3mil4e/MvX569WmVkbKbEvuPFPquXUkfYNZcINxk7djC4
 57joXXVbffBgz8jo3z3voU7iMJaaTqlR186+l2bfbdwTc2Yy4DdANyfPb7fTEdVkJWw2
 Cta/xesyS8iIgJrqNs5/G+tYeYxIwXJH54Wr2lzuH9BVTusvOAxpA8U0MpdDTRVZ7rFq
 GzCg==
X-Gm-Message-State: AOAM532ZLsH9bPJHrx3wVwEJOJg3ruLTGGe4MzPilvU6TEs4hPVjsYI4
 e8fDim/2sz25i2q9KS/C0xA=
X-Google-Smtp-Source: ABdhPJxabyzaZtrZNWr6o1IqC/VhkR6ssyG/Xil/kc5Ecx+phB5/pn3MmV428hZeqdhmYWcde+RqDg==
X-Received: by 2002:a7b:c8cf:: with SMTP id f15mr836661wml.135.1618864971601; 
 Mon, 19 Apr 2021 13:42:51 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id s10sm24256085wrt.23.2021.04.19.13.42.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 13:42:51 -0700 (PDT)
Subject: Re: [PATCH v3 08/30] target/mips: Declare mips_cpu_set_error_pc()
 inlined in "internal.h"
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210419191823.1555482-1-f4bug@amsat.org>
 <20210419191823.1555482-9-f4bug@amsat.org>
 <5ff019aa-00c5-f600-eb2a-4c8d3e3a0dd1@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6643eb6f-ab02-c66e-7689-20864f93565f@amsat.org>
Date: Mon, 19 Apr 2021 22:42:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <5ff019aa-00c5-f600-eb2a-4c8d3e3a0dd1@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/21 9:27 PM, Richard Henderson wrote:
> On 4/19/21 12:18 PM, Philippe Mathieu-Daudé wrote:
>> Rename set_pc() as mips_cpu_set_error_pc(), declare it inlined
>> and use it in cpu.c and op_helper.c.
> 
> Why "error_pc"?  The usage in mips_cpu_set_pc certainly isn't in
> response to any kind of error...

Indeed, but I couldn't find any good name. mips_cpu_set_pc() is
already taken, as is cpu_set_pc():

static void mips_cpu_set_pc(CPUState *cs, vaddr value)

mips_cpu_state_set_pc() maybe?

