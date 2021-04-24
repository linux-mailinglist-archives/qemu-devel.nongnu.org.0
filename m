Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 256D136A154
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 15:05:27 +0200 (CEST)
Received: from localhost ([::1]:50572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laHyP-0000oX-N2
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 09:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laHxZ-0000Au-9P
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 09:04:33 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:41848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laHxX-0000Sr-Lm
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 09:04:32 -0400
Received: by mail-wr1-x42d.google.com with SMTP id c4so12206860wrt.8
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 06:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YN6pRi8XtKN42mWBFVQnm5qI5Tt/DNQGG5wvJWS5jJk=;
 b=TVk5yesd0opGPmebFiULYt7loYcujRjQ/+e/FOi3Rs4YV5d1F9k/qHK3C1PAUiekQz
 aRH2eTM9rEXGPzSRgM2S6UlqtRi1hOc7EYlkmp4zHXRNzKZOMmsvEzhzpxCUwGb6ciuN
 Sc9ry+O6O8rbZQSYLNI5w+xsbPozorC3mCKllj8DTMDsgp/co8pHRJCtf1blhaiqcPYz
 9GCtqdNuEAdE0lXV9UU0hxwyL+qyLvYz7C8GEKFb2zbwJkR+Tj/InQwLIwizCgvdqso+
 R465ffcj+DB6Vo791LlGdq4uyfzBnHIxlA9kh/AxkYf2SNaENJ6IDGvoZylfWGRHPyGs
 Aw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YN6pRi8XtKN42mWBFVQnm5qI5Tt/DNQGG5wvJWS5jJk=;
 b=Sdu1xIUkvIkZkYXrRQrNq721AxSagTWFNXIKTLSrThctU7PM/W314PKoxuvxR6lEIU
 gknGeRsi71BcqpUaDZenS6FyTDzkJOU5ZsS4ZoZeiGarP614vxYXQHSz6dHx+s7Zhnbu
 MnV4/ZeKjj/3b9+pdjMvVi5V1VumbHNiS/zt0DMyZByvRjN5xyqy1OtrOUCf8on4/5wv
 Z1b3wXh0ZGUJqljFz9fvl3g2dsSip7SmJy4sMmH+WBgs8ZlNPqRIxoGODZkqZcgBoF1Z
 NStXrwCuqsubT/xAMaB6F7zko0D6lZXAjNL4vwQQJeK5RJQtaczo4K/AY0kG222m2hdp
 2SbQ==
X-Gm-Message-State: AOAM532SefTj0LkDdGuw6RBv/kfObxXQZWBiNe2kzNppTD1Je29HUf5C
 5iRJjaQKwbzshrf9S7wg1xzLp8LWLo1x2g==
X-Google-Smtp-Source: ABdhPJzn7Hov4oAS3jN5vwJgUsPkE3Ips/EcMTziA6O9nh6yYpwXOyf470B8YHkl6wj6FrYr6EbOdw==
X-Received: by 2002:a5d:610c:: with SMTP id v12mr3818094wrt.57.1619269469548; 
 Sat, 24 Apr 2021 06:04:29 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id p14sm12393233wrn.49.2021.04.24.06.04.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 06:04:28 -0700 (PDT)
Subject: Re: Resetting non-qdev children in a 3-phase reset device
To: Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <CAFEAcA8k+RUNhAOzCeefBs+vcyAgrtHwHMH9KfQb6OJg0su_7w@mail.gmail.com>
 <fc080508-9b82-8a2b-79bb-ab4e9f812cce@amsat.org>
 <CAFEAcA8hs3Uw=8-_CFa_GoMhmqxCcHw5t751oKzicd0_+Dh8kA@mail.gmail.com>
 <87y2datpyw.fsf@dusky.pond.sub.org>
 <5570bf5a-3cab-c30c-2c21-0ab02543199e@amsat.org>
 <2f4155ca-ee84-75f0-8b35-aac6b18ee4f0@amsat.org>
 <3dcb8efa-8f6b-0f45-a753-cc58d3bf9855@amsat.org>
 <87im4cb6ag.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b7f6752b-6f4c-a3d2-074c-0b41094d7dfa@amsat.org>
Date: Sat, 24 Apr 2021 15:04:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87im4cb6ag.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/24/21 7:28 AM, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
>>
>>> Looking at qemu_register_reset() uses I found this commit:
>>>
>>> commit 0c7322cfd3fd382c0096c2a9f00775818a878e13
>>> Date:   Mon Jun 29 08:21:10 2015 +0200
>>>
>>>  watchdog/diag288: correctly register for system reset requests
>>>
>>>  The diag288 watchdog is no sysbus device, therefore it doesn't get
>>>  triggered on resets automatically using dc->reset.
>>>
>>>  Let's register the reset handler manually, so we get correctly notified
>>>  again when a system reset was requested. Also reset the watchdog on
>>>  subsystem resets that don't trigger a full system reset.
>>>
>>> Why is the reset() handler in DeviceClass and not in SysbusDeviceClass
>>> if "Only sysbus devices get reset"? ...
>>
>> Ah, probably because the problem is generic to all busses (ISA, ...)
>> and not just sysbus.
> 
> diag288 is a bus-less device.  Propagating reset from the root of the
> qtree to the leaves won't reach it, because the qtree contains only the
> devices that plug into a qbus.

I now understand better the diag288 case, but I still don't understand
the TYPE_APIC one. It has no DeviceClass::reset(), its abstract parent
TYPE_APIC_COMMON register apic_reset_common() but being TYPE_DEVICE it
is not on a qbus. It is somehow connected to the X86CPU object, but the
single call to apic_init_reset() is from do_cpu_init() - not a reset
method -.
Is apic_reset_common() dead code? I don't think so because git-blame
report activity:

  2013-11-05 266) static void apic_reset_common(DeviceState *dev)
  2011-10-16 267) {
  2013-11-05 268)     APICCommonState *s = APIC_COMMON(dev);
  2012-02-17 269)     APICCommonClass *info = APIC_COMMON_GET_CLASS(s);
  2015-04-07 270)     uint32_t bsp;
  2011-10-16 271)
  2015-04-07 272)     bsp = s->apicbase & MSR_IA32_APICBASE_BSP;
  2015-04-07 273)     s->apicbase = APIC_DEFAULT_ADDRESS | bsp |
MSR_IA32_APICBASE_ENABLE;
  2016-10-19 274)     s->id = s->initial_apic_id;
  2011-10-16 275)
  2017-01-31 276)     apic_reset_irq_delivered();
  2017-01-31 277)
  2012-02-17 278)     s->vapic_paddr = 0;
  2012-02-17 279)     info->vapic_base_update(s);
  2012-02-17 280)
  2013-11-05 281)     apic_init_reset(dev);
  2011-10-16 282) }

Cc'ing APIC maintainers because I'm lost.

