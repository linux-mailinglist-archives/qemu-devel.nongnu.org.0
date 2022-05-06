Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D5351D1A8
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 08:51:30 +0200 (CEST)
Received: from localhost ([::1]:58968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmroG-0006lP-UD
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 02:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=21254367a6=guohuai.shi@windriver.com>)
 id 1nmrkL-00060S-Qn
 for qemu-devel@nongnu.org; Fri, 06 May 2022 02:47:25 -0400
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238]:60510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=21254367a6=guohuai.shi@windriver.com>)
 id 1nmrkJ-0003BR-2d
 for qemu-devel@nongnu.org; Fri, 06 May 2022 02:47:25 -0400
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2466QYPk020846;
 Thu, 5 May 2022 23:46:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=qEnwPdjjbzSr/CdiNez+BSvYSS9zsfPfdkup+rt0EEM=;
 b=C+wJXGmMX0TDCfElatkCnIOua+QKeg4Bv1oEkbOADAtS8eINJas0/phy4NqmnGF/lelg
 EvYxyaCMBYviOhDeC4SWkUfreaXC8SNfJvwPO1hDd9sEEfh9vFQGY+Z3jBEt/Ib9Jwwz
 zi7ZT80qaJ3WWWx4M/l2UVVzGVGLYTDurdyJdU2oyr7/WtDjZANVc1RqTgMlsuIs0xvA
 YLgbgMaDswZI0RAvbYW9Wemt8UZGpQj5LsBMIQkyStKirq+InwBKD+2jqWY6LmJ4jNAQ
 aO+2yXxFIv3py0n/kLhK8lxMSOKQZ4QcjiLeK71iK3hQCQtauGclK9zThlztd/YJE/Nv ug== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fs4mjc8k1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 23:46:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WtNPcehwLKnSOobgr83qg9Z7c7kdNVUr+aDzexrlHhk5Wgl27wpgOyKRq6CvPWVyeFrvQI156dVOckKUcEb1NUqU2DKZugOPNqXl4oKXxfRoom/P339K26qVMkkEGBwCLDTffhmcEICtSJylxc5j36spYgQfBy2iK3qKhclsvXsbAmaE3n8hdVLyEGREItQ7PltC350Ea6XHU8iOzRLZMSPhQqkXlXC2FZfd1GwQnxitt+uKb6Ur08J3UvUw8eOxyKctj/NI65yhfpQkwiWPEoJZEgLCFRlXmKOFpv6+2boJxpIbrSbhWGjwkf0OzwB4dZYxO9j2kIZiflvoSACaSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qEnwPdjjbzSr/CdiNez+BSvYSS9zsfPfdkup+rt0EEM=;
 b=Xt5jP4UB5iNORtPAq2cwiCL9SZaaEe1oEnBZDdF0z/2Z2El3FphFBF7D/2aHXn2CJgvWBYv9FMm8AgEJ3NLFYmF1aQ+l37iZM0GZv4ubGvbgpQTVoJQPoEu2srSKhNEPfa6jTNRAeTUpBLWElCk053wiLwm7xkCLtQ6J+bl5uimqqb4DMbaPkBbZl18HaH9t7ibym2I6U87M+5NKeFc+NNMZo1clJ8a6CGYrXdaCOA42Be4xAh+OHUoeE8v2mel30Ipeop+glotaSEPFDu3OBgyfv7jYysKrNmwCY3t5DkXWL8uIUU0ILCJMITDuMH4L9h7pPqGFOLcRlnjuwVACIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH2PR11MB4454.namprd11.prod.outlook.com (2603:10b6:610:45::22)
 by BN7PR11MB2530.namprd11.prod.outlook.com (2603:10b6:406:ac::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Fri, 6 May
 2022 06:46:16 +0000
Received: from CH2PR11MB4454.namprd11.prod.outlook.com
 ([fe80::fcc2:6d62:6e1e:d1f0]) by CH2PR11MB4454.namprd11.prod.outlook.com
 ([fe80::fcc2:6d62:6e1e:d1f0%6]) with mapi id 15.20.5227.020; Fri, 6 May 2022
 06:46:16 +0000
From: "Shi, Guohuai" <Guohuai.Shi@windriver.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>
CC: "Meng, Bin" <Bin.Meng@windriver.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: RE: [PATCH 5/9] hw/9pfs: Add a 'local' file system backend driver for
 Windows
Thread-Topic: [PATCH 5/9] hw/9pfs: Add a 'local' file system backend driver
 for Windows
Thread-Index: AQHYWLCcWsfI4/Y1i0icMWaeEyy3Ca0PEJuAgAAZrtCAAQ8IgIABN/IA
Date: Fri, 6 May 2022 06:46:15 +0000
Message-ID: <CH2PR11MB44549FB0091753D606CCF0DBEFC59@CH2PR11MB4454.namprd11.prod.outlook.com>
References: <20220425142705.2099270-1-bmeng.cn@gmail.com>
 <2749735.hgEqPgphOh@silver>
 <CH2PR11MB445462A54AC1006BD093737BEFC39@CH2PR11MB4454.namprd11.prod.outlook.com>
 <4564343.M1kaXOOn0d@silver>
In-Reply-To: <4564343.M1kaXOOn0d@silver>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e344754-30a9-4038-986c-08da2f2c1e4c
x-ms-traffictypediagnostic: BN7PR11MB2530:EE_
x-microsoft-antispam-prvs: <BN7PR11MB25309CAAB360EA7A3ED04EEAEFC59@BN7PR11MB2530.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N8mLUJ3GFVDqx1HHQZ/P/r1aW84fLKaxQkINrOii+KzoZ9bEAsozx2iAXWH7EBkV+3BrTva6QMazk94JFjT/iXgQviZbjYTklkk1L7LZlilqCbBdHpeUj3IxNdrHxis9ovAGZyZZ+VIrtL/d3+WoOO9d2m4nZDJqt9HENOYz4uL029+O+QzPhGGH8CkRh+pYKnf7wPFguvtEgzSrCuzfydK/8IhSt5+4fSwZIyUV7SKLYqpD8kAWAq9x53NstVIAXYJ4AQq+7zh1HKy4btpdcmHG5rn1loa+JMdC3kCKiu0NLzn6U5f74uEtMMJ+4Sjnj1DTQ9zKWWh2BkRNjCtFTCuejrdzorqf52ZTSlm3pVYHOWrW3YrCJiwzIZlHTJOqfJH4iKT2B9oLBQ0x/9e/WZbVmAbzOqx51KMvdqHIcWYKomyRPqaSVQO9opMLYnYQbrXd5SplQKigxXQ7DgAqqieChVrOdEhJ0RjNDv8mehJUeLMCLiUDx02TKs9/SySpmd1ZaA0WrAXHBG8SLhjV1fL45OzrasnmeIVs5Tedmxk3Jf7E+PiC8vCAjUstA1knGPm8D9VwyEV4ydzU//fcLq8UWim0Ed2qsGPtG1CSXGbMBha7bF2h5Af7F53qeZ/l5/gYlVViiM9ZGDENye1bJjAxYWDULECNN0KNF+2yRv2JvMsx+Yj6rU1LCdx4FRdmfvdlOrL0wxMFlG0SsYwve45HjRYzvmi5OuF6PNXJnFaOsqfcC+zBNreYtBoNqUl9Nngq4RChIvq8JsqgBICJmZX0PeCFsw+0ngRo00mrWxQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR11MB4454.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(4326008)(33656002)(52536014)(55016003)(966005)(76116006)(8676002)(2906002)(64756008)(66476007)(66446008)(508600001)(54906003)(66556008)(66946007)(110136005)(5660300002)(9686003)(38100700002)(38070700005)(122000001)(7696005)(26005)(53546011)(83380400001)(6506007)(71200400001)(186003)(86362001)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?SXlaMVdqa25hdDRVemdkUkFXMUNOTVBFeWRKL2plTUwzclVnMmhmck5rWEpp?=
 =?gb2312?B?YjI3YlpySExFVzJjc1lhNTZYWWZpNGt1ZlFKOFludEJlUnVxTlo2K2Jyb3Ex?=
 =?gb2312?B?TzlLYjBXT20rTEJzbjgzekJubDlML0lhOWpEZjBZUkxJeklnUFIzV25RZUdI?=
 =?gb2312?B?d1lLbGUxcUNZTno2RkRiZVFDejRnc2puRlpza0V2M3RzRVZsY1IvM3RBLzll?=
 =?gb2312?B?TzZhc1NDdDFYVTc5UjdsbEpaMW54SmxURDUzZWZWblhsQm5DRC9WY0JhbjB2?=
 =?gb2312?B?Y2trakpvcFg4bGdCNUs4b3YyNHI1T3ZWQkJ2eW5vZkVNYmRZOGtmRStEaHhl?=
 =?gb2312?B?ZjE3S1NVSFhha2JIRHdFTEFmSCtORnFvNnB2UmhSdGd5UTg1TFZBT3d5eHNK?=
 =?gb2312?B?SW5SVGRUMG92ZDI0eVo1akozWndjK2Z3NnRJeUdGMlBvK3JVdlI0czRaM1JR?=
 =?gb2312?B?OXcrQ1R2NE9yRHpjYitjdHlqVlJ6UERGbVRRNDdEclA1ZE9HTitLYytZaC9N?=
 =?gb2312?B?OHZpWmJJeTlxV3FncWpZTjhmYlZYTER2NW5ZcVp4VUpXZUNzZ1I5RWt1cEI1?=
 =?gb2312?B?ak5UWDQzcDB3bWcwWXpib2dJU2o4c1l6b09zU1lsOE0xUW83R3hDQWlDbFFD?=
 =?gb2312?B?blZaTy9IRFAvdVE4eDh6S1Vvck03Uzl6VFQzRGV5QTRkamhOWHZxU1pBL01o?=
 =?gb2312?B?QTlLNnNwWkdRYVlEY2FIZ3k0OVFhTytMdVpkNndNNlFzdTFReC9YMlZETWpS?=
 =?gb2312?B?M3RNUEI4VGtrNHN3Tk1wdUZkUlZZQVdiaHEwZVpDY09WNCs5TWtjTHBLR1Np?=
 =?gb2312?B?ODVEWlhXNWxVazJuTVY4U25vOGlJWUV5aHZreXJBa016TFZDb0NiVjB4NGMx?=
 =?gb2312?B?TjA2ekg5a1Y3MzAyUTJreGhPdmdjQ1FtQXo5b0thTWxIc0pwbS9tVVk5NHBv?=
 =?gb2312?B?YnBjYWJyaDhLTHpGWTBuNlRuS2x3WHFaQUc1VEtoZVNtYUVkYjVuNmhiT0Z3?=
 =?gb2312?B?QmRrbCtDUFBBVGVxLzNScFFRZjR4M1VaTjkwUHlxd3dES2RmRjFyZGNsM3kw?=
 =?gb2312?B?WEowelBGN01MVkJxclViN1B2MEE0NmVrditudGtMSm5lOGxNRkdYaGVTRG45?=
 =?gb2312?B?a3RGb0RpNmZlRlB4d1IzVmNVUmdlUmMvTzdOcFV6cDB0eEJwL05LZzVnMEcz?=
 =?gb2312?B?K0kzeWhZT2oveUV1VVdabGZtcU9nTjJmc1lYaHFjMWRFdHdtWmZMRnRMVU4y?=
 =?gb2312?B?SGI4MVRpZ0V6eWt1emdiSVNGczlFMFN3dVk3c2loblFtcGJiaFdNRWpaTW9v?=
 =?gb2312?B?VXRWUTE2VzE4SEVLSG9CQU1rYzJJd2NmRkdwZW1WR0EzSGZRYk1zZjc3RHJt?=
 =?gb2312?B?eUVtZWFBcWxlUFladDRNeVVudTQ5ZGNyZm9hcmlFSERqelIvYnlNTzd5ZVEx?=
 =?gb2312?B?V1RvaDJkNnJ1Uk56dHRrbUc4N3FkT2dpUU1ZOGZMNmNqSFozNkF0M2Zab3hW?=
 =?gb2312?B?MkFJRURQcCs0UmlFVWxLNldLS1JsWkRnQkU3djI5SXdNRDlRVjVsa2RyY2FL?=
 =?gb2312?B?MitSeW5CN3k3cmNIcXQwQ2syemZEQ1k3dXQ3NklFS2tDODZkV0ZEK2RNVXZG?=
 =?gb2312?B?RDhOT0JPbTJqbm5tcU54MlZQMTF1ZllwNkFsemJlQzlMVFpyVm1IVTFMVUtD?=
 =?gb2312?B?amNxNlRpMjZGUlo2UmdVUG9XM0duNjhWK29ndlQ0NjdCbkNxSkUrTGRjNmtI?=
 =?gb2312?B?NnN5NnYyWEdyVWNyRTJYZTcrNWFWRklZSW0yZS9UTFNneWpmZTBOSldIR0gy?=
 =?gb2312?B?TG96UjFFRUJRL2F3Rm9TdXJSVWVVSkRZVEkvUmVMSWZsbE50TGttQ2l2YnJm?=
 =?gb2312?B?bnVGdkc4Ykk3TTBMTUgxMnpRWE12eGhQNjA0ODQvSW1YMHFzTWVUbXpsZ2x5?=
 =?gb2312?B?VVRpQllmSVRkNXBta0IvM0ZBeEJEOVc3Rm5HT3g1NDFWZVVyQkcwS00wMDEx?=
 =?gb2312?B?NHE3ZzR5RWVOK2FlVHlWVXJhVTJrMXpmaC9JUkdOaXlzbnR5c1B4Snlzc0FF?=
 =?gb2312?B?cklrdWx1TWJiTW1yZkQxS3JLR1R0eEQrSTltQmlEbUhKMFFhSVdOOElIcFp1?=
 =?gb2312?B?cUpVamx4WHpUZVdDeGJHNk56WE42ZTZjQUNkWGllbTNhOGlXU2NNc3RTL2dW?=
 =?gb2312?B?VzhnMFNZTzV0UERUL2FtYS9qVEw1VDFIYlRQb0JFcWNMSnpKdlpsdlRROHFq?=
 =?gb2312?B?OTYzZ0s4cDFtdE1RMi9TcjZjL25RSCtlOU1vdHhTS1dxZ3lYVUVFWGxtcUVT?=
 =?gb2312?B?NjlWZUErTzZSdzNLTlFGUkNTNGF4bW5nckt6ekpjc0thaitHQ1gzSXpPRm0w?=
 =?gb2312?Q?dxoSDnywteciwyuU=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR11MB4454.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e344754-30a9-4038-986c-08da2f2c1e4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2022 06:46:15.9436 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FZ5SIaQzJCFIF2E/1vbDkHpLgQ4RoZANo8eCkm89V6dxF7cluPLmDszhfCOAJ6mFk1BbDuLtlckUxjLSQCNrSrvYOcUJUJ0yIZhW2B/axQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2530
X-Proofpoint-GUID: LmHWsHrhz5X7fT73rJjbyGmKHRBzCzmM
X-Proofpoint-ORIG-GUID: LmHWsHrhz5X7fT73rJjbyGmKHRBzCzmM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_02,2022-05-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205060034
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=21254367a6=guohuai.shi@windriver.com;
 helo=mx0a-0064b401.pphosted.com
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2hyaXN0aWFuIFNjaG9l
bmViZWNrIDxxZW11X29zc0BjcnVkZWJ5dGUuY29tPg0KPiBTZW50OiAyMDIyxOo11MI1yNUgMTk6
NDQNCj4gVG86IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgU2hpLCBHdW9odWFpIDxHdW9odWFpLlNo
aUB3aW5kcml2ZXIuY29tPjsgR3JlZyBLdXJ6DQo+IDxncm91Z0BrYW9kLm9yZz4NCj4gQ2M6IE1l
bmcsIEJpbiA8QmluLk1lbmdAd2luZHJpdmVyLmNvbT47IEJpbiBNZW5nIDxibWVuZy5jbkBnbWFp
bC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggNS85XSBody85cGZzOiBBZGQgYSAnbG9jYWwn
IGZpbGUgc3lzdGVtIGJhY2tlbmQgZHJpdmVyIGZvcg0KPiBXaW5kb3dzDQo+IA0KPiBbUGxlYXNl
IG5vdGU6IFRoaXMgZS1tYWlsIGlzIGZyb20gYW4gRVhURVJOQUwgZS1tYWlsIGFkZHJlc3NdDQo+
IA0KPiBPbiBNaXR0d29jaCwgNC4gTWFpIDIwMjIgMjE6MzQ6MjIgQ0VTVCBTaGksIEd1b2h1YWkg
d3JvdGU6DQo+IFsuLi5dDQo+ID4gPiA+IGluZGV4IDAwMDAwMDAwMDAuLmFhYjdjOWY3YjUNCj4g
PiA+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ID4gPiArKysgYi9ody85cGZzLzlwLWxvY2FsLXdpbjMy
LmMNCj4gPiA+ID4gQEAgLTAsMCArMSwxMjQyIEBADQo+ID4gPiA+ICsvKg0KPiA+ID4gPiArICog
OXAgV2luZG93cyBjYWxsYmFjaw0KPiA+ID4gPiArICoNCj4gPiA+ID4gKyAqIENvcHlyaWdodCAo
YykgMjAyMiBXaW5kIFJpdmVyIFN5c3RlbXMsIEluYy4NCj4gPiA+ID4gKyAqDQo+ID4gPiA+ICsg
KiBCYXNlZCBvbiBody85cGZzLzlwLWxvY2FsLmMNCj4gPiA+ID4gKyAqDQo+ID4gPiA+ICsgKiBU
aGlzIHdvcmsgaXMgbGljZW5zZWQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR1BMLCB2ZXJz
aW9uIDIuDQo+ID4gPiA+IFNlZQ0KPiA+ID4gPiArICogdGhlIENPUFlJTkcgZmlsZSBpbiB0aGUg
dG9wLWxldmVsIGRpcmVjdG9yeS4NCj4gPiA+ID4gKyAqLw0KPiA+ID4gPiArDQo+ID4gPiA+ICsv
Kg0KPiA+ID4gPiArICogTm90IHNvIGZhc3QhIFlvdSBtaWdodCB3YW50IHRvIHJlYWQgdGhlIDlw
IGRldmVsb3BlciBkb2NzIGZpcnN0Og0KPiA+ID4gPiArICogaHR0cHM6Ly93aWtpLnFlbXUub3Jn
L0RvY3VtZW50YXRpb24vOXANCj4gPiA+ID4gKyAqLw0KPiA+ID4gPiArDQo+ID4gPiA+ICsjaW5j
bHVkZSAicWVtdS9vc2RlcC5oIg0KPiA+ID4gPiArI2luY2x1ZGUgPHdpbmRvd3MuaD4NCj4gPiA+
ID4gKyNpbmNsdWRlIDxkaXJlbnQuaD4NCj4gPiA+ID4gKyNpbmNsdWRlICI5cC5oIg0KPiA+ID4g
PiArI2luY2x1ZGUgIjlwLWxvY2FsLmgiDQo+ID4gPiA+ICsjaW5jbHVkZSAiOXAteGF0dHIuaCIN
Cj4gPiA+ID4gKyNpbmNsdWRlICI5cC11dGlsLmgiDQo+ID4gPiA+ICsjaW5jbHVkZSAiZnNkZXYv
cWVtdS1mc2Rldi5oIiAgIC8qIGxvY2FsX29wcyAqLw0KPiA+ID4gPiArI2luY2x1ZGUgInFhcGkv
ZXJyb3IuaCINCj4gPiA+ID4gKyNpbmNsdWRlICJxZW11L2N1dGlscy5oIg0KPiA+ID4gPiArI2lu
Y2x1ZGUgInFlbXUvZXJyb3ItcmVwb3J0LmgiDQo+ID4gPiA+ICsjaW5jbHVkZSAicWVtdS9vcHRp
b24uaCINCj4gPiA+ID4gKyNpbmNsdWRlIDxsaWJnZW4uaD4NCj4gPiA+DQo+ID4gPiBJJ20gbm90
IHN1cmUgd2hldGhlciBhbGwgb2YgdGhpcyAoaS5lLiA5cC1sb2NhbC13aW4zMi5jIGluIGdlbmVy
YWwpDQo+ID4gPiBpcyByZWFsbHkgbmVlZGVkLiBJIG1lYW4geWVzLCBpdCBwcm9iYWJseSBkb2Vz
IHRoZSBqb2IsIGJ1dCB5b3UNCj4gPiA+IGJhc2ljYWxseSBhZGQgYSBjb21wbGV0ZSBzZXBhcmF0
ZSAnbG9jYWwnIGJhY2tlbmQgaW1wbGVtZW50YXRpb24NCj4gPiA+IGp1c3QgZm9yIHRoZSBXaW5k
b3dzIGhvc3QgcGxhdGZvcm0uDQo+ID4gPg0KPiA+ID4gTXkgZXhwZWN0YXRpb24gd291bGQgYmUg
dG8gc3RpY2sgdG8gOXAtbG9jYWwuYyBiZWluZyBPUy1hZ25vc3RpYywNCj4gPiA+IGFuZCBvbmx5
IGRlZmluZSBPUy1zcGVjaWZpYyBmdW5jdGlvbmFsaXR5IGluIDlwLXV0aWwtd2luZG93cy5jIGlm
IG5lZWRlZC4NCj4gPiA+DQo+ID4gPiBBbmQgbW9zdCBpbXBvcnRhbnRseTogZG9uJ3QgZHVwbGlj
YXRlIGNvZGUgYXMgZmFyIGFzIHBvc3NpYmxlISBJDQo+ID4gPiBtZWFuIHNvbWVib2R5IHdvdWxk
IG5lZWQgdG8gYWxzbyByZXZpZXcgYW5kIG1haW50YWluIGFsbCBvZiB0aGlzLg0KPiA+DQo+ID4g
QWN0dWFsbHksIGFsbW9zdCBhbGwgRmlsZU9wZXJhdGlvbnMgZnVuY3Rpb25zIGFyZSByZS13cml0
dGVuIGZvcg0KPiA+IFdpbmRvd3MgaG9zdC4NCj4gPg0KPiA+IEhlcmUgaXMgdGhlIGNvbXBhcmlz
b24gc3RhdGlzdGljcyBmb3IgOXAtbG9jYWwuYyBhbmQgOXAtbG9jYWwtd2luMzIuYzoNCj4gPiBU
b3RhbCBsaW5lcyA6IDE2MTENCj4gPiBDaGFuZ2VkIGxpbmVzOiA1OTANCj4gPiBJbnNlcnRlZCBs
aW5lczogMTM4DQo+ID4gUmVtb3ZlZCBsaW5lczogNDE0DQo+ID4NCj4gPiBGb3IgZnVuY3Rpb24g
bGV2ZWwgZGlmZmVyZW5jZSBjb3VudDoNCj4gPg0KPiA+IENoYW5nZWQgZnVuY3Rpb246IDM5DQo+
ID4gVW5jaGFuZ2VkIGZ1bmN0aW9uOiAxMw0KPiA+DQo+ID4gSWYgdXNlICIjaWZkZWYgX1dJTjMy
IiB0byBzcGVyYXRlIFdpbmRvd3MgaG9zdCBjb2RlLCBpdCBtYXkgbmVlZCB0byBiZQ0KPiA+IGlu
c2VydGVkIGFib3V0IDE1MCBjb2RlIGJsb2NrcyAob3IgMzkgY29kZSBibG9ja3MgZm9yIGFsbCBj
aGFuZ2VkDQo+ID4gZnVuY3Rpb25zKS4NCj4gPg0KPiA+IEkgYW0gbm90IHN1cmUgaWYgaXQgaXMg
YSBnb29kIGlkZWEgdG8gaW5zZXJ0IHNvIG1hbnkgIiNpZmRlZiBfV0lOMzIiLA0KPiA+IGl0IG1h
eSBjYXVzZSB0aGlzIGZpbGUgbm90IHJlYWRhYmxlLg0KPiA+DQo+ID4gSWYgc3RpY2sgdG8gOXAt
bG9jYWwuYyBiZWluZyBPUy1hZ25vc3RpYywgSSB0aGluayBpdCBpcyBiZXR0ZXIgdG8NCj4gPiBj
cmVhdGUgdHdvIG5ldyBmaWxlczogOXAtbG9jYWwtbGludXguYyBhbmQgOXAtbG9jYWwtd2luMzIu
Yw0KPiANCj4gVGhlIHRoaW5nIGlzLCBhcyB0aGlzIGlzIHByZXNlbnRlZCByaWdodCBub3csIEkg
Y2FuIGhhcmRseSBldmVuIHNlZSB3aGVyZSBkZXZpYXRpbmcNCj4gYmVoYXZpb3VyIGZvciBXaW5k
b3dzIHdvdWxkIGJlLCB3aGVyZSBub3QsIGFuZCBJJ20gbWlzc2luZyBhbnkgZXhwbGFuYXRpb25z
IGFuZA0KPiByZWFzb25zIGZvciB0aGUgaW5kaXZpZHVhbCBkZXZpYXRpb25zIHJpZ2h0IG5vdy4g
Q2hhbmNlcyBhcmUgdGhhdCB5b3UgYXJlDQo+IHVubmVjZXNzYXJpbGx5IGFkZGluZyBkdXBsaWNh
dGUgY29kZSBhbmQgdW5uZWNlc3NhcnkgY29kZSBkZXZpYXRpb25zLiBGb3IgbWUgdGhpcw0KPiA5
cC1sb2NhbC13aW4zMi5jIGFwcHJvYWNoIGxvb2tzIG92ZXJseSBjb21wbGV4IGFuZCBub3QgYXBw
cm9wcmlhdGVseSBhYnN0cmFjdGVkDQo+IG9uIGZpcnN0IHNpZ2h0Lg0KPiANCj4gSSBzdWdnZXN0
IHdhaXRpbmcgZm9yIEdyZWcgdG8gZ2l2ZSBoaXMgb3BpbmlvbiBvbiB0aGlzIGFzIHdlbGwgYmVm
b3JlIGNvbnRpbnVpbmcuDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IENocmlzdGlhbiBTY2hvZW5l
YmVjaw0KPiANCg0KSSBjYW4gbWFrZSB0aGlzIGNvbW1pdCB0byBiZSBzcGxpdCBpbnRvIHNldmVy
YWwgY29tbWl0czoNCkNvbW1pdCAjMTogb25seSBtYWtlIFdpbmRvd3MgaG9zdCBidWlsdCBzdWNj
ZXNzZnVsbHkuDQpDb21taXQgIzI6IHByb3ZpZGUgc29tZSBiYXNpYyBmaWxlIHN5c3RlbSBvcGVy
YXRpb25zIGFuZCBsZWF2ZSBvdGhlciBmdW5jdGlvbnMgbm90IHdvcmthYmxlIChyZXR1cm4gLTEp
Lg0KQ29tbWl0ICMzOiBwcm92aWRlIGZ1bGwgZmlsZSBzeXN0ZW0gb3BlcmF0aW9ucy4NCkNvbW1p
dCAjNDogcHJvdmlkZSBzZWN1cml0eSBtb2RlICJtYXBwZWQiIGJ5IE5URlMgQURTDQpDb21taXQg
IzU6IHByb3ZpZGUgc2VjdXJpdHkgbW9kZSAibWFwcGVkLWZpbGUiDQpDb21taXQgIzY6IGZpeCBX
aW5kb3dzIChNaW5HVykgZGlyZWN0b3J5IGFjY2VzcyBBUEkgY29tcGF0aWJsZSBpc3N1ZXMNCg0K
SG93ZXZlciwgSSB0aGluayBJIG1heSBzdGlsbCBuZWVkIGEgc3RhbmRhbG9uZSBmaWxlICI5cC1s
b2NhbC13aW4zMi5jIi4gU29tZSBmdW5jdGlvbnMgY291bGQgYmUgbW92ZWQgKG9yIG1lcmdlZCkg
YmFjayB0byA5cC1sb2NhbC5jLiBCdXQgdGhlcmUgYXJlIHN0aWxsIHNvbWUgZnVuY3Rpb25zIGFy
ZSB0b28gY29tcGxleCB0byBiZSBtZXJnZWQuDQoNClRoYW5rcw0KR3VvaHVhaQ0K

