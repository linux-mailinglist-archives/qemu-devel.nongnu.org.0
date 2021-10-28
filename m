Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4245C43E6F6
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 19:14:59 +0200 (CEST)
Received: from localhost ([::1]:42492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg8zS-0006Qk-DB
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 13:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mg8yd-0005hY-Qv
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 13:14:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mg8ya-00039u-V2
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 13:14:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635441243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IouIQMJ3Er1NgE1ORziEj90V1AmUCnq6/CxNOVe4f8g=;
 b=NW6ztlRAlrElSJW1gpR7PNi1J5OE9Xwrv9i9N8Btdzrj1PeVu5sMi37BelMvj/PquxGAX5
 0Y1c1+SREAyLQwO4NRDRPbO6xN5IbCoxO4hQZC2qcZAG4+kQyVvtFqOy3iBWLzablzlzp7
 FGY1eTmZYKUgrQMZaB27g6TCkLQkoEw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-bVDWP6jzN8efB7MxFuiPKA-1; Thu, 28 Oct 2021 13:14:00 -0400
X-MC-Unique: bVDWP6jzN8efB7MxFuiPKA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E33C2CC621;
 Thu, 28 Oct 2021 17:13:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B5FB60BF1;
 Thu, 28 Oct 2021 17:13:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2170811380A7; Thu, 28 Oct 2021 19:13:57 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v3 04/19] docs/devel: add example of command returning
 unstructured text
References: <20210930132349.3601823-1-berrange@redhat.com>
 <20210930132349.3601823-5-berrange@redhat.com>
 <87r1c5nr4d.fsf@dusky.pond.sub.org> <YXrCbIP2d19ofgL0@redhat.com>
Date: Thu, 28 Oct 2021 19:13:57 +0200
In-Reply-To: <YXrCbIP2d19ofgL0@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 28 Oct 2021 16:31:56 +0100")
Message-ID: <87pmrpkr6y.fsf@dusky.pond.sub.org>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Thu, Oct 28, 2021 at 04:47:14PM +0200, Markus Armbruster wrote:
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>>=20
>> > This illustrates how to add a QMP command returning unstructured text,
>> > following the guidelines added in the previous patch. The example uses
>> > a simplified version of 'info roms'.
>> >
>> > Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> > ---
>> >  docs/devel/writing-monitor-commands.rst | 87 ++++++++++++++++++++++++=
-
>> >  1 file changed, 86 insertions(+), 1 deletion(-)
>
>> > +Implementing the HMP command
>> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> > +
>> > +Now that the QMP command is in place, we can also make it available i=
n
>> > +the human monitor (HMP) as shown in previous examples. The HMP
>> > +implementations will all look fairly similar, as all they need do is
>> > +invoke the QMP command and then print the resulting text or error
>> > +message. Here's the implementation of the "info roms" HMP command::
>> > +
>> > + void hmp_info_roms(Monitor *mon, const QDict *qdict)
>> > + {
>> > +     Error err =3D NULL;
>> > +     g_autoptr(HumanReadableText) info =3D qmp_x_query_roms(&err);
>> > +
>> > +     if (err) {
>> > +         error_report_err(err);
>> > +         return;
>> > +     }
>>=20
>> There's hmp_handle_error().
>>=20
>> If it returned whether there's an error, we could write
>>=20
>>         if (hmp_handle_error(err)) {
>>             return;
>>         }
>
> I'll add a return value to hmp_handle_error and update existing
> callers where appropriate
>
>>=20
>> Of course, qmp_x_query_roms() can't fail, so we could just as well do
>>=20
>>         g_autoptr(HumanReadableText) info =3D qmp_x_query_roms(&error_ab=
ort);
>>=20
>> Okay as long as we show how to report errors in HMP commands
>> *somewhere*, but the use of &error_abort needs explaining.  Not sure
>> that's an improvement here.
>
> For the sake of illustration I think I'll stick with hmp_handle_error
> and not &error_abort.  In fact following Dave's feedback, I've added
> a helper to provide the HMP implementation with no code required in
> the no-arg case.
>
>> Aside: the existing examples show questionable error handling.  The
>> first one uses error_get_pretty() instead of hmp_handle_error().  The
>> other two throw away the error they get from the QMP command, and report
>> "Could not query ..." instead, which is a bit of an anti-pattern.
>
> I'll fix those examples

Thanks!

>>=20
>> > +     monitor_printf(mon, "%s\n", info->human_readable_text);
>>=20
>> Sure you want to print an extra newline?
>
> Opps, mistake.
>
>> If not, then consider
>>=20
>>         monitor_puts(mon, info->human_readable_text);
>
> I'd prefer "%s", since it avoids danger of the human readable
> text possibly containing a '%' sign that trips up printf.

Read that again: "puts" :)


