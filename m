Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18374533BE6
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 13:42:43 +0200 (CEST)
Received: from localhost ([::1]:38254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntpPB-0004cX-KD
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 07:42:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfaggioli@suse.com>)
 id 1ntpES-0001aD-0j
 for qemu-devel@nongnu.org; Wed, 25 May 2022 07:31:19 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:55541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfaggioli@suse.com>)
 id 1ntpE3-00037g-EY
 for qemu-devel@nongnu.org; Wed, 25 May 2022 07:31:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1653478244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SzFFZImhWVntzvdg/nOoKY1uZQpMwVayPZ1I2qAM2hM=;
 b=EdotXPOdOFKjilK19cZ9i0ALRh1RIrJ/zuoW6F4A/IZ0FqwYYjxhn7KxDkZxACyZ5RiTXM
 ARQohErqrhfoNDubnQilaQkKqIYlTIi2xKBdR9jV3wV5xzFXk9OjXBwJ3MyqcGxfZ3PqHa
 zI4bIBkbe8XoAwpJt18uyNsbHOIjeow=
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-2ZGVysbFPwGvYp7qMCM21g-2; Wed, 25 May 2022 13:30:43 +0200
X-MC-Unique: 2ZGVysbFPwGvYp7qMCM21g-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JU/RAo3ySZDIa87z5aEBy6TOp7FhzYupyw6cxyzJxH/tTx/Pz3RD5Ld+947W+eusqm/XLQWeFQg6U8obB6gmLqf/sJp9APTqQgsXOqD+QbqE1SKfL4ZN5NZITMI0B6g7QhaW59eUFAO6rjhAftqXtgWaBTZGozthXIwQs3S7nzfAMvxTskO7m2h30LuxH10PhE0zdD9jQcuF3Vfjmn4vG7LQNChukezoFmWoBSrgPfTzQY5k/D5LdBSt0OhrEjjZqshe9xbItPQCZhcPYlxyxUdG3SISBdv18E2EIMmwdUoJRxBl/vGXOeLI2n4HHFvIoWLWvy+PWQNZiPEC8rGk8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SzFFZImhWVntzvdg/nOoKY1uZQpMwVayPZ1I2qAM2hM=;
 b=AoE8RXQQAu/6y6Vggpg/jjLhrF3P0SWdwd95RbRzAZJbF9GTwmHyuipOTWxutCAF5uHo1XwoByO219B41Bp05kuI5ef7+iSJIOJD4NlTXWBNQgSCzIH5SMf6d72a92bvfLY2vr4YVvSYbBBOKDjxnf+5jkKyUAPmafeGERECmZdC2c7c/5KncUuGxJ84lxlzfJJTY8CzMT5x58fvjcv8KrLr9NDLc4MM0IohJu3oBeV3x8Zmd4Scb5MtY608MvRw/Z/IjiCRWBFnS/QLjnwJRWjH56VGksXtaDhBYgSkSlb3ummUfsjtPOWb+/66vfmhfPYjI3U1ZwzL8dCq+QBMQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from PAXPR04MB9075.eurprd04.prod.outlook.com (2603:10a6:102:229::12)
 by AM6PR0402MB3448.eurprd04.prod.outlook.com (2603:10a6:209:e::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 25 May
 2022 11:30:40 +0000
Received: from PAXPR04MB9075.eurprd04.prod.outlook.com
 ([fe80::dcf2:9231:4657:4c23]) by PAXPR04MB9075.eurprd04.prod.outlook.com
 ([fe80::dcf2:9231:4657:4c23%7]) with mapi id 15.20.5186.021; Wed, 25 May 2022
 11:30:40 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: "alex.bennee@linaro.org" <alex.bennee@linaro.org>
CC: Claudio Fontana <Claudio.Fontana@suse.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: Re: Problem running qos-test when building with gcc12 and LTO
Thread-Topic: Problem running qos-test when building with gcc12 and LTO
Thread-Index: AQHYbtn1TEp8uXfDDEibt4Y5btKKta0ud4sAgACvsICAADH6gIAAHs0A
Date: Wed, 25 May 2022 11:30:39 +0000
Message-ID: <0a7912b0604ebd53de7f79bfbf4e19cfeee620d8.camel@suse.com>
References: <24c61f36e23339cb1ab80b41e906ea60a0d67d2a.camel@suse.com>
 <87v8tu5cyy.fsf@linaro.org>
 <5bcb5ceb44dd830770d66330e27de6a4345fcb69.camel@suse.com>
In-Reply-To: <5bcb5ceb44dd830770d66330e27de6a4345fcb69.camel@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.1 (by Flathub.org)) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 81488c18-d789-4b46-27ad-08da3e41ff4d
x-ms-traffictypediagnostic: AM6PR0402MB3448:EE_
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-microsoft-antispam-prvs: <AM6PR0402MB3448B04B271355E054AED3B0C5D69@AM6PR0402MB3448.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wY1D3zzT1656VQK8tElv18k+gx8DgiHsFlxVijbL906vrJ4Sq/GBhLtWmazfpNjOoVcnB138r5n6KBYQEYLfzyzIXyaHfWmjrh4a6x8OSEZeFalF8sZGe3U2o8nnQ1xtCzZokJgEnXhigID1QKv7FI+0XzXcOhkcKmUIveVf9MsV6y/WUiAyhsZu12xgN+k+HrNmfBeSaPsHfRlNe1fCOsmGodTc/0SHxrpWAssW22yFaeY7fldYJ2USscXnOafmZ27styUfgZVvniMFR2PIYOfuyiwVb62WpmaAHOFniSeevFxZ9psj/SNksKI/xmNbTYxI6WfFjmgdIdfnvSA1Zh++podJg+XNK9e900xQvxNl8HnavhZtGoapcy1aFbj4akvJRwfUBGrsnb1f4V0OPxCjep8FQsUliDNLMTdeA5jeYH860PrhW2p+5y9vvDmgm5eKxqbaql5lyhStNxwsVTZRNm8bLDyGJEwV9TwytkkWAO58qg6ZjS9D2CBY2X2IcOqbJEFkgg69AcHrWB0ApG+PdQImLjS3v9tYJo8DlDHgz03OxGof8EG//BlFQOfLzy/UlnavPHwq6D7VGxaSfTmKdQ/Lb3ikAvUU1WRmLwYwasXl6q+80Cf45HeaPilghMl/z1+UjeTgaZRAblAqzixcJYzAqe71XnOt1hXrlQXUett1bkFNLNt44sld0vQFhRJ09R/qn6YB3ERVo+Y/9ppRM+Z0K9AC2VU5bu82IHDI8Debx4vVYlISV6d1Mz2a3qlqhrUh/3d/4oKhiOlpftr64iVxxT+hmPi1CFMiVtwCLdGI3m2UOIPfa//mMEeFE+SmGxhs/rcsvmexB34qHQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9075.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66574015)(54906003)(2616005)(122000001)(66446008)(66476007)(64756008)(38070700005)(5660300002)(71200400001)(83380400001)(99936003)(186003)(6916009)(38100700002)(2906002)(316002)(8936002)(86362001)(6506007)(966005)(6486002)(36756003)(6512007)(26005)(508600001)(91956017)(76116006)(66946007)(8676002)(4326008)(66556008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?LzlGbVFIWllYdExleDJYcXdLQVpyR2VybFlBOFM3RHN6anBZclJxRU8yK000?=
 =?utf-8?B?cmkyRXdaYU1JVmJSblBjRWsyci83dEVzVmdqVUkrUm5RY2RJWDhINlpUZ1F5?=
 =?utf-8?B?WFZqTU5uWHcvMGdIMSt0SUkxVUtyT3hRWlh1RHphazR3Sk4xRENqTVpUK0ow?=
 =?utf-8?B?SkdGbndUcmFkYmJRcTc4eGVQWnYwZkdLbW9qSmwxaWJDL0tqdTBXK1ZVdGRO?=
 =?utf-8?B?QmtmNHZlUlRodW40VldnR2xyV0ZSQWwydTd6cTRzamJ4V1puRm1hTEJMWXYy?=
 =?utf-8?B?ZFJPV3VTVmMvdlNGR2pnVFZVblQ2NGFaTmlLaG10WFNwNEw3S2RqY0llVlVy?=
 =?utf-8?B?WGRjT2lPVFBBQnRTeGVIVzRGc25UZjNYZytDQm1DU1N0dVllSHhvR1dzb1Mr?=
 =?utf-8?B?RkpLMkgyc0ZHWUVFbFlXSFljdGVhZjlCRUxYSUh4WkxPeWFJUnBFdGVaUTRO?=
 =?utf-8?B?YTdvOEh2YlVGd3ZHV2crWUFLRU1rSjVOKzgydU0reG9hNFI5RWJweXovai9a?=
 =?utf-8?B?aUJLZHFlblpoNm40bzNLZDN3R29LbGJ2RGpOa2xvZTRJSUhYSmJvTU55ZDRK?=
 =?utf-8?B?eFczbVcraXV0a05MYW1pUUI4VUVjb3lvT0FHMmZ1NEdvZTRGNVR4VEdraUhI?=
 =?utf-8?B?VWlWNnFOWUJ2VkpGVGNqeUlKNzNiRkxNRm9sRy9VaThlYkRwcEZ0eHNPQkZp?=
 =?utf-8?B?WnZwbEpwMTQyUFVFOXpGMVM1U3VqdEwzWVJvVTRwVER3VnJ1T0F6dDdCbGRD?=
 =?utf-8?B?MjVzUDZsY2p0aGh1alFCSjU5TWFnL010bnNmVHRGbGZzNFFrNmg3RW50UFk3?=
 =?utf-8?B?R2w2dkdrWFp4ellzNXZrUytHMHNIMXR2cHB4VzhGeVNLd2UvYTVGSmk0VU5T?=
 =?utf-8?B?SGhMbkwvNzB6WXE3K0RTc2lIaHAyUlA0U2VuUUdPMnlQUlpWMzBFd1ppRWdk?=
 =?utf-8?B?SFRBUjV3Nlk0cmU5ajNLVVBPNVlWZlJCMkg0b2R0R292S0liSUJLeElHS3kr?=
 =?utf-8?B?WXN5ekNZUVZiOUY1Z09yZGk4aWhTWS9jU3huRnBndXFkTlBheDFzQ1gyMlRr?=
 =?utf-8?B?c0hvaEJ2NHRGQllEQWxBL0gxQm9LNEZSblRHRkhnQkpKendqb2dWNkxyTFZr?=
 =?utf-8?B?c1Z6Qzh1MHNFczcyNWdudHhOV0lHZzJ4b0swaVMvTGkyZm5KKzJIWmJEMnhz?=
 =?utf-8?B?UUIzQ1g4d2RyUFJvRCtCQXVHTVY3cFRXWjBrd2lVODhLbXVJT3Z3Mk1UYU5H?=
 =?utf-8?B?ZThIckx0dW10NDBwV2NaRUxSR3hzRVVkcmpqOEx5WmJaTjcxV3ZEUlJDMHNR?=
 =?utf-8?B?MVZvZk9QaWRiMGdVTDFOQVhZVGJrR3ZBV0l3cXU3S09jNTg2OVhXcllHLzhk?=
 =?utf-8?B?SUtkVk9BM01mZnhnZEZ0bWpaNnlxZ25GMkNsQnp4Sy9uTWEzVGpZZW9yZzRD?=
 =?utf-8?B?cnFOZjk3ZTYyYU1XWW9QWmd2MWVER1VPSFg4dWYreEZKTUlnTWNyN0Z4NTlD?=
 =?utf-8?B?bXJuTzRTem8yS3FSNHpFSWtlb29Sa1dESURjcVBxeXdTZ2tSVmhoR3VNdWRP?=
 =?utf-8?B?a3VHdUZZMk1WalYzMFI1cmFHcnIxN08wdFhCQytQRjNyYkxnN3AvV2dIbk9r?=
 =?utf-8?B?TWdvQXpMdVUyRXlwcFpKUTZnVnBuRzloY1loQ3hDcW93cVJjWjhZclZ4Tkl2?=
 =?utf-8?B?ck96T0NJa2kzaHRMeTM3aUxXeFk3U1Y1My9ZM2xXSWVOQjdUU1BZbkdaNzZ2?=
 =?utf-8?B?OU9uUHRBQkFkRkd6b01xb0xHZ0tCWE50T2VvMVpKRXZoMkc0ZjI5K0R1T25u?=
 =?utf-8?B?S1RVSkp5ZVFuRHdkSVFkaFJMWTJ6Myt3ZlVmQ0ErYTRXTk0vVVZReFJEYmxB?=
 =?utf-8?B?aUYrb2Z1OEVvZWlCdm1XYTMvTTFwWG56UGR2c2dHcG5GaHk3OGRPNTJvWXVr?=
 =?utf-8?B?Qmt5RnQ3SnJ2Sk9ZM1UrMzRZZFpVdTJwTTB6NGlZdU8zOXFtQXp2d3pwR3Zp?=
 =?utf-8?B?L2VlK2JDUEZBSnBTbVA4VDBGVS8wMGtoZGFWZXhDSERpMXRJTTQ2bWx0N0J3?=
 =?utf-8?B?UjR0RW5SdFRUMFM2empOdHNhRC90Z1UrY3NYUzFycDM2NGhGU0RJMGFNZE5U?=
 =?utf-8?B?a1E3UWNWKzZKQ05WQ1BqcWprMXhJSXZEL1l2a0ltVkEvYklSTmlhdUtsdWZ4?=
 =?utf-8?B?bGdsdzBLMWxpRGxXU2FNTittbDhQOHg3K24zTEtFVjVXUE0ySFk4cWthdzA4?=
 =?utf-8?B?OERXMUVQUDMrdkplaFZhNU5sZXBkSWxNR1FJNTRxWGVPTnpiaEpsS3BOMTIr?=
 =?utf-8?B?S3FjTnhwenVYMDlubndYV3Frc0UxeHE2MnZzNm5SbXpHcnZuL0M5dz09?=
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-GxTGcb8b7FiQkj5p4FLb"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9075.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81488c18-d789-4b46-27ad-08da3e41ff4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2022 11:30:40.2920 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CYX+EipYOKP4P0ku2pcB36mCRhFHIVhmj+xT+Uj/le5qV5dx5hR2QuXmK9Tokpgt+pws0HQzQiExnS4tU8FKYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3448
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

