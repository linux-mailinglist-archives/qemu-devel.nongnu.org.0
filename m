Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20246D6119
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 13:17:41 +0200 (CEST)
Received: from localhost ([::1]:47554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJyM7-0000aq-JS
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 07:17:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47623)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1iJyIX-00079i-2w
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 07:13:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1iJyIU-0006ZK-JR
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 07:13:56 -0400
Received: from 6.130.60.178.static.reverse-mundo-r.com ([178.60.130.6]:51929
 helo=fanzine.igalia.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1iJyIR-0006Oi-Uv; Mon, 14 Oct 2019 07:13:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=YkLdicxX46ih5g/ufOe1Xk38geLi4YEmvcP2hYp14MY=; 
 b=ScGreFsGRCXUMA/+qKeRR+T3d6MBVu1SbaIYLfpITuuyVTWUkobXuWOLjEKmrKnzTIEGz71GBYrd99p1cdA5xDmiuBX+kYMNzSH6Pn7vWCy9OzVR7pAH7cpUUDc/SPfyenqJ0rw6xuTGPKRRHtMU/Q6DoktpSNeMoPnXotP/s1Di5tEiiEs8pyGYlmzE8LZgCclJKmYhZJhqZgr8svDUbgW25OZU6m4AX4gQIC5xUfgEHdgMD2ox0HsosDXtkkc9B6OUgXmQ0D8q230ehE2vxygddevLzToPeyWo0XnKLZ5GDckYjg79C6mZRJJqF0HuQQ1SQFpn+1WL+/5yOEfODw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1iJyIK-0004K4-KY; Mon, 14 Oct 2019 13:13:44 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1iJyIK-0005Kn-Hg; Mon, 14 Oct 2019 13:13:44 +0200
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-devel\@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH] block: Reject misaligned write requests with
 BDRV_REQ_NO_FALLBACK
In-Reply-To: <6bbe4db2-a4fd-ee2b-1b79-879658b81753@virtuozzo.com>
References: <20191013204853.1046-1-berto@igalia.com>
 <6bbe4db2-a4fd-ee2b-1b79-879658b81753@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Mon, 14 Oct 2019 13:13:44 +0200
Message-ID: <w515zkrtw9j.fsf@maestria.local.igalia.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Anton Nefedov <anton.nefedov@virtuozzo.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon 14 Oct 2019 12:11:52 PM CEST, Vladimir Sementsov-Ogievskiy wrote:
> 13.10.2019 23:48, Alberto Garcia wrote:
>> The BDRV_REQ_NO_FALLBACK flag means that an operation should only be
>> performed if it can be offloaded or otherwise performed efficiently.
>
> As I know, BDRV_REQ_NO_FALLBACK is for write-zeros only, not about
> offloading..

I just used the same wording from the documentation in block.h:

/* Execute the request only if the operation can be offloaded or otherwise
 * be executed efficiently, but return an error instead of using a slow
 * fallback. */

Berto

