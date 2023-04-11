Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 696916DDA71
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 14:10:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmCod-0004X3-Fw; Tue, 11 Apr 2023 08:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pmCoa-0004W9-OC
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 08:09:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pmCoY-0004NP-PT
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 08:09:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681214973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5IVfwhrEHTxPIKyLpf6NqeW3t3CoaOLvsQwlw+bos94=;
 b=dPGrtdIKz1AIKLTvVL3+AT21Ck3kEQkA5iNj4ATiTOysP1QaQ3ZZLSwUPcrLxousf2LR76
 mrqwCMKKTaYSHGmQYgrNIVTeUXkr9ajxGqZ/q7amVb9173FeQPmndXvmJvlZOVYRmXYDlC
 qd/5j8a19NxZzu8x75lZUOYW7CCbmBw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-153-rCsjhhBWOhicwK3M74TQ6A-1; Tue, 11 Apr 2023 08:09:30 -0400
X-MC-Unique: rCsjhhBWOhicwK3M74TQ6A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08D3F101A54F;
 Tue, 11 Apr 2023 12:09:30 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 00925202701E;
 Tue, 11 Apr 2023 12:09:26 +0000 (UTC)
Date: Tue, 11 Apr 2023 14:09:25 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Reinoud Zandijk <reinoud@netbsd.org>
Cc: Michael Tokarev <mjt@tls.msk.ru>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Ryo ONODERA <ryoon@netbsd.org>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Beraldo Leal <bleal@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, kvm@vger.kernel.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 armbru@redhat.com
Subject: Re: [PATCH v2 05/11] qemu-options: finesse the recommendations
 around -blockdev
Message-ID: <ZDVN9TlzrCOJHlDR@redhat.com>
References: <20230403134920.2132362-1-alex.bennee@linaro.org>
 <20230403134920.2132362-6-alex.bennee@linaro.org>
 <ZCwsvaxRzx4bzbXo@redhat.com>
 <cbb3df0a-7714-cbc0-efda-45f1d608e988@msgid.tls.msk.ru>
 <ZCxNqb9tEO24KaxX@redhat.com>
 <ZC8qXxB6X8t7RBa+@gorilla.13thmonkey.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZC8qXxB6X8t7RBa+@gorilla.13thmonkey.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 06.04.2023 um 22:23 hat Reinoud Zandijk geschrieben:
> On Tue, Apr 04, 2023 at 06:17:45PM +0200, Kevin Wolf wrote:
> > Am 04.04.2023 um 17:07 hat Michael Tokarev geschrieben:
> > > 04.04.2023 16:57, Kevin Wolf пишет:
> > Maybe -snapshot should error out if -blockdev is in use. You'd generally
> > expect that either -blockdev is used primarily and snapshots are done
> > externally (if the command line is generated by some management tool),
> > or that -drive is used consistently (by a human who likes the
> > convenience). In both cases, we wouldn't hit the error path.
> > 
> > There may be some exceptional cases where you have both -drive and
> > -blockdev (maybe because a human users needs more control for one
> > specific disk). This is the case where you can get a nasty surprise and
> > that would error out. If you legitimately want the -drive images
> > snapshotted, but not the -blockdev ones, you can still use individual
> > '-drive snapshot=on' options instead of the global '-snapshot' (and the
> > error message should mention this).
> 
> I didn't know that! I normally use the -snapshot as global option. Is there a
> reason why -blockdev isn't honouring -snapshot?

The philosophy behind -blockdev is that you're explicit about every
image file (and other block node) you want to use and that QEMU doesn't
magically insert or change things behind your back.

For simple use cases that might not seem necessary, but many of the
newer functions added to the block layer, like the block jobs, are
operations that can work on any node in the block graph (i.e. any of the
open images, including backing files etc.). If QEMU changed something
behind your back, you can easily access the wrong image. Especially for
management software like libvirt this kind of magic that -drive involves
was really hard to work with because it always had to second guess what
the world _really_ looked like on the QEMU side.

For example, imagine you open foo.img with -snapshot. Now you want to
create a backup of your current state, so tell QEMU to backup the block
node for foo.img because that's what your VM is currently running on,
right? Except that nobody told you that the active image is actually a
temporary qcow2 image file that -snapshot created internally. You're
backing up the wrong image without the changes of your running VM.

So it's better to always be explicit, and then it's unambiguous which
image file you really mean in operations.

Kevin


