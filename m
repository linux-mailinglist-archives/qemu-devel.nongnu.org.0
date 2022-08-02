Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B279587EA7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 17:12:11 +0200 (CEST)
Received: from localhost ([::1]:60750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oItZ3-0005M4-Mp
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 11:12:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Frederic.Konrad@amd.com>)
 id 1oIspr-0005dR-Pz
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 10:25:27 -0400
Received: from mail-co1nam11on2062b.outbound.protection.outlook.com
 ([2a01:111:f400:7eab::62b]:32448
 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Frederic.Konrad@amd.com>)
 id 1oIspm-0001Gk-0x
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 10:25:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B3IUakPByZ1Kzz811m5FQC68gDLuBMHhes+5wz6qjDg63giT86JAeF1iiRE6aYv8LqdOC2zZQsZ3OvaSZDfEc0hz0QUc/+1zFwVkdl2YJpxGkC94vWZ9qykPglSiBXyCako80mA56czQYKM7llZxb5lvZ6JR8FJRgxqCnTdqVVsxfKL/+CZiHOHxwrWNca++kbV4M+DR9/+Hanbf3Xh8Im8lj4hVuQ2YfsC4b/Zu3u7xHZ3nlwvRQcPs6r9PpR0rqJdN6kmLnhlghqlxDEGENzUjl8/QdNbRzPmlWAnv0zK/zX7hkuNaOOzUZykzdlRD2uD83pM7IIFFe/aOhP9u4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8bQF05bGD72gCJLvIn3KkrVR1SoYLxRh7+pIp3TENfw=;
 b=kH1DCIyxTSq8KbFWW5TUexebvQrs1BLTFRuXRBUiFMY4in/CkV5Gu9pR9ICuwIEiJrq5343jk0ojzFEmqRE6PR8jM4EBXi+oJxIhYxImaTVJ8++Rf6UdDUXSaVcxpvio6zW8m/jJm4Bsl5b3S2LBaQLiFk9lHbnTb5lB/BVNzn8y71hGJ3uWwJlCIVoq2+4e0GJgEa+7iCuVkoGiJyAYkw1d6B0HL4I/BZ+AyqhCAHn3EY9TivBfgKvCfewT4viTYClyrL4bN498H6dY0K+tGD0qAq1qU4MkYvNJN6Rrssf8eDZJiYBUMSRi/bAswcRIZ4aDQ9R1bXwH6rMWm6YBrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8bQF05bGD72gCJLvIn3KkrVR1SoYLxRh7+pIp3TENfw=;
 b=arA0M+1teh01Dm5y00HFfoiUBVCSem/bqb0b5sNt9RG8xFMQ+hO+BM9NkSwYFXuRXG3kjj7aGaeWl8SplMMzvjmigmxCF6qAJAkuyrKp/D8K6Dh9rsT9oK4NWdiZvsFJX5YKZ8unZeYscCqbnNcoUEinV8Pflrvlch2eBsiFvA0=
