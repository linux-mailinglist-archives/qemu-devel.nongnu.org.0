Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 058324AC24C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 16:03:07 +0100 (CET)
Received: from localhost ([::1]:45054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH5Xl-0002bq-DE
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 10:03:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nH4zf-0007Mu-AL
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 09:27:52 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:41413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nH4zc-0006Pc-FD
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 09:27:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=3wMG8yU9GjCT6JFl5jrKD+16hEnf9Vg/maX6xzhjsIo=; b=lDCmsiIWB9sstWBahTAlY0+DKI
 4rmxSAHc59WQ62Mj3430NXOMTAJBqndnu6ecX+ZLj+tF0l1xyDGFuFvTSFbfqaDsj+p78FGtW6pZF
 QZZmhG0Nv883yJx4JfFOYycZbjjWv8qAIEsI8A/fR/qqU8NBe1qU9TyPS6pOGmlKH1E9fpPkLLnWx
 d2vUKcKD7bKqTQlx6yYFxCYS/ZRLyUXsH1rXWjIE+cN/52BwPWCGXzX92IsY26/N9TgfAkjd1IceP
 E9Sf4CEQxv9SCEBAuJ3v/h7Ryr5X1nT+9CZ7Gs2qirZqzBxmFFcR+QvB24ZbTcd4o4qCP8nZd2jFT
 XPzu8XEnroChHroHDTpNJWsykNBf1vUyPqFfMcWeKyuAkV/HXDEJWPCNF2TElKnMgnnSjfGt5zatO
 p50ckW1ix+zUARUeqAFqRz0Vnn4kwghmnDIPk4ZOyQd2nW9hBtDzjv34gNNn8DJEsd+eZb7yBkVCz
 VFz96TvkFvZuOH5/038Km686wvtyZJTxxdBnKQJ6coreJtgXdlRp/dCY0mBfimpd1VVIM8jlZWXZc
 /k0XvquG800/Xrh/QLkN+qnuqTM/WOo1zUo7euzdj2zkYD8lUEWTATFbb2NEJYouN2iKxF6Pelg+o
 kcoWUJVvHX4n6Fo5Ma69VRHXoObeebWYjYseAnne4=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Will Cohen <wwcohen@gmail.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>, hi@alyssa.is,
 Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>
Subject: Re: [PATCH v4 10/11] 9p: darwin: meson: Allow VirtFS on Darwin
Date: Mon, 07 Feb 2022 15:27:45 +0100
Message-ID: <1906604.JvqJJlWBnf@silver>
In-Reply-To: <20220206200719.74464-11-wwcohen@gmail.com>
References: <20220206200719.74464-1-wwcohen@gmail.com>
 <20220206200719.74464-11-wwcohen@gmail.com>
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

On Sonntag, 6. Februar 2022 21:07:18 CET Will Cohen wrote:
> From: Keno Fischer <keno@juliacomputing.com>
> 
> Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> [Michael Roitzsch: - Rebase for NixOS]
> Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> [Will Cohen: - Rebase to master]
> Signed-off-by: Will Cohen <wwcohen@gmail.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> [Will Cohen: - Add check for pthread_fchdir_np to virtfs]
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
> index 5f43355071..6b4adf7e15 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1421,17 +1421,23 @@ if not get_option('dbus_display').disabled()
>    endif
>  endif
> 
> -have_virtfs = (targetos == 'linux' and
> +if targetos == 'darwin' and cc.has_function('pthread_fchdir_np')
> +  have_virtfs = have_system

As you are going for a v5 anyway: I would add an error message here if 
pthread_fchdir_np() is not available. Because it is a bit frustrating for 
users if their options silently got ignored without any indication why.

> +else
> +  have_virtfs = (targetos == 'linux' and
>      have_system and
>      libattr.found() and
>      libcap_ng.found())
> +endif
> 
> -have_virtfs_proxy_helper = have_virtfs and have_tools
> +have_virtfs_proxy_helper = targetos == 'linux' and have_virtfs and
> have_tools
> 
>  if get_option('virtfs').enabled()
>    if not have_virtfs
> -    if targetos != 'linux'
> -      error('virtio-9p (virtfs) requires Linux')
> +    if targetos != 'linux' and targetos != 'darwin'
> +      error('virtio-9p (virtfs) requires Linux or Darwin')
> +    elif targetos == 'darwin' and not cc.has_function('pthread_fchdir_np')
> +      error('virtio-9p (virtfs) on Darwin requires the presence of
> pthread_fchdir_np') elif not libcap_ng.found() or not libattr.found()
>        error('virtio-9p (virtfs) requires libcap-ng-devel and
> libattr-devel') elif not have_system



