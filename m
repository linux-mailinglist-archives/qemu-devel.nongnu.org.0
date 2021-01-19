Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 634392FAE99
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 03:07:16 +0100 (CET)
Received: from localhost ([::1]:59142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1gQM-0000GM-UR
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 21:07:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1l1gPF-00082m-HB
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 21:06:05 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:37387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1l1gP9-0003hz-IH
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 21:06:01 -0500
Received: by mail-pg1-x52e.google.com with SMTP id z21so12081032pgj.4
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 18:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RvzTChAIc1/SbpMCVQ4pEZrH1h53bc7Zwa1KKLM9L8I=;
 b=ce9zYGgLZ8BImLfIRDtIRxiPX1dhshVI6FYkTDO5NQewa+XHtzaGSuEsERUfVSWkpY
 K5ZHbQLinXVKYXB451Me4mtp6lNl2/98Y2RRRy/2MMfU9JXDxCtmm3gtZihe4iy93fvK
 Y5HCCZOsgLQ1ur4adFYJP09GUeU7Ki6i8iwfZ6chmYfiOzEG37T92SPLOSlRppx+V1I/
 GJvPN2OEi7NF9QS2EMXR0c7DLfeAK1CzP5MKggwmz8OCpO+NKvADH7UXkcJuHr8S9Vpy
 5FwNpjpP6bQX+5RhvYmF7d0lt6gyI1iriXKgrCN4EBRSHKqGZEgTL+q1d1YB1BMMFZCc
 RBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RvzTChAIc1/SbpMCVQ4pEZrH1h53bc7Zwa1KKLM9L8I=;
 b=PtUBnkw/ku4qT1icvM8/GdCq2FsosnpTzZWHxnejrLm05VatnkSvRocg8toyt51T2+
 36mwGUOl4TEq3wJNcv6UEiDEh4MGNXT1V45ls6o/L0J1tvhBZIb7zy4JwCDDbmb78EVl
 gFqsqU+47KT7Cmu4beVAdGy4o8YfbdlJNK1HN+deR6Ye1GokZis2yEIaRXy3z+PHAFGH
 0lZv0EIQzqJ/KUs+AQXOj4zvKZ9E6GzLaU+4ekqiKjOdGEEsYuI5mgpFWzvvrttbghjl
 70PzNh4Ybu0MRXLlPj1DcMRvnSn0t+kvmGOTgLxoxwaZnOTpbkL+6Ypw0DJ3fagkC08g
 Ki6A==
X-Gm-Message-State: AOAM5332uQ4Bf3KGx6zE5cnDOebLT7bky79m4E3MVDlUHLFcvoX3UU5i
 CUw2FXEUKYq0gD73f6XWiQlESjS8U2VTc6BnZ5w=
X-Google-Smtp-Source: ABdhPJy14J5RV0vlrwPySbkGFfJ5sql6nq+hu4BGBFf26NoKDYKMe/grEmP/lAuJ2PBJrUAMEHGUWQ==
X-Received: by 2002:a62:778c:0:b029:1b6:1f1e:e156 with SMTP id
 s134-20020a62778c0000b02901b61f1ee156mr1917837pfc.26.1611021956399; 
 Mon, 18 Jan 2021 18:05:56 -0800 (PST)
Received: from [10.2.218.189] ([61.120.150.75])
 by smtp.gmail.com with ESMTPSA id g30sm16177814pfr.152.2021.01.18.18.05.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Jan 2021 18:05:55 -0800 (PST)
Subject: Re: Re: [PATCH v4 0/3] support NVMe smart critial warning injection
To: k.jensen@samsung.com
References: <20210115032702.466631-1-pizhenwei@bytedance.com>
 <YAVWGC4HKFlaKolQ@apples.localdomain>
From: zhenwei pi <pizhenwei@bytedance.com>
Message-ID: <1797a9bb-f0bf-4377-2fb7-e3dc6fcba733@bytedance.com>
Date: Tue, 19 Jan 2021 10:05:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <YAVWGC4HKFlaKolQ@apples.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 NICE_REPLY_A=-0.194, RCVD_IN_DNSWL_NONE=-0.0001, SORTED_RECIPS=2.499,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, kbusch@kernel.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/21 5:34 PM, Klaus Jensen wrote:
> On Jan 15 11:26, zhenwei pi wrote:
>> v3 -> v4:
>> - Drop "Fix overwritten bar.cap". (Already fixed)
>>
>> - Avoid to enqueue the duplicate event.
>>
>> - Several minor changes for coding style & function/variable name.
>>
>> v2 -> v3:
>> - Introduce "Persistent Memory Region has become read-only or
>>    unreliable"
>>
>> - Fix overwritten bar.cap
>>
>> - Check smart critical warning value from QOM.
>>
>> - Trigger asynchronous event during smart warning injection.
>>
>> v1 -> v2:
>> - Suggested by Philippe & Klaus, set/get smart_critical_warning by QMP.
>>
>> v1:
>> - Add smart_critical_warning for nvme device which can be set by QEMU
>>    command line to emulate hardware error.
>>
>> Zhenwei Pi (3):
>>    block/nvme: introduce bit 5 for critical warning
>>    hw/block/nvme: add smart_critical_warning property
>>    hw/blocl/nvme: trigger async event during injecting smart warning
>>
>>   hw/block/nvme.c      | 91 +++++++++++++++++++++++++++++++++++++++-----
>>   hw/block/nvme.h      |  1 +
>>   include/block/nvme.h |  3 ++
>>   3 files changed, 86 insertions(+), 9 deletions(-)
>>
> 
> This looks pretty good to me.
> 
> I think maybe we want to handle the duplicate event stuff more generally
> from the AER/AEN code, but this does the job.
> 
> Tested-by: Klaus Jensen <k.jensen@samsung.com>
> Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
> 

What's the next step I should take? Should I push a new version to 
implement this purpose? From my understanding, before inserting a new 
event to aer_queue, I can parse all the pending aer to find the same event.

nvme_enqueue_event()
{
     ...

     QTAILQ_FOREACH_SAFE(event, &n->aer_queue, entry, next) {
         if ((event->result.event_type == event_type)
             && (event->result.event_info == event_info)
             && (event->result.log_page == log_page))
             return;
     }

     QTAILQ_INSERT_TAIL(&n->aer_queue, event, entry); 
 
 

     n->aer_queued++;
     ...
}

-- 
zhenwei pi

