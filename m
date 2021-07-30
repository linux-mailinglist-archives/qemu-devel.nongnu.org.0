Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D33DB3DBF1C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 21:37:49 +0200 (CEST)
Received: from localhost ([::1]:45684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9YKK-00032y-U9
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 15:37:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1m9YIm-00022p-Uj
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 15:36:13 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:32265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1m9YIh-0005WC-IM
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 15:36:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1627673767; x=1628278567;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wZ3/EgJ69UVXva7Enb5edcIvCqgI98iqi+TUI7AYT2w=;
 b=N3wCGSTUWItMM6ugiy1Bclk52Fz0yAdLzG/GE/LDE7NX6gINmY2Cf1Jt
 n8q5suW1LexWRCk344ZWvCvAPAC6QvSj4pKypn7FeDj96emE64EY6OIkf
 KhJgjMXpC1zHfrEzmY+/yQdQNmGbeOCiYRJ89rUSsgHpHXGS528zgGYP9 M=;
Received: from mail-dm3nam07lp2049.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.49])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2021 19:36:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8wsopcojCeCBnuLpRCmq4Hku8tweavhbN2CQ3UbkH+4C48z2somRFyMfPAPMQiN2rN6L63JvIzZkW2IVHjKG0INcnStYA06TrpTcvm4+Tn3EeFHq+uQpyLCzvgoOgO//R8I0hlpgdNirW89K0ygYEh6w4k+rg94yGdBhkFE81C1TJoZts2UIuDHg3SZnBtT6U+x8FWC35WdtwsZUb8E3ReQ9n6ELbyQA8WM1ymgrLHKkwaX+0w7OfbtHOakEf1HlG+ktVyExbNXiXyPzVhVBfVFc27GW5krXQ+Mz1nQEtnXDfkoeMyJ3fD4uR7weiWJhesfgzb+e6GjwIPDALrbzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qvfyVrvdpmqQI5+q+hjyYkcGnQsxTaGiaPbjrmF7mU=;
 b=mzqSdcDP3H580CeqcIUVospvDptJuxh1msTewlAM4XmHe1Pd6j4fghc4wAgYjXjkZInp6XIOWe7fHyG/Hzaex1ZMibiClob81YiMAzL3bnLJzF3Otu7s6sIq4gGCFgq9ARCmNRLSj+d0s5wVQHd6sITpj+hXDw7v77qtjPfDjz1HaWkAcB2/oQ/rTaRLs5FqBGaQ/xL1b3wVKTZ07VbufcvMRsrROz8KbhzxJvoVX/6U2OG5x/q7VkSQERg4iXI2mvpt4yhiDyQ0iO+d5A3xElEUCrg0ohBrzGT5vo7GMEWqAMuZKXMgZ5ywAn66io9qbsk41XIiMFekFd+Ms9TEXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BY5PR02MB6673.namprd02.prod.outlook.com (2603:10b6:a03:20c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Fri, 30 Jul
 2021 19:36:01 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::d91d:e6d8:ee5d:77b5]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::d91d:e6d8:ee5d:77b5%6]) with mapi id 15.20.4352.031; Fri, 30 Jul 2021
 19:36:01 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Peter Maydell <peter.maydell@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH for-6.2 5/8] arch_init.h: Add QEMU_ARCH_HEXAGON
Thread-Topic: [PATCH for-6.2 5/8] arch_init.h: Add QEMU_ARCH_HEXAGON
Thread-Index: AQHXhTJzDosPtw8T90W0Pr3WW4f8Yatb6adw
Date: Fri, 30 Jul 2021 19:36:01 +0000
Message-ID: <BYAPR02MB488645863243D2BA849E7878DEEC9@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210730105947.28215-1-peter.maydell@linaro.org>
 <20210730105947.28215-6-peter.maydell@linaro.org>
