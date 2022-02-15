Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA88B4B6F74
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 15:56:14 +0100 (CET)
Received: from localhost ([::1]:37534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJzFV-0000m5-Vo
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 09:56:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1nJzDC-0007pj-Td
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 09:53:55 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:18224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1nJzDA-0003W3-DY
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 09:53:50 -0500
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21FEXmsk031347;
 Tue, 15 Feb 2022 06:53:46 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=MjMep3yBmZgGGKBQw0aDmh2Yio8uBAZn7rR2gVZL4cU=;
 b=pZBpNcE3imeZ4ZbXS7Ze6Cx4UTnqVRzuJRAdXBWz5Tc5hD6jVLs8MiazGUWZXCrzqWql
 OQAhuWqP8VwCxHnrTAnRWSPJGoMAtvgwlOal7j5NDTeyB375GHy21VCfdnLuTNeYxphp
 KXJtT5J7KsJY5+h3Y8rRRV2JOYay/iOENkwBZlYsptXmmJI3XAGW4Ou6rmD4SHeAtavp
 fQwPZj+Ob0TGeUysEi7+MF9wgNXbJpcCUWjrJ9xcd5E/4EPZnkaqLpeZrvaLm0wf20TZ
 eR73cnapaFj5qmJuJN5mfbLCGx19vQygqs78knvjVjgajgHNB9e7tIzhJ5qFXD67CH1k 3Q== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2170.outbound.protection.outlook.com [104.47.73.170])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3e7pw9ttyq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 06:53:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j8yfkatBB7O6aeM0w7iPNgHGGqoR4AdI3JhecJzm1QJoEDjClEczsL0xO6iu7BArkUYSL9VKWl+HwNk9/ARrxPucS0DTnHELDdwzaUjROKriCqbUa5IHGthUGl7CH3WMbNswiZo71Sp/dzdyIRNgZNhvi1nyqfTwJat1KqKCxVxCZNUNFreqYKVR/3VU/LE2JhsNHNBzqYfzlKJ/mT+UmSzuyE5LbwVLFIbc3JZpHSOSe9I17zz8X0zEf0sCXfwgY+FtTQyWRjWp2Ih0DSgiJX+wiiqAub4XEbRnb3rA7Qcyw62uYZ4rAxIc+8oN83PO/J820z7FNWyrKfjuoO+Wdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MjMep3yBmZgGGKBQw0aDmh2Yio8uBAZn7rR2gVZL4cU=;
 b=Jl6x7+0AzL8bBmX9GozDLb7+vQnOs6FG8aaw4+na1doCxJB6V5smk8EPER27nLNGO8k4P1qr7q2zkXsCc3FTwnxGRisjCF8QLPlqF34wvHecB2zf6yBDZEWLOAtKk9HtrWMucxwlJu7WcjCimpHghEbHVSSItOVaCRV6avrYLdHAyA7kSm2PDSrj805A8SpA7uJPlgPF5dT8uthMKjQ7T9bL4lt3eTUVFWFX5ewJMIST4AsZkExU70deiInnNJhth32ca3DQ20cTELjp/eBUMLtkdLpmnae4+iNNiyjpxHzKkJ20VtNZgjVT3qlFkVubxumRzk3GAsofMmqBOB/GzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM8PR02MB8005.namprd02.prod.outlook.com (2603:10b6:8:16::16) by
 BYAPR02MB4583.namprd02.prod.outlook.com (2603:10b6:a03:12::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11; Tue, 15 Feb 2022 14:53:42 +0000
Received: from DM8PR02MB8005.namprd02.prod.outlook.com
 ([fe80::603f:f90:aff7:2101]) by DM8PR02MB8005.namprd02.prod.outlook.com
 ([fe80::603f:f90:aff7:2101%4]) with mapi id 15.20.4995.015; Tue, 15 Feb 2022
 14:53:42 +0000
From: Thanos Makatos <thanos.makatos@nutanix.com>
To: John Johnson <john.g.johnson@oracle.com>
Subject: RE: [RFC v4 20/21] vfio-user: migration support
Thread-Topic: [RFC v4 20/21] vfio-user: migration support
Thread-Index: AQHYB1Myhgu/Ouvob0KwUKnLCXwU36yOh5rQgAURNACAAU+yUA==
Date: Tue, 15 Feb 2022 14:53:42 +0000
Message-ID: <DM8PR02MB80052C4BED8059717F89F14D8B349@DM8PR02MB8005.namprd02.prod.outlook.com>
References: <cover.1641584316.git.john.g.johnson@oracle.com>
 <27b636c6c861e0a05278e2d1cbf07d3adec2d505.1641584317.git.john.g.johnson@oracle.com>
 <DM8PR02MB800573717D16BE0BDD1DBB8D8B309@DM8PR02MB8005.namprd02.prod.outlook.com>
 <A837B04D-911A-4E62-86FF-760DBCE4462B@oracle.com>
In-Reply-To: <A837B04D-911A-4E62-86FF-760DBCE4462B@oracle.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d74572e-7ea7-4f9d-c49a-08d9f092f558
x-ms-traffictypediagnostic: BYAPR02MB4583:EE_
x-microsoft-antispam-prvs: <BYAPR02MB4583E2F6504E5AE60A902D458B349@BYAPR02MB4583.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IeV8occfs99dfCIz9GFloDvMsFi1p2d3wKb3ov0nVgXDokFUYQ4rs0OC18zrYLMao6RIMnKdWM6TAtA79BZ0krN6SLHlMua+IYdAEUUngE05eZTqdmnHhVb/aZ74mRNLyPsJQzm13TQUvVisSWyUghpbSQ7/YM+kjZO7PunyKNbIo1fYTL1YQPxpxP+Dgz0+Slq6Ov1p5VxazacFiSXKvkKPUxJAlgQGB503r03+pmPeoXd49vhkx7crRgtGtdavGQOdtFaWrEkSeR+f7pZGndVTZOxnO9vNvV/wo1kQnD0YFrS6NQ2E/UkBhRcv+3vI1NdfIIHj77Z7ZHM9Oq1EGZJoLPtp2azXb4MpbqiAjsjXiWvmFuS3o4j+88yjcfGQ0Pc6K3hJAt+QyPVoo/rIR93fyV4abhJ+Pb/KG7+HJSbNFEHmBEi/MTmsUjYrP59yvnJS4oQYQQivr+5H9+t7F/NpGBhWGwiy0Hv8hKPjyWe84a4UOLFp69xhf1gHnO71bWWh515TfG32Z7vDODamzH/ESFBFVW+XJJ6b5yL7h1Xol8u45we2Jaw6g27Ycasz+xuKSMCBTv2b7YoiYWor6JAm4BFHHJt7Jwb1n4HLd2z33O9hCbx0CdNEdkHNg/SxG9YIjTsp32KrM++C79vlhwuuF8ds89qoMZaSZ9cijR24rmnqE2yanTcuQlQ/mn8u1sL3f8nTkQSbykZ/SXzQbw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR02MB8005.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(64756008)(316002)(6916009)(76116006)(508600001)(4326008)(66556008)(66946007)(66446008)(38100700002)(66476007)(9686003)(38070700005)(8676002)(33656002)(5660300002)(53546011)(2906002)(71200400001)(6506007)(7696005)(186003)(83380400001)(86362001)(44832011)(26005)(55016003)(8936002)(52536014)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NE8vUVJaMGNZYmN6cGl2WnRLdzNDbnVrNXFZZ2hOQ29mNWV1Z1dsRXY3MG9j?=
 =?utf-8?B?ckVJQlJZa0NGQVZQajBrN2FUbmE0SzRqb3JHMUVWM0FIV21qY1V0RUV1aExV?=
 =?utf-8?B?dThjaVIvbXRYQ2tSeXVRRnF4SXRYWWtQRlRWVkpBTWFCY29VZzVvMW03Y0Zp?=
 =?utf-8?B?YzJXZUJua3JzWG9GUnkrRStpdFUxOVdEaGNGSGJzVnRPdktGSThIZkJST0FT?=
 =?utf-8?B?U0RpMklqc1VJd0kyeittb0JNWFlHWndMUDAxcGs0Nk15YXM4LzZhL2Y5dTdC?=
 =?utf-8?B?K0xheXRKM2tRaXd5ckhMYlRJVG5aL1JSYldTTG1Ua3dUWk8zeVJlUzdaSDVm?=
 =?utf-8?B?eUdCaHZkeUVSZ0ROZWgzZW5VcHUxSWtiOXo2dUZOTTZZTnBCUGVSYmN5Qm5R?=
 =?utf-8?B?ekFrZTFtYzdvNUpWNEFYTkZtVm9rQWlTQmdIRFoyR2hGelBUeFE5UytvMnU2?=
 =?utf-8?B?RGRxZURhbjVsTjA2bjZQVlpvVnpJNmxsWTJKbTBYVHYwVTVZenF3ei9YVTg2?=
 =?utf-8?B?ZEVXdklwbk9ESHlSYlVGdzVmZ2dldk1EODAwc3NpWGVzVGU2SnMwZVJmUmZS?=
 =?utf-8?B?WTZ4TEtlb2ErVmh0dGJ3QnUyYVdETG9BTmZWbzIzeTRDK2tLRU9LWWlFWXdQ?=
 =?utf-8?B?ak1EcmQ2cmRNQ1NXWkZvaDAyTnNUUEFWOEtjNFhKVDFrd3JPY3BNd28zR3F6?=
 =?utf-8?B?cWdCUVlBOHU5aWsrVk5HczVUQnVCcE1zTGRyTXdkQ0lKRjVvOEFKclVGWTBk?=
 =?utf-8?B?d0Z3K2xhSkFNK3JoeWxYcUF6a0ZvZllGc0hvZjZvVzhoM2ZhM2xwMnZHNUlu?=
 =?utf-8?B?d1dkL09kS251SEUzZ1hLU21XTVo1OEdQcnpoQTBCb2NvZVpUM2czd1VLbHFQ?=
 =?utf-8?B?RVFzQjVNVjBYVkVwWk1YOFBGa3d0NEVuV3FoL1dudjhySlY0ZkJ6NWhpMENi?=
 =?utf-8?B?Z0hqdWl2K2dkNlpWeU5aNGFaK1pHSUsxalZJbkVMVFEzTHdwc3hRM2NhK2hK?=
 =?utf-8?B?SkV3TGExZHdmS1YvUW1abjBCSFB0TnNjajl3eklwMnY3TmxpOHpocHJLV3JI?=
 =?utf-8?B?OU03bjY0aHdtZGhhclZUOWtZZVord29JMDM5UVVjUXBPYkZtb3Z6TU94VHhQ?=
 =?utf-8?B?WnJLYWswMjhKTTFFTUZaODRFWWZ2MnIrL2hnemlpc3dyYXh6eUp2Mys2eWZx?=
 =?utf-8?B?ZlBBenh1dHlDeXpYcTN4NnUwS09aMkQ0NW5Vd1F6TDhZQ2ZpT1BuemlSWm9G?=
 =?utf-8?B?UnhZZGVZYjlTRjF3ZlBHTGFUaTBKVzdCWFhVVEFPNk5oMnVqbDYzUHg2dkVS?=
 =?utf-8?B?NTd1LzlZblJWRXptSU9jTzFidzJIRFJwamtURUFBczM4MFp4MTdoTmJ4OUVv?=
 =?utf-8?B?d3dWUjFiR1dNSXN3WFRYMDRNU0NZVlhRTHRKU1BZV1lrUjNaVE03SjBwT1B2?=
 =?utf-8?B?dkN6VFl0ZWUzMS9DcFJzU1M2bGk5MGJ1c0pXb09IM0trM0ZOaGZpQTl2eXV6?=
 =?utf-8?B?Y2FzdndzV2VwRU82MTIrOXdBOUcwQ0dNWDkrN1hoVDRSbjZzc3I4elZyNWNk?=
 =?utf-8?B?S1NWZldPVDMrOHVCV1Q0c2tzaEd5RUZZNjNVc0tBNHNWQzN5MGFGeVhwZzlV?=
 =?utf-8?B?alVYK00xQUZ3MVVWNGdVT0hRT0dhQlljYk5yK1dZeVU5RGJmZndjbVU1cFpr?=
 =?utf-8?B?YzFLR1ZCMFc5dDEwL3cza3gxaUkzZVkvdmxxYjNHMC9lL00vNmFIZjZoczAz?=
 =?utf-8?B?b2luMnJCOW1hZmpsWlRXNWtNcTUrTSs2cEV5QTRUMFVhVUNVYXNFbkhSVk9Y?=
 =?utf-8?B?SDU4MkNpbjdmcDNaWkVoYi9ZNXovMUN4eU9YM1VrWnRtTDZhcXBwSGtmN0hT?=
 =?utf-8?B?dkl0VitBWlJwc1B4VUVIeVFtc204VVpzbGRzSkNxUlRwZnh4UG9DNERCVzBR?=
 =?utf-8?B?U2xWZlVHemhXekVlTTBueE9vMFJkQWdPZEozaVJlQWhnSzRDSFBiMU9Bblhk?=
 =?utf-8?B?bHJHYm1wTTZaa0FqWjFHSUlrSHlKejNZYnUvUEV0N2RjMWh6OENBMGRMeVZh?=
 =?utf-8?B?NUJIODhaaTVPT1VlaTRUdEc2Z3lnbzNNT0ppdktFRUdTWVcxYlhPcTZDUmxY?=
 =?utf-8?B?NzNhSGUxU0JWbjFyYWdMb3pyRC9BL2lQakYxUENYUmx6SjEyelpYSUNNNHpY?=
 =?utf-8?B?SjhaS29DS1haYjcxMitFTkl4YlJpaFM3OHNiSW41OERHRnlGK3JaaUFzVGRp?=
 =?utf-8?B?NDRsMm5lN3hmQ2xYTmgzbFdkWi9nPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8005.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d74572e-7ea7-4f9d-c49a-08d9f092f558
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 14:53:42.1137 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QKz71NBvyVsP2I15XowUBSqsqWCkHqt8F/EHE+tEfD+ieSIi38B6wKW0udJRqKcLuIBPJOwsUEu2LdPnF5jt7f+XYlo9tPqL06/YjR67iqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4583
X-Proofpoint-GUID: 3jboAAx-5ock-BXCpxEgaJpZjSofu4oY
X-Proofpoint-ORIG-GUID: 3jboAAx-5ock-BXCpxEgaJpZjSofu4oY
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKb2huIEpvaG5zb24gPGpvaG4u
Zy5qb2huc29uQG9yYWNsZS5jb20+DQo+IFNlbnQ6IDE0IEZlYnJ1YXJ5IDIwMjIgMTg6NTANCj4g
VG86IFRoYW5vcyBNYWthdG9zIDx0aGFub3MubWFrYXRvc0BudXRhbml4LmNvbT4NCj4gQ2M6IHFl
bXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1JGQyB2NCAyMC8yMV0gdmZpby11
c2VyOiBtaWdyYXRpb24gc3VwcG9ydA0KPiANCj4gDQo+IA0KPiA+IE9uIEZlYiAxMSwgMjAyMiwg
YXQgNTozMSBBTSwgVGhhbm9zIE1ha2F0b3MNCj4gPHRoYW5vcy5tYWthdG9zQG51dGFuaXguY29t
PiB3cm90ZToNCj4gPg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+
IEZyb206IFFlbXUtZGV2ZWwgPHFlbXUtZGV2ZWwtDQo+ID4+IGJvdW5jZXMrdGhhbm9zLm1ha2F0
b3M9bnV0YW5peC5jb21Abm9uZ251Lm9yZz4gT24gQmVoYWxmIE9mIEpvaG4NCj4gPj4gSm9obnNv
bg0KPiA+PiBTZW50OiAxMiBKYW51YXJ5IDIwMjIgMDA6NDQNCj4gPj4gVG86IHFlbXUtZGV2ZWxA
bm9uZ251Lm9yZw0KPiA+PiBTdWJqZWN0OiBbUkZDIHY0IDIwLzIxXSB2ZmlvLXVzZXI6IG1pZ3Jh
dGlvbiBzdXBwb3J0DQo+ID4+DQo+ID4+DQo+ID4+ICtzdGF0aWMgaW50IHZmaW9fdXNlcl9kaXJ0
eV9iaXRtYXAoVkZJT1Byb3h5ICpwcm94eSwNCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdHJ1Y3QgdmZpb19pb21tdV90eXBlMV9kaXJ0eV9iaXRtYXAgKmNtZCwNCj4g
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgdmZpb19pb21tdV90
eXBlMV9kaXJ0eV9iaXRtYXBfZ2V0DQo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgKmRiaXRtYXApDQo+ID4+ICt7DQo+ID4+ICsgICAgZ19hdXRvZnJlZSBzdHJ1Y3Qgew0K
PiA+PiArICAgICAgICBWRklPVXNlckRpcnR5UGFnZXMgbXNnOw0KPiA+PiArICAgICAgICBWRklP
VXNlckJpdG1hcFJhbmdlIHJhbmdlOw0KPiA+PiArICAgIH0gKm1zZ3AgPSBOVUxMOw0KPiA+PiAr
ICAgIGludCBtc2l6ZSwgcnNpemU7DQo+ID4+ICsNCj4gPj4gKyAgICAvKg0KPiA+PiArICAgICAq
IElmIGp1c3QgdGhlIGNvbW1hbmQgaXMgc2VudCwgdGhlIHJldHVybmVkIGJpdG1hcCBpc24ndCBu
ZWVkZWQuDQo+ID4+ICsgICAgICogVGhlIGJpdG1hcCBzdHJ1Y3RzIGFyZSBkaWZmZXJlbnQgZnJv
bSB0aGUgaW9jdGwoKSB2ZXJzaW9ucywNCj4gPj4gKyAgICAgKiBpb2N0bCgpIHJldHVybnMgdGhl
IGJpdG1hcCBpbiBhIGxvY2FsIFZBDQo+ID4+ICsgICAgICovDQo+ID4+ICsgICAgaWYgKGRiaXRt
YXAgIT0gTlVMTCkgew0KPiA+PiArICAgICAgICBtc2l6ZSA9IHNpemVvZigqbXNncCk7DQo+ID4+
ICsgICAgICAgIHJzaXplID0gbXNpemUgKyBkYml0bWFwLT5iaXRtYXAuc2l6ZTsNCj4gPj4gKyAg
ICAgICAgbXNncCA9IGdfbWFsbG9jMChyc2l6ZSk7DQo+ID4+ICsgICAgICAgIG1zZ3AtPnJhbmdl
LmlvdmEgPSBkYml0bWFwLT5pb3ZhOw0KPiA+PiArICAgICAgICBtc2dwLT5yYW5nZS5zaXplID0g
ZGJpdG1hcC0+c2l6ZTsNCj4gPj4gKyAgICAgICAgbXNncC0+cmFuZ2UuYml0bWFwLnBnc2l6ZSA9
IGRiaXRtYXAtPmJpdG1hcC5wZ3NpemU7DQo+ID4+ICsgICAgICAgIG1zZ3AtPnJhbmdlLmJpdG1h
cC5zaXplID0gZGJpdG1hcC0+Yml0bWFwLnNpemU7DQo+ID4+ICsgICAgfSBlbHNlIHsNCj4gPj4g
KyAgICAgICAgbXNpemUgPSByc2l6ZSA9IHNpemVvZihWRklPVXNlckRpcnR5UGFnZXMpOw0KPiA+
PiArICAgICAgICBtc2dwID0gZ19tYWxsb2MwKHJzaXplKTsNCj4gPj4gKyAgICB9DQo+ID4+ICsN
Cj4gPj4gKyAgICB2ZmlvX3VzZXJfcmVxdWVzdF9tc2coJm1zZ3AtPm1zZy5oZHIsIFZGSU9fVVNF
Ul9ESVJUWV9QQUdFUywNCj4gbXNpemUsDQo+ID4+IDApOw0KPiA+PiArICAgIG1zZ3AtPm1zZy5h
cmdzeiA9IHJzaXplIC0gc2l6ZW9mKFZGSU9Vc2VySGRyKTsNCj4gPj4gKyAgICBtc2dwLT5tc2cu
ZmxhZ3MgPSBjbWQtPmZsYWdzOw0KPiA+PiArDQo+ID4+ICsgICAgdmZpb191c2VyX3NlbmRfd2Fp
dChwcm94eSwgJm1zZ3AtPm1zZy5oZHIsIE5VTEwsIHJzaXplLCBmYWxzZSk7DQo+ID4+ICsgICAg
aWYgKG1zZ3AtPm1zZy5oZHIuZmxhZ3MgJiBWRklPX1VTRVJfRVJST1IpIHsNCj4gPj4gKyAgICAg
ICAgcmV0dXJuIC1tc2dwLT5tc2cuaGRyLmVycm9yX3JlcGx5Ow0KPiA+PiArICAgIH0NCj4gPg0K
PiA+IFdlIG5lZWQgdG8gY2hlY2sgYXJnc3ogaW4gdGhlIHJlc3BvbnNlLCBpbiB3aGljaCBjYXNl
IHRoZSBjbGllbnQgbmVlZHMgdG8gcmV0cnkNCj4gd2l0aCBhIGxhcmdlciBhcmdzei4NCj4gPg0K
PiANCj4gCVRoZSBjbGllbnQgbmVlZHMgdG8gcmV0cnkgaWYgdGhlIHNlcnZlciByZXBseSBjYW4g
YmUgbGFyZ2VyIHRoYW4gdGhlIGNsaWVudA0KPiBleHBlY3RzLCBzdWNoIGFzIEdFVF9SRUdJT05f
SU5GTywgd2hlcmUgdGhlIGNsaWVudCBkb2VzbuKAmXQga25vdyBob3cgbWFueQ0KPiBjYXBhYmls
aXRpZXMNCj4gd2lsbCBiZSByZXR1cm5lZCBhIHByaW9yaS4NCj4gDQo+IAlJbiB0aGlzIGNhc2Us
IGFyZ3N6IGlzIGRlcml2ZWQgZnJvbSBkYml0bWFwLT5iaXRtYXAuc2l6ZSwgd2hpY2ggd2FzIHNl
dA0KPiBpbg0KPiB2ZmlvX2dldF9kaXJ0eV9iaXRtYXAoKSB0byBiZSBsYXJnZSBlbm91Z2ggdG8g
Y292ZXIgdGhlIGVudGlyZSByYW5nZToNCj4gDQo+IHBhZ2VzID0gUkVBTF9IT1NUX1BBR0VfQUxJ
R04ocmFuZ2UtPnNpemUpIC8gcWVtdV9yZWFsX2hvc3RfcGFnZV9zaXplOw0KPiByYW5nZS0+Yml0
bWFwLnNpemUgPSBST1VORF9VUChwYWdlcywgc2l6ZW9mKF9fdTY0KSAqIEJJVFNfUEVSX0JZVEUp
IC8NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCSVRTX1BFUl9C
WVRFOw0KPiANCj4gc28gSeKAmW0gbm90IHN1cmUgd2XigJlkIGV2ZXIgc2VlIGEgY2FzZSB3aGVy
ZSB0aGUgcmVwbHkgaXMgbGFyZ2VyIHRoYW4gZXhwZWN0ZWQuDQoNClRoZSBjbGllbnQgaXMgZG9p
bmcgdGhlIHJpZ2h0IHRoaW5nLCBhbmQgbW9zdCBsaWtlbHkgYXQgdGhpcyBzdGFnZSBhIGRpZmZl
cmVudCBhcmdzeiB3b3VsZCBtZWFuIGEgc2VydmVyIGJ1Zy4gSSBkaWQgYWN0dWFsbHkgcnVuIGlu
dG8gdGhpcyBjYXNlIGJlY2F1c2Ugb2YgYSBzZXJ2ZXIgYnVnLCBzaG91bGQgd2UgYXQgbGVhc3Qg
Y2hlY2sgYW5kIHJlcG9ydCBhbmQgZXJyb3IgaWYgaXQncyBub3Qgd2hhdCB3ZSBleHBlY3Q/DQo=

