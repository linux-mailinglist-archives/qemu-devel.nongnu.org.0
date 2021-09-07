Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B54F1402A67
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 16:08:20 +0200 (CEST)
Received: from localhost ([::1]:57964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNblr-0006tE-Ph
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 10:08:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=88847c260e=pdel@fb.com>)
 id 1mNbjn-000408-0V; Tue, 07 Sep 2021 10:06:11 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:39102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=88847c260e=pdel@fb.com>)
 id 1mNbjj-0001zK-JR; Tue, 07 Sep 2021 10:06:10 -0400
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 187DuKgR023919; Tue, 7 Sep 2021 07:05:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=XiMa/vfjCjN/uaX+lneCd8MlplZFw/PkWFegUid2Xh4=;
 b=rMDniVW1zYhCftjUIMwbGbL443lW+AeGxO++qRA47jdromS8oTXLbwxJRiNFaUScl6Me
 YuaAf+g1CelwTsYhLsuYuBkEhC3OftZ6cV+GVCxWGvkoOo2kRrpav1nw4Ism7GklVFvy
 HYWqTcydGw+bsoJoqPQT4QppLyZT31ltPgA= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 3awphe5aw3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 07 Sep 2021 07:05:51 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Tue, 7 Sep 2021 07:05:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YSzhpL0hiCKvs2vdQWjN06WS/NHUYVUEpKBqzzz/Z0WknK5YxijN0AsclFP4ZWGqaHjvaQUtbvGdODrL0Mta6rWeQ3kjxkpnJnsHctm57s9Ozs+i7HkUGfNk77O0/4JOxQdJK7ILyYgtMIr1L3mRjFqe/jBuDgZeNPgxgx6EFfAG2dIE4olHkL4TTO3KVHQauT3UiHQEAMN7XV3Q8GS4RHpHyAFRlrBvCC1cx7HFXeBlrSqJs/SOoWsQ76quWz1vWWPgKJxLggASakiqY7WkbzDA8+bN7rY5EnlGBm4udMOTqHzv/FhJcRRLX3UQaX6I29bNM0KmDneZ/Pfco39hqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=XiMa/vfjCjN/uaX+lneCd8MlplZFw/PkWFegUid2Xh4=;
 b=SrB4QRWmnFjMm69yNVswx5Nqoq4FIGGsd863VvVdMJLldYL1jOr4dnnu6ppcyfQZuxXRPTCgK3kd4Xhwx7GWmdtKuMIbNEgd8scI3U1Ws3q5Z63GdLVRWjzz1ZKSqoxlBgkh4e54SeetmRH+i4gHsfZ3edNMQiSF7/5CF/b1A5efUbKElS9YMOXZ8rJEW70MAgjB9b9yw5f3ExmX0koJhmkoOhsqTaN5a+szlAH+qUhobuRbxsdp+405gG+IZXRURB1G67cq1B1UO7ZKoHIWv5JlLW8YIbXkf6CS2Kt34HgvHMnnm88LzwRzjo0XaUEjWpJbdFv6PGdMU1dvYN9hhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by BYAPR15MB2630.namprd15.prod.outlook.com (2603:10b6:a03:14c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.24; Tue, 7 Sep
 2021 14:05:47 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::39cf:cf4c:885c:9368]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::39cf:cf4c:885c:9368%7]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 14:05:47 +0000
From: Peter Delevoryas <pdel@fb.com>
To: Joel Stanley <joel@jms.id.au>
CC: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, QEMU Developers
 <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [PATCH v4] hw/arm/aspeed: Add Fuji machine type
Thread-Topic: [PATCH v4] hw/arm/aspeed: Add Fuji machine type
Thread-Index: AQHXoyOAAQ6mGI7hqESqAv26Mh3dxquYRviAgABVqoA=
Date: Tue, 7 Sep 2021 14:05:47 +0000
Message-ID: <379704F7-86BE-4AF1-A256-58652508BD53@fb.com>
References: <20210906133124.3674661-1-pdel@fb.com>
 <CACPK8Xdmc3i8C7gkVxsuBcPuHKzDsTZ1tKcx5R7qVAHYN=uhwQ@mail.gmail.com>
