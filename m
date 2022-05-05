Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B470B51BFCF
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 14:51:00 +0200 (CEST)
Received: from localhost ([::1]:52118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmawc-0000UK-Fp
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 08:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nmaqI-0002TN-2B
 for qemu-devel@nongnu.org; Thu, 05 May 2022 08:44:26 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:52440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nmaqE-0007VF-Tx
 for qemu-devel@nongnu.org; Thu, 05 May 2022 08:44:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651754662;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QWGp1z5t2nfeRqN+AYDz/lPso5S78dRv4j72+Shj1QA=;
 b=PCPXAhOqyaSbJV5ZgY7c1quV4e1P9074fYi2imknPqCl1Zs7dFvNHFa67V8WcRofltgsDw
 EyAmiyetmVPuDged44lax5koEjMdBwfi32H6ZX760IB+rscFtdt1XBzlqKpV5cKHmE6Co2
 lsrMqWQdBBcPYbOQU63ZfO9tjkDDIro=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-RTQfabypPaOgr2HOBGUwZQ-1; Thu, 05 May 2022 08:44:20 -0400
X-MC-Unique: RTQfabypPaOgr2HOBGUwZQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E248E8002B2;
 Thu,  5 May 2022 12:44:19 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B5CF40CF8F5;
 Thu,  5 May 2022 12:44:18 +0000 (UTC)
Date: Thu, 5 May 2022 13:44:16 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: longpeng2@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?utf-8?B?THVrw6HFoQ==?= Doktor <ldoktor@redhat.com>
Subject: Re: Fio regression caused by f9fc8932b11f3bcf2a2626f567cb6fdd36a33a94
Message-ID: <YnPGoOlV0CykrKwm@redhat.com>
References: <35dd4da8-5278-767e-4193-ccf53e836969@redhat.com>
 <YnOiRPrLkfjoPbU+@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YnOiRPrLkfjoPbU+@stefanha-x1.localdomain>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.74; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 05, 2022 at 11:09:08AM +0100, Stefan Hajnoczi wrote:
> On Tue, May 03, 2022 at 09:43:15AM +0200, Lukáš Doktor wrote:
> > Hello Mike, Paolo, others,
> > 
> > in my perf pipeline I noticed a regression bisected to the f9fc8932b11f3bcf2a2626f567cb6fdd36a33a94 - "thread-posix: remove the posix semaphore support" commit and I'd like to ask you to verify it might have caused that and eventually consider fixing it. The regression is visible, reproducible and clearly bisectable to this commit with the following 2 scenarios:
> 
> I can't parse the commit message for
> f9fc8932b11f3bcf2a2626f567cb6fdd36a33a94, so it's not 100% clear to me
> why it was necessary to remove sem_*() calls.
> 
> util/thread-pool.c uses qemu_sem_*() to notify worker threads when work
> becomes available. It makes sense that this operation is
> performance-critical and that's why the benchmark regressed.

Doh, I questioned whether the change would have a performance impact,
and it wasn't thought to be used in perf critical places

   https://www.mail-archive.com/qemu-devel@nongnu.org/msg870737.html

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


