Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C59643E43F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 16:51:27 +0200 (CEST)
Received: from localhost ([::1]:59214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg6kY-0006Vy-7p
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 10:51:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mg6ge-0003SX-7Y
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 10:47:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mg6gb-0001qW-TE
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 10:47:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635432441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BJzRzBWq1ZUQTal6oVIuY+PcRlZYl9F6azALMzFkCtE=;
 b=MVBgaK4Q+P3E+mv/3OrY9oCmhf75qGvDs+SFcqD5/S/2M+Ioc6vr7x4A55Vm4ArbIOC3Qf
 mxLJPknvsx+PufwIr90NvNl86vD5wY8Q438MYq/U4uJghdBerIU4RnHPYC8RhTGCJVt3yL
 +W0NfnfxcaAA5HoK79BUH8Lhlk/wzBY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-9wAhSMHLPo-PobkyRvxHYA-1; Thu, 28 Oct 2021 10:47:18 -0400
X-MC-Unique: 9wAhSMHLPo-PobkyRvxHYA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF680814245;
 Thu, 28 Oct 2021 14:47:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D13826E73;
 Thu, 28 Oct 2021 14:47:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 630F111380A7; Thu, 28 Oct 2021 16:47:14 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v3 04/19] docs/devel: add example of command returning
 unstructured text
References: <20210930132349.3601823-1-berrange@redhat.com>
 <20210930132349.3601823-5-berrange@redhat.com>
Date: Thu, 28 Oct 2021 16:47:14 +0200
In-Reply-To: <20210930132349.3601823-5-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Thu, 30 Sep 2021 14:23:34
 +0100")
Message-ID: <87r1c5nr4d.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

> This illustrates how to add a QMP command returning unstructured text,
> following the guidelines added in the previous patch. The example uses
> a simplified version of 'info roms'.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  docs/devel/writing-monitor-commands.rst | 87 ++++++++++++++++++++++++-
>  1 file changed, 86 insertions(+), 1 deletion(-)
>
> diff --git a/docs/devel/writing-monitor-commands.rst b/docs/devel/writing=
-monitor-commands.rst
> index 0f3b751dab..82a382d700 100644
> --- a/docs/devel/writing-monitor-commands.rst
> +++ b/docs/devel/writing-monitor-commands.rst
> @@ -375,7 +375,9 @@ best practices. An example where this approach is tak=
en is the QMP
>  command "x-query-registers". This returns a formatted dump of the
>  architecture specific CPU state. The way the data is formatted varies
>  across QEMU targets, is liable to change over time, and is only
> -intended to be consumed as an opaque string by machines.
> +intended to be consumed as an opaque string by machines. Refer to the
> +`Writing a debugging aid returning unstructured text`_ section for
> +an illustration.
> =20
>  User Defined Types
>  ~~~~~~~~~~~~~~~~~~
> @@ -647,3 +649,86 @@ has to traverse the list, it's shown below for refer=
ence::
> =20
>       qapi_free_TimerAlarmMethodList(method_list);
>   }
> +
> +Writing a debugging aid returning unstructured text
> +---------------------------------------------------
> +
> +As discussed in section `Modelling data in QAPI`_, it is required that
> +commands expecting machine usage be using fine-grained QAPI data types.
> +The exception to this rule applies when the command is solely intended
> +as a debugging aid and allows for returning unstructured text. This is
> +commonly needed for query commands that report aspects of QEMU's
> +internal state that are useful to human operators.
> +
> +In this example we will consider a simplified variant of the HMP
> +command ``info roms``. Following the earlier rules, this command will
> +need to live under the ``x-`` name prefix, so its QMP implementation
> +will be called ``x-query-roms``. It will have no parameters and will
> +return a single text string::
> +
> + { 'struct': 'HumanReadableText',
> +   'data': { 'human-readable-text': 'str' } }
> +
> + { 'command': 'x-query-roms',
> +   'returns': 'HumanReadableText' }
> +
> +The ``HumanReadableText`` struct is intended to be used for all
> +commands, under the ``x-`` name prefix that are returning unstructured
> +text targetted at humans. It should never be used for commands outside
> +the ``x-`` name prefix, as those should be using structured QAPI types.

This clashes with my "[PATCH v2 0/9] Configurable policy for handling
unstable interfaces", which replaces "you must give unstable stuff names
starting with 'x-'" by "you must give unstable stuff feature flag
'unstable' (and may give it a name starting with 'x-')".

> +
> +Implementing the QMP command
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The QMP implementation will typically involve creating a ``GString``
> +object and printing formatted data into it::
> +
> + HumanReadableText *qmp_x_query_roms(Error **errp)
> + {
> +     g_autoptr(GString) buf =3D g_string_new("");
> +     Rom *rom;
> +
> +     QTAILQ_FOREACH(rom, &roms, next) {
> +        g_string_append_printf("%s size=3D0x%06zx name=3D\"%s\"\n",
> +                               memory_region_name(rom->mr),
> +                               rom->romsize,
> +                               rom->name);
> +     }
> +
> +     return human_readable_text_from_str(buf);
> + }
> +
> +
> +Implementing the HMP command
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Now that the QMP command is in place, we can also make it available in
> +the human monitor (HMP) as shown in previous examples. The HMP
> +implementations will all look fairly similar, as all they need do is
> +invoke the QMP command and then print the resulting text or error
> +message. Here's the implementation of the "info roms" HMP command::
> +
> + void hmp_info_roms(Monitor *mon, const QDict *qdict)
> + {
> +     Error err =3D NULL;
> +     g_autoptr(HumanReadableText) info =3D qmp_x_query_roms(&err);
> +
> +     if (err) {
> +         error_report_err(err);
> +         return;
> +     }

There's hmp_handle_error().

If it returned whether there's an error, we could write

        if (hmp_handle_error(err)) {
            return;
        }

Of course, qmp_x_query_roms() can't fail, so we could just as well do

        g_autoptr(HumanReadableText) info =3D qmp_x_query_roms(&error_abort=
);

Okay as long as we show how to report errors in HMP commands
*somewhere*, but the use of &error_abort needs explaining.  Not sure
that's an improvement here.

Aside: the existing examples show questionable error handling.  The
first one uses error_get_pretty() instead of hmp_handle_error().  The
other two throw away the error they get from the QMP command, and report
"Could not query ..." instead, which is a bit of an anti-pattern.

> +     monitor_printf(mon, "%s\n", info->human_readable_text);

Sure you want to print an extra newline?

If not, then consider

        monitor_puts(mon, info->human_readable_text);

> + }
> +
> +Also, you have to add the function's prototype to the hmp.h file.
> +
> +There's one last step to actually make the command available to
> +monitor users, we should add it to the hmp-commands-info.hx file::
> +
> +    {
> +        .name       =3D "roms",
> +        .args_type  =3D "",
> +        .params     =3D "",
> +        .help       =3D "show roms",
> +        .cmd        =3D hmp_info_roms,
> +    },


