Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6325AA67A
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 05:42:12 +0200 (CEST)
Received: from localhost ([::1]:49376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTxZL-0001Ye-3y
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 23:42:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1oTxXc-0008OA-7w; Thu, 01 Sep 2022 23:40:24 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:8472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1oTxXX-0000cj-Vg; Thu, 01 Sep 2022 23:40:21 -0400
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2821OAFf017931;
 Thu, 1 Sep 2022 20:40:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=pNxgZGibUgK6jYBysJ9nLzzGKU3TkBP+2tErJO5I4w4=;
 b=rup31nolZa/QPhIk1n36vZYdH58uiF9dIVWu7Gu9Wh5oKQWN5dBhE9mzrS5rDJQuPQzE
 HH6066irWJu8iWPNN7ZamMUhcQxYDwBLOgwZa2nXzL3vb8aXy84Qlja4ZG/yIEPIBXXs
 5+bRvRrPHEaXAuGixBOh8KKNV/U8SFoJSt5NxQlITGrIZEqnr9QS9aBQCGTWr/RMrVdl
 JEbHCDBtfN8h/cc7wAIZgxnE+yxp1qHdtQBYpQtsVXSyaVy/iJQxPNT6tyre8F14yemj
 6f2eJabT1OZOM1rVwm8ZLeTQKNm7yTXlDUkSoYIV6ucNHZwKqlcti6yIjPwp4PDOwz6C OA== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3j7hcknkfm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Sep 2022 20:40:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l7cH2j+RLSzGN/O390zwmVmrP72LaThkT0E6vAAKoD4Fg6e9dPc72adZ/i6PDzWTnIhkHMS74L7Z5xeZVWE6oHn1Jy92lpVa8P6jb8/Dd/33jHuSbyroqZ13aTy4JKEy6TyX1bjI9WqDy6Bc0GSm6eMzX5yaQGW7bdg5qorOTJuGP4U3lGnFENcr2zgbZf849sXA6UEdFIo5nKnOhGJPJouzHCzK+NL8daRxc+bZq3mXsl8Xt1+5yMrE8UAGLURD6XQ9JM0vmYDaX1ogECL194GzPWfae1nh04v62C7vmA2P1re0kgF0pJOZ6/G2iMrBdVgYaCmUFBMRbj/e6itybQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pNxgZGibUgK6jYBysJ9nLzzGKU3TkBP+2tErJO5I4w4=;
 b=izL/cVmIN7nIZd4oCgjluuPqALpsZK3CBll2pLZ60ToT70tHnJuO3TrbXd7SdIThdqZfA/MagfqIzPIK75arTUdy2jYeMMUrFnaEco73T+VCcyRny950m2w6Vg+S5EuDIsJy3G+GGeiDEixEG5ufUHcTCuCLQTImDFVkFyHpZ88a3YNBKeNAdRSqBFeM38keZdXSJAM9EMdHU+bI4ybNGyl3wayECeI1Pne2nadE13Yrw8cl2whEVyrpTZllGitY82Fyx63vP2fueXzqftzXWjvVCDFsO8au8bkjrNi/hCeOztHRVLLvlZKkeaaDsYCilYli9q0LHbZNKJ3jGRJvXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by DM6PR02MB4889.namprd02.prod.outlook.com (2603:10b6:5:fb::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Fri, 2 Sep
 2022 03:40:12 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::e8ab:ff5d:aded:71ea]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::e8ab:ff5d:aded:71ea%4]) with mapi id 15.20.5588.014; Fri, 2 Sep 2022
 03:40:12 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Daniil Tatianin <d-tatianin@yandex-team.ru>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>, "mst@redhat.com"
 <mst@redhat.com>, "stefanha@redhat.com" <stefanha@redhat.com>,
 "kwolf@redhat.com" <kwolf@redhat.com>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>, "jasowang@redhat.com" <jasowang@redhat.com>
Subject: Re: [PATCH v2 0/8] vhost-user-blk: dynamically resize config space
 based on features
Thread-Topic: [PATCH v2 0/8] vhost-user-blk: dynamically resize config space
 based on features
Thread-Index: AQHYuVjJhrgmMqAbxUGHszMVg9tO4a3KZpaAgADOTQA=
Date: Fri, 2 Sep 2022 03:40:12 +0000
Message-ID: <B4686B56-0357-4477-8CDF-89DF9A0F31B7@nutanix.com>
References: <20220826143248.580939-1-d-tatianin@yandex-team.ru>
 <292621662027678@mail.yandex-team.ru>
In-Reply-To: <292621662027678@mail.yandex-team.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.63.22070801
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38956e79-16ec-4356-559c-08da8c94d74b
x-ms-traffictypediagnostic: DM6PR02MB4889:EE_
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OQ9i0rEHntIv/EGPcUZr3wAtWl8mdoOEM5JOfrqiBNQBK6SO6AImuy5K46Ic9DWaDOqN8/pseioKPrVEwLOG/9nYF3gdn4agq4hOVPjHRLCo6t6CB/DJCuLQ3IP3e1IhPDaqdfBZnaRuCmZFKP8Hqczmyqckb98byVSZH9ncRI04hSFOlXOUQRYxTMxVCCYW1J642F/WBabow+Ga1Q2+YWysoNsUtyi018I2zTpw9Z6sAih2kYokD0hoIoJyJcB69f5Pml7QdhVBBFW7SQTBTEmLvgudlaRp6pyo168/xJa7gG0fkK6QqzZP/CJxvFQut/zOMUxN1bK8Nlsnnuja3Y8Vkxr0Bad/EU8NcRSsoCflyy8YJINfmxtBvzFThcPGZabkT9fxw6WoCs9tbOvBLTKxJsKYUBGLCnh2NPZzA0PoRUTpEhAQuLNUPjZAKUWclGs5s+CJsRPuIhlxqt9SMfQOUU4+37RT3PVsWusRxJC/5OAhVMIy966uSMKlh20SBnx4mwz2JbfEDOO4J+YCYHtFrAmcS9qeHjn374yPMG3e6i/gp6MvP03DDakZoBburx4HzAfa3PRWBK+Td+ughd2amJrC05m5HVeknvsihjDkhISemZ+KHeIDcFfMauHN/UH+l87L7AFvZbkjLj2OwAaTJRY13TF9PcJok73Z5lK78lQBOoKkpgMR9crZQXgnsufo0gnRNo/ODePr0WsXROqwfQTpBEPzHrTLYSZHejB4KVSRj+67qDR36y5FVSqtlu0YQ/7bnv3XLBdPmxaIasl/MngMGozVxcDuPRz4utI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(376002)(366004)(39860400002)(136003)(346002)(122000001)(38100700002)(38070700005)(316002)(64756008)(76116006)(66946007)(66556008)(66476007)(91956017)(66446008)(54906003)(110136005)(5660300002)(4326008)(8676002)(44832011)(8936002)(186003)(2906002)(478600001)(26005)(2616005)(6512007)(6486002)(6506007)(71200400001)(33656002)(36756003)(86362001)(41300700001)(558084003)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?clk1OVIvcllKQ2hxMVl3dVVEcDAzVVRPMDJUcTlWVzNwUlVNWUhGVW9tT0Ry?=
 =?utf-8?B?ZDE3ZlJIU2V3RitJU0J6RHVzazE0R1Z2VnhwNEt5SWFwekI3WDlseEtvWlVQ?=
 =?utf-8?B?Zm5xL1dQWXlPWVZQS2RydGE0S3dCRzY5c0hwc201cHFQTVlhcm9nSkd5R1RJ?=
 =?utf-8?B?RFVXNzZ5eWx5eG84UmdoVmdVdDVHL3AzYWwyU1FSUkJNQ2poNmRFUVJFK0NL?=
 =?utf-8?B?bUQ2M3pmVjROSzZxSnlRWXQ1TWZrb1JrRjM0eHZ5QXcyNUpHNGJJeXNNSjdF?=
 =?utf-8?B?RXNDM21FK2creGlhbFJkY0hRS0hCY0h4Mzl2ZFRDcU9CYURKNUlOTngzanNq?=
 =?utf-8?B?RU9QcDBkOXJDbG1EZG1wdUxGTWpmMWRCMTZsQStIUlV3OGE1UFJLc20rTGM3?=
 =?utf-8?B?Nk8zVkZ3VGtZcDJVK3AzVUFMU0VVNFhYSVJOdDdFNlNSTSs3bkpuQUlOUHBG?=
 =?utf-8?B?ZUFqZDFvd1krVlZlUDQ1aEQydGxOd01xTGRXNmg4cDgzS1pIZG04bno1Qmtq?=
 =?utf-8?B?Z2F5ZXZQcHh0alJvQjVlMnhPcHdieDhXbGJLUkh5UTM0amM2dXZ5ZFd2UmFZ?=
 =?utf-8?B?Ry9ERWZaWW9CMHh0MHJFV3VwRmNxRkV2RHVDdTlnOXNSdW53ZUgyTWwxZVYw?=
 =?utf-8?B?cU5ndmFMWDdKb280b0NuNzY5bXBzT3UrcXlRVGFmb0VzZWQzWUJkc1gvaDE4?=
 =?utf-8?B?Wkx5WnlhYkhnQzFDMTFBaHNicWt0OTllL1JoK0FRMDlreVZuSXB3REJObDNX?=
 =?utf-8?B?SHh4aWt5ZGdzS3FkalNIcEIxdEt6T1ZMOEZJeU1Pcm9haFVka0J0dGJ3VGhy?=
 =?utf-8?B?ZnNLQjdNeTF2STQ1M3F5NjROVnpFd0ZiNHArSmp4Uno3M1BudXFCMk5nOGhh?=
 =?utf-8?B?Zm05ZFV0Q3grdytmcFFvaHdjNFVHcjZKZFNJcnMrVmRvT21yRGdjTWR3YUhZ?=
 =?utf-8?B?U1Q5REFhOG5hYmdSbndHbGRmUEpCTS91NEVrUG5TclJsdUJGaTZaeDVxVWVL?=
 =?utf-8?B?cUhHRWtjMWkxRnpRKzdyUlZBMzhkMVYzb3dCZUJZWEc1aThYK1QxeFpRUENn?=
 =?utf-8?B?YTRYZWt2SFpDalRjYmkrSW9iQnRpODQ1WDgyUDVXaXEwbC9mblM1RjdqSFgx?=
 =?utf-8?B?VFFPNXFzRjVHUEV1YXJHckZ6clRSWkUyc1JidmdLOXlROU13cXNpd1VlQ3R0?=
 =?utf-8?B?TlZmT1IwVG9XNjUySFZCQ3I0SnVYbW5pbFlXNWhwYTBOUWo0ekxpWXpIdjF1?=
 =?utf-8?B?T1J2d1R5S2RFWkVtK2xRaXFNWGpKdGx6K0o4OW5hakpUQkdHemgyVG5uWkRE?=
 =?utf-8?B?YnBpWkpUYkZ6QlpQUWx0SDVHZWwvTUE2MmpMaVJ2TW0rc0EyOTh2SGtXVnlE?=
 =?utf-8?B?TjJjSWhRVHY2bTNReTU3V0VMb0UxanJyNjBxZ3krOXpXZElUUUpPVWUrSlhK?=
 =?utf-8?B?MlBMd2t4VDdqWU8yNWRubEhKNWZyUkRNUTI0UkhzdzVDWThxZWZvWTB2RkhY?=
 =?utf-8?B?bitPTWRveE9iem52UkZBVEUxMFlydDZMckRFTC84R3luNTdQSGJPbExsRjNE?=
 =?utf-8?B?SCtHcEJWcEhvMWw0aFBGVTh3aWpESmV2dEExUU9NMWgrbXNTMWNzUThHL2Zm?=
 =?utf-8?B?dG56V3AwTmpnNzhpQXZOU0N6azNDaWxJMmhMRlNiTERvcGM5dHNEUHdrbkxv?=
 =?utf-8?B?c1RSd3NNS0F1MnJEclY5SUczV2E3SHJ3UGRrSzZYVm04L0g1K09XWVMrNURi?=
 =?utf-8?B?cUl2NTduYVRtTkdkWGkzZnF3YkY1UjVrVTNxT2hDQ3M4eUsvSCtXZXc1VFA5?=
 =?utf-8?B?dWIwQUZjVW9QOUlJaGNkSGNYL0VvaHhJeXBIK0R6c3NjcVFpV2VjellrYnhL?=
 =?utf-8?B?cnRPbE1BbEg2djlWQVNKd1FwRnE4UnRQSFBCNlZ2RFFOUzd5cVZsOFpWVFhP?=
 =?utf-8?B?NDYrTVZ6dEZPNnI4WXpkTkRRMHY2bVpGVGMwQSsxaVB1dm9ZbTBkNkxXeSt3?=
 =?utf-8?B?bytXQjhWUWFCOGtzZE9EZWlOdjdYT0JFZGdxdWRIQzZsajJkQ3BKV2poaEEy?=
 =?utf-8?B?NHdZLzQyeDZpZ0V3bFlMcVBmS2pYVnkwQjhRbnhITFV0bDlaUzgxTmlnOGhZ?=
 =?utf-8?B?ai9QR3NaMEdQRkdhQ1pyeGFZYzlJZXNrUjFpcThGNjdpNWJOUndscERjZXY0?=
 =?utf-8?Q?Gwu+xPbZXqNtlK11lM6LOBU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3A0407000981DA42846CEB8BE36AE11D@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38956e79-16ec-4356-559c-08da8c94d74b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2022 03:40:12.1121 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NVFeE90z6AquyX2twlR6V8+Rr8v4sdmYbmm+yi5pqzx6XwQCwuet8VrRjOZWKxotLuNt9todwmeb8pbKw3tEyNrqclsWi1HF2WB98uMYLe4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4889
X-Proofpoint-ORIG-GUID: o2agFmXt_DRq1sB6KNlg-fjmyPkrE7ok
X-Proofpoint-GUID: o2agFmXt_DRq1sB6KNlg-fjmyPkrE7ok
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_12,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

PiBwaW5nDQoNCkFwb2xvZ2llcyBmb3IgdGhlIGxhdGUgcmV2aWV3IC0gYnVzeSB3ZWVrLiBGaXJz
dCBwYXNzIGxvb2tzIGdvb2QgYnV0IHdpbGwgcmV2aWV3DQpjb21wcmVoZW5zaXZlbHkgdG9tb3Jy
b3cgb3Igb3ZlciB0aGUgd2Vla2VuZC4NCg0K

