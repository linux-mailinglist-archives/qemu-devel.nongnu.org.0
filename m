Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F71C41D2B4
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 07:30:57 +0200 (CEST)
Received: from localhost ([::1]:43262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVoek-0005eN-OO
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 01:30:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mVodB-0004yQ-G2
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 01:29:17 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:56300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mVod8-0007cL-Al
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 01:29:17 -0400
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18TNdqZR012023; 
 Wed, 29 Sep 2021 22:29:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=oYqClua7St3W/2lVempfj5D2LR9iooWt8FOLm3K+2IY=;
 b=tKZzKfMPYYHglRH50HnW7192r5fP78lkJHng2h8NgUtcK6lVJMw5++nWDpci0z52SlIs
 ZGivwqCgbyqymxRHpb1iGeoKWBx/Flmso+8S91x8n5q+M/JqapEdXFqxl2eJuq0XDASo
 9yI/MpYq+G1W4anLNCcS6Ef1SYfSZLkAu9/Om4i/DVh13vThqC8yJxrSJn2iUUquu5UE
 M0tYAEnSkovLLyyNU5EqF4EFrZfkbgqV86hg4Usq1O2ipItn8wY4psdF9kKJtz/kDP12
 lZbUVp72K24ETXLHbgvtjKNpA08bgXvGaUtiHotRDA2vzlPK09VM4FnhAEA+6lnqdCCh ng== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by mx0b-002c1b01.pphosted.com with ESMTP id 3bcm27j9yh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Sep 2021 22:29:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BoWM1w0qk+E9ujblUKlpBCTgIb2nhV96A3QvFLd3IlOs3GLOL08BoRpIaVE/Yboq3tiUM6oUENnUyLQhJhCnro5pzM/Qul+V57p26rwpwtewerW0nnztErSEKTzAsmLMrdbjxGVAC1N/GwXX/jFfB1Qd1dDEtudZ8QJ3KPodotuCp//8i2Rbszb9yEL4TJfR6tkrxjhM02Tx1D5G0A4qL24qEBnYA5PS1JXaXrSl/iqKlk6MDo/InATDAAgHkbMS//C6sriZJtINxBOneze2Ch2QMpUPv94W3t5W5XJdnnB6TjQpy2QxalA2UnYio2uxuVWi4pC89Y8tfi56fFbPkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=oYqClua7St3W/2lVempfj5D2LR9iooWt8FOLm3K+2IY=;
 b=R7f1Qkxpfvdp5AAlqVHPzAa0sgEm4s+JBpzMCkvU+O4KWSXJKEOJRgoTfyt5Y1Uow0W6jCSZ3luSG3UaNjkOCQzzY/hww+RAJRdv7I0Sr5CgD+Q4a/RTj/c/tgKqzebyw2+Dyjl9rs5lV3kvJa1TZs+p7K73u3KReGp7UfS4uFhXogk2W0ZZbZwy/xaiqQjcJW9UmOW1gdQBVJWRi5AM3Ruk78vnJfxQ6jfH4Yur5mhTfhU+7YoptymBabjrA/U2lyIlWRpHgw6tjZtdDVkkF1ZRvv/I7Lm+J79izdJjQsCBXb40/gQgXC3uNIQYkeMTu4lyBjb0/b8XYkpPkz9YqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BL0PR02MB4563.namprd02.prod.outlook.com (2603:10b6:208:4b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Thu, 30 Sep
 2021 05:29:06 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::4d56:1425:6a08:7ce4]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::4d56:1425:6a08:7ce4%5]) with mapi id 15.20.4566.015; Thu, 30 Sep 2021
 05:29:06 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v5] Prevent vhost-user-blk-test hang
Thread-Topic: [PATCH v5] Prevent vhost-user-blk-test hang
Thread-Index: AQHXs8N7V3zNlGYXNUuXU3U0hU/D0au5JYIAgALrHAA=
Date: Thu, 30 Sep 2021 05:29:06 +0000
Message-ID: <20210930052900.GA15735@raphael-debian-dev>
References: <20210927171651.1433-1-raphael.norwitz@nutanix.com>
 <YVLYZCZ0NlhhrStG@stefanha-x1.localdomain>
