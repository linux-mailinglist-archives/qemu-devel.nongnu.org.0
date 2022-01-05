Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 198C048558B
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 16:13:51 +0100 (CET)
Received: from localhost ([::1]:46150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n57z4-0003aS-7o
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 10:13:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad.schwarz@siemens.com>)
 id 1n56u2-00022D-Lk
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:04:36 -0500
Received: from [2a01:111:f400:fe08::61e] (port=9121
 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad.schwarz@siemens.com>)
 id 1n56tz-0000NV-RV
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:04:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kSCNYSvKGqOZNWZUf/gew9EQIvyjYZqu0u7TFIG/gy7YylRzs+vhsJYUMaYUTU5LEtrD8xjvtlnDOQKAab3zkxIs0WDtDWtOuOQEAu7tp93VN16bRVgEpR5WUpJznpS438/dw7XoI4o9rtuFZF6tHggxHdaKKx6pKLMISm1z89AssR88/ZXz1JyQqq6RmJYCCg4VCeENsCg2PDpJdCrCW5Du5DY2AApeXLHtpTuuAunlLg6uHmf2i1c8GM9+g08Vk7R70Fff2grMsN0WTDZR1vgVUKOkTsozh9h1fCgG7KJAmqvEsiNCPKMMQd1qxlJbLThKmoPa7SLU9mQsNLrsOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ubSI6oECSu7v/DH6Nw1NC6MiNSsTy2HayHC0KOHa7l8=;
 b=F9CHLihIhCPRBP/DXuTk+jern666rqg0JODQAHPGgrRo/0V9PT6LwvIouvd02g5XrP/mIbhuWGKAJPUF8L2HJp1zdpCRewt3M4D2BgRH6r+mdJ6c8EilgYUZgdHCY0TLbysSm8QvN4R0dTSMzSEfrhr5u0ONq0x8aKhx05Bm3z/h+2UNt6EvLd/Ta26/sZ+bGRZ2JN6EDG3NXCywVB+29A6pxQ2xWJSDkvl0X8luylzPnTOPPT5GmUMPMnZXto4h0HzzgLyVXfG47gkSjBtmDbWFoFUWkowKyksD5Ac7hw168tIFao3yDoWcUC7WlSpfD8mg5glk7MXZueWgn6jjJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.70) smtp.rcpttodomain=linaro.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubSI6oECSu7v/DH6Nw1NC6MiNSsTy2HayHC0KOHa7l8=;
 b=UduFD32YZuw4djN+xTxTrNsH4RZKF2HffIOwDOxL2y0yc9Qs2/AA/82DvyQPTfu4F7n61jrRNnPO5LZEm2kmNjs3lFqOd+5lQ2G325XtfJqsHQ52DVNbvtj8NGmlOf4jd+VABm4xfWazvLlZ367Spy6MNL6bzkV5xcnHwwm+zJ927J1QtY8ciVKfka5fLDbrC7FDf2IIRnm6MHBSt8DK3xlaU+Dyz5EFMUxHWhBEuSrmOAAji+9rEkA/7afv8NxvyW8TCAP2rGqQQ4m++yRMhdTkkw4WpkbhfQcYC4EJxm8bD0aenVwEuLd/XGq3obRJxJDYz8Byh+N3KURFt3b1tg==
Received: from DB8PR06CA0045.eurprd06.prod.outlook.com (2603:10a6:10:120::19)
 by AM7PR10MB3953.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:17a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Wed, 5 Jan
 2022 14:04:29 +0000
