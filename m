Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BED35C969
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 17:08:12 +0200 (CEST)
Received: from localhost ([::1]:44334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVyAd-0007Fv-Gr
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 11:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lVy9B-0006ef-Md; Mon, 12 Apr 2021 11:06:41 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:57542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lVy95-0000Hq-EX; Mon, 12 Apr 2021 11:06:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=JbJ93RA4p+XC90FzxwX5c3Ac4VA+NG6d0RVpZ79F3cA=; 
 b=qL2OFdq4q00lNykeO/036bNe7rTYAWMSSH4x1SmoGMmUUJq2lBNhbTHTo8aOqvOlqZcVGNKAZXz+I/nkX/+CNsctUycaTr/BeYpMH3ys/c4xW6n/osXbk09WZtY1g3dTcq0eyQLDis3T5R7ZfynCws7gxxS7uNITD6utlsALnl3AL+mslGVCQEi2gZPuLSvV7ILzoq+HfG7NqcvfVVeQDdRwh5Bx8RUUqtLOqyt5pD9WSTN0NKPCzreKtHLVh8VTOw0Ic/OOR7a7oZafmLxw7s+5lRCPAcoVbaIw3ZN6bvLLl1JTY1Goc6gVLOrYd8VK/Eyd05I5ZInb1xglHAvxIQ==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1lVy8v-00016T-SF; Mon, 12 Apr 2021 17:06:25 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1lVy8v-00065v-J6; Mon, 12 Apr 2021 17:06:25 +0200
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v3 05/36] block: BdrvChildClass: add
 .get_parent_aio_context handler
In-Reply-To: <20210317143529.615584-6-vsementsov@virtuozzo.com>
References: <20210317143529.615584-1-vsementsov@virtuozzo.com>
 <20210317143529.615584-6-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Mon, 12 Apr 2021 17:06:25 +0200
Message-ID: <w514kgbv8y6.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com,
 mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed 17 Mar 2021 03:34:58 PM CET, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
> Add new handler to get aio context and implement it in all child
> classes. Add corresponding public interface to be used soon.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

