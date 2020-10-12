Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C6F28BD48
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 18:10:16 +0200 (CEST)
Received: from localhost ([::1]:59846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kS0Ot-0004lj-KS
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 12:10:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kRzy6-0008Sk-LZ; Mon, 12 Oct 2020 11:42:34 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:61655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kRzy3-0008OK-MJ; Mon, 12 Oct 2020 11:42:33 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 45C6A746335;
 Mon, 12 Oct 2020 17:42:26 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2306D74632C; Mon, 12 Oct 2020 17:42:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 21343746307;
 Mon, 12 Oct 2020 17:42:26 +0200 (CEST)
Date: Mon, 12 Oct 2020 17:42:26 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] Deprecate TileGX port
In-Reply-To: <20201012153408.9747-2-peter.maydell@linaro.org>
Message-ID: <d5d29e6-3fb9-927f-ae9e-67c67786391f@eik.bme.hu>
References: <20201012153408.9747-1-peter.maydell@linaro.org>
 <20201012153408.9747-2-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

On Mon, 12 Oct 2020, Peter Maydell wrote:
> Deprecate our TileGX target support:
> * we have no active maintainer for it
> * it has had essentially no contributions (other than tree-wide cleanups
>   and similar) since it was first added
> * the Linux kernel dropped support in 2018, as has glibc
>
> Note the deprecation in the manual, but don't try to print a warning
> when QEMU runs -- printing unsuppressable messages is more obtrusive
> for linux-user mode than it would be for system-emulation mode, and
> it doesn't seem worth trying to invent a new suppressible-error
> system for linux-user just for this.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> We discussed dropping this target last year:
> https://patchew.org/QEMU/20191012071210.13632-1-philmd@redhat.com/
> and before that in 2018, when Chen told us he didn't have time
> to work on tilegx any more:
> https://lists.gnu.org/archive/html/qemu-devel/2018-03/msg03955.html
> Given that tilegx is no longer in upstream Linux I think it makes sense
> to finally deprecate-and-drop our linux-user support for it.
>
> docs/system/deprecated.rst | 11 +++++++++++
> 1 file changed, 11 insertions(+)
>
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index 3a255591c34..e9097e089bb 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -387,6 +387,17 @@ The above, converted to the current supported format::
>
>   json:{"file.driver":"rbd", "file.pool":"rbd", "file.image":"name"}
>
> +linux-user mode CPUs
> +--------------------
> +
> +``tilegx`` CPUs (since 5.1.0)
> +'''''''''''''''''''''''''''''

Is that 5.2?

Regards,
BALATON Zoltan

> +
> +The ``tilegx`` guest CPU support (which was only implemented in
> +linux-user mode) is deprecated and will be removed in a future version
> +of QEMU. Support for this CPU was removed from the upstream Linux
> +kernel in 2018, and has also been dropped from glibc.
> +
> Related binaries
> ----------------
>
>

