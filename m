Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0866AB695
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 07:53:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ4hH-00030O-4I; Mon, 06 Mar 2023 01:51:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+b085a62f4b871f41f4ed+7134+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pZ4h8-0002zy-H8
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:51:38 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+b085a62f4b871f41f4ed+7134+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pZ4h6-0000Sd-6w
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:51:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=fcYi2MNTgSDDO47/RF6w2cSg4x0caNM0L6Fby7MJ8xs=; b=JREu4C0sZqcFjV0HKfk9KmfnBW
 FZZKWwg7A4umHx33cI3gDxkH8FPqhTP3/mZYn0G/VAvj8KAxPUh+g6x+ajT7sgQTUhlu8pc0xvvuj
 APy9iCXWR8nRX9+53K1efUj5lhXoWcZXKhNn7nKaOpnI/ckq19y5dv4YdOtqgeWEkL2VWdnadshwf
 OLs6PaXMKHp/5nvAe15xGFbBulTeM5PYTlFd56TqVU/s4mvrxOoBIDhU/e6RRSSCYaL8m34UlRJuQ
 r9eNgiFS289YUm06TTijWH4bC/VZwO1EmFOY+t0kxRw03ubZ6HpTQY9fDoSIAtJ8VYoqARUomzuX2
 Tzvi03PA==;
Received: from [2001:8b0:10b:5:649f:dc23:cf1f:79bb] (helo=[IPv6:::1])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pZ4gn-00Gb9m-0F; Mon, 06 Mar 2023 06:51:17 +0000
Date: Mon, 06 Mar 2023 06:51:16 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Xu <peterx@redhat.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_hw/intc/ioapic=3A_Update_KVM_rou?=
 =?US-ASCII?Q?tes_before_redelivering_IRQ=2C_on_RTE_update?=
User-Agent: K-9 Mail for Android
In-Reply-To: <ZAUZYkChWfwCcfSn@x1n>
References: <e1b97564a7728a5106134bc7063a8c62f134a45e.camel@infradead.org>
 <ZAUZYkChWfwCcfSn@x1n>
Message-ID: <6E7EA2EE-382C-4345-9A2A-D61E0139FB65@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+b085a62f4b871f41f4ed+7134+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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



On 5 March 2023 22:36:18 GMT, Peter Xu <peterx@redhat=2Ecom> wrote:
>On Sun, Mar 05, 2023 at 06:43:42PM +0000,=20
>> ---
>> Alternative fixes might have been just to remove the part in
>> ioapic_service() which delivers the IRQ via kvm_set_irq() because
>> surely delivering as MSI ought to work just fine anyway in all cases?
>> That code lacks a comment justifying its existence=2E
>
>Didn't check all details, but AFAIU there're still some different paths
>triggered so at least it looks still clean to use the path it's for=2E
>
>E=2Eg=2E, I think if someone traces kvm_set_irq() in kernel this specific=
 irq
>triggered right after unmasking might seem to be missed misterously (but
>actually it was not)=2E

Hm, not sure that's a reason we care about=2E The I/OAPIC is purely a devi=
ce to turn line interrupts into MSIs=2E Which these days need to be transla=
ted by IOMMU interrupt remapping device models in userspace=2E I don't thin=
k a user has any valid reason to expect that the kernel will even know abou=
t any GSIs with any specific numbers=2E Tracing on that in the kernel would=
 making some dodgy assumptions=2E

