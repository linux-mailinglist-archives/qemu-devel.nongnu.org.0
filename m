Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEBD6AB0FD
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Mar 2023 15:19:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYpCN-0005SZ-9i; Sun, 05 Mar 2023 09:18:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Avi.Fishman@nuvoton.com>)
 id 1pYize-0002PQ-7P; Sun, 05 Mar 2023 02:41:18 -0500
Received: from mail-sgaapc01on20610.outbound.protection.outlook.com
 ([2a01:111:f400:feab::610]
 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Avi.Fishman@nuvoton.com>)
 id 1pYizb-00071H-Fa; Sun, 05 Mar 2023 02:41:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZhDIVJOY8Sn44SDX2ytMYAcLA83lmMuIkO0NdFbXVox1CN6hbYztt+hxKIpEW04fCB8qYjyu2tKgaCCMk3b7nC00Xc09qt6awV1APNgH1m+KSI0QDBorBPZPsh+9ISrzPpH+EhEwfaexieR/Ol6R0B5NsRbNyi9e8gm+lgsw78g26JXGhnXyDSgk/ebLFT/FSMALsoWRTicXTHQAqHTGafLtAfv50hHeJhRX3eiTnDCBujezop4At5rRJltl2mU1pYjPl5EzNI8Pnf5xTuOsvskO+TcELg1pAaft7KgR3X090FWRmQZj/ov1zlOvVO77ZOsVwx5iszxKPFP34Ju21g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yr1jFAjTOTchP3BY0g8Kh/TW5/cT2N4mHKQJ5djnAPU=;
 b=LHDd2BRvWWZ6NRqjz0wY6URI7kJbNIU83/0jYOgH6al/AEHY1r9D+CC5P4zGiBCXKlN5Or426Sz2vc8W/GMmNNxi4yRdoDW3oFjuT5f0XgH0W2vZod73YQ5glqxQtYnoZUaJQc/eHRNg9PgJvajvQiympW/FvoR+K4Ic/dvX2l4mS8qAZIeuPG/GBLS9XG6KLDTIqv0KEs9nSLzLSzuhC4htwAgep3Sou18UXzFaRaRhAs++bI+yLxES7uVsie2cdQ/UiYk16U8218ldzhfH7aj3+udOTR8v6D921GKU2+B7pSzRzGMt5nSsTWK2jOAj45ElnwIYZ89PmoFs5zuEfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yr1jFAjTOTchP3BY0g8Kh/TW5/cT2N4mHKQJ5djnAPU=;
 b=Y7A5v9vgwdzNjqTkc9QdbH2+yv3qGXSn1Xj0VWrgnqiRf8itYfa20cQBsy/BG8ArUcMwa7ASC7s2ds1+5EVG8rgJyZ61tpW64xXiJjmWkx5odaHfhyLTGrJ0qy5jhLTch5OiJBen8oyz+peh+PKnHuB2T2ZjyksXcPPuMBbNjNU=
