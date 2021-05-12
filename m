Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AF037B715
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 09:48:01 +0200 (CEST)
Received: from localhost ([::1]:32826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgjb6-0002y1-Em
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 03:48:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lgjYU-0007gT-NQ
 for qemu-devel@nongnu.org; Wed, 12 May 2021 03:45:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lgjYP-000219-Tq
 for qemu-devel@nongnu.org; Wed, 12 May 2021 03:45:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620805513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nhNe54HuYHqR7GzZ3wdnDd5rcGJ3B15afkEN/lEhvbU=;
 b=KapcZIMXYSXXyIJ52lNnRG7ViVS3SvGHoHMJWHln9ihHB8FPjbJ6KA/OkS3q3IT2UTdJj3
 vTiG/aAonWwxqCA7F5oKUAAcA4eagbyvt8HIxhDEctXBOQqn5t/j66z+njBbkqqn1wdpnu
 juubuKugI1Wby7a8TXNjNTZD4d/Wje0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-REgjAEsvMzq9U-m7yLivLQ-1; Wed, 12 May 2021 03:45:10 -0400
X-MC-Unique: REgjAEsvMzq9U-m7yLivLQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3087803625;
 Wed, 12 May 2021 07:45:09 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-75.ams2.redhat.com [10.36.114.75])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C28D66268F;
 Wed, 12 May 2021 07:45:08 +0000 (UTC)
Date: Wed, 12 May 2021 09:45:07 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PULL 30/33] migration: do not restart VM after successful
 snapshot-load
Message-ID: <YJuHg6CteFx6c9fJ@merkur.fritz.box>
References: <20210511081350.419428-1-pbonzini@redhat.com>
 <20210511081350.419428-31-pbonzini@redhat.com>
 <YJq5s+VJC52n+RlV@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YJq5s+VJC52n+RlV@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 11.05.2021 um 19:06 hat Daniel P. Berrangé geschrieben:
> On Tue, May 11, 2021 at 04:13:47AM -0400, Paolo Bonzini wrote:
> > The HMP loadvm code is calling load_snapshot rather than
> > qmp_snapshot_load, in order to bypass the job infrastructure.  The code
> > around it is almost the same, with one difference: hmp_loadvm is
> > restarting the VM if load_snapshot fails, qmp_snapshot_load is doing so
> > if load_snapshot succeeds.
> > 
> > Fix the bug in QMP by moving the common code to load_snapshot.
> 
> This doesn't appear to have actually fixed the HMP regression.
> Instead I think it is duplicated the HMP bug in the QMP code
> too.
> 
> See the 068  iotest enhancement here that validates the expected
> state on success:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg03091.html

I guess I'll wait for this new QMP bug to hit master, and then rebase my
fix on top of it, with now two Fixes: lines.

Or do you want to send a v2 of this pull request without this patch,
Paolo?

Kevin


