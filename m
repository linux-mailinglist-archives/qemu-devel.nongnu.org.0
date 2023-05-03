Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2386F6044
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 22:41:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puJGY-0007gA-Nt; Wed, 03 May 2023 16:39:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1puJGV-0007fZ-T7
 for qemu-devel@nongnu.org; Wed, 03 May 2023 16:39:55 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1puJGU-0005sB-5i
 for qemu-devel@nongnu.org; Wed, 03 May 2023 16:39:55 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2719022CC8;
 Wed,  3 May 2023 20:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683146392; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CW5N2sb6QQGge4NAB+23cfup6DYQS1lI0L5825RZaGw=;
 b=NL4pSfPRi7MkPAjitmiKdggsA3SjmV89HZnapxiosHYvvjN9GTCgK1HbgddrT+07A+iHFP
 ygIxEYtcBU1dZIFXaJfTZ0JNBC+kqeAOrptOt36X5EDd9lpLJNaBWlJ3GNKB2YuFiFvd9z
 hcGPe2zoR+fcqxQVCbbx7ChKoBBQFj4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683146392;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CW5N2sb6QQGge4NAB+23cfup6DYQS1lI0L5825RZaGw=;
 b=63L1mASd0yxgUgVqQ5ukeBbw+EGGli3WizfjBWpePgGrttkfmFhjMGdxLedti9VCbXhBml
 2D1O++H5gZuACTAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 59FF913584;
 Wed,  3 May 2023 20:39:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eebKB5bGUmRofAAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 03 May 2023 20:39:50 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v4 0/2] docs: Speedup docs build
Date: Wed,  3 May 2023 17:39:45 -0300
Message-Id: <20230503203947.3417-1-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We currently have two documentation targets to build:
- 'man' for the man pages;
- 'html' for the web page.

There are two bottlenecks in the process:

1) sphinx runs with a single process;
2) the two targets are serialized.

For (1), we can just add the "-j auto" to sphinx_build and that should
bring some speed gains.

For (2) it's a little trickier because the reason the builds are
serialized is that Sphinx keeps track of changed files, but we still
need a way to tell meson whether a target needs to re-execute, so we
added dependency tracking and timestamp checking for (only) the 'html'
build via the depfile.py extension. Since the sources for both builds
are the same, we made the 'man' build dependent on 'html' so that it
would rebuild when needed.

So patch 1 adds the -j option to Sphinx and patch 2 adds depfile
support to the 'man' build. We can now run the two in parallel (ninja
will take care of that).

On my 16 core machine,
the -j change saves about 20s
the depfile change saves about 10s

===
On master:
 $ ../configure --enable-docs ...
 $ time make -j$(nproc) html man
   GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 dtc
 /usr/bin/ninja  build.ninja && touch build.ninja.stamp
 ninja: no work to do.
 /usr/bin/python3 -B .../qemu/meson/meson.py introspect --targets --tests --benchmarks | /usr/bin/python3 -B scripts/mtest2make.py > Makefile.mtest
   GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 dtc
 [1/2] Generating docs/QEMU manual with a custom command
 [2/2] Generating docs/QEMU man pages with a custom command
 make: Nothing to be done for 'man'.

 real    0m50.155s
 user    0m49.759s
 sys     0m0.761s

 $ mv docs ../saved-docs

This series:
 $ ../configure --enable-docs ...
 $ time make -j$(nproc) html man
   GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 dtc
 /usr/bin/ninja  build.ninja && touch build.ninja.stamp
 ninja: no work to do.
 /usr/bin/python3 -B .../qemu/meson/meson.py introspect --targets --tests --benchmarks | /usr/bin/python3 -B scripts/mtest2make.py > Makefile.mtest
   GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 dtc
 [1/2] Generating docs/QEMU man pages with a custom command
 [2/2] Generating docs/QEMU manual with a custom command
 make: Nothing to be done for 'man'.

 real    0m21.708s
 user    1m12.317s
 sys     0m2.056s

Diff sanity check:
 $ diff -rq docs/ ../saved-docs/
 Only in ../saved-docs/: docs.d      # now manual.dep
 Only in ../saved-docs/: docs.stamp  # now manual.stamp
 Only in docs/: man.dep
 Only in docs/: man.p
 Only in docs/: man.stamp
 Only in docs/: manual.dep
 Only in docs/: manual.stamp
 Files docs/manual.p/about/build-platforms.doctree and ../saved-docs/manual.p/about/build-platforms.doctree differ
 ...  # sphinx cache files, a bunch of these^

Rebuilding (here I show that a man file and an html file are
unchanged, change their source .rst and rebuild each target):

 $ ninja -d explain html
 ninja: no work to do.
 $ ninja -d explain man
 ninja: no work to do.
 $ man -l docs/qemu.1 | grep foobar
 $ grep foobar docs/manual/system/i386/pc.html
 $ vi ../docs/system/target-i386-desc.rst.inc    #add the 'foobar' string

 $ ninja -d explain man
 ninja explain: restat of output docs/man.stamp older than most recent input docs/system/target-i386-desc.rst.inc (1683122999140339620 vs 1683123032492362281)
 ninja explain: docs/man.stamp is dirty
 ninja explain: docs/qemu-block-drivers.7 is dirty
 ninja explain: docs/qemu-cpu-models.7 is dirty
 ninja explain: docs/qemu-ga-ref.7 is dirty
 ninja explain: docs/qemu-ga.8 is dirty
 ninja explain: docs/qemu-img.1 is dirty
 ninja explain: docs/qemu-nbd.8 is dirty
 ninja explain: docs/qemu-pr-helper.8 is dirty
 ninja explain: docs/qemu-qmp-ref.7 is dirty
 ninja explain: docs/qemu-storage-daemon-qmp-ref.7 is dirty
 ninja explain: docs/qemu-storage-daemon.1 is dirty
 ninja explain: docs/qemu-trace-stap.1 is dirty
 ninja explain: docs/qemu.1 is dirty
 ninja explain: docs/virtfs-proxy-helper.1 is dirty
 [1/1] Generating docs/QEMU man pages with a custom command

 $ man -l docs/qemu.1 | grep foobar
        The QEMU PC System emulator simulates the following foobar peripherals:
 $ grep foobar docs/manual/system/i386/pc.html  #html files unchanged

 $ ninja -d explain html
 ninja explain: restat of output docs/manual.stamp older than most recent input docs/system/target-i386-desc.rst.inc (1683122995876337403 vs 1683123032492362281)
 ninja explain: docs/manual.stamp is dirty
 [1/1] Generating docs/QEMU manual with a custom command

 $ man -l docs/qemu.1 | grep foobar
        The QEMU PC System emulator simulates the following foobar peripherals:
 $ grep foobar docs/manual/system/i386/pc.html
 <p>The QEMU PC System emulator simulates the following foobar peripherals:</p>

===

Fabiano Rosas (2):
  meson: Pass -j option to sphinx
  meson: Deserialize the man pages and html builds

 docs/meson.build           | 48 +++++++++++++++++++++++++-------------
 docs/sphinx/dbusdomain.py  |  4 ++++
 docs/sphinx/fakedbusdoc.py |  5 ++++
 docs/sphinx/qmp_lexer.py   |  5 ++++
 4 files changed, 46 insertions(+), 16 deletions(-)

-- 
2.35.3


