Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 078EB3A94C6
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 10:09:33 +0200 (CEST)
Received: from localhost ([::1]:39994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltQc8-0006Yz-Bl
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 04:09:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1ltQaZ-0005sN-Jl
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 04:07:55 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:64731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1ltQaV-00055F-TK
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 04:07:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1623830871; x=1624435671;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fwgEjG+EW/it6de3BtumJG/gvZJ4wRqlF8Aon9YtDTU=;
 b=zAE4hv3jGoUkOxVoecrvVfPgvpY+TvrGDsEkzoAdUuKlPWi/ZOsLAQ7L
 InjFwjJKKKDfy7ltEdNPgDBSHBkS+VQr4pqP4BhIoycYLuSIvD2jtcbo/
 kpGFWfoVVzRxdQatqYJ0cBlDCdawrbaJMsVbveMfugc5J9r+Nh36XxjOl 4=;
IronPort-SDR: rM494ouGfxv678oCYH5Y3Tns0ZZNpysIsI1eRcw/JWx654MoiSPKI19yEn+B7yLXlJdBzrvcpV
 IGj2+JaPz0nScchVa15FuNWUWaRurhWx0YHDbU4F89VOPjPiLulvBOcnjghrxRcgXOfbmIWUlP
 N0TEVpfStmNf2SGRm1ahA6OQtcLVPX1SFlmSTF835CIU+QPXEz+d2Q6O/PgpvGNP157sYX1kZI
 DbiXPg2QIdepJDpC51zxRlDtZQnXj7zkq/8jSZZ0JipEj7uUU/vEcbTr2CKEYLevqUhFll2gYQ
 AeU=
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 08:07:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bnlS2CVtUXqVOJV2/MnfvX59TKYMhTHaepJV6Yox88/84iW7uInGF7Y1V3ge55bTuO2SIZWvyJPxI2gBXRdcY46ZjC4PlB61OL2Tx6mfwk275urtTNoF4XHXCvDzCr/+hhsCMFfJ52LteX7D83JggKPTYGRB/lBfkrMAUxSkWfEv1t4xHp9vyXaX9zD1FzLhxUhLwXdckw6EjG494sTfuyLPWO+mKiDye01lR8r6iDEp97YtB4uHf2Mho0DfJ8qC+QBqecHGESFhsIBr27y/13EvCTxdaP6TZArntCFHls3yj09k7m+prPZhfvRqm0+9kWmewVd+dL4PsNgxDk5UYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuiPOJ0FjR1WfqmlLxdRCIRbj2cefTI+YCw7kQxh02A=;
 b=g/s/750TH9TBR4AsgXruKTdD5VL3hi311F4P5QOiReYYyy4ovaDzpwfpvjm3fV/1l+efqmXNpZ3lE7YeLDrT4YISv06zBJSXw+FdBxm+MfSiWmAPXAzgYE/YQbBlh3U/3kF+IAeYyPZgJ2BJrv3RkfzKARsp1i6KOSd33bJ33rCAnCIaUKqZcIWvAOc1hJYn0Va22PLsCxc6UiBQNbGo/25F1D8+x+kGebWyvylK415ehL1D4RKRjPm9CgSyo2YaLRiUPKBzIR/JYTA5ApvQyKdRd5AUvpTjd2twbGpuY4egmRP4oTGDnGm494fkIbGWxNdlKnpP8GpdeuoY/CPpPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BY5PR02MB6786.namprd02.prod.outlook.com (2603:10b6:a03:210::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Wed, 16 Jun
 2021 08:07:44 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::9533:5f34:8b3e:ed]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::9533:5f34:8b3e:ed%6]) with mapi id 15.20.4219.026; Wed, 16 Jun 2021
 08:07:44 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH 07/21] linux-user/hexagon: Implement setup_sigtramp
Thread-Topic: [PATCH 07/21] linux-user/hexagon: Implement setup_sigtramp
Thread-Index: AQHXYkyzNdayBzbnRUaRV3HjqzQbNKsWRWOQ
Date: Wed, 16 Jun 2021 08:07:44 +0000
Message-ID: <BYAPR02MB488698AB4CECA0A05F1B3AB7DE0F9@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
 <20210616011209.1446045-8-richard.henderson@linaro.org>
