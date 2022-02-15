Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACBD4B6F6D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 15:54:12 +0100 (CET)
Received: from localhost ([::1]:34768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJzDW-0007HR-N5
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 09:54:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1nJzA2-0005FT-3h
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 09:50:36 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:7960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1nJz9y-0003BZ-Th
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 09:50:33 -0500
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21FCIo3v023903;
 Tue, 15 Feb 2022 06:50:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=H26XrVu1ZuzD6lI7TxL2Jtuwg6Yb/7c6E5ea8OUgLM4=;
 b=P05z2jm40yxsqYisUNqSghS7VDg5P5twLmvih5aUHwSOPKp9qUTEJ9Nn2Rlk/GwqXd4s
 5omeaeEKVQRnfFty9zSGiX8dOWAxqs0X+fdk4JADAjGNGmjQSh8bQYVmJTXwKzKfz/Ks
 DFSoWOXUVU/fGVqzwctdJwpZsfqFPFw3zyvm8y+G72ZiFiZclfr9E+MpqRqMC1y69gJN
 rpyezsY1gdiwDo7nvfPSPYCAhWNpWpdqMiXWuHc/89SQOerTuP2ryZCKtCKH2mN84sye
 a2k/6fM5H7dgeFq0WEvTVUpfZfnMKCD4efLpsarS+eUmWlbvvZZkg65EvHqjK7gIiGRC tg== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3e7mh9u328-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 06:50:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E9W/Iz7E3iGeEOvYda8aTPTm5NOjGmBH2o+Q1OngCbcyqxC4VY3yV12yp3/mK4beon+Y9OEfDF0ceu8pz0a3bYOOCsPYZrLgInI5fR8G1kLP6+pG3nZa+u0XFNlyo0ajmfV60gxW2TxT8R+4Dxxdtb4p2XqvEqU8EhGHNsERVgCtUumDcY2WGaASHI1bWaYjV+QC7ot5KW0i1cgQ9kErTtpK7vfwRS+ykuc/FF8R8ltZFpKnzbO25bitf/9EzVXWdE9kwlGdaD18gHwe3Ydkf7aWy1ZiM0UVqwzZKu9Mjuc2ARlDgN5MnMgHxE3jwD+iZWC67LABi7H8zqEl5+TKEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H26XrVu1ZuzD6lI7TxL2Jtuwg6Yb/7c6E5ea8OUgLM4=;
 b=W0bezESzP2GwdyFUvB5omxMdJU0vm6sgERLA2vtTNZr7z2kAtzb4Qlj72YR3iwYM601rKC5HybYdRx+3ogYaSl9vTs/fzRyY4wx3ACsSXaSwbkCmz0S30+ByW9WK2UUndLI4IJTiRBMfFn+S2goO4xrD57j6v7DZpjXJtnOxz0SenJAP7S8aEF5S6WzeSwL/6HuBVIMzc68GRhgQQpliNbqP6jaZ9zYyV+/n+uFcfePZGHvIEZYFOW6Om+hvR3pBCdV6Ihjr6S4OvzQcvx4kEV13QBw5/Mi6MB2qJiNUukv1+Azp5MxepvEXjuacSRa/D6x8mwAi7YwreUknuQjLaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM8PR02MB8005.namprd02.prod.outlook.com (2603:10b6:8:16::16) by
 MN2PR02MB5744.namprd02.prod.outlook.com (2603:10b6:208:10e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Tue, 15 Feb
 2022 14:50:24 +0000
Received: from DM8PR02MB8005.namprd02.prod.outlook.com
 ([fe80::603f:f90:aff7:2101]) by DM8PR02MB8005.namprd02.prod.outlook.com
 ([fe80::603f:f90:aff7:2101%4]) with mapi id 15.20.4995.015; Tue, 15 Feb 2022
 14:50:24 +0000
From: Thanos Makatos <thanos.makatos@nutanix.com>
To: Thanos Makatos <thanos.makatos@nutanix.com>, John Johnson
 <john.g.johnson@oracle.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [RFC v4 08/21] vfio-user: define socket receive functions
Thread-Topic: [RFC v4 08/21] vfio-user: define socket receive functions
Thread-Index: AQHYB1D6K8ghW7qhUU+7F4HUyUpkaayU0lzggAAVPUA=
Date: Tue, 15 Feb 2022 14:50:24 +0000
Message-ID: <DM8PR02MB80052AF463504BB4BBA397F48B349@DM8PR02MB8005.namprd02.prod.outlook.com>
References: <cover.1641584316.git.john.g.johnson@oracle.com>
 <a89cfd3195740dfb313d1947c0c7de583e4d0f46.1641584317.git.john.g.johnson@oracle.com>
 <DM8PR02MB8005963C1D2E796FB7420FBC8B349@DM8PR02MB8005.namprd02.prod.outlook.com>
In-Reply-To: <DM8PR02MB8005963C1D2E796FB7420FBC8B349@DM8PR02MB8005.namprd02.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab111559-f536-452f-29c5-08d9f0927f55
x-ms-traffictypediagnostic: MN2PR02MB5744:EE_
x-microsoft-antispam-prvs: <MN2PR02MB574483235290BE1AD1D25A4A8B349@MN2PR02MB5744.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x3dz55TO5IolRXhlZz57GJyyTBq9hu9xzrNzyLGyzj8+ykMSAd4wxg1268RWFjy3W6IcDbKWfm7BvHO1mQMXZV0dfRjBrdHMYJMb2cFQpEU1oRLddGzDBUovbbXoHtmpO/oIxIb/tcL0FtDE69+9TUlNChLtgOelaqCdC0eEaV+knGINPJC2yIDrr8RMLOkCW+t8uGDrJmDRq3f5rTWydIa+AsWV/1R9XEU4Ck8Nl0YaaZ9Y2wHEUnKCBXRP2K//z0FUxljeCHzlGsgTtUuahG4CA9ZwbCgVruLoMMguwShQR2rHptBhtb52iMu8qmKx+ZFhxNAhY9QEEzmAPiip6agRsljH5mgS4jfmKQ/GIrFTGUy7FL1VllNwB25U4VmqYteHRt8hGQQZp1TeTRSDtx1+esHOxT/83FMCl+EWsXV19PPOit/aDUr9+I/NEynrCsBw+xt8j6DgD/6Cm752zs01JJAQqTLPLbcbtQGJK1BEy7yYWIG+YyYKdUKrGLrN7j9brP5lMY652A86DvWKetbe+7Pe4Gl7TrcI6qaktFeQwWXhNAMR9lhMU7G32Izx4EZZAuwajHpLh/kXXBQ/hoG3zFfY4PWEZ3ck9xoce6Bbypb76atNDeWvH6NlPMBUFK21+mwLb14UFqmIFaVg+kCFYCljW6GP6BvgVBIKL/Gc3ptFXDNVlF4pJAWRp7WvMfcKEuB4MHKqqmnOkn9Wng==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR02MB8005.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(71200400001)(52536014)(2906002)(9686003)(86362001)(55016003)(38070700005)(44832011)(7696005)(8936002)(8676002)(83380400001)(6506007)(5660300002)(110136005)(508600001)(26005)(122000001)(64756008)(66476007)(66446008)(66556008)(316002)(38100700002)(66946007)(76116006)(186003)(33656002)(2940100002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RmY0KzRRMkQwL0M3V0pjakIrajNGS2RsS0lXWDhYZ3RtY3N3MHA5SU41VWpp?=
 =?utf-8?B?aGp0a0gvZjAzUzN5S0lwK2xLV0ZWM2hiM2ZXcmJoa09oZEMxMithaFloY0Yy?=
 =?utf-8?B?TW1YVW0wNWIyWU82a0FSTkNtTTVDNU9HMTlLM01tcmZ5Q1N4WnhmWDRVYnBF?=
 =?utf-8?B?dW81dVpaYVhscDFLZnl2Y1RBTE5TeXRsY21iMTB5VmNsVlkvOTZ6amRQNkFz?=
 =?utf-8?B?cCtCMGNTQm9nYVVKd1loU1l2LzlyVi90ZG1PL3FnZTFUTjBBOFFXWEc3NGla?=
 =?utf-8?B?MEQwZWNyUGhxVUpEWjZxUUZ4YmxrRnEwTFZlUXhpSkplNVNyZmFLUkQwZjZN?=
 =?utf-8?B?NUx4dk4wRlBFbXpYYUZuU3FmL1pIeXFuYS85MWkzTXBybGNUSEVHUGl3L2hh?=
 =?utf-8?B?Tko5b1JnY3R2QUIycnNldHkwY3ZYREtqc08xeDZzUVZvVzdXckE0eUw0Nngv?=
 =?utf-8?B?RHhndDRSVkp4b0liNk9QSnlxcnRhS3dvKzJRVVNuSkxwTXZ0K1VzeTVzQmd4?=
 =?utf-8?B?bUFWdUdKdjJHOGI4MHR4YTZwMDE0ZnNZZ0RMUFNhZzVQUi83RUY1cWt3cC9s?=
 =?utf-8?B?UzZlKzNNY1cxd3hGK3pMcTJibTZ1NE1lZ04ySVc3bUl5WEZkZWF0SEdpeW1z?=
 =?utf-8?B?WHRLM0NMbzZWbXFpY0YyK2JDTzd2ZDJsUzJVeGhQNldSTXhKWk9vZ0dDVzln?=
 =?utf-8?B?RXB2Wm1DUitoS3F3enNnSVdMMEpTVmpmVkdaaCtLK2JoUW9rVENveXRIRFpx?=
 =?utf-8?B?bDk1amhhVGxLWDU4dnpTTGVyd2xPaS9NRlllc1RCenNtZm1YQUQxKytGakpo?=
 =?utf-8?B?L3VQamRNTmdaVDNuZHF6ODBuUFFXeWtFdjhZd20zWW9LR3ArVzE2VU8rMFNo?=
 =?utf-8?B?SGR4NnZwaVZtdkZ5b1grZmFMZ05WV29zN1gzajRQYTRHWnZTdUZiUUpKeFZI?=
 =?utf-8?B?TUJPbDdEUnVPc0JPWFBQLzk4bGxOSmdLSGs1c2FUNkZ5OGZrK2RWOWFZeWZK?=
 =?utf-8?B?akw5V2dGMFVnNmV3Um16akJoMElBZEJ2QlIxTWNOS3hzQVNUeTZPLzJWdHFW?=
 =?utf-8?B?RVZhazJNSDJ6ZFdtYVZvRUpDUDdHWk8yRXNoQ09TakNqbHZpLzErZGtNUmdx?=
 =?utf-8?B?Q21UMU1sUnI0cG8vUlBKemN6WFFobFZveWlDZ2tiM3U5K09jaDRQay9iZXVn?=
 =?utf-8?B?Z0FCNFIvdy9POG50bDc0TjZmOWNHbWFlSGduUHFWMU1VT0hjWUdQM0FRSlVF?=
 =?utf-8?B?ODFxSTIwZjRZVW0vemZQdTZWcHFuSW1lcVQ2VU54aHZrdk5xcWMxTWdhZHls?=
 =?utf-8?B?ZVZkUGxaMWRZREgrWlVabk1kYTA3UGNPQlczOTJ3SlFzdkhXaXNFY05IUkhQ?=
 =?utf-8?B?ZEo4eVZOU2doTFJXb3l3dngzT1FHVlRQT25xSU1xRjhxYWtBdlR1V1VYRGVR?=
 =?utf-8?B?LzFNVmNqS29VUXhGWm43cU1ySDQwdzc1UTg1RWFYZXBOMkc3Q3IxM29GL0kx?=
 =?utf-8?B?bUNOS2tUS0hFQVcwbU1wM3kwMUZ4SnZ5bGN0cHpXbmoxQzlBa2tCRkJNbWc4?=
 =?utf-8?B?aC9zc0wyZGZMSUlaelo0WU5HaUlmc1VNdkxFc09KbEJjZmU3UG9iVExZeE0v?=
 =?utf-8?B?NW1mOU5YSXpTMm1ZY3VpclBFT01raGhiMi9qUU9lM2QvS0VMRi8rZjVGOE5H?=
 =?utf-8?B?MFVYVmtsbUMza3Q2UFg1ajFDNFB2Ymp6Uld5Z2tsaGs2Yno5UTdVRlpXbnZk?=
 =?utf-8?B?ZnltQ2F2WFF5cWFMbE1HUEtDU3U1OHhhQ0RKSmFCVHhMZnFTNkpHSURBQWRa?=
 =?utf-8?B?clZwN2ZNUzBDTEZHRTFlVGswNURxeXZwOWxlM0tuaGZYMWNuZzlLYnFGUldI?=
 =?utf-8?B?YmlvQ091T0NYRXJYNzNNek5qNTlnNWw0UmE3Q1FiWGVmRGp2Q1R6cCsrVk1Y?=
 =?utf-8?B?RzlsSitySGQyV0o5dUpmVnhQT2t0eENwWTVKVWpxbUhGQ1lTMWtKaERrWnpZ?=
 =?utf-8?B?ajAyQ0pyTlBjNlNyQnUyVWZubUd2MElqMmdBbTRHZ1JXeVB4Nyt4QnBlNkw3?=
 =?utf-8?B?WEd0QUFzRitndmovQ2hPUTVWV0llbDdQOTBXSEVEb0hSdm9Fc1BMRFcySG9o?=
 =?utf-8?B?WUM1N2ZnN25pTXVqaDNVdkVYSVkwVXh6QjBpWDY3dk83b21IZjFQYUVKR2dC?=
 =?utf-8?B?K0RBMWQyUHQzQ2tXYTRsd0V3NnhZYzcrd2RHNlhTZTFFQ21QYXl3RlRIbTdl?=
 =?utf-8?B?WXZ5TVBVdWV2bENLcmc4RHY4NWlBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8005.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab111559-f536-452f-29c5-08d9f0927f55
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 14:50:24.1033 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EA9sSV9PED6ckPlNDRBG1ZS8plZW34+ILMn6fP+RR/gueCVI2otEjemc/NfzIms498s3zKiZeeyMF1RHqsCtgJN342Sef7/RLyD+LPfcT3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB5744
X-Proofpoint-ORIG-GUID: 1Zl3A-53yGd7gX_P9FpuLYVOuhgrUeXC
X-Proofpoint-GUID: 1Zl3A-53yGd7gX_P9FpuLYVOuhgrUeXC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_04,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=thanos.makatos@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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

PiA+ICsvKg0KPiA+ICsgKiBSZWNlaXZlIGFuZCBwcm9jZXNzIG9uZSBpbmNvbWluZyBtZXNzYWdl
Lg0KPiA+ICsgKg0KPiA+ICsgKiBGb3IgcmVwbGllcywgZmluZCBtYXRjaGluZyBvdXRnb2luZyBy
ZXF1ZXN0IGFuZCB3YWtlIGFueSB3YWl0ZXJzLg0KPiA+ICsgKiBGb3IgcmVxdWVzdHMsIHF1ZXVl
IGluIGluY29taW5nIGxpc3QgYW5kIHJ1biByZXF1ZXN0IEJILg0KPiA+ICsgKi8NCj4gPiArc3Rh
dGljIGludCB2ZmlvX3VzZXJfcmVjdl9vbmUoVkZJT1Byb3h5ICpwcm94eSkNCj4gPiArew0KPiA+
ICsgICAgVkZJT1VzZXJNc2cgKm1zZyA9IE5VTEw7DQo+ID4gKyAgICBnX2F1dG9mcmVlIGludCAq
ZmRwID0gTlVMTDsNCj4gPiArICAgIFZGSU9Vc2VyRkRzICpyZXFmZHM7DQo+ID4gKyAgICBWRklP
VXNlckhkciBoZHI7DQo+ID4gKyAgICBzdHJ1Y3QgaW92ZWMgaW92ID0gew0KPiA+ICsgICAgICAg
IC5pb3ZfYmFzZSA9ICZoZHIsDQo+ID4gKyAgICAgICAgLmlvdl9sZW4gPSBzaXplb2YoaGRyKSwN
Cj4gPiArICAgIH07DQo+ID4gKyAgICBib29sIGlzcmVwbHkgPSBmYWxzZTsNCj4gPiArICAgIGlu
dCBpLCByZXQ7DQo+ID4gKyAgICBzaXplX3QgbXNnbGVmdCwgbnVtZmRzID0gMDsNCj4gPiArICAg
IGNoYXIgKmRhdGEgPSBOVUxMOw0KPiA+ICsgICAgY2hhciAqYnVmID0gTlVMTDsNCj4gPiArICAg
IEVycm9yICpsb2NhbF9lcnIgPSBOVUxMOw0KPiA+ICsNCj4gPiArICAgIC8qDQo+ID4gKyAgICAg
KiBSZWFkIGhlYWRlcg0KPiA+ICsgICAgICovDQo+ID4gKyAgICByZXQgPSBxaW9fY2hhbm5lbF9y
ZWFkdl9mdWxsKHByb3h5LT5pb2MsICZpb3YsIDEsICZmZHAsICZudW1mZHMsDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICZsb2NhbF9lcnIpOw0KPiA+ICsgICAgaWYgKHJl
dCA9PSBRSU9fQ0hBTk5FTF9FUlJfQkxPQ0spIHsNCj4gPiArICAgICAgICByZXR1cm4gcmV0Ow0K
PiA+ICsgICAgfQ0KPiA+ICsgICAgaWYgKHJldCA8PSAwKSB7DQo+ID4gKyAgICAgICAgLyogcmVh
ZCBlcnJvciBvciBvdGhlciBzaWRlIGNsb3NlZCBjb25uZWN0aW9uICovDQo+ID4gKyAgICAgICAg
aWYgKHJldCA9PSAwKSB7DQo+ID4gKyAgICAgICAgICAgIGVycm9yX3NldGcoJmxvY2FsX2Vyciwg
InZmaW9fdXNlcl9yZWN2IHNlcnZlciBjbG9zZWQgc29ja2V0Iik7DQo+ID4gKyAgICAgICAgfSBl
bHNlIHsNCj4gPiArICAgICAgICAgICAgZXJyb3JfcHJlcGVuZCgmbG9jYWxfZXJyLCAidmZpb191
c2VyX3JlY3YiKTsNCj4gPiArICAgICAgICB9DQo+ID4gKyAgICAgICAgZ290byBmYXRhbDsNCj4g
PiArICAgIH0NCj4gPiArICAgIGlmIChyZXQgPCBzaXplb2YobXNnKSkgew0KPiA+ICsgICAgICAg
IGVycm9yX3NldGcoJmxvY2FsX2VyciwgInZmaW9fdXNlcl9yZWN2IHNob3J0IHJlYWQgb2YgaGVh
ZGVyIik7DQo+ID4gKyAgICAgICAgZ290byBmYXRhbDsNCj4gPiArICAgIH0NCj4gDQo+IFByaW50
IHJlY2VpdmVkIHNpemUgZm9yIGRlYnVnIHB1cnBvc2VzPw0KPiANCj4gPiArDQo+ID4gKyAgICAv
Kg0KPiA+ICsgICAgICogVmFsaWRhdGUgaGVhZGVyDQo+ID4gKyAgICAgKi8NCj4gPiArICAgIGlm
IChoZHIuc2l6ZSA8IHNpemVvZihWRklPVXNlckhkcikpIHsNCj4gPiArICAgICAgICBlcnJvcl9z
ZXRnKCZsb2NhbF9lcnIsICJ2ZmlvX3VzZXJfcmVjdiBiYWQgaGVhZGVyIHNpemUiKTsNCj4gPiAr
ICAgICAgICBnb3RvIGZhdGFsOw0KPiA+ICsgICAgfQ0KPiANCj4gUHJpbnQgaGVhZGVyIHNpemU/
DQo+IA0KPiA+ICsgICAgc3dpdGNoIChoZHIuZmxhZ3MgJiBWRklPX1VTRVJfVFlQRSkgew0KPiA+
ICsgICAgY2FzZSBWRklPX1VTRVJfUkVRVUVTVDoNCj4gPiArICAgICAgICBpc3JlcGx5ID0gZmFs
c2U7DQo+ID4gKyAgICAgICAgYnJlYWs7DQo+ID4gKyAgICBjYXNlIFZGSU9fVVNFUl9SRVBMWToN
Cj4gPiArICAgICAgICBpc3JlcGx5ID0gdHJ1ZTsNCj4gPiArICAgICAgICBicmVhazsNCj4gPiAr
ICAgIGRlZmF1bHQ6DQo+ID4gKyAgICAgICAgZXJyb3Jfc2V0ZygmbG9jYWxfZXJyLCAidmZpb191
c2VyX3JlY3YgdW5rbm93biBtZXNzYWdlIHR5cGUiKTsNCj4gPiArICAgICAgICBnb3RvIGZhdGFs
Ow0KPiA+ICsgICAgfQ0KPiANCj4gUHJpbnQgbWVzc2FnZSB0eXBlPw0KPiANCj4gPiArDQo+ID4g
KyAgICAvKg0KPiA+ICsgICAgICogRm9yIHJlcGxpZXMsIGZpbmQgdGhlIG1hdGNoaW5nIHBlbmRp
bmcgcmVxdWVzdC4NCj4gPiArICAgICAqIEZvciByZXF1ZXN0cywgcmVhcCBpbmNvbWluZyBGRHMu
DQo+ID4gKyAgICAgKi8NCj4gPiArICAgIGlmIChpc3JlcGx5KSB7DQo+ID4gKyAgICAgICAgUVRB
SUxRX0ZPUkVBQ0gobXNnLCAmcHJveHktPnBlbmRpbmcsIG5leHQpIHsNCj4gPiArICAgICAgICAg
ICAgaWYgKGhkci5pZCA9PSBtc2ctPmlkKSB7DQo+ID4gKyAgICAgICAgICAgICAgICBicmVhazsN
Cj4gPiArICAgICAgICAgICAgfQ0KPiA+ICsgICAgICAgIH0NCj4gPiArICAgICAgICBpZiAobXNn
ID09IE5VTEwpIHsNCj4gPiArICAgICAgICAgICAgZXJyb3Jfc2V0ZygmbG9jYWxfZXJyLCAidmZp
b191c2VyX3JlY3YgdW5leHBlY3RlZCByZXBseSIpOw0KPiA+ICsgICAgICAgICAgICBnb3RvIGVy
cjsNCj4gPiArICAgICAgICB9DQo+ID4gKyAgICAgICAgUVRBSUxRX1JFTU9WRSgmcHJveHktPnBl
bmRpbmcsIG1zZywgbmV4dCk7DQo+ID4gKw0KPiA+ICsgICAgICAgIC8qDQo+ID4gKyAgICAgICAg
ICogUHJvY2VzcyBhbnkgcmVjZWl2ZWQgRkRzDQo+ID4gKyAgICAgICAgICovDQo+ID4gKyAgICAg
ICAgaWYgKG51bWZkcyAhPSAwKSB7DQo+ID4gKyAgICAgICAgICAgIGlmIChtc2ctPmZkcyA9PSBO
VUxMIHx8IG1zZy0+ZmRzLT5yZWN2X2ZkcyA8IG51bWZkcykgew0KPiA+ICsgICAgICAgICAgICAg
ICAgZXJyb3Jfc2V0ZygmbG9jYWxfZXJyLCAidmZpb191c2VyX3JlY3YgdW5leHBlY3RlZCBGRHMi
KTsNCj4gPiArICAgICAgICAgICAgICAgIGdvdG8gZXJyOw0KPiA+ICsgICAgICAgICAgICB9DQo+
ID4gKyAgICAgICAgICAgIG1zZy0+ZmRzLT5yZWN2X2ZkcyA9IG51bWZkczsNCj4gPiArICAgICAg
ICAgICAgbWVtY3B5KG1zZy0+ZmRzLT5mZHMsIGZkcCwgbnVtZmRzICogc2l6ZW9mKGludCkpOw0K
PiA+ICsgICAgICAgIH0NCj4gPiArICAgIH0gZWxzZSB7DQo+ID4gKyAgICAgICAgaWYgKG51bWZk
cyAhPSAwKSB7DQo+ID4gKyAgICAgICAgICAgIHJlcWZkcyA9IHZmaW9fdXNlcl9nZXRmZHMobnVt
ZmRzKTsNCj4gPiArICAgICAgICAgICAgbWVtY3B5KHJlcWZkcy0+ZmRzLCBmZHAsIG51bWZkcyAq
IHNpemVvZihpbnQpKTsNCj4gPiArICAgICAgICB9IGVsc2Ugew0KPiA+ICsgICAgICAgICAgICBy
ZXFmZHMgPSBOVUxMOw0KPiA+ICsgICAgICAgIH0NCj4gPiArICAgIH0NCj4gPiArDQo+ID4gKyAg
ICAvKg0KPiA+ICsgICAgICogUHV0IHRoZSB3aG9sZSBtZXNzYWdlIGludG8gYSBzaW5nbGUgYnVm
ZmVyLg0KPiA+ICsgICAgICovDQo+ID4gKyAgICBpZiAoaXNyZXBseSkgew0KPiA+ICsgICAgICAg
IGlmIChoZHIuc2l6ZSA+IG1zZy0+cnNpemUpIHsNCj4gPiArICAgICAgICAgICAgZXJyb3Jfc2V0
ZygmbG9jYWxfZXJyLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICJ2ZmlvX3VzZXJfcmVj
diByZXBseSBsYXJnZXIgdGhhbiByZWN2IGJ1ZmZlciIpOw0KPiA+ICsgICAgICAgICAgICBnb3Rv
IGVycjsNCj4gPiArICAgICAgICB9DQo+IA0KPiBQcmludCBoZHIuc2l6ZSBhbmQgbXNnLT5yc2l6
ZT8NCj4gDQo+ID4gKyAgICAgICAgKm1zZy0+aGRyID0gaGRyOw0KPiA+ICsgICAgICAgIGRhdGEg
PSAoY2hhciAqKW1zZy0+aGRyICsgc2l6ZW9mKGhkcik7DQo+ID4gKyAgICB9IGVsc2Ugew0KPiA+
ICsgICAgICAgIGlmIChoZHIuc2l6ZSA+IG1heF94ZmVyX3NpemUpIHsNCj4gPiArICAgICAgICAg
ICAgZXJyb3Jfc2V0ZygmbG9jYWxfZXJyLCAidmZpb191c2VyX3JlY3YgcmVxdWVzdCBsYXJnZXIg
dGhhbiBtYXgiKTsNCj4gPiArICAgICAgICAgICAgZ290byBlcnI7DQo+ID4gKyAgICAgICAgfQ0K
PiANCj4gUHJpbnQgaGRyLnNpemU/DQoNCk9uIHNlY29uZCB0aG91Z2h0LCBzaG91bGQgd2UgZHVt
cCB0aGUgZW50aXJlIGhlYWRlciBpbiBjYXNlIG9mIHN1Y2ggZXJyb3JzPyBJZiBub3QgYnkgZGVm
YXVsdCB0aGVuIGF0IGxlYXN0IGluIGRlYnVnIGJ1aWxkcz8NCg==

