Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD603920FE
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 21:36:17 +0200 (CEST)
Received: from localhost ([::1]:58728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llzKC-00016U-EX
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 15:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1llzGT-00076d-JM
 for qemu-devel@nongnu.org; Wed, 26 May 2021 15:32:25 -0400
Received: from mga07.intel.com ([134.134.136.100]:30449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1llzGR-0001GP-4S
 for qemu-devel@nongnu.org; Wed, 26 May 2021 15:32:25 -0400
IronPort-SDR: CkjnvM+JqYnlU5yqgFgNKRn8sqhMmNnKCpSexUzZelaSFvkoNxyznCLjBpbCxkS/DOMRHqXdfu
 I2FGsQUFm5fg==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="266448223"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="266448223"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 12:32:15 -0700
IronPort-SDR: /4f1VG4a837vbBVf8ewZPb9py/5y5XvcwrgLDsiQOK86fFGTLsJpk7LLhRnAUsFrLBNix5iAOX
 kb9+Eovz34ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="444232156"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 26 May 2021 12:32:15 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 26 May 2021 12:32:14 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 26 May 2021 12:32:14 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.008;
 Wed, 26 May 2021 12:32:14 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [PATCH v6 03/13] virtio-gpu: Add udmabuf helpers
Thread-Topic: [PATCH v6 03/13] virtio-gpu: Add udmabuf helpers
Thread-Index: AQHXUO4xDIZaoa5ue0Sv8VgC0H//46r1wNWAgABmoCA=
Date: Wed, 26 May 2021 19:32:14 +0000
Message-ID: <4d125d60964d4512a012469baff90ab9@intel.com>
References: <20210524223103.922910-1-vivek.kasireddy@intel.com>
 <20210524223103.922910-4-vivek.kasireddy@intel.com>
 <20210526061633.taqutqwaagszygq3@sirius.home.kraxel.org>
In-Reply-To: <20210526061633.taqutqwaagszygq3@sirius.home.kraxel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=vivek.kasireddy@intel.com; helo=mga07.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Gerd,

>   Hi,
>=20
> > +#ifdef CONFIG_LINUX
>=20
> Seems wee need "#if defined(CONFIG_LINUX) && defined(F_GET_SEALS)" here
> to cover old linux versions.  I see some build failures in gitlab CI due =
to
> F_GET_SEALS not being defined (crypto-old-nettle for example).
[Kasireddy, Vivek] Instead, I am planning to remove the ifdef and add a fil=
e in stubs
with the pixman dependency like you suggested. For seals, I think I could j=
ust include
qemu/memfd.h that has a definition for F_GET_SEALS.

>=20
> > +#include <sys/fcntl.h>
>=20
> gitlab ci (build-system-alpine):
>=20
> /usr/include/sys/fcntl.h:1:2: error: #warning redirecting incorrect #incl=
ude <sys/fcntl.h> to
> <fcntl.h> [-Werror=3Dcpp]
>     1 | #warning redirecting incorrect #include <sys/fcntl.h> to <fcntl.h=
>
[Kasireddy, Vivek] Ok, I'll replace sys/fcntl.h with just fcntl.h

>=20
> Otherwise series looks good and survived basic testing.
[Kasireddy, Vivek] Will send a v7 that would address the above issues.

Thanks,
Vivek
>=20
> take care,
>   Gerd


