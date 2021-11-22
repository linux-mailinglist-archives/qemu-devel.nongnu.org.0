Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD974589E7
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 08:38:26 +0100 (CET)
Received: from localhost ([::1]:46308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp3uD-0006BV-Hs
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 02:38:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mp3sf-0005T0-7g
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 02:36:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mp3sY-0005dy-Aj
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 02:36:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637566597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+TrbFa5sidGGAuXKEhOPwgifa9D04JYRTULDKKl3Bi8=;
 b=RAosNClC5S+Lr1hKeE8pz+IUWJTuDzK5PRKSzWc+LRaFQI84c5wF+WTaLFVWTsWL3Yu64S
 HKI+yhCIJ1yoH3Ka393oedpXuQdxAiQuacv0oyPs/tTpC4sBso/ZzyHCpINq24ARmi8gRv
 gd4CTnIVa/4OlXoqYaQZ86MDp0I8lBY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-162-5YK5C0CGMZiBA4-tMmllUQ-1; Mon, 22 Nov 2021 02:36:34 -0500
X-MC-Unique: 5YK5C0CGMZiBA4-tMmllUQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E38A81006AB0;
 Mon, 22 Nov 2021 07:36:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F5B11037F49;
 Mon, 22 Nov 2021 07:35:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7D9C011380A7; Mon, 22 Nov 2021 08:35:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v3 3/3] cpus-common: implement dirty limit on vCPU
References: <cover.1637403404.git.huangy81@chinatelecom.cn>
 <cover.1637403404.git.huangy81@chinatelecom.cn>
 <99ea5e76926164d60a4ee62d0a1831823bc0d7a9.1637403404.git.huangy81@chinatelecom.cn>
Date: Mon, 22 Nov 2021 08:35:46 +0100
In-Reply-To: <99ea5e76926164d60a4ee62d0a1831823bc0d7a9.1637403404.git.huangy81@chinatelecom.cn>
 (huangy's message of "Sat, 20 Nov 2021 18:36:40 +0800")
Message-ID: <87o86cprql.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
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
Cc: Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

huangy81@chinatelecom.cn writes:

> From: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
>
> implement dirtyrate calculation periodically basing on
> dirty-ring and throttle vCPU until it reachs the quota
> dirtyrate given by user.
>
> introduce qmp commands set-dirty-limit/cancel-dirty-limit to
> set/cancel dirty limit on vCPU.

Please start sentences with a capital letter.

>
> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>

[...]

> diff --git a/qapi/misc.json b/qapi/misc.json
> index 358548a..98e6001 100644
> --- a/qapi/misc.json
> +++ b/qapi/misc.json
> @@ -527,3 +527,42 @@
>   'data': { '*option': 'str' },
>   'returns': ['CommandLineOptionInfo'],
>   'allow-preconfig': true }
> +
> +##
> +# @set-dirty-limit:
> +#
> +# This command could be used to cap the vCPU memory load, which is also
> +# refered as dirtyrate. One should use "calc-dirty-rate" with "dirty-rin=
g"
> +# and to calculate vCPU dirtyrate and query it with "query-dirty-rate".
> +# Once getting the vCPU current dirtyrate, "set-dirty-limit" can be used
> +# to set the upper limit of dirtyrate for the interested vCPU.

"dirtyrate" is not a word.  Let's spell it "dirty page rate", for
consistency with the documentation in migration.json.

Regarding "One should use ...": sounds like you have to run
calc-dirty-rate with argument @mode set to @dirty-ring before this
command.  Correct?  What happens when you don't?  set-dirty-limit fails?

Do you also have to run query-dirty-rate before this command?

Speaking of migration.json: should these commands be defined there, next
to calc-dirty-rate and query-dirty-rate?

> +#
> +# @idx: vCPU index to set dirtylimit.
> +#
> +# @dirtyrate: upper limit of drityrate the specified vCPU could reach (M=
B/s)

Typo "drityrate".

Suggest "upper limit for the specified vCPU's dirty page rate (MB/s)".

> +#
> +# Since: 6.3
> +#
> +# Example:
> +#   {"execute": "set-dirty-limit"}
> +#    "arguments": { "idx": 0,
> +#                   "dirtyrate": 200 } }
> +#
> +##
> +{ 'command': 'set-dirty-limit',
> +  'data': { 'idx': 'int', 'dirtyrate': 'uint64' } }
> +
> +##
> +# @cancel-dirty-limit:
> +#
> +# @idx: vCPU index to canceled the dirtylimit
> +#
> +# Since: 6.3
> +#
> +# Example:
> +#   {"execute": "cancel-dirty-limit"}
> +#    "arguments": { "idx": 0 } }
> +#
> +##
> +{ 'command': 'cancel-dirty-limit',
> +  'data': { 'idx': 'int' } }
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 1159a64..170ee23 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -3776,5 +3776,6 @@ void qemu_init(int argc, char **argv, char **envp)
>      qemu_init_displays();
>      accel_setup_post(current_machine);
>      os_setup_post();
> +    dirtylimit_setup(current_machine->smp.max_cpus);
>      resume_mux_open();
>  }


