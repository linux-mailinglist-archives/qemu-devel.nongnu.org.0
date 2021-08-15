Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 245CF3EC881
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Aug 2021 12:16:00 +0200 (CEST)
Received: from localhost ([::1]:46484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFDBP-0006Qf-53
	for lists+qemu-devel@lfdr.de; Sun, 15 Aug 2021 06:15:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samarths@cadence.com>)
 id 1mFDA4-0004wh-KL
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 06:14:36 -0400
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]:9920
 helo=mx0a-0014ca01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samarths@cadence.com>)
 id 1mFDA1-0008Ua-KG
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 06:14:36 -0400
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17EKeBqG004562;
 Sun, 15 Aug 2021 03:14:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=VmtvcfKJdEeYGvlOuFjmMGZzkeM2OWoyiSfqs4qGPas=;
 b=n+vR5tNDel7x2OV49o4iE/v1fpbhVaDB9B9T6BDD/RAZdoCr6ilWSD+J+5yoR/t+gZN0
 YVyf9o8KLOe3Dla14gkDi8tJwCTaY/gB71yKn1q8uKoHiPt7RVFP81jmcFb08gLNQQye
 XwhNW234s7gould8rYAQJpbcjwi/8ak2++6TFmIP+4TJatCOHvGH34jNn9uawO+9HgN3
 sKTVFwYmI92oVn10HC0E5oRaFsxwmU5EdRm5thBI5vlsPXOa5INgpXSmancxHBWKa0MB
 FbAE0NPdQVUM5YHzTvSw7xPujvZ+B4Ob9d70bkzQYx6y+Y3QCc5yFCWm9qpROaDqIqVV tA== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2168.outbound.protection.outlook.com [104.47.73.168])
 by mx0b-0014ca01.pphosted.com with ESMTP id 3ae9dvjed4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 15 Aug 2021 03:14:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hNwCJ+gWTVr6ST3ENRbYkFGEipx/q0gj8IYyAwyScfTCTo+kdDKcdtRDRGZR1H2G5zMKMMBo14HqMcKoEd9Id0aQ/OlmxEEUYcF3TueUrRhDJUMJdnsr5qN45EL4DNvOm4Vp0dAmAjL/yCvJCpaaAYvet/Rn3jStJZRKo6VnnHbxZv0oeUOPfbuRnfXXFH/vmBScHNneNBq6kTlA3jjGboD44kpCZMGIJBzZ+Ta/7CT/MtyHkslrXifb9KPkirWBEZBodfFDpbCpAhj7kwMCm8iX0sZcCfdDLGMlJlOxCvS6tLKTEyJJCeE+PoFQD/AKlwHoGzuWwPgBbrN7za1kjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VmtvcfKJdEeYGvlOuFjmMGZzkeM2OWoyiSfqs4qGPas=;
 b=EO4WHkTcqQRQIyub5GTtSGfv2tye/8SW1nv825ZBfcJFqXoqJlyC0SZyeYbB5DRNEJFn9feQ3CynAz5RWEydPVLXntv0Cdi/HCmvJICxGHUMaj1/RyaAHnaOmycCGXmewM+zESy0wBc/vRK0CEd0UMuhJSdCpbzfyx9/60HrKV7zao3dbzQmXjs6RBCfi66pGAmSXTYxIm1E+rMdRgaRmW5stzC89fo1AeTx2fcmWyjtwV7025JnKayEteElxWL3KoQ161gq/N6xQ/XttET0oVLj8xqyj9Q6hsYvDwLyyq5eI/NAP2i8VwevvW6YTDvPimq4xvKbo5SR8dnU2pzEzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VmtvcfKJdEeYGvlOuFjmMGZzkeM2OWoyiSfqs4qGPas=;
 b=4cl5r58vHh3gu1GixgOsZS4hSXRU+gjL+1vKsGE97jIZFZxL3qozSY1u4WZaHiPRw6M+yHBGEDxoFDQ3Y9wdtJuViCKWT+2ip5eXYdE5Y+QY4PEBKZYJRwV5EhLuvaa0Wggj90XSyRGh+TXYpw8oeN42RMtTIIT4svpSNmts+rk=
