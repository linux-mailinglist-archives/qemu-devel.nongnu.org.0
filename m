Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F5B533A47
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 11:53:21 +0200 (CEST)
Received: from localhost ([::1]:52668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntnhg-0004Ni-QB
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 05:53:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfaggioli@suse.com>)
 id 1ntnVJ-0002BU-NA
 for qemu-devel@nongnu.org; Wed, 25 May 2022 05:40:33 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:26270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfaggioli@suse.com>)
 id 1ntnVH-0000Tb-FD
 for qemu-devel@nongnu.org; Wed, 25 May 2022 05:40:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1653471629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jovFyzmbXRd4j8xuL1qwCVfC2Ujh4Nc8FZjmiu7flms=;
 b=T8a0sicUeaeU8sQk4OeNI6xdlhacaSmk/GQmIQlYzIOaLifk1p7+N7ojnrwE7oxHHrv7+n
 Sp/+F8nlywEekb0DwKQsIAUc+biqBT3fSU7r86a0buCwU8/gfX4qJt6gX6WGJ+E1ehrMNe
 HaE3GLCPFaRrAEhy5bVO0ccNQXZsB0Q=
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2054.outbound.protection.outlook.com [104.47.1.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-JpsB2qmMPGekoHY7yx6v2A-2; Wed, 25 May 2022 11:40:28 +0200
X-MC-Unique: JpsB2qmMPGekoHY7yx6v2A-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JdT9RfqgHXAjXu0FQERDpj0hNSfCLgk8u3vzfVgZTAGM4IXw1VaBbl1EXvWFEgFkrJFN+P81W76JJMC/SAQqvSyRxcOd1J9tJYzohSlLv9EtokpYW2B+1d3yICw9C1+xBXFg0Z+u1YtBZfHwGOcmFZ6Cz6pETfw1Be/4cLBfNPHlCFbQDclje53RmGY0WCIjWPk0nfeg9n5VdArVtP8nHdF0I+T8iILTaRXVtufw6XFVu4QCqZ6+/c+vR/cwlsRZp2BqK8ouTmD8bbEFLCTrKEZDmOtCTTYePNKYXiu93LnulhT2e8AxeAfUifhEMrGB0DTaxexQ2hEjMywq1lJt9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jovFyzmbXRd4j8xuL1qwCVfC2Ujh4Nc8FZjmiu7flms=;
 b=MtPfgVZzh24FnrCWCr2DjJXtVtwR0RfRYwAXz8IaQI/Rj9C+jhFa9eMpB0ZffLXPvc7N9W/JmvAGZKeCe1EGT7c33d53eLDExMxlb4fif4dZwLPvIDQzivantm2gDjARC9cUK8tZI6ba213YMSxokFjWPeynq9IZmOzCB22sYdWjd/Gt0aCJKmm8+2kk+UB1FlIFPcN9evidOf5slF4wZjtaxfSs4LmbVoJUzQmIWTTeIyrlIZzv8VARURwOLxjCopQ4awTHX1PcbexeMWbxCQqVIJgBwhAOFyAIGhY/NbUSDoempMmL7MQ1tIElN6STbf7esOxIlbD/E9SAEVluUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from PAXPR04MB9075.eurprd04.prod.outlook.com (2603:10a6:102:229::12)
 by AS8PR04MB8914.eurprd04.prod.outlook.com (2603:10a6:20b:42d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 25 May
 2022 09:40:25 +0000
Received: from PAXPR04MB9075.eurprd04.prod.outlook.com
 ([fe80::dcf2:9231:4657:4c23]) by PAXPR04MB9075.eurprd04.prod.outlook.com
 ([fe80::dcf2:9231:4657:4c23%7]) with mapi id 15.20.5186.021; Wed, 25 May 2022
 09:40:25 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: "alex.bennee@linaro.org" <alex.bennee@linaro.org>
CC: Claudio Fontana <Claudio.Fontana@suse.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: Re: Problem running qos-test when building with gcc12 and LTO
Thread-Topic: Problem running qos-test when building with gcc12 and LTO
Thread-Index: AQHYbtn1TEp8uXfDDEibt4Y5btKKta0ud4sAgACvsICAADH6gA==
Date: Wed, 25 May 2022 09:40:25 +0000
Message-ID: <5bcb5ceb44dd830770d66330e27de6a4345fcb69.camel@suse.com>
References: <24c61f36e23339cb1ab80b41e906ea60a0d67d2a.camel@suse.com>
 <87v8tu5cyy.fsf@linaro.org>
In-Reply-To: <87v8tu5cyy.fsf@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.1 (by Flathub.org)) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 437b0be6-058e-4685-0be5-08da3e329855
x-ms-traffictypediagnostic: AS8PR04MB8914:EE_
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-microsoft-antispam-prvs: <AS8PR04MB89146C2973EE5E03C164515EC5D69@AS8PR04MB8914.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YaRgrdqPG8+PzvNazN5yj+MxIpKHLssCnUbUhFEVda7xj7jkUKRS/WafpBz/jlOcmQVOOUUsQEjuqf/uJ6bx9qxgJAXbm9lCxK8FRupZtqp0W/YvZMLleKWN4yllIuUJfC/sG2k1BKc9fCdAS5k8TchKqIZeEf8J2FkXuuVc9LYNsFKuQTi5OAcgZrGNpFJZdogQBM07MFl9uPgRUVkDK+ScuGCoAQ5HXTIDrL2IorHM6bn5mAUE5XJqmnmLYHLM+IUaRLheX9SmuFQ21FwPts1N9ENlJ83ks3sFnkYJnKotuNkr8seL/Ir6qIbmB5OuFupbUNRnAarYM5uXanryZ6N8imKziH3ghH3FjhMnx/auHbzFO9YH3bjahVDFcYd3H+FU1MEZeh9ZyGt1FofsHavKtdm9tYjVwTIrbqoiqfOSA4qFFNBbZmzk2tBYhhoBacq3PiUWRjiMvA1+YyHFUn6lPTktAOk0Gf5Dd/Fhahrp41NXJ7MWzBYEdl7RET2Ff+3uFPbVtxYnnKeIJq6qPs0rngCzHGnatCuSGsmesORKfIJza8FgsHPEPJPOsOWlVAVdV5tyc/ZVMZkeA+0gMZ2KobyTgK33Sa5WznEivygReljkgpMpKFq6xaPahSc5Y8zAIXvI2tXjYeE7FYNdcrUGSBRl58p3xBw1+OKn4DXpM0WfjwwHU5QUi43DiR32iEt3C1vh/aO7W6AJuDYWIYix2Pvoc+GHNC8ERCKWu6Am/B0lyq6ikmtqgPShYa+UKbfYKUI+l8GOXqTBZX/Epv6NdEWYzQ7pb3oE5gPs+u9TrJxYN5lu9593fDZwnBCszB6I5ESn75PLXUew9sVZ0Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9075.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(99936003)(38100700002)(316002)(54906003)(8676002)(6916009)(5660300002)(2906002)(122000001)(86362001)(64756008)(83380400001)(4326008)(66574015)(91956017)(66476007)(76116006)(66946007)(6486002)(6512007)(6506007)(66446008)(26005)(36756003)(186003)(66556008)(2616005)(966005)(508600001)(8936002)(71200400001)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NHpEM3haaHNGVHN5bHBKWWNBQ09HcFJ0aHVpVm1pS01mWVBwTmNOWnNTV2Jv?=
 =?utf-8?B?bWxSNHNIdHkzMkhxNk5tR3JtdzZBSVVFNXdDZndPdVJFZ29YSHUxZjh4SFdj?=
 =?utf-8?B?NitHVUFaS0NId1B1eHltYm1TNlJCY0toeFFvVy9tU25nc2QrWDNyYUJqZ2hj?=
 =?utf-8?B?dkR0ZHpYR1F4WVZvNUFxUFBMaVBGUytDSWkycXV3OE9MM1Z2ZU15TmxmSDNs?=
 =?utf-8?B?cEg4R1FJVjJVSVc4OE1ueG40K0hDb2syZTh1LzE5NU9YazVtVXlBWFBpdW9R?=
 =?utf-8?B?SUxWbEZYK0h4c2JSdjVrdDF0K0lQYkM2aWJ0STlDWSt3aHR2ak9Yc1BEMVo3?=
 =?utf-8?B?dEw0cW5UbDhwK0pQM01HREkwYVpOajc0K0pSb09VaG40OSs5N2x3cklSZ1Jv?=
 =?utf-8?B?dVlzQktoNTRwTDBzc1BSOXYvWU1YUEdIUkgxT0lpdmliSlN6MnlwM2I5RzJl?=
 =?utf-8?B?TzBCZysxR3JxcVhvei9tMUNxOHRSTHRxekplbVVKcHlSNk8vQkdNdnVicWU5?=
 =?utf-8?B?U2pGUFlqV3JRM040eDNqMWZoMFMybFhiUmdWVDNQY2Z4cDlWdktDWTMvNVo1?=
 =?utf-8?B?YmNRQlhtOUgrS3cwYlVZRm9IbGRxUjRMNmUyR3ZkNHM3d3pPWUJxSEdXZkFz?=
 =?utf-8?B?YWtZZEZadVhtVW5rWjdoWm9JODNGTDNHOFhrbUd0bDZjRzlhZzdSNjhLQnFn?=
 =?utf-8?B?L1U1TGZVYmVSTm92M0hHRnF0eGVQbEFnaWIwcjE2NFE2eEZ0Z29CMVNOa3ox?=
 =?utf-8?B?OXNqVjMvUXFBRGxXMUswQTFnOVlqSjJiTHBpR25SaWpORlFIVktHbU83cTBz?=
 =?utf-8?B?cmVBVzBYK0lrYSs0bDhZTTRmdUZZLzNKL3VSTXJQRUJHN1l2WWhiSE5rRXZy?=
 =?utf-8?B?b2tKUXlVWEZPQTdlNlUvSCt2ZFozREx6aUNUZnEzVEk3MUZsOGRMOUpXRDkz?=
 =?utf-8?B?MFFvNHZKUmRZMWhsK1hUWUswUGExU0sxbWdHblVGci9aeEVhcXMzZ0ROYmpB?=
 =?utf-8?B?ckJkK0RVcGc0czk4ckVxaklESlk5bzFHRG4yWmpkT2VmaTJlUm9URklOMHp2?=
 =?utf-8?B?dUtpdDZ4RDBFZ2JFdFNvbUFRN0JvVUpjejBIRzRqQzFxaC8rQ2wvMk9ORzhP?=
 =?utf-8?B?aDVhRVdhUGlhaWR1bGZ6aFVPcms4S0hGS21zSGdNYjY1WEw2UDlhTU40SURn?=
 =?utf-8?B?Q1dTS1FyWXJjU2hENU5YV2VVaWhkcm0xSVlMMm5iZUxCckQxbU5BMHlUYzlE?=
 =?utf-8?B?Z2lkcFhUY2FyODRFUy9XRTZJYU1MYkgrU0pFZ2FqWjFXSk05ZFJQVWVCbHZo?=
 =?utf-8?B?b0dnbThuc0MvL0pkUmx3cFd0YzlnbnhpVk9XZWpIZVFSeDRYbUdRd0piZVNz?=
 =?utf-8?B?SlRRY1M5eU9HVTJVWVdnREMvZWhqS1JNbTVEbi9BSkNOa29OaVRoU25rZ0RG?=
 =?utf-8?B?MEhrSjBiYWxRRmRZTzI0dk4yM1d6Q2EvZ0Q4cDlIb0VkREZpYmxISGJTZHlU?=
 =?utf-8?B?Yk1BcHNHTjczNWliVkppU3pGNGVvSHNYMVFkcEk1YndPWGpkRU84c3pRdm5U?=
 =?utf-8?B?djV2aTYzUzNTaUQ2OGNOTFBpYTRicFhlMkVwV1hxSU5KY3A2TzVBR1dZbFpO?=
 =?utf-8?B?a3NuUS94ck5NZXZTY1YwOUswWmdvRGpOU0NKZjhCVUpTQlkyaXN5REt4RmNN?=
 =?utf-8?B?emtHdFZVOEhmRXROU2JpZFB0cUM5NUsyWWM4Tm9TOGlJKyt0UHJtZjBJblRp?=
 =?utf-8?B?WFkraElYcXpUQ2p5TXlwM1FUbEhybTdNUG5LaUk2djdyYWRLQ1BER2ZmRkJo?=
 =?utf-8?B?bmZoeDFMRUJDazFCemsrT2s2L0lCZ05hajBQd2pkYVlYOVJ2OHc0NzA1MFVq?=
 =?utf-8?B?dGtwOTBXeFVIa2dPTEY5UW9tNWdFTmtEL2tkcmlNYTREUFR3U3hrVCtzWS8z?=
 =?utf-8?B?cHV2V0RJd2JsTHlNbmpoZG5SdXdSTWRiN3pXQm8wS0hFUzRZR1VyTVorYmEy?=
 =?utf-8?B?aWZMLzgrV3VNR0Y5Q3NIUGhsc3BiR3RTeFJuYXJJRHVjRXNHbk9CcDJhaWZL?=
 =?utf-8?B?cUcxYUNGRzhIdDVzeWxNWDVXSWt4dnFvcHlJZWtkUDh3Y0NMR3RVb1l3VTRJ?=
 =?utf-8?B?ZjBDYTRCZG5GN0VNYVUrRjRjRTYwbnVBNkh6NWp5cnBRbjJtdm9WTG9MbU9n?=
 =?utf-8?B?S2tMdTB2ajNFQkJvWFZaQVNjaExVSHY3Z3l5Q04xYldlMDBCZkJCeFlySFNo?=
 =?utf-8?B?WGFjV0NUU0x0RnlOa3BvOXlPMFRnSGl1dEE2ZGNMdHRXZThZdTVGWWJ1RHNm?=
 =?utf-8?B?VkptWTYrVGZsYjFMUmMrOTJaMktYa1ExVzBQZzRBYjRMTnNpN09aUT09?=
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-O+tZh5tHl210WCtOA2dD"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9075.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 437b0be6-058e-4685-0be5-08da3e329855
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2022 09:40:25.1187 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cgd+H7Hq7bdF8c7FnDfGv3l52RZSwdnGyco3We+38x0uT26aip9Cvw1JUVwlsFVtNnUy2z9I/7Ay+3Ews7D6FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8914
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

--=-O+tZh5tHl210WCtOA2dD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2022-05-25 at 07:41 +0100, Alex Benn=C3=A9e wrote:
> Dario Faggioli <dfaggioli@suse.com> writes:
> > I'll try to dig further. Any idea/suggestion anyone has, feel free.
> > :-)
>=20
> Sounds like there are still memory corruption/not initialised issues
> that are affected by moving things around.
>=20
Right. In fact, I've just tried to enable the tests (re)introduced by
8dcb404bff6d9147765d7dd3e9c8493372186420 one by one and:

