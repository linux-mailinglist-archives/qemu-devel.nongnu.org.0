Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE894F6DB4
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 00:08:45 +0200 (CEST)
Received: from localhost ([::1]:36776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncDpU-00059V-2L
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 18:08:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=509556357b=pdel@fb.com>)
 id 1ncDnu-0004GL-Lp; Wed, 06 Apr 2022 18:07:06 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:10182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=509556357b=pdel@fb.com>)
 id 1ncDns-0006AX-5x; Wed, 06 Apr 2022 18:07:06 -0400
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 236LIsM0001025;
 Wed, 6 Apr 2022 15:06:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=Lo7u2ftf+BgQBLTu3lYMaT0UwbWFeY9A1fx9oyS01Lc=;
 b=JGH6jH3ETzQPd1s4gcVkoFG3IzNnBoZfXo+CrPg0gNMF7zd3fvpuXujWU7oVrDQkn32U
 tuTObX51sHRTPEe0YPBlJwxW8IkZ2X8ZtWu0CI+z5sunEOnEtaPWpXx8npR9Y8VHRLPO
 kuuotscVwhJiWVvlwLkMZimzBR9e/bPMMI8= 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2043.outbound.protection.outlook.com [104.47.57.43])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3f91yk725t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Apr 2022 15:06:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nD5PrTjDW2qYRI3r4zmUyMEWnoX3zTnHiSxS4WrKjwYuivoySvAgj9wR21vMgkfnPU5k0JGZo9lZzTpqzK0WDvuZjyx/wQYd82KiVY1cRxzprZr8ZVpDhReCLrR4t3m2h+vzMrEY9kThyjkX/MR33DgalToGvSY9YvjrQlZi4w/LdyQOVJhwiK84YRI6lNazeS9fMHwk3ec0kKPm0qZeaaq3nW0vXvEPNZXVd99/MjhiDV8L9f5PMc/WJ3N8T+Iq4Y6VKfyMKX4oPdys+DEYNVJy8vQKzikJ1QeNLGIQquAgvQUYrpbyO+K07AyVkjaSSvgdPvcWAv0qxY5wlh9z5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lo7u2ftf+BgQBLTu3lYMaT0UwbWFeY9A1fx9oyS01Lc=;
 b=G3n8+nf8+D3tc5iI5FwqRA91C0kUF4kL4fHdDDRVnWJFY6t+xvedldDMCArWJYBNUohyi2UICcFcCAOlxcJYI+1ljCsHA8S9dbPzW7fkYOkAQbRJn49cXGGfaUQDIX4qhbUCpHef8htU+smHb8OZ6ToPSHUhTxp5nqEQIqTIZ5BldYlGAQsG2fL3kLnX8eDRwnW/24WDXt1wI84cNW10r74wV2La+EuQ1Bt8PuhadopO1LTMKmz6q3Yx6i6xKZ93UYd7Ci1vvOINIlZNPp4F/g3Gi0TofkUCd/oO/9m3lXS8CFphAf5XqjYF7in51XllI0M0D3Ne++1hvC2VKCWq6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by BL0PR1501MB2099.namprd15.prod.outlook.com (2603:10b6:207:1d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21; Wed, 6 Apr
 2022 22:06:43 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::e145:753f:1240:6fc1]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::e145:753f:1240:6fc1%4]) with mapi id 15.20.5144.021; Wed, 6 Apr 2022
 22:06:43 +0000
From: Peter Delevoryas <pdel@fb.com>
To: Klaus Jensen <its@irrelevant.dk>
CC: Cameron Esfahani via <qemu-devel@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, Arun Kumar Kashinath Agasar
 <arun.kka@samsung.com>, Corey Minyard <cminyard@mvista.com>, Andrew Jeffery
 <andrew@aj.id.au>, Klaus Jensen <k.jensen@samsung.com>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>, Padmakar Kalghatgi
 <p.kalghatgi@samsung.com>, Matt Johnston <matt@codeconstruct.com.au>,
 Jeremy Kerr <jk@ozlabs.org>
Subject: Re: [RFC PATCH 0/4] hw/i2c: i2c slave mode support
Thread-Topic: [RFC PATCH 0/4] hw/i2c: i2c slave mode support
Thread-Index: AQHYRSerTNcPCkQLM0iu4AURTxPSuqzh09OAgACbMoCAALcYAIAAG3+AgAA5RIA=
Date: Wed, 6 Apr 2022 22:06:43 +0000
Message-ID: <5CD58511-DAD3-4E75-8849-53A6225D15F6@fb.com>
References: <20220331165737.1073520-1-its@irrelevant.dk>
 <CA9A7D12-EA42-450B-B378-92D53D3D22EF@fb.com> <Yk0uP2BHaOTBQDf2@apples>
 <3BBAF589-4650-4F12-8343-828210B78FB4@fb.com> <Yk3e50/gr+7RwNuY@apples>
