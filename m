Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D07E50A70E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 19:26:42 +0200 (CEST)
Received: from localhost ([::1]:59038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhaZl-0005rk-9B
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 13:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nhZrU-0007bN-SX
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:40:57 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:28859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nhZrS-000321-W2
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:40:56 -0400
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-akSZjb5DOWOCFs7-Q14n0A-1; Thu, 21 Apr 2022 12:40:49 -0400
X-MC-Unique: akSZjb5DOWOCFs7-Q14n0A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 177FB85A5A8;
 Thu, 21 Apr 2022 16:40:48 +0000 (UTC)
Received: from bahia (unknown [10.39.192.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1DD740D016F;
 Thu, 21 Apr 2022 16:40:46 +0000 (UTC)
Date: Thu, 21 Apr 2022 18:40:46 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2 5/5] 9pfs: fix removing non-existent POSIX ACL xattr
 on macOS host
Message-ID: <20220421184046.52893981@bahia>
In-Reply-To: <b0b893bac2c584f1c92b2e6aa86d1308c87d5dbe.1650553693.git.qemu_oss@crudebyte.com>
References: <cover.1650553693.git.qemu_oss@crudebyte.com>
 <b0b893bac2c584f1c92b2e6aa86d1308c87d5dbe.1650553693.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 Apr 2022 17:07:55 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> When mapped POSIX ACL is used, we are ignoring errors when trying
> to remove a POSIX ACL xattr that does not exist. On Linux hosts we
> would get ENODATA in such cases, on macOS hosts however we get
> ENOATTR instead.
> 
> As we can be sure that ENOATTR is defined as being identical on Linux
> hosts (at least by qemu/xattr.h), it is safe to fix this issue by
> simply comparing against ENOATTR instead of ENODATA.
> 
> This patch fixes e.g. a command on Linux guest like:
> 
>   cp --preserve=mode old new
> 
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Link: https://lore.kernel.org/qemu-devel/2866993.yOYK24bMf6@silver/
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/9pfs/9p-posix-acl.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/9pfs/9p-posix-acl.c b/hw/9pfs/9p-posix-acl.c
> index eadae270dd..4b2cb3c66c 100644
> --- a/hw/9pfs/9p-posix-acl.c
> +++ b/hw/9pfs/9p-posix-acl.c
> @@ -65,7 +65,11 @@ static int mp_pacl_removexattr(FsContext *ctx,
>      int ret;
>  
>      ret = local_removexattr_nofollow(ctx, path, MAP_ACL_ACCESS);
> -    if (ret == -1 && errno == ENODATA) {
> +    /*
> +     * macOS returns ENOATTR (!=ENODATA on macOS), whereas Linux returns
> +     * ENODATA (==ENOATTR on Linux), so checking for ENOATTR is fine
> +     */
> +    if (ret == -1 && errno == ENOATTR) {
>          /*
>           * We don't get ENODATA error when trying to remove a
>           * posix acl that is not present. So don't throw the error
> @@ -115,7 +119,11 @@ static int mp_dacl_removexattr(FsContext *ctx,
>      int ret;
>  
>      ret = local_removexattr_nofollow(ctx, path, MAP_ACL_DEFAULT);
> -    if (ret == -1 && errno == ENODATA) {
> +    /*
> +     * macOS returns ENOATTR (!=ENODATA on macOS), whereas Linux returns
> +     * ENODATA (==ENOATTR on Linux), so checking for ENOATTR is fine
> +     */
> +    if (ret == -1 && errno == ENOATTR) {
>          /*
>           * We don't get ENODATA error when trying to remove a
>           * posix acl that is not present. So don't throw the error


