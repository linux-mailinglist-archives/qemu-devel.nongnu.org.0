Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E259485321
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 13:59:48 +0100 (CET)
Received: from localhost ([::1]:37570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n55tL-0004pP-5J
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 07:59:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad.schwarz@siemens.com>)
 id 1n55Yj-0005on-5g
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 07:38:30 -0500
Received: from mail-am6eur05on2083.outbound.protection.outlook.com
 ([40.107.22.83]:26336 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad.schwarz@siemens.com>)
 id 1n55YT-00015z-Av
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 07:38:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lpz+pW0wDhesyR4zQGpJ3yUaGDsCz+fPG26EDTntc+KMbplVBMFfpqYMYwk+VGaRyK4JElYiyvWyfP5Rim1J3EAOgrwswTAzn9vX+UFzugVC7rdujEVR5a6yTz5RnsCp/+71zNd7qBkCd8y5s5DwcQ9oHYpALA1hAmegUrj0DX7rYHmNjpKq3J9x42iHdpZ+jwL+kUnuUUBTgkTGfs/nG+yryGmDaa7LuqFxe6UExrhmXuSAlHHCr1KteoTm5z0Abgjrss4W0jZyr3jJ/fWTKOaXouLeYRyBDowx6S4IaoULu4/Xp6V6YceJwu1ArtyqSsZv7opbVmC+vbXwOFQ93w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O22rmBlbDhKG2uPi1PGMNmM6G3XWGPJL02jzsoZvqac=;
 b=T9OtVXFDkKr9ZLLlEILciHDLlE6wNSaQ+4IbhnJiuTlvrLN8I1BHPcnNq693NmYjdw9DEu/EEfzIdcmENtHAQB6o8cDgRtM3bjhCtbHEbvZ8sOCxpHJTjByhvt+GSYeFt4mcMpILhUAbCrvMz9H9EUjiOHbkhEwzzJqLEP73KW7HXL6DFu+6iRi97/B58lsG22InrQTeRqT4J5p3+gbR12uUqVYt2w01QkJyNfCGoVUIZMJXj2UXdj2FWfmGQPF0XEzCLpl9HF+mYEx0ZXY3NW/gJlKdL9YnU3jagG8SJ0rP1sUCqeJyoqOgTytmThhkW718wQ2cCwzKhllUShBo/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.72) smtp.rcpttodomain=linaro.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O22rmBlbDhKG2uPi1PGMNmM6G3XWGPJL02jzsoZvqac=;
 b=Z+z66lyX+8fr5FzmiA1DMvjrwM+W7MOrQAuWu2UlXfbk8Go0D3hkZwbfv0myyZ6PS5569pdbVTgXQBr5JVQ71LcIApOelwDsY8uhU7RFfXAOCRR1D8CBDtwvvS8VYAoK5aQh/ytieRdnp0Z67P9AmLT+yrzEl4DKhbuI+KTab9c2XZ/PI8GqQHYWieVuqO9gQHdtg6DqAEPqRhgNflZ5iQnRsypDngA4vANinFnIq8ViwLsMzz8gLlbvxbDvefQPFTd5TuAbe3nQyhJyPeP1G8xPgGyh4fCNDkhtleql1/zun+Hu6fqM6UfxZnjxc1CnoRMks7f9pKPnxKQd9S2ovw==
Received: from DB7PR03CA0098.eurprd03.prod.outlook.com (2603:10a6:10:72::39)
 by AM8PR10MB4692.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:354::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Wed, 5 Jan
 2022 12:38:10 +0000
