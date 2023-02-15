Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7C4697D52
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 14:28:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSHq6-0004U2-1X; Wed, 15 Feb 2023 08:28:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@pond.sub.org>)
 id 1pSHq2-0004CH-NS
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 08:28:46 -0500
Received: from oxygen.pond.sub.org ([94.130.129.15])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@pond.sub.org>)
 id 1pSHq0-0001Gk-Jn
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 08:28:46 -0500
Received: from blackfin.pond.sub.org (p4fd05ca5.dip0.t-ipconnect.de
 [79.208.92.165])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by oxygen.pond.sub.org (Postfix) with ESMTPSA id B99BF24C68;
 Wed, 15 Feb 2023 14:29:18 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E0E4121E6A1F; Wed, 15 Feb 2023 14:28:34 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Bernhard Beschow <shentey@gmail.com>,  qemu-devel@nongnu.org,
 marcel.apfelbaum@gmail.com,  jonathan.cameron@huawei.com, philmd@linaro.org
Subject: Re: [PATCH v2 0/7] include/hw/pci include/hw/cxl: Clean up includes
References: <20221222100330.380143-1-armbru@redhat.com>
 <B98EF322-5449-4942-8718-D3504B863B96@gmail.com>
 <87edsremti.fsf@pond.sub.org>
 <20221222142149-mutt-send-email-mst@kernel.org>
 <87k02i7kr8.fsf@pond.sub.org>
 <20221224063930-mutt-send-email-mst@kernel.org>
Date: Wed, 15 Feb 2023 14:28:34 +0100
Message-ID: <871qmr9hx9.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=94.130.129.15; envelope-from=armbru@pond.sub.org;
 helo=oxygen.pond.sub.org
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Fri, Dec 23, 2022 at 06:27:07AM +0100, Markus Armbruster wrote:
>> "Michael S. Tsirkin" <mst@redhat.com> writes:
>> 
>> > On Thu, Dec 22, 2022 at 11:48:25AM +0100, Markus Armbruster wrote:
>> >> Bernhard Beschow <shentey@gmail.com> writes:
>> >> 
>> >> > Am 22. Dezember 2022 10:03:23 UTC schrieb Markus Armbruster <armbru@redhat.com>:
>> >> >>Back in 2016, we discussed[1] rules for headers, and these were
>> >> >>generally liked:
>> >> >>
>> >> >>1. Have a carefully curated header that's included everywhere first.  We
>> >> >>   got that already thanks to Peter: osdep.h.
>> >> >>
>> >> >>2. Headers should normally include everything they need beyond osdep.h.
>> >> >>   If exceptions are needed for some reason, they must be documented in
>> >> >>   the header.  If all that's needed from a header is typedefs, put
>> >> >>   those into qemu/typedefs.h instead of including the header.
>> >> >>
>> >> >>3. Cyclic inclusion is forbidden.
>> >> >
>> >> > Sounds like these -- useful and sane -- rules belong in QEMU's coding style. What about putting them there for easy reference?
>> >> 
>> >> Makes sense.  I'll see what I can do.  Thanks!

Commit f07ceffdf50.

>> > It would be even better if there was e.g. a make target
>> > pulling in each header and making sure it's self consistent and
>> > no circularity. We could run it e.g. in CI.
>> 
>> Yes, that would be nice, but the problem I've been unable to crack is
>> deciding whether a header is supposed to compile target-independently or
>> not.  In my manual testing, I use trial and error: if it fails to
>> compile target-independently, compile for all targets.  This is s-l-o-w.

To spice things up, we also have headers that provide additional
contents in target-dependent context.  These need to be tested in both
contexts.

> Yes and it's annoying for developers too.
> Do we want to come up with a scheme for target-dependent files?
> Name them target-X or put in a target/ directory?

I'd be in favour.  Sadly, I'm not able to push such an effort myself.

> We could also write checkpatch rules to disallow
> including target specific headers in target independent files then.

Fortunately, that's pretty unlikely to compile :)

>> The other problem, of course, is coding it up in Meson.  I haven't even
>> tried.

