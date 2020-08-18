Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A602489AE
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 17:24:52 +0200 (CEST)
Received: from localhost ([::1]:39222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k83Tn-00056j-9F
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 11:24:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1k82R6-0007KL-5O; Tue, 18 Aug 2020 10:18:00 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:33527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1k82R4-0008J4-Da; Tue, 18 Aug 2020 10:17:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=gnCHDXQX4SQRJ7e9jSRzzdnn0f1a1t8Q+IYR0D+yLEc=; 
 b=KE/IUDKq69tRmHp6tWitgFlOc3Yf3uQhlFUHrQwsZLnhQ37BoHFFBSzt4mQ63f2JS5d50VIMNBPVIu/zrnRqNaiN3v0MIeMOCT6WBy3xHOdIJbHntjfK4iQhj+Ey0UupIrDSFWdJNQM6OT39giSvlVoYDTEPcu10OpmWd8RI/epu5jIlwwyyXJeJaOuNiVJv/VzCCnnBT3CllDr+VuRUo8tQ5txx+UrNgZ1WXcLZIjg2H9ZlQkYcS8XupI1g1rQ0OQ9Iqw+wizFxxmifkCzymvkHWr3uyg0lPU8ukN20GvdlMZpM+/D113ZwxYPvoLige/VpI5nj3l+aPtmHZxcbyw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1k82R2-0004tA-0n; Tue, 18 Aug 2020 16:17:56 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1k82R1-0001ul-Mf; Tue, 18 Aug 2020 16:17:55 +0200
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v5 4/5] block/io: fix bdrv_is_allocated_above
In-Reply-To: <20200610120426.12826-5-vsementsov@virtuozzo.com>
References: <20200610120426.12826-1-vsementsov@virtuozzo.com>
 <20200610120426.12826-5-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Tue, 18 Aug 2020 16:17:55 +0200
Message-ID: <w51d03ojawc.fsf@maestria.local.igalia.com>
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

On Wed 10 Jun 2020 02:04:25 PM CEST, Vladimir Sementsov-Ogievskiy wrote:
> bdrv_is_allocated_above wrongly handles short backing files: it reports
> after-EOF space as UNALLOCATED which is wrong, as on read the data is
> generated on the level of short backing file (if all overlays has
> unallocated area at that place).
>
> Reusing bdrv_common_block_status_above fixes the issue and unifies code
> path.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

