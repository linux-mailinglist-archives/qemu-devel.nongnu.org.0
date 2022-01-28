Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BF649FC46
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 15:59:50 +0100 (CET)
Received: from localhost ([::1]:41534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDSj7-0001u8-0K
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 09:59:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nDSYy-0001UE-9J; Fri, 28 Jan 2022 09:49:20 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:39909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nDSYv-0007y2-VW; Fri, 28 Jan 2022 09:49:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=7yTj4xa93wJDLNPKe2E8tDNDq9Vdu1fp2hNGxGssVJI=; b=D0wXFL0ic1BINgFbNu4NCZxM5f
 RznlFdG53ytbrbUNPXETJnyQKewHeCp6eFELliEMD03QxVGotRs7zRmJC9ln9kuiKCIaEjIikaYVe
 LJcR7p5j4PtsuCHufh+YHfd/vXlxbJcWse6OD/oixNZ+rlq7zZhfNtPcJ72hG3YtJjaX0duv+URht
 6ESLtEWO88F61tus9fzZf8W01kV5XTgMHJCn0r3huLwA9428v09yMonjajL0vqI8VzGY6nErCB9dw
 ZhogTgPs8GpH1CsURmDkUC8NYKmjtCXcwoVcu5WxpydlLYlMHzJBM39SldXM/tgaH65i3MVz8qGHA
 OiQixrK6h6eePwc4SJ1JDtCT/CUNiAwbVOQdsQDwO9ArNUfNc+1efuRj1grNBPvJYFOz2PbgEF2KM
 NAYPvcPZtEcoXOt9QSuc8kevNr2wf/wrr3wvTLVo02QeVdj3qvk3s+o6ECdzJQnP9QMfm/64AZ2+X
 57muFl62APICgzpD373xBAipAhrRLUy0coVshRbe3ZF4Bz2lGySB7aiVjhIhs5ZQuq9bnFapAHY6Z
 +SHa1uI43FqsnH9w1L1A2hTe9jF3vndR7x1yx6bSXKGs56f/5uU1yVSpduO+XMIhtkxNgS40uVjRv
 +E91sdl0BkPjE/Z9v+VZ/ryeZh0MO5Lllx64U5tm8=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Vitaly Chikunov <vt@altlinux.org>, Greg Kurz <groug@kaod.org>,
 ldv@altlinux.org, qemu-stable@nongnu.org
Subject: Re: [PATCH] 9pfs: Fix segfault in do_readdir_many caused by struct
 dirent overread
Date: Fri, 28 Jan 2022 15:49:07 +0100
Message-ID: <2086833.qgTTZoEYMS@silver>
In-Reply-To: <2533498.9Ea8Rob0xc@silver>
References: <20220127212734.218900-1-vt@altlinux.org>
 <2533498.9Ea8Rob0xc@silver>
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

On Freitag, 28. Januar 2022 15:43:10 CET Christian Schoenebeck wrote:
> Also I would prefer g_malloc0() over g_malloc().

Never mind about that one. g_malloc0() with immediate subsequent memcpy() and 
exact same size argument would be pointless.

> Then by adding a variable for the d_reclen yes/no case, overall code can be
> reduced. So I would suggest something like this instead:
> 
> struct dirent *
> qemu_dirent_dup(struct dirent *dent)
> {
> #if defined _DIRENT_HAVE_D_RECLEN
>     /* Avoid use of strlen() if there's d_reclen. */
>     const size_t sz = dent->d_reclen;
> #else
>     /* Fallback to a most portable way. */
>     const size_t sz = offsetof(struct dirent, d_name) +
>                       strlen(dent->d_name) + 1;
> #endif
>     struct dirent *dst = g_malloc(sz);
>     return memcpy(dst, dent, sz);
> }

Best regards,
Christian Schoenebeck



