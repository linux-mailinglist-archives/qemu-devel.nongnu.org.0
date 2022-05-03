Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D035181F5
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 12:03:41 +0200 (CEST)
Received: from localhost ([::1]:39224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlpNc-0005OG-G9
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 06:03:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nlpJW-0003hF-LV
 for qemu-devel@nongnu.org; Tue, 03 May 2022 05:59:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nlpJV-0006SQ-1s
 for qemu-devel@nongnu.org; Tue, 03 May 2022 05:59:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651571964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8eG5VnZBg93JzlbIfHcjORXUqa9PMSbvM5eZckoGQDI=;
 b=Xu/xTKJhhvucyhOKIJIgV7YQ/jfida45XDDJdJ/SadSdG6RcLasP/JB08EpsYfXNiR8KLj
 QQdnpWm43nj1Ml4dY4+U6WbATGwTTFi3nVLnkbdgiB4Wtdd0TjJg/MkKdNoar/FxLokKhX
 59GfDLMXrO2LyOk49aNj9/Qyn+g7FoM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-VP_pwsemMBWbW1sbiZnnDw-1; Tue, 03 May 2022 05:59:20 -0400
X-MC-Unique: VP_pwsemMBWbW1sbiZnnDw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BDB0C1014A63;
 Tue,  3 May 2022 09:59:19 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.201])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CA23568CC4;
 Tue,  3 May 2022 09:59:17 +0000 (UTC)
Date: Tue, 3 May 2022 11:59:15 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Prasad J Pandit <pjp@fedoraproject.org>,
 Qemu-block <qemu-block@nongnu.org>, Darren Kenny <darren.kenny@oracle.com>,
 Alexander Bulekov <alxndr@bu.edu>, Hanna Reitz <hreitz@redhat.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Jon Maloy <jmaloy@redhat.com>
Subject: Re: [PATCH-for-6.2 0/2] hw/block/fdc: Fix CVE-2021-3507
Message-ID: <YnD881acilymQYhE@redhat.com>
References: <20211118115733.4038610-1-philmd@redhat.com>
 <7153eadf-3c43-b62c-aaa1-919abf0634ca@redhat.com>
 <1c5dfae3-1c3c-bd2f-d2b5-06dbe75c04c8@redhat.com>
 <4df33af0-0a28-2e20-1909-25baf87d0565@redhat.com>
 <01a68a16-fa01-e7f3-4248-fdec6595cf74@redhat.com>
 <38386efc-1e83-63d4-703d-10c7650e7829@redhat.com>
 <0656151f-a76d-bdd2-cdc9-ea0d1543b0f9@redhat.com>
 <CAFn=p-bwpT7MRhC5xVcsDHnfGfFzKDeu_H5+DZ4irvLUQaOP_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFn=p-bwpT7MRhC5xVcsDHnfGfFzKDeu_H5+DZ4irvLUQaOP_A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

Am 23.03.2022 um 03:25 hat John Snow geschrieben:
> On Fri, Mar 18, 2022 at 2:50 PM Thomas Huth <thuth@redhat.com> wrote:
> >
> > On 10/03/2022 18.53, Jon Maloy wrote:
> > >
> > > On 3/10/22 12:14, Thomas Huth wrote:
> > >> On 06/02/2022 20.19, Jon Maloy wrote:
> > >>> Trying again with correct email address.
> > >>> ///jon
> > >>>
> > >>> On 2/6/22 14:15, Jon Maloy wrote:
> > >>>>
> > >>>>
> > >>>> On 1/27/22 15:14, Jon Maloy wrote:
> > >>>>>
> > >>>>> On 11/18/21 06:57, Philippe Mathieu-Daudé wrote:
> > >>>>>> Trivial fix for CVE-2021-3507.
> > >>>>>>
> > >>>>>> Philippe Mathieu-Daudé (2):
> > >>>>>>    hw/block/fdc: Prevent end-of-track overrun (CVE-2021-3507)
> > >>>>>>    tests/qtest/fdc-test: Add a regression test for CVE-2021-3507
> > >>>>>>
> > >>>>>>   hw/block/fdc.c         |  8 ++++++++
> > >>>>>>   tests/qtest/fdc-test.c | 20 ++++++++++++++++++++
> > >>>>>>   2 files changed, 28 insertions(+)
> > >>>>>>
> > >>>>> Series
> > >>>>> Acked-by: Jon Maloy <jmaloy@redhat.com>
> > >>>>
> > >>>> Philippe,
> > >>>> I hear from other sources that you earlier have qualified this one as
> > >>>> "incomplete".
> > >>>> I am of course aware that this one, just like my own patch, is just a
> > >>>> mitigation and not a complete correction of the erroneous calculation.
> > >>>> Or did you have anything else in mind?
> > >>
> > >> Any news on this one? It would be nice to get the CVE fixed for 7.0 ?
> > >>
> > >>  Thomas
> > >>
> > > The ball is currently with John Snow, as I understand it.
> > > The concern is that this fix may not take the driver back to a consistent
> > > state, so that we may have other problems later.
> > > Maybe Philippe can chip in with a comment here?
> >
> > John, Philippe, any ideas how to move this forward?
> >
> >   Thomas
> >
> 
> The ball is indeed in my court. I need to audit this properly and get
> the patch re-applied, and get tests passing.
> 
> As a personal favor: Could you please ping me on IRC tomorrow about
> this? (Well, later today, for you.)

Going through old patches... Is this one still open?

Kevin


