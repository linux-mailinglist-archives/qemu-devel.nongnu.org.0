Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2160541AEF6
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 14:28:04 +0200 (CEST)
Received: from localhost ([::1]:39828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVCDK-0005Qu-Lj
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 08:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mVCAn-0003h3-Ju
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:25:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mVCAk-00084Q-SW
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:25:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632831921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7RrjPhBnVBKkobEGXCpdLNePyS75zjd8oLw9OYQnCvw=;
 b=bqoveqA354ROODmuQFR47emwURGEib4n4NnwVRSqQwNMrlWn8SByl1b74V5Gv/oTyGLNvK
 h30kF/RPNoHU0tw7V8CR8eO5YyYnvhyCR0EhGnCLqU2D6dX6L/TQjTGZtEPS9swNB2MSOw
 YNiStV/SMxaICJxTw0XaTdObn4rBlqY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-hCt6uIRkMr2PCmvUdccBpw-1; Tue, 28 Sep 2021 08:25:19 -0400
X-MC-Unique: hCt6uIRkMr2PCmvUdccBpw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40CEB19253C3;
 Tue, 28 Sep 2021 12:25:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A5EFF5C1B4;
 Tue, 28 Sep 2021 12:25:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 41FE6113865F; Tue, 28 Sep 2021 14:25:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v11 11/14] machine: Make smp_parse generic enough for
 all arches
References: <20210928035755.11684-1-wangyanan55@huawei.com>
 <20210928035755.11684-12-wangyanan55@huawei.com>
 <2652509f-97d7-f999-a36f-47fc3b5ca346@redhat.com>
Date: Tue, 28 Sep 2021 14:25:15 +0200
In-Reply-To: <2652509f-97d7-f999-a36f-47fc3b5ca346@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 28 Sep 2021 12:57:21
 +0200")
Message-ID: <875yuk51lg.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Daniel P . =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 9/28/21 05:57, Yanan Wang wrote:
>> Currently the only difference between smp_parse and pc_smp_parse
>> is the support of dies parameter and the related error reporting.
>> With some arch compat variables like "bool dies_supported", we can
>> make smp_parse generic enough for all arches and the PC specific
>> one can be removed.
>>=20
>> Making smp_parse() generic enough can reduce code duplication and
>> ease the code maintenance, and also allows extending the topology
>> with more arch specific members (e.g., clusters) in the future.
>>=20
>> Suggested-by: Andrew Jones <drjones@redhat.com>
>> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>  hw/core/machine.c   | 91 +++++++++++++++++++++++++++++++++++----------
>>  hw/i386/pc.c        | 84 +----------------------------------------
>>  include/hw/boards.h |  9 +++++
>>  3 files changed, 81 insertions(+), 103 deletions(-)
>
>> +/*
>> + * smp_parse - Generic function used to parse the given SMP configurati=
on
>> + *
>> + * Any missing parameter in "cpus/maxcpus/sockets/cores/threads" will b=
e
>> + * automatically computed based on the provided ones.
>> + *
>> + * In the calculation of omitted sockets/cores/threads: we prefer socke=
ts
>> + * over cores over threads before 6.2, while preferring cores over sock=
ets
>> + * over threads since 6.2.
>> + *
>> + * In the calculation of cpus/maxcpus: When both maxcpus and cpus are o=
mitted,
>> + * maxcpus will be computed from the given parameters and cpus will be =
set
>> + * equal to maxcpus. When only one of maxcpus and cpus is given then th=
e
>> + * omitted one will be set to its given counterpart's value. Both maxcp=
us and
>> + * cpus may be specified, but maxcpus must be equal to or greater than =
cpus.
>> + *
>> + * For compatibility, apart from the parameters that will be computed, =
newly
>> + * introduced topology members which are likely to be target specific s=
hould
>> + * be directly set as 1 if they are omitted (e.g. dies for PC since 4.1=
).
>> + */
>>  static void smp_parse(MachineState *ms, SMPConfiguration *config, Error=
 **errp)
>
> Can we have it return a boolean instead?

Yes, please.  From error.h's big comment:

 * =3D Rules =3D
[...]
 * - Whenever practical, also return a value that indicates success /
 *   failure.  This can make the error checking more concise, and can
 *   avoid useless error object creation and destruction.  Note that
 *   we still have many functions returning void.  We recommend
 *   =E2=80=A2 bool-valued functions return true on success / false on fail=
ure,
 *   =E2=80=A2 pointer-valued functions return non-null / null pointer, and
 *   =E2=80=A2 integer-valued functions return non-negative / negative.


