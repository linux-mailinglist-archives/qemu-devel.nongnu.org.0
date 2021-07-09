Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3763C1CFD
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 03:19:27 +0200 (CEST)
Received: from localhost ([::1]:33178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1fAr-0007xp-Qe
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 21:19:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1m1f9o-0007JL-Lf
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 21:18:20 -0400
Received: from esa14.fujitsucc.c3s2.iphmx.com ([68.232.156.101]:53468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1m1f9l-00075A-UG
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 21:18:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1625793499; x=1657329499;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ttKmo8iVgwkfvp0tn65V6QvxaNPVa/RhmWoQiqsYixA=;
 b=qkr3ns91+jA2Ryi98niQly0Uao2rv7kbszz+XP5VU4jjKDQhk5VKRaBb
 mqIY0uu5V7G68K/4Cu6jL8c5EIF5d9dWZyhrM0uHCwGsMyoboImQvlfvv
 z0JbxMRqP97MUMqKKt2/qyojIRz8XiiWSVbtT8U7HSAy/kfRXkG2exnj6
 m6GIbDRQMdBFhNT+4N7UNcybfWgj/BTzoKltK55lcvP0Bhw65yuMwz9kD
 vC4uJW2Dl0fUXLYxQk25+qAr0tr00PHYH/HBsVbxpJPTQ5Nls9hGOA/j3
 /HXyj2yVODGrjxh9yhTU6rzJMPXaear6CdnbjHmntOZBMaA2EDTgPid6J w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10039"; a="34523886"
X-IronPort-AV: E=Sophos;i="5.84,225,1620658800"; d="scan'208";a="34523886"
Received: from mail-os2jpn01lp2059.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.59])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 10:18:15 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqfIOmUySaJdL769Jpp2VcjkWuUtlI8Ko3YmdAgCWxojX2aR210GohK2GKaXX6aJOhXrDv7Cb0IWT1rH8AfRFanIpfyi/OkLOHFUG7SrazYT10XD6iX4dpA8YSECj/eKHrFYkAWSxJ9Iya515cyAEQsHqG5eFMl4MOhwf6yNJOgN1rVwq/VBD6rJ39mnOdjMHJNFm1yJUljVg6YG670FZNSJQ6H3l7NPblSvL2kicd+j38fcPE9D7KgVAi1AN6v90H9Brj6aCH4FxWumQDJjGcjZvl7TBzE1/Lj3KOhPXMig0i7VoB6TUqZj8Teclfq3z16cH/6JpQUzXIVT5dg+3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ttKmo8iVgwkfvp0tn65V6QvxaNPVa/RhmWoQiqsYixA=;
 b=PDLRvHMv0Aqhx4DOMHxYKRx3MzL/vLJNTwIf5dPupcWifWJkqfG0zx4Mc31CVoTWeV1rkB9HsT5VnpkBXZTSt2xthRN3kpbWw0unMP40To7TpW+cEA47546FLXCjfnq0e4CNSGoi4rJhkDGq1zcerQrmXZGOXzcxIiLP8Lc4koTTHoYSNBPFy26oAPYiyb646ZWs0uaHleXpZI6eNjZuKMOJlDxO3821E9OiPwuGn/sXA8WqSrw8ht5MvQwsWQRPvHnmWFzkl8iwgByFh9M/weiul6FXYuujbgU7vSFC4O4U98J8b+jMuwHS+FbP3KenloC+q8/tNS7QAvQuqB9x9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ttKmo8iVgwkfvp0tn65V6QvxaNPVa/RhmWoQiqsYixA=;
 b=EYFlbz4AlFXoXuJHsa3GkKnFhMOTGHysj4ByjNeCYqRqFo4ffR30sARq4GZEkTfDEcpBGHFLx6/xwH7kQfKPXjab2baj5IU/qLJwKuyrVdicPmVzn5Tq8nHLLfzMVxHSQW7cGg1oJwuBPc3qBxqvBtSjLYU09jyKZ2BRMLdy6ZI=
