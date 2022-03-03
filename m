Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C284CBD5E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 13:11:42 +0100 (CET)
Received: from localhost ([::1]:33250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPkJ1-0003E7-5J
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 07:11:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nPkAp-000729-Ry
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 07:03:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nPkAl-00047M-FK
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 07:03:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646308986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U+bKdhtQbOgdGCxjQOeRsULcsvMH8WPaqHX0ODXpKHI=;
 b=L+dFpE2bPoMQ7Y6bU7weTfURzmZor5/lbqayENi7w7LLcCBZhfs2B/hQougL30+s5NQaow
 mnVAYVw1mYIRNMdxW4ZExMETPyt1+nG2p26iYODGbpX8RJJmMkbsTBE3rhn8L25UWuchsZ
 8HedGei9j5q8kylGNQLr/jrwAC+bLR4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-aRTFiSw9MS66D1kVl0KrZQ-1; Thu, 03 Mar 2022 07:03:03 -0500
X-MC-Unique: aRTFiSw9MS66D1kVl0KrZQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44CEA180FD71;
 Thu,  3 Mar 2022 12:03:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 345677C1EE;
 Thu,  3 Mar 2022 12:02:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CA98C21E6A00; Thu,  3 Mar 2022 13:02:33 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v18 7/7] softmmu/dirtylimit: Implement dirty page rate
 limit
References: <cover.1646247968.git.huangy81@chinatelecom.cn>
 <cover.1646247968.git.huangy81@chinatelecom.cn>
 <0c8849e11cc2d2ec549c926af5977cbd9f460b60.1646247968.git.huangy81@chinatelecom.cn>
Date: Thu, 03 Mar 2022 13:02:33 +0100
In-Reply-To: <0c8849e11cc2d2ec549c926af5977cbd9f460b60.1646247968.git.huangy81@chinatelecom.cn>
 (huangy's message of "Thu, 3 Mar 2022 03:20:25 +0800")
Message-ID: <874k4fckh2.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> "query-vcpu-dirty-limit" success depends on enabling dirty
> page rate limit, so just add it to the list of skipped
> command to ensure qmp-cmd-test run successfully.
>
> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
> Acked-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> ---
>  hmp-commands-info.hx       |  13 +++
>  hmp-commands.hx            |  32 ++++++++
>  include/monitor/hmp.h      |   3 +
>  qapi/migration.json        |  80 +++++++++++++++++++
>  softmmu/dirtylimit.c       | 195 +++++++++++++++++++++++++++++++++++++++=
++++++
>  tests/qtest/qmp-cmd-test.c |   2 +
>  6 files changed, 325 insertions(+)

[...]

> diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
> index 7f103ea..4b216a0 100644
> --- a/tests/qtest/qmp-cmd-test.c
> +++ b/tests/qtest/qmp-cmd-test.c
> @@ -110,6 +110,8 @@ static bool query_is_ignored(const char *cmd)
>          "query-sev-capabilities",
>          "query-sgx",
>          "query-sgx-capabilities",
> +        /* Success depends on enabling dirty page rate limit */
> +        "query-vcpu-dirty-limit",
>          NULL
>      };
>      int i;

The new command lacks test coverage.  Have you considered writing a
test?


