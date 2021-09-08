Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDAF403C6D
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 17:22:42 +0200 (CEST)
Received: from localhost ([::1]:55816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNzPN-0004oC-85
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 11:22:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.levon@nutanix.com>)
 id 1mNzOB-0003JE-Np
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:21:27 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:59016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.levon@nutanix.com>)
 id 1mNzO9-0000Ns-Eo
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:21:27 -0400
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 188CnaOI027954;
 Wed, 8 Sep 2021 08:21:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=ZPNqk+p9QwTI3uR3sbz/I2GjXRRv2KbpLQ/DKPF8Pdg=;
 b=Nbm3bf8ELxj3USSYfgKol17LEcbyrDYqCOJcdDMYTRLk9jbaGA1GT+rhaP7OJE8nVfHs
 KV7BA9joPhT1D6CLO0w5UOlEYJxVH1dAIARnq3jtEi2UH/baz/7toF6AVdTiZiWq73J8
 Z8ghCMLgvxSgjU6Ta6C1bZHnKc9bf3we9qo2hZcvgB+M5CQolZx1my3+1QhB5UDANN3I
 +JjiBE45X1hZqUxrGjw+0V789wHJ4AoTDD5F53HFGkF/7LypuMKBtQSo3/ww5mlKkRqM
 QmEFbClDj8VmBWzI4nMB99TGlNudE0oLHR+EINNHW+yCRK3IBP2S4zc6r/x7JgiT1iwd bA== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2040.outbound.protection.outlook.com [104.47.56.40])
 by mx0b-002c1b01.pphosted.com with ESMTP id 3axcmma6xw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Sep 2021 08:21:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cd19iNrFtB9loAdOZH/ILpvrz+5a9HN1NMduk0um3ByBFPqUYwRLkAyvgYtXFhKW0/MGhMklC4vi5+SUuictzJloWxkSbzy8lB6if3FUU9Tc43KynHCDAFEj1yv2fAS9/rQynJh7F4eqRS7j8zANXdwLrzWxu7ES+WYaQn5xbG0FHUomkUAVAAIQzqkiv8PMVeT7BqPXRNZsXtGcQi31lQc7vrd+D+8U/e401vy368pe+Uq2agfWohq8GPmIw+NvlKJVL7nbZtejaeGHQ0c/bPMBCwVv/aGuVVZdlwYkTm0zi4xugRoAzzrpPsOn0De250j9aaZMrBWlNIg2T26FQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=ZPNqk+p9QwTI3uR3sbz/I2GjXRRv2KbpLQ/DKPF8Pdg=;
 b=QuIJCYaljmqMyj+8gTbzjc5u6jU+qGEunEdnR1GhchtJjznE4hBHWg6o9+xkUaPgUvB52+hXZeMXDCnXpAEQiMZzDnseiWk+jeppYOvSr5lUR3/UvYRPt9P+i/EkNK1zgc8Ph7Wiw7M/dvyJbetUtBoEuJRAr3fFHOsUHpkEwnQG/0q3rh3pSzpXwZpNjw719i5kbkUHigOV4ZXRDF7k91XDTXV02U2OX9ipWwtKCYT8dkmrWAXzs616ffgVfukMTpQiNPtme1YZprlujnRElQAaW9fZ7GErGWPRZYBUudXmsA2ybJNY4BJrpo9153ZuNyZQutTJ2d0HqW2u+9U66Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL0PR02MB4580.namprd02.prod.outlook.com (2603:10b6:208:40::27)
 by MN2PR02MB6416.namprd02.prod.outlook.com (2603:10b6:208:184::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Wed, 8 Sep
 2021 15:21:19 +0000
Received: from BL0PR02MB4580.namprd02.prod.outlook.com
 ([fe80::b9d9:2c4b:c85e:dbd0]) by BL0PR02MB4580.namprd02.prod.outlook.com
 ([fe80::b9d9:2c4b:c85e:dbd0%7]) with mapi id 15.20.4500.016; Wed, 8 Sep 2021
 15:21:19 +0000
From: John Levon <john.levon@nutanix.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH RFC server v2 05/11] vfio-user: run vfio-user context
Thread-Topic: [PATCH RFC server v2 05/11] vfio-user: run vfio-user context
Thread-Index: AQHXm2yIPjWEzOwcWUWSWCWzNjp1MquaK6sAgAAK7oCAABebAIAABUaA
Date: Wed, 8 Sep 2021 15:21:19 +0000
Message-ID: <YTjU60GCLX2XQHKr@movementarian.org>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <cover.1630084211.git.jag.raman@oracle.com>
 <3c043becf2b6e820f5392e0cadb465d5d9b9e6f8.1630084211.git.jag.raman@oracle.com>
 <YTizhs1m7EsAs9UG@stefanha-x1.localdomain>
 <YTi8sYZkET5tffj/@movementarian.org>
 <YTjQfvz6PmpFH/QL@stefanha-x1.localdomain>