In-Reply-To: <20210730105947.28215-6-peter.maydell@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc0917d4-f254-47e8-9ca8-08d953914395
x-ms-traffictypediagnostic: BY5PR02MB6673:
x-microsoft-antispam-prvs: <BY5PR02MB667366CB2F4ECD5A27C7D6EFDEEC9@BY5PR02MB6673.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rAx91Aah2iKgMzkVZ9MO2drmAjb4CWwJiW8dy3Ppoffw8j6onoPBmQw5/1lrOtZIZyUDEjEv2moaVP3ik+G/3WlEPklk1ksEaV6IjE217yo3xQ2vwf6o1IYEDeMkQV4dqTJ6/QJtzKNNRRiVHTqAQupUy2+AAS4VG+C9BY4C6dLaHxvooXLyPH9TdktVCkw8EKEoKs6hzRbFBqbz4LYVGzOcYkjsT3T+7C33U0Dzbe7eUYCKf+3aqHXW/nHKCFeKwD6Ita2oDPsCPiprK6UdpNJDuyDY6n2XIeTNz7NpHNUqTkGXaGEk+nT8hB8WjsLIAzug6bmVTz7ZI/ayuOLQlE76FUSoAKvcTDr7/l0GgyobHArUkGwQS/Pru9y7fS6uk2i6fzOGnOdZh1f7sXg3vfb5LuOTLToGBEPxwwF1yCkksOS4zQUdtghr25Kl9W462spFRHmZabYUo0EoMh0ZayesG7TmEAFdQn6fqKNFMPruKX/3+gyIt2wL1eeihzGKfWteIoDKuNqQ1tW2j6OBrL7qbycihzGhOOLKRRS+/UGWDlcvx4poDHyuOwdUKjtY039z15IRgX0P9G5jhKS1cGrdRnbyc0kXp+6MVmLuFMEF9QU5RtVQLIr3R6c1Oi1Mla6iPEKtxwj9dlQMCKG2aMQZ4a26oNmpsxt6UsYcM575xQC2uGVsvo/NgAnshUH3D2aHGT2itPQWkVNW5tFnjg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(39860400002)(136003)(346002)(2906002)(8936002)(83380400001)(8676002)(4326008)(66946007)(4744005)(76116006)(71200400001)(66476007)(66556008)(66446008)(64756008)(5660300002)(33656002)(478600001)(110136005)(52536014)(122000001)(55016002)(9686003)(54906003)(38100700002)(316002)(26005)(7696005)(86362001)(186003)(53546011)(38070700005)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xsSwqQS5GtTu4eqMtgXP4NbRHsp8wStlZ830JqMqeoxNii/N4MAXUGhpvHdP?=
 =?us-ascii?Q?QRe2SSCw34jARWjwEHaPh1/Oz/ZqcMi0ogruoAr4MJqYf7I9j0D5pG0O8NaN?=
 =?us-ascii?Q?btdsXqDFPTiRt4hjrOov0TiStLEw1kx2It4DgwCmoDOkjz796Ou7t/iWDgTa?=
 =?us-ascii?Q?pJz7D2rKKMYeihZJn5YOWi91yGe/xLoaYzNvKIm3cEbYFSejRAZi7sOG9GCM?=
 =?us-ascii?Q?3RuNjhDGvDufO/ersVUYp69Qbk7pbn4rU1+ok6/Wbi8AuE6Z+Dq3iy/yUmEu?=
 =?us-ascii?Q?ozUyRCQGiUy+UdRoECYLwYx4kuatN19BpNYyyPAqDuAZ1kSAjKWdxfK0RxyP?=
 =?us-ascii?Q?G11RTP3Qs4BfqZSPhNujISOiF3rr/WxlRdO8cR7V6iPbyv80YHhUo+l80ubP?=
 =?us-ascii?Q?n6TwmS4fAjdt21dojXZvh+OzHCa8o7wODXm8VUuQi+qv49LbF5l1FQtFUtzW?=
 =?us-ascii?Q?t7Jcc1EjdLann85/HnbXHyjVUetlXicn9ZkfuW3yvhzK5oDCwPuaSWLXl88c?=
 =?us-ascii?Q?tHZGOtWIN5Aq6sKONWzJZV7+xpqm2qgYz7vSraq5oUS/5YNu31pGX2zs6wk4?=
 =?us-ascii?Q?7iFdrl8oWgpTxtd2uoaAsTf7r4Q29ooDzmf/BdA3aXaMps/4E0NiJybSHWVw?=
 =?us-ascii?Q?BjZTTxkTUSKNXK38FrWlMna8alHtVTYYfJhDAeKJm1SZ9eYG3f3qTVFQcxhW?=
 =?us-ascii?Q?gU1Qf8+Lf9QiyXDRRbp1nz9NEt1wBnmw3PCuIG/409jjqeUM2wNlhDSCOJnE?=
 =?us-ascii?Q?IDv2UEirBiaAUSbOb5KXAFckJ91o47j1L7+GkFr5ko3B5Hccu0EwoGVS6eAx?=
 =?us-ascii?Q?VYPF4u14OS0Lf6I2ivraWlx0syQ+KxHbXtxIURWXWQUwLKmueJLNhwRJC9La?=
 =?us-ascii?Q?20ArqjCFUSrmmHJPPA5ycruakjK7AuB62p8kPS5bFO8GBjuxhQPVtJKuonbh?=
 =?us-ascii?Q?Lu/II7GDChD6rkiEtbGjeLD82XkBFEvLAJF1IPca39ZfHxHOcPaGqqKrFMLh?=
 =?us-ascii?Q?sEi2JhV+lUxfmNFcyHDC2akNMvggg28jorpeSA0zNym8NDhLfudnHdJ31dje?=
 =?us-ascii?Q?yTrJnl1vxbXQxvTz/llAkcIEdsALnHOK659aSf2cqdctLsTQkhKwJz0UHgST?=
 =?us-ascii?Q?t4AULSiQMsx4AOm73BZEAaphx1dwFbjQLQNwZhIqFGJbgod/ZmPyT8RFYzDY?=
 =?us-ascii?Q?iPF+/CzjjHk166ulz/Xq5VREIy+EFOBDicuxZtax1I64S3Os12iZqyezzAdR?=
 =?us-ascii?Q?oCmn3lw+TKJ0bswIG7NRLlvewodH03aj7OaBpNMXkkgl8gS/3Cbdo+GqdGXu?=
 =?us-ascii?Q?oII=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc0917d4-f254-47e8-9ca8-08d953914395
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2021 19:36:01.7538 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YdhjmNI7c4QpqiOEeMEn6HJPL3RHbKCfTeK7hKA8W8/tHy51Yjg8cBih60sujvTyLenbMQU72A6NNzntLg5p/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6673
Received-SPF: pass client-ip=216.71.140.77; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Qemu-devel <qemu-devel-
> bounces+tsimpson=3Dquicinc.com@nongnu.org> On Behalf Of Peter Maydell
> Sent: Friday, July 30, 2021 5:00 AM
> To: qemu-devel@nongnu.org
> Cc: Paolo Bonzini <pbonzini@redhat.com>; Markus Armbruster
> <armbru@redhat.com>; Eduardo Habkost <ehabkost@redhat.com>
> Subject: [PATCH for-6.2 5/8] arch_init.h: Add QEMU_ARCH_HEXAGON
>=20
> When Hexagon was added we forgot to add it to the QEMU_ARCH_*
> enumeration.  This doesn't cause a visible effect because at the moment
> Hexagon is linux-user only and the QEMU_ARCH_* constants are only used
> in softmmu, but we might as well add it in, since it's the only architect=
ure
> currently missing from the list.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>


> +    QEMU_ARCH_HEXAGON =3D (1 << 22),

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>

