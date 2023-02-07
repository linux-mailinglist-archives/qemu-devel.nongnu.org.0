Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D034868D622
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 13:03:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPMex-0002Fl-EA; Tue, 07 Feb 2023 07:01:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPMev-0002FF-20
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 07:01:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPMeq-0001gY-4e
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 07:01:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675771266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+tAPBvGV2sQ1d83bHnZ8r3bYp52SxUeMiL22SWOSras=;
 b=JVD/uwsuGfL65ciiWbOenFDaQw+cPvArUhmj2fjyurAB4vpVj9X9S4W83j9xXuM6Z/iEZZ
 +bDL2dvye5lpQ+FoP6idA3bVo1BRq8aG1u1MhhbSKoIfL7ickWWXbAsdkAGnI5Ouf7RFEJ
 ev9+kvMYM7zaVod0UGrVfXviuXaTJ84=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42-XIGcQp--ODukuDpEEtBXBg-1; Tue, 07 Feb 2023 07:01:02 -0500
X-MC-Unique: XIGcQp--ODukuDpEEtBXBg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 748068027EB;
 Tue,  7 Feb 2023 12:01:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B9FCC2166B2A;
 Tue,  7 Feb 2023 12:00:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1232921E6A1F; Tue,  7 Feb 2023 13:00:57 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  marcandre.lureau@redhat.com,  mst@redhat.com,
 imammedo@redhat.com,  ani@anisinha.ca,  eduardo@habkost.net,
 marcel.apfelbaum@gmail.com,  wangyanan55@huawei.com,  jiri@resnulli.us,
 jasowang@redhat.com,  pavel.dovgaluk@ispras.ru,  pbonzini@redhat.com,
 zhanghailiang@xfusion.com,  quintela@redhat.com,  dgilbert@redhat.com,
 michael.roth@amd.com,  kkostiuk@redhat.com
Subject: Re: [PATCH 02/12] dump: Improve error message when target doesn't
 support memory dump
References: <20230207075115.1525-1-armbru@redhat.com>
 <20230207075115.1525-3-armbru@redhat.com>
 <0cff7e74-c230-2979-9643-9f108809c7d6@linaro.org>
Date: Tue, 07 Feb 2023 13:00:57 +0100
In-Reply-To: <0cff7e74-c230-2979-9643-9f108809c7d6@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 7 Feb 2023 09:32:02
 +0100")
Message-ID: <878rh9vg5i.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
>> Get rid of a use of QERR_UNSUPPORTED, and improve the rather vague
>> error message
>>      (qemu) dump-guest-memory mumble
>>      Error: this feature or command is not currently supported
>> to
>>      Error: guest memory dumping is not supported on this target
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>   dump/dump.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>> diff --git a/dump/dump.c b/dump/dump.c
>> index 279b07f09b..80620da40d 100644
>> --- a/dump/dump.c
>> +++ b/dump/dump.c
>> @@ -1854,7 +1854,8 @@ static void dump_init(DumpState *s, int fd, bool h=
as_format,
>>        */
>>       ret =3D cpu_get_dump_info(&s->dump_info, &s->guest_phys_blocks);
>>       if (ret < 0) {
>> -        error_setg(errp, QERR_UNSUPPORTED);
>> +        error_setg(errp,
>> +                   "guest memory dumping is not supported on this targe=
t");
>
> "Dumping guest memory is not supported on this target"?

Sold!

>>           goto cleanup;
>>       }
>>=20=20=20


