Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEB7675FE8
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 23:06:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIzVI-0003Wm-Ld; Fri, 20 Jan 2023 17:04:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Bernhard.Kauer@incari.com>)
 id 1pIzVF-0003WQ-Sf
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 17:04:53 -0500
Received: from mail-fr2deu01on2046.outbound.protection.outlook.com
 ([40.107.135.46] helo=DEU01-FR2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Bernhard.Kauer@incari.com>)
 id 1pIzVD-0003G7-Ra
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 17:04:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X4VnkOG0yXA+/C9cTpA/9nTGsiTqNGQPkqtN/T7jakXWxfv+YQSByoX4RRPgUHWf/zFTEaQoTcJonthy9btlx3NOPd7FLAk3MWx0Yc0WDFIJeK/3+LcbPdTJjDM2fzRLAyawCzSljo3EZxuSUnxc01BAAqAO//n++RyJY+i+fvUratTFPpJwQvPPXAsgkMv04ns3e7/Bv04Z9nhyWKgu4cRJznehx/fSop1ix9xdbhZbgzr4OONbBFjarazzDfqDyMMo4d7ijEZgTiqsqCI5jJUyVAQPlTxRQiMWTz5bWoxSKofqeYfG2wkdEBcWh6pXhk7giUcbwQYxkUvl48iZ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DD6B12xKAHUy8U/ztiwXq0qc0iqLL7yz5pKZyPWbuG0=;
 b=HFHBnMksd798q7PPNyBf1bGPPjjFWJJ8tj3Gzx1cfu0dtW1yUOuyuQqPwIaTt7qqMR8UK3fa1KnQBOGjvubG9ph30IvQby8xmm2PcMRUzwQicFWwjbEj8JMsh8HRh9Fe+qaUvzjsvntXSJGNakMmOUTMRK+RXMR0DGHTrohtangl4KsLwOli1dV29q2WbU4099z0Xr4pKScvqOjlwtp/nth5qVyw2p3nGwO7BrKWu7ARTVTWwxS2Phm+8y8W5O7c8TkCnbqq/Ye7NIvYc1DsGcfcngvL0U6FCg3rYpWk73zGw6EKgNakw0EPl99sXfLijmtfnLQRqQQ0AXb9gwfHCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=incari.com; dmarc=pass action=none header.from=incari.com;
 dkim=pass header.d=incari.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=incari.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DD6B12xKAHUy8U/ztiwXq0qc0iqLL7yz5pKZyPWbuG0=;
 b=3j2Q477X2t7rC6nodhmVju/vEckuMCe9wsM5cmEzSdaIWoW99giFMrz6noSP0MpiULgTlhx6KyRkyiBsVl+jhNgpKI8OiguJiUfEjR7VDL/PPduJayQ//v4OXd9HCUnNvk7K7KDZjgDYWAKxpvPHpS1Ww2G0Y402dPNM+ThE7L9/vJizCHDOw2l2+/wsRF9ZEgvrpUqQ60NOqVWciQPH1/kCGowRnQzvEWA6AA5DMf6k4KEcEoWkYUrF6HNePS5flz8Ivf/FByB5HexjAIMGe58k9SRVCYu8E+xl++ROsz55nd+OeiN7SmHhJ1/Sp1ZdZgdVnBIiLKGtX2Z0Dxc1NQ==
Received: from BEZP281MB2965.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:2e::6) by
 FR3P281MB1630.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:7a::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.27; Fri, 20 Jan 2023 22:04:47 +0000
Received: from BEZP281MB2965.DEUP281.PROD.OUTLOOK.COM
 ([fe80::69f4:1511:acf4:d040]) by BEZP281MB2965.DEUP281.PROD.OUTLOOK.COM
 ([fe80::69f4:1511:acf4:d040%3]) with mapi id 15.20.6002.027; Fri, 20 Jan 2023
 22:04:47 +0000
