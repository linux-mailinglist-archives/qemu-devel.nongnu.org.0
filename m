Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AB06EC85B
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:05:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqs80-0005Nk-CW; Mon, 24 Apr 2023 05:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pqs7x-0005N9-Vn
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:04:54 -0400
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pqs7v-0000hv-VH
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:04:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=zR7QwzsLfi+uSgnatzPU2bscH4B8RTSIPWW5ovEON0Q=; b=g2sBMAkWfIVzc7jKjcyhtxo6oo
 xL0ickNBHe8YaQDOL4UEmUu0mTs15SozzRwCrXesFne4BUU6YoRggLrHqOtiV7R1VFyKfN37NSb6M
 GdwdkjaDht3ZCFRoFTT42IigBo0N4owxthQqEAKqKfnkl5GtfJc6y+ohYL6ubrQFWtV+gezY+zfYn
 0fyb33ojEysS9RdXfCmun10kSQ7qRhwIEYit37k1UdLwK57IvxPS9g+OtSkjFQ59y8xhyBrstHRM8
 GVxS/g5MTYtkQu+bJz2ttGs9BHN7dgfjLKxoIlZ0dtNznoG57Rvh3ThPHrGFFKYIZ6AWPV/Lyg6au
 IAignWw3yu0a6KbgHqQx+Dtk0PF0mQR5SA+4qk5oJfpNJvB4hPhkrezR45+9hxSZv/GxAMqLvJ1qA
 yPLHi0Isd8CcL+rzHqGeux66qi7UFA9H0A8ApwV9QZXdFORISE3oRoo5R1fN/B2Wj6UH+hG3DqIrz
 fH/sap68IdAsXZHd8iMClpJ0/YLBNnVex/IstwksVQdlKLtAei4JNVC6hJf198+OYohXioYiuQZho
 n5BYRpliR8u5JUlqw2WXWJ6fDQkMtJvrupvBZYS7nQmt13Mdr6xH5uQ4WocigT9d9RR65zMRdM3Gc
 +wV/OcxPpE6eJKJWJvfTVmG5ZZFlX7AUomsW5Z8/Q=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: venture@google.com, Peter Foley <pefoley@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@linaro.org>,
 Peter Foley <pefoley@google.com>
Subject: Re: [PATCH] Don't require libcap-ng for virtfs support
Date: Mon, 24 Apr 2023 11:04:47 +0200
Message-ID: <6278798.ENyYtN1ivr@silver>
In-Reply-To: <20230421135327.1778365-1-pefoley@google.com>
References: <20230421135327.1778365-1-pefoley@google.com>
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

On Friday, April 21, 2023 3:53:27 PM CEST Peter Foley wrote:
> It's only required for the proxy helper.
> 
> Signed-off-by: Peter Foley <pefoley@google.com>
> ---
>  meson.build | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index c44d05a13f..1d4888b1c0 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1759,12 +1759,12 @@ have_virtfs = get_option('virtfs') \
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
> +have_virtfs_proxy_helper = targetos != 'darwin' and have_virtfs and have_tools and libcap_ng.found()

Well, I don't know how many people actually use the 9p proxy, if at all, but
don't you think there should be at least a warning or some kind of output e.g.
in the configure summary that QEMU would build without 9p proxy support just
because of a missing lib, instead of silently disabling it?

For macOS hosts we didn't care so far, because proxy is not implemented there
and probably never will.

>  
>  if get_option('block_drv_ro_whitelist') == ''
>    config_host_data.set('CONFIG_BDRV_RO_WHITELIST', '')
> 




