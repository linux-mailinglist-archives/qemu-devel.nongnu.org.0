Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C641159371
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 16:43:30 +0100 (CET)
Received: from localhost ([::1]:51786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1XhB-0005Cq-Gt
	for lists+qemu-devel@lfdr.de; Tue, 11 Feb 2020 10:43:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45842)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1j1Xfc-0003Zq-Pn
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 10:41:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1j1Xfb-0007fa-T8
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 10:41:52 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:59579)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1j1XfX-0007aR-OA; Tue, 11 Feb 2020 10:41:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=hYq/iRsqbaLUfycGuUuP8x/H/zmOcy3b+yAmboyGBGM=; 
 b=hZAxxvMhZSzsUZuK6smIwhnOh/fdPIkYxlyPRkuAGqd+NHVp/c/VeEe/d2Z3KJbGjoI2NETOhe2+e0r5x696vBDTVQJzl53ml6c4SVWpSea+uUdx9g/L77wIrX2T8O36P3CGmWsR7K5JVNL3gudJlp585KLvIWl8LRuHCP+RmzlwvyZ0OBpStm3K2q1ZCinYkkLZ7Y7fgKtgTvuJvW021DDiuJ9dDOguh9ecG6bKp4Z8koNTSIXhpA/acxYGRYOQaN8AKTvbCfwsegZbKkrShInDqGCTb4xzmkS+I6yGRt9Le0CknR5E5OQtamLDcZF/CJ7XGAp1uDrfKSaCFJ9YPw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1j1XfU-0007Un-9C; Tue, 11 Feb 2020 16:41:44 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1j1XfT-0002Vt-Vz; Tue, 11 Feb 2020 16:41:43 +0100
From: Alberto Garcia <berto@igalia.com>
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Subject: Re: [PATCH v2 03/33] block: Add BdrvChildRole
In-Reply-To: <20200204170848.614480-4-mreitz@redhat.com>
References: <20200204170848.614480-1-mreitz@redhat.com>
 <20200204170848.614480-4-mreitz@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Tue, 11 Feb 2020 16:41:43 +0100
Message-ID: <w51lfp9b07c.fsf@maestria.local.igalia.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue 04 Feb 2020 06:08:18 PM CET, Max Reitz wrote:
> +    /* Child to COW from (backing child) */
> +    BDRV_CHILD_COW          = (1 << 3),

Without the comment in brackets I'm not sure that I would have
understood that this is meant for backing files.

This is the "child that contains the data that is not allocated in the
parent", or something like that, right?

Berto

