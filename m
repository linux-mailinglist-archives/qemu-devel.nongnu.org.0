Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0FB62E38C
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 18:54:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovj4V-00074k-CE; Thu, 17 Nov 2022 12:53:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <linux+qemu-devel=nongnu.org@armlinux.org.uk>)
 id 1ovj4S-000743-Tg
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 12:53:04 -0500
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <linux+qemu-devel=nongnu.org@armlinux.org.uk>)
 id 1ovj4R-0002hK-Bf
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 12:53:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i50+oi7IqHn5aHkEuDqDvYt7xizulQyImFC3jg08ZS4=; b=EZfijbcl5lH2/TbvSKy7ZoJRiz
 GHXTHEH+RP/btsRE0OcTkqQtOYPlYtqTNf9q0L+040gMLs8iplf6U/726Wwujer4bvNM0RQgy6qsX
 pYI0jLvSISS8dx5hen2b4zoUa89ZtpuBm6XxGQveJeS2x4aXivIJSmg1xKHpuLxKoG+C7h4OLly1+
 QnWkPns/l/8rkWvIgR+zlvammalOlovVl8uMPkBUKdanJTU6aLF1moy21YjNTaM83vzIkvucHNX7/
 MFV1KDCZetd++RzhmI2L7b6ttR4oEbgIzGoSQ6CayQ39x47/BFWb1gJoI00h1C92gSs7pHHhe+zVp
 fuMGk1Aw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35316)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1ovj3L-0004pm-BR; Thu, 17 Nov 2022 17:51:55 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1ovj3J-0006zI-5A; Thu, 17 Nov 2022 17:51:53 +0000
Date: Thu, 17 Nov 2022 17:51:53 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Tobias Fiebig <tobias+git@fiebig.nl>,
 Jason Wang <jasowang@redhat.com>, qemu-stable@nongnu.org
Subject: Re: [PATCH for-7.2 v3 3/3] rtl8139: honor large send MSS value
Message-ID: <Y3Z0uasQy+pr0Vng@shell.armlinux.org.uk>
References: <20221117165554.1773409-1-stefanha@redhat.com>
 <20221117165554.1773409-4-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221117165554.1773409-4-stefanha@redhat.com>
Received-SPF: none client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142;
 envelope-from=linux+qemu-devel=nongnu.org@armlinux.org.uk;
 helo=pandora.armlinux.org.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Stefan,

Your subject says "for-7.2" - that's a while off yet! I guess you need
to update it to "for-6.2" for the next posting of this series.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

