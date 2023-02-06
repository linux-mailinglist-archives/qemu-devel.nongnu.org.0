Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 052B468C2D3
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 17:17:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP49w-0005Yc-FU; Mon, 06 Feb 2023 11:16:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pP49t-0005Y4-PB
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 11:15:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pP49s-0006Qh-4J
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 11:15:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675700154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y1YxdtXAKHSW2xa0lWBV1M5rrSQV9boHSWRJ7x97GV8=;
 b=gQQ7jmiekxEsNTUAOXoyZxnim8FNnDTTDEe3z4NHZwNvHgL8jpNXrMl/xRRruFWzsHjE6G
 o+NcG1AU2tZCI+6teJyNqsicDJwo4LLH8pUGI5E7OMEgDTgC6XNxnFHmqduK7aUjE17jWt
 odBggJV7VpL/rSDPSQOEsRZrXdV5uTw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-471-kSF7DlEePbyFJS4Mn4WExA-1; Mon, 06 Feb 2023 11:15:52 -0500
X-MC-Unique: kSF7DlEePbyFJS4Mn4WExA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 851C685A588;
 Mon,  6 Feb 2023 16:15:51 +0000 (UTC)
Received: from localhost (dhcp-192-239.str.redhat.com [10.33.192.239])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 253B140398A0;
 Mon,  6 Feb 2023 16:15:51 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Auger <eauger@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v5 2/3] arm/kvm: add support for MTE
In-Reply-To: <071ec3a6-cb4b-0dac-87fd-f3c3d00b5e83@redhat.com>
Organization: Red Hat GmbH
References: <20230203134433.31513-1-cohuck@redhat.com>
 <20230203134433.31513-3-cohuck@redhat.com>
 <da118de5-adcd-ec0c-9870-454c3741a4ab@linaro.org>
 <071ec3a6-cb4b-0dac-87fd-f3c3d00b5e83@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Mon, 06 Feb 2023 17:15:49 +0100
Message-ID: <877cwun51m.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
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

On Mon, Feb 06 2023, Eric Auger <eauger@redhat.com> wrote:

> Hi,
>
> On 2/3/23 21:40, Richard Henderson wrote:
>> On 2/3/23 03:44, Cornelia Huck wrote:
>>> +static void aarch64_cpu_get_mte(Object *obj, Visitor *v, const char
>>> *name,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *opaque, Error **errp)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 ARMCPU *cpu =3D ARM_CPU(obj);
>>> +=C2=A0=C2=A0=C2=A0 OnOffAuto mte =3D cpu->prop_mte;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 visit_type_OnOffAuto(v, name, &mte, errp);
>>> +}
>>=20
>> You don't need to copy to a local variable here.
>>=20
>>> +
>>> +static void aarch64_cpu_set_mte(Object *obj, Visitor *v, const char
>>> *name,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *opaque, Error **errp)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 ARMCPU *cpu =3D ARM_CPU(obj);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 visit_type_OnOffAuto(v, name, &cpu->prop_mte, errp);
>>> +}
>>=20
>> ... which makes get and set functions identical.
>> No need for both.
> This looks like a common pattern though. virt_get_acpi/set_acpi in
> virt.c or pc_machine_get_vmport/set_vmport in i386/pc.c and many other
> places (microvm ...). Do those other callers also need some simplificatio=
ns?

Indeed, I'm pretty sure that I copied + adapted it from somewhere :)

Should we clean up all instances in one go instead? (Probably on top of
this series, in order to minimize conflicts with other changes.)


