Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 021FA404787
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 11:06:55 +0200 (CEST)
Received: from localhost ([::1]:33922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOG1F-00085z-VX
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 05:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mOFzr-0007GT-Jv
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 05:05:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mOFzp-0002Ox-Hc
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 05:05:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631178324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=317o9231meJFwlrCcW9C3c1IbIRWyjGtgUO2ktqYpO8=;
 b=PFoxzvab9v+gzFHOTpHNDeouyUzcnwUHDbXpsn5oebLH6miOZAK+YAbL+S+Ol1xs/1W138
 wigJ8B2bxlIE3c7g79K/oYh63cpI0C2IkjzQHWKPwUchh2FUgfV5nGZEq9Q4w1NHlRIplX
 2S9MAAMx0bRC7F2evXaCyfF+wVrFW14=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-qaTt1rJVPr60cplgc1_2JA-1; Thu, 09 Sep 2021 05:05:23 -0400
X-MC-Unique: qaTt1rJVPr60cplgc1_2JA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99B4D1006AA0;
 Thu,  9 Sep 2021 09:05:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 68CFD5C1D0;
 Thu,  9 Sep 2021 09:05:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EC1161138606; Thu,  9 Sep 2021 11:05:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH 4/5] qapi: introduce x-query-registers QMP command
References: <20210908103711.683940-1-berrange@redhat.com>
 <20210908103711.683940-5-berrange@redhat.com>
Date: Thu, 09 Sep 2021 11:05:20 +0200
In-Reply-To: <20210908103711.683940-5-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Wed, 8 Sep 2021 11:37:10
 +0100")
Message-ID: <87czpinmpb.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

> This is a counterpart to the HMP "info registers" command. It is being
> added with an "x-" prefix because this QMP command is intended as an
> adhoc debugging tool and will thus not be modelled in QAPI as fully
> structured data, nor will it have long term guaranteed stability.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  hw/core/machine-qmp-cmds.c | 28 ++++++++++++++++++++++++++++
>  qapi/machine.json          | 37 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 65 insertions(+)
>
> diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
> index 216fdfaf3a..0d9943ff60 100644
> --- a/hw/core/machine-qmp-cmds.c
> +++ b/hw/core/machine-qmp-cmds.c
> @@ -204,3 +204,31 @@ MemdevList *qmp_query_memdev(Error **errp)
>      object_child_foreach(obj, query_memdev, &list);
>      return list;
>  }
> +
> +RegisterInfo *qmp_x_query_registers(bool has_cpu, int64_t cpu, Error **e=
rrp)
> +{
> +    RegisterInfo *info =3D g_new0(RegisterInfo, 1);
> +    g_autoptr(GString) buf =3D g_string_new("");
> +    CPUState *cs =3D NULL, *tmp;
> +
> +    if (has_cpu) {
> +        CPU_FOREACH(tmp) {
> +            if (cpu =3D=3D tmp->cpu_index) {
> +                cs =3D tmp;
> +            }
> +        }
> +        if (!cs) {
> +            error_setg(errp, "CPU %"PRId64" not available", cpu);
> +            return NULL;
> +        }
> +        cpu_format_state(cs, buf, CPU_DUMP_FPU);
> +    } else {
> +        CPU_FOREACH(cs) {
> +            g_string_append_printf(buf, "\nCPU#%d\n", cs->cpu_index);
> +            cpu_format_state(cs, buf, CPU_DUMP_FPU);
> +        }
> +    }
> +
> +    info->state =3D g_steal_pointer(&buf->str);
> +    return info;
> +}
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 157712f006..27b922f2ce 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1312,3 +1312,40 @@
>       '*cores': 'int',
>       '*threads': 'int',
>       '*maxcpus': 'int' } }
> +
> +##
> +# @RegisterParams:
> +#
> +# Information about the CPU to query state of
> +#
> +# @cpu: the CPU number to query. If omitted, queries all CPUs
> +#
> +# Since: 6.2.0
> +#
> +##
> +{ 'struct': 'RegisterParams', 'data': {'*cpu': 'int' } }
> +
> +##
> +# @RegisterInfo:
> +#
> +# Information about the CPU state
> +#
> +# @state: the CPU state in an architecture specific format
> +#
> +# Since: 6.2.0
> +#
> +##
> +{ 'struct': 'RegisterInfo', 'data': {'state': 'str' } }
> +
> +##
> +# @x-query-registers:
> +#
> +# Return information on the CPU registers
> +#
> +# Returns: the CPU state
> +#
> +# Since: 6.2.0
> +##
> +{ 'command': 'x-query-registers',
> +  'data': 'RegisterParams',

Unless you have further uses of RegisterParams in mind, use an implicit
type:

     'data': { '*cpu': 'int' } }

> +  'returns': 'RegisterInfo' }

I'd like us to adopt a convention for commands returning formatted text
for human consumption.  Like so:

     'returns': 'HumanReadableText' }

with the obvious

   ##
   # @HumanReadableText:
   #
   # @human-readable-text: Formatted output intended for humans.
   #
   # Since: 6.2.0
   ##
   { 'struct': 'HumanReadableText',
     'data': { 'human-readable-text': 'str' } }

When the output needs explaining, do that in the command's doc string.
I figure

   ##
   # @x-query-registers:
   #
   # Returns information about the CPU state
   #
   # Returns: CPU state in an architecture-specific format
   #
   # Since: 6.2.0
   ##

would do in this case.


