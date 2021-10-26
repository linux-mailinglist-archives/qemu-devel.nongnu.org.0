Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7123543B157
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 13:37:37 +0200 (CEST)
Received: from localhost ([::1]:49982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfKls-0000Ek-IM
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 07:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mfKjo-0007PS-Hh
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 07:35:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mfKjl-00035Z-Tz
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 07:35:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635248117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lpbEWU78bohWHVTvzM2t5UCnorufLkWQSfdzo8iRfmU=;
 b=BzwBcCO3choNmQ7JJQKCnD97GzPiPilTOPAXK7SEDgKDtagmUVL2IkxDEZylIhukZboTe7
 Ggc4zgM7IXTBWCsuN8tpqtt7Ot0vBkd1vVTkDUc1UR6iICkN/5IDFXGJhZN9XBDmlqNxdI
 shVCXCLo0BfEXvPyy1IIhQrabVbwzX4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-oq6V3S6PPEaXLpA35B6qeQ-1; Tue, 26 Oct 2021 07:35:13 -0400
X-MC-Unique: oq6V3S6PPEaXLpA35B6qeQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0468E100A640;
 Tue, 26 Oct 2021 11:35:13 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2990D60CC4;
 Tue, 26 Oct 2021 11:34:35 +0000 (UTC)
Date: Tue, 26 Oct 2021 13:34:33 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 1/9] qapi: New special feature flag "unstable"
Message-ID: <YXfnySLlaqsRlLzb@redhat.com>
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-2-armbru@redhat.com>
 <YXewOaSDEXJDYV+1@redhat.com> <87r1c83z5c.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87r1c83z5c.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pkrempa@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, quintela@redhat.com, libvir-list@redhat.com,
 eblake@redhat.com, mdroth@linux.vnet.ibm.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 jsnow@redhat.com, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26.10.2021 um 11:37 hat Markus Armbruster geschrieben:
> Kevin Wolf <kwolf@redhat.com> writes:
> 
> > Am 25.10.2021 um 07:25 hat Markus Armbruster geschrieben:
> >> By convention, names starting with "x-" are experimental.  The parts
> >> of external interfaces so named may be withdrawn or changed
> >> incompatibly in future releases.
> >> 
> >> Drawback: promoting something from experimental to stable involves a
> >> name change.  Client code needs to be updated.
> >> 
> >> Moreover, the convention is not universally observed:
> >> 
> >> * QOM type "input-barrier" has properties "x-origin", "y-origin".
> >>   Looks accidental, but it's ABI since 4.2.
> >> 
> >> * QOM types "memory-backend-file", "memory-backend-memfd",
> >>   "memory-backend-ram", and "memory-backend-epc" have a property
> >>   "x-use-canonical-path-for-ramblock-id" that is documented to be
> >>   stable despite its name.
> >> 
> >> We could document these exceptions, but documentation helps only
> >> humans.  We want to recognize "unstable" in code, like "deprecated".
> >> 
> >> Replace the convention by a new special feature flag "unstable".  It
> >> will be recognized by the QAPI generator, like the existing feature
> >> flag "deprecated", and unlike regular feature flags.
> >> 
> >> This commit updates documentation and prepares tests.  The next commit
> >> updates the QAPI schema.  The remaining patches update the QAPI
> >> generator and wire up -compat policy checking.
> >> 
> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> >
> > Obviously, replacing the old convention gets rid of the old drawbacks,
> > but adds a new one: While using x- makes it very obvious for a human
> > user that this is an unstable feature, a feature flag in the schema will
> > almost certainly go unnoticed in manual use.
> 
> I thought about this, but neglected to put it in writing.  My bad.
> 
> Manual use of unstable interfaces is mostly fine.  Human users can adapt
> to changing interfaces.  HMP works that way.
> 
> Management applications are better off with a feature flag than with a
> naming convention we sometimes ignore.
> 
> The most potential for trouble is in between: programs that aren't
> full-fledged management applications.
> 
> If we want to keep "unstable" obvious to the humans who write such
> programs, we can continue to require "x-", in addition to the feature
> flag.  We pay for it with renames, and the risk of forgetting to rename
> in time (which is what got us the awkward stable
> "x-use-canonical-path-for-ramblock-id").  Tradeoff.  I chose not to, but
> if y'all think we should...

Just to clarify, I'm not implying that we should keep it. I'm merely
pointing out that there is a tradeoff that requires us to make a choice.
The decision for one of the options should be explicit rather than just
happening as a side effect. Documenting that it was a conscious decision
is probably best done by adding the reasoning for it to the commit
message.

> What we can't do, at least not easily, is to use *only* the "x-"
> convention: it is not reliable.  We'd have to add a way to say 'this is
> stable even though the name starts with "x-"'.

No question.

Kevin


