Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E33A1535EB1
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 12:53:56 +0200 (CEST)
Received: from localhost ([::1]:38976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuXbP-00051E-TR
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 06:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfaggioli@suse.com>)
 id 1nuXPJ-0003w7-JH
 for qemu-devel@nongnu.org; Fri, 27 May 2022 06:41:27 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:49420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfaggioli@suse.com>)
 id 1nuXPD-0000a2-Sg
 for qemu-devel@nongnu.org; Fri, 27 May 2022 06:41:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1653648077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZLQibDeWBQaCvITHllPa/RBhY+ImrrsHYGn2ssXoZcE=;
 b=S1yXGu7wHBCZ0+yFqx1DIfEBX5HTXNSdp4BB/CFryN0AiRpVK7ouED7gTyK9+LdzxseNvg
 Op4DoMOjhl2JIdL8EYJDF80f4CqqJcEUEBTZp7sf9E3UQ78X9vbBpX5o31WW9fknAmWIm0
 WbQpUUs1ev2efgZvaqXwYH7HZy6JJkE=
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-08144wsVPtqjzOFb8Ch7-A-1; Fri, 27 May 2022 12:41:16 +0200
X-MC-Unique: 08144wsVPtqjzOFb8Ch7-A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b1u4oEkTKL0Q9dVEbEQMm+0NlEzm/wxmLqsxAFkfdWaRfbCJTTcFlcVUrTLoLwYVbmcGfzKyXbpRb0CUygmDr0Y9kRlm50KZTiy0FoY2Gyin1Usi9+wZ43W5nH9z6OAmUQ5MeDq8mvHJpGIz483zvoDsC5H2XpdSC8Uz/XWlkBTgwn28IK0TSP2/FfTAJwiJHoJT8tgE5Cu+lGx7RXiR2tfgpw/wl3/GerBTPG7ioJ34cwgHa0kRNFh0YNtkNb3REcMn6MBTQWJmTd3sdhOj+GwGMj8BUVYPhCTHSv2J99sXXtpEwkKX+tblIkgCzoNT9mkzMhbiBfVJG0DUynU4wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZLQibDeWBQaCvITHllPa/RBhY+ImrrsHYGn2ssXoZcE=;
 b=KoJqQ5gOvLB/4vDfSeTp68zH+gtHrYrK1bxat8hePIyYdA8zej0sVbORiqYQyGpZfnz0pT1IB07bGWQRs240wjRYnWC9rRXjmSf+XgmLlV2sdSMHZAteDa7huTShVqlvGOc1yQRxkZaDZWUTR1kvqHK8KxvyPHE96vBBLdT8Ro/9vDwrsdzgbJClvEDGqdPsPT1fSdUkauWwMMYc3IsHmCz7UoDJ6sDvRhHs7Btl1XIa/1/DrAxUaB4dcYgc1ZqJiWBH55S9mC4AwbKhP+kx6pYL5LO9/L/g1uyw2+2t/ipA/p6cDSW0vU+PMVApdHRwHA++kpq5E+QDeCo0h3CZZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from DU2PR04MB9067.eurprd04.prod.outlook.com (2603:10a6:10:2f2::10)
 by PR3PR04MB7434.eurprd04.prod.outlook.com (2603:10a6:102:8e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.15; Fri, 27 May
 2022 10:41:15 +0000
Received: from DU2PR04MB9067.eurprd04.prod.outlook.com
 ([fe80::9516:5113:409e:da9a]) by DU2PR04MB9067.eurprd04.prod.outlook.com
 ([fe80::9516:5113:409e:da9a%7]) with mapi id 15.20.5293.013; Fri, 27 May 2022
 10:41:15 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "cfontana@suse.de"
 <cfontana@suse.de>
CC: "alex.bennee@linaro.org" <alex.bennee@linaro.org>, "pbonzini@redhat.com"
 <pbonzini@redhat.com>
Subject: Re: make -j check failing on master, interesting valgrind errors on
 qos-test vhost-user-blk-test/basic
Thread-Topic: make -j check failing on master, interesting valgrind errors on
 qos-test vhost-user-blk-test/basic
Thread-Index: AQHYcStbOS1hYB3z4ES3eiLpaNIJlK0xd5yAgADcMwCAAA56gIAAJ/MA
Date: Fri, 27 May 2022 10:41:15 +0000
Message-ID: <559271048dfe01bf1a77c36321ceb1c5b4f6efe0.camel@suse.com>
References: <6dad6efd-7cb4-d1e0-d5f1-dbe35f69e545@suse.de>
 <0e831d41-d338-ed6a-7530-a13d24675556@suse.de>
 <94ef489c1721bdd741ba71c3fe75b3b66ec400b3.camel@suse.com>
 <70e033c7-3096-d730-ef6f-1e0e0f052855@suse.de>
In-Reply-To: <70e033c7-3096-d730-ef6f-1e0e0f052855@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.1 (by Flathub.org)) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08e70990-ab1b-4e1c-40e4-08da3fcd6cc0
x-ms-traffictypediagnostic: PR3PR04MB7434:EE_
x-microsoft-antispam-prvs: <PR3PR04MB7434A0AD70B3F363B8501BA2C5D89@PR3PR04MB7434.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: caeMJu6t8MKKVBiR0s+TsrUVQ8ORdO8Glh/dxTffzpVWjCvgD67vip0bOud5FZPYdgjbVFamJzJeEMdf/n4hQkomJrPLcp//Pi2pMsOab6X1wMndloFVeDrmUNdpRFQXcrCEgVU//iajQros0PMFFHNvSt9hQA6X0wgCcpG9SiCU8sKm3GrwP4lOmEx/48cUamQw3CWlNdME9eMx/3K0cnrK3UU6ZLQt+1EGmc7JZMFaVZxiZB4vO5o6gN05xH7F5H12ocX5o9lP/UVxf1FxQIc8nhpOt1PNJG5pQId0Xk3LERNl0H5+GQkUj8KisqBKUqiYk3trPDemzZEg9UhPLx1OxPf5yYuCrR/OZmbiE4IWeTnkUwPY7M9QSd0f5/vBA7mpVm03JBV+3JFeK4GYoOd0SEVvJHtjNUOSyM4cr8lQLhAZ7oN/rAJA4fwNn6O+/vsAiUKP6SgJyps2JHfyJEp7JQcF9gLziV/uoOcI4fZffzrm7BeyZUPXe9OQeqpYJ0QxDh7G6MeMxtvNXLBkoaMWTJAT+ZnxC7tXrvakovCDLzrX+heJL5Q+yqN+QN1lJJQk6sWE4OhoW9rI76DkGsuOn1otZydPBz+zACeVkAJbkuRY8NGoSJCY1lbjSwgiJu7OCPnkgWA9h8Yml76Q2m3ElyZk56r0Q2/AeA+qZacK2CZMMVt1J6XoeaZNMnf2A2Ee8Fa9OS0Cpd2TwuBgf8MdK6gjHFVCDPo2GxpZg2NJTZ/v1FYfUr+rzf9v25vfTdwHPjfi7Czb+SnuaZVkE7fKNhQlaUWqQE26NYtWJkcAnlJcgBYYFtVP8dvc81HPO5gNykd/54KTJ1uKIqBU/g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB9067.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(91956017)(66446008)(64756008)(4326008)(8676002)(76116006)(66476007)(66556008)(66946007)(38070700005)(54906003)(122000001)(71200400001)(110136005)(38100700002)(99936003)(316002)(6512007)(36756003)(26005)(2616005)(2906002)(53546011)(6506007)(6486002)(966005)(508600001)(186003)(8936002)(86362001)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGxTTnBVelg5bnFXa3QwOHc0b2xJWWdPRDlrZDJRS0lmcUE3b0V0cFFNYzRn?=
 =?utf-8?B?V0kzdjB0VTBpVk1SZmp2Vy9pZjVyTmZyUTd5WnNRdGNJOG9nckRGR0EwT0di?=
 =?utf-8?B?Z1pZNTBjRFZhQWM1WUlUVlpMYm5GdVppbEptVE1UU1RabXg2UUpFdk5vM0ZF?=
 =?utf-8?B?OVpwcHpIdXVZMGgybnJIUUFJWVo5RUh2NWJhZ2tCejBGS1BjVnhkUXhiU3g4?=
 =?utf-8?B?RVhNMzVvRGVXNVNtV2FiTWorMWxlT2VuaW9zeXZZUlQ4cnpMMENHOUZGb0dN?=
 =?utf-8?B?b3k1RG8vQXZTUDBiTmlrVHV0OVduSXkrMzZ6eGVpRVozb1JMeU5rUnZhTGY4?=
 =?utf-8?B?cmx5c1RERGpZM1FsZW1SYXV2R3dxMVQ2UTJBQUhSU25ORTZjb1pBdUU4TS9S?=
 =?utf-8?B?UTNENVdmODdOVEhRN1FDYmlWRW4rY2lLN1NiR3lkQTY5VXptajV5d0h0OW1s?=
 =?utf-8?B?U042VGVFRlFDRVFVOW15L245dUczcnAyQlVkRTBFYUthbmJmNVJneDZDS3A1?=
 =?utf-8?B?YmZuZnNrbUFzekN4VzFuaVphdEpsamlQSjZLZkVRQXBXbjlDMFBYMnJQa1k4?=
 =?utf-8?B?RFVYUEsxV2x3alduMnMwYjVEb01VMzhlNEtVV0lJSHU0WDQzVmc5NktsWEZq?=
 =?utf-8?B?ejdkS05XVXJlcnJTbjRoTGV6THdQbjRWVjlpMS9JckQ3YzBxdzdkK0RKN3VO?=
 =?utf-8?B?MDZNZCtxN0ZETWRORUlpZGJwcU8raHU5Mks3SFF2aG90c1lpYXZqeG5ISEFT?=
 =?utf-8?B?eFBKc25GQ1NQWktBRGZCbUY3NTB3UGN5VkorNHlkOEhmaFkvdzNDQlVwS1dU?=
 =?utf-8?B?UnFwNlRyRkZqcCtnMWtNVk5vaDdkb282cE5BUHlwTzM1V2grbWpWaW9rT2Vu?=
 =?utf-8?B?Qnp5cU92UnUxd3NyNFNEa2RQVUVMU0NNb1pld3RMcmdPZEJ4c2xrRHBNVlhI?=
 =?utf-8?B?NnFSeWNvSStnM1lJNmNEWldjQXY1OGkxZGx0Y0hZTEJsT2w5eEVQS3Y4MzdH?=
 =?utf-8?B?cGRGYlVmeFpxcjROM05uQ1Vtc3lWOUUwbi91U1hJTTkzd2lWOVp5eEFXSW9J?=
 =?utf-8?B?ODhPbEN3Y3pkWkFPcjFGL1ZpenNXQ3I2eEdPVFlEUHE4eWxCRDdBd21NMVht?=
 =?utf-8?B?TEZkWkIrdzJTdStVZ2NiNnNRU0E3UE5QU1FwU25oRVZrSzM4THh4aS96UFRz?=
 =?utf-8?B?R3NSY2U2ZVlsYWMrUG11ZmhZMWx2aE9oVk1aeFBlWnRvYmtnU2c2OHMzb0E2?=
 =?utf-8?B?RldMWXdROWhJRjNxdnk2dXZFY3ZJM2UrYU9Rc0tMZlo1Y3JkUkpZZ3VWQUdz?=
 =?utf-8?B?aHJBbEt6VnlDRVgwYllwYThYbFM4UnE0ZmlTT2NLdjJqT29GWm9HRk1kUnl4?=
 =?utf-8?B?TkFYcDhKSnF4QmZhb3ZQRzdIZENTRzgvQk1jdVcyNlhZQ1hRaUlyeXJKMW03?=
 =?utf-8?B?NHN6N09aeFhjNGRwV3IyRm42Q3JIRlRueU1ITWpiNldHSkM5OU5qbVd2aGlr?=
 =?utf-8?B?ajVISUdzbjJZSVRQcHZ2OUg4aDVVU001SitNZTZDTDJ4clZJaVhRSk1pMGN5?=
 =?utf-8?B?NzVKYkVKWkQrd3VXdUlUcis0Ni8zck41cG9mTVdNWURQbnByRmVna0JzS1Ix?=
 =?utf-8?B?WGZPczN5cE5mYXZUZjVKbThIUFpEUGRKR2sxVDJ6d0ViNHg2bzJ3S201WFZ1?=
 =?utf-8?B?d2NsZFhBQ203MXpTTG9BdWJzU1NkeklPSUZJVFl3SHdaY1J5RytyZHAzNnVD?=
 =?utf-8?B?UkFQZWRoNXlMM081VmRtVktyektLbU1JbXVUK3pNRUplV2d3Rk0zMlNrZmNp?=
 =?utf-8?B?N01FMmYrcE9hbHpZRkd2a0FVMXBySmF0UDU1NmVDbW1lQlFQcGlTMkVNSENS?=
 =?utf-8?B?TVRlZzBsQ3RVblNma3RoZDUxb3RyamJLQmR2R2hIWHpUQUFYSldCSVlSaEd3?=
 =?utf-8?B?SDg3YSsxRmk0ckFKM2lVOVlXcXl1bmJPVzVDTWJZNktHWlFYNjZ1RnlRbkt4?=
 =?utf-8?B?MWNzL3pNOHEzRzJNMnBGd201K1lrSW5INEFHb3RzVlZFcmQ2OGRrcUY2N0Vs?=
 =?utf-8?B?MzFIYmh4T3lpZDhqNzZmN2xWb0lDdnIrTmpvbnlvSytESEU0L0V5OTNHSi9p?=
 =?utf-8?B?Z1YrWjdXL2c1blNxL3R4WXpuckpFaFFxUG9iZ3ZUL2I5QVh2d2d0UkNQK2U2?=
 =?utf-8?B?azY0Q25FdG5idnRybEZOOUZhN2oralRpVGpxQ1diR2ZsYjdXQjhIMVZOMy93?=
 =?utf-8?B?ZWNhdmdUMmFlZjBkSlJma2Q0K0drQmZ5Mzl4bUJ5eUp0Zkd0aEwzN25UcWV6?=
 =?utf-8?B?KzdaWjJMc1JBRXhObGpWc0xEdldSazJySURZeUNBNlVxUFVHL2ZQdz09?=
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-5kmXg6jbZHuarJdwYgnl"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9067.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08e70990-ab1b-4e1c-40e4-08da3fcd6cc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2022 10:41:15.1106 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xGNOMlI7GRTpCEvtZbHmriYkmib1yS2zdoz+Uv6v6ZfEp/TxfkZlzeQdMPY5HYKr/9o47+bVVGDqjj3lqErptA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7434
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

