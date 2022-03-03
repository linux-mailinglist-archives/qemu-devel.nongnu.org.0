Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2624CBDA0
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 13:22:46 +0100 (CET)
Received: from localhost ([::1]:49556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPkTk-0007Zm-VN
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 07:22:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nPkSl-0006rj-IK
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 07:21:43 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:35367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nPkSj-0005Ul-QK
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 07:21:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=9R8xgaGLBxRs5vRVWZaqPvVEV2Rrgm1G7IUrRBGtnvE=; b=QBYnLVWc//zLVnNCqeiq8Y6Ckz
 yk19dETucgcwB6MBAgzN5dRnpLgeLvdXM7AQOoj6m145/EfLkRdC+rbxNy2dUhBIV+ATlIwFoLq5p
 YRyHeZTZKFKDULjujkfCQgE4iAHfWcbJdv+1OrVW7MNnGrLLT7B7uSk61KKa/Lh5OsFwP8smztg+d
 YUjjAfiN9uuPHVOv6OzdQzIFhgvtohBdnafPnizSLXqYotZYnuZJa1HXQhP4yobgeGdwsvV9sJDGW
 QTQYm7Rxqd6Z93hggjK1lFzICcbQHMkqUAOJkm75ne12Hj5BVi3pkASxuKaZafNym8aWe0QuJgaN6
 tjSvjpA5/yrt8Caxl40/01g5Ppsyg3UnoPiBZ0xE7LxYzgLHYjzx5ANM+A6Oigt9/fJ2GRLIqN1eU
 R5P/3VWwFQGYdDgqz2zmFICs4JbSrCgPgSSHuHo7Wxq4tJtc6gFDKTSWrDhFBVcQ+sNkwfFkHEF98
 Lxg6t20AfHHS9uXJ6ov7vvR1yUrxHAFdqxUHV88u1k6aOFbJrfq2juSMEENkvakg4wwFFzgTz4LYa
 cPeewuNIvlGqkR7W+w/wd1Gf3DV5Lrq8XGVs/rWgkACaR+R5vr8l5EPD04c3XK12g/ytdfGLdwqex
 D8JWIiXkpPosvUBbiVWwZbYmem3He5ttPM3b8G23o=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] 9pfs: move qemu_dirent_dup() from osdep -> 9p-util
Date: Thu, 03 Mar 2022 13:21:37 +0100
Message-ID: <2363741.8zZX0mk4Jc@silver>
In-Reply-To: <E1nP9Oz-00043L-KJ@lizzy.crudebyte.com>
References: <E1nP9Oz-00043L-KJ@lizzy.crudebyte.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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

On Dienstag, 1. M=E4rz 2022 21:33:49 CET Christian Schoenebeck wrote:
> Function qemu_dirent_dup() is currently only used by 9pfs server, so move
> it from project global header osdep.h to 9pfs specific header 9p-util.h.
>=20
> Link:
> https://lore.kernel.org/qemu-devel/CAFEAcA_=3DHAUNomKD2wurSVaAHa5mrk22A1o=
HKLW
> UDjk7v6Khmg@mail.gmail.com/ Based-on:
> <20220227223522.91937-12-wwcohen@gmail.com>
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  hw/9pfs/9p-util.h    | 30 ++++++++++++++++++++++++++++++
>  include/qemu/osdep.h | 13 -------------
>  util/osdep.c         | 21 ---------------------
>  3 files changed, 30 insertions(+), 34 deletions(-)

Queued on 9p.next:
https://github.com/cschoenebeck/qemu/commits/9p.next

Thanks!

Best regards,
Christian Schoenebeck



