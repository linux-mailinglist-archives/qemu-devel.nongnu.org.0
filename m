Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B48162E3B9
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 19:06:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovjFn-0003ml-Sj; Thu, 17 Nov 2022 13:04:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfaggioli@suse.com>)
 id 1ovjFm-0003md-LU
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 13:04:46 -0500
Received: from mail-am6eur05on20629.outbound.protection.outlook.com
 ([2a01:111:f400:7e1b::629]
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfaggioli@suse.com>)
 id 1ovjFb-0004iJ-5F
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 13:04:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OqOSL0GDaryIuvbJUbwWd1Mhn7iurpK+oEW8q84NCreQkx6p8bedNTRlQToujopVxfHpsiKIV9zi0Wt7NaF3A3b1tRejb5D2zQYIenoFsLY4o5He4QZXRaAl1leJNFyxmRSQYPXqEYG+WIXHDWNpBRdlNdFDHlEoYboNtDIcH3osVXx+r3K6NUXQfUBYWgwKTI6oYr01OiKxwykge82a7TTxb5AasJqKeWELcNUcENFJ47Au3ER/JB6FmQDof1xgwBnxYtJFw4BleJ5d+NMa9HSCfwEAlqt0vZebX/Wtb6O5/lSa9AcEu7e4B4PzeVafaguCtqZEFCGJ9xZYJnCI0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ThfgqH12TZRBr27Kh/qkVBNA9vLOQtkzHv31RX9MVOU=;
 b=exlg6ZAzakU9NpwX7s9+8ylwkPWV6LkIWcqc+liGTZ75+lcP02AaoxIqrnYawyRmmQU506hG5GlPtUdcQbpJrfNDY0RQHhZP7ipUuO7Dm6OXbEy2oVtqMKh8pGYb7xYgIeeFdXsNGaV2Kf1KECGIsI/AyOvbmjWnUTfMUoSkVHN6tsVZP4EWiBTkpllpS1c048ikrLimlmR+WoKJmJyzIrX66G6f5AdIciCSM5K/NpzxJ9HSlxlP0rA210Qm1dj+HyqnH0GEKKVp7guWNybBlB+naJKMcCWJN7zSXefl6dZUUzW0Yu0mU82tObJzFh5MJKhNYovLBmihWLDkQ3Jyhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ThfgqH12TZRBr27Kh/qkVBNA9vLOQtkzHv31RX9MVOU=;
 b=fnmmASVQELDwSNDvNihyqgkt5luSQUkxM3BKMxHVkC0HjYer/mzHs5OmdKFiVe3U/XpQN/x44Kofcxh5IkofB9qd+nkPv5QdnwHyC3+SbISk2jLUW48Z11ec1zCRUoFJdGafqnn0yUvjv3cMcikiuejbbyQojFaoMt8HM09yuOnNRVCtz8x8zbJw8iejIpGRAZ+6Fv6oBKdgLtzO0Up2A1xwhRgSw9lwmQa8mZXO/DXxmuGp85moL687uaJ/7tg9J80KIfKWOZX/LHdeElMNS1hYStOAOPAdVES8XpzPbrj+PI3aLdXomcWJhSUz5sGb0hbt4qIFxGzewzF3Jn6QsA==
Received: from PAXPR04MB8366.eurprd04.prod.outlook.com (2603:10a6:102:1be::12)
 by AS8PR04MB8120.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 17 Nov
 2022 18:04:30 +0000
Received: from PAXPR04MB8366.eurprd04.prod.outlook.com
 ([fe80::64e2:acbd:4d56:fcca]) by PAXPR04MB8366.eurprd04.prod.outlook.com
 ([fe80::64e2:acbd:4d56:fcca%5]) with mapi id 15.20.5813.019; Thu, 17 Nov 2022
 18:04:28 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "mst@redhat.com" <mst@redhat.com>, "pbonzini@redhat.com"
 <pbonzini@redhat.com>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>, "marcel.apfelbaum@gmail.com"
 <marcel.apfelbaum@gmail.com>, "eduardo@habkost.net" <eduardo@habkost.net>