Received: from DB5EUR01FT008.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::59) by DB8PR06CA0045.outlook.office365.com
 (2603:10a6:10:120::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9 via Frontend
 Transport; Wed, 5 Jan 2022 14:04:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.70)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.70 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.70; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.70) by
 DB5EUR01FT008.mail.protection.outlook.com (10.152.4.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4867.7 via Frontend Transport; Wed, 5 Jan 2022 14:04:28 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SJA.ad011.siemens.net (194.138.21.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 5 Jan 2022 15:04:28 +0100
Received: from DEMCHDC8A1A.ad011.siemens.net (139.25.226.107) by
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 5 Jan 2022 15:04:28 +0100
Received: from DEMCHDC8A1A.ad011.siemens.net ([139.25.226.107]) by
 DEMCHDC8A1A.ad011.siemens.net ([139.25.226.107]) with mapi id 15.01.2375.017; 
 Wed, 5 Jan 2022 15:04:28 +0100
From: "Schwarz, Konrad" <konrad.schwarz@siemens.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 4/5] RISC-V: Typed CSRs in gdbserver
Thread-Topic: [PATCH v2 4/5] RISC-V: Typed CSRs in gdbserver
Thread-Index: AQHYAYMLR0Cx5EhjlkWmNt5NhqkcMqxTakAAgAECZsA=
Date: Wed, 5 Jan 2022 14:04:28 +0000
Message-ID: <395769321dbe459d803ba78f610eaf3a@siemens.com>
References: <00a79b65-288f-f17c-abe4-fcfd3f7971fd@oth-regensburg.de>
 <cover.1641309725.git.konrad.schwarz@siemens.com>
 <79194a3cf9e3bd1df41401eeee901055b8702c7b.1641309725.git.konrad.schwarz@siemens.com>
 <676fcd9a-4a1a-2c03-e0c6-60128e3a50ae@linaro.org>
In-Reply-To: <676fcd9a-4a1a-2c03-e0c6-60128e3a50ae@linaro.org>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Enabled=true;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SetDate=2022-01-05T14:04:26Z; 
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Method=Standard;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Name=restricted-default;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ActionId=c6cbe89a-cb9d-4ef6-b1fd-b6aa664d747f;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ContentBits=0
document_confidentiality: Restricted
x-originating-ip: [139.21.146.198]
x-tm-as-product-ver: SMEX-14.0.0.3080-8.6.1018-26634.007
x-tm-as-result: No-10--29.368800-8.000000
x-tmase-matchedrid: grK+ChACArxwWrhivu9rXtplUyIIewbxuV9eQHCYbHq2DJSILb1B3rd2
 noO4P7rALraGNlLRahhWJOj8+CA/ZTIv6glLPaiEqqGGr3Gpn/wzPQQUbmWdb/ZvT2zYoYOwnaX
 53Dhf9FmjEIt+uIPPOCQslbaUcprMezW3C9PhuibvdEEr3Wzllza7IBuOPthE/1dEgwtQ6NDQxD
 D776KHLyj/QypfrgU3sPtu/C+zB0wd9tEMPbjBfwuxttHI0O0jmOB2bikpqTB08zy97KsgJoD9w
 87C9woFPHMAbjuhwd8LHILfupNIi1i313O1VUyqaa0HnIXpUiFMRwlRYQdMcEI4eS9mV4/sWDLa
 jM22ETaHX0cDZiY+DQYxJykfuo4AS4SaOqWD0Xztwv7gBnnLWTsr+6lvFGly40jcxy3aXNp/qIL
 R82ilmYICAkPlCyv9wSCOcG7rlnA2R1mCrrDhjBEnT8ijtFbxR3zc6tTt+37+f4FZ/m1AzEi2QX
 VfwItR/gMNehoKqTtWrfO5pvBIuR/xxXlS39uxefTHqxypj9NCGIgCZZL0TRlJRfzNw8afpy2V7
 V+tlpuYOwuneqUOstOiGFjeqLkCKMZAssYykfPu+IQqSgQNXlTNH/IEdCNm9FQh3flUIh7csoeq
 //bbGHtTo0P1ssT+5z25NZlW0T2HwkbffFsyjo9Ujh6sh46jnZzvVk+DCht+NQIFduF53zOGJnH
 ou443GHqWZ2CQ0OU7fYp0EcoCTA3NAJVjd+/OKsS+56gpTfNfUcGksU6p5olSWYvdSPSYcV3n4J
 /0zUOLOlwAEWRz3cYPT827NXwL+SihPPY9VI9ftuJwrFEhTbew1twePJJB3QfwsVk0Ubv+efAnn
 ZBiLyF6bSSak9kx
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--29.368800-8.000000
x-tmase-version: SMEX-14.0.0.3080-8.6.1018-26634.007
x-tm-snts-smtp: 811111DBAE6077D4B407F4FB7708421649D58E69BB78C90A3485E8606C378B182000:8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3aa8dff-e5d9-43df-352e-08d9d0544a32
X-MS-TrafficTypeDiagnostic: AM7PR10MB3953:EE_
X-Microsoft-Antispam-PRVS: <AM7PR10MB3953467F9AB9691F070B74D28A4B9@AM7PR10MB3953.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3om2sPCQITxrjh2eF819VWD9eZgj9xnfjMB5uXfjCTa6xZRHQt2JboDsyLi20rGt2yqxeYJCukO5p3LYUq5le01ejBbT9AXKCX4oD4Uf7fGSKYN/SZsJ9rPlqlavszzmNfB2USon0S7EsCZJ7+3AUJfquV9zFKkQi3665jw7WAUKA9F3ykhlCsp7DKAaioTNUWBgJUFXOPri4XOqZpJkQDToJUK5X7+X65PRWr4IV59Y8KA4K6a02eXn6eQa2pVqPQ9/iIjuUTxz97O4HSY6pC78inNcdRr4tdmaD3KPZ1znE5Z3JeFeuIZ11pYf6iqOtwHwD3NXXcT6mKkgVL5Jkvh6bDBeNMNABxGxYTLODefki7nv+1Zo3Q9DtIa/o4e8PhazC7mD+H3VqiOVe65RIcgVpPb6u0tkSycztF/Hwaq3IPpPtKqdbgn0NjToDbn2Dq52uWoaLHZUmgcxJgdwxBQakHBYISOlIo89r9FfrauG4i7mFTfP+4JJivp0qKUmgeXkN4nVW1uynhEYAXSsoCw9T5bjm8UdUw+lLTNP7f5bme5T0gGn27+bOvShTbZM6Etfg0ba2qywfg5xC1LTDyxfV7x+4y8lFMwHAkKvsQ2gM1PUrS/mpQLeO4eXZ2lcZ2CAlaSd0xXVtZCAtMcl0gSvMhd+WBRCfrwFb1BJzVptl4gYspv5GeVzL2z8R/mKqLmunwVgDckuh2TgPOu6g4ooJAjwmaqnClWvf8q4hVzRSIQ65MwtOyNOW9qGT4lWXxADbq+dZDhpsGdWPO887A==
X-Forefront-Antispam-Report: CIP:194.138.21.70; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:hybrid.siemens.com; PTR:hybrid.siemens.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700002)(8936002)(54906003)(2616005)(8676002)(186003)(24736004)(336012)(53546011)(36860700001)(83380400001)(7596003)(4326008)(26005)(108616005)(508600001)(7636003)(5660300002)(47076005)(316002)(70586007)(2906002)(70206006)(956004)(36756003)(110136005)(86362001)(40460700001)(82960400001)(82310400004)(356005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 14:04:28.9541 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3aa8dff-e5d9-43df-352e-08d9d0544a32
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a; Ip=[194.138.21.70];
 Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT008.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3953
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe08::61e
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe08::61e;
 envelope-from=konrad.schwarz@siemens.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5k
ZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFdlZG5lc2RheSwg
SmFudWFyeSA1LCAyMDIyIDA6MDINCj4gVG86IFNjaHdhcnosIEtvbnJhZCAoVCBDRUQgU0VTLURF
KSA8a29ucmFkLnNjaHdhcnpAc2llbWVucy5jb20+OyBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4g
Q2M6IEFsaXN0YWlyIEZyYW5jaXMgPGFsaXN0YWlyLmZyYW5jaXNAd2RjLmNvbT47IEJpbiBNZW5n
IDxiaW4ubWVuZ0B3aW5kcml2ZXIuY29tPjsgUGFsbWVyIERhYmJlbHQNCj4gPHBhbG1lckBkYWJi
ZWx0LmNvbT47IFJhbGYgUmFtc2F1ZXIgPHJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU+
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgNC81XSBSSVNDLVY6IFR5cGVkIENTUnMgaW4gZ2Ri
c2VydmVyDQo+IA0KPiBPbiAxLzQvMjIgNzo1MSBBTSwgS29ucmFkIFNjaHdhcnogd3JvdGU6DQo+
ID4gKysrIGIvdGFyZ2V0L3Jpc2N2L2NzcjMyLW9wLWdkYnNlcnZlci5oDQo+IC4uLg0KPiA+ICsr
KyBiL3RhcmdldC9yaXNjdi9jc3I2NC1vcC1nZGJzZXJ2ZXIuaA0KPiANCj4gVGhlcmUgaXMgYSAq
bG90KiBvZiBvdmVybGFwIGJldHdlZW4gdGhlc2UgdHdvIGZpbGVzLg0KPiBXaHkgbm90IGFkZCB0
aGlzIGRhdGEgdG8gdGhlIG1haW4gY3NyX29wcyBhcnJheT8NCj4gVGhhdCB3b3VsZCBwdXQgYWxs
IHRoZSBpbmZvIGZvciBlYWNoIGNzciBpbiBvbmUgcGxhY2UuDQoNClNvIHRoZSBwcm9ibGVtIGlz
IHRoYXQgdGhlc2UgZmlsZXMgYXJlIGdlbmVyYXRlZCAtLSBzb21ld2hhdCBpcm9uaWNhbGx5DQp2
aWEgWFNMVCBmcm9tIGNvbXBsZXRlIEdEQiB0YXJnZXQgZGVzY3JpcHRpb25zLCB3aGljaCBhcmUg
dGhlbXNlbHZlcw0KZ2VuZXJhdGVkIGZyb20gYSBtaXh0dXJlIG9mIEFXSyBhbmQgc2hlbGwgc2Ny
aXB0cyB0aGF0IEkgaGF2ZSBpbiBhDQpkaWZmZXJlbnQgcHJvamVjdCBhbmQgd2hpY2ggeW91IHdv
dWxkIHByb2JhYmx5IG5vdCB3YW50IHRvIGhhdmUNCmNvbnRyaWJ1dGVkLiAgVGhvc2Ugc2NyaXB0
cyBnZW5lcmF0ZSBhIHZhcmlldHkgb2Ygb3RoZXIgZGVmaW5pdGlvbnMNCmZvciBDIGFuZCBhc3Nl
bWJseSBiZXNpZGVzIHRoZSBHREIgWE1MIHRhcmdldCBkZXNjcmlwdGlvbnMsIHNvIHdvdWxkDQpw
cm9iYWJseSBuZWVkIHRvIGJlIHJlZHVjZWQgZm9yIGp1c3QgUUVNVSB1c2FnZS4NCg0KSSBkaWQg
YWN0dWFsbHkgb3JpZ2luYWxseSBhZGQgdGhlIGRhdGEgZGlyZWN0bHkgdG8gdGhlIGNzcl9vcHMg
YXJyYXkuDQpCZWNhdXNlIG9mIHRoZSBsYXJnZSBudW1iZXIgb2YgQ1NScyBhbmQgdGhlIGdlbmVy
YXRpb25hbCBhc3BlY3QsDQppdCB3YXMgaW5mZWFzaWJsZSAoZm9yIG1lIGF0IGxlYXN0KSB0byBj
cmVhdGUgYW4gZWRpdGluZyBtZXJnZSBzY3JpcHQgdG8NCmludGVybWluZ2xlIHRoZSBleGlzdGlu
ZyBkZWZpbml0aW9ucyBhbmQgdGhlIG5ldyBkYXRhLiAgSSB0cmllZCB0bw0Kd29yayBhcm91bmQg
dGhpcyBieSB1c2luZyBDOTkncyBkZXNpZ25hdGVkIGluaXRpYWxpemVyIHN5bnRheCwNCmFkZGlu
ZyBpbiB0aGUgbmV3IGRhdGEgYXQgdGhlIGVuZCBvZiB0aGUgdGFibGUsIGFuZCB1c2luZyBzcGVj
aWZpYw0KZW5vdWdoIGluaXRpYWxpemVycyB0byBub3QgZGlzdHVyYiB0aGUgZXhpc3RpbmcgZGF0
YS4NCg0KSG93ZXZlciwgdGhpcyBkaWQgbm90IHdvcmsgb3V0OiBkZXNwaXRlIHVzaW5nIHZlcnkg
c3BlY2lmaWMgaW5pdGlhbGl6ZXJzLA0KdGhlIHByZXZpb3VzbHkgaW5pdGlhbGl6ZWQgQ1NSIHN0
cnVjdHVyZXMgaW4gdGhlIGNzcl9vcHMgYXJyYXkNCndlcmUgcmVzZXQgdG8gdGhlaXIgZGVmYXVs
dCB2YWx1ZXMsIGkuZS4sIDAsIGJyZWFraW5nIHRoZSBjb2RlLg0KVGhpcyB3YXMgbm90IHRoZSB3
YXkgSSBleHBlY3RlZCB0aGlzIGZlYXR1cmUgdG8gd29yayBpbiBDOTkgYW5kDQpteSByZWFkaW5n
IG9mIHRoZSBDOTkgc3RhbmRhcmQgZG9lcyBub3Qgc3VwcG9ydCB0aGlzIGVpdGhlci4gIEJ1dA0K
dGhhdOKAmXMgd2hhdCBHQ0MgZG9lcywgYXQgbGVhc3Qgb24gbXkgbWFjaGluZS4NCg0KVGhpcyBp
cyBhbHNvIHRoZSByZWFzb24gdGhlIG92ZXJsYXAgaXMgbm90IGhhbmRsZWQgbW9yZSBlbGVnYW50
bHk6DQpHREIgdGFyZ2V0IGRlc2NyaXB0aW9uIFhNTCBkb2Vzbid0IHN1cHBvcnQgYWx0ZXJuYXRl
cyBmb3IgZGlmZmVyZW50DQptYWNoaW5lIHdvcmQgbGVuZ3RocyBhbmQgc28gSSBsb3NlIHRoYXQg
aW5mb3JtYXRpb24gd2hlbiB0cmFuc2Zvcm1pbmcNCmZyb20gdGhlIDY0IGFuZCAzMi1iaXQgdGFy
Z2V0IGRlc2NyaXB0aW9uIHNvdXJjZXMuDQogDQo+ID4gKyAgW0NTUl9DWUNMRV0geyAuZ2RiX3R5
cGUgPSAidWludDY0IiwgLmdkYl9ncm91cCA9ICJ1c2VyIiB9LA0KPiANCj4gSSB0aGluayB5b3Ug
c2hvdWxkIGJlIGFibGUgdG8gdXNlICJ1bnNpZ25lZCBsb25nIiBhcyBhIHByb3h5IGZvciB0aGUg
bmF0aXZlIHJlZ2lzdGVyIHNpemUuDQoNCmB1bnNpZ25lZCBsb25nJyBpcyBub3QgbGlzdGVkIGlu
IHNlY3Rpb24gYEcuMyBQcmVkZWZpbmVkIFRhcmdldCBUeXBlcycNCm9mIHRoZSBHREIgbWFudWFs
Lg0KDQpJIGFsc28gaGF2ZSB0byBzYXkgdGhhdCBHREIgZG9lcyBub3QgaGFuZGxlIHRoZSB0YXJn
ZXQgZGVzY3JpcHRpb25zDQpjb3JyZWN0bHkgaW4gYWxsIGNhc2VzLiAgSW4gcGFydGljdWxhciwg
SSBzdXNwZWN0IGEgYnVnIHdoZW4NCmEgZmllbGQgY3Jvc3NlcyBhIDMyLWJpdCBib3VuZGFyeTog
R0RCIGlzIHNob3dpbmcgdHdpY2UgdGhlDQpmaWVsZCB2YWx1ZS4gIEknbSBwcmV0dHkgc3VyZSBt
eSB0YXJnZXQgZGVzY3JpcHRpb24gaXMgY29ycmVjdA0KZm9yIHRoaXMgY2FzZSwgSSd2ZSByZWNo
ZWNrZWQgc2V2ZXJhbCB0aW1lcy4gIEFsc28sIEdEQg0KaXMgbm90IHBpY2tpbmcgdXAgYWxsIG9m
IHRoZSBuZXcgQ1NScyBmb3Igc29tZSByZWFzb24sIGJ1dA0KSSdtIHN1cmUgaXMgcmVhZGluZyB0
aGUgdGFyZ2V0IGRlc2NyaXB0aW9uIGZyb20gUUVNVS4NCg0KU2luY2UgdGFyZ2V0IGRlc2NyaXB0
aW9ucyBhcmUgcmFyZSBpbiBwcmFjdGljZSwgYSBidWcgd291bGQNCm5vdCBzdXJwcmlzZSBtZTsg
Zm9yIGV4YW1wbGUsIHRoZSBEVEQgZm9yIHRhcmdldCBkZXNjcmlwdGlvbnMNCnN1cHBsaWVkIHdp
dGggR0RCIGlzIHdyb25nOiBpdCBpcyBtaXNzaW5nIHRoZSBgZW51bScgZWxlbWVudA0KKHdoaWNo
IHdhcyBwcm9iYWJseSBhZGRlZCBsYXRlcikgYW5kIHRoZSB4c2k6aW5jbHVkZSBlbGVtZW50Lg0K
DQpVbHRpbWF0ZWx5LCB0aGlzIGlzIGEgY2hpY2tlbiBhbmQgZWdnIHByb2JsZW06IGJ1Z3MgaW4g
R0RCIGNhbg0Kb25seSBiZSBmbHVzaGVkIG91dCBpZiBpdCBnZXRzIGludGVyZXN0aW5nDQp0YXJn
ZXQgZGVzY3JpcHRpb25zIHRvIHJlYWQuDQoNCj4gDQo+ID4gK2NoYXIgY29uc3QgcmlzY3ZfZ2Ri
X2Nzcl90eXBlc1tdID0NCj4gPiArI2lmZGVmIFRBUkdFVF9SSVNDVjMyDQo+IC4uLg0KPiA+ICsj
ZWxpZiBkZWZpbmVkIFRBUkdFVF9SSVNDVjY0DQo+IC4uLg0KPiA+ICsjIGVuZGlmDQo+ID4gKzsN
Cj4gDQo+IElkZWFsbHkgd2Ugc2hvdWxkbid0IHVzZSBpZmRlZnMgZm9yIHRoaXMgLS0gd2Ugc2hv
dWxkIGNob29zZSBvbmUgb3IgdGhlIG90aGVyIGRlcGVuZGluZyBvbg0KPiB0aGUgc3RhcnR1cCBl
bnYtPm1pc2FfbXhsX21heC4gIFdlIGFyZSBzdGlsbCB1c2luZyBhbiBpZmRlZiBmb3IgdGhlIG1h
aW4NCj4gcmlzY3YtKi12aXJ0dWFsLnhtbCwgYnV0IHRoYXQgY291bGQgYmUgY29uc2lkZXJlZCBh
IGJ1ZyB0byBmaXguDQoNCkFzIEkgd3JvdGUgQWxpc3RhaXIsIEknbSBub3Qgc3VyZSB0aGlzIHJl
YXNvbmluZyBpcyBjb3JyZWN0LiAgRXZlbiBpZiBhIDY0LWJpdA0KbWFjaGluZSBpcyBydW5uaW5n
IGluIDMyLWJpdCBtb2RlLCB0aGUgbWFjaGluZSBpdHNlbGYgcmVtYWlucyBhIDY0LWJpdCBtYWNo
aW5lLA0KYW5kIGl0J3MgQ1NScyBhcmUgc28gdG9vLiAgV2UgY2FuIGhhdmUgdGhlIHNpdHVhdGlv
biBvZiBhIDY0LWJpdCBrZXJuZWwgYW5kIDMyLWJpdA0KdXNlci1tb2RlIHByb2Nlc3M7IHdvdWxk
IHdlIHdhbnQgdGhlIENTUnMgdG8gY2hhbmdlIHdoZW4gc3dpdGNoaW5nIGJldHdlZW4gdGhlIHR3
bz8NCkV2ZW4gaWYgd2UgZGlkLCB0aGUgR0RCIHJlbW90ZSBwcm90b2NvbCBkb2VzIG5vdCBoYXZl
IHRoZSBhYmlsaXR5IHRvIHNheSAiQVBJIGNoYW5nZSwNCnBsZWFzZSByZXJlYWQgdGhlIHRhcmdl
dCBkZXNjcmlwdGlvbiIgKEFGQUlLKS4gIEFuZCBpbiBhbnkgY2FzZSwgdXNlcnMgY2FuIGVhc2ls
eSBzaWRlLXN0ZXANCnRoZSBpc3N1ZSBieSB1c2luZyBhIDMyLWJpdCB0YXJnZXQgUUVNVSBpZiB0
aGV5IGFyZSBvbmx5IGludGVyZXN0ZWQgaW4gMzItYml0IGNvZGUuDQoNClJlZ2FyZHMNCktvbnJh
ZA0K

