Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C845524A68
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 12:37:49 +0200 (CEST)
Received: from localhost ([::1]:42332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np6Ca-000751-CH
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 06:37:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1np610-0007Om-95
 for qemu-devel@nongnu.org; Thu, 12 May 2022 06:25:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1np60y-0000M1-Kb
 for qemu-devel@nongnu.org; Thu, 12 May 2022 06:25:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652351143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nr558Q43peKuT1VfUOREUrj61wLLJ366DfuHHNmkjrE=;
 b=d9C0iKOzs+gTTNRnwu/7ytjg1YaLcRHm3yup72QeS3fHohcUQf5lj1/Q6CzSOhTbp5+1oT
 0xAIAK3Ge72edxDJiu6xiYPhX1abJLprKo+pWmz4+QYEdLfadJHrrIoXwabT1D3a18tFGv
 m7w/Y1j5vqs8PaePXTABzkPtOGre7sM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-bVmhF-yZNTS8RCFvSR0kjA-1; Thu, 12 May 2022 06:25:40 -0400
X-MC-Unique: bVmhF-yZNTS8RCFvSR0kjA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 228F3185A7B2;
 Thu, 12 May 2022 10:25:40 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F06C400E122;
 Thu, 12 May 2022 10:25:39 +0000 (UTC)
Date: Thu, 12 May 2022 12:25:37 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
Subject: Re: [PATCH] iotests/testrunner: Flush after run_test()
Message-ID: <YnzgofFa1jHy5KCm@redhat.com>
References: <20220506134215.10086-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220506134215.10086-1-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

Am 06.05.2022 um 15:42 hat Hanna Reitz geschrieben:
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

Thanks, applied to the block branch.

Kevin


