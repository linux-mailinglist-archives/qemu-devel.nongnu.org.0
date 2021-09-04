Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FBA4009DE
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 07:43:22 +0200 (CEST)
Received: from localhost ([::1]:52868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMOSY-00056k-1F
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 01:43:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mMOQX-0003nK-JL
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 01:41:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mMOQT-0004XG-Sa
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 01:41:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630734072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ac4IZznXIIekHXyKDyfeq0raxaGzSOJKAI/SPx1u11s=;
 b=IDBZZ9Em8AE/QwNQbs1TFIwTFZ8uoy3TKiYBxm6/ULB6NuovX/bXzuDhKUEvQOBLUd0cLh
 UUPS5QyVeda182HLmu0c3m/Ihb216It4zHeYGQ6jUekPyoK81dFbDh9rgfsLfZdISsQBUc
 gl+sNApLcr/vZEq4Pr3JqH6Wu3F4cEQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-PfMgkH46PamlrxMPoBbwcg-1; Sat, 04 Sep 2021 01:41:10 -0400
X-MC-Unique: PfMgkH46PamlrxMPoBbwcg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42160107ACE4;
 Sat,  4 Sep 2021 05:41:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 84A4E19D9D;
 Sat,  4 Sep 2021 05:41:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 11E8D1138606; Sat,  4 Sep 2021 07:41:04 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [RFC PATCH v2 12/12] i386/sev: update query-sev QAPI format to
 handle SEV-SNP
References: <20210826222627.3556-1-michael.roth@amd.com>
 <20210826222627.3556-13-michael.roth@amd.com>
 <87tuj4qt71.fsf@dusky.pond.sub.org> <YTJGzrnqO9vzUqNq@redhat.com>
Date: Sat, 04 Sep 2021 07:41:04 +0200
In-Reply-To: <YTJGzrnqO9vzUqNq@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Fri, 3 Sep 2021 17:01:18 +0100")
Message-ID: <87zgssrj7z.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, Michael Roth <michael.roth@amd.com>,
 James Bottomley <jejb@linux.ibm.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Wed, Sep 01, 2021 at 04:14:10PM +0200, Markus Armbruster wrote:
>> Michael Roth <michael.roth@amd.com> writes:
>>=20
>> > Most of the current 'query-sev' command is relevant to both legacy
>> > SEV/SEV-ES guests and SEV-SNP guests, with 2 exceptions:
>> >
>> >   - 'policy' is a 64-bit field for SEV-SNP, not 32-bit, and
>> >     the meaning of the bit positions has changed
>> >   - 'handle' is not relevant to SEV-SNP
>> >
>> > To address this, this patch adds a new 'sev-type' field that can be
>> > used as a discriminator to select between SEV and SEV-SNP-specific
>> > fields/formats without breaking compatibility for existing management
>> > tools (so long as management tools that add support for launching
>> > SEV-SNP guest update their handling of query-sev appropriately).
>>=20
>> Technically a compatibility break: query-sev can now return an object
>> that whose member @policy has different meaning, and also lacks @handle.
>>=20
>> Matrix:
>>=20
>>                             Old mgmt app    New mgmt app
>>     Old QEMU, SEV/SEV-ES       good            good(1)
>>     New QEMU, SEV/SEV-ES       good(2)         good
>>     New QEMU, SEV-SNP           bad(3)         good
>>=20
>> Notes:
>>=20
>> (1) As long as the management application can cope with absent member
>> @sev-type.
>>=20
>> (2) As long as the management application ignores unknown member
>> @sev-type.
>>=20
>> (3) Management application may choke on missing member @handle, or
>> worse, misinterpret member @policy.  Can only happen when something
>> other than the management application created the SEV-SNP guest (or the
>> user somehow made the management application create one even though it
>> doesn't know how, say with CLI option passthrough, but that's always
>> fragile, and I wouldn't worry about it here).
>>=20
>> I think (1) and (2) are reasonable.  (3) is an issue for management
>> applications that support attaching to existing guests.  Thoughts?
>
> IIUC you can only reach scenario (3) if you have created a guest
> using '-object sev-snp-guest', which is a new feature introduced
> in patch 2.
>
> IOW, scenario (3)  old mgmt app + new QEMU + sev-snp guest does
> not exist as a combination. Thus the (bad) field is actually (n/a)
>
> So I believe this proposed change is acceptable in all scenarios
> with existing deployed usage, as well as all newly introduced
> scenarios.

Let's work this into the commit message.