In-Reply-To: <20210616011209.1446045-8-richard.henderson@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [76.120.51.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d29a8493-b85b-4922-d119-08d9309dd230
x-ms-traffictypediagnostic: BY5PR02MB6786:
x-microsoft-antispam-prvs: <BY5PR02MB6786FD3FD430067869389530DE0F9@BY5PR02MB6786.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t/0amMap7Ih9wXhnjnDJ9duFIe9PBJmapomrIasTdguDNgN6UWcQxX+pi/6NJucmd9nc/j2Qu7SdZFjJAOXDzv7OIueFs49/yEUp7umMmiuK8m0HZwb2iZS7yOEpqAiwpjVB0DWBCReypsgYz435SaLctDMvySW6Vlam7q9I2J3BjNqzx0V7tqg5DqRsCQuGK0wot+ox2B3f5/Hek0BCdeps94zndP1BRRTjUnu05Bs7rZnDwHvpknSfVOjCFjCnaRe5TelThdGZB0oz/a5To6HZrP4BJ/LEv25zgs+UQwZWD2J3Fm26Ai27y3d/RxAdeEyLGmJ0L+m862ahjYJDyp+YfNksyWtBZJ3BZ45Wey8tStmkjZHNWzN7Qrl+HPQ5s5X848ddp1oj7Kv4FR3sX45N7SCO2rEthpe77L93bgRcRMA+eqRkddHRNzfLPhOJAeGvWrzYQG6ki/E+z74WLQTZRZuxflNpj7hICWbAl1uqrBXPA11wII2K9TekieqJGAZN96GAc3G3pBxLQV2hsYWR7lVRMmeGh/ZbvwTEdNzlV6CIjgQelDzSPzdixA984NbZAbdv44xbZYQ+jJesKBlByX0++cL/YwhE8yZcSMI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(76116006)(66946007)(83380400001)(66556008)(66476007)(66446008)(71200400001)(8676002)(64756008)(8936002)(122000001)(38100700002)(52536014)(4326008)(55016002)(2906002)(9686003)(33656002)(316002)(186003)(26005)(6506007)(53546011)(5660300002)(86362001)(110136005)(54906003)(478600001)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vUP392fhOCxfUVma3k2do50sdCLBiZXxJF2/p3XnkiaH3c1BGoj7e9L3ynN2?=
 =?us-ascii?Q?mnP7jJvJxLaq52WavrvXlEtKmJirVQV580HZCZhFGgdQl5oXZXlcbQvae9gx?=
 =?us-ascii?Q?Gl0IQzYzmgQ7FV26b3CU/eg3IXxkz2PZYn8EAK4IyCUSS+3PWhAbXRWMmbnU?=
 =?us-ascii?Q?z8zewO8X2LD4RR7vzIddCgQhoH8A349vEsWDMFTPBl7Eq1rINpcpT8zryMxm?=
 =?us-ascii?Q?CSTOM4cD+d8VAxU/CXycETKWZJR+yHc4SpAJot0oFXGpjKO9HNYEVBV0waq+?=
 =?us-ascii?Q?2xjXdHGe8r2QtkHTcwTrP0+yAEtoIOGlG5ZmT6+FkjkOLZaKgbLKBuFSjxGu?=
 =?us-ascii?Q?pvzdS7DBuVTWltqU6u+UaKwuAbilEWrRc2UWtUKDQ+8IFUInxN+yovoLV/Kk?=
 =?us-ascii?Q?thnPLxpSE7iIHHNO1dp6YL9n7sXfm5kyOzmHkiwjR64FouTuA8iAaEbrAtuE?=
 =?us-ascii?Q?ktFPLuhWozQCZURlu/3Pbtc7xdmBabWc8c2gje3YxyAdvKo6/cKtcHPNv32Q?=
 =?us-ascii?Q?lnwS4WjbuA8g8V2qeBivKemg4kJ/197TFzilNjgnNDFJzE1Qy8rVlSR4+SyD?=
 =?us-ascii?Q?KRr5zfkfscd8VisFHfoxJeVyHY3XjfuEc43Cvz73rfwlHFpFUKr5w569BirZ?=
 =?us-ascii?Q?HGlP9QQHqbEd/ZSXES4QjRmeIrDyhA6STiJ1AoUXmUuxXHLi1Ckcjhkx7dJZ?=
 =?us-ascii?Q?UoNUU25ESv44EPMnXzETFST98e78cP1jArxCF5KSOCtjUoWIGEwTDBZiXZvr?=
 =?us-ascii?Q?KIlAnz8yCk8bfwLw4duZYdPKkkVaSM1tk0QwSJAwl1uXd6JPHJhBCYDbYiqY?=
 =?us-ascii?Q?6TKJMjyVhpY/1MzjLLwtcmabHxunRGa0s4gc6/FcZWqdnnblQ+tmPnYrbxmI?=
 =?us-ascii?Q?eFxyk0/e+TLwinBR7jXCOhuf5bWyOpvaF1iAmqMth+VhLFCfa6uY5TIfF0SA?=
 =?us-ascii?Q?0yDL+NKo9ntrMWkGjR8qfLrWbRlUfDHZK772xcWbh+9L1NdD6STHBpfJE3tC?=
 =?us-ascii?Q?l10RP1ZAglJVtzgBtcl5jIpzz4SSKAUm4vWXyXAQv9ZSiPI+IAmR9mTCkGaQ?=
 =?us-ascii?Q?Ng2i9bPePRctPdlDg/EdUEa42g/fwoXLf1WnLFzB9rHD+/uUB+Rkp85x0rrW?=
 =?us-ascii?Q?Rq6O1xqikR4kPtm+jatQOyZYAk4zhlHQmwszXiZd+bpzLD3S5j0jhjqCqwIA?=
 =?us-ascii?Q?zbNcYwQoUCNTS8dAhhOuNxwJ5vcP9PCFQIVtiXWOXN6hfIP0vT9PUIJpBOOs?=
 =?us-ascii?Q?gSwCSxjG6v0C4yPWanbGmwAuA/m1LjOE8eU6+MwRvA4GAZFx3Kl84P8t5UQS?=
 =?us-ascii?Q?t66AToatQGPp8oC/2xC8WxhB?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d29a8493-b85b-4922-d119-08d9309dd230
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2021 08:07:44.1950 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AkcnQ7yRuzgmDvnJphihATNz2d19JAaLRA2PfzAyqP49xNmzZztJGBtBsaJppPgfFm7JDsT0XhXoc33YG9+Iyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6786
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "laurent@vivier.eu" <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Richard Henderson <richard.henderson@linaro.org>
> Sent: Tuesday, June 15, 2021 7:12 PM
> To: qemu-devel@nongnu.org
> Cc: laurent@vivier.eu; alex.bennee@linaro.org; Taylor Simpson
> <tsimpson@quicinc.com>
> Subject: [PATCH 07/21] linux-user/hexagon: Implement setup_sigtramp
>=20
> Continue to initialize the words on the stack, as documented.
> However, use the off-stack trampoline.
>=20
> Cc: Taylor Simpson <tsimpson@quicinc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>=20
> diff --git a/linux-user/hexagon/signal.c b/linux-user/hexagon/signal.c in=
dex
> 85eab5e943..bd0f9b1c85 100644
> --- a/linux-user/hexagon/signal.c
> +++ b/linux-user/hexagon/signal.c
> @@ -161,6 +161,11 @@ void setup_rt_frame(int sig, struct target_sigaction
> *ka,
>=20
>      setup_ucontext(&frame->uc, env, set);
>      tswap_siginfo(&frame->info, info);
> +    /*
> +     * The on-stack signal trampoline is no longer executed;
> +     * however, the libgcc signal frame unwinding code checks
> +     * for the presence of these two numeric magic values.
> +     */

Hexagon uses musl, not libgcc.  So, I'm not sure if this is needed.  The si=
gnals.c test passes for me without this change.  Are you seeing it fail?


> +void setup_sigtramp(abi_ulong sigtramp_page) {
> +    uint32_t *tramp =3D lock_user(VERIFY_WRITE, sigtramp_page, 4 * 2, 0)=
;
> +    assert(tramp !=3D NULL);
> +
> +    default_rt_sigreturn =3D sigtramp_page;
> +    install_sigtramp(tramp);
> +
> +    unlock_user(tramp, sigtramp_page, 4 * 2); }

Put the closing curly on a new line.


Thanks,
Taylor


