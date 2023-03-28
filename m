Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EDF6CC827
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 18:37:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phCJX-0000pi-QV; Tue, 28 Mar 2023 12:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=4447e4ca9=pdurrant@amazon.co.uk>)
 id 1phCJP-0000ky-SH; Tue, 28 Mar 2023 12:36:44 -0400
Received: from smtp-fw-33001.amazon.com ([207.171.190.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=4447e4ca9=pdurrant@amazon.co.uk>)
 id 1phCJO-0003KG-6Y; Tue, 28 Mar 2023 12:36:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1680021402; x=1711557402;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=aXs1OIgQb/CRGohUop+vcAjRoV+KoXVTtMSvlGRMvwE=;
 b=T+md9nvs0qrAblIue+X+QCmTaQVt4pihfCi99gLmhJwugQh46mdDLyLN
 3qRKZdc1KDLj8J6IavgYeGbibnKRRa90V4Y6IRaY3qVMULQsOAepfc91d
 22TkmuYKPV+oKO75f9lOacMNQWEMCb4M2PP5//gO0IyyzaHjfcaym3Vj1 w=;
X-IronPort-AV: E=Sophos;i="5.98,297,1673913600"; d="scan'208";a="272983799"
Subject: RE: aio_set_event_notifier(is_external=true) in Xen code?
Thread-Topic: aio_set_event_notifier(is_external=true) in Xen code?
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-2b-m6i4x-ed19f671.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-33001.sea14.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 16:36:32 +0000
Received: from EX19MTAUEA002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-pdx-2b-m6i4x-ed19f671.us-west-2.amazon.com (Postfix)
 with ESMTPS id 38B60821DD; Tue, 28 Mar 2023 16:36:31 +0000 (UTC)
Received: from EX19D008UEC004.ant.amazon.com (10.252.135.170) by
 EX19MTAUEA002.ant.amazon.com (10.252.134.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.22; Tue, 28 Mar 2023 16:36:30 +0000
Received: from EX19D032EUC002.ant.amazon.com (10.252.61.185) by
 EX19D008UEC004.ant.amazon.com (10.252.135.170) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 28 Mar 2023 16:36:30 +0000
Received: from EX19D032EUC002.ant.amazon.com ([fe80::e696:121c:a227:174]) by
 EX19D032EUC002.ant.amazon.com ([fe80::e696:121c:a227:174%3]) with mapi id
 15.02.1118.026; Tue, 28 Mar 2023 16:36:29 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Stefan Hajnoczi <stefanha@redhat.com>, "Woodhouse, David"
 <dwmw@amazon.co.uk>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>
Thread-Index: AQHZYY0wa5KcyzMf6EK28V3d++oWeq8QYLYQ
Date: Tue, 28 Mar 2023 16:36:29 +0000
Message-ID: <1c064dc2c005455a88025f985a9bf66b@amazon.co.uk>
References: <20230328155050.GA1632689@fedora>
In-Reply-To: <20230328155050.GA1632689@fedora>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.95.148.169]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Precedence: Bulk
Received-SPF: pass client-ip=207.171.190.10;
 envelope-from=prvs=4447e4ca9=pdurrant@amazon.co.uk;
 helo=smtp-fw-33001.amazon.com
X-Spam_score_int: -118
X-Spam_score: -11.9
X-Spam_bar: -----------
X-Spam_report: (-11.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

> -----Original Message-----
> From: Stefan Hajnoczi <stefanha@redhat.com>
> Sent: 28 March 2023 16:51
> To: Woodhouse, David <dwmw@amazon.co.uk>; Durrant, Paul
> <pdurrant@amazon.co.uk>
> Cc: qemu-devel@nongnu.org; qemu-block@nongnu.org
> Subject: [EXTERNAL] aio_set_event_notifier(is_external=3Dtrue) in Xen cod=
e?
>=20
> Hi,
> I'm removing the aio_disable_external() API from QEMU and noticed that
> Xen code calls aio_set_fd_handler(is_external=3Dtrue) in hw/xen/xen-bus.c
> and hw/i386/kvm/xen_xenstore.c.
>=20
> It wasn't clear to me whether is_external=3Dtrue is necessary here.
> is_external=3Dtrue is mainly used to temporarily pause I/O submission in
> the QEMU block layer. Maybe is_external=3Dtrue was chosen out of caution
> but actually has no effect in this code.
>=20
> Does the Xen code rely on is_external=3Dtrue?


That's a good question. The call in xen-bus.c has been there since commit 8=
3361a8a1f932, which was when it substituted the old call to qemu_set_fd_han=
dler(). I suspect this was out of caution (or possibly misunderstanding) at=
 the time, although setting the call to xen_device_set_event_channel_contex=
t() in xen_block_dataplane_stop() does suggest it may be happening while I/=
O could be in progress so it could have been in response to problems caught=
 in testing.
I suspect the code in xen_xenstore.c just copied what xen-bus.c did.

Sorry I can't give you a definitive answer... it's all rather a long time a=
go.

  Cheers,

    Paul

