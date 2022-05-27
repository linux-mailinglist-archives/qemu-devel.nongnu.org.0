Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F61E535A55
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 09:29:46 +0200 (CEST)
Received: from localhost ([::1]:41574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuUPo-00057W-Fb
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 03:29:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfaggioli@suse.com>)
 id 1nuUMn-0003aL-RQ
 for qemu-devel@nongnu.org; Fri, 27 May 2022 03:26:38 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:38502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfaggioli@suse.com>)
 id 1nuUMk-0000DY-T7
 for qemu-devel@nongnu.org; Fri, 27 May 2022 03:26:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1653636390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T2Xg9TIWOu9RAcFFwobb1c9TbLlJr19kwsVF5qQwhz0=;
 b=dAt9rWo9OvXu/9eJT22HmktDEtgM4qkwS7ysI4+OeMMdPwx13K92Gf1O9DBnRpOtN4+8nA
 IYm25s0nScw/hy3/mqWapBJouBJ9+QxzXkn+95Py19OBXopUcwhfg2wu4ymdtYIyM4BckG
 EIAizbyFGcGYd0ygzIn4W4ryzoMd260=
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2055.outbound.protection.outlook.com [104.47.1.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-ibErE9YmP2CVMOcrs-QXEw-1; Fri, 27 May 2022 09:26:29 +0200
X-MC-Unique: ibErE9YmP2CVMOcrs-QXEw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nIFrFlu/h6R8XS2UzS5rJEz6ZAIM3D7puKkgYctttl0C0bOLwc5BPjkVuwlo+zxdllCznNbsmXXNdx2cam+uB/pFLMLnaJZ4x+o9JmlOKU90Td+EtP0UdZyPcxAwyz4QphguLmEa9Wje//N6ShdIKxLi737YQZfZRMJJWI4yOurWTXfPRstcM/csTW/WFzDF67CWBmp1ZpoTJXMmt5Wwrg0flUDJaVg3uEdSzIh7xCSXkbXl+kyNxM1RaH+GShYlA2ZpyHsh/3oXx6vvqiOIGWkNTDYRVNg6KcHuc2+P8wGdHM7PE7vp52aN5zDmjXt3hHB7elpS+GNd/VFZlB9+3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T2Xg9TIWOu9RAcFFwobb1c9TbLlJr19kwsVF5qQwhz0=;
 b=QI/nt5cRGVqma+hBMVwgC4YSUQq3WGJv8Nhj3eANXxx/O3DlTwiTd486UU+SEJ5U8oyvq4YJy0XNsWBBGSO0n5W9l9nLbjhAegy4y2UkYo4n24mfleMgjRZFF4034H5v95y551NQFi16BI+kNR3fN5c05XGf3HoIRq61MUOdTX4qiTU5c5dA+sxSRp71AkooUq2gS3VajFuzT8zCFPCGZ1pAFe4iHS+yIGm1yAR4u1CeAJb/tUH0Dvga7NG6Eggyess8GrKJ5C8swdx/q5CsFOGHZjEL3I+ZbBtuzm78cRgRWC2tXm1myy3SpbIyF71WSY8APzQvNUDyWOSmRTUJHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from DU2PR04MB9067.eurprd04.prod.outlook.com (2603:10a6:10:2f2::10)
 by AS8PR04MB8120.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Fri, 27 May
 2022 07:26:28 +0000
Received: from DU2PR04MB9067.eurprd04.prod.outlook.com
 ([fe80::9516:5113:409e:da9a]) by DU2PR04MB9067.eurprd04.prod.outlook.com
 ([fe80::9516:5113:409e:da9a%7]) with mapi id 15.20.5293.013; Fri, 27 May 2022
 07:26:27 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "cfontana@suse.de"
 <cfontana@suse.de>
CC: "alex.bennee@linaro.org" <alex.bennee@linaro.org>, "pbonzini@redhat.com"
 <pbonzini@redhat.com>
Subject: Re: make -j check failing on master, interesting valgrind errors on
 qos-test vhost-user-blk-test/basic
Thread-Topic: make -j check failing on master, interesting valgrind errors on
 qos-test vhost-user-blk-test/basic
Thread-Index: AQHYcStbOS1hYB3z4ES3eiLpaNIJlK0xd5yAgADcMwA=
Date: Fri, 27 May 2022 07:26:27 +0000
Message-ID: <94ef489c1721bdd741ba71c3fe75b3b66ec400b3.camel@suse.com>
References: <6dad6efd-7cb4-d1e0-d5f1-dbe35f69e545@suse.de>
 <0e831d41-d338-ed6a-7530-a13d24675556@suse.de>
In-Reply-To: <0e831d41-d338-ed6a-7530-a13d24675556@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.1 (by Flathub.org)) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ed50573e-7866-4ede-f411-08da3fb23671
x-ms-traffictypediagnostic: AS8PR04MB8120:EE_
x-microsoft-antispam-prvs: <AS8PR04MB8120390FA9761DD78BB403C9C5D89@AS8PR04MB8120.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xapzBcEDtTKScYz43A8IwKuSUIUOZ2FlfB3U0rRjboTrjAzL3yHDeHe1R3t0635K1nmwxv0V3pf17oLnMtGF3AqpQFQpsLW/0YkfTvR1tCCOI+7n1YoztRzjGYicTbv46DeWjckN+d3VAWHcgBdmQUNT2f9xmvsIkbC4Xg57E+Ng+Bf+/l18g3DcFwnLx42+n+aCExee1jH3j9knKOJWivcNNHtUA+i98TBERHJ/yrtDcoq9fvcqxs1lBW35Ka0UME95iJOWwGT/GceVXKmRYiKgm160Yoo+CR+nJV0VxW7aA69QnRd3yQ9TuKpr9bIym1/7B/zRAs8NWRUTKbmjS/c1JBWBpfgxKzAcLLesIYfiIy83CxwBPvhziil0ltOv94hOMbWAC8LJ+sH/oV1QCUFQCMZ9tCVBHfDyvdFbFOOC9fvPycke9n1ZjdYDvFMOFZAydCGOI8pnc7X4a69KgJb90In2YYXRuNG39mlOI95/dCLXeJP/eh57zJKFhOeD3eb60c0FFeUqUj+cRt4AoQ8HzBYFd8SnYJwVz2XCLFWkltb9TXwXV0pWB+JJqG0TKFWc0LTRyPlCpoVxBoaBBzI7zDv09aB5CZL0PVqf/4YAjDkFL56PM7Y8xi8rqEHkw5xrKjyM0P5LCVJ907j1b/Vo9mNusKckHH9Azws3wSbZ2KIugx5MgeLBT5o2+UeZNY5f0lZsB6iJg0EJGfkSV4pnap5CQ7DOfIWepsS0RilKfuj7SF6FHa2dfxQONdfBigoNBY/bPqIeVsGxOo1z0X1ATIl/V/yfCZBWUh9CPKIn1edsKpODsgk01B86BVeHmYGNZDRMd6dameK2D0pBrQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB9067.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(86362001)(966005)(76116006)(122000001)(26005)(6506007)(64756008)(2616005)(508600001)(6486002)(54906003)(316002)(6512007)(2906002)(5660300002)(110136005)(91956017)(36756003)(83380400001)(38100700002)(4326008)(71200400001)(8676002)(99936003)(38070700005)(66946007)(66476007)(66556008)(8936002)(66446008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eGlhYkFtejAxRWNoU2RzcGYyQWtxVW15Uno4WktqVGx2WDJ3dEkyQm54dGVL?=
 =?utf-8?B?d3l3bndEeFZLU08zb2ZGUEJYT0N4TmVUNFpPMSt1RGdWNWw0Q3ZLM3hkaFZX?=
 =?utf-8?B?RUorY2s1WVhtNk92ejNCOTBNaVF4bHFWSGVIQXRzVXcxamVXdHEvRVhvZUVu?=
 =?utf-8?B?VzBSRGFDQ25yNWR1QlNpdkNmWE1wTHArbzlyVFNpNTVoUWljaXdycDVVZ3Jk?=
 =?utf-8?B?bkJTSG1jZWxWWk4zNjBDbEt0T20zRG9NUG1zRXZ2aGRQaDM0UWVzMlZTWEEy?=
 =?utf-8?B?d3lwZXpQNFJxUkhzNFNwTlFYQlZQUDRMNWVMNlpHWnBmejNlNVl1eVk4SEkw?=
 =?utf-8?B?bFJkSjRtQXpxOTJSVzBIVlAyNjkvMWY5QWl2blpRcGNneTZIOGJBRy9mTFZQ?=
 =?utf-8?B?aVRCMHR1M2NtQ0JYamVyWXJlRDYrdjRSSXlBSlAvNlVvZ25JdUlYdTMyc2JN?=
 =?utf-8?B?VEpUakhzMVluRDJtSGk4ck9hOHBrMXg3dVFWcFU0akNhN0ZpbS9keDBQSXk2?=
 =?utf-8?B?Y1Z4MFhJK1ZrbHhLT2lWcldjaWZSRFRrQlQ4MDBjNUJxeXpRVTVKbzdvaVFK?=
 =?utf-8?B?amp3cGFZemhVUUI3amZXK3h1YndNOEpzSXBFZ2RGc1ZHbytTa1l2bWNkY1ky?=
 =?utf-8?B?SEljcnlYMUtQbjJMS0RvaWFDY3lHbWpGTUlDVGU5ZkgwMDg0Y0Z2Rkp3OS9z?=
 =?utf-8?B?dDR5Z213UHJMbEU5b3d3dERpOTlubnpXNkdGVkJzRXdhS0lkUnlqYjBKY05k?=
 =?utf-8?B?T20vWkwreW84RFRCUDVqbTlFRlJlbis3TkdlWWQ3TW1GQjh6NFhSOEZBcHRF?=
 =?utf-8?B?WlZQTklIYUFQbkszbEJJNmM4QnVDQlZKQ2ViYllxSXJIczFZbExDOGdHZzcw?=
 =?utf-8?B?NGtxL3U2cmRuVWRhZGd4QVBlZ29BYmlicXR2a1pxL3lncFcwVXZla1dLcEQw?=
 =?utf-8?B?aHpkTExtQjZCZjBscVF4N1B1c0l4UlNlYnVaQmQwZWdITkxUYzNEVjZEVHBr?=
 =?utf-8?B?QzFqYnpmcnNLaERKdnNTWjJwaFp4NGp2eERFaFBwQ0dISk9nbEtuUUl2enhG?=
 =?utf-8?B?aHZnTEdHVmY2ZmtkZnZCWjhJREJYNXhuMTExOEtJMXordjZrNTZqVEN5cHlN?=
 =?utf-8?B?OUx6Ly9NdjFBRWorNG53eDM4Y2h2aFJoVzVMNEpVVEYrV0I4MTJCZlpFZkNt?=
 =?utf-8?B?K1VCWDdKQVpBRktpL0hMQjRuNDJWMFlsbktyeDJGckxFZDg5eW5jR2Mzemhj?=
 =?utf-8?B?RUMwVThCT2gzdE9qdVBVWUhTaUxVVVhWTXVsYnhLV0xMWnNkTnVlbXhobUF4?=
 =?utf-8?B?MHFkYnVoYWpBN2JwS2JRV2UvMnFlVmJrSi95MkI4WkpuaHZHcFhhQmVYWldm?=
 =?utf-8?B?cUI5VFc3R2gvMlV1dkw2RmdmS0NhcnlRSm16L0IwZGtoZEtQTkVuYVJGTElP?=
 =?utf-8?B?YlVlNklMQjFlMlV2V0sxUGxzQll6NHR4NHRtYUF5Mld0b0ZyMEFsN0wxUnJa?=
 =?utf-8?B?MmNVc2pUcitNYnQwQXVicXU1MFUzMVlSMC9UQnhzTXBxOWdza3RzUVB1ZGJv?=
 =?utf-8?B?SDBYRi9yWXFINk52T1ZyWjI2MkgybEk5MjJpbWlyVGlUcWNONnJtL2pSWE90?=
 =?utf-8?B?NGIrL1dhU29tZGZvR2VnVExReEZFTm01WFBjQTNSbm5VMnQxa05uR3ZvUTFT?=
 =?utf-8?B?WHFnSUZ6VTRYaEt0b3NmQ1NUL1NVNXlvUElSNkxENjRhTUNRWUlWbzl0MGRz?=
 =?utf-8?B?cCs4QXJER01WSTVNZ2dyWU9XZU1BY0I1ZnN2MEQ4ck9Wb281THU3aVJkVFll?=
 =?utf-8?B?cEQ3ZDBCYkkya2syRmNQcXNVVThvQ1c5QURmTFpsTGRnV2xJY2Rya0k4UjFR?=
 =?utf-8?B?Q2ZpQTVBUlM5TENyK1dJTmhRQlppcUkvVGJVNXRBY2piK2pzMXdURmgwb25V?=
 =?utf-8?B?MkhEK0t1U0ZwOWJ6aUl6dDFra0RuUUh6N0J6M0xNSFVMQ2RLZEdsbmNGZWM0?=
 =?utf-8?B?QnJOL3lHMEIzYTFtaWZodlJlLzUyMU52NDM0NVdaTG92V1RUbzY0NGpQSGMz?=
 =?utf-8?B?NEtpQ1ZEL1daWXhCR2dOSHlGeEI5STdwMjRQSjExVUpFamJKNVIzODBmSGsr?=
 =?utf-8?B?dFVtVzFBbVNXRmU3R0RmOUl1cHVJUHdYSkxnZW5IRkkvTGxiNnZBZHJUS0xs?=
 =?utf-8?B?STB1ZmtPeW44M09tV2FETlRhczU1bzZ2R3pMVmtrd3Q2d2RydXR6RVFIU1BP?=
 =?utf-8?B?T1JoTWhtY2lWUWNEUkhLVVJ3Q00zSU5lQ2xtQW9vQmE1czF4WGs2WFgydFQz?=
 =?utf-8?B?cEdNcVg1UnBSYndoTjI3ditHWkxkbHlBRWZNeXZjcFdYWTlrV3VvUT09?=
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-dFvvxQjVfJT14i+6442E"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9067.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed50573e-7866-4ede-f411-08da3fb23671
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2022 07:26:27.6356 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A1EnZhcDqkZY3PKv5WyYrzr6RSGxDn5LUVSenLDuFQgoJPHkYrIPDTyy0ZRpZpjpsX7ksHvLpGr0PiY3VGdYLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8120
Received-SPF: pass client-ip=194.104.109.102; envelope-from=dfaggioli@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--=-dFvvxQjVfJT14i+6442E
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2022-05-26 at 20:18 +0200, Claudio Fontana wrote:
> Forget about his aspect, I think it is a separate problem.
>=20
> valgind of qos-test when run restricted to those specific paths (-p
> /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-net-pci/virtio-
> net/virtio-net-tests/vhost-user/reconnect for example)
> shows all clear,
>=20
> and still the test fails when run in a while loop after a few
> attempts:
>=20
Yes, this kind of matches what I've also seen and reported about in
<5bcb5ceb44dd830770d66330e27de6a4345fcb69.camel@suse.com>. If
enable/run just one of:
- reconnect
- flags_mismatch
- connect_fail

I see no issues.

As soon as two of those are run, one after the other, the problem
starts to appear.

However, Claudio, AFAIUI, you're seeing this with an older GCC and
without LTO, right?

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-dFvvxQjVfJT14i+6442E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmKQfSIACgkQFkJ4iaW4
c+5z9A//bnJa7hfsSniB/G2gYucXH0lq9wkf8gONF2a1vrixcNGdXnA8Ubrw8Myr
PqSugPMoB35CEAxxb5CnNqsspbVERWHx00Puf2TVgMQMApb1xrDvxKbPf1i7KhUM
2CC4GUxqdbi2fxO4EdhafyAdcs7hufhS5ZuglEQ3MxT/ZZYJM7faE7wzHMG7l2Pl
WdnXLg8YFqpQyVgcPl8D8pFL51x6jVvmVUrmvP30IEZvmUXiNhegrCn5wJoni4LB
KrX+pk164NIZ6JRfORJChunfXcNz6wC1XzFBKNXxAdexbf+/w0Gs6p1dNDm5ofK+
PDmd7J6j8AB/R6y1geDz5xmognGCg0Q9orQ6hJmKPPY0dyxd7H8YZkfE9oOk2smg
rTLdh4Qt8OrMoKEjssDoJOEPmIYY/1R+JVB5pHh955Ip7GgrtoTt9UMGbsIP4OFb
0OxNm8vZ2+8NmAluqkQLJhO1kDAbU5UYBOaD4WDkUN8qryWzFOvH6CQuQSfNPYd8
3uY099j8DlP3MoSD2gse/C0g9Ju+Q1QPPUDNEqVcyRTpxhsSnPxivOKbLzzhfWE6
MoAGiqwdyGCFyp251CMgsMBIxoaEpzgRyJX1TlRjCdcynHs30wbY9cAwBIua/gOD
LQqVUwxPFMEzGC4QT7pYdmAEKEqEMB+Sp5EDvsTZ0P9uwpKFbCk=
=XEcI
-----END PGP SIGNATURE-----

--=-dFvvxQjVfJT14i+6442E--


