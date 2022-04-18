Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B57D505A60
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 16:56:11 +0200 (CEST)
Received: from localhost ([::1]:45504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngSnS-0004Z8-3e
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 10:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1ngSmF-0003nG-K7
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 10:54:55 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:18311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1ngSmC-00085X-9e
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 10:54:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1650293692; x=1650898492;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=vJXdUvkHPObMJ2j/zDERRTUGlyixalgp0ld0Vc4awHc=;
 b=2QjyfT/dOhzBm9UXulIBddQgvjeFedzfXVSVBvnC4G4ukmdH6sovit6l
 RLxii3kPqscaTawR7MXuf6teZyVRB/RR4tD0Fy1PcnO1/gv1H9aqZfZW7
 wFc08UFHGaMdWIfzg6BN2PrCd3ewuLbBrfYZ9aEyp5cSC7UawH92N3FTU s=;
Received: from mail-bn7nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.103])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2022 14:54:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ksn0r4oazp15TM2d8NQmeF+30fRZl3tkq3m70UesMP2rVmqdm7XqIYUYuILCAWAlnzcZpxM04YlbR6doT9eSx88RnJIhgHzuzoiUhPQ6FIHE2OMDYZ0OSL8jOu8MvSH1gIesovvCz7E45Xvn9nurzl86xBiwhhxXfsdl2lWlPnJ5u3cuCJq0Zg+/Dwtl5OnYeuXuYcyDdczei1ulUne3fxngTdOcm4zeRE3LZqLll78MJ6cse1qO5zxqLC5vX3UHjj8OlLGa/TdLyASmRDtbmi9X9ib4dhyBy8aanUgqinpqa+3shY4zX1gcJomRMTN9S0OCAtDNSn2gI6Ej3uqlHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vJXdUvkHPObMJ2j/zDERRTUGlyixalgp0ld0Vc4awHc=;
 b=KU/bGCBs9SK/PwPwoIzhXGQshWlh1Dv+mwKdFfAVUJCgbvUIp39PPF/e4cQYKbGPWN2XquCZIhWySnrHNQgKtz5KMMm+VavfsphnbeRE7FyYRJFsDb+4RWM/bBBtVXLERs7snzs1AmHxjR9nplMQeOT1204VEarTS6EHBYwM8BqRgZaW5cA6T6VqsQAexlf96Raj6nhf9bsYa4Rrz/qrplO64Lf2Z9+za17Lku4lUEuImL0NUUsKvnh1nKiG6ukGoQTspiA6HLHMiIVBJxNgn9HPKFjI+SX3+DUsxbVOwpB/TCBARmxy85lABXKw/IhFmQEiUFkCgBgZzB1QiukQYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SJ0PR02MB7598.namprd02.prod.outlook.com
 (2603:10b6:a03:327::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Mon, 18 Apr
 2022 14:54:46 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::5c0b:b589:ed93:eaef]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::5c0b:b589:ed93:eaef%9]) with mapi id 15.20.5164.025; Mon, 18 Apr 2022
 14:54:46 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Question about direct block chaining
