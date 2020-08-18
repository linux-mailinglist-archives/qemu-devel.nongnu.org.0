Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC922488DC
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 17:14:49 +0200 (CEST)
Received: from localhost ([::1]:53562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k83K4-0004Nc-8i
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 11:14:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1k82Op-0003w4-EW; Tue, 18 Aug 2020 10:15:39 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:58832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1k82On-00083o-4m; Tue, 18 Aug 2020 10:15:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=lJBteWDlWCq5A7UjrBtZ2Rj44wAwqDdfoEu+Fv8JoQw=; 
 b=MNlhjgVH/jjP11RpsNKJ9EWPwnpP98y8iSWsfLDCODtIzCDhxjgBp5G/AvGd8CfF3i9O804vmUdF3vLaVb8Av7v2S6XehfoV5Kkt6EKdD7GRE2TUzrmKSs3ahtG+2I3pXQjLZrmPQ1HQbotS6yaJ4R08Soe+4SbZTO9rxn4jff6ybKmiwniIo+/v5tVdv1xQ5PQuaiLi4u06mQnAqJ0H9dauxIt+60b6gwCNc7MXVgQVrCfg8iJUFxcTLRpVsF8yw7OJRv2wx0QWVNZF7BPI1n5KG2Kg0aFgEVpi17LjXKOAjSVWyHaUeQTn+hHQohkGqiQU3DXoqqjSXHiIOxqyng==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1k82Og-0004af-Ky; Tue, 18 Aug 2020 16:15:30 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1k82Og-0001mQ-At; Tue, 18 Aug 2020 16:15:30 +0200
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v5 1/5] block/io: fix bdrv_co_block_status_above
In-Reply-To: <20200610120426.12826-2-vsementsov@virtuozzo.com>
References: <20200610120426.12826-1-vsementsov@virtuozzo.com>
 <20200610120426.12826-2-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Tue, 18 Aug 2020 16:15:30 +0200
Message-ID: <w51lficjb0d.fsf@maestria.local.igalia.com>
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

On Wed 10 Jun 2020 02:04:22 PM CEST, Vladimir Sementsov-Ogievskiy wrote:
> +             * The top layer deferred to this layer, and because this layer is
> +             * short, any zeroes that we synthesize beyond EOF behave as if they
> +             * were allocated at this layer
>               */
> +            assert(ret & BDRV_BLOCK_EOF);
>              *pnum = bytes;
> +            if (file) {
> +                *file = p;
> +            }
> +            return BDRV_BLOCK_ZERO | BDRV_BLOCK_ALLOCATED;

You don't add BDRV_BLOCK_EOF to the return code here ?

> +        res = bdrv_block_status_above(bs, NULL, offset, bytes, &nr, NULL, NULL);
> +        offset += nr;
> +        bytes -= nr;
> +    } while (res >= 0 && (res & BDRV_BLOCK_ZERO) && nr && bytes);

About this last "... && nr && bytes", I think 'nr' already implies
'bytes', maybe you want to use an assertion instead?

Berto

