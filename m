Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6BC3EBDAD
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 22:56:48 +0200 (CEST)
Received: from localhost ([::1]:42024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEeER-0005nH-FL
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 16:56:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nirsof@gmail.com>)
 id 1mEeDD-0004vh-3j; Fri, 13 Aug 2021 16:55:31 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:52036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nirsof@gmail.com>)
 id 1mEeDB-0006Qc-9r; Fri, 13 Aug 2021 16:55:30 -0400
Received: by mail-wm1-x333.google.com with SMTP id u15so7665944wmj.1;
 Fri, 13 Aug 2021 13:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eRR04g4ItmReAGIhrYzJ2ezm8KfPldsuskTEv6gEHlo=;
 b=jgwNaNGr81nI45UbgUSwGjx/ho2Ncac/HKrHaKRgVSX8RnD35Rk3QjwnHtT10CEEjJ
 4nnCoKcN0XhmwQidcug+41HyK1nF9gyhJFaj3AASD9kx+uNZ4SrD3FZscZmcLuB/+Ww+
 j1RjYS9YIgyLxhXk6JKqi0akJmbCTJ0f8it3OgKONzwaD2Z9Umbrd6wMNNrM4wwVz/c/
 vBb+jZ3F74TFs2C0si476YabhTOKeMsW2xGLLRt8HAAysKMntr67F1rg1r5DQkW3OK1V
 SyVK0I2EiwW9lwMGheOY/vEgESh/B7KdWtT6ooEw8Rre9c/7w58cBbQQyZ5ULAteWtSS
 38zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eRR04g4ItmReAGIhrYzJ2ezm8KfPldsuskTEv6gEHlo=;
 b=bBqAOl4Zv0yPlUdFxrdZSDy5hkjbJ2zV1OYRRT2NYz2IoYF+EEesx01OFcCeyN9BaZ
 o2ja1lWl3gW8qGcgqojICd4ewNovkmCw8Pxbt48tXp6SkoBxyJ8Og3yd7WrmvButOH/i
 6klQlJ1VC/wDaz9GAh2/JUNnmbDNGog60/7yoERnfn5vHfCq5wIHtyarXmiPPlLG8RY8
 k0pxswHGzLd6YhKr0ePuqk9UeinS00em1ls79wVAFt8FqHiWYq37zUjSvj55YNrVWZJy
 qrqEaqGqlKZwUr18xiQ3Hc3whO0cmRMA1LZMq7ZsXM4waG2oOKOutpQ0cFJnd4GuBMEK
 CPsw==
X-Gm-Message-State: AOAM531viUhXLk5BdIYROrXbXv4NmrPP0MSDslAbUiMgPdRmDTkEc4aN
 XGl/Dd5jqYJPAuiFeD6Nd2WV9lE/fm6o4w==
X-Google-Smtp-Source: ABdhPJzmqwdxEkIxK9aOGl9qVZzqPCCLae6tTXiOXNJis7lqD/CsG1sDGEkl0L5SsoiFzi+D9qKxVg==
X-Received: by 2002:a05:600c:4ca9:: with SMTP id
 g41mr4322815wmp.110.1628888126490; 
 Fri, 13 Aug 2021 13:55:26 -0700 (PDT)
Received: from sparse.. (93-173-85-40.bb.netvision.net.il. [93.173.85.40])
 by smtp.gmail.com with ESMTPSA id m10sm3115094wro.63.2021.08.13.13.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 13:55:25 -0700 (PDT)
From: Nir Soffer <nirsof@gmail.com>
X-Google-Original-From: Nir Soffer <nsoffer@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qemu-nbd: Change default cache mode to writeback
Date: Fri, 13 Aug 2021 23:55:19 +0300
Message-Id: <20210813205519.50518-1-nsoffer@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=nirsof@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Nir Soffer <nsoffer@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both qemu and qemu-img use writeback cache mode by default, which is
already documented in qemu(1). qemu-nbd uses writethrough cache mode by
default, and the default cache mode is not documented.

According to the qemu-nbd(8):

   --cache=CACHE
          The  cache  mode  to be used with the file.  See the
          documentation of the emulator's -drive cache=... option for
          allowed values.

