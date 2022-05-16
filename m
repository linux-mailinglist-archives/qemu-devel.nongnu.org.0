Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 489E5528C69
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 19:55:51 +0200 (CEST)
Received: from localhost ([::1]:54676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqewg-00085k-1F
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 13:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1nqeg4-0003Wg-9g
 for qemu-devel@nongnu.org; Mon, 16 May 2022 13:38:41 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:50912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1nqeg1-0004u4-MR
 for qemu-devel@nongnu.org; Mon, 16 May 2022 13:38:39 -0400
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24GGme0F008370;
 Mon, 16 May 2022 10:38:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-id :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=AiQ8Wefxl71DACl3Sg9fvIpq59uianyKI1hALrL+2lU=;
 b=iLGgPmS63W7d+Uvoe0h3bZOL6GlpeLCCFqpEhOgJR7WRu9oe6v8leXj5WliKUKM7ojwS
 yCK8F+aGhK/sd9s0hawIkXx53K7wfqnjVRZXzTwv7HAJK4T2BQco4yU1nZsnIcZwopEl
 fHGT78S5bihHKNBEYj0y+UAeS3XL+8TjogU1TYp7N7+Crv/dNt1PaFJL88vPqbxWl/u6
 u+4nUGN1esu91G/mnlezQG1mKYoiJI7B83jCIeycLsT41bRalLF1LiFrs6rw8mOxhOCY
 Dt7Bh7afAdBRJS5HbUjQI7ZkeEF81yYv7DXKsnKv97qpiG8RMYURyd3AChSNhubGb4xd 2w== 
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2044.outbound.protection.outlook.com [104.47.51.44])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3g2by0kvcy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 May 2022 10:38:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W/LgowTyXaDDs4AeMT2OJOXMX6BvRT7Qrz3XCmZ6pzgutN+avyh2bvJpVhxElIxA7IKGfa/gIq502w0vQ6FWOs8eT8kkNDW/pHZyGfSGDjHA2EH9nVzesrB8qgaASSFmBZefvsHMvNrUI/9cXfISg2jC9WXbHv3t8WGJGN7QV7sj+bwCYkO2qMjGKlfh/+xoaHfmCf/sQWtBJ3QZzHr5oXsJPBlVZsXa36Y8pwcUKGRXGe4xweXxK0u2R50emxNj73XXQ0ClWltfuMYJTeiYnjo84/RVJjqNcOkZ5WmWm+zKaCGAtx5BnmjLKzkw+McHpwcKVHNgEy3XwAV3gVJDtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AiQ8Wefxl71DACl3Sg9fvIpq59uianyKI1hALrL+2lU=;
 b=X+sKme3MHaydj44PM0XjKjQtzrSg1cnoDKj41RrLv4S6HFpPDKI2TSUPEGQtHWfzjthnOndLTeJULS0BQhtKJbRIobNBFBFUzNZ4RIw8iEj7OliJRm5PADgu16LiN9/HZsu8liZJ+wMentPKTQmdLZQlPhOTskydoqMJTHFG/a8yqvSS702P/5Ff0mRdS4wYBEqpxVsIKwv+trcz9XxtClgEEilgqFRCmpynZ1gPzGyE/pOKDUPyx39koxvPHwDDH6LQyYxsBEtK8vdUaMeauXV9h/kkTXoCvzjczESe7OwFMh9xc2FntAlbv5fAHSAyniERtwASw/AnbHbM8MHYpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by CO6PR02MB7714.namprd02.prod.outlook.com (2603:10b6:303:ad::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Mon, 16 May
 2022 17:38:31 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::c123:e4ca:ea71:d40e]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::c123:e4ca:ea71:d40e%8]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 17:38:31 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: "stefanha@redhat.com" <stefanha@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, John Levon
 <john.levon@nutanix.com>, Thanos Makatos <thanos.makatos@nutanix.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>, "alexis.lescout@nutanix.com"
 <alexis.lescout@nutanix.com>, Felipe Franciosi <felipe@nutanix.com>,
 "mst@redhat.com" <mst@redhat.com>
