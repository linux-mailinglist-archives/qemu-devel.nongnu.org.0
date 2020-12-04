Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DC02CF08F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 16:18:54 +0100 (CET)
Received: from localhost ([::1]:46596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klCrE-0001j7-NV
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 10:18:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1klCp3-0000xP-BJ; Fri, 04 Dec 2020 10:16:37 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:41672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1klCoy-0005DM-Qs; Fri, 04 Dec 2020 10:16:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=Qm1Miy5aYyMZK0JTQbH7Kq0EKgBvBPg4+P7wyeurdu0=; 
 b=cX0GZiPd5gm39IWID5tAVLskTSvvVYPEfiFDCxWcxHjeWPH6lAI1dkN8RPnzIWF9A/cjh6faGeOcyE3UglOC38+sEntAr5gyDdFgzHzOuXiXoG0puD0gnrMDgssF/TCGT2CeZp35a4addA/oAPdSHgPsM7T0+9zP2jjrZeis1GC8u93VjVfkAv7oqDUnU6Y8XtH8Bp7Qg2KOA7M+FkLFmJhLhvSmAqe9RfgtsAPfWlpgbI2ZVkzcOyAtY9e9RBTHh1QWPLhwMmUOz6ffdYxrYf0mS5RE9kb084E+pomGuLjar14vBAeTXK6kA/Nlds8/rOztH66ltaLvbQNK409ueg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1klCov-0003TY-B4; Fri, 04 Dec 2020 16:16:29 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1klCov-0000qs-18; Fri, 04 Dec 2020 16:16:29 +0100
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH 3/4] block/io: bdrv_check_byte_request(): drop
 bdrv_is_inserted()
In-Reply-To: <20201203222713.13507-4-vsementsov@virtuozzo.com>
References: <20201203222713.13507-1-vsementsov@virtuozzo.com>
 <20201203222713.13507-4-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Fri, 04 Dec 2020 16:16:29 +0100
Message-ID: <w51zh2tppo2.fsf@maestria.local.igalia.com>
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
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu 03 Dec 2020 11:27:12 PM CET, Vladimir Sementsov-Ogievskiy wrote:
> Move bdrv_is_inserted() calls into callers.
>
> We are going to make bdrv_check_byte_request() a clean thing.
> bdrv_is_inserted() is not about checking the request, it's about
> checking the bs. So, it should be separate.
>
> With this patch we probably change error path for some failure
> scenarios. But depending on the fact that querying too big request on
> empty cdrom (or corrupted qcow2 node with no drv) will result in EIO
> and not ENOMEDIUM would be very strange. More over, we are going to
> move to 64bit requests, so larger requests will be allowed anyway.
>
> More over, keeping in mind that cdrom is the only driver that has
> .bdrv_is_inserted() handler it's strange that we should care so much
> about it in generic block layer, intuitively we should just do read and
> write, and cdrom driver should return correct errors if it is not
> inserted. But it's a work for another series.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

