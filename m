Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF25376873
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 18:11:50 +0200 (CEST)
Received: from localhost ([::1]:48060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf34u-0005Lq-Qr
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 12:11:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1lf33q-0004qt-CK
 for qemu-devel@nongnu.org; Fri, 07 May 2021 12:10:42 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:15350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1lf33n-0004VZ-Ac
 for qemu-devel@nongnu.org; Fri, 07 May 2021 12:10:41 -0400
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 147G87Xj008476; Fri, 7 May 2021 09:10:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=10tlabZKjPdsJ9mdvPCfNl98oz4mpdlIOuNN5+iHSdg=;
 b=pDQ/8C0Qmz2hduoBFsPEiMiAYh79KIy37AFtMUBp1i7Wu0NtyGc82UrV8MbpKdmnDH0Z
 Ykyz9kWfuFa7cWHVHhQR0RCgyOsmnYdlHMDJpisfWnjlboQlyuUKW7ymHXBJYmIpUB30
 5eexWTqOQdMZtmXl7JnoPELqd/pUFobLiHAThLm9HLcK00aA4b6/QIE1s2028NGqGz1r
 6PP6BAyXo/X7DNEaG+nIY/1dCGL/eS7rvQd8WhWM+S2nrjdrgq/zdgrFWtbFEfZ3rDXq
 6ydpwrzE4mRlwBDfaCAIy3ZEVbnpFbkDNIsnqHqIxWFvRCA0aLiLQgsqn7fyHfoz9Zyh 9w== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by mx0a-002c1b01.pphosted.com with ESMTP id 38csqthmb0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 May 2021 09:10:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bdwva+hpw6kMWpASJCZu30csRIjP+vmalYwwZ5tMB2uIQiCv8aYzD0d3E9VvcmG7C37r6lRn+XEOmG2eu+kN9zuY4SePZ3TolKSZcfOUtYvtWq4Q5QtUIzQ2ApxlDErFtMEgYxSliogCOSBTqH8mkwPEA5ArSk/ItO77tVgwfdsvVnfF4zx2xbThcMS17srfnG+zByXSyk9XYQLgCPfqKW/Y48ssgGZj7S25e8CbiEo/RZ4JfO11urcq7YvhBjvnkGm7F/ilt4nxRXPo6V5ITLOCCYLM2hV8yi2k7uxM97f8nAMLVpUzKmOhUl8vTLxFfS+/cG+Y+/6qICPW6r6Tmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10tlabZKjPdsJ9mdvPCfNl98oz4mpdlIOuNN5+iHSdg=;
 b=PyLZuLylwj168D10uKw1kzgV1P7gTKUA2BZ84cnqldqLJg99iiwGvXzHy5TFbBwdJswvObQQw/AOQWLR0iL5GXqhISVndWDXxRBuyBgpLwtzRxN+sh8n5i1AFXII7nsBw7FiHiZA00MuN6hkNlLPq12rtbDI5aNKAZm2An3KcW3z5SOuuBapbVqcS29VFXORKKxTIWfF4WX4NLUJWQf0y9ol0psRWqW+rYz/jrnAP3Jp3kgVfFc9yfoI5xKtZ2+JyAl6T1xGNzF7g2qeQc7kzCPBz9DsaksB9dvitJIL5YOLpb68/ZYVcXMvSuHhABcLG7nbG94IwA0hBiCLsZyqoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from MW2PR02MB3723.namprd02.prod.outlook.com (2603:10b6:907:2::32)
 by MW4PR02MB7380.namprd02.prod.outlook.com (2603:10b6:303:74::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Fri, 7 May
 2021 16:10:09 +0000
Received: from MW2PR02MB3723.namprd02.prod.outlook.com
 ([fe80::3591:14f:bb39:4797]) by MW2PR02MB3723.namprd02.prod.outlook.com
 ([fe80::3591:14f:bb39:4797%3]) with mapi id 15.20.4108.027; Fri, 7 May 2021
 16:10:09 +0000
From: Thanos Makatos <thanos.makatos@nutanix.com>
To: John Levon <john.levon@nutanix.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: RE: [PATCH v8] introduce vfio-user protocol specification
Thread-Topic: [PATCH v8] introduce vfio-user protocol specification
Thread-Index: AQHXQcp2CqoJh2k13EyDqbeO4k+A0arYMwkg
Date: Fri, 7 May 2021 16:10:08 +0000
Message-ID: <MW2PR02MB37237C9782FD9A8D4708CC3E8B579@MW2PR02MB3723.namprd02.prod.outlook.com>
References: <YJK+8MrRe3ANcu7y@stefanha-x1.localdomain>
 <YJFRcdvcOlwm2bd7@stefanha-x1.localdomain> <20210505161942.GA1195642@sent>
In-Reply-To: <20210505161942.GA1195642@sent>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nutanix.com; dkim=none (message not signed)
 header.d=none;nutanix.com; dmarc=none action=none header.from=nutanix.com;
x-originating-ip: [78.149.4.199]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1d18a4d-c4b4-41ae-dfca-08d91172963c
x-ms-traffictypediagnostic: MW4PR02MB7380:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW4PR02MB73807E5F08A25DC0C2DFAD4A8B579@MW4PR02MB7380.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P6M+rnTtTSokQZTQ53cOvOAbC1l+8cR3NNbMBgGBfVtGq5+gdLGbIh4l7Y7IdxcSOTmobzLsWwhvoh+v7Z1uMgXeG0lJ9qCh0hTFE0d8KGuuEtjsId2KO7Mn+xNesw/+mMxc8ABbto2mCEJV2klH3LdiUCSMH3CPEb0dL2Dbn+RcYFxtXzu1AHlMzGf5cPFfH8iBIuYcsNLZOw74/5TbMf7F+2Rres1nbz6Z+Nm9KFxLlC7eZM9340EZl+7QnoJN+/lxL/O5omUfJaOaenRNK1SoIMfIcqXVNNGbdm4iSiARHMI0zuVXzRry8xIWc5Chjim/CxyRFyFCRsqVHgu+cDT7qHhWNSqgZ03ocWtgKAHz0Cvb+GgCVEjOsgSwAG30oCvpmUci9I7fWaBEk4AvkLAp3ZniQaqu/ou0MLfixPA+6wcfkgI+4XgUud6wApSC4WhyXHknlBkl/S+oZNJIXM2rKFfp0rOfFcnSeJoMnWTmzBQ43AsWeK9welIJkzuXMnbQ8sXP13MXw5+gdj5fKBN7LQDfR327U3BQwATBWcu7Zu2vDSW+Or5XHFspUF6snKeybwOCpGZ2wNfmOMbykWTbE8I2qpkr9enQyI9I5jDqJv5R/G6FWLHEqwAbwShCoQ6V63zd2zFOT89fbVnO+ge1Il8NU+fzGHI8Man3ZIZaFYZsLuM9FnfE1AG4S6dMtwH2xw+5cU75CET8execNZaspAi/9+Bx14EYgMeyx/8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR02MB3723.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(136003)(366004)(376002)(396003)(346002)(186003)(83380400001)(8676002)(966005)(26005)(55016002)(6506007)(44832011)(7696005)(38100700002)(478600001)(33656002)(8936002)(55236004)(7416002)(52536014)(110136005)(64756008)(4326008)(66446008)(316002)(66556008)(5660300002)(2906002)(76116006)(54906003)(66946007)(71200400001)(86362001)(122000001)(9686003)(53546011)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3+YXLoBHBFGKHDEcFZJU1xU2adrhxSmncaLRhGnXGDOzaXTeJBEddI3AfXnO?=
 =?us-ascii?Q?1u6MTvxeREWZnaGcn+kLJEfOlHUDJPhsDW+3zWpSY1s72bb7J7fIbRzX88U1?=
 =?us-ascii?Q?uY9OlO4XeAnkutpL5wyoR6vzSeQjaGAsv2JjVnLE9DccZHeRUmdNiQceOb7D?=
 =?us-ascii?Q?UeqkKnWlVDlzsTv0OlzirNATwUh4DK0y4RWYT6/PGCj2Dzao9rhRhDOqtK9w?=
 =?us-ascii?Q?QhemWW2pWoeNwkaD8rf3vRzYm/0FeH4iX3RtTNU1O1zCvEjag5LRus8MEzHt?=
 =?us-ascii?Q?krVf7lzQVXULATZ3m2SoXM/emDCPWHAQErbaVA6nkLAfyD9BVeaazdc7Lxve?=
 =?us-ascii?Q?z2q1oR8dxVupjvNyST2rgVBIYFVudaMNiZBp5rQCX6gqvkqu4Ts5UKoEri4x?=
 =?us-ascii?Q?mMIIbu982hI6BCPvk2oWC2kJpE3FRji1Nyur2XUG2zccdcthTcIQpSEizcEx?=
 =?us-ascii?Q?e9CEc4ksjhHzenGLfISTGFtmsIF3lJStN7qUcdumTF08XKhBYRZr3AaMRFRn?=
 =?us-ascii?Q?p5WIpxUPt/h8HZR1Eqfcox6N39lVqOzjDj5CuTgwENA33Sv3YIWTTeHMhvHq?=
 =?us-ascii?Q?C4gx+DUIPbiULJb1tY2+jW0JgLFWWs7P+IpRgiBswf3vYGX4/+NrRvVLDNG7?=
 =?us-ascii?Q?5bwYcySrnolrBbXZLz7y/+LH07+kz9sTKvuA/PfmCRgVWKX8uAbj2FjhuPn1?=
 =?us-ascii?Q?dvO5CrJOQ43aPhxLdjVjSN2X2Xt+C2IDOnsBxzWnSGLh2x1keNtsbO3DUwAB?=
 =?us-ascii?Q?18cbuyKrnwvW+yn4NALIQ33eugeGXjdOQFNE8DRXK5bDDDqQR4KsXggA+GwD?=
 =?us-ascii?Q?ONwvDPPb9dquoteYceuvXC7TDXxX4OXvwBYN0/kjyhdg4IQsWiIM06dH+kYn?=
 =?us-ascii?Q?GCbmiJMj35AWWe3dTV4XTy5rzS1Zp9R1HNjHbdfWJV5KIGS3qMfRtItGsowW?=
 =?us-ascii?Q?ZsFclYKQg9o6SH6FuVzntGGk8gZP6Fssx8jO+QAAwGQNedfEwWfX6S0BIZ6O?=
 =?us-ascii?Q?gX7rmRhCbSpOjrfoQsUl67g5prW6OP5ia4UXFQwqgTm5FKtQ2FbdOTc6HLfa?=
 =?us-ascii?Q?tIl7FFhnRV4s3SnegDNM2kEGeFbqQqIqD1rgbKZ1fWyNgt8EOoPFN/ezIO/D?=
 =?us-ascii?Q?1eoUtWJK2J+FtfI0i/GuWBe0uq5xsvD1xxotyVsNvFItF++KM/DBud3UJX8s?=
 =?us-ascii?Q?FJEFSCB89tDbra0tgDkv1iNIhh9QTmYVjKepYxwozv/DDHSUNKcyEDQm9fDp?=
 =?us-ascii?Q?FuJ8VXBKZxEnO43tWzmo4N+944AhPBG1p8I2RXxZsOeurUKlFf185N6l6LHe?=
 =?us-ascii?Q?3ZQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR02MB3723.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1d18a4d-c4b4-41ae-dfca-08d91172963c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2021 16:10:09.2662 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IVlDVBjnAFK30VwTHQKnpgSA7/m6kltX6V5JiyApUk44MlZajnQfPEwhSA3j36W7d2wdsERwKBRAQ68/EYHSbAJiR/a3LNZTDOlt+9ZloRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7380
X-Proofpoint-GUID: Ccap77KyywDBE5i5EzSGA3rdaTqTK__-
X-Proofpoint-ORIG-GUID: Ccap77KyywDBE5i5EzSGA3rdaTqTK__-
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-07_06:2021-05-06,
 2021-05-07 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=thanos.makatos@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: "benjamin.walker@intel.com" <benjamin.walker@intel.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 John Levon <levon@movementarian.org>, Kirti Wankhede <kwankhede@nvidia.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "tina.zhang@intel.com" <tina.zhang@intel.com>,
 "jag.raman@oracle.com" <jag.raman@oracle.com>,
 "james.r.harris@intel.com" <james.r.harris@intel.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "Kanth.Ghatraju@oracle.com" <Kanth.Ghatraju@oracle.com>,
 Felipe Franciosi <felipe@nutanix.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 Christophe de Dinechin <cdupontd@redhat.com>, Yan Zhao <yan.y.zhao@intel.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "yuvalkashtan@gmail.com" <yuvalkashtan@gmail.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "ismael@linux.com" <ismael@linux.com>,
 "changpeng.liu@intel.com" <changpeng.liu@intel.com>,
 "tomassetti.andrea@gmail.com" <tomassetti.andrea@gmail.com>,
 "mpiszczek@ddn.com" <mpiszczek@ddn.com>, Cornelia Huck <cohuck@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "xiuchun.lu@intel.com" <xiuchun.lu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> -----Original Message-----
> From: John Levon <john.levon@nutanix.com>
> Sent: 05 May 2021 17:20
> To: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Thanos Makatos <thanos.makatos@nutanix.com>; qemu-
> devel@nongnu.org; John Levon <levon@movementarian.org>; John G
> Johnson <john.g.johnson@oracle.com>; benjamin.walker@intel.com; Elena
> Ufimtseva <elena.ufimtseva@oracle.com>; jag.raman@oracle.com;
> james.r.harris@intel.com; Swapnil Ingle <swapnil.ingle@nutanix.com>;
> konrad.wilk@oracle.com; alex.williamson@redhat.com;
> yuvalkashtan@gmail.com; tina.zhang@intel.com;
> marcandre.lureau@redhat.com; ismael@linux.com;
> Kanth.Ghatraju@oracle.com; Felipe Franciosi <felipe@nutanix.com>;
> xiuchun.lu@intel.com; tomassetti.andrea@gmail.com; Raphael Norwitz
> <raphael.norwitz@nutanix.com>; changpeng.liu@intel.com;
> dgilbert@redhat.com; Yan Zhao <yan.y.zhao@intel.com>; Michael S . Tsirkin
> <mst@redhat.com>; Gerd Hoffmann <kraxel@redhat.com>; Christophe de
> Dinechin <cdupontd@redhat.com>; Jason Wang <jasowang@redhat.com>;
> Cornelia Huck <cohuck@redhat.com>; Kirti Wankhede
> <kwankhede@nvidia.com>; Paolo Bonzini <pbonzini@redhat.com>;
> mpiszczek@ddn.com
> Subject: Re: [PATCH v8] introduce vfio-user protocol specification
>=20
> On Tue, May 04, 2021 at 02:51:45PM +0100, Stefan Hajnoczi wrote:
>=20
> > > +While passing of file descriptors is desirable for performance
> > > +reasons, it is not necessary neither for the client nor for the
> > > +server to support it in order
> >
> > Double negative. "not" can be removed.
>=20
> Done. I also took a `:set spell` pass on the whole spec, which should cat=
ch
> your other typos.
>=20
> > > +Device Read and Write
> > > +^^^^^^^^^^^^^^^^^^^^^
> > > +When the guest executes load or store operations to device memory,
> > > +the client
> >
> > <linux/vfio.h> calls it "device regions", not "device memory".
> > s/device memory/unmapped device regions/?
>=20
> Spec was sloppy here, yes. Fixed up all the instances I noticed.
>=20
> > Does anything need to be said about mmaps and file descriptors on
> > disconnected? I guess they need to be cleaned up and are not retained
> > for future reconnection?
>=20
> Updated:
>=20
> ```
> Therefore in order for the protocol to be forward compatible, the server
> should respond to a client disconnection as follows:
>=20
>  - all client memory regions are unmapped and cleaned up (including closi=
ng
> any
>    passed file descriptors)
>  - all IRQ file descriptors passed from the old client are closed
>  - the device state should otherwise be retained
>=20
> The expectation is that when a client reconnects, it will re-establish IR=
Q and
> client memory mappings.
>=20
> If anything happens to the client (such as qemu really did exit), the con=
trol
> stack will know about it and can clean up resources accordingly.
> ```
>=20
> > Are there rules for avoiding deadlock between client->server and
> > server->client messages? For example, the client sends
> > VFIO_USER_REGION_WRITE and the server sends
> VFIO_USER_VM_INTERRUPT
> > before replying to the write message.
> >
> > Multi-threaded clients and servers could end up deadlocking if
> > messages are processed while polling threads handle other device activi=
ty
> (e.g.
> > I/O requests that cause DMA messages).
> >
> > Pipelining has the nice effect that the oldest message must complete
> > before the next pipelined message starts. It imposes a maximum issue
> > depth of 1. Still, it seems like it would be relatively easy to hit
> > re-entrancy or deadlock issues since both the client and the server
> > can initiate messages and may need to wait for a response.
>=20
> Filed https://github.com/nutanix/libvfio-user/issues/466
>=20
> > > +* *Offset* is the file offset of the region with respect to the
> > > +associated file
> > > +  descriptor.
> > > +* *Protections* are the region's protection attributes as encoded
> > > +in
> > > +  ``<sys/mman.h>``.
> >
> > Please be more specific. Does it only include PROT_READ and
> PROT_WRITE?
> > What about PROT_EXEC?
>=20
> Updated to just have PROT_READ/WRITE.
>=20
> > > +If a DMA region being added can be directly mapped by the server,
> > > +an array of file descriptors must be sent as part of the message
> > > +meta-data. Each mappable region entry must have a corresponding
> > > +file descriptor. On AF_UNIX sockets, the file descriptors must be
> > > +passed as SCM_RIGHTS type ancillary data. Otherwise, if a DMA
> > > +region cannot be directly mapped by the server, it can be accessed
> > > +by the server using VFIO_USER_DMA_READ and
> VFIO_USER_DMA_WRITE
> > > +messages, explained in `Read and Write Operations`_. A command to
> map over an existing region must be failed by the server with ``EEXIST`` =
set in
> error field in the reply.
> >
> > Does this mean a vIOMMU update, like a protections bits change
> > requires an unmap command followed by a map command? That is not an
> > atomic operation but hopefully guests don't try to update a vIOMMU
> > mapping while accessing it.
>=20
> Filed https://github.com/nutanix/libvfio-user/issues/467
>=20
> > > +This command message is sent by the client to the server to inform
> > > +it that a DMA region, previously made available via a
> > > +VFIO_USER_DMA_MAP command message, is no longer available for
> DMA.
> > > +It typically occurs when memory is subtracted from the client or if
> > > +the client uses a vIOMMU. If the client does not expect the server
> > > +to perform DMA then it does not need to send to the server
> > > +VFIO_USER_DMA_UNMAP commands. If the server does not need to
> > > +perform DMA then it can ignore such commands but it must still
> > > +reply to them. The table is an
> >
> > I'm a little confused by the last two sentences about not sending or
> > ignoring VFIO_USER_DMA_UNMAP. Does it mean that
> VFIO_USER_DMA_MAP does
> > not need to be sent either when the device is known never to need DMA?
>=20
> If a device is never going to access client memory (either directly mappe=
d or
> DMA_READ/WRITE), there's no need to inform the server of VM memory.  I
> removed the sentences as they were just confusing, sort of obvious, and n=
ot
> really relevant to real systems.
>=20
> > > +* *Address* is the base DMA address of the region.
> > > +* *Size* is the size of the region.
> > > +* *Offset* is the file offset of the region with respect to the
> > > +associated file
> > > +  descriptor.
> > > +* *Protections* are the region's protection attributes as encoded
> > > +in
> > > +  ``<sys/mman.h>``.
> >
> > Why are offset and protections required for the unmap command?
>=20
> They are now explicitly listed as ignored.
>=20
> > > +* *Flags* contains the following region attributes:
> > > +
> > > +  * *VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP* indicates that a
> dirty page bitmap
> > > +    must be populated before unmapping the DMA region. The client
> must provide
> > > +    a ``struct vfio_bitmap`` in the VFIO bitmaps field for each regi=
on, with
> > > +    the ``vfio_bitmap.pgsize`` and ``vfio_bitmap.size`` fields initi=
alized.
> > > +
> > > +* *VFIO Bitmaps* contains one ``struct vfio_bitmap`` per region
> > > +(explained
> > > +  below) if ``VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP`` is set in
> Flags.
> >
> > I'm confused, it's 1 "VFIO Bitmaps" per "Table entry". Why does it
> > contain one struct vfio_bitmap per region? What is a "region" in this
> > context?
>=20
> Thanos?

The "region" here is a DMA region. A VFIO_USER_DMA_UNMAP command can unmap
multiple DMA regions and each DMA region is described by a table entry. Wha=
t I
wanted to say here is that if the VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP bit =
is
set, then for each DMA region being removed there must be a "struct vfio_bi=
tmap"
entry in the "VFIO Bitmaps" bitmaps section. I'll rephrase the text to make=
 it
clearer.

>=20
> > > +Upon receiving a VFIO_USER_DMA_UNMAP command, if the file
> > > +descriptor is mapped then the server must release all references to
> > > +that DMA region before replying, which includes potentially in
> > > +flight DMA transactions. Removing a portion of a DMA region is possi=
ble.
> >
> > "Removing a portion of a DMA region is possible"
> > -> doing so splits a larger DMA region into one or two smaller remainin=
g
> regions?
>=20
> We certainly don't have that implemented. Thanos?

Correct, removing a portion of a DMA region could result in two regions.
Indeed, this isn't currently implemented. We wanted to leave the door open =
to
such behavior if we wanted it in the future. Now I'm thinking that maybe we
should put this behind an optional capability.

>=20
>=20
> On Wed, May 05, 2021 at 04:51:12PM +0100, Stefan Hajnoczi wrote:
>=20
> > > > How do potentially large messages work around max_msg_size? It is
> > > > hard for the client/server to anticipate the maximum message size
> > > > that will be required ahead of time, so they can't really know if
> > > > they will hit a situation where max_msg_size is too low.
> > >
> > > Are there specific messages you're worried about? would it help to
> > > add a specification stipulation as to minimum size that clients and
> > > servers must support?
> > >
> > > Ultimately the max msg size exists solely to ease implementation:
> > > with a reasonable fixed size, we can always consume the entire data
> > > in one go, rather than doing partial reads. Obviously that needs a
> > > limit to avoid unbounded allocations.
> >
> > It came to mind when reading about the dirty bitmap messages. Memory
> > dirty bitmaps can become large. An 8 GB memory region has a 1 MB dirty
> > bitmap.
>=20
> Right, yeah. I filed https://github.com/nutanix/libvfio-user/issues/469 t=
o
> track it.
>=20
> regards
> john

