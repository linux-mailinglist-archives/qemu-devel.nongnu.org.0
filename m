Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E963C5FA180
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 17:59:49 +0200 (CEST)
Received: from localhost ([::1]:37872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohvC0-00072I-RV
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 11:59:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=YJjh=2L=zx2c4.com=Jason@kernel.org>)
 id 1ohv3K-00039z-Tf
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 11:50:54 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:34418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=YJjh=2L=zx2c4.com=Jason@kernel.org>)
 id 1ohv3I-0002Oq-Nd
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 11:50:50 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6DC6B60F63;
 Mon, 10 Oct 2022 15:50:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DD44C433D6;
 Mon, 10 Oct 2022 15:50:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="HXB6lN8Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1665417044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MrkDJrxLCIPjXM0litkpjK2g8e/qjUnM1RMvBK+nqWM=;
 b=HXB6lN8QYrVr5NIY6sd2IbycJKR5rVViVPfbxEXAf4FVhInMfqxIrnBl3CcjNnEZco0Mif
 P+pKKmrHYzp1W71oSFRWLaWmcVTUOaTCaUJK6EybdTP/ueDlDPSDpMVxpxIY8kvQjkPoT/
 657UQ6A7h7aBhUazQgfOlFLeoM9Rpmk=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bdfd40e4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 10 Oct 2022 15:50:44 +0000 (UTC)
Date: Mon, 10 Oct 2022 09:50:41 -0600
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 1/6] device-tree: add re-randomization helper function
Message-ID: <Y0Q/Ubc+kVEsuE9L@zx2c4.com>
References: <20220929232339.372813-1-Jason@zx2c4.com>
 <CAFEAcA-Ac-=i_DK5MUtKtTqH7OpyzHAi6u=tHFAFZyvdr1KP8A@mail.gmail.com>
 <CAFEAcA-fOdNeDz9_Hbm7R3_3o2T4Zw8wPrgOtVLK9tUNMciZow@mail.gmail.com>
 <Y0Q4Vugq+d0vaF97@zx2c4.com>
 <CAFEAcA9h05S=MmUgKWA2cg9H8Rn7aiRrSDBJAO8yTyFvC7FQ2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA9h05S=MmUgKWA2cg9H8Rn7aiRrSDBJAO8yTyFvC7FQ2w@mail.gmail.com>
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=YJjh=2L=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

On Mon, Oct 10, 2022 at 04:32:45PM +0100, Peter Maydell wrote:
> On Mon, 10 Oct 2022 at 16:21, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > On Mon, Oct 10, 2022 at 11:54:50AM +0100, Peter Maydell wrote:
> > > The error is essentially the record-and-replay subsystem saying "the
> > > replay just asked for a random number at point when the recording
> > > did not ask for one, and so there's no 'this is what the number was'
> > > info in the record".
> > >
> > > I have had a quick look, and I think the reason for this is that
> > > load_snapshot() ("reset the VM state to the snapshot state stored in the
> > > disk image or migration stream") does a system reset. The replay
> > > process involves a lot of "load state from a snapshot and play
> > > forwards from there" operations. It doesn't expect that load_snapshot()
> > > would result in something reading random data, but now that we are
> > > calling qemu_guest_getrandom() in a reset hook, that happens.
> >
> > Hmm... so this seems like a bug in the replay code then? Shouldn't that
> > reset handler get hit during both passes, so the entry should be in
> > each?
> 
> No, because record is just
> "reset the system, record all the way to the end stop",
> but replay is
> "set the system to the point we want to start at by using
> load_snapshot, play from there", and depending on the actions
> you do in the debugger like reverse-continue we might repeatedly
> do "reload that snapshot (implying a system reset) and play from there"
> multiple times.

Hmm. I started typing, "I really have no idea how to fix that except for
hacky ways" but then by the time I got to the end of that sentence, I
had an idea. Still maybe ugly and hacky, but maybe something akin to the
diff below?

Either way, as you mentioned in your initial email, it sounds like this
might need some involvement from the replay people. What's the best way
for us to work together on this? You mentioned you removed it from your
fixes branch, but do you think you could post it in another branch and
link to it, so that the replay maintainers have something tangible to
play with?

Jason

diff --git a/include/sysemu/replay.h b/include/sysemu/replay.h
index 7ec0882b50..73e2c1ae54 100644
--- a/include/sysemu/replay.h
+++ b/include/sysemu/replay.h
@@ -46,6 +46,7 @@ typedef enum ReplayCheckpoint ReplayCheckpoint;
 typedef struct ReplayNetState ReplayNetState;

 extern ReplayMode replay_mode;
+extern bool replay_loading;

 /* Name of the initial VM snapshot */
 extern char *replay_snapshot;
diff --git a/migration/savevm.c b/migration/savevm.c
index 48e85c052c..97199a2506 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -3037,6 +3037,8 @@ bool load_snapshot(const char *name, const char *vmstate,
         return false;
     }

+    replay_loading = true;
+
     /*
      * Flush the record/replay queue. Now the VM state is going
      * to change. Therefore we don't need to preserve its consistency
@@ -3071,6 +3073,7 @@ bool load_snapshot(const char *name, const char *vmstate,
     aio_context_release(aio_context);

     bdrv_drain_all_end();
+    replay_loading = false;

     if (ret < 0) {
         error_setg(errp, "Error %d while loading VM state", ret);
@@ -3081,6 +3084,7 @@ bool load_snapshot(const char *name, const char *vmstate,

 err_drain:
     bdrv_drain_all_end();
+    replay_loading = false;
     return false;
 }

diff --git a/replay/replay.c b/replay/replay.c
index 9a0dc1cf44..16e16e274b 100644
--- a/replay/replay.c
+++ b/replay/replay.c
@@ -26,6 +26,7 @@
 /* Size of replay log header */
 #define HEADER_SIZE                 (sizeof(uint32_t) + sizeof(uint64_t))

+bool replay_loading;
 ReplayMode replay_mode = REPLAY_MODE_NONE;
 char *replay_snapshot;

diff --git a/stubs/replay.c b/stubs/replay.c
index 9d5b4be339..b9d296a203 100644
--- a/stubs/replay.c
+++ b/stubs/replay.c
@@ -2,6 +2,7 @@
 #include "sysemu/replay.h"

 ReplayMode replay_mode;
+bool replay_loading;

 void replay_finish(void)
 {
diff --git a/util/guest-random.c b/util/guest-random.c
index 23643f86cc..7f847533d1 100644
--- a/util/guest-random.c
+++ b/util/guest-random.c
@@ -46,7 +46,7 @@ static int glib_random_bytes(void *buf, size_t len)
 int qemu_guest_getrandom(void *buf, size_t len, Error **errp)
 {
     int ret;
-    if (replay_mode == REPLAY_MODE_PLAY) {
+    if (replay_mode == REPLAY_MODE_PLAY && !replay_loading) {
         return replay_read_random(buf, len);
     }
     if (unlikely(deterministic)) {