--=-GxTGcb8b7FiQkj5p4FLb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2022-05-25 at 09:40 +0000, Dario Faggioli wrote:
> On Wed, 2022-05-25 at 07:41 +0100, Alex Benn=C3=A9e wrote:
>=20
>=20
> > Does it still trigger errors with my latest virtio cleanup series
> > (which
> > adds more tests to qos-test):
> >=20
> > =C2=A0 Subject: [PATCH=C2=A0 v2 00/15] virtio-gpio and various virtio
> > cleanups
> > =C2=A0 Date: Tue, 24 May 2022 16:40:41 +0100
> > =C2=A0 Message-Id: <20220524154056.2896913-1-alex.bennee@linaro.org>
> >=20
> I'll try it. I know it fails on master (at least two days ago's
> master). I'll apply the series and re-test.
>=20
Ok, so, yes: current master + the v2 of "virtio-gpio and various virtio
cleanups", still fails (with GCC12 and LTO, of course), pretty much in
the same way I've described in this thread.

I've also tried current master + above series + revert of
8dcb404bff6d914 , although I'm not sure it even makes sense... :-O

Anyway, it also fails, but differently:

MALLOC_PERTURB_=3D${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))} \       =
                                                                           =
                                                   =20
>   QTEST_QEMU_IMG=3D./qemu-img G_TEST_DBUS_DAEMON=3D../tests/dbus-vmstate-=
daemon.sh \                                                                =
                                                                           =
                =20