From: Bernhard Kauer <Bernhard.Kauer@incari.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] target/i386: translate GPA to HPA even in unpaged mode
Thread-Topic: [PATCH] target/i386: translate GPA to HPA even in unpaged mode
Thread-Index: AQHZLRJLH8uL69hnX0iDYloHfXAGO66n2+YE
Date: Fri, 20 Jan 2023 22:04:47 +0000
Message-ID: <BEZP281MB2965D9D27639B815DB6BA2A9E9C59@BEZP281MB2965.DEUP281.PROD.OUTLOOK.COM>
References: <BEZP281MB2965EA2D8C69925DEFD4B6C8E9C59@BEZP281MB2965.DEUP281.PROD.OUTLOOK.COM>
In-Reply-To: <BEZP281MB2965EA2D8C69925DEFD4B6C8E9C59@BEZP281MB2965.DEUP281.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=incari.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BEZP281MB2965:EE_|FR3P281MB1630:EE_
x-ms-office365-filtering-correlation-id: 0c0bd423-e707-4809-73a9-08dafb32581a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OEH3UD7/RuLLSTO2zziqITfl/KJ1HIUKSl0Al3v1T4jybExbDemMyNSg4nuXtWXDC0oRlGaTcpeeLNoi2qbVTs/LB5rOM6c0CPtGyn1Sjst0HC5UPQ6Tqskh2FivzEGanvBK45lVwlkx2bfa0gWtCKTbFDCziC0P3F4x1/dF9Wh79EK8/Ps353x7HClSPyLaG3EbsR71yOD4dT0a80jMHIV4WfPAu6rVdnZxTk1d7tbJFYrqIxBcO79Oua8c95ETatEwCzJYbcBAQwoJrtZh/96kZJexVk3mztpIs1rLEJ91ZUSu9QzW/0uh8vQ9TDZ6nF64JU9OV1RMfKDCajFfM0GjxVGB/4k+Kju6n6jQ8jxZA6wyIFQ5UMAwJqBKcrvTLrYxdyyf8e20MKfax2B5WhKZUMFYRFX4V58+sFrNQmRuhLixpJSm9KbtyDqMfcYRMoMdMJ83sDOSKA1C+mjkr3dmOIMp/AMPjKIynhehJTfhV/h7BZnmE8BnabFaC91I10gmlO97Hj4imeN5P4EFOTvX64kdafTaxYX5iU1yqEs56x++X3xI4htEAhxC2Cp2+Mev3qzOyyfd/jsY1Mx5uscZOTIMzFlIhCqvP0WA8TJhNcRlQPFlbUlHE6Wom07/qBoqeHCjc+2s8Jf5vYNdBFMM0GSFgbCMaMdmfrouVpg0JMGEfut4Uw1VamnhwVycgfZzq5CEuYLisJrMLerqeQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BEZP281MB2965.DEUP281.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(39840400004)(376002)(346002)(396003)(366004)(136003)(451199015)(5660300002)(4744005)(8936002)(4326008)(64756008)(66556008)(66476007)(8676002)(66946007)(66446008)(6916009)(52536014)(76116006)(71200400001)(122000001)(38100700002)(6506007)(186003)(2906002)(2940100002)(9686003)(7696005)(316002)(478600001)(83380400001)(41300700001)(38070700005)(86362001)(55016003)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?vF2QC6+htdU/hyUpnMh64r8q2Sv9t5eW/tuVofk0pzCuE3Yp5svPwVRe60?=
 =?iso-8859-1?Q?jW8rvYr0KOQ5dsiw4T5CPy4UKhQPeZ2+Mfnr2F3VLUJ04rx6QpatNz+XpR?=
 =?iso-8859-1?Q?m1zbbW1XCOXjIy2jHBjzkCai9xoojc2jiAY0OVaL3yJx8qaOvsVCROrONU?=
 =?iso-8859-1?Q?L8YVwLe9UGykzQSCvVYa1tNuHLvPQdR5ksqAF0HxzARZGuOneu4wRBn80I?=
 =?iso-8859-1?Q?ojL0u+qc/cDMoU/8sIeL8FTEg6RTnANwLmXgtfEyWRM4+2Fs4bHLzkf+3N?=
 =?iso-8859-1?Q?twjko7LCa1diI3xCAWAeUgp+FTX064sIYKXhQevJ8Xae5+v/vMRcCve0e5?=
 =?iso-8859-1?Q?HDNvh5aQuAQXushpVG8Mpo7pne//nIvnxzbGvyUWbzneMChWD65AkBsnkQ?=
 =?iso-8859-1?Q?m8lNzZIfQ+Y3LZFGu6c7bAJ4oFAF3p7bxHirZAcGHfbVdXw6xGXUugz7Tr?=
 =?iso-8859-1?Q?qyvwr42U2sC9Eyfye08+xnxjGyq6NwGYAAzeCbK05vGLlU38if88h1FvUs?=
 =?iso-8859-1?Q?XBhxlZRmqC+K0lKVzweVKW6TjjcIpquME8VdI7ZrIbBjtM8h8n2YKOmVdT?=
 =?iso-8859-1?Q?uuapHy+O4GBCYHmdgBqlzJkjwN+bho/oTCLFzCpgCCgGjEhwYpwv7+8uVd?=
 =?iso-8859-1?Q?VtnFuk7DrslloeU7fToSLB1URZvH1MFO0Q9m5yBQfGoIr9JYGuhf2bUKEL?=
 =?iso-8859-1?Q?I/iMdOg5hpsClLh0nR986BhbxGEoEthzhkVCBdlQyXDlf8eEhvyiDmIU2m?=
 =?iso-8859-1?Q?GcjxdUQxrVd+9655EXdnFiWDEsrDksbDbwtrfKJnW11trknBmEWTgkxySp?=
 =?iso-8859-1?Q?yo3nYs5Pph4NAUOfhHTw/5yrP2TsRS0JOfQg7VSxm98Dt0esfXiGjm71eR?=
 =?iso-8859-1?Q?ZyKut+HknAgAcqZPpzlGWYk3lo/9Aqrj5WhSgkgoe713bA+h4PJyW3Y+69?=
 =?iso-8859-1?Q?axquPw/QqBuVk5L+RLhEYG74k7ap6UUDKSu30lskPnJ0GwXydaaNetYU8l?=
 =?iso-8859-1?Q?+WrqW0d67dzWcBaQg8iUCZly4IuffsLGw4gV5fdDlt9xe/KtstO7sZ7hvL?=
 =?iso-8859-1?Q?44VOavlfQUnRIWymcPfIz1RI3NrIxVDBXFY+9H27Q9F0RRWqLokn3nWuI9?=
 =?iso-8859-1?Q?GlPxEoeL5Ld0+DJw6Iz+jJU+Xuz8j1TeWnUNJwXqgzzzld+jofx9wY1d/D?=
 =?iso-8859-1?Q?KG47jWwv1XDgWlPMpB6Nfxs3y94usB2GcqMBXvvHQrMMXN9sGylL1D7ez0?=
 =?iso-8859-1?Q?nTGplFx8gEh3vjCIsRAbG144vUa8KUCA2Hdst/4Rkbd6Js6/qczSisiKam?=
 =?iso-8859-1?Q?8KJ1D6KOC8zBKln3i5eEAEViezKUDiSRVfpT9Vg/St64lARJccpT1aaVdp?=
 =?iso-8859-1?Q?EdWLdx4iqre1QhB8dlWFnbAOs88amgIbLQOB5ey5gx72ODK7mbyq/6q9Zb?=
 =?iso-8859-1?Q?8uqAXR2FJoGdHZZbbIIbkziOxIYGz9qFihp8MjpncAC9gipJkcxNCDXn7T?=
 =?iso-8859-1?Q?u7CAyywhPdaRaimt8e30m8c5IIL5ddcl0jgOMfDDIdK3ECDmdEj2ctd3r2?=
 =?iso-8859-1?Q?LcaYNyMf5FkLubHnHzVPGctw83HtZ0WBIEyZzY4ft3vqXYBF7/1BbPB/E4?=
 =?iso-8859-1?Q?O6HlxU5CS/wHMuYLOiYs6HrYjYekBegNflQp5YMR8pH0spH/kvLQGllsO0?=
 =?iso-8859-1?Q?uhOxMrXuLt0Fm9o42rdilSkxNHTfaXcY9NjOh338?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: incari.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB2965.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c0bd423-e707-4809-73a9-08dafb32581a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2023 22:04:47.1255 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a46cb45d-70c3-46b7-b011-a63d6a9c3c2c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /AsoQFVmguEagxoHAW/PaULcmiO3NvSGaXkh9+9dxd8Du43aCj6mBtX5sBAwVKSJsbY4gD8I9d4DxfUEEw62gP7/meIsyAm6fhqSJeqqIec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR3P281MB1630