In-Reply-To: <YTjQfvz6PmpFH/QL@stefanha-x1.localdomain>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 43924f1e-3c4c-4241-2e1e-08d972dc4f37
x-ms-traffictypediagnostic: MN2PR02MB6416:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR02MB64169D16912920929A3FAAF697D49@MN2PR02MB6416.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wzqFF/FAPv5UWc8bqs3VZM2M4DWqn0qQQNbvD91FfyeZpFVDX/FIHWKCe3seGEMbUEUQWNpZDB74uGgAzGAQTtf6E3hW/Lib1lNdNIV5QT3XXbPK6lN9tDeYxssNC3b9BDeB/t/b0YcZzWkZzxL/SCH46bAdL07vFIKcVfhQbUMDazW5M1N5EEVzvu0Yk2N21XJuMaizH54cx7Uf4n7oYxJrwSBeTAQOTi38MMmnGD8+LmSzRM97iSL/+8FLXNhGRu0BHkQTuUdC7EiU9gDu/VsyyDSZRYKya4E1i3hzVdPLgiH8Uqsw3M0zUsq/NmBuYNtMwnb1z3XbiT95LjzAWedQPWNaWP2sc6y3HCzEUJEUh1VtuHTbY0eJqalrDmgxc9tNMzf1Da49aqoznlVoXemO3YlSCAwwbmcZI1t82FEAhbF9w8do+bbtuIis0ieAji1S/TuAoehpKny9RvXsU0OFxy/p9pR3YhzEG9R/Uz/Isxz6yHGyKANjgWrN22UcSW+ayfExyiuq5saIKc+zV7EeIFDVCXLeUKIhFPaIYT0hq+Oqp5R8+cdTL3wQk6R1gwvthx3bvkoBSBEQ227XI9TlZe/RXbSkAdVyWkJiEykhrD7iJBHkLv29OhxajGnQp9OvKNntmcbMQBSfI3yqxk5KnTnofDt6OeJ4sUn76oDt7MwpdJaWKTDcBfNJV7qtA7qhIUlTooAplv+doVgEHQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR02MB4580.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(366004)(39860400002)(346002)(396003)(6506007)(122000001)(2906002)(54906003)(86362001)(66556008)(6512007)(66946007)(91956017)(478600001)(38100700002)(64756008)(66476007)(4744005)(66446008)(6916009)(4326008)(76116006)(8936002)(26005)(7416002)(71200400001)(5660300002)(186003)(83380400001)(36756003)(38070700005)(107886003)(44832011)(8676002)(9686003)(6486002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mbrOBg3jZADXFtGAtTN5huaHpOzJebsJjGaqLoNcyGdHei6IfEMO7o8IKxvs?=
 =?us-ascii?Q?+6HMzjEbTH/T3+IfQLtpEdbBinL0rsor5VAs5gk406+plrCFknSA9zvNL9BX?=
 =?us-ascii?Q?awDMAInT5NE69dSfCSnpdRqGRgL2qEey/oiYOZV1fZ/9pbMEVn9o49mjdKj/?=
 =?us-ascii?Q?raLMtK1QsA28/tow1g4Fz3+MAnKHjv98fZMIjrAWO7Llq5GTH7bwQW/a9IuP?=
 =?us-ascii?Q?7zKeZqX2Snc3HAN7nwN0xbYWrfkGK31IHfdNKj6J247jibgc+4uPtCjQV+Lx?=
 =?us-ascii?Q?4lefAjYuYPO1b0odCIPcUjNGBi6cCcDwsxVAS4q1aUD5cVNfbBTkVr+vwUOM?=
 =?us-ascii?Q?ufoSptGeoEcQ/zCaYvSOBNnkUQIA3/Hb1WrRTONHZU3RTWl6geevV5dvVsDV?=
 =?us-ascii?Q?Q/1WMe9ZAh5m1AigQu86FayDLNgc7/B0iUmE99z2EfgK1MqK3DvBH5Xoy8i7?=
 =?us-ascii?Q?Me0tPOhMul2J7Xbrd1/dpnO1lr8at48mFfiCkpEVcTaqtuWSdtAZHYlIOewm?=
 =?us-ascii?Q?C/yXMon2qfm3ex/eimSm+1tx71P7p8HQZgAuCxRxtzG/7LjORhNc5tn7GQbh?=
 =?us-ascii?Q?QTjmyYmuwmToDiNs/9nuQhYtb3dxkOy1ZvAZEXZyin6erajlMk6pK4X/3xNs?=
 =?us-ascii?Q?P1+e4lzNI1ueuGf3gd6i+iTwnLpIDC7mJxIdwy4q//q2f84awQNBayzAyESO?=
 =?us-ascii?Q?MbWJFil98UVR6b0kXlZK3hye6BCAgiZm+5EtkwDDuikA9FR9YVRWFJOPp1Ta?=
 =?us-ascii?Q?bPs6P7rK33gkfv/VziQ7J8ECItXAOtUPjok6Da4pJAUUT6ykb4Q0tErp4lPv?=
 =?us-ascii?Q?f0/mIfUljx2+pQAdjZ/sGesyV2QpazADXaxx6xk9F0JhCrE48p5zOLsp4C2A?=
 =?us-ascii?Q?ordpQbV/JTTQjct2pPh404ar92mvg0JXDeS0x2CGgeNewPCz0/0r7NEA3pOd?=
 =?us-ascii?Q?6fqrTwearDiz/9QuPZfwAAjG1UKqF7FlsNPPI7UUkkycOiCV/a+dBPuJY60Y?=
 =?us-ascii?Q?s7U6q0EV31DQwzC3dORg9AFKOzPZ4On4RuLcJVp5Pdr7wQqDYOA5g1SVOvxK?=
 =?us-ascii?Q?uIeB30BtVeFKF3QSjFJfZKLs1MrMFuGjjHFCW20U1kzNJ4EUee9YccPT2wYF?=
 =?us-ascii?Q?i+Fblkmj29js9iLT3JnmTFDGnfttSuqL3ZT0QTIkHpl2mnVVYXLb+nln0m49?=
 =?us-ascii?Q?/F+tDnydzrj/aNdI3nEcWjuQdebU8jjJRwR69P0Gj8rmAdyZcM1R6TTeQ2Ce?=
 =?us-ascii?Q?ZtqSJS6t7w805iZkDpgKDg3pCAQzwf4CK5xiTCda36pVXVEJzN4Iuo/uON6S?=
 =?us-ascii?Q?pqW6F/E3BC9hIRdk3oZpIsF+?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0F288FA5F915CD46AFFC56E298B0EBA9@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB4580.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43924f1e-3c4c-4241-2e1e-08d972dc4f37
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2021 15:21:19.5014 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mn4ZDcVmrP5LzVXaN9F+0y0cox3eyavDk0UlXa4TBjbGs52WYOITIa5VZz4WYPKlBeKdzdPfyxUL+AHEthpH0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6416
X-Proofpoint-GUID: GmIdn07APLnSMumMJJFOSIi_OteAxQNa
X-Proofpoint-ORIG-GUID: GmIdn07APLnSMumMJJFOSIi_OteAxQNa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-08_06,2021-09-07_02,2020-04-07_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=john.levon@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
Cc: "elena.ufimtseva@oracle.com" <elena.ufimtseva@oracle.com>,
 "john.g.johnson@oracle.com" <john.g.johnson@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "philmd@redhat.com" <philmd@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "marcandre.lureau@gmail.com" <marcandre.lureau@gmail.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 08, 2021 at 04:02:22PM +0100, Stefan Hajnoczi wrote:

> > We'd have to have a whole separate API to do that, so a separate thread=
 seems a
> > better approach?
>=20
> Whether to support non-blocking properly in libvfio-user is a decision
> for you. If libvfio-user doesn't support non-blocking, then QEMU should
> run a dedicated thread instead of the partially non-blocking approach in
> this patch.

Right, sure. At this point we don't have any plans to implement a separate =
async
API due to the amount of work involved.=20

> A non-blocking approach is nice when there are many devices hosted in a
> single process or a lot of async replies (which requires extra thread
> synchronization with the blocking approach).

I suppose this would be more of a problem with devices where the I/O path h=
as to
be handled via the socket.

regards
john=

