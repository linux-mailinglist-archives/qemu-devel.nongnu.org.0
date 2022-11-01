Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8193161505B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:16:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ops5m-0000vw-Dq; Tue, 01 Nov 2022 10:18:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ops5i-0000tv-Bd
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 10:18:10 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ops5U-0003ud-1E
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 10:17:57 -0400
Received: by mail-pl1-x635.google.com with SMTP id io19so13676196plb.8
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 07:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=FZkh/rJDOFzCkqLcz6ps5nW5qPNujex0FLEknQGQU/Q=;
 b=teSRH6MCZLT1ZvYioqJIigKZ4PE5HQWfVO9bfei+p3nPexXLBVcfz3yf88DYEtyl35
 v7GA3Fcg1dr/giTKlAnbCpmRt/elmWc7Of4hJDhNIVhe16AYKUUXFrR6SvnOhhuS8/5O
 /rdqkYzsBNkufXClpuBNrkkTh9bA9xkyTfulsq6V2/aDTwdnS/nSHqTJ5oewsOIyYPv3
 rm4t0gCf52whnj2lHC+bP7sPrwfhY1xfl/N26waj16KTa7gOOcLQ0MPUmT1swoGUP0gQ
 jDUL791x/e3SNXPlxBzuGMk3Pir5OdVU7kBtARVm03MkERQa0YcQWoiQRiE+tX+I+A2a
 iYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FZkh/rJDOFzCkqLcz6ps5nW5qPNujex0FLEknQGQU/Q=;
 b=u9qdwJkK9iby/RLBPbwdCANsH3X4ZXJpefvFKlS4qH3tJYn09SYZGoFVdYJqeDxliV
 iTclPv6vpaJp2UmtAMKMUllgWLnAcKz5qBnR7/ByvXik8qD5BqV6Ni+qWCHur2BF41z0
 hL3H6bMZ70fuknApj5S2R8Vgk90FOc93e/sky4gyQod24KNSrBjF1scomZUjb3Sxk6cP
 9906pjAvNz/01bdDD8iBc8gcwx9TP18eRYCnQ2Ou8omz0oCyBjN6YjslqRbZxhq/ud+P
 CFFKYb6VRwm1zi7GOsV1XsgyvF0got3w03ecNNg7pT9nFHfq9bZoW079KkmtGggUCXwv
 zhHQ==
X-Gm-Message-State: ACrzQf28DjLBYqDxMsi9vHOl7Og/bMTmOa8Wv9oOO6YUOS1zumjVhbCm
 pOfM7zRRYJLiRDlZ5M6eMt7P9+/a/6Op2viT82XsmENxvcrLxg==
X-Google-Smtp-Source: AMsMyM5+tx3dP9YerBtY4t09hl7yqnWp9w24ta/L+doZRhX9yq72RxvdwrdenFYcXHVTYQn6v2+f/5XVcVil+AKnlOY=
X-Received: by 2002:a17:90b:4b81:b0:213:341d:3ea6 with SMTP id
 lr1-20020a17090b4b8100b00213341d3ea6mr20433478pjb.19.1667312273698; Tue, 01
 Nov 2022 07:17:53 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Nov 2022 14:17:42 +0000
Message-ID: <CAFEAcA9tnOCij+OKV8Mpe37g9i5Sd4oYVTA4642SAY9MfCBLLg@mail.gmail.com>
Subject: UI layer threading and locking strategy;
 memory_region_snapshot_and_clear_dirty() races
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi; I'm trying to find out what the UI layer's threading and
locking strategy is, at least as far as it applies to display
device models.

Specifically:
 * is the device's GraphicHwOps::gfx_update method always called
   from one specific thread, or might it be called from any thread?
 * is that method called with any locks guaranteed held? (eg the
   iothread lock)
 * is the caller of the gfx_update method OK if an implementation
   of the method drops the iothread lock temporarily while it is
   executing? (my guess would be "no")
 * for a gfx_update_async = true device, what are the requirements
   on calling graphic_hw_update_done()? Does the caller need to hold
   any particular lock? Does the call need to be done from any
   particular thread?

The background to this is that I'm looking again at the race
condition involving the memory_region_snapshot_and_clear_dirty()
function, as described here:
 https://lore.kernel.org/qemu-devel/CAFEAcA9odnPo2LPip295Uztri7JfoVnQbkJ=Wn+k8dQneB_ynQ@mail.gmail.com/T/#u

Having worked through what is going on, as far as I can see:
 (1) in order to be sure that we have the right data to match
 the snapshotted dirty bitmap state, we must wait for all TCG
 vCPUs to leave their current TB
 (2) a vCPU might block waiting for the iothread lock mid-TB
 (3) therefore we cannot wait for the TCG vCPUs without dropping
 the iothread lock one way or another
 (4) but none of the callers expect that and various things break

My tentative idea for a fix is a bit of an upheaval:
 * have the display devices set gfx_update_async = true
 * instead of doing everything synchronously in their gfx_update
   method, they do the initial setup and call an 'async' version
   of memory_region_snapshot_and_clear_dirty()
 * that async version of the function will do what it does today,
   but without trying to wait for TCG vCPUs
 * instead the caller arranges (via call_rcu(), probably) a
   callback that will happen once all the TCG CPUs have finished
   executing their current TB
 * that callback does the actual copy-from-guest-ram-to-display
   and then calls graphic_hw_update_done()

This seems like an awful pain in the neck but I couldn't see
anything better :-(

Paolo: what (if any) guarantee does call_rcu() make about
which thread the callback function gets executed on, and what
locks are/are not held when it's called?

(I haven't looked at the migration code's use of
memory_global_after_dirty_log_sync() but I suspect it's
similarly broken.)

thanks
-- PMM

