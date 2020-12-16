Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 387DA2DBCC7
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 09:39:11 +0100 (CET)
Received: from localhost ([::1]:38416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpSL0-0006FH-Aq
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 03:39:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1kpSK0-0005e2-Uh
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 03:38:08 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:33349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1kpSJz-0004m1-3K
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 03:38:08 -0500
Received: by mail-wm1-x335.google.com with SMTP id n16so1458446wmc.0
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 00:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dme-org.20150623.gappssmtp.com; s=20150623;
 h=to:cc:subject:in-reply-to:references:from:date:message-id
 :mime-version; bh=DiQvKVBDYYiCXAWyMyuOeqNtZ9U770DMk4MyAhDrcl0=;
 b=E70lOKtyuP3ABJY6HbkJBCRKf0xE+kGkdd/+dXWJ6BlsMXJYoUxqN/7uvIfwqncYb0
 4px8ZdJcnQiHUaE2Wm6c9m76pzWabeugfMRaPTstdyYi59XVfPdo8Y7A9wrIPY6gu6Wy
 NEhb0TmmAd9vHN6imJAnMefsjnkg3eZ+OJuhFoc/0zWVDFi/PcFzZ0UpDiigPfFe+Zo2
 4VX87XB7JnD7aXf58P6HjfkFVbH+JPuOUoHq2x0qb+Ss1iB74Gq88dafVuNnv+hhejHy
 1DDOhurpQbNM5bzb2gM5/IvnPLP3RyUjRRgMIHh5hbmavkX3wfv06Uv8l2XIC/YVPFie
 pMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:in-reply-to:references:from:date
 :message-id:mime-version;
 bh=DiQvKVBDYYiCXAWyMyuOeqNtZ9U770DMk4MyAhDrcl0=;
 b=SQN+E6va2D3enVdXRgG2VEWUe+iKIY33SSNlSoqOuxtdL5kSrb6nhWqBSgWfvwxOOQ
 kYMrpTJ1phuCTNn1o8XDwr1tBAeKF5WbZ+TB+26XfVauDM4NVi6Yd4iZ3rYVd3pJzvVx
 HQq9X8iQvNQW0mlj2/Ukwuhbev5re4Bz+tBVnXXXcEo7vKLrgE50ijNRMqt/5BZJFxDd
 2xLzenE58EF+jyYxI3as3uh4Ifcir+hPO16q4wVdv6IB8AVUDeuZ+NACT2ltMfHzo9YE
 PJKuCuytrOVjbkF0mXpP5Lhq4/6D3OtlQcWbS/Z3zQ/OjYnk5+ohdKkHKimeTsTWpG3a
 VjgA==
X-Gm-Message-State: AOAM531ot79CEE/C8rOz4MOvoWxyLFze9XjX657rsUc5kWeFWcsTQxaP
 8qhK2TYcitwFWhGR39VK8yXC8A==
X-Google-Smtp-Source: ABdhPJzYb8Td+FC+72nwhcx/KfNSPyQ9Qqe4DVM/sVWIHC7DjqOj/BbaL2DELzDqSEGnARWSY7u0UA==
X-Received: by 2002:a1c:67c5:: with SMTP id b188mr2165039wmc.147.1608107884944; 
 Wed, 16 Dec 2020 00:38:04 -0800 (PST)
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net.
 [2001:8b0:bb71:7140:64::1])
 by smtp.gmail.com with ESMTPSA id a14sm2076724wrn.3.2020.12.16.00.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 00:38:03 -0800 (PST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 82d1865a;
 Wed, 16 Dec 2020 08:38:02 +0000 (UTC)
To: Andrew Jones <drjones@redhat.com>
Subject: Re: [PATCH] hw/arm/virt: Remove virt machine state 'smp_cpus'
In-Reply-To: <20201216064353.2n4evhicybkkuf7z@kamzik.brq.redhat.com>
References: <20201215174815.51520-1-drjones@redhat.com>
 <cun8s9zorr3.fsf@zarquon.hh.sledj.net>
 <20201216064353.2n4evhicybkkuf7z@kamzik.brq.redhat.com>
X-HGTTG: zarquon
From: David Edmondson <dme@dme.org>
Date: Wed, 16 Dec 2020 08:38:02 +0000
Message-ID: <cun4kkm87th.fsf@zarquon.hh.sledj.net>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: neutral client-ip=2a00:1450:4864:20::335;
 envelope-from=dme@dme.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: fangying1@huawei.com, peter.maydell@linaro.org, salil.mehta@huawei.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wednesday, 2020-12-16 at 07:43:53 +01, Andrew Jones wrote:

> On Tue, Dec 15, 2020 at 06:20:48PM +0000, David Edmondson wrote:
>> On Tuesday, 2020-12-15 at 18:48:15 +01, Andrew Jones wrote:
>> 
>> >  static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>> >  {
>> > -    int cpu;
>> > -    int addr_cells = 1;
>> >      const MachineState *ms = MACHINE(vms);
>> > +    int smp_cpus = ms->smp.cpus, cpu;
>> 
>> Is it house-style to have initialised and un-initialised local variables
>> declared on the same line?
>>
>
> checkpatch.pl doesn't complain and a grep of qemu shows hundreds of other
> examples. That said, I only see one other example in hw/arm/virt.c, so if
> we'd rather avoid it, I'll repost.

Not at all, I was just curious.

dme.
-- 
Driving at 90 down those country lanes, singing to "Tiny Dancer".

