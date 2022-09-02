Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC39A5AB83B
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 20:31:05 +0200 (CEST)
Received: from localhost ([::1]:55174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUBRY-0002Hp-VA
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 14:31:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1oUAsK-0005Vf-SB; Fri, 02 Sep 2022 13:54:44 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:39690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1oUAsI-0005rE-IZ; Fri, 02 Sep 2022 13:54:39 -0400
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2828wsU8026456;
 Fri, 2 Sep 2022 10:54:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=6wlQlOFHmqramsz+V10f//RtxoQ3vQuwJRcChfFRR2I=;
 b=vJOr20d9mpfKPgE9z+Yext2f3BdzeBR9dKc7EWJOsnF4WjlhickU+gD8CgxfNjzKkj5Y
 HhHrBKJgyoD1OvdW0sGY/YaQjFUhWSYqu7bH0H/JXi0bXUm+/H6mBKKLGC4+BLnt7iCR
 +z3nB+MpuXKR7cTOJf2GlY//ERzLSmslm/OFxEir5Yt+/rIC7IqcaWgHLSfdarCOJOhV
 l7+ZuzTcU0abxlBPfcFyWHRIVFl+jlxR+/0FF4CvbD+07xNhw3YKehlu1RU5gFnpa0Ek
 N7Jm3Pz9c9cOWnMpA7ufgV6T+T48sXPpUjhzx9588F/0r+uvfCQvryT9z6L6XbcXfANs pg== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3j7jbgxgpb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Sep 2022 10:54:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=grTshXrZT4mTKen0/An40B7eKb0+HV3pdzbJtEf1GvaFHcGMGcNBGnKyxR6GwKojkzQaNUrF4Qg89R5xtiF7VnJZrZGYd87TPRNf8lMjPYpWxenZ4Q/3gSUcY0KaJGwgAd0OksX49hCuD1rtaida1gwc56jI0RwfA272lFBRGnO1EfugqPGdAWiNjs50rhozO1XdeSh509uZc5MPfbxrBUQOCCZRa03PPCylCoX2hB0qGLMiNAcske6eiFBEdIxVnDPAguA5HJ49qPZ/DURQ3Guw6NSLbtd2LtTOGArwmP9WZV3eDMl+KpG1Jcv2avbky2QQTBYLWF91AgLMu9tofw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6wlQlOFHmqramsz+V10f//RtxoQ3vQuwJRcChfFRR2I=;
 b=mFzFTYxywe/EUfSkOp9loD+2AnXUcRFTVvgz8BvUD83tuMfg7e1ySuC873NQVVwIDacmQCT50uybf78FlA49/xU5MrRsNR3+PdBXWwh1V/KTY7I/1SvgFFA6QKTh1DLb6y449NButcOrNvBmkJvG5MOIHwZgngk87o4+UEB1jup2vzoxZZwTs/nxJUOsks4eHzAZu2Uf0CDZB/oehNeBgoCkZ2EgaqRP0BPY67+6Wuk5Zq/ZkYVBZbY6Gd7b+R33zxnOny/f6+qT+eE6RzrRm1BVRvT9IQzC+qcByTWPCT6VpChsVhXdqPZZDUqD03AZ5ZL9y9lweu3TxwvOoOoqcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by MW4PR02MB7188.namprd02.prod.outlook.com (2603:10b6:303:7a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 17:54:34 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::e8ab:ff5d:aded:71ea]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::e8ab:ff5d:aded:71ea%4]) with mapi id 15.20.5588.015; Fri, 2 Sep 2022
 17:54:33 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Daniil Tatianin <d-tatianin@yandex-team.ru>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "yc-core@yandex-team.ru"
 <yc-core@yandex-team.ru>, "mst@redhat.com" <mst@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>, Raphael Norwitz
 <raphael.norwitz@nutanix.com>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "jasowang@redhat.com"
 <jasowang@redhat.com>
Subject: Re: [PATCH v2 3/8] virtio-net: utilize VirtIOConfigSizeParams &
 virtio_get_config_size
Thread-Topic: [PATCH v2 3/8] virtio-net: utilize VirtIOConfigSizeParams &
 virtio_get_config_size
Thread-Index: AQHYuVjI8DZITiaKFEuO7xJHK9MoP63Md2oA
Date: Fri, 2 Sep 2022 17:54:33 +0000
Message-ID: <20220902175432.GC5363@raphael-debian-dev>
References: <20220826143248.580939-1-d-tatianin@yandex-team.ru>
 <20220826143248.580939-4-d-tatianin@yandex-team.ru>
