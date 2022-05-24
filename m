Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1753E533258
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 22:18:21 +0200 (CEST)
Received: from localhost ([::1]:57538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntayy-0005TM-2g
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 16:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfaggioli@suse.com>)
 id 1ntatn-0001iv-RL
 for qemu-devel@nongnu.org; Tue, 24 May 2022 16:12:59 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:54232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfaggioli@suse.com>)
 id 1ntatk-0002uZ-1l
 for qemu-devel@nongnu.org; Tue, 24 May 2022 16:12:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1653423167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jbhtWSKshMCV+1gLJPnjclulUOO4rPave2vuqBXrHGA=;
 b=k4ruAIRmgzjU25eI32NvE2foB84Crca9PG/AYvTIQPh6mIGy94unpsjYg5hPmmSOhabKGG
 DyFOLtH4VfnEFtXI2yRO8g8OeqcpdeRwPSHI+LNPCVthbggE4ylQaiAPZbjPlzvbGXOyiC
 Fqkq1MwKO4z+T0f8mQpoYo5kn0NLbBo=
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2059.outbound.protection.outlook.com [104.47.5.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-jgxwRDsXOwCOYw2BsJXoBQ-2; Tue, 24 May 2022 22:12:46 +0200
X-MC-Unique: jgxwRDsXOwCOYw2BsJXoBQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D+4rG4mz+g7YQcnA5TfDichot2r/XcIi40w9mDvN08dWt9tJtTHVuhmJVktOUe+QFE6GTvqLyiM39N0gqHPrejB8NmNV7wkT9nC1zYBojZStxaETDr9dah+wUpOH5/M1WYB2S80AGZKe5YKLhF2B9TiSmGPgwomtduXYU3oV/K9mMFH8qlnzoJideFQQHCX0iHJRHz2Ou68wUZymIOC71B+YBrMI8s5kOTHgZ9g9lk2gwjoTEepFE3Nqzy2rN+f6J1su1P8DZ+6ytVltaLQkW7qjeDaKNeos+0FrYdG654hjfQnAhBH/ru9dbFiBeBw00IO43D7vX8wxIyfBEMJuYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbhtWSKshMCV+1gLJPnjclulUOO4rPave2vuqBXrHGA=;
 b=VqYgDH3yx5GZmIlgRJV9yzs+Zqc4YM1YgoUe20MpDhkq9vjKWPH8u+fYytnWuQgJKbL1H9xrpidwJxZ+C0pRn98NBTG9BOn2pj6QNOViidapUZ/CsdwLhyYrDONKv29VN/4ZNyIb6Olz0gve0yDP57PBRT0ajsFcHStZ5mXu8RrCBR0RFZg2xIIWYuhAx5gVxgBCKrKLc/oo1SuK4DlJNkG3JKIJOqS06K53ZkCXbkGhJYXdCk6qLkmPqbS9EwMtwlsw5IH5ba+BAqI3NxwYfTn79JRvyUklkIl5O0YCl56MZBqcs2deEJEe9DsQQvqjem8RUG2AUPIvqs51h1Lxsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from DU2PR04MB9067.eurprd04.prod.outlook.com (2603:10a6:10:2f2::10)
 by AM6PR04MB5671.eurprd04.prod.outlook.com (2603:10a6:20b:a0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 24 May
 2022 20:12:44 +0000
Received: from DU2PR04MB9067.eurprd04.prod.outlook.com
 ([fe80::249d:2d32:4f2a:f748]) by DU2PR04MB9067.eurprd04.prod.outlook.com
 ([fe80::249d:2d32:4f2a:f748%8]) with mapi id 15.20.5186.021; Tue, 24 May 2022
 20:12:44 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Claudio Fontana <Claudio.Fontana@suse.com>, "alex.bennee@linaro.org"
 <alex.bennee@linaro.org>
Subject: Re: Problem running qos-test when building with gcc12 and LTO
Thread-Topic: Problem running qos-test when building with gcc12 and LTO
Thread-Index: AQHYbtn1TEp8uXfDDEibt4Y5btKKta0ud4sA
Date: Tue, 24 May 2022 20:12:43 +0000
Message-ID: <24c61f36e23339cb1ab80b41e906ea60a0d67d2a.camel@suse.com>
References: <1d3bbff9e92e7c8a24db9e140dcf3f428c2df103.camel@suse.com>
In-Reply-To: <1d3bbff9e92e7c8a24db9e140dcf3f428c2df103.camel@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.1 (by Flathub.org)) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 912e5e15-c929-4301-0b2e-08da3dc1c348
x-ms-traffictypediagnostic: AM6PR04MB5671:EE_
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-microsoft-antispam-prvs: <AM6PR04MB5671A393E4726011DCEBB348C5D79@AM6PR04MB5671.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /+VwwwAg+R2oN0IXx9ngzs/IiGiqZdCIy29n9WEc+fv9Lhcrw01daWs0+Jx9xvwA9EHglxUyrxh5QVsPa6IP0duNNR5ozwIOzHuEVKxqtBskX8NAOnW9g2SHUIEvZBBv1dhiMFDIdCqNcVwioeao1sW/LIsONLXBtr5gG+VINZ6FwN+kqjTdGoA00Ko3sl8ab6GsPSN4oIu2m+ezIikybeJvLxvCzMDZCg7eJb18IVhh/8MKtT/2EW+CpwaRaW8eAs7y7arSYg3jrnYZ1Q52fCOmYUmPlXC0CgiHFsmJmS6TNn1QFAvCyiRifa7wpQtaaMLUbYLdLgBzDP9rk89aiV58SJ3ETb0AB2ohI1xSLlI4d9v5T/g1AUbpuhtY/6O3hC6AfBlLhEg34hDwmFo9r+0cQt5m0eQaKkBdQ8ko4rb56bKgDL30eaVo3TlpppbQ4SqXNMkw5CYlrDi/S44GH0IuFcTo7pitebrlWT/BvQ83SdyR0CljvyXAgvKUryV8MfrJmh926lndMtJYY71B6JyPbXlvPpoj07xlO6XYEuUmiSQe7vxyt+fD1hlyPjIKB7TC4Zz7LGMxijSRHTGqz5zsjhckz+QJ8shj6Hlyxzco4ua3zJNNdLPSrsrlhP8sTM1KHtfPrZEZfRAdd5rFHJ6zk04LnN73VhBQ1jPDQjfHhpLmoOr+/U9+Xw1HDDWfjYq+LP2OH2AUZ+CuIpUXOHQAl2Zri7qVoA7pivniSxMlhQIESIcRT5NJ5MFqO5ybUnkBZfZqNk0Gv8iI62e8APPrXabQ5J2CRtCg+k1/xw9f9hB3jhdwWminOch7C8uTr1jNbXhF+9bBfFeuLrUssA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB9067.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(36756003)(26005)(2616005)(6512007)(66556008)(38070700005)(66446008)(186003)(66476007)(91956017)(66946007)(6486002)(76116006)(71200400001)(966005)(508600001)(8936002)(38100700002)(99936003)(122000001)(2906002)(83380400001)(64756008)(4326008)(86362001)(54906003)(316002)(6916009)(8676002)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VUVpTzIrZDFLR3FidElmVXZ0TVJUWUZ6MFV5REVrdC90UFdncmpNSXlVeUJQ?=
 =?utf-8?B?S1BMdzhwL0VRVEZPQjZVL0ppSWM0SURWeXEzbkJ4T04wbEdlaEM1WGtZZEo2?=
 =?utf-8?B?cXhaWnZUUFFxQ01KR1JzajRDcnZnTTBYWmRrM2t0M1ZRRXl2bzNWSGg2SFlD?=
 =?utf-8?B?Zm5UUzJVejdNWmUyUVFQTy9uN1p1RlVpODBOc0g3Y3NFdVNpZDVDWEF6VG5T?=
 =?utf-8?B?OUdYV3VvV1poWTVwK1VDWDBLUlo3dG1NR0ROQW1xZGtRelVyYWYzV0huRlhr?=
 =?utf-8?B?VnF6azJubXVRWGd6QllmODRMblB2Mitnam9jQUE0VFV0S3U0NFdIck1iVi9q?=
 =?utf-8?B?YjI5TFBkNWFMSGdpaUdDdmprU0kzOVVjQlZoUnhtTEVmeHZJTXNONmlWYUx5?=
 =?utf-8?B?Y25sRDRDRzRyNWo1dEZWSFo3UmVCVkozR2FsUVF5bnZXVUVrRmdXNG1kclQy?=
 =?utf-8?B?NUltMlVKbXdUUGxQay80K1VXZzc1NzNsN2RvL3VJUmN0bDRFY3RadTF3Z2tR?=
 =?utf-8?B?TWhMOVVqYmtxKzZDZkFITkxoVXIzZG0xamlFUFcvRGFWbnUrSHBpRTAvcnZS?=
 =?utf-8?B?dzdhRzNvTHRHS3lEMjJNbnFOZkwyRmVhRFp6aExIR29RQWtzS3lIRDVtNHVT?=
 =?utf-8?B?Y1hqK0lHdCtRcHBoODZ4SjArWHhsY2hYbXRsTUEvRktyMDNzUGtENThiOUhB?=
 =?utf-8?B?akVLRDNxbjJuUGdkaW9OZXNVL0tZYnpZU042TjkxYnJURW5NbXFjZyt5UEVX?=
 =?utf-8?B?MjdKT213aXBaQXlqOEdNd3R0Tkt1bXNwWnlQbFV6eEJObUV2K1dOZHJiVEs2?=
 =?utf-8?B?M3c1ZXZMTVZ5d3Z0OWhieWZGdi9pUnFRT2I0dWt1WUtSREphbnZUbGRJYUJ2?=
 =?utf-8?B?ejJrbHZtVjBkTDBOMk1DRXJqNVJHd25sYnhCdHpDWjlpSnBuNWNkd3hDYTBp?=
 =?utf-8?B?NW10WlpyNWc2SU9yTGxBZm5mNllhR1ZkNXhaaGVEUDlmNHdsaW1IS3d6bnpV?=
 =?utf-8?B?T2RkKzZ1c2EyREV1WldHTHlBWnJNT2N6TGV2THJaOWNCWDl2WStQWUxBWHZU?=
 =?utf-8?B?enE1QjV2THc4RTN0QkJrdlZMQU83azRoVTVUSVZzNW5jaWh1MWFQSlRsWFNz?=
 =?utf-8?B?VHBibmxyZVdyUitCNHFJSG0zMmZTZzdQM3RrU1lSTGV3TExFaCtIcjVEa3Vu?=
 =?utf-8?B?UlZ3aGdIV0MzYjZFNDFVTmNyejZYMmQ0bUh2eUQxRERvS1BKazBHcjZya2Jk?=
 =?utf-8?B?a2R2cXBaS0NLUmhacXlzcURRSUVtZ2s3dk5zenR2YU1PRzRsMzRlUTRUaVpN?=
 =?utf-8?B?UEVnRGhEcmZNTS9OL2F4dFh3UDd1UE5xOCt6Z2xtUmFQQS9rK0x1QzJqeHVT?=
 =?utf-8?B?aFIwUGdyeExuSmVYbFZYeEo1MHFLWUErcTdkR3NzeVZXMjE4cFkrbHp2TFdo?=
 =?utf-8?B?YjRBREViUXRjbmtZdzBnb25iSDg4UTlkd1hPZWJhSW42R28zY0YzRWlta0N2?=
 =?utf-8?B?TXd3NzNGUlgyTnBsOFMveldwZmo0SG0xNlNVQjJwaW5xcHhsdFl3SjZ4cHVw?=
 =?utf-8?B?ZEJmT2ZIQUcxc0ZidGFMcHYvRnF0dEFzQmxrNzRmclZ3dUxKcXlGRHRhdEpm?=
 =?utf-8?B?S0I1anZNRUx5OVJJM1FjY1hiU0pEYnpsQ0JKVm1zcHhYanVtTWxoSk1HcHNT?=
 =?utf-8?B?U1NDWG0vektLSVBCUnZXUzRoRG9acGY1TUpyNk1GcUdKUERIdmpEUldpSHV1?=
 =?utf-8?B?N1lSUjUzRjE1RTFoOCt4ZmN3SGp2SDNOajZDZWp0bFFyMWZENUJTcHQyazNn?=
 =?utf-8?B?VkhDUllDUnlvK2xGZEM3RVpLdjhjZk00RFNFeGcvb3RrV2d2YzJPZ1NhMlUz?=
 =?utf-8?B?UjJoRTRsa1YwekMxQUxtWlNKZDIyb0ZPU0lyb3UvV3Vkd2R2ek1IU3NzMFda?=
 =?utf-8?B?RDJIUDNlNG40VHRlVkQ0VGlsWDZaTW5sTUlxUkpIWjhJL3Q1b2YrL2xuL29I?=
 =?utf-8?B?cmppdWNHRnc2S21TRzV4aEhjaE5UdngrbW1UM0RsbTNQeEN4dXJDWmRNMHdK?=
 =?utf-8?B?bllGaS9TcGg3bVJQM3BSNkZUaDBDMDFIY1gzK3RySUIxemV5bGNUSnJNS3o2?=
 =?utf-8?B?dWd0elN2NldOaU5LSFRPMnZ5VUFmZzYxcDNOT1Zzbm5RcnFkWE1HajlqUm5D?=
 =?utf-8?B?NmxXTVZnR0w1N3NEWE15bFhDelFTKzM3OEcwamQ4MlNsM3NoZTUwQU1uTkhC?=
 =?utf-8?B?TVBEYjVwcStzQi9TLy9paGR6OVNBbW1uNlZNY1UraHZCSmxLOHZ2YStSamRP?=
 =?utf-8?B?QnlyN0trSHlncDBXQmlPc0l1QlFOcVByUFM4VHZCa2xvbmlTVm1EQT09?=
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-PvGBbNbwKgY7zTrQaQqo"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9067.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 912e5e15-c929-4301-0b2e-08da3dc1c348
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2022 20:12:44.0451 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q29LefmDAuJetx/JKbMSVKu1j7EobWNwJm6sXrkiL1BNPZNRa9LKWXv3o5M/jpE7LZ1WHnr0iqkskKnmGtGvlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5671
Received-SPF: pass client-ip=194.104.111.102; envelope-from=dfaggioli@suse.com;
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

--=-PvGBbNbwKgY7zTrQaQqo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2022-05-23 at 19:19 +0000, Dario Faggioli wrote:
> As soon as I get rid of _both_ "-flto=3Dauto" _and_ "--enable-lto", the
> above tests seem to work fine.
>=20
> When they fail, they fail immediately, while creating the graph, like
> this:
>=20
> MALLOC_PERTURB_=3D${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> QTEST_QEMU_IMG=3D./qemu-img G_TEST_DBUS_DAEMON=3D../tests/dbus-vmstate-
> daemon.sh QTEST_QEMU_STORAGE_DAEMON_BINARY=3D./storage-daemon/qemu-
> storage-daemon QTEST_QEMU_BINARY=3D./qemu-system-x86_64
> ./tests/qtest/qos-test --tap -k
> # random seed: R02S90d4b61102dd94459f986c2367d6d375
> # starting QEMU: exec ./qemu-system-x86_64 -qtest unix:/tmp/qtest-
> 28822.sock -qtest-log /dev/null -chardev socket,path=3D/tmp/qtest-
> 28822.qmp,id=3Dchar0 -mon chardev=3Dchar0,mode=3Dcontrol -display none -
> machine none -accel qtest
> QOSStack: full stack, cannot pushAborted
>=20
Ok, apparently, v6.2.0 works (with GCC 12 and LTO), while as said
v7.0.0 doesn't.

Therefore, I run a bisect, and it pointed at:

8dcb404bff6d9147765d7dd3e9c8493372186420
tests/qtest: enable more vhost-user tests by default

I've also confirmed that on v7.0.0 with 8dcb404bff6d914 reverted, the
test actually works.

As far as downstream packaging is concerned, I'll revert it locally.
But I'd be happy to help figuring our what is actually going wrong.

I'll try to dig further. Any idea/suggestion anyone has, feel free. :-)

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-PvGBbNbwKgY7zTrQaQqo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmKNPDsACgkQFkJ4iaW4
c+7sxhAAvhrkWiAb4g+FWfj9rGVTiW+Zcs8REcKzV0QVKTU6lqw38iIP21dAM1C6
PWegd6EMzavySwf7SgyBOIzxsEjKsQGl9bPm7ZU0pDfwj/dve7eTThKLzi04/7zY
iWrwTl1IkBL1CnV0VWXhSO5vlDxKEo5zNtTb+/uvxu3XvnpQH9ixjv0ZvcxIbDxm
FSd+nJTbq0ND0gnVZ+tUe8nhKaMD8xszLPcI3XcvLTl0Pp5QZC/uIx8MSZ3I1A0h
sDT+G98sxjH6IQiG41mH0Vy7S9qO3ursVZMCT4PWvZYyW2JAvUodqZpOBopuN9l4
Q7MvgdVI7XAw/WJTRym/5k9UfW/UwPBVgDn+QFC8J3WlU4X5tThajVjmjALgK1tU
gqdOmaL+XUpEZHx/X8+2r0oHRAJHckn3hHekTVC0jt/KoKudYyOb14PzhCA+v8+/
XV9JiwRgPhx6w3qXE28w9Ob171o29/0Ki6KV/9sfE5kj60m9PmPhJx8/enrFTwWM
sk0Z/T7qzBF+gURRtGqh3ABNWpQ1u2du/7tto5BD/Lcfct7fqD+SFNo6nQvGOOX1
eWzm0uXAWb9iu+yRGo1sjyNZ1wu8mkz4/ppO5OnFEDKjk/COGN9ZC8q0dVsj+Ip0
N60yM2KXpvTmwXDiTV5eo0PvCbuR1oM6UOIzdUkQ3qg1yNhkFkw=
=KLst
-----END PGP SIGNATURE-----

--=-PvGBbNbwKgY7zTrQaQqo--


