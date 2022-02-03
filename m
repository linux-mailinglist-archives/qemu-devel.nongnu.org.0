Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7EA4A9020
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 22:43:24 +0100 (CET)
Received: from localhost ([::1]:33342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFjsx-0007Yg-LE
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 16:43:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1nFjIW-0006nW-EC; Thu, 03 Feb 2022 16:05:45 -0500
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:51289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1nFjI8-0002y0-Rt; Thu, 03 Feb 2022 16:05:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1643922320; x=1644527120;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gcKpnbjEoLeSevR2r6n+Qy2iT1UZh7ZAq3Z8IX0agsM=;
 b=k2WnUWEtmOf2hm2GW0sBMwFx02+iUpEcDT043cLYIBA0X0eUr7AUJ+Xj
 pGhFI8+mzioFDGrPW6QrFZfPqzC3ZkpNrVIMs5cPboyFjNKYzYZ+sy1/T
 izvE5zFExKrYgEB3UXQg3MpK8SzGq2wqpe6f8ouU3s3ju4rtMWCBAnWsi c=;
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 21:05:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=huTGUzzA1CfgFTHF2y1yV0v5eWFaet1S3SOO9qmXxdDZ2XdPhz7we6JtPpeNkoQrn1BUgVADg1wI+iYjeqMfTw5w2HRtAu/JhAd2qZxXOVFKwbAzdjPBaOUeJbZCkf0sUMfCwYWtEk+VuEsHWxKIQJI/MMVhv+JfIbLyvSRbDToguZzRLaJS2ak4z3DOwy4IExLTkVA/H4F/5Dz4Bc9j36Wll0Chw9XkD96G2gxrf86F3OlAWGhwT8xrJgo3u49Nf6aCbQRvBbZg+0l7GzkA6jfXZYwmfMLAXBQ0xttr6TcCKDZ3f2vLfgZW+au28Sys/jkZ9geokFhkYoNll6ApQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gcKpnbjEoLeSevR2r6n+Qy2iT1UZh7ZAq3Z8IX0agsM=;
 b=KRbNd0DLlmgmQvXZEN1St8Qj/3kX0xRRCyNBNYeDiD1kQjDuYl/KI0KjDx2OQVmNSjHXYTZEGOh7Kfo/UzL3v9iVfuELbT3Ul+pYIDOd2FOWdSCPhGMWf8s2EoG+47z8vxhMfIXOwpuW/fkGC0UFaljnQacT/zF5W5Xu326WDpGogYurpR3RO6V4aRwLYzlnvEG/R/Maimy2h7t1ruJPBFXviHrBXGtJoi8ZpyEOHfUul3JPL9LSNltd3y4k5Yd/Oi2V6xDBKODBovcYZWs/mzrow0ERQKoIhaHEX30LtTZ0dLOgvwhFFPY1e9e3LvyyrwgeyHAeX/OSal4qz76GbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by BL0PR02MB5473.namprd02.prod.outlook.com
 (2603:10b6:208:8b::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Thu, 3 Feb
 2022 21:05:12 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::bd2b:92ca:d25e:9d10]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::bd2b:92ca:d25e:9d10%6]) with mapi id 15.20.4951.014; Thu, 3 Feb 2022
 21:05:12 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Subject: RE: [RFC PATCH  0/4] improve coverage of vector backend
Thread-Topic: [RFC PATCH  0/4] improve coverage of vector backend
Thread-Index: AQHYGHGJHyYvQ8C+vki+6vd1G/AKz6yA5OuAgAApILCAAPft0IAAFiAAgAAAdCCAAAmWAIAACUOggAARGICAABG2oA==
Date: Thu, 3 Feb 2022 21:05:12 +0000
Message-ID: <SN4PR0201MB88083BAD6CD177114DFF4615DE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20220202191242.652607-1-alex.bennee@linaro.org>
 <87k0ecvoxu.fsf@linaro.org>
 <SN4PR0201MB8808B91BF0F27E376C1872AEDE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <SN4PR0201MB88089C0A52C660DC7A6D71E6DE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <87pmo3sut4.fsf@linaro.org>
 <SN4PR0201MB8808A6436C987408C04CED6BDE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <87leyrst2m.fsf@linaro.org>
 <SN4PR0201MB8808C67FF92D6656EB9DD5B0DE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <87h79fsor3.fsf@linaro.org>
