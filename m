Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F47653DEA
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 11:04:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8IPi-00044e-D6; Thu, 22 Dec 2022 05:02:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p8IPN-00044J-SH
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 05:02:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p8IPM-0007U3-8N
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 05:02:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671703355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9OvQKbYRGzuLwIYjWScezJ9ETslTo/Vphri4ZqOKQqU=;
 b=G/1IWUedm5gjnXLJzl9QRBzxQm1NoipetrmyAaFgeH7sCi2oUO+aPv97fgwHiFoDwOVwRj
 UEj9KRATOuSkYYsbIY6T6fMVp/DpqdJRaYNpnEnacEOk2TMGteAuHAziRksfqBzimUqZ75
 K8bZj9FWXRier8pkfdGaDLTl5NY2eZA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-T-SKgoeANfek_zalW0AAPg-1; Thu, 22 Dec 2022 05:02:31 -0500
X-MC-Unique: T-SKgoeANfek_zalW0AAPg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64933811E9C;
 Thu, 22 Dec 2022 10:02:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CFCC40C2064;
 Thu, 22 Dec 2022 10:02:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0DABA21E691D; Thu, 22 Dec 2022 11:02:30 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 stefanha@redhat.com,
 kwolf@redhat.com,  pbonzini@redhat.com,  "Michael S. Tsirkin"
 <mst@redhat.com>
Subject: Re: [PATCH v3 0/5] coroutine: Clean up includes
References: <20221221131435.3851212-1-armbru@redhat.com>
 <18f53ca6-3cd0-313c-8940-1f7d013eba87@linaro.org>
 <87k02kggjl.fsf@pond.sub.org>
Date: Thu, 22 Dec 2022 11:02:30 +0100
In-Reply-To: <87k02kggjl.fsf@pond.sub.org> (Markus Armbruster's message of
 "Thu, 22 Dec 2022 06:21:02 +0100")
Message-ID: <878rizg3ih.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Markus Armbruster <armbru@redhat.com> writes:

> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
>
>> On 21/12/22 14:14, Markus Armbruster wrote:
>>> v3:
>>> * PATCH 4: Unnecessary hunks dropped
>>> v2:
>>> * Rebased
>>> * PATCH 4: Rewritten [Paolo]
>>> * PATCH 5: New
>>> Markus Armbruster (5):
>>>    coroutine: Clean up superfluous inclusion of qemu/coroutine.h
>>>    coroutine: Move coroutine_fn to qemu/osdep.h, trim includes
>>>    coroutine: Clean up superfluous inclusion of qemu/lockable.h
>>>    coroutine: Split qemu/coroutine-core.h off qemu/coroutine.h
>>>    coroutine: Use Coroutine typedef name instead of structure tag
>>
>> I had to add:
>>
>> -- >8 --
>> diff --git a/hw/pci/pci-hmp-cmds.c b/hw/pci/pci-hmp-cmds.c
>> index fb7591d6ab..b09fce9377 100644
>> --- a/hw/pci/pci-hmp-cmds.c
>> +++ b/hw/pci/pci-hmp-cmds.c
>> @@ -15,6 +15,7 @@
>>
>>  #include "qemu/osdep.h"
>>  #include "hw/pci/pci.h"
>> +#include "hw/pci/pci_device.h"
>>  #include "monitor/hmp.h"
>>  #include "monitor/monitor.h"
>>  #include "pci-internal.h"
>> diff --git a/hw/virtio/virtio-qmp.c b/hw/virtio/virtio-qmp.c
>> index 8e7282658f..3d4497da99 100644
>> --- a/hw/virtio/virtio-qmp.c
>> +++ b/hw/virtio/virtio-qmp.c
>> @@ -11,6 +11,7 @@
>>
>>  #include "qemu/osdep.h"
>>  #include "hw/virtio/virtio.h"
>> +#include "hw/virtio/vhost.h"
>>  #include "virtio-qmp.h"
>>
>> ---
>>
>> Otherwise I get:
>>
>> ../hw/pci/pci-hmp-cmds.c: In function =E2=80=98pcibus_dev_print=E2=80=99:
>> ../hw/pci/pci-hmp-cmds.c:129:31: error: invalid use of incomplete typede=
f =E2=80=98PCIDevice=E2=80=99
>>   129 |     int class =3D pci_get_word(d->config + PCI_CLASS_DEVICE);
>>       |                               ^~
>>
>> ../hw/virtio/virtio-qmp.c:187:19: error: =E2=80=98VHOST_USER_F_PROTOCOL_=
FEATURES=E2=80=99 undeclared here (not in a function);=20
>> did you mean =E2=80=98VHOST_USER_PROTOCOL_F_RARP=E2=80=99?
>>   187 |     FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
>>       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>>
>> Maybe some recently merged change?
>
> Yes.  I'll rebase.

To avoid confusion: this series doesn't need a rebase.  "[PATCH 0/5]
include/hw/pci include/hw/cxl: Clean up includes" does.

[...]


