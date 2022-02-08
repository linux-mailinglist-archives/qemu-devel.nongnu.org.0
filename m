Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 495554ADABA
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 15:04:59 +0100 (CET)
Received: from localhost ([::1]:49854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHR74-0001Fd-9q
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 09:04:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nHPTu-0006Yq-DG
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 07:20:26 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:56225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nHPTg-000183-3d
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 07:20:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=yzYwEd1lwe184pngUd5Rf63wxuwnAbuJM1z5/K6zUYo=; b=B25zTQZdntSSY684ZJsgGwGmW/
 iO1NVBcFms8vvSxGp4f7vF5NP60tK+Q8UsdMO3RnrJR66dC70XnQBb4gP+oD7FlA6jFzcGAMG7JP6
 LU4fr48XJiWOrsK+SkuD4Ko8UZyZnIjal6ezMLphTPk4WskRYh7bV1moSlDs/M4PLdSlpbaZFKiKE
 DckOZb8WfjwZgbkm/RtykPexLBn6nF7TpBgI0bcjsXNI2DXJOkxhvCWgOekQRPUMReZRNKIMMp7/4
 xn9KcHNNWhLrjElcnGj/HyGfRirTDwbhBjNDKKcyzqZjPSM20jFgTvWFei2M5sz2rDR8nU2qRj9vp
 +hz5p++5PGUxWupP5kl9V9jImE4nqA+ZWcxiJi+dvw2eTooHaalceV0whnRQs3tiB8sHDROu2HGHq
 gZbecv2+f3QUOkGRgfvLSCYjWOdx8LaSiG/cDdR9sIJZsgdzqW7yBkuEbpg1gmt6BgKfuw89iXq+X
 dnHYExWqzr8F0VsIwt6NyOedW+p9AUTjvBr+CNfol06qaEaUFs5PuLVU7CvvSKb+5exLcr4nWe+0O
 3d+qgfA1vJyr5BPXm55qwVMgB0zoEGmPiLPLAhKgZs9gwi8RRBC4oQXu3tCTLmVGNa9fdXnzTHCnO
 Qcf+l6BCtoUgLXUNtsHxi7dqUqxR3dhxnup34GVA8=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Fabian Franz <fabianfranz.oss@gmail.com>,
 Greg Kurz <groug@kaod.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
Subject: Re: [PATCH v5 06/11] 9p: darwin: Move
 XATTR_SIZE_MAX->P9_XATTR_SIZE_MAX
Date: Tue, 08 Feb 2022 13:20:08 +0100
Message-ID: <2797799.bNjLCV8H8p@silver>
In-Reply-To: <20220207224024.87745-7-wwcohen@gmail.com>
References: <20220207224024.87745-1-wwcohen@gmail.com>
 <20220207224024.87745-7-wwcohen@gmail.com>
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

On Montag, 7. Februar 2022 23:40:19 CET Will Cohen wrote:
> From: Keno Fischer <keno@juliacomputing.com>
> 
> Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> 
> Because XATTR_SIZE_MAX is not defined on Darwin,
> create a cross-platform P9_XATTR_SIZE_MAX instead.
> 
> [Will Cohen: - Adjust coding style
>              - Lower XATTR_SIZE_MAX to 64k
>              - Add explanatory context related to XATTR_SIZE_MAX]
> [Fabian Franz: - Move XATTR_SIZE_MAX reference from 9p.c to
>                  P9_XATTR_SIZE_MAX in 9p.h]
> Signed-off-by: Will Cohen <wwcohen@gmail.com>
> Signed-off-by: Fabian Franz <fabianfranz.oss@gmail.com>
> ---
>  hw/9pfs/9p.c |  2 +-
>  hw/9pfs/9p.h | 11 +++++++++++
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index 14e84c3bcf..7405352c37 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -3949,7 +3949,7 @@ static void coroutine_fn v9fs_xattrcreate(void
> *opaque) rflags |= XATTR_REPLACE;
>      }
> 
> -    if (size > XATTR_SIZE_MAX) {
> +    if (size > P9_XATTR_SIZE_MAX) {
>          err = -E2BIG;
>          goto out_nofid;
>      }
> diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
> index 1567b67841..6a1856b4dc 100644
> --- a/hw/9pfs/9p.h
> +++ b/hw/9pfs/9p.h
> @@ -479,4 +479,15 @@ struct V9fsTransport {
>      void        (*push_and_notify)(V9fsPDU *pdu);
>  };
> 
> +/*
> + * Darwin doesn't seem to define a maximum xattr size in its user
> + * space header, so manually configure it across platforms as 64k.
> + *
> + * Having no limit at all can lead to QEMU crashing during large g_malloc()
> + * calls. Because QEMU does not currently support macOS guests, the below
> + * preliminary solution only works due to its being a reflection of the limit of
> + * Linux guests.
> + */
> +#define P9_XATTR_SIZE_MAX 65536

It would be cleaner in a way like this:

#if defined(XATTR_SIZE_MAX)
/* Linux */
#define P9_XATTR_SIZE_MAX XATTR_SIZE_MAX
#elif defined(CONFIG_DARWIN)
/* darwin comment goes here */
#define P9_XATTR_SIZE_MAX 65536
#else
#error Missing definition for P9_XATTR_SIZE_MAX for this host system
#endif

Sorry, I haven't noticed that before. You actually had that wrapped into some
ifdefs in v2 before:

#if defined(CONFIG_DARWIN) && !defined(XATTR_SIZE_MAX)
...
#endif

> +
>  #endif



