Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F873E06A2
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 19:18:58 +0200 (CEST)
Received: from localhost ([::1]:47114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBKXf-0001yk-KS
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 13:18:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mBIEu-00015u-5E
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:51:24 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:40740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mBIEs-0002X7-I7
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:51:23 -0400
Received: by mail-ed1-x52e.google.com with SMTP id d6so3869962edt.7
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 07:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=dbvuMaCOyOv9D2vFS7OxhUkuUeLmYuDWxIJqHtUpWRI=;
 b=UlXYubxsACzw8sSx1duM3YUGX7fgX9JiHbciw8oAbvJpNg2Lh7ov+ZpHgbXPwYsKNt
 BYaC4YUJOZm+qv9XmjrcpkTf4BnU0QmWDsmG0O11MjJDN6lfphPmDHeQFGzDRgCD4il7
 YjsfCibEemvy+B1W9eql2vB7znl+GaAltUZ49H3h1LTpqDZA9r/LcsIOrfUKKuKODWD7
 /hOqwhyTjRhnQcouI6PsmXLEOyQgi/e9NMj7a9I8ddToncr/1Uo8C4cvc0N5h+Yxrav7
 FzPQLXGAe2QACAUNGscjcBHOPRAFOd6BYO6FPPikhJ/FoLKTwLRgL28467/tKP9mGO+F
 XckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=dbvuMaCOyOv9D2vFS7OxhUkuUeLmYuDWxIJqHtUpWRI=;
 b=CWWcFxJedrB1q8Y9itv7Tahmifd87R5HxtcRJ2NYPeE3U58J73+1Jr6nsERFOgxR1Q
 wYwpqhK0t0imSdLp/ghSMF0Kl7NqFmz1q/Ev+ndMJEbxw+U9KALJDtXoYtfuNdSN/syd
 a2xvcE85959RsYsFiBDXQfOywm+j7hmm7rZkMiDOEFYeWQLv0q6zGqWE4UujOLOk2NqB
 NBcEW1LNuyjn6vAfd4aDJOZp9wtyxZscL37//TYjptCdmJ/dCOVvpT8880U5wyukhvgL
 igDg3Y+ahyaUV74CqYWX2rTWqEl+4kJcWUusjyQMgordhbDjkJGRPEiO0klFFnVP8a4w
 HR+Q==
X-Gm-Message-State: AOAM532+4R4/XvjdHYZHmK85W8cT2Zk6Vuuys31kqPg8N4qMqWg3sfZe
 fuNEeFg+akSi86Gi802W1Vz73IZpEZdBluZd0pfIvGHMfrQ04g==
X-Google-Smtp-Source: ABdhPJyDOVwzj81uvn5ENnZO05flqy13n8ng5Q1O129A2Ahxl3G8BAaWO06XvQ2dI9QaOL6HsCE9opk7hXAymdkwBC4=
X-Received: by 2002:a50:f615:: with SMTP id c21mr144213edn.146.1628088680593; 
 Wed, 04 Aug 2021 07:51:20 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 Aug 2021 15:50:37 +0100
Message-ID: <CAFEAcA8cWrxWWgzzYAYWZRoL6XithZUO=OJ9L1V_wevHScN0FA@mail.gmail.com>
Subject: improving logging of hanging tests in CI
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some of our tests in 'make check' hang intermittently. At the moment
we have a path to diagnosing these when they happen via my ad-hoc CI
scripts: I can log into the relevant machine and manually look at
what has hung, attach gdb, etc. However, for the gitlab CI this
doesn't work.

Is it possible to stick something into the 'make check' framework
that does something like this:
 * for each test run, if it hasn't exited after 5 minutes,
   assume it has hung
 * in that case, print "ERROR: test $WHATEVER hung" to stdout
 * run something like the below script to capture backtraces
   (which is just something I threw together this afternoon and
   could probably be improved)
 * kill the offending subtree of processes
 * make sure 'make' exits with an error

We'd need to make sure that the CI stuff had 'gdb' installed
(and that the CI machine config lets gdb attach to processes
by PID, which we can for our own runners even if the gitlab
stock setup forbids it.)

The idea is to at least get a backtrace of a hung test into the
logs, so we have some idea of what happened.

===backtrace-process-tree===
#!/bin/bash -e
# backtrace-process-tree: print a thread backtrace of specified
# process and all its descendants.
# Copyright 2021 Linaro
# License GPL-v2-or-later

if [ $# != 1 ]; then
    echo "Usage: backtrace-process-id PID"
    exit 1
fi

TOPPID="$1"

if [ ! -e "/proc/$TOPPID" ]; then
    echo "$TOPPID not a PID of a running process?"
    exit 1
fi

bt_me_and_children() {
  ME="$1"
  echo "==========================================================="
  echo "PROCESS: $ME"
  ps -ww -f -p "$ME" | tail -1
  gdb --nx --batch -ex 'thread apply all bt' /proc/"$ME"/exe "$ME"
  echo

  for child in $(pgrep -P "$ME"); do
      bt_me_and_children $child
  done
}

echo "Process tree:"
pstree -pT "$TOPPID"

bt_me_and_children "$TOPPID"
===endit===

-- PMM

