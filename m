Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E734BD90A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 11:19:25 +0100 (CET)
Received: from localhost ([::1]:34920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM5mu-0004C6-Cl
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 05:19:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1nM5hA-0001v8-L4; Mon, 21 Feb 2022 05:13:28 -0500
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:41708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1nM5h4-0008EV-Px; Mon, 21 Feb 2022 05:13:28 -0500
X-IronPort-AV: E=Sophos;i="5.88,385,1635199200"; d="scan'208";a="22392466"
Received: from nat-inria-interne-52-gw-01-bso.bordeaux.inria.fr (HELO begin)
 ([194.199.1.52]) by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2022 11:13:17 +0100
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@gnu.org>) id 1nM5gz-00EMj1-LA;
 Mon, 21 Feb 2022 11:13:17 +0100
Date: Mon, 21 Feb 2022 11:13:17 +0100
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] configure: Disable capstone and slirp in the
 --without-default-features mode
Message-ID: <20220221101317.7fweehy56mntpilv@begin>
References: <20220221090647.150184-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220221090647.150184-1-thuth@redhat.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
Received-SPF: softfail client-ip=192.134.164.83;
 envelope-from=samuel.thibault@gnu.org; helo=mail2-relais-roc.national.inria.fr
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665,
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas Huth, le lun. 21 févr. 2022 10:06:47 +0100, a ecrit:
> For the users, it looks a little bit weird that capstone and slirp are
> not disabled automatically if they run the configure script with the
> "--without-default-features" option, so let's do that now.
> Note: fdt is *not* changed accordingly since this affects the targets
> that we can build, so disabling fdt automatically here might have
> unexpected side-effects for the users.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Acked-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  I thought I sent out that patch a couple of weeks ago already, but
>  I cannot find it in the archives, so I likely missed to send it
>  correctly. Anyway, sorry if you've got this twice!
> 
>  configure | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/configure b/configure
> index 3a29eff5cc..36d10d95bb 100755
> --- a/configure
> +++ b/configure
> @@ -361,9 +361,14 @@ slirp_smbd="$default_feature"
>  # are included in the automatically generated help message)
>  
>  # 1. Track which submodules are needed
> -capstone="auto"
> +if test "$default_feature" = no ; then
> +  capstone="disabled"
> +  slirp="disabled"
> +else
> +  capstone="auto"
> +  slirp="auto"
> +fi
>  fdt="auto"
> -slirp="auto"
>  
>  # 2. Support --with/--without option
>  default_devices="true"
> -- 
> 2.27.0

