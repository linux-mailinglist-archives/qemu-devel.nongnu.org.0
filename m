Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AF5245C79
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Aug 2020 08:30:38 +0200 (CEST)
Received: from localhost ([::1]:58616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7YfE-0004Tg-4Q
	for lists+qemu-devel@lfdr.de; Mon, 17 Aug 2020 02:30:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1k7Ye6-0003zP-W9; Mon, 17 Aug 2020 02:29:27 -0400
Received: from charlie.dont.surf ([128.199.63.193]:39118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1k7Ye4-0005im-F2; Mon, 17 Aug 2020 02:29:26 -0400
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 5DDB1BF57B;
 Mon, 17 Aug 2020 06:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=irrelevant.dk;
 s=default; t=1597645756;
 bh=S7hLhPh33h/r1549tuPvXVbi4KwhrlhkxneKWE+uEc4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XhpYFqUQiUvtovvcIFjt4ZPfdms5X7chFxBJMe9bpdG5KIsG/idu+XHxvrUr9dwyh
 /mCouJ1aWCRvoaLyXnIC3ZcsvchlwG+xSXpp5xvCwMW99TYQOGrYAcIBy0tXGh+9Xu
 vVK81l9PtzJvHWomc4S/utxgbP1lv8IVqqn3EhUXZJobCPZoA41opHE9WjaQE+8Y7p
 4FmejnJxux2mvovF4BRZgLH7KmuDZwUe7pfmpzcn6LVWaEQFd9c4ZVhgcs/lxm3oUO
 pGxZSTy9jQTz4tsU47nLWQQRoZmS46lLv4+mGsWkz8ufT8JJxIFS1pmLwSpgg56DJK
 yfLFvCCZuOgRg==
Date: Mon, 17 Aug 2020 08:29:11 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Andrzej Jakowski <andrzej.jakowski@linux.intel.com>
Subject: Re: [PATCH v6 2/2] nvme: allow cmb and pmr to be enabled on same
 device
Message-ID: <20200817062911.GA7412@apples.localdomain>
References: <20200729220107.37758-1-andrzej.jakowski@linux.intel.com>
 <20200729220107.37758-3-andrzej.jakowski@linux.intel.com>
 <20200729225019.GA346228@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200729225019.GA346228@apples.localdomain>
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/17 02:29:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: kbusch@kernel.org, kwolf@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Jul 30 00:50, Klaus Jensen wrote:
> On Jul 29 15:01, Andrzej Jakowski wrote:
> > So far it was not possible to have CMB and PMR emulated on the same
> > device, because BAR2 was used exclusively either of PMR or CMB. This
> > patch places CMB at BAR4 offset so it not conflicts with MSI-X vectors.
> >=20
> > Signed-off-by: Andrzej Jakowski <andrzej.jakowski@linux.intel.com>
> > ---
>=20
> Well, I'm certainly happy now. LGTM!
>=20
> Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
>=20

Are anyone willing to chip in with another review on this?


