Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A714D4E3ABC
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 09:35:55 +0100 (CET)
Received: from localhost ([::1]:44172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWZze-0002Bc-MP
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 04:35:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1nWZvY-0007cU-Bh
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 04:31:40 -0400
Received: from [2607:f8b0:4864:20::102c] (port=38628
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1nWZvW-0003Sw-5Q
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 04:31:39 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 mm17-20020a17090b359100b001c6da62a559so1855282pjb.3
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 01:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/WdoLK59Hj9hmlau0hryUQQS7hjC1yCB/y2qFgDDbp8=;
 b=ugCocMzrCr38pchxDA8sX0W2fMx8d5AOrf86Pl6rpPhmVrCofsNW7pMsjhXRD4knsL
 v6Awg/XmE2A7pyGzcq7ywImat44s+chHt18DmRZdSeT0fWMiA1Dm2CFsUGI5Lr6D67zj
 i8gNQifeZJ+Tcwmd5K8dhGha92Fi3NOB3rY9uWiNQpwoBiPZ9EO8iT3H7BULJGHWjltf
 VdfZBv/62yjMs393up11qrHdvOmfIsZpXjqETg7a2RTyVU6H7v6XNrsGoC2O/w8qIU5K
 jAw2laimOl+dNlXE9/uRDpZEC00MUR3UQVtTm8gpm6ZTNNXcReRqH9beidESxDJ76J47
 cXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/WdoLK59Hj9hmlau0hryUQQS7hjC1yCB/y2qFgDDbp8=;
 b=7M5VXInRjcevUetzl5sinWRtKLxy7TdkHgOCqNh9kfpE+U3Y774EGvJDisrbx64B0v
 1m6TD5rF9tpsxd5helFXOqaOozrEySb7b5JUzdws9fACLQqNcbihlM7ZQukP+I5PeHF4
 zMImWtCSv7eKPsfjkj8lyyBCTbaui0GffRP9gAY/dQRhZtkndDUdqPfctL9oJgfXxLxM
 75evVKV0I4uEAJjMQFCNs5AvrqtDINnqgdJSbjpM6/s0EaEqoRLhvU0ee273K8KhzNpP
 /JTdfs48c4wCSZQ4UZ4vNkENou4iAonB66EeGmgIYumKJOrvgLl77bg2XIVD8jMBWjC5
 cSZQ==
X-Gm-Message-State: AOAM5312oQW7fJWN1v9SISQiOIAuz94cqNdrquQshFCI7fAQ+mbLsjX4
 vnZfgYy0OQSO+oBOd5s2asGwWw==
X-Google-Smtp-Source: ABdhPJykHOCzpSUrS/sIDrywFNBgtYTPVNsy3fp0LZLT4kPemVCvKEDBwSqt+YZt6Xwvg6lSarwpig==
X-Received: by 2002:a17:902:6b0a:b0:154:6527:8ddf with SMTP id
 o10-20020a1709026b0a00b0015465278ddfmr7234471plk.154.1647937894384; 
 Tue, 22 Mar 2022 01:31:34 -0700 (PDT)
Received: from [192.168.10.95] (203-7-124-83.dyn.iinet.net.au. [203.7.124.83])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a056a00234300b004faabba358fsm5850207pfj.14.2022.03.22.01.31.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 01:31:33 -0700 (PDT)
Message-ID: <a0793b96-0e5c-5023-aa8e-073406a3bc02@ozlabs.ru>
Date: Tue, 22 Mar 2022 19:31:29 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: XIVE VFIO kernel resample failure in INTx mode under heavy load
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>,
 Timothy Pearson <tpearson@raptorengineering.com>
References: <1891893257.448156.1647023745384.JavaMail.zimbra@raptorengineeringinc.com>
 <20220314160952.46d5313a.alex.williamson@redhat.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20220314160952.46d5313a.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=aik@ozlabs.ru; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 15/03/2022 09:09, Alex Williamson wrote:
> [Cc +Alexey]
> 
> On Fri, 11 Mar 2022 12:35:45 -0600 (CST)
> Timothy Pearson <tpearson@raptorengineering.com> wrote:
> 
>> All,
>>
>> I've been struggling for some time with what is looking like a
>> potential bug in QEMU/KVM on the POWER9 platform.  It appears that in
>> XIVE mode, when the in-kernel IRQ chip is enabled, an external device
>> that rapidly asserts IRQs via the legacy INTx level mechanism will
>> only receive one interrupt in the KVM guest.
>>
>> Changing any one of those items appears to avoid the glitch, e.g.
>> XICS mode with the in-kernel IRQ chip works (all interrupts are
>> passed through), and XIVE mode with the in-kernel IRQ chip disabled
>> also works.  We are also not seeing any problems in XIVE mode with
>> the in-kernel chip from MSI/MSI-X devices.
>>
>> The device in question is a real time card that needs to raise an
>> interrupt every 1ms.  It works perfectly on the host, but fails in
>> the guest -- with the in-kernel IRQ chip and XIVE enabled, it
>> receives exactly one interrupt, at which point the host continues to
>> see INTx+ but the guest sees INTX-, and the IRQ handler in the guest
>> kernel is never reentered.
>>
>> We have also seen some very rare glitches where, over a long period
>> of time, we can enter a similar deadlock in XICS mode.  Disabling the
>> in-kernel IRQ chip in XIVE mode will also lead to the lockup with
>> this device, since the userspace IRQ emulation cannot keep up with
>> the rapid interrupt firing (measurements show around 100ms required
>> for processing each interrupt in the user mode).
>>
>> My understanding is the resample mechanism does some clever tricks
>> with level IRQs, but that QEMU needs to check if the IRQ is still
>> asserted by the device on guest EOI.  Since a failure here would
>> explain these symptoms I'm wondering if there is a bug in either QEMU
>> or KVM for POWER / pSeries (SPAPr) where the IRQ is not resampled and
>> therefore not re-fired in the guest?
>>
>> Unfortunately I lack the resources at the moment to dig through the
>> QEMU codebase and try to find the bug.  Any IBMers here that might be
>> able to help out?  I can provide access to a test setup if desired.
> 
> Your experiments with in-kernel vs QEMU irqchip would suggest to me
> that both the device and the generic INTx handling code are working
> correctly, though it's hard to say that definitively given the massive
> timing differences.
> 
> As an experiment, does anything change with the "nointxmask=1" vfio-pci
> module option?
> 
> Adding Alexey, I have zero XIVE knowledge myself. Thanks,

Sorry about the delay, I'll get to it, just need to figure out first the 
host crashes on >128GB vMs on POWER8 with passthrough :-/


--
Alexey