Thread-Topic: Question about direct block chaining
Thread-Index: AdhTMV3HLYuwsChLQJeeFj0sDaStrw==
Date: Mon, 18 Apr 2022 14:54:46 +0000
Message-ID: <SN4PR0201MB8808BF460C02884C603641A4DEF39@SN4PR0201MB8808.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1094b76e-3eda-4330-ce81-08da214b6127
x-ms-traffictypediagnostic: SJ0PR02MB7598:EE_
x-microsoft-antispam-prvs: <SJ0PR02MB7598C213F7AF1EFFDEDD3DADDEF39@SJ0PR02MB7598.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LawEg7+Cj0CCRIbsetgznO52cU4JJ6SpIk20Vj4nZEnZ28qY+fJrKPParcelkgaqVZDywkaTyyEtcFMjCPLHJLFXfevXDosM5DxHEChtei0PUtcZ2D/RnmukcGdk4sOlbw4cptjDyRqWcp5Tx2K0bidDzRhDsldM1YVCXmt3/P1YLzJyezf2F+02bHNMpdIKHeBxUlOPEh40MyE5LFeHPG6nyug/j1lVr66ILtcu67HK57B/3AvY1aWvV7HJXPGUJxLitHs5nox5OWaanr/52MY+Z7IN8DfVZc4y61GIs2Ya56CxQm3Qti2xUUBF6d6fTfwm4peDXkXAs/C4dlu7Qq/Ye79nuOaw+gw1UZ4UKR15E1ITjaO8SEQffVM30b6XLNnQnoHRRfi46TuBQpsMQP1a9DXjvHLxjqvRddl4Gf1EVeqo+SAL+jeF8mzm9s9Bx1pnCTvyBtabxp/P/l1UeN4uyiWksFOx7CUVlBam4xDAd9CkxNTNmQhlpLOHsKCMOuq0rLdgyDRo5FTKcZtNQ4QIYVDk0tVaVnAMEv22JLTc8/TYWqRTQxlHm2fBsOusubQPQzTBhE9hii/h5njkSdagRO64xUEDRp7hXo0Qyx17jbpgZ9+/anuVMUWrsK822UYlQb5nbKY3FDApxqwXX892BGjOPaukIhQ1GnfozRhTQVs6FjZWItyY/nWo+LJ2fSZ59Dpt/cTT2jnFJI5H1A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(64756008)(122000001)(38100700002)(38070700005)(316002)(6916009)(8676002)(4326008)(71200400001)(508600001)(26005)(6506007)(7696005)(54906003)(9686003)(66476007)(66946007)(66446008)(83380400001)(76116006)(66556008)(966005)(186003)(2906002)(5660300002)(86362001)(52536014)(55016003)(33656002)(8936002)(4744005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?n/h3CSAuw18b8yxJSKm2tq8Otpx8AyO0UTgogSEQB4PI60EgOZlQQuZB7U?=
 =?iso-8859-1?Q?cafMtm29pN0olN6SMJHbiDK4qGOjAqLl8gGI0KPo7CweK4XauhpQ8nEQ+o?=
 =?iso-8859-1?Q?6o0pfAFyosKdsAbGn4rAivxzVJPMXVZh40a0CYu4+ihNCPQf7KVYAQtIfT?=
 =?iso-8859-1?Q?Ela9FFv4SO0iyPQ3lwu8jhEu3kTyCIfjw/XpG/vtwO5FaPYGxzN17/idZZ?=
 =?iso-8859-1?Q?5VIjqgn1g7PH0zKEHOnQ55zjn/ecPl73S229Y6whsH9ZSBgpB5lJVJb01k?=
 =?iso-8859-1?Q?9cYdw/Q/qVGcCKGK1z32NAQ6AuWkVgLMNLBLcNm3ggrOshIke79P2dOtJ4?=
 =?iso-8859-1?Q?zgTz6xHKLQXDkRzwwsMkbIAVgka38sgWsh69Ish9VVqpTpp5SmV7/B4Xi7?=
 =?iso-8859-1?Q?ikU2VEs0jf2mjlrX3UWeUPwVWoTnhHSbFhompkx1xoIQdTnUE+iWaiML1+?=
 =?iso-8859-1?Q?Cq5JLlUsQBviWyAesrj0wel6fEJUUOu0M1fCU5/nSNSkbHewPJjMTjKe+6?=
 =?iso-8859-1?Q?9A372jCVDtwY5ibcNcCZ3HVxkPm8mmJoFNEk7S6qmAcCtjtpZvV8d2QXkj?=
 =?iso-8859-1?Q?JquWstkm8lY0uP+mWV88RrMTuEpbXovUCq+5qDBVYoOWpF50pmgETYK86P?=
 =?iso-8859-1?Q?2NPBF+I3lvd0R7Dh+Mlqk2bUgeihGvzHJwyfho14I6FezhQ9ylGkxqcC6H?=
 =?iso-8859-1?Q?vHrI2akmPRiMuz2MYYPyww1jNzv46dlw4PTLJv8gTjq7e5LsSSuniaBLHU?=
 =?iso-8859-1?Q?wB3FJE/4B3M2e482D/Gpw5cRjzCyYLnlsq6A7vpdbM0HCkrnYx7gbDb/OQ?=
 =?iso-8859-1?Q?9TbIQJUU4EOy5MVvjC+zHNUZwnc+azANVM7xojb1/r96Ob+si/nbczCOCn?=
 =?iso-8859-1?Q?JhrywHghVfugTdR7V8BrGP2CqXXCmqeFxy5QSmQgVP5SZCu5RCO3sxCtQ/?=
 =?iso-8859-1?Q?iV4LTLgmIW8ZvxQ74A8JiysPMj11RiXfuy0JVu0ef+ylKqsDf0qr1NwG1L?=
 =?iso-8859-1?Q?fPZ5a4zoQdUBrMdZ4j5xjN3Hnz79rc5rhbCNiixFM0/0G9WWOiY4V/qF1X?=
 =?iso-8859-1?Q?m4S0U6TnpcmMxnW+82v27hiV/ewhS1lQji6UiPWicGkBptOODg2PYzZsSF?=
 =?iso-8859-1?Q?3+gaATeMezl7Y74ZjnSHiuf/TN68lOSWZ/XdGgKMoUjWY4ztw497lSzw+G?=
 =?iso-8859-1?Q?ayVoK5RzTPmiM3IrbW6YqMRUv57vdsyKyJof0aDaS8WBqNBRDX7fh8eY9a?=
 =?iso-8859-1?Q?Oaf8Sxa7cvrT6j4psRlm0eopKQBFDkPiP+0mHliw2xWq9OghyuyoKal0M9?=
 =?iso-8859-1?Q?bJkvh9FWw6FaruUiOzjAAy2zusuggbHRuurJDdxxhm/lSOToAMqVuPP2U2?=
 =?iso-8859-1?Q?LMtPWDZjQlo01BrNLM+uNnjgPxWLWjveW4pJxUkjeBd67bd8+xwLK7vFWK?=
 =?iso-8859-1?Q?5ln+ucpO4PqVgMSbeVV6IX26Gyfkrr2/X8jjrO3+CTdGV/BMk8hqrZaIN/?=
 =?iso-8859-1?Q?ybWjA/mEs+TGxuZIhrPUbVae3NbiuIDmA/tQStWZkjtH0awB79NLUS+uTe?=
 =?iso-8859-1?Q?UEd7xO9Wu7vhXWAadJtrgjTV/2/vLGVHb8GuJDMpVPC8OlbrSAS7GcF5pt?=
 =?iso-8859-1?Q?PR1kkSZDzX16mOJTIt7JdryGwlnp1j7ojHe2tjcb0GmZuizBsxxEhCM/Yo?=
 =?iso-8859-1?Q?TAZOzaN2/7SU6+3rXMT/K9Xi3Y5T8En/1uYehDSmxGwdEyHa+6JncFA4ky?=
 =?iso-8859-1?Q?kGaxdJj8rmLFGdZXhjSTdx1FgGe08Jj7t0gKoiRXiscG2tAn2Vky3akHxs?=
 =?iso-8859-1?Q?6xneVCBLHQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1094b76e-3eda-4330-ce81-08da214b6127
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2022 14:54:46.1827 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s6/PEBEqVoZtI6DV5ZjaT607iGYkAsKZXlhg6r+eUEH4i92doUzSMyu3eA3a/0BLPtnHJ4CP8PKXoP/JwMaX/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7598
Received-SPF: pass client-ip=216.71.140.77; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I've been working on speeding up the Hexagon target by using direct block c=
haining.  Due to Hexagon's VLIW packet semantics (possibly multiple branche=
s in a packet, not processing change-of-flow until packet commit), we have =
historically treated all change-of-flow as indirect.

I looked at the documentation here
https://qemu.readthedocs.io/en/latest/devel/tcg.html#direct-block-chaining

I implemented both approaches for inner loops and didn't see speedup in my =
benchmark.  So, I have a couple of questions
1) What are the pros and cons of the two approaches (lookup_and_goto_ptr an=
d goto_tb + exit_tb)?
2) How can I verify that direct block chaining is working properly?
      With -d exec, I see lines like the following with goto_tb + exit_tb b=
ut NOT lookup_and_goto_ptr
      Linking TBs 0x7fda44172e00 [0050ac38] index 1 -> 0x7fda44173b40 [0050=
ac6c]

Thanks,
Taylor


