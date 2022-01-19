Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85898493A3A
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 13:26:12 +0100 (CET)
Received: from localhost ([::1]:55688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAA2V-0008RH-Kp
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 07:26:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nA9ua-0001NB-I4
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 07:18:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nA9uV-0006Eh-EK
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 07:17:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642594664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=THvdfQIVsiaAP6VP7w930JAvCLv5OuCQmP6xSqbh8G0=;
 b=JjZ/wvqUD8wpgYvi+j3zh5q5FdIYDX5242tJoWtWFFfA3/c4371hUswqKphxUpaP8DP4Ql
 oUsTtRJa+fkP/HU4oUesuy4E31fpNMvkXk5qDQdr31xPqYBDBH7M98ZQmNnJtfzmXnHoU7
 +gCxaKK8BG8i2Ia7JuLKz/mG6yIQUS8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-5uxf3IHOP1WwaXtgJeGxzw-1; Wed, 19 Jan 2022 07:17:42 -0500
X-MC-Unique: 5uxf3IHOP1WwaXtgJeGxzw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FF8883DD22;
 Wed, 19 Jan 2022 12:17:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-16.ams2.redhat.com
 [10.36.112.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D06587B9E8;
 Wed, 19 Jan 2022 12:16:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C6D52113865F; Wed, 19 Jan 2022 13:16:38 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v11 3/4] softmmu/dirtylimit: implement virtual CPU throttle
References: <cover.1641315745.git.huangy81@chinatelecom.cn>
 <cover.1641316375.git.huangy81@chinatelecom.cn>
 <0381e32c2cc70613613aaa284b8e8c9760d6932f.1641316375.git.huangy81@chinatelecom.cn>
Date: Wed, 19 Jan 2022 13:16:38 +0100
In-Reply-To: <0381e32c2cc70613613aaa284b8e8c9760d6932f.1641316375.git.huangy81@chinatelecom.cn>
 (huangy's message of "Wed, 5 Jan 2022 01:14:08 +0800")
Message-ID: <878rvb3opl.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
> Setup a negative feedback system when vCPU thread
> handling KVM_EXIT_DIRTY_RING_FULL exit by introducing
> throttle_us_per_full field in struct CPUState. Sleep
> throttle_us_per_full microseconds to throttle vCPU
> if dirtylimit is enabled.
>
> Start a thread to track current dirty page rates and
> tune the throttle_us_per_full dynamically untill current
> dirty page rate reach the quota.
>
> Introduce the util function in the header for dirtylimit
> implementation.
>
> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>

[...]

> diff --git a/qapi/migration.json b/qapi/migration.json
> index bbfd48c..ac5fa56 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1850,6 +1850,25 @@
>  { 'command': 'query-dirty-rate', 'returns': 'DirtyRateInfo' }
> =20
>  ##
> +# @DirtyLimitInfo:
> +#
> +# Dirty page rate limit information of virtual CPU.
> +#
> +# @cpu-index: index of virtual CPU.
> +#
> +# @limit-rate: upper limit of dirty page rate for virtual CPU.

Lacks a unit.  Is it bytes per second?  pages per second?

If I understand your code correctly, zero means unlimited.  This is
undocumented.  Please document it.  Something like "0 means unlimited"
should do.

> +#
> +# @current-rate: current dirty page rate for virtual CPU.
> +#
> +# Since: 7.0
> +#
> +##
> +{ 'struct': 'DirtyLimitInfo',
> +  'data': { 'cpu-index': 'int',
> +            'limit-rate': 'int64',
> +            'current-rate': 'int64' } }

The next patch uses 'uint64' for set-vcpu-dirty-limit argument
dirty-rate.  Why signed here?

> +
> +##
>  # @snapshot-save:
>  #
>  # Save a VM snapshot

[...]


