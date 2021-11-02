Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7311442E62
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:44:35 +0100 (CET)
Received: from localhost ([::1]:54862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mht9V-0001Rl-JF
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:44:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mht20-0007MV-2e
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:36:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mht1w-0002x8-MS
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:36:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635856602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4gwckC7RYEXUs7H3ALUzUASKNSlq5QBVVpfYzz5u0E8=;
 b=THyiU8qYqvr2X7GbK1F8h76dIRc9j1FZMUcsAQCeNa9324Prtxat98pdc/btfV2O5Wy/wS
 Q1zW/DewtPQPWu8kIGEmrYIx66WoFmomPHQ56bRC4pSWKD9d/HgFHcU2vlIH2IREhj4284
 AUwRfOkqCgC2QbLX/iUibuAj9sipddQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-lLwiED1qMUSP-IY7aZDkrg-1; Tue, 02 Nov 2021 08:36:41 -0400
X-MC-Unique: lLwiED1qMUSP-IY7aZDkrg-1
Received: by mail-wr1-f71.google.com with SMTP id
 f3-20020a5d50c3000000b00183ce1379feso2772317wrt.5
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 05:36:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4gwckC7RYEXUs7H3ALUzUASKNSlq5QBVVpfYzz5u0E8=;
 b=q3/TYRo1p8hyNtqgQ4e8lnssUAlsWrrSmYA+A0ykeIwJSevZQlleu/qLgFAq7wKJWl
 zXRzdXnUzudNjLCnkLSX+xfrFez3hrGyecU41DWl0XTGXFfc+1SSRz/YkRBMr2/ovyVC
 16wwxZsjkyiFustNBTYoPOm7a0OY2n6WrAPmLkl+AWVLal/tEnWr07k90A3lS+RSdHmK
 Hlf28vCFp516ZoA2jKLF01gCPTmlcbNpU/LaCC0haTO9K1J9oqEAGJ1QRzqEdsNTJPvA
 aJT4Bw0J7NMx5G9lEWL2wwTnKxHJq6K3UxEmwM/LuvniVeWBp/Z1/wbQBNCyvkhiZJIy
 lWdA==
X-Gm-Message-State: AOAM530jmJDrYaVa4ZiIcFMZ92jKoVy8bTYXBBo2tcmA5VL9VSD2aWnu
 wokWOJYkyOwvQccZgqxMr3QdZpB5hHxajzGDJNaBdk6amNTDj1SRlBLojkDfOmoBfeOo7BwrG7U
 QMrLabrJENV/zg1A=
X-Received: by 2002:a05:600c:a42:: with SMTP id
 c2mr6767681wmq.154.1635856600263; 
 Tue, 02 Nov 2021 05:36:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVFd40y+SUm+5oqc7CrwRZIyew2UFcXZMBzt+u0utRE0U2bFr3p6MKpg6EKmzArxqQcxlCYA==
X-Received: by 2002:a05:600c:a42:: with SMTP id
 c2mr6767657wmq.154.1635856600106; 
 Tue, 02 Nov 2021 05:36:40 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id b10sm1145941wrt.36.2021.11.02.05.36.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 05:36:39 -0700 (PDT)
Message-ID: <09f679c0-98e6-e5d5-4a1d-8376c8af51e4@redhat.com>
Date: Tue, 2 Nov 2021 13:36:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 5/5] block/nvme: Fix memory leak from nvme_init_queue()
To: Kevin Wolf <kwolf@redhat.com>
References: <20211006164931.172349-1-philmd@redhat.com>
 <20211006164931.172349-6-philmd@redhat.com>
 <YV72QsbNN3Eb2kLV@stefanha-x1.localdomain>
 <19edd050-c09f-2039-0c89-50bcae61321f@redhat.com>
 <YYEwDRCvNpct0BeB@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <YYEwDRCvNpct0BeB@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/2/21 13:33, Kevin Wolf wrote:
> Am 07.10.2021 um 15:34 hat Philippe Mathieu-Daudé geschrieben:
>> On 10/7/21 15:29, Stefan Hajnoczi wrote:
>>> On Wed, Oct 06, 2021 at 06:49:31PM +0200, Philippe Mathieu-Daudé wrote:
>>>> nvme_create_queue_pair() allocates resources with qemu_vfio_dma_map(),
>>>> but we never release them. Do it in nvme_free_queue() which is called
>>>> from nvme_free_queue_pair().
>>>>
>>>> Reported by valgrind:
>>>>
>>>>   ==252858== 520,192 bytes in 1 blocks are still reachable in loss record 8,293 of 8,302
>>>>   ==252858==    at 0x4846803: memalign (vg_replace_malloc.c:1265)
>>>>   ==252858==    by 0x484691F: posix_memalign (vg_replace_malloc.c:1429)
>>>>   ==252858==    by 0xB8AFE4: qemu_try_memalign (oslib-posix.c:210)
>>>>   ==252858==    by 0xA9E315: nvme_create_queue_pair (nvme.c:229)
>>>>   ==252858==    by 0xAA0125: nvme_init (nvme.c:799)
>>>>   ==252858==    by 0xAA081C: nvme_file_open (nvme.c:953)
>>>>   ==252858==    by 0xA23DDD: bdrv_open_driver (block.c:1550)
>>>>   ==252858==    by 0xA24806: bdrv_open_common (block.c:1827)
>>>>   ==252858==    by 0xA2889B: bdrv_open_inherit (block.c:3747)
>>>>   ==252858==    by 0xA28DE4: bdrv_open (block.c:3840)
>>>>   ==252858==    by 0x9E0F8E: bds_tree_init (blockdev.c:675)
>>>>   ==252858==    by 0x9E7C74: qmp_blockdev_add (blockdev.c:3551)
>>>>
>>>> Fixes: bdd6a90a9e5 ("block: Add VFIO based NVMe driver")
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>> ---
>>>>  block/nvme.c | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/block/nvme.c b/block/nvme.c
>>>> index 6e476f54b9f..903c8ffa060 100644
>>>> --- a/block/nvme.c
>>>> +++ b/block/nvme.c
>>>> @@ -185,6 +185,7 @@ static bool nvme_init_queue(BDRVNVMeState *s, NVMeQueue *q,
>>>>  
>>>>  static void nvme_free_queue(BDRVNVMeState *s, NVMeQueue *q)
>>>>  {
>>>> +    qemu_vfio_dma_unmap(s->vfio, q->queue);
>>>>      qemu_vfree(q->queue);
>>>>  }
>>>
>>> I can't figure out the issue. qemu_vfree(q->queue) was already called
>>> before this patch. How does adding qemu_vfio_dma_unmap() help with the
>>> valgrind report in the commit description?
>>
>> You are right, I think I didn't select the correct record
>> between the 8302 reported by valgrind. I will revisit, thanks.
> 
> Should we still merge (parts of) this series for 6.2? Or does this mean
> that we don't want it at all?

Patches #1-4 are cleanups welcome for 6.2 :) However we do not want #5.


