Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E0E41F69B
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 23:03:20 +0200 (CEST)
Received: from localhost ([::1]:56514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWPgd-0006wg-QN
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 17:03:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mWPdF-0005H0-MF
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 16:59:49 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:53934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mWPdC-0002E0-T2
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 16:59:49 -0400
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1917s5BI023544; 
 Fri, 1 Oct 2021 13:59:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=bg+zxtOb7cZ8J7IwIhRSagNFt0lLNPK0wIzQ3vkuZgo=;
 b=O8FJHqYttBjxcm3n3Hr0gMPHe5n0Z7By/i4r+5FxfL9TPl0AwL3iiDrVPZPBDfa/HHAK
 wIpvPprsV+eGyEuHZH7n7TxtivNQrS0ta/hAjXnP2jbECe1oyGQ7zZut1osbRCzjRTc2
 7KqqHKLV0k6YYMXJU6Uz8NMZBO0GR8clL6OPs9AfJh8qBEYoMSMcz8hsYe5QYE7Hy1i7
 yY3OfiIVhpwzUjzoDMARa1fOldTGtLuv1rftiQZKwtNpkScSZroyVdscBt+SD3BlFe/8
 dIzP7XEHaGE8rSQh8XQmdCq6cpnPB/vkdl4dg081IKanhWsnX+/NLby//vBgakHEf+Io cw== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
 by mx0a-002c1b01.pphosted.com with ESMTP id 3bdxbm94yx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Oct 2021 13:59:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QxQwzV3hwyObN6w/OAPJbGl1qSn1MNJW3i+6nrFq0la72wYlbfbbuX0yWGC5Wt00w0vmSMdKpXi8NijoLpt8G9aHyi1osMb8zIZWg4NCVOC2VWIKTnv+ROyf9dZiBUgg/4dVs8uGl9CRT+oSmWQLhHJ3f4m4q0CDJQIGK0Yl0suYV8VlnBqE1ljRTtWke18S9XjLx2WDiEjnlW4FRyFpiCfSXdRSci3jVe3PLU+UrSpufEXSiIbc6JNTg3k2P25cbCNvSxu6fAjkfICAUIB9iqrqMS19Z+jY00v5TkraQuWNWWoPf/+YijScqzA5QCydSAyouYCRWoTrQM8OApuuHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bg+zxtOb7cZ8J7IwIhRSagNFt0lLNPK0wIzQ3vkuZgo=;
 b=X8BrBCvS4x7ZwZCEqBR3W2aPjoP/2x/gaP3RrhdxoCfi26upkAFkQRCN+DL1mBrHHj+MGnN7VRzPW1OAUT6LE3CcNGh9IkaMmPZTjEi9leT7rXAiSH27kvuTqzrcTRj/zk0S0rS2GqwA1GnVp54yGyfUmPDgF1Z9UIwwDNAUkzmb9ZEOuLdwREYlxaSl2GGumH/fA7PKBqcYgDD3IJa36atMm98aL/h7hpBTMoxWYdTIlWbDTB+ZVQu36j0unc34kGtS8gEKR5RNnfwmg5s5CLHW5luXVrsJnoYLOD3OFRbfFXDI+/fqooyMfppLq6TyO5Xowz0/F9z0kJIxJ1JIDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BL3PR02MB8233.namprd02.prod.outlook.com (2603:10b6:208:340::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Fri, 1 Oct
 2021 20:59:38 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::4d56:1425:6a08:7ce4]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::4d56:1425:6a08:7ce4%5]) with mapi id 15.20.4566.019; Fri, 1 Oct 2021
 20:59:38 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v5] Prevent vhost-user-blk-test hang
Thread-Topic: [PATCH v5] Prevent vhost-user-blk-test hang
Thread-Index: AQHXs8N7V3zNlGYXNUuXU3U0hU/D0au5JYIAgALrHACAAEhngIABVKmA
Date: Fri, 1 Oct 2021 20:59:38 +0000
Message-ID: <20211001060725.GA6269@raphael-debian-dev>
References: <20210927171651.1433-1-raphael.norwitz@nutanix.com>
 <YVLYZCZ0NlhhrStG@stefanha-x1.localdomain>
 <20210930052900.GA15735@raphael-debian-dev>
 <YVWH2YUDLzaRxHYW@stefanha-x1.localdomain>
