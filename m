Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FDB6642C7
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 15:07:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFF8U-0003v7-MD; Tue, 10 Jan 2023 08:57:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Frederic.Konrad@amd.com>)
 id 1pFF8I-0003s2-I5; Tue, 10 Jan 2023 08:57:42 -0500
Received: from mail-bn7nam10on2073.outbound.protection.outlook.com
 ([40.107.92.73] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Frederic.Konrad@amd.com>)
 id 1pFF8F-0002vL-Td; Tue, 10 Jan 2023 08:57:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aWUYMxqFvSYlW+4vcmTyKiONI9ZEmwln2fLXTHSSjt8GQsnt3ofXmH/InL2Qc2Uz5WtmADQKzWeyN029JWT+iNE+bpOLMVg6TshHrMuOeKSPf/b5zo0z8kUk3OGA+GBXuoZ4E+6H2IKEcbSaAC4TwJKN8jTSU1n9/PQNy8u88JgjZdM9aznrU615w4xZZhqujivAkgDAEKltM2s921h4M6cy21XiehjtNvovj2TblWqTLx7FtlXj0uy5GAkR4ShjBDxGYHyShyyXFWeGT1aQaWrFrdWzVXl2GDLFTfcq4PeRTqAE/y5ofo6aA8tlMPQQy/U4oTsJGZeSd1OACgM9ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nZdLBiJBAuGD/X+uEGegJK8e8/EAO6+YxxkH96NhMNs=;
 b=Q3PkM5RvFP/WTblUX1UpSnneDU7E/8a1W8w6hc0VSy8bGCVBhh1nAEdTGUJTohGMCFU6ia/1kMWYaMHo0hLXZQOb573S+eby021TNOlueNCgdAS5trirEHs+hrnXn05uVICSD15jXmQy1XWkyrlbHo/Oe+B6ifhhyDbd6AXOdmlnTftBVqmRpitsEf132q0FPZe8MJIa+EKHYEMk6bgcD4AW/8sdzRn+McLTJbde0EhdkejNq+R2O5ZC5cyWYBUK9odUg3A0kdLJknFp3QabAm1RNhR+fuQ9DybADCP/0h6lntXEexmugA3ym1a5IizAsfXJ2Uldoeqd7qPSW9PuxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZdLBiJBAuGD/X+uEGegJK8e8/EAO6+YxxkH96NhMNs=;
 b=YiuM+XF1tT/EPJV6h5FZCnCQBbtsG0Ms8s4LwYXHNiCIlBtSVEOy+R99fXLaXt3YBoZcMxqvc+WvRB+NVOwsrCZlYJbepQrJ0exVJGXAAD0IyXcc6h117fCl62FUdSw7pzpL0+6XMm25nHgBpg6lMyBWxorfYauHwkC9pDHair0=