>   QTEST_QEMU_STORAGE_DAEMON_BINARY=3D./storage-daemon/qemu-storage-daemon=
 \                                                                         =
                                                                           =
              =20
>   QTEST_QEMU_BINARY=3D./qemu-system-x86_64 ./tests/qtest/qos-test --tap -=
k                                                                          =
                                                                           =
              =20
# random seed: R02S69b7a984047f827959f7adb2e4161fb7                        =
                                                                           =
                                                                           =
            =20
# starting QEMU: exec ./qemu-system-x86_64 -qtest unix:/tmp/qtest-31788.soc=
k -qtest-log /dev/null -chardev socket,path=3D/tmp/qtest-31788.qmp,id=3Dcha=
r0 -mon chardev=3Dchar0,mode=3Dcontrol -display none -machine none -accel q=
test                =20
1..101                                                                     =
                                                                           =
                                                                           =
            =20
# Start of x86_64 tests                                                    =
                                                                           =
                                                                           =
            =20
# Start of pc tests                                                        =
                                                                           =
                                                                           =
            =20
# Start of i440FX-pcihost tests                                            =
                                                                           =
                                                                           =
            =20
# Start of pci-bus-pc tests
# Start of pci-bus tests
# Start of vhost-user-gpio-pci tests
# Start of vhost-user-gpio tests
# Start of vhost-user-gpio-tests tests
# Start of read-guest-mem tests
qemu-system-x86_64: Failed to set msg fds.
qemu-system-x86_64: vhost VQ 0 ring restore failed: -22: Invalid argument (=
22)
qemu-system-x86_64: Failed to set msg fds.
qemu-system-x86_64: vhost VQ 1 ring restore failed: -22: Invalid argument (=
22)
qemu-system-x86_64: Failed to set msg fds.
qemu-system-x86_64: vhost_set_vring_call failed: Invalid argument (22)
qemu-system-x86_64: Failed to set msg fds.
qemu-system-x86_64: vhost_set_vring_call failed: Invalid argument (22)
qemu-system-x86_64: Failed to write msg. Wrote -1 instead of 20.
qemu-system-x86_64: vhost VQ 0 ring restore failed: -5: Input/output error =
(5)                                                                        =
                                                                           =
            =20
