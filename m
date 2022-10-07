Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8284C5F7B9E
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 18:39:43 +0200 (CEST)
Received: from localhost ([::1]:50368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogqNy-00059n-1t
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 12:39:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfaggioli@suse.com>)
 id 1ogpQU-00076v-RW; Fri, 07 Oct 2022 11:38:15 -0400
Received: from mail-eopbgr60060.outbound.protection.outlook.com
 ([40.107.6.60]:6565 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfaggioli@suse.com>)
 id 1ogpQP-0000KE-VE; Fri, 07 Oct 2022 11:38:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P2tDfV8XUZmggC0SGeyZreDE6I5HPscdRsMLsxxnDrxrm0oGQ83gdHtFrVz9nLFIKSlJySI08ZVyBQ2uaG4HQPOmIuu7l6gd5ezOmpLh3AF4lv7jTSDnUVXsJ64aw4FHM3Lh7FVDgFsq+f5T2/vRC41wVd/+oK3pibw0+5DvgSgAz3CJOFsDwm5a3f5k4gvkQ8bVYfFWIvxM5JYNmYSDyfpr2/zUj0wMtHKC0YkuLcFsiISAUR+3FvqpNroQvAFXz+6zqAWYrOSH05D1WapxuLYvMRmDeW+SXIf9NUlsklnQv+YbTjb6hTHwV0K1ly2X/6GdeJw0xvC2WBtIoQArOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vKuHFwCsDfc3Q73tY2FDuPiwQZO37+xGU5WfwjnK+zY=;
 b=RacHrJENdbEWgq1u7YauirFav6a+/yGZNnMeKpQI0X3d9+HKId0w5Xi8qw7ySt7+QXPh2/5Qjexk7MQ2koL5UPUXb5bmKHzxqbrclXatbuN+dh2JlLHplxrTP3p5ocreBF0O1TyJdNGS7RvLC8Q8ttM1c3ycJpNPa2uKFv+qkYbYphGjd5v/L0eVbRJlZ2HQs4xz3AAJq2m6qCrzUqtrQwtSEe2Ez1STOLoglxzlKqkyRdftndFNYWTSUoJ65kHxpOH7JQpSr5vV2Oo9qojP5a38OLkxuJGVAQmARUyELwTrCd+rmoJBAGwT2aeEbILF9ArdypUbDCkFyd+VJOchXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vKuHFwCsDfc3Q73tY2FDuPiwQZO37+xGU5WfwjnK+zY=;
 b=A3QNuTp+kYt57bCTbPKI0+wcwXT3IOVYACwBSpA9QrBa4xluQ9QEjhgJ70CKeUY2ixd1JE4yv3T8m9CknJoRNsfqbzPOsS3wR8HHL1imeLXgWRozTSSnYvzU8kiCyEB8acN3F+e+OKBNwEKfpmIRiBX3PXkmKKdI/uzBJbaow7ra9tnlvtKoJs9FNDbq9RXYdDwuK6y7M0G/sas92uO1U0UkhVBUrExYnYpPRt3qHQMdibl9OOIx1sQIrlRJIU2nrhuVKLTTWaHcBYRY8+2Wbm5XwmEjaUFnLAg4vpXvvloRooKieY+v8XXhSxTVT6CsapyfYlFcP3Lz+0NIfwgvYg==
