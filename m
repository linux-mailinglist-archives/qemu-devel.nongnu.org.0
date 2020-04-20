Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7910B1B0D92
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Apr 2020 15:59:19 +0200 (CEST)
Received: from localhost ([::1]:36278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQWxC-0002r7-F2
	for lists+qemu-devel@lfdr.de; Mon, 20 Apr 2020 09:59:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38746 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jQWvx-0001ut-59
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 09:58:02 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jQWvw-00041d-J9
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 09:58:00 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:54124)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jQWvs-0003Q6-0G; Mon, 20 Apr 2020 09:57:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=ZLIjY+gU19tOKmlfGYIeLELFELQbZKYWj3mZXUb4lBg=; 
 b=G3EToCVHhTsDzI51Z6is4HZY3Xpkg9rWCm8vxpfjKThc1cCwicQESkwvyWfqGFgEAbS5KZKQdAwzlUvwpbiWonchQegyMhw+s75BxQy+KSBQCz90zadRi89PqadJEOpX1B2G4w/0bmfdVatPkKibDatkoNmqUYEPRhwSw/fouzX15YGn+6bBtPLRANX0/4Avh4hpI+KHMw03epyyLwlNuQ+98TiuXQJmGabaW4F8449TMYcpqqZBrajBYqwhyrXpQDA8YkWBBaqIUBVwOelXDIE7nd02pIvxsBCAPk0KZpnr3NYFm8qrXZdbx6OAjnx09pflnmt3DB06VH/mkDXZPQ==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jQWvm-0007Mq-9i; Mon, 20 Apr 2020 15:57:50 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1jQWvm-0000Dp-0I; Mon, 20 Apr 2020 15:57:50 +0200
From: Alberto Garcia <berto@igalia.com>
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Subject: Re: [PATCH v4 1/9] block: Add flags to BlockDriver.bdrv_co_truncate()
In-Reply-To: <20200420133214.28921-2-kwolf@redhat.com>
References: <20200420133214.28921-1-kwolf@redhat.com>
 <20200420133214.28921-2-kwolf@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Mon, 20 Apr 2020 15:57:49 +0200
Message-ID: <w518siqqmxu.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs1p.gnu.org: First seen = 2020/04/20
 08:31:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Received-From: 178.60.130.6
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon 20 Apr 2020 03:32:06 PM CEST, Kevin Wolf wrote:
> This adds a new BdrvRequestFlags parameter to the .bdrv_co_truncate()
> driver callbacks, and a supported_truncate_flags field in
> BlockDriverState that allows drivers to advertise support for request
> flags in the context of truncate.
>
> For now, we always pass 0 and no drivers declare support for any flag.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

