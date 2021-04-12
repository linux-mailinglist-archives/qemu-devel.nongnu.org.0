Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C49F035CA8B
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 17:59:10 +0200 (CEST)
Received: from localhost ([::1]:58084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVyxx-00045D-Sy
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 11:59:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lVywW-0003ZC-TG; Mon, 12 Apr 2021 11:57:40 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:59950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lVywT-0006HL-Qu; Mon, 12 Apr 2021 11:57:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=bP8y05pXBMGorNwTYlDXV0BLA8Q4ruY5TWvOr9w9hH0=; 
 b=AGfaSGpWA3KrvJ2xuk5fY0J6/T78vz68HJ2MYE++FES3qkgXB2v+RpzjBjBDbegYLQBLlmM9jVR1xBR03b2p6/PUnEfTdHd1Q4zLN8rD9+Dt/Wb98B+rhTogzLFifOYPUEVkrEROLEK1gi7SjObIkpYj+nZ5jn/QCRQfcgucnJTzLocV+EqQpPftQIcfp7WcYYViFSX+ZzU4wEPItztGLq36Fd2uyPJWaLkJ61NN1xgtJtLjXc47SgdvYZdsu22xjZUTVpFpD3VahpciXbHeRKiMFHSSttnTbms9+bFh8HS1ggJKWNhJS+5lBpeRK5M0a5LkKQRso+VWzmZTbojsuA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1lVywO-0004lE-Qn; Mon, 12 Apr 2021 17:57:32 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1lVywO-0001M9-H4; Mon, 12 Apr 2021 17:57:32 +0200
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v3 09/36] block: bdrv_refresh_perms: check for parents
 permissions conflict
In-Reply-To: <20210317143529.615584-10-vsementsov@virtuozzo.com>
References: <20210317143529.615584-1-vsementsov@virtuozzo.com>
 <20210317143529.615584-10-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Mon, 12 Apr 2021 17:57:32 +0200
Message-ID: <w511rbfv6kz.fsf@maestria.local.igalia.com>
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

On Wed 17 Mar 2021 03:35:02 PM CET, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
> Add additional check that node parents do not interfere with each
> other. This should not hurt existing callers and allows in further
> patch use bdrv_refresh_perms() to update a subtree of changed
> BdrvChild (check that change is correct).
>
> New check will substitute bdrv_check_update_perm() in following
> permissions refactoring, so keep error messages the same to avoid
> unit test result changes.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

