Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7ECD567D19
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 06:24:10 +0200 (CEST)
Received: from localhost ([::1]:36724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8wa9-0000OA-Gy
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 00:24:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o8wY2-00079N-Ur
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 00:21:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o8wXz-0004Yv-2R
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 00:21:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657081311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pCAtlPbmfyCtdOc8VXPwCSt5pXSHsWkQMhUFQ09SERE=;
 b=AfepHxe57YdwJpVrha6faBh7ElHlovSFgNC0FiY+pBgZs5OzZYwGz2vvSU145EgdSqBSKe
 v2IA0pISPhL2OL8WXbNi9XOK52CF1nH9rtboms6ekvMsqy0wER3vKQzvjIqSdt1gMC9Fn9
 KjkSlcWHmfaZNaPeSwCs6cBNuPO50VY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-548-lajm36vDNkqW86e_yz5tVQ-1; Wed, 06 Jul 2022 00:21:50 -0400
X-MC-Unique: lajm36vDNkqW86e_yz5tVQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D71908339B5;
 Wed,  6 Jul 2022 04:21:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A99B11415111;
 Wed,  6 Jul 2022 04:21:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8B5B021E690D; Wed,  6 Jul 2022 06:21:48 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Dongwon Kim <dongwon.kim@intel.com>
Cc: qemu-devel@nongnu.org,  Daniel P . =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Gerd Hoffmann <kraxel@redhat.com>,  Vivek
 Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v3 2/2] ui/gtk: a new array param monitor to specify the
 target displays
References: <20220630005141.16680-1-dongwon.kim@intel.com>
 <20220630005141.16680-3-dongwon.kim@intel.com>
 <87wncy41s1.fsf@pond.sub.org>
 <20220705210628.GB582@dongwonk-MOBL.amr.corp.intel.com>
Date: Wed, 06 Jul 2022 06:21:48 +0200
In-Reply-To: <20220705210628.GB582@dongwonk-MOBL.amr.corp.intel.com> (Dongwon
 Kim's message of "Tue, 5 Jul 2022 14:06:29 -0700")
Message-ID: <87h73uq3ab.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Dongwon Kim <dongwon.kim@intel.com> writes:

> On Thu, Jun 30, 2022 at 05:19:26PM +0200, Markus Armbruster wrote:
>> Dongwon Kim <dongwon.kim@intel.com> writes:
>>=20
>> > New integer array parameter, 'monitor' is for specifying the target
>> > monitors where individual GTK windows are placed upon launching.
>> >
>> > Monitor numbers in the array are associated with virtual consoles
>> > in the order of [VC0, VC1, VC2 ... VCn].
>> >
>> > Every GTK window containing each VC will be placed in the region
>> > of corresponding monitors.
>> >
>> > Usage: -display gtk,monitor.<id of VC>=3D<target monitor>,..
>> >        ex)-display gtk,monitor.0=3D1,monitor.1=3D0
>> >
>> > v3: - Revised commit message
>> >     - Rewrote desription of the new parameter (Markus Armbruster)
>> >     - Replaced unnecessary 'for' loop with 'if' condition
>> >       (Markus Armbruster)
>>=20
>> Again, patch history ...
>>
>> > Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> > Cc: Markus Armbruster <armbru@redhat.com>
>> > Cc: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> > Cc: Paolo Bonzini <pbonzini@redhat.com>
>> > Cc: Gerd Hoffmann <kraxel@redhat.com>
>> > Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
>> > Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
>> > ---
>>=20
>> ... goes here.
>
> No problem moving down the version history but may I ask you if that
> is current rule? We don't want to include the history anymore in the
> git history?

Patch history is really valuable for reviewers, but once the patch is
done, it's rarely interesting anymore, so we keep it out of Git.

Sometimes, bits of history are still useful to understand why the patch
is done the way it is.  Such bits should be worked into the commit
message.

Don't:

    v2: A replaced by B [J. Reviewer]

Do:

    I initially tried A, but it turned out to be a bad idea because X,
    so I did B instead.

Makes sense?

> And FYI, the cover letter has the whole history already. I guess I can
> simply remove the history from individual patches then?

I like to keep detailed history in the cover letter.

Others like to keep it in each patch.

Still others like to keep an overview in the cover letter and details in
each patch.

All fine.

> Thanks!!
>
>>=20
>> >  qapi/ui.json    |  9 ++++++++-
>> >  qemu-options.hx |  3 ++-
>> >  ui/gtk.c        | 31 +++++++++++++++++++++++++++++--
>> >  3 files changed, 39 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/qapi/ui.json b/qapi/ui.json
>> > index 413371d5e8..7b4c098bb4 100644
>> > --- a/qapi/ui.json
>> > +++ b/qapi/ui.json
>> > @@ -1195,12 +1195,19 @@
>> >  #               assuming the guest will resize the display to match
>> >  #               the window size then.  Otherwise it defaults to "off".
>> >  #               Since 3.1
>> > +# @monitor:     Array of numbers, each of which represents physical
>> > +#               monitor where GTK window containing a given VC will be
>> > +#               placed. Each monitor number in the array will be
>> > +#               associated with a virtual-console starting from VC0.
>>=20
>> Drop the hyphen in "virtual-console".
>>=20
>> Is the term "virtual console" obvious?  Gerd?
>>=20
>
> I will do so.

Replace it by space, of course.

[...]


