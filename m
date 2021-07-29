Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 076BB3DA0CC
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 12:04:57 +0200 (CEST)
Received: from localhost ([::1]:45744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m92uO-0001Yk-3L
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 06:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m92sd-0007z0-Am
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 06:03:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m92sb-0008QU-AA
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 06:03:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627552984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pjNq3aUS0tRCKrKgwFRWy9CefGYJeMQaVFY+KaxlMN0=;
 b=FSxFquzAlIyGM5nwSKZ2ySl4t0mPWHSXb+ON12G+r+itrm0WJSFKY3BO8+Lc2gyewdEsQN
 kzXqXmT3bR5VdXfY02ghkbSXkXsIWMCbAUc0Wq64fyabWTw28rt4Z4MUoGD3tOcFEQC/yG
 8i4PLM9+OwjuJzfPfLOy39hBsTbcn3o=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-GPCrodYINBazOgJWd5Bukw-1; Thu, 29 Jul 2021 06:03:02 -0400
X-MC-Unique: GPCrodYINBazOgJWd5Bukw-1
Received: by mail-wr1-f72.google.com with SMTP id
 f6-20020adfe9060000b0290153abe88c2dso2063555wrm.20
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 03:03:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pjNq3aUS0tRCKrKgwFRWy9CefGYJeMQaVFY+KaxlMN0=;
 b=hcohNc2hjjBhFjfBdM/qVy/dRCirHtK4m9IM/mmIlx/hFPCPANYz3DFXHuOGexVFrH
 kEFABEsqs+O1lRR7TnppUDNcHHHRannAB8NAQBA9dZdrxwIXjmXiInxJ+5uNtolqe/5o
 lhkxdflB9XglOsLajGjZyar83bjRAYPG7t6oIN+xAqLBy7IvcIfuQ+Z87MeeXsqh+Obn
 Wm42JWuoi+4jxbYi0HvO+KSmRT9MkfJfaYOuF5kmDCcTY071nVULQJNbECzTyuxIdCTF
 cL8Wq86DzjanitHzMo06Hg4OoKCG7mAQWT1fOkMJgYI8MlutqMttjSY8n9YXldkG+07+
 PJNQ==
X-Gm-Message-State: AOAM532Yb6n8vJHFoHh508MoVWMyigjSJVc0OyV5ZA2C2EowLp59L4TA
 WdFP3JGzSnpAc6zWMl4a40fwvR/bhlvHuKZBuoplyncdOE3d+Rv6PpRYu1CABMwJSuGMTNLpv9d
 p+VuPvaS2Joc2Rnw=
X-Received: by 2002:a5d:63d1:: with SMTP id c17mr3922341wrw.328.1627552981664; 
 Thu, 29 Jul 2021 03:03:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9Rjb4WHyYdUtjMDl5a+xHE98DIyjyu532iJ8M95LD4Pv4CbE1ImNoh8qEWl+ZF34kngLVDg==
X-Received: by 2002:a5d:63d1:: with SMTP id c17mr3922315wrw.328.1627552981483; 
 Thu, 29 Jul 2021 03:03:01 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id y19sm899713wmq.5.2021.07.29.03.03.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 03:03:01 -0700 (PDT)
Subject: Re: [PATCH-for-6.1] hw/net/can: sja1000 fix buff2frame_bas for dlc
 out of std CAN 8 bytes
To: Pavel Pisa <pisa@cmp.felk.cvut.cz>, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Qiang Ning <ningqiang1@huawei.com>
References: <20210726162458.26197-1-pisa@cmp.felk.cvut.cz>
 <202107291119.33951.pisa@cmp.felk.cvut.cz>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2a962eb1-8cd2-dcec-7b23-46f0fa93903f@redhat.com>
Date: Thu, 29 Jul 2021 12:03:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <202107291119.33951.pisa@cmp.felk.cvut.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.277, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vikram Garhwal <fnu.vikram@xilinx.com>,
 Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-devel@nongnu.org, Francisco Iglesias <francisco.iglesias@xilinx.com>,
 Bandan Das <bsd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing QEMU fuzz team.

On 7/29/21 11:19 AM, Pavel Pisa wrote:
> Hello everybody,
> 
> please, can somebody accept the fix for master?
> It should be ideally applied even to stable
> branches.
> 
> Or should I send request through some other form
> then on the list?

I suppose the patch fell through the cracks.

Apparently Paolo doesn't like to queue fuzzer fixes without
reproducer. For examples see tests/qtest/fuzz-*.c in the tree.

> 
> Thanks,
> 
> Pavel
> 
> On Monday 26 of July 2021 18:24:58 Pavel Pisa wrote:
>> Problem reported by openEuler fuzz-sig group.
>>
>> The buff2frame_bas function (hw\net\can\can_sja1000.c)
>> infoleak(qemu5.x~qemu6.x) or stack-overflow(qemu 4.x).
>>

If you want the patch backported in stable releases, please
include:

Cc: qemu-stable@nongnu.org

>> Reported-by: Qiang Ning <ningqiang1@huawei.com>
>> Signed-off-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>
>> ---
>>  hw/net/can/can_sja1000.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/hw/net/can/can_sja1000.c b/hw/net/can/can_sja1000.c
>> index 42d2f99dfb..64e81bff58 100644
>> --- a/hw/net/can/can_sja1000.c
>> +++ b/hw/net/can/can_sja1000.c
>> @@ -311,6 +311,10 @@ static void buff2frame_bas(const uint8_t *buff,
>> qemu_can_frame *frame) }
>>      frame->can_dlc = buff[1] & 0x0f;
>>
>> +    if (frame->can_dlc > 8) {
>> +        frame->can_dlc = 8;
>> +    }
>> +

This doesn't seem a complete fix (see buff2frame_pel).

Here can_dlc shouldn't be more than 8.

What you can do here (and in buff2frame_pel) is:

        assert(frame->can_dlc <= 8);

and find where the field is abused, probably discarding
invalid frames earlier?

>>      for (i = 0; i < frame->can_dlc; i++) {
>>          frame->data[i] = buff[2 + i];
>>      }


