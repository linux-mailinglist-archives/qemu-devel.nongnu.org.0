Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A043AEA58
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 15:49:34 +0200 (CEST)
Received: from localhost ([::1]:41910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvKIv-0007GJ-C1
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 09:49:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lvKFe-0006G3-AT
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 09:46:10 -0400
Received: from mail-eopbgr790124.outbound.protection.outlook.com
 ([40.107.79.124]:23858 helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lvKFZ-00072t-O6
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 09:46:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZGIw4sigF6loqTmLNrsHZPnPIEBWK7498QoO27TbHKcIwGt6PGyU57k9LNpKL1a/T8sD86H5jvF6y/4p6SClmg7thypMj8+ayvyD43Uy1zo3qyFi4viOK1C9J03vYaiOI0oll1jTKcCRW10CK4L/fis/FNt2Hyx7ACI+et4jAN8PiZNcpf89ucf6dmHa5eLIug+hNiGttYdnHRh58KzxvwaMXtfo7SOx+G6Mt6KL/X118XfFPKw9LImGvW7E89Oglq3MkWgS6+C5oGRnJFADuKvkJxLie6AE1njmzlFyLGEa1ZThAerCwhN8I52WeEmqvoVyBPmzxby1E/dvd++RAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13mtIMeKxB8DT/wmRSMdQUESM3zD1Bm82oDvEMyGJtw=;
 b=a3M5ArCq/AIa5Mk4tkO/XkjG/i2A/6L9w68TYVYc/efe0PeSF10NhU/corj7i0zB/TD2ZGyEvhnK01GFeOeb9cLvtwZpMLo7lARn/mtZ07t0w3BrecX2spOsS1bQF7vZTwPHI7O/Tx4+F1uNREmt1AT3x51Pzn31n06+d3DPwNStT7TQ7TCs+m/WyUgF69JjbF01ke+H9Vcef9ABsH3yV2kjjkED1CoDlLT1yoWQ2vEmW1CqVTl6aIhIZZqLIE2d1/1V9ZheFPlzhLkw4200QeVNTltWiC5Rek2PWnrweso+btoDdGboeGiSfqBsmU7WxuFymV3eS/knvXywmMJK6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13mtIMeKxB8DT/wmRSMdQUESM3zD1Bm82oDvEMyGJtw=;
 b=fS7yWH9M/Rq74NxS0e16LOJ7s23PoKf/Zx8hiJWt3BapD1pjGn6kL1qTLbf8nIFM41xAGYtXmgxC49TFa6wmoioJwUUQLyN7JAAF0g4UTabFh0+lm1V8WDe8BMuyvwPnhIcdMTYWLyIAntVj+4rIDhZGEzcKilYkeWgJoHNbm52Pf2HttEIlytlkQJ5Ct2n8TC8XBTg1boKmeaDO3lEusyjK16bRuPopa5aKrY1wweh+hSM1Du473VXNrSkibeAqJQwZWdeZOfYo0q3Ongb2vesbiQN3/WNUTME6SdbASSRVdX0MPZcFrmYvqZgWuVLQy6cajFBtTV7dhiD/qV2CjA==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB3619.lamprd80.prod.outlook.com (2603:10d6:102:3c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Mon, 21 Jun
 2021 13:45:30 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::45f3:c2d2:5a00:85da]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::45f3:c2d2:5a00:85da%5]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 13:45:30 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH 17/26] target/ppc: Use translator_use_goto_tb
Thread-Topic: [PATCH 17/26] target/ppc: Use translator_use_goto_tb
Thread-Index: AQHXZj9dws6+nJBcjEytburBjfA6TKsee+Gw
Date: Mon, 21 Jun 2021 13:45:30 +0000
Message-ID: <CP2PR80MB36688249F0BC34C0F743F71CDA0A9@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
 <20210621013439.1791385-18-richard.henderson@linaro.org>