Received: from PAXPR04MB8366.eurprd04.prod.outlook.com (2603:10a6:102:1be::12)
 by PA4PR04MB7520.eurprd04.prod.outlook.com (2603:10a6:102:e9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.38; Fri, 7 Oct
 2022 15:38:05 +0000
Received: from PAXPR04MB8366.eurprd04.prod.outlook.com
 ([fe80::28f3:38af:cc6f:f83d]) by PAXPR04MB8366.eurprd04.prod.outlook.com
 ([fe80::28f3:38af:cc6f:f83d%6]) with mapi id 15.20.5676.034; Fri, 7 Oct 2022
 15:38:05 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: "faithilikerun@gmail.com" <faithilikerun@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "stefanha@redhat.com" <stefanha@redhat.com>, "hreitz@redhat.com"
 <hreitz@redhat.com>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>, "jusual@redhat.com" <jusual@redhat.com>,
 "mehta.aaru20@gmail.com" <mehta.aaru20@gmail.com>
Subject: Re: [PATCH] block/io_uring: revert "Use io_uring_register_ring_fd()
 to skip fd operations"
Thread-Topic: [PATCH] block/io_uring: revert "Use io_uring_register_ring_fd()
 to skip fd operations"
Thread-Index: AQHY2mLKZjUUx/P5OUWf4lg6XvTmFw==
Date: Fri, 7 Oct 2022 15:38:05 +0000
Message-ID: <5ead5696ff9b4cd7ce89190d368d53a7e16c30a3.camel@suse.com>
References: <20220924144815.5591-1-faithilikerun@gmail.com>
In-Reply-To: <20220924144815.5591-1-faithilikerun@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4 (by Flathub.org) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8366:EE_|PA4PR04MB7520:EE_
x-ms-office365-filtering-correlation-id: 65c94cee-91c0-4a98-53ae-08daa879ed94
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T4OK2t8pwjbCrozhRFUu7nVnLpxB0tyT2KgwW/onH71TAmUel/mNAXvvuHWGfo8iHQdK5UZUYzkFx+eOighIC+EbjQjZyu5Pgu8zS7CyUsfrtpjrXMdNtAkMCbGwgbSkV9eWBfY5K0lhWRAKgE6JRg1WUwK1tLUMMd39wM87zV0MwPfSvrrWO0ZFZMHNI3mRZHHF70OHQBUxTEjyv9CNEzDpecawb1bxtr2TL9hhel6n2oWWpRZVWCPe9FCoWVTkWkJ+7nBayfTggOa31kOszMnG2mEAo7KzoFxLk9hF8c7XtfXmR3LcS+fmR4j05qP+6PuV4G4k3p8WRUaDlRvaIGfH8GRERQigm4n7Tf4vmgzm61bEvsPEVe2tlRMsxUWp6b0k+EV+P1OU2re1Effj0pA6wtvSDgEhWisT3eLcrTLpWlcG8V4uJZUGRVhjWBu7KM+1rf9Ntm0BgVxcN4+Gcx/BQKB7clp+Ts4+mvQjwamj6WtZekN4t/deFRpknxMUy1kibNszlq1JSf1o3Y2tNdqyhm/XhU4tC6MnBmceUQIIHB7BtTJgnlxn0valeD7wisDXHl4vRSoM1Vzo4QyS0oN6WNN8ivuibRDwzP1nxmdQ7OVRJKHCk50N7IE45y/lPT9u2Ml+V/3vnH3hC4SpKPJN5MhfTFenTe6V4cv5uJQ87tzIteEDsKdPhYngWd10S+idw/uZFegRX9hVtyUVDT/0x20/UKBzeQCqBH1u4L7VaKDWVDXlVoToxpuoN6zmoiecKRrRjBUOuZAAP5JhV07xhFJOjvvuvFOovHto8in4iKrsZap+2mLCpFQi+nG7kEEQG3m3JDTnuPTQQg/12A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8366.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(366004)(396003)(39860400002)(376002)(346002)(451199015)(99936003)(38070700005)(38100700002)(66946007)(2906002)(6512007)(4744005)(86362001)(36756003)(91956017)(5660300002)(66556008)(66446008)(8676002)(4326008)(64756008)(8936002)(41300700001)(66476007)(76116006)(122000001)(83380400001)(316002)(110136005)(478600001)(54906003)(6506007)(2616005)(71200400001)(26005)(186003)(966005)(6486002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NWJFdXBaZzRkZXBLQzRtc2ZZa291WGJidW9PYWdtdGNQV3craHQrOU5FbEs4?=
 =?utf-8?B?WlhnYjI2dkFlOEEwWTFkeVZ4RVdSMUk5aE9SUVhVV1Nrb0xXY1Bwd3hTSjUz?=
 =?utf-8?B?LzVvWlRqWVlhVnpwbXpodGYzN2hrR1R5UzFyRjIvR3lzbjlydm1DZERHMWZo?=
 =?utf-8?B?RFpLVFZGdlRPZ3g5bVVZdUVNc0tYckZ6bmhzbjlzeGYwL212ZFQyb1ZTWjVp?=
 =?utf-8?B?aU1mYjRZdHZxbFNNMDZGQ200L0h5UUpaMHRadUV2UVdsRThLM0RtdG1nSURR?=
 =?utf-8?B?b01OQjFucHNOeElrMWhUK3ZzOXg0eHdHdzYwa3FHdkR1M24xWWhpT1ozeElk?=
 =?utf-8?B?N2VIUUpDa0lTa0ZFbzg4eFc1d0JHMzV3bnVGTXpzaXYzSXhYQW5pUXZDWStt?=
 =?utf-8?B?bCs4b2w5U1g4eFpxMXpzRDRDM29nWWdkcHRjS0E1QzhoK2dGSHhZWENicXhZ?=
 =?utf-8?B?ai84Y0p6VVN2Y0o3NXI0RVZYSGIrZjRxY1p5K1Fib2xURWpiSlRtMGcrQm5k?=
 =?utf-8?B?TDc1WWt3aDNVVnBPWWVtSjhjNVFrVFRCVEVGZS9rVmErV0VnVW52NjJXaGZS?=
 =?utf-8?B?TTJRNnZCQ3ZEalBLdFZxM0JDSzFIaEFpaU81UTh0Zk9SRlA4Yk0wdmFyeG1F?=
 =?utf-8?B?RFRhZnRuRHFKZ3JTVjg2TXRnQTBwZENJZTN5SEc2a0ZSUmszZnVRQm1Fc2pW?=
 =?utf-8?B?dFRZNHEvbUppMHdhZnR2UWZIK3ZqTmpRWnlLV01hSmJoYWlnN0VvR1RBR2Rj?=
 =?utf-8?B?dUxqZ3g5VXM1eTFhcmtXbVp5QTd0R25UOXpBTFYwRkJoNXNEU1hVUnpNajFm?=
 =?utf-8?B?QW5xR1Y2Z0NrWVBBTzNabmZIYzhJRHVsVVpwd3d4OFhqUU56aTJwdXJXZTJQ?=
 =?utf-8?B?K1J2dHpaWDdGazArN0ZrNjAzWHJ3TERFdjRjSllOV1BickxIMU1GZS9KbUUr?=
 =?utf-8?B?UUZzV2dXRDYrUE9HUjdiZ055Ty8rKzBFUHBENkFIcmd2dHJCV1g0ZnFidGZZ?=
 =?utf-8?B?TktJSm9oTWQxTU1oY0ErZUNrNGtRekVjdWE4S3ljNlJvcG1mRUFVZ2FIVkxL?=
 =?utf-8?B?Mkt6OERpOGhJejlGUFJOci92WHlEUVhCVFRtMDZiODFPMDZQekc4MmVmYnkv?=
 =?utf-8?B?ZFJqSHl5MXZiUFdMeklwQXdON3Y1T2R0a2VFaXl0RXVKRWY1RzFjL3VRVGhX?=
 =?utf-8?B?OEdFREtBdVRWWlR3cDAxUFJRN2Z5MTdRb3V6c3QxT1pSWjBjb0lucVZpY1Rn?=
 =?utf-8?B?dDdzL2tqaFhjdVRNR1hKaUxUcWtiaXFROXZUTlE1MVlGNXl5bHpyWkZnZ3Ir?=
 =?utf-8?B?a3pLOGlDQ0xMTlhhWVUyRVJZNEZuUFR5bEp4OXVXY0VZZnlaMUw0MHNxQnBy?=
 =?utf-8?B?OVUxaWdRNldYM2gxQlI2V0x0TlU5NTY5ZkV3d2pvTCt4NGpwbm1hZmRGUXFK?=
 =?utf-8?B?anhRdkt0dnpBUjNPNWtuQ2hRSGo5Y01BS3ZNVE1SbVkrRWFMc0xLTGRldWNl?=
 =?utf-8?B?bjE2VEhiemJ6UW9PMCszWXdiS0ZqMVNhd3FPbW5LYkx1ZXc1dGVuOEJ1Q2J0?=
 =?utf-8?B?bWlQMEM3QjgxQkxWR3lCcDFDMERxUVhxRjJ5MmsyV3FZSUxDaWM0VXQvR3Yw?=
 =?utf-8?B?anovSTRodXp4Y001Q2VrQzY5THo3VllWSmZsaFFpZzhpZDU4eUs2OGVvdkJW?=
 =?utf-8?B?Z0lNcmk4aEdJcVI0cHpiMHYvYm10M24yeU5WV3lzSVlQV1FNcHVjNVpUOEJM?=
 =?utf-8?B?UzNBSDkyZUhZOW5DTGJmNmFmRzJvRTJkbXRSYWYwOWppMzhQYkpHSmFDbGs4?=
 =?utf-8?B?M3NCZnQzb1dTd2MyYVBiNWVnNHlFQUNkUFladUVGdVA5dzF3ZDNBZDZwRFZG?=
 =?utf-8?B?ckVSU0NoZkMzNWlWYkxuZjNvTG5QdzJWcUtMRDA1MG9UOEVoUGhjd0xLbFJs?=
 =?utf-8?B?Qm9zK2RPV3lxSDI3UHNMMHhLRXdrR0RxVVVBbk1yK0U3TTkwSlFnV0F1Szh3?=
 =?utf-8?B?V3pQTmJKQjRkOUtxZW1WOFVQbmNhaUJyTUs0eFhsbHFTWWZadk5ZaXZqNzMr?=
 =?utf-8?B?Mmk2bHpYd25EQ2hFOHlkOGJ1R1JKZzlHc05CR3FNcElXS0pNd1QrREtxRmRQ?=
 =?utf-8?Q?sO8PqjtymZNlOP6Gqxv1Fua+Y?=
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-Cwfkz3m495Z3t6K2gH02"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65c94cee-91c0-4a98-53ae-08daa879ed94
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2022 15:38:05.6464 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AL6A0ar4lZO40fOFtmTIOLpUavPlgaWjdJ9UtuoN/+4P83CWNnwLQI3M8xlsC3PLZgt2a2ldthXbjj6CtAQlCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7520
Received-SPF: pass client-ip=40.107.6.60; envelope-from=dfaggioli@suse.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--=-Cwfkz3m495Z3t6K2gH02
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, we did hit this bug as well, in the QEMU 7.1 package, for openSUSE
Tumbleweed (more info
here:=C2=A0https://bugzilla.suse.com/show_bug.cgi?id=3D1204082)

FWIW, I can confirm that applying this patch fixes the issue, so this
can have:

On Sat, 2022-09-24 at 22:48 +0800, Sam Li wrote:
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1193
>=20
> [...]
>
> This reverts commit e2848bc574fe2715c694bf8fe9a1ba7f78a1125a
> and 77e3f038af1764983087e3551a0fde9951952c4d.
>=20
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
>
Tested-by: Dario Faggioli <dfaggioli@suse.com>

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-Cwfkz3m495Z3t6K2gH02
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmNAR9wACgkQFkJ4iaW4
c+5JWQ//cmiCnSA/9qbqAiDizlLyQ+OJw9x3ARqUV2Dt8B49DQp4Ri8mOmzHYJzZ
O5CtOx/SSXjg+Fqj9onljuUVroGZoh5vLw6ML9v22SM7tV1WRU4XfuakNWJcaIfb
t//oz2g0J7ysMcyCSrTNj6SA9dc4Hqv7Ghw+XvzYMTdlZQO6zpEVyC+6NearA1kC
4ewAa7nijy8NJFwasfd4VVTdjtEv0FRqfbg/iQ2wmltJUlTubLwZ4KCUUOS6CrXW
nY2PvrN1q4dKI6IcliZ61HmpxcYXy1gBIKqfzlzN4Ir0LoKQIOD5oGZvKVD1rgCt
B0OGesCWDlSPK/hSJJ6KnPGIJ8TI6dt6xqZPv8kGSkA+mVuoHQZRu+5gc23e2z7P
fgsW1sjmqnsWyV+cdW0bOGLDBorlYBJB6WMpfv7FpxXBfSBzWbOMm/HKUuBkvOFy
sYjB273K0A1XjgxGEfBQ6TKqPQ4h7HCu7ozf3eD9JChTQHQlGQECgXc9qdvhZJbl
vFS4VYwiaOyzoSC/n8T/MzpqMvYq4DNPBtCm0CrIUAlFMPvVACvLygDXSdi77uHz
7IixaTwJLncaulPW/gnNt+4k9cnXNRaEUKIDdK4zZxuMzGHEq8b0YgeATvKHHnmQ
2b/JreaQYT6pXthAsXw5UdNrYaIho704OMN1lgPVRgUEGuq2eJY=
=Y5qg
-----END PGP SIGNATURE-----

--=-Cwfkz3m495Z3t6K2gH02--

