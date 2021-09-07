Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF85402DB1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 19:25:46 +0200 (CEST)
Received: from localhost ([::1]:51010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNeqv-0008KR-Ab
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 13:25:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.levon@nutanix.com>)
 id 1mNepg-0007fY-5H
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 13:24:28 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:33778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.levon@nutanix.com>)
 id 1mNepe-0006Sy-7A
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 13:24:27 -0400
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 187H5IZC003543;
 Tue, 7 Sep 2021 10:24:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=fpVbguX6gqmLAef60NE0/A+WUNrwcOBKq4+bl4obLJ8=;
 b=ZRom//ujWcplbrOu37rXlq1LGwugXEEY68XqK0yVg7IHbsHhBiK/K7auJ/c9fXaY0Mbc
 ZMMJNAtV6sGVEjpx6tFv56Tuhpli+5ms7fbvV/ZwZW0jeWl5L6eN+HjGldFzSf/SbHtP
 L653AiyJ5ya3NxssqxjhP+0MpCqsvq6UaNm8h8p9vztPTlgikGztW9FcrmVYV90BiXk8
 A18DU0z/HB4FJp16rssra2ySNhcN4eOWYHeqspVPZGaq3pBxf3eq/ummKR5ARgXT0S0y
 ejOBxQT9sS2nGAL9dFKSRE6i3K19yiwYVuG6qVJ3LNo0TZnisv1KVDNuF7okG6aMyS+o /g== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
 by mx0b-002c1b01.pphosted.com with ESMTP id 3axc618167-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 10:24:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nSNxmiXQkENPHViVKV/6BvHWRJX9gn45lgUNK1XC+uc1ZMl9gZpikertcQAMurJ+LwH7vSGKHxg1O7j9Neh8HZneM0qsMRPQAKubFHOW2vjUjOgMhkkJE6sRfFh2ZOzUkhCWp5fdX84jvoJSXOqoPuv6LROC+wd5651ogodc6Nu117AlRi+q0K+fbxHgzmrVb9n/RX/cj55D/Vyk4zks+3HkTGwljXBJJ+gu1hmrHCzbQVhl4h23gIc7YN+TE2m/8g9Gt6QsksX5d6zURgwGmSv2V+3NxcbAmcTuXU2PkZBXi3tyH9ClMnRm5Vf/DOpj9+tgKyNTyGny4U0SIuUimw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=fpVbguX6gqmLAef60NE0/A+WUNrwcOBKq4+bl4obLJ8=;
 b=ImeFmU/g34vvtp8hWy/OIN8yehHtVFdDtB1FTMwcm+CdQAetShsnNFL7XH6S/L5cBLsrcE8y76WRcNEb6kjcG/9hm4PEhL2T85/VVuNgE/4cnq7QNtsIA5vButjad05d6Wj199KYunHkFquSzdxP2qKsBDZ+dbdg0vLU2fTY81K2jk3wJ7LhKul+0k+6AC9eLwfji0tblOE7KoGuRZXnkwUll3OjjWp5sqhE466FSmuTxv4yqZiWgzvC3Ph9hDYRAEPOeeYvR1LSWDy3A97iBpKQQYYpnc7yAPCtcDT0arpBLKHRorNnvZQom0m1CxXmGTAw+XjM2pAfNgwZUTeI5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL0PR02MB4580.namprd02.prod.outlook.com (2603:10b6:208:40::27)
 by BL0PR02MB3809.namprd02.prod.outlook.com (2603:10b6:207:48::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 7 Sep
 2021 17:24:21 +0000
Received: from BL0PR02MB4580.namprd02.prod.outlook.com
 ([fe80::b9d9:2c4b:c85e:dbd0]) by BL0PR02MB4580.namprd02.prod.outlook.com
 ([fe80::b9d9:2c4b:c85e:dbd0%7]) with mapi id 15.20.4478.026; Tue, 7 Sep 2021
 17:24:21 +0000
From: John Levon <john.levon@nutanix.com>
To: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Subject: Re: [PATCH RFC v2 09/16] vfio-user: region read/write
Thread-Topic: [PATCH RFC v2 09/16] vfio-user: region read/write
Thread-Index: AQHXkr3OvGMc1gF8HUqon/IhhiYGEKuY9OiA
Date: Tue, 7 Sep 2021 17:24:21 +0000
Message-ID: <YTegRT0DPt50h8VU@movementarian.org>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <92fb16181e71a1c4049f9995294dbd7ff4270627.1629131628.git.elena.ufimtseva@oracle.com>
In-Reply-To: <92fb16181e71a1c4049f9995294dbd7ff4270627.1629131628.git.elena.ufimtseva@oracle.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=nutanix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 76e585bf-1412-40c5-34ea-08d9722454e6
x-ms-traffictypediagnostic: BL0PR02MB3809:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR02MB3809C1C6CC0C042E1FEB23CD97D39@BL0PR02MB3809.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XsalyKPeQc6NOD3lp8/ZDks6POn7L84HskVat6ooslBNxJd/Az52H3yC58KEr/a8YlGDL4Cnw/+nvLePKOVSm0+7bVoHG1Fd1wl/rkacDUltKA71KiSXyVtRWFNwyGjl+OsLjtgx5FqH0QQQIm0Jmg4OPfxqtNurP1un9PbnytV3vnRBcHfo+cGKnL2Mj+rVdhgwTxNjifT0HTaLpI4codjEmqLs3W8Eu6q54h9u1Gh0XBRz2N3vEraJZgVnuC6qKAGQyuvc4gq+WffwCtnegpPdDHf+U5wnMqdVPaGHa6nRtktUamFm0r108t7oaBU1OYuPKv9u9CwMTzrJSQYndIGPGX767CJ0uEcQyxSQJZv6vL9R3cXsGpZWpfzXrKdT8inxRoXlCZS0YP4WPYGM7lJuhVfKXpYdQa0MM0kVB+/pCvyLEKbrw5eteIr6TfUWiRHA2miLA1dwl0087OYw/dJL2JvWpPDumfTW0lfTEUfjGJj7GpdO8lLXqQekvNd3aRllt1Yd2qTeijVEj/0FjW9er4+Yv03gAEwHgka+tH9s35IId6ooPj8zQSOMHFRUbaQq6hD9tFH7QXCVryRtnnBcZKmUNgIVNETyILMD2X1GqLrbC09/RF40LTzQGSugev0jtFOXB9ZNVlY3WD1Ap/Z8+38FdPA+92Rstj1FMllyZFtchm9iXUgvUmq2PCZvg4Ci9wMLWGXEJnrMLOJ8cNkBxXQQ6VukREnbKPndgTUE+1IruzLWfWqtkuqQkULvUPNKtj5bslTYLFhIrjDp9UvxK8Q/OHJuvjsMUqbfb90=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR02MB4580.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39860400002)(396003)(366004)(136003)(6486002)(107886003)(9686003)(6916009)(8676002)(38070700005)(5660300002)(71200400001)(83380400001)(966005)(54906003)(316002)(66446008)(44832011)(478600001)(64756008)(122000001)(38100700002)(186003)(66946007)(36756003)(6512007)(8936002)(2906002)(76116006)(4326008)(86362001)(91956017)(6506007)(66476007)(66556008)(26005)(4744005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?v7EW4d8VGvNU+4lPRt/6jEu3HSBckCO5ygZ5a/b0xv3LUMLpX+9VKP3nmILu?=
 =?us-ascii?Q?LqZUbT1h6ePYtAX5bkt8v9n86iRLUbXUMO8a+LGkZ7DyTv8uCjJHWzaLlNyt?=
 =?us-ascii?Q?7BrJctf52ZohKUdMAq2RrMwo41mdyIvuIfoeS+N0fSkl/P7ADVIJvtLxSVWE?=
 =?us-ascii?Q?q12g8TN43P4jIrS91CfV16IeHqJDDlpqBFNKQotqiSv4oDseBop4L6Qpccuu?=
 =?us-ascii?Q?+l69lsn/j6Q7DuaOgf2VvKzIgo0b08hOfgFAU3d3ZXLFy0K/cAOGZSh+oPBF?=
 =?us-ascii?Q?EnInYLtBFV1UJAE817vEr15F7em/Io2S0h72XqY3qVk4WQ2ID9qrY1I8gWU3?=
 =?us-ascii?Q?C7awlMsXM6s1vaPCTvW5lCC2zlY/4U7qY8lI24dHNy+TA9FZCT84wSeOiOlb?=
 =?us-ascii?Q?G5fSIbOQS+sxSpd1MGVdcgLLvwl0/XOdryHOKhyf4WaNiq6qyvfSZ1br8jF0?=
 =?us-ascii?Q?hPyEMxmRFIrT7PGRIWkQLgDERRF2t1qkEZqwIqpZz+8eAYcJvk9iwmsxlnFd?=
 =?us-ascii?Q?TQHPyb0XOVMBe+IzAsxSkPCbld7ChB0/Ly1EjP6PS9YbLgOBtwE0kiRutU5Y?=
 =?us-ascii?Q?Y1ngU1JXT/DESjY9we4GAY+19xqrUCxjHdN9CNQG534FRw3PzsW1jEYwfybo?=
 =?us-ascii?Q?fPGehdHLdqaT2kwR0EzsxzWz7BVfj2Vhz4zFe481k81nYsuNnlpcRxVz2YNh?=
 =?us-ascii?Q?kpKILaJRBAl4cpZLH5sIdZ16h11wnY/QTxcG/LYyI8bm/2YLBsdyY6sFvuqn?=
 =?us-ascii?Q?IjKr5heCUYTNOcke9LBuM8MCRVcGXZMbtG8ENVxLVpBR8ake3Hu+PMEIdh+2?=
 =?us-ascii?Q?BSDmVs5CaSQAr+AtCrqaojF4EAnkUday/5t9kBrz12KTLuLX0oSS01scmyK5?=
 =?us-ascii?Q?9qZWnMZVxSe/7S9XcrdvJJXWNYaVteHY+7w9WDk5OcTGPwtAPhY8SCdRsE+o?=
 =?us-ascii?Q?sr0dg4a3uLKK5z/ivHfEE+VWkW+Gc4FoYj0xg+NmRQHmmGXKmyjEUgCgo2h7?=
 =?us-ascii?Q?fpk/Q0y72LQaO7ZgW1ePvDtykyDlRoVAwk+G4CFIB1yogo4khVJJkiGDpnzY?=
 =?us-ascii?Q?Swj+ET3tZ7lkuSczvO32Bc/1cJEsljKqWT8XzA3r7fu2E06yhynjiu1ibT+W?=
 =?us-ascii?Q?46t4RU6wB1ZlgOga7nUELlL51cA1ZtE/fUJNkvyFlcCTZ6yzNdu2UgOA/BrG?=
 =?us-ascii?Q?SbCnmlcgHHVnqtPQjoMZfU3Tzc/BIKJSNIvFY30LWlk1T523VzUSHhEsVP6T?=
 =?us-ascii?Q?DUMk93o6+6MiagPDReVTeLwvnoisD7RoSpo57a+PKg7NSdoRRctXx/sxKk2/?=
 =?us-ascii?Q?qYebOLMchphFeSHr+svScDe3?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DD2033D8F969BA499A4E6C5EF737BDD1@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB4580.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76e585bf-1412-40c5-34ea-08d9722454e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2021 17:24:21.7428 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BDPE+kqc8sOIrSBcoVZ7IElpICV3f99QJmc7pWgXqRRPiRswZJf6erm94UaploYVJjRmvGX9/Wes9vVsPZ8MeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB3809
X-Proofpoint-ORIG-GUID: otDiQkiolauJtlaz1HEgGUKZFlCVIYeN
X-Proofpoint-GUID: otDiQkiolauJtlaz1HEgGUKZFlCVIYeN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-07_06,2021-09-07_02,2020-04-07_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=john.levon@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: "john.g.johnson@oracle.com" <john.g.johnson@oracle.com>,
 "jag.raman@oracle.com" <jag.raman@oracle.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 16, 2021 at 09:42:42AM -0700, Elena Ufimtseva wrote:

> +int vfio_user_region_write(VFIODevice *vbasedev, uint32_t index,
> +                           uint64_t offset, uint32_t count, void *data)
> +{
> +    g_autofree VFIOUserRegionRW *msgp =3D NULL;
> +    int size =3D sizeof(*msgp) + count;
> +
> +    msgp =3D g_malloc0(size);
> +    vfio_user_request_msg(&msgp->hdr, VFIO_USER_REGION_WRITE, size,
> +                          VFIO_USER_NO_REPLY);

Mirroring https://github.com/oracle/qemu/issues/10 here for visibility:

Currently, vfio_user_region_write uses VFIO_USER_NO_REPLY unconditionally,
meaning essentially all writes are posted. But that shouldn't be the case, =
for
example for PCI config space, where it's expected that writes will wait for=
 an
ack before the VCPU continues.

regards
john=

