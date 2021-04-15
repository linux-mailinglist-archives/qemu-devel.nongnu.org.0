Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC26360E03
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 17:09:39 +0200 (CEST)
Received: from localhost ([::1]:57124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX3cg-0007Ns-DH
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 11:09:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lX3aK-0006JM-4t
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 11:07:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lX3aE-0001D3-Dx
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 11:07:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618499225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fa2zGhccdCX+ORQH4lUlL0KRtSq0VqAHYD2oDtfjA1M=;
 b=i2tF0zIemMUOoSt1veczioYMUMXG8Y+zjN0tpySDtk0NX3vOGq4H059GmUbqsQhtLbUnau
 O2n6ivpoQvJac6FdlTRjuB0Ls40paTGv0gmHppre0xSne7+pX6CF0WeZn1LyGbSIcSDiKj
 cJzYIlieTEX5GNdJqNMZTbTSgxCE53Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-1yyx9O4XNIGb7umLGydnLw-1; Thu, 15 Apr 2021 11:07:04 -0400
X-MC-Unique: 1yyx9O4XNIGb7umLGydnLw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 789111083E93;
 Thu, 15 Apr 2021 15:07:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0316A10023B0;
 Thu, 15 Apr 2021 15:06:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7F395113525D; Thu, 15 Apr 2021 17:06:57 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 1/6] accel: Introduce 'query-accels' QMP command
References: <20210415122633.4054644-1-philmd@redhat.com>
 <20210415122633.4054644-2-philmd@redhat.com>
Date: Thu, 15 Apr 2021 17:06:57 +0200
In-Reply-To: <20210415122633.4054644-2-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 15 Apr 2021 14:26:28
 +0200")
Message-ID: <87im4nbn8u.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 "Daniel P . =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Introduce the 'query-accels' QMP command which returns a list
> of built-in accelerator names.
>
> - Accelerator is a QAPI enum of all existing accelerators,
>
> - AcceleratorInfo is a QAPI structure providing accelerator
>   specific information. Currently the common structure base
>   provides the name of the accelerator, while the specific
>   part is empty, but each accelerator can expand it.
>
> - 'query-accels' QMP command returns a list of @AcceleratorInfo
>
> For example on a KVM-only build we get:
>
>     { "execute": "query-accels" }
>     {
>         "return": [
>             {
>                 "name": "qtest"
>             },
>             {
>                 "name": "kvm"
>             }
>         ]
>     }
>
> Note that we can't make the enum values or union branches conditional
> because of target-specific poisoning of accelerator definitions.
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Since v2: @since 6.0 -> 6.1, added note (Eric)
> Since v1: 'type' -> 'name' in comments
> ---
>  qapi/machine.json | 49 +++++++++++++++++++++++++++++++++++++++++++++++
>  accel/accel-qmp.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++
>  accel/meson.build |  2 +-
>  3 files changed, 99 insertions(+), 1 deletion(-)
>  create mode 100644 accel/accel-qmp.c
>
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 6e90d463fc9..4babc06f8b0 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1274,3 +1274,52 @@
>  ##
>  { 'event': 'MEM_UNPLUG_ERROR',
>    'data': { 'device': 'str', 'msg': 'str' } }
> +
> +##
> +# @Accelerator:
> +#
> +# An enumeration of accelerator names.
> +#
> +# Since: 6.1
> +##
> +{ 'enum': 'Accelerator',
> +  'data': [ 'qtest', 'tcg', 'kvm', 'hax', 'hvf', 'whpx', 'xen' ] }
> +
> +##
> +# @AcceleratorInfo:
> +#
> +# Accelerator information.
> +#
> +# @name: The accelerator name.
> +#
> +# Since: 6.1
> +##
> +{ 'union': 'AcceleratorInfo',
> +  'base': {'name': 'Accelerator'},
> +  'discriminator': 'name',
> +  'data': { } }

Not wrong, but feels overengineered unless you have concrete plans to
add variant members in the near future.  Simpler:

   { 'struct': 'AcceleratorInfo',
     'data': { 'name': 'Accelerator' } }

Changing this to flat union when we actually need it won't break
compatibility.

> +
> +##
> +# @query-accels:
> +#
> +# Get a list of AcceleratorInfo for all built-in accelerators.
> +#
> +# Returns: a list of @AcceleratorInfo describing each accelerator.
> +#
> +# Since: 6.1
> +#
> +# Example:
> +#
> +# -> { "execute": "query-accels" }
> +# <- { "return": [
> +#        {
> +#            "name": "qtest"
> +#        },
> +#        {
> +#            "name": "kvm"
> +#        }
> +#    ] }
> +#
> +##
> +{ 'command': 'query-accels',
> +  'returns': ['AcceleratorInfo'] }
[...]


