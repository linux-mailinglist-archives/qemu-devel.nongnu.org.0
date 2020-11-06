Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8768D2A9678
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Nov 2020 13:53:03 +0100 (CET)
Received: from localhost ([::1]:37310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kb1Ek-0006yS-L4
	for lists+qemu-devel@lfdr.de; Fri, 06 Nov 2020 07:53:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kb19Z-0002QT-24; Fri, 06 Nov 2020 07:47:41 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:43249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kb19R-0002rq-Hy; Fri, 06 Nov 2020 07:47:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=eigTOgXaxumTgOYtZQCBEIrCLxCKItCsY5GQxbCsmyo=; 
 b=HH477niRQnAL4exihqf6KJk2kp8Ku6s3LJEOoa+pfbYBtIfnmlyEwLDN2XMZ1viBiRYWLfOauZbAJhQ8LhFvgTAHVDUor7vhe7q4iPxqI7Lx/iKf4hnqywAmA36ZkaNx7dfhg8eTdYcmhFVz7PJIC5zEppcKQo7ma/94+h/DK8HUxjdutWAq4VqjfDX5K/FsbGJQfW4T1/AmuwvbBbPWUUl/CM2+toJTfYSdsuOhQF7ckBlQHzJe4xww6oHc0abSQd+Sx60L5wwr1D42JR2x/Rg2uZ/andzV59o1ZqB48IcClnjhzFrfII35lreEtnuPwItikgF0lmTm/EfssPxTZQ==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1kb193-0000Dk-VW; Fri, 06 Nov 2020 13:47:09 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1kb193-00047m-M0; Fri, 06 Nov 2020 13:47:09 +0100
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v2 1/7] block: add forgotten bdrv_abort_perm_update() to
 bdrv_co_invalidate_cache()
In-Reply-To: <20201106124241.16950-2-vsementsov@virtuozzo.com>
References: <20201106124241.16950-1-vsementsov@virtuozzo.com>
 <20201106124241.16950-2-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Fri, 06 Nov 2020 13:47:09 +0100
Message-ID: <w515z6iabzm.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/06 07:47:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: kwolf@redhat.com, den@openvz.org, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri 06 Nov 2020 01:42:35 PM CET, Vladimir Sementsov-Ogievskiy wrote:
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