qemu(1) says:

    The default mode is cache=writeback.

So users have no reason to assume that qemu-nbd is using writethough
cache mode. The only hint is the painfully slow writing when using the
defaults.

Looking in git history, it seems that qemu used writethrough in the past
to support broken guests that did not flush data properly, or could not
flush due to limitations in qemu. But qemu-nbd clients can use
NBD_CMD_FLUSH to flush data, so using writethrough does not help anyone.

Change the default cache mode to writback, and document the default and
available values properly in the online help and manual.

With this change converting image via qemu-nbd is 3.5 times faster.

    $ qemu-img create dst.img 50g
    $ qemu-nbd -t -f raw -k /tmp/nbd.sock dst.img

Before this change:

    $ hyperfine -r3 "./qemu-img convert -p -f raw -O raw -T none -W fedora34.img nbd+unix:///?socket=/tmp/nbd.sock"
    Benchmark #1: ./qemu-img convert -p -f raw -O raw -T none -W fedora34.img nbd+unix:///?socket=/tmp/nbd.sock
      Time (mean ± σ):     83.639 s ±  5.970 s    [User: 2.733 s, System: 6.112 s]
      Range (min … max):   76.749 s … 87.245 s    3 runs

After this change:

    $ hyperfine -r3 "./qemu-img convert -p -f raw -O raw -T none -W fedora34.img nbd+unix:///?socket=/tmp/nbd.sock"
    Benchmark #1: ./qemu-img convert -p -f raw -O raw -T none -W fedora34.img nbd+unix:///?socket=/tmp/nbd.sock
      Time (mean ± σ):     23.522 s ±  0.433 s    [User: 2.083 s, System: 5.475 s]
      Range (min … max):   23.234 s … 24.019 s    3 runs

Users can avoid the issue by using --cache=writeback[1] but the defaults
should give good performance for the common use case.

[1] https://bugzilla.redhat.com/1990656

Signed-off-by: Nir Soffer <nsoffer@redhat.com>
---
 docs/tools/qemu-nbd.rst | 6 ++++--
 qemu-nbd.c              | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/docs/tools/qemu-nbd.rst b/docs/tools/qemu-nbd.rst
index ee862fa0bc..5643da26e9 100644
--- a/docs/tools/qemu-nbd.rst
+++ b/docs/tools/qemu-nbd.rst
@@ -98,8 +98,10 @@ driver options if ``--image-opts`` is specified.
 
 .. option:: --cache=CACHE
 
-  The cache mode to be used with the file.  See the documentation of
-  the emulator's ``-drive cache=...`` option for allowed values.
+  The cache mode to be used with the file. Valid values are:
+  ``none``, ``writeback`` (the default), ``writethrough``,
+  ``directsync`` and ``unsafe``. See the documentation of
+  the emulator's ``-drive cache=...`` option for more info.
 
 .. option:: -n, --nocache
 
diff --git a/qemu-nbd.c b/qemu-nbd.c
index 26ffbf15af..6c18fcd19a 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -135,7 +135,9 @@ static void usage(const char *name)
 "                            'snapshot.id=[ID],snapshot.name=[NAME]', or\n"
 "                            '[ID_OR_NAME]'\n"
 "  -n, --nocache             disable host cache\n"
-"      --cache=MODE          set cache mode (none, writeback, ...)\n"
+"      --cache=MODE          set cache mode used to access the disk image, the\n"
+"                            valid options are: 'none', 'writeback' (default),\n"
+"                            'writethrough', 'directsync' and 'unsafe'\n"
 "      --aio=MODE            set AIO mode (native, io_uring or threads)\n"
 "      --discard=MODE        set discard mode (ignore, unmap)\n"
 "      --detect-zeroes=MODE  set detect-zeroes mode (off, on, unmap)\n"
@@ -552,7 +554,7 @@ int main(int argc, char **argv)
     bool alloc_depth = false;
     const char *tlscredsid = NULL;
     bool imageOpts = false;
-    bool writethrough = true;
+    bool writethrough = false; /* Client will flush as needed. */
     bool fork_process = false;
     bool list = false;
     int old_stderr = -1;
-- 
2.31.1


