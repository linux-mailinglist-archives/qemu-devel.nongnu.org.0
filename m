Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D48FA275D75
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 18:32:04 +0200 (CEST)
Received: from localhost ([::1]:42862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kL7gZ-0001ny-C6
	for lists+qemu-devel@lfdr.de; Wed, 23 Sep 2020 12:32:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kL7Xl-0000b3-LW; Wed, 23 Sep 2020 12:22:58 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:44408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kL7Xj-0000Em-Jt; Wed, 23 Sep 2020 12:22:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=0WScEyKx11mpEDTGwN9dNe4JXXetg5zw9venkOWvRnQ=; 
 b=N407Zg3TaKUjURsZjjakbajKVyj3kKnsHb20c1X+Y/mKwG3wJ2EOd5y5r/MCMSbxfkWswuwUWdM7iSl3rE3U/KgL2B01aTKVXoEv3fK65OafkZ5D8l9UlFB9XOnn64yQn0fQJuPMarlgX/9vRWtbffYTV93DEsSxp+cxOKN4kMSxLVkNMMrFB5c52mTjP5MZBV8etl3CBHSPTSd6A11x5wSOEMWnxB7cux0hYcpVlHoNgsYRQCcyFYE70DS7G2rYoYyPzZhORv02gwbmsU+9fZujEeDqNYwhYRhIU7EeRXF4oy6RNPlq26aDZoEJgH4iynCrpZuTOWI4MAkwVKBxbA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1kL7Xg-0001rJ-Ae; Wed, 23 Sep 2020 18:22:52 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1kL7Xg-00061W-14; Wed, 23 Sep 2020 18:22:52 +0200
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v6 3/5] block/io: bdrv_common_block_status_above: support
 bs == base
In-Reply-To: <20200916122008.20303-4-vsementsov@virtuozzo.com>
References: <20200916122008.20303-1-vsementsov@virtuozzo.com>
 <20200916122008.20303-4-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Wed, 23 Sep 2020 18:22:52 +0200
Message-ID: <w51r1qsa2eb.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/23 11:59:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
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

On Wed 16 Sep 2020 02:20:06 PM CEST, Vladimir Sementsov-Ogievskiy wrote:
> We are going to reuse bdrv_common_block_status_above in
> bdrv_is_allocated_above. bdrv_is_allocated_above may be called with
> include_base == false and still bs == base (for ex. from img_rebase()).
>
> So, support this corner case.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Kevin Wolf <kwolf@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

(my question about include_base remains, but otherwise this patch is
correct)

Berto

