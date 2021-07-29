Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AB53D9B00
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 03:19:08 +0200 (CEST)
Received: from localhost ([::1]:56628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8uhY-0001A9-0p
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 21:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1m8uKS-0000RK-FZ
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:55:16 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:65074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1m8uKQ-0007Yv-8U
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:55:16 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16T0knd1031641; Thu, 29 Jul 2021 00:55:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=txJenOLgqLiJeFVwHH6QRwFt2xySs7J+sHeD155WNrM=;
 b=Voftc0tBX45v4X2F3XmhkqiAwFHE5wNjUsujSLdOXKGNie9W0SXvcbs/F0Oybsx9+2Wo
 uiCykOQSBhtPQ6vhWNdlQO9TsEmguT+iOIV4oZ/U1T+fnik6Notx5OKhE+dw28vol9hG
 a6yEbDk9QXCV2Tw86NzswfczBu+2sUWOmsI3WZ2WSetaWYVAkr5+HYsNzTGqcxrxXDpa
 r+9VglTZl/I0fQgdWWBPHWhu5Fn8Bv6JC8iiJ6zUvfZ6GzJ9ERsyb2qjBuHJmV/eMEYM
 QJoLssQANn9f+BnB3Qt73ZI6xMogFPnZkn1G8zdrV7CVfxLuZEZ8wh0imYINsrqDAQNy 9w== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=txJenOLgqLiJeFVwHH6QRwFt2xySs7J+sHeD155WNrM=;
 b=PQ5z/4TsvwVlXc88whGb3uK/tWD1WgcI6I5ZwNkR3u+3fcuA9emI2MhMQhafQDFETAN/
 /5vIXAYdlTfPf2mvxv1OrRkKnjFnlro8a9vpt6CSD4WiSf5rNL4T+Gy9oqag4NgEYzqm
 hhprBoZaJlKFgKtJYxitgbni/I4H85DsBZ2Q3FichIHgHV86uICHvAqsW0P/iocrNHWi
 GFcNupyJFfWMf9Yqn1km2CUG4B4QkqNQsbyRdYHh7SDUnYGEgWOJT5JPWiI1igoO4n4g
 36rs0b2WpUCDLx7RoKa8YsSgMcmJy9/NRwmY7HxC37POmg3ErwBtHDsrV5wAsM8V5Jgo mA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a2353dvcx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Jul 2021 00:55:12 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16T0iwM4037284;
 Thu, 29 Jul 2021 00:55:11 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2043.outbound.protection.outlook.com [104.47.56.43])
 by userp3030.oracle.com with ESMTP id 3a2356b5hy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Jul 2021 00:55:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kuE8fqcMecwoMvo9QS/BKQUYB0G94dPyVkpqbMqoqnTsM5eRIJ/6y+GP3qB1kvFl6J+Yah0BL7xlvIrao6UrYBM8nKy0BB9bkL+Kd9IF9yEVpinwjUz0oW4SKabljK+fGBtvB8bjlrr37SU+xX3ppVLlfX5WHGSCXy6vmDRW8CezGleyiu+hhi7pSUiyn6gu22bfuKcXXk/AZLIRED0lZrWerdsBh4KcxHx5S7dEl0YSRv0eDFKQ3MCEbHA8lBusHqedsVQP7wvqjotQJlTK2a5I9j9xpj/Sll3w2z0XwZUmSd9Crc9cwPlyVxp+dg6PP17Ladf5Yu3pgYVZR9fzMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txJenOLgqLiJeFVwHH6QRwFt2xySs7J+sHeD155WNrM=;
 b=HeNRtKxPAPec5TE3ngiEwAQcoTaS66NBpiFpIlRwUnlSYpH0ldzKhxe7UxjWnet1RmXCCvHKVfTyhy8WCr09rrDKKNoh8wtIbxQEzZtgcnCYlFdUJCCjUGkgz5whcsdzrOMV2IgJn0g0RrULbgA3x4w4HkmrFN+UUjmyPTezOD/gco8nY3wBdXlBZBm/41Qn/e38cDeinca7ltLLqQ5to8HPFrhR+dsGDRsM2BqZzSKN36uUO/V1UF4gkYfRho2W+EL45lmcMq8c1nj+ZIwckEVncH6lawgqU6FaEK6Xb1kC6U+UNpfROiCVeGT/Wiowng6JDb6cvVZANJXmG1XY+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txJenOLgqLiJeFVwHH6QRwFt2xySs7J+sHeD155WNrM=;
 b=e6s2quBExSvsX60XxDfcVaftdDxaVjz87J07GUYkvRxGQyOJYqNhoCivODCcn7MP585ydlKNLLpXC73xY8f+L7sCS1cEUspOfjQwUkJlASw36UDhUXuppxoFECvxKOAsbrX89NKzA20nSBQzyhKwlHDZBuz9NCWH5m11N5t7eHw=
