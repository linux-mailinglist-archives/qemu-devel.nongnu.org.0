Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D0B5E63CF
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 15:38:15 +0200 (CEST)
Received: from localhost ([::1]:45344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obMP8-0007F4-Sy
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 09:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1obLKd-0006u5-Oe
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 08:29:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1obLKZ-0003e5-V8
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 08:29:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663849765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qZynXZ9X1l0vHJMTZ8KBD8n0C1u0hTimPOrD+PMdh38=;
 b=UV7lcXs9D1SALV5zageUYDJJ7knqV/RfK/xb39JpC+rD5kpeKIJBN0XdH1OOTWtXONTLlb
 kAZFvy2u/D34UXMNBl1WyyHI3XjgSWbnwreR599L4vxd9OBIpLwbyctizEWXuQUcsXG9Bv
 +Xm1jVX5W43a3Wp1uBJT1HrKpG5QSNU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-o4Usw2KGMzWhjzg_KQaQ4g-1; Thu, 22 Sep 2022 08:29:20 -0400
X-MC-Unique: o4Usw2KGMzWhjzg_KQaQ4g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFDCD1C0512D;
 Thu, 22 Sep 2022 12:29:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 48E134B3FC6;
 Thu, 22 Sep 2022 12:29:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E60C621E6900; Thu, 22 Sep 2022 14:29:17 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,  qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org,  clg@kaod.org,  "Dr . David Alan Gilbert"
 <dgilbert@redhat.com>,  Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v7 14/14] qmp/hmp, device_tree.c: introduce dumpdtb
References: <20220908194040.518400-1-danielhb413@gmail.com>
 <20220908194040.518400-15-danielhb413@gmail.com>
 <0d4f5caf-6005-779d-8e37-5d26ba3a0856@amsat.org>
Date: Thu, 22 Sep 2022 14:29:17 +0200
In-Reply-To: <0d4f5caf-6005-779d-8e37-5d26ba3a0856@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 22 Sep 2022 12:47:12
 +0200")
Message-ID: <87r103mw2q.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 8/9/22 21:40, Daniel Henrique Barboza wrote:
>> To save the FDT blob we have the '-machine dumpdtb=3D<file>' property.
>> With this property set, the machine saves the FDT in <file> and exit.
>> The created file can then be converted to plain text dts format using
>> 'dtc'.
>>
>> There's nothing particularly sophisticated into saving the FDT that
>> can't be done with the machine at any state, as long as the machine has
>> a valid FDT to be saved.
>>
>> The 'dumpdtb' command receives a 'filename' paramenter and, if a valid
>
> Typo "parameter".
>
>> FDT is available, it'll save it in a file 'filename'. In short, this is
>> a '-machine dumpdtb' that can be fired on demand via QMP/HMP.
>>
>> A valid FDT consists of a FDT that was created using libfdt being
>> retrieved via 'current_machine->fdt' in device_tree.c.
>
> This sentence is odd.

Seconded.

>> This condition is
>> met by most FDT users in QEMU.
>>
>> This command will always be executed in-band (i.e. holding BQL),
>> avoiding potential race conditions with machines that might change the
>> FDT during runtime (e.g. PowerPC 'pseries' machine).
>>
>> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> Cc: Markus Armbruster <armbru@redhat.com>
>> Cc: Alistair Francis <alistair.francis@wdc.com>
>> Cc: David Gibson <david@gibson.dropbear.id.au>
>> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hmp-commands.hx              | 15 +++++++++++++++
>>   include/sysemu/device_tree.h |  1 +
>>   monitor/misc.c               |  1 +
>>   qapi/machine.json            | 18 ++++++++++++++++++
>>   softmmu/device_tree.c        | 31 +++++++++++++++++++++++++++++++
>>   5 files changed, 66 insertions(+)
>> diff --git a/hmp-commands.hx b/hmp-commands.hx
>> index 182e639d14..753669a2eb 100644
>> --- a/hmp-commands.hx
>> +++ b/hmp-commands.hx
>> @@ -1800,3 +1800,18 @@ ERST
>>                         "\n\t\t\t\t\t limit on a specified virtual cpu",
>>           .cmd        =3D hmp_cancel_vcpu_dirty_limit,
>>       },
>> +
>> +#if defined(CONFIG_FDT)
>> +    {
>> +        .name       =3D "dumpdtb",
>> +        .args_type  =3D "filename:F",
>> +        .params     =3D "filename",
>> +        .help       =3D "save the FDT in the 'filename' file to be deco=
ded using dtc",

Here, you document the format as "to be decoded using dtc".  In the QAPI
schema below, you document it as "dtb format" and "FDT file".  Pick one
and stick to it, please.

"the 'filename' file" feels a bit awkward.  Suggest something "dump the
FDT in dtb format to 'filename'", similar to your phrasing in the QAPI
schema.


>> +        .cmd        =3D hmp_dumpdtb,
>> +    },
>> +
>> +SRST
>> +``dumpdtb`` *filename*
>> +  Save the FDT in the 'filename' file to be decoded using dtc.

