Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 542C84D1A7A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 15:28:08 +0100 (CET)
Received: from localhost ([::1]:58756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRaoo-0002ud-Vp
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 09:28:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRamx-00014B-3D
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 09:26:11 -0500
Received: from [2a00:1450:4864:20::52d] (port=39472
 helo=mail-ed1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRamv-0003Q3-BR
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 09:26:10 -0500
Received: by mail-ed1-x52d.google.com with SMTP id g20so24719705edw.6
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 06:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4mN6mm1O87pF4mRXGpiGuZte6QfdCs2+v9k9SelcU/U=;
 b=bAbIZUBfaQw0KyUvDU1HSnkOo3mW01BHAa3MRtpNLuzsV02HVKHHglgJyyMvRhbG2C
 zjd2JRVdmz4t0tfya+pqW5wxON0igzNJMbWP4xHiTx+p2I/aqMHsntriWBkgnkV7kbSj
 QKrm+RWhCRdONjoJJ4YDROmLGfrNEl6/Zi5mE01iCusJ/IJut1XeMpPofcfTeonSopOb
 j0sqjg2aJr3C8SYix4EiN2GzTQnz4Y7xRbgsotgv9lH+GMXAmTCJ97paQh0boyFPeUUj
 L3jYSyLtVgAl+3PdJjHyW4oilFF2YeAKQsq/WudzefwsiR2QDFR8dmphxiafzY0juq1o
 f7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4mN6mm1O87pF4mRXGpiGuZte6QfdCs2+v9k9SelcU/U=;
 b=qiMXylz4bsDz1qVsGjd9HKFfrIos26UZYAubDANpeae+JQWPNhHXaowGZv4Badx+yu
 LlbE+x5M+uxwys6TPKTYeTszEuedY2Rb6/luuYrb8BGtS2NBvQqWQSZgVqevu9Gtv+Fq
 xYNt/eLS3PQuJ/UodRxU70x2h80TF/x6BjhTnsAHowsjRm/TYnpZM66b6dzhs3XPzUK2
 L6AgVGc2GXBNn3PM0rYr+kyD8ADOjldNNOw7as+9nhJaljLiiZeMEUSKgqyJ8KPRCPWN
 BClE1AHGdfNTCEIA3gn/IV9qn3rxKCTM6EhWnh8P54Rqf2ZU4NtXxbpHE0IdzHGLdKEV
 rHRQ==
X-Gm-Message-State: AOAM531HPuxIgI4ooy8SGUfFz6kYtNAmSMvmpPCLwPxioYdWDo+bAM4M
 EcFkBzSqXqvY6E3osiRXLhA=
X-Google-Smtp-Source: ABdhPJzzkwVstBuJ5CqmFMSLGCVeLPRCUb8iku6RQb14/la+x5WFp6JHYuVRBtPrcFjAlG07GB4MKQ==
X-Received: by 2002:a05:6402:294b:b0:413:d1e5:884e with SMTP id
 ed11-20020a056402294b00b00413d1e5884emr16320162edb.4.1646749567253; 
 Tue, 08 Mar 2022 06:26:07 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 o21-20020a170906289500b006d144662b24sm5884292ejd.152.2022.03.08.06.26.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 06:26:06 -0800 (PST)
Message-ID: <e60a4298-17f3-d3e7-bf94-bf2dbbe83141@redhat.com>
Date: Tue, 8 Mar 2022 15:26:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Question about atomics
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <CANCZdfpJVWFjrQDiYJy8xiw-THF8_3GNcu=0Pmbvp_6zAJbfHA@mail.gmail.com>
 <5bb620d4-96f0-cf7f-5530-af529a32c78d@linaro.org>
 <CANCZdfqwA8HbxYhud8pKxF_f=BMoMtrO+R=zg7GiKesz8_YZvg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CANCZdfqwA8HbxYhud8pKxF_f=BMoMtrO+R=zg7GiKesz8_YZvg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/22 15:09, Warner Losh wrote:
> 
>     Yes, qatomic_foo is expected to work.  It's what we use across
>     threads, and it is expected to work "in kernel mode", i.e. within cpu_loop().
> 
> Even when the writers are done in the context of system calls to the kernel?

Yes.

That said, for the similar syscall in Linux we just forward it to the 
kernel (and the kernel obviously can only do an atomic---no 
start_exclusive/end_exclusive involved).

> And if the system call does this w/o using
> the start_exclusive/end_exclusive stuff, is that a problem?

If it does it without start_exclusive/end_exclusive they must use 
qatomic_foo().  If it does it with start_exclusive/end_exclusive, they 
can even write a compare-and-exchange as

     old = *(uint64_t *)g2h(cs, addr);
     if (old == oldval)
         *(uint64_t *)g2h(cs, addr) = new;

Paolo

