Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC4E31CF1D
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 18:34:17 +0100 (CET)
Received: from localhost ([::1]:47480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC4Eq-0007dD-C5
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 12:34:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lC4C1-0006N2-7h
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 12:31:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lC4Bx-00085u-UD
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 12:31:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613496675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0R/REM+fkNYSL2EOeATww8cUnuH/U9oV46Z8IZCblDU=;
 b=OqExFYnRfn4EZVLQ7tsK62UICCiz1cJL+z16+1o82RDIEPe3QNjz/dJOuglAPE5j2Poo/W
 h1CHpoGgJnDEY/qqifIFQMFtN/H8KwgaoqVajE2yXYRjWFTYLAr7jG6YjV7XIA1Ud31/sg
 o2C/SJwdbtf5dRaYjstLbYRHuo1DrX4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-YgLaYEl4PIqhTf2pqpUKng-1; Tue, 16 Feb 2021 12:31:12 -0500
X-MC-Unique: YgLaYEl4PIqhTf2pqpUKng-1
Received: by mail-wr1-f69.google.com with SMTP id e11so13325847wro.19
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 09:31:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0R/REM+fkNYSL2EOeATww8cUnuH/U9oV46Z8IZCblDU=;
 b=NpN9M7BfA6sZQueOa4fUafPul19vArVdA1saqvqnlmKe/vSa/fxw+iZDg58PbPb8Cl
 3UPE8j8YfTSVBtxfCgxkUrBcVbVoxXtcOMYEsUAZ+omNL/D/U+BEIZW+aooQHz0cX18X
 XxQ5DgmNdI+7gLI90mIPjveIx/cV3BwpCujDn9ibrGna6D9xBw/+vze6vN+/4EpGnFeR
 C51ca8MCWuY5qxIlOR9RnwA5TlC6Ba8RsL/dSPNXHyBaZyqmFrGj48ClvTzj9dDJ56Hc
 PridvuIR+pob8DcOMbPC+yAJ9oHq7RzW6aqRLITQiYQ++Y25pQ8SuX4ePmfzcstT4AGN
 WiNQ==
X-Gm-Message-State: AOAM532JkW+VcYTFkQsYExlqG1u0oq4x/AgVyzS6z1TNhPaW3ZGfnin8
 O9sIYDA9bmHFafrD76nZrtNk9mnZSG7h9UULcFKG5+t11RawQJRxbOg9y0tWX1k/gHsK9GsXFv6
 tOhEUeGbE9MKNgnqaEwynuk0lGccQuoHPGbNa5gn7ozAFfSk7q4LLUh69nfpIKdba
X-Received: by 2002:a1c:2090:: with SMTP id g138mr4038823wmg.137.1613496670695; 
 Tue, 16 Feb 2021 09:31:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyKycXNNJh3qQlfqSXMUKLEWnNTnikgQNu6Zm2K2kGNxVHYqF8q7SP+BeOtBqaHPn/T5vWx1g==
X-Received: by 2002:a1c:2090:: with SMTP id g138mr4038799wmg.137.1613496670312; 
 Tue, 16 Feb 2021 09:31:10 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id h18sm17073989wrm.54.2021.02.16.09.31.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Feb 2021 09:31:09 -0800 (PST)
Subject: Re: [PATCH] qtest: add a reproducer for LP#1878642
To: Alexander Bulekov <alxndr@bu.edu>, Peter Maydell <peter.maydell@linaro.org>
References: <20201102163336.115444-1-alxndr@bu.edu>
 <CAFEAcA9d=ZTXzK+u5rjFvkiA53izTBq5Hm5VwQ9=WEAZX+TRJg@mail.gmail.com>
 <20210216150025.ujuq7cxspep2kaei@mozz.bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <25d3918d-913b-a2c6-209f-92732002e823@redhat.com>
Date: Tue, 16 Feb 2021 18:31:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210216150025.ujuq7cxspep2kaei@mozz.bu.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 4:00 PM, Alexander Bulekov wrote:
> On 210216 1325, Peter Maydell wrote:
>> On Mon, 2 Nov 2020 at 16:35, Alexander Bulekov <alxndr@bu.edu> wrote:
>>>
>>> https://bugs.launchpad.net/qemu/+bug/1878642
>>>
>>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>>> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
>>> ---
>>>
>>> Based-on: <20200717151705.18611-1-f4bug@amsat.org>
>>>
>>> The added testcase will fail, unless this ^^^ patch is applied.
>>>
>>>  tests/qtest/fuzz-test.c | 15 +++++++++++++++
>>>  1 file changed, 15 insertions(+)
>>>
>>> diff --git a/tests/qtest/fuzz-test.c b/tests/qtest/fuzz-test.c
>>> index 2f38bb1ec2..9cb4c42bde 100644
>>> --- a/tests/qtest/fuzz-test.c
>>> +++ b/tests/qtest/fuzz-test.c
>>> @@ -34,6 +34,19 @@ static void test_lp1878263_megasas_zero_iov_cnt(void)
>>>      qtest_quit(s);
>>>  }
>>>
>>> +static void test_lp1878642_pci_bus_get_irq_level_assert(void)
>>> +{
>>> +    QTestState *s;
>>> +
>>> +    s = qtest_init("-M pc-q35-5.0 "
>>> +                   "-nographic -monitor none -serial none "
>>> +                   "-d guest_errors -trace pci*");
>>> +
>>> +    qtest_outl(s, 0xcf8, 0x8400f841);
>>> +    qtest_outl(s, 0xcfc, 0xebed205d);
>>> +    qtest_outl(s, 0x5d02, 0xebed205d);
>>> +}
>>
>> Hi; I just noticed this, but why does this test case pass
>> "-trace pci*" to QEMU? It doesn't look like it does anything to
>> try to capture the trace output, which thus winds up just going
>> to the stdout/stderr of the "make check" run. Similarly I'm not
>> sure '-d guest_errors' is going to do anything helpful unless
>> you take steps to capture the output and check it.

I suppose Alex took it from commit 4177b062fc5 ("hw/isa/lpc_ich9:
Ignore reserved/invalid SCI IRQ") where it is used to show the
problem the fuzzer reproducer triggers. Not useful in regular testing.

> Ah, I sometimes include those in the initial report, if the device has
> trace-events. I can remove this from fuzz-test.c, if it is slowing
> things down.

I doubt it is slowing things down, but it probably make it harder to
find other problems (I suppose Peter got confused when looking for
another failure and found these traces).


