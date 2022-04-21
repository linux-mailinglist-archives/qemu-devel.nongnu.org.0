Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD66550A7E6
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 20:14:32 +0200 (CEST)
Received: from localhost ([::1]:34202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhbK2-0002WL-Qk
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 14:14:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhbHA-0008S3-TD
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 14:11:32 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:38608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhbH9-0001F8-8z
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 14:11:32 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 s14-20020a17090a880e00b001caaf6d3dd1so8430016pjn.3
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 11:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=GkEVJ/D7PEVp0wP68SEBHMPXUnH5/8J6Mmm1bxuWXc0=;
 b=dql6TsdSRBlyG5NghvbKj0XvuXqWB+dNQE18lQn0VM5goJSanKif63w8s1qL9lICoA
 4nj7OJqamQU8omr2L9bFR30rNzHXUr9tZnWeQZZoWrU9dhB8RBSJ1PCoTC/nVIYhESvo
 q7lD8snTjGqpMkllKizzzqQ3aU9Qw9OMpRX88dQbJ7QITYVogEhINU4Bex9tUmltUr04
 tuNj+1PnEqWahurnMaJdPHNdIYCvGbzMQF28xWvwIH6+CTSNTjqCurTNX6JNTSEyNd+I
 q2S40khTWcWO9dqu/ESt4Vs/cU8LtayluuewPlC94EJ8UnSQQGN58CTKBnztoeziVjeK
 AY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GkEVJ/D7PEVp0wP68SEBHMPXUnH5/8J6Mmm1bxuWXc0=;
 b=F6fbui7JIZu0QKAHYXWruMitiPVhpU5HHdevchcNdaAbBfhoLHk3pw6zhL8sUkIdoh
 BEiVq5BLusqcp+pfef/VDAbkCofZ6DgaH4oHiT+0qFZN9zYnX9Pu1nfuIr4P71FhYdlc
 eIHlC7FEhjF4fC7UGETUxJiCy9k9jbTZQm0JleVqaY2yHsRk9euRtaRS073uctIQoZDu
 mWSZp0WDtymSISH14UvdBa4bA6dtthmd17p/uE3eLNapdSU1vF0d0rx0vHZ+3FPbO5ik
 3SQeJJQNBpq//NbM3QwW6ZG+dfkRgqwUxjK2cIVR81Mzp1UkohJcZ9MMm3MTF+o7XwAt
 I3WA==
X-Gm-Message-State: AOAM532baCNavGyARVmLY2wq/nJV5EjrcYz/hdWF2268tXR6pSJOFa2Y
 qH8Iwl6E1/zIt45rbxCQh8X2hw==
X-Google-Smtp-Source: ABdhPJzFbkYasl2luM76Ma3RZOaPdSOfuSAiUJcAbhIl428MUN4c5qXUughLuJGSBS3MQri71gs4YA==
X-Received: by 2002:a17:90a:4414:b0:1cd:4c16:e7eb with SMTP id
 s20-20020a17090a441400b001cd4c16e7ebmr11831359pjg.166.1650564689585; 
 Thu, 21 Apr 2022 11:11:29 -0700 (PDT)
Received: from ?IPV6:2607:fb90:80c1:f8a5:3d1f:84a9:7713:bf09?
 ([2607:fb90:80c1:f8a5:3d1f:84a9:7713:bf09])
 by smtp.gmail.com with ESMTPSA id
 n27-20020a056a00213b00b0050add7eb5dcsm3265295pfj.113.2022.04.21.11.11.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 11:11:29 -0700 (PDT)
Message-ID: <1f26c28f-dd80-cadb-d308-56c9a91bea2f@linaro.org>
Date: Thu, 21 Apr 2022 11:11:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 3/6] scsi-disk: add MODE_PAGE_APPLE quirk for Macintosh
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fam Zheng <fam@euphon.net>
References: <20220421065155.31276-1-mark.cave-ayland@ilande.co.uk>
 <20220421065155.31276-4-mark.cave-ayland@ilande.co.uk>
 <20220421132746.GA1500162@fam-dell>
 <e6d29d64-fe3b-8d4b-3985-146c11bfd537@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <e6d29d64-fe3b-8d4b-3985-146c11bfd537@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: pbonzini@redhat.com, laurent@vivier.eu, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/21/22 08:29, Mark Cave-Ayland wrote:
>> You need (1 << SCSI_DISK_QUIRK_MODE_PAGE_APPLE) instead.
> 
> Doh, you're absolutely right. I believe the current recommendation is to use the BIT() 
> macro in these cases.

We probably need to fix BIT() to use 1ULL.

At present it's using 1UL, to match the other (unfortunate) uses of unsigned long within 
bitops.h.  The use of BIT() for things unrelated to bitops.h just bit a recent risc-v pull 
request, in that it failed to build on all 32-bit hosts.


r~