Received: from MWHPR1001MB2349.namprd10.prod.outlook.com
 (2603:10b6:301:30::26) by MWHPR10MB1709.namprd10.prod.outlook.com
 (2603:10b6:301:7::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Thu, 29 Jul
 2021 00:55:09 +0000
Received: from MWHPR1001MB2349.namprd10.prod.outlook.com
 ([fe80::58c6:846d:3bc3:ba3f]) by MWHPR1001MB2349.namprd10.prod.outlook.com
 ([fe80::58c6:846d:3bc3:ba3f%7]) with mapi id 15.20.4352.033; Thu, 29 Jul 2021
 00:55:09 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH RFC 04/19] vfio-user: Define type vfio_user_pci_dev_info
Thread-Topic: [PATCH RFC 04/19] vfio-user: Define type vfio_user_pci_dev_info
Thread-Index: AQHXfGc8nirVnygY60mfux519XCV16tYOmsAgAD1hwA=
Date: Thu, 29 Jul 2021 00:55:08 +0000
Message-ID: <239B3640-8D08-4380-9812-E55501EE2F5D@oracle.com>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
 <c65908895de707a0532aa9dd09932bff329ea416.1626675354.git.elena.ufimtseva@oracle.com>
 <YQEudt/G5zilt702@stefanha-x1.localdomain>
