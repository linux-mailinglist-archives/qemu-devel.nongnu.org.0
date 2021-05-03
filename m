Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F6237188A
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 17:57:13 +0200 (CEST)
Received: from localhost ([::1]:52214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldawb-0007zL-24
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 11:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1ldatv-0005qH-4J; Mon, 03 May 2021 11:54:27 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:36193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1ldatt-00016r-G4; Mon, 03 May 2021 11:54:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=JmCgS3/RiS20Ng+9aewWWrNJJn9+hZeLLgi0OHtkJV0=; 
 b=bSJJXzqZUpoEH1V3+6qM//tXSYjkZ4kRECNPMv9M0y+Ayjz5bD1rG7121w724jVacN76h50zBoqBrl2Rarj5GihqERhL97hjy0yUwB1GSG67W5lvEpN2SkqDOGRb20ZJGWHL8bBZhbPi27WFjWZySqMVeRODiPycNFt7PR86Bv1QU7xALkXB/gj92M2s21eUOUbTL5TQwvuun8TjTxI8EjikobKrk2HjOLuEE1/8TulEqRNOoY4W88jz7D2Kq1/RqwtogY8ZHh2JMDOXQEuvrI2cJX8DaMwORVvcE+AwX1m6hDcHYjdjUjR/R3BHrY9g1sw9JFxzzM4TLr8DpHC5jA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1ldatr-0000Gh-IH; Mon, 03 May 2021 17:54:23 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1ldatr-0000CJ-8B; Mon, 03 May 2021 17:54:23 +0200
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH 3/6] block-backend: improve blk_root_get_parent_desc()
In-Reply-To: <20210503113402.185852-4-vsementsov@virtuozzo.com>
References: <20210503113402.185852-1-vsementsov@virtuozzo.com>
 <20210503113402.185852-4-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Mon, 03 May 2021 17:54:23 +0200
Message-ID: <w51r1inhky8.fsf@maestria.local.igalia.com>
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon 03 May 2021 01:33:59 PM CEST, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
> We have different types of parents: block nodes, block backends and
> jobs. So, it makes sense to specify type together with name.
>
> While being here also use g_autofree.
>
> iotest 307 output is updated.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

