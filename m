Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D0043E572
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 17:47:32 +0200 (CEST)
Received: from localhost ([::1]:42966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg7cp-0006A9-5Q
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 11:47:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mg7ZZ-0003Ag-Uo
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:44:10 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:22164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mg7ZX-00025v-An
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:44:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1635435847; x=1636040647;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hl5Hc0jgr+1mcMk/h+5JhyVAbnOMW1XEFI+aZio4Swc=;
 b=n+G3BKf4+4w4jvA5gfvEGrT+CsQA0BPNi+Vbh2/joRoYo48cnNyURyTE
 ITBHByXm05Hq1+bcwobLlVbMm3ANryYA8ayfc2/t7nybx5czDX3s5SvdS
 GZQkBmpnhap0c7dRbxA9IRgrSXAGc1iK5wTJ8ZwSyY7KSuf2uNumozL1o 0=;
Received: from mail-mw2nam12lp2047.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.47])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 15:44:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YYoWiFqC3Uqi7hgw14NudIC8qZrHZI+2ifJV6SX/TkNBnMf+s3tGd3kqP5U0BOnNr7Y7r45H2+uESUPerDTcxahB9pymJ48uC+sJwq/s2hN4aU4iGU22QUKqZHnDELW16ExzJni0TFSHRX4aY3ErhGGW/0ef0ZzQNUVVIPnXLyyKAYL8QAT+yVyHgXYg9Z6EykOmAwWba+WeTLc+nHpqLnh7TPOFiFEOWmjutCqO1XJykvi/tyMbkO+O7StHFzlmNVLTxpil9J36ZH52Yhk9Iv0stgLVB7JJ1YQ9VJT2oLED+OrdkBZhMpqwOEOLYFbiWJz6tHAvHSeimrH+1h2siw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hl5Hc0jgr+1mcMk/h+5JhyVAbnOMW1XEFI+aZio4Swc=;
 b=mzb0e7OmoqZupyfPA2neYCFAHmzGS7Qhp3SewPoEmELRN9qbY6s4pBrAu7718hnffBV36YvNU/9ri9ioQhV7gKj4bGBPDfQEaZD2P9nyXOwaVI+YS3BEolf/Xju4W7qtq/WOwU+d1y06hKHxHVIS6dlvEeRSTlbWEYrp95QpP2Py0S/JtTig2RI2QaWOhZZiynNnKZpVp3oSPXZRRiFy/DHDFya2HoSesHAuxVMp6sx5qfALAdaONMMzxX/E1AALVrAC4nH8TFj85Hyviq4uCSbdU920l/Agg4htRcST9YeifbXlNPYlzjmmAVbVFuF4hb9JzM9nA9mLkkqG5AgYIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SN6PR02MB5102.namprd02.prod.outlook.com
 (2603:10b6:805:67::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Thu, 28 Oct
 2021 15:44:00 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::b858:f47d:4ad1:1a04]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::b858:f47d:4ad1:1a04%5]) with mapi id 15.20.4628.020; Thu, 28 Oct 2021
 15:44:00 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "anjo@rev.ng" <anjo@rev.ng>, Alessandro Di Federico <ale.qemu@rev.ng>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH v6 07/12] target/hexagon: prepare input for the idef-parser
Thread-Topic: [PATCH v6 07/12] target/hexagon: prepare input for the
 idef-parser
Thread-Index: AQHXfWMas7KbARSe5UKIfHOyHXBG76uXuL2wgEFxjACAD/7CgA==
Date: Thu, 28 Oct 2021 15:44:00 +0000
Message-ID: <SN4PR0201MB8808050B1315E6340E9E64CDDE869@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20210720123031.1101682-1-ale.qemu@rev.ng>
 <20210720123031.1101682-8-ale.qemu@rev.ng>
 <BYAPR02MB48869CA040DC32F2244A1952DED39@BYAPR02MB4886.namprd02.prod.outlook.com>
 <5b655109-73c2-4c5d-3d8f-f9725007e3f4@rev.ng>
In-Reply-To: <5b655109-73c2-4c5d-3d8f-f9725007e3f4@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rev.ng; dkim=none (message not signed)
 header.d=none;rev.ng; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c5898fca-b826-4387-bb3d-08d99a29c2c4
