Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 083B3677887
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 11:08:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJtk5-0000zS-R0; Mon, 23 Jan 2023 05:07:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pJtk3-0000w6-OG
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 05:07:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pJtk2-0006Ww-6z
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 05:07:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674468473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8OUdzb4DLk2/qKMb0TSgEY08Qi0NsYtF2gyxfWMiuk8=;
 b=Njjhs4EceRxQvu8Ct4JsZtcZj3gcZJGMp4K4eD0a7LatNR3oKFdufuHmAl4AN7k1xxj/6v
 ZkCMHrjom195mETbH2Q3dq9DHqL39VrLE2h03KEVd/IFLlSXUSSmG6G/j78jAsiMxWYRg0
 MY191DH0/fHk0nSxV5/MoieYlaFn/zY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-N0rYR8wANradcoIzjb876A-1; Mon, 23 Jan 2023 05:07:47 -0500
X-MC-Unique: N0rYR8wANradcoIzjb876A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB6CC100F910;
 Mon, 23 Jan 2023 10:07:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B653E492B02;
 Mon, 23 Jan 2023 10:07:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 94FF421E6A1F; Mon, 23 Jan 2023 11:07:45 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  peter.maydell@linaro.org,  =?utf-8?Q?C=C3=A9dr?=
 =?utf-8?Q?ic?= Le Goater
 <clg@kaod.org>,  Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PULL 09/12] include/hw/ppc: Split pnv_chip.h off pnv.h
References: <20230120070122.3982588-1-armbru@redhat.com>
 <20230120070122.3982588-10-armbru@redhat.com>
 <d8106f3d-ee31-ca51-40ba-4329238851de@linaro.org>
Date: Mon, 23 Jan 2023 11:07:45 +0100
In-Reply-To: <d8106f3d-ee31-ca51-40ba-4329238851de@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 23 Jan 2023 10:44:14
 +0100")
Message-ID: <87y1ptbm32.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Hi Markus,
>
> On 20/1/23 08:01, Markus Armbruster wrote:
>> PnvChipClass, PnvChip, Pnv8Chip, Pnv9Chip, and Pnv10Chip are defined
>> in pnv.h.  Many users of the header don't actually need them.  One
>> instance is this inclusion loop: hw/ppc/pnv_homer.h includes
>> hw/ppc/pnv.h for typedef PnvChip, and vice versa for struct PnvHomer.
>> Similar structs live in their own headers: PnvHomerClass and PnvHomer
>> in pnv_homer.h, PnvLpcClass and PnvLpcController in pci_lpc.h,
>> PnvPsiClass, PnvPsi, Pnv8Psi, Pnv9Psi, Pnv10Psi in pnv_psi.h, ...
>> Move PnvChipClass, PnvChip, Pnv8Chip, Pnv9Chip, and Pnv10Chip to new
>> pnv_chip.h, and adjust include directives.  This breaks the inclusion
>> loop mentioned above.
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> Message-Id: <20221222104628.659681-2-armbru@redhat.com>
>> ---
>>   include/hw/ppc/pnv.h       | 143 +-----------------------------------
>>   include/hw/ppc/pnv_chip.h  | 147 +++++++++++++++++++++++++++++++++++++
>>   hw/intc/pnv_xive.c         |   1 +
>>   hw/intc/pnv_xive2.c        |   1 +
>>   hw/pci-host/pnv_phb3.c     |   1 +
>>   hw/pci-host/pnv_phb4_pec.c |   1 +
>>   hw/ppc/pnv.c               |   3 +
>>   hw/ppc/pnv_core.c          |   1 +
>>   hw/ppc/pnv_homer.c         |   1 +
>>   hw/ppc/pnv_lpc.c           |   1 +
>>   hw/ppc/pnv_xscom.c         |   1 +
>>   11 files changed, 160 insertions(+), 141 deletions(-)
>>   create mode 100644 include/hw/ppc/pnv_chip.h
>> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
>> index 9ef7e2d0dc..ca49e4281d 100644
>> --- a/include/hw/ppc/pnv.h
>> +++ b/include/hw/ppc/pnv.h
>> @@ -20,158 +20,19 @@
>>   #ifndef PPC_PNV_H
>>   #define PPC_PNV_H
>>   +#include "cpu.h"
>
> Why is "cpu.h" required here? For pnv_chip_find_cpu()?

Yes:

    ../include/hw/ppc/pnv.h:58:1: error: unknown type name =E2=80=98PowerPC=
CPU=E2=80=99
       58 | PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir);
          | ^~~~~~~~~~

> Isn't "target/ppc/cpu-qom.h" enough?

Seems to suffice.  Would you like to post a followup?


