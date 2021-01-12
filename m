Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 317272F2B76
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 10:37:00 +0100 (CET)
Received: from localhost ([::1]:36920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzG6l-0001QD-Ai
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 04:36:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kzG5e-0000me-LW
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:35:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kzG5b-0005PV-Gz
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:35:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610444144;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S0eoEdRLwgS483gKCvvMWhCtb9tiT28JY3FSzQZGhbs=;
 b=KryiOWcYRQZQmdsAro8FDQfk+v23YWl+k1fe8mBohN/iouCTNFvmgtsc+SaVDvpSstEm9H
 LBrBLsq3HO14iTgBbw3JmY9Ynqs3lnji8SBNA4ME9PH7lzAy/4K9VhNA27FY1FbyzLV5iU
 aOvOl1eTKwzuXYnZutcU54Rx2e5+dhk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-eCECMoiTODmYPhHkJjo5Dw-1; Tue, 12 Jan 2021 04:35:32 -0500
X-MC-Unique: eCECMoiTODmYPhHkJjo5Dw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EF388143E5;
 Tue, 12 Jan 2021 09:35:30 +0000 (UTC)
Received: from redhat.com (ovpn-115-107.ams2.redhat.com [10.36.115.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 56C0B5D9F4;
 Tue, 12 Jan 2021 09:35:27 +0000 (UTC)
Date: Tue, 12 Jan 2021 09:35:24 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v6 05/35] Hexagon (disas) disassembler
Message-ID: <20210112093524.GA1360503@redhat.com>
References: <1610080146-14968-1-git-send-email-tsimpson@quicinc.com>
 <1610080146-14968-6-git-send-email-tsimpson@quicinc.com>
 <6da5929b-1c66-1e08-7998-1823aa716c60@amsat.org>
 <BYAPR02MB48868E6F215E4C1315543246DEAB0@BYAPR02MB4886.namprd02.prod.outlook.com>
 <8d39b0b1-3056-e407-6feb-e27b0b5ada60@amsat.org>
MIME-Version: 1.0
In-Reply-To: <8d39b0b1-3056-e407-6feb-e27b0b5ada60@amsat.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: "ale@rev.ng" <ale@rev.ng>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Brian Cain <bcain@quicinc.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "laurent@vivier.eu" <laurent@vivier.eu>, Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 11, 2021 at 11:20:27PM +0100, Philippe Mathieu-Daudé wrote:
> +Thomas/Daniel/Peter.
> 
> On 1/11/21 10:14 PM, Taylor Simpson wrote:
> >> -----Original Message-----
> >> From: Qemu-devel <qemu-devel-
> >> bounces+tsimpson=quicinc.com@nongnu.org> On Behalf Of Philippe
> >> Mathieu-Daudé
> >> Sent: Saturday, January 9, 2021 3:38 PM
> >> To: Taylor Simpson <tsimpson@quicinc.com>; qemu-devel@nongnu.org
> >> Cc: ale@rev.ng; Brian Cain <bcain@quicinc.com>;
> >> richard.henderson@linaro.org; laurent@vivier.eu
> >> Subject: Re: [PATCH v6 05/35] Hexagon (disas) disassembler
> >>
> >> Hi Taylor,
> >>
> >> On 1/8/21 5:28 AM, Taylor Simpson wrote:
> >>> +/*
> >>> + *  Copyright(c) 2019-2020 Qualcomm Innovation Center, Inc. All Rights
> >> Reserved.
> >>
> >> 2019-2021 :)
> >>
> >>> + *
> >>> + *  This program is free software; you can redistribute it and/or modify
> >>> + *  it under the terms of the GNU General Public License as published by
> >>> + *  the Free Software Foundation; either version 2 of the License, or
> >>> + *  (at your option) any later version.
> >>> + *
> >>> + *  This program is distributed in the hope that it will be useful,
> >>> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> >>> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >>> + *  GNU General Public License for more details.
> >>> + *
> >>> + *  You should have received a copy of the GNU General Public License
> >>> + *  along with this program; if not, see <http://www.gnu.org/licenses/>.
> >>
> >> If possible please also include the SPDX identifier (or simply it):
> >>
> >> SPDX-License-Identifier: GPL-2.0-or-later
> > 
> > I'll confirm with our legal department.  Which is preferred - the identifier alone or the text and the identifier?
> 
> Obviously IANAL, but my understanding from explanations from Thomas and
> Daniel is -- if one day QEMU switches to using SPDX -- when both are
> provided, it is very hard to remove a text license (which often is
> copy/pasted with mistakes). So the identifier alone is better (assuming
> your legal department confirms it has the same value).
> 
> Now if you ask if there is any plan QEMU switch to SPDX, I'd say this
> is a gray zone. Peter expressively said he prefers a full switch or
> nothing. We don't have the resources for it. Meanwhile some companies
> prefer their employees to send new contributions with SPDX as it eases
> their compliance audit tools.
> 
> I guess Thomas spend 1 week on this topic. TBH I spent more than 2 weeks
> and barely added the SPDX tag to a bit more than 30% of the codebase
> then had to give up because my time was over (this was when I understood
> I couldn't remove the text and had to redo the work).
> 
> Not sure how this can be coordinated. As long as there is no strong
> corporate interest, this might stay in this gray zone...

I can't see us removing all existing license boilerplate because
of the legal challenges that involves. The amount of work does not
justify the potential payoff, as compared to all the other useful
things that could be worked on in QEMU.

My expectation is that all files should have license header for the
sake of consistency across the codebase, and may optionally have SPDX.

With all this in mind, IMHO reviewers should NOT be raising with
contributions to QEMU, as it creates a burden for contributors
to talk to their legal teams. The amount of new files being added to
QEMU are negligible compared to what's already in tree, so any new files
we accept aren't making the situation measurably worse.

Just accept files with normal license headers as we've always done.

Anything involving SPDX in future will just need to bulk updates
everything.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


