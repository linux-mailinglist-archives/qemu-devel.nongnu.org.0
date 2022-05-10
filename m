Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD96A521F21
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 17:37:03 +0200 (CEST)
Received: from localhost ([::1]:59208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noRv4-0001rx-Vj
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 11:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=212901e239=guohuai.shi@windriver.com>)
 id 1noRtc-0000rw-MT
 for qemu-devel@nongnu.org; Tue, 10 May 2022 11:35:32 -0400
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238]:36560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=212901e239=guohuai.shi@windriver.com>)
 id 1noRtZ-0007ne-NX
 for qemu-devel@nongnu.org; Tue, 10 May 2022 11:35:32 -0400
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24AAO4EM017626;
 Tue, 10 May 2022 15:35:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=S9ECvCN5vbSxoo+BaMI0uE0sKS+ZqGeJRh4orCfav68=;
 b=l5ZnPsRwbr0scS4/cU4KRCqT7jlNNf9d4SZ3LvbfRGFydBzl32Kn9COY7LS4amupKQrY
 G2huTkzBioIrKoXnwmyh9D3Fiu37W4qChxtTmWG8l1IguDn8XmdU9Bf365BgnO9hxzNe
 BYOmNx58lLhm+kbF1zQxwus9t1v50XPwc0NoVjfs/uAnldG2btVyNR8emId0vP8hVwp8
 KHdBz326DUKcUeWNnhJqk5oSPntVvR6Wh/r9numPxSxh2jiEgaQCVn/isllPPeoYHAK7
 yQ8fXP8/cJzrsLY8iK1WQeuozxixGdZ4mv7zFoJ6S9v5PoTKUiSxf+5sY/KtZ0sC+vOA 7Q== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fwfr8aam7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 15:35:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=InZtaTAzTA3es/OLClyIa/dki5freQyPtUtSfg2xeRTA5RA/qtMgb/tLNLaE1Yn+3187++S6jtj9TmlMP4LL/FvyFIpcFgrED+cwe/CcL9OHSV7siKhXLkfkY4MaMuJVzmKnvFg0OEv6wsJneqcaeZiqW+9pZA/4kxbbY/+i3HCpIU2YZaerbfZCWwucIf6WelmioT4ymuBYRD9WDj0SE+/FxavZypOfgfy+cgE3/T3vUgSDUXGWwas2EBQ7T4IceCWxK0yJ+0OuV9V6s1xQgOxRDb3SiEfIH7xK7SP0iWqO9rZp+E+V4whL4apnOBCIOvRjsVL+7b4t0/FIxiM4+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S9ECvCN5vbSxoo+BaMI0uE0sKS+ZqGeJRh4orCfav68=;
 b=lr61q8Z0+aBZg8kfek97o3HR5sQS8QOU65hFEjJuORi2XNxFiLdVQbjAKQrYmEDqzaBBZibkQRxp/NyMm95Ty/6ZObOZa2ePE0Wo5qsIiIrWIWRGZM0QCrPaA5p65bT0CVYkrCp4D1tHa2vir+zEtV+fTzAk9Bq1rILvGW5/P4GnWvm4s0FNURtFSuJHcPM7ouXbVZ5NM5mjXzgn21pS5Poxj5xrqoO30I7oV5/uhE8hey/SADtDevZSQ9aN91KjcXP4LQxw49vgUqCIEkMRT8S9X6WSXQ9lV7Ksx9pcatxnUoWRWBsAaw9+frfa42DCzKWVCWsVqUTZnuYo4u7mUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN2PR11MB4173.namprd11.prod.outlook.com (2603:10b6:208:137::20)
 by DS7PR11MB6248.namprd11.prod.outlook.com (2603:10b6:8:97::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Tue, 10 May
 2022 15:35:10 +0000
Received: from MN2PR11MB4173.namprd11.prod.outlook.com
 ([fe80::bd41:bd4b:f230:3725]) by MN2PR11MB4173.namprd11.prod.outlook.com
 ([fe80::bd41:bd4b:f230:3725%6]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 15:35:10 +0000
From: "Shi, Guohuai" <Guohuai.Shi@windriver.com>
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Meng, Bin"
 <Bin.Meng@windriver.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: RE: [PATCH 5/9] hw/9pfs: Add a 'local' file system backend driver for
 Windows
Thread-Topic: [PATCH 5/9] hw/9pfs: Add a 'local' file system backend driver
 for Windows
Thread-Index: AQHYWLCcWsfI4/Y1i0icMWaeEyy3Ca0WsPoAgAAF9MCAABkNAIAAnX7AgAAJSRCAAIZ3gIAAGuIAgAAdbgCAAAbPAIAACGQAgAAPjmA=
Date: Tue, 10 May 2022 15:35:10 +0000
Message-ID: <MN2PR11MB4173011DDC017F9A414382BEEFC99@MN2PR11MB4173.namprd11.prod.outlook.com>
References: <20220425142705.2099270-1-bmeng.cn@gmail.com>
 <2718865.3NRaeQn5QO@silver>	<20220510154006.63c2ed23@bahia>
 <2077078.oMYteGReol@silver> <20220510163430.410536f5@bahia>
In-Reply-To: <20220510163430.410536f5@bahia>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7cd20212-3080-4b0c-f191-08da329aab07
x-ms-traffictypediagnostic: DS7PR11MB6248:EE_
x-microsoft-antispam-prvs: <DS7PR11MB6248996FBD69E4C7FC045830EFC99@DS7PR11MB6248.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YlEp/4yc7O0qJ6DDf/mtHr/O/OZJaHshV1YQ4UZC8ukDsxzGbTgZaBVhW89DiesAsmbvigAEonRppwHfTN+lXUr9siMawNrFMkR3Y7p9lQw3XJ5rguJsa6uRq46E6hWxBIX+h3Jlg62m4r7MIjEzQafekX2hJpQUAix/EJJfpl02/oPJ/p6gBIhLyo1VBVb2s9mju6Fg/Y5njiUDi/8vnefiRAqjXWGx+SEWPU/wFgbk+W0KCgCR/aKSC6L9N3VL2tdK6v7XAu/JMW3z8tFYfD/IQDgVaHEKYyBSWv8tD6t9WBRTNAhvGbUxvhG2+aKxgdEPKdR6JxZkDAK4tcO1kUAThBcCILpPF6H9e/c7h8orKyB/SlYZLMzogo3++epCsgRYcHnLTtjsyDSIs1E4JVZ+PXoNWdDI0RWlDOmUi/OC/rUMcgujiw1YBDlaIKA8mkibb8cvgI0Zgtmawce1uhgiWiX0StTcVMCn5wdofoNWiX/W7v2os2YdZRVSRGiwh0tQpJRsUmFBnP15o1kWZJYDk3/fPONxW+QNDDqnyDfYaszUvZOs2Zby6sX1+RikAdX/Lx7baBVHDiVxJ3ERAMs+wUfuC0PltY5PsEuIi3mW9QI+V8g6BRvhwWp6ajy9zPskz2DjWuINEx9+tWYY29FTWQ3S445qdD0ZJ44g7Q3n1FUcteGjUX7m8dp982COvgnWWzerDOSGFitgD+hkWUQMiltXT5MbNWhN+qMkG8NCmL2eDIwzcOkebG/Zm+INSk4IqSX5qBD22vccXTrMyio3KZt/pQBh++CNPbOdIuOgRPc2MJzCQAj0AbTgyXgkr2ghN4IZGgVqd0tJxX0AEw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4173.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(55016003)(2906002)(52536014)(33656002)(8936002)(5660300002)(66476007)(64756008)(66556008)(8676002)(66946007)(66446008)(4326008)(76116006)(38100700002)(110136005)(83380400001)(54906003)(186003)(966005)(86362001)(38070700005)(9686003)(26005)(53546011)(7696005)(6506007)(316002)(122000001)(71200400001)(508600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?SFNBTDBEZDlKZFlxaFAwWTRlSDg3aHVydEFJNi9kbjhvSnJSM2ZTS1VBTEVK?=
 =?gb2312?B?SHJvVVcySkNxTFpPN29tNEZvVWs1eG1EYlNWemtrc1NjbG9HK3FJc2NLSlls?=
 =?gb2312?B?ZHlOV2VOYk5pSFROelRqQkRiNkd1K2syWEw2eDRnYi9oTUk3YkNGVVIvWE9M?=
 =?gb2312?B?ajJveWxaSDVXdkZnaWJCYWFQSkVIZFErZEJBZTd5ZklmeEcxSDR2KzFIQmtV?=
 =?gb2312?B?eTQ2MjcvODhEVGhRaHZGalEwdFhSbzNaQSszdUZqdHBkQzAyMVhuZG9Ub1Yr?=
 =?gb2312?B?d3FXWmFaQkpyWTZUNUpoUW9VS1lnOVdKSXJkck9EdXRKU0hoajg1SzFzaTF4?=
 =?gb2312?B?dTZHTXdkSjdlUE1UMENyZ0RqVER4dEIyd1hjSjRneTVCQlNCdUZyV3Rvdk1t?=
 =?gb2312?B?ZDVDU25Ka1pQdWJzQ1d5UWcxWGl5cm9hTW5sUVVFNEliRmZ0ME03VThucUlP?=
 =?gb2312?B?dHpiZmpSTCsyTjh5M0p0UEUyWk1UeHRMaUtWWjFkVGk1bHNCL05WdGF5ZjFL?=
 =?gb2312?B?cDFCMTZoaVR0WTR2YnQ0Vm1SMHJ2S3dGNlhQZ3lJTHRORVFKY1BMRW1WMC9I?=
 =?gb2312?B?QjlMczZDNzJYVWtJZ05mK2RQbVNIODJKQ2ZEZEtSTFN3aVoxQk1YMjVPRE0v?=
 =?gb2312?B?Q1NyVUU5TlYzL2tNVzhDc1ZHRVZrZi8wR0JJRk1jZE44Mk5PYzJwaGVQd3Vt?=
 =?gb2312?B?RDMvbXVTU1FSMkVhTDRnNWExYlF0V1pMYlFiZzB3NmJUamdaL2VuaHBVMUky?=
 =?gb2312?B?V3d5WHc1Y0lEMktMV1JzTWNteStJa0lkbVlZNDRjYVhub1FCQUFDSjNoc0xG?=
 =?gb2312?B?WExDRUxDTkdkVWhuZzRyMDNqK2dieXNzWGtsSCtkOUNkSmt6ZXdYWnhsNHlZ?=
 =?gb2312?B?alNjTVNSNjk3K1VEcThZUHNxRzd2ajVMQkluQUlPRjROYTBYajhqTzQzcmlp?=
 =?gb2312?B?bDRrc1Z5RWRyMlF4V1VPZ2FmL1U0SVhEbzlKREN3NWN5T2pvK3hIU0V0TEhE?=
 =?gb2312?B?SGlzNTdjMUxxaXAwaWNLc1BlampobE5XZmQ2Z1BDVXRWSEVwdWpCZU84UUtt?=
 =?gb2312?B?RmprTlF5dWpGb0Jld0V1SWhLZi80bkZsMU1QQ3NoVUk5TXZCcEt6Q2s2MHlB?=
 =?gb2312?B?Njd3N2liWXB0UnBmejdxekpIKzVUY0ZNMldiQmxPZDVxZEhIK3ZtQWxxMDJN?=
 =?gb2312?B?QWxtQ3AzYVp2cnJzQ0Eza2ExOWZTQVdEM0dvVTErcDA1bmxQY2hDcEF5NUhp?=
 =?gb2312?B?TFlPd3ZIamNIQTU2blpiaWpVVFhTeWt4RW1MUDJpQ3RKdEhIdTIyMDdMNi92?=
 =?gb2312?B?MDQ5RmxPVTJVT1BERGkyQk52TURDNElvbmhLTGEzSHdzdG5abnkrd1JCOEdU?=
 =?gb2312?B?eDZ1VWEzcTh5T2hPcFlsb1dTazljb3RnL2VGdG8rRHBYOEpUYWpvanpEL3ha?=
 =?gb2312?B?aktMUXYzUnlianBxUytOelF0TTZvRW85SmJmY1BrR1R1UlVTT21QK1JSUVZm?=
 =?gb2312?B?RjNCaUZDOVFSdnNqUzBKWG9OV2dQMThoeWZOMHgxVno1bFoxUDZBN3F0ZDVq?=
 =?gb2312?B?Mk90ZW1wMVA3VUxqTmJtZDRtc0Q1cjNZcXFGSXgxYmRXQzZDVUNEcFYzaWJw?=
 =?gb2312?B?dkVCRXNZR2hPMDRGay9vR2VWTHhTWEpkdnQ4QmwzRVJtdDkyRTJkL1pKZW44?=
 =?gb2312?B?ZjJBVUZTRU9xTHphQVpGQ0Z0TjUxSTIvQjZ3c2hSaFlYMWFGb3dPN2svdWk0?=
 =?gb2312?B?em40dWNVT3F1b0I0cFpwVzJBbzFjK3FLOGRtMVhVc2VWeXdhZnJhQTZFc3Mz?=
 =?gb2312?B?eENYV2lxSzNtQWR4RlVrUGs0TFNQRGhYRmRtM2M1bkpTTmJteEsrQWJicFZv?=
 =?gb2312?B?YTNPY3VHN2NFTVBtS0NjbHZ4cmdHT1p2aHdxem43NUJPcTNna2dMekh4Lytw?=
 =?gb2312?B?Yy9zdENKOE1ERllIZUt2dFJRclpZRVN0eFRKN2VhMU9DejI4QXFrRmhGRTVF?=
 =?gb2312?B?SjA1Mmx2V2xNcmc2OTVZdHErMUt3cGczZzFNamRqYnZ4SHg4aUsvYzBmTkdC?=
 =?gb2312?B?ditzZXllSmM4d05ML296dldWU3VmUEFSZ0pyMHhyU0lURHhhcU9FLzkyVHdk?=
 =?gb2312?B?OGdqRlhZNUdaK3NuU2svdkVFaThSVmFBTXpmZnV2MEpFYlFKZUF0MFZNTE1v?=
 =?gb2312?B?Y3JidnBFKzZCTUc5M1NEVlYwRk9XMks5Z3ZYSHVNQkx1OUV0bVJmVEUvc2hX?=
 =?gb2312?B?NkthT3ZTTWlWMFFCVFVEZXJXYlRDVFl6dzRWTUpUTzI5MkJ4QWNKMUYxNHpx?=
 =?gb2312?B?aS83SE5Tc3V1RGxMMENIbS9VNm1JYnczaFVBb3hoWnVnNTZYWG9paHJVc1Vh?=
 =?gb2312?Q?eBgf+tJ+gQhmIkxg=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4173.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cd20212-3080-4b0c-f191-08da329aab07
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2022 15:35:10.1810 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fy6gWQC61JqCcn6maVDVMP3B8TPof+E95lfSu5X3LdmbIA1BmOWbhXQvBBEcfXYOHe1NUR79HUmxGqSKq3U5xUxKpUmD+BqGRa/GaVO7Xlo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6248
X-Proofpoint-ORIG-GUID: vfU-X_Cynkh0PaV2XmPeCvoaWXbEXTYa
X-Proofpoint-GUID: vfU-X_Cynkh0PaV2XmPeCvoaWXbEXTYa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-10_04,2022-05-10_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=636 lowpriorityscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205100070
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=212901e239=guohuai.shi@windriver.com;
 helo=mx0b-0064b401.pphosted.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

TGV0J3MgZm9yY2Ugb24gdGhlIHNlY3VyaXR5IGlzc3VlOg0KDQpGaXJzdGx5LCB0aGlzIGFuc3dl
ciAoIGh0dHBzOi8vc3RhY2tvdmVyZmxvdy5jb20vcXVlc3Rpb25zLzMyMTM4NTI0L2lzLXRoZXJl
LWEtd2luZG93cy1lcXVpdmFsZW50LW9mLW9wZW5hdCApIGlzIHVzZWxlc3MgZm9yIFFFTVUuDQpJ
dCB1c2VzIFdpbmRvd3MgbmF0aXZlIEFQSSBOdENyZWF0ZUZpbGUoKSBhbmQgYWNjZXNzZXMgZmls
ZXMgYnkgV2luZG93cyBoYW5kbGUuIA0KQnV0IDlQRlMgaXMgdXNpbmcgV2luZG93cyBQT1NJWCBp
bnRlcmZhY2UsIGhhbmRsZSBjYW4gbm90IGJlIHVzZWQgaW4gUE9TSVggaW50ZXJmYWNlLg0KQWN0
dWFsbHksIFdpbmRvd3MgcHJvdmlkZSBzaW1pbGFyIEFQSXMgbGlrZSBHZXRGaW5hbFBhdGhOYW1l
QnlIYW5kbGUoKS9HZXRGaWxlSW5mb3JtYXRpb25CeUhhbmRsZSgpLg0KSXQgY2FuIGFsc28gZ2V0
IGZpbGUgaW5mb3JtYXRpb24gYnkgV2luZG93cyBoYW5kbGUuDQoNCldpbmRvd3MgUE9TSVggaW50
ZXJmYWNlIGRvIG5vdCBzdXBwb3J0IE5PX0ZPTExPVyBmbGFncywgdGhhdCBtZWFucywgV2luZG93
cyBQT1NJWCBvcGVuKCkgYWx3YXlzIHRyYW5zbGF0ZSBzeW1ib2xpYyBsaW5rLg0KDQpTbyBldmVy
eXRoaW5nIGFyZSBmaW5hbGx5IHBvaW50IHRvIG9uZSBsaW1pdGF0aW9uOiBXaW5kb3dzIFBPU0lY
IGludGVyZmFjZXMgZG8gbm90IHN1cHBvcnQgc3ltYm9saWMgbGluayBhbmQgYWx3YXlzIHRyYW5z
bGF0ZSBsaW5rLg0KDQpGb3IgdGhlIHNlY3VyaXR5IHJlYXNvbiwgSSB0aGluayBpdCBpcyByZWFz
b25hYmxlIHRvIGRpc2FibGUgc3ltYm9saWMgbGluayBzdXBwb3J0IG9uIFdpbmRvd3MgaG9zdCBm
b3IgOVBGUy4NCkkgY2FuIHJlLXdvcmsgdGhpcyBwYXRjaCB0byBhZGRpbmcgYSBzeW1ib2xpYyBs
aW5rIGNoZWNrIGR1cmluZyBwYXRoLXdhbGsgb3BlcmF0aW9uIGFuZCBzdG9wIGl0IHdoZW4gZ2V0
IGEgc3ltYm9saWMgbGluay4NCg0KQmVzdCBSZWdhcmRzLA0KR3VvaHVhaQ0KDQo+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEdyZWcgS3VyeiA8Z3JvdWdAa2FvZC5vcmc+DQo+
IFNlbnQ6IDIwMjLE6jXUwjEwyNUgMjI6MzUNCj4gVG86IENocmlzdGlhbiBTY2hvZW5lYmVjayA8
cWVtdV9vc3NAY3J1ZGVieXRlLmNvbT4NCj4gQ2M6IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgTWVu
ZywgQmluIDxCaW4uTWVuZ0B3aW5kcml2ZXIuY29tPjsgQmluIE1lbmcNCj4gPGJtZW5nLmNuQGdt
YWlsLmNvbT47IFNoaSwgR3VvaHVhaSA8R3VvaHVhaS5TaGlAd2luZHJpdmVyLmNvbT4NCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCA1LzldIGh3LzlwZnM6IEFkZCBhICdsb2NhbCcgZmlsZSBzeXN0ZW0g
YmFja2VuZCBkcml2ZXIgZm9yDQo+IFdpbmRvd3MNCj4gDQo+IFtQbGVhc2Ugbm90ZTogVGhpcyBl
LW1haWwgaXMgZnJvbSBhbiBFWFRFUk5BTCBlLW1haWwgYWRkcmVzc10NCj4gDQo+IE9uIFR1ZSwg
MTAgTWF5IDIwMjIgMTY6MDQ6MjggKzAyMDANCj4gQ2hyaXN0aWFuIFNjaG9lbmViZWNrIDxxZW11
X29zc0BjcnVkZWJ5dGUuY29tPiB3cm90ZToNCj4gDQo+ID4gT24gRGllbnN0YWcsIDEwLiBNYWkg
MjAyMiAxNTo0MDowNiBDRVNUIEdyZWcgS3VyeiB3cm90ZToNCj4gPiA+IE9uIFR1ZSwgMTAgTWF5
IDIwMjIgMTM6NTQ6NDYgKzAyMDANCj4gPiA+DQo+ID4gPiBDaHJpc3RpYW4gU2Nob2VuZWJlY2sg
PHFlbXVfb3NzQGNydWRlYnl0ZS5jb20+IHdyb3RlOg0KPiA+ID4gPiBPbiBEaWVuc3RhZywgMTAu
IE1haSAyMDIyIDEyOjE4OjMzIENFU1QgQ2hyaXN0aWFuIFNjaG9lbmViZWNrIHdyb3RlOg0KPiA+
ID4gPiA+IE9uIERpZW5zdGFnLCAxMC4gTWFpIDIwMjIgMDQ6MTc6NDQgQ0VTVCBTaGksIEd1b2h1
YWkgd3JvdGU6DQo+ID4gPiA+ID4gWy4uLl0NCj4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ID4g
PiBJIHRlbmQgdG8gYWdyZWUgd2l0aCBDaHJpc3RpYW4ncyByZW1hcmtzIHRoYXQgdGhpcw0KPiA+
ID4gPiA+ID4gPiA+ID4gPiBwYXRjaCBpcyB0b28gYmlnIGFuZCB0aGF0IHRoZSBjaG9pY2Ugb2Yg
aW50cm9kdWNpbmcNCj4gPiA+ID4gPiA+ID4gPiA+ID4gcmlnaHQgYXdheSBhIG5ldyBpbXBsZW1l
bnRhdGlvbiBvZiA5cC1sb2NhbCBmb3INCj4gPiA+ID4gPiA+ID4gPiA+ID4gd2luZG93cyBob3N0
cyBpcyB0b28gYm9sZCB0byBzdGFydCB3aXRoLiBXZSBuZWVkIHRvDQo+ID4gPiA+ID4gPiA+ID4g
PiA+IGNsZWFybHkgdW5kZXJzdGFuZCB3aGF0J3MgZGl2ZXJnaW5nIGJldHdlZW4gd2luZG93cw0K
PiA+ID4gPiA+ID4gPiA+ID4gPiBhbmQgbGludXggaW4gb3JkZXIgdG8gbWFrZSBzdWNoIGEgZGVj
aXNpb24uIFlvdSBzaG91bGQNCj4gPiA+ID4gPiA+ID4gPiA+ID4gZmlyc3QgdHJ5IHRvIGludHJv
ZHVjZSB0aGUgcmVxdWlyZWQgYWJzdHJhY3Rpb25zIHRvDQo+ID4gPiA+ID4gPiA+ID4gPiA+IGNv
cGUgd2l0aCB0aGVzZSBkaWZmZXJlbmNlcywgc28gdGhhdCB3ZSBjYW4gcmV2aWV3Lg0KPiA+ID4g
PiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+IEhlcmUgaXMgdGhlIGJhc2ljIGludHJvZHVj
dGlvbnMgb2YgOVBGUyBmb3IgV2luZG93cyBkZXZlbG9wbWVudDoNCj4gPiA+ID4gPiA+ID4gPiA+
DQo+ID4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+
IFdpbmRvd3MgYWx3YXlzIHJldHVybnMgLTEgd2hlbiB0cnkgdG8gY2FsbCBvcGVuKCkgZm9yIGEN
Cj4gPiA+ID4gPiA+ID4gPiA+IGRpcmVjdG9yeS4NCj4gPiA+ID4gPiA+ID4gPiA+IFdpbmRvd3Mg
KGFjdHVhbGx5IE1pbkdXIGxpYnJhcnkpIG9ubHkgYWxsb3dzIG9wZW5kaXIoKQ0KPiA+ID4gPiA+
ID4gPiA+ID4gZm9yIGEgZGlyZWN0b3J5Lg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gVGhhdCBtaXNz
aW5nIGJlaGF2aW91ciBjb3VsZCBiZSBpbXBsZW1lbnRlZCBpbiA5cC11dGlsLXdpbi5jLA0KPiA+
ID4gPiA+IHNpbWlsYXIgdG8gdGhlIG1pc3NpbmcgYmVoYXZpb3VycyBvZiBta25vZGF0KCkgZm9y
IG1hY09TIHdoaWNoDQo+ID4gPiA+ID4gZGlkIG5vdCBzdXBwb3J0IGEgYnVuY2ggb2YgdGhpbmdz
IGxpa2UgY3JlYXRpbmcgYSBVTklYIHNvY2tldCBmaWxlIGFuZA0KPiBtb3JlOg0KPiA+ID4gPiA+
DQo+ID4gPiA+ID4gaHR0cHM6Ly9naXRodWIuY29tL3FlbXUvcWVtdS9jb21taXQvMDU1YWI4OTMy
N2JhYjgzZjFiZDA3ZTlkZTA3Zg0KPiA+ID4gPiA+IDc2Mjg2NDNkDQo+ID4gPiA+ID4gM2Q4ZD4g
Pg0KPiA+ID4gPiA+ID4gPiA+IERvZXMgTWluR1cgaGF2ZSBkaXJmZCgpID8NCj4gPiA+ID4gPiA+
ID4NCj4gPiA+ID4gPiA+ID4gTm8uDQo+ID4gPiA+ID4gPiA+IE1pbkdXIGRvZXMgbm90IG9wZW4g
YW55IGRpcmVjdG9yeS4NCj4gPiA+ID4gPiA+ID4gSGVyZSBpcyBvcGVuZGlyKCkgc291cmNlIGNv
ZGUgb2YgTWluR1c6DQo+ID4gPiA+ID4gPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9taXJyb3IvbWlu
Z3ctdzY0L2Jsb2IvbWFzdGVyL21pbmd3LXc2NC1jcg0KPiA+ID4gPiA+ID4gPiB0L21pc2MvZA0K
PiA+ID4gPiA+ID4gPiBpcmVuDQo+ID4gPiA+ID4gPiA+IHQuDQo+ID4gPiA+ID4gPiA+IGMjTDQy
DQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IFNvIE1pbkdXIGRvIG5vdCBoYXZlIGEgZmQg
YXNzb2NpYXRlZCB0byBhIGRpcmVjdG9yeS4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4g
PiA+IFdpbmRvd3MgZG9lcyBub3Qgc3VwcG9ydCBBUElzIGxpa2UgIiphdCIgKG9wZW5hdCgpLA0K
PiA+ID4gPiA+ID4gPiA+ID4gcmVuYW1lYXQoKSwNCj4gPiA+ID4gPiA+ID4gPiA+IGV0Yy4pDQo+
ID4gPiA+ID4NCj4gPiA+ID4gPiBMaWtlIGFscmVhZHkgc3VnZ2VzdGVkIGJlZm9yZSBvbiB5b3Vy
IHByZXZpb3VzIFJGQyB2ZXJzaW9uLCBpdA0KPiA+ID4gPiA+IGlzIHBvc3NpYmxlIHRvIHVzZSB0
aGUgc2FtZSB3b3JrYXJvdW5kIGFzIHdlIGFyZSB1c2luZyBmb3IgbWFjT1MNCj4gPiA+ID4gPiBo
b3N0cyBhbHJlYWR5ICh3aGljaA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gd2FzIG1pc3NpbmcgbWtu
b2RhdCgpKToNCj4gPiA+ID4gPiAgIHB0aHJlYWRfZmNoZGlyX25wKC4uLikNCj4gPiA+ID4gPiAg
IG1rbm9kKC4uLikNCj4gPiA+ID4gPg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gaHR0cHM6Ly9naXRo
dWIuY29tL3FlbXUvcWVtdS9ibG9iL21hc3Rlci9ody85cGZzLzlwLXV0aWwtZGFyd2luLg0KPiA+
ID4gPiA+IGMjTDg0DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBTbyBvbiBXaW5kb3dzIGl0IHdvdWxk
IGJlIHZpYWJsZSB0bzoNCj4gPiA+ID4gPiAgIGNoZGlyKC4uLikNCj4gPiA+ID4gPiAgIG9wZW4o
Li4uKQ0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gVGhlIHNhbWUgYXBwcm9hY2ggY291bGQgYmUgdXNl
ZCBmb3IgYW55IG1pc3NpbmcgKmF0KCkgZnVuY3Rpb24NCj4gPiA+ID4gPiBmb3IgV2luZG93cy4N
Cj4gPiA+ID4NCj4gPiA+ID4gUHJvYmxlbSB0aG91Z2ggaXMgdGhhdCB0aGUgY2hkaXIoKSBmdW5j
dGlvbnMgb24gV2luZG93cyBhbGwgc2VlbQ0KPiA+ID4gPiB0byBoYXZlIHByb2Nlc3Mtd2lkZSBl
ZmZlY3QsIHdlIHdvdWxkIG5lZWQgdG8gY2hhbmdlIHRoZSBjdXJyZW50DQo+ID4gPiA+IGRpcmVj
dG9yeSBvbmx5IGZvciB0aGUgY3VycmVudCB0aHJlYWQsIGJlY2F1c2UgZmlsZXN5c3RlbSBhY2Nl
c3MNCj4gPiA+ID4gb2YgOXAgc2VydmVyIGlzIG11bHRpLXRocmVhZGVkLg0KPiA+ID4gPg0KPiA+
ID4gPiBQcm90ZWN0aW5nIHRoZSBjaGRpcigpOyBmb28oKTsgY2FsbHMgYnkgYSBwcm9jZXNzIHdp
ZGUgZ2xvYmFsDQo+ID4gPiA+IG11dGV4IGlzbid0IHZlcnkgYXBwZWFsaW5nIGVpdGhlci4gOi8N
Cj4gPiA+DQo+ID4gPiBBbmQgaXQgd291bGRuJ3QgYmUgc2FmZSBhbnl3YXkgYmVjYXVzZSBJJ20g
cHJldHR5IHN1cmUgdGhhdCB0aGUgcmVzdA0KPiA+ID4gb2YgdGhlIFFFTVUgY29kZSBhc3N1bWVz
IHRoYXQgdGhlIGN1cnJlbnQgZGlyZWN0b3J5IGlzIGludmFyaWFudCwgZS5nLg0KPiA+ID4gdXNl
ciBjb3VsZCBiZSB2ZXJ5IGNvbmZ1c2VkIGJ5ICdkcml2ZV9hZGQgZmlsZT0uL2Zvby5pbWcnIG5v
dCB3b3JraW5nLg0KPiA+ID4NCj4gPiA+IEJUVyBkdWNrZHVja2dvIGdpdmVzOg0KPiA+ID4NCj4g
PiA+IGh0dHBzOi8vc3RhY2tvdmVyZmxvdy5jb20vcXVlc3Rpb25zLzMyMTM4NTI0L2lzLXRoZXJl
LWEtd2luZG93cy1lcXVpDQo+ID4gPiB2YWxlbnQtbw0KPiA+ID4gZi1vcGVuYXQNCj4gPiA+DQo+
ID4gPiBTbyB5ZXMgaXQgc2VlbXMgdG8gYmUgdGVjaG5pY2FsbHkgcG9zc2libGUgdG8gaW1wbGVt
ZW50ICphdCgpDQo+ID4gPiBmdW5jdGlvbnMgb24gd2luZG93cy4gVGhpcyBpcyB0aGUgb25seSB3
YXkgdG8gYXZvaWQgQ1ZFLTIwMTYtOTYwMiBpbg0KPiA+ID4gdGhlIFFFTVUgcHJvY2Vzcy4NCj4g
Pg0KPiA+ICsxDQo+ID4NCj4gPiA+IEFub3RoZXIgb3B0aW9uIGlzIHRvIHVzZSB0aGUgcHJveHkg
YmFja2VuZCA6IHRoaXMgb2ZmbG9hZHMgYWxsIGZzDQo+ID4gPiBhY2Nlc3NlcyB0byBhbiBleHRl
cm5hbCBwcm9jZXNzIHJ1bm5pbmcgdmlydGZzLXByb3h5LWhlbHBlciwgdGhhdA0KPiA+ID4gcnVu
cyBwcml2aWxlZ2VkIGFuZCBjaHJvb3QoKSBpbnRvIHRoZSBzaGFyZWQgZGlyZWN0b3J5IHNvIHRo
YXQgaXQNCj4gPiA+IGNhbiBzYWZlbHkgdXNlIHBhdGggYmFzZWQgc3lzY2FsbHMuDQo+ID4NCj4g
PiBBcyBhIHZlcnkgbGFzdCByZXNvcnQsIG1heWJlLiBCdXQganVzdCBmb3IgdGhlIG90aGVyIHR3
byBndXlzIHRvIGtub3cgdXBmcm9udDoNCj4gPiB0aGUgcHJveHkgYmFja2VuZCBpcyB2ZXJ5IHNs
b3cgYW5kIG5vdCBpbiBnb29kIHNoYXBlLiBUaGVyZSB3ZXJlIHBsYW5zDQo+ID4gdG8gZGVwcmVj
YXRlIHRoZSBwcm94eSBiYWNrZW5kIHRoZXJlZm9yZSwgYXMgaXQncyBtb3JlIG9yIGxlc3MgZGVh
ZC4NCj4gPg0KPiANCj4gWWVhaCBhcyBtZW50aW9uZWQgYmVmb3JlLCB0aGUgd2F5IHRvIGdvIG5v
dyB3b3VsZCBiZSB0byBjb21lIHdpdGggYSB2aG9zdC11c2VyDQo+IGltcGxlbWVudGF0aW9uIGxp
a2UgdmlydGlvZnNkLiBUaGlzIHdvdWxkIGFkZHJlc3MgYWxsIHBlcmYgcHJvYmxlbXMgd2UgaGF2
ZSB3aXRoDQo+IHByb3h5IHNpbmNlIHRoZSBjbGllbnQgd291bGQgZGlyZWN0bHkgdGFsayB0byB0
aGUgZXh0ZXJuYWwgcHJvY2Vzcy4gVGhpcyBzaG91bGQNCj4gYWxzbyBwcm92aWRlIGJldHRlciBw
ZXJmIHRoYW4gdGhlIGxvY2FsIGJhY2tlbmQgc2luY2UgaXQgd291bGRuJ3QgaGF2ZSB0byBkbyBk
bw0KPiB0aGUgImF0KigpIg0KPiBkYW5jZSB0aGFua3MgdG8gY2hyb290KCkuDQo+IA0KPiA+ID4g
PiA+ID4gPiA+IE91Y2guLi4NCj4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ID4gU28g
OVBGUyBjYW4gbm90IHVzZSBhbnkgb3BlbmF0KCkgZm9yIG9wZW5pbmcgYSBzdWIgZmlsZQ0KPiA+
ID4gPiA+ID4gPiA+ID4gb3IgZGlyZWN0b3J5IGluIDlQDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+
ID4gPiA+IG1vdW50DQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gZGlyZWN0b3J5Lg0K
PiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiBUaGlzIGNvbW1pdCB1c2UgbWVyZ2Vf
ZnNfcGF0aCgpIHRvIGJ1aWxkIHVwIGZ1bGwNCj4gPiA+ID4gPiA+ID4gPiA+IGZpbGVuYW1lIGJ5
IHN0cmluZw0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBjb25jYXRlbmF0aW9uLg0KPiA+
ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ID4gSSBrbm93IHRoYXQgbWF5IGhhdmUgYSByaXNr
IG9mIHNlY3VyaXR5LCBidXQgV2luZG93cw0KPiA+ID4gPiA+ID4gPiA+ID4gZG9lcyBmdWxseSBz
dXBwb3J0IFBPU0lYDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBZb3Ugd2lsbCBub3QgZmluZCBhbnli
b2R5IG1lcmdpbmcgY29kZSB0aGF0J3MgaW5oZXJlbnRseSBpbnNlY3VyZS4NCj4gPiA+ID4gPg0K
PiA+ID4gPiA+ID4gPiA+IEkgdW5kZXJzdGFuZCBmcm9tIHlvdXIgdmFyaW91cyBhbnN3ZXJzIHRo
YXQgc3ltbGlua3MNCj4gPiA+ID4gPiA+ID4gPiBhcmVuJ3QgY3VycmVudGx5IHN1cHBvcnRlZCBi
eSB3aW5kb3cncyBQT1NJWCBBUEkuIElzIHRoaXMgZm9yZXZlciA/DQo+ID4gPiA+ID4gPiA+ID4g
R29vZ2xlIGRvIG1lbnRpb25zIHN5bWxpbmtzIGluIHdpbmRvd3MgMTAuIFdoYXQncyB0aGUNCj4g
PiA+ID4gPiA+ID4gPiBzdG9yeSB0aGVyZSA/IEhvdyBkbyB0aGV5IGJlaGF2ZSA/IEhvdyB3b3Vs
ZCB0aGV5IGJlDQo+ID4gPiA+ID4gPiA+ID4gZXhwb3NlZCB0byB0aGUgY2xpZW50ID8gQmUgYXdh
cmUgdGhhdCwgZXZlbiBpZiB0aGUgY2xpZW50DQo+ID4gPiA+ID4gPiA+ID4gY2Fubm90IGNyZWF0
ZSBzeW1saW5rcywgYW4gZXhpc3Rpbmcgc3ltbGluayBjb3VsZCBiZSB1c2VkIHRvIGVzY2FwZQ0K
PiB3aXRoIHJlbmFtZSgpLg0KPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4NCj4gPiA+
ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+IElmIHRoZSBjb2RlICJtYXkgaGF2ZSBhIHJpc2sg
b2Ygc2VjdXJpdHkiIHRoZW4gaXQgbXVzdCBiZQ0KPiA+ID4gPiA+ID4gPiA+IGZpeGVkIG9yIGF2
b2lkZWQgaW4gc29tZSB3YXkgYmVmb3JlIGJlaW5nIG1lcmdlZCB1cHN0cmVhbS4NCj4gPiA+ID4g
PiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4g
PiBPdGhlciB0aGluZyB0aGF0IGNvbWVzIHRvIG1pbmQgaXMgdGhhdCB3aW5kb3dzIGhvc3RzDQo+
ID4gPiA+ID4gPiA+ID4gc2hvdWxkIG1heWJlIHVzZSB0aGUgbWFwcGVkIG9yIG1hcHBlZC1maWxl
IHNlY3VyaXR5IG1vZGVzDQo+ID4gPiA+ID4gPiA+ID4gc2luY2UgdGhleSBlbXVsYXRlIHN5bWxp
bmtzIHdpdGggYSBzaW1wbGUgZmlsZSBoaWRkZW4gaW4NCj4gPiA+ID4gPiA+ID4gPiB0aGUgVklS
VEZTX01FVEFfRElSIGRpcmVjdG9yeS4NCj4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+
DQo+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiBDaGVlcnMsDQo+ID4gPiA+ID4gPiA+
ID4NCj4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gLS0N
Cj4gPiA+ID4gPiA+ID4gPiBHcmVnDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IFdpbmRv
d3MgbmF0aXZlIEFQSSBzdXBwb3J0IHN5bWJvbGljIGxpbmsgZmlsZSBzdGFydCBmcm9tDQo+ID4g
PiA+ID4gPiA+IFdpbmRvd3MNCj4gPiA+ID4gPiA+ID4gVmlzdGE6DQo+ID4gPiA+ID4gPiA+IGh0
dHBzOi8vZG9jcy5taWNyb3NvZnQuY29tL2VuLXVzL3dpbmRvd3Mvd2luMzIvYXBpL3dpbmJhc2Uv
bg0KPiA+ID4gPiA+ID4gPiBmLXdpbmJhcw0KPiA+ID4gPiA+ID4gPiBlLWNyDQo+ID4gPiA+ID4g
PiA+IGVhDQo+ID4gPiA+ID4gPiA+IHRlcyB5bWJvbGljbGlua2ENCj4gPiA+ID4gPiA+ID4NCj4g
PiA+ID4gPiA+ID4gSSBtZWFuIFdpbmRvd3MgUE9TSVggQVBJcyBkbyBub3Qgc3VwcG9ydCBzeW1i
b2xpYyBsaW5rDQo+ID4gPiA+ID4gPiA+IChNaW5HVyB1c2UNCj4gPiA+ID4gPiA+ID4gV2luMzIN
Cj4gPiA+ID4gPiA+ID4gUE9TSVggQVBJcykgU28gd2UgY2FuIG5vdCBjcmVhdGUgc3ltYm9saWMg
bGluayBieSBNaW5HVy4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEEgZnVuY3Rpb24gd2l0aCBQT1NJ
WCBzaWduYXR1cmUgY291bGQgYmUgYWRkZWQgdG8gOXAtdXRpbC13aW4uYw0KPiA+ID4gPiA+IHdo
aWNoIHdvdWxkIGNhbGwgdGhlIG5hdGl2ZSBXaW5kb3dzIGZ1bmN0aW9uIHRvIGNyZWF0ZSBzeW1s
aW5rcy4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBBbnl3YXksIHRoZXJlIGlzIGFub3RoZXIg
c29sdXRpb246IHJlLXdvcmsgd2hvbGUgOVBGUyBjb2RlOg0KPiA+ID4gPiA+ID4gPiBub3Qgb25s
eSA5cC1sb2NhbC5jLCBidXQgYWxzbyBldmVyeSBmaWxlIGluIDlwIGRyaXZlci4NCj4gPiA+ID4g
PiA+ID4gUmVwbGFjZSBldmVyeSBNaW5HVy9QT1NJWCBBUElzIChlLmcuIG9wZW4sIGxzZWVrLCBy
ZWFkLA0KPiA+ID4gPiA+ID4gPiB3cml0ZSwgY2xvc2UpLCBieSBXaW5kb3dzIE5hdGl2ZSBBUElz
IChlLmcuIG9wZW4gLT4NCj4gPiA+ID4gPiA+ID4gQ3JlYXRlRmlsZSwgbHNlZWsgLT4gU2V0Rmls
ZVBvaW50ZXIsIHJlYWQgLT4gUmVhZEZpbGUsIHdyaXRlDQo+ID4gPiA+ID4gPiA+IC0+IFdyaXRl
RmlsZSwgY2xvc2UgLT4gQ2xvc2VIYW5kbGUsIGV0Yy4pIFRoZW4gOVAgY2FuIHVzZQ0KPiA+ID4g
PiA+ID4gPiBXaW5kb3dzIHN5bWJvbGljIGxpbmsgZmVhdHVyZS4NCj4gPiA+ID4gPiA+ID4gSG93
ZXZlciwgSSBkbyB0aGluayBpdCBpcyBhIGdvb2QgaWRlYSB0byByZXBsYWNlIGV2ZXJ5dGhpbmcu
DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gVFlQTzogaXQgTk9UIGlzIGEgZ29vZCBpZGVhIHRv
IHJlcGxhY2UgZXZlcnl0aGluZy4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFJpZ2h0LCB0aGF0IGRv
ZXMgbm90IG1ha2Ugc2Vuc2UuIFRoZSB3YXkgdG8gZ28gaXMgYWRkaW5nIGFuZA0KPiA+ID4gPiA+
IGltcGxlbWVudGluZyBtaXNzaW5nIHN5c3RlbSBmdW5jdGlvbnMgd2l0aCBQT1NJWCBzaWduYXR1
cmVzIGFuZA0KPiA+ID4gPiA+IFBPU0lYIGJlaGF2aW91ciBmb3IgV2luZG93cy4gTm90IHR1cm5p
bmcgdGhlIGVudGlyZSBjb2RlIGJhc2UNCj4gPiA+ID4gPiB1cHNpZGUgZG93bi4NCj4gPiA+ID4g
Pg0KPiA+ID4gPiA+IEJlc3QgcmVnYXJkcywNCj4gPiA+ID4gPiBDaHJpc3RpYW4gU2Nob2VuZWJl
Y2sNCj4gPg0KPiA+DQoNCg==

