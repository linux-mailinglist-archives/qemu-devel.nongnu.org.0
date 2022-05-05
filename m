Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0125D51C68F
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 19:52:23 +0200 (CEST)
Received: from localhost ([::1]:38884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmfeI-0007jT-3N
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 13:52:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nmf2U-0008Ie-WF; Thu, 05 May 2022 13:13:19 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:37770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nmf2T-0002Ut-7b; Thu, 05 May 2022 13:13:18 -0400
Received: by mail-ed1-x52e.google.com with SMTP id k27so5969963edk.4;
 Thu, 05 May 2022 10:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AFDlXlQ6FIU1Y/5X84ot7ujbS7AQWGyB62TiXs5daSg=;
 b=OF1qwFNSfLrTkdjps29BexsoZJIKqmhMWWlX0sIpo9tTEtC/a4bFasRZwsAKMjCzf+
 C4A1WPIHSmJgwVtB2CNkG8gTq1lWHTBa+Z/GA5D3JpiAyXkxKpg2RrySQX63+FDIU4bT
 foD1XfZ5iia76XIRe4qIl4fK8zKj+51KfXIBiA4E3065jMqPUiWMQS5cwM2OkjKnJXQe
 cvAe7aHLEN3Uk3UkfP2RrJUSCuUNHV98VbqTYprvzRYrCXU83ghAztUYxniZyLLYnB4H
 ur+gCYX78hLeI7lYPSZx0rhgjijRHGoEXlU67LoeHjMTbw3lbCCf5qd84Lqj4RZf75sV
 qJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AFDlXlQ6FIU1Y/5X84ot7ujbS7AQWGyB62TiXs5daSg=;
 b=QCrQLG0Q8p7uujov2JclAEGPp7m3CnrJV5Uifo2NzEj3F9OUr5+KI9HKIE0qHpBcm1
 AbqqBUYXTPJseDtE+ZfOTDP1U5yq+CPshv6R1tQZ/7Y0v4CMnEIjIhS0MffK5CViBKQg
 wvJa2/YJjEqGR3O2Rf7q0ajmJj2bqx5rony03/DfGNHJ0a3D0wjmQG1QtkucF18UIyjO
 jNjNQKfmSqQaBTPvLLB5xFsQVFf6p4a9h0QOkTY2CHiqVOK99ju9q6GicL3sm//AQwDz
 mrRKi60GHN1Ge+d2+s4YKzMX14NcaJdFNofp3BESpvkKqaAhSXiUadlEb57nzEAfx6u5
 vrJg==
X-Gm-Message-State: AOAM531wjJIWA8i2FpySy8Ur0h8bjZPKF0HsRVttlcn3Jgi+hFq30Uul
 yynysA4ZrW+goozPphOoRJg=
X-Google-Smtp-Source: ABdhPJx6x5DvBpxNGcTaCUEjWhqgu54+xFQlar7s/x0F/PYgdlmRNh35/SV8ouZBXYHiU/cDDsH2qw==
X-Received: by 2002:a05:6402:4384:b0:427:b5c0:4bf with SMTP id
 o4-20020a056402438400b00427b5c004bfmr26901283edc.127.1651770794750; 
 Thu, 05 May 2022 10:13:14 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 l21-20020a056402125500b0042617ba63c5sm1095383edw.79.2022.05.05.10.13.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 10:13:13 -0700 (PDT)
Message-ID: <93b47120-d90e-6de1-13c8-d1addc714c1b@redhat.com>
Date: Thu, 5 May 2022 19:13:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/2] Confine igd-passthrough-isa-bridge to XEN
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Anthony PERARD <anthony.perard@citrix.com>
References: <20220326165825.30794-1-shentey@gmail.com>
 <F58C8DE7-6EF1-49B5-AABA-FE7D754C7FC8@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <F58C8DE7-6EF1-49B5-AABA-FE7D754C7FC8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
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

On 5/5/22 18:56, Bernhard Beschow wrote:
> Am 26. März 2022 16:58:22 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
>> This patch series changes the "igd-passthrough-isa-bridge" device only to be
>> provided if CONFIG_XEN_PCI_PASSTHROUGH is true. With it xen_pt gets decoupled
>>from i386/pc.
>>
>> Bernhard Beschow (2):
>>   hw/xen/xen_pt: Confine igd-passthrough-isa-bridge to XEN
>>   hw/xen/xen_pt: Resolve igd_passthrough_isa_bridge_create() indirection
>>
>> hw/i386/pc_piix.c        | 118 -------------------------------------
>> hw/xen/xen_pt.c          |  12 ----
>> hw/xen/xen_pt.h          |   2 +
>> hw/xen/xen_pt_graphics.c | 122 +++++++++++++++++++++++++++++++++++++++
>> include/hw/i386/pc.h     |   1 -
>> 5 files changed, 124 insertions(+), 131 deletions(-)
>>
> 
> Ping
> 
> Thanks to Anthony the series is reviewed. Which tree wants to pick it up?
> 
> Best regards,
> Bernhard
> 

Queued, thanks.

Paolo

