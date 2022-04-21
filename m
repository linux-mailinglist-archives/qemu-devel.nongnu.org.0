Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C54250A835
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 20:38:26 +0200 (CEST)
Received: from localhost ([::1]:57300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhbhA-0006Q8-Lw
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 14:38:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhbed-0004tZ-GH
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 14:35:47 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:34616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhbeb-00050Q-WF
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 14:35:47 -0400
Received: by mail-pl1-x62e.google.com with SMTP id n8so5682726plh.1
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 11:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=uKgqYOsaUsn8zCuN7A/2/WT2usxLqas9V280nbv2TMQ=;
 b=bYskpsf3H6YQcDC3ZwDVYu6ZLqn5ngWeAdh1ARCu0PfrQfMgdsR2mCRpvJ2iJjmsZg
 41EscLi8yvsBwg8l82/4mF2lAdR1uJ4Knwss7QirOS2jl/0NO8qCvOlHAftYQv0coW8m
 SvfHNxILVTjzrrBPfibnwK1ppy3YAGvKrzeL9O0d7Db9GiXr8fAglKHCfjp1rJBJLYIG
 2kQVCFXqnEReRV8KU6kTUxJyzDIMf8pB5zdlqMSSqsByNQwzbHWRqilGjpmbM56NAYiB
 R7bKj7Hx+fMyv27CKd/8z/aCy5l0fnc2N0/Ej7Kk+9Jv1f2YWy1EjxoaoNyzPpmBkA64
 lc0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uKgqYOsaUsn8zCuN7A/2/WT2usxLqas9V280nbv2TMQ=;
 b=y8nhwF2vKaGSAPJVXDPhn45lK2LpVk+V9Dl46TIrudMafH//bVDwsB/oa1j8YwhXAo
 JMCYSff7lVBk7XTdi3vOBAadGTOWodH682wOpHiLglhNiJMAefPBDEIQkZDYYbWKjEPx
 HQdw1KhOiRaJUyHfQFKtCYnaTYUxIccRqSHANT8fr5XoaFodJtkWCiJ/oLF15GCAkNnt
 iFL0k+SiPwDDrJOLLr3FVzn212NkhQogNoCJdB2sd2munpEn+EGb7cdtxw+IwZizk2NL
 ouk54UkH+LuWQ6t7sBnk1HZyAXgV/NGcWGwV0bB+HZNQ7ubpns4EnjVFbpnKpcBLYjOX
 gUng==
X-Gm-Message-State: AOAM530/8DXsN9EKSrwcPAfAqvSV4TqpRIBIj1N6oOOOKnA4m1PwJMKP
 ugwEzgqpTVR6iyGh9nQpBxuq/Q==
X-Google-Smtp-Source: ABdhPJxjxFTGDlfoRtfKfZ2il7lVV88dvx7Zx8PzKMrw7vmGzlG4MuUnhmyU/b7nM09GtV9FlvDHNQ==
X-Received: by 2002:a17:90b:3b43:b0:1d2:eb6b:a7ad with SMTP id
 ot3-20020a17090b3b4300b001d2eb6ba7admr1044753pjb.84.1650566144567; 
 Thu, 21 Apr 2022 11:35:44 -0700 (PDT)
Received: from ?IPV6:2607:fb90:80c1:f8a5:3d1f:84a9:7713:bf09?
 ([2607:fb90:80c1:f8a5:3d1f:84a9:7713:bf09])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a17090a7e8100b001d2edf4b513sm3483347pjl.56.2022.04.21.11.35.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 11:35:44 -0700 (PDT)
Message-ID: <d72e20f5-7d5e-66d9-2cf3-7516e7244263@linaro.org>
Date: Thu, 21 Apr 2022 11:35:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 0/3] Remove some of the old libopcode based
 disassemblers
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20220412165836.355850-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220412165836.355850-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/12/22 09:58, Thomas Huth wrote:
> Many of the disassemblers in the disas folder are based on old
> versions from the GNU tools (libopcode, GDB, ...) that were still
> licensed under the GPL v2. The GNU tools switched to GPL v3 at one
> point in time, so QEMU is stuck with the old versions, i.e. these
> files did not see much updates for new processors anymore. But
> for most architectures, we're preferring the Capstone disassembler
> now anyway, so the old libopcode disassemblers are also hardly
> used anymore.
> 
> I'm not 100% sure (thus this is marked as RFC), but I think we could
> simply drop the old disassemblers nowadays, and hardly anybody would
> miss them, since we now always embed capstone as a submodule anyway.
> Or is there still an advantage in keeping these old files around?
> 
> This RFC series tackles with s390, arm (32-bit) and i386 ... I wanted
> to get some feedback first, but if we agree that these can be removed,
> the sparc, mips and ppc disassemblers likely can be removed, too.
> (I think we should keep m68k.c since Capstone does not have support
> for Coldfire CPUs yet).
> 
> Thomas Huth (3):
>    disas: Remove old libopcode s390 disassembler
>    disas: Remove old libopcode arm disassembler
>    disas: Remove old libopcode i386 disassembler
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