In-Reply-To: <YVWH2YUDLzaRxHYW@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80360aa1-8851-4908-5f20-08d9851e61dd
x-ms-traffictypediagnostic: BL3PR02MB8233:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL3PR02MB8233E10C903B222516CA2153EAAB9@BL3PR02MB8233.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3ERQCH9CR338rE9+BJd2WLEH8Qf2IIlLFuGOdEuMtdqoBFeCtPMUX1TtLgbXdD2GaHKlfpcGNTRc+ZL8P4NMqosYbAqqHXTOH2e78A+z2R5fXlY6zTTKabrm1UVR8u5xS9wgl1Is1uHsggW/mIpkPXzv4DCponHOhzI8zuulNuX47IT/WOsCEc2EZ5m1c5WnXtwdT+jlmMR4C2Cp6CwoEkoOpenttqv6ho0tvsIF6srasENN0cAIbSILx6Hd8rCH90VVySQgQp0JlNEQ8ZEpeDWGCH1juh+IitdhaHLWVtxiyhr0+b/eFZa9b8gL1ws89F8vJM/jprcWopbpB1a6CchNbFlbJDf3Xf/UgU05Qicz15WM+Ir1D/e0n9mpouWM94SJh/vQon64XQnZps6dFNDeDQCaDKUIGF3KOhLHcpqQskmmj3qVxMlTxmcoGWtabT1ElYopVGRzbfu/yu2efBPYjnr0iJ6m+DPXyZyxEM9dtLH80Jc/4CHX+pM0xWpQWdCWn8n5SDw1pR6dPBZl046B+vtw5wE6bbrpl2vuugGL0RIWOwEfAFOp4omfm8mjV6/3jSvPfbmta7Oxte/yOOrts/NJXgt3PZtj9t0KkqKeJzhiOKhZzGzYqy5ZfF4UynPGRmnKZy9adJKBqBPs7O2Ww5N2gtzYDZqJBU2ph8YxiEdiBzaUc3KgB09SEvyaEGO3uGUJX7b+pxEFjipjp/NrKGepBqxUn8dq8Ba7LGeqgN7xwnsaBokk852MoWjRGzly0AEpf/HUuU0pHECIzbXQfZCN/ypCjzONbWA/TDFzmM2aNgtAGSZd434fFQ2yVLW3DvbUP4dwd4W6ZMn/cQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(54906003)(6506007)(71200400001)(66446008)(5660300002)(44832011)(186003)(26005)(6486002)(4326008)(33656002)(33716001)(6916009)(66946007)(966005)(76116006)(8936002)(83380400001)(91956017)(2906002)(66476007)(9686003)(6512007)(38100700002)(122000001)(508600001)(38070700005)(86362001)(64756008)(66556008)(316002)(1076003)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?j07ygWg5DKYHBqFr5Rne9zIcPR8EeNx53ldsYZvgyVztQC5ZXkYDGkiTn6Ra?=
 =?us-ascii?Q?slLWVcb7oh8N77tz+0eXewx/+WCqq6RjPYCUno2FMhxl8kjPfxTqNKSpxa2K?=
 =?us-ascii?Q?LnTmEv+HsdCdA1xYrnJRrJoozY2fPuXxECPhfexjZ+Eg7xD31Qbnq6lF5D4a?=
 =?us-ascii?Q?gpgsPW8KANRJCTVYac+hyBmV+l8SA8GOPzRHzIcKtbnFBfSMWd++ELeKKEwf?=
 =?us-ascii?Q?AqV3GrxGhLC5qr4bikxCjzz2ffsq6rFw5CuS5FyK074Og/AXhbuhMRy/E0lB?=
 =?us-ascii?Q?hFZViN7DZt6k/ANzUzmC2Tqqeck2PVA6fXw5UmGPRe3RGGXb3tg/GwF+ZO7/?=
 =?us-ascii?Q?daBIAOYckIo6mp0VS2MHyqjTGqOhnCtr0BWKKywxuKKLHG2JZwzgoFf8nl4o?=
 =?us-ascii?Q?lLX1dVsMLOkR5UTXQeBOJJcmXRNn/8gcmT22GJhdgWUz6aJFe3kZIDkNX/IR?=
 =?us-ascii?Q?kaf7GaYM91jsCz9LEtl1837OHCFhxuGPq/7PfRy0V7Apci7+394SWMfsG+4p?=
 =?us-ascii?Q?BdNVT6DoMfxqVJG3MqmSF2YaRn05FfxF2JM5ozaVSMS5szrtwK/KZAOL0qcD?=
 =?us-ascii?Q?9YTyXVi64uHcVAi/SI5HU0bcyD3VVcUnq2lzwXm2x6wyrfgnI/XyjwoH7BgT?=
 =?us-ascii?Q?jZKI11avn59SW6W+zLtVWAMf1lLNsZWP82pmGMMGMSoZCnVIFKFAxMG7QC9V?=
 =?us-ascii?Q?3CnwCTzrEyhdDHtTPP+fU1W0Lo/3EJJ0Jx5qkqL/zhmT9ewtYkN/3QVsd8p7?=
 =?us-ascii?Q?huxyFiPXpwkyOcEJThqwxGXxG9iBu6u7/uMZ7Sb9tfvlZoj7T9MP6rIPSPEk?=
 =?us-ascii?Q?9MMqR77CuLLIuK9Wkx9KRvPR024/nltV8y3BFnyy2hfHXb8Q8HozwqF2hEA1?=
 =?us-ascii?Q?tlUZF+1o3oH7D/JNemj9PVOeCsBKWeYJOJSVna1+Wk6RnHZ93gXT3z98RDBU?=
 =?us-ascii?Q?x+ukMnUDUVs4/dTpT/1+IePfHXTX8C6tjG18fOZxXzwBQnRBd8GwZk3fmrD0?=
 =?us-ascii?Q?JD2bWxEDfeg27OxJD1w55UB7ZzEvkOdyJ0N+ntxxm7Z23c62OKYIO88JtruU?=
 =?us-ascii?Q?5W+1mnySYZ88S2IRqfAkAmr+hDGmTlakg8d4lb4zIqFsW5i4zCAe21IDt7XJ?=
 =?us-ascii?Q?G+01tYGOC6GbGoWbEwINSF5Cm5x86iOpIsC/GTQjSdVwFpmkSj3nRp7UOqcT?=
 =?us-ascii?Q?GWYXeZUC9j9Vj/8GQl47NY/+mcVw3tTiJnWY854Tb1rVsYL9IoafnmqYRuB+?=
 =?us-ascii?Q?IUBmoaNS7N4m0UXzXTo9Pl59P/0x8JTprHfWhx42l2ZUJpfdmq5CKLjwU3dA?=
 =?us-ascii?Q?kYeAil/vlKE9E3D4OcpZqJ6u5d4Qhnc65OjXqN8tjkhLIw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <02C4A7B6833BD04487438AEF6E1FA06F@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80360aa1-8851-4908-5f20-08d9851e61dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2021 20:59:38.6290 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gr5b0gZjZSSNppyHYowWddA/xNIW3KDqPHzYtIiCb5OXOREvgaWjfq0rIfPqN4vEsEzCTsamDSJeSDVdaa1YV3ApwCRjJezuEvWZx3UbxHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8233