In-Reply-To: <YVLYZCZ0NlhhrStG@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3caea474-513f-4320-24e1-08d983d338fe
x-ms-traffictypediagnostic: BL0PR02MB4563:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR02MB4563A71253CC8475C147BAA8EAAA9@BL0PR02MB4563.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:820;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wx07+A9y+5QvKV7oUPRD3xwjTBNxdpJ+EJo/rQGvJjtvzeibj86Vi3+ahwB8eEeiavx6K2PsEZ9QXvCWYk2Bu7gpe2MLqiYdS7cNqpZYLVx32+iAmNNb5LXue4UqQbbqUuvEn/4W6qNosOsGycclmp3d0Fdd9CeJInPyBE2vSRR0zh4e8FEskqWNQWsfrYo7y+nc6GHx5N9cA3ngXAefhr6/6AmSv4z+EXen7o8pw8gCYyC/ZKKahjM2HG/e8FqYfeETmHhWrYQrMmMSGDzzZ7gTbDbaJGy/yH4mJ5GoPEBMaoL/lbIPTIUifSfknjhh2SFvUV8wwqyTxQ8sGuOVHSQfgbGf4o3e3CO8p6is9FDVCuW+iU73rwGi8DhVyFPVckh9Ud0m4mGTCEpS/29PoKbLbtdmoGzwctryz06l8ICrsOiNE0tclVeOIVY9b+ZtA3mN8nLo5SHTzOkFQXMQj14MFWQPJVbDbkHgp0mIS3gVmjX1aK7fDMyQ/lob+e2RiyGnvE0guLVWdBqTUEPlptqEG4Rm/Kqq+kT/RE5/hUCYqUpJ41b/0NgmOAkMliRNq+vQkq0igLRf2vi9pxtjOw8OtET3+CTNp5Q5wgu9Jp8+8jircTWvc77sEFi2Pb554iDjn7ndG+bD5egO+SdaTGtPk+prika7JeOjsILlPwIV7Jzu2k0DB4GulecxTHOkuImwZwsI+sf5pbIsHk0bmueDZk5WSFR35Gjjro+C3cuoRMEp0tIf/Bhjfhrtd7xxH051IECoq1c76N692yFJk2gMJ4lNYWH0ueV1Sj7s6tGLaP8LMLVFLg4pPUqrvcQV7bd96g2ae5QiVvOmmcDdKA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(91956017)(44832011)(66946007)(6916009)(76116006)(38100700002)(6486002)(86362001)(83380400001)(5660300002)(122000001)(9686003)(6512007)(54906003)(66476007)(33716001)(66446008)(64756008)(66556008)(316002)(2906002)(71200400001)(33656002)(38070700005)(186003)(26005)(8936002)(4326008)(6506007)(966005)(508600001)(1076003)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?I6aQWuWme04maWOzmUeAyG2VLepUnUviNvRhA6r2HOJv6hZ2EgIXozCQ1gFp?=
 =?us-ascii?Q?MhRSoMXs7r2JBuTvoqA9mIvTQwZR9TvNPPDZhWz1ABuJAuMGZ5rxuc5LV58Q?=
 =?us-ascii?Q?W5pCwIIezMHXmQPLf0G961KAwcoyRPonIRl2OaF9vld0Eyk7A0vOa+sE5j1n?=
 =?us-ascii?Q?SNMQ23HwFjkje5Vr74WKlPU+rxVSFL6Tdwjw+RU0SkVVSt86CR/Sqnawb9AS?=
 =?us-ascii?Q?Coow9D9vpbxqhqMsmSoBB7okk+TQ/aN4tp91ysHezQAUXTGrlNQefLfgAH9n?=
 =?us-ascii?Q?ezr5CMNZRKTM9Uv6+29r/S1zXnk20kqtKEgG8jB4qWn7GV0ac16HMU5vVKl2?=
 =?us-ascii?Q?uk6Hwul7ZYoHeR5BV3Z89BqRu7N05C/nU4Z0wbDoA0eRRnf9D6EsoDQJV7YP?=
 =?us-ascii?Q?dlvyr2ybUkRQI1STu7oZEnd19aCnpq4tUzk70AAiMBNCx76uqd3+OWSsXhkG?=
 =?us-ascii?Q?94gFQgrzcL3nfq72Cv0dhgH5wG16nPlWDG+3mRbRKoqH4D7qlcclhy31MOp0?=
 =?us-ascii?Q?+nqrhU3ssO/aY9R+uAhiIcsBHp0Qi3+X/Mjldg1XlmmUPDiqjjg5INU+Oxxe?=
 =?us-ascii?Q?9t+EB2hs9FBHrQB4wJNhS3YjRhkV6e9l5smBWiYRTa69LWwVft06N+ZmlVGO?=
 =?us-ascii?Q?VKahCSmJUe6KgQw08b2+U2bReupZ7oEX55fiCM/jBLFx7SEc5ocT4jNzUrdH?=
 =?us-ascii?Q?/Okk+YPp7S9H1Y+D7i5nIRY2/Zot0IdReXHK6kJa4W/M14c4VvagmhCg8poi?=
 =?us-ascii?Q?B5eaZRXp1LPFh7TNYoM5pxU9Suw7mG/9ItwQ7l7lq54IXV5WOelTc99lb69w?=
 =?us-ascii?Q?l2xlmpNF1OJltFokiZiufGt39LK0mtjjmj5iAHGbuy4RHP9+Xye5QHcju8ur?=
 =?us-ascii?Q?XGrXvN0TrV2CFwEC2+IyhRLoSLjrxOTVZkLuBuQGx8iPyVuoBbKSZf5h0A3E?=
 =?us-ascii?Q?gIKpc6deJKMEg47dQIH17wdW+no1OXYprzcLkvTnhrw2RlMMPhjBLhxwBwua?=
 =?us-ascii?Q?0uiknHqs9F31wJuiZpwB9Iqkq+kWIq/A/AK2QzK+tX5BtONazOPx8J7hN/4V?=
 =?us-ascii?Q?EvWCXDYrKnLjhSvke2aUu8dHdE4LiYOXKM20ucJNWUyHODrdMW1SDdwdrYl9?=
 =?us-ascii?Q?AeSievNEu1qm0xmyX7vmKFKWnPcSAFfakBlA2lbQqGR93igTDYMeScxRP9j0?=
 =?us-ascii?Q?oNJ26doQQQgIt9gd9nI9QW/hze5ePX24jrQvbrMMxSDcl8deS+lqHpZBQ2MZ?=
 =?us-ascii?Q?PS3AkFLiw6ZfofuVMiKlkXRbezsxjv4Fc6yVfqXQSnQSamlqHNriYD4ZuzDr?=
 =?us-ascii?Q?ug8EOLryqnR/OoXXlRzMmC52GURMwIS8rZGRqe+Y7VM0Yg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6BC5C13BCFC6714D84D91A497B87357A@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3caea474-513f-4320-24e1-08d983d338fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2021 05:29:06.6118 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mc2EQ6PHibKdhJKBDtAtMT2EZA8K3MX+NK36PZHp9WtQVlk19KzSe4O2QPgyQmw2YS74TNd0KQgWP/yjBmIA2oUaC8tXohF4KInpyh3vBU4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4563
