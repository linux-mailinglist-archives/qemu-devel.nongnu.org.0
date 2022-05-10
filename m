Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED6152145E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 13:56:50 +0200 (CEST)
Received: from localhost ([::1]:50298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noOTx-0001tp-5p
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 07:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1noOS6-0001CA-58
 for qemu-devel@nongnu.org; Tue, 10 May 2022 07:54:55 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:56555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1noOS3-0001JF-O9
 for qemu-devel@nongnu.org; Tue, 10 May 2022 07:54:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=Ee6raDoeQOHpRwVmmbkd4ndgIKYFt6Ip84H6xAmZFRc=; b=W/NUnqFgMlckMep5oXUg1VDhKg
 TFRZtzK2y2bqrReWh36qE0xTpW+jetgxYyfXy2etmwW+nmb718bwZXTiL+XPeztwAq6HTkr51ZXiv
 CyX/DJzDGnp8PFjAMBbn/MJvLJ2CwXE1+DsGS5NlKcKRHCpYPuN3lwOgPff/Rvs/9yJY1ZN+lbPz2
 DqV0p77HEXzuBR+5DfElE1MSzdUUlBy+CshBHDrJYJtQIo2QVAUZMu9gPbwT4H94SG6jnTg1/p1G1
 1DwPn9YrIlgpI8+9CGkxoGPOqgjvIqpXhAxQHGqEvThWFJGY2OnRN8Fq5/YTLfXteyBha1bUvDFO/
 F6TbVhQlXm2gSfAe8fxYuwV6J70sEt7x0ZXDUssnYsC39tmaBwJgNc6C7gD6gEPc9gWbhcTyoaLGN
 hc0bkrZP7NDzPOoaHBuhZgsU0d1aw5rX/TwSDXak/7Oq+6u4j4u75gTPuKJgGfxlwboWewSzAr8Oo
 kuS8yOBJWYmSlmSye/KLvrO7/7C7AF5Sulhax+jrgDkJKkAolnoR4rGoTLX0ugurWG83kAs62rKOB
 85ze6Y8bm+q0FNyQCFnTlKqiDtrkDFcobHQRtqUF0m2zsC7rpwLWEz1Z6qPgWr4ATfPMeXzOG97FY
 Jb2XSUCxV8C+Fa5eZLWCLMD2AEqr8VZsPFi4BXkk8=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org, "Meng, Bin" <Bin.Meng@windriver.com>
Cc: Greg Kurz <groug@kaod.org>, Bin Meng <bmeng.cn@gmail.com>,
 "Shi, Guohuai" <Guohuai.Shi@windriver.com>
Subject: Re: [PATCH 5/9] hw/9pfs: Add a 'local' file system backend driver for
 Windows
Date: Tue, 10 May 2022 13:54:46 +0200
Message-ID: <2718865.3NRaeQn5QO@silver>
In-Reply-To: <3148498.2bi0oRTOK1@silver>
References: <20220425142705.2099270-1-bmeng.cn@gmail.com>
 <MN2PR11MB41738234AB88DED21F896459EFC99@MN2PR11MB4173.namprd11.prod.outlook.com>
 <3148498.2bi0oRTOK1@silver>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Dienstag, 10. Mai 2022 12:18:33 CEST Christian Schoenebeck wrote:
> On Dienstag, 10. Mai 2022 04:17:44 CEST Shi, Guohuai wrote:
> [...]
> 
> > > > > > I tend to agree with Christian's remarks that this patch is too
> > > > > > big
> > > > > > and that the choice of introducing right away a new implementation
> > > > > > of 9p-local for windows hosts is too bold to start with. We need
> > > > > > to
> > > > > > clearly understand what's diverging between windows and linux in
> > > > > > order
> > > > > > to make such a decision. You should first try to introduce the
> > > > > > required
> > > > > > abstractions to cope with these differences, so that we can
> > > > > > review.
> > > > > 
> > > > > Here is the basic introductions of 9PFS for Windows development:
> > > > > 
> > > > > 
> > > > > 
> > > > > Windows always returns -1 when try to call open() for a directory.
> > > > > Windows (actually MinGW library) only allows opendir() for a
> > > > > directory.
> 
> That missing behaviour could be implemented in 9p-util-win.c, similar to the
> missing behaviours of mknodat() for macOS which did not support a bunch of
> things like creating a UNIX socket file and more:
> 
> https://github.com/qemu/qemu/commit/055ab89327bab83f1bd07e9de07f7628643d3d8d
> > > > Does MinGW have dirfd() ?
> > > 
> > > No.
> > > MinGW does not open any directory.
> > > Here is opendir() source code of MinGW:
> > > https://github.com/mirror/mingw-w64/blob/master/mingw-w64-crt/misc/diren
> > > t.
> > > c#L42
> > > 
> > > So MinGW do not have a fd associated to a directory.
> > > 
> > > > > Windows does not support APIs like "*at" (openat(), renameat(),
> > > > > etc.)
> 
> Like already suggested before on your previous RFC version, it is possible
> to use the same workaround as we are using for macOS hosts already (which
> was missing mknodat()):
> 
>   pthread_fchdir_np(...)
>   mknod(...)
> 
>   https://github.com/qemu/qemu/blob/master/hw/9pfs/9p-util-darwin.c#L84
> 
> So on Windows it would be viable to:
> 
>   chdir(...)
>   open(...)
> 
> The same approach could be used for any missing *at() function for Windows.

Problem though is that the chdir() functions on Windows all seem to have 
process-wide effect, we would need to change the current directory only for 
the current thread, because filesystem access of 9p server is multi-threaded.

Protecting the chdir(); foo(); calls by a process wide global mutex isn't very 
appealing either. :/

> > > > Ouch...
> > > > 
> > > > > So 9PFS can not use any openat() for opening a sub file or directory
> > > > > in 9P
> > > 
> > > mount
> > > 
> > > > directory.
> > > > 
> > > > > This commit use merge_fs_path() to build up full filename by string
> > > 
> > > concatenation.
> > > 
> > > > > I know that may have a risk of security, but Windows does fully
> > > > > support POSIX
> 
> You will not find anybody merging code that's inherently insecure.
> 
> > > > I understand from your various answers that symlinks aren't
> > > > currently supported by window's POSIX API. Is this forever ?
> > > > Google do mentions symlinks in windows 10. What's the story
> > > > there ? How do they behave ? How would they be exposed to the
> > > > client ? Be aware that, even if the client cannot create symlinks,
> > > > an existing symlink could be used to escape with rename().
> > > > 
> > > > 
> > > > 
> > > > If the code "may have a risk of security" then it must be
> > > > fixed or avoided in some way before being merged upstream.
> > > > 
> > > > 
> > > > 
> > > > Other thing that comes to mind is that windows hosts should
> > > > maybe use the mapped or mapped-file security modes since
> > > > they emulate symlinks with a simple file hidden in the
> > > > VIRTFS_META_DIR directory.
> > > > 
> > > > 
> > > > 
> > > > Cheers,
> > > > 
> > > > 
> > > > 
> > > > --
> > > > Greg
> > > 
> > > Windows native API support symbolic link file start from Windows Vista:
> > > https://docs.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-cr
> > > ea
> > > tes ymboliclinka
> > > 
> > > I mean Windows POSIX APIs do not support symbolic link (MinGW use Win32
> > > POSIX APIs) So we can not create symbolic link by MinGW.
> 
> A function with POSIX signature could be added to 9p-util-win.c which would
> call the native Windows function to create symlinks.
> 
> > > Anyway, there is another solution: re-work whole 9PFS code: not only
> > > 9p-local.c, but also every file in 9p driver.
> > > Replace every MinGW/POSIX APIs (e.g. open, lseek, read, write, close),
> > > by Windows Native APIs (e.g. open -> CreateFile, lseek ->
> > > SetFilePointer,
> > > read -> ReadFile, write -> WriteFile, close -> CloseHandle, etc.)
> > > Then 9P can use Windows symbolic link feature.
> > > However, I do think it is a good idea to replace everything.
> > 
> > TYPO: it NOT is a good idea to replace everything.
> 
> Right, that does not make sense. The way to go is adding and implementing
> missing system functions with POSIX signatures and POSIX behaviour for
> Windows. Not turning the entire code base upside down.
> 
> Best regards,
> Christian Schoenebeck



