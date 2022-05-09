Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE0351FE80
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 15:40:20 +0200 (CEST)
Received: from localhost ([::1]:51922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no3cZ-0005wY-Ht
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 09:40:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1no3Hq-0007MS-Ha
 for qemu-devel@nongnu.org; Mon, 09 May 2022 09:18:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1no3Hn-0007S0-Lk
 for qemu-devel@nongnu.org; Mon, 09 May 2022 09:18:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652102330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SxEyaYH2yjxeYPQNde4xDfH2p0uCHdbjfV4SwhfKRqQ=;
 b=LopuIL9v6uyxK3qAUF9pvNm0W/gEutxMIinuE7p2njFNXNKyROlqw3h9hEwT6gCd4I0Svo
 p3A64zz3tRmlsMXc95zBr0clc0RnfTLSymFRajwf4xanWLIfruhc4f1SW5sRdYwV5SIeYX
 Mz9IQV/r7zznuNI/LDByxe8MwLYsAm8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-19-ZWamvZVVPCmXyt1a7bsn_g-1; Mon, 09 May 2022 09:18:49 -0400
X-MC-Unique: ZWamvZVVPCmXyt1a7bsn_g-1
Received: by mail-wr1-f72.google.com with SMTP id
 j21-20020adfa555000000b0020adb9ac14fso5773616wrb.13
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 06:18:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SxEyaYH2yjxeYPQNde4xDfH2p0uCHdbjfV4SwhfKRqQ=;
 b=WCu1WgaCkNwoqEaswC7HSI9/JyTNL+kFtrER7LYtEjulgLJ0sB1rYxYdMGgQ09yCmP
 bMMhgtaBILcYQDVMj0bRiflxeM/+AVvvQK7aLFav0O212pkSAHFV1ODcEEi0QMwPT6qo
 9yj7T0qRQN65a3N+Uaao2k2mem8ZpJZs3+6JuzQ3ZaBSiSuGVtGSbm2XDIUibL6FXmZp
 l+s4xVsc8T2xs7LU38i31iGfITXYJTgyNV/j+iErS9FgUtFPg55OAugMI7mNaLGFMcmq
 Pm/e7i5DxPodLM+ztkUAbmGUKSCr2awyknxmuKFZV2FePz3aKH9W3DEnSx5OE/IV7kfp
 X5jg==
X-Gm-Message-State: AOAM531Srw1U8nmmsyt01jjHWN25AVLBpp0uRVfPtgR1xk5QNOqZYGqw
 Pjw1vXMMDVBxzQPcN+X9ts1RxYEI7+K5ezna7hOfbqgx2EqEXLRMP65fSaJg8PEG59QgTUDm5Y5
 DaiiARxJcQpvhXHg=
X-Received: by 2002:a5d:56c9:0:b0:20a:c54c:70e2 with SMTP id
 m9-20020a5d56c9000000b0020ac54c70e2mr14137852wrw.415.1652102328170; 
 Mon, 09 May 2022 06:18:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbU7YZFZvvZM0u0n1q5FpBOJjLFj9S8gHwhVRSkpSYCF98DEPiZrCEjufd34vv/SlDpZFOWg==
X-Received: by 2002:a5d:56c9:0:b0:20a:c54c:70e2 with SMTP id
 m9-20020a5d56c9000000b0020ac54c70e2mr14137818wrw.415.1652102327830; 
 Mon, 09 May 2022 06:18:47 -0700 (PDT)
Received: from [192.168.8.104] (tmo-082-126.customers.d1-online.com.
 [80.187.82.126]) by smtp.gmail.com with ESMTPSA id
 7-20020a05600c230700b003942a244edbsm14594163wmo.32.2022.05.09.06.18.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 06:18:47 -0700 (PDT)
Message-ID: <a8a7b68e-6fb9-e329-5c88-99a1fa5da75b@redhat.com>
Date: Mon, 9 May 2022 15:18:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RFC PATCH 0/3] Remove some of the old libopcode based
 disassemblers
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20220412165836.355850-1-thuth@redhat.com>
 <2af15d6d-ad10-2f98-fb0a-37d0125044ca@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <2af15d6d-ad10-2f98-fb0a-37d0125044ca@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 09/05/2022 14.20, Philippe Mathieu-Daudé wrote:
> On 12/4/22 18:58, Thomas Huth wrote:
>> Many of the disassemblers in the disas folder are based on old
>> versions from the GNU tools (libopcode, GDB, ...) that were still
>> licensed under the GPL v2. The GNU tools switched to GPL v3 at one
>> point in time, so QEMU is stuck with the old versions, i.e. these
>> files did not see much updates for new processors anymore. But
>> for most architectures, we're preferring the Capstone disassembler
>> now anyway, so the old libopcode disassemblers are also hardly
>> used anymore.
>>
>> I'm not 100% sure (thus this is marked as RFC), but I think we could
>> simply drop the old disassemblers nowadays, and hardly anybody would
>> miss them, since we now always embed capstone as a submodule anyway.
>> Or is there still an advantage in keeping these old files around?
>>
>> This RFC series tackles with s390, arm (32-bit) and i386 ... I wanted
>> to get some feedback first, but if we agree that these can be removed,
>> the sparc, mips and ppc disassemblers likely can be removed, too.
>> (I think we should keep m68k.c since Capstone does not have support
>> for Coldfire CPUs yet).
>>
>> Thomas Huth (3):
>>    disas: Remove old libopcode s390 disassembler
>>    disas: Remove old libopcode arm disassembler
>>    disas: Remove old libopcode i386 disassembler
> 
>>   disas/arm.c             | 4012 -----------------------
>>   disas/i386.c            | 6771 ---------------------------------------
>>   disas/s390.c            | 1892 -----------
> 
>>   10 files changed, 12700 deletions(-)
> 
> o_O Nice!
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Thanks, just a little bit too late - it's in my current pull request already :-)

By the way, what about MIPS? Could MIPS be switched to Capstone, too, so 
that we could finally remove disas/mips.c ? (We're not using capstone there 
yet, and MIPS has so many flavours, big and little endian, 32- and 64-bit 
... so that I'm unsure whether there was a reason for not using Capstone 
there, or whether it just hasn't been tried out yet?)

  Thomas


