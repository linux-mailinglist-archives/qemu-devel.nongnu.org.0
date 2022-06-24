Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C04695598DC
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 13:49:44 +0200 (CEST)
Received: from localhost ([::1]:56702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4hol-0006af-I3
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 07:49:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1o4hmr-0005YL-L2
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 07:47:46 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:55010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1o4hmi-0008Rc-GF
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 07:47:39 -0400
Received: from myt6-79704c0e15e4.qloud-c.yandex.net
 (myt6-79704c0e15e4.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:239b:0:640:7970:4c0e])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 6BF372E1FA6;
 Fri, 24 Jun 2022 14:47:23 +0300 (MSK)
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net [2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by myt6-79704c0e15e4.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 IxNBUGKDW0-lMJWtuGg; Fri, 24 Jun 2022 14:47:23 +0300
X-Yandex-Fwd: 2
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1656071243; bh=0cENtyKKvBrD1Ec3qasWePR0YcZ8lm6DL1FgY3C/ud0=;
 h=In-Reply-To:Subject:Cc:Date:References:To:From:Message-ID;
 b=qRIHlRpd+OAheRSs+ixRWeU5b+14p9PapVVA58/jjZ6qK0XJCvvQiuxVWkUSV4FRH
 KoHBNMU3NRc/ak2icEsL9+zxEuy2gpCBgp8wazJ9bxosbxcXanruC2J4weYrG+vM1k
 Zsg95DasRSMsgffR8/hVnJba+vhltZ8oWZKEHPEg=
Authentication-Results: myt6-79704c0e15e4.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from rvkaganb (unknown [2a02:6b8:b081:b4a0::1:24])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 De05HxNW1M-lMMeUaof; Fri, 24 Jun 2022 14:47:22 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Fri, 24 Jun 2022 14:47:21 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, mst@redhat.com, yc-core@yandex-team.ru,
 armbru@redhat.com, Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
Subject: Re: [PATCH v2 1/2] vhost: add method vhost_set_vring_err
Message-ID: <YrWkSVyBk7wj6iyd@rvkaganb>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org, mst@redhat.com, yc-core@yandex-team.ru,
 armbru@redhat.com,
 Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
References: <20220623161325.18813-1-vsementsov@yandex-team.ru>
 <20220623161325.18813-2-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220623161325.18813-2-vsementsov@yandex-team.ru>
Received-SPF: pass client-ip=5.45.199.163; envelope-from=rvkagan@yandex-team.ru;
 helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 23, 2022 at 07:13:24PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
> 
> Kernel and user vhost may report virtqueue errors via eventfd.
> This is only reliable way to get notification about protocol error.
        ^^^
	the

> 
> Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>

As long as you pick this series over from Konstantin you need to append
your s-o-b.

Other than that,

Reviewed-by: Roman Kagan <rvkagan@yandex-team.ru>

