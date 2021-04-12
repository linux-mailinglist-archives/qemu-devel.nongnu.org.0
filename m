Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C46AB35C8AC
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 16:25:21 +0200 (CEST)
Received: from localhost ([::1]:50698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVxVA-0000XF-T5
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 10:25:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lVxTk-00083s-Kz; Mon, 12 Apr 2021 10:23:52 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:55211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lVxTi-0000xY-84; Mon, 12 Apr 2021 10:23:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=VO5+v3jH4ccdyFtSQ++gd1FOmB7FSzScmYKr2fW/040=; 
 b=IcvprpAkvMo4Eu7KxGTCQkaS2sFAo/HKTaVteax6w0bJx+K2iHM7D5JOxcR2psXF5461IKYCugnHUyjVNw1esDrtMoIQLZNyKnhBmCrGMpOBeoAbJF0on8++1vAGLgfsam+waewu/euNvT2O3sWpFDUR93rWRzm3anIS9Ou5On2Fwp5UhRiE4ng7mVAnUfIiMXS8cUCi7kGHghhTXkeQzGBTsXsfnhbqD4bkzWUQsFLzNTCRIEIfnUBnHvsC0O6McXLGFWBoFJS+nq7dgWvTxHXUOj6yDSEds3MzCsKpPsl6BbzfzWL6znI9P0LIQA2JWSqvuEZbpthQHncdT/6Odw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1lVxTK-0007Nh-Ic; Mon, 12 Apr 2021 16:23:26 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1lVxTK-0002T2-7N; Mon, 12 Apr 2021 16:23:26 +0200
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v3 06/36] block: drop ctx argument from
 bdrv_root_attach_child
In-Reply-To: <20210317143529.615584-7-vsementsov@virtuozzo.com>
References: <20210317143529.615584-1-vsementsov@virtuozzo.com>
 <20210317143529.615584-7-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Mon, 12 Apr 2021 16:23:26 +0200
Message-ID: <w517dl7vaxt.fsf@maestria.local.igalia.com>
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

On Wed 17 Mar 2021 03:34:59 PM CET, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
> Passing parent aio context is redundant, as child_class and parent
> opaque pointer are enough to retrieve it. Drop the argument and use new
> bdrv_child_get_parent_aio_context() interface.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

