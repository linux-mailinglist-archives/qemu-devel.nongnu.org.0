Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDB25BB545
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 03:16:57 +0200 (CEST)
Received: from localhost ([::1]:35626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZMRz-0007ah-Uj
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 21:16:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=252df0604=wilfred.mallawa@wdc.com>)
 id 1oZMPp-0006D2-CO
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 21:14:41 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:7255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=252df0604=wilfred.mallawa@wdc.com>)
 id 1oZMPb-0001qO-D3
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 21:14:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1663377266; x=1694913266;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=NXiWfFwXo09tOneB38XwSWgmiwsTNB0aKv0HQysxUrw=;
 b=JBZRLOese03oxbq7DtNjnDSFh5cN9pyYAcg7YzjnEnCTZwjD/z9DxZz3
 oBrlu8EQA8oblU7Y5I9ZMG8xqz76vU/+lflbm3oa7efvQz7hCsTa0CeOq
 1sDLpVOrnMuIyTMHDxHnbA2SnwuEc8Dbdk1JjX1tEU4ffLTHpiuVPu4dE
 WUmIh7K0TNYMPJ/e7p+2KO06IfMtXek0ztQAtGdrgrPCa+XS0cPxnAxI8
 iamWD6DRmrxsJcwS8U0+WYf7bu/HUV447XJXetobSPqZPUwzbyz/BOWj5
 BjuHOV/88jRDM7obZtBk5u39ANda8Kmlr35Sk2NuC+bxgE/OzZ5JslZC3 Q==;
X-IronPort-AV: E=Sophos;i="5.93,321,1654531200"; d="scan'208";a="216744437"
Received: from mail-co1nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.174])
 by ob1.hgst.iphmx.com with ESMTP; 17 Sep 2022 09:14:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TR2TV2UqDfCmUISd3cgrhh4/o2Z5ifyIYZvJVK2HFYW6lCX7eTuJOVpqXhIO0VnqWyilBeSCmpYrwVfPTe0+2gUg0t6PSRpNIue9jLyxZrxMjo6iUuhRIcPcoz8O2/SaN24auDZqHR812n9XRQshpc+C8PAG74CrAmP4RHcGJxSEK5qUhvwrbRRl9llcohQLi0bG4D51haW0jmAD64iKl0hGJY4MbxIBzUzZkoyw31FpOPYYXAfARaH6Z4kMz2aKcO43bBh9IysaeSGBaBc3Ldwdx4OUQL+Iy85BrLGfh0WcgB3obu0MZE8c9Ulnw9N9yl3V+00KtWpDHgWsk29jZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NXiWfFwXo09tOneB38XwSWgmiwsTNB0aKv0HQysxUrw=;
 b=LWBkbAt/Vpe5vQEyUIeUrvS0b1BF9klx2yMs6icdIWCfCrA3Eol2kLICoBbX/UueRuMhewGLjeG5wA0IMRDaA7YgebRw6brpycDwQzbpaDLMqd3QwH5QWlrcbxCN46Fg1zhsY51CwLxcPOvo5hpKhR2SCbTcJbSQU6iq9wq8inpmFpg5b0GmYxDveOGP1kS4wq71sFbMdGkYzfOwuuhy48mZJmZqiQXYPQEwXiA0XncHfT99nV+JARpIcXPMATOTZz+3T+cHuT2ZdCEadmi0eWwQTps1LBuMtlwSKnTPLykAJ0siiXvNW9yeEknl/8s7kZ2mJfXH7zuqrTO/7X7/iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXiWfFwXo09tOneB38XwSWgmiwsTNB0aKv0HQysxUrw=;
 b=f3qjdF4DOjwCURV2vVe/uMLUAu6QQUgATvf9MPqhbbiytLOD5kWcQIsVoaxHl1ksceS5gsICA6rgIFAuNYux2yH4TF+qqndACD8dy39e/m5l2cHjoRCUjFZbzXhWKI8v/2O77Chf7rLF75+nsT/2woMQ3oGLU5ySGbvmf+sONIM=