Received-SPF: pass client-ip=40.107.135.46;
 envelope-from=Bernhard.Kauer@incari.com;
 helo=DEU01-FR2-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Guest to host page translation should be done even if the guest runs in unp=
aged mode.=0A=
See last sentence in AMD SDM rev 3.40 section 15.25.5.=0A=
=0A=
Signed-off-by: Bernhard Kauer <bernhard.kauer@incari.com>=0A=
---=0A=
=A0target/i386/tcg/sysemu/excp_helper.c | 3 +++=0A=
=A01 file changed, 3 insertions(+)=0A=
=0A=
diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/=
excp_helper.c=0A=
index 55bd1194d3..8d9152245b 100644=0A=
--- a/target/i386/tcg/sysemu/excp_helper.c=0A=
+++ b/target/i386/tcg/sysemu/excp_helper.c=0A=
@@ -576,6 +576,9 @@ static bool get_physical_address(CPUX86State *env, vadd=
r addr,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0}=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0return mmu_translate(env, &in, out, err);=0A=
=A0 =A0 =A0 =A0 =A0}=0A=
+ =A0 =A0 =A0 =A0if (use_stage2) {=0A=
+ =A0 =A0 =A0 =A0 =A0 =A0return get_physical_address(env, addr, access_type=
, MMU_NESTED_IDX, out, err);=0A=
+ =A0 =A0 =A0 =A0}=0A=
=A0 =A0 =A0 =A0 =A0break;=0A=
=A0 =A0 =A0}=0A=
=A0=0A=