--=-5kmXg6jbZHuarJdwYgnl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2022-05-27 at 10:18 +0200, Claudio Fontana wrote:
> On 5/27/22 9:26 AM, Dario Faggioli wrote:
> > >=20
> > Yes, this kind of matches what I've also seen and reported about in
> > <5bcb5ceb44dd830770d66330e27de6a4345fcb69.camel@suse.com>. If
> > enable/run just one of:
> > - reconnect
> > - flags_mismatch
> > - connect_fail
> >=20
> > I see no issues.
>=20
> On the countrary, for me just running a single one of those can fail.
>=20
Well, but you said (or at least so I understood) that running the test
for the first time, works.

Then, when you run it multiple times, things start to fail.

That was, in fact, my point... I was making the parallelism between the
fact running only one of those tests works for me and the fact that
running the test for the first time works for you too.

And between the fact that running two tests, one after the other, fails
for me and the fact that running the same tests multiple times fails
for you too.

:-)

> > However, Claudio, AFAIUI, you're seeing this with an older GCC and
> > without LTO, right?
>=20
> Yes, to provide a different angle I tried on veteran OpenSUSE Leap
> 15.2, so gcc is based on 7.5.0.
>=20
> I don't think LTO is being used in any way.
>=20
Yep, agreed. Now I don't think it's related to LTO specifically either.

