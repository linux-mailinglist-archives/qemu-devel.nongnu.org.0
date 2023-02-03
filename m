Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0BA6899E3
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 14:38:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNwG2-000647-9U; Fri, 03 Feb 2023 08:37:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNwFK-0005gF-Tb
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 08:37:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNwFH-0004sn-6t
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 08:36:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675431391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DrfeX5gacHxcbn2zcDL8HUePYe1yTPohXRz2WwS5TN4=;
 b=heYbmwcksbZgcwMhy3y+p9OEeN+sYRzq7B3I7jG7h+07d/e0oqWpvuQS5S4eQfVey0b872
 GWvX9V8+NwfmO3Mker4iIGp7fHOnj3SzquxomOh5cIKiPq6oM0fxuip+hPim6cfNuVqSkv
 spfA0WZZ2kSbNLA+eXtRX0iq2hNeGas=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-FmVIjwpRNyG7OBuy4jaAWg-1; Fri, 03 Feb 2023 08:36:28 -0500
X-MC-Unique: FmVIjwpRNyG7OBuy4jaAWg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 994631C0514C;
 Fri,  3 Feb 2023 13:36:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F01A112132C;
 Fri,  3 Feb 2023 13:36:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5718221E6A1F; Fri,  3 Feb 2023 14:36:26 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  qemu-ppc@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 1/9] hw/i386/sgx: Do not open-code qdev_realize_and_unref()
References: <20230203113650.78146-1-philmd@linaro.org>
 <20230203113650.78146-2-philmd@linaro.org>
 <87lelfc4l1.fsf@pond.sub.org>
 <3b377013-778e-b5b4-4c40-bfbecaba8415@linaro.org>
Date: Fri, 03 Feb 2023 14:36:26 +0100
In-Reply-To: <3b377013-778e-b5b4-4c40-bfbecaba8415@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 3 Feb 2023 14:15:45
 +0100")
Message-ID: <87pmaqc1lx.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

> On 3/2/23 13:32, Markus Armbruster wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
>>=20
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>>> ---
>>>   hw/i386/sgx.c | 5 ++---
>>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
>>> index db004d17a6..5ddc5d7ea2 100644
>>> --- a/hw/i386/sgx.c
>>> +++ b/hw/i386/sgx.c
>>> @@ -299,7 +299,7 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
>>>                                   &sgx_epc->mr);
>>>=20=20=20
>>>       for (list =3D x86ms->sgx_epc_list; list; list =3D list->next) {
>>> -        obj =3D object_new("sgx-epc");
>>> +        obj =3D object_new(TYPE_SGX_EPC);
>>=20
>> I wonder why this doesn't use qdev_new().
>
> OK.

Observation, not demand!

>>>           /* set the memdev link with memory backend */
>>>           object_property_parse(obj, SGX_EPC_MEMDEV_PROP, list->value->=
memdev,
>>> @@ -307,8 +307,7 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
>>>           /* set the numa node property for sgx epc object */
>>>           object_property_set_uint(obj, SGX_EPC_NUMA_NODE_PROP, list->v=
alue->node,
>>>                                &error_fatal);
>>> -        object_property_set_bool(obj, "realized", true, &error_fatal);
>>> -        object_unref(obj);
>>> +        qdev_realize_and_unref(DEVICE(obj), NULL, &error_fatal);
>>=20
>> Yes, please!  Must have crept in after I converted all realizations.
>> I can see two more:
>>=20
>> hw/pci/pcie_sriov.c:        object_property_set_bool(OBJECT(vf), "realiz=
ed", false, &local_err);
>> linux-user/syscall.c:            object_property_set_bool(OBJECT(cpu), "=
realized", false, NULL);
>
> No: these would be qdev_UNrealize_and_unref().

You're right.

>                                                Do we want it?
> Maybe to avoid open-coding it, yes?

I think so.  See

    dc3edf8d8a qdev: Convert to qdev_unrealize() manually
    981c3dcd94 qdev: Convert to qdev_unrealize() with Coccinelle

>>>       }
>>>=20=20=20
>>>       if ((sgx_epc->base + sgx_epc->size) < sgx_epc->base) {
>>=20
>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>
> Thanks!