Received: from DM6PR07MB8143.namprd07.prod.outlook.com (2603:10b6:5:20c::12)
 by DM6PR07MB6140.namprd07.prod.outlook.com (2603:10b6:5:17b::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Sun, 15 Aug
 2021 10:14:25 +0000
Received: from DM6PR07MB8143.namprd07.prod.outlook.com
 ([fe80::4933:4d0c:f4a7:795f]) by DM6PR07MB8143.namprd07.prod.outlook.com
 ([fe80::4933:4d0c:f4a7:795f%9]) with mapi id 15.20.4415.022; Sun, 15 Aug 2021
 10:14:25 +0000
From: Samarth Saxena <samarths@cadence.com>
To: Ben Widawsky <ben.widawsky@intel.com>
Subject: RE: [CXL volatile MEM] - Qemu command to turn on HMAT and NUMA fails
 with assertion
Thread-Topic: [CXL volatile MEM] - Qemu command to turn on HMAT and NUMA fails
 with assertion
Thread-Index: AdeNPFRJO7zN36qiQYqno1sR/jgqBQAnnr2AAAzZ/eAAAUXHAADqtc7A
Date: Sun, 15 Aug 2021 10:14:25 +0000
Message-ID: <DM6PR07MB8143E27F2C881FE1E873697CDDFC9@DM6PR07MB8143.namprd07.prod.outlook.com>
References: <DM6PR07MB8143073FA28EA05BAF7D8B24DDF69@DM6PR07MB8143.namprd07.prod.outlook.com>
 <YRJizxKbMxpwhSrL@work-vm>
 <DM6PR07MB814371B8A41F4B387F02C08ADDF79@DM6PR07MB8143.namprd07.prod.outlook.com>
 <20210810181240.tkhfcd4erlcqteov@intel.com>
In-Reply-To: <20210810181240.tkhfcd4erlcqteov@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc2FtYXJ0aHNcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy04ZTkxMTZhYy1mZGIxLTExZWItODViZC1lNGI5N2EwMWYyYjZcYW1lLXRlc3RcOGU5MTE2YWUtZmRiMS0xMWViLTg1YmQtZTRiOTdhMDFmMmI2Ym9keS50eHQiIHN6PSIzNjc4IiB0PSIxMzI3MzQ5NjA2MTg0NTAwODkiIGg9IjI0N3RyL0crRUFpSFhBQWxFNmtKS1JJMDdSUT0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=cadence.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 820c13b9-211f-4b44-d6df-08d95fd5758f
x-ms-traffictypediagnostic: DM6PR07MB6140:
x-microsoft-antispam-prvs: <DM6PR07MB61409F9F722CBB90F79FE89ADDFC9@DM6PR07MB6140.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /7PIlnsl8q2a2ldQt41ZqGau9hTEIko7Av2IsBikJOzRf1RljKYTkA4LVTKsCW7aUR9dcYtTInGm1nYbjoyXNxVXZ8eis4l6B1xoRtBnwWQLjO81AXwxDfYW1q3xPoIjrfdVKTdr69pvdmkVhuPe1azCXH8yI1Ly0iDf2V6h1QBRmLNzJGpgnHNB5Z/V1o2513x5nA+jg+weDJ8lsTv0HtnLpO+VZf0/cO0LYh8cOOGVNBf3uLJRm3cOLj/xJ8l9WgMLEFlwcZzCPCnZWrSZ2CggT77aaBt11qEf0wK5VTJ1hM9q6lRXGqx2bOaj0rGJLYEEE+jCv42d07OKDYuOGBWdK2/D9hPSY+mRpLbtAeuFh7i5I9pJxnLylirs4lqDcBWgH5bZPl8bwqmjIxfK4YGURvsQ5lMjO+OHeVlFuin2DOMdhWcPue9AeDq6Z3x1L7BC1wlP3SyJmRKTthQGC6f/e3TSfi56+ZetUUHxkbGZE9JnRP0up1MjiaEdDkOJOCfX2DzXJZCV/7H6ioeu+6MnGDnbUS+64ZHZnt5J0cOxOZcejSYOD1e9fQr/qcfT2XE2FjSxe0GeAn5zxmpjhOwgTDCe2Ubep+PfgasP1JEKoIWXVYxhTY8Gjw67yTMnY6vWKdTTOBjZOw4ro81abp60q3MuakN0I0rQ3l4IexdeqZ72EGawjMOs8/qJzQB9TmhtndapF64p4qtYHP03VZQqOShtOTpNhAgTHB1kApE8GRHTSOvoCaFd7Bdthc+AG+6cJxEQ4jn7yhxB3eGJUu7MLqnsffMJKKU4zWwdL6diriqiY8n0E4bdnxpxNcJI4Rkr5IYOeRf7S/3EUl6DttVstrqso3gbs41fc2teAgg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR07MB8143.namprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36092001)(33656002)(9686003)(86362001)(7696005)(38070700005)(5660300002)(26005)(53546011)(83380400001)(6506007)(71200400001)(122000001)(4326008)(55016002)(38100700002)(8676002)(8936002)(2906002)(76116006)(66946007)(966005)(52536014)(316002)(66476007)(186003)(64756008)(508600001)(66556008)(66446008)(6916009)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oFO5Qajy3KFpKYlI9RP0D2v1y0KjCP6LGvjjTk/boP6A8k+UVjFMqgJfRb3Q?=
 =?us-ascii?Q?/nIJXqXcKARUshWAm0LTrxwoFU3wLErGD6yLhV5Gz7EVast9kwTRX4U4D4bj?=
 =?us-ascii?Q?z5DZOVejr3ao1faH44H9/VOq87MX4Pjs0Zy3/sL+mu0cglDVrTMTQKNR/syL?=
 =?us-ascii?Q?hQWi6w3B7Ve+5mdqOlT9dkQeGOhV4L63ZKSQDudkKjeYM1eKM4ZsVw/CTn8R?=
 =?us-ascii?Q?VhFA8zFd3mkb5pZPj3SDCyHSVV8CEG3oNPe2yoASYXSSyRWk3Xz4AQ5Au/zH?=
 =?us-ascii?Q?el2koqBhzIwxSGWRxWD4uJTLnwVfx2xEhQOL97sAj1XojuE/vtqMXOKAGIj/?=
 =?us-ascii?Q?xoPMrf5kUiP2Htiwe9jHubKidjYyHhUGEnanegpYVFszfgzn/QQMnMSOWkMf?=
 =?us-ascii?Q?OPd/HexUq9B5mR+zaEezryr7dDmb/P7Jon3vODuotPVN4fFA++26kjWlcLze?=
 =?us-ascii?Q?GvcDolac51dEoRc3tZ4iF2mK5Tt7aOfKA+vFS8vzfP2GKUiIdtuYGos0pYLK?=
 =?us-ascii?Q?ArTFtMbQzUV5vf1oWnh6CZeh9aQDwafEvQex7Mp4ztLFNCoUcG563rt9GWkZ?=
 =?us-ascii?Q?83qeiYPglvMdEuf14zvFLJ6++8z5TED5BrS1jwxXmJoCx23rSLqtJDVikmQr?=
 =?us-ascii?Q?vz42lqBxIt12wuEbQh9yHZs+NAaKl0HbMY2axc+sd7ISyMXmIfXFDsVbSIVT?=
 =?us-ascii?Q?WmgyaGt7eTgz+auH1XCnoXqmJmy9Iy5olg8ubxgSzFYfnaMXv4GzgAVkgq0i?=
 =?us-ascii?Q?K5lH1yb11yi/18DFgtaiVfNmLgg40REbW4dmjSOp2pecHrBRg+VYDMdPCgjX?=
 =?us-ascii?Q?7RxIaes7Zwb8F44bpXgv3Y/uGeoucLKaJ3jznC+GqGEe8EtJX2KJbkIcNiEr?=
 =?us-ascii?Q?BFDqbpQ/jqykBpD4PmWmJGt0ZCIHJe57J76+7iFExkgZVTcJIkvcSRyotXOf?=
 =?us-ascii?Q?M45gBQX9prv2pbhI3JUoq4/NUR1GV6dwpkWXKHRZh3uOoh6ZNop2CyTcSzh7?=
 =?us-ascii?Q?fChZvBs/zzRjmGnUiav8UO8qcwj46oVvCOtK/0DpPOIMKYEVLnrzOjIc4pGh?=
 =?us-ascii?Q?AE7HhVFhjUdoQvYn41xowgjXa/0sM8sdwt+UBYW/+G3E5nmyl+1VG7Aaukhy?=
 =?us-ascii?Q?M5jgiAHpI9hNFvOVSb0wlUb/QB+x6bBs74MugXkwJaOqhaxOkgu8yZR6Nq1c?=
 =?us-ascii?Q?tENj1PG5gCuX54F3Zj9kqYHuk1wQ4rflD13cUX+t6+47JBR1gfaVfpRKYuOv?=
 =?us-ascii?Q?byIH1mP610g30DzjMqRRUVJd/ybR5THCiGuc7TbmJjl652daE1PQsOrgZMMO?=
 =?us-ascii?Q?3MiVaHUvZldxZxP4EL2rOeeJ?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR07MB8143.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 820c13b9-211f-4b44-d6df-08d95fd5758f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2021 10:14:25.3355 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qQkRJPeVrFYWeYHhsoIQZSdDxV03uwIG0nNWu/Tw3JCLtxGN5qWdf3uQivoy+jhveU08lXFbNmce1F8W48VZ3JbwCLNNvw1osQPMsMs4lGM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB6140
