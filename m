Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 539623D360B
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 10:04:01 +0200 (CEST)
Received: from localhost ([::1]:34046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6qA4-00083c-D6
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 04:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m6q8z-0007O7-V9
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 04:02:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m6q8x-0003mv-8Q
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 04:02:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627027370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C41s+cxFDve2fB+LwOAyOoaqnVhovgqA3hp/MUIbBI4=;
 b=OfGs3y2dLU8yL0TJZXe2/M2n1MNSR6hFbL+asr8WYX8UZwa+TcygpMC79MzqeMA701MMN9
 LomydqbO1ahNs4l/JIxlGqOUCncUtwtH7zxXwDECIC2zg+V0MAtXpf+eN5gPiOMcM5WG9Q
 s6CMO4wLPn87Nz3wpyc1H09qgQweQYQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-oFiZyUWuOjuMpo70SHAwMQ-1; Fri, 23 Jul 2021 04:02:48 -0400
X-MC-Unique: oFiZyUWuOjuMpo70SHAwMQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D1531074661;
 Fri, 23 Jul 2021 08:02:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-187.ams2.redhat.com
 [10.36.114.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 31C03100164C;
 Fri, 23 Jul 2021 08:02:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AE51611326B9; Fri, 23 Jul 2021 10:02:43 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH for-6.1 v2] machine: Disallow specifying topology
 parameters as zero
References: <20210722154326.1464-1-wangyanan55@huawei.com>
 <20210722154326.1464-2-wangyanan55@huawei.com>
 <YPmWTutShepWX32R@redhat.com>
Date: Fri, 23 Jul 2021 10:02:43 +0200
In-Reply-To: <YPmWTutShepWX32R@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 22 Jul 2021 17:01:18 +0100")
Message-ID: <87o8atcva4.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 wanghaibin.wang@huawei.com, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Thu, Jul 22, 2021 at 11:43:26PM +0800, Yanan Wang wrote:
>> In the SMP configuration, we should either specify a topology
>> parameter with a reasonable value (equal to or greater than 1)
>> or just leave it omitted and QEMU will calculate its value.
>> Configurations which explicitly specify the topology parameters
>> as zero like "sockets=3D0" are meaningless, so disallow them.
>>=20
>> However, the commit 1e63fe685804d
>> (machine: pass QAPI struct to mc->smp_parse) has documented that
>> '0' has the same semantics as omitting a parameter in the qapi
>> comment for SMPConfiguration. So this patch fixes the doc and
>> also adds the corresponding sanity check in the smp parsers.
>>=20
>> Suggested-by: Andrew Jones <drjones@redhat.com>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>  hw/core/machine.c | 14 ++++++++++++++
>>  qapi/machine.json |  6 +++---
>>  qemu-options.hx   | 12 +++++++-----
>>  3 files changed, 24 insertions(+), 8 deletions(-)
>>=20
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index 775add0795..db129d937b 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -829,6 +829,20 @@ static void machine_set_smp(Object *obj, Visitor *v=
, const char *name,
>>          return;
>>      }
>> =20
>> +    /*
>> +     * The topology parameters must be specified equal to or great than=
 one
>> +     * or just omitted, explicit configuration like "cpus=3D0" is not a=
llowed.
>> +     */
>> +    if ((config->has_cpus && config->cpus =3D=3D 0) ||
>> +        (config->has_sockets && config->sockets =3D=3D 0) ||
>> +        (config->has_dies && config->dies =3D=3D 0) ||
>> +        (config->has_cores && config->cores =3D=3D 0) ||
>> +        (config->has_threads && config->threads =3D=3D 0) ||
>> +        (config->has_maxcpus && config->maxcpus =3D=3D 0)) {
>> +        error_setg(errp, "parameters must be equal to or greater than o=
ne if provided");
>
> I'd suggest a slight tweak since when seen it lacks context:
>
> $ ./qemu-system-x86_64 -smp 4,cores=3D0,sockets=3D2
> qemu-system-x86_64: parameters must be equal to or greater than one if pr=
ovided
>
>
>     error_setg(errp, "CPU topology parameters must be equal to or greater=
 than one if provided");

Let's scratch "if provided".

I'd replace "must be equal to or greater than one" by "must be
positive", or maybe "must be greater than zero".

>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index 99ed5ec5f1..b0168f8c48 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -223,11 +223,13 @@ SRST
>>      of computing the CPU maximum count.
>> =20
>>      Either the initial CPU count, or at least one of the topology param=
eters
>> -    must be specified. Values for any omitted parameters will be comput=
ed
>> -    from those which are given. Historically preference was given to th=
e
>> -    coarsest topology parameters when computing missing values (ie sock=
ets
>> -    preferred over cores, which were preferred over threads), however, =
this
>> -    behaviour is considered liable to change.
>> +    must be specified. The specified parameters must be equal to or gre=
at
>
> s/great/greater/
>
>> +    than one, explicit configuration like "cpus=3D0" is not allowed. Va=
lues

"positive" again.

>> +    for any omitted parameters will be computed from those which are gi=
ven.
>> +    Historically preference was given to the coarsest topology paramete=
rs
>> +    when computing missing values (ie sockets preferred over cores, whi=
ch
>> +    were preferred over threads), however, this behaviour is considered
>> +    liable to change.
>>  ERST
>
>
> If you make the text changes, then feel free to add this when posting v2:
>
>  Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>  Tested-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> =20
>
>
> Regards,
> Daniel


