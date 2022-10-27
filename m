Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B78F460F70F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 14:20:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo1pS-00048C-Fn; Thu, 27 Oct 2022 08:17:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oo1pP-0003zw-TL
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 08:17:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oo1pN-0003Kg-7c
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 08:17:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666873060;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=4Ba2iyL+Zfz7O4ckCxLi/3txGYTJgNH1dKcIiW+pgJY=;
 b=F7/F0WfLaq20/rE1lmMCTNsSUO2bKPlueJi6hFpi/i8os9e8aqoZcJ1F/rxt/eipSd/Zq4
 uB3uivMdorwa3aeN/nI5853kYhZxoTFUa8KjDz2jUJZsrW4n6K9d9tDSIfT1dGhQtuJnoa
 wvFnf489qJjtlrPzDJeIeQf6wVNJ6vc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-EaDriqBSMXukvPnl__1g6A-1; Thu, 27 Oct 2022 08:17:36 -0400
X-MC-Unique: EaDriqBSMXukvPnl__1g6A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8DB33C0D864;
 Thu, 27 Oct 2022 12:17:35 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 67D3140C835A;
 Thu, 27 Oct 2022 12:17:34 +0000 (UTC)
Date: Thu, 27 Oct 2022 13:17:31 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Fiona Ebner <f.ebner@proxmox.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, hreitz@redhat.com,
 t.lamprecht@proxmox.com, d.csapak@proxmox.com
Subject: Re: [PATCH] vl: change PID file path resolve error to warning
Message-ID: <Y1p22/LxBASPUTcV@redhat.com>
References: <20221027101443.118049-1-f.ebner@proxmox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221027101443.118049-1-f.ebner@proxmox.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Oct 27, 2022 at 12:14:43PM +0200, Fiona Ebner wrote:
> Commit 85c4bf8aa6 ("vl: Unlink absolute PID file path") made it a
> critical error when the PID file path cannot be resolved. Before this
> commit, it was possible to invoke QEMU when the PID file was a file
> created with mkstemp that was already unlinked at the time of the
> invocation. There might be other similar scenarios.
> 
> It should not be a critical error when the PID file unlink notifier
> can't be registered, because the path can't be resolved. Turn it into
> a warning instead.
> 
> Fixes: 85c4bf8aa6 ("vl: Unlink absolute PID file path")
> Reported-by: Dominik Csapak <d.csapak@proxmox.com>
> Suggested-by: Thomas Lamprecht <t.lamprecht@proxmox.com>
> Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
> ---
> 
> For completeness, here is a reproducer based on our actual invocation
> written in Rust (depends on the "nix" crate). It works fine with QEMU
> 7.0, but not anymore with 7.1.
> 
> use std::fs::File;
> use std::io::Read;
> use std::os::unix::io::{AsRawFd, FromRawFd};
> use std::path::{Path, PathBuf};
> use std::process::Command;
> 
> fn make_tmp_file<P: AsRef<Path>>(path: P) -> (File, PathBuf) {
>     let path = path.as_ref();
> 
>     let mut template = path.to_owned();
>     template.set_extension("tmp_XXXXXX");
>     match nix::unistd::mkstemp(&template) {
>         Ok((fd, path)) => (unsafe { File::from_raw_fd(fd) }, path),
>         Err(err) => panic!("mkstemp {:?} failed: {}", template, err),
>     }
> }
> 
> fn main() -> Result<(), Box<dyn std::error::Error>> {
>     let (mut pidfile, pid_path) = make_tmp_file("/tmp/unlinked.pid.tmp");
>     nix::unistd::unlink(&pid_path)?;
> 
>     let mut qemu_cmd = Command::new("./qemu-system-x86_64");
>     qemu_cmd.args([
>         "-daemonize",
>         "-pidfile",
>         &format!("/dev/fd/{}", pidfile.as_raw_fd()),
>     ]);
> 
>     let res = qemu_cmd.spawn()?.wait_with_output()?;
> 
>     if res.status.success() {
>         let mut pidstr = String::new();
>         pidfile.read_to_string(&mut pidstr)?;
>         println!("got PID {}", pidstr);
>     } else {
>         panic!("QEMU command unsuccessful");
>     }
>     Ok(())
> }
> 
>  softmmu/vl.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index b464da25bc..10dfe773a7 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2432,10 +2432,9 @@ static void qemu_maybe_daemonize(const char *pid_file)
>  
>          pid_file_realpath = g_malloc0(PATH_MAX);
>          if (!realpath(pid_file, pid_file_realpath)) {
> -            error_report("cannot resolve PID file path: %s: %s",
> -                         pid_file, strerror(errno));
> -            unlink(pid_file);
> -            exit(1);
> +            warn_report("not removing PID file on exit: cannot resolve PID file"
> +                        " path: %s: %s", pid_file, strerror(errno));
> +            return;
>          }

I don't think using warn_report is desirable here.

If the behaviour of passing a pre-unlinked pidfile is considered
valid, then we should allow it without printing a warning every
time an application does this.

warnings are to highlight non-fatal mistakes by applications, and
this is not a mistake, it is intentionally supported behaviour.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


