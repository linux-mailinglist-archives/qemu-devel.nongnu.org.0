Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F311EB6B3
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jun 2020 09:45:35 +0200 (CEST)
Received: from localhost ([::1]:33564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jg1c7-0008Ro-1R
	for lists+qemu-devel@lfdr.de; Tue, 02 Jun 2020 03:45:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jg1Zy-0005cC-9s
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 03:43:22 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56713
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jg1Zw-0000d8-Q4
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 03:43:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591083799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rxEci3SraURpvMMKuampjpZ6OL25wIO5CjxZ9eSfK+E=;
 b=huwaBlBObwsxlx4Z+quUnZ16PbfqCmX5fwexTgkc0098bnRkPsXbn4RBAsCAV1d2AkPFwY
 OVNXHSL3P7LuKL0zrmVMec4Z329KAi8t1fHz3XOxpfLWLInxUSdbHhqIsIK2uyEKtf8YFx
 vnM1bXGU7NYkEwcYC4wM87kLgevbfE4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-Y7qwrmzmPZGr972foAjb8A-1; Tue, 02 Jun 2020 03:43:16 -0400
X-MC-Unique: Y7qwrmzmPZGr972foAjb8A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 082F69126F;
 Tue,  2 Jun 2020 07:43:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 54ED411A9DF;
 Tue,  2 Jun 2020 07:43:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BD32E1138601; Tue,  2 Jun 2020 09:43:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] or1k: Fix compilation hiccup
References: <20200526185132.1652355-1-eblake@redhat.com>
 <m1d06msod9.fsf@redhat.com>
 <CAFEAcA9Huery0AeUFsLVrcK4bUGibg1f-m8gMuMiJgnr+Hj7CA@mail.gmail.com>
Date: Tue, 02 Jun 2020 09:43:08 +0200
In-Reply-To: <CAFEAcA9Huery0AeUFsLVrcK4bUGibg1f-m8gMuMiJgnr+Hj7CA@mail.gmail.com>
 (Peter Maydell's message of "Fri, 29 May 2020 17:40:13 +0100")
Message-ID: <87eeqx9alv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/01 23:49:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Jia Liu <proljc@gmail.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Christophe de Dinechin <dinechin@redhat.com>,
 Stafford Horne <shorne@gmail.com>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 29 May 2020 at 17:23, Christophe de Dinechin
> <dinechin@redhat.com> wrote:
>> On 2020-05-26 at 20:51 CEST, Eric Blake wrote...
>> > diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
>> > index d08ce6181199..95011a8015b4 100644
>> > --- a/hw/openrisc/openrisc_sim.c
>> > +++ b/hw/openrisc/openrisc_sim.c
>> > @@ -129,7 +129,7 @@ static void openrisc_sim_init(MachineState *machine)
>> >      const char *kernel_filename = machine->kernel_filename;
>> >      OpenRISCCPU *cpu = NULL;
>> >      MemoryRegion *ram;
>> > -    qemu_irq *cpu_irqs[2];
>> > +    qemu_irq *cpu_irqs[2] = {};
>>
>> Why is the value [2] correct here? The loop that initializes loops over
>> machine->smp.cpus. Is it always less than 2 on this machine?
>
> Yes: openrisc_sim_machine_init() sets mc->max_cpus = 2.
> My suggestion of adding an assert() is essentially telling the
> compiler that indeed smp_cpus must always be in the range [1,2],
> which we can tell but it can't.

Do we have a proper patch for this on the list?


