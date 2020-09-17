Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F417726DE05
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Sep 2020 16:22:01 +0200 (CEST)
Received: from localhost ([::1]:58932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIunR-00032L-0P
	for lists+qemu-devel@lfdr.de; Thu, 17 Sep 2020 10:22:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kIuTg-00023D-7r; Thu, 17 Sep 2020 10:01:36 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:52304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kIuTZ-0000gE-Lt; Thu, 17 Sep 2020 10:01:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=/l4sNqGnWoJfl+1S/PvaNh+z8p+IXTZuZwxLsVXOOn4=; 
 b=Pxa4XMPOuoMuYdNyYKpdS2kUl/ZZ0wXxWATNq3+w+dgB9J/vaNgzS0N7cxE7AN/kPkG/wMbOyLEMeAsGuBVGf0gIWPslZp7sT0Q43GVYbUBwZMfFsPN1qr23tUJwllo5hMHkN6c9QLM9rJY4SnGW2gwKMMZCccRelTu80eKQbGEjil20XFWulo9IjpMTfPkerFz1MjD7BZyPZ3nB5kjcOI0ysGVs0H95ZMWqZsl3l85Ksf13Q2sX1fjSvfPGjPzax+nRFMkxvJgLRr5AB+Yg17eLkI2KTEadiOjO03Aeb61ZPUBpFYt6n4h/NkPBq0gt353u1+rUbhlVSnvPJWP+xA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1kIuTX-0002bp-8Y; Thu, 17 Sep 2020 16:01:27 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1kIuTW-0006yh-Tg; Thu, 17 Sep 2020 16:01:26 +0200
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH 08/14] blockjob: return status from block_job_set_speed()
In-Reply-To: <20200909185930.26524-9-vsementsov@virtuozzo.com>
References: <20200909185930.26524-1-vsementsov@virtuozzo.com>
 <20200909185930.26524-9-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Thu, 17 Sep 2020 16:01:26 +0200
Message-ID: <w51363gzemh.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 09:56:37
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

On Wed 09 Sep 2020 08:59:24 PM CEST, Vladimir Sementsov-Ogievskiy wrote:
> Better to return status together with setting errp. It allows to avoid
> error propagation in the caller.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

