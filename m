Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 181AD601C14
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 00:09:32 +0200 (CEST)
Received: from localhost ([::1]:60444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okYIc-0008WD-UU
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 18:09:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=128962d8ca=cfriedt@meta.com>)
 id 1okYF1-00033j-KW
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 18:05:47 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:40024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=128962d8ca=cfriedt@meta.com>)
 id 1okYEz-0002lP-GO
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 18:05:47 -0400
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29HLRHlY007721;
 Mon, 17 Oct 2022 15:05:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : mime-version :
 content-type : content-transfer-encoding; s=s2048-2021-q4;
 bh=u+h9GQDEgCPrHQ+q8L60wvg1HKAjjZtF9CvUFbEVprc=;
 b=gPvzjFjrHXlRfuRdgrVXhScuc3C/iBEFr2CrbFtfYAsCkD7XmWTmWCbN5TblZDheeqpV
 rYS+sQUmb/woxt0y56plqg2L3wK1AbB9Q96RN3iyNztdhH8Uq4VOSKukbMd4Hs8d6JQu
 tUlwjTmqxWUkQ3AHk/3LrI9S8xgTHme30dsJdc7MFCtIw3rOIpbHx5zrfhFFTE8tDOMu
 ncAnq+ryCHHVD2PfK2aQe5RXpJzNREI24KAfSW+hvDRGYAzfWVvIOmlp6kffbSM2wxQY
 2qZoI/OQ1/7ExeQwtlEIsO+nF6mn6igm+lNLDm8bboVVutsozdogATdCtWxt5aba8ZZA tA== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3k9eyn0bwg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 15:05:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CSWd9NYpGjiLCL30+LorPEC+EFXyAjuZSlvJ2gn0hQaCtf/7HCaHXvpQeXeQsryJtc0dpotRk/fh1AX3qkA4p2YuvdB3rG+wM9uEffpAqzIuTsuB6vSWrXvrl8/EGc9zmK/Rr8vu3l6D0REwfd2Y7ivUX8dvBX5JU3WqGBwYznW0ltQclzs5oj18xG8996POVP3+YUllqvGR8lyjECIu0FzwSzlPhrn5y/FieB6hl6EAftP+q8HuEOgspCVWyYeZFwFDHbSLfOONdyzwoam+Z0ryLdo7huE42lYTfGMGGRdqzFtoEhRp96OOeBDfF6fWSPoAzhMPlZl0wtmendsbfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EEdNk7nCqsA+121BZ62ukFasQLA+T7pGEMCMHnXlxN8=;
 b=aqRXNmMp5PpdtXRpz9x7azjxpwTieMCsnPe0pTZ4UWrW+Tf0FLzaXe4j/wLVbNO+dyK13x8Q35uk4Lt67ZK/JxRNN3tuodgSdKp7v7O6Aoa2i+QmyTk/sjc3pXvK6fqiqiTTjtL97OZnZ7DOv9RBJItIKUa29SseqTfRA/iy2+UXt/izviBpvYDk2w5a4ehMewRamNqSQhiyALhiXYe0UfgJjGqFZYCLg+CSeDTVx7kBSP3valJVgx4m53R9AeQ/YMoEOrqDc1q3vtmgG0i7WBuwLRsRUeQvkfwIkoO0PktXfO0Fk046FksOq7969nURzo7IqebNrrrOlOcUujPMQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from DM6PR15MB3196.namprd15.prod.outlook.com (2603:10b6:5:172::33)
 by BYAPR15MB3191.namprd15.prod.outlook.com (2603:10b6:a03:107::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Mon, 17 Oct
 2022 22:05:30 +0000
Received: from DM6PR15MB3196.namprd15.prod.outlook.com
 ([fe80::2962:8e3f:ea8d:bdf3]) by DM6PR15MB3196.namprd15.prod.outlook.com
 ([fe80::2962:8e3f:ea8d:bdf3%3]) with mapi id 15.20.5723.032; Mon, 17 Oct 2022
 22:05:30 +0000
From: Chris Friedt <cfriedt@meta.com>
To: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Alexander Bulekov
 <alxndr@bu.edu>, Chris Friedt <chrisfriedt@gmail.com>, "jslaby@suse.cz"
 <jslaby@suse.cz>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [v2] hw: misc: edu: fix 2 off-by-one errors
Thread-Topic: [v2] hw: misc: edu: fix 2 off-by-one errors
Thread-Index: AQHY4NrFQDmPGUPxqkOVBrxqA1v+rK4Sm26AgAAIBICAADSgAIAAT1w0
Date: Mon, 17 Oct 2022 22:05:30 +0000
Message-ID: <84F27875-816B-4E87-8D8B-E57852185512@meta.com>
References: <20221015211025.16781-1-chrisfriedt@gmail.com>
 <20221017134425.jbqvtccg5w4yej5g@mozz.bu.edu>
 <CAFEAcA8Cc+XtwcQz3bJom2=MgYZgLHw8SO6uqQQdVN4aqpq4Hg@mail.gmail.com>
 <87czaqe55s.fsf@linaro.org>
In-Reply-To: <87czaqe55s.fsf@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR15MB3196:EE_|BYAPR15MB3191:EE_
x-ms-office365-filtering-correlation-id: 3cd555b9-8b08-4ce4-3a68-08dab08bb4c5
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3WHzpk7tq2LNVbUBmmF05FlT5HAQ8JK3yPBFNelTl67xWqzYXhFG3ebVXvvh/AJ/JYGljzfPCPQOrnxjqsapI+Vk1pRjEoEdKl/p0ykWpZ002C45fI+CV/19RcGRvxe3twp0mBRoJWzQz/gCN9L2vE7pGpS886DbB7jVJPBwPJNIQUiPOau2vjN53eZ3FBklAN9yLoywMFwSOC9AnYsCqgbIb3yGfHPj4AnNpPy7W7JncQx8hAXWJ1tRCIR7piFYDfpwX1fAXxvTNb4tEcIWfRaJYxS/VRfKrsEqQxmZLB0K18WUgMsjSFkH4/qutk8yrDoa8XPcpuR+h8MUjqdaIfERGQP8azmNBH+OQ7YkLQ12fD1zPzDjMxahvMT67ChOMfLEqYvT/x5lFKWD84sMu2uWvktYNQb3Z1pCIAzxBrXiXVEtmuIe8dUYe009Z7ScL8WIOxFga33SU/DtgNQsV6jzZ3zsCCptH6O+Bv09PyeU4ZLuIFEuS/b8YGtOwb1m+BY/WOfXPvjWjjLN61qF7G1VXN5ueBX+JVeNNkD1/tRCdd8qlxqUO+A04iw72ZQdNUrdi/c7DqOP7UoaJfiT5k1+nYmCZcitkfKrNUNClK0pfXGzoGGnbVu37+FT2t8fa+GjMi0PPuyYDfp+uYgkIx/cD9qdPHQy84zT9Wozs+H7s835SvZMB7JmbtBk3+cH1KgFEKT5Gk+YQEApa+pJvSE/WUyf+2Gn/1040ljFxeHCH88l2+E5YGgqSYFTd6/1/IwYdISrjUjd3KAzjY+OyvQ63l2oABH28US7BnPGTbA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR15MB3196.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(451199015)(6486002)(478600001)(71200400001)(38100700002)(6512007)(8936002)(186003)(83380400001)(316002)(6916009)(91956017)(41300700001)(53546011)(122000001)(38070700005)(54906003)(36756003)(6506007)(4326008)(2906002)(33656002)(2616005)(86362001)(66476007)(66556008)(66946007)(66446008)(76116006)(64756008)(8676002)(66574015)(5660300002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cFEzSkRrYjc5L0pVRTZ3a0NxaHJManpFU2pxVGdyL3BFaFRuU2gxV25xTytJ?=
 =?utf-8?B?UEwwc2paL0FCM3RubW5EVHpkMUVRSG9BNStCWlJJZndwd0hMOTVkT2dDS0hK?=
 =?utf-8?B?T0h2M3NyeS9XRUE5RXZUN3hiT1VmWnZHaEhqbDc5b2cvMWhaUzc2MWtyVE1Z?=
 =?utf-8?B?RUhCbDd4d0ZCVHExcUJpUWo0Z1hyeG9ha1JrZWpFQVBRWVM1WUp2YWxwcngy?=
 =?utf-8?B?eTVuS1dMYkcrc2ZiZ04yRFZwSUpNYW0xQ2pta3BRbEtwdkJuYUJHZEt1SnpF?=
 =?utf-8?B?RGNDZU9SZnJud0ZLUk5LQzB2SGFIc1FhenZSbS9KVFV4blBhOTVCS0EzRlNo?=
 =?utf-8?B?V2cxY0tYS0hXV2hLL3Awd1oxL0Q2RDZUc2Z1THhwU2N2YnM2NzdVLzM1cDhN?=
 =?utf-8?B?UHlQY29Ud2ROUDRxMERPdDZrNE9jMThwMWJQMnBRR2FWTFhjblVEMHhTTkhu?=
 =?utf-8?B?YjJLL1ZRMkhBWDRsbVIwUkp0S1RxRVN2L28xM0Z0U3RYOTZONmJaM1NBY2Vj?=
 =?utf-8?B?a3FYYW42SlQzUHNlNDhtR3czTjJ3OVJNZUd2aFdsaVJEelZYUFlBNGJBNTVQ?=
 =?utf-8?B?UDhCb25IL2VRTnlwR2ZkWVhuRk02UFZ3bkJTcVQ2ZVRLdndtYkRpTGE5S0NE?=
 =?utf-8?B?NFhkUXB5eE9CZXFwVUl1dGU2aGFkSFJkaE9SakFPUVRkRFg2d2lDRFEvenFH?=
 =?utf-8?B?SW1RNmJuNkZ3Vm44ck81a2ZqVW1jSDd3cnJuN3M4WlZ1OWU2ekpSZUpQSzkw?=
 =?utf-8?B?MkZrODNBcEEwc1BFTVd2dkptYlV5TlFxYkxMaTg1UzB1NkhnYWpTd3p3WWQ5?=
 =?utf-8?B?UVdDV1VBb1B1Um1aUzlURHVUNlRBd1NUTy9jWnBLbFFUWmJ4ZTZkS1ozbE5V?=
 =?utf-8?B?UmdzOHArbnVmSTliMm55SWJJeG5XeCtHY2RqeHVHWnZWMmdYaDdYL3ZCZTVv?=
 =?utf-8?B?TGJlRXh4UlRyKzJRNVZmcUw1ODFab2tqOGo3dnMwRVJCQnN1Zld3Q0tGcVY3?=
 =?utf-8?B?VHVmd1Z3RUs4d1R5QkF4MWZmell3WEk2VElWTWMycjlrZDJ5YnpWUFNBSVgx?=
 =?utf-8?B?NUdnVGF6UFhSNnVHRnYreW8zbG43cCt3ODZjWWc0Zkcrd2ZPaGI4YStCWUR0?=
 =?utf-8?B?anZPUDNFcU9pT3RFdXBKSThGd1FHL2dNVk1oWDBEbnc0bWV4a0xXR0ZzSCtT?=
 =?utf-8?B?Z3FLMHpqM05nWkdwbVNMWEViT2NIOWQwZVNyaFc4MXI4RjIwZGI1aVV6QXkx?=
 =?utf-8?B?Zld6UVZydUc0WlZxcWFSZFVhNzJKa21Md1VEaVA2MWk1S2FmQWt0aFFncnQz?=
 =?utf-8?B?VE1jTTMwMSs2TnNwalBOWWVybmdBeXlkRG5vSGxQaS9qT3ViZ2VNZmNpS0RD?=
 =?utf-8?B?Ylo1ODJNOG01MVhsVE05Z1hlVFJWdmNEaVluWHVFQzZ4S2luTmxpaFVjRkoz?=
 =?utf-8?B?RmZ2Vk5GSEdReVIrS2x1Y21ETW9uNWp1bm8rWGU1NXlaQlgvV25IVlVtbEtk?=
 =?utf-8?B?NFBuWkJtN080WHlLN3RMNEdXSWltOEdlVjh5ejZRb3luVTdSQ3EvbnBZQ0xm?=
 =?utf-8?B?SGZIczRiZng5SWszUzF0QW5DZXRNbU91WUgzRHFEWXZQQlZBMXlkQ29pSlVU?=
 =?utf-8?B?MzZHdVk2YXRmV1ZGd0tBcU1JZ1RZN1hFS21SYnlrN1FTSm80eUw4NEhPNCtq?=
 =?utf-8?B?dW5kN2FWS29nb3Y5Y1BnSHM4UkUzTHVCQnlGR0VzMlZVWjUrTFMxVkM0ZXFV?=
 =?utf-8?B?TXV0Mk1TL0RiWE12WEVOaXFEV2NzOHpXUXdnRlNzY0RLR3k0Tm1SQkpheVYv?=
 =?utf-8?B?d2wzNDZaVkVGci9qSnhaL0svbUFNcThXZmM3VXprZmVBT3ZQSHBBb3lWdmZq?=
 =?utf-8?B?cTR2OGdWNEVtTElHeDAxb1NDZm8vZjEwY0RCbkdLRjdWYU54dVQweXNnci94?=
 =?utf-8?B?N0ZQT1VsWVRLT3BHNDQzaUpIcjBQOGNjVE05L0pJa09RRVNLUlZORFZIQVF0?=
 =?utf-8?B?SXFTM1pxbDE4VVBWanRIZmR6MG9Vek1vQWN1Y2JzRnJrM0VTeVcyaENvdVFR?=
 =?utf-8?B?YkVQZnFFSTZySWxkaGZwSFg2WS9PL3RHb2JYK3VOeDhRclZ3WkVKQkZ6TWFy?=
 =?utf-8?B?RWZ0bE5PSDdVbzMwSENIS3lGZzZGZVdRWW1jVXJUS2RYUTBRd0ozd1RDeEx5?=
 =?utf-8?B?VWc9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR15MB3196.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cd555b9-8b08-4ce4-3a68-08dab08bb4c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2022 22:05:30.5957 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XcLdH8vdTLIodzjNDK4VWv3K9dQsOmV3HeLuM1+lJyOE2E/9es2SXtghhhzDI55B2JnCbEkyzUKPCbDB8Ug49w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3191
X-Proofpoint-GUID: CmdqT3D025FwupMGMxjiAx56j3rST_4V
X-Proofpoint-ORIG-GUID: CmdqT3D025FwupMGMxjiAx56j3rST_4V
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-17_13,2022-10-17_02,2022-06-22_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=128962d8ca=cfriedt@meta.com;
 helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



> On Oct 17, 2022, at 1:22 PM, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>=20
> =EF=BB=BF>=20
>=20
> Peter Maydell <peter.maydell@linaro.org> writes:
>=20
>>> On Mon, 17 Oct 2022 at 14:50, Alexander Bulekov <alxndr@bu.edu> wrote:
>>>=20
>>> On 221015 1710, Chris Friedt wrote:
>>>> From: Christopher Friedt <cfriedt@meta.com>
>>>>=20
>>> Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
>>>=20
>>> As a side-note, seems strange that edu_check_range will abort the entire
>>> VM if the check fails, rather than handling the error more elegantly.
>>=20
>> Yes, this is bad for a device model, though we have a lot of
>> older device models that still do it. The preferred pattern is:
>> * for situations which are "if this happens there is a
>>   bug in QEMU itself", use assert. hw_error() is a kind of
>>   assert that prints a bunch of guest register state: sometimes
>>   you want that, but more often you just want normal assert()
>> * for situations where the guest has misprogrammed the device,
>>   log that with qemu_log_mask(LOG_GUEST_ERROR, ...)
>>   and continue with whatever the real hardware would do, or
>>   some reasonable choice if the h/w spec is vague
>> * for situations where the guest is correct but is trying to
>>   get the device to do something our model doesn't implement
>>   yet, same as above but with LOG_UNIMP.
>>=20
>> Probably most hw_error() uses in the codebase should be
>> replaced with one of the above options.
>=20
> We should probably document this best practice somewhere in docs/devel
> but I guess we really need a "guide to writing device emulation"
> section.

Should I make a separate PR for that or attach it to the existing series (a=
t v3 now)?

Thanks,

C=

