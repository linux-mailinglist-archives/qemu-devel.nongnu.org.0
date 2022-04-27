Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 763685116CD
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 14:35:01 +0200 (CEST)
Received: from localhost ([::1]:57568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njgsm-0004N1-30
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 08:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1njgr0-0003Cv-TR; Wed, 27 Apr 2022 08:33:11 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:33469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1njgqz-0004Le-1W; Wed, 27 Apr 2022 08:33:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=8EzUXLgxORwhp5l/1KA1xBd7b+dAlPmyCe5+6OE9xqM=; b=feV+3ozayA20BYEa9qPW05ZEo/
 vmxLqRu/JbKs0rLvmL/n9PDAAJQA3p6RW80ttFK0Pz1FXlPcMswpNmr8n9ToLFBdJ/5rpYhF3oV2l
 of2M2IQGv113ew9HOj06M6Zv9VobChy6btPAGfhlS+ON5AkWzdrSjLrKyP13/15IpqsAAasEJlx7j
 GVblf4fCK4YBPuWfV1WbZU7d8ZZ4k6+HGOiSK2NEpuTMekJcKqipDF+DpF0TeiNu40Opu8UF7NtRb
 FQIJnsQBYlM8F/aRhiAT2+Ea0ncPP4hkdz7Hkr4kZ0PIgD2qFnAYD1peKt3I0ygckidzipK5AEU2B
 CJrZ91TRKfEqQePRx+1wXREjMkNyq5xdrLZPQ4hJ9hUysIXjZm+HuZjK3Ypodrsuq0BG+kSjb0tY5
 RuQeS8ENaToA6zo6ThdjcLFqOnOgOkP3yerOfEpi16kXD2abiH9850YXtS7c0vPVB9bDikOKiMt9I
 YuCyu/aCCnCzzeWSspyFtJVxECpO80feRIdc+7UWpdxznnCdr0d56vX3KXuQeuSvE/tR5aW1ontzR
 SSE0VdYUeVLI7gRxgNi1/dX04upZ0zlGLrSuq9XF2pE8skkhc4fejzLCZIpX74X0uYT6OYHy9NTme
 nhz0W1iJDvsI0PXeYwt7Sk5OVgtFqFUcXIxf7KQBs=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Greg Kurz <groug@kaod.org>
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-devel@nongnu.org,
 Michael Roitzsch <reactorcontrol@icloud.com>, qemu-stable@nongnu.org,
 Keno Fischer <keno@juliacomputing.com>, Will Cohen <wwcohen@gmail.com>
Subject: Re: [PATCH v2 2/5] 9pfs: fix qemu_mknodat(S_IFSOCK) on macOS
Date: Wed, 27 Apr 2022 14:32:53 +0200
Message-ID: <9545176.94nLgIBNA9@silver>
In-Reply-To: <20220427121810.15783101@bahia>
References: <cover.1650553693.git.qemu_oss@crudebyte.com>
 <26d489bd-90c5-5b92-309b-4e07c83ec778@gmail.com>
 <20220427121810.15783101@bahia>
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

On Mittwoch, 27. April 2022 12:18:10 CEST Greg Kurz wrote:
> On Wed, 27 Apr 2022 11:27:28 +0900
> 
> Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
> > On 2022/04/26 21:38, Greg Kurz wrote:
> [..skip..]
> 
> > > I think Christian's explanation is clear enough. We don't guarantee
> > > that v9fs_co_foo() calls run atomically. As a consequence, the client
> > > might see transient states or be able to interact with an ongoing
> > > request. And to answer your question, we have no specific rationale
> > > on security with that.
> > > 
> > > I'm not sure what the concerns are but unless you come up with a
> > > valid scenario [*] I don't see any reason to prevent this patch
> > > to go forward.
> > > 
> > > [*] things like:
> > >      - client escaping the shared directory
> > >      - QEMU crashing
> > >      - QEMU hogging host resources
> > >      - client-side unprivileged user gaining elevated privleges
> > >      
> > >        in the guest
> > 
> > I was just not sure if such transient states are safe. The past
> > discussion was about the length of the non-atomic time window where a
> > path name is used to identify a particular file, but if such states are
> > not considered problematic, the length does not matter all and we can
> > confidently say the sequence of bind() and chmod() is safe.
> > 
> > Considering the transient states are tolerated in 9pfs, we need to
> > design this function to be tolerant with transient states as well. The
> > use of chmod() is not safe when we consider about transient states. A
> > malicious actor may replace the file at the path with a symlink which
> > may escape the shared directory and chmod() will naively follow it.
> 
> You get a point here. Thanks for your tenacity ! :-)

Yep, I send a v4 with fchmodat_nofollow() instead of chmod(), thanks!

BTW, why is it actually allowed for client to create a symlink pointing 
outside exported directory tree with security_model=passthrough/none? Did 
anybody want that?

> > chmod() should be replaced with fchmodat_nofollow() or something similar.
> 
> On a GNU/Linux system, this could be achieved by calling fchmod() on
> the socket fd *before* calling bind() but I'm afraid this hack might
> not work with a BSDish OS.

As you already imagined, this is unfortunately not supported by any BSDs, 
including macOS. I'll file a bug report with Apple though.

> Replacing chmod() with fchmodat_nofollow(dirfd, addr.sun_path, mode)
> won't make things atomic as above but at least it won't follow a
> malicious symbolic link : mknod() on the client will fail with
> ELOOP, which is fine when it comes to not breaking out of the shared
> directory.

Current security_model=passthrough/none already has similar non-atomic 
operations BTW, so this was not something new. E.g.:

static int local_symlink(FsContext *fs_ctx, const char *oldpath,
                         V9fsPath *dir_path, const char *name, FsCred *credp)
{
    ...
    } else if (fs_ctx->export_flags & V9FS_SM_PASSTHROUGH ||
               fs_ctx->export_flags & V9FS_SM_NONE) {
        err = symlinkat(oldpath, dirfd, name);
        if (err) {
            goto out;
        }
        err = fchownat(dirfd, name, credp->fc_uid, credp->fc_gid,
                       AT_SYMLINK_NOFOLLOW);
    ...
}

In general, if you care about a higher degree of security, I'd always 
recommend to use security_model=mapped in the first place.

> This brings up a new problem I hadn't realized before : the
> fchmodat_nofollow() implementation in 9p-local.c is really
> a linux only thing to cope with AT_SYMLINK_NOFOLLOW not being
> supported with fchmodat(). It looks that this should move to
> 9p-util-linux.c and a proper version should be added for macOS
> in 9p-util-darwin.c

Like already agreed on the other thread, yes, that makes sense. But I think 
this can be handled with a follow-up, separate from this series.

Best regards,
Christian Schoenebeck