Received: from BN7PR12MB2801.namprd12.prod.outlook.com (2603:10b6:408:2d::33)
 by DM6PR12MB5698.namprd12.prod.outlook.com (2603:10b6:5:78::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Tue, 2 Aug
 2022 14:20:15 +0000
Received: from BN7PR12MB2801.namprd12.prod.outlook.com
 ([fe80::64e3:bc0f:b296:7987]) by BN7PR12MB2801.namprd12.prod.outlook.com
 ([fe80::64e3:bc0f:b296:7987%7]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 14:20:15 +0000
From: "Konrad, Frederic" <Frederic.Konrad@amd.com>
To: Peter Maydell <peter.maydell@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: Fabien Chouteau <chouteau@adacore.com>, Frederic Konrad
 <konrad.frederic@yahoo.fr>, "f4bug@amsat.org" <f4bug@amsat.org>
Subject: RE: [PATCH for-7.1] hw/misc/grlib_ahb_apb_pnp: Support 8 and 16 bit
 accesses
Thread-Topic: [PATCH for-7.1] hw/misc/grlib_ahb_apb_pnp: Support 8 and 16 bit
 accesses
Thread-Index: AQHYpnL4QHZnK+MYAkisd0/geL+yna2bpNYw
Date: Tue, 2 Aug 2022 14:20:15 +0000
Message-ID: <BN7PR12MB280161C3A847924FA5C3AF1BE69D9@BN7PR12MB2801.namprd12.prod.outlook.com>
References: <20220802131925.3380923-1-peter.maydell@linaro.org>
In-Reply-To: <20220802131925.3380923-1-peter.maydell@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6153114a-d6f3-4c8c-77aa-08da74921e82
x-ms-traffictypediagnostic: DM6PR12MB5698:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Cg9yFPXWinROFUZ20c6TT50v1+QP0O1+ffAm1vWJrpCrk683IqlYiyXOiuPo+5FruA8csmgDn6WHBQZShZAuTGAH66PwQXsd9imldcw0qS8ebWDohNyMZgO1peO8owFGn8AGEq0y6jHQHMlbNhv/Iyau7d8hD2TDWixZGHFvKU1kz/S1T+mPvE7vBZxyfPUI9hhLJAmw+rSZq9qSWZUgDZwywafwdTEarzK8cVJWF4KMLM9I3xOoqmkyAcs+yYf17t+4Sg9fG4jx4PKudoR5LVw7t6cyDbXwNuisyAmh1uUjLU1Kd5hR4eGYJXny2Q7UmfF++67xDCUvZZNSmssemL7uF1tntvfDsXSbibMiPQ2dTi6c/z7cjyAinzyl3mdW7GjpL4Yp0RGjMSZFrjOLDX43gptXQTRXMHIg3bog0cJQWF5C0zVYablaP1jeVgt+c2oSvmpoU0wfhFgfya+L2Zbn7vLWOFKGzSjuu0l6VWxacMY1ACgEV0rKbQNDcVRcM+D+gTqTxz2AWLtv/QIgMC7rVad3ioyMFD0zjBOGMRWdcJ+R5SAyLVy47jGMFKWiET/XgZmqZWo/n3Mm2hzFYWcl7V/nWQFfVOy9pLN1HSQ0MZLWb4OxUwWQjBf5tK744J/pHOCbGF7DWi6+aHppRPvzXfPgm9YdZzKnhIdy5MfCoCSBMC+VFkNiXGmhQcFb3MHhorevpSikQGHlgm8NcSIqj1bcSzJIN0aHtht9xFPlGzrWRNc/Q1m8I4nMo2/DLo3ksJF/RxHOV0BC7Ft8tds2fUC2qakfnO1kDFPj2xsVMAiCC/XesqpavXB86TGNDzG5Ma2eDqCeXmco5shzzQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR12MB2801.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(39860400002)(376002)(366004)(346002)(396003)(316002)(83380400001)(2906002)(33656002)(41300700001)(52536014)(55016003)(8936002)(86362001)(66556008)(66946007)(66476007)(76116006)(64756008)(38070700005)(478600001)(71200400001)(4326008)(8676002)(5660300002)(966005)(66446008)(122000001)(6506007)(7696005)(186003)(26005)(54906003)(38100700002)(9686003)(110136005)(53546011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eUYvq3DZ4HPFigxAqGyhAXE550BfyK0k5SIziganUPzygOVA7xBgufYq3GAN?=
 =?us-ascii?Q?5oomGri2eZtfpB0RWdUedvjQqvVKIz3wZKvw1Y7PRBCmNp2wtYZBnvVxNGZo?=
 =?us-ascii?Q?KtKKza9L90l3GavinegCV5UqlOoQNTvPSrSDR5CiYXmX41WI5sh+OYGQ2qaH?=
 =?us-ascii?Q?OhdKJqzORHFMrA1s/ZudP3ZTRCHgP2Js95cieXXB+4MQr1d4g2QkS2rbsqlZ?=
 =?us-ascii?Q?ZYRXnU3jATCHJZZ35IjAGguDYitI2QEHJIbBH/0mb1TRWlBEr6QINMdeYyAu?=
 =?us-ascii?Q?U8p6zH2SWMIFaPaAtGKM60kJxyVtvl2BHUAQWI85/FfvuGPW6ilf8O7ZC5bW?=
 =?us-ascii?Q?ZhtEsLMcZ5hg1FP48NxfzsAJ3fwAalbyNQIrE2CS9c/EXqWMjaKR26tn3zyp?=
 =?us-ascii?Q?+auDWvi+3O5WGQi8p1A4VzanUNpU7G40ZybYH2h69TImwCRqE/x6ulVpgEYp?=
 =?us-ascii?Q?sLiF4ee52ehi2/e4m4WiybV9qLDyrruLdeF6q+YpEoR6aVNBhTH8NcGMlwUt?=
 =?us-ascii?Q?pQJv92LsYgCeOq9RKBhB1Uq0y9yaObsEVGRl47385sm6nMeYuu9HkyYxdaGj?=
 =?us-ascii?Q?g0mVob7bGtTSwugE8YhQ24dZ21Wrd4KaY/cc9SxK1kJ24VX64pfkITRdnept?=
 =?us-ascii?Q?5nLfqnMJJkOjcdozf2ZsS0XxYzNDAotb67dfmikdtuogJJ+BGvdvU2+Pro4e?=
 =?us-ascii?Q?GNApqcy+2VB9wU2ljjsH1VJcX4qwwuUpx1WQnDtDCnZ5yzwx89B7fK7WUode?=
 =?us-ascii?Q?iWQ0asElehZceLYmPXIHgHGWaRvMfhGU9I646wGpJY5zGpBFTIzdvaa4qT5Z?=
 =?us-ascii?Q?l1IzGoonz+nRCGhHAbxiNLNesgq3lIQwLU3EEuSIdzcVS0LrqikM0LfZ/NTF?=
 =?us-ascii?Q?HYXWMfPQt+wQfp+O5fflbX/Ix3IX0cBDOsjnzQ7litmCq1QLRhBJsbUc4ZP6?=
 =?us-ascii?Q?qiccN2ohDcm+IfO/o2/a7yN7ED55Q00iNc+DoMtalqvefp8YVOSfiLXrZUSx?=
 =?us-ascii?Q?sFZKsKK4uXl716WTcmKI4oMK5Z77zzG7JJUo5Ld4sXRt6QvJg3VrdIVK0DXJ?=
 =?us-ascii?Q?+BNvXKES0L14cjsOJsz/yaGuDYVZ1oZ0Ohlh+Yiko2Bv9Ov9jysKhEUbCVyS?=
 =?us-ascii?Q?6A5w0E4KZ+DEnA113PiieocPp67QaB9EVQf4Ja4w41evXA4Slqkj4HbwW4w7?=
 =?us-ascii?Q?1R0SZfehfGxuSJFL9H1QMmKBrC14Ob7Wzwf3GmljC5WU+tLNBRngcXXQt9v6?=
 =?us-ascii?Q?gIjGmCPhXjTtSf4aVSHIIFLWTjAN/4TLa2hsVciRUuxCcwXdA3JyCqr4JA2T?=
 =?us-ascii?Q?4JeOt3VrnThpjCYfcmZ/X9L5v481+8roZqRY/6wV0FV+c/53SxUvsrCEnEAV?=
 =?us-ascii?Q?VVD4fenl7xjKcwcWhJndgf3vPIlqScyy7MiKTATYqbKTHElZ8lXEEy8TfYas?=
 =?us-ascii?Q?VG+gqleTi5pxPfUGBBukAXQuKEncQpKOe4gmqQkre7bv++Ut0fW9iZKBiF+f?=
 =?us-ascii?Q?lq05/eCAN6v2h07T/k6LlA6NS4aUw7tSwS9SKS0YUPVJRJens8IzAYmXxTII?=
 =?us-ascii?Q?pZb/Bz67TNzAsodBHjc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR12MB2801.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6153114a-d6f3-4c8c-77aa-08da74921e82
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2022 14:20:15.1635 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: op0pkVgBTu0FCvQwyiToo+90EyChWqAUTik5bKRUnk5d7n8wqAex+SzrHX7stIeZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5698
Received-SPF: softfail client-ip=2a01:111:f400:7eab::62b;
 envelope-from=Frederic.Konrad@amd.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_SPF_HELO=1,
 SPF_HELO_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 02 Aug 2022 11:08:17 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

CC'ing Philippe.

> -----Original Message-----
> From: Qemu-devel <qemu-devel-
> bounces+fkonrad=3Damd.com@nongnu.org> On Behalf Of Peter Maydell
> Sent: 02 August 2022 14:19
> To: qemu-devel@nongnu.org
> Cc: Fabien Chouteau <chouteau@adacore.com>; Frederic Konrad
> <konrad.frederic@yahoo.fr>
> Subject: [PATCH for-7.1] hw/misc/grlib_ahb_apb_pnp: Support 8 and 16 bit
> accesses
>=20
> In real hardware, the APB and AHB PNP data tables can be accessed
> with byte and halfword reads as well as word reads.  Our
> implementation currently only handles word reads.  Add support for
> the 8 and 16 bit accesses.  Note that we only need to handle aligned
> accesses -- unaligned accesses should continue to trap, as happens on
> hardware.
>=20
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1132
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> It would be nice if we could just set the .valid.min_access_size in
> the MemoryRegionOps to 1 and have the memory system core synthesize
> the 1 and 2 byte accesses from a 4 byte read, but currently that
> doesn't work (see various past mailing list threads).

That looks good to me but I thought this was fixed by 1a5a5570 and 0fbe394a
because RTEMS do bytes accesses?

Did that break at some point?

Regards,
Fred

> ---
>  hw/misc/grlib_ahb_apb_pnp.c | 10 ++++++----
>  hw/misc/trace-events        |  4 ++--
>  2 files changed, 8 insertions(+), 6 deletions(-)
>=20
> diff --git a/hw/misc/grlib_ahb_apb_pnp.c b/hw/misc/grlib_ahb_apb_pnp.c
> index 43e001c3c7b..5b05f158592 100644
> --- a/hw/misc/grlib_ahb_apb_pnp.c
> +++ b/hw/misc/grlib_ahb_apb_pnp.c
> @@ -136,7 +136,8 @@ static uint64_t grlib_ahb_pnp_read(void *opaque,
> hwaddr offset, unsigned size)
>      uint32_t val;
>=20
>      val =3D ahb_pnp->regs[offset >> 2];
> -    trace_grlib_ahb_pnp_read(offset, val);
> +    val =3D extract32(val, (4 - (offset & 3) - size) * 8, size * 8);
> +    trace_grlib_ahb_pnp_read(offset, size, val);
>=20
>      return val;
>  }
> @@ -152,7 +153,7 @@ static const MemoryRegionOps grlib_ahb_pnp_ops =3D
> {
>      .write      =3D grlib_ahb_pnp_write,
>      .endianness =3D DEVICE_BIG_ENDIAN,
>      .impl =3D {
> -        .min_access_size =3D 4,
> +        .min_access_size =3D 1,
>          .max_access_size =3D 4,
>      },
>  };
> @@ -247,7 +248,8 @@ static uint64_t grlib_apb_pnp_read(void *opaque,
> hwaddr offset, unsigned size)
>      uint32_t val;
>=20
>      val =3D apb_pnp->regs[offset >> 2];
> -    trace_grlib_apb_pnp_read(offset, val);
> +    val =3D extract32(val, (4 - (offset & 3) - size) * 8, size * 8);
> +    trace_grlib_apb_pnp_read(offset, size, val);
>=20
>      return val;
>  }
> @@ -263,7 +265,7 @@ static const MemoryRegionOps grlib_apb_pnp_ops =3D
> {
>      .write      =3D grlib_apb_pnp_write,
>      .endianness =3D DEVICE_BIG_ENDIAN,
>      .impl =3D {
> -        .min_access_size =3D 4,
> +        .min_access_size =3D 1,
>          .max_access_size =3D 4,
>      },
>  };
> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> index 4d51a80de1d..c18bc0605e8 100644
> --- a/hw/misc/trace-events
> +++ b/hw/misc/trace-events
> @@ -247,8 +247,8 @@ via1_adb_poll(uint8_t data, const char *vadbint, int
> status, int index, int size
>  via1_auxmode(int mode) "setting auxmode to %d"
>=20
>  # grlib_ahb_apb_pnp.c
> -grlib_ahb_pnp_read(uint64_t addr, uint32_t value) "AHB PnP read
> addr:0x%03"PRIx64" data:0x%08x"
> -grlib_apb_pnp_read(uint64_t addr, uint32_t value) "APB PnP read
> addr:0x%03"PRIx64" data:0x%08x"
> +grlib_ahb_pnp_read(uint64_t addr, unsigned size, uint32_t value) "AHB Pn=
P
> read addr:0x%03"PRIx64" size:%u data:0x%08x"
> +grlib_apb_pnp_read(uint64_t addr, unsigned size, uint32_t value) "APB Pn=
P
> read addr:0x%03"PRIx64" size:%u data:0x%08x"
>=20
>  # led.c
>  led_set_intensity(const char *color, const char *desc, uint8_t
> intensity_percent) "LED desc:'%s' color:%s intensity: %u%%"
> --
> 2.25.1
>=20


