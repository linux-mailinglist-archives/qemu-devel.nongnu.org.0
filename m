Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B55B537032F
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 23:47:07 +0200 (CEST)
Received: from localhost ([::1]:55466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcayY-0002Ko-NM
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 17:47:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lcZo4-00065E-1Y; Fri, 30 Apr 2021 16:32:12 -0400
Received: from mail-eopbgr790130.outbound.protection.outlook.com
 ([40.107.79.130]:48496 helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lcZny-0000KN-Gu; Fri, 30 Apr 2021 16:32:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fXOAm3YISGuwSoDhi1MfEtiAZ2wCnfz9WOSj9lYZpdCSkVIFjk4tAjfwQMw6zK20rfT2LGjjAFZXpyXcIzWJrHtq9gFBHGTNswYFtGWbblWIlttrzWbxHiUEOAsNb6s4IMSBuOoaO96MtuRVi1chX+d9r+F9PLWZ6uM5r/GqduVtm3RUWf5Z/D75U49v3MXiUfPqJWCAxeanFdQAOHY/25GvgPx1Fzui26W99AT9DeO/4nWfBbrkGrLwv6gwpWId/numqBBnU3Jox2G+ZFzvunrm/hPqSDdc2qlTSj7jbca76+bEUa+Xmz8hNzGgEusjOadTYFpPgzqR2IlqguBanA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ni+DSWtDI8HQAxqLwVXtMnrYkGG/FmIhMlIxb7ufwLA=;
 b=do8Hv2wsYVztSArcImtKiAGXFTngoN327VtWkGEZLsGiGvrY31lNoDCrDBKfIw1OQ8A6nrTG3HzOugjestZbwbniXWmaHFDcexUgl36KKar2M94k2zl9qQ0EAqu9r0iETV61OpYjAuy1PSAqne4HPIIisCn0RjcwESmY8gE/hajxkK+3ze+Pog14cwdGL6TC4zsVCk+XjwhuYRyMV5GSHk2WyLkk2UOfU459uCu/DH5FEsuaWd6JVDH/rHyfs5NErlrvFrb0nZI9QQrSTvh9VgR/yItO46QFLL7X3Vu0D+4APtPi+JTlULif0UrUcdORNeTYHR05mckeqwMdA9qzrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ni+DSWtDI8HQAxqLwVXtMnrYkGG/FmIhMlIxb7ufwLA=;
 b=FZ82Cny/UQgN+v6hnSfOWVcIkCFaF6RveLztFBoh5gyxToPoOLePJFunjhZ/pmIiOa2cHnAjHSvOA7qoP3X5i5SSvPSWi3+M5hPmvuKPduV+AfgUqN8iFEwGZNCliwCcMg7MYqfi+k0x5sSnwUw0KTQcMHQnQH/MzPlmoN2SObBzqsPds6Nv33oQDYjpll6o7jlrRDKUE6glZoGZKe09m+nLFd6MTBW6TZGx3NzObGZXSazVOq0I7yxnxIFJPssT7jNOW6OxsahZRN5s2GSzcJLOHdN7tEU6mpNYUdZUDCF3ouo8jKCdobT0WC1g2Eif+R6dqvRTJtfpWYBgL741KQ==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB1842.lamprd80.prod.outlook.com (2603:10d6:101:6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.30; Fri, 30 Apr
 2021 20:32:00 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::3810:ddb8:af7:cd9d]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::3810:ddb8:af7:cd9d%2]) with mapi id 15.20.4065.027; Fri, 30 Apr 2021
 20:32:00 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 25/30] target/ppc: Move ADDI, ADDIS to decodetree,
 implement PADDI
Thread-Topic: [PATCH v3 25/30] target/ppc: Move ADDI, ADDIS to decodetree,
 implement PADDI
Thread-Index: AQHXPV5k3zAZHai+oE6zYD4tIOrCjqrM6yQAgAAy3ACAAD6kgIAAEd0AgAAPE6A=
Date: Fri, 30 Apr 2021 20:32:00 +0000
Message-ID: <CP2PR80MB3668BB4E7E2F524D3BEAC18ADA5E9@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
 <20210430011543.1017113-26-richard.henderson@linaro.org>
 <CP2PR80MB3668052FF0C559D6D092B0C7DA5E9@CP2PR80MB3668.lamprd80.prod.outlook.com>
 <dbe523e8-3482-1ead-082a-7829c1551be9@linaro.org>
 <CP2PR80MB366816D43C01D14799FB3325DA5E9@CP2PR80MB3668.lamprd80.prod.outlook.com>
 <88c4159e-1272-43d7-b0c5-cbac16f8fbec@linaro.org>
