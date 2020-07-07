Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C842168D5
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 11:11:31 +0200 (CEST)
Received: from localhost ([::1]:40472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsjdS-0005tU-HS
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 05:11:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1jsjcY-0005Ai-05
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 05:10:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57680
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1jsjcW-0007au-Aw
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 05:10:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594113031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cO3Re3qyBZgg2vmQy5jVbKaNty1fWrrsr1X+wd6exFo=;
 b=AnvKSSSK9VnwoqjHRQM6NZfUIwelJnRV6fRcj8utNm//QSU/LRGrSr1Z0hrfe2GpWm4mvg
 GNeGvLtEh/nkOQLZjooJrXlhr2HnuEqxmtIttTpyDxwwL9Sq25B2FrobeSoyJej7XqMCCG
 KtY23QCNC33nouRctBj1Zwu4DYwQauY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-kL_OGkcWOsehRrUa62C3uw-1; Tue, 07 Jul 2020 05:10:29 -0400
X-MC-Unique: kL_OGkcWOsehRrUa62C3uw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69265800D5C;
 Tue,  7 Jul 2020 09:10:28 +0000 (UTC)
Received: from starship (unknown [10.35.206.237])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B62C7166C;
 Tue,  7 Jul 2020 09:10:25 +0000 (UTC)
Message-ID: <fe57d61d204a3a328b58aad8b86b587cd7c17946.camel@redhat.com>
Subject: Re: [PATCH 0/1] hw/block/nvme: fix assert on invalid irq vector
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
 <philmd@redhat.com>
Date: Tue, 07 Jul 2020 12:10:24 +0300
In-Reply-To: <20200609153243.GE11003@linux.fritz.box>
References: <20200609094508.32412-1-its@irrelevant.dk>
 <b445a413-598f-23a2-f094-8b68c60722f5@redhat.com>
 <20200609114633.yvwtt6swb47l27yd@apples.localdomain>
 <20200609141425.GC11003@linux.fritz.box>
 <48537ee1-ed77-ffe6-66ba-d61838083069@redhat.com>
 <20200609153243.GE11003@linux.fritz.box>
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 00:46:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Javier Gonzalez <javier.gonz@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2020-06-09 at 17:32 +0200, Kevin Wolf wrote:
> Am 09.06.2020 um 16:18 hat Philippe Mathieu-Daudé geschrieben:
> > On 6/9/20 4:14 PM, Kevin Wolf wrote:
> > > Am 09.06.2020 um 13:46 hat Klaus Jensen geschrieben:
> > > > On Jun  9 13:17, Philippe Mathieu-DaudÃ© wrote:
> > > > > On 6/9/20 11:45 AM, Klaus Jensen wrote:
> > > > > > From: Klaus Jensen <k.jensen@samsung.com>
> > > > > > 
> > > > > > I goofed up with commit c09794fe40e3 ("hw/block/nvme: allow use of any
> > > > > > valid msix vector").
> > > > > 
> > > > > Kevin, since your queue isn't merged, can you directly squash the fix?
> > > > 
> > > > The commit (c09794fe40e3) can just be dropped without conflicts, but it
> > > > leaves a use of n->params.num_queues in nvme_create_cq() which commit
> > > > cde74bfd4b87 ("hw/block/nvme: add max_ioqpairs device parameter") must
> > > > fix.
> > > 
> > > Hm, so it seems this isn't easy to squash in without conflicts (and I
> > > would have to rewrite the whole commit message), so I think it's better
> > > to just apply the series on top.
> > > 
> > > One problem with the commit message is that it references commit IDs
> > > which aren't stable yet. Maybe it's best if I apply these patches,
> > > manually fix up the commit ID references and then immediately do a pull
> > > request so that they become stable.
> > 
> > This is the friendlier way.
> > 
> > Less friendly way is to drop Klaus's patches and ask him to respin.
> > While this is a valid outcome, if we can avoid it it will save all of us
> > review time.
> 
> If Klaus wants to do that, fine with me. I'm just trying to find the
> easiest solution for all of us.
> 
> > > It would be good to have at least one review, though.
> > 
> > Maxim catched this issue, I'd feel safer if he acks your pre-merge queue.
> 
> Ok. Maxim, can you please review this series then?
> 
> Kevin
I am slowly getting through the heap of the patches trying to understand the current state of things.
I will start reviewing all these patches today.

Best regards,
	Maxim Levitsky


