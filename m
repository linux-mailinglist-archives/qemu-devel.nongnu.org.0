Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE9426DED7
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Sep 2020 16:56:57 +0200 (CEST)
Received: from localhost ([::1]:48210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIvLE-0003yJ-7U
	for lists+qemu-devel@lfdr.de; Thu, 17 Sep 2020 10:56:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kIvCx-0005ff-I0; Thu, 17 Sep 2020 10:48:23 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:53406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kIvCu-0007ST-1C; Thu, 17 Sep 2020 10:48:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=TLU7wEwUlE3oAGvXm6DTimzdJH+HokxzKJcC6ULi77I=; 
 b=dRLmMVT46P3gqtHoH+sh2maMdJzHPhie+tZR+9zgr5igXFQC9HeMvIaL9fZnCgks3AVIt0FxZZqxhrIKTPRPmuAzH1QrWZ6z8JlCZzhiWUB7kBuz+g6pzOCck13Kf19aSheHHovK/tQN0RzQmBjgTyANw+/qyaqk9iqALBaE0j2x+mOPpXCzxVoppsPy1IfGZmdtXM14qvBTSRYOcr2lcwreT3gOD+yyoowdRfcKxID8VuQq6nAiNYal0E487g26OIyPrNoL2x0h1AMAnSuzwpVAmP88ux/8BrG41AY871h1KZIu8NktEX7Ehi9sQ0wdWm3tY2AGQ9GC2Qseh9kuzw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1kIvCr-0000Wi-BR; Thu, 17 Sep 2020 16:48:17 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1kIvCr-0002Mf-2A; Thu, 17 Sep 2020 16:48:17 +0200
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH 06/14] block/mirror: drop extra error propagation in
 commit_active_start()
In-Reply-To: <20200909185930.26524-7-vsementsov@virtuozzo.com>
References: <20200909185930.26524-1-vsementsov@virtuozzo.com>
 <20200909185930.26524-7-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Thu, 17 Sep 2020 16:48:17 +0200
Message-ID: <w51sgbgxxvy.fsf@maestria.local.igalia.com>
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

On Wed 09 Sep 2020 08:59:22 PM CEST, Vladimir Sementsov-Ogievskiy wrote:
> Let's check return value of mirror_start_job to check for failure
> instead of local_err.
>
> Rename ret to job, as ret is usually integer variable.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

