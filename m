Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CF6220C58
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jul 2020 13:52:48 +0200 (CEST)
Received: from localhost ([::1]:59120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvfxv-0006Bx-4s
	for lists+qemu-devel@lfdr.de; Wed, 15 Jul 2020 07:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jvfx6-0005kl-Ir; Wed, 15 Jul 2020 07:51:56 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:49604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jvfx3-0002yk-Mo; Wed, 15 Jul 2020 07:51:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=c20ejkGLYLzFjxrFC+qqrZhCeTMlGIqSGbddTlpfonU=; 
 b=c3hEaA1uxHJcudDzVNXn0V4VjbkmeulUKiGEOqTTEYFVpqt43xz3rl1B3HEmT0KLu7SCmU8TluWD4pfS+CN5078IaANELNw5tL/6o+2vZFVDuxgeuKj+EEkKc7fg0o1fH+u0o56y5KahM/ewjOgH2v4AwgDpLPSPuj/4oWjupuDqfE3gJ6vBf1e0jtY+/82ohGI5d8T8ZgZgyFaZzNCWQ+olkrlGQpFuDhbjjuhwBLuArdzcz7hFvtjbuMADh/0Shk6NvGP0HbsZNMilja2IdojIRDxlmE5tqY6n/pcpmkkFqonS9vkt6WCkJjQzuoSJkoIxYi+Zmt40CSQYuAoXiw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jvfwe-0006cM-QR; Wed, 15 Jul 2020 13:51:28 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1jvfwe-0002Bv-Gy; Wed, 15 Jul 2020 13:51:28 +0200
Date: Wed, 15 Jul 2020 13:51:28 +0200
From: Alberto Garcia <berto@igalia.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v11 00/34] Add subcluster allocation to qcow2
Message-ID: <20200715115128.GA7814@igalia.com>
References: <cover.1594396418.git.berto@igalia.com>
 <e428a843-f27a-4e8e-8be2-bf6566c76a2f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e428a843-f27a-4e8e-8be2-bf6566c76a2f@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/15 07:51:30
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Derek Su <dereksu@qnap.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 14, 2020 at 02:56:57PM +0200, Max Reitz wrote:
> Thanks, fixed up patch 21 (by initializing expected_type to just
> anything, I chose QCOW2_SUBCLUSTER_NORMAL, which I preferred over
> just using 0), resolved some iotest conflicts (I’m sure, more are
> to come before the release, but we’ll see), and applied the series
> to my block-next branch:
> 
> https://git.xanclic.moe/XanClic/qemu/commits/branch/block-next

I just realized that there's also a couple of 'since: 5.1' in
block-core.json that need to be updated. Can you do that please?

Thanks!

Berto

