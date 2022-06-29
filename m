Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2F1560941
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 20:37:33 +0200 (CEST)
Received: from localhost ([::1]:48736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6cZA-0003uF-0J
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 14:37:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8179e10d56=pdel@fb.com>)
 id 1o6cR9-0000vI-58; Wed, 29 Jun 2022 14:29:15 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:62944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8179e10d56=pdel@fb.com>)
 id 1o6cR7-0008B3-6K; Wed, 29 Jun 2022 14:29:14 -0400
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25TH7ILn024933;
 Wed, 29 Jun 2022 11:28:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=yQo1HNmVdRfADcNBq/qubAWUSe/ss/3gYZgQ1Q7Ozdw=;
 b=pLy+zs5+CFTKwbW6k/1lSQ+9VEb+hB2RtW/hvojKN5ek5ffVugPRPC9UyS/Z6uMGNzoh
 ceR+5UwzYtFGkcdsLJbfm3Ec9OBWlcYfygIOO67UGdAYVeNFIMTeiVDFrhhuENrbXIoZ
 CWyWbcEy8D1aktDgb2I4zr8auut0XGUrC7g= 
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2040.outbound.protection.outlook.com [104.47.51.40])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3h0691g545-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jun 2022 11:28:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdJzyTvISoGkfmQNHAeKgtuYDf4W3DfGjKKhcs37RfFWTrZDhWZ7RFdGmdNmMWl8tH8jeuj8Sz7zVbznKpe+W91FBoJswC7mGe2KtXJ2RpwpDWhIdmwB9jjw1Krza6UK5magGbYIrBLIh29iXKD/HHJLgdaGG6YuNUoL6c5yr7ua4xUDb2gE3OU9R9U++9tlrwxiuY58HHmR+IHTiddRQX+C9Kj2LJkYj/rh02OSAffYRjOW92rQPPJb1v2UrF+u7fgeHCCbCo+ShgL+LZrWmMG7KWpYX/d3DySuzsRtsPlD+t5wu1JM545QuXhhmwTkB2bhODdaVyWeJpRoxH3RRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQo1HNmVdRfADcNBq/qubAWUSe/ss/3gYZgQ1Q7Ozdw=;
 b=WAg5ckYEistem8pAr8AwyFXtWoQpQ7bCjAV+cfRuXYVBiux+GWhxucxS9tzcZShym9sfLcGpov3LB4cAqHcP6w1qtr5LgagRkZ97pzLE13BLYNo+5YTxnra6hjvtCyRq2zJzSku9ut7nEzK5Pf/IxHwSQswEklDhttaxVrhq90ZtScC2zDlIvv/5B3xDlKRRcET3Te3TCbP8LipNHAmddGbXdb9mzDJB93PcjBQp4ecLvqFUTFoOhw3mXoOYwMuX3EUe/J/Tl84yyC2XsD8CsIYIMhFOwijOEL0A/wdhfscCmVZqRL5NRm6BG+PXh9O4MrQTA2nzpE39hjBwtFxMHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by BYAPR15MB3255.namprd15.prod.outlook.com (2603:10b6:a03:107::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 29 Jun
 2022 18:28:56 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70d0:8133:42cc:f134]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70d0:8133:42cc:f134%6]) with mapi id 15.20.5373.018; Wed, 29 Jun 2022
 18:28:56 +0000
From: Peter Delevoryas <pdel@fb.com>
To: Titus Rwantare <titusr@google.com>
CC: Peter Delevoryas <pdel@fb.com>, Peter Delevoryas
 <peterdelevoryas@gmail.com>, =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Corey Minyard
 <cminyard@mvista.com>, Cameron Esfahani via <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Dan Zhang <zhdaniel@fb.com>
Subject: Re: [PATCH v2 08/13] hw/i2c/pmbus: Reset out buf after switching pages
Thread-Topic: [PATCH v2 08/13] hw/i2c/pmbus: Reset out buf after switching
 pages
Thread-Index: AQHYi2l1yvqyqeIKnkisbiT1qXOryq1mrrUAgAAGpYA=
Date: Wed, 29 Jun 2022 18:28:56 +0000
Message-ID: <07AE0263-98F0-4739-8CC6-0361A30D1C53@fb.com>
References: <20220629033634.3850922-1-pdel@fb.com>
 <20220629033634.3850922-9-pdel@fb.com>
 <CAMvPwGqWr2yj6nZAnFn_pXnH+dNRHtJ_qTsaJQv_OqR5sgf3yA@mail.gmail.com>