In-Reply-To: <87h79fsor3.fsf@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1acaf6dd-368b-4bb3-3b5f-08d9e758de46
x-ms-traffictypediagnostic: BL0PR02MB5473:EE_
x-microsoft-antispam-prvs: <BL0PR02MB54735B4C01C371D55300CFB4DE289@BL0PR02MB5473.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o9y99exYwae7nHS5QF9YKimR/hhOXSmpG9U9/Z6UnYSgxT8SIf6xdGvME0dZp/OnZXwnbaZV9a3+6bBOE92arUKtP/7j3E7yREhYB3DZbG5icFxsBt9k6zk2u6Y5RV2fZP/P5zIYjvZZHdKKz8N1rrsFEGVH4mdlP9fZGcprYmHjQu0y1M0a7FYl+iYRGxrvNngdL6yXb0g/0UOfBk4JqiT74v9dFFchfQ3OsGSuwtMh/jq8eeNV4rBRjg1XhCIS6WcsHPgiSjqWhp6475yYm6AW106S7uhYNOxIpHyCe9xBPQNiRw8Q9/w30rteWSZzy0wcqu4006bK+dMyGuDBR1hXWvBS5kXsypskkoGCWGpdgnblm5XFtPuFxpEpFnlyRifRuo6wC4KX+Osgm5HpHO7zywmYySyezzfPdkF8/i3jo0pmmjtrTy3selVISm6FvuWL4awSQRXDji9k4VZw/tLY4PYzPafJb+/Q7LFevV2jhpBsbK60pjbm53ACmSYjJnYeZKpMyl5OgoL9OnIaOQ6UBN+tk04CU5HsumMILG/syNio6o2i44hQVsXtbYiNNjFefkt7bu3pZPf8mf7iv5pt+nMLfN7OMtV8HXwy0Xuxn7SIA4K9nwL3WrDrH2J4fsPB0CLlaCaUYPeYX1ATDcUV+7ZeI47np1Lm7hENZ2tEp6Rn1EijC0/PMvOpcmm0sBs+/TLE/I8uq/rsR32KXrM44nZBRLcXAMyBpSuRElqh++JtF/a/J6zIrYw+JrPX7KzYlcS78dAL3Il5BdmC1VVpzGgtDkohkbxnt2pJevg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(966005)(316002)(5660300002)(76116006)(66946007)(7696005)(8676002)(54906003)(71200400001)(52536014)(6506007)(86362001)(38100700002)(53546011)(66476007)(6916009)(508600001)(66446008)(66556008)(64756008)(7416002)(8936002)(9686003)(4326008)(55016003)(186003)(33656002)(38070700005)(83380400001)(66574015)(26005)(2906002)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bDdzQnlzNlZpY3R1MG5WK2J0bmo1aGs0V2tGU3I4UmMyVnVHSi81YlRySUkw?=
 =?utf-8?B?cUwvN3F2UVFkMWk3RVMyUjNEdnd5VmR4ZFpPNDRPY3krSElsQ3dmS2JFNGRm?=
 =?utf-8?B?N2VuTVRQYkM1Z1J1enBZdDI3NDN5UllWd0Z6NzBqKy9WQmUrbGc0d2hFU1cw?=
 =?utf-8?B?MUIwQ1JQMXdKdkFrQ1ZBZ3JBS29SRmpjbm50SjY0RE9qREpsMXk5RHoyN0ZZ?=
 =?utf-8?B?ZnQrc2tVU1BxbS96SXRGMEdjVE1WK01pM0VOVDBoNVZxa2tZVUdBWDFKT1Jh?=
 =?utf-8?B?S1VidkxRQmo1L2wxQnZWSFN5UG5LdjNPNm4yNGxzQW5VZWNva3ZTVGVHZEJp?=
 =?utf-8?B?QVdjbFVmbTNYdklmVUZKaExDbnBoczFwZ0U0dU8yLzlNdEdoQlU1OGpuN0cw?=
 =?utf-8?B?MUdETmdleGN0dWhEOTluRzMzejhEWTNmVHNiQXVrbDJTQlVIMXZWaGFlRVVY?=
 =?utf-8?B?NkRreHhZMU5zQmN1V2c1NG9DbXU0MlhFRml3QmprSGY5dktFYU50SzdzUE5Z?=
 =?utf-8?B?eS9jeXJmaGoxcGRmbERqeGdNQ0ZHVDhiRlpzUlFoOUIwMnhRUWVROG1RZ1d2?=
 =?utf-8?B?Ry96Z3ZTRnZPbEZ4Y0R3RUM2Qnh2YjRUY1FCSTltbGlKWmVYOVlpVFpzNmoz?=
 =?utf-8?B?VnI1aDZ1WjIzeFk5TFNCSzRBSG00VlVvZUxpcXBrR1NaZXVQRzdrb3VZRStG?=
 =?utf-8?B?TWtXc2VOamJVbTE0K2NUTGJ6V3VSR0F1cEhjeDE3MlZYU2dHV2h0YjNjMlZv?=
 =?utf-8?B?VFNRN3BBbmdPcUEzYXRTT0piZjBWSGgxNEVqL2o2S1ZOK2ZVaDZJWHBTT3pU?=
 =?utf-8?B?YnZveHNlZnNEUTVNN2UzYjVEUk5MSmRZM09sUXovYlcwODRuY2dibzlqZU8r?=
 =?utf-8?B?WXBycEl4WHkwRkNIelJWNWF1dDNBOVMwTFh5ZG9wbjNISUFKalJOcWN0TWlr?=
 =?utf-8?B?TG9BQjIwWkxMRHdtL2lGWDNBRjV0c2lZK1ZqakNaWXYrZ0VQWktyejVOL3BY?=
 =?utf-8?B?YnB1TkJ3SStSK0VzUjBSZXZrRXh3TUtRRzAwVVA4Wm05RWtFNUphanZMTDBw?=
 =?utf-8?B?aHA2WHVwaktuYytpY1ZGN09DNXpRdVFrYnVtQWhjVzBwVHVQYmRXdnoxQ0xk?=
 =?utf-8?B?YThUVFg4c1o0ZFlwVkFNMGpKTG45SmZwOThvb1BqSDlpMW45T0dMTW9rL2V4?=
 =?utf-8?B?VmRFYnhNVTV5Uk93RjkzTHcrbWVqVEMrbDZLUjZ1bmU3WU1iOTdvbE12WEtC?=
 =?utf-8?B?SmtHWHBmdFRwZHd3OFBEU1lFaVlQY0UxQWNTb0dQcmttZmFaTjJ0L0tFV2lP?=
 =?utf-8?B?L3dYZDg3eDNxWVVWUi9YK1FxSjFvRHBTcFBiV0JqbjVwQk95bzJxb3hEYW1E?=
 =?utf-8?B?L3NLa0lUang1UEpjRC8xU2VlWDBtd3JPVCtBdXVSVk9pOWg2MmJuNTBiVDZD?=
 =?utf-8?B?cHFQaXU5NWFpUm9JRDdGamdKYytQWDdJSURNZzV2S0VWRDRPaTkyeWtMbW9X?=
 =?utf-8?B?UW1LTHFaUUx0NytKc2Z1MEtFRXVnQW82S29sQ0RUdmhVb28xMzdEYlJPZkw1?=
 =?utf-8?B?NGs4djFRVmNnSEpYZG9XckxDWko2U0pDVWgrNDNYREhyelVFa25pRG4zTlJP?=
 =?utf-8?B?YzFhS3EvWG51ODM4NWJORlBkYXJNNTJrTUk3TDNqU1p6ZnRBNGpzOWJseFJx?=
 =?utf-8?B?QW8zNGxmc2JkYStyVWhCTUloeEkySUxxYWROalNSeWd3WXU0STJpaXhXQzJk?=
 =?utf-8?B?TzNwTmZ4TkdnWWxUSHR2UVRaSmN5TU45aDBIcnBSaXFFRTdCMVl4N3dQd3VX?=
 =?utf-8?B?SXhqSnZaVWpTYWxodWVZN3pRdkduZHE1WHVKdU5ReGdBbjFRZWpOYXJ1TjMx?=
 =?utf-8?B?Rzd4U1ExVy80b2Q4MUpJUTNVa3dORmFVaG5kNHZwRXlhaDF3a3kzR0lOaVl5?=
 =?utf-8?B?ZkUzWjhIc25IZXhKQ2diZW9jVFJLTVFXK25mTm12QzhxMjh5dGVKS3h3R3JP?=
 =?utf-8?B?dEFVQ1RVQisxT0lWc0FQbkhIbkUyT1Ura0ZSZWZTRGZ1YnVwbXNwZ2ZnMEdK?=
 =?utf-8?B?Sy9aaGVYa083OFRyOVd5Z1NYcFJKVFZsMngyVVcyUERJYWR0Qm0wTDU5UmxK?=
 =?utf-8?B?c2ZUQmN4dXVsTDZKN2tOT05vL0Rqa3JqbDFhREc0ZzVidTVwaTVBKzZTRys0?=
 =?utf-8?Q?VM4/ucSnA7PSjIdCF8f5wYo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1acaf6dd-368b-4bb3-3b5f-08d9e758de46
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2022 21:05:12.0669 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +Ftx7eEDAjvhMUJoGrM1J5Dl0b86j5rnNZuzJUjprejx4qSUfXsQnD/GEiPpT2u/PbfoXs/0WLPhLe6g7rOXRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB5473
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "fam@euphon.net" <fam@euphon.net>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "crosa@redhat.com" <crosa@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "aurelien@aurel32.net" <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleCBCZW5uw6llIDxh
bGV4LmJlbm5lZUBsaW5hcm8ub3JnPg0KPiBTZW50OiBUaHVyc2RheSwgRmVicnVhcnkgMywgMjAy
MiAyOjAwIFBNDQo+IFRvOiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+DQo+
IENjOiByaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnOyBxZW11LWRldmVsQG5vbmdudS5vcmc7
IHFlbXUtDQo+IGFybUBub25nbnUub3JnOyBmYW1AZXVwaG9uLm5ldDsgYmVycmFuZ2VAcmVkaGF0
LmNvbTsNCj4gZjRidWdAYW1zYXQub3JnOyBhdXJlbGllbkBhdXJlbDMyLm5ldDsgcGJvbnppbmlA
cmVkaGF0LmNvbTsNCj4gc3RlZmFuaGFAcmVkaGF0LmNvbTsgY3Jvc2FAcmVkaGF0LmNvbQ0KPiBT
dWJqZWN0OiBSZTogW1JGQyBQQVRDSCAwLzRdIGltcHJvdmUgY292ZXJhZ2Ugb2YgdmVjdG9yIGJh
Y2tlbmQNCj4gDQo+IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4gd3JpdGVz
Og0KPiANCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogQWxleCBC
ZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPg0KPiA+PiBTZW50OiBUaHVyc2RheSwgRmVi
cnVhcnkgMywgMjAyMiAxMjoyNiBQTQ0KPiA+PiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29u
QHF1aWNpbmMuY29tPg0KPiA+PiBDYzogcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZzsgcWVt
dS1kZXZlbEBub25nbnUub3JnOyBxZW11LQ0KPiA+PiBhcm1Abm9uZ251Lm9yZzsgZmFtQGV1cGhv
bi5uZXQ7IGJlcnJhbmdlQHJlZGhhdC5jb207DQo+IGY0YnVnQGFtc2F0Lm9yZzsNCj4gPj4gYXVy
ZWxpZW5AYXVyZWwzMi5uZXQ7IHBib256aW5pQHJlZGhhdC5jb207IHN0ZWZhbmhhQHJlZGhhdC5j
b207DQo+ID4+IGNyb3NhQHJlZGhhdC5jb20NCj4gPj4gU3ViamVjdDogUmU6IFtSRkMgUEFUQ0gg
MC80XSBpbXByb3ZlIGNvdmVyYWdlIG9mIHZlY3RvciBiYWNrZW5kDQo+ID4+DQo+ID4+ID4gQW55
IGNoYW5jZSB0aGUgcHJvYmxlbSBpcyBpbiB0aGUgdGVzdCBpdHNlbGYgKGUuZy4sIHNvbWUgc29y
dCBvZg0KPiA+PiA+IHVuZGVmaW5lZCBiZWhhdmlvciBvciBhIDY0LWJpdCB2cyAzMi1iaXQgZGlm
ZmVyZW5jZSk/DQo+ID4+DQo+ID4+IEl0IGRvZXMgaGF2ZSBhIDY0IGJpdCBieXRlc3dhcCBpbiAt
IGl0J3MgcG9zc2libGUgSSBicm9rZSBpdCBjb3B5aW5nDQo+ID4+IGZyb20gdGhlDQo+ID4+IHVw
c3RyZWFtOg0KPiA+Pg0KPiA+PiAgIGh0dHBzOi8vY2NvZGVhcmNoaXZlLm5ldC9pbmZvL2NyeXB0
by9zaGE1MTIuaHRtbA0KPiA+Pg0KPiA+PiBidXQgaXQgZG9lcyBwYXNzIG9uICphbGwqIHRoZSBv
dGhlciBhcmNoaXRlY3R1cmVzIHdoaWNoIGlzIGEgbWl4IG9mDQo+ID4+IDMyIGFuZCA2NCBiaXQg
Y29kZS4gSSBkaWQgaGF2ZSB0byBoYWNrIHRoZSBlbmRpYW4gZGV0ZWN0aW9uIGNvZGUgdGhvdWdo
Lg0KPiA+PiBEb2VzOg0KPiA+Pg0KPiA+PiAgICNpZiBCWVRFX09SREVSID09IEJJR19FTkRJQU4N
Cj4gPj4NCj4gPj4gd29yayBmb3IgeW91ciBjb21waWxlcj8NCj4gPg0KPiA+IE5vLCBidXQgdGhp
cyBkb2VzDQo+ID4gI2lmIF9fQllURV9PUkRFUl9fID09IF9fT1JERVJfQklHX0VORElBTl9fDQo+
ID4NCj4gPiBXaXRoIHRoYXQgY2hhbmdlIGluIHRoZSBzb3VyY2UsIHRoZSB0ZXN0cyBwYXNzZXMu
ICBXaWxsIHRoYXQgd29yayBmb3INCj4gPiBvdGhlciB0YXJnZXRzPw0KPiANCj4gQXQgbGVhc3Qg
bm90IGhwcGEtbGludXgtdXNlci4gVGhlIGpveSBvZiBoYXZpbmcgbm8gc3RhbmRhcmQgY29tcGls
ZSB0aW1lIHdheQ0KPiB0byByZXBvcnQgYnl0ZSBvcmRlciBpbiB0aGUgQyBzdGFuZGFyZCBkZXNw
aXRlIG1vc3QgdGhpbmdzIG5lZWRpbmcgdG8ga25vdw0KPiBvbmUgd2F5IG9yIGFub3RoZXIuDQoN
CkhvdyBhYm91dCB0aGlzPw0KI2lmIChkZWZpbmVkIChCWVRFX09SREVSKSAmJiBCWVRFX09SREVS
ID09IEJJR19FTkRJQU4pIHx8IChfX0JZVEVfT1JERVJfXyA9PSBfX09SREVSX0JJR19FTkRJQU5f
XykNCg0KDQo=

