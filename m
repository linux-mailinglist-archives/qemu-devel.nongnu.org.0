Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D155B5A258F
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 12:12:03 +0200 (CEST)
Received: from localhost ([::1]:56164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRWJh-0004ey-So
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 06:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oRWHN-0000rL-Fe
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 06:09:37 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:36039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oRWHL-0008P0-Fl
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 06:09:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=iJKAaoGfKRJHYC7PGsTdL12HyMbkhVXgDCnREFbsp/A=; b=kYqYbqiIpu1cEm5JzyfPB0+YuW
 Eio5uRSiOrDxqjQ0tmOFlTXDb7umBf1KF+Uzd1VxDk0K5R+drWeUSrPLhLHg7FvrO3kPBEx9uIp1R
 gT81g1lMg/QR4gFCRgt9rAGziGKJrxCchw1x5xVkU369/3iop5KveB4L+pAtWLUtJb1THTs2KKFZj
 /37on+sJznYCZLtyPtOkccA4QNQBUJJTSJ8het7RvqN16dVRni/o1Cdn3OaH+z5grDz/wDyKUVbad
 OR62R/EgskWxaG3I38GjQ1cvtnFwtR5zlRRHlguCG7C85YuAIYGVQevI1nizlVhjGQS3AA76IpKCo
 ZdJH0LNllXHQ9GTz2d+uwwB14Oi87AJ59w00D0jM/zi91ADFzBfi863ZnJcVVPpvQJNNSHvnJ74NF
 sVcHMuoxuGtpgUycfQxaRbP64OLfl0fJewdFEQ26czavfUxPH2OvPL7y4S4/oFW69u9OECI0ZRs2/
 7M/QDNp5GNxhbH2DBRAhP8oz62Dtd3gZfoMXJ66sbBUtqtuSXfSUTfrG4/Y9CsmH+hSq5ihAstxDu
 W+Nvvnf/ZX+b+0V7dkjT9qYdgQYhZrvSFHnrRjPJ2u0+aLAojGor5IFtOSTZb82KVwSzFVJvnp1cA
 557HJzcglkHQKMqt0AWUnY4e9ClwwD+3H0ae7VUYY=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Greg Kurz <groug@kaod.org>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH 09/51] fsdev/virtfs-proxy-helper: Use
 g_mkdir_with_parents()
Date: Fri, 26 Aug 2022 12:09:25 +0200
Message-ID: <1709102.QJTYiT9k8f@silver>
In-Reply-To: <20220824094029.1634519-10-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-10-bmeng.cn@gmail.com>
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

On Mittwoch, 24. August 2022 11:39:47 CEST Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Use the same g_mkdir_with_parents() call to create a directory on
> all platforms.

The same would be g_mkdir(), not g_mkdir_with_parents(), so please use that 
instead.

> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>  fsdev/virtfs-proxy-helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
> index 2dde27922f..d0cf76d6d1 100644
> --- a/fsdev/virtfs-proxy-helper.c
> +++ b/fsdev/virtfs-proxy-helper.c
> @@ -639,7 +639,7 @@ static int do_create_others(int type, struct iovec
> *iovec) if (retval < 0) {
>              goto err_out;
>          }
> -        retval = mkdir(path.data, mode);
> +        retval = g_mkdir_with_parents(path.data, mode);
>          break;
>      case T_SYMLINK:
>          retval = proxy_unmarshal(iovec, offset, "ss", &oldpath, &path);




