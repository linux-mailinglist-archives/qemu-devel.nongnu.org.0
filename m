Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 722704047DA
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 11:35:40 +0200 (CEST)
Received: from localhost ([::1]:44570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOGT4-0008Q5-Uf
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 05:35:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mOGQz-0006On-D5
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 05:33:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mOGQx-0001BH-7w
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 05:33:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631180006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/7I22n1JlMBc0Gpi1UDzpt+2MYrFBUjfo6McnPWUPxY=;
 b=D9kTSU/vPGI5eP1Lb62v1QZQJqcQjCJBKUutaKPzMgBrLTgwAt3NPldymbC5FWlrmBy2Uq
 5m9GDolUSiwVZhynaU22/Mw1MSSJK17AxzeMyg7cEnRBs+DW5cN+c8N/+VBBAMsBDazop5
 Es6wXqkUsk9+3qnMSo+Qr+86Wpi2dVE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-weNaCH4FN72kTbEb4bh6zw-1; Thu, 09 Sep 2021 05:33:23 -0400
X-MC-Unique: weNaCH4FN72kTbEb4bh6zw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEDA180006E;
 Thu,  9 Sep 2021 09:33:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 67A3F19C79;
 Thu,  9 Sep 2021 09:33:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EA4741138606; Thu,  9 Sep 2021 11:33:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH 1/5] docs/devel: document expectations for QAPI data
 modelling for QMP
References: <20210908103711.683940-1-berrange@redhat.com>
 <20210908103711.683940-2-berrange@redhat.com>
Date: Thu, 09 Sep 2021 11:33:20 +0200
In-Reply-To: <20210908103711.683940-2-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Wed, 8 Sep 2021 11:37:07
 +0100")
Message-ID: <87tuium6u7.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> Traditionally we have required that newly added QMP commands will model
> any returned data using fine grained QAPI types. This is good for
> commands that are intended to be consumed by machines, where clear data
> representation is very important. Commands that don't satisfy this have
> generally been added to HMP only.
>
> In effect the decision of whether to add a new command to QMP vs HMP has
> been used as a proxy for the decision of whether the cost of designing a
> fine grained QAPI type is justified by the potential benefits.
>
> As a result the commands present in QMP and HMP are non-overlapping
> sets, although HMP comamnds can be accessed indirectly via the QMP
> command 'human-monitor-command'.
>
> One of the downsides of 'human-monitor-command' is that the QEMU monitor
> APIs remain tied into various internal parts of the QEMU code. For
> example any exclusively HMP command will need to use 'monitor_printf'
> to get data out. It would be desirable to be able to fully isolate the
> monitor implementation from QEMU internals, however, this is only
> possible if all commands are exclusively based on QAPI with direct
> QMP exposure.
>
> The way to achieve this desired end goal is to finese the requirements
> for QMP command design. For cases where the output of a command is only
> intended for human consumption, it is reasonable to want to simplify
> the implementation by returning a plain string containing formatted
> data instead of designing a fine grained QAPI data type. This can be
> permitted if-and-only-if the command is exposed under the 'x-' name
> prefix. This indicates that the command data format is liable to
> future change and that it is not following QAPI design best practice.
>
> The poster child example for this would be the 'info registers' HMP
> command which returns printf formatted data representing CPU state.
> This information varies enourmously across target architectures and
> changes relatively frequently as new CPU features are implemented.
> It is there as debugging data for human operators, and any machine
> usage would treat it as an opaque blob. It is thus reasonable to
> expose this in QMP as 'x-query-registers' returning a 'str' field.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  docs/devel/writing-qmp-commands.rst | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/docs/devel/writing-qmp-commands.rst b/docs/devel/writing-qmp=
-commands.rst
> index 6a10a06c48..d032daa62d 100644
> --- a/docs/devel/writing-qmp-commands.rst
> +++ b/docs/devel/writing-qmp-commands.rst
> @@ -350,6 +350,31 @@ In this section we will focus on user defined types.=
 Please, check the QAPI
>  documentation for information about the other types.
> =20
> =20
> +Modelling data in QAPI
> +~~~~~~~~~~~~~~~~~~~~~~

Outline now:

    How to write QMP commands using the QAPI framework
        Overview
        Testing
        Writing a command that doesn't return data
            Arguments
            Errors
            Command Documentation
            Implementing the HMP command
        Writing a command that returns data
-->         Modelling data in QAPI
            User Defined Types
            The HMP command
            Returning Lists

Awkward.  I guess you wanted it next to "User Defined Types", which
makes some sense.

Perhaps minor tweaks (headlines, maybe a bit of text as well) would
suffice:

    How to write QMP commands using the QAPI framework
        Overview
        Testing
        Writing a simple command: hello-world
            Arguments
            Errors
            Command Documentation
            Implementing the HMP command
        Writing more complex commands
            Modelling data in QAPI
            User Defined Types
            The HMP command
            Returning Lists

> +
> +For a QMP command that to be considered stable and supported long term t=
here

"term, there"

> +is a requirement returned data should be explicitly modelled using fine =
grained

"fine-grained", I think.

> +QAPI types. As a general guide, a caller of the QMP command should never=
 need
> +to parse individual returned data fields. If a field appears to need par=
sing,
> +them it should be split into separate fields corresponding to each disti=
nct
> +data item. This should be the common case for any new QMP command that i=
s
> +intended to be used by machines, as opposed to exclusively human operato=
rs.
> +
> +Some QMP commands, however, are only intended as adhoc debugging aids fo=
r human
> +operators. While they may return large amounts of formatted data, it is =
not
> +expected that machines will need to parse the result. The overhead of de=
fining
> +a fine grained QAPI type for the data may not be justified by the potent=
ial
> +benefit. In such cases, it is permitted to have a command return a simpl=
e string

There are many existing long lines in this file, so I'm not flagging
yours, except for this one, because it increases the maximum.

> +that contains formatted data, however, it is mandatory for the command t=
o use
> +the 'x-' name prefix. This indicates that the command is not guaranteed =
to be
> +long term stable / liable to change in future and is not following QAPI =
design
> +best practices. An example where this approach is taken is the QMP comma=
nd
> +"x-query-registers". This returns a printf formatted dump of the archite=
cture

Drop "printf".

> +specific CPU state. The way the data is formatted varies across QEMU tar=
gets,
> +is liable to change over time, and is only intended to be consumed as an=
 opaque
> +string by machines.
> +
>  User Defined Types
>  ~~~~~~~~~~~~~~~~~~

This file is a tutorial.  It teaches command writing by examples[*].  I
think it should also teach this new class of "ad hoc" QMP commands the
same way.  A section "Writing a debugging aid returning unstructured
text" could go at the very end.


[*] Bit-rotten in places, but that's life for docs.


