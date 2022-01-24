Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E194498309
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 16:07:23 +0100 (CET)
Received: from localhost ([::1]:33838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC0wE-000424-8C
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 10:07:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nC0sX-0002sk-Tf
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 10:03:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nC0sT-0004Db-Nj
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 10:03:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643036609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SMqlopk4T7Kx75g1135rP6okEKDw3emN1ncNwHvgQ6w=;
 b=Z13Rt89kmeSMGdJQjtERJQ3QItXa+pTLbRFBpN3kTfUYObFQf0TfKjCQDAJZudNQ3MzZmy
 pAu+BS0eFyg3tzEZ1QXXZgN8G90fn78bps92fOAEJY4fOGerWIW7BkFq/hIYbstcKPgePT
 vTRN4Il/wXQZIMd5prh40DUqQkpGTsI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313-KQ266VfAOWq8FnvHSMUN7A-1; Mon, 24 Jan 2022 10:03:23 -0500
X-MC-Unique: KQ266VfAOWq8FnvHSMUN7A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EA491934102;
 Mon, 24 Jan 2022 15:03:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-3.ams2.redhat.com [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DBA93109003E;
 Mon, 24 Jan 2022 15:03:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6BF281138640; Mon, 24 Jan 2022 16:03:08 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v12 5/5] softmmu/dirtylimit: implement dirty page rate
 limit
References: <cover.1642774952.git.huangy81@chinatelecom.cn>
 <cover.1643026714.git.huangy81@chinatelecom.cn>
 <43fd2c5da10abfc73ad1474f6180225d129a3c2b.1643026714.git.huangy81@chinatelecom.cn>
Date: Mon, 24 Jan 2022 16:03:08 +0100
In-Reply-To: <43fd2c5da10abfc73ad1474f6180225d129a3c2b.1643026714.git.huangy81@chinatelecom.cn>
 (huangy's message of "Mon, 24 Jan 2022 22:10:40 +0800")
Message-ID: <87h79t6us3.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
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

> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
> index 96d0148..478820e 100644
> --- a/include/monitor/hmp.h
> +++ b/include/monitor/hmp.h
> @@ -131,6 +131,9 @@ void hmp_replay_delete_break(Monitor *mon, const QDic=
t *qdict);
>  void hmp_replay_seek(Monitor *mon, const QDict *qdict);
>  void hmp_info_dirty_rate(Monitor *mon, const QDict *qdict);
>  void hmp_calc_dirty_rate(Monitor *mon, const QDict *qdict);
> +void hmp_set_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
> +void hmp_cancel_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
> +void hmp_info_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
>  void hmp_human_readable_text_helper(Monitor *mon,
>                                      HumanReadableText *(*qmp_handler)(Er=
ror **));
> =20
> diff --git a/qapi/migration.json b/qapi/migration.json
> index bbfd48c..3855d6d 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1850,6 +1850,86 @@
>  { 'command': 'query-dirty-rate', 'returns': 'DirtyRateInfo' }
> =20
>  ##
> +# @DirtyLimitInfo:
> +#
> +# Dirty page rate limit information of virtual CPU.

"of a virtual CPU"

> +#
> +# @cpu-index: index of virtual CPU.
> +#
> +# @limit-rate: upper limit of dirty page rate in units of MB/s for virtu=
al
> +#              CPU, 0 means unlimited.

Could abridge "in units of MB/s" to "(MB/s)".  Same below.

> +#
> +# @current-rate: current dirty page rate in units of MB/s for virtual CP=
U.
> +#
> +# Since: 7.0
> +#
> +##
> +{ 'struct': 'DirtyLimitInfo',
> +  'data': { 'cpu-index': 'int',
> +            'limit-rate': 'uint64',
> +            'current-rate': 'uint64' } }
> +
> +##
> +# @set-vcpu-dirty-limit:
> +#
> +# Set the upper limit of dirty page rate for virtual CPUs.
> +#
> +# Requires KVM with accelerator property "dirty-ring-size" set.
> +# A virtual CPU's dirty page rate is a measure of its memory load.
> +# To observe dirty page rates, use @calc-dirty-rate.
> +#
> +# @cpu-index: index of virtual CPU, default is all.
> +#
> +# @dirty-rate: upper limit of dirty page rate in units of MB/s for virtu=
al CPU.

Long line, please wrap.

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
> +# Cancel the upper limit of dirty page rate for virtual CPUs.
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

Likewise.

> +
> +##
> +# @query-vcpu-dirty-limit:
> +#
> +# Returns information about virtual CPU dirty page rate limits, if any.
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


