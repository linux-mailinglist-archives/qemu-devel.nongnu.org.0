Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 941732DC53C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 18:23:32 +0100 (CET)
Received: from localhost ([::1]:41020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpaWR-0001hg-CL
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 12:23:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kpaPU-0001qT-49; Wed, 16 Dec 2020 12:16:20 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:55457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kpaPR-0007LT-M4; Wed, 16 Dec 2020 12:16:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=7bSEUBH41T8dMh6P/n9HP/mPQFfzA2kEMPt38yU6vak=; 
 b=nQs4fVTpy4HKvCD7PbiXIAo/L3QMVvpA/dwsz7Qw/nv8Sa0ne8GKUYy3VGJ/Vp3Y3uesPiqo4fFGz31TFrucFivtvSPzcS8fo/ncZRYsiEhQ9qG2GTWfIwSVRNobG16NcYQyGENJ3E2uB25aQ3xhK/Pwz22Rda1WbARfv6s6hxDIyTfc6NIKoxNHo9zj2r+ItND9kW5y/i9PD8Uji8djz1A0T3L7GkQ7A5QrbRrbcSmhaMNInatMnBeCfsx2g82Tvga943FoDoJ8VecXKRrs360ZGK57jJIY5WyGoaz19WiEaiuMnG+4gZ39PXdjsOOu7UU7+NmNOaE2rrAp0O3e1w==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1kpaPM-0000VA-GU; Wed, 16 Dec 2020 18:16:12 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1kpaPM-0002sI-66; Wed, 16 Dec 2020 18:16:12 +0100
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v2 14/36] block: inline bdrv_child_*() permission
 functions calls
In-Reply-To: <20201127144522.29991-15-vsementsov@virtuozzo.com>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-15-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Wed, 16 Dec 2020 18:16:12 +0100
Message-ID: <w5136057jtv.fsf@maestria.local.igalia.com>
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, armbru@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri 27 Nov 2020 03:45:00 PM CET, Vladimir Sementsov-Ogievskiy wrote:
> Each of them has only one caller. Open-coding simplifies further
> pemission-update system changes.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

