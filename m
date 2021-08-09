Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE143E4A1C
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 18:39:55 +0200 (CEST)
Received: from localhost ([::1]:52238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD8Je-0007HV-7G
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 12:39:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samarths@cadence.com>)
 id 1mD8Ia-0006ZM-Sn
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 12:38:48 -0400
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235]:54968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samarths@cadence.com>)
 id 1mD8IX-0005oX-TC
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 12:38:48 -0400
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 179GQera018601
 for <qemu-devel@nongnu.org>; Mon, 9 Aug 2021 09:38:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : subject
 : date : message-id : content-type : mime-version; s=proofpoint;
 bh=OAMTo+YeOf9KLJ3eQXf9GWGkqPNWZqfeou3vtKLJ6dc=;
 b=pL1FRrznGqgZGjfMjv16TbQCVFsF4OLdKY2uAbt/RrJ1MgYmX7/d4/AKghTA4lhoZZeg
 St6QKS3cB47hLW41Z0Y+gGhIyQjtW2mSu4px3Cw6XhAsae3rN2QfErq76ANkWurLePmm
 WWTQZgSJXKJAzYEtEQX05csdjgs79/eadbzEvWMtU95LbYpkxtfbV+EKoLG8NUv96u6f
 LHLsr5qCYhKxdBhyEqYUCsRQaB0AZv9B3WGvH0LDElALskR9eN16um2U1Idv0FLyyoBM
 VoALr34Uxn4h3zWw2iWKrzv/gUCbtaUCvoLNmXO+mP6LhpEwYYPqUNfxM4dtiyWj28Pn tw== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2049.outbound.protection.outlook.com [104.47.56.49])
 by mx0a-0014ca01.pphosted.com with ESMTP id 3aau8125gc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 09:38:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y7EJapQpuUIchPJZLw+8xbwgvta1OsF/08tJM7gEQyUMXvpoB5YS6Y0gRjfGrjU5ZEZ+P47aCfKfTxcMQYRvFZviMzXaqSzWiWN26kGyzH/lSEQDhGOamR/GtjEoo3dPVBcBEQv3LXWVN59Va+TNrM8pqKGzO2hophZ3taGL4UDJhLAHMvXmuEY9BHMJ60MOPqReYzVUyztz92QWcccwd3LId5L0fI4EGWac69VXge8QCWngVWUNQBBD5IR3cDe+VoZxqNiiQyWYOOiJ6SBsfR0VGzfTJQdwPEfoE/G6rhqsHQQiVhUT/+Poiro83YK1lBwCAjz//9NaAJKj+sGfEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OAMTo+YeOf9KLJ3eQXf9GWGkqPNWZqfeou3vtKLJ6dc=;
 b=j2OhMh+X+gHebpPuaTGVUd1olK1uNj8h0L3pkEJ2Jb4NEfRfnL6aN1wO8st7mn/5wrQ0Ld6QkL20R+PRM5UMkP1ujVeG6AXWVYUb/RD6QbGuacYGb0w5mkPskbfmqwSQrgspvG364cWutTujWFtk/ufhDfCqlQ4RTXziyoLJHH++CjppFXvx6zXRnTcHokhHnCNRvxfvuq8jAfCYvWa+jz8ivZfyLR2+YPohKrj25m3xRJO+boaLwr1jecQ2s3K9l30F2NOEFJPqNTjYbf1W6yBc7tKYI615xx6argY/+Ogwuc5sIY2VmPTEIFp64sZP9JJYLoHFzRVx/bnhrxCCqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OAMTo+YeOf9KLJ3eQXf9GWGkqPNWZqfeou3vtKLJ6dc=;
 b=Da0fDsKbv5UnS6T2t82lQ8OHcp4sqNT0jniFFv71XgRouw3mRl4EftyME0ah5u7HY+vME48FQSPxrIdQm9Kj+jYeUY/+REllHY/WrVYO3GaU+4U6DAOwbrNJ8cC3jo7mm+omXjid6xOpiaf/8K/fNBTzuMdbmp47asvBDoJk4U4=