In-Reply-To: <88c4159e-1272-43d7-b0c5-cbac16f8fbec@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [191.205.120.173]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bff78021-7aa8-4324-62bc-08d90c1701c7
x-ms-traffictypediagnostic: CP2PR80MB1842:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CP2PR80MB18427BA0CD08BCFEEBBAB087DA5E9@CP2PR80MB1842.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: omXRwiWlNX+JvQNOYFDWnf37vuTApLqZ39384SjwTFxYkuKMPHA7e9fpYOf+EN6AR5hJ1wNV7BL84cvOxfRlKMUpTt/yRF5SxiIuYVt6QO3aj0Y2EZ/sVXdj2B99KRN7FeAPzA863Q8RnGMNHEYI7wzYQ7yAqHOYhmv64AAIHcspoKpHwQv+CVb8zqn1BRXqqUUNdTWBYmgt8Ef8uI//WpV3kzyg0vkZ4TJxSVtA6lKd73kmNkqGCfNkzJqs5+b0VIF8SbIkEY+H5qmRGHIs5bco3VOeNnFZjANdR/UjG7mqK5ZFvDcMHjojFWPJc+PTEG29SV1HerOuCgmohgaaQdkY+jXNjTOoENUss4NUntzXjQSonQrjtq7gql8kDh22bDW6Ep+A93lkeMSLq13ZjjhT5s5jgiwwl8jNXuIUtntJQcOhanhIQu4T89tewBEV/qDM1tlIsmAiK7VRh7PthG0rjr5/9Yo6h7TFXzQjThIsxkBwh0MI3RXG3Lg5F17bmC00AuA2eMe59tdAnEKUEQN58TaO3hTkMVw5Zbj87CXgZyVZvg8+fkwgjhC7bB3sfjGqBjntPpIBiVPCkPVw2NHfC24HIZfxRmmhn8CuG5c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(376002)(136003)(346002)(39840400004)(4744005)(66556008)(2906002)(66446008)(66946007)(122000001)(38100700002)(71200400001)(86362001)(6506007)(76116006)(64756008)(316002)(66476007)(7696005)(33656002)(4326008)(53546011)(54906003)(186003)(26005)(52536014)(55016002)(8676002)(5660300002)(8936002)(478600001)(110136005)(9686003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?VVoyd0plb2U2UUZxbUpqVUJhT215U0NhT0htc1pCMTNGaWZlb3NrbUFQNDdi?=
 =?utf-8?B?UVhPd0FuMVdCTVZXUDRlWi9CQlJDQ3VFWXRoWFBmb01ZWWlrNmVMbVBUcnNV?=
 =?utf-8?B?cDNxN0diRnNJVHMrZHJKMEdTY0xTYmxWcG5kMmtxRWc4bHpVTnVzRTRScXhv?=
 =?utf-8?B?TUZlOXV4M2haV0NJb3FnK3Y3UWZUeDloaDVtTE9yalBReVFOanVkTmE0WDVt?=
 =?utf-8?B?WFVqcXp3b3dIOXRkQWhiUHZjNUJJcFdxS2pIZmdaYklvSWJaQXVDUUNkZDRU?=
 =?utf-8?B?dkx4bkFDMzJDb1pRSmRVc1hrRkRFOHR5SEk0UWhJci9oTDV0dUtyZHpNMjRY?=
 =?utf-8?B?cWdwMjBycWNtY3dUc0hacXgrdm1xU09nYXVUT1JPSVB6cGtoQ0RWTys3cE1j?=
 =?utf-8?B?UXFFZXF3UGoydkV3Mmg5RDU4ZXc5ODA2UFFaaTBGVkpTWEMwbFhZTkN1Z3cx?=
 =?utf-8?B?a0d0NWt5d1VoR0owNmtReFI5WS9vZ0JoaUhmVENKQUx5by9jR2tmM0JtZ0ln?=
 =?utf-8?B?NHFIckMxY3B3dnV4WWFDeGdqVmFmeE5rbjhKRWpBcWJXYnZLbmphMEhOZVdG?=
 =?utf-8?B?UnJkV05kV0ZiSVhjQlFnS1FPbTcwVTdOMGxJbWZEeFRnRHl3UDE0ZFh0WDVT?=
 =?utf-8?B?Zi9BY2RmWFcwdkJ5QUoxUWI4bGlHdlcyQm5xRVl4NE80YjJGN3lCOHFPcXVX?=
 =?utf-8?B?UHB5TWZzODdEMW1JdjN1M0FHbWVJYTRpYXBpbHpFVnZtQmlaVngwT3hMR25p?=
 =?utf-8?B?QlgyUlZjS2hRUnNIRTNPdWorYVkzMGZqWUJETkVwdStVQ3BpWURwN2kwSXE1?=
 =?utf-8?B?Uk1rVU5MUmRiVDByUGhnQ0JzZklSRnJCaXJ0ZmRySHVtaElRVlhhM3dmREpO?=
 =?utf-8?B?a05BNVZNL2VneFlMTmZVR1NxdEprNUErbEt3VzdtTFhzbHgwbjhZSnhTeWpB?=
 =?utf-8?B?WlU0S3dnVTVpYnRSbEU0Y2dHTVd1UFkwZUxvTnlIRFc3ZXIvWk9mV1hsdit1?=
 =?utf-8?B?OC82dWt4NVErK08wWExKWFY4SEN5V0Q3SnRMM1VwYUNzdkI5N3VyVkNES2tT?=
 =?utf-8?B?ZU5iWGxKcFhoeVZjL05ieXhDQjcrQXZwTTBXSmVtQWsrZ1FzWXZKOFhZWnow?=
 =?utf-8?B?RzRnN25WTFh3ZkJ5TEFMOEJWd3YvTDdYWWtGSjdqbWcrVWVaQ1RkQUREMml0?=
 =?utf-8?B?WVpLOHQ5ZnAxS1JEeEFWL2ZCQ2JGS3dzWTBzM0xqeSs4YjJVWUhheUYyU3dS?=
 =?utf-8?B?MUZndTJLU2hRZk5Xa0M3R20waTVGdnZDNjZsNUhPalNJZFVWSFpRYXJNSEZB?=
 =?utf-8?B?VXF1OVdKeUJvOEtJajFwckRLOTZScjRjZGFjTnBIbVlVaXhjbGNlVkY2U1Ja?=
 =?utf-8?B?ZlpoYmVWelE2L0NuWGFhdVhyNFBiNDh1NFJoQkZjUU1ESmZRRVBjdmFlUzJx?=
 =?utf-8?B?UmRzVkpKaWVpVzNaMFJQMG9XaFVVMmxBV2xTQTdqRHFjY3ptNmtZS2hnMnpa?=
 =?utf-8?B?ODAwcjNLL3BEZzE5U0hjRjV6NmxYWDFXRkdqMDhlRUUxNEFlUFhhZ3NUZC95?=
 =?utf-8?B?bkk1ZGpvVlkzZFNOSFo1QlZGaEl6a0FxVG5pTUVrSlJYMzJ6Uy9qWFRLT1dw?=
 =?utf-8?B?a3NZclU5MFJsLzZxT1JLY3BjVlhIUG8zcjQ3NlV1M2QrWFk4ejFNTGVEOWlj?=
 =?utf-8?B?RVIzOVR4cEVmbEhZcUhIaFpDbmxXREZ6YXhBS3RxRFU2ZkI2U3l3NFI2bzk1?=
 =?utf-8?Q?7u/djyyO8Iw9KMme5mPriruw+6pVf4REikkWRk4?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bff78021-7aa8-4324-62bc-08d90c1701c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2021 20:32:00.1981 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mM5f8RHwAPdbxoAnh1eoB+occBPNO92MWTkyHyD+Yf4u1GKxPvhuIN/DL7+yabw4VjoziufIsGmqwQo1pbTHww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB1842
