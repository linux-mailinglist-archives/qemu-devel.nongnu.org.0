Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC06303A9B
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 11:44:16 +0100 (CET)
Received: from localhost ([::1]:34048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4LpX-0002qK-1i
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 05:44:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1l4Lnc-0002Nj-Q8
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 05:42:17 -0500
Received: from kerio.kamp.de ([195.62.97.192]:33261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1l4LnX-0004Im-8A
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 05:42:16 -0500
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 11:42:01 +0100
Received: (qmail 32486 invoked from network); 26 Jan 2021 10:42:05 -0000
Received: from ac58.vpn.kamp-intra.net (HELO ?172.20.250.58?)
 (pl@kamp.de@::ffff:172.20.250.58)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES128-SHA encrypted) ESMTPA;
 26 Jan 2021 10:42:05 -0000
Subject: Re: [PATCH] meson: honor --enable-rbd if cc.links test fails
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210126102748.341403-2-pbonzini@redhat.com>
From: Peter Lieven <pl@kamp.de>
Message-ID: <c3ef3dfe-1fd2-c68f-d921-bfa433f20153@kamp.de>
Date: Tue, 26 Jan 2021 11:42:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210126102748.341403-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Am 26.01.21 um 11:27 schrieb Paolo Bonzini:
> If the link test failed, compilation proceeded with RBD disabled,
> even if --enable-rbd was used on the configure command line.
> Fix that.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  meson.build | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index f991d4274d..5943aa8a51 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -690,15 +690,21 @@ if not get_option('rbd').auto() or have_block
>    librbd = cc.find_library('rbd', has_headers: ['rbd/librbd.h'],
>                             required: get_option('rbd'),
>                             kwargs: static_kwargs)
> -  if librados.found() and librbd.found() and cc.links('''
> -    #include <stdio.h>
> -    #include <rbd/librbd.h>
> -    int main(void) {
> -      rados_t cluster;
> -      rados_create(&cluster, NULL);
> -      return 0;
> -    }''', dependencies: [librbd, librados])
> -    rbd = declare_dependency(dependencies: [librbd, librados])
> +  if librados.found() and librbd.found()
> +    if cc.links('''
> +      #include <stdio.h>
> +      #include <rbd/librbd.h>
> +      int main(void) {
> +        rados_t cluster;
> +        rados_create(&cluster, NULL);
> +        return 0;
> +      }''', dependencies: [librbd, librados])
> +      rbd = declare_dependency(dependencies: [librbd, librados])
> +    elif get_option('rbd').enabled()
> +      error('could not link librados')
> +    else
> +      warning('could not link librados, disabling')
> +    endif
>    endif
>  endif
>  


That was fast, tank you.


Tested-by: Peter Lieven <pl@kamp.de>


Peter



