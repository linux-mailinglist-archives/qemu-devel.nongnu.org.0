Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3B978BE0
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 14:36:53 +0200 (CEST)
Received: from localhost ([::1]:51808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hs4tY-0003Qg-Jo
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 08:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34066)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <piaojun@huawei.com>) id 1hs4se-00032A-IK
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 08:35:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <piaojun@huawei.com>) id 1hs4sd-00020o-KK
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 08:35:56 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:41412 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <piaojun@huawei.com>) id 1hs4sd-0001ls-7H
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 08:35:55 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 3EA4B938F556F2090C56;
 Mon, 29 Jul 2019 20:35:44 +0800 (CST)
Received: from [10.45.6.52] (10.45.6.52) by smtp.huawei.com (10.3.19.214) with
 Microsoft SMTP Server id 14.3.439.0; Mon, 29 Jul 2019 20:35:43 +0800
To: Stefan Hajnoczi <stefanha@redhat.com>, <virtio-fs@redhat.com>,
 <qemu-devel@nongnu.org>
References: <20190726091103.23503-1-stefanha@redhat.com>
 <20190726091103.23503-3-stefanha@redhat.com>
From: piaojun <piaojun@huawei.com>
Message-ID: <e83e2463-5239-e5c0-cc44-e1e0b74df37c@huawei.com>
Date: Mon, 29 Jul 2019 20:35:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190726091103.23503-3-stefanha@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.45.6.52]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.35
Subject: Re: [Qemu-devel] [Virtio-fs] [PATCH 2/5] virtiofsd: prevent
 lo_lookup() NULL pointer dereference
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

Hi Stefan,

On 2019/7/26 17:11, Stefan Hajnoczi wrote:
> Most lo_do_lookup() have already checked that the parent inode exists.
> lo_lookup() hasn't and can therefore hit a NULL pointer dereference when
> lo_inode(req, parent) returns NULL.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  contrib/virtiofsd/passthrough_ll.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/contrib/virtiofsd/passthrough_ll.c b/contrib/virtiofsd/passthrough_ll.c
> index 9ae1381618..277a17fc03 100644
> --- a/contrib/virtiofsd/passthrough_ll.c
> +++ b/contrib/virtiofsd/passthrough_ll.c
> @@ -766,6 +766,10 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
>  	struct lo_data *lo = lo_data(req);
>  	struct lo_inode *inode, *dir = lo_inode(req, parent);
>  
> +	if (!dir) {
> +		return EBADF;
> +	}
> +

I worry about that dir will be released or set NULL just after NULL
checking. Or could we use some lock to prevent the simultaneity?

Thanks,
Jun

>  	memset(e, 0, sizeof(*e));
>  	e->attr_timeout = lo->timeout;
>  	e->entry_timeout = lo->timeout;
> 

