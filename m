Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D32F67988
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Jul 2019 11:54:31 +0200 (CEST)
Received: from localhost ([::1]:54346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hmEje-0001Ds-4N
	for lists+qemu-devel@lfdr.de; Sat, 13 Jul 2019 05:54:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58277)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <guoheyi@huawei.com>) id 1hmEjR-0000k8-MH
 for qemu-devel@nongnu.org; Sat, 13 Jul 2019 05:54:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1hmEjQ-0007Wi-Kq
 for qemu-devel@nongnu.org; Sat, 13 Jul 2019 05:54:17 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:34082 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1hmEjN-0007QB-PD; Sat, 13 Jul 2019 05:54:14 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id D921CB7764657033EA41;
 Sat, 13 Jul 2019 17:54:05 +0800 (CST)
Received: from [127.0.0.1] (10.133.216.73) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Sat, 13 Jul 2019
 17:53:58 +0800
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>,
 <linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.cs.columbia.edu>
From: Guoheyi <guoheyi@huawei.com>
Message-ID: <1b0aa6b2-80b1-a72e-6849-7323c3b9c6bc@huawei.com>
Date: Sat, 13 Jul 2019 17:53:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.216.73]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.35
Subject: [Qemu-devel] [RFC] Add virtual SDEI support in qemu
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
Cc: Marc Zyngier <marc.zyngier@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>, James.Morse@arm.com,
 wanghaibin 00208455 <wanghaibin.wang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi folks,

Do it make sense to implement virtual SDEI in qemu? So that we can have 
the standard way for guest to handle NMI watchdog, RAS events and 
something else which involves SDEI in a physical ARM64 machine.

My basic idea is like below:

1. Change a few lines of code in kvm to allow unhandled SMC invocations 
(like SDEI) to be sent to qemu, with exit reason of KVM_EXIT_HYPERCALL, 
so we don't need to add new API.

2. qemu handles supported SDEI calls just as the spec says for what a 
hypervisor should do for a guest OS.

3. For interrupts bound to hypervisor, qemu should stop injecting the 
IRQ to guest through KVM, but jump to the registered event handler 
directly, including context saving and restoring. Some interrupts like 
virtual timer are handled by kvm directly, so we may refuse to bind such 
interrupts to SDEI events.

Any comment or suggestion will be really appreciated.

Heyi




