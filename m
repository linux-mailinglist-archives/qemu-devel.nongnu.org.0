Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C85270056
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Sep 2020 16:57:32 +0200 (CEST)
Received: from localhost ([::1]:35506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJHpL-00053W-2T
	for lists+qemu-devel@lfdr.de; Fri, 18 Sep 2020 10:57:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kJHmy-0003Q7-P7; Fri, 18 Sep 2020 10:55:04 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:53616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kJHmv-0005lz-Gg; Fri, 18 Sep 2020 10:55:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=huL4SZmSjLlXVpw+44ph8Yhdu88UkA+DsN5BGJEAKCk=; 
 b=VOohHREbtPRL9a3vvNfmLHIJvzWoJ7PBVEpT7FeQ8v/Bt72cW1UxKIgk3LPfR/PljhCQgMIhA0iXLflbn+bP63Nn0PcJ4Yc8LE88vf1ALKZhu0Ur64EFLfWGaAIVeg/TPTdRqgsW/Tyz9TXz7GP2u7RzN35KRV93cdXF0AooWLZyOiEJyIP3hZZGXXXMdq0CTeEe5HyTmrZ7JssgAMinS+OPSZeg1ADchM2lwdjStUtMvX9NNgrsWJEr7z3YQHcw4+z9ike/zFi3lkL0gdoR5UcRO/sGPr4gBb9nM7A3oi87eDrinFCWA55V89tiUrs0k06wViPuy5YoOgAC9q4k6Q==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1kJHmS-0006WY-7K; Fri, 18 Sep 2020 16:54:32 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1kJHmR-0002wS-SA; Fri, 18 Sep 2020 16:54:31 +0200
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v2 09/13] block/qcow2-bitmap: improve
 qcow2_load_dirty_bitmaps() interface
In-Reply-To: <20200917195519.19589-10-vsementsov@virtuozzo.com>
References: <20200917195519.19589-1-vsementsov@virtuozzo.com>
 <20200917195519.19589-10-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Fri, 18 Sep 2020 16:54:31 +0200
Message-ID: <w51wo0r2l08.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/18 10:54:34
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, pavel.dovgaluk@ispras.ru,
 qemu-devel@nongnu.org, armbru@redhat.com, groug@kaod.org, stefanha@redhat.com,
 pbonzini@redhat.com, mreitz@redhat.com, jsnow@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu 17 Sep 2020 09:55:15 PM CEST, Vladimir Sementsov-Ogievskiy wrote:
> It's recommended for bool functions with errp to return true on success
> and false on failure. Non-standard interfaces don't help to understand
> the code. The change is also needed to reduce error propagation.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> +/*
> + * Return true on success, false on failure. Anyway, if header_updated
> + * provided set it appropriately.
>   */

I'm not a native speaker but it sounds a bit odd to me. Maybe "If
header_updated is not NULL then it is set appropriately regardless of
the return value".

But I'm fine with your version, so

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