../tests/qtest/libqtest.c:165: kill_qemu() detected QEMU death from signal =
11 (Segmentation fault)                                                    =
                                                                           =
            =20
# child process (/x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/vhost-user-gp=
io-pci/vhost-user-gpio/vhost-user-gpio-tests/read-guest-mem/memfile/subproc=
ess [31850]) killed by signal 6 (Aborted)                                  =
            =20
# child process (/x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/vhost-user-gp=
io-pci/vhost-user-gpio/vhost-user-gpio-tests/read-guest-mem/memfile/subproc=
ess [31850]) stdout: ""                                                    =
            =20
# child process (/x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/vhost-user-gp=
io-pci/vhost-user-gpio/vhost-user-gpio-tests/read-guest-mem/memfile/subproc=
ess [31850]) stderr: "qemu-system-x86_64: Failed to set msg fds.\nqemu-syst=
em-x86_64: vh
ost VQ 0 ring restore failed: -22: Invalid argument (22)\nqemu-system-x86_6=
4: Failed to set msg fds.\nqemu-system-x86_64: vhost VQ 1 ring restore fail=
ed: -22: Invalid argument (22)\nqemu-system-x86_64: Failed to set msg fds.\=
nqemu-system-
x86_64: vhost_set_vring_call failed: Invalid argument (22)\nqemu-system-x86=
_64: Failed to set msg fds.\nqemu-system-x86_64: vhost_set_vring_call faile=
d: Invalid argument (22)\nqemu-system-x86_64: Failed to write msg. Wrote -1=
 instead of 2