Received-SPF: pass client-ip=40.107.79.130;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM03-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: "f4bug@amsat.org" <f4bug@amsat.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "lagarcia@br.ibm.com" <lagarcia@br.ibm.com>,
 Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+
IE9uIDQvMzAvMjEgMTE6NDUgQU0sIEx1aXMgRmVybmFuZG8gRnVqaXRhIFBpcmVzIHdyb3RlOg0K
PiA+IEkgdGhpbmsgd2UgY2FuIGFscmVhZHkgcGFzcyBtdWx0aXBsZSBmaWxlcyB0byBkZWNvZGV0
cmVlLnB5IGFuZCBpdCB3aWxsIGhhbmRsZQ0KPiB0aGVtIGNvcnJlY3RseS4gSSBqdXN0IGRpZG4n
dCBmaW5kIGEgd2F5IHRvIGRvIHRoYXQgZnJvbSB0aGUgbWVzb24gYnVpbGQgZmlsZXMsDQo+IHdo
aWNoIGFzc3VtZSBkZWNvZGV0cmVlIHdpbGwgYWx3YXlzIHVzZSBhIHNpbmdsZSBpbnB1dCBmaWxl
Lg0KPiANCj4gT2gsIHJpc2N2IGRvZXMgdGhpcyB2aWEgZXh0cmFfYXJnczouDQo+IA0KPiByfg0K
DQpUaGUgYnVpbGQgc3lzdGVtIHByb2JhYmx5IHdpbGwgZmFpbCB0byBkZXRlY3QgdGhhdCBhIHJl
YnVpbGQgaXMgbmVlZGVkIGlmIHRoZSBmaWxlIHBhc3NlZCBpbiB0aHJvdWdoIGV4dHJhX2FyZ3Mg
aXMgY2hhbmdlZCB0aG91Z2gsIHJpZ2h0Pw0K