Received: from DM6PR07MB8143.namprd07.prod.outlook.com (2603:10b6:5:20c::12)
 by DM6PR07MB5433.namprd07.prod.outlook.com (2603:10b6:5:20::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.22; Mon, 9 Aug
 2021 16:38:38 +0000
Received: from DM6PR07MB8143.namprd07.prod.outlook.com
 ([fe80::4933:4d0c:f4a7:795f]) by DM6PR07MB8143.namprd07.prod.outlook.com
 ([fe80::4933:4d0c:f4a7:795f%7]) with mapi id 15.20.4394.023; Mon, 9 Aug 2021
 16:38:38 +0000
From: Samarth Saxena <samarths@cadence.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: [CXL volatile MEM] - Qemu command to turn on HMAT and NUMA fails with
 assertion
Thread-Topic: [CXL volatile MEM] - Qemu command to turn on HMAT and NUMA fails
 with assertion
Thread-Index: AdeNPFRJO7zN36qiQYqno1sR/jgqBQ==
Date: Mon, 9 Aug 2021 16:38:38 +0000
Message-ID: <DM6PR07MB8143073FA28EA05BAF7D8B24DDF69@DM6PR07MB8143.namprd07.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5Lmh0bWwiIHA9ImM6XHVzZXJzXHNhbWFydGhzXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctM2RkYTU1NzktZjkzMC0xMWViLTg1YjYtZTRiOTdhMDFmMmI2XGFtZS10ZXN0XDNkZGE1NTdhLWY5MzAtMTFlYi04NWI2LWU0Yjk3YTAxZjJiNmJvZHkuaHRtbCIgc3o9IjU3MDMiIHQ9IjEzMjczMDAwNzE2Njk5OTI3NyIgaD0iTFdYVkhaVXlhdXkzb3Jqa00veERNOU8vLzdjPSIgaWQ9IiIgYmw9IjAiIGJvPSIxIi8+PC9tZXRhPg==
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=cadence.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c6d4d7c4-0d17-4c81-dbe9-08d95b54240a
x-ms-traffictypediagnostic: DM6PR07MB5433:
x-microsoft-antispam-prvs: <DM6PR07MB543335B724D59D6BDBCF6BF5DDF69@DM6PR07MB5433.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v+FWlagOjLuyQEZWLznyaGCX7CMiG6SYueymfGYx4nXlpz60RCph6VxlS/40gPtezlDNjymI0Z67aOVBX8WnYKljiPr4DesjEfcxpUMvIv//yp4VxTyB+wbju3PrV8yw85EwEyzqurpUuidLx5PybkXnocovAiFC5amyv8UIhv3/tQuJDtxpZJL/gmHYmeIXMdIKCUCA+AGfk3OWGIEsjBlY/Hki91WyE7djNGobVX3G5oKoZn3EXjQCpEamouLTbfM2NSaXz8vohqtgxuOxK+yvzUR4Apu40RT2/SgcwDaZR6Mnmsqo4lihlUjdmTQ3eo1pwz8+UpsjYXe974CVqS2GRlUTmBsVT0d+97wcIskQko4ayRWehKk+bUTJA7c5icR1n2iibkP5HFUOy/EbkhV5wBhI5TCtsnhq4nwT9HGvD3+28Y7q4asDIw0TtGLz65Gd/lUvTzFADIyixfiJeGYzHJCsE/si5/2zTjuFpb2O6DzZT+Z+hR3UrHn5hqcFv7gx54EaIAEz1+w97T0jo+W0aU981+zZ4KkbxNKMEvv5P7U1MA5I7Am/1vSHFKH9xGJxcsbkB4FQxbvkieYbxbHlyEaGTTWLeQFkP2YvPmvLxxUUGQ+EiP1XafrwGsIyxbOImzznzCq2GhbqLQXmqYvrRnzZPJ3ooNcDPalXYLFKK/bmj2OAheFhmk2hV+DriHA7BAvJ6Q5Iq8ktOwIMh+LpktOWqUFvsF/SdJBSJ19vYdTeH0H7N6O54iwDfuSvwqHnNF1w27zZBrMdJFqcK4LpKXYLVRLWn9RBRzy1xLxwS1E5ehJAwFB9Fb9gAvCimxVW9JxmA5ZcedHVBq66sxkOm5XiLrSjVB/QOEV+IYY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR07MB8143.namprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(366004)(39860400002)(346002)(36092001)(186003)(21615005)(6506007)(26005)(38070700005)(86362001)(7696005)(9326002)(55016002)(122000001)(52536014)(8936002)(166002)(2906002)(6916009)(66476007)(66946007)(71200400001)(38100700002)(64756008)(76116006)(66556008)(5660300002)(8676002)(66446008)(33656002)(9686003)(478600001)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qsdBv4iZvLsSGSEdJEpzH3S15WH4qcHz6oXRL1+3SEezrvfUvyLFJDHfFMp9?=
 =?us-ascii?Q?JBcf34gtzgKlMF39JaV1dQh2lsEcw/Qmk6zcx4zwFpXCvaHk9oC5emuee9Pe?=
 =?us-ascii?Q?jNdqJ2OA8oPE1uzZv2scD6k6T8H56pDUcH6SNIT8sVj2Cu+JloK5L2fxTh38?=
 =?us-ascii?Q?0xTf/ib/OQiRvtjpF6aG8wbJQdbsu+Vtd1+peacKOfaWd6v5NcY+2wJHJ0SF?=
 =?us-ascii?Q?KMgEdptGTtAOKV9E7uUYs96NWekFCxcE/ujHBnMLsztZ4PKgQnVIusoAwZFS?=
 =?us-ascii?Q?xH4UQB9iKBAm7l/sOgeyA8GjcCJzctpVT2MmEwBpq9pHndOx16TjYftf6nV/?=
 =?us-ascii?Q?0RYgDyjJZ9Ke2JLRlh5j4rsoOa/CwK8XUNGZuTcWpmUQHnCw9yg1a26Qsb39?=
 =?us-ascii?Q?M3mRLwlmIMywq+VkCuddvtbHppW7TlhXt+yKwm4skcRp5FfVA4kA0hhO12yw?=
 =?us-ascii?Q?YUQ7CcLcRqc3Z0odvyCBXvrNFKceeOrGjPaAh0mW2Fbqm8g8nb9DX6cH3Kj4?=
 =?us-ascii?Q?jArr3QsvAcDx1GqGMXaVuQnmwvqYclVA+MJHz7i4cX892nh7cPSI3a73bWDg?=
 =?us-ascii?Q?MF3cVgDjQ5XiiITZrn1z+gcP2gSsrcgUUEHx2WpQAlD2/mubloAj7QBqzen6?=
 =?us-ascii?Q?+mBCj8QIHXqSW/t9Afm6qnNFyzH2phYCI3TdonQ4iTyFtePES4Z79Tmwm1Jx?=
 =?us-ascii?Q?eZZE22tCIZjNItid2rHrWYKLppquC4RUBuOvT3l/uaiuSFqVp6nnPxFSZzkB?=
 =?us-ascii?Q?S1O+zX4HhSzMl8jxvzjm/RnQsv+SRO0kSatoa4QOBGpqGvktvg9S5kDiAkpv?=
 =?us-ascii?Q?+5meNkkOKPSJEm52s4SdCx+3nX2b1sjHx3lkdVUHWAAdiFgFt07A7lzLW49S?=
 =?us-ascii?Q?3vgS0ZtKSFAvsIRTW/UvHXEPN6Zjtt6hHE8BW+3m7JWfYls+GQQ9X6CTrWwg?=
 =?us-ascii?Q?aJKw5+caESdPwH9seeCf+/0VJeUVr6OhVQ1dgQd8/6o9JILZvgS1FkyHLrsb?=
 =?us-ascii?Q?oqco41Ue+5Zzwn76eG0yYXZ5bA9LBZlJ2Y7X75OHxvxFkdCh0tIPpv/ll18G?=
 =?us-ascii?Q?WSe+5JJiWffVtV+rHCdcwKrXslg/NJFtc++7BzW6CBDjFhaHsqoANyLRyaY3?=
 =?us-ascii?Q?IJIkkyfRI1Y/jvHWcFAdOYP4KzKDe7mIXg3lmR4ZiHZeISKCEpB4NW8rcb3O?=
 =?us-ascii?Q?xl/l+Tznsmbsd0oW1yHAA8AlOnNyxf2elYo+gkEYC7VRUvjwaMieKTfRUUEX?=
 =?us-ascii?Q?QfCEOQvdZd9tpZwzivbHAITkj+27uW/kbTPrCcim9b488+MJcXKHmGSDt0TY?=
 =?us-ascii?Q?CHO44R0LE+Fqhjme+9YbaouP?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_DM6PR07MB8143073FA28EA05BAF7D8B24DDF69DM6PR07MB8143namp_"
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR07MB8143.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d4d7c4-0d17-4c81-dbe9-08d95b54240a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2021 16:38:38.9010 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cVAB2JuuvhQgtKWzSTUzIqWplKR7RZy8WPjhVQhV9ju+WTm2PK7kiHF+Pi8lFgy9dvd6hHQXOzwTBMfbD6Vk5j+nMIGUNU54fb0oiLVrg8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB5433
X-Proofpoint-ORIG-GUID: BNqFM5t6UacwyG9HJfPFCLGpxDhswpP9
X-Proofpoint-GUID: BNqFM5t6UacwyG9HJfPFCLGpxDhswpP9
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-09_06:2021-08-06,
 2021-08-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108090119
Received-SPF: pass client-ip=208.84.65.235; envelope-from=samarths@cadence.com;
 helo=mx0a-0014ca01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_REMOTE_IMAGE=0.01 autolearn=ham autolearn_force=no
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

--_000_DM6PR07MB8143073FA28EA05BAF7D8B24DDF69DM6PR07MB8143namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

I am trying the following command to run Qemu with Kernel 5.14.

qemu-system-x86_64 -M q35,accel=3Dkvm,nvdimm=3Don,cxl=3Don,hmat=3Don -m 844=
8M,slots=3D2,maxmem=3D16G -smp 8,sockets=3D2,cores=3D2,threads=3D2 -hda /la=
n/dscratch/singhabh/shradha/ubuntu-20.10-64_with_orig_driver_backup.qcow2 -=
enable-kvm -usbdevice tablet -L $VB_ROOT/etc/vm/common/ -object memory-back=
end-ram,id=3Dcxl-ram,share=3Don,size=3D256M -device "pxb-cxl,id=3Dcxl.0,bus=
=3Dpcie.0,bus_nr=3D52,uid=3D0,len-window-base=3D1,window-base[0]=3D0x4c0000=
000,memdev[0]=3Dcxl-ram" -device cxl-rp,id=3Drp0,bus=3Dcxl.0,addr=3D0.0,cha=
ssis=3D0,slot=3D0 -device cxl-type3,bus=3Drp0,memdev=3Dcxl-ram,id=3Dcxl-vme=
m0,size=3D256M -numa node,nodeid=3D0,memdev=3Dcxl-ram -object memory-backen=
d-ram,id=3Dother-ram,size=3D8G,prealloc=3Dn,share=3Doff -numa node,nodeid=
=3D1,memdev=3Dother-ram,initiator=3D0 -numa cpu,node-id=3D0,socket-id=3D0 -=
numa cpu,node-id=3D0,socket-id=3D1

I get the following crash before the machine starts to boot.

qemu-system-x86_64: ../softmmu/memory.c:2443: memory_region_add_subregion_c=
ommon: Assertion `!subregion->container' failed.


Please help me find what's wrong here.

Regards,
[CadenceLogoRed185Regcopy1583174817new51584636989.png]<https://www.cadence.=
com/en_US/home.html>
Samarth Saxena
Sr Principal Software Engineer
T: +911204308300
[UIcorrectsize1583179003.png]<https://www.cadence.com/en_US/home.html>
[16066EmailSignatureFortune100Best2021White92x1271617625037.png]<https://ww=
w.cadence.com/en_US/home/company/careers.html>





--_000_DM6PR07MB8143073FA28EA05BAF7D8B24DDF69DM6PR07MB8143namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi All,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am trying the following command to run Qemu with K=
ernel 5.14.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">qemu-system-x86_64 -M q35,accel=3Dkvm,nvdimm=3Don,cx=
l=3Don,hmat=3Don -m 8448M,slots=3D2,maxmem=3D16G -smp 8,sockets=3D2,cores=
=3D2,threads=3D2 -hda /lan/dscratch/singhabh/shradha/ubuntu-20.10-64_with_o=
rig_driver_backup.qcow2 -enable-kvm -usbdevice tablet
 -L $VB_ROOT/etc/vm/common/ -object memory-backend-ram,id=3Dcxl-ram,share=
=3Don,size=3D256M -device &quot;pxb-cxl,id=3Dcxl.0,bus=3Dpcie.0,bus_nr=3D52=
,uid=3D0,len-window-base=3D1,window-base[0]=3D0x4c0000000,memdev[0]=3Dcxl-r=
am&quot; -device cxl-rp,id=3Drp0,bus=3Dcxl.0,addr=3D0.0,chassis=3D0,slot=3D=
0
 -device cxl-type3,bus=3Drp0,memdev=3Dcxl-ram,id=3Dcxl-vmem0,size=3D256M -n=
uma node,nodeid=3D0,memdev=3Dcxl-ram -object memory-backend-ram,id=3Dother-=
ram,size=3D8G,prealloc=3Dn,share=3Doff -numa node,nodeid=3D1,memdev=3Dother=
-ram,initiator=3D0 -numa cpu,node-id=3D0,socket-id=3D0 -numa cpu,node-id=3D=
0,socket-id=3D1<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I get the following crash before the machine starts =
to boot.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">qemu-system-x86_64: ../softmmu/memory.c:2443: memory=
_region_add_subregion_common: Assertion `!subregion-&gt;container' failed.<=
o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Please help me find what&#8217;s wrong here.<o:p></o=
:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"15" cellpadding=
=3D"0" width=3D"650" style=3D"width:487.5pt">
<tbody>
<tr>
<td width=3D"105" style=3D"width:78.75pt;padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal" align=3D"right" style=3D"text-align:right;mso-line-h=
eight-alt:0pt">
<a href=3D"https://www.cadence.com/en_US/home.html"><span style=3D"color:bl=
ue;text-decoration:none"><img border=3D"0" width=3D"105" height=3D"63" styl=
e=3D"width:1.0916in;height:.6583in" id=3D"_x0000_i1027" src=3D"https://sign=
atures.cadence.com/cf/signature_fields/5dea7803e8b0ad196001582a/CadenceLogo=
Red185Regcopy1583174817new51584636989.png" alt=3D"CadenceLogoRed185Regcopy1=
583174817new51584636989.png"></span></a><o:p></o:p></p>
</td>
<td width=3D"250" style=3D"width:187.5pt;padding:.75pt .75pt .75pt 3.75pt">
<p class=3D"MsoNormal" style=3D"line-height:10.5pt;mso-line-height-rule:exa=
ctly"><b><span style=3D"font-size:8.5pt;font-family:&quot;Arial&quot;,sans-=
serif">Samarth Saxena&nbsp;<br>
</span></b><span style=3D"font-size:8.5pt;font-family:&quot;Arial&quot;,san=
s-serif">Sr Principal Software Engineer
<br>
T:&nbsp;+911204308300&nbsp; &nbsp; </span><o:p></o:p></p>
</td>
<td width=3D"75" style=3D"width:56.25pt;padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal" style=3D"mso-line-height-alt:0pt"><a href=3D"https:/=
/www.cadence.com/en_US/home.html"><span style=3D"color:blue;text-decoration=
:none"><img border=3D"0" width=3D"74" height=3D"63" style=3D"width:.775in;h=
eight:.6583in" id=3D"_x0000_i1026" src=3D"https://signatures.cadence.com/cf=
/signature_fields/5dea7803e8b0ad196001582a/UIcorrectsize1583179003.png" alt=
=3D"UIcorrectsize1583179003.png"></span></a><o:p></o:p></p>
</td>
<td width=3D"46" style=3D"width:34.5pt;padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal" style=3D"mso-line-height-alt:0pt"><a href=3D"https:/=
/www.cadence.com/en_US/home/company/careers.html"><span style=3D"color:blue=
;text-decoration:none"><img border=3D"0" width=3D"46" height=3D"63" style=
=3D"width:.4833in;height:.6583in" id=3D"_x0000_i1025" src=3D"https://signat=
ures.cadence.com/cf/signature_fields/5dea7803e8b0ad196001582a/16066EmailSig=
natureFortune100Best2021White92x1271617625037.png" alt=3D"16066EmailSignatu=
reFortune100Best2021White92x1271617625037.png"></span></a><o:p></o:p></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal"><br>
<br>
<o:p></o:p></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DM6PR07MB8143073FA28EA05BAF7D8B24DDF69DM6PR07MB8143namp_--