Received: from DB5EUR01FT004.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::92) by DB7PR03CA0098.outlook.office365.com
 (2603:10a6:10:72::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14 via Frontend
 Transport; Wed, 5 Jan 2022 12:38:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.72)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.72 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.72; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.72) by
 DB5EUR01FT004.mail.protection.outlook.com (10.152.4.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4867.9 via Frontend Transport; Wed, 5 Jan 2022 12:38:10 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC9SMA.ad011.siemens.net (194.138.21.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 5 Jan 2022 13:38:09 +0100
Received: from DEMCHDC8A1A.ad011.siemens.net (139.25.226.107) by
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 5 Jan 2022 13:38:09 +0100
Received: from DEMCHDC8A1A.ad011.siemens.net ([139.25.226.107]) by
 DEMCHDC8A1A.ad011.siemens.net ([139.25.226.107]) with mapi id 15.01.2375.017; 
 Wed, 5 Jan 2022 13:38:09 +0100
From: "Schwarz, Konrad" <konrad.schwarz@siemens.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 1/5] RISC-V: larger and more consistent register set
 for 'info registers'
Thread-Topic: [PATCH v2 1/5] RISC-V: larger and more consistent register set
 for 'info registers'
Thread-Index: AQHYAYMFpTGyhqk/U0ez67H1zArVOKxTR5EAgAEI1iA=
Date: Wed, 5 Jan 2022 12:38:09 +0000
Message-ID: <9511f23e9cdf42609866bc597f87b97e@siemens.com>
References: <00a79b65-288f-f17c-abe4-fcfd3f7971fd@oth-regensburg.de>
 <cover.1641309725.git.konrad.schwarz@siemens.com>
 <85d02ac883c7cf40fbd54e8747783937e0370eaa.1641309725.git.konrad.schwarz@siemens.com>
 <18d1fbb3-ddff-6d3c-55a1-cbec27ac9f1e@linaro.org>
In-Reply-To: <18d1fbb3-ddff-6d3c-55a1-cbec27ac9f1e@linaro.org>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Enabled=true;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SetDate=2022-01-05T12:38:07Z; 
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Method=Standard;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Name=restricted-default;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ActionId=dbb146b4-a893-4eb3-b137-567c50a256dd;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ContentBits=0
document_confidentiality: Restricted
x-originating-ip: [139.21.146.198]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01a8af9c-b067-4335-4ead-08d9d0483b52
X-MS-TrafficTypeDiagnostic: AM8PR10MB4692:EE_
X-Microsoft-Antispam-PRVS: <AM8PR10MB46922D1F18BF71E8124FA0698A4B9@AM8PR10MB4692.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9Z3eUruDWwqhKautU30ZjoIoocGgaL1S6Wpho+fb586pcw6z08VOD+I8lXgnW1vDPSXH8lDbTHqskn76Kek4+3dooLhf8MFR3rFYdwSLvqHyvSeT1QpInnyq8EVbCetgfRV/kiZuD92MruPhEhjhjBNdH6woZ2Imz0cJblBbKYW8iHgKDTJhivAuFwKSAS6pQqK6+jsTGdNXpKQQGRPVS5uKF0DjMWQCgPIi5iEhXQU2FeXabv30hXENKQGoDnEo4g2cMYjDVODlyGFelZ8WKt6RAgwRqClL0i88mmltZ6sT5TL3AU5x5ETFePk/LKyCoN2ZGpFEECM7UWgATDz7gyE+Qm2cmIcaJCPcxhVS9gqHbhBLnksn6aIUVsTQpml7oYgjoYGUZ8ewk3dYJnyJee7zbDbtltVXXePN4GI7IMyc3xSPc0p05T2yEBrYLt8P4uBH45+eIrQzgo5NPhBnOjxgRVL4REHXmntera1WjcezuyyadJnPxnK+z1G2I+mvJwSNbgrihKU/GJ16hQfw6DAjAmYsQ6mKTcylmhFBeQh07z+O+2+zr7ByMflQ+9YK3NOvtOmJI6MFYUdH2gs+dyCPc+0adQPOfKemQBbhnLjr5QPkvaPhZqBEnPrPaa+CWlhk4bADgrYhuc4x0zp2Z/DQ4hdKhf+VPgk95uCtJBO/pcMxqXtdXOf41bOaguaqc+TO6DKzPHiShFqXTsdNOSJbc14AK0+6qq7W6vLQ3GfEYIrrTDHJaR1NJQafxq90KGFH/nk4oVFngMaRuNfK1S7/UwpZ2srRph+WEJLeXgOg5aGHGiIvtxIZ7n2Dp4ZW
X-Forefront-Antispam-Report: CIP:194.138.21.72; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:hybrid.siemens.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(46966006)(36840700001)(8936002)(83380400001)(508600001)(956004)(24736004)(108616005)(2616005)(36756003)(82310400004)(336012)(81166007)(40460700001)(356005)(36860700001)(47076005)(82960400001)(5660300002)(4326008)(316002)(70206006)(70586007)(86362001)(26005)(53546011)(186003)(8676002)(2906002)(54906003)(110136005)(21314003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 12:38:10.0327 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01a8af9c-b067-4335-4ead-08d9d0483b52
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a; Ip=[194.138.21.72];
 Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT004.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4692
Received-SPF: pass client-ip=40.107.22.83;
 envelope-from=konrad.schwarz@siemens.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIEhlbmRlcnNvbiA8
cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4NCj4gU2VudDogVHVlc2RheSwgSmFudWFyeSA0
LCAyMDIyIDIxOjU3DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMS81XSBSSVNDLVY6IGxhcmdl
ciBhbmQgbW9yZSBjb25zaXN0ZW50IHJlZ2lzdGVyIHNldCBmb3IgJ2luZm8gcmVnaXN0ZXJzJw0K
PiANCj4gT24gMS80LzIyIDc6NTEgQU0sIEtvbnJhZCBTY2h3YXJ6IHdyb3RlOg0KPiA+ICAgICAg
ICAgICBzdGF0aWMgY29uc3QgaW50IGR1bXBfY3Nyc1tdID0gew0KPiA+ICsNCj4gPiArIyAgaWYg
MA0KPiA+ICsgICAgICAgICAgICBDU1JfVVNUQVRVUywNCj4gPiArICAgICAgICAgICAgQ1NSX1VJ
RSwNCj4gPiArICAgICAgICAgICAgQ1NSX1VUVkVDLA0KPiANCj4gQWRkaW5nIGh1Z2Ugc2VjdGlv
bnMgb2YgI2lmIDAgY29kZSBpcyBub3QgYWNjZXB0YWJsZS4NCg0KSSdtIG5vdCBzdXJlIG9uIGhv
dyB0byBzb2x2ZSB0aGUgZGlsZW1tYSBvZg0KDQoqIHRyYW5zZ3Jlc3Npbmcgb24gUUVNVXMgY29k
aW5nIGd1aWRlbGluZXMgb24gdGhlIG9uZSBzaWRlDQogIChsYXJnZSBzZWN0aW9ucyBvZiBjb21t
ZW50ZWQgb3V0IGNvZGUpDQoNCiogaGF2aW5nIGBpbmZvIHJlZ2lzdGVycycgb3V0cHV0IGEgaHVn
ZSBzd2F0aCBvZiBDU1JzLA0KICBzd2FtcGluZyB0aGUgdXNlciBhbmQgbWFraW5nIHRoZSBjb21t
YW5kIGltcHJhY3RpY2FsDQoNCkkgZmVlbCB0aGF0IHByb3ZpZGluZyBzb21lIGNvbnRyb2wgYXQg
Y29tcGlsZQ0KdGltZSB2aWEgYCMgaWYnIGNvbmRpdGlvbmFsIGNvbXBpbGF0aW9uIGlzIHByZWZl
cnJhYmxlIHRvIGp1c3QgZHVtcGluZw0KZXZlcnl0aGluZy4gIEkgY291bGQgb2YgY291cnNlIG9u
bHkgbGlzdCB0aGUgQ1NScyB0aGF0DQphcmUgaW50ZXJlc3RpbmcgdG8gbWUsIGN1cnJlbnRseSwg
YnV0IEkgdGhvdWdodCBpdA0Kd291bGQgYmUgYmV0dGVyIHRvIGxpc3QgKGFsbW9zdCkgYWxsIG9m
IHRoZW0gYW5kIGdpdmUgYXQgbGVhc3QNCnByb2dyYW1tZXJzIGFuIGVhc3kgd2F5IHRvIGVuYWJs
ZSB0aGUgYmxvY2tzIG9mIENTUnMNCnRoYXQgYXJlIG9mIGludGVyZXN0IHRvIHRoZW0uDQoNCk9i
dmlvdXNseSwgdGhlIGJlc3Qgc29sdXRpb24gd291bGQgYmUgdG8gZXh0ZW5kIHRoZSBjb21tYW5k
IHRvDQphZGQgYSBmaWx0ZXIgYXJndW1lbnQsIHNpbWlsYXIgdG8gR0RCJ3MgYGluZm8gcmVnaXN0
ZXJzJw0KKGkuZS4gaW5mbyByZWdpc3RlcnMgWFhYKSwgYnV0IEkgZG9uJ3Qga25vdyBob3cgdG8g
ZG8gdGhhdCBpbiBRRU1VIGFuZA0KaXQgd291bGQgd29yayBkaWZmZXJlbnRseSBmcm9tIG90aGVy
IHRhcmdldCBhcmNoaXRlY3R1cmVzLg0KDQpXaGF0IHdvdWxkIHlvdSBzdWdnZXN0Pw0K