X-Proofpoint-GUID: LuVX1XJh6oBYR8bpCnVvOCbEbOdzlXHg
X-Proofpoint-ORIG-GUID: LuVX1XJh6oBYR8bpCnVvOCbEbOdzlXHg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-30_01,2021-09-29_01,2020-04-07_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Tue, Sep 28, 2021 at 10:55:00AM +0200, Stefan Hajnoczi wrote:
> On Mon, Sep 27, 2021 at 05:17:01PM +0000, Raphael Norwitz wrote:
> > In the vhost-user-blk-test, as of now there is nothing stoping
> > vhost-user-blk in QEMU writing to the socket right after forking off th=
e
> > storage daemon before it has a chance to come up properly, leaving the
> > test hanging forever. This intermittently hanging test has caused QEMU
> > automation failures reported multiple times on the mailing list [1].
> >=20
> > This change makes the storage-daemon notify the vhost-user-blk-test
> > that it is fully initialized and ready to handle client connections by
> > creating a pidfile on initialiation. This ensures that the storage-daem=
on
> > backend won't miss vhost-user messages and thereby resolves the hang.
> >=20
> > [1] https://lore.kernel.org/qemu-devel/CAFEAcA8kYpz9LiPNxnWJAPSjc=3Dnv5=
32bEdyfynaBeMeohqBp3A@mail.gmail.com/
>=20

Hey Stefan,

> Hi Raphael,
> I would like to understand the issue that is being worked around in the
> patch.
>=20
> QEMU should be okay with listen fd passing. The qemu-storage-daemon
> documentation even contains example code for this
> (docs/tools/qemu-storage-daemon.rst) and that may need to be updated if
> listen fd passing is fundamentally broken.
>=20

The issue is that the "client" (in this case vhost-user-blk in QEMU) can
proceed to use the socket before the storage-daemon has a chance to
properly start up and monitor it. This is nothing unique to the
storage-daemon - I've seen races like this happen happend with different
vhost-user backends before.

Yes - I do think the docs can be improved to explicitly state that the
storage-daemon must be allowed to properly initialize before any data is
sent over the socket. Maybe we should even perscribe the use of the pidfile
option?

> Can you share more details about the problem?
>=20

Did you see my analysis [1]?

[1] https://lore.kernel.org/qemu-devel/20210827165253.GA14291@raphael-debia=
n-dev/

Basically QEMU sends VHOST_USER_GET_PROTOCOL_FEATURES across the vhost
socket and the storage daemon never receives it. Looking at the
QEMU state we see it is stuck waiting for a vhost-user response. Meanwhile
the storage-daemon never receives any message to begin with. AFAICT
there is nothing stopping QEMU from running first and sending a message
before vhost-user-blk comes up, and from testing we can see that waiting
for the storage-daemon to come up resolves the problem completely.

