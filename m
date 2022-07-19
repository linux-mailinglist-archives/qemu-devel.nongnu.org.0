Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBD157A028
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 15:54:43 +0200 (CEST)
Received: from localhost ([::1]:36366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDngP-0002Gy-Hh
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 09:54:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1oDnIX-00052G-37
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:30:01 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:46182
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1oDnIT-0006rL-Cx
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:30:00 -0400
Received: from [192.168.178.59] (p57b42628.dip0.t-ipconnect.de [87.180.38.40])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id B118DDA0BBE;
 Tue, 19 Jul 2022 15:29:53 +0200 (CEST)
Message-ID: <a5bddc12-b800-66a9-ceeb-443e25fa3d15@weilnetz.de>
Date: Tue, 19 Jul 2022 15:29:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH] docs: Add caveats for Windows as the build platform
To: Bin Meng <bmeng.cn@gmail.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220719131521.764317-1-bin.meng@windriver.com>
In-Reply-To: <20220719131521.764317-1-bin.meng@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>

Am 19.07.22 um 15:15 schrieb Bin Meng:

> Commit cf60ccc3306c ("cutils: Introduce bundle mechanism") introduced
> a Python script to populate a bundle directory using os.symlink() to
> point to the binaries in the pc-bios directory of the source tree.
> Commit 882084a04ae9 ("datadir: Use bundle mechanism") removed previous
> logic in pc-bios/meson.build to create a link/copy of pc-bios binaries
> in the build tree so os.symlink() is the way to go.
>
> However os.symlink() may fail [1] on Windows if an unprivileged Windows
> user started the QEMU build process, which results in QEMU executables
> generated in the build tree not able to load the default BIOS/firmware
> images due to symbolic links not present in the bundle directory.
>
> This commits updates the documentation by adding such caveats for users
> who want to build QEMU on the Windows platform.
>
> [1] https://docs.python.org/3/library/os.html#os.symlink
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>   docs/about/build-platforms.rst | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
> index ebde20f981..1b297e87ee 100644
> --- a/docs/about/build-platforms.rst
> +++ b/docs/about/build-platforms.rst
> @@ -94,8 +94,16 @@ not tested anymore, so it is recommended to use one of the latest versions of
>   Windows instead.
>   
>   The project supports building QEMU with current versions of the MinGW
> -toolchain, either hosted on Linux (Debian/Fedora) or via MSYS2 on Windows.
> +toolchain, either hosted on Linux (Debian/Fedora) or via `MSYS2`_ on Windows.
> +A more recent Windows version is always prefered as it is less likely to have


s/prefered/preferred/


> +problems with building via MSYS2. The building process of QEMU involves some
> +Python scripts that call os.symlink() which needs special attention for the
> +build process to successfully complete. On newer versions of Windows 10,
> +unprivileged accounts can create symlinks if Developer Mode is enabled.
> +When Developer Mode is not available/enabled, the SeCreateSymbolicLinkPrivilege
> +privilege is required, or the process must be run as an administrator.
>   
>   .. _Homebrew: https://brew.sh/
>   .. _MacPorts: https://www.macports.org/
> +.. _MSYS2: https://www.msys2.org/
>   .. _Repology: https://repology.org/


With the fix above:

Reviewed-by: Stefan Weil <sw@weilnetz.de

Thanks!



