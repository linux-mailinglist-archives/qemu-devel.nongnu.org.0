Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0515568D740
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 13:54:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPNTq-0000fe-Hm; Tue, 07 Feb 2023 07:53:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPNTn-0000fQ-4u
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 07:53:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPNTl-0005we-G9
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 07:53:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675774424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JTsgWlFG6rRiUOa+CadkvGNjPTrOMJvjpt2PkVoTKkI=;
 b=aVvxHrNr3c8OK9Afdf4ZVICgpFqQCypNvYv3/zVbTADbFEF7yrZLmE+8lQ5BPPGMn9ojsE
 vrRobQpt0hNV771IShKNfIhKZsP97k6jZ7e4BuwQyegs95Xn6fdZN6rgknZ7iGgw5tuBJU
 rF2CdWCUSboO6cCm+3u7LFXfP1PJSXM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-111-Chh0M_TaNK602EM9V5Qlzg-1; Tue, 07 Feb 2023 07:53:41 -0500
X-MC-Unique: Chh0M_TaNK602EM9V5Qlzg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0666785CBE2;
 Tue,  7 Feb 2023 12:53:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD45F40398A0;
 Tue,  7 Feb 2023 12:53:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B442521E6A1F; Tue,  7 Feb 2023 13:53:39 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  marcandre.lureau@redhat.com,  mst@redhat.com,
 imammedo@redhat.com,  ani@anisinha.ca,  eduardo@habkost.net,
 marcel.apfelbaum@gmail.com,  wangyanan55@huawei.com,  jiri@resnulli.us,
 jasowang@redhat.com,  pavel.dovgaluk@ispras.ru,  pbonzini@redhat.com,
 zhanghailiang@xfusion.com,  quintela@redhat.com,  dgilbert@redhat.com,
 michael.roth@amd.com,  kkostiuk@redhat.com
Subject: Re: [PATCH 10/12] hw/core: Improve the query-hotpluggable-cpus
 error message
References: <20230207075115.1525-1-armbru@redhat.com>
 <20230207075115.1525-11-armbru@redhat.com>
 <636770da-898e-5bae-fe62-7cb1358ea752@linaro.org>
Date: Tue, 07 Feb 2023 13:53:39 +0100
In-Reply-To: <636770da-898e-5bae-fe62-7cb1358ea752@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 7 Feb 2023 09:40:25
 +0100")
Message-ID: <87fsbhtz58.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 7/2/23 08:51, Markus Armbruster wrote:
>> The QERR_ macros are leftovers from the days of "rich" error objects.
>> We've been trying to reduce their remaining use.
>> Get rid of a use of QERR_FEATURE_DISABLED, and improve the slightly
>> awkward error message
>>      (qemu) info hotpluggable-cpus
>>      Error: The feature 'query-hotpluggable-cpus' is not enabled
>> to
>>      Error: machine does not support hot-plugging CPUs
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>   hw/core/machine-qmp-cmds.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>> diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
>> index a6ed3a63c3..2d904747c0 100644
>> --- a/hw/core/machine-qmp-cmds.c
>> +++ b/hw/core/machine-qmp-cmds.c
>> @@ -16,7 +16,6 @@
>>   #include "qapi/error.h"
>>   #include "qapi/qapi-builtin-visit.h"
>>   #include "qapi/qapi-commands-machine.h"
>> -#include "qapi/qmp/qerror.h"
>>   #include "qapi/qmp/qobject.h"
>>   #include "qapi/qobject-input-visitor.h"
>>   #include "qapi/type-helpers.h"
>> @@ -141,7 +140,7 @@ HotpluggableCPUList *qmp_query_hotpluggable_cpus(Err=
or **errp)
>>       MachineClass *mc =3D MACHINE_GET_CLASS(ms);
>>         if (!mc->has_hotpluggable_cpus) {
>> -        error_setg(errp, QERR_FEATURE_DISABLED, "query-hotpluggable-cpu=
s");
>> +        error_setg(errp, "machine does not support hot-plugging CPUs");
>
> "hotplug CPUs" or "hot-pluggable CPUs"?

I think "hotplug CPUs" is strictly worse than "hotpluggable CPUs",
because "hotpluggable" is an adjective, while "hotplug" is not.

I slightly prefer "does not support hot-plugging CPUs" over "does not
support hot-pluggable CPUs".

As always, I'm happy to take advice from native speakers :)

>
>>           return NULL;
>>       }
>>=20=20=20


