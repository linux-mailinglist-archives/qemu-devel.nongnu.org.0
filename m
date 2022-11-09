Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D1D622C9D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 14:42:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oslKT-0004bR-RP; Wed, 09 Nov 2022 08:41:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfaggioli@suse.com>)
 id 1oslKN-0004an-58
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 08:41:15 -0500
Received: from mail-db3eur04on062c.outbound.protection.outlook.com
 ([2a01:111:f400:fe0c::62c]
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfaggioli@suse.com>)
 id 1oslKL-00007a-C4
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 08:41:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E/Zk4bJkveGW2GyWKZJPz11V/Eb1ZtKJyuwlwDlnWzuTfINXKT4bYGmKTa0gz4FWwAnbNO4A0bVPMeAm0Xc+btNeOfPmx6V2iH1xSxbN/2vGbCmHAiLN2K4aN8WyMDEqkS05R59KdawJ4efdkSoH4xwxYniBjN8zpbhYqC5XHYwReKM/OsQu5DuoyUFyW2fKzIc/iNrtkHFkITvlZtE4v9cpictJaIX7m5yD0O5bWicTZXTrIH63xrvbOSk9rEFsZLnjyG/Hwe5fa6glVbAp1W1esS/O/yLLiicOgOfdayUBM+NwgGcPllVvDa6qbUzRsjge3ijRkKWQVakJk4n/1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJqh3CdEecAglIgwPNDreeVS2DKY2jpDdQp5RgNBED0=;
 b=cvs1iPHilfNslIaoJMJzwrbQH2kyiNl2LpYjyX5+qt2YLxWnhhVcI30/cpeE0cYPQSQGaco8nUxSnqISNju5Wl8mQSjXUUga0ZiThNDEZWG1rHo5zVxqQFUftDXlkhUub9Emqzb/2fQ1E46ZMksnkXWMrCFvI4hLBijpEnUaHzilV4lIbtc5ii3XNmXtkXOyLZz9bQPnx8Zc/VqeqU3lguEb5nw8dfW90femiw9gTO2FQoRm449V310TZ/NuAZgz3IsuL+fwAyvTTsL0VJfu+jRNxFnqzE6ieQzIpaxlMhwxU+LoZA050OGD6YWiIucRL1jZcqlESvO73XJMPOjhJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJqh3CdEecAglIgwPNDreeVS2DKY2jpDdQp5RgNBED0=;
 b=bITBWtJfmUR2vvM6u5js9tw4+16IIzC0F7vO4Fo2N3gY4Zx3Jw8a+K/FeaiHQ8yqLshtv3nLZu3QmiaPcGvZsn6NEUtiTxHAxjOVpZF5Rlx1VNcNb3wj24Y7BjAjcnZqpk4P4bhntbvs6DsbYuor9I6cnuL/Qvtcv6YFTDxE0Xjt9AudIJg1Y5vqj5OQ7WkGZczenEw3mGg9AySBluf4wbgp/BKKGtFjv5OpXQMocJ5e6tqv4LLmAbPJ3hIo/o8JXQO6+Dn5KrVemaDVoaX4jN8uIxXUzfKAHrfR8B7i3iE+kgAdyNxy0N2IVCQo9HePDpaZi6MbN5CcTAipZfZF3g==