In-Reply-To: <CAMvPwGqWr2yj6nZAnFn_pXnH+dNRHtJ_qTsaJQv_OqR5sgf3yA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ed4d0bc6-26cf-4510-6db4-08da59fd39f9
x-ms-traffictypediagnostic: BYAPR15MB3255:EE_
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4nO6F3AawTL3KhSlphroAjG4Lkt57k8e4tnh+fs9s9lt32wc/hG6gvJHalPPW0Jl2TZ5y+AjEg8U/podfLPCC9tgI/LZjX0wYN7Jm40uqEuQVFdpheCgtqHAH3FhR5A4PJKE4PrCRSN2snt08/oZ2EE+Zbubh/DkTg6lDoE6fGcnpERmpZh1TQGbiGtnuiQvZBHlcvtz4Griexs5lTyewdk8dRaLzzwdkdaC4GIwQAXDwsIYXMRaSgQuCOVbnYgbPfZWkAxU6tC2w3jlh/schvIaVRhg8+7uECDziPMOghr/yuhtI5yIYCccTr7amMtiKkWrLbnuZgdTsbTr/burWeonYhOoAOmM0FKTV8yr6kZoJxbgRrW+5/jCTvSbaqAma6NvvZ0HXKHOtpdhQOOVUrqmc3oE3s1lSxK0+5JEeEUaTuMSEn/E5gZk5xWeEOETARyzMs5K3H+N50FsBiSD06Y002y0vrG6kQnO5fl8t2Fi8vRJUC+jL9O9LtfKJFrsy9Prq13PhrCoYsdrAI8VwaQGOfeVmuN8xdCjAXUt0YpJEZaSN2/dZ957SI2BNZc0W/Hr/YnOMqlBh5Kjd8nreggsuJcCR3pQYkumH1ahQjZP9oz+o/bQzO6pfP0gWc0a311AFey2fxq/IEt7UUwVGnsfMfucrLCKczZ2/2HFqG0bjgkP2XaFW8LO9zifG3cn8lcd+scZLpapj5vcspUqM9Em9essMwcclR6SGnXGCiS8W+vzwfWVbHPiHMdmQ4FBHVD6d/A9FChzv6KuJRGMkqoQ2V20C8SS98XSlA2R94BJgau/Wh7CJy28d9FiLJ+EeDAP/tMTnJ67YHubrdOk8zqRKsJkdoleYf939wyY0gA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(346002)(39860400002)(366004)(396003)(4326008)(64756008)(8676002)(66476007)(71200400001)(66446008)(86362001)(66556008)(76116006)(122000001)(53546011)(5660300002)(66946007)(966005)(6512007)(316002)(2906002)(6486002)(6506007)(8936002)(33656002)(478600001)(2616005)(38100700002)(38070700005)(54906003)(6916009)(186003)(36756003)(41300700001)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QkRDWldoV2dhajRDcmJJZ21zTktvVlNsWjdlYUhmTTBCRzV2NVBCWnNlUUhW?=
 =?utf-8?B?Vk1tbzdSZENEK2xPNzhvNHIraVZNallXOEx0b1RPQjQ4eUZSNktYdFdSM0ZI?=
 =?utf-8?B?ZXpnaU5Ud3BPZTNrV0IrTk5EZ0hJOWdCZ2t4RFRhZGpxbmo2dVJCWjlDL09H?=
 =?utf-8?B?YnZtazdwcnF5anZyaWJ5TTF5M3VIUURSREtVcW02Ym4ycFdzS0U5dkd1N01l?=
 =?utf-8?B?SHJDK2tDeEZaWGwvYlN4dGk0aCtNdTdNc2M3UjZaM0UzWEZxbkIzL1VkVTF6?=
 =?utf-8?B?NkVRVVVjZk9JSk5mM3JYRG5LamRVbFdVM2g1TGFCYVd0Vy91ZnNteG5weng1?=
 =?utf-8?B?eEtqRXBEaVpUYUZEZUswOC9GTWE2QmpjZVFyMmMzZVoxd29oMm9GUzNUTGxz?=
 =?utf-8?B?M2xwa00zenBqK2pidnFlL0Z1VmlXVVNVanczOXdQSStIQXNBWHh4SldNRU8z?=
 =?utf-8?B?R0F2bGVZMWNUWWIxNzJpdldhakpleDRJUkN5RG8xMnlKdWVVYXhtMGFmU2Ry?=
 =?utf-8?B?b082OWZVZTh3VTJ2RGplOW1pZXRqZ05MN09VR1I5RktKNER6cHdHejU0ZTJ5?=
 =?utf-8?B?SmhhRkdHS21udndPZWx5RzNXSFJpVHJ6WDhZMkVGVllDc0VSbEIwVDMzYVdR?=
 =?utf-8?B?NXMwL1ZZNkhCYmovZVhranpUM0FEcWlleURwQURQZzU2U3RtTHRIU0VvZnlx?=
 =?utf-8?B?Z1lUdEp6V2ROUkRETDlTdklIUXcyU0RQR3RiZkpqemdaZmpxNGxhdkVHeWF0?=
 =?utf-8?B?cExGT0tES25nKy84VnRrRkhLTFF1UlpFRVlXVlFhRUJUVFZQU0JkWFU0R1Ay?=
 =?utf-8?B?L3hHNXh6aExUQWZwSFhBMTJhdTBuclpCRG1kSlU5bkhibDBEbGwvMGUrcmgy?=
 =?utf-8?B?UG9HVlc4Ry9lOThiRFZLdFZEZzE2VHk5OXVWbnNCSmFSbVRDamV3YXp4VXpE?=
 =?utf-8?B?ODFMVnFGRmVRVmdMZUpMRDVmQjZHQ2N1U2FOMkxzWXBwak5QNVk1RmViWlZo?=
 =?utf-8?B?Y2dEUmZmc29YdUxUQko4N0JsMXVZdWUxTmRjVWU2V2lIb2ZaaUtmajJUR3Iv?=
 =?utf-8?B?b1lYaC9JV0VpTUlFay9kU3lLMStpdWluTmcrakx1MGdETFZxR1FkZXd0ai82?=
 =?utf-8?B?TTg3R2dzLzV6bGJrSTUwSDJpSnp6UStObW90eWZUSUFOVFJRMXNIMHVZTnlt?=
 =?utf-8?B?SzVFMnVPVWw1S0tiRUxmNDE0NmZsRDhPRzltVVR1UnZhVGlqd01Eblc2cDAx?=
 =?utf-8?B?Y2Z4NEdEWGQ4OFhpRGNxdkhTVjdycGhkR083WUpCdnJrNWpHeWgxMG9lYTYz?=
 =?utf-8?B?TW0zMGtCV3NRTU9WWm94Q1VWT05GL2ZlZWlkK01JYk9VT2Nia2pUdmwySktD?=
 =?utf-8?B?WnljT1VQUUFzUDdKVmkxNnBBOS91QlVxMmZua2xycDJXcE9UZkJGdTNXbmtQ?=
 =?utf-8?B?UmxHV05LQW5rNEdkd0ZZN2xNRWRiek9wZGFhRjZlVm04dXg2SE9Ib0JtZ2cz?=
 =?utf-8?B?dXh0S2t2ZnN2VXJlSitVZUVPV0M1MW9FV1ZBbnEvSEwrT2NxSlkxZkhqNjdR?=
 =?utf-8?B?SUFreFZ3YVZTaHpQLzJIQkhlVmpiZStnRnU3TStnejBjMzlWcDIycnVNZWlZ?=
 =?utf-8?B?MHRTMC8xL01hZjVzME5raWpuKys5bHZLaUxLSHBrYS9RQ1hWaW9uWG9HZS9v?=
 =?utf-8?B?ZjNPU25hZHgydU52Q1BqQ1NJZGl3UkRLa3JjQnEwNXlGRWI3ZW1GdzF3MTZ2?=
 =?utf-8?B?bmx6OHV4UU44TWw4Smc0OUxsWVZ6aVkyNkVHQVZyTTB4ayt5RHZ4dXNlVndZ?=
 =?utf-8?B?QXViSHk0V28xQ3djc21ubVlIWVozUUdBaFhFNnNneVBUWnJVV2tKUFh6SWs2?=
 =?utf-8?B?am8xRTZnZlZmMG4vcE16RStKVncxK3ozWUx2MjdHeVFqUHJ1L05hSUYvT2h3?=
 =?utf-8?B?RFFPYTJxUUVVRDZEWUF0c3JGWGd2TmN3V0Q2UENyQkVuMEV6Q0ExS3NJQXgr?=
 =?utf-8?B?a2h1ZDZOMk1OTklHVlRVNnQyS25rZUdYTFFMVGRLOXNHaStuRENjcXBzcnNN?=
 =?utf-8?B?bVhReXFoMzR0VnhzcmNRREQrb2xxMzVRN2NzR294N3oybWt3LzBoampMYndJ?=
 =?utf-8?B?N0crNGJuTmpHUk9rbUdEeFd5enNTS2VNTUtRN2QyME83N3JwZWxzbVBHRGtv?=
 =?utf-8?B?OEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <194107A7932B3F408F0F21A2B8ECCF98@namprd15.prod.outlook.com>
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed4d0bc6-26cf-4510-6db4-08da59fd39f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2022 18:28:56.0436 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rrJrd9GztCpH55Rz3OL55Zr8lmAqBtcI03u2fwCWAZ6nWnlfRYiH4+rzaLdKo3KQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3255
X-Proofpoint-GUID: 0sBrAKCnnX8Spiq4xrVC5E-On9uFBQpr
X-Proofpoint-ORIG-GUID: 0sBrAKCnnX8Spiq4xrVC5E-On9uFBQpr
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-29_19,2022-06-28_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=8179e10d56=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

