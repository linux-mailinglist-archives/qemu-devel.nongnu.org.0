Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F67E270117
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Sep 2020 17:34:36 +0200 (CEST)
Received: from localhost ([::1]:42998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJIPD-0003Hm-8p
	for lists+qemu-devel@lfdr.de; Fri, 18 Sep 2020 11:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kJIH5-0003xR-74; Fri, 18 Sep 2020 11:26:11 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:40661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kJIH3-00047s-8k; Fri, 18 Sep 2020 11:26:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=3bSGHINguM0YDJKrRe9zkaCTy/95b1t/4BXQcYoPnXI=; 
 b=oge8qmjN5VlOv4sQ3hEIV5DbkqQNmLF5m1Jh6t31zWhyb0ms0jT8YnCj6rD2pmA1IClVPduOFCAJQ+nB5+2VUUAguLhYZ60TlEKIRr7WDk9Uw90aLWjgbRgGrqW3+7ZgS0QhzyU7XiNvzCiwOO2384XnWEIZu4+qpXfuRusjadHi0VHvj4UcF3yL5Tp3gQdkCmD8mOPaBUXafa0e/gsBWMx+sZlh9Ilt0QcqVzjct1/BqIa+zRkga/bFFtCHVKPa3mEvZfRp18vIjOis4TZFHu7QZINWTSnmukakhvEkSat/m2M1z6OCVnuNu5N8QQrhSOZeawjHBoC0l4fkyOg2ug==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1kJIH0-00024S-6I; Fri, 18 Sep 2020 17:26:06 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1kJIGz-0005n6-OS; Fri, 18 Sep 2020 17:26:05 +0200
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v2 12/13] block/qcow2: simplify qcow2_co_invalidate_cache()
In-Reply-To: <20200917195519.19589-13-vsementsov@virtuozzo.com>
References: <20200917195519.19589-1-vsementsov@virtuozzo.com>
 <20200917195519.19589-13-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Fri, 18 Sep 2020 17:26:05 +0200
Message-ID: <w51mu1n2jjm.fsf@maestria.local.igalia.com>
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

On Thu 17 Sep 2020 09:55:18 PM CEST, Vladimir Sementsov-Ogievskiy wrote:
> qcow2_do_open correctly sets errp on each failure path. So, we can
> simplify code in qcow2_co_invalidate_cache() and drop explicit error
> propagation. We should use ERRP_GUARD() (accordingly to comment in
> include/qapi/error.h) together with error_append() call which we add to
> avoid problems with error_fatal.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