Received: from BL0PR04MB6546.namprd04.prod.outlook.com (2603:10b6:208:1c2::14)
 by MWHPR04MB0353.namprd04.prod.outlook.com (2603:10b6:300:c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Sat, 17 Sep
 2022 01:14:19 +0000
Received: from BL0PR04MB6546.namprd04.prod.outlook.com
 ([fe80::6ef0:1511:8fe1:d319]) by BL0PR04MB6546.namprd04.prod.outlook.com
 ([fe80::6ef0:1511:8fe1:d319%7]) with mapi id 15.20.5632.017; Sat, 17 Sep 2022
 01:14:19 +0000
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "wilfred.mallawa@opensource.wdc.com" <wilfred.mallawa@opensource.wdc.com>, 
 "f4bug@amsat.org" <f4bug@amsat.org>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>, "alistair@alistair23.me"
 <alistair@alistair23.me>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [RFC] hw/registerfields: add `FIELDx_1CLEAR()` macro
Thread-Topic: [RFC] hw/registerfields: add `FIELDx_1CLEAR()` macro
Thread-Index: AQHYvZ6egGWX6RYIG0qchmFPF2V4uK3KDR0AgAEp74CAF7NVAA==
Date: Sat, 17 Sep 2022 01:14:19 +0000
Message-ID: <6641286d492ee6faf40d26dbefeb32959b10c8cb.camel@wdc.com>
References: <20220901010220.495112-1-wilfred.mallawa@opensource.wdc.com>
 <d2e49911-4aed-5031-f430-71d4e15b130e@linaro.org>
 <d6f71302-864c-b80f-84ea-d1dda4817f80@amsat.org>
In-Reply-To: <d6f71302-864c-b80f-84ea-d1dda4817f80@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR04MB6546:EE_|MWHPR04MB0353:EE_
x-ms-office365-filtering-correlation-id: 01885721-9059-4ec8-17aa-08da9849f28f
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9hgifQnuL8wqvJhVIsU9XORZzNl3tBpjQhCferGq4x/fJSaj2roArdJLPFA/9ZFwLFr3FfgWyUT5YrCoDBoSlsxf4GSUfE1IoCHAU2R6qvFpqTjaaV1DQJEMO/gf/ZsahuOz4yICW5v+MbUFzQI51Fy+HzQ+HNRKjkZ31QN/LVW4TPhxyF5IbDh9frvk6aZph/aMt86TBDDMZh+hbuwWaflsx50oGTSWWvzm05LBxu/y81i3DPjYYLDUoEzSam8q478i4HAh9Q9QeoVohpPUn4LIzxj6F27Krcps9XSLScOKlX9oDTMa3PCx3fj//B7VYLraTKgTF2ynKwNKMl6z76ycQLFAM8NPZymWEKBNwmiqkifJ0pQmoyXchPXbIUBTIiHBGzllqSOJhu7ohKkkf2DRoJy1o6UBK1SqaL0VtjDw+TivK/19Tuf33fEbX3E388+i+vB4uM5CxrKHo7cprBCf0UBNDd7Qsk8YTuHEHhuTjzcFo68J/NM1F1sGmS026OfdhT88EgZm/kHRtC5yfPUfPBoktki22Pvl18GvS28HHPUAM9JuWBtssWwIXQqqfdCPtpm8dLl0KGUNatHk3RQE4s0jjFyh3qf0r7K/Ob6B1ZbDBV2pLtn4GN2ug60Iy3c4DrjBq9EsRcQfaaFraMP1vLRdxbJBOuHlN+Uw280v6soLNLxsMylb8Ud29ckuRi+dq05LVix8xr+MsdQ5luhVm6XgYpj6oOgYjIDNS1X3+Yr1evDmb8TjCw5Ym+62amPkc7Z4n8JkTCX/E1NgAfqGoIqwj7fwqQNdUVN7P8RsvjZ5Z8VJQdZISqPciHCwf7l3Ur11K41HGKA/k+XsJxIjwiffji8nJPoiFIApsMYoNUzf39t4TT8bXdJkCMEFlREwEq1e744q+i1h4jok4Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6546.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(136003)(396003)(39860400002)(366004)(451199015)(5660300002)(478600001)(966005)(71200400001)(6512007)(82960400001)(8676002)(6506007)(186003)(4326008)(91956017)(66946007)(76116006)(53546011)(26005)(2616005)(110136005)(86362001)(44832011)(2906002)(38070700005)(66446008)(66556008)(64756008)(6486002)(41300700001)(122000001)(38100700002)(316002)(8936002)(36756003)(66476007)(81973001)(357404004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZlNlQ2M2ejFRaklMN3BnVEtDZHY2akNJOE5rUUZ6WVZnTFBLTDE3UUF2Qklk?=
 =?utf-8?B?T3dnK3BtbnV2VlAycGFXeEFxZmQ5NTV4enpMVENFeXVnWmxDZnFFVHRTZHA0?=
 =?utf-8?B?Z2FzRjlWYnNLQWR2WU9LejhWb2RXcVArdjFIMUx6WngvNVNzdUw1N2sxMGVh?=
 =?utf-8?B?ZEJvdy9wUXNuNWtvTkhQaUtNenNaM0t1cXFMZkNCNzRLU2N1aGc1VFpSUWVr?=
 =?utf-8?B?VHRoVE5tMlZlTVlCdGxSdzZIMjljS0c3YkpBYmdieWpQWVB5dWZneTJkUjQw?=
 =?utf-8?B?Y3FDbFlzb2duVXlmUEo4cnU5OGtJeVRWemUvbG9seGUramRCZWpoNDJZQWU3?=
 =?utf-8?B?Tmd3OVlBTENpbUpudVJiVmVZZTR4Sk1HNFdMZG9naCtndnRsU3hiWXFhWklY?=
 =?utf-8?B?M0VWS0x1WllxQjlmMXpHc3N6aFJoYVR5OXZNdzZ3WjN5NVhOZVFrOVdHcHA2?=
 =?utf-8?B?Z21QNTMrWlR5UHVGNmtYYXZraE5zVVVFVTRwa2RDSHRZUmNaQjZFWEdGdG14?=
 =?utf-8?B?Z0crQTZ0VFg2MUh4N1BudndKTnh3TW1QS1VVb21LenEvMEdQNGdORjNhcmV3?=
 =?utf-8?B?SkpFT01zQzJ5ZHRWTFYvZ1VqVHBLalpwU1dRdDNTQU5taWJqMWc4UDY3eWNq?=
 =?utf-8?B?VVBRa1NIOE5iQjE3MUpaWDFROEtJZkhqWW5VUEdYZ1hIVzQ5b1pyKzFHQjNR?=
 =?utf-8?B?YXEwcFlzUm56d2pEK2tudGRwR05BMTRGYTdMVlZpUktaY0JTZ3NTaFpzQWJ1?=
 =?utf-8?B?REZDZ0JEUEdPaVR2OWMweVFNelJvQmJpeW1qWng3UUNLSTZCS0FLZzVUR0NE?=
 =?utf-8?B?NUM4bUErSitXUTRrT1hKOUxubWZtTEJuK1BYK2JxMVVYZThNa0QydWl1L1U1?=
 =?utf-8?B?MG9iV1lDSVhRc0MxeEpqcnZXMkdVWU1nQURmYyt1OVJOb1cxQXd6WDlVOFpN?=
 =?utf-8?B?bnhGUUZrMDVLV094Zzl6TDFBZlBCNXNZV2llUVhnbEhTQzRzMzF0dVgyVkps?=
 =?utf-8?B?Unh5RWtuWHljL2ErcmxRRkhPQ0NWVC9qUkwxays4YlZETHNZZkNqbmtHMERT?=
 =?utf-8?B?bEpqZ3lrODBFcDhhd3JZcnJ4YnJuZUhzWi91RmdOYWs5L2ZEWXJUbCtUMktu?=
 =?utf-8?B?dHlPOG1EazZEVnFiNnZURE40TFlIQTFwek5ZWUdwY0kzaVVjR2E1cldvTzll?=
 =?utf-8?B?T0wwN2ZqYzRnQS9odzJTdHV0QTkrRGdwVUZ4dGV4V3BNb2tGcFdvMWU1dnpE?=
 =?utf-8?B?MGNUMkRFOHVZOU4xSUp5ZTJpZWdVblgyRHQrbFZDajRuRWdHRlRYOXZXd3BO?=
 =?utf-8?B?OXFuYWVIUDQxVmROZ2FFSHB6UFhCRURZbFZrNHEyNTVtdzA1eHMzUnY0QUpS?=
 =?utf-8?B?clpLdmxRMTgxazB6WVF6c1paVlRjQk45VzRWMWVFSTA4SVR5KysxK3h0cTR1?=
 =?utf-8?B?Q3N4YVlNUjNobG5MbzBROFo1TFM2QjcrTXNNYUdwSjBKV0o1Qm1pRWFSam9p?=
 =?utf-8?B?WUxIVXprSGlPOEFrQW1ObGtXTVJWTnYzV2RuaVBSNTVYWjNRMUdtZG9qMUxO?=
 =?utf-8?B?TkM3VGhUd0RHdFNMeXlFUmxSMVU4eERuQ2c3bmJRdW1JaTdtSW14NjZIamlN?=
 =?utf-8?B?UWxsSzZtNElPbjZhWGNKdXJCSDkrdDlTaG03Z2hhUjJudVNncjlzQkZkdjlX?=
 =?utf-8?B?YmNQWVorZlFpVkxXS2IyWnRSUjUrRmM5cncwTmxTNkgzajFveXR1L0I3RkNm?=
 =?utf-8?B?ZkJ3d2EzMDJZb3VRd1RmbEU4N2VLVk5MOU5PTDAzSmQzNGUrSk5oLzRRZnJp?=
 =?utf-8?B?eXdIUy93N3FIMWlhTHBWZEwxaXFic0tiQTJHQklIWjJiaFBUT2V1Y3BFOUta?=
 =?utf-8?B?UFhOaGJ5TUw0b0tWNWZsVEZaWk5VOTFoZS9YZTN5OEZHRTN6b01KU1kyeVE1?=
 =?utf-8?B?L2lVWitaYk9iTytRZEVpQXhIWEYxU1luMmwwVWxYQ2Z1ZHBuWFg1N3c1dFhv?=
 =?utf-8?B?NW1TZVhwMklkM01FeXdyN3hqMXhHdTU1a3ZjQlRuUno1RUN4ODRMQmhSUWJB?=
 =?utf-8?B?K3VLWjFTVCtFaUdLeTBrNHozb3l0dFZIRWdWaDFuYmp3Z00vVlpBWjRMSk1t?=
 =?utf-8?B?SVBXMTNiVHUyc1FVUklBMyt2dURQajVTbDFCaW5yUWV2Q0xkcUtQWlJBdHNj?=
 =?utf-8?B?L3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <842D78381AA4954CACEE50A94BC7F8AE@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6546.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01885721-9059-4ec8-17aa-08da9849f28f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2022 01:14:19.5376 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xI5QuvxRQo/jSx23SiPgxpxWzzui0l/xtfBfIpknPLaHIHxVR3GXduDy0aL0arl/As4ZlQ8IFM4kYOzgWYqOdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0353
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=252df0604=wilfred.mallawa@wdc.com; helo=esa3.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

UGluZyEKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3FlbXUtZGV2ZWwvMjAyMjA5MDEwMTAyMjAu
NDk1MTEyLTEtd2lsZnJlZC5tYWxsYXdhQG9wZW5zb3VyY2Uud2RjLmNvbS8KV2lsZnJlZAoKT24g
RnJpLCAyMDIyLTA5LTAyIGF0IDAxOjE4ICswMjAwLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3
cm90ZToKPiBPbiAxLzkvMjIgMDc6MzIsIFJpY2hhcmQgSGVuZGVyc29uIHdyb3RlOgo+ID4gT24g
OS8xLzIyIDAyOjAyLCBXaWxmcmVkIE1hbGxhd2Egd3JvdGU6Cj4gPiA+IEZyb206IFdpbGZyZWQg
TWFsbGF3YSA8d2lsZnJlZC5tYWxsYXdhQHdkYy5jb20+Cj4gPiA+IAo+ID4gPiBBZGRzIGEgaGVs
cGVyIG1hY3JvIHRoYXQgaW1wbGVtZW50cyB0aGUgYHJ3MWNgCj4gPiA+IGJlaGF2aW91ci4KPiA+
ID4gCj4gPiA+IEV4Ogo+ID4gPiDCoMKgIHVpbnQzMl90IGRhdGEgPSBGSUVMRDMyXzFDTEVBUih2
YWwsIFJFRywgRklFTEQpOwo+ID4gPiAKPiA+ID4gaWYgdGhlIHNwZWNpZmllZCBgRklFTERgIGlz
IHNldCAoc2luZ2xlL211bHRpIGJpdCBhbGwgZmllbGRzKQo+ID4gPiB0aGVuIHRoZSByZXNwZWN0
aXZlIGZpZWxkIGlzIGNsZWFyZWQgYW5kIHJldHVybmVkIHRvIGBkYXRhYC4KPiA+ID4gCj4gPiA+
IElmIEFMTCBiaXRzIG9mIHRoZSBiaXRmaWVsZCBhcmUgbm90IHNldCwgdGhlbiBubyBjaGFuZ2Ug
YW5kCj4gPiA+IHZhbCBpcyByZXR1cm5lZC4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFdp
bGZyZWQgTWFsbGF3YSA8d2lsZnJlZC5tYWxsYXdhQHdkYy5jb20+Cj4gPiAKPiA+IFdoeSBkbyB0
aGVzZSBvcGVyYXRpb25zIG5lZWQgdG8gZ28gaW50byBody9yZWdpc3RlcmZpZWxkcy5oPwo+ID4g
SXQncyBub3QgYSBjb21tb24gb3BlcmF0aW9uLCBzaW5jZSB3ZSd2ZSBuZXZlciBuZWVkZWQgaXQg
c28gZmFyLgo+IAo+IEkgc3VnZ2VzdGVkIGl0IHRvIGltcHJvdmUgcmVhZGFiaWxpdHkgb2YgdGhp
cyBwYXRjaDoKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9xZW11LWRldmVsL2MzMzI1N2EzLTY0
NWYtOTM4Ni01MmU1LTIxYTE1ZWYwZWJlNUBhbXNhdC5vcmcvCj4gCj4gPiA+IC0tLQo+ID4gPiDC
oCBpbmNsdWRlL2h3L3JlZ2lzdGVyZmllbGRzLmggfCAyOCArKysrKysrKysrKysrKysrKysrKysr
KysrKysrCj4gPiA+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspCj4gPiA+IAo+
ID4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody9yZWdpc3RlcmZpZWxkcy5oCj4gPiA+IGIvaW5j
bHVkZS9ody9yZWdpc3RlcmZpZWxkcy5oCj4gPiA+IGluZGV4IDEzMzBjYTc3ZGUuLjVhODA0Zjcy
ZTMgMTAwNjQ0Cj4gPiA+IC0tLSBhL2luY2x1ZGUvaHcvcmVnaXN0ZXJmaWVsZHMuaAo+ID4gPiAr
KysgYi9pbmNsdWRlL2h3L3JlZ2lzdGVyZmllbGRzLmgKPiA+ID4gQEAgLTExNSw2ICsxMTUsMzQg
QEAKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgUl8gIyMgcmVn
ICMjIF8gIyMgZmllbGQgIyMgX0xFTkdUSCwgCj4gPiA+IF92LnYpO8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIFwKPiA+ID4gwqDCoMKgwqDCoCBfZDsgfSkKPiA+ID4gKy8qIEdldCB0aGUgbWF4
IHZhbHVlICh1aW50KSBkaXNjcmliZWQgYnkgYG51bV9iaXRzYCBiaXRzICovCj4gPiA+ICsjZGVm
aW5lIE1BWF9OX0JJVFMobnVtX2JpdHMpICgoMSA8PCAobnVtX2JpdHMpKSAtIDEpCj4gPiA+ICsK
PiA+ID4gKy8qCj4gPiA+ICsgKiBDbGVhciB0aGUgc3BlY2lmaWVkIGZpZWxkIGluIHJlZ192YWwg
aWYKPiA+ID4gKyAqIGFsbCBmaWVsZCBiaXRzIGFyZSBzZXQsIGVsc2Ugbm8gY2hhbmdlcyBtYWRl
LiBJbXBsZW1lbnRzCj4gPiA+ICsgKiBzaW5nbGUvbXVsdGktYml0IGBydzFjYAo+ID4gPiArICov
Cj4gPiA+ICsjZGVmaW5lIEZJRUxEOF8xQ0xFQVIocmVnX3ZhbCwgcmVnLCAKPiA+ID4gZmllbGQp
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgXAo+ID4gPiArwqDCoMKgICgoRklFTERfRVg4KHJlZ192YWwsIHJlZywgZmllbGQpIAo+
ID4gPiA9PcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ID4gK8KgwqDCoMKgwqAgTUFYX05fQklUUyhSXyAjIyBy
ZWcgIyMgXyAjIyBmaWVsZCAjIyBfTEVOR1RIKSkgCj4gPiA+ID/CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gPiArwqDCoMKgwqDCoCBGSUVMRF9EUDgocmVnX3ZhbCwg
cmVnLCBmaWVsZCwgMHgwMCkgOiByZWdfdmFsKQo+ID4gPiArCj4gPiA+ICsjZGVmaW5lIEZJRUxE
MTZfMUNMRUFSKHJlZ192YWwsIHJlZywgCj4gPiA+IGZpZWxkKcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiA+ICvCoMKgwqAg
KChGSUVMRF9FWDE2KHJlZ192YWwsIHJlZywgZmllbGQpIAo+ID4gPiA9PcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4g
PiA+ICvCoMKgwqDCoMKgIE1BWF9OX0JJVFMoUl8gIyMgcmVnICMjIF8gIyMgZmllbGQgIyMgX0xF
TkdUSCkpIAo+ID4gPiA/wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+
ID4gK8KgwqDCoMKgwqAgRklFTERfRFAxNihyZWdfdmFsLCByZWcsIGZpZWxkLCAweDAwKSA6IHJl
Z192YWwpCj4gPiA+ICsKPiA+ID4gKyNkZWZpbmUgRklFTEQzMl8xQ0xFQVIocmVnX3ZhbCwgcmVn
LCAKPiA+ID4gZmllbGQpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ID4gK8KgwqDCoCAoKEZJRUxEX0VYMzIocmVnX3ZhbCwg
cmVnLCBmaWVsZCkgCj4gPiA+ID09wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ID4gK8KgwqDCoMKgwqAgTUFYX05f
QklUUyhSXyAjIyByZWcgIyMgXyAjIyBmaWVsZCAjIyBfTEVOR1RIKSkgCj4gPiA+ID/CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gPiArwqDCoMKgwqDCoCBGSUVMRF9E
UDMyKHJlZ192YWwsIHJlZywgZmllbGQsIDB4MDApIDogcmVnX3ZhbCkKPiA+ID4gKwo+ID4gPiAr
I2RlZmluZSBGSUVMRDY0XzFDTEVBUihyZWdfdmFsLCByZWcsIAo+ID4gPiBmaWVsZCnCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+
ID4gPiArwqDCoMKgICgoRklFTERfRVg2NChyZWdfdmFsLCByZWcsIGZpZWxkKSAKPiA+ID4gPT3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgXAo+ID4gPiArwqDCoMKgwqDCoCBNQVhfTl9CSVRTKFJfICMjIHJlZyAjIyBfICMj
IGZpZWxkICMjIF9MRU5HVEgpKSAKPiA+ID4gP8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBcCj4gPiA+ICvCoMKgwqDCoMKgIEZJRUxEX0RQNjQocmVnX3ZhbCwgcmVnLCBmaWVs
ZCwgMHgwMCkgOiByZWdfdmFsKQo+ID4gPiArCj4gPiA+IMKgICNkZWZpbmUgRklFTERfU0RQOChz
dG9yYWdlLCByZWcsIGZpZWxkLCB2YWwpIAo+ID4gPiAoe8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gPiDCoMKgwqDCoMKgIHN0cnVjdCAK
PiA+ID4ge8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIFwKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgIHNpZ25lZCBpbnQgdjpS
XyAjIyByZWcgIyMgXyAjIyBmaWVsZCAjIyAKPiA+ID4gX0xFTkdUSDvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+IAo+ID4gCj4gCgo=

