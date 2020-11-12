Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADB92AFFF2
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 07:57:43 +0100 (CET)
Received: from localhost ([::1]:48546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kd6Y9-0001NW-Nr
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 01:57:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kd6WI-0008Nm-0k
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 01:55:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kd6WE-0006cZ-A7
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 01:55:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605164139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nhhZw3vvckaICZaIt67vbc328AUKNugGLNLXi5a+rIo=;
 b=UlkAGakP1tqAFSB/GkKwxE0FWk5+o81tEwByGUvD1+Xjz02s1hzfheob80vNHUNC34VqdY
 U7mLfVXx+HFMVAtzHyPbkqSm3YljCsvp0+Tg/rCGaik84/Cq6Y6e9XVl2Q4OI9xIoABscs
 QCmTGuCQYyidC2zlvhbwM0CZrL5pdmU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-_UrgP9E8Mk2IMqckAnuGpQ-1; Thu, 12 Nov 2020 01:55:37 -0500
X-MC-Unique: _UrgP9E8Mk2IMqckAnuGpQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 429411017DCC
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 06:55:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE2FE5C22D;
 Thu, 12 Nov 2020 06:55:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4C0BE11386A0; Thu, 12 Nov 2020 07:55:34 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] vl, qemu-config: remove -set
References: <20201111135716.1209421-1-pbonzini@redhat.com>
 <20201111150336.GF906488@redhat.com>
 <a210eaa2-6d2c-0d7c-d7e3-96c73acaf6b0@redhat.com>
Date: Thu, 12 Nov 2020 07:55:34 +0100
In-Reply-To: <a210eaa2-6d2c-0d7c-d7e3-96c73acaf6b0@redhat.com> (Paolo
 Bonzini's message of "Wed, 11 Nov 2020 16:48:49 +0100")
Message-ID: <87blg3kqs9.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:51:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 11/11/20 16:03, Daniel P. Berrang=C3=A9 wrote:
>> On Wed, Nov 11, 2020 at 08:57:16AM -0500, Paolo Bonzini wrote:
>>> -set as far as I can see has basically no use.  It was intended as an o=
verride
>>> mechanism for configuration files, but even configuration files themsel=
ves
>>> are hardly used.  Drop it with prejudice.
>>>=20
>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>> ---
>>>  docs/system/deprecated.rst |  6 ++++++
>>>  include/qemu/config-file.h |  1 -
>>>  qemu-options.hx            |  9 ---------
>>>  softmmu/vl.c               |  4 ----
>>>  util/qemu-config.c         | 33 ---------------------------------
>>>  5 files changed, 6 insertions(+), 47 deletions(-)
>>
>> iotest 068 uses -set and qtest vhost-user-text.c also does
>> IOW, it looks like it is valid to use -set, even if you're not using
>> -readconfig.

Of course that's valid.

>> Libvirt doesn't use -set, but we've had users who make use of
>> libvirt
>> command line passthrough for QEMU with -set.
>
> Hmm, indeed:
>
> https://patchwork.kernel.org/project/qemu-devel/patch/20181218041625.2496=
9-16-mst@redhat.com/

Such monkey-patching may not be wise, but unwise !=3D invalid.

>> IOW, I'm not convinced real world usage is near zero as suggested.

Guessing the gamut of usage out there in the real world correctly is
always a tall order :)

> Yes, perhaps it's not. :)  Though for both tests you pointed out it's
> even cleaner not to use it, there seems to be real world usage at
> least with "device".

I have common test configurations files for -readconfig.  I've used -set
for quick monkey-patching once in a great while.  Now, such ad hoc use
is a *weak* argument against ditching the feature.  But it does
undermine the "basically no use" proposition.

> It is probably more viable to deprecate or even forbid usage of "-set"
> with anything but "device".  vhost-user-test.c would still be
> affected, but it's a relatively small patch.

Deprecating only some uses buys us next to nothing, I think.  If we want
to deprecate it, just deprecate it.

Immediate removal of -set / rejection of -set for some option groups
needs more justification than just "I think we can get away with it":
there has to be a tangible benefit.  What would immediate removal buy us
over the orthodox "deprecate, wait for grace period to expire, remove"?


