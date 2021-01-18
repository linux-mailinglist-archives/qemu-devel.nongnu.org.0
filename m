Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D24212FA2E0
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 15:23:50 +0100 (CET)
Received: from localhost ([::1]:55774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1VRd-00020l-T9
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 09:23:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l1VQU-0001bl-UF
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 09:22:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l1VQT-0001nK-4C
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 09:22:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610979755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OWWdU440Z5R1KLanH4uWe0L6y2J/umLTYAn8X9SQdcs=;
 b=g0Bnx9R3VMmCvI5ZnnQ0RjodlQsQYYTAMuh/2RErroNZl+21oOliZiwUvRhG+1IWQ4ISj3
 sE6pvL8m3qeCz4cmTIurWqpH1ZOet+fsCrzoMH0GQ0LG9HWxV7AGIyavYbMLJPfLG+EEGK
 rhOsqtwJSm64cni5K4LSOyYIE8wpUYY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-vk9RS4J3MSKtQX8Qz22u1A-1; Mon, 18 Jan 2021 09:22:33 -0500
X-MC-Unique: vk9RS4J3MSKtQX8Qz22u1A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F50359;
 Mon, 18 Jan 2021 14:22:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-142.ams2.redhat.com
 [10.36.115.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C38C017511;
 Mon, 18 Jan 2021 14:22:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 48DA111386A7; Mon, 18 Jan 2021 15:22:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Zihao Chang <changzihao1@huawei.com>
Subject: Re: [PATCH v2 2/2] vnc: add qmp to support reload vnc tls certificates
References: <20210107143032.752-1-changzihao1@huawei.com>
 <20210107143032.752-3-changzihao1@huawei.com>
 <87turil3s2.fsf@dusky.pond.sub.org>
 <20210115134710.GH1692978@redhat.com>
 <64ce816e-017f-1613-9001-a8cd968a9ec9@huawei.com>
Date: Mon, 18 Jan 2021 15:22:25 +0100
In-Reply-To: <64ce816e-017f-1613-9001-a8cd968a9ec9@huawei.com> (Zihao Chang's
 message of "Mon, 18 Jan 2021 15:27:33 +0800")
Message-ID: <87wnwab9zy.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: oscar.zhangbo@huawei.com,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, xiexiangyou@huawei.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Zihao Chang <changzihao1@huawei.com> writes:

> On 2021/1/15 21:47, Daniel P. Berrang=C3=A9 wrote:
>> On Fri, Jan 15, 2021 at 02:37:33PM +0100, Markus Armbruster wrote:
>>> Zihao Chang <changzihao1@huawei.com> writes:
[...]
>>>> diff --git a/qapi/ui.json b/qapi/ui.json
>>>> index d08d72b439..855b1ac007 100644
>>>> --- a/qapi/ui.json
>>>> +++ b/qapi/ui.json
>>>> @@ -1179,3 +1179,21 @@
>>>>  ##
>>>>  { 'command': 'query-display-options',
>>>>    'returns': 'DisplayOptions' }
>>>> +
>>>> +##
>>>> +# @reload-vnc-cert:
>>>> +#
>>>> +# Reload certificates for vnc.
>>>> +#
>>>> +# Returns: nothing
>>>> +#
>>>> +# Since: 5.2
>>>
>>> 6.0 now.
>>>
>>>> +#
>>>> +# Example:
>>>> +#
>>>> +# -> { "execute": "reload-vnc-cert" }
>>>> +# <- { "return": {} }
>>>> +#
>>>> +##
>>>> +{ 'command': 'reload-vnc-cert',
>>>> +  'if': 'defined(CONFIG_VNC)' }
>>>
>>> Daniel's objection to another patch that adds a rather specialized QMP
>>> command may apply: "I'm not a fan of adding adhoc new commands for
>>> specific properties."
>>>
>>>     From: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>>>     Subject: Re: [PATCH] vnc: add qmp to support change authz
>>>     Message-ID: <20210107161830.GE1029501@redhat.com>
>>=20
>> Yeah, though this scenario is a ittle more complicated. Tihs patch is
>> not actually changing any object properties in the VNC server config.
>> It is simply telling the VNC server to reload the existing object it
>> has configured.
>>=20
>> My proposed  "display-update" command would not directly map to what
>> this "reload-vnc-cert" command does, unless we declared the certs are
>> always reloaded after every display-update command.
>>=20
>> Or we could have a more generic  "display-reload" command, which has
>> fields indicating what aspect to reload. eg a 'tls-certs: bool' field
>> to indicate reload of TLS certs in the display. This could be useful
>> if we wanted the ability to reload authz access control lists, though
>> we did actually wire them up to auto-reload using inotify.
>>=20
>>=20
>> Regards,
>> Daniel
>>=20
>
> If we add field for each reloadable attribute(tls-certs, authz,...),
> the number of parameters for qmp_display_reload() may increase sharply
> (bool has_tls_certs, bool tls_certs, ... twice the number of attributes).

'boxed': true can give you a reasonable C function even then.
docs/devel/qapi-code-gen.txt:

    When member 'boxed' is absent, [the function generated for the
    command] takes the command arguments as arguments one by one, in
    QAPI schema order.  Else it takes them wrapped in the C struct
    generated for the complex argument type.  It takes an additional
    Error ** argument in either case.

> How about using a list[] to determine which attributes need to be
> reloaded["tls_certs", "authz*"...], and define an enum to ensure the
> validity of list elements.

Representing a set of named things as a "list of enum of thing names" is
workable.

It's a fairly rigid design, though.  When you start with "struct of bool
members", you can add members of other types, and the whole still looks
regular.  You can even evolve an existing bool into an alternate of bool
and something else.

What kind of evolution do you want to prepare for?  Two foolish answers
to avoid: "any and all, regardless of cost" (you should not brush off
cost like that, ever), and "none, because I can predict the future
confidently" (no, you can't).


