Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E3A52A4AB
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 16:21:46 +0200 (CEST)
Received: from localhost ([::1]:35588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqy52-0007lM-Qw
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 10:21:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqxvW-0003aK-8i
 for qemu-devel@nongnu.org; Tue, 17 May 2022 10:11:54 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:47018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqxvT-0004tj-PI
 for qemu-devel@nongnu.org; Tue, 17 May 2022 10:11:53 -0400
Received: by mail-ed1-x530.google.com with SMTP id j28so8558901eda.13
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 07:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NqPPgPR8U6GBVWyK6nXsGpCyxiuSJ9OXgqjKZcDvBW0=;
 b=pr6I8RL59h0QQULHBZWN5PexA/pO5INtXjvKvne09FMhF9oBHSLgP8W1uAZhVuKBkE
 WQFXS1hdAvq8lME1WFmGOMz9hZJjP1wJmlUII8ir1SFIoHn2aHe6VlgRrmwP/tzb4nLT
 NPyI8T+cma3gPYmA+gaETHW7sOq0lajg4r7udZQQDNDw+yeHlsLIw7V/GMmLYUD/6xW5
 PK3pJq8w0/c8H/YikStDWyojhRICP6hBC2wK9RMub0Wt5as0yANTzWnTnGikUSyqB7GS
 beDnE0wDw7yomTrcxMR9eNDdkgTCMjxrER+K3aJudFtPIoO6bxC2SnKUHZKUkHF/qC5r
 sxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NqPPgPR8U6GBVWyK6nXsGpCyxiuSJ9OXgqjKZcDvBW0=;
 b=ONKXiQT6fSYhN/U9NyKjX25XhBpBh8zwCdtCfjGzJOvwk549gzZLDK8Oo5QCzHuCDK
 dvKKU+dRW8yw6/xX3zAk68hm8pwwjZjMjc8mVU/G8a+CjU28TIQpSJAxsr1WWBNdYkTi
 QV3UTyaE5kaZoUD21r4bXkm55gmQPg8DhuyItHqGKce7aaOSc5qvOyfcO8+e1MchmBxF
 cUFqu3wCpECXAEekUf9rg3wxPbjZdK8IGqOgZJU+5vBndr+S/1S/QFifV8AcdLFv10aJ
 wGLuV8t6WvAayWCAwoN81nSTQRbZuMc0BxVGqAfBoVVrDQdYykGdspDhfEoqIIMb3te6
 UeKg==
X-Gm-Message-State: AOAM530vP7fERndIz4BTI7pwMikfCXhP9bMd3drjX0gFV4SowxRA3m5g
 vI8MdAd9qiEruMItciNYf9g=
X-Google-Smtp-Source: ABdhPJwT7Kt0XudYGaTOyVogjSEeXooWmOlV5MqC52M4yzwpcokxJPkdQN+M+6TaV1l6I25XkocVNQ==
X-Received: by 2002:a05:6402:35cb:b0:427:d231:3741 with SMTP id
 z11-20020a05640235cb00b00427d2313741mr19393404edc.369.1652796710133; 
 Tue, 17 May 2022 07:11:50 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 12-20020a17090602cc00b006fe7725ed7dsm168685ejk.34.2022.05.17.07.11.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 07:11:49 -0700 (PDT)
Message-ID: <4ee53657-76fc-116f-b569-d0813301a9fc@redhat.com>
Date: Tue, 17 May 2022 16:11:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] whpx: Added support for saving/restoring VM state
Content-Language: en-US
To: Ivan Shcherbakov <ivan@sysprogs.com>, qemu-devel@nongnu.org
References: <004101d86732$0d33bd70$279b3850$@sysprogs.com>
 <e1229b1f-d94e-6529-311e-30999741fadc@redhat.com>
 <021801d86954$fe4cb940$fae62bc0$@sysprogs.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <021801d86954$fe4cb940$fae62bc0$@sysprogs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 5/16/22 20:44, Ivan Shcherbakov wrote:
> Passing it to x86_cpu_xrstor_all_areas()/x86_cpu_xsave_all_areas() changed the following values:
> 
> 0x0000001C: ff ff -> 00 00
> 0x00000208: 07 -> 00
> 0x0000020F: 80 -> 00

0x1C-0x1F is MXCSR_MASK.  There's already a field in the x86 CPUState, 
but it was forgotten in 
x86_cpu_xsave_all_areas()/x86_cpu_xrstor_all_areas().  The field should 
also be initialized to 0xffff in the CPU reset function.

0x208...0x20F is XCOMP_BV and bit 63 in there is indeed signaling 
compacted format.  First of all I'd start with your patch and hack it to 
check if Hyper-V accepts zero at 0x208..0x20F; in this specific case of 
0x208...0x20F have all low consecutive bits set plus bit 63 set, it's 
fine to do just that.  If so, x86_cpu_xrstor_all_areas() needs no 
support for compacted format.  I would be somewhat surprised if Hyper-V 
needs support in XRSTOR too.

For XSAVE, the algorithm to compute the offset (instead of just using 
x->offset) is given in the Intel manual:

If XCOMP_BV[i] = 0, state component i is not in the XSAVE area at all.

If XCOMP_BV[i] = 1, state component i is located at a byte offset  from 
the base address of the XSAVE area, which is determined by the following 
steps:

- If i is the first bit set in bits 62:2 of the XCOMP_BV, state 
component i starts at offset 576

- Otherwise, take CPUID[EAX=0DH,ECX=i].ECX[1]:

   - If it is 0, state component i starts right after the preceding state
     component whose bit is set in XCOMP_BV (where the size of component
     j is enumerated in CPUID[EAX=0DH,ECX=j].EAX).

   - If it is 1, state component i starts after the preceding state
     component whose bit is set in XCOMP_BV, but on a 64-byte aligned
     offset relative to the beginning of the XSAVE area.

Paolo

