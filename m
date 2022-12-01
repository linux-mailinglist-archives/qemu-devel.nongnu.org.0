Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EF963EDB6
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 11:28:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0gnG-0001RD-L6; Thu, 01 Dec 2022 05:27:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0gnF-0001R4-E1
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 05:27:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0gnD-0001pf-UG
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 05:27:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669890466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i2iyW3Xt6qYknGYWZHoikEvmP7H1jutjjdQg85zm80s=;
 b=DCAXNqY7ssT3430z+hOxanYoCXC5iTtXvL+JrkErU9wGrZfT8DPhu2DX8qHn0xpsLzl07h
 qL2I09EKEHvmOcdWHJaVVABjYdciDAmUoNKPF4Npl/aFOAJ5oJitPnEfzZPA9CeGhF9UsF
 lZOMH77Tbs0ZExwi+y0ADFLJaSA1d8s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-jSGRxDgyMJ6LtnknmiLu7A-1; Thu, 01 Dec 2022 05:27:43 -0500
X-MC-Unique: jSGRxDgyMJ6LtnknmiLu7A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DB5D811E67
 for <qemu-devel@nongnu.org>; Thu,  1 Dec 2022 10:27:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 13E3640C6EC4;
 Thu,  1 Dec 2022 10:27:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 04AE121E6921; Thu,  1 Dec 2022 11:27:40 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  kraxel@redhat.com,  dgilbert@redhat.com
Subject: Re: [PATCH 7/9] ui: Improve "change vnc" error reporting
References: <20221201061311.3619052-1-armbru@redhat.com>
 <20221201061311.3619052-8-armbru@redhat.com>
 <Y4hsPRdGwofzNeST@redhat.com>
Date: Thu, 01 Dec 2022 11:27:39 +0100
In-Reply-To: <Y4hsPRdGwofzNeST@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 1 Dec 2022 08:56:29 +0000")
Message-ID: <875yevzaec.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Thu, Dec 01, 2022 at 07:13:09AM +0100, Markus Armbruster wrote:
>> Switch from monitor_printf() to error_setg() and hmp_handle_error().
>> This makes "this is an error" more obvious both in the source and in
>> the monitor, where hmp_handle_error() prefixes the message with
>> "Error: ".
>>=20
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  monitor/hmp-cmds.c |  8 ++++----
>>  ui/ui-hmp-cmds.c   | 22 ++++++++++++++++++++++
>>  2 files changed, 26 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>> index f0f7b74fb3..8542eee3d4 100644
>> --- a/monitor/hmp-cmds.c
>> +++ b/monitor/hmp-cmds.c
>> @@ -1209,9 +1209,8 @@ void hmp_change(Monitor *mon, const QDict *qdict)
>>  #ifdef CONFIG_VNC
>>      if (strcmp(device, "vnc") =3D=3D 0) {
>>          if (read_only) {
>> -            monitor_printf(mon,
>> -                           "Parameter 'read-only-mode' is invalid for V=
NC\n");
>> -            return;
>> +            error_setg(&err, "Parameter 'read-only-mode' is invalid for=
 VNC");
>> +            goto end;
>>          }
>>          if (strcmp(target, "passwd") =3D=3D 0 ||
>>              strcmp(target, "password") =3D=3D 0) {
>> @@ -1223,7 +1222,8 @@ void hmp_change(Monitor *mon, const QDict *qdict)
>>                  qmp_change_vnc_password(arg, &err);
>>              }
>>          } else {
>> -            monitor_printf(mon, "Expected 'password' after 'vnc'\n");
>> +            error_setg(&err, "Expected 'password' after 'vnc'");
>> +            goto end;
>>          }
>>      } else
>>  #endif
>
> Upto this point
>
>   Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>
>
>> diff --git a/ui/ui-hmp-cmds.c b/ui/ui-hmp-cmds.c
>> index af290da9e1..90a4f86f25 100644
>> --- a/ui/ui-hmp-cmds.c
>> +++ b/ui/ui-hmp-cmds.c
>> @@ -270,6 +270,28 @@ out:
>>      hmp_handle_error(mon, err);
>>  }
>>=20=20
>> +void hmp_change_vnc(Monitor *mon, const char *device, const char *targe=
t,
>> +                    const char *arg, const char *read_only, bool force,
>> +                    Error **errp)
>> +{
>> +    if (read_only) {
>> +        error_setg(mon, "Parameter 'read-only-mode' is invalid for VNC"=
);
>> +        return;
>> +    }
>> +    if (strcmp(target, "passwd") =3D=3D 0 ||
>> +        strcmp(target, "password") =3D=3D 0) {
>> +        if (!arg) {
>> +            MonitorHMP *hmp_mon =3D container_of(mon, MonitorHMP, commo=
n);
>> +            monitor_read_password(hmp_mon, hmp_change_read_arg, NULL);
>> +            return;
>> +        } else {
>> +            qmp_change_vnc_password(arg, &err);
>> +        }
>> +    } else {
>> +        monitor_printf(mon, "Expected 'password' after 'vnc'\n");
>> +    }
>> +}
>> +
>
> This chunk ought to be in the next patch IIUC

Oops!  Thank you!

>>  void hmp_sendkey(Monitor *mon, const QDict *qdict)
>>  {
>>      const char *keys =3D qdict_get_str(qdict, "keys");
>> --=20
>> 2.37.3
>>=20
>>=20
>
> With regards,
> Daniel


