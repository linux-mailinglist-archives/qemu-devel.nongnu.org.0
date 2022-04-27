Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A395113C8
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 10:49:54 +0200 (CEST)
Received: from localhost ([::1]:54566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njdMv-0002dx-T1
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 04:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1njdJm-0008Q9-TY
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 04:46:39 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:49429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1njdJl-0007hD-2d
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 04:46:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=EaSbJBRYVj+P3aKk0e8EvwNSvTxqgvM2PjUSALdPpEw=; b=n9YK7N7E4CvkXJ/V23Ijpjol4W
 eCF3VrprA886Lv+3VciXZOLnYjIjtUA+BStnTxdxRqc09MZZgIoIuKDZgQUZFytrZLxmadM0iuTtI
 mFhLdG+aMjXIwyV19mpr5p28CYJtY+OccqZfraAb9GjXAJj8MvrZav4aiA2mYSmdCgSKcXfG9QHtL
 iPodfG798+P7txOnCu1XoAGwxDi7wDkf42Qdv96A9VcJB2Glww9Oy3qdwD63t/My4uBrlEWsD924S
 HljG3MYfNJjcza7Y0reSbcbV+3HyjAnxKIrUOiSdlw8ffP2PFvf25xRWtwcJmw+JjKhPbXFLL91Dz
 +0RqIfEGsi0w8/joB8jTtkrrDn4DsQSI/xTaspqh7vkoKULgn0/HuHhlwI6SD2jJVc09GeJBxAovD
 snfOa77EIjpZN/+Wc9hEkNIRWaK+PV8sWRJpOnW9ly94kO2RbypLZChvAjxoJXNz42Ds4d5wLzXBq
 40sbAds78SFSV1+UROSl72yvuL1Qn/0qssvl9AXYfT8O/nSuOqdaRp3k+croexIxh2rkPsDxKCxbf
 Y2hHXIcZXmT71IKhHvR01O5SCFf9EIituXg0JgDCF3kAP8MPhUE2MMXDnlECbGqXR1Hbp3dwJVh7I
 Cn7hnNt/SoWR84Lp5fAO+bT3XUYj0YPSjl69nPMXM=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] 9pfs: local: Do not follow symlink in _nofollow
Date: Wed, 27 Apr 2022 10:46:31 +0200
Message-ID: <3805748.cZurrHcIA4@silver>
In-Reply-To: <20220427024545.18298-1-akihiko.odaki@gmail.com>
References: <20220427024545.18298-1-akihiko.odaki@gmail.com>
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

On Mittwoch, 27. April 2022 04:45:45 CEST Akihiko Odaki wrote:
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>  hw/9pfs/9p-local.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> index d42ce6d8b82..def8afdb4d6 100644
> --- a/hw/9pfs/9p-local.c
> +++ b/hw/9pfs/9p-local.c
> @@ -365,7 +365,7 @@ static int fchmodat_nofollow(int dirfd, const char
> *name, mode_t mode) if (fd == -1) {
>          /* In case the file is writable-only and isn't a directory. */
>          if (errno == EACCES) {
> -            fd = openat_file(dirfd, name, O_WRONLY, 0);
> +            fd = openat_file(dirfd, name, O_WRONLY | O_NOFOLLOW, 0);

O_NOFOLLOW flag is always added inside openat_file() implementation:

https://github.com/qemu/qemu/blob/master/hw/9pfs/9p-util.h#L60

So this change is not necessary AFAICS.

>          }
>          if (fd == -1 && errno == EISDIR) {
>              errno = EACCES;