Although, it's at least a bit of an Heisenbug. I mean, we're seeing it
(with two different setups), but for others, things work fine, I guess?

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-5kmXg6jbZHuarJdwYgnl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmKQqsoACgkQFkJ4iaW4
c+7hkBAAtB6lgBeMK0MQFkqbfh+HBsDqhJvlj6ZxdlnUtJOLP13szB5cK0Kptsx5
CegYOMBgrz9qS/DeGhilSYffFqkVGu+qJX2IaaYImBtSBk1bQrB9xlTIqRxruKtl
eY59PoS0pdddEXKYn8MqhcUZ+3Kt7HQu0lAjGdQIZwOWWsRr0CvwUZ1LPzc+Rh7+
8FXJKWs6tgp6X2uJ5Z6K6JtHW74nfFim5CnVEtAEd7Wo15Am2gSQ6zZoHBWFTpyq
tTV4p08oWDr4zbROrz/yx3CuevWpyEbrxlXOzFc/eN3llUby2dahpXCqDjRPQNc+
z3oOywIAfhdNo+BcOdF/9n/ZZE4SAQnktY3hsKeUU77R6flmTc79vQDeh/OW9jpa
b33TcvOuvty7MHyiWEU7xpDvVlk2KvdYi+uyyYBYM8JRIBa7eULmSL4E999E0zyg
SIP9tdiGMQTK2kt/2HCG76SF8gZbdL6elfjckSkspGbRqcbKmSHNWM8/FI4hAqIb
AS/ydcPz5GbJL/Qab81O6q/SeZdu4iypszHUEp0Fstw5LxGoEKIXUJfk5DIkVWwr
BCCHvuHdAjjsoT43eZlRbE2ZGkO/K1RwbhxPBT2+skAC7ufJw/doMD3t7Cj0P7fq
0XiboH8mpvyUsoE5IH0Tk3ZyauIv1Y6Z7BAR+VRZGRIa6rKN9uA=
=FKEv
-----END PGP SIGNATURE-----

--=-5kmXg6jbZHuarJdwYgnl--


