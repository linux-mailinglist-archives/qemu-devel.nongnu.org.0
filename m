Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE983E23BD
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 09:10:29 +0200 (CEST)
Received: from localhost ([::1]:59224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBtzw-0002fE-V9
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 03:10:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBtzA-0001jb-3c
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 03:09:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBtz7-0004dx-IG
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 03:09:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628233776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xTsqqTAh9rgL5puHOUW2vUf8hv8RUIKLGRdtAAgA7zE=;
 b=WIedMSfTBheIym+qefnQmtMoPauM36g+WPaOGzFbRkU7PoKdHepBIZ9DyXfQh2ssjXgNIG
 vFxUzctAXkHPO3iz1WstMiF7lN4rL6bpUEt78AkWI3ulKsXlziBpicC0tGlJf1S+yHM4PU
 y+u1vDnvmWz4J1T7a9ri9mo5y0mRtWE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-Vn_zAN8wPBqgJG0jHIKU8Q-1; Fri, 06 Aug 2021 03:09:34 -0400
X-MC-Unique: Vn_zAN8wPBqgJG0jHIKU8Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 85-20020a1c01580000b02902511869b403so3555296wmb.8
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 00:09:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xTsqqTAh9rgL5puHOUW2vUf8hv8RUIKLGRdtAAgA7zE=;
 b=d+zAioEbnhEviJF1ikaCERe5nWaJLdTsO4M11qTxIs0/gfgM4EiBXEmXOglfJeKAZp
 3QluRC6E/QSnfTT3hWAYMS1IrdhjJDu2RcCS8o6zO5TQGLDlUw7NgrcEHCHpXtksz/w4
 sWPgVT1byq9f8brac5dRRW80o6r1q8C+M8qQAXZqxNtlyZL9I2FSxMloQqoKY1lx0mIO
 eokwmUQlZJPohaa/SWEFxnXPOLBqmX+nYYyNJ+1KLJYsp3sP78z/eoaUfP4WXv3w0RJb
 8WI5Exot6/K856qMuT/Z4MyREcOu3sAHT+y1NDz2X/q86YecpcVdYNQbO9WrOfnOK9y7
 CrUQ==
X-Gm-Message-State: AOAM533SSutGm+Fko7OwLl0oWUlXqup1PZU+2FQMRu1iHk1arvYjh0jD
 7jv1bpxDD5ekeeqsWlUSUmqVFOsdsQVyMgHd285VM137HQOoLGV5t5kklj35BLrz4ntCzI3URub
 g7CM58QMxtOEkJB/JgUsGCg0dwz59xzoxiUBuaiWOFp7cySpis3v7X/mI8HJmoiI=
X-Received: by 2002:a1c:4b04:: with SMTP id y4mr1730427wma.133.1628233773790; 
 Fri, 06 Aug 2021 00:09:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxa2UUJj+2jAn8nshy6UqCXff0OKR6kivGX/NSfpScO3bmlmXZ00UJfHd8CFTVxbC+cmAEz/A==
X-Received: by 2002:a1c:4b04:: with SMTP id y4mr1730385wma.133.1628233773372; 
 Fri, 06 Aug 2021 00:09:33 -0700 (PDT)
Received: from thuth.remote.csb
 (dynamic-046-114-147-107.46.114.pool.telefonica.de. [46.114.147.107])
 by smtp.gmail.com with ESMTPSA id a12sm11040458wmj.22.2021.08.06.00.09.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 00:09:32 -0700 (PDT)
Subject: Re: [PATCH v2] hw/display/xlnx_dp: fix an out-of-bounds read in
 xlnx_dp_read
To: Qiang Liu <cyruscyliu@gmail.com>
References: <1628059910-12060-1-git-send-email-cyruscyliu@gmail.com>
 <22f355e1-1c2c-cf24-ad41-45c937221bea@redhat.com>
 <CAAKa2jn++EK1S1WDChL=uu8YsX2y7DbqoF11_70jLYaw7ytMuA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b33a6638-260d-72fe-2b7e-cde99594d059@redhat.com>
Date: Fri, 6 Aug 2021 09:09:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAAKa2jn++EK1S1WDChL=uu8YsX2y7DbqoF11_70jLYaw7ytMuA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/08/2021 09.00, Qiang Liu wrote:
> On Wed, Aug 4, 2021 at 3:43 PM Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 04/08/2021 08.51, Qiang Liu wrote:
>>> xlnx_dp_read allows an out-of-bounds read at its default branch because
>>> of an improper index.
>>>
>>> According to
>>> https://www.xilinx.com/html_docs/registers/ug1087/ug1087-zynq-ultrascale-registers.html
>>> (DP Module), registers 0x3A4/0x3A4/0x3AC are allowed.
>>>
>>> DP_INT_MASK     0x000003A4      32      mixed   0xFFFFF03F      Interrupt Mask Register for intrN.
>>> DP_INT_EN       0x000003A8      32      mixed   0x00000000      Interrupt Enable Register.
>>> DP_INT_DS       0x000003AC      32      mixed   0x00000000      Interrupt Disable Register.
>>>
>>> In xlnx_dp_write, when the offset is 0x3A8 and 0x3AC, the virtual device
>>> will write s->core_registers[0x3A4
>>>>> 2]. That is to say, the maxize of s->core_registers could be ((0x3A4
>>>>> 2) + 1). However, the current size of s->core_registers is (0x3AF >>
>>>>> 2), that is ((0x3A4 >> 2) + 2), which is out of the range.
>>> In xlxn_dp_read, the access to offset 0x3A8 or 0x3AC will be directed to
>>> the offset 0x3A8 (incorrect functionality) or 0x3AC (out-of-bounds read)
>>> rather than 0x3A4.
>>>
>>> This patch enforces the read access to offset 0x3A8 and 0x3AC to 0x3A4,
>>> but does not adjust the size of s->core_registers to avoid breaking
>>> migration.
>>>
>>> Fixes: 58ac482a66de ("introduce xlnx-dp")
>>> Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
>>> ---
>>> v2:
>>>     - not change DP_CORE_REG_ARRAY_SIZE
>>>     - add a qtest reproducer
>>>     - update the code style
>>>
>>> I have a question about the QTest reproducer. Before patching xlnx-dp,
>>> (0x3ac >> 2) will exceed the right bound of s->core_registers.  However,
>>> this is allowed by the assertion. There is no warning and this
>>> reproducer will pass. Is the reprodocer OK?
>>>
>>>    hw/display/xlnx_dp.c            |  6 +++++-
>>>    tests/qtest/fuzz-xlnx-dp-test.c | 33 +++++++++++++++++++++++++++++++++
>>>    tests/qtest/meson.build         |  1 +
>>>    3 files changed, 39 insertions(+), 1 deletion(-)
>>>    create mode 100644 tests/qtest/fuzz-xlnx-dp-test.c
>>>
>>> diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
>>> index 7bcbb13..747df6e 100644
>>> --- a/hw/display/xlnx_dp.c
>>> +++ b/hw/display/xlnx_dp.c
>>> @@ -714,7 +714,11 @@ static uint64_t xlnx_dp_read(void *opaque, hwaddr offset, unsigned size)
>>>            break;
>>>        default:
>>>            assert(offset <= (0x3AC >> 2));
>>> -        ret = s->core_registers[offset];
>>> +        if (offset == (0x3A8 >> 2) || offset == (0x3AC >> 2)) {
>>> +            ret = s->core_registers[DP_INT_MASK];
>>> +        } else {
>>> +            ret = s->core_registers[offset];
>>> +        }
>>>            break;
>>>        }
>>>
>>> diff --git a/tests/qtest/fuzz-xlnx-dp-test.c b/tests/qtest/fuzz-xlnx-dp-test.c
>>> new file mode 100644
>>> index 0000000..69eb6c0
>>> --- /dev/null
>>> +++ b/tests/qtest/fuzz-xlnx-dp-test.c
>>
>> Would it make sense to call the file xlnx-zcu102.c instead, in case we want
>> to add other tests related to this machine later?
> It seems that each file in tests/qtest is called by the name of a
> single virtual device. I follow this pattern. Additionally, maybe if,
> in the future, xlnx-dp is used by another machine, then it is not
> proper to call the file xlnx-zcu102. What do you think about it?

Ok, fair points, then let's keep the name as you suggested.

  Thomas


