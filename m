Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 758B452315E
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 13:22:10 +0200 (CEST)
Received: from localhost ([::1]:52106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nokPx-0001sq-G1
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 07:22:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nokMn-000874-45
 for qemu-devel@nongnu.org; Wed, 11 May 2022 07:18:53 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:50443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nokMk-00041Y-VI
 for qemu-devel@nongnu.org; Wed, 11 May 2022 07:18:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=4IS+/bmciRLGSBJXrKpS3fp3jauQqZLUAE6L95E2a5Y=; b=PIYB+J9VWwPWeoNCziciDcqKH2
 dE3KtDi659Dcy21eIbeijxbg6/e6BrgRK7bOWcd7CK2l4V86b4sxk90Jk0UcbUGAnnBD9XNtPb5hP
 8HSiEAwy4jVeESazfqH/lakuhkkuSl1sxpmTBOITDLerCLNBfyzzNYhRUhdH8hPF2bqT3aHOMhcUa
 Z/XriXOYfKofvcO4yk6XZjZLHWDThaiYoA67EL6/FNhWs5PQpKLQ09wKb/LEdTV2BZzGQC9fZ1XWq
 rYpBzWY4Xkuieh4wE6Rr9MONw2ETdW+y5qKAeKnibMilnGEPvudeSdfaxECW2Xk1vya1L4TT+YUNv
 bQfqebr+9W7o7++XRBXvWikHeY1YVgginqxqLIASHMX5bLeTi7PxkzsCy6/d4V6G5H5vMEVFhbAvy
 jkUzNg4JCXXmeqPIbIxdvSe/LFIr+IEN9UpzSdxkhPxcOifeufmCg2gWrNR9jsFFZUBFROi6ZEWwY
 0DLJwob9UxwhFQVJRq+ai/Pd7U8s09Da1K4gzTG0fPaGNoOiJ3hrFpBFB1bqyZKy8DpGnGmM38xiH
 2a3R5WHnhXKmRNNBJ1eO05hflGNuRMc2tdE/WD1r+S1nSaQ+mHJuapXOTXQL0jbPe9k/V7KIkpf2j
 9xDeh3urD3qCzGz8PnTekhtj9dCGloIjdb/EuhdEU=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org, "Meng, Bin" <Bin.Meng@windriver.com>
Cc: Greg Kurz <groug@kaod.org>, Bin Meng <bmeng.cn@gmail.com>,
 "Shi, Guohuai" <Guohuai.Shi@windriver.com>
Subject: Re: [PATCH 5/9] hw/9pfs: Add a 'local' file system backend driver for
 Windows
Date: Wed, 11 May 2022 13:18:45 +0200
Message-ID: <18993050.BCn1JD0qEJ@silver>
In-Reply-To: <MN2PR11MB4173011DDC017F9A414382BEEFC99@MN2PR11MB4173.namprd11.prod.outlook.com>
References: <20220425142705.2099270-1-bmeng.cn@gmail.com>
 <20220510163430.410536f5@bahia>
 <MN2PR11MB4173011DDC017F9A414382BEEFC99@MN2PR11MB4173.namprd11.prod.outlook.com>
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

On Dienstag, 10. Mai 2022 17:35:10 CEST Shi, Guohuai wrote:
> Let's force on the security issue:
> 
> Firstly, this answer (
> https://stackoverflow.com/questions/32138524/is-there-a-windows-equivalent-> of-openat ) is useless for QEMU. It uses Windows native API NtCreateFile()
> and accesses files by Windows handle. But 9PFS is using Windows POSIX
> interface, handle can not be used in POSIX interface. Actually, Windows
> provide similar APIs like
> GetFinalPathNameByHandle()/GetFileInformationByHandle(). It can also get
> file information by Windows handle.

I find "useless" quite exaggerated. You probably can't mix NT API calls with 
Mingw library calls, not sure, haven't checked the Mingw sources.

If there is no way with Mingw to resolve NT handles, then it is still possible 
however to implement all the POSIX functions we need (using NT API 
exclusively) in 9p-util-win.c.

Another option would be contributing the missing features to Mingw and in turn 
let QEMU's 9p feature depend on the appropriate minimum Mingw version.

> Windows POSIX interface do not support NO_FOLLOW flags, that means, Windows
> POSIX open() always translate symbolic link.
>  
> So everything are finally point to one limitation: Windows POSIX interfaces
> do not support symbolic link and always translate link.
> 
> For the security reason, I think it is reasonable to disable symbolic link
> support on Windows host for 9PFS. I can re-work this patch to adding a
> symbolic link check during path-walk operation and stop it when get a
> symbolic link.

It is OK to drop support for native symlinks on Windows. Most people use 
security_model=mapped anyway where symlinks are emulated, so symlinks would 
still work for guests, even if Windows host would not support native symlinks.

However insecure code is still a no go. So the issues identified so far still 
need to be resolved.

And patches must be presented in a way that would allow them being reviewed. 
In their current form they are not. 

Best regards,
Christian Schoenebeck



