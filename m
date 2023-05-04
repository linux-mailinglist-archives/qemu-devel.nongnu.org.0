Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE186F694A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 12:50:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puWWc-0000zv-F6; Thu, 04 May 2023 06:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1puWWZ-0000zY-RI
 for qemu-devel@nongnu.org; Thu, 04 May 2023 06:49:24 -0400
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1puWWX-0005Zc-Pc
 for qemu-devel@nongnu.org; Thu, 04 May 2023 06:49:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=dDZ4BOOeBzVrDRxMoQ/FImJmA9/R9EIjNerSl4JZRgY=; b=WhHKj1xWVeGo5lo8FkCf+XhQJ5
 N7WR5ZOE/hKRwCR18hOhi2MTID6CJyvij3yTU0fhsFCJe+p1vxGMyXmEii79b2ez2hgmT1zN1ozZD
 u8jJ46wM3DNSP02OatO3ASeEEtuqyqjLdEjYM65JaIe22wGb3z3wxAWSUai9nrZUaYFAipy/E3dJh
 Q6L0m7pSzDXClToD7e5sAcp5DXHSO26RQqDzNs0lOPx7FRzFjYpbEw1HoD/BymcmA/62SUpXfArQJ
 BOA5zO7SMTVio8eownHSwp7w3kk0iLd7WbmOhpTcq+1GrkBX0fx/HeU+H+WtMKb1MKFIRn+N44+cG
 JT/zoMdfyiRUjBnzhr8InSvNbjk5FHizeszGJKh2XWBCgBDVs31dVFAVzsR10b8BciEAN+MbxZ+QD
 FTm1ln9VILygjnUxnbzgNediGhc4+6wfXc/eJT6sV+vgVmymxLxsXTlEO4XsF4blKYHaP1hENxVCm
 gTR6bTIssYMVAHinKVPt+MTSrhbPaK/nF7Yny+GfoDca2AB8Uo2UlxloCUvwMD1GSQ2S+Yv75+Q0T
 cmCjU6PhQN+68Lf1YcwE8cbxY3D4Vdi0At9zzVKsrM6AKWVStTQK9MAALR1qT9QCVKjVWBTfwSMym
 4yCe5CheiWBaVvrArRXBs3D625iJVHpWyogxre/js=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: venture@google.com, Peter Foley <pefoley@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@linaro.org>,
 Peter Foley <pefoley@google.com>
Subject: Re: [PATCH v3] Don't require libcap-ng for virtfs support
Date: Thu, 04 May 2023 12:49:17 +0200
Message-ID: <2765335.zQaF1C8VJ4@silver>
In-Reply-To: <20230503130757.863824-1-pefoley@google.com>
References: <5706940.3l9IZQ4Y0r@silver>
 <20230503130757.863824-1-pefoley@google.com>
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wednesday, May 3, 2023 3:07:56 PM CEST Peter Foley wrote:
> It's only required for the proxy helper.
> 
> Add a new option for the proxy helper rather than enabling it
> implicitly.
> 
> Change-Id: I95b73fca625529e99d16b0a64e01c65c0c1d43f2
> Signed-off-by: Peter Foley <pefoley@google.com>
> ---

LGTM now, queued on 9p.next:
https://github.com/cschoenebeck/qemu/commits/9p.next

Thanks!

Best regards,
Christian Schoenebeck