In-Reply-To: <Yk3e50/gr+7RwNuY@apples>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 750b0ce2-52a5-4945-82bc-08da1819bbd5
x-ms-traffictypediagnostic: BL0PR1501MB2099:EE_
x-microsoft-antispam-prvs: <BL0PR1501MB2099FFC3A1E0D200B8E5B1A7ACE79@BL0PR1501MB2099.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 93YaydzACL8mcrNPsMHLTj1E0PHXrm1c0HH1kU8k06EOpgAlKCpGUQi3wteWxpW+PArZ1V9njEWIPZ4N8nikfcaMzXwgrT8yY2lSmgenL/B/kR58B7xhrtRqBGDP9LTQ1vv19kkpIQUVValYfgxhj5PIBIxjS4hSAZ/uXFP+bLqiFevFZo+5V3JyiOOOBVUI/xlw+19GWJgD28oIV2CZ7n4pCCJOAsuk07Z5JbRTJASttCfXQ1WJu+73B9xNqgnQLgqcv+RZP7H/jMBFBUfZny/UHbMYC8K0c/A0dNw6QZ4SwFWFNU4prwEGp8K8McT6fgetrmO3arAG9paroyPzLUKZ81Lm4nmqyV+dqofzjqbOYgT6n96P/h2W78JymrpVV0mRi/LJWedwe0MCxH8SFV1nC9E+yEJnPJUsKjkPhFyZwQZZh4vjOZJLKsHwh4iNp+KFXu6ZvlHJR64bfg56gQBQi5HMRc40AS57wA1rClssDHj/bxc908Kr9QHlYOJ2lOAO3pmEwUg8rkXQTLS3QPXM/8g/AWJxz0DzaWTiOMa+RqellyZd/deuh3kqwO0BUB2BBM8riz1Z8vXs+c3ayw+2uUXe+bx2jWqvJ5GicVifX+pSihQx7fZeQSwFNhgjxBzjGNBi+Z/IAiKlk8F0NU0c8+/GJQwNYJ3ETU1IVaQb7LlJBQ6bC+cqShDsuwbXXrJkUqPFfcbkgyKfQC8Ikz8sPKcEOEyTdoxyn2gPUUm+XpaHqw6igycVWe+Qub2fA7GYRLRa5dG9X0/e+vdUOw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(8676002)(186003)(8936002)(83380400001)(38070700005)(5660300002)(508600001)(71200400001)(6506007)(38100700002)(6486002)(86362001)(2616005)(53546011)(122000001)(54906003)(6916009)(316002)(6512007)(33656002)(2906002)(36756003)(7416002)(45980500001)(505234007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFU2VzI5QTFPUStWZit2UTIva3NuWkcyUFB3NFBFandKaERDUStJQlFrVEhr?=
 =?utf-8?B?bjdLS0sxT2dmWHdqaTQ4Ly9iUS9KNHdJUFVjTjBWZC85MXViSWxrNFVWVGFN?=
 =?utf-8?B?MUVBQU1lalk0MDdKN09QY2ZCcmx6azRBakpmdDVXMXdqZnBrRXRqNVZBTHFC?=
 =?utf-8?B?TmZkUnNyMS9BNWJsb2oyK2lPVm4xaWlBR21PbXBZWjYwbVByMm52M0psYjN4?=
 =?utf-8?B?Ti9SeUtIcWxtQjRQTEVpMXQ1ZUJqbnpxNWtObE9Nbk5MVDMxS0hhTk1PaTUw?=
 =?utf-8?B?YWN0a2k2OXhNQVVZMGRuenRNRG9Fa09ZUUJWQmJnMjVMWmRJME5lcUx1YlFH?=
 =?utf-8?B?NVpZcDA1OWV0OExjSDk3ZklPbWxDZ2lXOSt6Z3ZaS0gvQWRCZUxoWGJOcTl0?=
 =?utf-8?B?YmEwV2lZYjJFMFgxSElaR0JMZlI2eVpXcjNtTDdNalNoekRQMUZ6SEVkd3ZW?=
 =?utf-8?B?eVBsdERBRmlZazZVa0pGcjNIYW5ubmxBVWh1S2pGRHFzU3gyNEpzczBjWW4w?=
 =?utf-8?B?MGNVZXNoN3VKUk5rem0xekhIcXV5eE9rVmd5MTFLRWMvVnZGVkdxY0E2Qk5x?=
 =?utf-8?B?NTk4QUJxem9UNHJ2NTdGWVJtbXNiaDBIR1N5QWFDcGowZ2lORm1jWnNTM2hK?=
 =?utf-8?B?RnJBQTY2Z3lzSjBKd1lkWFp4dFpxRlE1ZnRiV0x4eWZrMEdla0l0Z3l3K2p2?=
 =?utf-8?B?QXJqWTMwZWk3bHhlMUV5RVY3a2hmNDFKa213clpuNlBlT2dXTzdENU1HcGl5?=
 =?utf-8?B?RzhyVGxpZ3NreVJnVnV3QVY0dmY3MVZsd2pSYUIvRmRSSE5Qak40M3FsUHJO?=
 =?utf-8?B?SHhaamRmclFQSVhKZDdFdDhtY29mSEV1S1hMbkUvMVI4b1JkQi9xb0F0d3Yz?=
 =?utf-8?B?OUZDc3FGK0RZQmRyOU1zcGt2aGJoOHdHTS9IRDllR0ZjRW92UHNZcFlWZXgz?=
 =?utf-8?B?RUw0aUNKU0plVThlVVdhWUlUYVYwQkFFeTZEbzlTMkd0WmZwZGhKK2hmMFN4?=
 =?utf-8?B?NzVYSkdoOFRVbWROR2xQYkZKL2tWSmk4Rk52K2VyMUNGWExTMzhCRVZMM2la?=
 =?utf-8?B?NUZON0JDT2NIVzgrK2dSZEY5WFNHV05yRkRBSVJBNDJ4SHR4ZlFjeitjeDhk?=
 =?utf-8?B?ZmI5MlYrdkpSeUdLcTVMZHhLaERhZ09JTHhkSW5jOVJiKzFVRnJSVmNvaVh0?=
 =?utf-8?B?aEVqaG9WUnVPUVdWVXpBUWNCU2hYZysyQzdJMTJ3Qm5pb3lhd2YwZVgxTEZz?=
 =?utf-8?B?R1BmOHFjUWJRYXkyNjVRWkdoZzRQUXRrYWhSZm9ZSHQyQXNBMVpMdzV1ZWRM?=
 =?utf-8?B?VE9pc2o1cUQrVFllYmdaYWEyYlpjakpnNHAyZTluQ2lQOXk4bHM3dEVQVlRL?=
 =?utf-8?B?TEFXM0ZRSUZPWjRIU0k2akNSamRjOVhyRkdRZ01WbW5OUnRxdHI3VlFGV3Z6?=
 =?utf-8?B?NG1qZTN4NWkwVUt4YWZQM0l2Y2E5VHFLS0lvL0FvRE1wTFY1c3NhNHMrQzc4?=
 =?utf-8?B?K0I0dlE4Uk9lbjB5Qkw1SUZmYXVtY3RsaUdZM01sM0NMSURZOThMSk1ob3N5?=
 =?utf-8?B?MGFXSDBTVG9uWjRldm1nVGhQVFU0SU9UaWtnVU40MWNMdkZNTHU5SlNJdlVY?=
 =?utf-8?B?M1VzRURJb0RXblAzc3VMQzQwZ2ZBc1QrS1FrUXRZRFFuRFZPaC9BaW5rSE5Q?=
 =?utf-8?B?ajMvNWlOZlpIVklIejV3SlJtMVVLY1RTUytpdWVQeHU5UENZNkVhUVNPS0ZJ?=
 =?utf-8?B?cHpQM2oyd2VZZnRkWmJYSmlPZGYwRzNSY3BFckF3aGo5TlNQU0ZCU1YrZWM2?=
 =?utf-8?B?Q0xweVFFaDFPdTVObktRZGxybXFkTG1oYXVpMWF0TkhDMkt5dWJobjFjTjF6?=
 =?utf-8?B?ZnRqNVptK1Buendtem9Eb1ZsSGN3SDJ2OFk1dVp3N0JlVzdtWndYeVQzZUxO?=
 =?utf-8?B?TmZoSXZCQ04xYUVhMDlkL3RwU2JiOEgyR2I5ZE41YXdvTVAvYktjK3RDbE85?=
 =?utf-8?B?Q0VVZFVQWTZZOWY3aXRqV2dCWWR4ejMyRUtOVWhNT2g5TFUzYktWbHR2a0tj?=
 =?utf-8?B?NkZxSm5iQVltcU8weEZHRmhocStsUDV1RVJ5cVlGT2ZTQWZOaFZkYnAxUlhN?=
 =?utf-8?B?T0dUZUR2ek4wNUwxOWNhNUViZHFhRCthbktqZ05rcmM0cERzY2dtSTFvZlBD?=
 =?utf-8?B?dE1xS2M1elNPR25mNGk5Mnh4cld1YUdKRE5Oc2ppb0N0UzBnM1lXWEo3Y1Rm?=
 =?utf-8?B?TmNBZ1V1c0VNNkd5LzhyUUFjM00wQmF4dnZ2RS9uZ3RDOERuOFVLWE5pYi9i?=
 =?utf-8?B?eXEvMzVYRWhoY3RrcEJnR1FZZXlGaVBNQTFkdzBnUHZ5cG01RzhXVDNRVmRR?=
 =?utf-8?Q?lS++coqico3Fnfhw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3A39EFDC3F38D54D9E0052F3576B10CE@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 750b0ce2-52a5-4945-82bc-08da1819bbd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2022 22:06:43.0146 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gHXnUdvZeciVJSj6CsU5kyPqkaePTqqonrOteT8K+3PWhqRsOmMENx6kYnDukmV6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR1501MB2099
X-Proofpoint-ORIG-GUID: fbmDuU-WpXF46oCFDWzIcZpuE4s-c55a
X-Proofpoint-GUID: fbmDuU-WpXF46oCFDWzIcZpuE4s-c55a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-06_13,2022-04-06_01,2022-02-23_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=509556357b=pdel@fb.com; helo=mx0b-00082601.pphosted.com
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

DQoNCj4gT24gQXByIDYsIDIwMjIsIGF0IDExOjQxIEFNLCBLbGF1cyBKZW5zZW4gPGl0c0BpcnJl
bGV2YW50LmRrPiB3cm90ZToNCj4gDQo+IE9uIEFwciAgNiAxNzowMywgUGV0ZXIgRGVsZXZvcnlh
cyB3cm90ZToNCj4+IA0KPj4gDQo+Pj4gT24gQXByIDUsIDIwMjIsIGF0IDExOjA3IFBNLCBLbGF1
cyBKZW5zZW4gPGl0c0BpcnJlbGV2YW50LmRrPiB3cm90ZToNCj4+PiANCj4+PiBPbiBBcHIgNSAy
MDo1MiwgUGV0ZXIgRGVsZXZvcnlhcyB3cm90ZToNCj4+Pj4gDQo+Pj4+IA0KPj4+Pj4gT24gTWFy
IDMxLCAyMDIyLCBhdCA5OjU3IEFNLCBLbGF1cyBKZW5zZW4gPGl0c0BpcnJlbGV2YW50LmRrPiB3
cm90ZToNCj4+Pj4+IA0KPj4+Pj4gRnJvbTogS2xhdXMgSmVuc2VuIDxrLmplbnNlbkBzYW1zdW5n
LmNvbT4NCj4+Pj4+IA0KPj4+Pj4gSGkgYWxsLA0KPj4+Pj4gDQo+Pj4+PiBUaGlzIFJGQyBzZXJp
ZXMgYWRkcyBJMkMgInNsYXZlIG1vZGUiIHN1cHBvcnQgZm9yIHRoZSBBc3BlZWQgSTJDDQo+Pj4+
PiBjb250cm9sbGVyIGFzIHdlbGwgYXMgdGhlIG5lY2Vzc2FyeSBpbmZyYXN0cnVjdHVyZSBpbiB0
aGUgaTJjIGNvcmUgdG8NCj4+Pj4+IHN1cHBvcnQgdGhpcy4NCj4+Pj4+IA0KPj4+Pj4gQmFja2dy
b3VuZA0KPj4+Pj4gfn5+fn5+fn5+fg0KPj4+Pj4gV2UgYXJlIHdvcmtpbmcgb24gYW4gZW11bGF0
ZWQgTlZNIEV4cHJlc3MgTWFuYWdlbWVudCBJbnRlcmZhY2VbMV0gZm9yDQo+Pj4+PiB0ZXN0aW5n
IGFuZCB2YWxpZGF0aW9uIHB1cnBvc2VzLiBOVk1lLU1JIGlzIGJhc2VkIG9uIHRoZSBNQ1RQDQo+
Pj4+PiBwcm90b2NvbFsyXSB3aGljaCBtYXkgdXNlIGEgdmFyaWV0eSBvZiB1bmRlcmx5aW5nIHRy
YW5zcG9ydHMuIFRoZSBvbmUgd2UNCj4+Pj4+IGFyZSBpbnRlcmVzdGVkIGluIGlzIEkyQ1szXS4N
Cj4+Pj4+IA0KPj4+Pj4gVGhlIGZpcnN0IGdlbmVyYWwgdHJpY2tlcnkgaGVyZSBpcyB0aGF0IGFs
bCBNQ1RQIHRyYW5zYWN0aW9ucyBhcmUgYmFzZWQNCj4+Pj4+IG9uIHRoZSBTTUJ1cyBCbG9jayBX
cml0ZSBidXMgcHJvdG9jb2xbNF0uIFRoaXMgbWVhbnMgdGhhdCB0aGUgc2xhdmUgbXVzdA0KPj4+
Pj4gYmUgYWJsZSB0byBtYXN0ZXIgdGhlIGJ1cyB0byBjb21tdW5pY2F0ZS4gQXMgeW91IGtub3cs
IGh3L2kyYy9jb3JlLmMNCj4+Pj4+IGN1cnJlbnRseSBkb2VzIG5vdCBzdXBwb3J0IHRoaXMgdXNl
IGNhc2UuDQo+Pj4+IA0KPj4+PiBUaGlzIGlzIGdyZWF0LCBJ4oCZbSBhdHRlbXB0aW5nIHRvIHVz
ZSB5b3VyIGNoYW5nZXMgcmlnaHQgbm93IGZvciB0aGUgc2FtZSB0aGluZyAoTUNUUCkuDQo+Pj4+
IA0KPj4+IA0KPj4+IEF3ZXNvbWUhDQo+Pj4gDQo+Pj4+PiANCj4+Pj4+IFRoZSBzZWNvbmQgaXNz
dWUgaXMgaG93IHRvIGludGVyYWN0IHdpdGggdGhlc2UgbWFzdGVyaW5nIGRldmljZXMuIEplcmVt
eQ0KPj4+Pj4gYW5kIE1hdHQgKENDJ2VkKSBoYXZlIGJlZW4gd29ya2luZyBvbiBhbiBNQ1RQIHN0
YWNrIGZvciB0aGUgTGludXggS2VybmVsDQo+Pj4+PiAoYWxyZWFkeSB1cHN0cmVhbSkgYW5kIGFu
IEkyQyBiaW5kaW5nIGRyaXZlcls1XSBpcyBjdXJyZW50bHkgdW5kZXINCj4+Pj4+IHJldmlldy4g
VGhpcyBiaW5kaW5nIGRyaXZlciByZWxpZXMgb24gSTJDIHNsYXZlIG1vZGUgc3VwcG9ydCBpbiB0
aGUgSTJDDQo+Pj4+PiBjb250cm9sbGVyLg0KPj4+Pj4gDQo+Pj4+PiBUaGlzIHNlcmllcw0KPj4+
Pj4gfn5+fn5+fn5+fn4NCj4+Pj4+IFBhdGNoIDEgYWRkcyBzdXBwb3J0IGZvciBtdWx0aXBsZSBt
YXN0ZXJzIGluIHRoZSBpMmMgY29yZSwgYWxsb3dpbmcNCj4+Pj4+IHNsYXZlcyB0byBtYXN0ZXIg
dGhlIGJ1cyBhbmQgc2FmZWx5IGlzc3VlIGkyY19zZW5kL3JlY3YoKS4gUGF0Y2ggMiBhZGRzDQo+
Pj4+PiBhbiBhc3luY2hyb25vdXMgc2VuZCBpMmNfc2VuZF9hc3luYyhJMkNCdXMgKiwgdWludDgp
IG9uIHRoZSBidXMgdGhhdA0KPj4+Pj4gbXVzdCBiZSBwYWlyZWQgd2l0aCBhbiBleHBsaWNpdCBh
Y2sgdXNpbmcgaTJjX2FjayhJMkNCdXMgKikuDQo+Pj4+PiANCj4+Pj4+IFBhdGNoIDMgYWRkcyB0
aGUgc2xhdmUgbW9kZSBmdW5jdGlvbmFsaXR5IHRvIHRoZSBlbXVsYXRlZCBBc3BlZWQgSTJDDQo+
Pj4+PiBjb250cm9sbGVyLiBUaGUgaW1wbGVtZW50YXRpb24gaXMgcHJvYmFibHkgYnVnZ3kgc2lu
Y2UgSSBoYWQgdG8gcmVseSBvbg0KPj4+Pj4gdGhlIGltcGxlbWVudGF0aW9uIG9mIHRoZSBrZXJu
ZWwgZHJpdmVyIHRvIHJldmVyc2UgZW5naW5lZXIgdGhlIGJlaGF2aW9yDQo+Pj4+PiBvZiB0aGUg
Y29udHJvbGxlciBzbGF2ZSBtb2RlIChJIGRvIG5vdCBoYXZlIGFjY2VzcyB0byBhIHNwZWMgc2hl
ZXQgZm9yDQo+Pj4+PiB0aGUgQXNwZWVkLCBidXQgbWF5YmUgc29tZW9uZSBjYW4gaGVscCBtZSBv
dXQgd2l0aCB0aGF0PykuDQo+Pj4+PiANCj4+Pj4+IEZpbmFsbHksIHBhdGNoIDQgYWRkcyBhbiBl
eGFtcGxlIGRldmljZSB1c2luZyB0aGlzIG5ldyBBUEkuIFRoZSBkZXZpY2UNCj4+Pj4+IGlzIGEg
c2ltcGxlICJlY2hvIiBkZXZpY2UgdGhhdCB1cG9uIGJlaW5nIHNlbnQgYSBzZXQgb2YgYnl0ZXMg
dXNlcyB0aGUNCj4+Pj4+IGZpcnN0IGJ5dGUgYXMgdGhlIGFkZHJlc3Mgb2YgdGhlIHNsYXZlIHRv
IGVjaG8gdG8uDQo+Pj4+PiANCj4+Pj4+IFdpdGggdGhpcyBjb21iaW5lZCBJIGFtIGFibGUgdG8g
Ym9vdCB1cCBMaW51eCBvbiBhbiBlbXVsYXRlZCBBc3BlZWQgMjYwMA0KPj4+Pj4gZXZhbHVhdGlv
biBib2FyZCBhbmQgaGF2ZSB0aGUgaTJjIGVjaG8gZGV2aWNlIHdyaXRlIGludG8gYSBMaW51eCBz
bGF2ZQ0KPj4+Pj4gRUVQUk9NLiBBc3N1bWluZyB0aGUgZWNobyBkZXZpY2UgaXMgb24gYWRkcmVz
cyAweDQyOg0KPj4+Pj4gDQo+Pj4+PiAjIGVjaG8gc2xhdmUtMjRjMDIgMHgxMDY0ID4gL3N5cy9i
dXMvaTJjL2RldmljZXMvaTJjLTE1L25ld19kZXZpY2UNCj4+Pj4+IGkyYyBpMmMtMTU6IG5ld19k
ZXZpY2U6IEluc3RhbnRpYXRlZCBkZXZpY2Ugc2xhdmUtMjRjMDIgYXQgMHg2NA0KPj4+Pj4gIyBp
MmNzZXQgLXkgMTUgMHg0MiAweDY0IDB4MDAgMHhhYSBpDQo+Pj4+PiAjIGhleGR1bXAgL3N5cy9i
dXMvaTJjL2RldmljZXMvMTUtMTA2NC9zbGF2ZS1lZXByb20NCj4+Pj4+IDAwMDAwMDAgZmZhYSBm
ZmZmIGZmZmYgZmZmZiBmZmZmIGZmZmYgZmZmZiBmZmZmDQo+Pj4+PiAwMDAwMDEwIGZmZmYgZmZm
ZiBmZmZmIGZmZmYgZmZmZiBmZmZmIGZmZmYgZmZmZg0KPj4+Pj4gKg0KPj4+Pj4gMDAwMDEwMA0K
Pj4+PiANCj4+Pj4gV2hlbiBJIHRyeSB0aGlzIHdpdGggbXkgc3lzdGVtLCBpdCBzZWVtcyBsaWtl
IHRoZSBpMmMtZWNobyBkZXZpY2UgdGFrZXMgb3Zlcg0KPj4+PiB0aGUgYnVzIGJ1dCBuZXZlciBl
Y2hvZXMgdGhlIGRhdGEgdG8gdGhlIEVFUFJPTS4gQW0gSSBtaXNzaW5nIHNvbWV0aGluZyB0bw0K
Pj4+PiBtYWtlIHRoaXMgd29yaz8gSXQgc2VlbXMgbGlrZSB0aGUg4oCcaTJjX3NlbmRfYXN5bmPi
gJ0gY2FsbHMgYXJlbuKAmXQgaGFwcGVuaW5nLA0KPj4+PiB3aGljaCBtdXN0IGJlIGJlY2F1c2Ug
dGhlIGJvdHRvbSBoYWxmIGlzbuKAmXQgYmVpbmcgc2NoZWR1bGVkLCByaWdodD8gQWZ0ZXINCj4+
Pj4gdGhlIGkyY19kb19zdGFydF90cmFuc2ZlciwgaG93IGlzIHRoZSBib3R0b20gaGFsZiBzdXBw
b3NlZCB0byBiZSBzY2hlZHVsZWQNCj4+Pj4gYWdhaW4/IElzIHRoZSBzbGF2ZSByZWNlaXZpbmcg
KHRoZSBFRVBST00pIHN1cHBvc2VkIHRvIGNhbGwgaTJjX2FjayBvciBzb21ldGhpbmc/DQo+Pj4+
IA0KPj4+PiByb290QGJtYy1vb2I6fiMgZWNobyAyNGMwMiAweDEwNjQgPiAvc3lzL2J1cy9pMmMv
ZGV2aWNlcy9pMmMtOC9uZXdfZGV2aWNlDQo+Pj4+IFsgMTM1LjU1OTcxOV0gYXQyNCA4LTEwNjQ6
IDI1NiBieXRlIDI0YzAyIEVFUFJPTSwgd3JpdGFibGUsIDEgYnl0ZXMvd3JpdGUNCj4+Pj4gWyAx
MzUuNTYyNjYxXSBpMmMgaTJjLTg6IG5ld19kZXZpY2U6IEluc3RhbnRpYXRlZCBkZXZpY2UgMjRj
MDIgYXQgMHg2NA0KPj4+PiByb290QGJtYy1vb2I6fiMgaTJjc2V0IC15IDggMHg0MiAweDY0IDB4
MDAgMHhhYSBpDQo+Pj4+IGkyY19lY2hvX2V2ZW50OiBzdGFydCBzZW5kDQo+Pj4+IGkyY19lY2hv
X3NlbmQ6IGRhdGFbMF0gPSAweDY0DQo+Pj4+IGkyY19lY2hvX3NlbmQ6IGRhdGFbMV0gPSAweDAw
DQo+Pj4+IGkyY19lY2hvX3NlbmQ6IGRhdGFbMl0gPSAweGFhDQo+Pj4+IGkyY19lY2hvX2V2ZW50
OiBzY2hlZHVsaW5nIGJvdHRvbS1oYWxmDQo+Pj4+IGkyY19lY2hvX2JoOiBhdHRlbXB0aW5nIHRv
IGdhaW4gbWFzdGVyeSBvZiBidXMNCj4+Pj4gaTJjX2VjaG9fYmg6IHN0YXJ0aW5nIGEgc2VuZCB0
byBhZGRyZXNzIDB4NjQNCj4+Pj4gcm9vdEBibWMtb29iOn4jIGhleGR1bXAgLUMgL3N5cy9idXMv
aTJjL2RldmljZXMvOC0xMDY0L2VlcHJvbQ0KPj4+PiAwMDAwMDAwMCAwMCAwMCAwMCAwMCAwMCAw
MCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCB8Li4uLi4uLi4uLi4uLi4uLnwNCj4+Pj4g
Kg0KPj4+PiAwMDAwMDEwMA0KPj4+PiANCj4+Pj4gVGhhbmtzIGFnYWluIGZvciB0aGlzLCBpdOKA
mXMgZXhhY3RseSB3aGF0IEkgbmVlZGVkLg0KPj4+PiANCj4+PiANCj4+PiBIbW1tLiBUaGUgb25s
eSBvYnZpb3VzIGRpZmZlcmVuY2UgSSBzZWUgaGVyZSBpcyB0aGF0IEkgd3JpdGUNCj4+PiAic2xh
dmUtMjRjMDIiIGFuZCBub3QganVzdCAiMjRjMDIiIHRvIG5ld19kZXZpY2UuIE5vdCBzdXJlIGlm
IHRoYXQgaGFzDQo+Pj4gYW55IGltcGxpY2F0aW9ucz8gQWxzbywgbG9va3MgbGlrZSB5b3VyIEVF
UFJPTSBpcyBpbml0aWFsaXplZCB3aXRoDQo+Pj4gemVyb2VzLCBtaW5lIGlzIGFsbCBvbmVzLiBU
aGlzIGhpbnRzIGF0IHRoZSBkZXZpY2UgYmVpbmcgaW5zdGFudGlhdGVkIGlzDQo+Pj4gZGlmZmVy
ZW50LiBJJ20gYWxzbyBub3Qgc2VlaW5nIHRoZSAnYXQyNCcsIHdoaWNoIHVwb24gbG9va2luZyBp
biB0aGUNCj4+PiBrZXJuZWwgY29kZSBpcyBhIGRpZmZlcmVudCBkZXZpY2U/DQo+PiANCj4+IEFy
ZSB5b3UgbGV0dGluZyB0aGUga2VybmVsIGNvbnRyb2wgdGhlIEVFUFJPTT8NCj4+IA0KPj4gSWYg
SSBhY3R1YWxseSBsZXQgdGhlIGtlcm5lbCBjb250cm9sIGl0LCB0aGVuIEkgY2Fu4oCZdCB1c2Ug
aTJjc2V0LCBiZWNhdXNlDQo+PiB0aGUga2VybmVsIHNlZW1zIHRvIGJlIGtlZXBpbmcgdGhlIGJ1
cyBidXN5L2V0Yy4gSSB0cmllZCBpMmMgYnVzIDkgdGhpcyB0aW1lLg0KPj4gDQo+PiByb290QGJt
Yy1vb2I6fiMgaTJjc2V0IC15IDkgMHg2NCAweDAwIDB4YWEgaQ0KPj4gRXJyb3I6IENvdWxkIG5v
dCBzZXQgYWRkcmVzcyB0byAweDY0OiBEZXZpY2Ugb3IgcmVzb3VyY2UgYnVzeQ0KPj4gDQo+PiBI
b3dldmVyLCBpZiBJIGRvbuKAmXQgaW5zdGFudGlhdGUgYSBrZXJuZWwgZGV2aWNlLCBhbmQgSSBq
dXN0IHVzZSBpMmNzZXQvaTJjZ2V0LA0KPj4gSSBjYW4gY29udHJvbCB0aGUgRUVQUk9NOg0KPj4g
DQo+PiByb290QGJtYy1vb2I6fiMgaTJjc2V0IC15IDkgMHg2NCAweDAwIDB4Y2MgaQ0KPj4gcm9v
dEBibWMtb29iOn4jIGkyY2dldCAteSA5IDB4NjQgMHgwMCBpDQo+PiAweGNjIDB4YjkgMHg0ZCAw
eGUxIDB4NDIgMHg1NiAweDAwIDB4MDAgMHhjNSAweDViIDB4MjggMHhlMSAweDQyIDB4NTYgMHgw
MCAweDAwIDB4MDAgMHg2MSAweDEzIDB4ZTIgMHg0MiAweDU2IDB4MDAgMHgwMCAweGI3IDB4NjQg
MHgyOCAweGUxIDB4NDINCj4+IDB4NTYgMHgwMCAweDAwDQo+PiANCj4+IFVuZm9ydHVuYXRlbHks
IGkyYy1lY2hvIHN0aWxsIGRvZXNu4oCZdCBzZWVtIHRvIHNlbmQgaXRzIGRhdGE6DQo+PiANCj4+
IHJvb3RAYm1jLW9vYjp+IyBpMmNzZXQgLXkgOSAweDQyIDB4NjQgMHgwMCAweGFhIGkNCj4+IGky
Y19lY2hvX2V2ZW50OiBzdGFydCBzZW5kDQo+PiBpMmNfZWNob19zZW5kOiBkYXRhWzBdID0gMHg2
NA0KPj4gaTJjX2VjaG9fc2VuZDogZGF0YVsxXSA9IDB4MDANCj4+IGkyY19lY2hvX3NlbmQ6IGRh
dGFbMl0gPSAweGFhDQo+PiBpMmNfZWNob19ldmVudDogc2NoZWR1bGluZyBib3R0b20taGFsZg0K
Pj4gaTJjX2VjaG9fYmg6IGF0dGVtcHRpbmcgdG8gZ2FpbiBtYXN0ZXJ5IG9mIGJ1cw0KPj4gaTJj
X2VjaG9fYmg6IHN0YXJ0aW5nIGEgc2VuZCB0byBhZGRyZXNzIDB4NjQNCj4+IA0KPj4gV2hhdCBp
cyB0aGUgZXhhY3Qgc2VxdWVuY2Ugb2YgZXZlbnRzIG9uY2UgaTJjLWVjaG8NCj4+IHN0YXJ0cyBh
IG5ldyB0cmFuc2Zlcj8gRG9lcyB0aGUgc2xhdmUgZGV2aWNlIEFDSw0KPj4gdGhlIHN0YXJ0LCBv
ciBkb2VzIGl0IGp1c3Qgd2FpdCBmb3IgZGF0YSB0byBiZSBzZW50Pw0KPj4gDQo+PiBBbmQgdGhl
biBpZiBJIHRyeSB0byByZWFkIHRoZSBFRVBST006DQo+PiANCj4+IHJvb3RAYm1jLW9vYjp+IyBp
MmNnZXQgLXkgOSAweDY0IDB4MDAgaQ0KPj4gc21idXM6IGVycm9yOiBVbmV4cGVjdGVkIHNlbmQg
c3RhcnQgY29uZGl0aW9uIGluIHN0YXRlIDENCj4+IHNtYnVzOiBlcnJvcjogVW5leHBlY3RlZCB3
cml0ZSBpbiBzdGF0ZSAtMQ0KPj4gc21idXM6IGVycm9yOiBVbmV4cGVjdGVkIHJlY3Ygc3RhcnQg
Y29uZGl0aW9uIGluIHN0YXRlIC0xDQo+PiBzbWJ1czogZXJyb3I6IFVuZXhwZWN0ZWQgcmVhZCBp
biBzdGF0ZSAtMQ0KPj4gc21idXM6IGVycm9yOiBVbmV4cGVjdGVkIHJlYWQgaW4gc3RhdGUgLTEN
Cj4+IHNtYnVzOiBlcnJvcjogVW5leHBlY3RlZCByZWFkIGluIHN0YXRlIC0xDQo+PiANCj4+IEni
gJlsbCB0cnkgZGVidWdnaW5nL3JlZmFjdG9yaW5nIGZ1cnRoZXIgdG8gc2VlIHdoeSBpdOKAmXMg
bm90IHdvcmtpbmcuDQo+PiANCj4+IEJ5IHRoZSB3YXksIHRoaXMgaXMgbXkgaTJjX2luaXQgY29k
ZSBpbiBRRU1VIHRvIGVuc3VyZQ0KPj4gYSBRRU1VIEVFUFJPTSBtb2RlbCBpcyBwcmVzZW50Og0K
Pj4gDQo+PiBzdGF0aWMgdm9pZCBmYnkzNV9pMmNfaW5pdChBc3BlZWRNYWNoaW5lU3RhdGUgKmJt
YykNCj4+IHsNCj4+ICAgIEkyQ0J1cyAqaTJjWzE2XTsNCj4+IA0KPj4gICAgZm9yIChpbnQgaSA9
IDA7IGkgPCAxNjsgaSsrKSB7DQo+PiAgICAgICAgaTJjW2ldID0gYXNwZWVkX2kyY19nZXRfYnVz
KCZibWMtPnNvYy5pMmMsIGkpOw0KPj4gICAgICAgIGFzc2VydChpMmNbaV0gIT0gTlVMTCk7DQo+
PiAgICB9DQo+PiANCj4+ICAgIGkyY19zbGF2ZV9jcmVhdGVfc2ltcGxlKGkyY1s5XSwgImkyYy1l
Y2hvIiwgMHg0Mik7DQo+PiAgICB1aW50OF90IGJ1ZlsyNTZdID0gezB4ZmZ9Ow0KPj4gICAgc21i
dXNfZWVwcm9tX2luaXRfb25lKGkyY1s5XSwgMHg2NCwgYnVmKTsNCj4+IH0NCj4+IA0KPj4gVGhp
cyBpcyBhbiBBU1QyNjAwLWJhc2VkIGJvYXJkIHRvby4NCj4+IA0KPiANCj4gT2guIFlvdSBhcmUg
dHJ5aW5nIHRvIGVjaG8gdG8gYW4gYWN0dWFsIEVFUFJPTSBkZXZpY2Ugb24gdGhlIGJvYXJkPyBJ
bg0KDQpPaGhoIGVyZyB5ZXMsIEkgd2FzLg0KDQo+IHRoYXQgY2FzZSB5ZXMuIFRoZSBuZXcgYXN5
bmMgQVBJIGN1cnJlbnRseSBvbmx5IHdvcmtzIHdpdGggdGhlIHNsYXZlDQo+IGRldmljZSBvbiB0
aGUgaTJjIGNvbnRyb2xsZXIuIFRoZSBpMmMgZWNobyBkZXZpY2UgY2Fubm90IHRhbGsgdG8gYW55
DQo+IG90aGVyIHNsYXZlIGRldmljZXMgc2luY2UgdGhleSBkbyBub3QgaW1wbGVtZW50IHRoZSBh
c3luY2hyb25vdXMgc2VuZC4NCg0KT2ggdGhhdCBtYWtlcyB0b3RhbCBzZW5zZS4NCg0KSSB3YXMg
bm90IGF3YXJlIG9mIHRoZSB3aG9sZSDigJxzbGF2ZS1lZXByb23igJ0gYmFja2VuZCwgSSB0aG91
Z2h0IHlvdQ0Kd2VyZSBpbnN0YW50aWF0aW5nIGEgcmVndWxhciBlZXByb20uIEFmdGVyIGVuYWJs
aW5nIHRoYXQgZHJpdmVyIGluDQpteSBLY29uZmlnIGFuZCB1c2luZyDigJxzbGF2ZS1lZXByb23i
gJ0sIGl0IGFsbCB3b3JrZWQhIFRoYW5rcywgc29ycnkNCmZvciB0aGUgY29uZnVzaW9uLiBJ4oCZ
bSBleGNpdGVkIHRvIHRlc3QgdGhpcyBvdXQgd2l0aCBzb21lIG1vcmUgdGhpbmdzDQpub3chDQoN
CnJvb3RAYm1jLW9vYjp+IyBoZXhkdW1wIC1DIC9zeXMvYnVzL2kyYy9kZXZpY2VzL2kyYy05Lzkt
MDA2NC9zbGF2ZS1lZXByb20NCjAwMDAwMDAwICBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiAgZmYg
ZmYgZmYgZmYgZmYgZmYgZmYgZmYgIHwuLi4uLi4uLi4uLi4uLi4ufA0KKg0KMDAwMDAxMDANCnJv
b3RAYm1jLW9vYjp+IyBpMmNzZXQgLXkgOSAweDQyIDB4NjQgMHgwMCAweGFhIGkNCmkyY19lY2hv
X2V2ZW50OiBzdGFydCBzZW5kDQppMmNfZWNob19zZW5kOiBkYXRhWzBdID0gMHg2NA0KaTJjX2Vj
aG9fc2VuZDogZGF0YVsxXSA9IDB4MDANCmkyY19lY2hvX3NlbmQ6IGRhdGFbMl0gPSAweGFhDQpp
MmNfZWNob19ldmVudDogc2NoZWR1bGluZyBib3R0b20taGFsZg0KaTJjX2VjaG9fYmg6IGF0dGVt
cHRpbmcgdG8gZ2FpbiBtYXN0ZXJ5IG9mIGJ1cw0KaTJjX2VjaG9fYmg6IHN0YXJ0aW5nIGEgc2Vu
ZCB0byBhZGRyZXNzIDB4NjQNCmkyY19hY2s6IGFjaydkIHNsYXZlIGFzeW5jIHNlbmQNCmkyY19l
Y2hvX2JoOiBhc3luYyBzZW5kaW5nIGRhdGFbMV0gKDB4MDApDQppMmNfc2VuZF9hc3luYzogc2xh
dmUgMHg2NCBkYXRhPTB4MDANCmkyY19hY2s6IGFjaydkIHNsYXZlIGFzeW5jIHNlbmQNCmkyY19l
Y2hvX2JoOiBhc3luYyBzZW5kaW5nIGRhdGFbMl0gKDB4YWEpDQppMmNfc2VuZF9hc3luYzogc2xh
dmUgMHg2NCBkYXRhPTB4YWENCmkyY19hY2s6IGFjaydkIHNsYXZlIGFzeW5jIHNlbmQNCnJvb3RA
Ym1jLW9vYjp+IyBoZXhkdW1wIC1DIC9zeXMvYnVzL2kyYy9kZXZpY2VzL2kyYy05LzktMDA2NC9z
bGF2ZS1lZXByb20NCjAwMDAwMDAwICBhYSBmZiBmZiBmZiBmZiBmZiBmZiBmZiAgZmYgZmYgZmYg
ZmYgZmYgZmYgZmYgZmYgIHwuLi4uLi4uLi4uLi4uLi4ufA0KMDAwMDAwMTAgIGZmIGZmIGZmIGZm
IGZmIGZmIGZmIGZmICBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiAgfC4uLi4uLi4uLi4uLi4uLi58
DQoqDQowMDAwMDEwMA0KDQoNCg0KDQo=

