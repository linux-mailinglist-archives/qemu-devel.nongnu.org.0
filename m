Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AF74AC4C2
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 17:02:37 +0100 (CET)
Received: from localhost ([::1]:37842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH6TI-0008Ub-Hr
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 11:02:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nH6Ju-0002I2-0C
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 10:52:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nH6Jr-00053E-1M
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 10:52:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644249166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CGmiSIl/lyP4shYp386o9OtP1dmHywsLxtnroZkits0=;
 b=VFuCtOU0dl5OqoS1fsiG6D+m4k6yWIhSV5JfkrclRtviGyG9ZZftK7zix3WtuOnMSju6ws
 h6RxTetcUX/FW2/xDSGRczk7/YJpRO+JD6DfL+EcgAxgsTGReBbI3zl2UVqHPcyWTSexRa
 H+zqat33aHiYAqH6S0Gg3Xxvc2r80y0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-308-pSu3ST34MV2yx4iDkrEkTQ-1; Mon, 07 Feb 2022 10:52:43 -0500
X-MC-Unique: pSu3ST34MV2yx4iDkrEkTQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3DBE83DE78;
 Mon,  7 Feb 2022 15:52:41 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.9.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E7D07D474;
 Mon,  7 Feb 2022 15:52:10 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id E6DA02237EB; Mon,  7 Feb 2022 10:52:09 -0500 (EST)
Date: Mon, 7 Feb 2022 10:52:09 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v4 09/11] 9p: darwin: Implement compatibility for mknodat
Message-ID: <YgFAKSo5Pdc+JBl0@redhat.com>
References: <20220206200719.74464-1-wwcohen@gmail.com>
 <20220206200719.74464-10-wwcohen@gmail.com>
 <b32f0267-c8b1-2e50-b81f-65289c89e802@amsat.org>
 <CAB26zV1ZmpODTqv20Ae77+SWvG5Cf1GWdi7FuR_L_aWjFcgfnA@mail.gmail.com>
 <20220207094717.5f92da9d@bahia>
 <a48d6e38-e420-fb34-899d-7d933b384089@amsat.org>
 <20220207114912.1efe2a27@bahia>
MIME-Version: 1.0
In-Reply-To: <20220207114912.1efe2a27@bahia>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Sergio Lopez <slp@redhat.com>, Michael Roitzsch <reactorcontrol@icloud.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, hi@alyssa.is, Will Cohen <wwcohen@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 07, 2022 at 11:49:12AM +0100, Greg Kurz wrote:
> On Mon, 7 Feb 2022 11:30:18 +0100
> Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
> 
> > On 7/2/22 09:47, Greg Kurz wrote:
> > > On Sun, 6 Feb 2022 20:10:23 -0500
> > > Will Cohen <wwcohen@gmail.com> wrote:
> > > 
> > >> This patch set currently places it in 9p-util only because 9p is the only
> > >> place where this issue seems to have come up so far and we were wary of
> > >> editing files too far afield, but I have no attachment to its specific
> > >> location!
> > >>
> > > 
> > > Inline comments are preferred on qemu-devel. Please don't top post !
> > > This complicates the review a lot.
> > > 
> > > This is indeed a good candidate for osdep. This being said, unless there's
> > > some other user in the QEMU code base, it is acceptable to leave it under
> > > 9pfs.
> > 
> > virtiofsd could eventually use it.
> 
> 
> Indeed but virtiofsd is for linux hosts only AFAICT and I'm not aware of any
> work to support any other host OS.

[ CC Sergio ]

Will like to support virtiofs on other host OS. Getting rid of Linux
specific parts should be doable. I think bigger challenge is how to
make vhost-user stuff work on other OS, like macOS.

If virtiofsd was somehow running as part of qemu (and not as a separate
process), then making rest of the filesystem code to work on other
OS should not be too hard, I guess.

So question is, can one somehow run same virtiofsd code both as part
of qemu as well as separate daemon based on need (and one does not have
to maintain two separate code bases).

Thanks
Vivek

> 
> Cc'ing virtio-fs people for inputs on this topic.
> 


