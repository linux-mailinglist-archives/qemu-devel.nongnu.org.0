Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD73363784
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 22:18:16 +0200 (CEST)
Received: from localhost ([::1]:52710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYDry-0000mx-MG
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 16:18:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYDqM-0008Lf-Jw
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 16:16:34 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYDqK-00072l-P1
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 16:16:34 -0400
Received: by mail-wr1-x42c.google.com with SMTP id c15so22890943wro.13
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 13:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=e2FmFynuHeuy/7CZjNglCVyw8QeU6ZaCnvL1wPVPgNY=;
 b=IH5RUKH9bd6LGMgGVcf6C/AYXTEW2gMc+KgweAgwQxBHOvpO4KW/lyguRHPXhBAq8+
 ID0EmSiNgykmhXRw06EEkKmWalAPv3WlqR7BYkaxUSYsZAbiwjQljQ1oaLlGwQk1C3eX
 TxcV6QneYvgCjOqNUpAU0Ank34UyaqBnt9sDFALhtXbUVONhiVygrADZqLpZxIj3IhYN
 ShSpyg503ITS0zUqkHhOfU1dzeJzDfqhISZdYmpuKzew7bjZtUJiTvbFQdM3p2N7JLnu
 5ESou1gWfICASrOP35ORh4QSdy6kMeFDeAA55yZsRR5k3MnUrTJbrpvf1HxdlvTbWygA
 ndOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e2FmFynuHeuy/7CZjNglCVyw8QeU6ZaCnvL1wPVPgNY=;
 b=lXFjpWr7oRJg9nNk5Tb2+4X1ULBWi1YM3awoZ+UOg+2Swg6h7daSlMdZFaM9sYdWcb
 O4HiwHXJIsydcNcMmMnJjiAGS2gPHGTRhEhqqnEf+GNZmQUK5fpvcpBEkcv21vFxn9mH
 d8zSQQI9Wc8kf72XD1OgodvJbw9TZye46blb2b9geOxQbuf9mTa8jmUseZi7mUnlSsXZ
 TZTu0HE15n1T/O7fhU2BHIcl9BjzBei8nWN5M3ymbJOVLmkYXO+psi0HnVBzzw0kfTRO
 vDNix8eJ1zaq8IlPxj/AloA6Fls/RiAKhK3B8jHIIUWRicIZG8DPO8pBsJpqVMThRSOH
 DrJA==
X-Gm-Message-State: AOAM531FtzoxPs69wZ/Il4M/4EN42f7b7GO0EuDH4mapyRNtDQjvAiSX
 cvj6huj8bZWac8ER82px9QClIns5EhsIkA==
X-Google-Smtp-Source: ABdhPJzjcN7eDrIxWhHJ/ZrAplMBHVSjoHlmlKKRTd7KhJZM7qF9JnzRag5jytTlQhoKMb5Gm35agw==
X-Received: by 2002:a5d:69d0:: with SMTP id s16mr10747785wrw.102.1618776991248; 
 Sun, 18 Apr 2021 13:16:31 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id m14sm830196wmq.44.2021.04.18.13.16.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Apr 2021 13:16:30 -0700 (PDT)
Subject: Re: Resetting non-qdev children in a 3-phase reset device
To: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
References: <CAFEAcA8k+RUNhAOzCeefBs+vcyAgrtHwHMH9KfQb6OJg0su_7w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fc080508-9b82-8a2b-79bb-ab4e9f812cce@amsat.org>
Date: Sun, 18 Apr 2021 22:16:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8k+RUNhAOzCeefBs+vcyAgrtHwHMH9KfQb6OJg0su_7w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Markus

On 4/9/21 8:13 PM, Peter Maydell wrote:
> I wanted to convert the hw/misc/mps2-scc.c device from old-style
> to 3-phase reset as a prerequisite for another change to the device,
> but I ran into a problem because currently it has some TYPE_DEVICE
> QOM child objects, the LEDs. Because TYPE_DEVICE don't live in the
> qbus hierarchy, the device resets them manually in its DeviceClass::reset
> method:
> 
>     for (i = 0; i < ARRAY_SIZE(s->led); i++) {
>         device_cold_reset(DEVICE(s->led[i]));
>     }
> 
> This makes converting to 3-phase reset awkward. The obvious "natural"
> approach would be to say "in this device's phase X, invoke phase X
> for these objects", but we have no API for that. (The functions which
> would do it, resettable_phase_enter() etc, are static inside resettable.c.)
> 
> Ignoring the phasing and trying to just call device_cold_reset() in
> the 'enter' phase results in an assertion failure, because we trip
> the assert(!enter_phase_in_progress) in resettable_assert_reset(),
> which doesn't expect us to be triggering a reset inside a reset.
> 
> Ideally one would want to be able to add the LEDs to the list of
> things which are children of this object for purposes of reset
> (so they are iterated as part of the resettable_child_foreach()
> logic and their phases are automatically invoked at the right point).
> But for a subclass of DeviceState that's device_reset_child_foreach()
> and it only iterates any qbus children of this device.
> 
> Any clever ideas?

