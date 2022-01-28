Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 446C949FE17
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 17:33:37 +0100 (CET)
Received: from localhost ([::1]:60528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDUBs-0003Tk-Bd
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 11:33:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nDThY-0008Kx-OO
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 11:02:17 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:36933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nDThV-0002v1-VO
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 11:02:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=gONd6Ks/rltAN32ZmIuHwFVm71xflVuhVlFKyq460qM=; b=rGwgQ3fgk7uaQ11BmafuC270wT
 MnGXsO/4MWJPA5DM11yJLjqLFb/HoN2KzCxLFFvpSTH0cAY95Q1RylXz3IoAL02//ZZjVT9Vms/iv
 lC5elrDNO3DHCfFj+2N6XXl+r+DmANwES7cFRtJAaVJO2KwDYG7yoULll+oR3Mf2Id8h+Bh6ggH+l
 CB247+OBeGPl3Rj5grfU609Ek2rOvtMEIIeb+IcwSprz06X0xBfVDYfkgiZehXJ8Pm0Osz5/GG/fa
 8GTtFguRNX6CRBNvThcQ5xGxJFVJ0nrvgBlJ3g6hkiLnCHaHsbzIjDFwGs5makhVX62WA5yGStp5B
 cdHlkukH7K3kTB51EipS6LG28KaiH9Y+xhdb4k7IH9IMV64Gs78CFw/gttEFgSyTQgU6yUCpUPupG
 mQmW3xYIMsexmkbnA3M0ZSv2Xs77WBt21byvYD1lNjv90VwUwF++U+K+7LfP3Lb0+Ks6zQmqfI3kS
 FUxn9+vLjBUspLWRm5lC+31LTP7gnLsBK9wow+sA30CIQuGJNErFOKB2DiY1y3V9dFeRWET7JWhBR
 3KK6HRS5/xHzJ0PFq4tyJHfwuh7fMdUP2lfOewmiVDwRb794F6OrIRl+VhW9cIwmga9uxO1LG2bjN
 SRDukPxfsSj49bldzy6bS97ZD0s8m6cfc0rYMpF98=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
Subject: Re: [PATCH v3 06/11] 9p: darwin: Compatibility defn for XATTR_SIZE_MAX
Date: Fri, 28 Jan 2022 17:02:10 +0100
Message-ID: <1988489.7yoloB28dZ@silver>
In-Reply-To: <20220128005611.87185-7-wwcohen@gmail.com>
References: <20220128005611.87185-1-wwcohen@gmail.com>
 <20220128005611.87185-7-wwcohen@gmail.com>
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

On Freitag, 28. Januar 2022 01:56:06 CET Will Cohen wrote:
> From: Keno Fischer <keno@juliacomputing.com>
> 
> Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> [Will Cohen: - Adjust coding style
>              - Lower XATTR_SIZE_MAX to 64k]
> Signed-off-by: Will Cohen <wwcohen@gmail.com>
> ---
>  hw/9pfs/9p.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index 9b0c057e9c..611ac14c4c 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -3943,6 +3943,13 @@ out_nofid:
>      v9fs_string_free(&name);
>  }
> 
> +#if defined(CONFIG_DARWIN) && !defined(XATTR_SIZE_MAX)
> +/*
> + * Darwin doesn't seem to define a maximum xattr size in its user
> + * space header, so manually configure it as 64k.
> + */
> +#define XATTR_SIZE_MAX 65536
> +#endif

Yes, but that's not explaining the reason why this is set to 64k. The reason 
is that this a preliminary solution which reflects the limit of Linux guests 
for now, as we don't support macOS guests yet, and not limiting this at all 
would have lead to QEMU crashing on huge g_malloc() calls.

>  static void coroutine_fn v9fs_xattrcreate(void *opaque)
>  {
>      int flags, rflags = 0;




