Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 463513ED8B7
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 16:11:17 +0200 (CEST)
Received: from localhost ([::1]:39360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFdKe-0001k0-0W
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 10:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mFdJc-0000ye-QF
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 10:10:12 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:25964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mFdJa-0001Vp-2R
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 10:10:12 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17GE7MNm020162; Mon, 16 Aug 2021 14:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=Lc/xQ8+kz93yQVPnpkVIgxdq4mxhcd4cekRn0uEj7bU=;
 b=Bx7d6/IGsC8dI2wqbp3Awje7noSUq8dJEDSYZT04/OAQhfG3hZO6a3px0mCsuZxfl2I2
 X2jzyymZ7FfsoK6CY7hD2w6zRgCrXc1vHg1ZO0pVK4WgZzj/0Tu2WNRw+AUFOWVOpnj/
 PTO7grka7tdefvMH2kTNMPGxZqcLRkmxzIBFsCX3fk9jWwRSTEY5v6wXdABKAH+Xsa7W
 xGVR+wppBcUxNKOBsxD4RSINiB6JSoLFXUPikQCjLl1leRseNe4NPFbiHsdkLDsPiJhw
 AhTCg8PHrUl/qRi3jEfRl8RNwzjSbdGDI//RXEX1HjzqsM6IJn8zn8Cq5GxnBGR/3N1n QA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=Lc/xQ8+kz93yQVPnpkVIgxdq4mxhcd4cekRn0uEj7bU=;
 b=g1jHCi7dFG80HJfRNm6kZJKU818ylP2ijA3aVWRqLYLZVNH0HAdMVYuyz6GVRCFaz2km
 TDA9uNiMHtIeu7As3ZIiYe1Yh2pGCDz94WURUvzU5R+OsXBKMnljdeh9KGjK+e1LRXiU
 CMted1kpgYUz89TZpf16Xa5+TpzMBLqFctKyAtQi0FjcWk/hD5aEYYMluWTf5KNDmT99
 xfks6tvwr/UyabzZcWTxWoyu/50ID2MtKnwTgMMHUfbi8vRadIISYUTFdRzW/iAKeDwv
 uaXUzT4wyNhU+1qg8JmnZIt8jKyAhsb+PDo6+ACLhnzdbcc5NqNYjPSawTuC7rVABUdn OA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3afgpgh5n5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 14:10:03 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17GE0kMq070356;
 Mon, 16 Aug 2021 14:10:02 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
 by aserp3020.oracle.com with ESMTP id 3ae5n5rmg6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 14:10:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GcaeCbjEnHFFpQndhJHcWcWCZYwz6zyxtidLuzp5Abi6KwNFQ2dnD3//hncmqJoxO+/1uXLwkM/AIjGa+Z7abS5g2ltKaju6A5fov8PfrMiI1vrpM0qrtrnYOgfrQzkjznLIL6OwXkPWqRdhx6H649JlPs04Wl37IkKWnQEUr+4xc/oDt2YdXP5aFjKt/hZ8HOT8Tnm3D5IFdykcsNsoe+WxH9Hsbx/CueOtbIRh39inlAo7BtUv+lbUHZdWlcW1UlB3f8a4XJDob5BRSJWYT/1Kzj1ggca7UBfFJG7CrHsEpqGXAeYImfz4eeUiorAOCVHmuOANq5CSWcgbKtOMpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lc/xQ8+kz93yQVPnpkVIgxdq4mxhcd4cekRn0uEj7bU=;
 b=BcEJi3vhznw2XJGVD9dmqy8sXMDUtMNeyamf1pUGBJijCEqGoh/4TAAN5Gu0z8McI1GE/Bw99ePxXbKa5legDcrJIhjXvBh1bvchpo1nQovyQqssxhGv+wKfcM8FDXr2q/pNBGU1juOdVa7ALtEsWu4rVNVEi/3uK7HZDQ6kfJmuxX0XL9vSUvAW1kgPLrt5YCj0q630TftnUpARqirEtkhbuSnXttr/hhS7VlB5PuGUFVj3mt5ZIxq/yeD9w4+VCO8bwELl8y4cjgwmJENeu3v39y8TkC35AAwUQp/DmCMBOrpbanpVDfqaM60O7QbxjcdQVblfPvSRY4GqZgnUVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lc/xQ8+kz93yQVPnpkVIgxdq4mxhcd4cekRn0uEj7bU=;
 b=zcpOIfv1yNvrSw0eYLg4BLq1ZDOH94Av6OviOm8spudttactKewvZDjq3EblSghK3GTvpw7lGMwnZirrI+nEHsjWNPYE4+N2v5AuYTFliLIFLl/OVGJElSgz+pPFwQceptXbUHSA07n860VqG/ZZvhx2Sv+UUDEgdhBrGT6eeMY=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB4365.namprd10.prod.outlook.com (2603:10b6:208:199::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Mon, 16 Aug
 2021 14:10:00 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e935:82a8:3c37:8aa4]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e935:82a8:3c37:8aa4%4]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 14:10:00 +0000
