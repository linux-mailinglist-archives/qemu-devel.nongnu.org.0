Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C557C2A81FA
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Nov 2020 16:16:44 +0100 (CET)
Received: from localhost ([::1]:58498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kah0F-0004Qv-Si
	for lists+qemu-devel@lfdr.de; Thu, 05 Nov 2020 10:16:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kagyD-0003KX-FM; Thu, 05 Nov 2020 10:14:37 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:44382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kagy6-0003fD-CY; Thu, 05 Nov 2020 10:14:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=QmszWzaxMV5wlnCV0QokFaybnC/w2gRuedKJnQyqb9w=; 
 b=GTlF817K/1rg00305CCKdWuz7ec8wR0J0JJztmSNCsB2rU9luW21n/HgOCOn9FrZrcJDIIDNaenqocbtgxkRQhSvWtJvvbaIl9S88Pmswkw/4Q1Amh059vDy08jr4IyeQfxeMIvGwBEHUIYi1fq6A0UYgDgVTU0Qs5KC1qh4RAr5S6caqhBTC5G3uTUujw1Y8qmm9iTVnfWZ+7b8LNRzLuuv7e19QHrmuDA0WqOv6neaKxdnMKDieVSXIbzrh0BLswUQKUgRzCUK6qjrkuAWZP50KiPqRzk3NaHRW07qzG6gz1gJkXKLi/FkadKdBkPChZw/C5WTMQpkxI7s4qNaRA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1kagy2-0007bU-A6; Thu, 05 Nov 2020 16:14:26 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1kagy2-0001Gk-0u; Thu, 05 Nov 2020 16:14:26 +0100
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH 1/2] block: make bdrv_drop_intermediate() less wrong
In-Reply-To: <20201031123502.4558-2-vsementsov@virtuozzo.com>
References: <20201031123502.4558-1-vsementsov@virtuozzo.com>
 <20201031123502.4558-2-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Thu, 05 Nov 2020 16:14:26 +0100
Message-ID: <w514km3j0od.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/05 10:03:09
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
Cc: kwolf@redhat.com, den@openvz.org, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat 31 Oct 2020 01:35:01 PM CET, Vladimir Sementsov-Ogievskiy wrote:
> -    QLIST_FOREACH_SAFE(c, &top->parents, next_parent, next) {
  /* ... */
> +    QLIST_FOREACH_SAFE(c, &base->parents, next_parent, next) {

I also wonder, is top->parents and base->parents guaranteed to be the
same list in this case?

If not you could store the list of top->parents before calling
bdrv_replace_node() and use it afterwards.

    QLIST_FOREACH(c, &top->parents, next_parent) {
        parents = g_slist_prepend(parents, c);
    }

Berto

