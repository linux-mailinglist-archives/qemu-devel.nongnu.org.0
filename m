Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A195D3C8
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 18:00:28 +0200 (CEST)
Received: from localhost ([::1]:54778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiLCl-0005um-8s
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 12:00:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59035)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <berto@igalia.com>) id 1hiKPW-0000Qs-NB
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 11:09:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1hiKPR-00023Y-SJ
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 11:09:34 -0400
Received: from fanzine.igalia.com ([91.117.99.155]:52509)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1hiKPO-0001wS-4O; Tue, 02 Jul 2019 11:09:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=2WMk7rX7n8jcroa9Yj5/rGsNN4jfOYZLDGiFmlKyGOE=; 
 b=nJYPucn+iEMXxO47NevkpNES9GUk8a1TZd6H6ps0M+x3EoKYbWU7LuVhUuAZ01ExuxDQfQQL73r+K+ihfOzxZiTYyabOduP+4Y8EMNfWaNXNAwJsSQC+SnGSxdXiYn/0Ss8i11M8zSKXYXGyTFqnTPFTqmwS+XJ2QXNNwrYjnKBClXLpJ+uB3gazSf2vTRBfxjdQ6q/0n+YlCN5+fAQfBIhIzRdlt0Tcq/win3Im9UfbPWiOLAmvSQgF/I6959Qzvnog1aD13z5wq89cHs/kiKpFapnDuAVF1SWA1HxOx/o82MQLhgr8NYXvEHDF/Et6z/cnzeKNjEHkPOa14+ERUg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1hiKPK-0001BM-0k; Tue, 02 Jul 2019 17:09:22 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1hiKPJ-0000zp-UJ; Tue, 02 Jul 2019 17:09:21 +0200
From: Alberto Garcia <berto@igalia.com>
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
In-Reply-To: <20190627223255.3789-3-mreitz@redhat.com>
References: <20190627223255.3789-1-mreitz@redhat.com>
 <20190627223255.3789-3-mreitz@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Tue, 02 Jul 2019 17:09:21 +0200
Message-ID: <w51muhw5v8e.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 91.117.99.155
Subject: Re: [Qemu-devel] [PATCH 2/5] iotests: Fix throttling in 030
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
 Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri 28 Jun 2019 12:32:52 AM CEST, Max Reitz wrote:
> Currently, TestParallelOps in 030 creates images that are too small for
> job throttling to be effective.  This is reflected by the fact that it
> never undoes the throttling.
>
> Increase the image size and undo the throttling when the job should be
> completed.  Also, add throttling in test_overlapping_4, or the jobs may
> not be so overlapping after all.  In fact, the error usually emitted
> here is that node2 simply does not exist, not that overlapping jobs are
> not allowed -- the fact that this job ignores the exact error messages
> and just checks the error class is something that should be fixed in a
> follow-up patch.
>
> Signed-off-by: Max Reitz <mreitz@redhat.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