- with only one of them enabled, whichever one it is, things seems fine
- with vhost_user_test_setup_reconnect and=C2=A0
  vhost_user_test_setup_connect_fail enabled (in this order) things
  fail
- with vhost_user_test_setup_connect_fail and=C2=A0
  vhost_user_test_setup_flags_mismatch enabled (in this order) things=C2=A0
  fail
- with vhost_user_test_setup_reconnect and=C2=A0
  vhost_user_test_setup_flags_mismatch enabled (in this order) things=C2=A0
  fail

Even if I keep vhost_user_test_setup_reconnect and
vhost_user_test_setup_connect_fail enabled, but change the order (i.e.,
I move the qos_add_test for connect-fail before the one for reconnect,
things also fail.

I haven't tried other combinations, so far...

> Does it still trigger errors with my latest virtio cleanup series
> (which
> adds more tests to qos-test):
>=20
> =C2=A0 Subject: [PATCH=C2=A0 v2 00/15] virtio-gpio and various virtio cle=
anups
> =C2=A0 Date: Tue, 24 May 2022 16:40:41 +0100
> =C2=A0 Message-Id: <20220524154056.2896913-1-alex.bennee@linaro.org>
>=20
I'll try it. I know it fails on master (at least two days ago's
master). I'll apply the series and re-test.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-O+tZh5tHl210WCtOA2dD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmKN+YcACgkQFkJ4iaW4
c+7khhAAnX1F3S67YzdULR0NEcrLiNN47+YJR7cB0NMaTF6I4Su12jGEZ+SOloNq
hHLx+TrVvvJK/F1jMkbUdXeeyPcuXh16aB3Q/WhrXjKpKbK5Axjuo2sUGYv+lN5i
sntCK9rW+9XRRH/WgRMLP6i/YyW2kQroIPxhq9cdEEQWSEL9L83q3R4SFsb29fQn
+4d+2Z6577lDkW5O4D5clsR5+fW0CZnJpcAVGFjNblXwRiO3pF67F9Jc1xXsAcy9
j7ZIRHh2eBMTrZ28X8cJPYP2jLuKqfP7fF2+688rQv/56TmNf02wjuYIWIcKSc+1
s6bxAaO8dE6pQEk8y5i9H5X/UnYR7sz6PfUf0NCz1733wLVtK41/IZhG/mVRF8/0
M3SeOBwMOhKzjoPpSaf8FrQksJd2jihjRPlYPvHYOssGaIxoSgfjD9aOhYAF22ZL
KkC8WrmeKtF/sR6cZEmFWiJ+Y1p+sGZ4A/iHn1TJz9fJaeXyDD0BeqLNDhf/CPJ7
R+ENZxdf6iRss5e724ug4yxIwKyMWWPHg13laOCzk6H0Q9p2nfytFY3fzumw6aV+
G6+4V3pUJknYlazwyVz9+PaFGSrsliBKxQHgvgMnqdgZibE5mltUj0o3sj3iru4a
fV51CnaggAYA8M/5yDm1ETAxv2iWRZfhpgugbXJ8DuFDPptXfj0=
=tXmw
-----END PGP SIGNATURE-----

--=-O+tZh5tHl210WCtOA2dD--