*filename*, not 'filename'.

>> +ERST
>> +#endif
>> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
>> index ef060a9759..e7c5441f56 100644
>> --- a/include/sysemu/device_tree.h
>> +++ b/include/sysemu/device_tree.h
>> @@ -136,6 +136,7 @@ int qemu_fdt_add_path(void *fdt, const char *path);
>>       } while (0)
>>     void qemu_fdt_dumpdtb(void *fdt, int size);
>> +void hmp_dumpdtb(Monitor *mon, const QDict *qdict);
>>     /**
>>    * qemu_fdt_setprop_sized_cells_from_array:
>> diff --git a/monitor/misc.c b/monitor/misc.c
>> index 3d2312ba8d..e7dd63030b 100644
>> --- a/monitor/misc.c
>> +++ b/monitor/misc.c
>> @@ -49,6 +49,7 @@
>>   #include "sysemu/blockdev.h"
>>   #include "sysemu/sysemu.h"
>>   #include "sysemu/tpm.h"
>> +#include "sysemu/device_tree.h"
>>   #include "qapi/qmp/qdict.h"
>>   #include "qapi/qmp/qerror.h"
>>   #include "qapi/qmp/qstring.h"
>> diff --git a/qapi/machine.json b/qapi/machine.json
>> index abb2f48808..9f0c8c8374 100644
>> --- a/qapi/machine.json
>> +++ b/qapi/machine.json
>> @@ -1664,3 +1664,21 @@
>>        '*size': 'size',
>>        '*max-size': 'size',
>>        '*slots': 'uint64' } }
>> +
>> +##
>> +# @dumpdtb:
>> +#
>> +# Save the FDT in dtb format.
>> +#
>> +# @filename: name of the FDT file to be created
>
> "name of the binary FDT ..."?
>
>> +#
>> +# Since: 7.2
>> +#
>> +# Example:
>> +#   {"execute": "dumpdtb"}
>> +#    "arguments": { "filename": "fdt.dtb" } }
>> +#
>> +##
>> +{ 'command': 'dumpdtb',
>> +  'data': { 'filename': 'str' },
>> +  'if': 'CONFIG_FDT' }
>> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
>> index 6ca3fad285..7031dcf89d 100644
>> --- a/softmmu/device_tree.c
>> +++ b/softmmu/device_tree.c
>> @@ -26,6 +26,9 @@
>>   #include "hw/loader.h"
>>   #include "hw/boards.h"
>>   #include "qemu/config-file.h"
>> +#include "qapi/qapi-commands-machine.h"
>> +#include "qapi/qmp/qdict.h"
>> +#include "monitor/hmp.h"
>>     #include <libfdt.h>
>>   @@ -643,3 +646,31 @@ out:
>>       g_free(propcells);
>>       return ret;
>>   }
>> +
>> +void qmp_dumpdtb(const char *filename, Error **errp)
>> +{
>> +    g_autoptr(GError) err =3D NULL;
>> +    int size;
>
> fdt_totalsize() returns an uint32_t. Maybe use "unsigned" if you
> don't want to use uint32_t?

Best to avoid unnecessary conversions between signed and unsigned.

The value is passed to g_file_set_contents() below, which takes a
gssize.  uint32_t should be narrower than gssize on anything capable of
running QEMU.  So let's use that.

>> +
>> +    if (!current_machine->fdt) {
>> +        error_setg(errp, "This machine doesn't have a FDT");
>> +        return;
>> +    }
>> +
>> +    size =3D fdt_totalsize(current_machine->fdt);
>
>        assert(size > 0); ?
>
>> +
>> +    if (!g_file_set_contents(filename, current_machine->fdt, size, &err=
)) {
>> +        error_setg(errp, "Error saving FDT to file %s: %s",
>> +                   filename, err->message);
>> +    }
>
> Eventually:
>
>        info_report("Dumped %u bytes of FDT to %s\n", size, filename);
>
> To have a feedback in HMP.

If feedback is desired, it needs to be done in hmp_dumpdtb().
info_report() here would make the QMP command spam stderr.

>> +}
>> +
>> +void hmp_dumpdtb(Monitor *mon, const QDict *qdict)
>> +{
>> +    const char *filename =3D qdict_get_str(qdict, "filename");
>> +    Error *local_err =3D NULL;
>> +
>> +    qmp_dumpdtb(filename, &local_err);
>> +
>> +    hmp_handle_error(mon, local_err);
>> +}
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

With the commit message, the documentation, and the integer conversions
tidied up:
Reviewed-by: Markus Armbruster <armbru@redhat.com>


