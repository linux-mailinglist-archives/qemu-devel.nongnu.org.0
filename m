Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CA74ACCA6
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 00:47:59 +0100 (CET)
Received: from localhost ([::1]:48534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHDjh-0006tS-Nt
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 18:47:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nHDgo-00062p-G9
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 18:44:58 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:50271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nHDgj-0006Ul-UI
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 18:44:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=ev5fwvFvICu7RK+3KEb+Rcllw8dMdE2opTOu3H51EaU=; b=K8XUYhsmXU96VQMZnZDg6i7JUS
 8uL8lIwn4A8/9Nq0xL4sNKtaW3Rm+9uPKlWe0amxaxyrM0z4V6SAUQFC8arVc3uviJofMg4eKIrHs
 xlNSaJNwqnWWYu/xDnBNsilN+61rBFIbJs3AIywGgeSE9s5+MVOx/7bi+Oaz46MARyi/TgCgi6Y5e
 hA7/s8EW1aijOgV8p6r0Lg5a23Q484BWT7UswwHkyzrnTRmQlP2HOBDNgYRFfSHz+GHP5ifprldAf
 oIYPYJ0WHTgC7bBmCS+hww9b65+7rjYxN8oD/3XLocZpG4jSSNUEJghshDnw5v4JwGOMAbhMAbXlT
 uDHkFW+piarNsNYiydju8p2DVMAp13BEDYJYXSoZm6d6TGRoZZ3WbP1TQ4JKDbmZz1bI3Rrejpj9z
 k69k26dDrqcvP+ICQs/cH4baTkGgGyvIl/4+BmLyUDEiXKd9HywtNnMDUGJRXfVzyB7ixsAD9XUll
 1nz6URF4iS5n/syCOUVUWmFUHj9HCKA4SyXVPMqkn4dgCPc05Xh0jMlQJSznBrVqWzm0RWdK3Q5Rl
 7namJL6bGyP5JMPNRAxF3wB+dEAaC/RYMIFGJofU6DLrBqOo87Ahsllo9dLiHHqTIjNFTn0H5SmZo
 l7e0xUOuh9KrroZe0/mu5RiKV5l4W0rtp4kxN1sZg=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
Subject: Re: [PATCH v5 10/11] 9p: darwin: meson: Allow VirtFS on Darwin
Date: Tue, 08 Feb 2022 00:44:40 +0100
Message-ID: <4132679.VdUcmsAXi6@silver>
In-Reply-To: <20220207224024.87745-11-wwcohen@gmail.com>
References: <20220207224024.87745-1-wwcohen@gmail.com>
 <20220207224024.87745-11-wwcohen@gmail.com>
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

On Montag, 7. Februar 2022 23:40:23 CET Will Cohen wrote:
> From: Keno Fischer <keno@juliacomputing.com>
> 
> To allow VirtFS on darwin, we need to check that pthread_fchdir_np is
> available, which has only been available since macOS 10.12.
> 
> Additionally, virtfs_proxy_helper is disabled on Darwin. This patch
> series does not currently provide an implementation of the proxy-helper,
> but this functionality could be implemented later on.
> 
> Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> [Michael Roitzsch: - Rebase for NixOS]
> Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> [Will Cohen: - Rebase to master]
> Signed-off-by: Will Cohen <wwcohen@gmail.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> [Will Cohen: - Add check for pthread_fchdir_np to virtfs
>              - Add comments to patch commit
>              - Note that virtfs_proxy_helper does not work
>                on macOS
>              - Adjust meson virtfs error note to specify macOS]
> Signed-off-by: Will Cohen <wwcohen@gmail.com>
> ---
>  fsdev/meson.build |  1 +
>  meson.build       | 14 ++++++++++----
>  2 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/fsdev/meson.build b/fsdev/meson.build
> index adf57cc43e..b632b66348 100644
> --- a/fsdev/meson.build
> +++ b/fsdev/meson.build
> @@ -7,6 +7,7 @@ fsdev_ss.add(when: ['CONFIG_FSDEV_9P'], if_true: files(
>    'qemu-fsdev.c',
>  ), if_false: files('qemu-fsdev-dummy.c'))
>  softmmu_ss.add_all(when: 'CONFIG_LINUX', if_true: fsdev_ss)
> +softmmu_ss.add_all(when: 'CONFIG_DARWIN', if_true: fsdev_ss)
> 
>  if have_virtfs_proxy_helper
>    executable('virtfs-proxy-helper',
> diff --git a/meson.build b/meson.build
> index 5f43355071..c1d13209ff 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1421,17 +1421,23 @@ if not get_option('dbus_display').disabled()
>    endif
>  endif
> 
> -have_virtfs = (targetos == 'linux' and
> +if targetos == 'darwin' and cc.has_function('pthread_fchdir_np')
> +  have_virtfs = have_system
> +else
> +  have_virtfs = (targetos == 'linux' and
>      have_system and
>      libattr.found() and
>      libcap_ng.found())
> +endif
> 
> -have_virtfs_proxy_helper = have_virtfs and have_tools
> +have_virtfs_proxy_helper = targetos != 'darwin' and have_virtfs and
> have_tools
> 
>  if get_option('virtfs').enabled()
>    if not have_virtfs
> -    if targetos != 'linux'
> -      error('virtio-9p (virtfs) requires Linux')
> +    if targetos != 'linux' and targetos != 'darwin'
> +      error('virtio-9p (virtfs) requires Linux or macOS')
> +    elif targetos == 'darwin' and not cc.has_function('pthread_fchdir_np')
> +      error('virtio-9p (virtfs) on Darwin requires the presence of pthread_fchdir_np')

Maybe call this "macOS" in this error message as well?

    error('virtio-9p (virtfs) requires the presence of pthread_fchdir_np on macOS')

>      elif not libcap_ng.found() or not libattr.found()
>        error('virtio-9p (virtfs) requires libcap-ng-devel and
> libattr-devel') elif not have_system