Received: from BN7PR12MB2801.namprd12.prod.outlook.com (2603:10b6:408:2d::33)
 by CH2PR12MB4908.namprd12.prod.outlook.com (2603:10b6:610:6b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 13:57:33 +0000
Received: from BN7PR12MB2801.namprd12.prod.outlook.com
 ([fe80::55ef:6e90:9368:3772]) by BN7PR12MB2801.namprd12.prod.outlook.com
 ([fe80::55ef:6e90:9368:3772%3]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 13:57:33 +0000
From: "Konrad, Frederic" <Frederic.Konrad@amd.com>
To: Qiang Liu <cyruscyliu@gmail.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: Alistair Francis <alistair@alistair23.me>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Peter Maydell <peter.maydell@linaro.org>, "open
 list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>
Subject: RE: [PATCH] hw/display/xlnx_dp: fix overflow in
 xlnx_dp_aux_push_tx_fifo()
Thread-Topic: [PATCH] hw/display/xlnx_dp: fix overflow in
 xlnx_dp_aux_push_tx_fifo()
Thread-Index: AQHZI++/b0A2iEqKxkSEN3+5TttONK6XrZHg
Date: Tue, 10 Jan 2023 13:57:33 +0000
Message-ID: <BN7PR12MB28017305AA1A9A0FD629F86EE6FF9@BN7PR12MB2801.namprd12.prod.outlook.com>
References: <20230109055933.749233-1-cyruscyliu@gmail.com>
In-Reply-To: <20230109055933.749233-1-cyruscyliu@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR12MB2801:EE_|CH2PR12MB4908:EE_
x-ms-office365-filtering-correlation-id: 4a4dffec-a854-45e5-ff15-08daf3129f3f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k0oF8i6pASOFPZUvRaOKcw/mQJN/gpbRgbWDNErz+kqsudoXBtN8rCYq7yLsWfY6o0IEUGvES+M5g+pRXod+ZWNwSVrI/9i43SRbiQDbcKG5cqPkVLblgUFgqdYRr29NUts9iUxSM01psbJF1fOXdHkugkjXBm3Lqwd/T+tof+HnGH0wv+1YIhsRVHs4w2OEEHAvbm+iZubzGrEMngUtKDPFq0sVenIp3droBxF54i9Xda5MX+K48Q/JR8m8itp/eeXZbZ32VTjx/dQn3w2y1ikmUS0S+76c2iZUtqWpGJKD1QaFczsQV+YxbVjlNvLthpVa2oQ6cXQB2m/wl4+G/QizVCzWPHoQVZ8+X1ZhdFX3LeqRvS37nlR32UjacUCIQtcCXLNG9rEB912qsDMeEfNHMRkJq3fIkMKHazCNlZT9zD96wXDm/uqk8tg1wiyXfUx6KJ61XEyBYAoltxNH9e+6A+eVVKbumZ+t0Cm4QHO9dYZ2WVcpdJxOmhFtMmCs6af0xYImRfcTl/D3PKiOBcUL2Abr130F5Kik6OOgFsbeThTykVuPVNNqP7Djr/7dYcmxwocwoeyi4grYWjxS4quH+78Xk1OnPrSDguyZopZzDSvLp0rX49DBkHqq8BzmNdWPLXOPdICGjsS5JGTs9YEBaMIvvSPAhnY900LIZSZtvw/B1YqbaD90WUl97nPN3m1F4rH70t8ZSUZw+DEBqj9ZhaLalCm23uTfHVpN3Hk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR12MB2801.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(451199015)(2906002)(83380400001)(9686003)(55016003)(7696005)(66446008)(66476007)(66556008)(64756008)(5660300002)(66946007)(33656002)(53546011)(122000001)(52536014)(8936002)(26005)(186003)(6506007)(478600001)(76116006)(38100700002)(110136005)(54906003)(8676002)(41300700001)(86362001)(966005)(38070700005)(4326008)(316002)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+57Sx5rZ0zwW6ME4Hi0WUiorG30F3liBqMIl7Zw25MO9bZOCvbK5rCTLr2lT?=
 =?us-ascii?Q?N9WofPZpCTMXzZZa3jIIToz7mRgQtK3hN0vGWhCH0QRvJ76M7w33SVDCGrVl?=
 =?us-ascii?Q?se08OFZArS9JwiP6RebwpzSxtsCVkBAa05B4MkLwFw4FaLalFs3NM3Z33M97?=
 =?us-ascii?Q?CshuLw72NfwMS80BM4zfJ34t6XWFWgMWRSQrnRWavCIR5Xtdu6gTkUTJ0sp1?=
 =?us-ascii?Q?SJCdmym+QtoI7zJNYXnmO7KbymniSxfON1XZzuY/c/9FEhrdaTZGBItF0Ywb?=
 =?us-ascii?Q?I+83lGJ6OwUcvBSrtguHB170VTk2vk34CnO6is0cZ9tC9lLngZztmp0fBwB0?=
 =?us-ascii?Q?HvZhyFXujF8gbwOhB3To036+pZ0mJJPhYjE6YMhL0c+baPYfcIzr/rkrbhFx?=
 =?us-ascii?Q?rKDSONRgIJumdyW/aTW+zNhA3AEJ+dtLhvio8EuwdengLi3l54bVQO8cJoEX?=
 =?us-ascii?Q?epqikqw9aISaq+jqupcQDsCfG0ARor++7SQEgvC+qEnrapMKM0TWzqUBQDeK?=
 =?us-ascii?Q?51YvobODk5NyNRFqn4Lgghz2uyr8arvqlJcFC5OYuxKpBV9ImjZs4XrIyfR3?=
 =?us-ascii?Q?LHgOUx0VPsZS7SrmQZWaccsMCjWrqbUinxx3slKmdet+/Ku0EZQGvQ5hpOkb?=
 =?us-ascii?Q?YlaQfoPM97CbHoFP0A71akKHSrP5Ti0Kc24WdtZTsev+b996VgwoHUpJ/XSi?=
 =?us-ascii?Q?1zbFxWVf0qNezNYUe+RUB1LSGqGBEpmAdggxjCN+UMctixJDbCxoFck+VMen?=
 =?us-ascii?Q?xNo4SD/J8+8PsmQT6zEtMvTRSIVuB1dCFoiKZH+6I/DcHKF5Yrunb14DRxNk?=
 =?us-ascii?Q?w3CW+bJVvA+VP8oGIQ4i7dur5Elu+2xoeq/G6AEsn45OH+knRXBfV87dc9QT?=
 =?us-ascii?Q?BhkvWNfSlwbDtEs4IvilvH0eb4+oPjcZW2ff715HjmIVpLtoCCOTKiIsgXS/?=
 =?us-ascii?Q?GuzEZfQsWKxzOobzcb/Xf1FXv1cydw+QKaFv61BWXWnGcU2pqrPJLZ+wcOXp?=
 =?us-ascii?Q?Byya8d1H5gMAzTGJ1xssdZAQ1IYB2IM6xjS0KMgyX8bXltLZLvVY0vhim6aM?=
 =?us-ascii?Q?ZzQYnQmGMY0ITuE5YCIrrDcHBB0PdiYhVZEnhXrRR+TPcrBJeD2RE97FdYml?=
 =?us-ascii?Q?4GqGWgy2BqPiVjuGQHJBm4p5YPWtM5uOwajkch2+KEALblWC3UWP+RLXim4W?=
 =?us-ascii?Q?FqHVdwZcaXewRLUeUn+kQ9zAekwYUT0QoOdKK2lQsNiXd56ezzLb7NuNkPBd?=
 =?us-ascii?Q?HcO+g3JwDrPlNGp0ktXIyR5phchKYyPiazWH2syeMdQ8rFBZdke/q+2ipaif?=
 =?us-ascii?Q?VfGBThg4sUwq+8ND0Xa2129zksYEpev6qJ/dik8eTdypG9k1SpQfJwGraGxw?=
 =?us-ascii?Q?HdwAtx/URvc/XO3XUfiKwLVq8hDbi56t0r93hbQeaCePLK8i1bKyElL0UUkl?=
 =?us-ascii?Q?FpYfKG2xK2tSSS2PMtN9my/BA4ct2kqAdQv4VMILtp5hhdERZdgPLOeLLSs8?=
 =?us-ascii?Q?tjtSho/1Hw4hymygD5mC6lEb2iPw9LWFiOE8fW5tnMSrJEWhBmL3uywOL6dL?=
 =?us-ascii?Q?28axBiXRyDU93TKrF2U=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR12MB2801.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a4dffec-a854-45e5-ff15-08daf3129f3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2023 13:57:33.2610 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LTe1+P8etLT1WQaICMuHe7yzpvgfnIKu4M1mBbsJ8VD0y/W7OeVrTHoZZFRXVJDb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4908
Received-SPF: softfail client-ip=40.107.92.73;
 envelope-from=Frederic.Konrad@amd.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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

Hi,

> -----Original Message-----
> From: qemu-devel-bounces+fkonrad=3Damd.com@nongnu.org <qemu-devel-bounces=
+fkonrad=3Damd.com@nongnu.org> On Behalf Of
> Qiang Liu
> Sent: 09 January 2023 07:00
> To: qemu-devel@nongnu.org
> Cc: Qiang Liu <cyruscyliu@gmail.com>; Alistair Francis <alistair@alistair=
23.me>; Edgar E. Iglesias <edgar.iglesias@gmail.com>; Peter
> Maydell <peter.maydell@linaro.org>; open list:Xilinx ZynqMP and... <qemu-=
arm@nongnu.org>
> Subject: [PATCH] hw/display/xlnx_dp: fix overflow in xlnx_dp_aux_push_tx_=
fifo()
>=20
> This patch checks if the s->tx_fifo is full.
>=20
> Fixes: 58ac482a66de ("introduce xlnx-dp")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1424
> Reported-by: Qiang Liu <cyruscyliu@gmail.com>
> Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
> ---
>  hw/display/xlnx_dp.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> index 972473d94f..617b394af2 100644
> --- a/hw/display/xlnx_dp.c
> +++ b/hw/display/xlnx_dp.c
> @@ -854,7 +854,11 @@ static void xlnx_dp_write(void *opaque, hwaddr offse=
t, uint64_t value,
>          break;
>      case DP_AUX_WRITE_FIFO: {
>          uint8_t c =3D value;
> -        xlnx_dp_aux_push_tx_fifo(s, &c, 1);
> +        if (fifo8_is_full(&s->tx_fifo)) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "xlnx_dp: TX fifo is full");
> +        } else {
> +            xlnx_dp_aux_push_tx_fifo(s, &c, 1);
> +        }

I'd rather move the check in xlnx_dp_aux_push_tx_fifo, like xlnx_dp_aux_pop=
_tx_fifo.
Otherwise looks good to me.

Thanks,
Fred

>          break;
>      }
>      case DP_AUX_CLOCK_DIVIDER:
> --
> 2.25.1
>=20


