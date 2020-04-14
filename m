Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8597D1A847F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Apr 2020 18:19:14 +0200 (CEST)
Received: from localhost ([::1]:33658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOOHJ-0005Rt-JG
	for lists+qemu-devel@lfdr.de; Tue, 14 Apr 2020 12:19:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49783)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jOOFF-0004Jh-R5
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 12:17:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1jOOFA-00048i-A2
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 12:17:05 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:36226)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1jOOF9-00047z-OA; Tue, 14 Apr 2020 12:17:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=KMhVJnl1t+vI+3Es4o58nmfl88f8zgNM9txq68QwWOM=; 
 b=Pju2Drp/Nr0Z2p9qlS9eVpMtNU3A/7wdubqOlMu0W73sMY3wbQGm3GTJ8vsLvNDdHKjihIUAvteGftEce9tTSkSR5aFo91b53bw24K5mBXLXoE0zGzXEfRbxGBNwhYZkgNsMZum7/1QnIYOm/LLwHlrG+DM8XFbAoAd+8Dzhp/zdB9T9aaoBYdbjZNPOgvCkGz9Ko/vQICofrmJdjFMd66N5TrBkpNwYHStgHNqUI2jV5LimMFQRHJRpl7cAV0JpDG3df3HjHevonepitDueuC6ma+u8hdxoq92d43R56NtNqhBmKPHf6UshCrnYMAzncZxHI4TPtr7+PY79A20j+A==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jOOF4-00088q-OH; Tue, 14 Apr 2020 18:16:54 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1jOOF4-0004zk-Eh; Tue, 14 Apr 2020 18:16:54 +0200
From: Alberto Garcia <berto@igalia.com>
To: Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 11/30] qcow2: Add l2_entry_size()
In-Reply-To: <81446480-40cc-3e6f-ac0f-8b18422ae9f4@redhat.com>
References: <cover.1584468723.git.berto@igalia.com>
 <fd0f93353a218ff4518f34ebdbca05c2fc0f1085.1584468723.git.berto@igalia.com>
 <58d1fa17-91ea-9f8d-c39a-4141783d1234@virtuozzo.com>
 <w51y2qy5kd6.fsf@maestria.local.igalia.com>
 <81446480-40cc-3e6f-ac0f-8b18422ae9f4@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Tue, 14 Apr 2020 18:16:54 +0200
Message-ID: <w51o8rurqix.fsf@maestria.local.igalia.com>
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
 Anton Nefedov <anton.nefedov@virtuozzo.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue 14 Apr 2020 06:01:42 PM CEST, Eric Blake <eblake@redhat.com> wrote:
>>> And all occurrences of pure '8' (not many of them exist)
>> 
>> I think most/all nowadays only refer to the number of bits per byte.
>
> CHAR_BIT (from <limits.h>) is good for that.

Wow, ok, I wonder if that actually makes the code more readable, but
I'll take it into account when writing the patch, thanks.

Berto