Received: from OS3PR01MB7650.jpnprd01.prod.outlook.com (2603:1096:604:14f::5)
 by OS3PR01MB7360.jpnprd01.prod.outlook.com (2603:1096:604:14a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Fri, 9 Jul
 2021 01:18:11 +0000
Received: from OS3PR01MB7650.jpnprd01.prod.outlook.com
 ([fe80::bc5e:5376:385:ad20]) by OS3PR01MB7650.jpnprd01.prod.outlook.com
 ([fe80::bc5e:5376:385:ad20%5]) with mapi id 15.20.4308.023; Fri, 9 Jul 2021
 01:18:11 +0000
From: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, "lizhijian@fujitsu.com"
 <lizhijian@fujitsu.com>
Subject: Re: [PATCH] migration/rdma: prevent from double free the same mr
Thread-Topic: [PATCH] migration/rdma: prevent from double free the same mr
Thread-Index: AQHXdAg1jHxBBva3IkK29GPlUiJUgas5cesAgABmdQA=
Date: Fri, 9 Jul 2021 01:18:11 +0000
Message-ID: <e4c969d9-00ec-f43e-d894-b462bbf14eed@fujitsu.com>
References: <20210708144521.1959614-1-lizhijian@cn.fujitsu.com>
 <YOdNxqhcWi6sHoRn@work-vm>
In-Reply-To: <YOdNxqhcWi6sHoRn@work-vm>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e7e44747-a588-43b1-ae18-08d942776b03
x-ms-traffictypediagnostic: OS3PR01MB7360:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS3PR01MB7360C92C342EFE112DBAD173A5189@OS3PR01MB7360.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QzBAUptzUc5Pn2bGO2KhbKjMCYAvbZ7ZOcM2Bf2KCFnb0uQQWzca4Ab5hOrosn5F4mXXwaXZSG17A7nnLxr1R70IgCmvpE80/73pWIfagV503HjbEtsXDYr2sIgHB5i0u4IWM5KIUBhrJBj3RXouB/Lyx/o0+g/710KJPWZBP2IOFUcmOePiF2EoDhXahFzLeZU9y5DTFbYaOFgOCzCQTFDAABtXDamoC4fm9oSr4lpOuNDxOb/zohGtoBVfBKD1aUkI6GY6pxE2FzLeN+4P2pCL6+fg4VV5IEvVdwPCwo0LJiFjAHusFQbmxdkzkAWLByKxiNnAmgLIGQyqmnk6J4eGB1FXMBmYwZtacQ8dYxdB1XY9veMOL3Y8YCvB4vaOXowPvsUvQbG/T9uBHB1c+Mj2lenxzMt3MI9I1JUsJMYPAoK82422CwI77kkMsOQTsBujhAjCRCq3bmxqxlBaiDcqCQ9JcImcGOE31cC3ltCLCTwaRRnS0n+pb8fwkSl/A8VNZ59bMyDAv0CNcG/JJYYseDyTGfovbc1RK5+BoPD2Dqz2RWqdjEgYFybvWoQmlNTz7zJlilDyX6UFjqybRVAxGctoBWAhsIpfbHkv0ri9nj8nu9pPXX7pO5b058tXDrU5cZGIdqsLwf9kg0jUAX8bdMrSX2eJNCtHF1vMaLr/qTqMSuXL70MjfLZYPGN/67o2gy75vTLlE4jA8eyQBg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB7650.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(136003)(366004)(396003)(2616005)(64756008)(66476007)(66446008)(76116006)(91956017)(36756003)(66556008)(31686004)(316002)(85182001)(53546011)(38100700002)(71200400001)(6486002)(6506007)(6512007)(83380400001)(122000001)(66946007)(54906003)(110136005)(5660300002)(4326008)(31696002)(8936002)(26005)(86362001)(186003)(2906002)(8676002)(478600001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dk1OOENyRWpodmpJdjdWK0pOdmg3K3RiWlpXUGRUL2VZRXZib2s3Z0pIeDhZ?=
 =?utf-8?B?ejVzemYvWmVodjZlTkpydGI4OXF5bzJYNmloOTNMWC9LWHZxSkVDL01Na0RG?=
 =?utf-8?B?bHgyK3RxVTBLMlhUSncwWnFsT1E2TjBsZnVZZUZPSnFqTUV5eFNPUUVNN0xy?=
 =?utf-8?B?eWlIMFRJQk04a1lCd2hDdzdnWmlIYnlqL0tVU2dxWnZsclZRZGlJdFFSVnZ4?=
 =?utf-8?B?ZElIeG94WWhYYnB3R0ZDek1SS2g4M2RYOGNqZUl3cmR0dGkvOXRvd0g4a2lX?=
 =?utf-8?B?c1RuSG5OS0xqNnMvaXl6YUVac3V5bWpKbXV0aXM0aGsxQ3BYMHdlNWF4cFJI?=
 =?utf-8?B?bTE2aHgyYWhQUkNEaUJxd1I3U0NDWVEwcE9BSHNFNUFCcHpZcTZjQmkzUEFG?=
 =?utf-8?B?OW1NVytIemt0OW5xWnMvSGZwVGtVRkh0YU8rUzdFUzlPSkw5NmJXNzVxbTNJ?=
 =?utf-8?B?b3JobWVSOERvT3hZVElYb2dGdFE1M2dLNUF1QmpjT1JJcUF3ZUFWd0NyaEdj?=
 =?utf-8?B?bkM0NmlpSkN0R2tYL3MxRE9FV1BBcWNLTTlrSmdzNkN1RXdUeWI2OWpGazhu?=
 =?utf-8?B?N1VaWWkvWGZzdjBwSmdXSFFHa1AvaExzeldZV0NveEtDdHorTWh5eFNoM2l5?=
 =?utf-8?B?Q1Q3Y01IeE90c200UUlJSCtTdXF3YUNidCtCYmF2ZmkwVHRqSUI0V0pJNG0x?=
 =?utf-8?B?Um1OamUyTkNZTHpwa1N4bGtZdXk1SVZFbVpVMVBvRjZ0RGU2Ylk4R1VReU1B?=
 =?utf-8?B?WENwei9mcHlQSmpTZm9VaHRPVHpobE5INUtmUkpMeXMrWmlsTlJ6VGhNelE5?=
 =?utf-8?B?eHV2SGtxZFQxdUcrS21pM2ZDYU9Vd04yaExhUys1K0kzRjNnaC9HN05BRGJZ?=
 =?utf-8?B?eGI3NEpldlJ2T0JUaDh2aVRtN1I0K2pPdlQ2N3JUcTVST0dsdW85UE5KTXkz?=
 =?utf-8?B?eXJxMGgxM3dtVU5pVCtjWVlWdzU1TjM0ZEs1Q3dMUTNXbS82UVpHZHBnU1Q2?=
 =?utf-8?B?VU1iSFBOYVB0YjBCcURDR1RhOVlreDFEa2JSZkFjdVVsOHJqSk52MjdCaHpG?=
 =?utf-8?B?V0tpNEluZWMzOVdINmdaOWFYRVJBVzcrMHpudXJDK3JFRVJhZk5sRHQ3cEtG?=
 =?utf-8?B?QnV5bUtWYWoxdlpzWm5tczFwTS9Ua2FZaFJhSEJxcUl5UVFKb0t1WDlRRFc4?=
 =?utf-8?B?UnVtTG9CcHI3RXpzQWpadHpvOENBSjY4ZFIyMVJnMTYrK0tjNDRWelRIWkJ2?=
 =?utf-8?B?a1hxS2poZnVNWHZJeWxoSHhUSjNKb3lxbGRMZGZEUnZZT1JxREx0SWNCUzVo?=
 =?utf-8?B?RGltbjNZTFc4NllMMkRZaHkzeVNDVDk5MFM2SVdhaGZWZ2djUTlkbm5idGRs?=
 =?utf-8?B?eTIxcm90U3pNdTE5eC9LbDNqcmRzdS96YWkrTnpDNUM2TGdBZ1lKaXhpdGl6?=
 =?utf-8?B?YTFUL09ONGhucFlweURMV0d0TFBYcXdhcmx4VmNaaWw2RVU5ZmFxZk1jVGI4?=
 =?utf-8?B?Y2lWS00zNTRyOGdzTmdZc3B5Z3dVeWY1Yks3cjR2MFNRcmM5RGllS2JRR3lI?=
 =?utf-8?B?Mnp0a09vNm9wUzQxSTlPdk5TRUpyN1J2WjBHMTFISHQvcEo3SXk0S0cwUGFk?=
 =?utf-8?B?VTIrMFdCSXJYRjNya1R0TG5WMU1BeXZCaDFFQmpSc0V6M01nQ2N3Qk10YXZn?=
 =?utf-8?B?VUdENjd6dFJvQXFOcVA3bkVicHdoNmRubkNLMzJ4dWt6QlRIUHQrb09JdGJu?=
 =?utf-8?Q?DAingG/NIDZcm78PvgeaHya4wRUvdKlbG4TBwk1?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <39C551627A18EC4DB9DCD441838E4352@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB7650.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7e44747-a588-43b1-ae18-08d942776b03
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2021 01:18:11.3003 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u7tUWiYtn9ho+qCErUEC/hwHWU/V6MgTqG97Ykc/lY8g0dTVG35q5Z9Y7toh+0+9BkH/MG3/3x2ia+2GCISijw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7360
Received-SPF: pass client-ip=68.232.156.101;
 envelope-from=lizhijian@fujitsu.com; helo=esa14.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "quintela@redhat.com" <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCk9uIDA5LzA3LzIwMjEgMDM6MTEsIERyLiBEYXZpZCBBbGFuIEdpbGJlcnQgd3JvdGU6DQo+
ICogTGkgWmhpamlhbiAobGl6aGlqaWFuQGNuLmZ1aml0c3UuY29tKSB3cm90ZToNCj4+IGJhY2t0
cmFjZToNCj4+ICcweDAwMDA3ZmZmZjVmNDRlYzIgaW4gX19pYnZfZGVyZWdfbXJfMV8xIChtcj0w
eDdmZmYxMDA3ZDM5MCkgYXQgL2hvbWUvbGl6aGlqaWFuL3JkbWEtY29yZS9saWJpYnZlcmJzL3Zl
cmJzLmM6NDc4DQo+PiA0NzggICAgICAgICAgICAgdm9pZCAqYWRkciAgICAgICAgICAgICAgPSBt
ci0+YWRkcjsNCj4gQU55IGlkZWEgd2h5IGl0IGRlbGV0ZXMgdGhlIHNhbWUgbXIgdHdpY2U/DQoN
Ckl0J3MgZWFzeSB0byByZXByb2R1Y2UgaXQgaWYgd2Ugc3BlY2lmeSBhIG52ZGltbSBiYWNraW5n
IHRvIGEgZnNkYXggbWVtb3J5LWJhY2tlbmQtZmlsZSB3aGljaCBjYW5ub3Qgc3VwcG9ydCByZWdp
c3RlcmluZyBtciBsaWtlOg0KDQpbcm9vdEBpYWFzLXJwbWEgfl0jIG1vdW50IHwgZ3JlcCBwbWVt
MA0KL2Rldi9wbWVtMCBvbiAvbW50L3BtZW0wIHR5cGUgZXh0NCAocncscmVsYXRpbWUsc2VjbGFi
ZWwsZGF4PWFsd2F5cykNCg0KW3Jvb3RAaWFhcy1ycG1hIH5dIyBuZGN0bCBsaXN0IC1uIG5hbWVz
cGFjZTAuMA0KWw0KIMKgIHsNCiDCoMKgwqAgImRldiI6Im5hbWVzcGFjZTAuMCIsDQogwqDCoMKg
ICJtb2RlIjoiZnNkYXgiLA0KIMKgwqDCoCAibWFwIjoibWVtIiwNCiDCoMKgwqAgInNpemUiOjUz
Njg3MDkxMiwNCiDCoMKgwqAgInNlY3Rvcl9zaXplIjo1MTIsDQogwqDCoMKgICJibG9ja2RldiI6
InBtZW0wIg0KIMKgIH0NCl0NCg0KDQpgLW9iamVjdCBtZW1vcnktYmFja2VuZC1maWxlLGlkPW1l
bTEsc2hhcmU9b24sbWVtLXBhdGg9L21udC9wbWVtMC9udi0xMjhtLmltZyxzaXplPTEyOG0scG1l
bT1vbixhbGlnbj0ybSAtZGV2aWNlIG52ZGltbSxtZW1kZXY9bWVtMSxpZD1udjFgDQoNCmFuZCB0
aGVuIGVuYWJsZSByZG1hLXBpbi1hbGwuDQoNCihxZW11KSBtaWdyYXRlX3NldF9jYXBhYmlsaXR5
IHJkbWEtcGluLWFsbCBvbg0KKHFlbXUpDQoNCk5vdyBxZW11IGhhcyBhdCBsZWFzdCAyIHJhbSBi
bG9jaywgcGMucmFtIGFuZCBtZW0xLiB0aGUgbGF0dGVyIHdpbGwgYmUgZmFpbGVkIHRvIHJlZ2lz
dGVyIG1yOg0KYEZhaWxlZCB0byByZWdpc3RlciBsb2NhbCBkZXN0IHJhbSBibG9jayEgOiBJbnZh
bGlkIGFyZ3VtZW50wqDCoCBgDQoNCmluIHRoaXMgY2FzZSwgdGhlIG1yIG9mIHBjLnJhbSB3aWxs
IGJlIGRlbGV0ZWQgdHdpY2UuDQoNClRoYW5rcw0KTGkNCj4NCj4gRGF2ZQ0KPg0KPj4gKGdkYikg
YnQNCj4+ICAgIzAgIDB4MDAwMDdmZmZmNWY0NGVjMiBpbiBfX2lidl9kZXJlZ19tcl8xXzEgKG1y
PTB4N2ZmZjEwMDdkMzkwKSBhdCAvaG9tZS9saXpoaWppYW4vcmRtYS1jb3JlL2xpYmlidmVyYnMv
dmVyYnMuYzo0NzgNCj4+ICAgIzEgIDB4MDAwMDU1NTU1NTg5MWZjYyBpbiByZG1hX2RlbGV0ZV9i
bG9jayAoYmxvY2s9PG9wdGltaXplZCBvdXQ+LCByZG1hPTB4N2ZmZjM4MTc2MDEwKSBhdCAuLi9t
aWdyYXRpb24vcmRtYS5jOjY5MQ0KPj4gICAjMiAgcWVtdV9yZG1hX2NsZWFudXAgKHJkbWE9MHg3
ZmZmMzgxNzYwMTApIGF0IC4uL21pZ3JhdGlvbi9yZG1hLmM6MjM2NQ0KPj4gICAjMyAgMHgwMDAw
NTU1NTU1ODkyNWIwIGluIHFpb19jaGFubmVsX3JkbWFfY2xvc2VfcmN1IChyY3U9MHg1NTU1NTZi
OGI2YzApIGF0IC4uL21pZ3JhdGlvbi9yZG1hLmM6MzA3Mw0KPj4gICAjNCAgMHgwMDAwNTU1NTU1
ZDY1MmEzIGluIGNhbGxfcmN1X3RocmVhZCAob3BhcXVlPW9wYXF1ZUBlbnRyeT0weDApIGF0IC4u
L3V0aWwvcmN1LmM6MjgxDQo+PiAgICM1ICAweDAwMDA1NTU1NTVkNWVkZjkgaW4gcWVtdV90aHJl
YWRfc3RhcnQgKGFyZ3M9MHg3ZmZmZTg4YmI0ZDApIGF0IC4uL3V0aWwvcWVtdS10aHJlYWQtcG9z
aXguYzo1NDENCj4+ICAgIzYgIDB4MDAwMDdmZmZmNTRjNzNmOSBpbiBzdGFydF90aHJlYWQgKCkg
YXQgL2xpYjY0L2xpYnB0aHJlYWQuc28uMA0KPj4gICAjNyAgMHgwMDAwN2ZmZmY1M2YzYjAzIGlu
IGNsb25lICgpIGF0IC9saWI2NC9saWJjLnNvLjYgJw0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IExp
IFpoaWppYW4gPGxpemhpamlhbkBjbi5mdWppdHN1LmNvbT4NCj4+IC0tLQ0KPj4gICBtaWdyYXRp
b24vcmRtYS5jIHwgMSArDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPj4N
Cj4+IGRpZmYgLS1naXQgYS9taWdyYXRpb24vcmRtYS5jIGIvbWlncmF0aW9uL3JkbWEuYw0KPj4g
aW5kZXggYjZjYzRiZWY0YTguLjBmMjJiODIyN2MwIDEwMDY0NA0KPj4gLS0tIGEvbWlncmF0aW9u
L3JkbWEuYw0KPj4gKysrIGIvbWlncmF0aW9uL3JkbWEuYw0KPj4gQEAgLTExNDMsNiArMTE0Myw3
IEBAIHN0YXRpYyBpbnQgcWVtdV9yZG1hX3JlZ193aG9sZV9yYW1fYmxvY2tzKFJETUFDb250ZXh0
ICpyZG1hKQ0KPj4gICANCj4+ICAgICAgIGZvciAoaS0tOyBpID49IDA7IGktLSkgew0KPj4gICAg
ICAgICAgIGlidl9kZXJlZ19tcihsb2NhbC0+YmxvY2tbaV0ubXIpOw0KPj4gKyAgICAgICAgbG9j
YWwtPmJsb2NrW2ldLm1yID0gTlVMTDsNCj4+ICAgICAgICAgICByZG1hLT50b3RhbF9yZWdpc3Ry
YXRpb25zLS07DQo+PiAgICAgICB9DQo+PiAgIA0KPj4gLS0gDQo+PiAyLjMwLjINCj4+DQo+Pg0K
Pj4NCg==