In-Reply-To: <20220826143248.580939-4-d-tatianin@yandex-team.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3cbfbfc8-0755-4410-7c9d-08da8d0c3173
x-ms-traffictypediagnostic: MW4PR02MB7188:EE_
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I6ZtZ5JFbRW2s+8PHSeDywEw8p7alhn0+hH7PPRskUbZTO/I6JF1vKvNjGpkpTuz6AlWegC5xrXjPCcV8b5iq4QA5yewlu1c2QelfxCJ8KKNVXBoqHFXZGJbGXM5bwTAZoiHuxvnDItzQ699QC5vzuHHfQxAGhY5o8pI3Nd4dqaphZZX2QHDAOPTpTbtdTRVX6RmbELIAnokioyby3FGK8Ksyo55R3UnzvDjcyl5oPyrg2wmZpMpVovPI++So9++jVF1gYSrIG8Cn6yCMI6YML6Uc2w6Greym7qluXbO4DTCE3ky1KW1e88b+FzznDYpzpHhfE51iuIcXc9XBUfXEls0E8BOwNPafaR/QaKY28x3GdbGqIWj0higvFcql5ff8x7kb5pk+nz6Iwyjf/rekzLILvFiWLWpkdsPb7H4bO93zhbZ2ujxqHc6Xo33I7Ca+UhYNURxz2IF7MD4EN5F1t8bl2Fx8Stf37vdUjIPuVRsVCY0+1hRctnbJ4gtIYUfKNiGOhj2LLJxWYvDUi0rSkYGQCwcN9ECZP8EU0kVidr56zinMXp2IRoVuhWUoqqrv3qKDJZ/ZA1/urP5RMHBCJCM5cDScae9VvYOoq7iAxVhJB5OvlzcJIUZV3BxvOj2AwzMQCmb4zotlBHCJkRM0oi9G0mmx/sGFV/xLWw/N2loU60qzxncp/mMNyPwckrFkExJ5VtN8ZCj7+9WWygqxDb14ecJaJYgghrHvlMOFROXEopdyx5O4JQ008Q0hWdIBzgIQWS9Zc+8xMQ6LUzyww==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(136003)(376002)(39860400002)(366004)(346002)(396003)(6506007)(26005)(6512007)(9686003)(71200400001)(1076003)(186003)(44832011)(5660300002)(8936002)(33656002)(6486002)(41300700001)(86362001)(478600001)(122000001)(38070700005)(83380400001)(54906003)(6916009)(2906002)(316002)(38100700002)(33716001)(4326008)(8676002)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K3d2VElidHhxVG56MWVxaUZqV0J1alpSdlk5bnc5a3ZCcjl0ZTE1RnFVWXRB?=
 =?utf-8?B?ZU9nKzl6ZXk4YzRJVGFTYmtmSXUxL2xZenJrOHBvb21VRmo2V05mNXhsZlBq?=
 =?utf-8?B?dGNQSlQ3YVpoaWVCSGdpM0JjZHRydmV4M3QvSEl0QXN2eUxwNGl2Wlk2ZjlX?=
 =?utf-8?B?eDhSenJGb3hwUXJ5bm53NjFBN1FFY05PeVhtVEhVK0NyZEEwVjdDaC8rN2o4?=
 =?utf-8?B?ajZoUmhOTkltRU5pK2UrSGhvSlRKd3Q4RE1TUGVwU0R4MnlmOWYzcEFZZWc0?=
 =?utf-8?B?Z1c1bHZ3NUhxS2dtbUwvUTc5K1ZEQlZjLys1QS8ybkcxRFp1SktZNUdycWdv?=
 =?utf-8?B?aXpEcXQ0aWg4cmpIMDE5d2F0ZXVJdlA3T29UVDliWEs3T3dpZ0owQ1RXWGs4?=
 =?utf-8?B?TDlkelNpY0FjZEJaUzgvRG10SjRQMmVBL0o5bGlBaVg3aVNZR240S3VNZFlY?=
 =?utf-8?B?TUdETGkyY0tFOHExdUF5MXRncGw2MDEwL0FoQW9aa21WS1dzNzVUZFZhVldV?=
 =?utf-8?B?ZCt6RXVJK3l6SUR0MElNZk9mcGwvdnV4TzJsaHNIT21nRmxVbWZra2ZxYUwy?=
 =?utf-8?B?aUdDSnZSa2w0ckdxdHFETEVjRnF0STNGZzg1Y25rdEJaYng0aW11bTVKaEoz?=
 =?utf-8?B?d0k5MUd3RUI4NmRkSFBvcUx1TVNnZyt5VU1maEdpUFdxY3ZoSUlORHJ1akVX?=
 =?utf-8?B?MEtmdUtjRUdoQVd1dURMckFCQm56SUg0dG1ydTRhdmJ3d0MvWjhXdGZjQUgy?=
 =?utf-8?B?WDlnMnBDSGVwSkFGa3o1aE83Qnp0emw5R0pweWhXWWlka003UnJIOVRvMUxT?=
 =?utf-8?B?ZldQWUtZdDI1dGlKNUt2dUhIVjhGbGtuYlNxRjRyMXdHQTBPakZsclBhM1FP?=
 =?utf-8?B?TjRSZG1GVkRJRjBvaXdXYnlYeWZQOVdXek9RUzhoc0d0YkdkbzNJUndyN2Rh?=
 =?utf-8?B?UDE1RFowLzVEQWcyU1NHUWQydXhYK1lmeTduc3g4cllCcml1Rldya2lzUVBl?=
 =?utf-8?B?L3QvT1B5ZkwweitFUHNTcDQwVkVicUJNVVdQY3NPbE0rdFEyaTVYQ0l5OGlB?=
 =?utf-8?B?eUpuNUovendpWWVMeHJqeEVWRnN2Umo3TTIrcEMraDR3WVNLQkVUc1JHNU5u?=
 =?utf-8?B?dzVWNE02Tnc0eHhQYWY2QkNxRXFmcmoyaW1sM2VBYlY5YmJ5SUZJZFlUVHlQ?=
 =?utf-8?B?UFV5U29BMUxwWnVudElhcnZ2aHoyWGVMaEpVemI4RFhsYUFMM21LV1JURy9t?=
 =?utf-8?B?OStwMHF3T0J5cWlOYzUrMWN5WkxDdzd3b1FWWDZkLzFLYlZCYjNSUXpBNnM5?=
 =?utf-8?B?RE9XR1E4elRBVlFzVUdhRFpIRzQ4TFd2L3UwQ24wMFNFQkVBR1dYN3dXbndm?=
 =?utf-8?B?bXdWS2N4aS90YjdaaG5iSHBaRWNnMlE0Zk5IdW9qRU5HMjE5RmlvTUYyZW41?=
 =?utf-8?B?N0FVYWJ3enRnRTdHVFlSYi9VcmN6c3lpdC93cG1hWWkzS1YxeWFsYUVIaTFQ?=
 =?utf-8?B?TWRmMEFWd3NxZnN4VXZOMEhrZFFZczhIQWhmYjhtaXRJbEhkcmVFT08wT3RU?=
 =?utf-8?B?MFZ4c3JZakJxZCtaeERRa01DWU13VHM0dm1MbFFmNkZhYVEvbXRuMWRCRFox?=
 =?utf-8?B?ZGdqVEFwb2dLZjExS0phZ2Iya2hyVWxsWjFLclg0azd0R1oxLzlwSGY0VERH?=
 =?utf-8?B?UDR2SlplN1hOZ1NHL2NXeEhib0FtcnRlcFg2bm4yZXZidVEvc1NMUHd4Z2ls?=
 =?utf-8?B?Z0FCbzhpdGkzdlhUN29NYnhxL1VyWHppK1AyeUJDeEQydTE1MmJyN1pxL21O?=
 =?utf-8?B?YldhblZCNEdORHpLNmUwSlhwYWExQ0lwcXFad0RGU0dNaVlkdk1GTFNHNzIy?=
 =?utf-8?B?Kzk2YTl0d1BFc1BjYnQ0d2YrQ1RKZHRQcEMrZ0wxbkZobENMT2hsbEFTaWhH?=
 =?utf-8?B?cnNlK2FQRFk1U1o0d3FsdVZFMTFtVUg0M0Q3T2VUQ1ZPdWNCWjBHcUF5SDJj?=
 =?utf-8?B?Q0VNcE1FMzNPcGp5Y3BibEpmRUZtSkhjK21pbVlSTmV2cFJXbDhhR29JQ09P?=
 =?utf-8?B?Q3B6cTVWRTFvKzZyUzZSQnNBRHRnMkxFVlJEZWlJN1E4eXhUaHFOa080d2Vh?=
 =?utf-8?B?SkZIY3NNNytkTk91OXh2amFIeEsrMEZCTHphcDJROUl5THlIb1ZnZGlmWXdK?=
 =?utf-8?Q?5E1EcOOBeCsdaIIimDWI6Is=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4895B66C338EDE41AF3BA76C3F3DB090@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cbfbfc8-0755-4410-7c9d-08da8d0c3173
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2022 17:54:33.4497 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0lpR+fUrwtmOeqDgcu9zCa2yr85AwgTiHJCrygyATU7qFKVTT/QE+tKrGkNi11UmrF/Tmdgpj5IZSEQbFQUgyHAkzAN4L1W7WpZ3T4ONVM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7188
X-Proofpoint-ORIG-GUID: d-_WvlGDO32OMZXooD3BHX3zgNRFMDBb
X-Proofpoint-GUID: d-_WvlGDO32OMZXooD3BHX3zgNRFMDBb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-02_04,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
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

