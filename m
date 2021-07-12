Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DC33C6259
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 20:04:48 +0200 (CEST)
Received: from localhost ([::1]:49890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m30IR-0003fc-3c
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 14:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1m30Gd-0002n6-EY
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 14:02:57 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:62412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1m30Gb-0005Wf-DV
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 14:02:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1626112973; x=1626717773;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rQa8CF1pSo6TWJ7UDqFJzE3F+xnHjU/s4TPeUUG1W24=;
 b=LE9wztBMkkgvwOFYPR8xL9tM7S19p88nrnvNJQay49iQshzYzHecJgo6
 X0kAtJn6JNA6pVtGvYRMuT/B6pPc8N8qaAQyCC7iMZrsmHTZliPYRV5Am
 YMEaiPhZrbsIqKoqWB9cCdURhiDs8GC9Z4IFHEVAdE0m5qrJvnd1mHWla Q=;
IronPort-SDR: Z8YDxSSX6/G9BEIX61I7ngisiTzKZorPfoFn/xcOgkQ/5Z4NLtXMoDjEqvgfVuZ29poLxf5vz1
 JHeAECwFQI64mQEfmrJusQvrdXaxXdqcT/OK+IpG74jdxc5ITvR8fctNMdElhl9iGxm6uedOHo
 2i2cZd4NMkdVNfUZZWllfdM/HsgSiBDCis914EkbTBe5mS+A1xrsjtNr7YrqWU8k4urQ0vFVFt
 75t9u3dWS5jYJ5nIacignwJXlyN8kNlYai/Wc6NlM7QPrPlnl3xVMhGKgzPDFmvq5ST4vIklNo
 hFA=
Received: from mail-co1nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.175])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 18:02:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GNa+o1p/kTDjzGcWU2LqVfcxo86FaJ1XFv92p4uIFQWh3lrCabZ6P+7jiCYLDIJnA7Alzuh28PMSq+jH1doJC/PweTjIPvvFGUsk/kcNdhItgO9USTkf9Qs7X1cL2Fpx2ylbM/G/jfe/YCFoLFehbksOOuE2ZLojNN39Qi7oiMtCnhLcfeI0m426AxKIy3g1bTd+aw/NVxM0XvEWpE/4v87NtYihnRF7JCwvTLYLnZl4S/dDhhJNSZsbqZL4xtca/11NmwRbuMTp58hfkdvbwbaR0aWn8WqHWtFBbF5fOseTLDQiB+dMYcJN3v4iEE6hntQMfNnTgbIgPEcEAdsNxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXCPZQ5pn1wdKGmGVgwrfmyYOhwF7PgMoKbnYVz6UAg=;
 b=YJCabkk53dqO9KeIk1aMub7PIEme5uKURr/zpnWdxfM7BziGrkIFYL6ttNEwVx1Z3ky8R7+imUAqePdbmCAvM6ik1sB2dWEynWAsez1R4jcUHe62VFjLqTRPWWDze+A3lIhcM01gkShY2OeUKpdEo10BbIsIxdfByHpdVQGExfeWk03VfF+tSOgtaalIDpim7DKjJGpRSMbwMbt3nk7xTGL8QcZucbYlwrPEnleSqxS5P3sbjqUmjcq56qkr98CCikIRryyLwI3beImcJD/eQHrQoYfRRA5/oLGiO+KZ/BnWYb7OepiO1gb8+tCsCYC4ajkTWR4yVNu5MQVNyQQ9lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB4550.namprd02.prod.outlook.com (2603:10b6:a03:10::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Mon, 12 Jul
 2021 18:02:49 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::9533:5f34:8b3e:ed]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::9533:5f34:8b3e:ed%6]) with mapi id 15.20.4308.026; Mon, 12 Jul 2021
 18:02:49 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Laurent Vivier <laurent@vivier.eu>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH 1/3] linux-user: update syscall_nr.h to Linux v5.13
Thread-Topic: [PATCH 1/3] linux-user: update syscall_nr.h to Linux v5.13
Thread-Index: AQHXdERatpNeVaqgXUOIDw2QF1Qayqs/kgrw
Date: Mon, 12 Jul 2021 18:02:49 +0000
Message-ID: <BYAPR02MB4886A2E85B3653A9C6793E37DE159@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210708215756.268805-1-laurent@vivier.eu>
 <20210708215756.268805-2-laurent@vivier.eu>
