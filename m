Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B48FF5833E4
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 22:02:25 +0200 (CEST)
Received: from localhost ([::1]:37230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGnEb-0000tB-Vw
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 16:02:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oGnBb-0007DP-3o
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 15:59:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oGnBZ-0004V7-Fd
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 15:59:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658951952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6zpXnta6diRZfbj+VJXcJUATkfytjElo97bTfLBsznI=;
 b=bVjws2Hucc2MtICgRkOOPBPK1/4VsdDVzmKKi92V64sBCA+nSahnTnhsQIfHupGn5UNte+
 EZuPDxr666q24DOFTb9Ni7kwTZB+CexvGyIW12Pg0fltf9I8zLgZDUcgS1gDlWAJ8up9BY
 67NS3KeneyW70f5QvUSGhocKCnxBbrI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-MniAXugTM0WsMivq-O2JyQ-1; Wed, 27 Jul 2022 15:59:11 -0400
X-MC-Unique: MniAXugTM0WsMivq-O2JyQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66E92185A7BA;
 Wed, 27 Jul 2022 19:59:10 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6175B40C1288;
 Wed, 27 Jul 2022 19:59:09 +0000 (UTC)
Date: Wed, 27 Jul 2022 21:59:08 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: [PULL 14/15] qdev: Base object creation on QDict rather than
 QemuOpts
Message-ID: <YuGZDNovoWLp/F2x@redhat.com>
References: <20211015144640.198044-1-kwolf@redhat.com>
 <20211015144640.198044-15-kwolf@redhat.com>
 <CAFEAcA9jnySMWRD56FF9D7rXhwARiyvqJx+4Ys+smYa2ghdLBg@mail.gmail.com>
 <87wnctzdl9.fsf@pond.sub.org>
 <CAFEAcA_cYpt_FU5mD+X+BSmQq9e6u1n+nm8EVfdrPeVN0o3Spw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_cYpt_FU5mD+X+BSmQq9e6u1n+nm8EVfdrPeVN0o3Spw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 07.07.2022 um 22:24 hat Peter Maydell geschrieben:
> On Mon, 4 Jul 2022 at 05:50, Markus Armbruster <armbru@redhat.com> wrote:
> > My initial (knee-jerk) reaction to breaking array properties: Faster,
> > Pussycat! Kill! Kill!
> 
> In an ideal world, what would you replace them with?

The next (and final) patch in this pull request added JSON syntax for
-device, so we can actually have proper list properties now that are
accessed with the normal list visitors. I suppose some integration with
the qdev property system is still missing, but on the QOM level it could
be used.

In the ideal world, we would also be able to replace the human CLI
syntax so that JSON isn't required for this, but doing this in reality
would probably cause new compatibility problems - though libvirt has
been using JSON for a while, so I guess it wouldn't mind an incompatible
change of human syntax.

Kevin