In-Reply-To: <20210621013439.1791385-18-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [177.9.76.249]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97c5e35e-0054-4049-bc19-08d934bad5c4
x-ms-traffictypediagnostic: CP2PR80MB3619:
x-microsoft-antispam-prvs: <CP2PR80MB361945B226FB013AB59ED731DA0A9@CP2PR80MB3619.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:400;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BbqRsy8l7YyejOForWddvVz9qdrFpdnMTOQyTj3LQ2NjTAXivD3xqXT4PGGhwSq0Hd0HPT33E24CrMESBl7n0DHHOmctVc0XYad0QBfpyYCPn/K37uGqjFTf23ACjVSl2SCA2j/RiZr3asMTNqeWPGdcpV/QW+IB9tCQcJapwBLvA6f/FzCsV/bIY2SgGVLBBapauEVnOBhwYIVRuDG4hQEvHeuNfxN0UMZ12hixqPc/fM+druZPTmyZ74HaO2Bo+VqW3w/mO8zApFGRnXxNh0e3CIYEUVxkxaLwliZz+FalLNsY5OXvs5/nlo+By/e37JaxyWM80ycU7ALVlC7eJJuteWTiqV1iVG+Cbo/w3C0DvO4eT1AiAwqictzusqH8oGf+fSuIi7qlHVmFPg/bvDYY7O3FC8UBLrQF66cmAFTBhgxOLyJ5xw4yEncOFbdIV4VMqEtESm/V7pkdIBZbor6EggLvYcoOSUIc+D2YGdA2VPwnY87Jaf8clLLErjpbAiC0tz41XcIVSv12307wuJn48nN26M3fzAvFnLbG9pA3Q9u7+F4JOkNliGrbH3HABKycWs1vOdev2fSMCD0GQiHigu7h+2CzJY6922vOoRVz3KbzqOhWEgpjI1Xfw1ab4jOacLLfeAsoIbJ7q0Iuz1O6UVPgYY7x8hMoauIwUNzIkUwQF1G4Iv/Pz5aL2gAuRBPkDDOhIUtBPr7xZjZ4KPpbmrznAiNNsdZl+s9SIeE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(366004)(136003)(346002)(39840400004)(8676002)(316002)(55016002)(558084003)(6506007)(9686003)(7696005)(71200400001)(8936002)(33656002)(4326008)(86362001)(52536014)(186003)(2906002)(38100700002)(66476007)(110136005)(5660300002)(66946007)(76116006)(478600001)(122000001)(66446008)(66556008)(26005)(83380400001)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iujqx3YbCSNoEhyNSQRSiNP+SArHJcebW8/7koaSCWrmf+8lLCPXEOVM83C6?=
 =?us-ascii?Q?5wdHSUzoHnT1ENKZedCU95WMljFYwWjhQ4ngCaIDY9dbQ79MMnxIiYI1PCpV?=
 =?us-ascii?Q?fIGxBSsQN0KTVJ8LrLaQw91UwPSy5acrhtdcYBNGCCyEyGRqsiRIk1S9dOHs?=
 =?us-ascii?Q?kARkbZI+d49UzXPABlimSxcxJgmBbUxrMdloA68W+yYaCM/2P3sfW4gK/5d4?=
 =?us-ascii?Q?p0banffrOBiDGaaUGldjUPB7NBheBGTbYvR5KpQwg8jTaxBx2f3m5X8mt/cp?=
 =?us-ascii?Q?NjiAg7D1/CVK6L4KXmhUU3l/hJoRr6/l5ZJ7XQWmvly/AoYpLX9H3nUatFad?=
 =?us-ascii?Q?JNa7yd26KOXDabyCxJXaCk80Vlu+yg0Svqow3hDqwwu11F6VwVLsDSEhsH/m?=
 =?us-ascii?Q?KeNZ18RRdI8v6yYAhrBlMMfPZVDfg3KVAzJbO/c3+tSY9dhAWUjaNNHAPUHW?=
 =?us-ascii?Q?Vt8Y/OFFfvjYQujpCPXnG9ff1eQxQRqVhZsyrZCSllZDAyTYyiRCeYPFf+vI?=
 =?us-ascii?Q?RGPsbh7mT11fOf1XCVzj84Jq2/K1GkCamrD5MCZQXt5A2pHKb/wVGfV8lcAz?=
 =?us-ascii?Q?0QxQpB6CF6sVFSBdpxmEPa+79QPYdRD8Q8KdwRw2fngq6W+qq1iYWR/oJotn?=
 =?us-ascii?Q?hYFTIRFcYueaDUJh/YudEVdOeBl2/sdD+3znkjFeuCXyDGyTYsPyR81gvsYb?=
 =?us-ascii?Q?CxIIITUsI99GbC5zVkVQCdZR935VeVToRajEan/4LciDz4c8MopYf6I6jCrA?=
 =?us-ascii?Q?XTVDVptes/Gq2EwAgomd1GcoO5aFFsprr602u6FuGNh73rDewhOxCKkAa2lX?=
 =?us-ascii?Q?RmyD4WnxJPwMBBelTNcbZ9mQIqu0sFsB0zQ2PXo/ntSfjWlpsWviPMVhCfdN?=
 =?us-ascii?Q?FWfkPHSnyBc+/O2blkXADXzIQe8h2umJhJy1RCl8U7NmGrxBJzbeaeC2A9Pl?=
 =?us-ascii?Q?goxjLSmck1wpKZlTgidVRHxN69UTYpg6sc4aR+jYc5WNT+gTL7SCpvmWwJVH?=
 =?us-ascii?Q?6eLVoyIBEAJTNX1+uusPe5ShpTqenrSjEG+TO4sekENpbZJeINZyHt3qzdij?=
 =?us-ascii?Q?tm+xKEZsCd3A72+kFeSNLeQj+/5pnv41sl0SDSVoiJCq/ZDRftqeGff2Xl3g?=
 =?us-ascii?Q?XYn8f2KcfXjGmyliL5DRth7MxBdmmgNqs1025VvJbBZFCaFzGK9Aw93Dnofi?=
 =?us-ascii?Q?mMOVVTb06q85xU8Ic0309CvsAMBTQ7o0ik1M/A9++u6ApMNJbBDwRa2MQI5U?=
 =?us-ascii?Q?R8QHOJgq76EEckNbc+es7BQYz01EOvGmUPPirDGdwX4mXJvYGVqysyaOMrb4?=
 =?us-ascii?Q?Afs=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c5e35e-0054-4049-bc19-08d934bad5c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2021 13:45:30.4297 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +SeP6f9KvpIYBAw8LIulCdqSvMLTH01mbsufjwUNVupDdRIe0QtT1rI3B3ZNFDJRyp79Ix4LbZFt5Tmfc/MJmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB3619
Received-SPF: pass client-ip=40.107.79.124;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM03-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/ppc/translate.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

