Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 013C1467780
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 13:37:17 +0100 (CET)
Received: from localhost ([::1]:51646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt7oS-0004kJ-1Z
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 07:37:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mt7mK-0003Ay-SF
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 07:35:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mt7mG-0000Ch-AL
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 07:35:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638534898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2YnG0tCV3Sy9q7slXJUjw2jR0UevQvm2KsVZVD2GlJM=;
 b=OD4WGMSyPzChTjmEOBRg9/R9ZzMyG2aVWvyIvzIEn1ly0waTYYUHQCk/msz8ejxFe0zL2y
 2m6T2N33eKpnMnn7rVQm2JEXdM8u3WxypAPre/zDrk2FW62UyssIBBi3dDv6RGRHoybJON
 wJyEIwkkAdyOzxbqslCQp5nGTgmjZzk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-74-2SrelLeLN2qQAY87p6uFfA-1; Fri, 03 Dec 2021 07:34:55 -0500
X-MC-Unique: 2SrelLeLN2qQAY87p6uFfA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6C5D84BA42;
 Fri,  3 Dec 2021 12:34:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B9354EDC1;
 Fri,  3 Dec 2021 12:34:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 28BC7113865F; Fri,  3 Dec 2021 13:34:12 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v9 3/3] cpus-common: implement dirty page limit on vCPU
References: <cover.1638495274.git.huangy81@chinatelecom.cn>
 <cover.1638495274.git.huangy81@chinatelecom.cn>
 <9cc3cc5377e4330cbe0e87e89f452889516a4c09.1638495274.git.huangy81@chinatelecom.cn>
Date: Fri, 03 Dec 2021 13:34:12 +0100
In-Reply-To: <9cc3cc5377e4330cbe0e87e89f452889516a4c09.1638495274.git.huangy81@chinatelecom.cn>
 (huangy's message of "Fri, 3 Dec 2021 09:39:47 +0800")
Message-ID: <87tufpyiij.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: David Hildenbrand <david@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

huangy81@chinatelecom.cn writes:

> From: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
>
> Implement dirtyrate calculation periodically basing on
> dirty-ring and throttle vCPU until it reachs the quota
> dirty page rate given by user.
>
> Introduce qmp commands "vcpu-dirty-limit", "query-vcpu-dirty-limit"
> to enable, disable, query dirty page limit for virtual CPU.
>
> Meanwhile, introduce corresponding hmp commands "vcpu_dirty_limit",
> "info vcpu_dirty_limit" so developers can play with them easier.
>
> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>

[...]

I see you replaced the interface.  Back to square one...

> diff --git a/qapi/migration.json b/qapi/migration.json
> index 3da8fdf..dc15b3f 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1872,6 +1872,54 @@
>              'current-rate': 'int64' } }
> =20
>  ##
> +# @vcpu-dirty-limit:
> +#
> +# Set or cancel the upper limit of dirty page rate for a virtual CPU.
> +#
> +# Requires KVM with accelerator property "dirty-ring-size" set.
> +# A virtual CPU's dirty page rate is a measure of its memory load.
> +# To observe dirty page rates, use @calc-dirty-rate.
> +#
> +# @cpu-index: index of virtual CPU.
> +#
> +# @enable: true to enable, false to disable.
> +#
> +# @dirty-rate: upper limit of dirty page rate for virtual CPU.
> +#
> +# Since: 7.0
> +#
> +# Example:
> +#   {"execute": "vcpu-dirty-limit"}
> +#    "arguments": { "cpu-index": 0,
> +#                   "enable": true,
> +#                   "dirty-rate": 200 } }
> +#
> +##
> +{ 'command': 'vcpu-dirty-limit',
> +  'data': { 'cpu-index': 'int',
> +            'enable': 'bool',
> +            'dirty-rate': 'uint64'} }

When @enable is false, @dirty-rate makes no sense and is not used (I
checked the code), but users have to specify it anyway.  That's bad
design.

Better: drop @enable, make @dirty-rate optional, present means enable,
absent means disable.

> +
> +##
> +# @query-vcpu-dirty-limit:
> +#
> +# Returns information about the virtual CPU dirty limit status.
> +#
> +# @cpu-index: index of the virtual CPU to query, if not specified, all
> +#             virtual CPUs will be queried.
> +#
> +# Since: 7.0
> +#
> +# Example:
> +#   {"execute": "query-vcpu-dirty-limit"}
> +#    "arguments": { "cpu-index": 0 } }
> +#
> +##
> +{ 'command': 'query-vcpu-dirty-limit',
> +  'data': { '*cpu-index': 'int' },
> +  'returns': [ 'DirtyLimitInfo' ] }

Why would anyone ever want to specify @cpu-index?  Output isn't that
large even if you have a few hundred CPUs.

Let's keep things simple and drop the parameter.

> +
> +##
>  # @snapshot-save:
>  #
>  # Save a VM snapshot
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 620a1f1..0f83ce3 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -3777,5 +3777,6 @@ void qemu_init(int argc, char **argv, char **envp)
>      qemu_init_displays();
>      accel_setup_post(current_machine);
>      os_setup_post();
> +    dirtylimit_setup(current_machine->smp.max_cpus);
>      resume_mux_open();
>  }


