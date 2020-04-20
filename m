Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 637AE1B0D99
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Apr 2020 16:01:16 +0200 (CEST)
Received: from localhost ([::1]:36336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQWz5-0004vm-Ee
	for lists+qemu-devel@lfdr.de; Mon, 20 Apr 2020 10:01:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39480 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jQWxA-0003WI-5I
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 09:59:29 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jQWx9-00063Z-TF
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 09:59:15 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:58135)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jQWwt-0005dE-Gz; Mon, 20 Apr 2020 09:58:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=LeoAtYY1FShat2ItZ+XGZlFIghhDf1ruJxhzE7YU//M=; 
 b=j+sfluQLtBDCrxVMNbPTo3GMDkj2U89pqofigraQaAe0y7G7RfMfgC/eR9qrg+N7KeDmAUO+liMButeBVe5/ZKO4EgkUgjJ8YDxPHH+g/gbQHl6bwOXxyzNObg6kDWFj7bKyUSJjfADKRO93qICn0+lZvXuG9Fldl1S54zIFoTehy0pHxJToSBeH8lO7TqUBcke620DRCb8CquQkmRQ6BoJ3RhBnLGqXnw+/JtnBrLo8+XI/Ugv2kuqbgdgR/4clhRFVgd3YJpelvWM6OeU6J8j9EAh5+Yux8LBhLC7hN2/0Qb3brMBzbmPnIFkZJSA/slA7uNdCemDKT+gWmH2pKA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jQWwr-0007UJ-Hi; Mon, 20 Apr 2020 15:58:57 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1jQWwr-0000Jh-77; Mon, 20 Apr 2020 15:58:57 +0200
From: Alberto Garcia <berto@igalia.com>
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Subject: Re: [PATCH v4 2/9] block: Add flags to bdrv(_co)_truncate()
In-Reply-To: <20200420133214.28921-3-kwolf@redhat.com>
References: <20200420133214.28921-1-kwolf@redhat.com>
 <20200420133214.28921-3-kwolf@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Mon, 20 Apr 2020 15:58:57 +0200
Message-ID: <w515zduqmvy.fsf@maestria.local.igalia.com>
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

On Mon 20 Apr 2020 03:32:07 PM CEST, Kevin Wolf wrote:
> Now that block drivers can support flags for .bdrv_co_truncate, expose
> the parameter in the node level interfaces bdrv_co_truncate() and
> bdrv_truncate().
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

