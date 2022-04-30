Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8970E515CE0
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 14:26:28 +0200 (CEST)
Received: from localhost ([::1]:41574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkmB9-0006gT-75
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 08:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nkm8K-0005eF-B4; Sat, 30 Apr 2022 08:23:33 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:59503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nkm8I-0003st-Bp; Sat, 30 Apr 2022 08:23:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=E8HAoi6nEDpfpV67DFRDPpfHkmIi6booaPdi6TrMtJY=; b=AqprIV479VIVpeVIdMZYFuMg0H
 3GC+pjU1WgAMsmi+YeMxkfly4JIvluEOBoix1qrkX8nr8l++0pJYzY5rUu5WodZLmhJOVN2SdhcXN
 CW1iXi5M5i6Yr+HqVgaq6z641NBcKfiNumLQInfD4Z4PGZYdZYw4voe28jMiSbeqdEtzn+L7QbopI
 +lT+D+sMPC/Hni0PLQH8P+l5vqO3SLAN+4Bo0uRrHDOGK9YAfl0LvkF7Cb8bNz3XOpJDhJ62JM2OW
 ssrqC2Xwcf7DX9COHhJFSvANGIBF/d7gXAMoEITLy53Q7NbPxA/TWIZblOFVNWAWs51LbOoEdW0Tx
 4mZNeNBA==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Greg Kurz <groug@kaod.org>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Keno Fischer <keno@juliacomputing.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-stable@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Guohuai Shi <guohuai.shi@windriver.com>
Subject: Re: [PATCH v5 0/6] 9pfs: macOS host fixes (resend)
Date: Sat, 30 Apr 2022 14:23:21 +0200
Message-ID: <7340702.jVfSTs2t5R@silver>
In-Reply-To: <cover.1651228000.git.qemu_oss@crudebyte.com>
References: <cover.1651228000.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
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

On Freitag, 29. April 2022 12:26:40 CEST Christian Schoenebeck wrote:
> A bunch of fixes for recently (in QEMU 7.0) added 9p support on macOS hosts.
> 
> Note: there are still issues to address with case-insensitive file systems
> on macOS hosts. I sent a separate RFC on that icase issue:
> https://lore.kernel.org/qemu-devel/1757498.AyhHxzoH2B@silver/
> 
> v4 -> v5:
> 
>   * Check return value of snprintf() instead of strlen(filename).
>     [patch 2]
> 
> Christian Schoenebeck (6):
>   9pfs: fix qemu_mknodat(S_IFREG) on macOS
>   9pfs: fix qemu_mknodat(S_IFSOCK) on macOS
>   9pfs: fix wrong encoding of rdev field in Rgetattr on macOS
>   9pfs: fix wrong errno being sent to Linux client on macOS host
>   9pfs: fix removing non-existent POSIX ACL xattr on macOS host
>   9pfs: fix qemu_mknodat() to always return -1 on error on macOS host
> 
>  hw/9pfs/9p-posix-acl.c   | 12 +++++--
>  hw/9pfs/9p-util-darwin.c | 54 +++++++++++++++++++++++++++++--
>  hw/9pfs/9p-util.h        | 69 ++++++++++++++++++++++++++++++++++++++++
>  hw/9pfs/9p.c             |  4 ++-
>  4 files changed, 134 insertions(+), 5 deletions(-)

Queued on 9p.next:
https://github.com/cschoenebeck/qemu/commits/9p.next

Thanks!

I just sent a PR:
https://lore.kernel.org/all/cover.1651319081.git.qemu_oss@crudebyte.com/

Best regards,
Christian Schoenebeck


[Resent this message due to mail delivery error from nongnu.org lists]



