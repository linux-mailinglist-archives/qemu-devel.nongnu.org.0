Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B38FE624848
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 18:22:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otBFt-0001Rn-EF; Thu, 10 Nov 2022 12:22:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otBFn-0001RW-CP
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 12:22:15 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otBFk-0007XK-Op
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 12:22:14 -0500
Received: by mail-wr1-x432.google.com with SMTP id z14so3253093wrn.7
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 09:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:user-agent:from:to:cc:subject:date:message-id:reply-to;
 bh=uoMIYCODT9a/YnzxA4Dk4zbIwaOP9E0BXTmIN1MeiDA=;
 b=XFCDK33ehBcjJ3B/GG4cSU3+BEdxteCWiw7bGzYa+mie5uQKR7snUhcwxfnpYGVXhw
 uTajllDdF+KhyxSyPTmatkIxwhW2vDYhc7C877PKULymRw1FMoijA0BZe1aeupCXQUFU
 znBUJp2y505CZ1wHxoLG5+n8XuhzqRxjEwJbGVyeFozBotnCiFjrDWVE6BiX5xXpxvRr
 +vsJnLhpYnEgQrVSmtLRIpj4tP0TsuzidzaNx0nwN/qLkZYidfzAfBWZ0XaKak5OhbKF
 0WGrhyAQjsXpwlTKMvPiELMyFv6wTGBzuyWuHQaoIZThGTMa45PhN3smz3SqTLDCZpIO
 Rx8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:user-agent:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uoMIYCODT9a/YnzxA4Dk4zbIwaOP9E0BXTmIN1MeiDA=;
 b=eR3Zd/gp9qouI80GbJgFVlmu64uy+8AQjkvqmkS55mhg/kZcWq2l67IA7V2EFopeOX
 MkUzqWCh2t+j7cz/eo1bkRZrUaeFydcBWRXwTHn+qgaXyM9oBYMKgM4ZmDs8FEI0HJm+
 5vv7WtWExTm5mVAdqSH+dMYXJRe0d2AvR2LILMk0SugxkJM0WHuyi2I/3vFPsPYv5I2o
 mzAeASC47vRiE5caZCWXClBEqRKCxSQzYTyThe+S31MX7B8Jmu9i/HpDv2J3HuyvYIKY
 j6vAA94cWgcpvpymzdcyt5s5PpWiYV37Cq8PBE1OZ7TgIRuTzRh7YYGTgzieapRH+l8w
 l/yg==
X-Gm-Message-State: ACrzQf3IX55gyL4SlNKO/BdSYNUYc/P1QQPCwthnyCNSvicPWZt4IgrJ
 AWzKgQ30nZ6h+52KmjnggK4dMA==
X-Google-Smtp-Source: AMsMyM6kAnv9+BgRGkyV+Y4yuOvpEStAS1sul2Xi6OKAqxf7FM6GOJQC1R570+Mn1EMHVHAPO/Q0jg==
X-Received: by 2002:a5d:4c8f:0:b0:238:bb45:7d84 with SMTP id
 z15-20020a5d4c8f000000b00238bb457d84mr24481667wrs.552.1668100931277; 
 Thu, 10 Nov 2022 09:22:11 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a05600c0a4200b003b4a68645e9sm6579187wmq.34.2022.11.10.09.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 09:22:10 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4CAB81FFB7;
 Thu, 10 Nov 2022 17:22:10 +0000 (GMT)
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Michael S. Tsirkin <mst@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu-daude@linaro.org>, Peter
 Maydell <peter.maydell@linaro.org>
Subject: should ioapic_service really be modelling cpu writes?
Date: Thu, 10 Nov 2022 17:01:38 +0000
Message-ID: <874jv6enct.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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

Hi,

I've been trying to remove current_cpu hacks from our hw/ emulation and
replace them with an explicit cpu_index derived from MemTxAttrs. So far
this has been going mostly ok but I've run into problems on x86 due to
the way the apic/ioapic are modelled. It comes down to the function
ioapic_service() which eventually does:

   /* No matter whether IR is enabled, we translate
    * the IOAPIC message into a MSI one, and its
    * address space will decide whether we need a
    * translation. */
   stl_le_phys(ioapic_as, info.addr, info.data);

Which essentially calls the memory API to simulate a memory write.
However to generate a properly formed MemTxAttrs we need to know what
CPU we are running on. In the case of ioapic_service() we may well be in
the main thread either for an expiring timer:

 hpet_timer->qemu_set_irq->ioapic_set_irq

or for reset handling:

 pc_machine_reset->hpet_reset->qemu_set_irq->ioapic_set_irq

neither of which can get a associated CPU. I assume if the actual writes
are triggered we never actually actioned stuff because we had:

  DeviceState *cpu_get_current_apic(void)
  {
      if (current_cpu) {
          X86CPU *cpu =3D X86_CPU(current_cpu);
          return cpu->apic_state;
      } else {
          return NULL;
      }
  }

which basically causes the updates to be dropped on the floor. However
during the conversion I went with something like:

  if (attrs.requester_type !=3D MTRT_CPU) {
      return MEMTX_ACCESS_ERROR;
  }
  dev =3D cpu_get_current_apic(attrs.requester_id);

but that breaks current behaviour. It makes me wonder if the modelling
of the APIC is really representative of what the real HW does or if the
memory writes are simply a shortcut that happens to work?

--=20
Alex Benn=C3=A9e

