Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F775FC89D
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 17:44:42 +0200 (CEST)
Received: from localhost ([::1]:49336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiduT-0008Iz-MZ
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 11:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oidsy-0006Tr-A0
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 11:43:08 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:46519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oidsv-0001wy-BD
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 11:43:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=A1p8jT666p1tRqcFdIAMa9fsNgV9zJdVyg/u0Oq9Dws=; b=drR7eE3V2cNWvmX4nRGLXwm0tu
 vO/HAj24TXb0q8Ic8WpwVWcfu2sXfMSHJW/BqWKIm/V5auoMmWaPlonV+JGJRIFjgpxVb0lgLB5cU
 y1DE5nkkE8+slWD5n84O/2A1YqU9TefWMjm+BxBrH1YGMKGuO0Foi4TC7TQSAVZnVLG4352Dr5dwI
 efSUJYeuuCL8oK2ysb76fk0oZW4aLdBSJcrVshCVbGjhtJt/NuNM8OrlomTe2bc15G1OHrAUfSD7p
 aAlqhfw1gPvJpCSgriS1bd3ngjMaanuXD/YH9VhDhdMeg3axppWSV3aa1uHAX5gLCMPHOWg0xCywC
 2fpi3hskNrx5a86N95j5GF0i5ZXt1rN3y2Ydp58ETO8d0qAN6yVKjIea8wfocQU21uFKQiTbVfkfF
 3WrO2ITBRujfn1zUkwshuVWlU9RDsA7mDnRcxOpZqFslnUJUbeIe1LMPaUUWSR7BsCbhxr1mz+vGq
 TfQghVpYmrNgLXPCdG3aS2kaWga5pANo4TBtdelhZWR33pcX7OsBp9HZvK7l2HSKp5I4/x3KNgNqR
 6BRzJXnLtCBHGdcvgicjaunEju0fK2xw2IldSM2EgpRKjvtdF5UTA33sZQXLiUXeKcmsopG/EqKtT
 yJ8gJvlcamqEBH+rN3ABZzGbOQrqDiRbbgczt0B3Q=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Nikita Ivanov <nivanov@cloudlinux.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Greg Kurz <groug@kaod.org>, Jason Wang <jasowang@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v2 2/2] error handling: Use RETRY_ON_EINTR() macro where
 applicable
Date: Wed, 12 Oct 2022 17:43:00 +0200
Message-ID: <2564015.mS1nRVYtUv@silver>
In-Reply-To: <CAEUhbmU561dwFmVCqZG7WdTUhRtfSR_wB8pa0KP2YVXwyHaZuQ@mail.gmail.com>
References: <CAAJ4Ao87Dbjc11xE9b2Mj=6VMX5J4LHJ2vt_Kn-SPEHWQ7Gu_g@mail.gmail.com>
 <CAEUhbmU561dwFmVCqZG7WdTUhRtfSR_wB8pa0KP2YVXwyHaZuQ@mail.gmail.com>
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mittwoch, 12. Oktober 2022 17:17:46 CEST Bin Meng wrote:
> Hi,
> 
> On Wed, Oct 12, 2022 at 8:32 PM Nikita Ivanov <nivanov@cloudlinux.com> wrote:
> > There is a defined RETRY_ON_EINTR() macro in qemu/osdep.h which
> > handles the same while loop.
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/415
> > 
> > Signed-off-by: Nikita Ivanov <nivanov@cloudlinux.com>
> > ---
> > 
> >  block/file-posix.c        | 37 ++++++++++++++++---------------------
> >  chardev/char-pty.c        |  4 +---
> >  hw/9pfs/9p-local.c        |  8 ++------
> >  net/l2tpv3.c              | 17 +++++------------
> >  net/socket.c              | 16 +++++++---------
> >  net/tap.c                 | 12 ++++--------
> >  qga/commands-posix.c      |  4 +---
> >  semihosting/syscalls.c    |  4 +---
> >  tests/qtest/libqtest.c    | 14 ++++++--------
> >  tests/vhost-user-bridge.c |  4 +---
> >  util/main-loop.c          |  4 +---
> >  util/osdep.c              |  4 +---
> >  util/vfio-helpers.c       | 12 ++++++------
> >  13 files changed, 52 insertions(+), 88 deletions(-)
> 
> This patch has to be squashed into patch 1 for bisectability, as TFR
> is already removed in patch 1.

They are intentionally separated: 1st patch replaces occurrences of TFR,
whereas 2nd patch introduces use of macro at locations where not used yet.

Nikita, could you please move those 2 hunks that still had TFR() occurrence to
patch 1?

And please use git's --thread option next time, so that individual patch 
emails are linked to cover letter email (which adds appropriate `References:`
and `In-Reply-To:` email headers).

Best regards,
Christian Schoenebeck