In-Reply-To: <CACPK8Xdmc3i8C7gkVxsuBcPuHKzDsTZ1tKcx5R7qVAHYN=uhwQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=fb.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56d35d00-6250-4442-fe43-08d97208978e
x-ms-traffictypediagnostic: BYAPR15MB2630:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB2630AA2B8A6190BA20E1DF79ACD39@BYAPR15MB2630.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tY8Xukqivg2QemRybavSd3ZpK/+R36y6P/h+TQuBjZHhHYax3tX0ZEM5rMAwHj47g8XCWkvkT4pB1bzPf3bgNWlkTsZI9nDDjyAnFL1imHAEer1XcqpW1cUHmPNUGn+KtEUurUwq7D2JuAzXv0C9VLyz6UCnEyWo6gfnW+PO28zFiF6iA4kgO/jFQShjTVuTQHSpqO2y/r6q6my4oxOPH3sweb0QJ2X678D8/V2+FWk1B8Hwz94h2hjL38kVXjFfPoQpZDdr+QOGPuML+LHEzwLzpwS/Dbe6Fgd8DP0ZIgmx+by//9uG4MJYoeho/kq+PJMXNRZh5fVgp95ebPVmSUqZq9gCYjVNmaLAHd8r0m6SV0ijuxAVdc9yUCCVJ/YQ4hZn8rZqupoApTfJnrh91QCx2SjqDfZdFXLBRXyFaugvJQWETB3COAqITqcoT4diup/Rz44TP76HUOJzhY7z2GWNNR2QT+NR9txypIp/NM8eckGyPt4LAADNQBvbxgoUUXx1pktxaVZLIC31K/SNxo7LOH3vfP1pYJNmJwzoz5bvnmKkwTeLv5OhwHEojfcyRHgx95ONY3LaHFeljFLQseGoZ3P4uYuAjbXYhMDQi8cqtIegRfBSEHse6PkVB/u2wDfPjUvD0C44DXgvZc/3sO3lNoYUN2ubmhzzPUQZDKnNYHb2KKR4SKUdYhH5euJCfjGhS4OpYnuLfKCDHR98R5jXQpCnyBbwuaZH+8B4sxZMk/gWQb9ZyeeeXX1DjYmEbXiRfyUuKoZ+O0xwtGaEqBdybyL/hrb2S5Q5j2Hw/uM9eaozeohLyDR2oL43D12tSKkycLHSFnjznoYgqzKTyy5GgWE+nId40Cdq5/E4D9g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(6506007)(2616005)(6486002)(33656002)(66556008)(66946007)(478600001)(66476007)(64756008)(5660300002)(122000001)(6916009)(66446008)(966005)(76116006)(316002)(54906003)(53546011)(38100700002)(186003)(86362001)(38070700005)(4326008)(2906002)(71200400001)(36756003)(8676002)(6512007)(8936002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UUwzb2pnaDlEMVQrUXhkbUsxaGhvWHFXeUNCUm9jdTFoeEw2em5iSnFPQUk1?=
 =?utf-8?B?TUZBMnY5U3J0V0ZHNWZ4QWxRWGh6S2VYSmd2aGNEc2xTc1JoNGhQeUFDbEMv?=
 =?utf-8?B?TjhYQVoyWmhIU2lsRGxzSUZUdkV1Yi8xTlpkVkV4bGtXdWpoV3ZZb2lrV29k?=
 =?utf-8?B?M3Z5d1RxNUhyVXFnd2xBQUtXUytaaFYxY24vQkR1YUJrYWNCZCt0S1QxTW1h?=
 =?utf-8?B?eFI5QUVKTys5VU5IYVhEL3paakRYb3BJbFNha0dIMXJSVGxhVnpPeFhvV1I3?=
 =?utf-8?B?VlZFc1BYVXNJRzJDQTdSeEdRajUxb09vcUhwNk1lU2xGdXU3M20zeVF5QjFo?=
 =?utf-8?B?b1c0QVZOcG9UN2lqdDhXNVltclpNNTlteUxxTkRJcmo5R2tYL0xzOWpOanRu?=
 =?utf-8?B?dFBudlhjWFptNyt6anZST2crNXZWbmNBVmMwbytQVG9QOS96bWc4b0VsZUs2?=
 =?utf-8?B?N0doSUdDb2pLOGlCSDBiWHAyM0JKK0tRV3ZmMHlabVN3M3NLQm1NbWpPVkRt?=
 =?utf-8?B?MHAyeXN0ay9RUHdMSnZ1dStpSGtnbWgrS0NWVk9XRGlCcVM0V1BzazR5MitV?=
 =?utf-8?B?ZE1hdTR0MXhHTzJpMk9CTjFuaU05M1RUeCtrQ1g4aUFKUVNzKzhSS25IdlB3?=
 =?utf-8?B?ZEg3LzQyYWJsZ1BJUVJaRG5HNVo1b01wVitYNTU3OUVyQjkwU0kzZmRvU1l1?=
 =?utf-8?B?encvM1lEaVlLNDlKbjRaOHRSQ0NKVzNmd2xtcmYzc1dRVFdyNFZYSG0vMWlm?=
 =?utf-8?B?dDlEcXUyWjBibVRjNS9XcHhzUWs5cmRIQkF1TzB3RWdnQVFTa3MzTEZLWWJp?=
 =?utf-8?B?Q3lSZ1diZGM1K3ZxWmZTd20xRHV2Z1hnakQ2Mm9oNUNNV0FoZnVqZjZFQkRa?=
 =?utf-8?B?RDBFUEE4OXhGVHZDM0dTejNRb0duTnkyNk9VSnFzWmRnTm5DTWFKMit6VWFK?=
 =?utf-8?B?bVM1Yjcxb251MFJ5dkJ0SnZJTVlwZjJoSUxPNHIwNEdUekl0dFFNRTJyNmRY?=
 =?utf-8?B?K0Ric0hYUDNCUzJnMThNbnI0S3FQYVNmVS9mdjlvZEo1WVhHMEZleHFsaDl2?=
 =?utf-8?B?WmZrK0tKL2FrQUJaV2RBVEg0MFE0UjdLS1NxbWNxaXEwMFNLMzBlTzBnR3c1?=
 =?utf-8?B?eVM5VlpJNTJLUWxzbW14U1hNM1J2clBxNFcwVVRsTXJvdTZTVGFBa09DTUt5?=
 =?utf-8?B?b1NkYXlCOWtKUXBzRWFIRnRiK1BBNlVqc2pQSCtzeC9uWjlRTkdzclpqb0hq?=
 =?utf-8?B?MmFCWlZ6RWNKa2srbDIrdVkvOTE4alVXTVBaWDhRdlZjOXh2VHpDQnZZT1ZG?=
 =?utf-8?B?NFpzam9uOE55ZGttM1h5OC9TZnM4TmNXa3VnUFQ0SUNFNU1YUnBtWGpMMTcw?=
 =?utf-8?B?ekxyRmUrVGJhMnFEUVVOMHU0WUFaVDYvRFlBMi9Tcm91V090MHlpeUpOTzl3?=
 =?utf-8?B?U0t5b0lyUnd2bUIra1hIaUpNYThPU0xOdlErc0tadlUyUkNHeVA3bkxjTzIy?=
 =?utf-8?B?bjMzdXptaGhBdDc5Q0xYU1dGVnlZRVpNYWRucm54U2N5RjBET29RNTA0a29G?=
 =?utf-8?B?TzVyTDJJRlVlZFRSUUhJaDNrTE5wYmJyL214YXVlejRJNDZZZ3k3UEthRjJs?=
 =?utf-8?B?VysySXRaMUVjbElQWmpScUxaOFR0QU9pejc2NEl1ZUZtSkxOZlUxa091L0lH?=
 =?utf-8?B?cThpVFpqdFVuTS9yY0ZhUldxSUVvRzZsTEtaQW1NaHZvVlgxeWZmUVFJQXBo?=
 =?utf-8?B?MU5JWGM0cDRnYjYzVStTQnFIOW0xRHRWd011MHQzYnFrNWlPOU5rR00vTHRL?=
 =?utf-8?Q?xTQcAYiGj8TOO5aHCsj7XEFr+ZlCSauzfLU0U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A6E100C9EC0F06419E66C970B88EC4DA@namprd15.prod.outlook.com>
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d35d00-6250-4442-fe43-08d97208978e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2021 14:05:47.5452 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O0Yglyop33oFnmvNQkOAJdx85QRxmhktSZreQc61+UrDLN/WzDgHVDAdPqMT9+nK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2630
X-OriginatorOrg: fb.com
X-Proofpoint-GUID: 0h0pq8FLxAMiMF6aod6WpxpCGxLhT37f
X-Proofpoint-ORIG-GUID: 0h0pq8FLxAMiMF6aod6WpxpCGxLhT37f
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-07_04:2021-09-07,
 2021-09-07 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109070092
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=88847c260e=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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

