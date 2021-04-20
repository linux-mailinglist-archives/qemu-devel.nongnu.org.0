Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9CB36517C
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 06:28:28 +0200 (CEST)
Received: from localhost ([::1]:53514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYhzu-0001a0-RX
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 00:28:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lYhyt-00019K-AW
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 00:27:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lYhyq-0001Wc-VR
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 00:27:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618892840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yc6+oI5tuEO+wYfXWtDlnkb6NM2dUDvWT5uI1LSiiLs=;
 b=deX/CGjd+ejQa1HBywIfkwGyP8Fj0LsFXql1kybyiNCNFkv4uXXDnjAK6MG/5loamOPD5d
 937Afro4gBjD94tKVSHoPJ5KYbRzGnmnufkvQMflxO5uWWJ93mhHvDyZPMXchcNgMCYd2y
 72EH3wbPyzhZiPEpq5Rut5YBt0Dp2PQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-yKpuYlsKP-uxD92jreQtjA-1; Tue, 20 Apr 2021 00:27:18 -0400
X-MC-Unique: yKpuYlsKP-uxD92jreQtjA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BDF2801814;
 Tue, 20 Apr 2021 04:27:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D394A5C1C4;
 Tue, 20 Apr 2021 04:27:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6A9B5113525D; Tue, 20 Apr 2021 06:27:12 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH for-6.0] migration: Drop redundant query-migrate result
 @blocked
References: <20210419162732.766055-1-armbru@redhat.com>
 <CAFEAcA_S7rvB73JxEAUj_aKcxNcKu4zSoFUsXiLHb=kU7=Qs1A@mail.gmail.com>
 <YH29K3Wa/gyceh72@work-vm>
Date: Tue, 20 Apr 2021 06:27:12 +0200
In-Reply-To: <YH29K3Wa/gyceh72@work-vm> (David Alan Gilbert's message of "Mon, 
 19 Apr 2021 18:26:03 +0100")
Message-ID: <87tuo1shr3.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:

> * Peter Maydell (peter.maydell@linaro.org) wrote:
>> On Mon, 19 Apr 2021 at 17:27, Markus Armbruster <armbru@redhat.com> wrote:
>> >
>> > Result @blocked is true when and only when result @blocked-reasons is
>> > present.  It's always non-empty when present.  @blocked is redundant;
>> > drop.
>> >
>> > Signed-off-by: Markus Armbruster <armbru@redhat.com>
>
> So I'm OK with it in principal and I think the code is OK, so
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>
>> "for-6.0" needs to be accompanied by a justification of why it's
>> important to go in the release at this point...

You're right.  My bad.

> I guess the argument is that when we hit 6.0 it becomes API and removing
> the 'blocked' becomes a matter of deprecation which is a pain.

Correct.

> Hmm; I agree it's the right change, but I'm not sure I can justify it
> this late in the release.

If we decide taking it out is too late, we should at least deprecate it
in 6.0.  I'll post the patch, so you guys can pick the one you like
better.