> Does "writing to the socket" mean writing vhost-user protocol messages
> or does it mean connect(2)?
>=20

Yes - it means writing vhost-user messages. We see a message sent from
QEMU to the backend.

Note that in qtest_socket_server() (called from create_listen_socket())
we have already called listen() on the socket, so I would expect QEMU
calling connect(2) to succeed and proceed to successfully send messages
whether or not there is another listener. I even tried commenting out the
execlp for the storage-daemon and I saw the same behavior from QEMU - it
sends the message and hangs indefinitely.

> Could the problem be that vhost-user-blk-test.c creates the listen fds
> and does not close them? This means the host network stack doesn't
> consider the socket closed after QEMU terminates and therefore the test
> process hangs after QEMU is gone? In that case vhost-user-blk-test needs
> to close the fds after spawning qemu-storage-daemon.
>=20

When the test hangs both QEMU and storage-daemon are still up and
connected to the socket and waiting for messages from each other. I don't
see how we would close the FD in this state or how it would help.

We may want to think about implementing some kind of timeoout for initial
vhost-user messages so that we fail instead of hang in cases like these,
as I proposed in [1]. What do you think?

> Stefan
>=20
> >=20
> > Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> > Reviewed-by: Eric Blake <eblake@redhat.com>
> > ---
> >  tests/qtest/vhost-user-blk-test.c | 26 +++++++++++++++++++++++++-
> >  1 file changed, 25 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user=
-blk-test.c
> > index 6f108a1b62..5fed262da1 100644
> > --- a/tests/qtest/vhost-user-blk-test.c
> > +++ b/tests/qtest/vhost-user-blk-test.c
> > @@ -24,6 +24,7 @@
> >  #define TEST_IMAGE_SIZE         (64 * 1024 * 1024)
> >  #define QVIRTIO_BLK_TIMEOUT_US  (30 * 1000 * 1000)
> >  #define PCI_SLOT_HP             0x06
> > +#define PIDFILE_RETRIES         5
> > =20
> >  typedef struct {
> >      pid_t pid;
> > @@ -885,7 +886,8 @@ static void start_vhost_user_blk(GString *cmd_line,=
 int vus_instances,
> >                                   int num_queues)
> >  {
> >      const char *vhost_user_blk_bin =3D qtest_qemu_storage_daemon_binar=
y();
> > -    int i;
> > +    int i, retries;
> > +    char *daemon_pidfile_path;
> >      gchar *img_path;
> >      GString *storage_daemon_command =3D g_string_new(NULL);
> >      QemuStorageDaemonState *qsd;
> > @@ -898,6 +900,8 @@ static void start_vhost_user_blk(GString *cmd_line,=
 int vus_instances,
> >              " -object memory-backend-memfd,id=3Dmem,size=3D256M,share=
=3Don "
> >              " -M memory-backend=3Dmem -m 256M ");
> > =20
> > +    daemon_pidfile_path =3D g_strdup_printf("/tmp/daemon-%d", getpid()=
);
> > +
> >      for (i =3D 0; i < vus_instances; i++) {
> >          int fd;
> >          char *sock_path =3D create_listen_socket(&fd);
> > @@ -914,6 +918,9 @@ static void start_vhost_user_blk(GString *cmd_line,=
 int vus_instances,
> >                                 i + 1, sock_path);
> >      }
> > =20
> > +    g_string_append_printf(storage_daemon_command, "--pidfile %s ",
> > +                           daemon_pidfile_path);
> > +
> >      g_test_message("starting vhost-user backend: %s",
> >                     storage_daemon_command->str);
> >      pid_t pid =3D fork();
> > @@ -930,7 +937,24 @@ static void start_vhost_user_blk(GString *cmd_line=
, int vus_instances,
> >          execlp("/bin/sh", "sh", "-c", storage_daemon_command->str, NUL=
L);
> >          exit(1);
> >      }
> > +
> > +    /*
> > +     * Ensure the storage-daemon has come up properly before allowing =
the
> > +     * test to proceed.
> > +     */
> > +    retries =3D 0;
> > +    while (access(daemon_pidfile_path, F_OK) !=3D 0) {
> > +        g_assert_cmpint(retries, <, PIDFILE_RETRIES);
> > +
> > +        retries++;
> > +        g_usleep(1000);
> > +    }
> > +
> >      g_string_free(storage_daemon_command, true);
> > +    if (access(daemon_pidfile_path, F_OK) =3D=3D 0) {
> > +        unlink(daemon_pidfile_path);
> > +    }
> > +    g_free(daemon_pidfile_path);
> > =20
> >      qsd =3D g_new(QemuStorageDaemonState, 1);
> >      qsd->pid =3D pid;
> > --=20
> > 2.20.1
> >=20