Received: from PAXPR04MB8366.eurprd04.prod.outlook.com (2603:10a6:102:1be::12)
 by AS4PR04MB9481.eurprd04.prod.outlook.com (2603:10a6:20b:4ea::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Wed, 9 Nov
 2022 13:36:08 +0000
Received: from PAXPR04MB8366.eurprd04.prod.outlook.com
 ([fe80::64e2:acbd:4d56:fcca]) by PAXPR04MB8366.eurprd04.prod.outlook.com
 ([fe80::64e2:acbd:4d56:fcca%5]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 13:36:07 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "eduardo@habkost.net" <eduardo@habkost.net>, "mst@redhat.com"
 <mst@redhat.com>, "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Subject: How about increasing max_cpus for q35 ?
Thread-Topic: How about increasing max_cpus for q35 ?
Thread-Index: AQHY9EA4sQZtO4QJ/k2/wfKCs7AjeQ==
Date: Wed, 9 Nov 2022 13:36:07 +0000
Message-ID: <c705d0d8d6ed1a520b1ff92cb2f83fef19522d30.camel@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.0 (by Flathub.org)) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8366:EE_|AS4PR04MB9481:EE_
x-ms-office365-filtering-correlation-id: babafc85-e491-413e-4c68-08dac2575b6b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X5Rho5DQJ4sbgGO6il1Pcmv/5pqsKIxNB2zYgDqxJQtYBRgM/QXfAeEwynaPZK6sRM8HS906/+tQN5hzWry4Yz2kBDRwJUD/reU3As4g+/ogbFX8t7hGwpPNw6c7umvjygScNG2BA1gweWwBiMw2bdeF+eKczReuMe4TE0HcvDIVR30YwrIk/krvyUZqZCfATyg7yaQ5ti9nA8JWTm2rt7QdvhD7YBXK646qaQ2vqeh0jy32Hlj+S7W9lQ2AAboulbDor/nA4APgX0ZIYD01TTWgG64BvvMgcnxbVXaxwCHE9Zljy3cNx6HwMTKbep43Q6EUgwbs+Vfw2w+j3cCzlA7ea9FQrap2w0UkKcCKx3Fh0TnCw9iFqHOCkVWvle1yyluQ28tB+MckRCC1DqGha3C8yfYnzIgw5V1elTajqP6phcq1pXQT/45UEJs/ebtzMV2UyN9a3r+zM7BN+Zo3vJdST2AKA9Zihzo6zBtY7lTW5nAPYh1RoLsnYmTK7bPR24u2gctbwUkGlbbN/bpvZLE2rnNtyysl25mZUKkR97oHsWjtZzqToFKyczkB7GoZMLgobmtL9ws1SMvlVqN6/yfTUl1mkujIzAcbgYsFhJzINVc60KOCcYUFoonKzmENRS/T9Os500hb1MLFn1WQAQRYFKHP565O4Sfto+NYnMl+aMmeQdV8ZqUSnO7Rm0ZdvVUvfJ4ZW9vVuaP1fpcSCTg2ttEcPlSM6+fjPRgpmSFigckTYuPFNFndz+/5Cu1N+skc53FcKLTNnz9Kjd5pDsi2dx+zf/S4i1C/aXY+DljxuaTY0y5uLXsACSlwOZ7iIEDzMsdQTyFu0eoBOZGSJw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8366.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(39860400002)(376002)(136003)(366004)(396003)(451199015)(6916009)(54906003)(6506007)(316002)(8936002)(83380400001)(186003)(5660300002)(2616005)(2906002)(66946007)(66556008)(66476007)(66446008)(64756008)(8676002)(4326008)(91956017)(76116006)(41300700001)(6512007)(26005)(86362001)(36756003)(71200400001)(478600001)(966005)(6486002)(99936003)(38100700002)(122000001)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WnJNbmR3T0lQSWNhM3dOS1JDSld2cmFpWGl2M0VVaWlpekx3aHhJL2x0MTND?=
 =?utf-8?B?TWFEWFd0V0dYeGErN3dwR1VwbzJxaGk0a1FGZzFRK2RzL2lkb3lEU2hzRUx0?=
 =?utf-8?B?UUl2aHBKVDVtbnRLanZRc01YWXAvbEF0YWxvaUxuUnZiNDhpQ1F6VWM1UGpN?=
 =?utf-8?B?SnplT20yeXZhVDU0M1NZWUxSbndJeVBQWVlZYnYrTGhYRUxlUkJHVzdZWk4x?=
 =?utf-8?B?RjZISFVwQnMrdDExTXhuNk44aElQZXBudmpzcmZkRHVkMW9LdExoSHRkNm9C?=
 =?utf-8?B?UW9iZFVnSk0rWVd3WEtVaTVHQ0ErWi9yamt1QUdaV2xDSGVpeStLZ3o3aWgx?=
 =?utf-8?B?eTRvQTN3d1RMVGxDMkpGZlBUWVJneWp6Rk1zcURVTkRCVGJ3WndWYW53dE5z?=
 =?utf-8?B?TWJqYmxRQkpmWGptNlMydjJDZkRCNm1MSVRodTlFOElheG9FazJveUxWSEpw?=
 =?utf-8?B?ZkM5QUtjTVRYU0RSU1FldHArM2tnRWMzV09ETTlIUG1tSnpQdWt0eTFXOC9C?=
 =?utf-8?B?bVRGamlZUTQ1cnlQZFowZUVyRXk3M0Rqa1JDcEM0ZXRTTFMxZXltQVlHTnlU?=
 =?utf-8?B?eFhqVUlHMnE4RUNJYmFEK1NCUzJXVTg5elZWckdqZVJDNmhaVmZReksyblJ2?=
 =?utf-8?B?TkhYU2duNVlka1ZRUE0xUFp5M2NuUGVUUnJ0V1FpbGcrN1JFbDdpNzF1UlZT?=
 =?utf-8?B?aG5GRnVwcnZrQ1p6WE1FbiswK1NBL0hxQkRZZGhXZ1p1UWdCL2UycDByYnI5?=
 =?utf-8?B?NGViMEwrQ05ZTzVKVjIwdldyR3J4WWU5bC9oU1cwdTJka2p6MnRNbUFPK3Vy?=
 =?utf-8?B?K0VrT2t5UTk5bWVHUWx0K0lDRzR2RlhPYUNzamVYOU55R0hQbkh1QjZEMUFk?=
 =?utf-8?B?MVg1NVVLMENRUW81Qm1Rbm1pTVdjT3BSOFJmRzZ5TXB0cnhsS3pBcTdFUm80?=
 =?utf-8?B?dVJmVmN1OWk5TGxOdTVISlZ2SUJxQnE3VWpiKzlkdm9qcVNlUWRRTGF5bk42?=
 =?utf-8?B?NDkxTUFENWQ0QXJEVC9wS2xSelFFVWI0RVRXc3BSTytYR2t4TU44cEdvclZS?=
 =?utf-8?B?Z1p6ZUN1MTVONzI4a3c4aHlNYUZ4Q3VTVEJJa0QrUHByK0RtRDJrc0M4eDBB?=
 =?utf-8?B?NjFKOFpXeTM4aDRKakZXRmpEdWY5TFFKOFFVVFBkMDZ2c011N3MwUEZ4eXFG?=
 =?utf-8?B?eXFZdlEySFY4dXRJZTFZalpBVDhwTGZSc21qQ0dCUmZxV2QvZW9mR0JFUmhn?=
 =?utf-8?B?Z2dFZXcxVlZxS3NUTFl3QVZpMlNQVlhlYmVtSm1pSktEQmZCVEZwZElkeFF4?=
 =?utf-8?B?Rnh2Rk5PSmxQSUZCYnh4MFc0bzlNR0oreXVXNzFSL0ZMWXBKZ0hpRXZYa1VE?=
 =?utf-8?B?RmNJa0ZuWGtoU2xaeGgwWnVHUytsSk1Ha2RHQ1MydTZLQXNZK000VFlvV2J2?=
 =?utf-8?B?aldOc0JpRHVHcVBiSjh2SXA1eU05dC9hcU55QWtZUWpENXJKSll6R0U1V0dV?=
 =?utf-8?B?a2FHOFBUQThZeTkwVlFra3F6TmZLSG9WZnpLTTVSdDlaYThRRHVXNXV3cjNL?=
 =?utf-8?B?c1RIY3pFT24xUVRTKzU0OENjaEtHWDhjZi91NnNPUWV1UmdrWGY5dmhXOUZI?=
 =?utf-8?B?TU16QjJXdy9rMzkrS0tJVHU4Nnh3MjA3VEp2YlVWNW1MeFFXYlpDYjhCdzFn?=
 =?utf-8?B?bkIyTDd2bGxacTBFY0YxUSt0SjZScGZZcldLZFdISFVJQmZSYUppV25RVG5v?=
 =?utf-8?B?VHJESlNDbXRSMGlaRDZwTFVzenR3NjFiejlSVFBCM2tsUjY0TGJPTENmRmlJ?=
 =?utf-8?B?OG15RHRmSktvN2FxeTNrLzB4V0FmVE9IbEdZam1nU3B2cDFBbGsvT3p4RDFW?=
 =?utf-8?B?MG1ZSmhSY1FwdklrMzEycTRFR2c3ZjlRaUd6M012Q2I5NFJTajFCNW9BZzhN?=
 =?utf-8?B?NnpneldtMFROY2Jsek9YdkYvckRUc2NNLy9TWlo1YjVoS2QxNkU2Q3pyaVRB?=
 =?utf-8?B?V0x0ZHphcHJvVStabVJxRHJzWUo3QUE1aWRmN2RmL1NCNllZR2x3QzYvUFJ0?=
 =?utf-8?B?OHdjMWZqdnhUaWFJZ2hrZmI0TnJ5Q3VHbEdDc1BZcG1mZmhuc1ZGbjBsUzFq?=
 =?utf-8?Q?XhxaK0gFHGYViIQCflXjrLoEy?=
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-sCZBTL7ZId2JwSdqO91p"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: babafc85-e491-413e-4c68-08dac2575b6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2022 13:36:07.7579 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 65U+IGHiqkymdbdunare4OiaLTuy8w+fBsuuCPnSuFRohpJWmd2h9Ngv8XBQVLXJPJ6+hCC+zqSGbzx8XtOvKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9481
Received-SPF: pass client-ip=2a01:111:f400:fe0c::62c;
 envelope-from=dfaggioli@suse.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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

--=-sCZBTL7ZId2JwSdqO91p
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Sorry for the potentially naive question, but I'm not clear what the
process would be if, say, I'd like to raise the number of maximum CPUs
a q35 VM can have.

So, right now we have:

void pc_q35_2_7_machine_options(MachineClass *m) {
  ...
  m->max_cpus =3D 255;
}

And:

void pc_q35_machine_options(MachineClass *m)
{
  ...
  m->max_cpus =3D 288;
}

Focusing on the latter, it comes from this commit:

https://gitlab.com/qemu-project/qemu/-/commit/00d0f9fd6602a27b204f672ef5bc8=
e69736c7ff1
 =20
  pc: q35: Bump max_cpus to 288

  Along with it for machine versions 2.7 and older keep
  it at 255.

So, it was 255 and is now 288. This seems to me to be there since QEMU
2.8.0.

Now, as far as I understand, KVM can handle 1024, at least since this
commit (and a couple of other related ones):

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D074c82c8f7cf8a46c3b81965f122599e3a133450
"kvm: x86: Increase MAX_VCPUS to 1024"

Which basically does:

-#define KVM_MAX_VCPUS 288
+#define KVM_MAX_VCPUS 1024

And it's included in kernels >=3D 5.15.

So, what's the correct way of bumping up the limit again? Just changing
that assignment in pc_q35_machine_options() ? Or do we want a new
version of the machine type or something like that?

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-sCZBTL7ZId2JwSdqO91p
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmNrrMYACgkQFkJ4iaW4
c+5xow/9H4UPoIvpmnd1wOqa8FODevTP2cmECdlA1iTeO+cqSTlnFSUSKQwMw2CK
yvvmi+wh9u8ToyXcHgr0O8BBl+xle+y7cbRCDUAMZtfj9rzS69ywDLcwyYO49a9k
qvbkHNi7mQF1tFNbtmJU5OYpKBVt11bY4+nfOCKXbEtBD5TIbMEAYNO6EEqPrhTw
8REUzbFcpX+AZceD+5MIgE5BHtodrEWuTooGJEZ2I2xs+ZXJ/9lP+dE1IHqxdBji
x5jrMldu8AX3aAg9nyraFgEiZk/AjD+KlewmzshFqGPTL352KiKncRG8oAHLgTXQ
VJUqtYVM9t0jLrIBU+5LKh2URPqSqTZvmSl6iee91HTVl9AtJXaPeSG3JaGxr8Zs
asV/xhEEnynXWRyWXDTARXc0U9nc9LFXCxJaop7b25M/PWTttaDBIV7uV2lnMOBN
fvCq+Pf/C/+YFk16jqX5uZYj3tne+5TJme2vW/R8tkf3xVdUQsDbBVZ2tNIqlhKo
DYtWLkgoZzF9gyn4+6DI5+JAHUSWAO8t1nwuuaTf+bh7/Rzf/c4eYX5lSAQehhjI
p1W4cTamVAniL5G00xRm6d2pVJ2bwxKctDt72wc3va+Vekoe7Gx4nJIKLBR2lfUC
3oKrUXX4p2/pBuc7wJShA5woQhbgzZI+SPBVf8JbYCQhR9NmKoQ=
=l9fL
-----END PGP SIGNATURE-----

--=-sCZBTL7ZId2JwSdqO91p--

