Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1360243852F
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 22:11:23 +0200 (CEST)
Received: from localhost ([::1]:36492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meNMQ-0004xd-7c
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 16:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meNKQ-00042D-Ir
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 16:09:18 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:40509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meNKO-0002zD-AP
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 16:09:18 -0400
Received: by mail-pg1-x533.google.com with SMTP id l186so245666pge.7
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 13:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PoJzxr16L2m/Yt4DK6xMRalNz9z4C0xP4mzyM1xnvyg=;
 b=WuZ4nsmvJoLvQZGJ8VJ6+lrc8pPDBu10Jd4I8fDErU491/iqECCK6h007Z1AHsBGqZ
 d5eGMmpWeKzhlzgjOHzR4SKP/ePsM5sqxsffjAF6QOE2iIm4iD8jqkvNfkadMiTeZ5u7
 kgS804fAn3+8tsmgL1REEhAn997ojwKPDkqiUoqFIa8dMHe4/DOckZQkABhbe2JOtIII
 dwbeQUi1c000aG2330e9c8RrpZYeYryUPKD7izJ+OYWIE1x8x4phecdjBDWN+vIIKPtQ
 YdQhfSAAgUKR+8zhj6DIykFBsMdPWuqzJhec+SJoGnhYLVnziOAGAudgBMUFO6QH+SGM
 xw7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PoJzxr16L2m/Yt4DK6xMRalNz9z4C0xP4mzyM1xnvyg=;
 b=KEWuW3Ql4iT1KSTNKw+cy1K9qKfmrXduvpkr71NH6jpSW18QOIxtqvlc9s7gq9nGx6
 qHitL4kbvSlgHaN1LBsIdeNTpxH7Fwx5PT1wcYgqllQ27yuRQFG5I5Lki8n3LyLP9kFg
 bR4FCnRi/eammP//aOMp+QzY/HQbKjmHt9x7sDQPrP5Qj0PGS36mYKFh9mrOTbkTIQZe
 6SX0wnGl6G02U6TYXlq8oczTYQ8vnIQlIl9eYDzJONtDhHIoqtITN5SR1YABQTN+4XHK
 kJf9/DysnKYDo3hHTZE/xih0Ntmq+Jce70pdNkVtBgCzDBYDMZY/WroqVcfXOD5OUyJk
 eH3g==
X-Gm-Message-State: AOAM531gTH0JBW5YvB6SL0wPGVmxv7j6vubxEpCdNo0rqUcD/L7acw2q
 snb0kO4wQEiJFGJo2WH9uRPBbQ==
X-Google-Smtp-Source: ABdhPJz+eXcjHkL/MbEvvyo7skw7wuTA4KdwQuZSOtbqr8f2Iebopm/9gTGZmMLtxcKZ7GZknvPffA==
X-Received: by 2002:a63:874a:: with SMTP id i71mr3383562pge.200.1635019754693; 
 Sat, 23 Oct 2021 13:09:14 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id j12sm7089049pfu.33.2021.10.23.13.09.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 13:09:14 -0700 (PDT)
Subject: Re: [PATCH 15/33] target/ppc: Implement Vector Insert from GPR using
 GPR index insns
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-16-matheus.ferst@eldorado.org.br>
 <0581a10f-1411-a174-5869-4fe0999132f3@linaro.org>
 <e7c53321-91e8-54af-9c6a-8f894fdc49@eik.bme.hu>
 <f316ea9c-0876-9f80-5c56-210f65234fd1@linaro.org>
 <b8d4a9ad-fd68-b37c-e9de-785d11d827d@eik.bme.hu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8abd1ed7-a636-def4-41c2-a80d4f80c7da@linaro.org>
Date: Sat, 23 Oct 2021 13:09:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <b8d4a9ad-fd68-b37c-e9de-785d11d827d@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.781,
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
Cc: lucas.castro@eldorado.org.br, qemu-devel@nongnu.org, groug@kaod.org,
 luis.pires@eldorado.org.br, qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/23/21 1:02 PM, BALATON Zoltan wrote:
> So may question was not if it's possible but if having target_ulong different from what we 
> had in qemu-system-ppc could cause any problems? I have no experience running 32-bit 
> guests with qemu-system-ppc64 but previously when this came up one difference pointed out 
> was that target_ulong would change if I remember the discussion correctly, but nobody now 
> if that could be a problem.

It shouldn't be a problem.  We take care of NARROW_MODE, so that you can boot a ppc64 
guest kernel, and then run ppc32 user binaries under that.

If you do find a bug under those conditions, report it.

r~

