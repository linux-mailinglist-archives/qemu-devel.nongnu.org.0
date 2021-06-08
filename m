Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7293A0657
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 23:43:18 +0200 (CEST)
Received: from localhost ([::1]:48050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqjVF-0006vQ-6E
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 17:43:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lqjTz-000625-Tb
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 17:41:59 -0400
Received: from mga14.intel.com ([192.55.52.115]:24359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lqjTw-0004gS-Mg
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 17:41:59 -0400
IronPort-SDR: XOgOHlvXPRMW42s5CDKB0dIurqEv6DYnwcjxH/E51NfWDWhu1Dad/ZrAEhPtnA2C4bH35Cui+H
 BqK3jo8YSGnQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10009"; a="204762601"
X-IronPort-AV: E=Sophos;i="5.83,259,1616482800"; d="scan'208";a="204762601"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 14:41:49 -0700
IronPort-SDR: bdOER4nyAvF1QHKBlA0NfKJaHGxeShjhoRbZ6ejgfLcT97xqlFMUFmb++R3S+Cz5gRZUySF3mS
 2V69HejxlL2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,259,1616482800"; d="scan'208";a="402217940"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 08 Jun 2021 14:41:48 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 8 Jun 2021 14:41:48 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 8 Jun 2021 14:41:47 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.008;
 Tue, 8 Jun 2021 14:41:47 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [PATCH v1 3/5] ui/egl: Add egl helpers to help with
 synchronization
Thread-Topic: [PATCH v1 3/5] ui/egl: Add egl helpers to help with
 synchronization
Thread-Index: AQHXW/Yp1cSUgBg2DEacxKSD7IoJDKsKmsIAgAAKhVA=
Date: Tue, 8 Jun 2021 21:41:47 +0000
Message-ID: <55623dab6e2141d48b26d2dd29266439@intel.com>
References: <20210607232530.454435-1-vivek.kasireddy@intel.com>
 <20210607232530.454435-4-vivek.kasireddy@intel.com>
 <20210608140042.kl26xpevsswiq7ty@sirius.home.kraxel.org>
In-Reply-To: <20210608140042.kl26xpevsswiq7ty@sirius.home.kraxel.org>
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
Received-SPF: pass client-ip=192.55.52.115;
 envelope-from=vivek.kasireddy@intel.com; helo=mga14.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
=20
> > +        epoxy_has_egl_extension(qemu_egl_display,
> > +                                "EGL_ANDROID_native_fence_sync")) {
>=20
> What about non-android?  Is the name there just for historical reasons?
> Or do we actually need something else for desktop systems?
[Kasireddy, Vivek] It is not specific to Android:
https://www.khronos.org/registry/EGL/extensions/ANDROID/EGL_ANDROID_native_=
fence_sync.txt

I have been using Linux (Fedora 33 for both Guest and Host) as my
test platform.

>=20
> > +void egl_dmabuf_wait_sync(QemuDmaBuf *dmabuf)
>=20
> See other mail on blocking wait.  Otherwise looks sane.
>=20
> > +static void gd_gl_wait_dmabuf(DisplayChangeListener *dcl,
> > +                              QemuDmaBuf *dmabuf)
>=20
> separate patch for the gtk bits please.
[Kasireddy, Vivek] Ok, will do.

Thanks,
Vivek

>=20
> thanks,
>   Gerd