From: Jag Raman <jag.raman@oracle.com>
To: John Levon <john.levon@nutanix.com>
Subject: Re: [PATCH RFC server 05/11] vfio-user: run vfio-user context
Thread-Topic: [PATCH RFC server 05/11] vfio-user: run vfio-user context
Thread-Index: AQHXfNdw2N4yWTsRC0+3F6zuyiCsmatL6kKAgCXBjoCABJWqgIAAFaKA
Date: Mon, 16 Aug 2021 14:10:00 +0000
Message-ID: <ED0E733B-275B-4FF1-B128-8FB0771319F3@oracle.com>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
 <cover.1626722742.git.jag.raman@oracle.com>
 <9ea4e77a39aaff3dfac3e463d3de76b0e4e1844f.1626722742.git.jag.raman@oracle.com>
 <CH0PR02MB7898528462CB5A47FE31F0E48BE29@CH0PR02MB7898.namprd02.prod.outlook.com>
 <81025189-1561-47E6-9E72-2E670ECC28F7@oracle.com>
 <YRpfkL2V96/VPfO8@movementarian.org>
In-Reply-To: <YRpfkL2V96/VPfO8@movementarian.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.100.0.2.22)
authentication-results: nutanix.com; dkim=none (message not signed)
 header.d=none;nutanix.com; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f8e144f5-b6d9-4ff6-09c2-08d960bf88f1
