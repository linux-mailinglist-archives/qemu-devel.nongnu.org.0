Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEC02488E1
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 17:15:26 +0200 (CEST)
Received: from localhost ([::1]:55182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k83Kf-00055n-IQ
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 11:15:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1k82Pn-0005WL-03; Tue, 18 Aug 2020 10:16:39 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:60100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1k82Pl-0008D4-9h; Tue, 18 Aug 2020 10:16:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=zIPEfmnyZVFPtA2V+4PkMBfYPXtbqw4e6rEuiVAxLcc=; 
 b=gV7s6kAgu1uluMCGWe6azF9GkqJ+uwaTJTfZqI0/B6TUqYC1sa2ZCrKX38DoQY4ZGHTFYBf/ff3+jdW6i3PEB7FFyrXtitQX+JW80ZxpVrOv63JfMkxzNZV9BsxaN6YKltiFZtIZ2CKv/r/2GVuspEg4bdzArEhAUD4mQXQMrRxYtvyZYyD3Bm0EZPFO4d9lZdICD+QnG51DTe2Z2FHzx6+e0HIFQad7ZmN7LOslD/gYUI8Y72Kk19H4uSaA1qdZ0bt9KRp70o2j0FC0AcLrZDwjF7YdHOgVyv/GmTj6gET0Z0YUdv+kWAZ4TsUMK+FuAnNdmm/WlXRqTsuNdB2anA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1k82Pj-0004hE-4m; Tue, 18 Aug 2020 16:16:35 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1k82Pi-0001o9-Px; Tue, 18 Aug 2020 16:16:34 +0200
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v5 2/5] block/io: bdrv_common_block_status_above: support
 include_base
In-Reply-To: <20200610120426.12826-3-vsementsov@virtuozzo.com>
References: <20200610120426.12826-1-vsementsov@virtuozzo.com>
 <20200610120426.12826-3-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Tue, 18 Aug 2020 16:16:34 +0200
Message-ID: <w51imdgjayl.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 10:15:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed 10 Jun 2020 02:04:23 PM CEST, Vladimir Sementsov-Ogievskiy wrote:
> In order to reuse bdrv_common_block_status_above in
> bdrv_is_allocated_above, let's support include_base parameter.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