DQoNCj4gT24gU2VwIDcsIDIwMjEsIGF0IDE6NTkgQU0sIEpvZWwgU3RhbmxleSA8am9lbEBqbXMu
aWQuYXU+IHdyb3RlOg0KPiANCj4gT24gTW9uLCA2IFNlcHQgMjAyMSBhdCAxMzozMSwgPHBkZWxA
ZmIuY29tPiB3cm90ZToNCj4+IA0KPj4gRnJvbTogUGV0ZXIgRGVsZXZvcnlhcyA8cGRlbEBmYi5j
b20+DQo+PiANCj4+IFRoaXMgYWRkcyBhIG5ldyBtYWNoaW5lIHR5cGUgImZ1amktYm1jIiBiYXNl
ZCBvbiB0aGUgZm9sbG93aW5nIGRldmljZSB0cmVlOg0KPj4gDQo+PiBodHRwczovL2dpdGh1Yi5j
b20vdG9ydmFsZHMvbGludXgvYmxvYi80MGNiNjM3M2I0Ni9hcmNoL2FybS9ib290L2R0cy9hc3Bl
ZWQtYm1jLWZhY2Vib29rLWZ1amkuZHRzDQo+PiANCj4+IE1vc3Qgb2YgdGhlIGkyYyBkZXZpY2Vz
IGFyZSBub3QgdGhlcmUsIHRoZXkncmUgYWRkZWQgaGVyZToNCj4+IA0KPj4gaHR0cHM6Ly9naXRo
dWIuY29tL2ZhY2Vib29rL29wZW5ibWMvYmxvYi9mYjJlZDEyMDAyZmIvbWV0YS1mYWNlYm9vay9t
ZXRhLWZ1amkvcmVjaXBlcy11dGlscy9vcGVuYm1jLXV0aWxzL2ZpbGVzL3NldHVwX2kyYy5zaA0K
Pj4gDQo+PiBJIHRlc3RlZCB0aGlzIGJ5IGJ1aWxkaW5nIGEgRnVqaSBpbWFnZSBmcm9tIEZhY2Vi
b29rJ3MgT3BlbkJNQyByZXBvLA0KPj4gYm9vdGluZywgYW5kIHNzaCdpbmcgZnJvbSBob3N0LXRv
LWd1ZXN0Lg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBEZWxldm9yeWFzIDxwZGVsQGZi
LmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5OiBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1Pg0K
DQpUaGFua3MhDQoNCj4gDQo+PiArc3RhdGljIHZvaWQgZnVqaV9ibWNfaTJjX2luaXQoQXNwZWVk
TWFjaGluZVN0YXRlICpibWMpDQo+PiArew0KPj4gKyAgICBBc3BlZWRTb0NTdGF0ZSAqc29jID0g
JmJtYy0+c29jOw0KPj4gKyAgICBJMkNCdXMgKmkyY1sxNDRdID0ge307DQo+PiArDQo+PiArICAg
IGZvciAoaW50IGkgPSAwOyBpIDwgMTY7IGkrKykgew0KPj4gKyAgICAgICAgaTJjW2ldID0gYXNw
ZWVkX2kyY19nZXRfYnVzKCZzb2MtPmkyYywgaSk7DQo+PiArICAgIH0NCj4+ICsgICAgSTJDQnVz
ICppMmMxODAgPSBpMmNbMl07DQo+PiArICAgIEkyQ0J1cyAqaTJjNDgwID0gaTJjWzhdOw0KPj4g
KyAgICBJMkNCdXMgKmkyYzYwMCA9IGkyY1sxMV07DQo+PiArDQo+PiArICAgIGdldF9wY2E5NTQ4
X2NoYW5uZWxzKGkyYzE4MCwgMHg3MCwgJmkyY1sxNl0pOw0KPiANCj4gV293LCB0aGlzIGlzIGlu
dGVyZXN0aW5nLiBIb3cgZGlkIHlvdSBnbyBhYm91dCB0ZXN0aW5nIGl0PyBBcmUgeW91DQo+IHN1
cmUgeW91IGRpZG4ndCBvdmVyd3JpdGUgYW55IG9mIHRoZSBwb2ludGVycz8NCj4gDQo+IEl0IG1p
Z2h0IGJlIHdvcnRoIGNvbWluZyB1cCB3aXRoIGEgYmV0dGVyIHdheSBvZiBkZXNjcmliaW5nIGFs
bCBvZiB0aGUNCj4gaTJjIGJ1c2VzIGZvciBmdXR1cmUgbWFjaGluZXMuDQo+IA0KPiBDaGVlcnMs
DQo+IA0KPiBKb2VsDQoNCkFoLCB5ZXMsIHNvLCBJIHRvb2sgdGhlIGNvbXBpbGVkIGRldmljZSB0
cmVlIG91dHB1dCBhbmQgcHJpbnRlZCBpdCBvdXQsDQphbmQgaXQgaGFzIGEgY29tcGxldGUgbGlz
dCBvZiB0aGUgaTJjIGFsaWFzZXMgZnJvbSBhbGwgb2YgdGhlIGNvbXBvbmVudA0KZGV2aWNlIHRy
ZWXigJlzLCBsaWtlIHRoaXM6DQoNCmR0YyBvcGVuYm1jL2J1aWxkLWZ1amkvdG1wL2RlcGxveS9p
bWFnZXMvZnVqaS9hc3BlZWQtYm1jLWZhY2Vib29rLWZ1amkuZHRiDQoNCmFsaWFzZXMgew0KICAg
ICAgICBpMmMwID0gIi9haGIvYXBiL2J1c0AxZTc4YTAwMC9pMmMtYnVzQDgwIjsNCiAgICAgICAg
aTJjMSA9ICIvYWhiL2FwYi9idXNAMWU3OGEwMDAvaTJjLWJ1c0AxMDAiOw0KICAgICAgICBpMmMy
ID0gIi9haGIvYXBiL2J1c0AxZTc4YTAwMC9pMmMtYnVzQDE4MCI7DQogICAgICAgIGkyYzMgPSAi
L2FoYi9hcGIvYnVzQDFlNzhhMDAwL2kyYy1idXNAMjAwIjsNCiAgICAgICAgaTJjNCA9ICIvYWhi
L2FwYi9idXNAMWU3OGEwMDAvaTJjLWJ1c0AyODAiOw0KICAgICAgICBpMmM1ID0gIi9haGIvYXBi
L2J1c0AxZTc4YTAwMC9pMmMtYnVzQDMwMCI7DQogICAgICAgIGkyYzYgPSAiL2FoYi9hcGIvYnVz
QDFlNzhhMDAwL2kyYy1idXNAMzgwIjsNCiAgICAgICAgaTJjNyA9ICIvYWhiL2FwYi9idXNAMWU3
OGEwMDAvaTJjLWJ1c0A0MDAiOw0KICAgICAgICBpMmM4ID0gIi9haGIvYXBiL2J1c0AxZTc4YTAw
MC9pMmMtYnVzQDQ4MCI7DQogICAgICAgIGkyYzkgPSAiL2FoYi9hcGIvYnVzQDFlNzhhMDAwL2ky
Yy1idXNANTAwIjsNCiAgICAgICAgaTJjMTAgPSAiL2FoYi9hcGIvYnVzQDFlNzhhMDAwL2kyYy1i
dXNANTgwIjsNCiAgICAgICAgaTJjMTEgPSAiL2FoYi9hcGIvYnVzQDFlNzhhMDAwL2kyYy1idXNA
NjAwIjsNCiAgICAgICAgaTJjMTIgPSAiL2FoYi9hcGIvYnVzQDFlNzhhMDAwL2kyYy1idXNANjgw
IjsNCiAgICAgICAgaTJjMTMgPSAiL2FoYi9hcGIvYnVzQDFlNzhhMDAwL2kyYy1idXNANzAwIjsN
CiAgICAgICAgaTJjMTQgPSAiL2FoYi9hcGIvYnVzQDFlNzhhMDAwL2kyYy1idXNANzgwIjsNCiAg
ICAgICAgaTJjMTUgPSAiL2FoYi9hcGIvYnVzQDFlNzhhMDAwL2kyYy1idXNAODAwIjsNCiAgICAg
ICAgLi4uDQogICAgICAgIGkyYzE2ID0gIi9haGIvYXBiL2J1c0AxZTc4YTAwMC9pMmMtYnVzQDE4
MC9pMmMtc3dpdGNoQDcwL2kyY0AwIjsNCiAgICAgICAgaTJjMTcgPSAiL2FoYi9hcGIvYnVzQDFl
NzhhMDAwL2kyYy1idXNAMTgwL2kyYy1zd2l0Y2hANzAvaTJjQDEiOw0KICAgICAgICBpMmMxOCA9
ICIvYWhiL2FwYi9idXNAMWU3OGEwMDAvaTJjLWJ1c0AxODAvaTJjLXN3aXRjaEA3MC9pMmNAMiI7
DQogICAgICAgIGkyYzE5ID0gIi9haGIvYXBiL2J1c0AxZTc4YTAwMC9pMmMtYnVzQDE4MC9pMmMt
c3dpdGNoQDcwL2kyY0AzIjsNCiAgICAgICAgaTJjMjAgPSAiL2FoYi9hcGIvYnVzQDFlNzhhMDAw
L2kyYy1idXNAMTgwL2kyYy1zd2l0Y2hANzAvaTJjQDQiOw0KICAgICAgICBpMmMyMSA9ICIvYWhi
L2FwYi9idXNAMWU3OGEwMDAvaTJjLWJ1c0AxODAvaTJjLXN3aXRjaEA3MC9pMmNANSI7DQogICAg
ICAgIGkyYzIyID0gIi9haGIvYXBiL2J1c0AxZTc4YTAwMC9pMmMtYnVzQDE4MC9pMmMtc3dpdGNo
QDcwL2kyY0A2IjsNCiAgICAgICAgaTJjMjMgPSAiL2FoYi9hcGIvYnVzQDFlNzhhMDAwL2kyYy1i
dXNAMTgwL2kyYy1zd2l0Y2hANzAvaTJjQDciOw0KICAgICAgICBpMmMyNCA9ICIvYWhiL2FwYi9i
dXNAMWU3OGEwMDAvaTJjLWJ1c0A0ODAvaTJjLXN3aXRjaEA3MC9pMmNAMCI7DQogICAgICAgIGky
YzI1ID0gIi9haGIvYXBiL2J1c0AxZTc4YTAwMC9pMmMtYnVzQDQ4MC9pMmMtc3dpdGNoQDcwL2ky
Y0AxIjsNCiAgICAgICAgaTJjMjYgPSAiL2FoYi9hcGIvYnVzQDFlNzhhMDAwL2kyYy1idXNANDgw
L2kyYy1zd2l0Y2hANzAvaTJjQDIiOw0KICAgICAgICBpMmMyNyA9ICIvYWhiL2FwYi9idXNAMWU3
OGEwMDAvaTJjLWJ1c0A0ODAvaTJjLXN3aXRjaEA3MC9pMmNAMyI7DQogICAgICAgIGkyYzI4ID0g
Ii9haGIvYXBiL2J1c0AxZTc4YTAwMC9pMmMtYnVzQDQ4MC9pMmMtc3dpdGNoQDcwL2kyY0A0IjsN
CiAgICAgICAgaTJjMjkgPSAiL2FoYi9hcGIvYnVzQDFlNzhhMDAwL2kyYy1idXNANDgwL2kyYy1z
d2l0Y2hANzAvaTJjQDUiOw0KICAgICAgICBpMmMzMCA9ICIvYWhiL2FwYi9idXNAMWU3OGEwMDAv
aTJjLWJ1c0A0ODAvaTJjLXN3aXRjaEA3MC9pMmNANiI7DQogICAgICAgIGkyYzMxID0gIi9haGIv
YXBiL2J1c0AxZTc4YTAwMC9pMmMtYnVzQDQ4MC9pMmMtc3dpdGNoQDcwL2kyY0A3IjsNCiAgICAg
ICAgaTJjNDAgPSAiL2FoYi9hcGIvYnVzQDFlNzhhMDAwL2kyYy1idXNANjAwL2kyYy1zd2l0Y2hA
NzcvaTJjQDAiOw0KICAgICAgICBpMmM0MSA9ICIvYWhiL2FwYi9idXNAMWU3OGEwMDAvaTJjLWJ1
c0A2MDAvaTJjLXN3aXRjaEA3Ny9pMmNAMSI7DQogICAgICAgIGkyYzQyID0gIi9haGIvYXBiL2J1
c0AxZTc4YTAwMC9pMmMtYnVzQDYwMC9pMmMtc3dpdGNoQDc3L2kyY0AyIjsNCiAgICAgICAgaTJj
NDMgPSAiL2FoYi9hcGIvYnVzQDFlNzhhMDAwL2kyYy1idXNANjAwL2kyYy1zd2l0Y2hANzcvaTJj
QDMiOw0KICAgICAgICBpMmM0NCA9ICIvYWhiL2FwYi9idXNAMWU3OGEwMDAvaTJjLWJ1c0A2MDAv
aTJjLXN3aXRjaEA3Ny9pMmNANCI7DQogICAgICAgIGkyYzQ2ID0gIi9haGIvYXBiL2J1c0AxZTc4
YTAwMC9pMmMtYnVzQDYwMC9pMmMtc3dpdGNoQDc3L2kyY0A2IjsNCiAgICAgICAgLi4uDQogICAg
ICAgIGkyYzE0MyA9ICIvYWhiL2FwYi9idXNAMWU3OGEwMDAvaTJjLWJ1c0A2MDAvaTJjLXN3aXRj
aEA3Ny9pMmNANy9pMmMtc3dpdGNoQDc2L2kyY0A3IjsNCn07DQoNCkFuZCBzZXR1cF9pMmMuc2ji
gJlzIGZpcnN0IHBhcmFtZXRlciBpcyByZWZlcmVuY2luZyB0aGVzZSBhbGlhc2VzOg0KDQojICMg
aTJjLW11eCAyLCBjaGFubmVsIDINCmkyY19kZXZpY2VfYWRkIDE3IDB4NGMgbG03NSAgICNTQ00g
dGVtcC4gc2Vuc29yDQppMmNfZGV2aWNlX2FkZCAxNyAweDRkIGxtNzUgICAjU0NNIHRlbXAuIHNl
bnNvcg0KDQojICMgaTJjLW11eCAyLCBjaGFubmVsIDMNCmkyY19kZXZpY2VfYWRkIDE5IDB4NTIg
MjRjNjQgICAjRUVQUk9NDQoNCiMgIyBpMmMtbXV4IDIsIGNoYW5uZWwgNA0KaTJjX2RldmljZV9h
ZGQgMjAgMHg1MCAyNGMwMiAgICNCTUM1NDYxNlMgRUVQUk9NDQoNCiMgIyBpMmMtbXV4IDIsIGNo
YW5uZWwgNg0KaTJjX2RldmljZV9hZGQgMjIgMHg1MiAyNGMwMiAgICNCTUM1NDYxNlMgRUVQUk9N
DQoNCk15IGZpcnN0IGlkZWEgd2FzIHRvIG1ha2Ugc29tZSBraW5kIG9mIHRyZWUgZGVmaW5pdGlv
bg0KZGVzY3JpYmluZyB0aGUgaTJjIHN3aXRjaGVzIGFuZCB0aGVuIGRvIGEgYnJlYWR0aCBmaXJz
dA0Kc2VhcmNoL2V0YyB0byBlbnVtZXJhdGUgYWxsIG9mIHRoZSBidXNlcy4NCg0KSTJDQnVzICpp
MmNbMTQ0XSA9IHt9DQovLyBJbml0aWFsaXplIGJhc2Ugc2V0IG9mIGkyYyBidXNlcy4NCmkyY1sw
XSA9IOKApg0KaTJjWzFdID0g4oCmDQrigKYNCmkyY1sxNV0gPSDigKYNCi8vIEluaXRpYWxpemUg
c3dpdGNoIGRlZmluaXRpb25zLCBpbmNsdWRlcw0KLy8gc29tZSBraW5kIG9mIHJlZmVyZW5jZSB0
byBpdHMgcGFyZW50IGJ1cy4NCnN0cnVjdCB7IOKApiB9IHN3aXRjaGVzW10gPSB74oCmfQ0KLy8g
UG9wdWxhdGUgaTJjIGJ1c2VzIHVzaW5nIHN3aXRjaCBkZWZpbml0aW9ucy4NCmZvciAoaW50IGkg
PSAwOyBpIDwgc2l6ZW9mKHN3aXRjaGVzKS9zaXplb2Yoc3dpdGNoZXNbMF0pOyBpKyspIHsNCiAg
ICBJMkNTbGF2ZSAqc3dpdGNoID0gZmluZF9zd2l0Y2goaTJjLCBzd2l0Y2hlc1tpXSk7DQogICAg
ICAgICAgICAgICAgICAgICAgIF5eXl5SZWN1cnNpdmUgZnVuY3Rpb24gb3Igc29tZXRoaW5nDQog
ICAgZm9yIChpbnQgaiA9IDA7IGogPCA4OyBqKyspIHsNCiAgICAgICAgLy8gU3BlY2lhbCBjYXNl
IGJlY2F1c2UgZnVqaSBkYXRhc2hlZXQgc2tpcHMgMzIuLjQwDQogICAgICAgIGlmIChuID09IDMy
KSB7DQogICAgICAgICAgICBuID0gNDA7DQogICAgICAgIH0NCiAgICAgICAgaTJjW24rK10gPSBh
c3BlZWRfaTJjX2dldF9idXMoc3dpdGNoLCBqKTsNCiAgICB9DQp9DQoNCknigJltIHJlYWxpemlu
ZywgSSBwcm9iYWJseSBzaG91bGQgaGF2ZSBkb25lIHRoaXMsIGJ1dCBJIGFsc28gcmVhbGl6ZWQN
CnRoZXJl4oCZcyBub3QgdGhhdCBtYW55IHN3aXRjaGVzIGluIHRoZSBzeXN0ZW0sIHNvIGlmIHlv
dSBqdXN0IGF1dG9tYXRlDQp0aGUgZ2V0X2NoYW5uZWxzKCkgcGFydCAoeDggYnVzZXMgZm9yIGVh
Y2ggc3dpdGNoKSB0aGVuIGl0IHdhcw0Kbm90IHVucmVhc29uYWJsZSB0byBqdXN0IG1hbnVhbGx5
IHdyaXRlIG91dCB0aGUgbG9jYXRpb25zIGZvciBlYWNoIHN3aXRjaC4NCg0KQXMgZmFyIGFzIHRl
c3Rpbmc6IEkgZGlkbuKAmXQgZG8gYSBsb3QsIEkgbW9zdGx5IGp1c3QgZXllYmFsbOKAmWQgaXQN
Cm1vcmUgYWZ0ZXIgd3JpdGluZyBpdCBvdXQgYW5kIHRoZW4gSSBsb29rZWQgYXQgdGhlIGJvb3Qg
bG9ncywgc28NCknigJltIHN0aWxsIG5vdCBfYWJzb2x1dGVseV8gc3VyZSB0aGF0IEkgZ290IGl0
IHJpZ2h0LiBMZXQgbWUga25vdw0KaWYgeW91IGd1eXMgdGhpbmsgSSBzaG91bGQgcmVmYWN0b3Ig
dGhpcyENCg0KVGhhbmtzLA0KUGV0ZXINCg0KPiANCj4+ICsgICAgZ2V0X3BjYTk1NDhfY2hhbm5l
bHMoaTJjNDgwLCAweDcwLCAmaTJjWzI0XSk7DQo+PiArICAgIC8qIE5PVEU6IFRoZSBkZXZpY2Ug
dHJlZSBza2lwcyBbMzIsIDQwKSBpbiB0aGUgYWxpYXMgbnVtYmVyaW5nICovDQo+PiArICAgIGdl
dF9wY2E5NTQ4X2NoYW5uZWxzKGkyYzYwMCwgMHg3NywgJmkyY1s0MF0pOw0KPj4gKyAgICBnZXRf
cGNhOTU0OF9jaGFubmVscyhpMmNbMjRdLCAweDcxLCAmaTJjWzQ4XSk7DQo+PiArICAgIGdldF9w
Y2E5NTQ4X2NoYW5uZWxzKGkyY1syNV0sIDB4NzIsICZpMmNbNTZdKTsNCj4+ICsgICAgZ2V0X3Bj
YTk1NDhfY2hhbm5lbHMoaTJjWzI2XSwgMHg3NiwgJmkyY1s2NF0pOw0KPj4gKyAgICBnZXRfcGNh
OTU0OF9jaGFubmVscyhpMmNbMjddLCAweDc2LCAmaTJjWzcyXSk7DQo+PiArICAgIGZvciAoaW50
IGkgPSAwOyBpIDwgODsgaSsrKSB7DQo+PiArICAgICAgICBnZXRfcGNhOTU0OF9jaGFubmVscyhp
MmNbNDAgKyBpXSwgMHg3NiwgJmkyY1s4MCArIGkgKiA4XSk7DQo+PiArICAgIH0NCg0K

