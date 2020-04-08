Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE001A2805
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Apr 2020 19:36:05 +0200 (CEST)
Received: from localhost ([::1]:39112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jMEcO-00047G-JW
	for lists+qemu-devel@lfdr.de; Wed, 08 Apr 2020 13:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51091)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jMEbc-0003be-Le
 for qemu-devel@nongnu.org; Wed, 08 Apr 2020 13:35:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1jMEbb-0002Ql-Od
 for qemu-devel@nongnu.org; Wed, 08 Apr 2020 13:35:16 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:46153)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1jMEbb-0002Nv-G9; Wed, 08 Apr 2020 13:35:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=p/3W4i2pY0jEA83/W+KjdPNtxkdM8BLpT2vN+F9wORI=; 
 b=RvDBknEHBVH47YTqi0b4/EPCTiNe+b3KhP+i8Tw54gWz9Eeo0sXIkg5XwGswdn6tp73nASp4WVPSmeVfGCt0G2wLNT5Mt23PaBOPZUOq37LQe4iGy+xAdUKCAthkDAtyMveVb27ZVD8DkcTudNBlDG2a78dZXyUiL6jifNc17yCxlxQxzPo8kDchHuQ6ELKfW8wLpjjGnZqgMcIWhZN6Mg3XG1COcMKOGBPdlj3usBzDFGsiKMHNfxFHTngaxiQ/sQIQaxOuRHx7ldmtjJWPi2LSGfJYPojK5Go384OY0bjzMSflc+2VK4tUGG2DnV/DqA23hXGSPG9M4btvoLGEVA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jMEbW-00056w-5G; Wed, 08 Apr 2020 19:35:10 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1jMEbV-0005f3-SA; Wed, 08 Apr 2020 19:35:09 +0200
From: Alberto Garcia <berto@igalia.com>
To: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 18/30] qcow2: Add subcluster support to
 qcow2_get_host_offset()
In-Reply-To: <69ca2dca-92f2-a1b2-33ab-f112a88b6163@redhat.com>
References: <cover.1584468723.git.berto@igalia.com>
 <1cc780f735044ac9138808234589d2c278c9cfbf.1584468723.git.berto@igalia.com>
 <69ca2dca-92f2-a1b2-33ab-f112a88b6163@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Wed, 08 Apr 2020 19:35:09 +0200
Message-ID: <w51wo6pubhu.fsf@maestria.local.igalia.com>
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
 qemu-block@nongnu.org, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Denis V . Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed 08 Apr 2020 02:49:14 PM CEST, Max Reitz wrote:
> (Oops, totally missed the L1 entry out of bounds / L1 entry empty part
> in v3.)

Yeah, and you can mix values between different enum types in C quite
easily without the compiler producing a warning.

Berto

