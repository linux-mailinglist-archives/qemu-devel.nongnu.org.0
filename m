Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA223A5F98
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 11:59:57 +0200 (CEST)
Received: from localhost ([::1]:35992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsjNs-0007iI-5L
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 05:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1lsjLJ-0005VR-6l
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 05:57:17 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:54584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1lsjLE-00033Z-95
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 05:57:16 -0400
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15E9ubIj005905; Mon, 14 Jun 2021 02:57:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=MvF/zEB7xxROMiwpj42U7+g3Q2HKmvcaicorN+c1oh4=;
 b=AryFZ4vE+Hh49ydeOR6fzUxvb6xNzPS1TBDvUbLFGVdFvLcl8PY1FTb8uHCAd6RYyPUs
 aJAvKs9ZE6SjRS+Qphm3wSYpMREhuxAeLUmIyWmmkQy+ERe6GmjEH56Yfj11VNJyk74X
 uj/xdNZUgivo8D0N0CMatqJQ9Yt6+Ph2OhM3MVKDMRkSWEpZrRWXkNAwVH+Sr6HmlLgr
 LYVSx2beufBZ98ucPqa66zrU0i7EKqyu95UskK9GybizFXp0HYkMJ2Sjg0yXFLm5oQib
 UgpM5EF7kCZ7hb/eJ31ozeUt8CKuwxCsZ0sfpa4rNxuJ37gAJ9czKcNRQ/M2nIAfEZ+l 1Q== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
 by mx0b-002c1b01.pphosted.com with ESMTP id 3960du0h2c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jun 2021 02:57:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UqODfeKrDWg7J1Y+9UuoLq3tFZvEya5jrxjBx9u9CvClafUiWQk7X8YUH0ayrvQD4XuQuelY+zO0Vu2uYy7zJpNlUu64FC4Twje+2521lvAIr9F5nVgYqBw4aN/xdp3yVNuoC+vFpNo4uPH+RUkme55RS6c34pwBeqWbqLaP7sLWrs10ZA2Ev5y3rg4h4FuNYdVIj5jSjxtZIpl9JRnWmIF8IPioc4Nl2xEJHtfaO1NkF+qX94nRyEXbOlxX3tR+nXCerM4QUDCuqmpCDreKBiwcHC/71Rmv21G4teVz7ABGDBK1W8C2YUunEdy8L1BE07RVoqfCmKDDvDAmPi/6aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvF/zEB7xxROMiwpj42U7+g3Q2HKmvcaicorN+c1oh4=;
 b=YvDVWf3uyQmW2FAVr0EmWKOttXZS7Rtc6gFDr+v2ugHaUUf1xXLJAPlBpbHvYh427q3na3e2G8mPxmh/ECKzpzPBGuToqD/V/52kxbaukB+3H7/6ef17HTWXyDQM+WOG/nBzFe2fW/7FRI2S3W5VDFl2Olf/3XN2UoBIIhSPiPx/Y48O79aXYPmBvaJOl0qn5Evvjkinsy9cmFvpL0BpW/PvbIckgTRMuFGaLM760Pbny9L5Vs7/yoSobBnHyCnDZQM9eqdwYuwzrC703qE9YP9rp0riRR3E/0+w12m2+mD0qyxslsNkivTIyuJ3gC28CGN4YOBQUUBN7sHOlg4FPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from CH0PR02MB7898.namprd02.prod.outlook.com (2603:10b6:610:113::5)
 by CH2PR02MB6599.namprd02.prod.outlook.com (2603:10b6:610:7b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Mon, 14 Jun
 2021 09:57:01 +0000
Received: from CH0PR02MB7898.namprd02.prod.outlook.com
 ([fe80::a91d:ad88:5b1f:c981]) by CH0PR02MB7898.namprd02.prod.outlook.com
 ([fe80::a91d:ad88:5b1f:c981%7]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 09:57:00 +0000
From: Thanos Makatos <thanos.makatos@nutanix.com>
To: John Levon <john.levon@nutanix.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: RE: [PATCH v8] introduce vfio-user protocol specification
Thread-Topic: [PATCH v8] introduce vfio-user protocol specification
Thread-Index: AQHXMSMjtDp7nXmGRkuiYMGnZrvqnqrTdveAgAALLYCAQCC3YA==
Date: Mon, 14 Jun 2021 09:57:00 +0000
Message-ID: <CH0PR02MB78986EE8F1CA1C0A96A44BE08B319@CH0PR02MB7898.namprd02.prod.outlook.com>
References: <20210414114122.236193-1-thanos.makatos@nutanix.com>
 <YJFRcdvcOlwm2bd7@stefanha-x1.localdomain> <20210504143141.GA1078723@sent>
In-Reply-To: <20210504143141.GA1078723@sent>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nutanix.com; dkim=none (message not signed)
 header.d=none;nutanix.com; dmarc=none action=none header.from=nutanix.com;
x-originating-ip: [78.149.4.199]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7210cab9-d442-4d57-b0c0-08d92f1ac156
x-ms-traffictypediagnostic: CH2PR02MB6599:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR02MB6599962A03B9AA0A249B239F8B319@CH2PR02MB6599.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T+o/MD+LsgGMiKXgX+4nZrkXW09sbEjCxKFeJu9mK1LgYSjGqx0V/gNKEzXvHfib/PJ7inEZyFxfz33POXTn3kNpMvDDGUZiFRjFz8k9JlMRtAoKLsFb5laNg5r8FhEn8KLS3+akDjzZRTF7eKQCKQm16TZr6tMDr4A43u07Lbs+5GGLFz1HQYiwml7T/4kRuVwpNXDbitUlwrWTrglyNiEDPHPZOZzubZ6hXD9Du1/bMscy/RmmK/UjjnjewNUeycNcWXAsWTQjow7U/+nTyKitdrwd81pLSphi04lwMGgCNa9mFId4DUwy+qeEC05eR2I1l+W0woFp5BrQBmWSxblfH9bWnTWVDGwiBpVWMp+qHtzTgvvaGz6VlP7GyKof8Jr3Ka/tRbl1elKGCUkaH6e50bYu20TcmPmrkD7zttubl+H70nPx7Hg80BHHahXCRhLUy5stZtQwGxtDgwhbd2aMIlogIkYKj8uQjPapyIzbFNXT2upNvo1porruWK7y1RWgY7AFQ21wasDTAl9Ju6qmHl6DWXmuaGYOGh6w6K0MMxgaR5mbWenCd1uRj9pQZbu6nAvefQA0VJdED9gNFOQRtxglAN+FY0oTt3hXQf0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR02MB7898.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(136003)(396003)(366004)(346002)(376002)(33656002)(8676002)(8936002)(7696005)(2906002)(26005)(71200400001)(55236004)(54906003)(316002)(7416002)(110136005)(6506007)(186003)(44832011)(83380400001)(86362001)(76116006)(52536014)(5660300002)(66476007)(66946007)(9686003)(66556008)(64756008)(38100700002)(55016002)(66446008)(122000001)(4326008)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/JbPyraCZWpAfTQDbdfQhn20JMcSK2dRm07uALOvVH7hrKS0VvsVIGMmP7m8?=
 =?us-ascii?Q?jh3CEEXdnHVTvs5RVV0Mrg0X9lJ1dZQgm8z99WcUTKqJOFHrhy0kJl3rs8l+?=
 =?us-ascii?Q?IQeP5ejp8Yy4vjAE7D5jsl1isQajwxnW2ymYtOUb/FTdEVTLt+Mcibcv6XNQ?=
 =?us-ascii?Q?KluvsIRbShlFAhU+gR4YwoemoMh+wawipWI3d7wG2bGnGAUxJRmz4VIJmbaJ?=
 =?us-ascii?Q?0e/MRoL7sdOMT5haX6J7zgFhe5pHBeHgpdICsBLaeZPOKeD+khCtTP411C+L?=
 =?us-ascii?Q?EQTvLmTmIsvrtOKzYWv2C8yXt8/okwzTHl4rYmwQAtWgpsZgEr7PFyON3CiA?=
 =?us-ascii?Q?Hka3Z9KoULekPdBP3nIzoJlES0l/MulKcxZ/2UPGl9yRGbZvq9W6Kaade6p3?=
 =?us-ascii?Q?iwwrjrzU3u8mlkug2hp0Xi1gYy6RVTrLRpbXoZxRjJrbjvqNr3+yqnxospPs?=
 =?us-ascii?Q?MrRZmr9QJQ/BkkB5FKKRVPWIlG026vx4Xvp0cgbAFVLaG6fjhwt9OyJj0bXE?=
 =?us-ascii?Q?Xc6Rz2s8GJlV8It2LnfPXRiZIAfnoWboewo5HHlizp8HhJc13SACLPbaRQVl?=
 =?us-ascii?Q?KVMYqgdNGdMx2qDeWScG93Oq3wOtUYt1SINUK3+fATGrNHnoFoqg27emrT9C?=
 =?us-ascii?Q?ds5OPBgDc2E3TO2wk+hK9tCK0B3P231TwO69qgaDrWpTLkrytlH3tOQNUA3U?=
 =?us-ascii?Q?EyCBIvUIhPPdEJhCROuErlMZozQ29sSBZf4SdEE7/XkmNnXyqCE/CRQWaY+P?=
 =?us-ascii?Q?yqN9FaK/ibu71DVxdvf3i8ezxgjGqVdL3kb8yEhOoUJUJnvSMTyoamBuEdgR?=
 =?us-ascii?Q?mwbyBtwR8BKUDocK7+ZdiT0ZaRg2eYL5heXgWKlur5Zfa9tuvQWop0jHx7ne?=
 =?us-ascii?Q?+oJ2PTeZsoBbG/78zIwUqisPZTkIIlOgVxnjK7WntqJBsf2KefdMAPT42Hr2?=
 =?us-ascii?Q?uDexZHNLpmOmo0No5g8ZSWUg5I7SQuGWh6IZ0yqY0iOJMlpzOSHdY+k/ANbO?=
 =?us-ascii?Q?LmiVVIgJGGF23tpAUGhd5DtEVJC2/RmrNXbObf8wUqqatr0gOFFMxFMwvRfz?=
 =?us-ascii?Q?1sV8QNhNv9NiORKPU/volmNCEgnPpjctmX3QiBRuZVnC5ouLvamde2tJpH6c?=
 =?us-ascii?Q?YFOorwlHILOzKgPSJ0ilzR1dGtfaCHc6mVqWJieNkCGd3Q1pM1QlMxPR5QQ+?=
 =?us-ascii?Q?2Kplo+Eg0kQKnl54VZaQrK38r9ntekFdV9ZX4LDqOYM2jBHA4g0VhmnN0nJA?=
 =?us-ascii?Q?XipMShRlK+HelAxN9wqHKcfdf9LljvMWM8VFZrsV164JLLhywC2oKITaoUNu?=
 =?us-ascii?Q?zO8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR02MB7898.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7210cab9-d442-4d57-b0c0-08d92f1ac156
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2021 09:57:00.6874 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zODzYS2PDGeE6dLfmqRW213OqLcGB9NvYp1LgV3PLgAea10J21cz7d9VkK0dywGZXy5U0YYmWo/kvy/xBOa/DaiBZtFX/cb2neo1WID9PJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6599
X-Proofpoint-GUID: JVfdItaYmrOA5GN5BI34p8vbkROfaNyg
X-Proofpoint-ORIG-GUID: JVfdItaYmrOA5GN5BI34p8vbkROfaNyg
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-14_04:2021-06-11,
 2021-06-14 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=thanos.makatos@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
> It's certainly the case that implementation-wise right now these are issu=
es, at
> least on the library side. I think I'm probably OK with requiring respons=
es to
> be provided prior to async messages like VM_INTERRUPT.

I think re-entrancy/deadblock issues are not spec-related but can be implem=
entation specific.
In your example, the client can't assume that simply because it sent a REGI=
ON_WRITE
message the only message the server will send will be the reply: it might a=
s well be
a VM_INTERRUPT or DMA_READ message.

