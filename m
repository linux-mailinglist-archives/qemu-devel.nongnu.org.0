Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8506628B2
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 15:39:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEtFb-0007gR-Eh; Mon, 09 Jan 2023 09:35:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pEtFV-0007ZV-AW
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:35:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pEtFT-0002mQ-Co
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:35:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673274938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TU7BOUJPRorY1ovf5vmJDOjWh8Y4gxjhxDS80e3IHho=;
 b=bhh5bxrWt+tuqcXvbaPAZ9CbeLJ3ueKSwGbSxkx7DIPGQEc2oK75/Jff95mSxUGMFzA1Sc
 LQS8gORBH86lY8V0LRtCPrOrvjxMwtd5zX9/McMlhBTfHN9PjJ5apGBWwLy2rh/UWqdBHh
 c/gM1aM+234yiOj24Bp9d07fqk1ubqc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-jMyncpENNx2LdygKdlk53A-1; Mon, 09 Jan 2023 09:35:37 -0500
X-MC-Unique: jMyncpENNx2LdygKdlk53A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1ABF18E6205;
 Mon,  9 Jan 2023 14:35:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D09240C1141;
 Mon,  9 Jan 2023 14:35:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 24D9321E5DCF; Mon,  9 Jan 2023 15:35:35 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  kraxel@redhat.com,  dgilbert@redhat.com,
 berrange@redhat.com
Subject: Re: [PATCH v3 16/18] ui: Split hmp_mouse_set() and move the HMP
 part to ui/
References: <20221220090645.2844881-1-armbru@redhat.com>
 <20221220090645.2844881-17-armbru@redhat.com>
 <447fe63f-782c-78ea-f16e-58298530e89e@linaro.org>
Date: Mon, 09 Jan 2023 15:35:35 +0100
In-Reply-To: <447fe63f-782c-78ea-f16e-58298530e89e@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 20 Dec 2022 12:17:22
 +0100")
Message-ID: <875ydfsrm0.fsf@pond.sub.org>
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

> On 20/12/22 10:06, Markus Armbruster wrote:
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>   include/monitor/hmp.h | 1 +
>>   include/ui/console.h  | 2 +-
>>   monitor/misc.c        | 1 -
>>   ui/input.c            | 5 +----
>>   ui/ui-hmp-cmds.c      | 8 ++++++++
>>   5 files changed, 11 insertions(+), 6 deletions(-)
>
>
>> diff --git a/include/ui/console.h b/include/ui/console.h
>> index e400ee9fa7..e7f375312c 100644
>> --- a/include/ui/console.h
>> +++ b/include/ui/console.h
>> @@ -65,7 +65,7 @@ void qemu_remove_led_event_handler(QEMUPutLEDEntry *en=
try);
>>=20=20=20
>>   void kbd_put_ledstate(int ledstate);
>>=20=20=20
>> -void hmp_mouse_set(Monitor *mon, const QDict *qdict);
>> +void qemu_mouse_set(int index, Error **err);
>
> Can we return a boolean to indicate eventual failure?

The only caller isn't interested.  But we could do it anyway to conform
to the guidance in qapi/error.h.

>> @@ -594,10 +592,9 @@ MouseInfoList *qmp_query_mice(Error **errp)
>>       return mice_list;
>>   }
>>=20=20=20
>> -void hmp_mouse_set(Monitor *mon, const QDict *qdict)
>> +void qemu_mouse_set(int index, Error **err)
>>   {
>>       QemuInputHandlerState *s;
>> -    int index =3D qdict_get_int(qdict, "index");
>>       int found =3D 0;
>>=20=20=20
>>       QTAILQ_FOREACH(s, &handlers, node) {
>
> However no failure is reported, errp isn't used... Do we really
> want to pass it along?

Daniel spotted this, too.  See my reply there.

Thanks!