x-ms-traffictypediagnostic: SN6PR02MB5102:
x-microsoft-antispam-prvs: <SN6PR02MB510276D81474FE556C22CD2EDE869@SN6PR02MB5102.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: neIfAk7ovp9CXX7ETCMvIvOGY0cEseC31rwFswTZUSA90RE8M0aBcy6nC0mxtggzayQyC9ZXpC7JhSxPqbutMMdzz9H+meWmHNTfGNZLUuIlBw+fMDpA75LRcLXbZVEnhBkoztsTxkho0a7zKnOUsNPXCC5wbo7ps94nD5x+z4T1vmR0+4JWaH4HJjpvWGE449kHIQ6L/+caMbaNVmkDj/vCbmTnfEHIST9xkJA7nd78a9jA7rpMEOjcFh1U8pvr3NeBBfSuVOCEPxnItb6WsVt1mr6JIObrgfp5yqkW8C51py4N/2qAbDO6H7H6C0T0fPKe6VCoNgDGxOk/aKBpzhaUd1/8Vfxd+kqq8Dj4LyvqD4FPZkZdvmz+e8R3oH+z5ZXi0PfL+jROEttl8+UhBEuCX0UjiIe3tpGkl71nuHgwz5YzSQLbioR28WCUP+DWXC8zb99uqMvh35wuIuAF1kQkIbT0LsrTC08pyigZFMkVRetk+G4iUqPvrPRrZ+zGFpXVCAK/i5EFOWKqwjKeYgxc96j5BZJiwRerOg9ZAs3jvFHVT+NxPQQHj9gS+sadwQAapNObfplf5xQqHvuB5ZUKy6RRkBPjJEQuybDxWcU5rr3PdQA3Pk9usRoNFGUO/NHtg6RZiTx2tvKNOhvl1I+BlaxdGkN1clqjU4OHEoLv6KyK8+vlcroKA3x2bioluOipC4KcbINLazjkkxLi6A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(33656002)(55016002)(86362001)(26005)(76116006)(38070700005)(71200400001)(53546011)(508600001)(52536014)(6506007)(9686003)(5660300002)(8676002)(186003)(316002)(2906002)(8936002)(110136005)(4326008)(66446008)(64756008)(66476007)(66556008)(7696005)(66946007)(122000001)(38100700002)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aU9CbEtwUTNHa3JLNDdSS29DYjE5OTFpakF0M05aU1J4a0pleEFsUE1oeUNP?=
 =?utf-8?B?aWhVaC9oL2RMRlZERlgvbkpYZjYzMEU4d0lJTDQxQXV5YmdSQkVBMk1VdGkw?=
 =?utf-8?B?T0JVWVBKYTBhajFGQkF1cG9RZ0E2RXpQSUlWZjVxc0dleFJaa3lHaFZnOUY0?=
 =?utf-8?B?eWgzTnNJY1ZuTGNJcEhFRkN5NjFUelMzWTlQdHVaNU44VEQ1N3hHclB4UVNk?=
 =?utf-8?B?UFdvUlBzNVQ0UGdoaVVUTWx4N3VQVCthN0hYT0kxUGhBSWhOaEFybGxYSFNR?=
 =?utf-8?B?WEFXOENBOUltS09YSFNVcDJ5Y1B2Sk41Y01OWjZXYnQwK3JHdmliR1VvY0tU?=
 =?utf-8?B?WXJ1ZzhiNm9KcTAzV0tuR1A0RXVUK2FlVGpPQUtsSjZYWEM5SHZwWjhXakdH?=
 =?utf-8?B?YjNmNjV4Q1dWVlM3R2FKRkNaY2wxb2tBcTZmRncxL29VdnlvZEpiaE9iTWRl?=
 =?utf-8?B?TTRseVhWWmM3VzdWbDQySTVhMDFGcjljWUxjWmhVeFZhZ1pTS0ZYWEV0ODRx?=
 =?utf-8?B?cjlBdU1tVTZOUmNQQzJEZ1FrOUFDQlltc1oxVnFuMVB1WmdRTFJCenVRdnF0?=
 =?utf-8?B?VFNzUXdrOW5hWFNWajgrVVFtN2Zmcm1wYjlzTTFEVlRRQ1d1bndYS1YwVWk2?=
 =?utf-8?B?bjROdUhvNENDNzExWkE0UGlkanhXMDdzU1ZqeTFPRVFURU0yeE5iOEI5Zmlt?=
 =?utf-8?B?a2xCNHNyTkR5elRSRWVkY2JIem9BNWVPNnByRURIdVRiWGdoQXlWdllGS3ZI?=
 =?utf-8?B?b2hzQXJtQ0VxbU1NNk1rNTBNcmhuV0lFNFJGYm0zeWJBcFphVmtrUW5GZVEv?=
 =?utf-8?B?Tnp4RmJzUS9DOTVRTGFzZTlyVGxjMmR0amh5aEMwc3Y3OTh2MHlJWnE1T2dY?=
 =?utf-8?B?UzkyN05FZkQ0SW45MHh5U2RlVHp3eXFIMVhYWFc1aFJOWkFHWHcwK1BCYTVS?=
 =?utf-8?B?Y25ZNXMzMnhsaThaSGdqYzR6ektKUUY2RUk3cHlCSVlUSTl0QkJwUnpkZWdy?=
 =?utf-8?B?c2JhUVhJeWo4eWNITEx4VFRkZ1UzcXRNaGp5ZW1wc0g1S2JhejhrYXNoV0VR?=
 =?utf-8?B?OFU3NzFDb2lXU1pjck4vcVdOMXh1S2RmNHhDb3hYQjgrVHByOXprMnlqWWx3?=
 =?utf-8?B?UHBMOXFtVkV2azUvWW1abHYxR2lTb2N1VWlPWVBmeHdZcHIwak1ORDB1b3Ry?=
 =?utf-8?B?Mk5jMkRaTXNZeE9kbzdNbU5KWE1XZEpTS1V1dXh6NkZIYnZLWmU0MEppU040?=
 =?utf-8?B?VitrcmZFVy9xQytOL1Y3UHdoeExyYi9UVmhpekJPcnM0eVRUdm1SdTM2elFH?=
 =?utf-8?B?VitoYW9lTDRyNmc1L3VJZHpoVDRaRzJzSVBkcDZBYk1Ta05FOHc3UzNQeTNv?=
 =?utf-8?B?WTlCKzgzcE9rbm1rZEF4cHppUUZvWHBhdzgwbmd6MFZsM3FCd0dkT0JTTnFP?=
 =?utf-8?B?cStTeEZ3VGhxNldUbTFaZWp4K1IzT3BxdnBaSDJYQnk2VlN6UDAya3NwVkY4?=
 =?utf-8?B?MGk4UGZSOGJWMkRPZlZHdjhkRGFSWWt6dUNlcXZGZWZlUUd1SHIwWFNyY0xW?=
 =?utf-8?B?WHJ6bE11ZGd5aEN1QjZFcmgwSGE3SUZod0pRbnVDRjVSVFJYVFNlRitJeVNh?=
 =?utf-8?B?OWhOUkt2aGRqSEd3cUNCMlRoRTlnZEczeElnZDNFU1lTLzE3S1ZvZXhjZmpa?=
 =?utf-8?B?bTlLVlN4aGM5OTJIemVTZGVlWnlTY1gxVS83Tk1GbFZUcTRLQUt5WmNMVngv?=
 =?utf-8?B?d2hmbEYrbUd0MG5jdUhZTlpMRVpGK2VVNnNDNTBjdmdZVFRKTnVkTFFiOTRo?=
 =?utf-8?B?RXRENXV2b2V1WUtaTU5lS3U4c05Od3FicjJxK0gwbmpkMWJYRFpTeDZ5eGZx?=
 =?utf-8?B?K3RHU2hqVVA3M2FyTDlHRzU4WVgzMzZPczh5dDhYVGdLbHZOM0t4M2l4OVlX?=
 =?utf-8?B?c3FBWHh0SnZVQnkzeEJabzBIZHQzMGNYTmc2ZVFNTlh5ZEFyVGtWRUFOdFpw?=
 =?utf-8?B?a29YclllRHlpdTNyeTEzY3J6b2Y1ZkEyc0I3dnRMRTF0eGdDYTh5WlhFQldI?=
 =?utf-8?B?ZlNqQ3cxZVdXMDlJd1ZTRGMwTll1OXRNbXYzOUVqVUM5Q2pQZmcyYXVYYmZR?=
 =?utf-8?B?MWg1ZjNFa2F5QVFBaG1LWHhtU2xWd2t6RllkQnFBUTJ3dnJnL1BLd3NQZnFG?=
 =?utf-8?Q?eEbjxYZ1SzG/N3h9DXJsBDM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5898fca-b826-4387-bb3d-08d99a29c2c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2021 15:44:00.1057 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4xv9183rVwqUG3QNcOScJrrkLjxWba/wmuNs7OZjPKgj+M7riGMQ4eZetoU/KzdIArPGW/qcsR8tXe/3M6n03A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5102
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
eSwgT2N0b2JlciAxOCwgMjAyMSA2OjIzIEFNDQo+IFRvOiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBz
b25AcXVpY2luYy5jb20+OyBBbGVzc2FuZHJvIERpIEZlZGVyaWNvIDxhbGUucWVtdUByZXYubmc+
OyBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IEJyaWFuIENhaW4gPGJjYWluQHF1aWNpbmMu
Y29tPjsgYmFidXNoQHJldi5uZzsgbml6em9AcmV2Lm5nOyByaWNoYXJkLmhlbmRlcnNvbkBsaW5h
cm8ub3JnOyBBbGVzc2FuZHJvIERpIEZlZGVyaWNvIDxhbGVAcmV2Lm5nPg0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIHY2IDA3LzEyXSB0YXJnZXQvaGV4YWdvbjogcHJlcGFyZSBpbnB1dCBmb3IgdGhl
IGlkZWYtcGFyc2VyDQo+DQo+IE9uIDkvNy8yMSAxODowOSwgVGF5bG9yIFNpbXBzb24gd3JvdGU6
DQo+ICsjZGVmaW5lIGZBRERTQVQ2NChEU1QsIEEsIEIpICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcDQo+ICsgICAgX19hID0gZkNBU1Q4dShBKTsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+ICsgICAgX19iID0g
ZkNBU1Q4dShCKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcDQo+ICsgICAgX19zdW0gPSBfX2EgKyBfX2I7ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+ICsgICAgX194b3IgPSBfX2EgXiBfX2I7ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+ICsgICAg
X19tYXNrID0gZkNBU1Q4cygweDgwMDAwMDAwMDAwMDAwMDBVTEwpOyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcDQo+ICsgICAgaWYgKCgoX19hIF4gX19iKSB8IH4oX19hIF4gX19zdW0pKSAm
IF9fbWFzaykgeyAgICAgICAgICAgICAgICAgICAgICBcDQo+ICsgICAgICAgIERTVCA9IF9fc3Vt
OyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+
ICsgICAgfSBlbHNlIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcDQo+ICsgICAgICAgIERTVCA9ICgoX19zdW0gJiBfX21hc2spID4+
IDYzKSArIF9fbWFzazsgICAgICAgICAgICAgICAgICAgICAgICBcDQo+ICsgICAgICAgIGZTRVRf
T1ZFUkZMT1coKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcDQo+ICsgICAgfQ0KPiBUaGVyZSBhcmUgYSBidW5jaCBvZiB0aGVzZSB3aXRoIHByZXR0eSBj
b21wbGV4IHNlbWFudGljcy4gIFdvdWxkbid0IGl0IGJlIGVhc2llciB0byByZWNvZ25pemUgdGhl
bSBpbiB0aGUgcGFyc2VyIGFuZCBjYWxsIGEgaGFuZC13cml0dGVuIGhlbHBlcj8NCj4gDQo+IFRo
ZXNlIG1hY3JvIHJlZGVmaW5pdGlvbnMgYXJlIG5lZWRlZCB0byB3b3JrIHdpdGggdGhlIGF1dG8g
dHlwZSBzeXN0ZW0gaW4gaWRlZi1wYXJzZXIuIFdlIGNhbiBkcm9wIHRoZXNlIHNwZWNpYWxpemF0
aW9ucyBpbiB0aGUgdXBjb21pbmcgcGF0Y2hzZXQgd2hlcmUgd2UgcGFyc2UgZkhJREUgZGVjbGFy
YXRpb25zLiANCj4gSWYgd2Ugc3RpbGwgd2FudCB0byByZXNvcnQgdG8gaGVscGVycyBoZXJlLCBp
dCdzIHByb2JhYmx5IGJldHRlciB0byBleGNsdWRlIGluc3RydWN0aW9ucyB1c2luZyBmQUREU0FU
NjQgKGFuZCBzaW1pbGFyKSBkaXJlY3RseSwgYW5kIGZhbGxiYWNrIG9uIGhlbHBlcnMvb3ZlcnJp
ZGVzIGZvciB0aG9zZSBpbnN0cnVjdGlvbnMuDQoNClNvcnJ5LCBJIHdhc24ndCBjbGVhci4gIEkg
bWVhbnQgYSBoYW5kLXdyaXR0ZW4gZnVuY3Rpb24gdG8gZ2VuZXJhdGUgdGhlIFRDRyBjb2RlIC0g
bm90IGEgcWVtdSBUQ0cgaGVscGVyLg0KDQpUaGFua3MsDQpUYXlsb3INCg==