X-Proofpoint-ORIG-GUID: cejOcQNpCiUJeclhwsP0gJ7XTgiTso3M
X-Proofpoint-GUID: cejOcQNpCiUJeclhwsP0gJ7XTgiTso3M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-15_03,2021-08-13_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108150070
Received-SPF: pass client-ip=208.86.201.193; envelope-from=samarths@cadence.com;
 helo=mx0a-0014ca01.pphosted.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URI_NOVOWEL=0.5 autolearn=ham autolearn_force=no
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks Ben !

Does this command support volatile memory too?
We are looking to run Volatile memory.

Regards,
Samarth

-----Original Message-----
From: Ben Widawsky <ben.widawsky@intel.com>=20
Sent: Tuesday, August 10, 2021 11:43 PM
To: Samarth Saxena <samarths@cadence.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>; qemu-devel@nongnu.org
Subject: Re: [CXL volatile MEM] - Qemu command to turn on HMAT and NUMA fai=
ls with assertion

EXTERNAL MAIL


Thanks Dave.

Samarth,

Easiest is to just use our run_qemu and figure out the diffs (--cmdline wil=
l print the qemu commandline):
https://urldefense.com/v3/__https://github.com/pmem/run_qemu__;!!EHscmS1ygi=
U1lA!Unz0pDVxMVCy_xrhyJ2NNrJg3z-bb2dughtewVIoD5hKzlg0zzNMUj0s7N8OWLc$=20

