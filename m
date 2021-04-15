Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 424F7360CCA
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 16:54:40 +0200 (CEST)
Received: from localhost ([::1]:39400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX3OA-0005ga-Uj
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 10:54:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lX3Mr-0004uS-CO
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 10:53:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lX3Mp-00015J-7T
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 10:53:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618498393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t3m54ArYG7BLnGEcTA+i36jiKU4ETN9NMgjXMn41PPU=;
 b=bmpBWb3KI+cVdsDUMp0G1+rtycW8r36OO8CQOxA/Px8+PQX41vox81tkFOn6hrtdyTby4u
 48Tr0muj9VRIyFCkjApHWwESUSxvViRAVByZyE4jFZpW5JL7LbYniHt2AuhJx4VHB/C/tY
 lFhjpCVHFfCtIr2gD7s9UBfkLzMsvOk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-v1IK2rw7PJCt1bqdUoiRew-1; Thu, 15 Apr 2021 10:53:09 -0400
X-MC-Unique: v1IK2rw7PJCt1bqdUoiRew-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07DBF18397AA;
 Thu, 15 Apr 2021 14:53:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC0CA60D08;
 Thu, 15 Apr 2021 14:53:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0BF0A113525D; Thu, 15 Apr 2021 16:53:06 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Bug 1923663] [NEW] Can't(?) disable default floppy drive any
 more in qemu 6.0
References: <161834460731.13851.12350778402155141357.malonedeb@chaenomeles.canonical.com>
 <87fsztny5a.fsf@dusky.pond.sub.org>
 <CAFEAcA-=85_YdVpQMURN6TVJ67MRbj4NCx8fAPrWWUFYBWG5aQ@mail.gmail.com>
Date: Thu, 15 Apr 2021 16:53:06 +0200
In-Reply-To: <CAFEAcA-=85_YdVpQMURN6TVJ67MRbj4NCx8fAPrWWUFYBWG5aQ@mail.gmail.com>
 (Peter Maydell's message of "Thu, 15 Apr 2021 13:36:12 +0100")
Message-ID: <87zgxzbnvx.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Adam Williamson <1923663@bugs.launchpad.net>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 14 Apr 2021 at 08:07, Markus Armbruster <armbru@redhat.com> wrote:
>> In my opinion, management applications are better off with -nodefaults.
>> It's easier to understand than the complicated mess I'm going to
>> describe under "Long answer" below.
>
> Is there a mechanism to get QEMU to tell me "what are all the
> long options I need to specify explicitly now to get the same
> behaviour that I had before I started passing -nodefaults" ?

Sadly, no.

> Otherwise it's a pretty painful route to suggest that people
> go down (though I agree that for a management app as opposed to
> an individual user it's probably a worthwhile route in the long
> term).

I don't think it's *that* bad.  The stuff -nodefaults suppresses is
geared for ad hoc human use, and I figure management applications
override much of it anyway.


