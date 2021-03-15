Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C25F633B86A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 15:05:27 +0100 (CET)
Received: from localhost ([::1]:54286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLnqY-0004gj-Hk
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 10:05:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lLnoh-0003fc-D1
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 10:03:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lLnod-0000Q4-2z
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 10:03:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615817005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lRf8XzMcvTv4IfAA36MHtpvxbR/5/JRs6LlVBeH3aDM=;
 b=a2XBeOU4KNEInGxQsnXIO6HUxGEHiUy/LJedNrUbrqjCrE3/s+xdfq5Zfo44+hpv1tMiDA
 QgK8CXJFsKtFzW9Y4h+CQbAbNQAM/wALxgNYhPIDm0WhkpGjmcLn9gx15jwwh0rMLzdYGE
 hvz7WwDsbiwJcK9GRJrMfzhm42p950k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-rvMwSjcsOV2G_ryLUZJjBw-1; Mon, 15 Mar 2021 10:03:21 -0400
X-MC-Unique: rvMwSjcsOV2G_ryLUZJjBw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 907C4804B6C;
 Mon, 15 Mar 2021 14:03:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 370775D9D3;
 Mon, 15 Mar 2021 14:03:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9D68D1132C12; Mon, 15 Mar 2021 15:03:18 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Phillip Tennen <phillip.ennen@gmail.com>
Subject: Re: [PATCH v2] net/macos: implement vmnet-based network device
References: <20210205164106.6664-1-phillip.ennen@gmail.com>
 <87o8g1j0ee.fsf@dusky.pond.sub.org>
 <CAAi_9z4YObJkHxvxS-KVc2W+riGnsQzdA29QnyhVnKTGJnbybQ@mail.gmail.com>
Date: Mon, 15 Mar 2021 15:03:18 +0100
In-Reply-To: <CAAi_9z4YObJkHxvxS-KVc2W+riGnsQzdA29QnyhVnKTGJnbybQ@mail.gmail.com>
 (Phillip Tennen's message of "Fri, 12 Mar 2021 15:23:25 +0100")
Message-ID: <877dm8h5uh.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, jasowang@redhat.com,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>,
 Phillip Tennen <phillip@axleos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Phillip Tennen <phillip.ennen@gmail.com> writes:

> Markus, thanks for the review. I apologize for my lateness in getting bac=
k
> to you.
>
> I've integrated most of your suggestions, and will submit a v5 that
> incorporates them. I've left a couple comments and questions for you belo=
w.
>
> Aside: I haven't responded inline to emails like this before, I'm hoping =
it
> shows
> up correctly for you! I appreciate how understanding everyone's been
> towards my
> newness to this development & review format. I cut out the irrelevant bit=
s
> for brevity and am unsure if that breaks anything.

We *try* not to be jerks ;)

Your reply looks fine to me.

> Phillip
>
> On Tue, Mar 2, 2021 at 11:49 AM Markus Armbruster <armbru@redhat.com> wro=
te:
>
>> Phillip, this doesn't apply anymore.  I'm reviewing the QAPI schema part
>> anyway.
>>
>> Peter, there is a question for you below.  Search for "Sphinx".
>>
>> phillip.ennen@gmail.com writes:
>>
>> > From: Phillip Tennen <phillip@axleos.com>
>> >
>> > This patch implements a new netdev device, reachable via -netdev
>> > vmnet-macos, that=E2=80=99s backed by macOS=E2=80=99s vmnet framework.
>> >
>>
> [...]
>
>> > diff --git a/qapi/net.json b/qapi/net.json
>> > index c31748c87f..e4d4143243 100644
>> > --- a/qapi/net.json
>> > +++ b/qapi/net.json
>> > @@ -450,6 +450,115 @@
>> >      '*vhostdev':     'str',
>> >      '*queues':       'int' } }
>> >
>> > +##
>> > +# @VmnetOperatingMode:
>> > +#
>> > +# The operating modes in which a vmnet netdev can run
>> > +# Only available on macOS
>>
>> Please end these sentences with a period.
>>
>> I'm not sure we need "Only available on macOS".  Rendered documentation
>> shows the 'if' like
>>
>> [...]
>
>> > +#                      (only valid with mode=3Dhost|shared)
>>
>> Isn't that trivial?  The type's only use is as union branch for modes
>> host and shared.
>>
> True. I added comments like this for clarity, but I accept that the schem=
a
> should make it clear alone.

Clarity is in the eye of the beholder.  We try to find the sweet spot
between bafflingly terse and tiresomely verbose.


>> > +#                      (must be specified with dhcp-end-address and
>> > +#                       dhcp-subnet-mask)
>>
>> Does that mean you have to specify all three parameters or none?
>>
> That's correct. You may provide either none or all three.

In bridged mode, none.

In host or shared mode, either all three or none.

Correct?

> [...]
>
>> > +#                      (allocated automatically if unset)
>>
>> How?
>>
> vmnet automatically allocates specifics like the MAC address, DHCP pool,
> etc,
> if not explicitly supplied. I'll add some wording to this effect.
> [...]
>
>>
>> > +#
>> > +# Since: 6.0
>> > +##
>> > +{ 'struct': 'NetdevVmnetOptions',
>> > +  'data': {'options': 'NetdevVmnetModeOptions' },
>> > +  'if': 'defined(CONFIG_DARWIN)' }
>> > +
>>
>> Awkward.
>>
>> You can't use make NetdevVmnetModeOptions a branch of union Netdev,
>> because NetdevVmnetModeOptions is a union, and a branch must be a
>> struct.  To work around, you wrap struct NetdevVmnetOptions around union
>> NetdevVmnetModeOptions.
>>
>> NetdevVmnetModeOptions has no common members other than the union
>> discriminator.  Why not add them as three branches to Netdev?
>
> Just to be sure I understand, you're proposing adding 3 new fields to
> Netdev,
> like so:
>     'vmnet-macos-bridged': { 'type': 'NetdevVmnetModeOptionsBridged',
>                      'if': 'defined(CONFIG_DARWIN)' },
>     'vmnet-macos-host': { 'type': 'NetdevVmnetModeOptionsHostOrShared',
>                      'if': 'defined(CONFIG_DARWIN)' },
>     'vmnet-macos-shared': { 'type': 'NetdevVmnetModeOptionsHostOrShared',
>                      'if': 'defined(CONFIG_DARWIN)' },
> ... where each of those "ModeOptions" structs contains a new "mode" field
> extracted from the union. Did I get your intent right? I'm assuming there
> wouldn't be issues with "vmnet-macos" referenced elsewhere.

Yes, except you don't need a @mode member, you can derive the mode from
Netdev member @type.

Clear now?


