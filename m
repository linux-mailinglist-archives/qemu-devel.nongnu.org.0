Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4E358C84F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 14:26:02 +0200 (CEST)
Received: from localhost ([::1]:35816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL1pZ-0007At-Fz
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 08:26:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oL1eN-0003q9-Ax
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 08:14:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oL1eH-0002XG-0s
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 08:14:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659960859;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=GdWCqlZKEzTw7V8cV2U4SyoU12PJHQtRFgu/IJn/JPo=;
 b=WlWs3Ra81vqDTcDqf1TTwjZvlJ36O8ScXCUb/wiU1PKbZ2QSKDCaNESadBTiKHkVXGwSov
 +qYtTd25gKGqdFarB79J82WjbVA7bqjEo9J8ZA47jpSBHUE2QT123CKTqefMm6jHO1ctGb
 41DDuq7z3b6pHj9aCDpdzfEFKJSs5bw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-kdTTjVgPNXO7UeClQfUHgg-1; Mon, 08 Aug 2022 08:14:18 -0400
X-MC-Unique: kdTTjVgPNXO7UeClQfUHgg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB3603C11E64;
 Mon,  8 Aug 2022 12:14:17 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.229])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5094F1121314;
 Mon,  8 Aug 2022 12:14:16 +0000 (UTC)
Date: Mon, 8 Aug 2022 13:14:13 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: Migration tests are very slow in the CI
Message-ID: <YvD+FXVf//5xvlgy@redhat.com>
References: <7bf333f0-7bdc-1ba7-2a45-ffa2894ad809@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7bf333f0-7bdc-1ba7-2a45-ffa2894ad809@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 08, 2022 at 01:57:17PM +0200, Thomas Huth wrote:
> 
>  Hi!
> 
> Seems like we're getting more timeouts in the CI pipelines since commit
> 2649a72555e ("Allow test to run without uffd") enabled the migration tests
> in more scenarios.
> 
> For example:
> 
>  https://gitlab.com/qemu-project/qemu/-/jobs/2821578332#L49
> 
> You can see that the migration-test ran for more than 20 minutes for each
> target (x86 and aarch64)! I think that's way too much by default.

Definitely too much.

> I had a check whether there is one subtest taking a lot of time, but it
> rather seems like each of the migration test is taking 40 to 50 seconds in
> the CI:
> 
>  https://gitlab.com/thuth/qemu/-/jobs/2825365836#L44

Normally with CI we expect a constant slowdown factor, eg x2.

I expect with migration though, we're triggering behaviour whereby
the guest workload is generating dirty pages quicker than we can
migrate them over localhost. The balance in this can quickly tip
to create an exponential slowdown.

> Given the fact that we're running more than 30 migration tests, this quickly
> sums up to 20 minutes and more.
> 
> Could we maybe focus on running only the most important migration tests in
> quick mode, and only run the full suite under an "if (g_test_slow())"
> statement?

THe GitLab shared runners in particular i think are going to impact the
migration tests, given that the runners are overcommitted, pre-emptiable
instances.

If we want reliability we may need to restrict it to just do migration
qtests on the private runners, since we have predictable compute
resource available on those.

I'm not sure if  'g_test_slow' gives us enough granularity though, as
if we enable that, it'll impact the whole test suite, not just
migration tests.

Not sure of the best answer here for how to toggle it.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