Subject: Re: [PATCH] pc: q35: Bump max_cpus to 1024
Thread-Topic: [PATCH] pc: q35: Bump max_cpus to 1024
Thread-Index: AQHY+q8I9iIyiihJl0GCE6gdK171tA==
Date: Thu, 17 Nov 2022 18:04:28 +0000
Message-ID: <bbbf1267cc26132e3d8627b7e2603c98cbe343c1.camel@suse.com>
References: <166869883160.17656.1212026522016331235.stgit@tumbleweed.Wayrath>
In-Reply-To: <166869883160.17656.1212026522016331235.stgit@tumbleweed.Wayrath>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.0 (by Flathub.org)) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8366:EE_|AS8PR04MB8120:EE_
x-ms-office365-filtering-correlation-id: 65af9552-dabf-4da1-5dec-08dac8c62ba3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oHvi4OweanlXInYvlLk6egpKbH5TnmLF/XRsTXjZC3Zx0RA2GXNyf2CHzdmenGxtLm9RLeCgrUdypRXyRrRr757Ss38/WbbyHgVSurrDy9UDCtgI+anWpWT6+pzP+pm/I8kIyg924GuRrvHDSG3jdeS4s3CvOB+c/T3wslsiLXZ1lDWFAVUtIKxeGCdbQ8mg9S6biVAdwjX/k+w/gcpHI6Z4KA2pW62EM+5gAXYWs62RKeyERzkD8ClRqPvHcJm/THiPhWlOcpxcRGCQekWdC0/aKteOOWk36iKEbGmOgTQ2Ar+q8JrjPV0nm03bBoHGMzQTVl+j3D6igC9rQ9pmm2CLTcHnE/qBUeOn1pbYIWhwmfeWdvm7o7QGr3cX60dKFYuosm5iTfO9f4vj1Y0PfFXYwrMQM13Ewf+Tmp9NR+fXS6gzfOyhmZvAlI6aSdZrWBztHqfBMLGXu/WEtQdz8fSVLJVgw70cPgu6Na80VFldp/xcqiDD46ClGmMwIeeuKYyVOObbbj5q0jMfac8PAQDxp1Wsf5ENdBrpP3PMX3VGetRczLIJZ5udjwcJI631Y+Db33QItXIvir3N24A93nhBHTGNluHTyfQ9x6ERaYqEbJDlXGuwiAQX05aNPSyxRRmVHEp5Ffx77/0DGKck5F4yy2OKUs2waqy0QZaaUqJ+PxHGcVF1Xi0nrGB6f3ce8EaCsSHEYS1qnxDMDyQnxBty/V+uio6AzXEpShBFIL2xE8aeYVVqW1ymS0tXqGI8AvKmB9IRkq8TTAmRnSNSZy40PmbzMEYRvNfRDQerkOE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8366.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(39860400002)(136003)(346002)(376002)(366004)(451199015)(316002)(122000001)(76116006)(66476007)(66556008)(66446008)(99936003)(64756008)(38070700005)(4326008)(8676002)(66946007)(26005)(6512007)(91956017)(2616005)(478600001)(6506007)(54906003)(6916009)(36756003)(6486002)(966005)(38100700002)(71200400001)(186003)(2906002)(4001150100001)(8936002)(4744005)(83380400001)(5660300002)(41300700001)(86362001)(21314003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VDNMOWdXNUozMjNOUEFNaWYwbnJsVElrZ1Job01IbWdCamt2cWVXUytRRFh3?=
 =?utf-8?B?bFhmZDhYa1VzZkpuRTdjZWliTkFGNXlhWnJySzU0K2x4UU90azllVDNSL0tR?=
 =?utf-8?B?VWRRUFlQTXphZyt4NG8zT3pGemNaSktEZ1dvSDdjbmo1Vmtub0R6eXhSUmk3?=
 =?utf-8?B?S2haQzdWL0xhbjNsSWRqTHVZWk9oSzJncEw0aXdWcWhRRmZxOG5RL1BoU0xQ?=
 =?utf-8?B?SWVybDRXZDJiRnZ6MmVOdHhnMTZQbEtSNVBvckRzN0xHVUFrek9CemtpVCtv?=
 =?utf-8?B?M1p4QzBqekVNSkJzSnVlQ1MrWURFc2c2U3cxKzdJd3kxR2l0TXlxMlZDVDNm?=
 =?utf-8?B?c0dpWVVLMDNkVXFWS1NqbktzS09jK0VoNHBMUVE2UmpkRFZZYVIyallNek1O?=
 =?utf-8?B?TXFETmxzTGR3ZFJYd25HRzBhcHgySTJCSWJWdXZyVHBDUEc5RWJveFdRTlQ4?=
 =?utf-8?B?aUpOWkFBSTFkN3ZONlQyREYrSnVkTmlpelk3ZmRranYzb3pwZmlHU3JFVnpY?=
 =?utf-8?B?dHRYSy9tYzhzeWhicVl3anFoL0RYcytlbmpydkZ3eG5CVnJtaDRESzRHTkls?=
 =?utf-8?B?bW4rNXc1RlJGN3pYb05ZZE5qNmZuN0ZzSjRiSmJFRUc0clgyYkI1UUJWREgz?=
 =?utf-8?B?NnllWDEwSGZPVjdCdHRha1FaQko5MlR0QUljTm8rdkwzT3BRZkdIUi9MVnZT?=
 =?utf-8?B?S013dkpHWWQxbzlIQS81ZzJXbjBkSGxFUVc0QWNPajlrbHlrWDNuZEVpS1J4?=
 =?utf-8?B?dlVJOWNUWUUwendPeE9tUW1KbWt1L3BmdCt5cWhmaXplQ0hkbEdxTjg2MmZD?=
 =?utf-8?B?WjNUbGVTUVFZUjR3bDh5dzQxbjVmT3FKY25MUS9ibzVtMDhVZGY0YkNYTURU?=
 =?utf-8?B?bFhjN2NZZWlpelVTdmpnTmJGZkI4MFJsWnlxSFVQMEVWYmd6K25ValFxOXBQ?=
 =?utf-8?B?ZEw1WWE3aGJiZld6WWNsVlhGaUhGMUY5eWhmVHpNSVVWbEgxVU55TWE3NWJq?=
 =?utf-8?B?Z0tVRmFONVdJejl1RzA0QjFJeVdXN1pOTjhsSmFnUUFsandGcnl4ak1OVWhq?=
 =?utf-8?B?NFZFVUxWSW5xWllvS01vVWZMeXVxM0ZBQXBvZjI2V2F4SnhoZzAxZFNESHMr?=
 =?utf-8?B?UlZoNFV4eDdxeWs2S0tuUXUvSC83ZEVOVytDRklVSm94ZEl5Tjg1cjUxaWdW?=
 =?utf-8?B?VnI5d3kzVm1FQ2F0ZU8wSC9OOFFkUWVYSXlUc2NyRGVFTHJXb3RQK1FGQnBn?=
 =?utf-8?B?R1FiamxVNXZSUWNwOG5FYTBHRmgwdjBGdjZ0MGVwWVZsVmVleWVsbWVrTVhZ?=
 =?utf-8?B?MUxoeko2MlQweUZKbFFoLzRrd3NZNFZuUml5TVZzeTdncDFRNG9QTUQxZzFT?=
 =?utf-8?B?Zk94M25hK1VTd2doNXV5aXZCRElZcUJCMFNLdGMzZlRJSGdhNFpMdW5LSDBJ?=
 =?utf-8?B?K0EzRTdPYmh6ZGc2cW1qZzhsalFnR2hiODNMbER6Y0d0SXBjSUxFcFNnWnFx?=
 =?utf-8?B?YmVXd0FzdE9VWUJpaENKZENIYmpTSE9peUErTmk5V2VlQ1U1SkNKUUlpM0xy?=
 =?utf-8?B?MTE0clVWNnVVcmFTOU9saGNhcHljUmRMKzlQUmpsL1JSUHg3bXk0UXh0WGZ3?=
 =?utf-8?B?UlpKY2dzV3hBUXBPbjlQdUpNUHVNS3hGLzZWazhJbGFVM3VVdW1iOVZGb3Bo?=
 =?utf-8?B?MFkxOVpseHJzajVIaTJNNnBiT281ZHpKNm1UREhwN0RrZExtc0I5N3gyVzM5?=
 =?utf-8?B?Z2MrdTNSL2FKY2FWbEU2L3o5Q0g1NUplR0VycW1VWndHZWdBV3Y5S0JJSHBG?=
 =?utf-8?B?V1ZSODJZTnUwbHd6c1JtOE1vRytWRGFyYkFvVXdpdE5NMERZYUZDYVdkcVY0?=
 =?utf-8?B?SFg4UEhuYithbmNMRHdHQityaTJIUTZJaGhZd2VML1B5U3RjdjVleG9NVERN?=
 =?utf-8?B?NlFpZVhLa1RKUStKdnRNN1lrOWp2b3E5OTlYTGxsZGxUdG9WZ3puUTZkS3BF?=
 =?utf-8?B?ZGd4SnJmeGpPdGczUkg2a2JLTnFIVHJLQ0dQc2FYOEU3aXhRWHRRbG94azJx?=
 =?utf-8?B?Vzl3Tm05anB1eWxZRWdYNlZTTTZNVERiZWx1dWJDMjdkWTN1aktiY1NBS3Yy?=
 =?utf-8?Q?fOw45Uurb2aTwGzeNTu0Km6f9?=
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-WHZ4PZzFL3NyunudHDV5"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65af9552-dabf-4da1-5dec-08dac8c62ba3
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2022 18:04:28.6928 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QuCUa5Ek1hH1iV0tNg43+Mx6SzMSQT/UqAS3mkaovXfi25k9Lp+1M8p4zqkeBPuUkEasG6FwqGe7Z0kTKlY5Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8120
Received-SPF: pass client-ip=2a01:111:f400:7e1b::629;
 envelope-from=dfaggioli@suse.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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

--=-WHZ4PZzFL3NyunudHDV5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Well...

On Thu, 2022-11-17 at 16:27 +0100, Dario Faggioli wrote:
> Keep the old limit of 288 for machine versions 7.2 and earlier.
>=20
...At least, this was the idea...

> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -386,6 +386,7 @@ static void
> pc_q35_7_1_machine_options(MachineClass *m)
> =C2=A0=C2=A0=C2=A0=C2=A0 PCMachineClass *pcmc =3D PC_MACHINE_CLASS(m);
> =C2=A0=C2=A0=C2=A0=C2=A0 pc_q35_7_2_machine_options(m);
> =C2=A0=C2=A0=C2=A0=C2=A0 m->alias =3D NULL;
> +=C2=A0=C2=A0=C2=A0 m->max_cpus =3D 288;
>
...But I managed to put this in the wrong function (xxx_7_1_yyy,
instead than xxx_7_2_yyyy)! :-/

Sorry about taht. I'll send a v2 (taking the feedback that I got to my
other email into account).

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-WHZ4PZzFL3NyunudHDV5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmN2d6kACgkQFkJ4iaW4
c+6QWA//a3Z8l5pRnuhJHeRqovPnUagsIxgfVa+05qIzLW37rmP8bqx2QlGcELsP
Ew6zWb4Qizmyb7ddmeAuMs3roEh09kyHTwafhhIfn/4Gt39mt0G52iDyZZaQeip4
25E1vFPQ7dYoy3ck9iQuUGNjQuRV+yty7KbV6YTgjSdTjmVnfqY3t1OuG80xDXcG
x8ZYL0N4hVTYVgNwvoZ/YZ0x6SHFlhDZe/chcMtiTgPJEVk/JoQjkNdr2q2NuBUX
f5wG1Yf4iWziimlkc26D4WEZbJMLRwPsv+W1WoinBbktRxnuJ4PjR7Z2M3u78b+t
f7l9mGmUjxbwwpwoU3Paemyqf2f3aCpZ4ZG7Cc9rj22p2XLUAfR3r1tCIuZmZG2F
6fTrpMHWULMvaTlLo+DUTeVBPzacWaQ1UXC+WDlyZokbwjZsEsGdq/5/LWU1MVJG
00DZ0T/wgXzd+qExm0J/58G5u9JWVXsMkk+lWn6IWvrZKyKnJ/MevV0QhZffOISG
xm1RjQy1d+wRwXuBQJRMn/0s4VLCfVIKtWS++JilzqZgclpDLCCrJ7RSlnASncM2
dgDNULHJUrrHIzw0tMpICt7w7zqpEE1GYZuy2FV9PWkvTUxVHj5/VOuAo+UF7BjR
YwvbA5L4P2SeAhJfuT8mPW+I480Wxm9Lc5pmDK/KVO/Fg2ChkZM=
=Sf1b
-----END PGP SIGNATURE-----

--=-WHZ4PZzFL3NyunudHDV5--

