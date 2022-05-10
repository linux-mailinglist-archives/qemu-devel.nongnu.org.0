Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4D3521C8D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 16:35:44 +0200 (CEST)
Received: from localhost ([::1]:36286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noQxj-0003rp-69
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 10:35:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1noQwo-000328-J2
 for qemu-devel@nongnu.org; Tue, 10 May 2022 10:34:46 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:42466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1noQwm-00032X-ER
 for qemu-devel@nongnu.org; Tue, 10 May 2022 10:34:46 -0400
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-wXed5RHkMMK-Kk0sZ7oS_Q-1; Tue, 10 May 2022 10:34:33 -0400
X-MC-Unique: wXed5RHkMMK-Kk0sZ7oS_Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0BA3429ABA23;
 Tue, 10 May 2022 14:34:33 +0000 (UTC)
Received: from bahia (unknown [10.39.192.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 049AC400F736;
 Tue, 10 May 2022 14:34:31 +0000 (UTC)
Date: Tue, 10 May 2022 16:34:30 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: qemu-devel@nongnu.org, "Meng, Bin" <Bin.Meng@windriver.com>, Bin Meng
 <bmeng.cn@gmail.com>, "Shi, Guohuai" <Guohuai.Shi@windriver.com>
Subject: Re: [PATCH 5/9] hw/9pfs: Add a 'local' file system backend driver
 for Windows
Message-ID: <20220510163430.410536f5@bahia>
In-Reply-To: <2077078.oMYteGReol@silver>
References: <20220425142705.2099270-1-bmeng.cn@gmail.com>
 <2718865.3NRaeQn5QO@silver> <20220510154006.63c2ed23@bahia>
 <2077078.oMYteGReol@silver>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Tue, 10 May 2022 16:04:28 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Dienstag, 10. Mai 2022 15:40:06 CEST Greg Kurz wrote:
> > On Tue, 10 May 2022 13:54:46 +0200
> > 
> > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > On Dienstag, 10. Mai 2022 12:18:33 CEST Christian Schoenebeck wrote:
> > > > On Dienstag, 10. Mai 2022 04:17:44 CEST Shi, Guohuai wrote:
> > > > [...]
> > > > 
> > > > > > > > > I tend to agree with Christian's remarks that this patch is
> > > > > > > > > too
> > > > > > > > > big
> > > > > > > > > and that the choice of introducing right away a new
> > > > > > > > > implementation
> > > > > > > > > of 9p-local for windows hosts is too bold to start with. We
> > > > > > > > > need
> > > > > > > > > to
> > > > > > > > > clearly understand what's diverging between windows and linux
> > > > > > > > > in
> > > > > > > > > order
> > > > > > > > > to make such a decision. You should first try to introduce the
> > > > > > > > > required
> > > > > > > > > abstractions to cope with these differences, so that we can
> > > > > > > > > review.
> > > > > > > > 
> > > > > > > > Here is the basic introductions of 9PFS for Windows development:
> > > > > > > > 
> > > > > > > > 
> > > > > > > > 
> > > > > > > > Windows always returns -1 when try to call open() for a
> > > > > > > > directory.
> > > > > > > > Windows (actually MinGW library) only allows opendir() for a
> > > > > > > > directory.
> > > > 
> > > > That missing behaviour could be implemented in 9p-util-win.c, similar to
> > > > the missing behaviours of mknodat() for macOS which did not support a
> > > > bunch of things like creating a UNIX socket file and more:
> > > > 
> > > > https://github.com/qemu/qemu/commit/055ab89327bab83f1bd07e9de07f7628643d
> > > > 3d8d> > 
> > > > > > > Does MinGW have dirfd() ?
> > > > > > 
> > > > > > No.
> > > > > > MinGW does not open any directory.
> > > > > > Here is opendir() source code of MinGW:
> > > > > > https://github.com/mirror/mingw-w64/blob/master/mingw-w64-crt/misc/d
> > > > > > iren
> > > > > > t.
> > > > > > c#L42
> > > > > > 
> > > > > > So MinGW do not have a fd associated to a directory.
> > > > > > 
> > > > > > > > Windows does not support APIs like "*at" (openat(), renameat(),
> > > > > > > > etc.)
> > > > 
> > > > Like already suggested before on your previous RFC version, it is
> > > > possible
> > > > to use the same workaround as we are using for macOS hosts already
> > > > (which
> > > > 
> > > > was missing mknodat()):
> > > >   pthread_fchdir_np(...)
> > > >   mknod(...)
> > > >   
> > > >   https://github.com/qemu/qemu/blob/master/hw/9pfs/9p-util-darwin.c#L84
> > > > 
> > > > So on Windows it would be viable to:
> > > >   chdir(...)
> > > >   open(...)
> > > > 
> > > > The same approach could be used for any missing *at() function for
> > > > Windows.
> > > 
> > > Problem though is that the chdir() functions on Windows all seem to have
> > > process-wide effect, we would need to change the current directory only
> > > for
> > > the current thread, because filesystem access of 9p server is
> > > multi-threaded.
> > > 
> > > Protecting the chdir(); foo(); calls by a process wide global mutex isn't
> > > very appealing either. :/
> > 
> > And it wouldn't be safe anyway because I'm pretty sure that the rest
> > of the QEMU code assumes that the current directory is invariant, e.g.
> > user could be very confused by 'drive_add file=./foo.img' not working.
> > 
> > BTW duckduckgo gives:
> > 
> > https://stackoverflow.com/questions/32138524/is-there-a-windows-equivalent-o
> > f-openat
> > 
> > So yes it seems to be technically possible to implement *at() functions
> > on windows. This is the only way to avoid CVE-2016-9602 in the QEMU
> > process.
> 
> +1
> 
> > Another option is to use the proxy backend : this offloads all fs
> > accesses to an external process running virtfs-proxy-helper, that
> > runs privileged and chroot() into the shared directory so that it
> > can safely use path based syscalls.
> 
> As a very last resort, maybe. But just for the other two guys to know upfront: 
> the proxy backend is very slow and not in good shape. There were plans to 
> deprecate the proxy backend therefore, as it's more or less dead.
> 

Yeah as mentioned before, the way to go now would be to come with
a vhost-user implementation like virtiofsd. This would address all
perf problems we have with proxy since the client would directly
talk to the external process. This should also provide better perf
than the local backend since it wouldn't have to do do the "at*()"
dance thanks to chroot().

> > > > > > > Ouch...
> > > > > > > 
> > > > > > > > So 9PFS can not use any openat() for opening a sub file or
> > > > > > > > directory
> > > > > > > > in 9P
> > > > > > 
> > > > > > mount
> > > > > > 
> > > > > > > directory.
> > > > > > > 
> > > > > > > > This commit use merge_fs_path() to build up full filename by
> > > > > > > > string
> > > > > > 
> > > > > > concatenation.
> > > > > > 
> > > > > > > > I know that may have a risk of security, but Windows does fully
> > > > > > > > support POSIX
> > > > 
> > > > You will not find anybody merging code that's inherently insecure.
> > > > 
> > > > > > > I understand from your various answers that symlinks aren't
> > > > > > > currently supported by window's POSIX API. Is this forever ?
> > > > > > > Google do mentions symlinks in windows 10. What's the story
> > > > > > > there ? How do they behave ? How would they be exposed to the
> > > > > > > client ? Be aware that, even if the client cannot create symlinks,
> > > > > > > an existing symlink could be used to escape with rename().
> > > > > > > 
> > > > > > > 
> > > > > > > 
> > > > > > > If the code "may have a risk of security" then it must be
> > > > > > > fixed or avoided in some way before being merged upstream.
> > > > > > > 
> > > > > > > 
> > > > > > > 
> > > > > > > Other thing that comes to mind is that windows hosts should
> > > > > > > maybe use the mapped or mapped-file security modes since
> > > > > > > they emulate symlinks with a simple file hidden in the
> > > > > > > VIRTFS_META_DIR directory.
> > > > > > > 
> > > > > > > 
> > > > > > > 
> > > > > > > Cheers,
> > > > > > > 
> > > > > > > 
> > > > > > > 
> > > > > > > --
> > > > > > > Greg
> > > > > > 
> > > > > > Windows native API support symbolic link file start from Windows
> > > > > > Vista:
> > > > > > https://docs.microsoft.com/en-us/windows/win32/api/winbase/nf-winbas
> > > > > > e-cr
> > > > > > ea
> > > > > > tes ymboliclinka
> > > > > > 
> > > > > > I mean Windows POSIX APIs do not support symbolic link (MinGW use
> > > > > > Win32
> > > > > > POSIX APIs) So we can not create symbolic link by MinGW.
> > > > 
> > > > A function with POSIX signature could be added to 9p-util-win.c which
> > > > would
> > > > call the native Windows function to create symlinks.
> > > > 
> > > > > > Anyway, there is another solution: re-work whole 9PFS code: not only
> > > > > > 9p-local.c, but also every file in 9p driver.
> > > > > > Replace every MinGW/POSIX APIs (e.g. open, lseek, read, write,
> > > > > > close),
> > > > > > by Windows Native APIs (e.g. open -> CreateFile, lseek ->
> > > > > > SetFilePointer,
> > > > > > read -> ReadFile, write -> WriteFile, close -> CloseHandle, etc.)
> > > > > > Then 9P can use Windows symbolic link feature.
> > > > > > However, I do think it is a good idea to replace everything.
> > > > > 
> > > > > TYPO: it NOT is a good idea to replace everything.
> > > > 
> > > > Right, that does not make sense. The way to go is adding and
> > > > implementing
> > > > missing system functions with POSIX signatures and POSIX behaviour for
> > > > Windows. Not turning the entire code base upside down.
> > > > 
> > > > Best regards,
> > > > Christian Schoenebeck
> 
> 