T24gRnJpLCBBdWcgMjYsIDIwMjIgYXQgMDU6MzI6NDNQTSArMDMwMCwgRGFuaWlsIFRhdGlhbmlu
IHdyb3RlOg0KPiBVc2UgdGhlIG5ldyBjb21tb24gaGVscGVyLiBBcyBhbiBhZGRlZCBib251cyB0
aGlzIGFsc28gbWFrZXMgdXNlIG9mDQo+IGNvbmZpZyBzaXplIHNhbml0eSBjaGVja2luZyB2aWEg
dGhlICdtYXhfc2l6ZScgZmllbGQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBEYW5paWwgVGF0aWFu
aW4gPGQtdGF0aWFuaW5AeWFuZGV4LXRlYW0ucnU+DQo+IC0tLQ0KPiAgaHcvbmV0L3ZpcnRpby1u
ZXQuYyB8IDggKysrKysrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaHcvbmV0L3ZpcnRpby1uZXQuYyBiL2h3
L25ldC92aXJ0aW8tbmV0LmMNCj4gaW5kZXggZGQwZDA1NmZkZS4uZGZjOGRkODU2MiAxMDA2NDQN
Cj4gLS0tIGEvaHcvbmV0L3ZpcnRpby1uZXQuYw0KPiArKysgYi9ody9uZXQvdmlydGlvLW5ldC5j
DQo+IEBAIC0xMDYsNiArMTA2LDExIEBAIHN0YXRpYyBjb25zdCBWaXJ0SU9GZWF0dXJlIGZlYXR1
cmVfc2l6ZXNbXSA9IHsNCj4gICAgICB7fQ0KPiAgfTsNCj4gIA0KPiArc3RhdGljIGNvbnN0IFZp
cnRJT0NvbmZpZ1NpemVQYXJhbXMgY2ZnX3NpemVfcGFyYW1zID0gew0KDQpDYW4gd2UgaGF2ZSBh
IHplcm8gbGVuZ3RoIHZpcnRpby1uZXQgY29uZmlnIHNpemU/IFRoZSBib3RoIHRoZSB2MS4wIGFu
ZA0KdjEuMSBzZWN0aW9uIDUuMS40IHNheSDigJxUaGXCoG1hY8KgYWRkcmVzcyBmaWVsZCBhbHdh
eXMgZXhpc3RzICh0aG91Z2ggaXMNCm9ubHkgdmFsaWQgaWYgVklSVElPX05FVF9GX01BQyBpcyBz
ZXQp4oCdIHNvIHdlIHNob3VsZCBwcm9iYWJseSBzZXQNCm1pbl9zaXplIHRvIG9mZnNldF9vZiBz
dGF0dXM/DQoNCk90aGVyd2lzZSBMR1RNLg0KDQo+ICsgICAgLm1heF9zaXplID0gc2l6ZW9mKHN0
cnVjdCB2aXJ0aW9fbmV0X2NvbmZpZyksDQo+ICsgICAgLmZlYXR1cmVfc2l6ZXMgPSBmZWF0dXJl
X3NpemVzDQo+ICt9Ow0KPiArDQo+ICBzdGF0aWMgVmlydElPTmV0UXVldWUgKnZpcnRpb19uZXRf
Z2V0X3N1YnF1ZXVlKE5ldENsaWVudFN0YXRlICpuYykNCj4gIHsNCj4gICAgICBWaXJ0SU9OZXQg
Km4gPSBxZW11X2dldF9uaWNfb3BhcXVlKG5jKTsNCj4gQEAgLTMyNDYsOCArMzI1MSw3IEBAIHN0
YXRpYyB2b2lkIHZpcnRpb19uZXRfc2V0X2NvbmZpZ19zaXplKFZpcnRJT05ldCAqbiwgdWludDY0
X3QgaG9zdF9mZWF0dXJlcykNCj4gIHsNCj4gICAgICB2aXJ0aW9fYWRkX2ZlYXR1cmUoJmhvc3Rf
ZmVhdHVyZXMsIFZJUlRJT19ORVRfRl9NQUMpOw0KPiAgDQo+IC0gICAgbi0+Y29uZmlnX3NpemUg
PSB2aXJ0aW9fZmVhdHVyZV9nZXRfY29uZmlnX3NpemUoZmVhdHVyZV9zaXplcywNCj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBob3N0X2ZlYXR1
cmVzKTsNCj4gKyAgICBuLT5jb25maWdfc2l6ZSA9IHZpcnRpb19nZXRfY29uZmlnX3NpemUoJmNm
Z19zaXplX3BhcmFtcywgaG9zdF9mZWF0dXJlcyk7DQo+ICB9DQo+ICANCj4gIHZvaWQgdmlydGlv
X25ldF9zZXRfbmV0Y2xpZW50X25hbWUoVmlydElPTmV0ICpuLCBjb25zdCBjaGFyICpuYW1lLA0K
PiAtLSANCj4gMi4yNS4xDQo+IA==

