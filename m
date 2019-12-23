Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2020612947F
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Dec 2019 12:00:27 +0100 (CET)
Received: from localhost ([::1]:55652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ijLRp-0005Ef-BU
	for lists+qemu-devel@lfdr.de; Mon, 23 Dec 2019 06:00:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37615)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1ijLQs-0004nU-M9
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 05:59:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1ijLQr-0001UK-Gy
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 05:59:26 -0500
Received: from 9.mo1.mail-out.ovh.net ([178.32.108.172]:48123)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1ijLQr-0001Np-9j
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 05:59:25 -0500
Received: from player750.ha.ovh.net (unknown [10.109.146.211])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 5E2A51A4172
 for <qemu-devel@nongnu.org>; Mon, 23 Dec 2019 11:59:15 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player750.ha.ovh.net (Postfix) with ESMTPSA id 4765ED91A9D8;
 Mon, 23 Dec 2019 10:59:11 +0000 (UTC)
Date: Mon, 23 Dec 2019 11:59:09 +0100
From: Greg Kurz <groug@kaod.org>
To: Jiajun Chen <chenjiajun8@huawei.com>
Subject: Re: [PATCH] 9pfs: local: Fix possible memory leak in local_link()
Message-ID: <20191223115909.524ca244@bahia.lan>
In-Reply-To: <20191220094934.21232-1-chenjiajun8@huawei.com>
References: <20191220094934.21232-1-chenjiajun8@huawei.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 11385662809383213351
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvddvtddgvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeehtddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 178.32.108.172
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 20 Dec 2019 17:49:34 +0800
Jiajun Chen <chenjiajun8@huawei.com> wrote:

> There is a possible memory leak while local_link return -1 without free
> odirpath and oname.
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Jaijun Chen <chenjiajun8@huawei.com>
> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
> ---

Applied to 9p-next.

Thanks.

>  hw/9pfs/9p-local.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> index 4708c0bd89..491b08aee8 100644
> --- a/hw/9pfs/9p-local.c
> +++ b/hw/9pfs/9p-local.c
> @@ -947,7 +947,7 @@ static int local_link(FsContext *ctx, V9fsPath *oldpath,
>      if (ctx->export_flags & V9FS_SM_MAPPED_FILE &&
>          local_is_mapped_file_metadata(ctx, name)) {
>          errno = EINVAL;
> -        return -1;
> +        goto out;
>      }
>  
>      odirfd = local_opendir_nofollow(ctx, odirpath);


