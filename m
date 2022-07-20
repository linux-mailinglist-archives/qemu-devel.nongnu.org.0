Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8782C57B468
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 12:20:55 +0200 (CEST)
Received: from localhost ([::1]:38318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE6p4-00041O-44
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 06:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1oE6nT-0002YZ-BN
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 06:19:15 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:34270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1oE6nP-0005sO-HZ
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 06:19:13 -0400
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id AD79E2E1EE5;
 Wed, 20 Jul 2022 13:19:00 +0300 (MSK)
Received: from rvkaganb (unknown [2a02:6b8:0:419:7359:4dc3:71d:4c5a])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 dlOvQ5YEL6-IxO4HJoC; Wed, 20 Jul 2022 10:18:59 +0000
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1658312339; bh=KzZK3FT92dWKlOWmZB87zXsreRM8A6K1EjHzMn007Yk=;
 h=In-Reply-To:Cc:Message-ID:Subject:Date:References:To:From;
 b=J0L/P3Qi1yi+m3yN2ahAtzu5OCnpYgSk6R7SQuoWrZjxTMFjrtJ29NJrbRYt2aCfY
 Uo0jP8bZ+c450NvC8RWQwLbHa5ZysQ4Nzf8McfBpHobTujYw5liTs75ILf+TxNZ2zE
 bKis6FKaYhEed1guavyeGqQzbeAipEksm4bK1lmU=
Authentication-Results: sas1-c73b4b4f4b95.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Date: Wed, 20 Jul 2022 13:18:58 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, yc-core@yandex-team.ru,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>
Subject: Re: [PATCH v2] hw/pci/pci_bridge: ensure PCIe slots have only one slot
Message-ID: <YtfWkj/mPpWN7y/w@rvkaganb>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, yc-core@yandex-team.ru,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>
References: <20220719080123.553981-1-rvkagan@yandex-team.ru>
 <6dc76218-2281-4319-165b-c42086ee7157@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6dc76218-2281-4319-165b-c42086ee7157@redhat.com>
Received-SPF: pass client-ip=5.45.199.163; envelope-from=rvkagan@yandex-team.ru;
 helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, Jul 19, 2022 at 12:42:47PM +0200, Thomas Huth wrote:
> On 19/07/2022 10.01, Roman Kagan wrote:
> > +#include "qemu/osdep.h"
> > +#include "libqtest-single.h"
> 
> Do you really need libqtest-single.h here? libqtest.h should be enough,
> shouldn't it?

Indeed, will replace with libqtest.h

> > +
> > +    qtest_end();
> 
> Please drop the qtest_end() - you're already using qtest_quit in the
> individual tests.

ok

Thanks,
Roman.

