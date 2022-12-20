Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E161651FD4
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 12:39:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7agD-0006tl-HG; Tue, 20 Dec 2022 06:21:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7ag5-0006sZ-FI
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:20:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7ag3-0005jJ-HB
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:20:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671535254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PlpAp5/0tYpO1w07rsogn71AwomzqZBMOjiellSbT/s=;
 b=I7E3thuYAOtUmurpIoQGNSe1dBS64mdCDwqGt/kRgQJ2YnEEM5wyPvA5Nqk0i/prNuKzsd
 W0GGqrafTncOWuemU+oV7qUG7gO891Qvfnp136E/oM/EFpyTeUpX5sVhXZ5OUtiohuocng
 xi3b90AuxS3keOwN6vI04G8UFX1+fqc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-oXnnvCISM3iDJX6Dlwo77A-1; Tue, 20 Dec 2022 06:20:53 -0500
X-MC-Unique: oXnnvCISM3iDJX6Dlwo77A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 291D43C02541;
 Tue, 20 Dec 2022 11:20:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE559175AD;
 Tue, 20 Dec 2022 11:20:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D0FEE21E691D; Tue, 20 Dec 2022 12:20:51 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  kraxel@redhat.com,  dgilbert@redhat.com,
 philmd@linaro.org
Subject: Re: [PATCH v3 16/18] ui: Split hmp_mouse_set() and move the HMP
 part to ui/
References: <20221220090645.2844881-1-armbru@redhat.com>
 <20221220090645.2844881-17-armbru@redhat.com>
 <Y6F9SbmIGXQz8pjV@redhat.com>
Date: Tue, 20 Dec 2022 12:20:51 +0100
In-Reply-To: <Y6F9SbmIGXQz8pjV@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Tue, 20 Dec 2022 09:15:53 +0000")
Message-ID: <877cym9v8s.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

> On Tue, Dec 20, 2022 at 10:06:43AM +0100, Markus Armbruster wrote:
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  include/monitor/hmp.h | 1 +
>>  include/ui/console.h  | 2 +-
>>  monitor/misc.c        | 1 -
>>  ui/input.c            | 5 +----
>>  ui/ui-hmp-cmds.c      | 8 ++++++++
>>  5 files changed, 11 insertions(+), 6 deletions(-)
>
>>=20=20
>> -void hmp_mouse_set(Monitor *mon, const QDict *qdict)
>> +void qemu_mouse_set(int index, Error **err)
>
> This is adding a Error parameter, nit s/err/errp/

Yes.

>>  {
>>      QemuInputHandlerState *s;
>> -    int index =3D qdict_get_int(qdict, "index");
>>      int found =3D 0;
>>=20=20
>>      QTAILQ_FOREACH(s, &handlers, node) {
>
> But not changing either error_report() call to error_setg(),
> so the errp is unused.

I suspect I some distraction hit my flu-addled brain in just the right
moment, and I forgot to flip to error_setg().  Will fix, thanks!


