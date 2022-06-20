Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2CB552699
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 23:36:20 +0200 (CEST)
Received: from localhost ([::1]:39502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3P4E-0006j2-UZ
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 17:36:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71706c1562=pdel@fb.com>)
 id 1o3P27-0005wU-U1
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 17:34:07 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:9088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71706c1562=pdel@fb.com>)
 id 1o3P25-00014g-17; Mon, 20 Jun 2022 17:34:07 -0400
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25KIwSOA027134;
 Mon, 20 Jun 2022 14:34:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=SuZx0djNbuPNMxhQD2VzN1NQJpaoFXBSITHV0Cc4BBI=;
 b=U23tSvv0UIB3KEKmbL4rtFrQi8hy8WZUuauIeK8qbbo7TdaRME+dYMTVTqL/5Cfj1Z/8
 xWqOIj7QuABnlQ31Z0mGpGnIzJgvIAIrfvcz/40fAYGukyj3yseIyu21FqaTW16NwP3p
 EBtHH1fQMFGOKkG+Wm+ZJ/t6JfAl1PS3Du0= 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gtveu1vnm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jun 2022 14:34:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LwovvqjOFec3CO6+RUdlz3iXclMf5QEN5Tk7McS0uwd5FSl+V4gLdzDudkSMU+kPg9Qa66SOSjpAueogzji1dXM5QhLCmWR6BSvZe7YHTeoZ+qlkg6MgvarjOYWnLZTIF2YqAwXomnO1TIGSuyUSfKvegkqxk2NPIoXjc9ppOcmXsTpsi/UVC8Dg+TTinKLaXtXvlVEH3VWAVDJq5gbiXV4VpI+dwl19ZtLRX6FFGsidOwl7XuHeA8krwPKa1GAZS1BhelhPkIzhet6QFxM5O+aI/vpmH122penIX1XhGGrRUkbT8gEto+m4w6AgUFNOYI+JzMb2+vWAijuqAbg6ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SuZx0djNbuPNMxhQD2VzN1NQJpaoFXBSITHV0Cc4BBI=;
 b=PvniALpUJvddyvHKLcexOk7LAqowzel7UcjJZmKoC5idG9EA0c49TrAdXdQM03oHOlKZboFqqblJl/R4yPngJdSZbSnvk7furwY65wNvWVnfSDmHRcFb2XCENM1PKGtnPuLdMM+15kwTe50EqZEK2n7Nlw/BzsmKvuke4oAuDGZzWx2LdsSXWa3EmtFskwSu1m+IujVKXoYaz69HO6xF+1hXfUQDdsrgDaxZUfgb4nsD7nVo2E0f7P+oxJF3dsj4CHqZ812k8sRSEy6w4FmX2EhZNXixyoMYXNPNzk5g6ynXMKwQvoAwxa+7+uuLyTjuRXZewPv1iFGVI6hd3yVA1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by BY5PR15MB3539.namprd15.prod.outlook.com (2603:10b6:a03:1ff::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Mon, 20 Jun
 2022 21:33:59 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::5812:71cc:63fb:1081]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::5812:71cc:63fb:1081%7]) with mapi id 15.20.5353.022; Mon, 20 Jun 2022
 21:33:59 +0000
From: Peter Delevoryas <pdel@fb.com>
CC: "jasowang@redhat.com" <jasowang@redhat.com>, "eblake@redhat.com"
 <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Cameron Esfahani via <qemu-devel@nongnu.org>,
 Samuel Thibault <samuel.thibault@gnu.org>, Peter Delevoryas <pdel@fb.com>
Subject: Re: [PATCH 2/4] slirp: Update SlirpConfig version to 5
Thread-Topic: [PATCH 2/4] slirp: Update SlirpConfig version to 5
Thread-Index: AQHYgR1A3w3ABEo3HEmcG5dUOTnazK1U8vWAgAPltgA=
Date: Mon, 20 Jun 2022 21:33:59 +0000
Message-ID: <1AA384C8-10D6-49E7-92B4-2B617F8D3E65@fb.com>
References: <20220616010526.1895564-1-pdel@fb.com>
 <20220616010526.1895564-3-pdel@fb.com>
 <20220618100301.qdsls3bxugwv7ekm@begin>
