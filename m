Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2BC457C67
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Nov 2021 08:59:42 +0100 (CET)
Received: from localhost ([::1]:44458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moLHh-00089q-El
	for lists+qemu-devel@lfdr.de; Sat, 20 Nov 2021 02:59:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1moLG7-0006Vl-9a
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 02:58:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1moLG3-00029E-PB
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 02:58:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637395078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a1Pz5cnwH0eRk+tC42Eh47BnVLX55QKu3Skci6YHIhM=;
 b=i0dOr/avf80WElL/GOT/4i9ZkcilCOGVhS2tYQa4vkt+AE+uVPBNG7QMGpKEv+p7iNmPaH
 mEWzZj66SLr7crA6D4dyo1WZeg3pTF/FEod++lJ6V7Yx9+HGdgtEl+BM7MBeGH3VcWF6Aw
 BXXQkpoWcMFTESB2EsRxDfkj7whQRSo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-353-gp3vu1XPNtG7kDK3jTA5Kw-1; Sat, 20 Nov 2021 02:57:57 -0500
X-MC-Unique: gp3vu1XPNtG7kDK3jTA5Kw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EAA0806689;
 Sat, 20 Nov 2021 07:57:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 12B2F10246E3;
 Sat, 20 Nov 2021 07:57:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6655211380A7; Sat, 20 Nov 2021 08:57:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v2 3/3] cpus-common: implement dirty limit on vCPU
References: <cover.1637256224.git.huangy81@chinatelecom.cn>
 <cover.1637258578.git.huangy81@chinatelecom.cn>
 <1d7b72b34a97fcd8ece586a4671abc0916fc67ee.1637258578.git.huangy81@chinatelecom.cn>
Date: Sat, 20 Nov 2021 08:57:36 +0100
In-Reply-To: <1d7b72b34a97fcd8ece586a4671abc0916fc67ee.1637258578.git.huangy81@chinatelecom.cn>
 (huangy's message of "Fri, 19 Nov 2021 02:17:03 +0800")
Message-ID: <87fsrrz2bz.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: David Hildenbrand <david@redhat.com>, Juan Quintela <quintela@redhat.com>,
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
>
> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>

[...]

> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index e948e81..dd65e9e 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -881,6 +881,13 @@ void end_exclusive(void);
>   */
>  void qemu_init_vcpu(CPUState *cpu);
> =20
> +/**
> + * dirtylimit_setup:
> + *
> + * dirtylimit setup.
> + */

This is even worse than no documentation.

> +void dirtylimit_setup(int max_cpus);
> +
>  #define SSTEP_ENABLE  0x1  /* Enable simulated HW single stepping */
>  #define SSTEP_NOIRQ   0x2  /* Do not use IRQ while single stepping */
>  #define SSTEP_NOTIMER 0x4  /* Do not Timers while single stepping */
> diff --git a/qapi/misc.json b/qapi/misc.json
> index 358548a..7f6da34 100644
> --- a/qapi/misc.json
> +++ b/qapi/misc.json
> @@ -527,3 +527,47 @@
>   'data': { '*option': 'str' },
>   'returns': ['CommandLineOptionInfo'],
>   'allow-preconfig': true }
> +
> +##
> +# @DirtyRateQuotaVcpu:
> +#
> +# Dirty rate of vcpu.
> +#
> +# @idx: vcpu index.
> +#
> +# @dirtyrate: dirty rate.
> +#
> +# Since: 6.3
> +#
> +##
> +{ 'struct': 'DirtyRateQuotaVcpu',
> +  'data': { 'idx': 'int', 'dirtyrate': 'uint64' } }
> +
> +##
> +# @set-dirty-limit:
> +#
> +# Since: 6.3
> +#
> +# Example:
> +#   {"execute": "set-dirty-limit"}
> +#    "arguments": { "idx": "cpu-index",
> +#                   "dirtyrate": "quota-dirtyrate" } }

The example cannot work: the arguments must be numbers, not strings.

> +#
> +##
> +{ 'command': 'set-dirty-limit',
> +  'data': 'DirtyRateQuotaVcpu' }

Why make DirtyRateQuotaVcpu a separate type?  Why not

   { 'command': 'set-dirty-limit',
     'data': { 'idx': 'int', 'dirtyrate': 'uint64' } }

> +
> +##
> +# @cancel-dirty-limit:
> +#
> +# @idx: index of vCPU to be canceled
> +#
> +# Since: 6.3
> +#
> +# Example:
> +#   {"execute": "cancel-dirty-limit"}
> +#    "arguments": { "idx": "cpu-index" } }
> +#
> +##
> +{ 'command': 'cancel-dirty-limit',
> +  'data': { 'idx': 'int' } }

Overall, documentation is too terse.  What is a "dirty rate of vcpu",
and why should I care?  Is it related to query-dirty-rate?

Nitpick: you use both "vcpu" and "vCPU" in comments.  Stick to the
latter, please.

[...]


