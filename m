Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDDB127E69
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 15:47:13 +0100 (CET)
Received: from localhost ([::1]:57500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iiJYe-00079d-Ci
	for lists+qemu-devel@lfdr.de; Fri, 20 Dec 2019 09:47:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44571)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qemu_oss@crudebyte.com>) id 1iiJTy-0001sP-VN
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 09:42:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <qemu_oss@crudebyte.com>) id 1iiJTx-0001Jw-S1
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 09:42:22 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:36883)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <qemu_oss@crudebyte.com>)
 id 1iiJTx-0001Bl-Be
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 09:42:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=gIZMH5ZTrXvAP1Rz9HE8IqlS0/3Jb4nNgyaeweODaHo=; b=PJGAO8xdooXxKwo/Sc3kDOzFPa
 DdYCG0IRxgXGKn+l3fuUlhKdg+YaYvmA3qLEPT9JFm/Ys9Sl1MLOKBZsQpMeqOQtD0z2gytLheyvZ
 4Wmn1o0NFAUNYKBi+8OlYjv96EmNoF5D1R0tiVYSl198b3fjNQdpyqewKFNZ762y9HMKFlJ6iZ6pa
 60Ch2IpCYrij5S0sqvYDAHN41cTIfADqeN1eY/G8/6Pud1JPkzNBdLD9UefJ7d9ApIS4MVJQmdR+O
 8aiExGvB6GVlodJHif7ExNspN88CdjYwItkMXzrhIUwEMCMVxdENQ7bbZfWaJ4rMpI8Hg4bQaL7aS
 vPWGp2Hb1oFfGbq7zCQk7pfcxbarUj61aW3pkDkFxCgczPwTsYk+eeJVKKtbXJ9HWGec/6+hjYI7C
 vCSq7kpvQOrqkENrHr5xcmmDqsK/tua8EmxcvkowmK4lBoH/4KEODvyeSPZiiT3r+OQn2AsC4eozH
 J9aNEQy+QeFMUAJ+Gu2hn52pE9tGXRyvztMzBARniw8Lp2bgcYEqWyd+ESCMmVJjDFIPirnvreVB/
 +/Xd6ps4bsOyvAnivcnPtO5D718QgICGlDToj5+4uUUxNoaTIOPA7XaNrJiaecTC4zJzefTyYYiE/
 6bWYUFRBFIw2AFsRcMyWaofcumZS222dxJyCv6ECc=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Jiajun Chen <chenjiajun8@huawei.com>, Greg Kurz <groug@kaod.org>,
 xiexiangyou@huawei.com
Subject: Re: [PATCH] 9pfs: local: Fix possible memory leak in local_link()
Date: Fri, 20 Dec 2019 15:42:17 +0100
Message-ID: <38461169.jQibMN2RfJ@silver>
In-Reply-To: <20191220094934.21232-1-chenjiajun8@huawei.com>
References: <20191220094934.21232-1-chenjiajun8@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 5.189.157.229
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

On Freitag, 20. Dezember 2019 10:49:34 CET Jiajun Chen wrote:
> There is a possible memory leak while local_link return -1 without free
> odirpath and oname.
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Jaijun Chen <chenjiajun8@huawei.com>
> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

> ---
>  hw/9pfs/9p-local.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> index 4708c0bd89..491b08aee8 100644
> --- a/hw/9pfs/9p-local.c
> +++ b/hw/9pfs/9p-local.c
> @@ -947,7 +947,7 @@ static int local_link(FsContext *ctx, V9fsPath *oldpath,
> if (ctx->export_flags & V9FS_SM_MAPPED_FILE &&
>          local_is_mapped_file_metadata(ctx, name)) {
>          errno = EINVAL;
> -        return -1;
> +        goto out;
>      }
> 
>      odirfd = local_opendir_nofollow(ctx, odirpath);

Best regards,
Christian Schoenebeck