0.\nqemu-system-x86_64: vhost VQ 0 ring restore failed: -5: Input/output er=
ror (5)\n../tests/qtest/libqtest.c:165: kill_qemu() detected QEMU death fro=
m signal 11 (Segmentation fault)\n"                                        =
            =20
**                                                                         =
                                                                           =
                                                                           =
            =20
ERROR:../tests/qtest/qos-test.c:190:subprocess_run_one_test: child process =
(/x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/vhost-user-gpio-pci/vhost-use=
r-gpio/vhost-user-gpio-tests/read-guest-mem/memfile/subprocess [31850]) fai=
led unexpecte
dly
Bail out! ERROR:../tests/qtest/qos-test.c:190:subprocess_run_one_test: chil=
d process (/x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/vhost-user-gpio-pci=
/vhost-user-gpio/vhost-user-gpio-tests/read-guest-mem/memfile/subprocess [3=
1850]) failed
 unexpectedly
Aborted

With also this in dmesg:

[mer mag 25 13:11:18 2022] show_signal_msg: 46 callbacks suppressed
[mer mag 25 13:11:18 2022] qemu-system-x86[23711]: segfault at 58 ip 000055=
e6a0daa4b3 sp 00007ffc5699b870 error 4 in qemu-system-x86_64[55e6a0bdb000+6=
17000]
[mer mag 25 13:11:18 2022] Code: 83 26 4d 00 48 8d 2d 66 1e 4d 00 53 48 8d =
1d 74 7d 44 00 48 89 da e8 cc a5 26 00 48 89 da 4c 8d 05 c0 78 50 00 b9 d8 =
00 00 00 <48> 8b 78 58 48 8d 35 d0 78 49 00 e8 ad a5 26 00 b9 23 00 00 00 4=
c