DQoNCj4gT24gSnVuIDI5LCAyMDIyLCBhdCAxMTowNSBBTSwgVGl0dXMgUndhbnRhcmUgPHRpdHVz
ckBnb29nbGUuY29tPiB3cm90ZToNCj4gDQo+IE9uIFR1ZSwgMjggSnVuIDIwMjIgYXQgMjA6MzYs
IFBldGVyIERlbGV2b3J5YXMNCj4gPHBldGVyZGVsZXZvcnlhc0BnbWFpbC5jb20+IHdyb3RlOg0K
Pj4gDQo+PiBXaGVuIGEgcG1idXMgZGV2aWNlIHN3aXRjaGVzIHBhZ2VzLCBpdCBzaG91bGQgY2xl
YXJzIGl0cyBvdXRwdXQgYnVmZmVyIHNvDQo+PiB0aGF0IHRoZSBuZXh0IHRyYW5zYWN0aW9uIGRv
ZXNuJ3QgZW1pdCBkYXRhIGZyb20gdGhlIHByZXZpb3VzIHBhZ2UuDQo+PiANCj4+IEZpeGVzOiAz
NzQ2ZDVjMTVlNzA1NzBiICgiaHcvaTJjOiBhZGQgc3VwcG9ydCBmb3IgUE1CdXPigJ0pDQo+PiBT
aWduZWQtb2ZmLWJ5OiBQZXRlciBEZWxldm9yeWFzIDxwZGVsQGZiLmNvbT4NCj4+IC0tLQ0KPj4g
aHcvaTJjL3BtYnVzX2RldmljZS5jIHwgMSArDQo+PiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL2h3L2kyYy9wbWJ1c19kZXZpY2UuYyBiL2h3L2ky
Yy9wbWJ1c19kZXZpY2UuYw0KPj4gaW5kZXggNjI4ODVmYTZhMS4uZWZkZGMzNmZkOSAxMDA2NDQN
Cj4+IC0tLSBhL2h3L2kyYy9wbWJ1c19kZXZpY2UuYw0KPj4gKysrIGIvaHcvaTJjL3BtYnVzX2Rl
dmljZS5jDQo+PiBAQCAtMTA4OCw2ICsxMDg4LDcgQEAgc3RhdGljIGludCBwbWJ1c193cml0ZV9k
YXRhKFNNQnVzRGV2aWNlICpzbWQsIHVpbnQ4X3QgKmJ1ZiwgdWludDhfdCBsZW4pDQo+PiANCj4+
ICAgICBpZiAocG1kZXYtPmNvZGUgPT0gUE1CVVNfUEFHRSkgew0KPj4gICAgICAgICBwbWRldi0+
cGFnZSA9IHBtYnVzX3JlY2VpdmU4KHBtZGV2KTsNCj4+ICsgICAgICAgIHBtZGV2LT5vdXRfYnVm
X2xlbiA9IDA7DQo+PiAgICAgICAgIHJldHVybiAwOw0KPj4gICAgIH0NCj4+IA0KPiANCj4gSSBz
dXNwZWN0IHlvdSB3ZXJlIHJ1bm5pbmcgaW50byB0aGlzIGJlY2F1c2UgaWNfZGV2aWNlX2lkIHdh
cyBwdXR0aW5nDQo+IHRvbyBtdWNoIGRhdGEgaW4gdGhlIG91dHB1dCBidWZmZXIuIFN0aWxsLCBJ
IHdvdWxkbid0IHdhbnQgdGhlIGJ1ZmZlcg0KPiBjbGVhcmVkIGlmIHRoZSBwYWdlIGhhc24ndCBj
aGFuZ2VkLiBTb21lIGRyaXZlcnMgd3JpdGUgdGhlIHNhbWUgcGFnZQ0KPiBiZWZvcmUgZXZlcnkg
cmVhZC4NCg0KWWVzIHlvdeKAmXJlIGNvcnJlY3Q6IHRoaXMgaXMgdGhlIGNvZGUgdGhhdCB3YXMg
cXVlcnlpbmcgdGhlIGljX2RldmljZV9pZCBbMV06DQoNCiAgICBtZW1zZXQoJm1zZywgMCwgc2l6
ZW9mKG1zZykpOw0KICAgIG1zZy5idXMgPSBzZW5zb3JfY29uZmlnW2luZGV4XS5wb3J0Ow0KICAg
IG1zZy50YXJnZXRfYWRkciA9IHNlbnNvcl9jb25maWdbaW5kZXhdLnRhcmdldF9hZGRyOw0KICAg
IG1zZy50eF9sZW4gPSAxOw0KICAgIG1zZy5yeF9sZW4gPSA3Ow0KICAgIG1zZy5kYXRhWzBdID0g
UE1CVVNfSUNfREVWSUNFX0lEOw0KICAgIGlmIChpMmNfbWFzdGVyX3JlYWQoJm1zZywgcmV0cnkp
KSB7DQogICAgICAgIHByaW50ZigiRmFpbGVkIHRvIHJlYWQgVlIgSUNfREVWSUNFX0lEOiByZWdp
c3RlcigweCV4KVxuIiwgUE1CVVNfSUNfREVWSUNFX0lEKTsNCiAgICAgICAgcmV0dXJuOw0KICAg
IH0NCg0KQnkgc2VuZGluZyBhIGJ1ZmZlciB0aGF0IHdhcyB3YXkgbGFyZ2VyIHRoYW4gdGhlIHJ4
IGJ1ZmZlciBvZiA3LCBpdCB3YXMNCmxlYXZpbmcgc3R1ZmYgbHlpbmcgYXJvdW5kIGZvciB0aGUg
bmV4dCBxdWVyeS4NCg0KSeKAmWxsIHRlc3QgaXQgb3V0IGFuZCBzZWUgd2hhdCBoYXBwZW5zIGlm
IEkgZml4IHRoZSBJQ19ERVZJQ0VfSUQgbGVuZ3RoDQp0cmFuc21pdHRlZCBieSB0aGUgSVNMNjky
NTkgdG8gNCwgbWF5YmUgd2UgZG9u4oCZdCBuZWVkIHRoaXMgcGF0Y2guIEJ1dCwNCmF0IHRoZSB2
ZXJ5IGxlYXN0LCBJ4oCZbGwgbWFrZSBzdXJlIHRvIGdhdGUgdGhpcyBvbiB0aGUgcGFnZSB2YWx1
ZSBjaGFuZ2luZywNCm5vdCBqdXN0IGJlaW5nIHNldC4NCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3
LCB0aGlzIHdhcyByZWFsbHkgdXNlZnVsLiBJ4oCZbSBub3QgdmVyeSBmYW1pbGlhcg0Kd2l0aCBw
bWJ1cyBkZXZpY2VzLg0KDQpbMV0gaHR0cHM6Ly9naXRodWIuY29tL2ZhY2Vib29rL09wZW5CSUMv
YmxvYi9jZGE0YzAwYjAzMmIxZDljOWI5NGM0NWZhYTJjMGVjYTQ4ODZhMGEzL21ldGEtZmFjZWJv
b2sveXYzNS1jbC9zcmMvcGxhdGZvcm0vcGxhdF9zZW5zb3JfdGFibGUuYyNMMzMyLUwzNTUNCg0K
PiANCj4gVGl0dXMNCg0K

