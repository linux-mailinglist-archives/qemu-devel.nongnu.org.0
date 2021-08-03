Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA4B3DE64D
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 07:45:50 +0200 (CEST)
Received: from localhost ([::1]:52320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAnFN-0005dJ-5s
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 01:45:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mAnEA-0004At-Ov
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 01:44:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mAnE7-0001o4-6b
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 01:44:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627969469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FYRPUlAFLIPQVMzv2PNNFMO5Fvr3SQiie6wCldZ6cas=;
 b=X5gUGXFtGaS6UqCCUUrUFXfD/qOe8d21lXO/ic21FNwDDHChfmkFsKVTyGEt6c5OwGzOdV
 tu/J93g+lOpgOvpHyuIF3WcmU4834VNH/Hn74mCXsK8Je+WIKBgZtl/NVyOytPFuDVGkZ8
 +owuI4a/pmxT63uZeWRNvD4Ka7QF51M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-Y_snMGVZMlyOvOMgjewB3g-1; Tue, 03 Aug 2021 01:44:26 -0400
X-MC-Unique: Y_snMGVZMlyOvOMgjewB3g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46CAD802928;
 Tue,  3 Aug 2021 05:44:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D859660C0F;
 Tue,  3 Aug 2021 05:44:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 633FF11380A0; Tue,  3 Aug 2021 07:44:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 01/16] error: Use error_fatal to simplify obvious fatal
 errors (again)
References: <20210720125408.387910-1-armbru@redhat.com>
 <20210720125408.387910-2-armbru@redhat.com>
 <198e6959-2c32-9829-18aa-bd01e7412d7a@redhat.com>
Date: Tue, 03 Aug 2021 07:44:09 +0200
In-Reply-To: <198e6959-2c32-9829-18aa-bd01e7412d7a@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 2 Aug 2021 21:02:46
 +0200")
Message-ID: <871r7bkrpy.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: Thomas Huth <thuth@redhat.com>,
 "Daniel P . =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Cornelia Huck <cornelia.huck@de.ibm.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 7/20/21 2:53 PM, Markus Armbruster wrote:
>> We did this with scripts/coccinelle/use-error_fatal.cocci before, in
>> commit 50beeb68094 and 007b06578ab.  This commit cleans up rarer
>> variations that don't seem worth matching with Coccinelle.
>>=20
>> Cc: Thomas Huth <thuth@redhat.com>
>> Cc: Cornelia Huck <cornelia.huck@de.ibm.com>
>> Cc: Peter Xu <peterx@redhat.com>
>> Cc: Juan Quintela <quintela@redhat.com>
>> Cc: Stefan Hajnoczi <stefanha@redhat.com>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  hw/s390x/ipl.c        |  6 +-----
>>  migration/migration.c |  7 +------
>>  qemu-img.c            |  6 +-----
>>  qemu-io.c             |  6 +-----
>>  qemu-nbd.c            |  5 +----
>>  scsi/qemu-pr-helper.c | 11 +++--------
>>  softmmu/vl.c          |  7 +------
>>  target/i386/sev.c     |  8 +-------
>>  ui/console.c          |  6 ++----
>>  ui/spice-core.c       |  7 +------
>>  10 files changed, 13 insertions(+), 56 deletions(-)
>
>> diff --git a/softmmu/vl.c b/softmmu/vl.c
>> index 4df1496101..0d2db1abc3 100644
>> --- a/softmmu/vl.c
>> +++ b/softmmu/vl.c
>> @@ -2673,12 +2673,7 @@ void qmp_x_exit_preconfig(Error **errp)
>>      qemu_machine_creation_done();
>> =20
>>      if (loadvm) {
>> -        Error *local_err =3D NULL;
>> -        if (!load_snapshot(loadvm, NULL, false, NULL, &local_err)) {
>> -            error_report_err(local_err);
>> -            autostart =3D 0;
>
> Uh, odd assignment...

Yup.

Commit 05f2401eb2 "make load_vmstate() return errors" added the
assignment:

    @@ -6030,8 +6030,11 @@ int main(int argc, char **argv, char **envp)
             exit(1);
         }

    -    if (loadvm)
    -        load_vmstate(cur_mon, loadvm);
    +    if (loadvm) {
    +        if (load_vmstate(cur_mon, loadvm) < 0) {
    +            autostart =3D 0;
    +        }
    +    }

         if (incoming) {
             qemu_start_incoming_migration(incoming);


827beacb47 "Add a hint message to loadvm and exits on failure" added the
exit(1) without deleting the now useless assignment:

    @@ -4530,6 +4530,7 @@ int main(int argc, char **argv, char **envp)
             if (load_snapshot(loadvm, &local_err) < 0) {
                 error_report_err(local_err);
                 autostart =3D 0;
    +            exit(1);
             }
         }

>> -            exit(1);
>> -        }
>> +        load_snapshot(loadvm, NULL, false, NULL, &error_fatal);
>>      }
>>      if (replay_mode !=3D REPLAY_MODE_NONE) {
>>          replay_vmstate_init();
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Thanks!