In-Reply-To: <20220618100301.qdsls3bxugwv7ekm@begin>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27b46ea6-4fdd-47c6-ab1d-08da53049659
x-ms-traffictypediagnostic: BY5PR15MB3539:EE_
x-microsoft-antispam-prvs: <BY5PR15MB353939CB2F3A9FBDE22F4AF9ACB09@BY5PR15MB3539.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GqN3AeEBJB/PakMgvRxlzb2wMCbooZ537HdJ62w1RsmDBtTTGEaV/ja4XwtJ1eb1zMOdgJnKvOe63AoBh59KhNmB3Iyilv5rdAPveOS4tZJ56e65AQtqRl8cbNsmnBnYcpXty+kMQLtsI9I9sLVAGhhbw4sNHTMwYYZ9Fe1H5Nvtu2b36jXHiD1DoWEsLK0Pem7tGhnumkpZXkb37lrIBX4xIRCzg1fL60dyILjxwM1YTyJl3WlcVZRFJKWFWHqNpheycBxOzQLmea/NXjR9FgBiLgoSY85RJWABSGBD+Od9eCOKAdmj9JZqCS/JQMZypO8olv6LUPrdrLWJOUpd5VwUrQ2z99Kh6sAOZ9XGIjfm4xihUlZxJnnIKuPFWLd/XAFLjkagLsvlSUMO3ZhiqTmL5Z7+wDbrsMMdrst49/ogfUASJ+X/VbHL3OJsNaMLaedsyp1TpgTkWpb5m7Ebr1iWUDN+OJl/eOAiEWLUN3rrCBAZK6D5Xvz6RdKEj5tC/STiyrIjeThz2c86ODkjglzpmg/D0r8Z+Gf60dceQrvOUH8wi1kCKGMOAvw3Axv/+m/laV5MVVoKLbGrwrVdUGi0FSh0dfVN5f5QUOKqhfd2H4sckjhZz3JIBvOlhH6E/9w3HiRmnKgRlzJZmkR6DwUyll2tuqP4oz3H0AcfE+YG2s8jZok0WIYrLJBCEki4d/FWhw0aAOoKWzjkx90CkuWSEIiVF9+a6wCKIZyaNOhsURZY7tpXXdHy/MRMWyMH
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(396003)(346002)(39860400002)(366004)(136003)(76116006)(91956017)(36756003)(66556008)(8676002)(66446008)(4326008)(66476007)(38070700005)(6506007)(66946007)(316002)(186003)(54906003)(71200400001)(64756008)(8936002)(478600001)(6486002)(6512007)(38100700002)(41300700001)(4744005)(33656002)(5660300002)(2616005)(109986005)(53546011)(122000001)(2906002)(86362001)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?U4LvHUYYAIdBRs4EsA82bHKXMFZ011RG2lOPl23XFI5imIqLnSEkpfgNZwRw?=
 =?us-ascii?Q?SOCbr0d36nMGO4v2URm91cR/GnPzokT6mAa04hmPkyEX3P7ap2v7f8UvJZS2?=
 =?us-ascii?Q?Ch0VzT2v+TufzxSq4SimBXfawOBu1wIsTydD/2QI8R9cx3eDGcPGzY372Ps0?=
 =?us-ascii?Q?5VNsmNrMBZdCU3RUgkGl7+fFHRpuT3Rd9x1S4ayTXSSa+T0ynIqApzF/OcOY?=
 =?us-ascii?Q?sdCxJfTclXYUjJju8g4FgHU606b87I7TLNHQqxkVOy1LhEYuXv0hLNW4k+AB?=
 =?us-ascii?Q?FRBursuFmCcwL3xsGPjscvnrwSF0EpkLRpVsuS2BeqZ/kE0seQ0mUqKdhFZE?=
 =?us-ascii?Q?GIv0FXY48FaDcMKgwcz7+ELmBb+SJvQ2f7qb20APpLypKVeo/zEhFbL2JZgY?=
 =?us-ascii?Q?eswliSKPJNf0xIP+YDOuzKl+Z7F4DzbH0wXJRZiei0y0kUItze3Ifjx4KkfM?=
 =?us-ascii?Q?GwDXroOVGrmoKCHt5JHR0FrKlpGdreN6wHS2xIHegTUkBPDJ2Dsg/E/JjJN3?=
 =?us-ascii?Q?RYOkLVTGz6X2nwj9CEb0g5cszF6gzwfAyLzpf1vAWw8vriyijjiEiQCHoj81?=
 =?us-ascii?Q?2p+Zzml96qaZ51RA60NTE0ovpcKrB+0PSOXSL9zVORvf9ELVySy2oKGJN85+?=
 =?us-ascii?Q?v/OszrVumhPVC8MZvArOIUBev4eKvVNYXi5F2XrUWW97vy+bbGvhi+S5BoUJ?=
 =?us-ascii?Q?0UyoUq9rxTTzfHSMMdOnWSFdReb40oba3faVd2F9K2DdRvKSAQnH5maQrm0I?=
 =?us-ascii?Q?IK4noCiPiyTxJYK3NkbXuoP0J20N7Daug90UD11HIU+tTyYHE0dSds8CnFCu?=
 =?us-ascii?Q?zEOdnIP3JfZcdXcjGzkHxBKf63GDGV/j8PQUhcoSQXDW4BTEgkfemLMr9sEN?=
 =?us-ascii?Q?MuFdTaZ4BRS6AOn+hIMUOSgFFUkkvJhUr5AuxAFwhXWA0ruRoxvDGYyI0xaQ?=
 =?us-ascii?Q?mm1I9099ChQ2lcHbedBRP1lVle+tEsG2qPqTipOftGvevdZK4PQgPhIFu3lH?=
 =?us-ascii?Q?q+EnINUMG3pvSp8nw5rPph2aP3eRahwf8/gw45nZOCUQ3ZhLH6R9+cZOnR40?=
 =?us-ascii?Q?DMEkr/oB+iO4cQyOzmV+9hNHwWFAXCVgDaq/MZHNWfu5qPP1mmIW66XA4MOU?=
 =?us-ascii?Q?vYflXQRsCrBxAgrDIHBbLOlKtOFA+/Kf4Mm7zimqnFRkfcmcEiHeN55ZTIXL?=
 =?us-ascii?Q?b63O53PBKqKjpvUJw7HvkNS5F/1rUJv/sqmAz2pCYoGDqcPWHNmLuGqfkRqP?=
 =?us-ascii?Q?PV/LU4M/zPUyirafxf/QXcr5BmIJKSbgB/WR861/gGLqkdHr2TNkUQPcdf7k?=
 =?us-ascii?Q?gWM8aTzi0LSmbVxHbw4AZHHIvQ44yX82lKEh24vSvq1inUSr6iwFG2GuqcyA?=
 =?us-ascii?Q?Lux2uNUn+ceYwimz0D0r4JQMc0V/2NQYgBNQuPT3/BdgglQsR+AYUPbHZrGU?=
 =?us-ascii?Q?aCm/f24GHvuOGwf01OK9m2PtXOJE/QiUgsG68LWcpSJp5Nroeal2OZusgx1q?=
 =?us-ascii?Q?p+BDaztPlMUCjJWa6DWdDHek4l23ETtv4/g4bgSQPkGADwG56BK0b8D3wpgS?=
 =?us-ascii?Q?WeamFg0ilwBtc4BTmgFzuezspgyyKBBFC0CkaW1YCblqmmRfn4snjAX8I97M?=
 =?us-ascii?Q?2ZpSfiI9Cj/EHD617nX2dwHTTw5+wtcluiQCUMuiABNJuD76JqL2EDfuhrJi?=
 =?us-ascii?Q?CGD96jb8D7v6SzC1SdCSKLdU3KBSrlGZdtrVgjyqKFswnqnciRqATT+tfe+K?=
 =?us-ascii?Q?mgbDmmLfpNSKwUgnACw0FCN5PARmqIU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3CAEF55E1809E04BB3064216F3A00FBE@namprd15.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27b46ea6-4fdd-47c6-ab1d-08da53049659
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2022 21:33:59.3155 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZNZk0AJcdQZRw4LJhknCP+6tT8QOgBS8zCrlUZkDkFUqq5rO1zUN5kMWafNoWDWD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3539
X-Proofpoint-ORIG-GUID: 1-uxUBEoRI6V9Uq-PFwn229VDePT-fs0
X-Proofpoint-GUID: 1-uxUBEoRI6V9Uq-PFwn229VDePT-fs0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-20_05,2022-06-17_01,2022-02-23_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=71706c1562=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MISSING_HEADERS=1.021, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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



> On Jun 18, 2022, at 3:03 AM, Samuel Thibault <samuel.thibault@gnu.org> wr=
ote:
>=20
> Hello,
>=20
> Peter Delevoryas, le mer. 15 juin 2022 18:05:24 -0700, a ecrit:
>> I think we probably need a new Slirp release
>> (4.8.0) and a switch statement here instead, right?
>>=20
>> So that we can preserve the behavior for 4.7.0?
>=20
> Yes, that's the idea.

Ok great, thanks!

>=20
> Samuel


