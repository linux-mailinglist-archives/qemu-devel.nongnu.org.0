Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B39661A3608
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Apr 2020 16:36:27 +0200 (CEST)
Received: from localhost ([::1]:50800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jMYI6-0004wF-Py
	for lists+qemu-devel@lfdr.de; Thu, 09 Apr 2020 10:36:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40824)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jMYHG-0004R4-VJ
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 10:35:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1jMYHF-0000YI-SB
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 10:35:34 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:47376)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1jMYHF-0000Us-AV; Thu, 09 Apr 2020 10:35:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=Bg3qCZvGhY+5NiYRoM3rVYGyGV02LS/J1n0MOtScGEc=; 
 b=PICBcfYvfASJY48csWb1B9PKGYZPJL7OnFKzgI62a+rDRgbpxv9eHPrW9LyCVBCx3/YTeRXqcLbHHWfINzHQ3HfK05eNMJAk8m08V6eiopIz/HKnDApmAF5xGLmCSY0eACHfiW+WySUMtPp2k02LaezuXt3vH3iwVhYgBvq69SX9dKhKiCTR5RhrPVp9Q/pT4/LohoY9APbe9hVPxdBHuQj/hs+tV/JmR5IFZlGq3PBlZJpyiCIluA/F2O8BLiJYsYDT+V8XxSVCDKrYFBLtmPlWTXCYbi3ZCx3UZWohqHXNdKOxJb5C8Rw2zUc/r7KXeji/Fg+fEPwjfS+7rldPAA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jMYH8-0007yK-UC; Thu, 09 Apr 2020 16:35:26 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1jMYH8-0005Qr-KV; Thu, 09 Apr 2020 16:35:26 +0200
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 02/30] qcow2: Convert qcow2_get_cluster_offset() into
 qcow2_get_host_offset()
In-Reply-To: <7c21a1f3-e263-9175-2d6d-41aafba85f55@virtuozzo.com>
References: <cover.1584468723.git.berto@igalia.com>
 <65243debd4a41e1ebd13877c2e6c665759c37b38.1584468723.git.berto@igalia.com>
 <2f8f3cba-d4e4-49f2-722f-fc6cc96bdd65@redhat.com>
 <7c21a1f3-e263-9175-2d6d-41aafba85f55@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Thu, 09 Apr 2020 16:35:26 +0200
Message-ID: <w51d08g3exd.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Denis V . Lunev" <den@openvz.org>,
 Anton Nefedov <anton.nefedov@virtuozzo.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu 09 Apr 2020 09:57:59 AM CEST, Vladimir Sementsov-Ogievskiy wrote:
> What about squashing this:
>
> --- a/block/qcow2-cluster.c
> +++ b/block/qcow2-cluster.c
> @@ -615,32 +615,34 @@ int qcow2_get_host_offset(BlockDriverState *bs, uint64_t offset,
>           break;
>       case QCOW2_CLUSTER_ZERO_ALLOC:
>       case QCOW2_CLUSTER_NORMAL:
> +    {
> +        uint64_t host_cluster_offset = l2_slice & L2E_OFFSET_MASK;
> +        *host_offset = host_cluster_offset + offset_in_cluster;

Ok, that looks good (I'll put the brace on the 'case' line though).

Berto

