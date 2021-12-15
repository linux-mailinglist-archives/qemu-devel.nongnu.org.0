Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D236E475419
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 09:09:25 +0100 (CET)
Received: from localhost ([::1]:41766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxPLo-0006sX-W0
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 03:09:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mxOql-0005Ro-Im
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 02:37:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mxOqj-0004mj-Oa
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 02:37:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639553837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W+YrWoixC0U6SPK2o2ZDWnIMLiXYYyabKFVC9xHK8qY=;
 b=SJwvkkcSy0h/hbQAAQV5t5RUW5JjWJJlKu3IiMJwDyrltLjdlLYpq7t4a3OmwyX+5kfI3p
 sZbXZVBcshIjV8/5s3u6lATNyZhwdgd0ftQd9Vxoips2GMbPEDhJAfWhlnuKBVSG1KA7RX
 4aqhW4RvzNyeV6xT2SR3+8HAoieEeu8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-ZOqh2V7zOUGkaUEsw-CAUA-1; Wed, 15 Dec 2021 02:37:14 -0500
X-MC-Unique: ZOqh2V7zOUGkaUEsw-CAUA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00C97185303C;
 Wed, 15 Dec 2021 07:37:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-2.ams2.redhat.com [10.36.112.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C97DF798D2;
 Wed, 15 Dec 2021 07:37:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1879A113865F; Wed, 15 Dec 2021 08:37:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v10 3/3] cpus-common: implement dirty page limit on
 virtual CPU
References: <cover.1639479557.git.huangy81@chinatelecom.cn>
 <cover.1639479557.git.huangy81@chinatelecom.cn>
 <d54bfe75d5d64e64a21bda977d40f62579cd0222.1639479557.git.huangy81@chinatelecom.cn>
Date: Wed, 15 Dec 2021 08:37:03 +0100
In-Reply-To: <d54bfe75d5d64e64a21bda977d40f62579cd0222.1639479557.git.huangy81@chinatelecom.cn>
 (huangy's message of "Tue, 14 Dec 2021 19:07:34 +0800")
Message-ID: <874k7anwtc.fsf@dusky.pond.sub.org>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
> Introduce qmp commands "vcpu-dirty-limit", "query-vcpu-dirty-limit"
> to enable, disable, query dirty page limit for virtual CPU.
>
> Meanwhile, introduce corresponding hmp commands "vcpu_dirty_limit",
> "info vcpu_dirty_limit" so developers can play with them easier.
>
> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>

[...]

> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
> index 96d0148..04879a2 100644
> --- a/include/monitor/hmp.h
> +++ b/include/monitor/hmp.h
> @@ -131,6 +131,8 @@ void hmp_replay_delete_break(Monitor *mon, const QDic=
t *qdict);
>  void hmp_replay_seek(Monitor *mon, const QDict *qdict);
>  void hmp_info_dirty_rate(Monitor *mon, const QDict *qdict);
>  void hmp_calc_dirty_rate(Monitor *mon, const QDict *qdict);
> +void hmp_info_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
> +void hmp_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
>  void hmp_human_readable_text_helper(Monitor *mon,
>                                      HumanReadableText *(*qmp_handler)(Er=
ror **));
> =20
> diff --git a/qapi/migration.json b/qapi/migration.json
> index ac5fa56..7d8da4f 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1869,6 +1869,50 @@
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
> +# @enable: true to enable, false to disable.
> +#
> +# @cpu-index: index of virtual CPU, default is all.

Suggest

    # @cpu-index: The vCPU to act upon (all by default).

(I'm stealing this from trace.json)

> +#
> +# @dirty-rate: upper limit of dirty page rate for virtual CPU, to
> +#              cancel dirty limit, this field will be ignored.
> +#
> +# Since: 7.0
> +#
> +# Example:
> +#   {"execute": "vcpu-dirty-limit"}
> +#    "arguments": { "enable": true,
> +#                   "cpu-index": 1,
> +#                   "dirty-rate": 200 } }
> +#
> +##
> +{ 'command': 'vcpu-dirty-limit',
> +  'data': { 'enable': 'bool',
> +            '*cpu-index': 'uint64',
> +            '*dirty-rate': 'uint64'} }

Drop @enable, please.

If @dirty-rate is present, set the limit to its value.

If it's absent, cancel the limit.

> +
> +##
> +# @query-vcpu-dirty-limit:
> +#
> +# Returns information about all virtual CPU dirty limit if enabled.
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


