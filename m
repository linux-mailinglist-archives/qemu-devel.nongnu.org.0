Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE0A57E4D
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jun 2019 10:36:46 +0200 (CEST)
Received: from localhost ([::1]:47656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgPtc-00077J-Bx
	for lists+qemu-devel@lfdr.de; Thu, 27 Jun 2019 04:36:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53468)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mlevitsk@redhat.com>) id 1hgPsi-00064E-Hw
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 04:35:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1hgPsh-0003if-DK
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 04:35:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40766)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>)
 id 1hgPse-0003eN-VS; Thu, 27 Jun 2019 04:35:45 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A8CBD86674;
 Thu, 27 Jun 2019 08:35:40 +0000 (UTC)
Received: from dhcp-4-67.tlv.redhat.com (dhcp-4-67.tlv.redhat.com [10.35.4.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E8CBD5D9DE;
 Thu, 27 Jun 2019 08:35:36 +0000 (UTC)
Message-ID: <4015072d8d51cf8a43001cb03722f577216d8df1.camel@redhat.com>
From: Maxim Levitsky <mlevitsk@redhat.com>
To: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
Date: Thu, 27 Jun 2019 11:35:35 +0300
In-Reply-To: <20190626215301.30733-1-jsnow@redhat.com>
References: <20190626215301.30733-1-jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Thu, 27 Jun 2019 08:35:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [Qemu-block] [PATCH] block/qcow: Improve error
 when opening qcow2 files as qcow
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
Cc: Qemu-Trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
 radmehrsaeed7@gmail.com, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2019-06-26 at 17:53 -0400, John Snow wrote:
> Reported-by: radmehrsaeed7@gmail.com
> Fixes: https://bugs.launchpad.net/bugs/1832914
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  block/qcow.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/block/qcow.c b/block/qcow.c
> index 6dee5bb792..a9cb6ae0bd 100644
> --- a/block/qcow.c
> +++ b/block/qcow.c
> @@ -156,7 +156,12 @@ static int qcow_open(BlockDriverState *bs, QDict *options, int flags,
>          goto fail;
>      }
>      if (header.version != QCOW_VERSION) {
> -        error_setg(errp, "Unsupported qcow version %" PRIu32, header.version);
> +        error_setg(errp, "qcow (v%d) does not support qcow version %" PRIu32,
> +                   QCOW_VERSION, header.version);
> +        if (header.version == 2 || header.version == 3) {
> +            error_append_hint(errp, "Try the 'qcow2' driver instead.");
> +        }
> +
>          ret = -ENOTSUP;
>          goto fail;
>      }

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky


