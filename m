Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 897FA40ACFF
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 14:05:02 +0200 (CEST)
Received: from localhost ([::1]:35548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ7BN-0003dI-Jb
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 08:05:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8891b7d124=pdel@fb.com>)
 id 1mQ76h-0001Ge-J8; Tue, 14 Sep 2021 08:00:11 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:42402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8891b7d124=pdel@fb.com>)
 id 1mQ76e-0004RU-HV; Tue, 14 Sep 2021 08:00:11 -0400
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18E1Jufq002599;
 Tue, 14 Sep 2021 04:59:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=XNjBQdl7IFW4NxJCVKLvsde73njD2OhQUN8g2aYJnUw=;
 b=SE+gW51+2UjWoFnnmkyCEyZ0+5TBxr9eVDA9BI97HpnrI50qRcSbIXQXfDjSUS6WdMQb
 XFkN3S1pkOoJY+/XZ6w0UIAVOBUDbNADmpCvxqalwYQ3uBz6nrkhu/LLyumgRVX7h0yf
 IrkeMOIu8/ejdDsP4o3XoWSVfFPxaPwfkpc= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 3b2hyqjqj5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 14 Sep 2021 04:59:52 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Tue, 14 Sep 2021 04:59:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g10Cr3q5UKmyRmrPhhcq58lNsXFFYBRYGfUzOjzJJ5Z5kfLqOeZ8Jse/W/wKVZb/3KBsS63vj04M39Bctqx+uX99jGS6a9hq/veL8ehPv9YXzdZNi61w85EQN7fk10BJMQFkTTxsCIUaxaj9s5JnUhg3A8qvrMuW+w5QnGRLryBa3JHdvwUiRzhr2qkmwYTzXpbIaXk8+ft5dV1776+qfdOdGLEdg4dWLzza6FAmD6pBEfCW1TqWtuZSGRqbPYyUYpstDAKnz6zSCmcA7aS+FfjnobUB06G5hmi1ZCcoFolNKkfdTYkgCbmkEKrc1d9vWj+SrZ1nnhX55xm6GXnwKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=XNjBQdl7IFW4NxJCVKLvsde73njD2OhQUN8g2aYJnUw=;
 b=An2x/prSbR21yBgsaTYDhGGQ4wafw/yP6VKW+tTFQCFjM+wdWFvWCZm/l2x6LtdyPEHa+DhWsY++OGgURgli2AZyXTnE5B/rvTEddbIPlpfBgGRDlDPbs12zLDlTPGNVcUCTL7563FvS/BIMfjKfsdAkxhfmZX53TwtzDGXsXFGN+3V/0mP4I3oHgUruoBxobRfYEu0OQVkkuBOfdP3jFeZ5p/tx8YfA+gHnEcbuO7ZPtPhBPMpJ4R0WrPTr24AqtRY6lRg3eroNDIa+QbWP64o5HDsxurwVHjAuUTTw18MsxoMo5TkRb4M16dfXCN3QpHviOMeDKYNp5Pc/4uioFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by BYAPR15MB2390.namprd15.prod.outlook.com (2603:10b6:a02:8f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Tue, 14 Sep
 2021 11:59:50 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::38da:f6f6:bb5c:dd5f]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::38da:f6f6:bb5c:dd5f%7]) with mapi id 15.20.4523.014; Tue, 14 Sep 2021
 11:59:50 +0000
From: Peter Delevoryas <pdel@fb.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PULL 14/14] hw/arm/aspeed: Add Fuji machine type
Thread-Topic: [PULL 14/14] hw/arm/aspeed: Add Fuji machine type
Thread-Index: AQHXqLpG+wOZRQHbMEGcuynqDTRtJaujXPqAgAARnF0=
Date: Tue, 14 Sep 2021 11:59:50 +0000
Message-ID: <BBC4A4E0-651C-41DB-81DE-1F6D86AABAB1@fb.com>
References: <20210913161304.3805652-1-clg@kaod.org>
 <20210913161304.3805652-15-clg@kaod.org>
 <88c26520-6b87-e7a2-ac78-c1c92477c814@kaod.org>
In-Reply-To: <88c26520-6b87-e7a2-ac78-c1c92477c814@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=fb.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6d8ae864-de78-4ac4-6e48-08d977772835
x-ms-traffictypediagnostic: BYAPR15MB2390:
x-microsoft-antispam-prvs: <BYAPR15MB2390BA2991F347D619C1C107ACDA9@BYAPR15MB2390.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6Zi0PtXvBZl6nifn7rLrCJmtwuu4AjspI9uCRxvRzff5JXDkvmzSuhT3apFg5JeWe3RT6VoyidV1bR4wUC1PMDob4QDRoa/cFu7TfqSwRXJj57/qPCzkkkpqELivnNzGEIfgMp+V7Os6BreB1iSNbpYOqn4WFHIJL+9qeajRBXA5+TV6DknCqcv9GiioKUT7JF5+kXeHZBQMAz6wAhbRcxaVDQNP6FdeTt0YjNwulH8+lxfyLHCqpnKFxmd1dCa2b+27rXWKAtXQm7WTcnPPyO28FoLSBP5q2C+SB05IcdlleNjRsuPzthssVqWjeePQe31xL7PaAVWN4+7yLkpYA6sqYIJf6yOIODcN4W6CXXfwTGZd7zIEW59jGm2MPK2iJLokVHqaNcf/bTgRV0PmqaGHmRlOb4cit0mfpVRwWG3goQVExujOmWRFwc1hBJnT5xiTr2p187S+hEWldAoLs4ulfELrClBy7mAAJO3GpBo6mPltZ/HDIQPkBSFWRjq7oA5EU8v16jHlHvNDGnR0iB3JaAb0Sh1XuRPLxEEp7nMxjH7y6xgczQixAhN/f5zl528sfrSPAy2dAxtTQNTCOXDEBl/7EMMtsgd4h3pevNCVcd6KJ5Ms+SjKvhV4Irogl8CLkCufKzcaBSQEBAwdQdhWltWaR+pwJov1sf2K92b9o7mVeKdL8FLEj/4n8ulLbA2YrAcUADJhfdQrECvfuPyI8G/Bh6pJeLYvwTxSrBg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(6512007)(122000001)(66476007)(66556008)(66446008)(64756008)(38100700002)(86362001)(5660300002)(2906002)(36756003)(8676002)(4326008)(66574015)(71200400001)(2616005)(6506007)(53546011)(8936002)(508600001)(6486002)(54906003)(316002)(186003)(38070700005)(6916009)(33656002)(26005)(76116006)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MCs2YU1GVHhJMzJydnB0QmYvdXQ5UTJHS005blBNMS95UVN0NjR2U3dla2dx?=
 =?utf-8?B?d2RxMitzMllZR3AyMCtPdVY0ZFVGemZJLzVTYWMrMjJwb20vNytXVVRIZ1o2?=
 =?utf-8?B?VDZpbUt6SjJJT3U4dlRwa2FWTGtQNGxwWmdrWGpvTjROSGE3c2lIOEtoN3ZV?=
 =?utf-8?B?cEJyc2ZaNHphNjkxQjdHd0FXUHV2U21lMTJEMkhGelQ2a0MwdUJEZDRFNDNI?=
 =?utf-8?B?LzRyc3BMbW9VUjNHcHloemNpSHcvTUhBWTBVRGVPUkpqQkhKNUU0YXphaWp3?=
 =?utf-8?B?cmtZMGw1K2I3Z0FpRy9pcWJLbDVSVUlGdkE3ay81SHNVQ3l4VkhrM1NDUkJQ?=
 =?utf-8?B?ZG1xbzBCQjQ2UnRxcUFUN1c4OTcrZmhxNGk4dWUwUjJJazZBMlNnelZYc0FD?=
 =?utf-8?B?ZmFSS2wwWVhHMGFIMEJIcENZVHJHMG9VeUw4YkplaHdCMVdOcWY0S0JrcDYz?=
 =?utf-8?B?MG4xYXRvb3dWS29tZzh6NktnWWEwYXJ0a0xnSmd5eHB5a0RITmxBMjhVamQ4?=
 =?utf-8?B?ckRaRXo3VHVjb3dLWDhPZ0w2WFpDaGtGZS9CeVlxUXIwaUJMMFFyaTQzSHNT?=
 =?utf-8?B?NkwzOUxtS0xNUDl2a2g4MGxITVo0aFNwUVpkMWpObVhCeTlFNlI5V2VrR2FX?=
 =?utf-8?B?UEt3NnU0R3M4Y0h5RmlPVnA4YXhOTDRiRXBFbU1FWGdUWWdPQVNLalBacDVv?=
 =?utf-8?B?TDJnK0NNdHJTK3RXR1dzeHJPdGhqRXJXVmZSRkZZbjhZMldGS24vQmFxZDZK?=
 =?utf-8?B?YmVXc1VjRytGbEtZUzh2VE96QS9XQ1BGQmRXM1ZtTjZYcEFUOGViZmFaRDlv?=
 =?utf-8?B?dDUxZWFKWGExT2tuNVR2cEg4REN2UnpmelkwWHdlM0lKNjFIZFdNV0VCRUV3?=
 =?utf-8?B?bkZVVHlKb2VrTVhYQUJvdTg3RDAxeWhjYzNXYU9HQ0ZCRXY4YXZSK01NczdF?=
 =?utf-8?B?RysyWElFVXdZa05KOEFaSEw5TjI1Zk1Kak5aeVZENE1IYS9GOGxKdGVHdndK?=
 =?utf-8?B?VEtwaytXMTlCZXpmZFJWODlMMWMzRUFlN3FlaUx3aHJ3clN1dHVIZllOdFkr?=
 =?utf-8?B?TFJXaFFhT1diYlVHK3BzNnlqajl4OERQUG9IYTVsL1V5VFNNa2dZSDdiaVRo?=
 =?utf-8?B?WlFMcDFEU0ttNndBdkZBMVdpcytmc29Od04vb2JQNXFENGttdWJjM1ppa2xi?=
 =?utf-8?B?d2ZvWVJkcUc0RjRxR2J3elJib1o4SnhIOHVMb1NYTllJdTRwZnFQNXpBeThK?=
 =?utf-8?B?UzN4OHV3Mkd4WlZPc29wN1RyM0F3L3RhbWZrNGJxNFQxaVhoeGdjcElwQmtn?=
 =?utf-8?B?eVFjVEdDZVBuT09sU1VIN1pWUHJmaDMyTjdiNXpENHdJMkY0Wmx1RUdINllm?=
 =?utf-8?B?Z1FpcVgydXBkN3R3R0djVElyTzlBOEpVTjRBcDJ4SUt4RWZpNGpORDlrT2J2?=
 =?utf-8?B?V0t6Wm40QzlCNVpjNFY1bkxTZmk0ODZ5MXRSa1lsOWFrbi9rSkpGVmZvZFp6?=
 =?utf-8?B?L202dXptVlZ1OEtaUm42RjZKaU1CVFE4S3loak1mdFlHZFNlRk5CMTNEeHow?=
 =?utf-8?B?cE1LQ2RJOW0rUzFIb0ZIbWdBaG12b0pmTS9TSUYySUcvNEMxaUEwcnJnejhp?=
 =?utf-8?B?WWNFRUhTODZuek8wcW5qa09ubjZES1pudDJxeFI3NnRlZlE3YXBEOStTUVg0?=
 =?utf-8?B?Sk4rM2VpMUVtUGdtdVNETFMyaW9WTklRU3A3dEpMSWE0cWIyYUlabkhReDVx?=
 =?utf-8?Q?tFNNMDCpXKViHtd9HNX3EKzwWhizDKMdzGjubIQ?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d8ae864-de78-4ac4-6e48-08d977772835
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2021 11:59:50.7420 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GLBoliZ5w1ALQRcChdWwQXE26gp33GC5aLHgodKpg6q00iAuUJxMjhzy3yrGXLZq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2390
X-OriginatorOrg: fb.com
X-Proofpoint-GUID: 6PAsDw3sEnmlBOqzJlEhmqyDtfJWA8GW
X-Proofpoint-ORIG-GUID: 6PAsDw3sEnmlBOqzJlEhmqyDtfJWA8GW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-14_03,2021-09-14_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 clxscore=1015
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 phishscore=0 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109140075
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=8891b7d124=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQo+IE9uIFNlcCAxNCwgMjAyMSwgYXQgMzo1NiBBTSwgQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0Br
YW9kLm9yZz4gd3JvdGU6DQo+IA0KPiDvu78NCj4gSGVsbG8gUGV0ZXIgRCwNCj4gDQo+PiArc3Rh
dGljIHZvaWQgYXNwZWVkX21hY2hpbmVfZnVqaV9jbGFzc19pbml0KE9iamVjdENsYXNzICpvYywg
dm9pZCAqZGF0YSkNCj4+ICt7DQo+PiArICAgIE1hY2hpbmVDbGFzcyAqbWMgPSBNQUNISU5FX0NM
QVNTKG9jKTsNCj4+ICsgICAgQXNwZWVkTWFjaGluZUNsYXNzICphbWMgPSBBU1BFRURfTUFDSElO
RV9DTEFTUyhvYyk7DQo+PiArDQo+PiArICAgIG1jLT5kZXNjID0gIkZhY2Vib29rIEZ1amkgQk1D
IChDb3J0ZXgtQTcpIjsNCj4+ICsgICAgYW1jLT5zb2NfbmFtZSA9ICJhc3QyNjAwLWEzIjsNCj4+
ICsgICAgYW1jLT5od19zdHJhcDEgPSBGVUpJX0JNQ19IV19TVFJBUDE7DQo+PiArICAgIGFtYy0+
aHdfc3RyYXAyID0gRlVKSV9CTUNfSFdfU1RSQVAyOw0KPj4gKyAgICBhbWMtPmZtY19tb2RlbCA9
ICJteDY2bDFnNDVnIjsNCj4+ICsgICAgYW1jLT5zcGlfbW9kZWwgPSAibXg2NmwxZzQ1ZyI7DQo+
PiArICAgIGFtYy0+bnVtX2NzID0gMjsNCj4+ICsgICAgYW1jLT5tYWNzX21hc2sgPSBBU1BFRURf
TUFDM19PTjsNCj4+ICsgICAgYW1jLT5pMmNfaW5pdCA9IGZ1amlfYm1jX2kyY19pbml0Ow0KPj4g
KyAgICBhbWMtPnVhcnRfZGVmYXVsdCA9IEFTUEVFRF9ERVZfVUFSVDE7DQo+PiArICAgIG1jLT5k
ZWZhdWx0X3JhbV9zaXplID0gMiAqIEdpQjsNCj4gDQo+IElzIHRoYXQgdGhlIGRlZmF1bHQgb2Yg
dGhlIEZ1amkgYm9hcmQgPyBUaGlzIGlzIGNhdXNpbmcgYW4gaXNzdWUgaW4gb3VyIHRlc3RzIDoN
Cj4gDQo+ICAgcWVtdS1zeXN0ZW0tYWFyY2g2NDogYXQgbW9zdCAyMDQ3IE1CIFJBTSBjYW4gYmUg
c2ltdWxhdGVkDQo+IA0KPiBDb3VsZCB3ZSBsb3dlciBpdCBkb3duIHRvIDFHID8NCg0KWWlrZXMs
IHNvcnJ5IGFib3V0IHRoYXQuIEkgdGhvdWdodCBpdCB3YXMgMkcsIGJ1dCB5ZWFoIGxldOKAmXMg
anVzdCBsb3dlciBpdCB0byAxRy4gSSBtaWdodCBiZSBjb21wbGV0ZWx5IHdyb25nIGFueXdheXMu
DQoNCj4gDQo+IFRoYW5rcywNCj4gDQo+IEMuDQo+IA0KPj4gKyAgICBtYy0+ZGVmYXVsdF9jcHVz
ID0gbWMtPm1pbl9jcHVzID0gbWMtPm1heF9jcHVzID0NCj4+ICsgICAgICAgIGFzcGVlZF9zb2Nf
bnVtX2NwdXMoYW1jLT5zb2NfbmFtZSk7DQo+PiArfTsNCj4+ICsNCj4+IHN0YXRpYyBjb25zdCBU
eXBlSW5mbyBhc3BlZWRfbWFjaGluZV90eXBlc1tdID0gew0KPj4gICAgIHsNCj4+ICAgICAgICAg
Lm5hbWUgICAgICAgICAgPSBNQUNISU5FX1RZUEVfTkFNRSgicGFsbWV0dG8tYm1jIiksDQo+PiBA
QCAtMTExOSw2ICsxMjI4LDEwIEBAIHN0YXRpYyBjb25zdCBUeXBlSW5mbyBhc3BlZWRfbWFjaGlu
ZV90eXBlc1tdID0gew0KPj4gICAgICAgICAubmFtZSAgICAgICAgICA9IE1BQ0hJTkVfVFlQRV9O
QU1FKCJyYWluaWVyLWJtYyIpLA0KPj4gICAgICAgICAucGFyZW50ICAgICAgICA9IFRZUEVfQVNQ
RUVEX01BQ0hJTkUsDQo+PiAgICAgICAgIC5jbGFzc19pbml0ICAgID0gYXNwZWVkX21hY2hpbmVf
cmFpbmllcl9jbGFzc19pbml0LA0KPj4gKyAgICB9LCB7DQo+PiArICAgICAgICAubmFtZSAgICAg
ICAgICA9IE1BQ0hJTkVfVFlQRV9OQU1FKCJmdWppLWJtYyIpLA0KPj4gKyAgICAgICAgLnBhcmVu
dCAgICAgICAgPSBUWVBFX0FTUEVFRF9NQUNISU5FLA0KPj4gKyAgICAgICAgLmNsYXNzX2luaXQg
ICAgPSBhc3BlZWRfbWFjaGluZV9mdWppX2NsYXNzX2luaXQsDQo+PiAgICAgfSwgew0KPj4gICAg
ICAgICAubmFtZSAgICAgICAgICA9IFRZUEVfQVNQRUVEX01BQ0hJTkUsDQo+PiAgICAgICAgIC5w
YXJlbnQgICAgICAgID0gVFlQRV9NQUNISU5FLA0KPj4gDQo+IA0K

