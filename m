Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5041B0DE6
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Apr 2020 16:07:05 +0200 (CEST)
Received: from localhost ([::1]:36500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQX4i-0002ZZ-Vu
	for lists+qemu-devel@lfdr.de; Mon, 20 Apr 2020 10:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41988 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jQX3d-0001lk-Sq
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 10:05:58 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jQX3Q-00067G-HE
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 10:05:57 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:55696)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jQX3N-00065O-ES; Mon, 20 Apr 2020 10:05:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=plbxoMXUYMWzjDoSI+eKXMnCKDtiDsG+THeGGnzv4/I=; 
 b=am1mHe/oUGdKgbqSXpWm102aLCRA73HGtG1lLcQJZEIOcQijeIinznxZgFLyNbXfuxhc4N0OMGiXEDRyhWpYqnILENCHI35X1eIHJIl7ChKcANAu39mX0gitxIaCIUf2AYM3nhHSsm5vijQuEgmy4D/42m5DNiMLyG42AyXVXFCnvIB62jSoY0jL4ZmDUgqqnOxWDBLNsjMf56AzTUfwa7N1tAgF6Dk9HIZpne0Yy2UbiokfQofnC/jZ3g9fM07+cscswqP3pKbqK2RzVl4y3B0xdHW04K+IIgfJiHtC/tIA3cgYVxRaQ8OFhJAJK52xkZeNUoSiwJn7F4S1Hg6SIg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jQX3J-0008PH-Jx; Mon, 20 Apr 2020 16:05:37 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1jQX3J-0001J5-8t; Mon, 20 Apr 2020 16:05:37 +0200
From: Alberto Garcia <berto@igalia.com>
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Subject: Re: [PATCH v4 6/9] file-posix: Support BDRV_REQ_ZERO_WRITE for
 truncate
In-Reply-To: <20200420133214.28921-7-kwolf@redhat.com>
References: <20200420133214.28921-1-kwolf@redhat.com>
 <20200420133214.28921-7-kwolf@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Mon, 20 Apr 2020 16:05:37 +0200
Message-ID: <w51sggyp80e.fsf@maestria.local.igalia.com>
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

On Mon 20 Apr 2020 03:32:11 PM CEST, Kevin Wolf wrote:
> For regular files, we always get BDRV_REQ_ZERO_WRITE behaviour from the
> OS, so we can advertise the flag and just ignore it.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

