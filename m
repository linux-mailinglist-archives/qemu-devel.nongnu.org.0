Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2649D310A1D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 12:19:57 +0100 (CET)
Received: from localhost ([::1]:42464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7z9Y-0004Ed-68
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 06:19:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1l7z6h-0002Ib-2G; Fri, 05 Feb 2021 06:16:59 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:41745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1l7z6d-0001YC-OW; Fri, 05 Feb 2021 06:16:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=8G1v0OqPTyyprsLidU+uZ0H9MFJHZoQyWR8zPs8R+Wo=; 
 b=DsQlLsLuggYKcNbckbFM6YzDE3QrP8rLRyKmWIAEIWf4rBQZL7gqpbxLE+T/3hpPMqC/RCSfpdtFdNw31g7e+qVeGqas/Dq9vKuWTOVdFOAOoDH3Nk3wd8XkPg8w1ab/cr3BOhiN2sPNQkN2QRVRT9upndXu02wvQ/AHRM26Re5n+at9/+1PZz91tdlD/8/eIfIxpnJVPgR3NCvAZv7A0ARIrCj70TizUEYTC5nTGCXSGWHPelssEjUY2Ue3Ex2f9lzAAkcQVPruFrQ7V4+s8sqIpUdq8FP3l/mIQOc//I3vtQP5/OKjLcSa5wslpJKr+tzf3sXXYedXyHdX15Q1nA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1l7z6D-0006Fx-M5; Fri, 05 Feb 2021 12:16:29 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1l7z6D-0000i3-9i; Fri, 05 Feb 2021 12:16:29 +0100
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v7 01/14] block: return status from bdrv_append and friends
In-Reply-To: <20210202124956.63146-2-vsementsov@virtuozzo.com>
References: <20210202124956.63146-1-vsementsov@virtuozzo.com>
 <20210202124956.63146-2-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Fri, 05 Feb 2021 12:16:29 +0100
Message-ID: <w51o8gybw8i.fsf@maestria.local.igalia.com>
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, pavel.dovgaluk@ispras.ru,
 qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, mreitz@redhat.com, jsnow@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue 02 Feb 2021 01:49:43 PM CET, Vladimir Sementsov-Ogievskiy wrote:
> The recommended use of qemu error api assumes returning status together
> with setting errp and avoid void functions with errp parameter. Let's
> improve bdrv_append and some friends to reduce error-propagation
> overhead in further patches.
>
> Choose int return status, because bdrv_replace_node_common() has call
> to bdrv_check_update_perm(), which reports int status, which seems
> correct to propagate.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

I had already reviewed this one, hadn't I?

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