If you're not able to figure it out after that, please let me know.

On 21-08-10 17:38:16, Samarth Saxena wrote:
> Thanks Dave,
>=20
> The Qemu version is qemu-6.0.50.
>=20
> I am trying to capture the stack and will place it ASAP.
>=20
> Regards,
> Samarth
>=20
>=20
> -----Original Message-----
> From: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Sent: Tuesday, August 10, 2021 4:58 PM
> To: Samarth Saxena <samarths@cadence.com>; ben.widawsky@intel.com
> Cc: qemu-devel@nongnu.org
> Subject: Re: [CXL volatile MEM] - Qemu command to turn on HMAT and=20
> NUMA fails with assertion
>=20
> EXTERNAL MAIL
>=20
>=20
> * Samarth Saxena (samarths@cadence.com) wrote:
> > Hi All,
> >=20
> > I am trying the following command to run Qemu with Kernel 5.14.
>=20
> cc'ing in Ben who I think owns the CXL stuff.
>=20
> > qemu-system-x86_64 -M q35,accel=3Dkvm,nvdimm=3Don,cxl=3Don,hmat=3Don -m=
=20
> > 8448M,slots=3D2,maxmem=3D16G -smp 8,sockets=3D2,cores=3D2,threads=3D2 -=
hda=20
> > /lan/dscratch/singhabh/shradha/ubuntu-20.10-64_with_orig_driver_back
> > up
> > .qcow2 -enable-kvm -usbdevice tablet -L $VB_ROOT/etc/vm/common/=20
> > -object memory-backend-ram,id=3Dcxl-ram,share=3Don,size=3D256M -device
> > "pxb-cxl,id=3Dcxl.0,bus=3Dpcie.0,bus_nr=3D52,uid=3D0,len-window-base=3D=
1,windo
> > w- base[0]=3D0x4c0000000,memdev[0]=3Dcxl-ram" -device
> > cxl-rp,id=3Drp0,bus=3Dcxl.0,addr=3D0.0,chassis=3D0,slot=3D0 -device=20
> > cxl-type3,bus=3Drp0,memdev=3Dcxl-ram,id=3Dcxl-vmem0,size=3D256M -numa=20
> > node,nodeid=3D0,memdev=3Dcxl-ram -object=20
> > memory-backend-ram,id=3Dother-ram,size=3D8G,prealloc=3Dn,share=3Doff -n=
uma
> > node,nodeid=3D1,memdev=3Dother-ram,initiator=3D0 -numa
> > cpu,node-id=3D0,socket-id=3D0 -numa cpu,node-id=3D0,socket-id=3D1
>=20
> You probably need to state which qemu tree and version you're using here.
>=20
> > I get the following crash before the machine starts to boot.
> >=20
> > qemu-system-x86_64: ../softmmu/memory.c:2443: memory_region_add_subregi=
on_common: Assertion `!subregion->container' failed.
>=20
> It's probably best to check with Ben, but you'll want a backtrace and fig=
ure out which subregion and region you're dealing with.
>=20
> Dave
>=20
> >=20
> > Please help me find what's wrong here.
> >=20
> > Regards,
> > [CadenceLogoRed185Regcopy1583174817new51584636989.png]<https://urlde
> > fense.com/v3/__https://www.cad__;!!EHscmS1ygiU1lA!Unz0pDVxMVCy_xrhyJ
> > 2NNrJg3z-bb2dughtewVIoD5hKzlg0zzNMUj0sZqFMTcY$
> > ence.com/en_US/home.html>
> > Samarth Saxena
> > Sr Principal Software Engineer
> > T: +911204308300
> > [UIcorrectsize1583179003.png]<https://www.cadence.com/en_US/home.htm
> > l>=20
> > [16066EmailSignatureFortune100Best2021White92x1271617625037.png]<htt
> > ps ://www.cadence.com/en_US/home/company/careers.html>
> >=20
> >=20
> >=20
> >=20
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>=20

