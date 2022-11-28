Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF7663AAC5
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 15:23:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozf1v-0003kq-E1; Mon, 28 Nov 2022 09:22:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ozf1P-0003f6-G2
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 09:22:16 -0500
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ozf1N-0006kX-0k
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 09:22:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Cc:
 Content-ID:Content-Description;
 bh=BFEyzajK9lVnNSSdj2+GyXWdj2HuAuAmjI4V9IvaV6g=; b=A/vtYOSTpCDCaKEen04SawOWBF
 ebKaVsX8EbQM/N41yJeQv3MgDwE3472ZmAvGj62hDxg5Y0rBGKZBVBZMF6ht0vpDeSoWKbNqAfR3b
 C0hh6OCdelFk7KmD1QJ8Jzeoo8+79Lj9gkhBwdCoJbz0JPQ7KHoL132Ov1Kmk0Clmq4vptmUR43jt
 5+Z7KL/aK4acZu9j81XPciH5Du1Y9p5eU++LM3j4yYMo6lYDVjJ559KPMo6UGlYSsJlTnhlizeJx0
 5vNqnYV19oYRF5QR3VZkU9bYKMBQba0IaCx7x1AIuKxRCusqfCJ8U/sSOqV5Yu+84C+rTW8ZEL8ZD
 HmU2Yan7DB8fmlJhkVVUoKJUm0JZ0jn+bJOtKiEr+tvmDc5YVVsdKauuclndb50T5C+qgfgxEtppb
 HFedp7gCszh7JzdUBn6O3tWYC5DMsdm8FOny7pjbcQb85u/ruQ0zodOj0Je9uUHFfwVNQMb2F6Vm7
 f73GUw7kZk1JPfsgdDcXPYFrzcIraDljGPrZbrOMw/WGOCvmigrSeFHyOrfw9Y1tE9QoybxbJ0KON
 xfyrIapxEyDruBOEJ1s6hB3D8ZOtTaSuXf1XgGY2DwtgkmbTHYkE9uC7PUnUX5khcyFitC69HO4Sg
 wdqziKfrpJjEvzVx9ewnKAmtnVCnyQBTG5552fRHQ=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] 9pfs: Fix some return statements in the synth backend
Date: Mon, 28 Nov 2022 15:21:52 +0100
Message-ID: <2336646.SJcN5NvsQQ@silver>
In-Reply-To: <87a64bv0tz.fsf@pond.sub.org>
References: <166930551818.827792.10663674346122681963.stgit@bahia>
 <20221128103728.2001332c@bahia> <87a64bv0tz.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Monday, November 28, 2022 11:18:48 AM CET Markus Armbruster wrote:
> Greg Kurz <groug@kaod.org> writes:
> 
> > On Mon, 28 Nov 2022 08:35:22 +0100
> > Markus Armbruster <armbru@redhat.com> wrote:
> >
> >> Greg Kurz <groug@kaod.org> writes:
> >> 
> >> > The qemu_v9fs_synth_mkdir() and qemu_v9fs_synth_add_file() functions
> >> > currently return a positive errno value on failure. This causes
> >> > checkpatch.pl to spit several errors like the one below:
> >> >
> >> > ERROR: return of an errno should typically be -ve (return -EAGAIN)
> >> > #79: FILE: hw/9pfs/9p-synth.c:79:
> >> > +        return EAGAIN;
> >> >
> >> > Simply change the sign. This has no consequence since callers
> >> > assert() the returned value to be equal to 0.
> >> 
> >> Out of curiosity: why is assert() appropriate?
> >> 
> >
> > Most of the code base comes from the original synth backend which
> > was designed to expose QEMU internals to the guest using 9p. The
> > hope of the virtio-9p authors was that each QEMU subsystem would
> > create its own tree using these two functions (note that they
> > are declared extern). Of course these never happened and the synth
> > backend remained nearly dead code for years, until finally it got
> > re-used to implement 9p qtest. In this context, failure to create a
> > synthetic directory or file means the related test has a bug (e.g.
> > messing with the paths used by some other test). This code likely
> > needs improvements but we never got to it.
> 
> I was about to suggest putting this in a file comment, but then I saw
> 
>     /*
>      * Not so fast! You might want to read the 9p developer docs first:
>      * https://wiki.qemu.org/Documentation/9p
>      */
> 
> and behind the link, there's a paragraph "3. synth fs driver".
> 
> Perhaps a brief note on the use of assert() in synth_init() would still
> make sense.  Up to you.

Like what comment would you expect there?

The synth driver is a simplified hack fs driver with hard coded directories &
files, only used for 9p protocol conformance test cases.

Best regards,
Christian Schoenebeck



