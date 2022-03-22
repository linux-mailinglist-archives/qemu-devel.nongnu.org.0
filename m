Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A764E3C48
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 11:16:59 +0100 (CET)
Received: from localhost ([::1]:34402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWbZS-0001GY-MW
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 06:16:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nWbXy-0000Tx-4f
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 06:15:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nWbXu-0003ao-OO
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 06:15:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647944121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6qRXVU3pTUdigH53ziRR2/MI1rF3QL2ap2OSufNvLg0=;
 b=InKSMJu500LUbjwLqAWE8UoYxNJFuxH/wNpLcj+FKpXLoDyBSAI9iufWGmtrw7qMDfbme9
 liJBQjoxlu94K2eZt46chRje5Nh3ebJLLesd/myq2HqEYn02fprrToBThBnWwFreM8S+Vx
 uRN+XIBVce4Li+IjQZwBgxlTXB3YYu8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347-QuDylOmeNTmKvjgaFPfzIw-1; Tue, 22 Mar 2022 06:15:18 -0400
X-MC-Unique: QuDylOmeNTmKvjgaFPfzIw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DCB53C0D1AC;
 Tue, 22 Mar 2022 10:15:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA5AD40CF8EF;
 Tue, 22 Mar 2022 10:15:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A85FE21E6821; Tue, 22 Mar 2022 11:15:16 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v2 2/2] Added parameter to take screenshot with
 screendump as PNG
References: <20220322081845.19680-1-kshitij.suri@nutanix.com>
 <20220322081845.19680-2-kshitij.suri@nutanix.com>
 <YjmbL3E2CRqjFii1@redhat.com>
Date: Tue, 22 Mar 2022 11:15:16 +0100
In-Reply-To: <YjmbL3E2CRqjFii1@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Tue, 22 Mar 2022 09:47:27 +0000")
Message-ID: <877d8mi98r.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: soham.ghosh@nutanix.com, thuth@redhat.com, prerna.saxena@nutanix.com,
 qemu-devel@nongnu.org, dgilbert@redhat.com,
 Kshitij Suri <kshitij.suri@nutanix.com>, philippe.mathieu.daude@gmail.com,
 kraxel@redhat.com, prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Tue, Mar 22, 2022 at 08:18:45AM +0000, Kshitij Suri wrote:
>> Currently screendump only supports PPM format, which is un-compressed an=
d not
>> standard. Added a "format" parameter to qemu monitor screendump capabili=
tes
>> to support PNG image capture using libpng. The param was added in QAPI s=
chema
>> of screendump present in ui.json along with png_save() function which co=
nverts
>> pixman_image to PNG. HMP command equivalent was also modified to support=
 the
>> feature.
>>=20
>> Example usage:
>> { "execute": "screendump", "arguments": { "filename": "/tmp/image",
>> "format":"png" } }
>>=20
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/718
>>=20
>> Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
>> ---
>> diff to v1:
>>   - Removed repeated alpha conversion operation.
>>   - Modified logic to mirror png conversion in vnc-enc-tight.c file.
>>   - Added a new CONFIG_PNG parameter for libpng support.
>>   - Changed input format to enum instead of string.
>>   - Improved error handling.
>>  hmp-commands.hx    |  11 ++---
>>  monitor/hmp-cmds.c |  20 ++++++++-
>>  qapi/ui.json       |  24 +++++++++--
>>  ui/console.c       | 101 +++++++++++++++++++++++++++++++++++++++++++--
>>  4 files changed, 144 insertions(+), 12 deletions(-)
>>=20
>> diff --git a/hmp-commands.hx b/hmp-commands.hx
>> index 8476277aa9..19b7cab595 100644
>> --- a/hmp-commands.hx
>> +++ b/hmp-commands.hx
>> @@ -244,11 +244,12 @@ ERST
>> =20
>>      {
>>          .name       =3D "screendump",
>> -        .args_type  =3D "filename:F,device:s?,head:i?",
>> -        .params     =3D "filename [device [head]]",
>> -        .help       =3D "save screen from head 'head' of display device=
 'device' "
>> -                      "into PPM image 'filename'",
>> -        .cmd        =3D hmp_screendump,
>> +        .args_type  =3D "filename:F,format:s?,device:s?,head:i?",
>> +        .params     =3D "filename [format] [device [head]]",
>> +        .help       =3D "save screen from head 'head' of display device=
 'device'"
>> +                      "in specified format 'format' as image 'filename'=
."
>> +                      "Currently only 'png' and 'ppm' formats are suppo=
rted.",
>> +         .cmd        =3D hmp_screendump,
>>          .coroutine  =3D true,
>>      },
>> =20
>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>> index 634968498b..bf3ba76bd3 100644
>> --- a/monitor/hmp-cmds.c
>> +++ b/monitor/hmp-cmds.c
>> @@ -1720,9 +1720,27 @@ hmp_screendump(Monitor *mon, const QDict *qdict)
>>      const char *filename =3D qdict_get_str(qdict, "filename");
>>      const char *id =3D qdict_get_try_str(qdict, "device");
>>      int64_t head =3D qdict_get_try_int(qdict, "head", 0);
>> +    const char *input_format  =3D qdict_get_try_str(qdict, "format");
>>      Error *err =3D NULL;
>> +    ImageFormat format;
>> =20
>> -    qmp_screendump(filename, id !=3D NULL, id, id !=3D NULL, head, &err=
);
>> +    int val =3D qapi_enum_parse(&ImageFormat_lookup, input_format,
>> +                              IMAGE_FORMAT_PPM, &err);
>> +    if (err) {
>> +        goto end;
>> +    }
>> +
>> +    switch (val) {
>> +    case IMAGE_FORMAT_PNG:
>> +        format =3D IMAGE_FORMAT_PNG;
>> +        break;
>> +    default:
>> +        format =3D IMAGE_FORMAT_PPM;
>> +    }
>
> This switch looks pointless - the code is passing the default into
> qapi_enum_parse already, this doesn't need to handle defaulting
> again. This just needs
>
>         format =3D qapi_enum_parse(&ImageFormat_lookup, input_format,
>                                  IMAGE_FORMAT_PPM, &err);
>         if (err) {
>            goto end;
>          }

Correct.  See my review of v1 for a detailed explanation.

>
>> +
>> +    qmp_screendump(filename, id !=3D NULL, id, id !=3D NULL, head,
>> +                   input_format !=3D NULL, format, &err);
>> +end:
>>      hmp_handle_error(mon, err);
>>  }
>> =20
>
>> +    for (y =3D 0; y < height; ++y) {
>> +        qemu_pixman_linebuf_fill(linebuf, image, width, 0, y);
>> +       png_write_row(png_ptr, buf);
>> +    }
>
> Tiny style bug, indent off-by-1
>
>
> With regards,
> Daniel


