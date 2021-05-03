Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9763715B4
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 15:07:38 +0200 (CEST)
Received: from localhost ([::1]:52674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldYIT-0002Ap-8q
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 09:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1ldYBP-0006ot-A7; Mon, 03 May 2021 09:00:24 -0400
Received: from mail-eopbgr790120.outbound.protection.outlook.com
 ([40.107.79.120]:52352 helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1ldYBN-0000SS-V0; Mon, 03 May 2021 09:00:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AJprewXpO6FCmmYGe4KpDr1TBDvsNh3oNItreNhSsCRDVj7muWRwSeId2XNSXhaul2r7r4v+6w1IIOyGOFnf0btwlRoBWSp/02niie0eopuzeATeiD8V6NjR55soZgEaOVLBGBIgvsioAt09OL+wsjwGdQEUS3AC/UVumIhkRBVAVtlUsIsJQOYr3MxjChjhbuGPwlWw1SA4Dpl0KH7N3tq8Pb7lsxXTSUujLpPLJR4l+ybYbcKZEH8k7M0DRw2L43JivpRYKulHq0jJwCaoNtUWiR3GgQYjnYvXIWatARIC2WEzfDhY1Qc2m29y1WjcybFmWKSM7Ind2KxCVW32+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8kuxlPcP0kiFp5ihpVaoyWjeveGbd9Qy5KuyJz0pvz8=;
 b=gJt/xNCy7HtdhG7G6q5H9qfto66Kv14EEgWKzBPC1ojYR8RInBh8FTVJDCSXAJVClIqIWI6ub6oLStUftBBN5u4EdEuMdllU8hMvieBSdq/eckZc4wBkX2WJeeB9fh9ednkkiUpdOrTGUFd50EEwCyEdJgkYw9UOe/Rjnixi/ouV9Ms/m2Sm71fc8kVbG/oWD3ly6dE8xQEAiAZGzZLemTjuZtYJ2jLWYP28LHWWUd+0jywskxULMxUlWavxTb6867lW2cEFgutmQDgt/mZAjYuKrVBg2fWGXv7e/CNuGE260qgsV7DJWF6wLQ0n81Vebai5DzOJfmvB6BdSkDPl6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8kuxlPcP0kiFp5ihpVaoyWjeveGbd9Qy5KuyJz0pvz8=;
 b=cKrIMrIrC+paBrvc83XkUR4CXgbQGNyhMfngZsvq3ypSqjIACV6NIZCdN1T+oMVir8yuwfzAfLfsXopShyhWSwZsVJrP+kfMNaCfkjeC3UVrqz4BOBhM4hS6Kb9RWCswieddWv8netWenB4F5a/IAGontB3bJ3jczqc3bDK75daYZ7IYG0uIaGIxXzqZNOHVpO3MuH2P2Ciya8MyYH3PCDjfmpdajIUZw2qSn6/nFbDIAoBbeUYPs3/kwDFsEXmAZCabOVqpyTWFFQBZFAPxx1+ZZ4MO+Xz0sqFxNpB5O53gjLjc9zGhrx4nXAVjWSO9PREvrt7xEWK2L/6SOJXfNA==
Received: from FR1PR80MB3670.lamprd80.prod.outlook.com (2603:10d6:202:25::14)
 by FR1PR80MB5179.lamprd80.prod.outlook.com (2603:10d6:203:1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.38; Mon, 3 May
 2021 13:00:11 +0000
Received: from FR1PR80MB3670.lamprd80.prod.outlook.com
 ([fe80::2c95:a735:2e00:5ee6]) by FR1PR80MB3670.lamprd80.prod.outlook.com
 ([fe80::2c95:a735:2e00:5ee6%6]) with mapi id 15.20.4087.043; Mon, 3 May 2021
 13:00:11 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 09/30] target/ppc: Remove special case for
 POWERPC_EXCP_TRAP
Thread-Topic: [PATCH v3 09/30] target/ppc: Remove special case for
 POWERPC_EXCP_TRAP
Thread-Index: AQHXPV5fjBsGUOx+4k2pfaROF3PGqKrRvarA
Date: Mon, 3 May 2021 13:00:11 +0000
Message-ID: <FR1PR80MB3670054B0ABB2C94B9E53123DA5B9@FR1PR80MB3670.lamprd80.prod.outlook.com>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
 <20210430011543.1017113-10-richard.henderson@linaro.org>
In-Reply-To: <20210430011543.1017113-10-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [191.205.120.173]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a3287184-9b58-4f97-e123-08d90e33631e
x-ms-traffictypediagnostic: FR1PR80MB5179:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <FR1PR80MB5179ED3AC5D06A391458768ADA5B9@FR1PR80MB5179.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:489;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xUtumWDHt6uQJLrXSunt7m3Pg0wj+xxTsGkc1a867IHzQ6BfDZ8AxLL/mjoFWvYuhAIBuZ0K5dX3E/C3QuRfA3ibqD8s1UbnV68FGzKq6crRWwEa6gFyKu7Oe3NTQCylj1ySJso2VyA7K5zR05LMR0Z1iamAKcaxCxaNa4CpnD2HvGl5qhkLdz52wVefVrbBOmvQ4KHW3qd88mzcTJT763aT5LXkSF1GnGq9eZcBR9dDC81IXhTDebXLwk3vCfJbzGGFS/cUsRHmm2Yecgja/rAuIURVCxO9v2Ez4d4rowhENsfMpDKBMd/i/k0gXxFkNzkFJcmyOF7kgcewMNECNVijFIAzPd2iZfcYJb9Fy/7ySU4aiglNHZ9kFwGjKfDEdG9F3VPwJT9tuVSbN0ISxwtfodnKh5rs4dnbCzqL6slaiANjjj3rKkxVsDPySytAX2aJTfpvQftKpGKUEWR9iNJQDnZhDM5Vzu6jEuTVZKa80Vjn0sEl52nvVEaW/GnCy45CwvmaxZYDBebfMWQaT/eOtPIiH9uPy330LaG67OsPgKmzNWuHe3DKpY0QxP6bO797cgG3j9uZnZI+wiC26QTc3LRtkcyV6J0P9MKbmwY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:FR1PR80MB3670.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(136003)(396003)(366004)(376002)(346002)(4326008)(83380400001)(110136005)(66476007)(66946007)(64756008)(66556008)(2906002)(66446008)(76116006)(52536014)(186003)(5660300002)(478600001)(54906003)(7696005)(558084003)(26005)(55016002)(38100700002)(9686003)(316002)(33656002)(6506007)(122000001)(8676002)(71200400001)(86362001)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?7u1I3aAY8tVyZT1AyNEAJ2VnmsIe71FRYWTLjd73fKxhjwLA+2xOZ2c5HaxK?=
 =?us-ascii?Q?qu4Z5j987U/EBxr2EypI0Lec40jaoHKGIwsIEoBrsT3DGc5DQ/sPs0v+C6AN?=
 =?us-ascii?Q?hk+vB9qU8Ytw3eK8teWy1r0MqIljhwYmjbZggyZz9hQ+U2ffgqQO/zyVejrs?=
 =?us-ascii?Q?00u/erN6ppQQ9RvAJxNqYEibX4AI3din9f6JQR0K6yQav19LsTT1tzfjH9PO?=
 =?us-ascii?Q?jJczyY2KgtsKbbhBtSFLgZbjKJ1xAQK8pfAyy3h8MTKQ1zytZ0IE94wj8c5s?=
 =?us-ascii?Q?+xVXTv3rB3SUD89L+CJv0iTSaKhOqdvYC+YPUQjdPCsg+EVFJiVLIDzXvSF0?=
 =?us-ascii?Q?IU60P4mT17IIPGWYq0yLOwpa/q1svlMT2pwv8o8FZ9MnAtca2TtnVl1RC1ya?=
 =?us-ascii?Q?CFSpRpBegDNXXnYDZACEF4q+NCw1qf533UiOmtK4LJoEYaymdK8Oa9QygQtB?=
 =?us-ascii?Q?C6ANPgM2soGSk9HeqUh+1ilTE3KC2LqlqIAF9qUNEWdWJy8zmxR85DJcdmRA?=
 =?us-ascii?Q?FMmPWns1QC1ZmDlCsSYaH+opn+d9fWxw7tQN+VgMJx2GOjLfgB//0/q2wott?=
 =?us-ascii?Q?BEYziPrQsgFgagXbWFKm4tBSLK9y0IJEL2fC68hfJf4rgaMRJA9UqVaTTc0c?=
 =?us-ascii?Q?LWAzBF2F3FzoTOKIEcYNLKdEdO18xLHdOeui2MuD0eX5aEtUmKju2obW+6r6?=
 =?us-ascii?Q?Ly5suu04LNGI5VxvepUjiKQy4zWhSeWxFh3SN8z3CSEaVlqFM0RXKJM2ilWM?=
 =?us-ascii?Q?kU28mUqvJUzSIz8OAKHjaPICnSmoPeCLFP9EIyY9iXPpMIdp0b6qH+N/oQAH?=
 =?us-ascii?Q?dYhxdrP/wysZzK/aRBT1w2yRuZhFgxl2Qni+cJOIKLeLOEjoikF9f5ZtUVPH?=
 =?us-ascii?Q?V+lmFF57btYzacIvonPgc8BiR5VKlFkNHuYCeMJM+skflisG3+rY2Kh4Tlnw?=
 =?us-ascii?Q?i7p0UwwVIAKr0D/3rECsuJV+5HajbQ2HWcs7vH8J7gOVDkPfIVryD8wLtKPy?=
 =?us-ascii?Q?EItTyLgFKqZvEXzv8NvUGuAV6Lco2bgfWyzBweuUbBVo+zXkjzet7bIDrr9d?=
 =?us-ascii?Q?/COo1FmlseQkSlHnm0d7Ftd0vHWunPKVKs+9kFCz3wEGNBSzoMNRllbCUdGE?=
 =?us-ascii?Q?Fy7feK5SRqSj/VhcpAfn/QS6VCzXaLPo0gVpenG3sJnq8WtR4mZFJEFwbkPj?=
 =?us-ascii?Q?e31jZH1VtbrdsY2HBZcQ1qoUcqTZEifV9rWDld1CSYvSnOZB0AAxcx18Tdyz?=
 =?us-ascii?Q?5sa2jl15WeIfv7n+99860XlAvFa/rkpG3uE21N9tmah+8XtHCw8yUVd66K5Y?=
 =?us-ascii?Q?1C5ZbdGeLGg8SoYACNcOaQIx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR1PR80MB3670.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3287184-9b58-4f97-e123-08d90e33631e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2021 13:00:11.6154 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ocnr55bbCGKVlEyJxpTeDKMyi3K1sLcSuujGgQ91ZTUR/0HjC+EWZ0VhysmoqKZFBGVa3j6Is4slmMnDR4o8nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR1PR80MB5179
Received-SPF: pass client-ip=40.107.79.120;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM03-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, TVD_SUBJ_WIPE_DEBT=1.004 autolearn=no autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>
> Since POWERPC_EXCP_TRAP is raised by gen_exception_err, we will have also
> set DISAS_NORETURN.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/ppc/translate.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>


