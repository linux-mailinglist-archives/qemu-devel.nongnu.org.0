Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5EB404513
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 07:37:34 +0200 (CEST)
Received: from localhost ([::1]:58152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOCkf-00006Q-DM
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 01:37:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mOCj4-0007nq-Qb
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 01:35:54 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:43216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mOCj0-0007R8-GH
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 01:35:53 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18949hE1025842; 
 Thu, 9 Sep 2021 05:35:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=EhouTsN13FkzGgCwtEPhHsZtNe75dGGSrKJ8dMgE0LY=;
 b=wmSbnNJuS57EJAKRRZHpzY2HaE5ex+UonetlPJbC9EZqfcx5aD1d1UeQvdT0XWEWTzHM
 7LJOHidmACShRClnElysZNMUHh3o6uOdU81Qtec2dzKczTn1mQMR52rc57BkO9p9ouCV
 mPHYl34Hpk5ezPFsRzKOr0rtjaPK8+aRMjxy0Xb0hqNycshcNNL8natce4/oBIxHn4Vc
 7H/RpK4wcGj1uTlr4RxBbN8a98u4Cl0sOTGEO9XfRbyV2Gqva+MIDn3m8hbficNGHox5
 lxDBkN9tFMNOUrvDZiP2saWPXrPWjuHT+jfDpTs02nqERvC4QbyDIYr+eHvG/5a2Pgp2 Xg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=EhouTsN13FkzGgCwtEPhHsZtNe75dGGSrKJ8dMgE0LY=;
 b=QxaRGyVO18dCkTksq/e+1smsQQ3REcf90dySIb6Til1gvN57hfk3am2iSTV9Ogm608F1
 xhfFBa0T2YHitoh4PF3TUMVzw4ylWIaU503h4bt+s6X0fGL57s395zXYZlJak2cmf2tn
 Wo5nPlGhJgSvtqu0HKoIEso49K+FFwxKmkV+yDAyn+JthxC/c9GyE5TfmkAwI0PfSoWW
 uEMse9blt6POsegYVff1f5yWAoyD3DBYhxP1GDuWZ99IHyVNw2EwYUNjwxqjkOcrEMu1
 1kgq971pIu+VU/K4he8LU5aViybPTwnVlr6c/xcXEa6unJA3Lju3WG2cYTwwfjugfCXv PQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3axd44w2k1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Sep 2021 05:35:46 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1895UEFb008327;
 Thu, 9 Sep 2021 05:35:45 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by aserp3030.oracle.com with ESMTP id 3axcppq3af-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Sep 2021 05:35:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mj9USDd2P51jSmXUrNgQVdrE3ilVmlZ62GZ7xRFlU5AfO0fqHRa7ueupTAbmR2Po6KfIKlNX4BUgU6F05qkmgUSM53yOBpuuNCji0FKoDQr6FPDvepB2RWLGm9KGNDH88vnss/VgAGZ0K+p7WezeADtOSbYk16LD+tpfdtysPwEhgI7DSjkTQDPYbhifeUKc2hL57SPuZNg3lIj31ys5Y38S9D7Bb8xxbjHZOf28z7lrVVSKSYkN1yHRDBMNwKn8M39Z+GSQWadT7vlgnYcmWVW6yQSIlqxm98jgqhl8fQsf3YdXbCasAXbBychpsR7VMj7WG6HgFfPp30ol0m2Rtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=EhouTsN13FkzGgCwtEPhHsZtNe75dGGSrKJ8dMgE0LY=;
 b=Tg1mmcddn1oJni5nd4C0At63nm+9do1EDQPO/4gt4KiGiksJzJ9tY1kwpdEHdqrCrbwDuO6LNPjWee6o7S31wRBFhamqniYc0KCkvCFEID3ab6UfmQ2t1rS/kqLyQIoRZN9oNTTjAB10bl0d52ecdvd6x6BAEyy8ooC/0vbNrRZEJs3QuIaYf0peaehAYJq2h91m5MjrIX6NiPY9moNL8mHYTwf7d4PKCr7NXft3xDfhwKuClT28oRIwQLKGNj3/wgRmtjcvP2rTNeen1e38AdEc2wDLtd6LJfqeNeoWIarwSpY1BjJeLt/sPRjcRxrr4H0TE+udHb3d3yDNxwmqLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhouTsN13FkzGgCwtEPhHsZtNe75dGGSrKJ8dMgE0LY=;
 b=DLMx787oG7PhftrEs58QPp+IQkveY+qKWgtya45i4gEYFE24YI2GZB+J6kDbPv3+gF9NeqB9CX/bfu/ApucZO2ZBC8mrAAgN2ng2YemAOyWKXrEMrf2U7bV9b7tYcwrKPb7LSbOhDVRRO+k6GLRpMbjcYEw6fXhE8U5lIeE+RBE=
Received: from MWHPR1001MB2349.namprd10.prod.outlook.com
 (2603:10b6:301:30::26) by MWHPR10MB1454.namprd10.prod.outlook.com
 (2603:10b6:300:23::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 05:35:40 +0000
Received: from MWHPR1001MB2349.namprd10.prod.outlook.com
 ([fe80::b82d:51fc:e780:8740]) by MWHPR1001MB2349.namprd10.prod.outlook.com
 ([fe80::b82d:51fc:e780:8740%7]) with mapi id 15.20.4500.016; Thu, 9 Sep 2021
 05:35:40 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH RFC v2 08/16] vfio-user: get region info
Thread-Topic: [PATCH RFC v2 08/16] vfio-user: get region info
Thread-Index: AQHXkr3GQddJfliT+06sdkPl2PpXlauYxKqAgAKO5YA=
Date: Thu, 9 Sep 2021 05:35:40 +0000
Message-ID: <59C70EB8-E4D5-4F54-B0E8-A5A10334C0EC@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <d442105953151559982c8b1a753d847fb89da3ba.1629131628.git.elena.ufimtseva@oracle.com>
 <YTd3zRAjg51tzzfd@stefanha-x1.localdomain>
In-Reply-To: <YTd3zRAjg51tzzfd@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.7)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a519a7fe-73b8-403c-cde7-08d97353a8dd
x-ms-traffictypediagnostic: MWHPR10MB1454:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR10MB1454254DF9673FC06B351B85B6D59@MWHPR10MB1454.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ob2xbBxNQ9rc/0yXAfXwT2Eo2S0oIvzfrRV19GT+EkM9YH+0e9c29p44MCGOLzh+J2AuE3hVWtadPPnrUfH7VSXSwOmFzNI6fq89musRT/P/gx24xiBkKA/G7zliEtOl0fqrkFJLhBFjtl1dg6LR50TQpy6ArVvAEFeVL3dNaomE6Izim7wZZiHjy+78n9HdUVAEXRvvZGVRE85QjPpzG+M2POsp0CEzNuQaS3U+lcAFtpK6sIfGT/naF2c3wrEH77xAD67Stsf2hneGSAAugT4pHw4jLwnR/sLWgUQKtxMR6Q5Vgp3nO2TqW1t/Az+pZgbCkwM2ub+/EZApRO13g23s5065OO/O04f6XufdwLJfQ466cLXerWiRPT/H/J8J0iMrKAYE67NmP5wEIb1FVmg0s57ujCLtGgivhiFMa3QX9ebpW+zWJfAtpPLIxobz3jl9SE3j/Skov2PivaCkZ9E/eiUyPNXToCE5VHlxqXPe3NqbH956mmI+CuWXU0sqVlzgqmTVa6+Ia392UCHQkeH2oxgDIDHecDkjd4tOE3LnsO09BRUarU9vz/bJTrivMKDbhQKOp8ITaVZrHvSK2nPI6hcftTaaEEqLJG7/NBYlOnYlSOYd1z8tmTTDjPX1gvIUYmL90eSX4UcIekCphwMtFly/qpKgXEnSNXs3LaOq94PU90YgZwVHU4FlToU2gjjhOuwEwv3FDE28JImRc+bT2fenK1mLplFOIC6kQ0AmyFcME5Jrb/xNatYYK5Hd
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2349.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(71200400001)(6486002)(2906002)(91956017)(86362001)(76116006)(8936002)(6512007)(5660300002)(8676002)(508600001)(54906003)(38070700005)(186003)(6506007)(36756003)(316002)(53546011)(4326008)(2616005)(26005)(66476007)(66946007)(64756008)(6916009)(66556008)(66446008)(122000001)(38100700002)(83380400001)(33656002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RXptanFiRWtYci82Vm9kZ0hBcDRnanJxaEV0eUNPV0tld0E4Sk8vempvd1Fn?=
 =?utf-8?B?R1d4a2ppajdwWEtRK0tzcmNNRG4yYmpkTVZzajRlUUxnTVlJRmVXY2NtSFZ5?=
 =?utf-8?B?WVpZTXJrWmlhVXFGSW90MmxYVm4yb0lRbXNERGorZ1FtbGYvZER4TStYQUxh?=
 =?utf-8?B?WVVhdjFZWHlaQnhnRCtNeGtjcVh2b3c3anFuV0NFcWtoampXQnJMRWM2RTFn?=
 =?utf-8?B?VVBhd2MrMFFjczJGZW4xclJJUVhNOVlGR1phSlc0OTAybjdMTDB0T2ZwTVg1?=
 =?utf-8?B?S2ZERXUxL3dDcWxDdUM0WTV1S3ozWGRCck1lUHA1dmh4UnhHbG16SzJJc1pB?=
 =?utf-8?B?N1U2Tm5WVVVDOW9mMXNHZkIxaWhZVEx2cC9XT0tqWmYvQzNVc3dKdTYzNGdq?=
 =?utf-8?B?U3VTMzllclR4YUlpanQ3dXRvSWtxVFBkUkxtNmlLZGpqd0VBYXlxMXpWditZ?=
 =?utf-8?B?VFEwSDRTZlVOUWtuN3NFR1hQTjJDc05WUjRqSTBpbUZHdVNURm5YMHlXMEhh?=
 =?utf-8?B?V3pKWFhPd1p6SGpKY2ZYNzJucXNVbEtSS0hvVlNZVjRKNUlBb01YL0Rod09z?=
 =?utf-8?B?LzRYZmVEUUVxRUVrY1JGcTBoNzJvRUV2R0gxRC9DZjhpMlRyeFcwNDBuSnhB?=
 =?utf-8?B?M3l3NGNZTk44cGRJL2tQL0VINEJHV1ZnTGtIeGN5SW1wb3JCYm80akxBdFQ5?=
 =?utf-8?B?SE1paHd4U1h3eUxxWm1CNFNZQkQxMWJwR3VRZ1NmRThIb0w1VDR4OTZBTzhN?=
 =?utf-8?B?Y1pKUmcwTGNTMXhyMDJsVS9jSGg5MUh3RS9UbmEzYlpmS2kwWFFnUkVvckRY?=
 =?utf-8?B?d1BNV0N0b0dYOFJKVXhTUnRkUm4rTGVuSnFCVG13cVBwS1JkYkszSWRjQ3U1?=
 =?utf-8?B?VHdET05uaHdobkNGWGxVbFZJVVJnU0JSR0wvbnZVY25XNVdyRmkzTmgrSGIw?=
 =?utf-8?B?OWJHNXNuY1grRmxicWtjZjJLalBPNjlDU3JpaEhVdFJUQ1hUajZoZlhwL0Jr?=
 =?utf-8?B?bVpFRit5NWt2V1FJWlE0VEhPblRyUUhvTjRpbFZVM0w5QjcrUVFmelJSanhr?=
 =?utf-8?B?OGhQYUtaRnRlRSs1WmdtUzdCRXJLaHlqdEtUU0taMkNNTkE3WW5QNkVPb1Zh?=
 =?utf-8?B?M0lCUGdlT2gzZWRpV0FwQ1ZzNzg5VEljSGRLVFhTMjFnd1Q5eTZGalBub1pr?=
 =?utf-8?B?UHdUYTFZUUQwZVFMT0R5RitnK29uSVJ4dkM5U3E4ZlJOZ0pVcTU0SVZNTXky?=
 =?utf-8?B?NzJSUjRvK1JWN2NyMk8rc3pCZTgxQW5UblpGWlFaY3cwem5QemlGby91SkFY?=
 =?utf-8?B?MlhMY2U1bUdiS1hzODhlQnNmMzhIWG5aendNNnMwc3p0Y0hEU3ZDaXhtcHpk?=
 =?utf-8?B?V1REUC9DZ052ZHlsU0FvQmpnbTNCSkcvSnIybm1SMGJuZkFtTUI5WC9SNFc5?=
 =?utf-8?B?YmtNTW15TUpESlNueDRYOGdadkxLT0lJMTVYNmx2M0xBTmcwQmMvd3NDSG95?=
 =?utf-8?B?MExCb3FvNHBxNUYwYmI1dDQ0ZUlaTjRvN3dwSjJUVXl6V29TMi9rZnVzTUdl?=
 =?utf-8?B?akJxTldVRnJoTjcyb2FWRFQzaVErQ09kTkNlVjhwY0dUMTZLMkQxQjV2eUtC?=
 =?utf-8?B?QWFlbDlTdVFhakd3YmxWbmdRRkY3KzN5WEJGN1Q4Q0JHMW5GQVhWVGVrOXhN?=
 =?utf-8?B?NlJsOUprVWY3WXJaMWdWNk5MV1VjQ0ZoQmYya2oybGQrdnRsd0tZbzBpdFFr?=
 =?utf-8?Q?EkIIWTgGFyY5xcyYbrDASMQZKoNPA7roQdmiFz9?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <11645AA52EE87645A6A5D573AD7C3210@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2349.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a519a7fe-73b8-403c-cde7-08d97353a8dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2021 05:35:40.1044 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ivhgEKFP0p0z1jXn/cMlMrIHSoddyR1tVHr5bAw6ojV+uLL/vBAvXjjqpqCSe1XMgVRTz0X4Sv3NGNcPrILT5ck33z/hsWvqOjgk72KImhE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1454
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10101
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999 bulkscore=0
 suspectscore=0 mlxscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109090033
X-Proofpoint-GUID: u6hTnoT2CGO7pY0F7ch3e1wCUDc0q65S
X-Proofpoint-ORIG-GUID: u6hTnoT2CGO7pY0F7ch3e1wCUDc0q65S
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Jag Raman <jag.raman@oracle.com>, Swapnil Ingle <swapnil.ingle@nutanix.com>,
 John Levon <john.levon@nutanix.com>,
 QEMU Devel Mailing List <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gU2VwIDcsIDIwMjEsIGF0IDc6MzEgQU0sIFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFu
aGFAcmVkaGF0LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBNb24sIEF1ZyAxNiwgMjAyMSBhdCAwOTo0
Mjo0MUFNIC0wNzAwLCBFbGVuYSBVZmltdHNldmEgd3JvdGU6DQo+PiBAQCAtMTUxNCw2ICsxNTE1
LDE2IEBAIGJvb2wgdmZpb19nZXRfaW5mb19kbWFfYXZhaWwoc3RydWN0IHZmaW9faW9tbXVfdHlw
ZTFfaW5mbyAqaW5mbywNCj4+ICAgICByZXR1cm4gdHJ1ZTsNCj4+IH0NCj4+IA0KPj4gK3N0YXRp
YyBpbnQgdmZpb19nZXRfcmVnaW9uX2luZm9fcmVtZmQoVkZJT0RldmljZSAqdmJhc2VkZXYsIGlu
dCBpbmRleCkNCj4+ICt7DQo+PiArICAgIHN0cnVjdCB2ZmlvX3JlZ2lvbl9pbmZvICppbmZvOw0K
Pj4gKw0KPj4gKyAgICBpZiAodmJhc2VkZXYtPnJlZ2lvbnMgPT0gTlVMTCB8fCB2YmFzZWRldi0+
cmVnaW9uc1tpbmRleF0gPT0gTlVMTCkgew0KPj4gKyAgICAgICAgdmZpb19nZXRfcmVnaW9uX2lu
Zm8odmJhc2VkZXYsIGluZGV4LCAmaW5mbyk7DQo+PiArICAgIH0NCj4gDQo+IE1heWJlIHRoaXMg
d2lsbCBiZSBjYWxsZWQgZnJvbSBvdGhlciBwbGFjZXMgaW4gdGhlIGZ1dHVyZSwgYnV0IHRoZQ0K
PiB2ZmlvX3JlZ2lvbl9zZXR1cCgpIGNhbGxlciBiZWxvdyBhbHJlYWR5IGludm9rZWQgdmZpb19n
ZXRfcmVnaW9uX2luZm8oKQ0KPiBzbyBJJ20gbm90IHN1cmUgaXQncyBuZWNlc3NhcnkgdG8gZG8g
dGhpcyBhZ2Fpbj8NCj4gDQo+IFBlcmhhcHMgYWRkIGFuIGludCAqcmVtZmQgYXJndW1lbnQgdG8g
dmZpb19nZXRfcmVnaW9uX2luZm8oKS4gVGhhdCB3YXkNCj4gdmZpb19nZXRfcmVnaW9uX2luZm9f
cmVtZmQoKSBpc24ndCBuZWNlc3NhcnkuDQo+IA0KDQoJSSB0aGluayB0aGV5IGNvdWxkIGJlIGNv
bWJpbmVkLCBidXQgdGhlIHJlZ2lvbiBjYXBhYmlsaXRpZXMgYXJlDQpyZXRyaWV2ZWQgd2l0aCBz
ZXBhcmF0ZSBjYWxscyB0byB2ZmlvX2dldF9yZWdpb25faW5mb19jYXAoKSwgc28gSSBmb2xsb3dl
ZA0KdGhhdCBwcmVjZWRlbnQuDQoNCg0KPj4gQEAgLTI0MTAsNiArMjQ0MiwyNCBAQCBpbnQgdmZp
b19nZXRfcmVnaW9uX2luZm8oVkZJT0RldmljZSAqdmJhc2VkZXYsIGludCBpbmRleCwNCj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgdmZpb19yZWdpb25faW5mbyAqKmluZm8pDQo+
PiB7DQo+PiAgICAgc2l6ZV90IGFyZ3N6ID0gc2l6ZW9mKHN0cnVjdCB2ZmlvX3JlZ2lvbl9pbmZv
KTsNCj4+ICsgICAgaW50IGZkID0gLTE7DQo+PiArICAgIGludCByZXQ7DQo+PiArDQo+PiArICAg
IC8qIGNyZWF0ZSByZWdpb24gY2FjaGUgKi8NCj4+ICsgICAgaWYgKHZiYXNlZGV2LT5yZWdpb25z
ID09IE5VTEwpIHsNCj4+ICsgICAgICAgIHZiYXNlZGV2LT5yZWdpb25zID0gZ19uZXcwKHN0cnVj
dCB2ZmlvX3JlZ2lvbl9pbmZvICosDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB2YmFzZWRldi0+bnVtX3JlZ2lvbnMpOw0KPj4gKyAgICAgICAgaWYgKHZiYXNlZGV2LT5w
cm94eSAhPSBOVUxMKSB7DQo+PiArICAgICAgICAgICAgdmJhc2VkZXYtPnJlZ2ZkcyA9IGdfbmV3
MChpbnQsIHZiYXNlZGV2LT5udW1fcmVnaW9ucyk7DQo+PiArICAgICAgICB9DQo+PiArICAgIH0N
Cj4+ICsgICAgLyogY2hlY2sgY2FjaGUgKi8NCj4+ICsgICAgaWYgKHZiYXNlZGV2LT5yZWdpb25z
W2luZGV4XSAhPSBOVUxMKSB7DQo+PiArICAgICAgICAqaW5mbyA9IGdfbWFsbG9jMCh2YmFzZWRl
di0+cmVnaW9uc1tpbmRleF0tPmFyZ3N6KTsNCj4+ICsgICAgICAgIG1lbWNweSgqaW5mbywgdmJh
c2VkZXYtPnJlZ2lvbnNbaW5kZXhdLA0KPj4gKyAgICAgICAgICAgICAgIHZiYXNlZGV2LT5yZWdp
b25zW2luZGV4XS0+YXJnc3opOw0KPj4gKyAgICAgICAgcmV0dXJuIDA7DQo+PiArICAgIH0NCj4g
DQo+IFdoeSBpcyBpdCBuZWNlc3NhcnkgdG8gaW50cm9kdWNlIGEgY2FjaGU/IElzIGl0IHRvIGF2
b2lkIHBhc3NpbmcgdGhlDQo+IHNhbWUgZmQgbXVsdGlwbGUgdGltZXM/DQo+IA0KDQoJWWVzLiAg
Rm9yIHBvbGxlZCByZWdpb25zLCB0aGUgc2VydmVyIHJldHVybnMgYW4gRkQgd2l0aCBlYWNoDQpt
ZXNzYWdlLCBzbyB0aGVyZSB3b3VsZCBiZSBhbiBGRCBsZWFrIGlmIEkgZGlkbuKAmXQgY2hlY2sg
dGhhdCB0aGUgcmVnaW9uDQpoYWRu4oCZdCBhbHJlYWR5IHJldHVybmVkIG9uZS4gIFNpbmNlIEkg
aGFkIHRvIGNhY2hlIHRoZSBGRCBhbnl3YXksIEkNCmNhY2hlZCB0aGUgd2hvbGUgc3RydWN0Lg0K
DQoNCj4+IA0KPj4gICAgICppbmZvID0gZ19tYWxsb2MwKGFyZ3N6KTsNCj4+IA0KPj4gQEAgLTI0
MTcsNyArMjQ2NywxNyBAQCBpbnQgdmZpb19nZXRfcmVnaW9uX2luZm8oVkZJT0RldmljZSAqdmJh
c2VkZXYsIGludCBpbmRleCwNCj4+IHJldHJ5Og0KPj4gICAgICgqaW5mbyktPmFyZ3N6ID0gYXJn
c3o7DQo+PiANCj4+IC0gICAgaWYgKGlvY3RsKHZiYXNlZGV2LT5mZCwgVkZJT19ERVZJQ0VfR0VU
X1JFR0lPTl9JTkZPLCAqaW5mbykpIHsNCj4+ICsgICAgaWYgKHZiYXNlZGV2LT5wcm94eSAhPSBO
VUxMKSB7DQo+PiArICAgICAgICBWRklPVXNlckZEcyBmZHMgPSB7IDAsIDEsICZmZH07DQo+PiAr
DQo+PiArICAgICAgICByZXQgPSB2ZmlvX3VzZXJfZ2V0X3JlZ2lvbl9pbmZvKHZiYXNlZGV2LCBp
bmRleCwgKmluZm8sICZmZHMpOw0KPj4gKyAgICB9IGVsc2Ugew0KPj4gKyAgICAgICAgcmV0ID0g
aW9jdGwodmJhc2VkZXYtPmZkLCBWRklPX0RFVklDRV9HRVRfUkVHSU9OX0lORk8sICppbmZvKTsN
Cj4+ICsgICAgICAgIGlmIChyZXQgPCAwKSB7DQo+PiArICAgICAgICAgICAgcmV0ID0gLWVycm5v
Ow0KPj4gKyAgICAgICAgfQ0KPj4gKyAgICB9DQo+PiArICAgIGlmIChyZXQgIT0gMCkgew0KPj4g
ICAgICAgICBnX2ZyZWUoKmluZm8pOw0KPj4gICAgICAgICAqaW5mbyA9IE5VTEw7DQo+PiAgICAg
ICAgIHJldHVybiAtZXJybm87DQo+PiBAQCAtMjQyNiwxMCArMjQ4NiwyMiBAQCByZXRyeToNCj4+
ICAgICBpZiAoKCppbmZvKS0+YXJnc3ogPiBhcmdzeikgew0KPj4gICAgICAgICBhcmdzeiA9ICgq
aW5mbyktPmFyZ3N6Ow0KPj4gICAgICAgICAqaW5mbyA9IGdfcmVhbGxvYygqaW5mbywgYXJnc3op
Ow0KPj4gKyAgICAgICAgaWYgKGZkICE9IC0xKSB7DQo+PiArICAgICAgICAgICAgY2xvc2UoZmQp
Ow0KPj4gKyAgICAgICAgICAgIGZkID0gLTE7DQo+PiArICAgICAgICB9DQo+PiANCj4+ICAgICAg
ICAgZ290byByZXRyeTsNCj4+ICAgICB9DQo+PiANCj4+ICsgICAgLyogZmlsbCBjYWNoZSAqLw0K
Pj4gKyAgICB2YmFzZWRldi0+cmVnaW9uc1tpbmRleF0gPSBnX21hbGxvYzAoYXJnc3opOw0KPj4g
KyAgICBtZW1jcHkodmJhc2VkZXYtPnJlZ2lvbnNbaW5kZXhdLCAqaW5mbywgYXJnc3opOw0KPj4g
KyAgICAqdmJhc2VkZXYtPnJlZ2lvbnNbaW5kZXhdID0gKippbmZvOw0KPiANCj4gVGhlIHByZXZp
b3VzIGxpbmUgYWxyZWFkeSBjb3BpZWQgdGhlIGNvbnRlbnRzIG9mICppbmZvLiBXaGF0IGlzIHRo
ZQ0KPiBwdXJwb3NlIG9mIHRoaXMgYXNzaWdubWVudD8NCj4gDQoNCglUaGF0IG1pZ2h0IGJlIGEg
bWlzLW1lcmdlLiAgVGhlIHN0cnVjdCBhc3NpZ25tZW50IHdhcyBhIGJ1Zw0KZml4ZWQgc2V2ZXJh
bCByZXZzIGFnbyB3aXRoIHRoZSBtZW1jcHkoKSBjYWxsLg0KDQoNCj4+ICsgICAgaWYgKHZiYXNl
ZGV2LT5yZWdmZHMgIT0gTlVMTCkgew0KPj4gKyAgICAgICAgdmJhc2VkZXYtPnJlZ2Zkc1tpbmRl
eF0gPSBmZDsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gICAgIHJldHVybiAwOw0KPj4gfQ0KPj4gDQo+
PiBkaWZmIC0tZ2l0IGEvaHcvdmZpby91c2VyLmMgYi9ody92ZmlvL3VzZXIuYw0KPj4gaW5kZXgg
YjU4NGI4ZTBmMi4uOTFiNTFmMzdkZiAxMDA2NDQNCj4+IC0tLSBhL2h3L3ZmaW8vdXNlci5jDQo+
PiArKysgYi9ody92ZmlvL3VzZXIuYw0KPj4gQEAgLTczNCwzICs3MzQsMzYgQEAgaW50IHZmaW9f
dXNlcl9nZXRfaW5mbyhWRklPRGV2aWNlICp2YmFzZWRldikNCj4+ICAgICB2YmFzZWRldi0+cmVz
ZXRfd29ya3MgPSAhIShtc2cuZmxhZ3MgJiBWRklPX0RFVklDRV9GTEFHU19SRVNFVCk7DQo+PiAg
ICAgcmV0dXJuIDA7DQo+PiB9DQo+PiArDQo+PiAraW50IHZmaW9fdXNlcl9nZXRfcmVnaW9uX2lu
Zm8oVkZJT0RldmljZSAqdmJhc2VkZXYsIGludCBpbmRleCwNCj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzdHJ1Y3QgdmZpb19yZWdpb25faW5mbyAqaW5mbywgVkZJT1VzZXJGRHMg
KmZkcykNCj4+ICt7DQo+PiArICAgIGdfYXV0b2ZyZWUgVkZJT1VzZXJSZWdpb25JbmZvICptc2dw
ID0gTlVMTDsNCj4+ICsgICAgaW50IHNpemU7DQo+IA0KPiBQbGVhc2UgdXNlIHVpbnQzMl90IHNp
emUgaW5zdGVhZCBvZiBpbnQgc2l6ZSB0byBwcmV2ZW50IHBvc3NpYmxlDQo+IHNpZ25lZG5lc3Mg
aXNzdWVzOg0KPiAtIFZGSU9Vc2VyUmVnaW9uSW5mby0+YXJnc3ogaXMgdWludDMyX3QuDQo+IC0g
c2l6ZW9mKFZGSU9Vc2VySGRyKSBpcyBzaXplX3QuDQo+IC0gVGhlIHZmaW9fdXNlcl9yZXF1ZXN0
X21zZygpIHNpemUgYXJndW1lbnQgaXMgdWludDMyX3QuDQoNCglPSw0KDQoJCUpKDQoNCg0K

