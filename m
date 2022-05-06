Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 279E951DE2F
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 19:09:56 +0200 (CEST)
Received: from localhost ([::1]:47642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn1Sl-0008OD-9U
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 13:09:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nn1QP-0006zd-LS
 for qemu-devel@nongnu.org; Fri, 06 May 2022 13:07:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nn1QN-0003OY-Th
 for qemu-devel@nongnu.org; Fri, 06 May 2022 13:07:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651856847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gqs3GnbwMO7Nhe6s1Qpq1tySV+aT43DoVzsg1Gdk64s=;
 b=G6RAzc4ZkxXorPucNqZWqDLuR43Az8ihWxcQXhv6Ka5eKqRdAZCDtyVGQaNJTRSZyIDnRf
 W5yrDZgA0o3zZujLtMqZdJNafpZRc/6/Agid80vAt4m9P8iBYd/QsIZJgIDeXB+POCQ/eh
 bISpQcW79AUTpduTd1IlqjUjfY6fXvw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-22-I3GwFre5NmedrsRzbY1KoA-1; Fri, 06 May 2022 13:07:24 -0400
X-MC-Unique: I3GwFre5NmedrsRzbY1KoA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D39763802126;
 Fri,  6 May 2022 17:07:23 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B2254010E2F;
 Fri,  6 May 2022 17:07:23 +0000 (UTC)
Date: Fri, 6 May 2022 12:07:21 -0500
From: Eric Blake <eblake@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
Subject: Re: [PATCH] iotests/testrunner: Flush after run_test()
Message-ID: <20220506170721.nnr3ixgmlqiy36ht@redhat.com>
References: <20220506134215.10086-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220506134215.10086-1-hreitz@redhat.com>
User-Agent: NeoMutt/20220429-35-ca2e7f
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 06, 2022 at 03:42:15PM +0200, Hanna Reitz wrote:
> When stdout is not a terminal, the buffer may not be flushed at each end
> of line, so we should flush after each test is done.  This is especially
> apparent when run by check-block, in two ways:
> 
> First, when running make check-block -jX with X > 1, progress indication
> was missing, even though testrunner.py does theoretically print each
> test's status once it has been run, even in multi-processing mode.
> Flushing after each test restores this progress indication.
> 
> Second, sometimes make check-block failed altogether, with an error
> message that "too few tests [were] run".  I presume that's because one
> worker process in the job pool did not get to flush its stdout before
> the main process exited, and so meson did not get to see that worker's
> test results.  In any case, by flushing at the end of run_test(), the
> problem has disappeared for me.
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  tests/qemu-iotests/testrunner.py | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
> index aae70a8341..10d9e8ef27 100644
> --- a/tests/qemu-iotests/testrunner.py
> +++ b/tests/qemu-iotests/testrunner.py
> @@ -378,6 +378,7 @@ def run_test(self, test: str,
>              else:
>                  print(res.casenotrun)
>  
> +        sys.stdout.flush()
>          return res
>  
>      def run_tests(self, tests: List[str], jobs: int = 1) -> bool:
> -- 
> 2.35.1
> 
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