Not very clever... We could kludge it by calling device_legacy_reset()
instead of device_cold_reset() in mps2_fpgaio_reset()... But that
mean we are going backward with the API.


OK, back to read your previous explanations... and the threads around.
https://www.mail-archive.com/qemu-devel@nongnu.org/msg723312.html
https://www.mail-archive.com/qemu-devel@nongnu.org/msg738242.html

"Note that [qdev/qbus hierarchy] is an entirely separate thing
from the QOM hierarchy of parent-and-child object relationships."

Hmm OK. I guess I'm confused seeing parts are overlapping when they
aren't. So setting the QOM parent relationship helps in having a
correct QOM path and the object is displayed nicely in the qom-tree,
but doesn't bring anything on the qdev side.

So back to qdev.

- TYPE_DEVICE (aka 'qdev') is abstract.
  It inherits TYPE_OBJECT.
  It can provide a bus (aka qbus) to plug things.
  It implements TYPE_RESETTABLE_INTERFACE.

- TYPE_SYS_BUS_DEVICE is also abstract.
  It inherits from TYPE_DEVICE, setting qbus=TYPE_SYSTEM_BUS

(
To confuse more, there is some undocumented API called
'device_listener' in qdev which instead uses sysbus:
void device_listener_register(DeviceListener *listener);
void device_listener_unregister(DeviceListener *listener);
)

Making MachineState inherit TYPE_DEVICE and re-implement the
TYPE_RESETTABLE_INTERFACE doesn't seem going in the right
direction...
If TYPE_MACHINE were qdev, its qbus could be a ResetBus. Again
it feels wrong (over engineering).

> Maybe some mechanism for marking "these things which are my
> QOM children I want to be reset when I am reset (so make them> reset children of me and don't reset them as part of the
> qbus-tree-walking)" would be useful. I do think that in a
> lot of cases we want to be doing something closer to "reset
> along the QOM tree".

Eh here you mention QOM again... Shouldn't it be qdev?

I know the LED is just an example of a broader problem.
I indeed took care to add the QOM parent relation:

(qemu) info qom-tree
/machine (mps2-an385-machine)
  /fpgaio (mps2-fpgaio)
    /mps2-fpgaio[0] (memory-region)
    /userled0 (led)
      /unnamed-gpio-in[0] (irq)
    /userled1 (led)
      /unnamed-gpio-in[0] (irq)
  /scc (mps2-scc)
    /mps2-scc[0] (memory-region)
    /scc-led0 (led)
      /unnamed-gpio-in[0] (irq)
    /scc-led1 (led)
      /unnamed-gpio-in[0] (irq)
    ...

So looking at this qom-tree, the reset tree seems to me
more natural than the sysbus one, but IIRC not many models
set this QOM relationship.
QOM objects aren't enforced to have a relation with a parent,
as opposed as recent changes from Markus to always have a qdev
on a qbus). But even without parent they end in the /unattached
container below /machine, so if the reset were there, the
machine could still iterate over the /unattached children.

> I really do need to spend some time working
> out what the right thing with reset is and how we might get
> from where we are now to there...

Well, finally this QOM-tree reset is appealing.

Sorry if I haven't been very helpful :S Still processing the
problem in background...

Regards,

Phil.