Subject: Accelerating non-standard disk types
Thread-Topic: Accelerating non-standard disk types
Thread-Index: AQHYaUvCbyr7NDMI806tQ3+qwDN2Dw==
Date: Mon, 16 May 2022 17:38:31 +0000
Message-ID: <20220516173831.GB13284@raphael-debian-dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a2d11d9-0e3b-4f0d-7165-08da3762e53b
x-ms-traffictypediagnostic: CO6PR02MB7714:EE_
x-microsoft-antispam-prvs: <CO6PR02MB771471F2D7C213A0F3A0C940EACF9@CO6PR02MB7714.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W5+zhkP6radRH54F+iGa3CpdsO/+4Sd8kzrh+x98je1zXqeSNmVkCUqBRoHSHMvpTDRQ37FbG5rhE6nm1mCLwpGj8uAjD908//VccA+K1q03LkRYooh8cHS8vqhoTGDv0MOPHMweg8Mzvwpi2SS0HP3lkdmdY/D8NyQNLzqyuCG59EozMvRVBVEfPP71XW8m8MP6VbYZt2DOXuxcszv/14L7DbIuflMo+z3vV5LC4LPAkG9a4ORnGTp8yBcn1PBX4SW4RS9CeKfZp6wGQ6pquFcRwyjS61YEdkJoJET+CI4Jf0lfE3RYXC7xX19YDe2KZrOZEMbAJnslu92tyx6QgdaBVKwAK1ddDiLD9f0nifjyRIIYRbgmqAZ9PqjeRO6mRnpOfJTraxoeGjwt1uu5svepVsYW3BBbkXYLPrad0YKYHh9VHkhVDGeXbljojFtFHZ406yzwGSeUpQTtVHKx2IS4/GiPUVwX/IFF0SNA15wg7ii0EuwUSD3VIMEIOEpg3n2ZAe4A4VTJDup532MtCng9+0/0DDJZOg8vTT/Tyv4wuijFlip+rHxAx8AD+RZ4/r93WIP6xl+Liw7EMozj5YRzvPMI2+zalBEldaeHWtHS6pNYHdpObjh4WoVLEX116pfFSHHMF7nRISKFDXedZeaev/FqomWVgj0TZruKdrnyRj3FH0JfN948vvDZZ8YycENOUvZ567gepzxGpptd5KzXVF6Ec6Z1457LYrgxDCkyeHxHFXwznkHs5yvdWdSed0SKWHJLLAmqkh4P2rDd5catHLKbFMSpqLLWNDew0KJqnCyobuUsvxfxJo0HHul7
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(3480700007)(6506007)(186003)(71200400001)(316002)(2906002)(508600001)(54906003)(6916009)(6486002)(26005)(6512007)(9686003)(966005)(44832011)(1076003)(38070700005)(38100700002)(91956017)(64756008)(76116006)(66946007)(66446008)(8676002)(4326008)(66556008)(66476007)(33656002)(122000001)(33716001)(5660300002)(8936002)(86362001)(175924003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pUMpoSGB+42+Fc3aumUWlw2FZFLug3+pbs37GQc63blPXYEuTAX5ymMeqRsN?=
 =?us-ascii?Q?UKKjjCsNzXOFQnIeNHta/Nn/G1nxZGohd89Dp40BiG+QHWJj1mrNbhbiezjd?=
 =?us-ascii?Q?LbDhtc90dZu5lKIcllfWJjVubL3zjMnCnd4UwoLjF5UX6WwP+4Q55IEdj+w3?=
 =?us-ascii?Q?FsxkL50AI+hzF8/bQ+lu75uqmwq743z9Grg+bq7e2tTcPHOUAxmd2mtkGod6?=
 =?us-ascii?Q?ricf2glYLU7U40V0Ro40qVtQEHbOLLeg6YykEcVUjCxdoEHN1eL7WJ39mZJ7?=
 =?us-ascii?Q?TJUefCkNPxoCfV4uFw78ryOXiNpstzrZpaGZwtjET/4GRs2toUSA9YDNQVkr?=
 =?us-ascii?Q?1yuS1dmF/KCe7CQQptTuhKwgQIjM6QX9YF3z/pBFNnkyDsnTc6UEji5IvB5o?=
 =?us-ascii?Q?B1vTs56l0L6mmRPPwRKYKsowZLyzBxPyfHMDVbXS6EdUSN4nmBm6i2jZzXyZ?=
 =?us-ascii?Q?CHoZBWgaM/oW4i37aawzbePC6Vdak/gigdBykH31iey0EWHHwLmiYWejM7ew?=
 =?us-ascii?Q?K9ftR9FO7cogp0O7G/TrxeaszEJHD07h3KsYRT+Ixu2EMo0RZdjJl1bnntap?=
 =?us-ascii?Q?HtdEzzqR4O/YPjygxxdEowG4/tGnBodyt7Y3L6dEXcJD2vrZ52Y3mhAL7D9h?=
 =?us-ascii?Q?e6hbgTK7YdLX2sYIjzewWlMhLZuHAol0HsW3nh2netz1bj4AWI5/jr9djWBj?=
 =?us-ascii?Q?4aIHIEjN9chso/xuoxgP2hstAMVmqRKllkIHebXSi6n4pxsjT61MS85D+mkK?=
 =?us-ascii?Q?yH9HgXOGBO5PjADUocJZtQwgVezi7aaSXdC7zANF4EDQM461loLsYddAfkSv?=
 =?us-ascii?Q?7TYzTW6GBhD6AIF/GtDXhZGKGrfpUTW2JSfbpdYyo74j/aV7uSB+nTvhfpdO?=
 =?us-ascii?Q?fwaloMZLs7WdfitiScp5lNm9Uc8zqTUsa16i3J6gvuBgjXENsuAVHGGcxohx?=
 =?us-ascii?Q?WHi5OoV7Q93dAS2LNjS8rqt7ilvi5myPshhBGi3WEC1uMT85tiFNXuca3CXp?=
 =?us-ascii?Q?WHLfB+D5W4BKmmIsbOviiv6gg16f4nGrBIUGBz/QqXW0RhJr4VKbvnr2Qf0m?=
 =?us-ascii?Q?5T7G4dusTK3DJI7z6tDycfCATRXY/ADf6/nTIFjJFUTCaxj6aGdwa2LYXFbB?=
 =?us-ascii?Q?Q6GmXSeVfSczn9rUk+Onil2/vzliIfKLxh81pJpc+HoZmJhQ8lJ1940m3IGu?=
 =?us-ascii?Q?+nln5FKbf2ky48HNcd9S2+TUW3Y//y7QNRvBeTUd9HAgGeTlBO6frhaUXDen?=
 =?us-ascii?Q?FY9aZ3jVpHkXzB0Vf0hlknw8GUsDVtYKX3j4/PgRsB8rVTbuMYPq2ZGV2w4t?=
 =?us-ascii?Q?6xdKMPYAPrneDzUkqAFupakp9hme4cLJbqh9SQfj0SRXzZgloZcENIAcwWA8?=
 =?us-ascii?Q?FeAZPR5M9HjV7xkr01AD1q4ewWupziU+8K+PMjzbcPua235vyhPM8qGehNPp?=
 =?us-ascii?Q?Ol48+ORyDwJn8JdJrAXbmFZyDz4pCHBitPfP54jxlYfRLfX7N+9woMeJNYhq?=
 =?us-ascii?Q?GvyRXAI+xvrOaN9yqsb0fvZ9SKiQev+2u4hs1akUCUygl+SS5fX5xE4GEIRf?=
 =?us-ascii?Q?HhR4+RV7bNv1Led6OGlPUmVXq66cjc+LC9T3YMqjSpGE157T72x3fEwb9yyq?=
 =?us-ascii?Q?Ayk7vdgZi9h78YbZHj8nLz+L4z7dDjArrNdlpl56vFv3rGsW2+7FWRkNaD62?=
 =?us-ascii?Q?DpU0w3TXcdiiqiasTmtUaI0WgSJG29S7YCz+BeFii6yqxjXgk0vkrX/UyEfX?=
 =?us-ascii?Q?iKWr2EK86EsDUU5VIjfUFSPRCK3qMR5+GvYt4JRpfIRzfPkPkce8?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7D689ECE555F8E42831C43F01AC93DFD@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a2d11d9-0e3b-4f0d-7165-08da3762e53b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2022 17:38:31.8234 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 913VW0Q0HZ5dRm5U9L8DTaqAocrlk/Kf0BGofuCd7540ZQd3xyc9z8CrzWVRaoeqid9NIYONumEk9l1VehL5VtZ3YlXoy330kPHkr2KJiB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7714
X-Proofpoint-ORIG-GUID: 6Ehx4GkbUNRvB4ddyBG4ZslLq5TKrz7i
X-Proofpoint-GUID: 6Ehx4GkbUNRvB4ddyBG4ZslLq5TKrz7i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-16_15,2022-05-16_02,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Hey Stefan,

We've been thinking about ways to accelerate other disk types such as
SATA and IDE rather than translating to SCSI and using QEMU's iSCSI
driver, with existing and more performant backends such as SPDK. We
think there are some options worth exploring:

[1] Keep using the SCSI translation in QEMU but back vDisks with a
vhost-user-scsi or vhost-user-blk backend device.
[2] Implement SATA and IDE emulation with vfio-user (likely with an SPDK
client?).
[3] We've also been looking at your libblkio library. From your
description in
https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg06146.html it
sounds like it may definitely play a role here, and possibly provide the
nessesary abstractions to back I/O from these emulated disks to any
backends we may want?

We are planning to start a review of these options internally to survey
tradeoffs, potential timelines and practicality for these approaches. We
were also considering putting a submission together for KVM forum
describing our findings. Would you see any value in that?

Thanks,
Raphael=

