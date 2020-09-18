Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D954426FE95
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Sep 2020 15:35:45 +0200 (CEST)
Received: from localhost ([::1]:41806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJGYC-00065Q-VU
	for lists+qemu-devel@lfdr.de; Fri, 18 Sep 2020 09:35:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1kJGSw-0000Hr-Oh
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 09:30:20 -0400
Received: from esa5.hc3370-68.iphmx.com ([216.71.155.168]:37671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1kJGSu-0002cX-Jk
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 09:30:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600435816;
 h=date:from:to:subject:message-id:mime-version;
 bh=uquA9pm755MDYP2zCrCF1L2z5wd4DPYBlg4rUynE83s=;
 b=J2Liktamt5ZUYZQrxqGogjzyrs9nJvt03kF3dBl6RFvcZZd7QMqzxqwx
 hJqhaP7XALgB3FjtfRi8DfX1qh7ch2xi7QwmaaWvfytnJ5pF9GOpNxDDn
 EHrCwr0rthBTk3LCbpi/0PNhyiT3+U9oYk8LqDcqEXWQybnQW7EE4E6QH s=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 1R0aLF7lZD4TXS0sF3gd0CDQmp6no+hvQgBP4y7ZT7+la6b8RhepdzWMH5ADtFAjZcpC5myStx
 dgZEzNIKBNm42O2A4eqx+mcndrrzUcWGkEL27eS945xwaL9Niwj3pl0kdJXrnKmNGhU3qPiNm0
 Ae065YfimxnKqD6Vh/tq7bAYHqveQq8rmcJ8ZSsi0ZaFQJVfMDcKmiyfitBKFT001UcXf0Cofr
 vUYnzBCbv7nhClgjuAw9UzSrekn+hVz1tROvkoR+wTBmf3GGrOGnFLK1fYjiXS8Cqtp7Y/aUpA
 J+k=
X-SBRS: 2.7
X-MesageID: 27134798
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,274,1596513600"; d="scan'208";a="27134798"
Date: Fri, 18 Sep 2020 14:30:12 +0100
To: <qemu-devel@nongnu.org>
Subject: configure with datadir outside of --prefix fails with meson
Message-ID: <20200918133012.GH2024@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Received-SPF: pass client-ip=216.71.155.168;
 envelope-from=anthony.perard@citrix.com; helo=esa5.hc3370-68.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/18 09:30:14
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -73
X-Spam_score: -7.4
X-Spam_bar: -------
X-Spam_report: (-7.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Anthony PERARD <anthony.perard@citrix.com>
From: Anthony PERARD via <qemu-devel@nongnu.org>

Hi,

When we build QEMU while building Xen we do:
    ./configure --prefix=/usr/lib/xen \
                --datadir=/usr/share/qemu-xen \
                ...

But meson give an error:
  ERROR: The value of the 'datadir' option is '/usr/share/qemu-xen' which must be a subdir of the prefix '/usr/lib/xen'.

Would it still be possible to allow datadir outside of prefix or is it
going to be a limitation imposed by meson?

I can always change the call to configure but it would be nice not to
have to.

Thanks,

-- 
Anthony PERARD

