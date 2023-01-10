Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A194664B9F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 19:52:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFJMu-00056D-8t; Tue, 10 Jan 2023 13:29:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pFJMs-00055U-Up
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 13:29:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pFJMr-0001ea-Fz
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 13:29:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673375340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WzDe9DsPuEiK/+1cAh6GTFGblJ1vSt8u3Gz+A07Prbc=;
 b=YVHdwFHPH9jID/Xgy3ZQ37/dHB97q/kZQeBEoSWaw3nHaT/oaNVJKv/YjwhWGb9rNACzkz
 cbWK4Wn/RflVstJZPDTcxmbX8pyT04/hStbZChgqeLuE/D+BxiWuNSGPOdgtCK6g2S0Wpv
 p0Wp8Ds2FR+9i4Gd3tnlr4579yVrzqQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-260-LE-OdLVzO56mLNn7birUyQ-1; Tue, 10 Jan 2023 13:28:57 -0500
X-MC-Unique: LE-OdLVzO56mLNn7birUyQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29D81802C1C;
 Tue, 10 Jan 2023 18:28:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F3F1C40C2064;
 Tue, 10 Jan 2023 18:28:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D744621E6806; Tue, 10 Jan 2023 19:28:55 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,  qemu-devel@nongnu.org
Subject: Re: [PULL 00/51] virtio,pc,pci: features, cleanups, fixes
References: <20230105091310.263867-1-mst@redhat.com>
 <20230105045619-mutt-send-email-mst@kernel.org>
 <20230105113111-mutt-send-email-mst@kernel.org>
 <CAFEAcA8Dr_vT2YrrrapL5vAtL5baGxPpk0busNPU-vutJcA10A@mail.gmail.com>
 <20230105165242-mutt-send-email-mst@kernel.org>
 <CAFEAcA8C5cfBc6qU1bZ_U0PusAAemOD6TYGhgxtQbwP-YA3yVQ@mail.gmail.com>
 <20230108015336-mutt-send-email-mst@kernel.org>
 <87cz7nsu1j.fsf@pond.sub.org>
Date: Tue, 10 Jan 2023 19:28:55 +0100
In-Reply-To: <87cz7nsu1j.fsf@pond.sub.org> (Markus Armbruster's message of
 "Mon, 09 Jan 2023 14:43:04 +0100")
Message-ID: <87mt6qmefs.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Markus Armbruster <armbru@redhat.com> writes:

> "Michael S. Tsirkin" <mst@redhat.com> writes:
>
>> On Fri, Jan 06, 2023 at 03:29:01PM +0000, Peter Maydell wrote:
>>> On Thu, 5 Jan 2023 at 21:53, Michael S. Tsirkin <mst@redhat.com> wrote:
>>> >
>>> > On Thu, Jan 05, 2023 at 09:04:37PM +0000, Peter Maydell wrote:
>
> [...]
>
>>> > > Compile failures on freebsd in the bsd-user build:
>>> > >
>>> > > https://gitlab.com/qemu-project/qemu/-/jobs/3561556072
>>> > > https://gitlab.com/qemu-project/qemu/-/jobs/3561556071
>>> > >
>>> > > Probably something in Markus' include-file cleanup, I suspect
>>> > > some file is missing its osdep.h include.
>>> > >
>>> > > thanks
>>> > > -- PMM
>>> >
>>> >
>>> > Pushed a fixup, commit 1df76fab679e9a673b71531925fe12ceb89eaecb now.
>>> > Pls let me know, thanks!
>>> 
>>> Still failing on FreeBSD, for a different reason:
>>> https://gitlab.com/qemu-project/qemu/-/jobs/3565200188
>>> 
>>> thanks
>>> -- PMM
>>
>> Dropped the offending patch, commit aba0d042b1c1be38818cec16af3f34e9e9e2aed2 
>> now.  Pls let me know, thanks!
>
> Appreciate the CI links.  I'll respin.

I'd like to reproduce locally, and tried "make vm-build-freebsd".  No
luck.  Any other ideas?


