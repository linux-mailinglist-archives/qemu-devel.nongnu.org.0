Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 162006218FD
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 17:03:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osR3V-0005qm-RC; Tue, 08 Nov 2022 11:02:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osR3I-0005pP-Hd
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 11:02:16 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osR3C-0002kD-7D
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 11:02:16 -0500
Received: by mail-pg1-x52c.google.com with SMTP id 6so5635780pgm.6
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 08:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=PVJkG9VJ7DZFMOyn/kY/FjYZwSTkpjgDuaI+zyQaH0E=;
 b=BzWQu+Q/aHb22MQgcV3ZGgK5gFQ5HY1uvrVgyufTEwEbZu7QjayZAx8LFB3aEPFffL
 oSVeCXtCZlFFMXiuJU6YTy19ByV69TKzRF1q8pyCKLMDPhM2CDtR6I7ZhGN9RhEgTCQt
 2FEee2NvcxupnaMh2b+hCbdgeaNlFqWb6b1WA9fSegAbGwTCuC2UkY6RnsLosI+x9wCJ
 SaitFdoQs403E24+nGvEH6/PiglJFK9zEialeZV3zMXpBWsQtgrcWWoYOyXUWa76W4MC
 l5Cwh5asqOf8WTrFGQqOfWkymPgYnq5GBHi/oKrb5perl7PyX4xi0Jwn9m+yejTcifV1
 SJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PVJkG9VJ7DZFMOyn/kY/FjYZwSTkpjgDuaI+zyQaH0E=;
 b=WGOZxWxYt5metTRBsLAbin2zkETfs2fc9Hdnpb3UjEcrbmYHGaBxofX6J3iAkVBeVD
 yyZN1oG9vgH688aLXftVZZaHna1W0H8L/UoCBI73ThgyH3Ojyj8nFf7YuKTFsfW/jjTx
 weDwOnHSDvWvA+3ptHK3KTXy3FnLJL8f5Y1zsBsW642gZDdu2aFCXvN42pIDaUBVg6k9
 zdsf2i1Saw+P6RjKQcDsC/z+aPDq3oIxS+MHXIP7aMpqayknkx7oO7qJz+VePEze5gAc
 n35gQ058NtpsmNNXLlotF1bhW2S7hyrzWRAkIJbAyRrOsbNlEVC6YWnY0dSpWWE3Jxpt
 e8lQ==
X-Gm-Message-State: ACrzQf0zoeq0c6vbr7IAWRJCAxQS+MP/ky07hHHzQV7wYohA3yHeSbt9
 eHH2DUd7gZyt65Ov2Smr5mCXQtwu2NuIu/tPcqHUQi/p2DSKdg==
X-Google-Smtp-Source: AMsMyM4uBa37cFKStCRmvHqafi4exofbYh/P9wvxQhNGQBs08CVlOZ65ZBq2nbF5MYgaH/8yDwMlgNwBrB5hmQyy6/M=
X-Received: by 2002:a05:6a00:1595:b0:56d:e04d:e0ab with SMTP id
 u21-20020a056a00159500b0056de04de0abmr38265126pfk.51.1667923327693; Tue, 08
 Nov 2022 08:02:07 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Nov 2022 16:01:56 +0000
Message-ID: <CAFEAcA8Q3XZrdLJhJ4Uj1CX6J04ON9f91p=NuJXxA+cnEfdz6Q@mail.gmail.com>
Subject: QOM: should you be able to cast from an interface class to the
 concrete class?
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi; in the QOM model, are you supposed to be able to cast from
an interface class to the concrete class that is implementing it?

To give a specific example, if I have a ResettableClass *rc
should I be able to do DeviceClass *dc = DEVICE_CLASS(rc);
(assuming that the rc I have is actually from a DeviceClass) ?

If I'm reading the code correctly, at the moment this isn't possible:
object_class_dynamic_cast() has code for "if the class we're
casting from implements interfaces and the class we're casting to
is an interface, then look through the list of interfaces to
see if we should be returning the class pointer from the interface
list", which means you can cast from the concrete class to the
interface class. But there's no code there to say "if the class
we're casting from is an interface, try the concrete class".

As far as I can see we do actually record the information we need
to do this -- InterfaceClass has a field concrete_class that points
to the concrete class that's implementing it. But this field is
currently only written, never read.

Should we:
(a) support casting from the interface class back to the concrete
class, by adding some extra code in object_class_dynamic_cast(), or
(b) decide that that isn't something we should be wanting to do,
and remove the dead concrete_class struct field ?

(The thing I was trying to do when I ran into this was
effectively to add a class method, as opposed to an object method,
to an interface class. Specifically, the only reason that
the ResettableClass::get_transitional_function takes an Object*
is so that it can do an object-to-class cast to get to the
class pointer for the concrete class, and I had somewhere where
I wanted to also call that function where I only had the
ResettableClass *rc, not a specific object.)

thanks
-- PMM

