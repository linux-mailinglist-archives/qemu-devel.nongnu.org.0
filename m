Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC7A49DC43
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 09:11:06 +0100 (CET)
Received: from localhost ([::1]:46086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCzry-0001qS-Vl
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 03:11:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nCycf-0001CY-06
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 01:51:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nCycX-0008Je-6e
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 01:51:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643266246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EW3NkihSlGsmncrPe1Kx1YDsgqLQL1SF2BpFSV5snDM=;
 b=eK/snkhG4BX3nS2jx0G8jQFE+jXgitGkAD1s8a3iKeacjSA/e3Jcy2K5yBEopqtVkQ6nDN
 S3MToNgvDYipnoaRY80saBB3W3Zc1WFMmxYrN6Jj0IwxKwPm4JqvarSIFuQzlrzBl5CrgX
 ANbCRRfLSRKFcHU8O62aJ0uQ95P3zl8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-8yEYoHNWOnGncmXvtWCUVQ-1; Thu, 27 Jan 2022 01:50:41 -0500
X-MC-Unique: 8yEYoHNWOnGncmXvtWCUVQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23868343C9;
 Thu, 27 Jan 2022 06:50:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 209D555F74;
 Thu, 27 Jan 2022 06:50:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A4B6B113864A; Thu, 27 Jan 2022 07:50:12 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v6 6/7] meson: document, why we don't generate trace
 events for tests/ and qga/
References: <20220126161130.3240892-1-vsementsov@virtuozzo.com>
 <20220126161130.3240892-7-vsementsov@virtuozzo.com>
Date: Thu, 27 Jan 2022 07:50:12 +0100
In-Reply-To: <20220126161130.3240892-7-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Wed, 26 Jan 2022 17:11:29 +0100")
Message-ID: <878rv1wu3f.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
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
Cc: kwolf@redhat.com, michael.roth@amd.com, qemu-devel@nongnu.org,
 hreitz@redhat.com, stefanha@redhat.com, pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> Making trace generation work for tests/ and qga/ would involve some
> Meson hackery to ensure we generate the trace-events files before
> trace-tool uses them. Since we don't actually support tracing there
> anyway, we bypass that problem.
>
> Let's add corresponding comments.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  qga/meson.build   | 7 +++++++
>  tests/meson.build | 7 +++++++
>  2 files changed, 14 insertions(+)
>
> diff --git a/qga/meson.build b/qga/meson.build
> index cfb1fbc085..724d5a667b 100644
> --- a/qga/meson.build
> +++ b/qga/meson.build
> @@ -15,6 +15,13 @@ qga_qapi_outputs = [
>    'qga-qapi-visit.h',
>  ]
>  
> +# Problem: to generate trace events, we'd have to add the .trace-events
> +# file to qapi_trace_events like we do in qapi/meson.build.  Since
> +# qapi_trace_events is used by trace/meson.build, we'd have to move
> +# subdir('qga') above subdir('trace') in the top-level meson.build.
> +# Can't, because it would break the dependency of qga on qemuutil (which
> +# depends on trace_ss).  Not worth solving now; simply suppress trace
> +# event generation instead.
>  qga_qapi_files = custom_target('QGA QAPI files',
>                                 output: qga_qapi_outputs,
>                                 input: 'qapi-schema.json',
> diff --git a/tests/meson.build b/tests/meson.build
> index 3f3882748a..af8f5b1746 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -31,6 +31,13 @@ test_qapi_outputs = [
>    'test-qapi-visit.h',
>  ]
>  
> +# Problem: to generate trace events, we'd have to add the .trace-events
> +# file to qapi_trace_events like we do in qapi/meson.build.  Since
> +# qapi_trace_events is used by trace/meson.build, we'd have to move
> +# subdir('qga') above subdir('trace') in the top-level meson.build.

Shouldn't this be subdir('tests')?

> +# Can't, because it would break the dependency of qga on qemuutil (which
> +# depends on trace_ss).  Not worth solving now; simply suppress trace
> +# event generation instead.
>  test_qapi_files = custom_target('Test QAPI files',
>                                  output: test_qapi_outputs,
>                                  input: files('qapi-schema/qapi-schema-test.json',


