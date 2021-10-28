Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1848C43E57C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 17:52:20 +0200 (CEST)
Received: from localhost ([::1]:50742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg7hT-0003Ee-7h
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 11:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mg7f9-0000Za-Gc
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:49:55 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:6625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mg7f6-0002s6-Jc
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:49:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1635436192; x=1636040992;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y7WS+xcsklPmIzbJW6qJikL4oBmyJ3ZCsiRcO1+K6J0=;
 b=MB+12OYQelvd46AvbxUkIs76v+1OTwmfnS9HBr47+ScMYZdAHqdOe3lM
 X8mVfg9Fre9VgT8ZDxoI/+OqZ7LZb59ggTu6RGFb8evZbDEy54qHJ3mfi
 DX2CmOninXaRoZS42ZZmNWnyHuYIzeGPJ862b+eUhWeqkG1Bh95gpDhT7 Y=;
Received: from mail-bn8nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.170])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 15:49:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WVCXvZCNtc/tciB2aDuOHC4WAwthhVICIdgEWNGCvrGhQJ/tU7YRZuro+QIH/sh1CneGolJ4sbwMixQqS2MygOB52ZqwKme0XZpliv642+1aCs4dOi6zGtfLcT5vmLKBvF1e8pyfrN55kndA14LT4WwF5Ac/ZsyoBOoPDvw/6Ebe2+RTwOA+SCanKzLHMbq0ywY8Tmm/MEntrJbAU/KqDNjdFPx2yfc9OZgcf/1Sb7nQm04Ch8/sdJwaBlBCJPxiovat0dumk9iDBIHWL7QGeUrYhRh4l8PCVdQY5CjxfDOK1y76+36NEsUuMkruIBGmr2N7XeYAVQkaGr6ZNr1g8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y7WS+xcsklPmIzbJW6qJikL4oBmyJ3ZCsiRcO1+K6J0=;
 b=eXorfvflRdr3nQ7j5RzrwsklUiCm1S0oPYn8XdkGDX7HgUiRgz1q3TfyGm45RB+Of9P5w8A6t7Wr1R5/aQUPSFXeclvrpt3s+fuyzzk681NswL4sv8HBdAwis5RIpO3k3fpzeA8tr+XeAQ3ZezOzfEYXSLwaVQoKyFHLRvuInfuhoI0H0ocUNW59vvPm0BUdETfJsRMWrQp9Ym6ziD6VbvNXOXSbM82m4wtlk6Gsrww6yvGQxl/eIOSlJo5abKG6zip6RQ1/WcT5pWOoPf5jxvXXT82DJON+gxGCZ5uHXT7kxvcSYi9uRC1va3l4a5TcgVyNc+0fyasXT43ZRqly6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SN4PR0201MB3440.namprd02.prod.outlook.com
 (2603:10b6:803:50::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Thu, 28 Oct
 2021 15:49:48 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::b858:f47d:4ad1:1a04]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::b858:f47d:4ad1:1a04%5]) with mapi id 15.20.4628.020; Thu, 28 Oct 2021
 15:49:48 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "anjo@rev.ng" <anjo@rev.ng>, Alessandro Di Federico <ale.qemu@rev.ng>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH v6 08/12] target/hexagon: import lexer for idef-parser
Thread-Topic: [PATCH v6 08/12] target/hexagon: import lexer for idef-parser
Thread-Index: AQHXfWMeqjE2iwrfGEuuIzlTUW5JN6uXvjRggEFv9oCAD/xZUA==
Date: Thu, 28 Oct 2021 15:49:48 +0000
Message-ID: <SN4PR0201MB8808233526630C34C93976F8DE869@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20210720123031.1101682-1-ale.qemu@rev.ng>
 <20210720123031.1101682-9-ale.qemu@rev.ng>
 <BYAPR02MB488608119AE6FE137C9ACE3ADED39@BYAPR02MB4886.namprd02.prod.outlook.com>
 <49378670-138d-563b-9071-3fae6c95f265@rev.ng>
In-Reply-To: <49378670-138d-563b-9071-3fae6c95f265@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rev.ng; dkim=none (message not signed)
 header.d=none;rev.ng; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2ad5c542-25ba-4743-42c5-08d99a2a9237
