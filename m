Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A791ECCFA
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jun 2020 11:53:04 +0200 (CEST)
Received: from localhost ([::1]:54860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgQ51-00025R-4h
	for lists+qemu-devel@lfdr.de; Wed, 03 Jun 2020 05:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1jgQ3m-0001WA-4v
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 05:51:46 -0400
Received: from collins.uni-paderborn.de ([2001:638:502:c003::14]:60226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1jgQ3k-0002ro-JY
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 05:51:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eKSHlqWcGPq1gHEbEHe4zHx5fs41/NXYqwx9e45V2MM=; b=ijNi54RCZA7cgUJ3eQ/UZjlFYb
 ZHJPH8MZJJ1pd4xXTQfVPr8Xn7u0mi4gHbqa0RC6RNlINdOilkiFpRKySdcSNk5iIFKf2rB8/o8NC
 kjO2+3xij41+FgGuiatz75pyjaKO4IpDXV8mKrp4LrxfcbIFJOV4CNIgvQuO6406xF2Y=;
Date: Wed, 3 Jun 2020 11:51:37 +0200
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Subject: How do I add my tcg tests to check-tcg?
Message-ID: <20200603095137.lt6dafpqpa4jzx2n@schnipp-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-IMT-Spam-Score: 0.0 ()
X-Sophos-SenderHistory: ip=2a02:908:2214:e5bc::95d, fs=6815282, da=78786963,
 mc=169, sc=3, hc=166, sp=1, fso=6815282, re=0, sd=0, hd=0
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2020.6.3.94518, AntiVirus-Engine: 5.74.0,
 AntiVirus-Data: 2020.6.3.5740001
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
Received-SPF: pass client-ip=2001:638:502:c003::14;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=collins.uni-paderborn.de
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

I have some time again to integrate my tcg tests patch for TriCore [1]. However,
I'm struggeling a bit to get through the details of the Makefiles. I'm assuming
the right rule to run is 'make check-tcg'. I tried running that for
xtensa-softmmu, arm-softmmu, and aarch64-softmmu, but they are always skipped.
Digging into the Makefiles I found that there is some way to use the dockerfiles
to run the test. Can someone elighten me on how to properly use this?

Thanks and cheers,
Bastian

[1] https://lists.nongnu.org/archive/html/qemu-devel/2018-05/msg00074.html