>  meson.build                   | 12 +++++++++---
>  meson_options.txt             |  2 ++
>  scripts/meson-buildoptions.sh |  4 ++++
>  3 files changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 77d42898c8..a46bc67cdb 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1759,12 +1759,17 @@ have_virtfs = get_option('virtfs') \
>               error_message: 'virtio-9p (virtfs) requires Linux or macOS') \
>      .require(targetos == 'linux' or cc.has_function('pthread_fchdir_np'),
>               error_message: 'virtio-9p (virtfs) on macOS requires the presence of pthread_fchdir_np') \
> -    .require(targetos == 'darwin' or (libattr.found() and libcap_ng.found()),
> -             error_message: 'virtio-9p (virtfs) on Linux requires libcap-ng-devel and libattr-devel') \
> +    .require(targetos == 'darwin' or libattr.found(),
> +             error_message: 'virtio-9p (virtfs) on Linux requires libattr-devel') \
>      .disable_auto_if(not have_tools and not have_system) \
>      .allowed()
>  
> -have_virtfs_proxy_helper = targetos != 'darwin' and have_virtfs and have_tools
> +have_virtfs_proxy_helper = get_option('virtfs_proxy_helper') \
> +    .require(targetos != 'darwin', error_message: 'the virtfs proxy helper is incompatible with macOS') \
> +    .require(have_virtfs, error_message: 'the virtfs proxy helper requires that virtfs is enabled') \
> +    .disable_auto_if(not have_tools) \
> +    .require(libcap_ng.found(), error_message: 'the virtfs proxy helper requires libcap-ng') \
> +    .allowed()
>  
>  if get_option('block_drv_ro_whitelist') == ''
>    config_host_data.set('CONFIG_BDRV_RO_WHITELIST', '')
> @@ -3911,6 +3916,7 @@ if have_block
>    summary_info += {'Block whitelist (ro)': get_option('block_drv_ro_whitelist')}
>    summary_info += {'Use block whitelist in tools': get_option('block_drv_whitelist_in_tools')}
>    summary_info += {'VirtFS support':    have_virtfs}
> +  summary_info += {'VirtFS Proxy Helper support': have_virtfs_proxy_helper}
>    summary_info += {'Live block migration': config_host_data.get('CONFIG_LIVE_BLOCK_MIGRATION')}
>    summary_info += {'replication support': config_host_data.get('CONFIG_REPLICATION')}
>    summary_info += {'bochs support':     get_option('bochs').allowed()}
> diff --git a/meson_options.txt b/meson_options.txt
> index 2471dd02da..908b4b7fd9 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -272,6 +272,8 @@ option('vhost_user_blk_server', type: 'feature', value: 'auto',
>         description: 'build vhost-user-blk server')
>  option('virtfs', type: 'feature', value: 'auto',
>         description: 'virtio-9p support')
> +option('virtfs_proxy_helper', type: 'feature', value: 'auto',
> +       description: 'virtio-9p proxy helper support')
>  option('libvduse', type: 'feature', value: 'auto',
>         description: 'build VDUSE Library')
>  option('vduse_blk_export', type: 'feature', value: 'auto',
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
> index d4369a3ad8..3bb9dd3504 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -176,6 +176,8 @@ meson_options_help() {
>    printf "%s\n" '  vhost-vdpa      vhost-vdpa kernel backend support'
>    printf "%s\n" '  virglrenderer   virgl rendering support'
>    printf "%s\n" '  virtfs          virtio-9p support'
> +  printf "%s\n" '  virtfs-proxy-helper'
> +  printf "%s\n" '                  virtio-9p proxy helper support'
>    printf "%s\n" '  vmnet           vmnet.framework network backend support'
>    printf "%s\n" '  vnc             VNC server'
>    printf "%s\n" '  vnc-jpeg        JPEG lossy compression for VNC server'
> @@ -461,6 +463,8 @@ _meson_option_parse() {
>      --disable-virglrenderer) printf "%s" -Dvirglrenderer=disabled ;;
>      --enable-virtfs) printf "%s" -Dvirtfs=enabled ;;
>      --disable-virtfs) printf "%s" -Dvirtfs=disabled ;;
> +    --enable-virtfs-proxy-helper) printf "%s" -Dvirtfs_proxy_helper=enabled ;;
> +    --disable-virtfs-proxy-helper) printf "%s" -Dvirtfs_proxy_helper=disabled ;;
>      --enable-vmnet) printf "%s" -Dvmnet=enabled ;;
>      --disable-vmnet) printf "%s" -Dvmnet=disabled ;;
>      --enable-vnc) printf "%s" -Dvnc=enabled ;;
> 