x-ms-traffictypediagnostic: MN2PR10MB4365:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR10MB43652640F311E16ACDFD111B90FD9@MN2PR10MB4365.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z9oNnxm/BbaWXYschKUEd4zqezphOFHNgahpC04yout8D0MT9uHT/QDyAWMJ5l4Si1o3ZspEY90CTXEBK/8tR0Tu7vhfG+SbEWX8EIaB/p3jbEWntLGewoJiSccfm1a6TnNJlPE48rGQPgQqiOgfVKLhzBJYGwD4Lyoh1Q36SFPaa5JCYe8Lr+c7e2DnV7mdP8FdBpnQ6o5iKZwaPFegyEKnhuPPsFRR6mjDnbwd6Tpi6Kt9gHGtz5IyDymNZAOnNSLw37adsGj81FA8kUfKgNW4+vwRe+jbijwkyLJIULM8qdOcDgf92HBD1gR7P0G6zDm4e/kNGLvMDNp0RrsAhO+vsD/8jO1N0CfQOjc55XgR9z80eNPgkwVnh5NDAhJBwAm1UeKtmWyl5T1qpkjYG0pogMfQJuNixGZuFGrO2eEp4vGUbWg9Fokp/nOgRlIgI09Ko5qSpOZ1ZpO10mbAKPUbB8mdE2FhQnZM7nm/tLhGEx0RJHq4aQKi25ISFAau1fjSemkP6RXJFqSz715NBbxeUErWMQmDPJfBwAi0Z0sm7qFrDNFVZnYEiHK7xbBfr0wK931bWgbh5JQOyugm6ZnUnKI3yZGn3qKeQsFGapOYJT5vZwVHdKBA+OwZd5qujN5ik4JHjAC6o9HJbj2PxN1UxzknuDHO8DLtvPqHEZppnxkNkycaydbKhxdm9SGeIGGsXkzqX53DZB2ZBnqSOgery5JHY+xzjOlmRfmSNBXM01kwMTJ1R9tPEnYCNkG+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(346002)(366004)(376002)(136003)(36756003)(2906002)(71200400001)(186003)(54906003)(6512007)(6486002)(6916009)(5660300002)(33656002)(53546011)(4326008)(6506007)(316002)(296002)(91956017)(2616005)(38100700002)(8676002)(122000001)(38070700005)(44832011)(76116006)(8936002)(66446008)(64756008)(66556008)(66476007)(66946007)(478600001)(83380400001)(86362001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QTZwZGszbkhheEhXN1FOdkVhNG1BUmlRVzBHaGRNaWI1ekNRZmc1ZC91Q0J6?=
 =?utf-8?B?QXJZbVA5aDNRL0pGSXdLc3ZvL0lFOGY5YW9BT1RrdWduZHZLVkR2Vkk4SXU1?=
 =?utf-8?B?eE9OeUkrdXQ4d1ZGTUVwRkx2bUpPNzFnZlp2VFhJT3hXMHg0Y2JzY2sxUTZq?=
 =?utf-8?B?TEwxZDNQU2FpbU9BWHB2dEs1K2FUMWthcXJOZVhiUm1GZmhhSk81RUFpSkJh?=
 =?utf-8?B?ZTFkbmE2QWJ2Sy9RMG93ZE5hWCtYUUlFN2pCalBGcTFwQy9rUzBtWEFVS3BC?=
 =?utf-8?B?S1NXaWt2cjI4NG5BSmJFelNBV2tmSWkvTVZlQXFWTWlnVXdVYlUwVzBtRXNK?=
 =?utf-8?B?dFdMMGw2VWhvM3ZOeWVIT2crS3dZVU9rSzVYaXJQYUpud0k0ajNCV3BWYnZ0?=
 =?utf-8?B?SEVNeDJaU043RVFjV2swS2NpTGlnOU5OaktoaXpKZ1REdXVReGdEQkwzaE9u?=
 =?utf-8?B?ODlHUU9RSmJBRTFrT05wS3c4eklhYXpDcHdJSHkyaThLSEU5Z2NzejE0d3Yx?=
 =?utf-8?B?ZSt3a2NWSzExYW5FbmM2YWlnK3ZMME13SVc1QmZncHZyQW8xKzZVWmpST05z?=
 =?utf-8?B?cFpHVk9BNWFPSXg5U1FFRk91RzFQQUpHbzI2MFJHK0FjVHRoNFhQLzJBVks0?=
 =?utf-8?B?bGF2aVd5WXdLNzBRQlhlRTMyc1A1NmlLalplckJqSXk1TWV6Q0dKRmFLanZ0?=
 =?utf-8?B?S3VOYVkrV1dWdmxJUUhrWDJrcWxCSFJ6YkVwVUJjQUZrS01idWlFcG4yUFIv?=
 =?utf-8?B?VGdnZ0ZCNTdNYjNTZ2owTloyQittRFl6L1p5akQ2d3p4TmhSNzNGUmRlZm5x?=
 =?utf-8?B?T1NRWDJvdklyUmJZK1llbGlFaDVQN2ZhSHNjekYybEsvaUI0b2s1dEZsTnJC?=
 =?utf-8?B?dVB0cjRIckZSUmtzblhXdHdPT2FxRklJeTVRTng5UldGTlNCZjhXL2thenZ6?=
 =?utf-8?B?N0RreVFyZWQ4TW84WXQwYjJCbGlOVWZscHFSYkdIY0RCazZkckcvdktQNkhJ?=
 =?utf-8?B?K1VTVE9XVDdyK3ExWDczSWlGbVlCbTlUdkNNeHhaODJsM3ArQWY0SkltZjZi?=
 =?utf-8?B?ZGFVR2l1eXhFTTRjamkwZldkZGJCSlduNGlwRFpPejU4Tko2Z29yZitHOFFY?=
 =?utf-8?B?cnJOU21EVXg0UnV5d1kxRGRNRi8zTHlINlNZUVhidlA4dXFpREM5eXZDNXMx?=
 =?utf-8?B?ZWd3RjgxUGVKaDdNa2NhYXlqOExCKy9hZEtsYnhhZnAxbklib0Z6NjRSWWhC?=
 =?utf-8?B?bmZ5YnNiZGs5dXhwUmpWUjdMRWNLMG02NzhYTys5cXpPdzY5UWVBOHdRbFpj?=
 =?utf-8?B?NXg5NlFZb01RcmxiMy9veklIUS9EaVdOMjM5U1ZKVmh4aXhxQys0NkMwcnZO?=
 =?utf-8?B?RlNCYVAxNkgxbEVGK3J2T3I5bUNsWXVEWFpOVk1yNnlkbm9zMTBpNE1QSUhJ?=
 =?utf-8?B?d2VFWm92UHNlZkdrd09DOFU1dWl0Mm9hbUtRTkJEaGM2WU8xZk5mTExjVGdL?=
 =?utf-8?B?bUt2WCtMckF2THo2RkVMcTJOeHQ1aVc0eCtzcjljZXByWEhQWnhSWXFDYlNO?=
 =?utf-8?B?UEVjT1Rydk54UVhPemtBdlNtcUpJY2s5bUR1eFhlOUYzREN0UUhQSjB1aGpS?=
 =?utf-8?B?Sk5FbzVhNlNVaEVFWkRybE5tbXRYTzhJeDQzNEtCcitNeWZmM3E0VXhKOVpC?=
 =?utf-8?B?RHVUZkZBUFZDSXFIMWlma2pTR01kU0EvTCtZWnpadGRZNGlFUW5xUklHU2Rx?=
 =?utf-8?B?WW8rdUVJWUZEK0p3TXFOS3MrMUhxTXVsMWRzZ0E5MDZWZUp5bVRndmlKZUNH?=
 =?utf-8?Q?ea/vD3nX4QMlPdPkL6O4TkkJLSDScY3q7Wt00=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C511E1FB3B43744C8984F9A70F0FBC97@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8e144f5-b6d9-4ff6-09c2-08d960bf88f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2021 14:10:00.1004 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KLFZdxAErW7Jwi5If9mJxEu4dALeGiXMJh9Je8B2VobK4L0q1ix3d9FqwJg0qY0xaFnqsP4FLHSdESldIP04Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4365
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10077
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108160089
X-Proofpoint-GUID: F-oeyolBfnMplYsJesqrlEExhsPyDRbR
X-Proofpoint-ORIG-GUID: F-oeyolBfnMplYsJesqrlEExhsPyDRbR
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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
 John Johnson <john.g.johnson@oracle.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gQXVnIDE2LCAyMDIxLCBhdCA4OjUyIEFNLCBKb2huIExldm9uIDxqb2huLmxldm9u
QG51dGFuaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIEZyaSwgQXVnIDEzLCAyMDIxIGF0IDAyOjUx
OjUzUE0gKzAwMDAsIEphZyBSYW1hbiB3cm90ZToNCj4gDQo+PiBUaGFua3MgZm9yIHRoZSBpbmZv
cm1hdGlvbiBhYm91dCB0aGUgQmxvY2tpbmcgYW5kIE5vbi1CbG9ja2luZyBtb2RlLg0KPj4gDQo+
PiBJ4oCZZCBsaWtlIHRvIGV4cGxhaW4gd2h5IHdlIGFyZSB1c2luZyBhIHNlcGFyYXRlIHRocmVh
ZCBwcmVzZW50bHkgYW5kDQo+PiBjaGVjayB3aXRoIHlvdSBpZiBpdOKAmXMgcG9zc2libGUgdG8g
cG9sbCBvbiBtdWx0aXBsZSB2ZnUgY29udGV4dHMgYXQgdGhlDQo+PiBzYW1lIHRpbWUgKHNpbWls
YXIgdG8gc2VsZWN0L3BvbGwgZm9yIGZkcykuDQo+PiANCj4+IENvbmNlcm5pbmcgbXkgdW5kZXJz
dGFuZGluZyBvbiBob3cgZGV2aWNlcyBhcmUgZXhlY3V0ZWQgaW4gUUVNVSwNCj4+IFFFTVUgaW5p
dGlhbGl6ZXMgdGhlIGRldmljZSBpbnN0YW5jZSAtIHdoZXJlIHRoZSBkZXZpY2UgcmVnaXN0ZXJz
DQo+PiBjYWxsYmFja3MgZm9yIEJBUiBhbmQgY29uZmlnIHNwYWNlIGFjY2Vzc2VzLiBUaGUgZGV2
aWNlIGlzIHRoZW4NCj4+IHN1YnNlcXVlbnRseSBkcml2ZW4gYnkgdGhlc2UgY2FsbGJhY2tzIC0g
d2hlbmV2ZXIgdGhlIHZjcHUgdGhyZWFkIHRyaWVzDQo+PiB0byBhY2Nlc3MgdGhlIEJBUiBhZGRy
ZXNzZXMgb3IgcGxhY2VzIGEgY29uZmlnIHNwYWNlIGFjY2VzcyB0byB0aGUgUENJDQo+PiBidXMs
IHRoZSB2Y3B1IGV4aXRzIHRvIFFFTVUgd2hpY2ggaGFuZGxlcyB0aGVzZSBhY2Nlc3Nlcy4gQXMg
c3VjaCwgdGhlDQo+PiBkZXZpY2UgaXMgZHJpdmVuIGJ5IHRoZSB2Y3B1IHRocmVhZC4gU2luY2Ug
dGhlcmUgYXJlIG5vIHZjcHUgdGhyZWFkcyBpbiB0aGUNCj4+IHJlbW90ZSBwcm9jZXNzLCB3ZSBj
cmVhdGVkIGEgc2VwYXJhdGUgdGhyZWFkIGFzIGEgcmVwbGFjZW1lbnQuIEFzIHlvdQ0KPj4gY2Fu
IHNlZSBhbHJlYWR5LCB0aGlzIHRocmVhZCBibG9ja3Mgb24gdmZ1X3J1bl9jdHgoKSB3aGljaCBJ
IGJlbGlldmUgcG9sbHMNCj4+IG9uIHRoZSBzb2NrZXQgZm9yIG1lc3NhZ2VzIGZyb20gY2xpZW50
Lg0KPj4gDQo+PiBJZiB0aGVyZSBpcyBhIHdheSB0byBydW4gbXVsdGlwbGUgdmZ1IGNvbnRleHRz
IGF0IHRoZSBzYW1lIHRpbWUsIHRoYXQgd291bGQNCj4+IGhlbHAgd2l0aCBjb25zZXJ2aW5nIHRo
cmVhZHMgb24gdGhlIGhvc3QgQ1BVLiBGb3IgZXhhbXBsZSwgaWYgdGhlcmXigJlzIGENCj4+IHdh
eSB0byBhZGQgdmZ1IGNvbnRleHRzIHRvIGEgbGlzdCBvZiBjb250ZXh0cyB0aGF0IGV4cGVjdCBt
ZXNzYWdlcyBmcm9tDQo+PiBjbGllbnQsIHRoYXQgY291bGQgYmUgYSBnb29kIGlkZWEuIEFsdGVy
bmF0aXZlbHksIHRoaXMgUUVNVSBzZXJ2ZXIgY291bGQNCj4+IGFsc28gaW1wbGVtZW50IGEgc2lt
aWxhciBtZWNoYW5pc20gdG8gZ3JvdXAgYWxsIG5vbi1ibG9ja2luZyB2ZnUNCj4+IGNvbnRleHRz
IHRvIGp1c3QgYSBzaW5nbGUgdGhyZWFkLCBpbnN0ZWFkIG9mIGhhdmluZyBzZXBhcmF0ZSB0aHJl
YWRzIGZvcg0KPj4gZWFjaCBjb250ZXh0Lg0KPiANCj4gWW91IGNhbiB1c2UgdmZ1X2dldF9wb2xs
X2ZkKCkgdG8gcmV0cmlldmUgdGhlIHVuZGVybHlpbmcgc29ja2V0IGZkIChzaW1wbGVzdA0KPiB3
b3VsZCBiZSB0byBkbyB0aGlzIGFmdGVyIHZmdV9hdHRhY2hfY3R4KCksIGJ1dCB0aGF0IG1pZ2h0
IGRlcGVuZCksIHRoZW4gcG9sbCBvbg0KPiB0aGUgZmQgc2V0LCBkb2luZyB2ZnVfcnVuX2N0eCgp
IHdoZW4gdGhlIGZkIGlzIHJlYWR5LiBBbiBhc3luYyBoYW5ndXAgb24gdGhlDQo+IHNvY2tldCB3
b3VsZCBzaG93IHVwIGFzIEVOT1RDT05OLCBpbiB3aGljaCBjYXNlIHlvdSdkIHJlbW92ZSB0aGUg
ZmQgZnJvbSB0aGUNCj4gc2V0Lg0KDQpPSyBzb3VuZHMgZ29vZCwgd2lsbCBjaGVjayB0aGlzIG1v
ZGVsIG91dC4gVGhhbmsgeW91IQ0KDQotLQ0KSmFnDQoNCj4gDQo+IE5vdGUgdGhhdCB3ZSdyZSBu
b3QgY29tcGxldGVseSBhc3luYyB5ZXQgKGUuZy4gdGhlIGFjdHVhbCBzb2NrZXQgcmVhZC93cml0
ZXMgYXJlDQo+IHN5bmNocm9ub3VzKS4gSW4gcHJhY3RpY2UgdGhhdCdzIG5vdCB0eXBpY2FsbHkg
YW4gaXNzdWUgYnV0IGl0IGNvdWxkIGJlIGlmIHlvdQ0KPiB3YW50ZWQgdG8gc3VwcG9ydCBtdWx0
aXBsZSBWTXMgZnJvbSBhIHNpbmdsZSBzZXJ2ZXIsIGV0Yy4NCj4gDQo+IA0KPiByZWdhcmRzDQo+
IGpvaG4NCg0K