x-ms-traffictypediagnostic: SN4PR0201MB3440:
x-microsoft-antispam-prvs: <SN4PR0201MB34408858DA49BD6C47118F07DE869@SN4PR0201MB3440.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LlG/mkR0HPQhOf60XpePmc7ahG1YR3AZrSndz/1X2J6mv23YEZZ2wQU5Yy6eCjdJlSA04htnhdNMcffKOA2VHGiXDWodpoJUYZh/92iCYdf4HtKulko/TP8z8cabvAMkIHRxFvEfVIByOfPtWsWMtkSxGSKdT+HFc4iaE8Nw9cYlM+JuKeCIcu68Jq/RbkkWGaKC1OhVTUBPPG8wzP0TIl1thPdBrUosUcE0AvJDOiVt71gznGOi0ryZTPeF6w0s54g3L1U2qIjaSqwcBUaHkHkdBRNVAGFs1iuDzU4CwxNK9OMa1ulFfLmyQCoyQpn2EoePG2UH6CIFVXU0Bcd1sQbEGqv9QJ9DMan8D7+8ZP+e49SDd+VCuPSiVh5cDeoogrQgJKE5uBgxq/OVxhKpmDIGg4v58F3/HT1z4GTacQMybbLl/Ve2Vtg03oBv1AaVoCS+ZE69rVyDyN/oCJHLThMzJ/0YZNUZz4UCSwsAsw1BS00PTv3TEWGJ2zWWhSV5JxyyUUQTpMXfcYIacfm7N7u6HDPt8ZkcKym6hGjBV4DtNLRgjWxxe+mqQyTgXhmFKMua4eDV8Bww6+GURDiHxKCgoPssTufWGNObH+9PEyCMunvD+EH1BbHfvkjDo0UWBcfimOw+vU1y71z3nGEmg+SaaH8EsSduFkeES7krz5Bv9s8p4dMIdbpA2N5t3NO5npvWxS+jBdP+VOu+lUTFFw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(71200400001)(8936002)(5660300002)(122000001)(66946007)(76116006)(110136005)(7696005)(55016002)(38100700002)(54906003)(508600001)(52536014)(4326008)(38070700005)(33656002)(8676002)(186003)(64756008)(66556008)(66476007)(86362001)(53546011)(26005)(6506007)(9686003)(66446008)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eFBzb2FhRW5nT1BRcTZCR3JJclc2cFUyanZYMmpwUXQ0TjlYL0lMZXlvNUli?=
 =?utf-8?B?d2puOE5OVXBURXdLaEMwZkVheWlMYVJRdnJNeGdBYldEenZ1SXNBRWNOOGZB?=
 =?utf-8?B?cmppYmphajl1S1NrcjBiWFBvN2FFWjFYS2NveEZ1ZS9RaEFjVUpGZTRzKzYy?=
 =?utf-8?B?UElIT1RWbzVsVkMzeHVnVEoxR1U2OGFpdi9JcWl6SXNJOVFGKzBMT1ZlKzkx?=
 =?utf-8?B?eDJVaml0c29VMW0vWWZ6SENLY1FTb2pOWCtpSlRqdGxybkhjVGdHajU4Z3hk?=
 =?utf-8?B?VFRXRFh6NlNvOHBHOEFYSzhOc1RkYndoaWM0Sy9rZEhvcCs2VDVZamIwb1BI?=
 =?utf-8?B?bDQzazBsaWFCcDF4V05XQ0FiQ2pWck11MGZtMmNraEhEM25VbVRrZzNMMDFy?=
 =?utf-8?B?MHNMaGE3d2xock80RjVIcy9aK1hnbGE4OTJyNVhTTVdQZkdETGRaOGtBNG8x?=
 =?utf-8?B?ZFAvODl2bkhNckRqNTllTU85TTNGWlZMQ3ZjSGpxRVUyZW1xaE5hOVZ6TlEz?=
 =?utf-8?B?blBZMEo5QzBXckFza0FhTDZRUEtzdjhIcHRhMkZmeDZTRGZ3Zi9jMnkwYTRR?=
 =?utf-8?B?b3k4VzJsa1FWZGswVmx3SGE3TGZzTTZxTlMxeXl5aDB6TnZCb2J0TkY1MXBO?=
 =?utf-8?B?V0tOWElaT3BNQ2dBL0FCQ09GcTNvcCtscFNyRFJ2WE1VbVJlWG1aeWl2cjY2?=
 =?utf-8?B?WkdwdjlNdDljcENnYkdjU3BDTENSK3l4bFpib3JTM1ZrZjFKc2FScVYrQUVW?=
 =?utf-8?B?UnY2c2xDcnEyRW0xM21HYU85SWxScGg1cC9VRGdjdUVqRE53UmVuNlV2dldr?=
 =?utf-8?B?QXZZWmdwK1RoNlVrb2x2MjFqYXZSY2V0NVA3OUxjZ2lSZTREa0JjUWlHaUV4?=
 =?utf-8?B?aVh4a1NSbzNlN05uRmhJc0t1MnlwMHVQQ1I5K3BPNUh4d1h2M3lKOUFRMmo5?=
 =?utf-8?B?azdOU0NsZkVpNmxhcFJ3UW1KZkhEL2Q3cER6MCtONGtYMGNjQ0FPMXZyNHdJ?=
 =?utf-8?B?SktMRmgrVXVpSEZCbWtPMWQrQmd2UGhpbzAzU0U3OVN1UndYeVhqS3U3U0Jk?=
 =?utf-8?B?WUpybjM3aktwak1uUDNTY09LaWdGdy9pSzJVWXJHOGlkZ0NmR1hjTmNXTEZE?=
 =?utf-8?B?YUJabUt5TVBYdjBqd1ZzOFBIaUJBemtsdnZTK3JxMkFBdms4aGViTExjcVNp?=
 =?utf-8?B?bFJjU0FFUG4xTmhZRjdESEJMK2VQcmkrRXMzRTFUQlFFWGNSRm92b0lXVnEr?=
 =?utf-8?B?SXZGZUVyVlVueWViVUY5eE53R3phZ2Y5OHpFdkNxVlF2d2gyUHNOQitwMFRs?=
 =?utf-8?B?VjFIMzR2UEkxRndES2xwUitGN1VtSU9YZldNMXlMSnJUcEdiamE4NVR2T1hY?=
 =?utf-8?B?TU91UlVLWjFhTTR5bUhOa0paaFQvRXAzSjhpWGd3Z2JobUJidklPQ3oxY1pC?=
 =?utf-8?B?eFpvNzVkbnZpYWhWQ0g5T2NHdzYvU3JWV1dEODZYYU9rSFBVbVVhRjJMREUv?=
 =?utf-8?B?WmRyYlF3ck92WGFBMDJXMHdvd0dYd3RLZXhVWWZEYXlMT1QyKzAvbk40ZGdn?=
 =?utf-8?B?M3VOaFVsTHpoZktSeFN6Q2s4VHhWUU5uOTVFYmI0RlV5ZCtrclNIQVE0YW90?=
 =?utf-8?B?VFUyRENqRnp1N0N0ajJpTWpPK3hKcTdWUHQrbDdxTE5IOWRDall4Z3dPaEZ4?=
 =?utf-8?B?R0Z5UE55K2djQlpzVFI5OFpXVGNyRmdqT2xNZFlOMXF0a1U0UjZDd2ZYYWZt?=
 =?utf-8?B?TXJEeW02VmJSTDB2VGk5YStob3QwVXJZMjJwRzlueGIyTHNJZVpBWWlPd3dV?=
 =?utf-8?B?ZGo5c0tqd25WaExTUTN4RkZzU3psT3Flb0Y2ZnMyZVlPYmU1aXQ3OE5XMFFJ?=
 =?utf-8?B?L0VhV2cvY2paOElhLzRtb2U3TmJreng4ZTdJd3VHOHN1L0JpVlhtR2V6dTVj?=
 =?utf-8?B?cDIydG1hcUUxMEROZG4xZjNIWElwRnpRUE5aMzdkUFJLSDZxNTROZDBLSzhm?=
 =?utf-8?B?RjRiR0c2L3Y0ZUlSaUxFUXBoNGdFVzhMaXR1bC9LOHdxT3lxdlJycUZNSXNK?=
 =?utf-8?B?RUxIcUlSaTR1OThtcjdjeWFLUXpWMXNqOEtzamdpTVZVYnc2UHlXU0JXOWFN?=
 =?utf-8?B?VUNzeUxsMWZQZVV5WlVvNnBtbW9WMVE4VVE2TmlNbzEweEUzMFVObzlpcDRx?=
 =?utf-8?Q?IpZp2Y6b7LUm1qthKFJDa0w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ad5c542-25ba-4743-42c5-08d99a2a9237
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2021 15:49:48.0471 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ht3+9kX/ztSizD3kmpGIZezSIbygLU/XuRxF2gtwAypyf1kYKCTe+JKH0I4QjADCcn6+5qTY3Witm3aQctwHsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB3440
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: "babush@rev.ng" <babush@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "nizzo@rev.ng" <nizzo@rev.ng>, Alessandro Di Federico <ale@rev.ng>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gRnJvbTogQW50b24gSm9oYW5zc29uIDxhbmpvQHJldi5uZz4gDQo+IFNlbnQ6IE1vbmRh
eSwgT2N0b2JlciAxOCwgMjAyMSA2OjM3IEFNDQo+IFRvOiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBz
b25AcXVpY2luYy5jb20+OyBBbGVzc2FuZHJvIERpIEZlZGVyaWNvIDxhbGUucWVtdUByZXYubmc+
OyBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IEJyaWFuIENhaW4gPGJjYWluQHF1aWNpbmMu
Y29tPjsgYmFidXNoQHJldi5uZzsgbml6em9AcmV2Lm5nOyByaWNoYXJkLmhlbmRlcnNvbkBsaW5h
cm8ub3JnOyBBbGVzc2FuZHJvIERpIEZlZGVyaWNvIDxhbGVAcmV2Lm5nPg0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIHY2IDA4LzEyXSB0YXJnZXQvaGV4YWdvbjogaW1wb3J0IGxleGVyIGZvciBpZGVm
LXBhcnNlcg0KPiANCj4gT24gOS83LzIxIDE4OjA4LCBUYXlsb3IgU2ltcHNvbiB3cm90ZToNCj4g
KyJmTkVXUkVHIiAgICAgICAgICAgICAgICB8DQo+ICsiZkNBU1Q0cyIgICAgICAgICAgICAgICAg
eyB5eWx2YWwtPmNhc3QuYml0X3dpZHRoID0gMzI7DQo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICB5eWx2YWwtPmNhc3Quc2lnbmVkbmVzcyA9IFNJR05FRDsNCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHJldHVybiBDQVNUOyB9DQo+IFRoaXMgZG9lc24ndCBsb29rIHJpZ2h0IC0g
aXMgZk5FV1JFRyB0aGUgc2FtZSBhcyBmQ0FTVDRzPw0KPiBXZSBmb2xsb3dlZCB0aGUgZGVmaW5p
dGlvbiBvZiBmTkVXUkVHIGluIG1hY3Jvcy5oIHdoZXJlIGl0IGlzIGdpdmVuIGFzDQo+IMKgICNk
ZWZpbmUgZk5FV1JFRyhWQUwpICgodWludDMyX3QpIChWQUwpKQ0KDQpXZWxsLCB0aGF0J3MgZGlm
ZmVyZW50IGZyb20gZkNBU1Q0cy4gIEluIHBhcnRpY3VsYXIsIG9uZSBpcyBzaWduZWQgYW5kIG9u
ZSBpcyB1bnNpZ25lZC4NCg0KPiArImZDT05TVExMIiAgICAgICAgICAgICAgIHsgcmV0dXJuIENP
TlNUTEw7IH0NCj4gKyJmQ09OU1RVTEwiICAgICAgICAgICAgICB7IHJldHVybiBDT05TVFVMTDsg
fQ0KPiBUaGVzZSBjYW4ganVzdCBiZSBjb252ZXJ0cy4NCj4gV2hhdCBpcyBtZWFudCBieSAiY29u
dmVydHMiIGhlcmU/IA0KDQpUeXBlIGNvbnZlcnNpb24gdG8gaW50NjRfdC91aW50NjRfdC4NCg0K
PiArImZISU5USlIoUnNWKSIgICAgICAgICAgIHsgLyogRW1pdCBubyB0b2tlbiAqLyB9DQo+IFB1
dCB0aGlzIGluIHRoZSBsaXN0IG9mIElERU5USVRZIGFib3ZlDQo+IFNhbWUgYXMgZm9yIGZORVdS
RUcuIFdlIGZvbGxvd2VkIHRoZSBkZWZpbml0aW9uIGluIG1hY3Jvcy5oIGFzIA0KPiDCoCAjZGVm
aW5lIGZISU5USlIoVEFSR0VUKSB7IC8qIE5vdCBtb2RlbGxlZCBpbiBxZW11ICovIH0gd2hlcmUg
aXQgbm8tb3BzLg0KDQpPSywgYXMgbG9uZyBhcyBpdCBpcyBuby1vcC4NCg0KVGhhbmtzLA0KVGF5
bG9yDQoNCg==

