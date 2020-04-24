Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 980711B7E02
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Apr 2020 20:42:29 +0200 (CEST)
Received: from localhost ([::1]:48282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jS3HQ-0003Pd-C7
	for lists+qemu-devel@lfdr.de; Fri, 24 Apr 2020 14:42:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42806)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jS3GJ-0002AR-Bp
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 14:41:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jS3GI-0003O0-R5
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 14:41:19 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:36255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jS3GI-0003KK-9W; Fri, 24 Apr 2020 14:41:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=OqaxqUTc753QtjLloI/nimYGhMIk7My7mLj3f13xTcA=; 
 b=ps+G3tC6UozSNQU9c6nWdcFuSLXOEljFYoC3rsz6w7NlfPhNxj/hmpHpt7XmIC76PNOOJa8U7TXuqgAgoSiEap/AGboJ2Pg8YNysgqLyMMf//o3v85/6Ugl2qlXZBhqrxblxRN4WtHfGeZhJJNT74cllsSWbONWnUD0peuWMjZj0yHGm8sXBno8yE8xgr/ySH+FqL/drdzLYpGkOWKClhqxTnBQExEUkKjEXgv54ZCsvUwlhPoG+Fwb5HgYnecx5g2y4Ii8ZkmMWu0Gzn364jmcfGHWFBZD3Kp6SVMx6Zv1xP+MCAYe7dv+LfQ1wqySiZ4bXPSW7ZVvGtOeSb0IH9A==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jS3GD-0003ur-AT; Fri, 24 Apr 2020 20:41:13 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1jS3GD-0008H6-0u; Fri, 24 Apr 2020 20:41:13 +0200
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 24/30] qcow2: Clear the L2 bitmap when allocating a
 compressed cluster
In-Reply-To: <971a6e4b-ba44-4280-89fa-d454cddf12e1@virtuozzo.com>
References: <cover.1584468723.git.berto@igalia.com>
 <6d596d82ed62615a8565b661691a06bfaf32237e.1584468723.git.berto@igalia.com>
 <w51r1wcn7eu.fsf@maestria.local.igalia.com>
 <1606ecb5-98ea-fefb-bb98-2ecda1d65f5c@redhat.com>
 <w51o8rgn6j6.fsf@maestria.local.igalia.com>
 <57ac1a2f-1632-1a00-b18d-1fc2169175b6@redhat.com>
 <971a6e4b-ba44-4280-89fa-d454cddf12e1@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Fri, 24 Apr 2020 20:41:12 +0200
Message-ID: <w51ftcsn2uv.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/24 13:02:51
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Denis V . Lunev" <den@openvz.org>,
 Anton Nefedov <anton.nefedov@virtuozzo.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri 24 Apr 2020 08:15:04 PM CEST, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
> AFAIK, now compressed clusters can't be used in scenarios with guest,
> as qcow2 driver doesn't support rewriting them.

You can write to those images just fine, it's just not efficient because
you have to COW the compressed clusters.

> Or am I wrong? And we normally don't combine normal and compressed
> clusters together in one image.

As soon as you start writing to an image with compressed clusters you'll
have a combination of both.

But it's true that you don't have an image with compressed clusters if
what you're looking for is performance. So I wouldn't add support for
this if it complicates things too much.

Berto

