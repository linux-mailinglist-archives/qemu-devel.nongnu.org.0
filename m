Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3ED460F4B8
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 12:17:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onzv0-0003Tq-P3; Thu, 27 Oct 2022 06:15:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1onzuv-0002kO-L6
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:15:17 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1onzur-000610-Mh
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:15:17 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 31D0044038;
 Thu, 27 Oct 2022 12:14:59 +0200 (CEST)
From: Fiona Ebner <f.ebner@proxmox.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, hreitz@redhat.com, t.lamprecht@proxmox.com,
 d.csapak@proxmox.com
Subject: [PATCH] vl: change PID file path resolve error to warning
Date: Thu, 27 Oct 2022 12:14:43 +0200
Message-Id: <20221027101443.118049-1-f.ebner@proxmox.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

Commit 85c4bf8aa6 ("vl: Unlink absolute PID file path") made it a
critical error when the PID file path cannot be resolved. Before this
commit, it was possible to invoke QEMU when the PID file was a file
created with mkstemp that was already unlinked at the time of the
invocation. There might be other similar scenarios.

It should not be a critical error when the PID file unlink notifier
can't be registered, because the path can't be resolved. Turn it into
a warning instead.

Fixes: 85c4bf8aa6 ("vl: Unlink absolute PID file path")
Reported-by: Dominik Csapak <d.csapak@proxmox.com>
Suggested-by: Thomas Lamprecht <t.lamprecht@proxmox.com>
Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
---

For completeness, here is a reproducer based on our actual invocation
written in Rust (depends on the "nix" crate). It works fine with QEMU
7.0, but not anymore with 7.1.

use std::fs::File;
use std::io::Read;
use std::os::unix::io::{AsRawFd, FromRawFd};
use std::path::{Path, PathBuf};
use std::process::Command;

fn make_tmp_file<P: AsRef<Path>>(path: P) -> (File, PathBuf) {
    let path = path.as_ref();

    let mut template = path.to_owned();
    template.set_extension("tmp_XXXXXX");
    match nix::unistd::mkstemp(&template) {
        Ok((fd, path)) => (unsafe { File::from_raw_fd(fd) }, path),
        Err(err) => panic!("mkstemp {:?} failed: {}", template, err),
    }
}

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let (mut pidfile, pid_path) = make_tmp_file("/tmp/unlinked.pid.tmp");
    nix::unistd::unlink(&pid_path)?;

    let mut qemu_cmd = Command::new("./qemu-system-x86_64");
    qemu_cmd.args([
        "-daemonize",
        "-pidfile",
        &format!("/dev/fd/{}", pidfile.as_raw_fd()),
    ]);

    let res = qemu_cmd.spawn()?.wait_with_output()?;

    if res.status.success() {
        let mut pidstr = String::new();
        pidfile.read_to_string(&mut pidstr)?;
        println!("got PID {}", pidstr);
    } else {
        panic!("QEMU command unsuccessful");
    }
    Ok(())
}

 softmmu/vl.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index b464da25bc..10dfe773a7 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2432,10 +2432,9 @@ static void qemu_maybe_daemonize(const char *pid_file)
 
         pid_file_realpath = g_malloc0(PATH_MAX);
         if (!realpath(pid_file, pid_file_realpath)) {
-            error_report("cannot resolve PID file path: %s: %s",
-                         pid_file, strerror(errno));
-            unlink(pid_file);
-            exit(1);
+            warn_report("not removing PID file on exit: cannot resolve PID file"
+                        " path: %s: %s", pid_file, strerror(errno));
+            return;
         }
 
         qemu_unlink_pidfile_notifier = (struct UnlinkPidfileNotifier) {
-- 
2.30.2



