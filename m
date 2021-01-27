Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34975306055
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 16:57:28 +0100 (CET)
Received: from localhost ([::1]:49800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4nCB-0004jp-8W
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 10:57:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1l4nA3-0003Sh-Ie; Wed, 27 Jan 2021 10:55:15 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:49163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1l4nA0-0002ag-Sg; Wed, 27 Jan 2021 10:55:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=hghV0gs2ZMuArF3oNg8kC2/l6K9cHdLdiUOQu9YD0TE=; 
 b=XpKOxb9z8j8p9C7y2YAT6mY5118rS79oqnCQWsoZVtqyedGaYj7Xl3QH1T5DH+v4kvxzcw7c6rWvtl6+n/WB/cPry5bosguBn50f6MHLqPBl+9JApRaHVzdzgyI7pKY/5/KIwToOAO5/kk3VlEizoFOEXVGxtjgiFh7JFB4mE4jakTIQEMak7DEJbb3nSSyQBbjErIGdpguzWcKxDxKPUlhk06S6ojX4o89tgD7gd7E3hbgIa0mCpkWCqCKOcctcNYT05AXx9pXE6F+9lAunCjkXsZMfUQtTninAvqWqbdTO4rLsx0Y19X2JEeJ6vGqkzI+dKFb6Cyvd0Yy9bBxU2w==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1l4n9d-0002On-5D; Wed, 27 Jan 2021 16:54:49 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1l4n9c-0006Qy-Rh; Wed, 27 Jan 2021 16:54:48 +0100
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v6 01/14] block: return status from bdrv_append and friends
In-Reply-To: <20210116215209.823266-2-vsementsov@virtuozzo.com>
References: <20210116215209.823266-1-vsementsov@virtuozzo.com>
 <20210116215209.823266-2-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Wed, 27 Jan 2021 16:54:48 +0100
Message-ID: <w51zh0uiddj.fsf@maestria.local.igalia.com>
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

On Sat 16 Jan 2021 10:51:56 PM CET, Vladimir Sementsov-Ogievskiy wrote:
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

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