Received: from TYZPR03MB5678.apcprd03.prod.outlook.com (2603:1096:400:66::9)
 by PSAPR03MB5448.apcprd03.prod.outlook.com (2603:1096:301:44::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.27; Sun, 5 Mar
 2023 07:41:02 +0000
Received: from TYZPR03MB5678.apcprd03.prod.outlook.com
 ([fe80::60f3:767f:da1a:f274]) by TYZPR03MB5678.apcprd03.prod.outlook.com
 ([fe80::60f3:767f:da1a:f274%6]) with mapi id 15.20.6156.026; Sun, 5 Mar 2023
 07:41:01 +0000
From: "Avi.Fishman@nuvoton.com" <Avi.Fishman@nuvoton.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Havard
 Skinnemoen <hskinnemoen@google.com>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>
CC: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "KFTING@nuvoton.com" <KFTING@nuvoton.com>, Alexander
 Bulekov <alxndr@bu.edu>, Shengtan Mao <stmao@google.com>, Hao Wu
 <wuhaotsh@google.com>, Chris Rauer <crauer@google.com>, "KFTING@nuvoton.com"
 <KFTING@nuvoton.com>
Subject: RE: [PATCH v9 08/14] hw/nvram: NPCM7xx OTP device model
Thread-Topic: [PATCH v9 08/14] hw/nvram: NPCM7xx OTP device model
Thread-Index: AQHWh/tuIbf7IKir1kia/cfCNjenNq5/HR4AgHI7+PA=
Date: Sun, 5 Mar 2023 07:41:01 +0000
Message-ID: <TYZPR03MB5678AF48AA1C86E4C96521A7E4B19@TYZPR03MB5678.apcprd03.prod.outlook.com>
References: <20200911052101.2602693-1-hskinnemoen@google.com>
 <20200911052101.2602693-9-hskinnemoen@google.com>
 <6ccd925d-b965-4da0-13f2-365bd75abe88@linaro.org>
In-Reply-To: <6ccd925d-b965-4da0-13f2-365bd75abe88@linaro.org>
Accept-Language: en-US, he-IL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nuvoton.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB5678:EE_|PSAPR03MB5448:EE_
x-ms-office365-filtering-correlation-id: 8013a9c2-61c9-46ad-d101-08db1d4cf79a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wf3aPFslcvW9u3ip6bl5yTvsdwBbIfrQATPqIvPGWO4wJns6cmmlwdi849kdGLhqGdOxMmZziASBXC3xb7t/iy3ZPgIWAwfd05w9JqT5ZAwgVCy1T0S0YDDrrhAIQNVWUwiBt8ROOBSt1OfXAyWLZDFHrVbzCqIBg05PLlUCsQv2dN/hNtbX1DNLf+vuSy0ZBNGSX+spvkV1a/PjpsnbqLrPEsbwFsWH9ILzoFgt6sw3E9frVdzwr6Kh/sfauoT2ogApL/HEMhUv+8PUw5CuSvOzbnbnUwF86pOxrHg6lQZmRpzxxJ1XxIuvLs6dIwdfy8eMFVYbbROCQlLhVoe/4Ti9XoDbS2ThsMu0enE+aYoAZUlK/GwLfvd5LIiji9eD8DG/nvkPv8Eax5MC1JBn88pHCxjT+rz6Ln+dluBbYkysyU9f9IB0OJM6Xg+1P2wJMCBc4lh0u3fU/MitPiQrcIUIqE4063ZGMuI9EZYbEqv2wzS4ndK4j0oBmQcQkLS3r9NxrBcahXjaJQJJNybz0ar6hw5ozV7dcT7+A+lxbbEGEv5KleMEK5wXAK5+OZ+dVl/Vsv10BynCA95oC8Vu1JM7du8aN660sRqM5+Dg7UYV8HU4Y7Prg3IwQO4VBILomztvq8RwzyqhvvQES0N52ce+fwT1ff8Y+SHdYytxrJ80fiVrHNxOKlX5vlzByqJSwB/XDt6cc+6IB5CYSCOHiQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB5678.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(396003)(366004)(39850400004)(136003)(451199018)(110136005)(54906003)(316002)(66446008)(55016003)(33656002)(86362001)(83380400001)(186003)(9686003)(2906002)(76116006)(5660300002)(8936002)(66946007)(66556008)(4326008)(8676002)(64756008)(41300700001)(478600001)(53546011)(6506007)(26005)(107886003)(66476007)(71200400001)(7696005)(122000001)(52536014)(38100700002)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eVVJSnBOb1JkcHpWazczdFVJL2Z4bGczUS9uVUt0bmZydlM1R1J4NldZYita?=
 =?utf-8?B?ek1oa2ozKzY5QUJqRFg4bFh5RGdiWVBodmlFQzNoK1hUR293UFdxWnlaclUz?=
 =?utf-8?B?OW9pV1U3YkZSay9YajJGd0tLS2JidXNZbnhubU9uS0xlZlJ4Tk40WS8reGFK?=
 =?utf-8?B?UW5WN3Z0aHZvQlVSS0dHNU16dVRYN0xVdzlFMHRuNnZsd1JRcGhtQWp3SS9O?=
 =?utf-8?B?WTNTSjgvY005d2xGckd4Q0lOaWQvZUlWZ2s4MUZmc251VjBPemdGeDNCU2Ex?=
 =?utf-8?B?N081ZGQ2cG9oTmVmZEZ0QUV4aUF6ekxxZmFSRm1Ob1oxYlFmRkNkWWI0WU9H?=
 =?utf-8?B?Z25FbHp0dFdobEN6OWdOL3d0SnRUUDAzV3RybGc5bmltZ24rOVVOTHN3dE1E?=
 =?utf-8?B?SktYbDJFYVFQUERRR3AyTVF4QnRmWUM5NmNBb2FRK0sycGxXbEpDRkhOSllp?=
 =?utf-8?B?bU5MK0ZLT1A3SmhHcm0vaXYvZFlxTmQvbU4rZmk2bDFBOUc5SDJzOU9ZSDNJ?=
 =?utf-8?B?bG5QNUxycTcvV1RWQTY5QmJnUVAwaUVsU0VBNEx4NEU1WmM5Z0VuS2VEUUtx?=
 =?utf-8?B?bnFqUFo4VXB3RzFDTFNQSk0rNXR1TVphRDAvV1FUOTF4bXYwTGV2cUFIOEJE?=
 =?utf-8?B?OUJOdHhnM3FUR2JDbTB5QTZXbGsyTEh0bUgwamV4S3RIQ2RHNFFTVmMxODZ0?=
 =?utf-8?B?RFpOVUYxVUh2NFdtdUliZE1TTCtkU1hpWVBHdVljZDBxcVVwK1ZSaHBmZ3cy?=
 =?utf-8?B?V213WE9zUERKbVRjbUwzNWxWK3BYRW90NVFTWjZNd1IzOVJEM3JFV2xIMDhS?=
 =?utf-8?B?aUtjeTltQ1ppK2granpmUndla0xCSHFjVG5jSFpQSjVja3QzMFJoblNkWFo0?=
 =?utf-8?B?ZURsU3lEOGw2SWk2ZlN2ejBvem5yTW5DWWw2NHBEaGxIZ1M3OVhFd2ZoR3Vm?=
 =?utf-8?B?Nk5SdWtHcGhDRjBHVnAxMUxlWW9tb1RmVllSWk5kYnk3L1ptSU5UbkZGVGpn?=
 =?utf-8?B?OUxEdlF5ejdFZVlUMmcvckMzbzUvRjVpcy9UOTdKY2hTYmpoNFA2SkhEYlFs?=
 =?utf-8?B?c1grS0QxSndLVlU4Mi9QNEFybFZUb0lCU29VdmJaNzJwazZDRHlwS211R0RB?=
 =?utf-8?B?MnVESVdidW1rb1dZbUZoa3dESGJER3A3WmNWcHh4VEtTdzEwV0MxbGZWdytH?=
 =?utf-8?B?ZmxRZHJmWmpFRTJlcEdVRkw0NE9ocFhwbWF1dVZCdnRqOGt4ZUlIY3kxNllj?=
 =?utf-8?B?VUhkZzNUUEkwWHVFdlhPc2JweUcvYXBuZy8reUF4M1Q2a0V5MEtkR2QxcHp1?=
 =?utf-8?B?Y2JpU2lCbGhsUmY0T0l3NjFtNFUrTEhFSTBPSXBpVUtoU1psNUdGSlY5ZDdW?=
 =?utf-8?B?aDA3OU9FSGRIODhndkpjZE1hMmRrZ0JHR1dVT1l6ZzlTSndiVzlRcXJYV0s0?=
 =?utf-8?B?S1hXemZtZUZpUDdYUXNqYSt5OW5uY2tCWWRmRG9nMzkxQ3BqcHNKNWo3c2lh?=
 =?utf-8?B?Ryswb3JKbldvYzdWT2dpQ1R4ZVVCNmFiUFE0STlzOExSQU5ublF3QXNRSEJs?=
 =?utf-8?B?TlhKenlhb0Y3amJNekxNdm0wUFZRNDNVK3hLUGZQRjlxSjJzWUlVVlZaR2lJ?=
 =?utf-8?B?YjZ3MGdTK1RhUUtnU1N6ZjlHNjhMeE5aRmNkZ0xaK0I0djJFdTdMMXdwNHo4?=
 =?utf-8?B?ZllRVGlTN2VPV1VRbGFZZ01BSDIxNFdMR2JzZjNPazJ2elJvaDAzalhqVG9i?=
 =?utf-8?B?blkwcmVJcjl6bVBENkx2OTVxM2Z3Y250ZTlOQXZyQytWRlNVdWxqNVNPWE9G?=
 =?utf-8?B?WVArcC9vanBOSlRNZVlSOG1Ib25ubldYTFNGSTcrQjdyQXB0NlJkS3NEU3Ba?=
 =?utf-8?B?WlQ5R3dodkNvVktKWE9TQ0FKbjh6ck1ldmJPaXBZRVRQR2R0ekxBV2xLZ0l6?=
 =?utf-8?B?aEZzMFVQVGEzc01GRHBIcXowSklvSkx6S0dESjI1Q1dicytmdEJCa05rbE1Q?=
 =?utf-8?B?VkdlOU4zQVVwREhFZU11LzhJV3VIbzFvOUxwS00wOXBWOWZLT2J4c21hS1Zu?=
 =?utf-8?B?NTlrTnBCUk85bmVaaG9uTzVyUGNKZEIvc3FpYi9KVmRYQndYYnZlQnlhcmkw?=
 =?utf-8?Q?f9Zp/6RXCCd5C4XCYxiDtI6w2?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5678.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8013a9c2-61c9-46ad-d101-08db1d4cf79a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2023 07:41:01.1739 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TIHpJYF42oaSgTBqzsfSba+jrEqznGTmLTZXsM93As0N5zoTVamRz+DI+hEIx6EJa4w6VtPozJjvtffUOgvP+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR03MB5448
Received-SPF: pass client-ip=2a01:111:f400:feab::610;
 envelope-from=Avi.Fishman@nuvoton.com;
 helo=APC01-SG2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 05 Mar 2023 09:18:48 -0500
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

SGksDQoNCkluc2lkZQ0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
UGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPg0KPiBTZW50OiBUaHVy
c2RheSwgRGVjZW1iZXIgMjIsIDIwMjIgNTowMyBQTQ0KPiBUbzogSGF2YXJkIFNraW5uZW1vZW4g
PGhza2lubmVtb2VuQGdvb2dsZS5jb20+OyBwZXRlci5tYXlkZWxsQGxpbmFyby5vcmcNCj4gQ2M6
IHFlbXUtYXJtQG5vbmdudS5vcmc7IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgSVMyMCBBdmkgRmlz
aG1hbg0KPiA8QXZpLkZpc2htYW5AbnV2b3Rvbi5jb20+OyBDUzIwIEtGVGluZyA8S0ZUSU5HQG51
dm90b24uY29tPjsgQWxleGFuZGVyDQo+IEJ1bGVrb3YgPGFseG5kckBidS5lZHU+OyBTaGVuZ3Rh
biBNYW8gPHN0bWFvQGdvb2dsZS5jb20+OyBIYW8gV3UNCj4gPHd1aGFvdHNoQGdvb2dsZS5jb20+
OyBDaHJpcyBSYXVlciA8Y3JhdWVyQGdvb2dsZS5jb20+OyBDUzIwIEtGVGluZw0KPiA8S0ZUSU5H
QG51dm90b24uY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY5IDA4LzE0XSBody9udnJhbTog
TlBDTTd4eCBPVFAgZGV2aWNlIG1vZGVsDQo+DQo+IEhpLA0KPg0KPiAob2xkIHBhdGNoKQ0KPg0K
PiBPbiAxMS85LzIwIDA3OjIwLCBIYXZhcmQgU2tpbm5lbW9lbiB3cm90ZToNCj4gPiBUaGlzIHN1
cHBvcnRzIHJlYWRpbmcgYW5kIHdyaXRpbmcgT1RQIGZ1c2VzIGFuZCBrZXlzLiBPbmx5IGZ1c2Ug
cmVhZGluZw0KPiA+IGhhcyBiZWVuIHRlc3RlZC4gUHJvdGVjdGlvbiBpcyBub3QgaW1wbGVtZW50
ZWQuDQo+ID4NCj4gPiBSZXZpZXdlZC1ieTogQXZpIEZpc2htYW4gPGF2aS5maXNobWFuQG51dm90
b24uY29tPg0KPiA+IFJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8ZjRidWdA
YW1zYXQub3JnPg0KPiA+IFRlc3RlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVn
QGFtc2F0Lm9yZz4NCj4gPiBUZXN0ZWQtYnk6IEFsZXhhbmRlciBCdWxla292IDxhbHhuZHJAYnUu
ZWR1Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IEhhdmFyZCBTa2lubmVtb2VuIDxoc2tpbm5lbW9lbkBn
b29nbGUuY29tPg0KPiA+IC0tLQ0KPiA+ICAgaW5jbHVkZS9ody9hcm0vbnBjbTd4eC5oICAgICAg
IHwgICAzICsNCj4gPiAgIGluY2x1ZGUvaHcvbnZyYW0vbnBjbTd4eF9vdHAuaCB8ICA3OSArKysr
KysNCj4gPiAgIGh3L2FybS9ucGNtN3h4LmMgICAgICAgICAgICAgICB8ICAyOSArKysNCj4gPiAg
IGh3L252cmFtL25wY203eHhfb3RwLmMgICAgICAgICB8IDQ0MCArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysNCj4gPiAgIGh3L252cmFtL21lc29uLmJ1aWxkICAgICAgICAgICB8ICAg
MSArDQo+ID4gICA1IGZpbGVzIGNoYW5nZWQsIDU1MiBpbnNlcnRpb25zKCspDQo+ID4gICBjcmVh
dGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9ody9udnJhbS9ucGNtN3h4X290cC5oDQo+ID4gICBjcmVh
dGUgbW9kZSAxMDA2NDQgaHcvbnZyYW0vbnBjbTd4eF9vdHAuYw0KPg0KPiA+ICsvKioNCj4gPiAr
ICogbnBjbTd4eF9vdHBfYXJyYXlfd3JpdGUgLSBFQ0MgZW5jb2RlIGFuZCB3cml0ZSBkYXRhIHRv
IE9UUCBhcnJheS4NCj4gPiArICogQHM6IE9UUCBtb2R1bGUuDQo+ID4gKyAqIEBkYXRhOiBEYXRh
IHRvIGJlIGVuY29kZWQgYW5kIHdyaXR0ZW4uDQo+ID4gKyAqIEBvZmZzZXQ6IE9mZnNldCBvZiBm
aXJzdCBieXRlIHRvIGJlIHdyaXR0ZW4gaW4gdGhlIE9UUCBhcnJheS4NCj4gPiArICogQGxlbjog
TnVtYmVyIG9mIGJ5dGVzIGJlZm9yZSBFQ0MgZW5jb2RpbmcuDQo+ID4gKyAqDQo+ID4gKyAqIEVh
Y2ggbmliYmxlIG9mIGRhdGEgaXMgZW5jb2RlZCBpbnRvIGEgYnl0ZSwgc28gdGhlIG51bWJlciBv
ZiBieXRlcyB3cml0dGVuDQo+ID4gKyAqIHRvIHRoZSBhcnJheSB3aWxsIGJlIEBsZW4gKiAyLg0K
PiA+ICsgKi8NCj4gPiArZXh0ZXJuIHZvaWQgbnBjbTd4eF9vdHBfYXJyYXlfd3JpdGUoTlBDTTd4
eE9UUFN0YXRlICpzLCBjb25zdCB2b2lkDQo+ICpkYXRhLA0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgb2Zmc2V0LCB1bnNpZ25lZCBpbnQgbGVu
KTsNCj4NCj4gPiArc3RhdGljIHZvaWQgbnBjbTd4eF9pbml0X2Z1c2VzKE5QQ003eHhTdGF0ZSAq
cykNCj4gPiArew0KPiA+ICsgICAgTlBDTTd4eENsYXNzICpuYyA9IE5QQ003WFhfR0VUX0NMQVNT
KHMpOw0KPiA+ICsgICAgdWludDMyX3QgdmFsdWU7DQo+ID4gKw0KPiA+ICsgICAgLyoNCj4gPiAr
ICAgICAqIFRoZSBpbml0aWFsIG1hc2sgb2YgZGlzYWJsZWQgbW9kdWxlcyBpbmRpY2F0ZXMgdGhl
IGNoaXAgZGVyaXZhdGl2ZSAoZS5nLg0KPiA+ICsgICAgICogTlBDTTc1MCBvciBOUENNNzMwKS4N
Cj4gPiArICAgICAqLw0KPiA+ICsgICAgdmFsdWUgPSB0c3dhcDMyKG5jLT5kaXNhYmxlZF9tb2R1
bGVzKTsNCj4NCj4gSW4gd2hpY2ggZW5kaWFubmVzcyBkbyB5b3Ugd2FudCB0aGlzIDMyLWJpdCBm
dXNlIHZhbHVlIHRvIGJlIHdyaXR0ZW4/DQoNCkl0IHNob3VsZCBiZSBsaXR0bGUgZW5kaWFuLCBJ
IGFtIG5vdCBzdXJlIHdoeSB0aGVyZSBpcyBhIHN3YXAgaGVyZS4NClVubGVzcyB0aGUgbmMtPmRp
c2FibGVkX21vZHVsZXMgZm9yIHNvbWUgcmVhc29uIGlzIGNvbWluZyBzd2FwcGVkIHNvIHdlIHN3
YXAgaXQgYmFjay4NCg0KPg0KPiBJIHN1cHBvc2UgeW91IHVzZWQgYSBsaXR0bGUtZW5kaWFuIGhv
c3QsIHNvIHdlIHdhbnQgaXQgYmlnLWVuZGlhbiBpbg0KPiB0aGUgT1RQPyBJbiB0aGF0IGNhc2Ug
aXQgd291bGQgYmUgYmV0dGVyIHRvIHVzZSBjcHVfdG9fYmUzMigpLCB0bw0KPiBiZSBhYmxlIHRv
IHVzZSB0aGUgT1RQIG9uIGEgYmlnLWVuZGlhbiBob3N0IHN1Y2ggczM5MHguDQoNClNvIGFjY29y
ZGluZyB0byB3aGF0IEkgc2FpZCB0aGVuIHVzZSBjcHVfdG9fbGUzMigpDQoNCj4NCj4gPiArICAg
IG5wY203eHhfb3RwX2FycmF5X3dyaXRlKCZzLT5mdXNlX2FycmF5LCAmdmFsdWUsDQo+IE5QQ003
WFhfRlVTRV9ERVJJVkFUSVZFLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6
ZW9mKHZhbHVlKSk7DQo+ID4gK30NCj4NCj4gRm9yIGNvbXBsZXRlbmVzczoNCj4NCj4gID4gK3N0
YXRpYyB2b2lkIG5wY203MzBfY2xhc3NfaW5pdChPYmplY3RDbGFzcyAqb2MsIHZvaWQgKmRhdGEp
DQo+ICA+ICt7DQo+ICA+ICsgICAgTlBDTTd4eENsYXNzICpuYyA9IE5QQ003WFhfQ0xBU1Mob2Mp
Ow0KPiAgPiArDQo+ICA+ICsgICAgLyogTlBDTTczMCBpcyBvcHRpbWl6ZWQgZm9yIGRhdGEgY2Vu
dGVyIHVzZSwgc28gbm8gZ3JhcGhpY3MsIGV0Yy4gKi8NCj4gID4gKyAgICBuYy0+ZGlzYWJsZWRf
bW9kdWxlcyA9IDB4MDAzMDAzOTU7DQo+ICA+ICsgICAgbmMtPm51bV9jcHVzID0gMjsNCj4gID4g
K30NCj4gID4gKw0KPiAgPiArc3RhdGljIHZvaWQgbnBjbTc1MF9jbGFzc19pbml0KE9iamVjdENs
YXNzICpvYywgdm9pZCAqZGF0YSkNCj4gID4gK3sNCj4gID4gKyAgICBOUENNN3h4Q2xhc3MgKm5j
ID0gTlBDTTdYWF9DTEFTUyhvYyk7DQo+ICA+ICsNCj4gID4gKyAgICAvKiBOUENNNzUwIGhhcyAy
IGNvcmVzIGFuZCBhIGZ1bGwgc2V0IG9mIHBlcmlwaGVyYWxzICovDQo+ICA+ICsgICAgbmMtPmRp
c2FibGVkX21vZHVsZXMgPSAweDAwMDAwMDAwOw0KPiAgPiArICAgIG5jLT5udW1fY3B1cyA9IDI7
DQo+ICA+ICt9DQo+DQo+IFRoYW5rcywNCj4NCj4gUGhpbC4NCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KIFRoZSBwcml2
aWxlZ2VkIGNvbmZpZGVudGlhbCBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlbWFpbCBp
cyBpbnRlbmRlZCBmb3IgdXNlIG9ubHkgYnkgdGhlIGFkZHJlc3NlZXMgYXMgaW5kaWNhdGVkIGJ5
IHRoZSBvcmlnaW5hbCBzZW5kZXIgb2YgdGhpcyBlbWFpbC4gSWYgeW91IGFyZSBub3QgdGhlIGFk
ZHJlc3NlZSBpbmRpY2F0ZWQgaW4gdGhpcyBlbWFpbCBvciBhcmUgbm90IHJlc3BvbnNpYmxlIGZv
ciBkZWxpdmVyeSBvZiB0aGUgZW1haWwgdG8gc3VjaCBhIHBlcnNvbiwgcGxlYXNlIGtpbmRseSBy
ZXBseSB0byB0aGUgc2VuZGVyIGluZGljYXRpbmcgdGhpcyBmYWN0IGFuZCBkZWxldGUgYWxsIGNv
cGllcyBvZiBpdCBmcm9tIHlvdXIgY29tcHV0ZXIgYW5kIG5ldHdvcmsgc2VydmVyIGltbWVkaWF0
ZWx5LiBZb3VyIGNvb3BlcmF0aW9uIGlzIGhpZ2hseSBhcHByZWNpYXRlZC4gSXQgaXMgYWR2aXNl
ZCB0aGF0IGFueSB1bmF1dGhvcml6ZWQgdXNlIG9mIGNvbmZpZGVudGlhbCBpbmZvcm1hdGlvbiBv
ZiBOdXZvdG9uIGlzIHN0cmljdGx5IHByb2hpYml0ZWQ7IGFuZCBhbnkgaW5mb3JtYXRpb24gaW4g
dGhpcyBlbWFpbCBpcnJlbGV2YW50IHRvIHRoZSBvZmZpY2lhbCBidXNpbmVzcyBvZiBOdXZvdG9u
IHNoYWxsIGJlIGRlZW1lZCBhcyBuZWl0aGVyIGdpdmVuIG5vciBlbmRvcnNlZCBieSBOdXZvdG9u
Lg0K