Of course, I've also tried current master + above series, with GCC12
and _no_ LTO. And that works.

Any other test I can run? :-)

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-GxTGcb8b7FiQkj5p4FLb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmKOE14ACgkQFkJ4iaW4
c+75XhAA79VYzFWpvt2Q4Zid7b4MlMB81U8ruFgySbGvLUalOHKvd/h2dMRE/1vi
yGorjBP/08HJtSFTs9kWp+1WJvdbEHRh7kjOpF/4APAHx0gR5I99wHMzGlv9jc4z
Mpe2flJmmIpLzctV95oR56GyqW3fudCBL0iyIseVVao6E/Geq/lbLO4bGVuIZ5VV
J0bQiBEtgWxPU4ixpLPSsXFO7IS/y6+pFBE/SFHLqeAPKeFAveoQj6jPLCAEmkYQ
hLiopK/2UUjvmzTIy3J3c5l+v5xTeR0qjEIo7AbA2wztT8iDPWCau8z7IUKTZwSu
Ih7VcAWpmg2RV+hccnIpg5cMUPFl0uw/uyUpIsGhukxGq+TXEvRfsTUCwX47RRvu
hR4ay42O0M/w4JioifqlRS5wzvinVWuMCA66awyW7olFevB2DBFXu/Twk2pKEDic
M11ws1vFMlROK8XjiZSmfMdE1qdPkt3P/m9AeocqvBU0Pcs9YwXGhj9SdypG8M70
ZxtFbZxoM5x+iayOByNh2BcZhORik4j2QxXORs2BZRi3xMZAlN1PGZoKx1XL0U71
FT8hxBYzPAQYS1gNI1VJwragkIQrQptvv3fDMF7dHEQbJW5ro/JTd+FLqjdu5ugi
IAMe0Eb8UbyzwE4heWzycXdTr6mxSr/WOgJ3PH3wQcdvFznpDGg=
=B50H
-----END PGP SIGNATURE-----

--=-GxTGcb8b7FiQkj5p4FLb--