In-Reply-To: <YQEudt/G5zilt702@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.7)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 43324824-3f07-42ef-cdc1-08d9522b8356
x-ms-traffictypediagnostic: MWHPR10MB1709:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR10MB1709D33A8B1707D69BB21D3BB6EB9@MWHPR10MB1709.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dYTm8yrG0l748LOENgEN0t0zgy/x03mA47v4/MFx8kmXM0VoyuNhNeu3o4GZ6vUDfZpTEpAKb988quxYzDivmN8Gl2NP94quDmS5ObtnSMQRnzD7QuMpVoSLBvkz505jdk40KlWNxqvPKu5UaL7t0tSMRnUUBJSlcAFrg4sxIjtr2GWojo8vgimyNtrj5TZYnAh3x1wYngFKeBBd1FYHukrH6CV/VXL4yv/1zq7DOGwsFl1PxFG6LsOz9A+13cIIdWupwDBLpfdHaXz//FQgO86ledHN/9IosW2BSUh/Vu5uAPqaCgf0HWDRwgUdh6cp2wqCtdh3eoYUNzwBUh4CnROIdanwplrtpqgXvo+UZmZutAuLDjaM0MwMTo/qPB7EUxQGGddp3H91Leae64vkgvhfy9oprJcNR2TVtDB74X8kICrbBndnHq8x2nASAQjwNV7C6GSHbZqSg5nzvV+Lk7WG76Xe9Y1c7d3MsjCgoDbwk9C3jzWRffUH4qey4UhyHyq78Qx2dgZyTlv802YnU1Jb7LNgZxBFjSK1AsW1WsfRBqgmaHjxjEYkyc50r1JFnKX56BFdqOlLV6ziv1LxZq0I0/SmLmkRp5ZES4DnR6S7FCOmwP9tsy2FpZf+sW3OTGTWQKqFhYOHORehIQSKAsMKWfdENqeW5AaZGGcpFfFu8febIJLFcDZy90ZcJB+0Hsr5nVJ7G4kz3Tk+X789wxtcUlkrxcYrMVCKh+WOrdeNSR3P0cvdW8stBqks8c1p
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2349.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(376002)(136003)(346002)(396003)(5660300002)(53546011)(2906002)(6506007)(2616005)(38100700002)(83380400001)(6916009)(71200400001)(316002)(91956017)(86362001)(54906003)(6512007)(33656002)(122000001)(76116006)(26005)(64756008)(478600001)(66946007)(66446008)(6486002)(66476007)(186003)(4326008)(8676002)(36756003)(66556008)(38070700005)(8936002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aGZGandaWmx5SHQvU2VQQTlMRVRmMzd3bUhOMWF3anNEbG1LcEpKektvdzVE?=
 =?utf-8?B?emJ1a1V1NG83Rm55SUI3WGpORWFFSzg2UFRjQVJHQlVLUTdzTW80UnBROUFw?=
 =?utf-8?B?ZkJxWWZnd2U2Nm9jdEc1Tm5NUm05b0xvRXdRK3EyeWpqc2lYSlBEUmRuV2pN?=
 =?utf-8?B?QlJaeERZVHdxNU42VWRKMnB3aEhlYVp1Tkw5Q0MzMXhJRUZhWkJ5N2ozb0lF?=
 =?utf-8?B?WmhPQ3IzUk12cjlNMWZ0TkFsdTd2TFAvSDFvWldSZ2Y3R2h6VWhBUHZEWTBt?=
 =?utf-8?B?c1NGeklXaHByM3AvWWpWWUhyZkt4YUo5RkpvMGN4QmE0STRlNlZvSG5jcXRz?=
 =?utf-8?B?Nmd0NERhdFpEaDJPQ2VHbDRMNXgzcVJEaEdaMUFVQzNINk1MT2NaOStJT3A4?=
 =?utf-8?B?aFY1L0VMbkNlU3RhNlFMbEhtVHd4ZFZ1bWdHeW1sQ21sNVBoTEFnN0FTQlFm?=
 =?utf-8?B?OHBURzZSU2kwTVR0d09yZ0E5eGRuek5Jd3dzcE1ZeWtHZCszUkxnYTdSRUpw?=
 =?utf-8?B?OGtjOVRtRDd3QTVtQWwrVFQ0STF0UGZ1SlJzQUFmVVlldUFUTDdLcE1VZFZK?=
 =?utf-8?B?cGlZQ1QvcEMxNHE1dmc0MFZNR1oxUW9nUS9IK3pCVnB3VzZXZnNhNlcxV1RU?=
 =?utf-8?B?ck1pTmNsSmJSZTg3SWFLZVBqZzBNTkl4UDAzKzhJNGdSL0s3eW4yK0RETEp1?=
 =?utf-8?B?VUd5OGErWVpld3pRd2MycjA0YWMreEU5SUx2elk2VmVUN0kxQzRJTEFPUnd5?=
 =?utf-8?B?YUhDYnc3UFBmR09PTU52Y29QYTQ5RTlBUnI3L1k0NDdXSkVNVnRpR0oxRkxW?=
 =?utf-8?B?ZDBJdUdSRks4SmpwenlqS2NENDhzWEVidTNUSTc3cXlKell1NXRZZ0M0K0Fi?=
 =?utf-8?B?UlJoaUlBcUZramRmMVBtdlFwRFNNL1htcUdnbFdvKzdJbThtNG93M1RHMm52?=
 =?utf-8?B?NC9SdlcxYVY4dnA3M3NsN2p4bXlIMEh6RkQ2SHJWNXVrZEdiV094VzF3ekda?=
 =?utf-8?B?NW1QcThYR3dFVnpFNVlZTncyMlR2U3RWUDc5dTlBUmg4SHNQU3RXRWVJckx0?=
 =?utf-8?B?WGJQTXdQM05nVnBGRFI2bHMxSHBWRTBqTU5XbzlDK25XSklBZnYyVURzRXlF?=
 =?utf-8?B?UWJjT3JMamZmMzFQcUtaUklncmQ2T3dPdU9FSmtvTCtmTmNuWEd4WDU0ZTRN?=
 =?utf-8?B?Q2FFRFJqNHhERGt6eSs4V0VWK3BTbnd1MTB5cXliYWVDcDlpSWU5Z2NLRk1o?=
 =?utf-8?B?VXdINXNBVlVFanpPRkVId3VPa01hc3lmMTRhaTk2TnNNOFhRMk1TZ2o4TmVp?=
 =?utf-8?B?R3FFaXJVQXhybExRV3BxSXdLWFFOWk5hNlkzQk8wQWVkMUtoNVFDSTU2R0JV?=
 =?utf-8?B?amJWeGw5cnl0WFFCZ0NCYnlPQ3JkNVJZc1dFd2dsMTE3eXh4VGRwWGZpVEhm?=
 =?utf-8?B?Qkk2NnZHclN4SFhLVE5haGFwQ0FFUTdGd2Zpdmx2RzM0d0xsN1lGNXZvUUF5?=
 =?utf-8?B?ek9HOHo0N2F6K2svbW5ObjVXR240UVB4NkwzYThxUEVjOEthN1JoMkhraXNN?=
 =?utf-8?B?NW81bnlTL2lnMEViMlp4OFRlbWtiZ1J2Ui9UdlY3b0I5YlZ5bGQ2ekFQSFZn?=
 =?utf-8?B?czhQN2FEeUlNeTRjcVRzNWc2Q3g2RDRPcnVSbjlBRk9VR0kwZklLbDhWckRi?=
 =?utf-8?B?eHhTMGdBY1NrS3JxWW13dTFPazczLzE0YndNdjk4TElQQnNNaHBBbjM3eTV5?=
 =?utf-8?Q?xo5/FrulBTKC6Mv9CmLX+pnvxLVU+s6KJ1MhaEs?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <69392EF5BEDFBC41B5FB210E28B7F44D@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2349.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43324824-3f07-42ef-cdc1-08d9522b8356
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2021 00:55:08.8512 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Xpfi9tWJiu5Q0lWDpi+n6kMrHeRrPmBUBZnseYekDSJhuK3tACmf5rmwXKTo3gZZq9vBAEPNs087qeDWt5waR8mUs2Ml3IwBlZBMsy7byc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1709
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10059
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0
 suspectscore=0 phishscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107290003
X-Proofpoint-GUID: N9Sy2eQ_4s2IR7VFoqsijXqwJvzubIgS
X-Proofpoint-ORIG-GUID: N9Sy2eQ_4s2IR7VFoqsijXqwJvzubIgS
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jag Raman <jag.raman@oracle.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 John Levon <john.levon@nutanix.com>,
 QEMU Devel Mailing List <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gSnVsIDI4LCAyMDIxLCBhdCAzOjE2IEFNLCBTdGVmYW4gSGFqbm9jemkgPHN0ZWZh
bmhhQHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gU3VuLCBKdWwgMTgsIDIwMjEgYXQgMTE6
Mjc6NDNQTSAtMDcwMCwgRWxlbmEgVWZpbXRzZXZhIHdyb3RlOg0KPj4gRnJvbTogSm9obiBHIEpv
aG5zb24gPGpvaG4uZy5qb2huc29uQG9yYWNsZS5jb20+DQo+PiANCj4+IE5ldyBjbGFzcyBmb3Ig
dmZpby11c2VyIHdpdGggaXRzIGNsYXNzIGFuZCBpbnN0YW5jZQ0KPj4gY29uc3RydWN0b3JzIGFu
ZCBkZXN0cnVjdG9ycy4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogRWxlbmEgVWZpbXRzZXZhIDxl
bGVuYS51ZmltdHNldmFAb3JhY2xlLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEpvaG4gRyBKb2hu
c29uIDxqb2huLmcuam9obnNvbkBvcmFjbGUuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogSmFnYW5u
YXRoYW4gUmFtYW4gPGphZy5yYW1hbkBvcmFjbGUuY29tPg0KPj4gLS0tDQo+PiBody92ZmlvL3Bj
aS5jIHwgNDkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Kw0KPj4gMSBmaWxlIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKykNCj4+IA0KPj4gZGlmZiAtLWdp
dCBhL2h3L3ZmaW8vcGNpLmMgYi9ody92ZmlvL3BjaS5jDQo+PiBpbmRleCBiZWE5NWVmYzMzLi41
NTRiNTYyNzY5IDEwMDY0NA0KPj4gLS0tIGEvaHcvdmZpby9wY2kuYw0KPj4gKysrIGIvaHcvdmZp
by9wY2kuYw0KPj4gQEAgLTQyLDYgKzQyLDcgQEANCj4+ICNpbmNsdWRlICJxYXBpL2Vycm9yLmgi
DQo+PiAjaW5jbHVkZSAibWlncmF0aW9uL2Jsb2NrZXIuaCINCj4+ICNpbmNsdWRlICJtaWdyYXRp
b24vcWVtdS1maWxlLmgiDQo+PiArI2luY2x1ZGUgImh3L3ZmaW8vdXNlci5oIg0KPj4gDQo+PiAj
ZGVmaW5lIFRZUEVfVkZJT19QQ0lfTk9IT1RQTFVHICJ2ZmlvLXBjaS1ub2hvdHBsdWciDQo+PiAN
Cj4+IEBAIC0zMzI2LDMgKzMzMjcsNTEgQEAgc3RhdGljIHZvaWQgcmVnaXN0ZXJfdmZpb19wY2lf
ZGV2X3R5cGUodm9pZCkNCj4+IH0NCj4+IA0KPj4gdHlwZV9pbml0KHJlZ2lzdGVyX3ZmaW9fcGNp
X2Rldl90eXBlKQ0KPj4gKw0KPj4gK3N0YXRpYyB2b2lkIHZmaW9fdXNlcl9wY2lfcmVhbGl6ZShQ
Q0lEZXZpY2UgKnBkZXYsIEVycm9yICoqZXJycCkNCj4+ICt7DQo+PiArICAgIEVSUlBfR1VBUkQo
KTsNCj4+ICsgICAgVkZJT1VzZXJQQ0lEZXZpY2UgKnVkZXYgPSBWRklPX1VTRVJfUENJKHBkZXYp
Ow0KPj4gKw0KPj4gKyAgICBpZiAoIXVkZXYtPnNvY2tfbmFtZSkgew0KPj4gKyAgICAgICAgZXJy
b3Jfc2V0ZyhlcnJwLCAiTm8gc29ja2V0IHNwZWNpZmllZCIpOw0KPj4gKyAgICAgICAgZXJyb3Jf
YXBwZW5kX2hpbnQoZXJycCwgIlVzZSAtZGV2aWNlIHZmaW8tdXNlci1wY2ksc29ja2V0PTxuYW1l
PlxuIik7DQo+PiArICAgICAgICByZXR1cm47DQo+PiArICAgIH0NCj4+ICt9DQo+PiArDQo+PiAr
c3RhdGljIHZvaWQgdmZpb191c2VyX2luc3RhbmNlX2ZpbmFsaXplKE9iamVjdCAqb2JqKQ0KPj4g
K3sNCj4+ICt9DQo+PiArDQo+PiArc3RhdGljIFByb3BlcnR5IHZmaW9fdXNlcl9wY2lfZGV2X3By
b3BlcnRpZXNbXSA9IHsNCj4+ICsgICAgREVGSU5FX1BST1BfU1RSSU5HKCJzb2NrZXQiLCBWRklP
VXNlclBDSURldmljZSwgc29ja19uYW1lKSwNCj4gDQo+IFBsZWFzZSB1c2UgU29ja2V0QWRkcmVz
cyBzbyB0aGF0IGFsdGVybmF0aXZlIHNvY2tldCBjb25uZWN0aW9uIGRldGFpbHMNCj4gY2FuIGJl
IHN1cHBvcnRlZCB3aXRob3V0IGludmVudGluZyBjdXN0b20gc3ludGF4IGZvciB2ZmlvLXVzZXIt
cGNpLiBGb3INCj4gZXhhbXBsZSwgZmlsZSBkZXNjcmlwdG9yIHBhc3Npbmcgc2hvdWxkIGJlIHBv
c3NpYmxlLg0KPiANCj4gSSB0aGluayB0aGlzIHJlcXVpcmVzIGEgYml0IG9mIGNvbW1hbmQtbGlu
ZSBwYXJzaW5nIHdvcmssIHNvIGRvbid0IHdvcnJ5DQo+IGFib3V0IGl0IGZvciBub3csIGJ1dCBw
bGVhc2UgYWRkIGEgVE9ETyBjb21tZW50LiBXaGVuIHRoZSAtZGV2aWNlDQo+IHZmaW8tdXNlci1w
Y2kgc3ludGF4IGlzIGZpbmFsaXplZCAoaS5lLiB3aGVuIHRoZSBjb2RlIGlzIG1lcmdlZCBhbmQg
dGhlDQo+IGRldmljZSBuYW1lIGRvZXNuJ3Qgc3RhcnQgd2l0aCB0aGUgZXhwZXJpbWVudGFsIHgt
IHByZWZpeCksIHRoZW4gaXQNCj4gbmVlZHMgdG8gYmUgc29sdmVkLg0KPiANCg0KCVdoYXQgZG8g
eW91IHdhbnQgdGhlIG9wdGlvbnMgdG8gbG9vayBsaWtlIGF0IHRoZSBlbmRnYW1lPyAgSeKAmWQN
CnJhdGhlciB3b3JrIGJhY2t3YXJkIGZyb20gdGhhdCB0aGFuIGhhdmUgc2V2ZXJhbCBkaWZmZXJl
bnQgZmxhdm9ycyBvZg0Kb3B0aW9ucyBhcyBuZXcgc29ja2V0IG9wdGlvbnMgYXJlIGFkZGVkLiAg
SSBkaWQgbG9vayBhdCAtY2hhcmRldiBzb2NrZXQsDQphbmQgaXQgd2FzIGNvbmZ1c2luZyBlbm91
Z2ggdGhhdCBJIHdlbnQgZm9yIHRoZSBzaW1wbGUgc3RyaW5nLg0KDQoNCg0KPj4gKyAgICBERUZJ
TkVfUFJPUF9CT09MKCJzZWN1cmUtZG1hIiwgVkZJT1VzZXJQQ0lEZXZpY2UsIHNlY3VyZSwgZmFs
c2UpLA0KPiANCj4gSSdtIG5vdCBzdXJlIHdoYXQgInNlY3VyZS1kbWEiIG1lYW5zIGFuZCB0aGUg
InNlY3VyZSIgdmFyaWFibGUgbmFtZSBpcw0KPiBldmVuIG1vcmUgaW5zY3J1dGFibGUuIERvZXMg
dGhpcyBtZWFuIGRvbid0IHNoYXJlIG1lbW9yeSBzbyB0aGF0IGVhY2gNCj4gRE1BIGFjY2VzcyBp
cyBjaGVja2VkIGluZGl2aWR1YWxseT8NCj4gDQoNCglZZXMuICBEbyB5b3UgaGF2ZSBhbm90aGVy
IG5hbWUgeW914oCZZCBwcmVmZXI/IOKAnG5vLXNoYXJlZC1tZW3igJ0/DQoNCgkJCQkJCUpKDQoN
Cg0KDQo+PiArICAgIERFRklORV9QUk9QX0VORF9PRl9MSVNUKCksDQo+PiArfTsNCj4+ICsNCj4+
ICtzdGF0aWMgdm9pZCB2ZmlvX3VzZXJfcGNpX2Rldl9jbGFzc19pbml0KE9iamVjdENsYXNzICpr
bGFzcywgdm9pZCAqZGF0YSkNCj4+ICt7DQo+PiArICAgIERldmljZUNsYXNzICpkYyA9IERFVklD
RV9DTEFTUyhrbGFzcyk7DQo+PiArICAgIFBDSURldmljZUNsYXNzICpwZGMgPSBQQ0lfREVWSUNF
X0NMQVNTKGtsYXNzKTsNCj4+ICsNCj4+ICsgICAgZGV2aWNlX2NsYXNzX3NldF9wcm9wcyhkYywg
dmZpb191c2VyX3BjaV9kZXZfcHJvcGVydGllcyk7DQo+PiArICAgIGRjLT5kZXNjID0gIlZGSU8g
b3ZlciBzb2NrZXQgUENJIGRldmljZSBhc3NpZ25tZW50IjsNCj4+ICsgICAgcGRjLT5yZWFsaXpl
ID0gdmZpb191c2VyX3BjaV9yZWFsaXplOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgY29uc3Qg
VHlwZUluZm8gdmZpb191c2VyX3BjaV9kZXZfaW5mbyA9IHsNCj4+ICsgICAgLm5hbWUgPSBUWVBF
X1ZGSU9fVVNFUl9QQ0ksDQo+PiArICAgIC5wYXJlbnQgPSBUWVBFX1ZGSU9fUENJX0JBU0UsDQo+
PiArICAgIC5pbnN0YW5jZV9zaXplID0gc2l6ZW9mKFZGSU9Vc2VyUENJRGV2aWNlKSwNCj4+ICsg
ICAgLmNsYXNzX2luaXQgPSB2ZmlvX3VzZXJfcGNpX2Rldl9jbGFzc19pbml0LA0KPj4gKyAgICAu
aW5zdGFuY2VfaW5pdCA9IHZmaW9faW5zdGFuY2VfaW5pdCwNCj4+ICsgICAgLmluc3RhbmNlX2Zp
bmFsaXplID0gdmZpb191c2VyX2luc3RhbmNlX2ZpbmFsaXplLA0KPj4gK307DQo+PiArDQo+PiAr
c3RhdGljIHZvaWQgcmVnaXN0ZXJfdmZpb191c2VyX2Rldl90eXBlKHZvaWQpDQo+PiArew0KPj4g
KyAgICB0eXBlX3JlZ2lzdGVyX3N0YXRpYygmdmZpb191c2VyX3BjaV9kZXZfaW5mbyk7DQo+PiAr
fQ0KPj4gKw0KPj4gK3R5cGVfaW5pdChyZWdpc3Rlcl92ZmlvX3VzZXJfZGV2X3R5cGUpDQo+PiAt
LSANCj4+IDIuMjUuMQ0KPj4gDQoNCg==