In-Reply-To: <20210708215756.268805-2-laurent@vivier.eu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: vivier.eu; dkim=none (message not signed)
 header.d=none;vivier.eu; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 40a2f790-4d6a-4d71-97bc-08d9455f42b5
x-ms-traffictypediagnostic: BYAPR02MB4550:
x-microsoft-antispam-prvs: <BYAPR02MB455018B456F89E1994D60E94DE159@BYAPR02MB4550.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:361;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ezg2VzR9K/h875mAVTw8dHDvzctgK6UBzNecR8miuLBL+eyn7xV1RFxKzAc7zU7FgL7lqQV5B17VZlOtYJM2Yr9k3lxYE1leU6BsN/XTRM36oWGQhx6ZJSq25D2xVC/xMQy0tEkSytDBaabOnOglxfjAFcK0ZUwx5n5Pe5HrI177XdNUec2IuJqcF+QkN58Y/ElGYxeXvJ1pKjxhELdxHOCqLMtlJxXC2rDd7I2xik7wRoq/Y07u999zPO7nXwhZLrShoSGlFESZg9ks0lX90APX6FfMYXRdw9DIPs70UPsbL8RUovUpcOSFLYyGgjwaU2qEy/9PQJ/iUCsHI1Zwgd9+8vw84i1Mk4qezjQOm/WY3iu2lb0h/0cZVr4QoozF6B2w2stzVWIyrBOprjhn9HaV4qRmoWI496adeX3S7xVj3dXxJUwmQKxpnZvNVoBkKuPTUBtKs9u6EOqnhgDF8QaMgtYdWxAK1MAbzUhKUYnyuXeeKJdmuvNd+5HS0O/5yX7qCPeosC6eqf2XnSFkbkpBKxWy0WV/ILdoAuUY1+YRF/NyIjij6hgRjowH1rgmEn3Nb6A4Nz6HuTWROkVRzEyYRQozrSV0O/dBbmKp78z+XPbh9JjGm7Vtp73hdRzHjC7wbZtyvYjSHq7G8kmJ9Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(376002)(366004)(396003)(2906002)(5660300002)(52536014)(7696005)(71200400001)(66946007)(64756008)(76116006)(9686003)(55016002)(66476007)(33656002)(38100700002)(478600001)(66556008)(110136005)(54906003)(122000001)(8676002)(53546011)(66446008)(8936002)(186003)(83380400001)(316002)(86362001)(4326008)(6506007)(26005)(15650500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?K7ts5vAHdsqQ6O07RLJhAhZzVd3n6AFbpZ70BnFtPpQA8LIVEZtMK+7NbA?=
 =?iso-8859-1?Q?2DuvGheooKVOfAcMgVND3fPGO1yOYhcvztYNN0xNaiaH4Q5rq70CO3APOS?=
 =?iso-8859-1?Q?R0pnIVzvdncAHONLBxM9usP28pjp16cwPF3AagNPmmLDAVSs/DgEvxYhq/?=
 =?iso-8859-1?Q?0WsQbRjU4quZDeGWQYyV9vpp9ttcDxqJuqrfdwuhU3a2fjRYgYL5UU6E/N?=
 =?iso-8859-1?Q?XM+62/p/tofC2y5o1cwnGvyg6IjsVjX4D4LIFnqH0GHffIH/s3dzX3lj8M?=
 =?iso-8859-1?Q?v7PJhSK30cv2qZmcROgKkWBJkizDdW3g2Xob3KbKkdw2m8TwFleEEMJHgD?=
 =?iso-8859-1?Q?Nq3wrQP9e07/YQOXBzK2le1y3f51fWLu289fTqqTxsQ9d4EXQ+eg9vWoOa?=
 =?iso-8859-1?Q?fXasJyRummRDZQFz2sTmU009blt/TyFcyCakTQvoLlCvQjEvPTx2WIJf5s?=
 =?iso-8859-1?Q?77qsVOvgJNY6z/vDF8OL6j3R19M9qGzMLFh1Ju3EHDK4tVPJxrTrhZ/Pot?=
 =?iso-8859-1?Q?LrBdxuJUN1jgpREFBGlrdCSXwEPVXz40yPaPwv8yS/ST3kRj/cqzgwb33g?=
 =?iso-8859-1?Q?abQU7kMlvyeCOyKImSXqBynhxC61PyZ3YGYsJHAW1Wr6q7apoB95hzMKtG?=
 =?iso-8859-1?Q?XApAF1fyGZMsvYmklPRkAhpFhIGhc93TlsoSWKc93Xde12Hmii+koEQVYz?=
 =?iso-8859-1?Q?3peJ2oc4Gjuyw2cHPjH/UH7kvbAREYAjwxY6MCQpZOnl0jdw9TfMA3yYVg?=
 =?iso-8859-1?Q?f0MxOSozu/nm4csXk76d6Hs74JPtSiLA/yMmFE8LKMznjLoJnR1fv+6qib?=
 =?iso-8859-1?Q?KTEKg+Lq8X2GU7EYX2wGoIFGy0cw7z7c2Six8Hf7ifr44iPBvNc7YndzC2?=
 =?iso-8859-1?Q?WT8GgxXcPfdQveyNA7rBuU1qFz/bhN64aZzFGa4S4TcLv2l04WGoFcnBA2?=
 =?iso-8859-1?Q?m7Mh0T+wdSYWAKMO5fHNaYElnIXwBhXVsd2tlKQ1ei8TXVEtu999IZh1sJ?=
 =?iso-8859-1?Q?nte7OVuOCIcvoccVQ8mSEZbWZ/XiYEaIHIK5hr2V4+6gHjafYBsUcYK7Y0?=
 =?iso-8859-1?Q?5iM8gCwHRKWXKrbeg4FYfDqcnc+Uc04jvZ5zNw0zxdigOqI5L4DQNDtWWV?=
 =?iso-8859-1?Q?bwVBph3Rcqviy6QHMj8Gjflg9mcIcM1YtnSuNdeSNBvK2mDGi/fnMTWror?=
 =?iso-8859-1?Q?n33VIZ3wfvDg9hIObmMPKjLshtBBAWqk5Lv2C+vvZNZErDYLlx8xAwDHfQ?=
 =?iso-8859-1?Q?QCNd/0J5NJA3+NkCCSVQYeH3GCrdqU9LcSUkNk47gsye1fV0d4lXLGVJZu?=
 =?iso-8859-1?Q?gsIk1x9RguXH8aUUNecL0SAkBlKY/E4XjE+SQvpudHLsBA6qEsxyJJkmvI?=
 =?iso-8859-1?Q?ec09lBpqHW?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40a2f790-4d6a-4d71-97bc-08d9455f42b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2021 18:02:49.2073 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A/KWTutSRlB9KLcHwREzI/rpk9AbHJ5SGnUc3tqKLx3teN0U9fN5dOXx35IsLvRa9IMo3vJAJPf42BlLjZBRwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4550
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Laurent Vivier <laurent@vivier.eu>
> Sent: Thursday, July 8, 2021 3:58 PM
> To: qemu-devel@nongnu.org
> Cc: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>; Laurent Vivier
> <laurent@vivier.eu>; Jiaxun Yang <jiaxun.yang@flygoat.com>; Aurelien
> Jarno <aurelien@aurel32.net>; Aleksandar Rikalo
> <aleksandar.rikalo@syrmia.com>; Taylor Simpson <tsimpson@quicinc.com>
> Subject: [PATCH 1/3] linux-user: update syscall_nr.h to Linux v5.13
>=20
> Automatically generated using scripts/gensyscalls.sh
>=20
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>


> --- a/linux-user/hexagon/syscall_nr.h
> +++ b/linux-user/hexagon/syscall_nr.h
> @@ -317,6 +317,16 @@
>  #define TARGET_NR_fsmount 432
>  #define TARGET_NR_fspick 433
>  #define TARGET_NR_pidfd_open 434
> -#define TARGET_NR_syscalls 436
> +#define TARGET_NR_close_range 436
> +#define TARGET_NR_openat2 437
> +#define TARGET_NR_pidfd_getfd 438
> +#define TARGET_NR_faccessat2 439
> +#define TARGET_NR_process_madvise 440
> +#define TARGET_NR_epoll_pwait2 441
> +#define TARGET_NR_mount_setattr 442
> +#define TARGET_NR_landlock_create_ruleset 444
> +#define TARGET_NR_landlock_add_rule 445
>+#define TARGET_NR_landlock_restrict_self 446
>+#define TARGET_NR_syscalls 447
>=20
>  #endif /* LINUX_USER_HEXAGON_SYSCALL_NR_H */

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>



