Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6A26B50EB
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 20:29:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paiPj-0002Ir-Gd; Fri, 10 Mar 2023 14:28:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paiPg-0002I4-IJ
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:28:24 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paiPd-0007nK-Am
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:28:24 -0500
Received: by mail-pl1-x635.google.com with SMTP id n6so6731538plf.5
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 11:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678476500;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DJK4RUEclSgTMDJv5Wq7b81eal8ySnaNechD8UOqIUY=;
 b=ZNCTc7YDkuQkSV7vYLXAM9p0VehoFRzgYhupQVOGYgG9JXDvS/1jsx5snrVC9AtrAQ
 cXb/zoH75I7c3dU2ohhY4Vqi92rgWJA73r4K4wTlwArVuj/7eb/k+8rEt/DVNqNAfGop
 jmCoKIeRjCRALHnHJd8C2rZeonza+3L3QKa0cOGyJ6Q0naDa/gFIPj2UWVc9AO8j8Rse
 ewuhHhKS4EKX76d+yM4nEjdQwN5BRwGkwIKELUzjPZCMyrOYtlBEK4RZa0/RXEYZPqyW
 mDHR3qgINX5kgbqr9j7GbRfh1Oinp11sjrXs0satso4nLxbjcI0EBUBVW1ccdUv6Pp2q
 YvHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678476500;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DJK4RUEclSgTMDJv5Wq7b81eal8ySnaNechD8UOqIUY=;
 b=t3j6U8lGyY2lekIwYPj1KOK/aMnTGn8Iy9uIXfGlK31W0cXRy9+qEE9KJW9bJe7nN8
 9FaY9SYI7w8ayM2lvPwgV4fLxRfMBQsrg5uHlGyEdaRr39ZMPESUXaoBa81OTL6fsfBt
 OdvYffTDkvXrcuUaM0vwnaLTCX8+xHyzbJR/GTnis4dqJgirIlriRjqrY4vW8WhpV2uK
 LVwpHMvQ+oy5aADD45AUeCePIMui4+yE7Pe2rXipQwQhJWnrNXk4tnD2T6SP9YpdjPDw
 9J4sxSbh99n7sRzTgTIsVuhu7BkJL57rgBEszKU3QZnx4n70qZLC/5G+PVGQ+5USnwZV
 Z22g==
X-Gm-Message-State: AO0yUKVkeVC+hqiybW4RxEdkZy6BVQtWsTC5e5kxqimzT1Fy3iwNib/6
 7b38sTXySQeVaskjME7gBhhN0A==
X-Google-Smtp-Source: AK7set/M7yB/cxTRrVgEVI0nKod5T4gXFSt3q8UhckUrRBqI4PikyGC7Njtl69ExHGWI+j8CsKMhMA==
X-Received: by 2002:a17:90a:e7c7:b0:237:7891:1ea4 with SMTP id
 kb7-20020a17090ae7c700b0023778911ea4mr27393084pjb.18.1678476499793; 
 Fri, 10 Mar 2023 11:28:19 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62?
 ([2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a63e002000000b00502f1540c4asm224768pgh.81.2023.03.10.11.28.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 11:28:19 -0800 (PST)
Message-ID: <e0fbcd89-f24d-40fe-a4a3-8b3f8999125a@linaro.org>
Date: Fri, 10 Mar 2023 11:28:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 04/12] target/s390x: Handle LRL and LGFRL from non-aligned
 addresses
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Nina Schoetterl-Glausch <nsg@linux.ibm.com>
References: <20230310174223.944843-1-iii@linux.ibm.com>
 <20230310174223.944843-5-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230310174223.944843-5-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/10/23 09:42, Ilya Leoshkevich wrote:
> Use MO_ALIGN_4 and let do_unaligned_access() generate a specification
> exception.
> 
> Reported-by: Nina Schoetterl-Glausch<nsg@linux.ibm.com>
> Suggested-by: Nina Schoetterl-Glausch<nsg@linux.ibm.com>
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> ---
>   target/s390x/tcg/insn-data.h.inc | 14 +++++++-------
>   target/s390x/tcg/translate.c     |  3 ++-
>   2 files changed, 9 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Note that both this and the previous could use MO_ALIGN, getting the required alignment 
from the operand size.


r~