X-Proofpoint-GUID: zSu45od8EpXE-00gBZixmF0ci_dWHAyq
X-Proofpoint-ORIG-GUID: zSu45od8EpXE-00gBZixmF0ci_dWHAyq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-01_05,2021-10-01_02,2020-04-07_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 30, 2021 at 10:48:09AM +0100, Stefan Hajnoczi wrote:
> On Thu, Sep 30, 2021 at 05:29:06AM +0000, Raphael Norwitz wrote:
> > On Tue, Sep 28, 2021 at 10:55:00AM +0200, Stefan Hajnoczi wrote:
> > > On Mon, Sep 27, 2021 at 05:17:01PM +0000, Raphael Norwitz wrote:
> > > > In the vhost-user-blk-test, as of now there is nothing stoping
> > > > vhost-user-blk in QEMU writing to the socket right after forking of=
f the
> > > > storage daemon before it has a chance to come up properly, leaving =
the
> > > > test hanging forever. This intermittently hanging test has caused Q=
EMU
> > > > automation failures reported multiple times on the mailing list [1]=
.
> > > >=20
> > > > This change makes the storage-daemon notify the vhost-user-blk-test
> > > > that it is fully initialized and ready to handle client connections=
 by
> > > > creating a pidfile on initialiation. This ensures that the storage-=
daemon
> > > > backend won't miss vhost-user messages and thereby resolves the han=
g.
> > > >=20
> > > > [1] https://lore.kernel.org/qemu-devel/CAFEAcA8kYpz9LiPNxnWJAPSjc=
=3Dnv532bEdyfynaBeMeohqBp3A@mail.gmail.com/
> > >=20
> >=20
> > Hey Stefan,
> >=20
> > > Hi Raphael,
> > > I would like to understand the issue that is being worked around in t=
he
> > > patch.
> > >=20
> > > QEMU should be okay with listen fd passing. The qemu-storage-daemon
> > > documentation even contains example code for this
> > > (docs/tools/qemu-storage-daemon.rst) and that may need to be updated =
if
> > > listen fd passing is fundamentally broken.
> > >=20
> >=20
> > The issue is that the "client" (in this case vhost-user-blk in QEMU) ca=
n
> > proceed to use the socket before the storage-daemon has a chance to
> > properly start up and monitor it. This is nothing unique to the
> > storage-daemon - I've seen races like this happen happend with differen=
t
> > vhost-user backends before.
> >=20
> > Yes - I do think the docs can be improved to explicitly state that the
> > storage-daemon must be allowed to properly initialize before any data i=
s
> > sent over the socket. Maybe we should even perscribe the use of the pid=
file
> > option?
> >=20
> > > Can you share more details about the problem?
> > >=20
> >=20
> > Did you see my analysis [1]?
> >=20
> > [1] https://lore.kernel.org/qemu-devel/20210827165253.GA14291@raphael-d=
ebian-dev/
> >=20
> > Basically QEMU sends VHOST_USER_GET_PROTOCOL_FEATURES across the vhost
> > socket and the storage daemon never receives it. Looking at the
> > QEMU state we see it is stuck waiting for a vhost-user response. Meanwh=
ile
> > the storage-daemon never receives any message to begin with. AFAICT
> > there is nothing stopping QEMU from running first and sending a message
> > before vhost-user-blk comes up, and from testing we can see that waitin=
g
> > for the storage-daemon to come up resolves the problem completely.
>=20
> The root cause has not been determined yet. QEMU should accept the
> incoming connection and then read the previously-sent
> VHOST_USER_GET_PROTOCOL_FEATURES message. There is no reason at the
> Sockets API level why the message should get lost, so there is probably
> a QEMU bug here.
>=20
> > > Does "writing to the socket" mean writing vhost-user protocol message=
s
> > > or does it mean connect(2)?
> > >=20
> >=20
> > Yes - it means writing vhost-user messages. We see a message sent from
> > QEMU to the backend.
> >=20
> > Note that in qtest_socket_server() (called from create_listen_socket())
> > we have already called listen() on the socket, so I would expect QEMU
> > calling connect(2) to succeed and proceed to successfully send messages
> > whether or not there is another listener. I even tried commenting out t=
he
> > execlp for the storage-daemon and I saw the same behavior from QEMU - i=
t
> > sends the message and hangs indefinitely.
>=20
> QEMU is correct in waiting for a vhost-user reply. The question is why
> qemu-storage-daemon's vhost-user-block export isn't processing the
> request and replying to it?
>=20
> > > Could the problem be that vhost-user-blk-test.c creates the listen fd=
s
> > > and does not close them? This means the host network stack doesn't
> > > consider the socket closed after QEMU terminates and therefore the te=
st
> > > process hangs after QEMU is gone? In that case vhost-user-blk-test ne=
eds
> > > to close the fds after spawning qemu-storage-daemon.
> > >=20
> >=20
> > When the test hangs both QEMU and storage-daemon are still up and
> > connected to the socket and waiting for messages from each other. I don=
't
> > see how we would close the FD in this state or how it would help.
>=20
> Yes, I see. In that case the theory about fds doesn't apply.
>=20
> > We may want to think about implementing some kind of timeoout for initi=
al
> > vhost-user messages so that we fail instead of hang in cases like these=
,
> > as I proposed in [1]. What do you think?
>=20
> Let's hold off on workarounds until the root cause has been found.
>=20
> Do you have time to debug why vu_accept() and vu_message_read() don't
> see the pending VHOST_USER_GET_PROTOCOL_FEATURES message?

Sure I'll spend some more time looking into it.

>=20
> Thanks,
> Stefan


