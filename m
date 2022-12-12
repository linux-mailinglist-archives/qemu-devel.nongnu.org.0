Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E294764A481
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 16:58:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4lBM-0006CM-Eq; Mon, 12 Dec 2022 10:57:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p4lB8-00067G-VG
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 10:57:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p4lB7-00043Z-BO
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 10:57:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670860635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yHnngiz4YfX3xVJTzbV4IBxZqnZ9v5ug6Rk7KENmTto=;
 b=GapGcgAoWqUjXBhV60aiIHFQTRCyXzTEIK0LXtBpUx6+acba+OWiX+CWLpdo5Q2WZJTtEp
 CKhzdYK/94GQ+bLPlDJAVyYEzqm2bgORTxwbLy1DXI0Sgb/4dfaty2z5+ZpKKGAiWQyNju
 U7b8A73Y5k86G5DlzG0r8w+YCHrOTYk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-AracAQ9qNO-A8dIQBH1XtQ-1; Mon, 12 Dec 2022 10:57:12 -0500
X-MC-Unique: AracAQ9qNO-A8dIQBH1XtQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37AE438123A6;
 Mon, 12 Dec 2022 15:57:12 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A657C15BA0;
 Mon, 12 Dec 2022 15:57:10 +0000 (UTC)
Date: Mon, 12 Dec 2022 16:57:07 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-block@nongnu.org, eesposit@redhat.com, stefanha@redhat.com,
 hreitz@redhat.com, vsementsov@yandex-team.ru, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 14/15] block: Don't poll in bdrv_replace_child_noperm()
Message-ID: <Y5dPU7CDisZwKYy5@redhat.com>
References: <20221118174110.55183-1-kwolf@redhat.com>
 <20221118174110.55183-15-kwolf@redhat.com>
 <30eec378-779a-26ca-42f3-a7980a647ad7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30eec378-779a-26ca-42f3-a7980a647ad7@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Am 09.12.2022 um 17:53 hat Paolo Bonzini geschrieben:
> On 11/18/22 18:41, Kevin Wolf wrote:
> > In order to make sure that bdrv_replace_child_noperm() doesn't have to
> > poll any more, get rid of the bdrv_parent_drained_begin_single() call.
> > 
> > This is possible now because we can require that the parent is already
> > drained through the child in question when the function is called and we
> > don't call the parent drain callbacks more than once.
> > 
> > The additional drain calls needed in callers cause the test case to run
> > its code in the drain handler too early (bdrv_attach_child() drains
> > now), so modify it to only enable the code after the test setup has
> > completed.
> > 
> > Signed-off-by: Kevin Wolf<kwolf@redhat.com>
> 
> I hate to bear bad news, but this breaks the Windows builds on github
> (msys-32bit, msys-64bit) with an obscure but 100% reproducible
> 
> 51/88 qemu:unit / test-bdrv-drain ERROR           1.30s   (exit status
> 3221225477 or signal 3221225349 SIGinvalid)
> 
> The exit status is 0xC0000005 aka a Windows SIGSEGV.  With some luck it
> could be reproducible with Wine (but no gdb).

I can reproduce it with mingw+wine (and actually gdb! Still a somewhat
limited debugging environment, but not as bad as I imagined.)

I looks to me like this is a problem with the test case rather than the
change per se. It seems to be fixed with this patch that is already
posted as part of the next series:

[PATCH 09/18] test-bdrv-drain: Fix incorrrect drain assumptions
https://lists.gnu.org/archive/html/qemu-block/2022-12/msg00165.html

Kevin


