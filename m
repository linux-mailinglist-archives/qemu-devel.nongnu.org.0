Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CBE493A5C
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 13:35:57 +0100 (CET)
Received: from localhost ([::1]:36300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAABv-0006iU-UB
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 07:35:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nA9ua-0001ND-Ih
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 07:18:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nA9uV-0006E4-Sq
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 07:17:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642594650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ArDeiF5e2Ltp4mCqtgqGOz6l6pCVdsDIudrJG3Ngqc=;
 b=ACucp4Dvabt9g1oD0Sk9z5cJGYxMownKTGD5YlGQ8xfD145AwF+KWf1sQYx7Bx1a37iDv4
 M3fYTrdekwxmepkapWHGB7sN5vO60gb3E7jU3ZaI078NbwlJXj7vF/cAdFqLMNRIqSGiTc
 iyM8WAnd4GatPlIXXbLV4yAWNhee8xc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-J8oxPxwZMsmb8yKs522suQ-1; Wed, 19 Jan 2022 07:17:27 -0500
X-MC-Unique: J8oxPxwZMsmb8yKs522suQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B86A61083F60;
 Wed, 19 Jan 2022 12:17:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-16.ams2.redhat.com
 [10.36.112.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 90A6C752C5;
 Wed, 19 Jan 2022 12:16:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 40A2D1138606; Wed, 19 Jan 2022 13:16:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v11 4/4] softmmu/dirtylimit: implement dirty page rate
 limit
References: <cover.1641315745.git.huangy81@chinatelecom.cn>
 <cover.1641316375.git.huangy81@chinatelecom.cn>
 <3c7304f10b44919bb328a62c2fae988e2abf2a6a.1641316375.git.huangy81@chinatelecom.cn>
Date: Wed, 19 Jan 2022 13:16:52 +0100
In-Reply-To: <3c7304f10b44919bb328a62c2fae988e2abf2a6a.1641316375.git.huangy81@chinatelecom.cn>
 (huangy's message of "Wed, 5 Jan 2022 01:14:09 +0800")
Message-ID: <877dav3op7.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

huangy81@chinatelecom.cn writes:

> From: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
>
> Implement dirtyrate calculation periodically basing on
> dirty-ring and throttle virtual CPU until it reachs the quota
> dirty page rate given by user.
>
> Introduce qmp commands "set-vcpu-dirty-limit",
> "cancel-vcpu-dirty-limit", "query-vcpu-dirty-limit"
> to enable, disable, query dirty page limit for virtual CPU.
>
> Meanwhile, introduce corresponding hmp commands
> "set_vcpu_dirty_limit", "cancel_vcpu_dirty_limit",
> "info vcpu_dirty_limit" so the feature can be more usable.
>
> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>

[...]

> diff --git a/qapi/migration.json b/qapi/migration.json
> index ac5fa56..9d406f4 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1869,6 +1869,66 @@
>              'current-rate': 'int64' } }
> =20
>  ##
> +# @set-vcpu-dirty-limit:
> +#
> +# Set the upper limit of dirty page rate for virtual CPU.

"for virtual CPUs"

> +#
> +# Requires KVM with accelerator property "dirty-ring-size" set.
> +# A virtual CPU's dirty page rate is a measure of its memory load.
> +# To observe dirty page rates, use @calc-dirty-rate.
> +#
> +# @cpu-index: index of virtual CPU, default is all.
> +#
> +# @dirty-rate: upper limit of dirty page rate for virtual CPU.

Lacks a unit.  Is it bytes per second?  pages per second?

> +#
> +# Since: 7.0
> +#
> +# Example:
> +#   {"execute": "set-vcpu-dirty-limit"}
> +#    "arguments": { "dirty-rate": 200,
> +#                   "cpu-index": 1 } }
> +#
> +##
> +{ 'command': 'set-vcpu-dirty-limit',
> +  'data': { '*cpu-index': 'uint64',

Use 'int' for consistency with cpu-index arguments elsewhere.

> +            'dirty-rate': 'uint64' } }
> +
> +##
> +# @cancel-vcpu-dirty-limit:
> +#
> +# Cancel the upper limit of dirty page rate for virtual CPU.

"for virtual CPUs"

> +#
> +# Cancel the dirty page limit for the vCPU which has been set with
> +# set-vcpu-dirty-limit command. Note that this command requires
> +# support from dirty ring, same as the "set-vcpu-dirty-limit".
> +#
> +# @cpu-index: index of virtual CPU, default is all.
> +#
> +# Since: 7.0
> +#
> +# Example:
> +#   {"execute": "cancel-vcpu-dirty-limit"}
> +#    "arguments": { "cpu-index": 1 } }
> +#
> +##
> +{ 'command': 'cancel-vcpu-dirty-limit',
> +  'data': { '*cpu-index': 'uint64'} }

Use 'int' for consistency with cpu-index arguments elsewhere.

> +
> +##
> +# @query-vcpu-dirty-limit:
> +#
> +# Returns information about all virtual CPU dirty limit if enabled.

Suggest "about virtual CPU dirty page rate limits, if any".

> +#
> +# Since: 7.0
> +#
> +# Example:
> +#   {"execute": "query-vcpu-dirty-limit"}
> +#
> +##
> +{ 'command': 'query-vcpu-dirty-limit',
> +  'returns': [ 'DirtyLimitInfo' ] }
> +
> +##
>  # @snapshot-save:
>  #
>  # Save a VM snapshot

[...]


