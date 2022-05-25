Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 774B85339CE
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 11:18:33 +0200 (CEST)
Received: from localhost ([::1]:43894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntnA0-0001Sx-Fx
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 05:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfaggioli@suse.com>)
 id 1ntmsX-00015t-4J
 for qemu-devel@nongnu.org; Wed, 25 May 2022 05:00:31 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:35963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfaggioli@suse.com>)
 id 1ntmsU-00030U-FO
 for qemu-devel@nongnu.org; Wed, 25 May 2022 05:00:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1653469224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YtajlkYHaXzi/kpmSY+V+SPdP66adxBM4yoLWFefbfs=;
 b=VWI0KcOSU4U08yhIcj9VdXN6wdw63MqOr6AASVC8SXiNSredyo+gwp27EnR5+b1SKtEs3z
 zF146GkXSU6m0lwIUpS61Rc6rhp62MHixAoRRbP2RUDAD45nBEtOoaW7UV6i9yMVtQBWjZ
 /d+rrxK1MahIFax9uUPGA8FmEf89u70=
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2169.outbound.protection.outlook.com [104.47.51.169]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-WWg2i8uONU2Oa75_VeQ2KA-1; Wed, 25 May 2022 11:00:22 +0200
X-MC-Unique: WWg2i8uONU2Oa75_VeQ2KA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fUJsmPlm3CPvwWltBNGu4wPL8w3+8CWKZdyZpWybJRKuW9jXm7PTcSHdiGfoFa9F/YCRzp5HYdLoBOhVtZl+Mpo//QMg5j5Q1IUBbz22EDsnlO91YbOoymQL/ZjzPKdObrGwI0hLOKoZNd5T1hGcsG7mx0ZaoqQtEFyMgXik8zKlIQbrGdd94kv5q9otNGy8OEfctTeyvY5GiAUx1nQAz4vykuFARHQMmbZVkpZD89lu60MJOcUoyn+jskaG/Yf3oGqSwteMfsf194CqYuntl/gfBaN81VHS+8b97CP0zJ1NK0KxlLRkKM0BuGVbtKb+I71d6CtKfMis40E6YN3OqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YtajlkYHaXzi/kpmSY+V+SPdP66adxBM4yoLWFefbfs=;
 b=aQC9h2inbhSS12ZVHOVqV/hoQjMtwemCSnusgbxrAcmg/Mrgk37VbnIIJTkteLXR22wBd/4smAV19XGewuzbp7hD2iwgtpTimOhD3ps0t2fJExUdfDbUA4hBWuvgWN8zTQfERDA7pmKfINP97n3aKpYWDSc9pXTQl2LDLwvTxZ7mc47ay7r2mjBrwtKk05T5p6wDaDtmQEFx1nVIT39s7EskFRi1T702ygYBw6hUZuV9YBpBNHUKqDr2f/mRDjoRS8AOAKAmOe7hD8Li8RfkYyd2Uvc6U79fiwfyXUjzFmB9zXmlFc7DMcNNav5eilff2DV+uX5uL5twCJDK71s8Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from PAXPR04MB9075.eurprd04.prod.outlook.com (2603:10a6:102:229::12)
 by DB9PR04MB9628.eurprd04.prod.outlook.com (2603:10a6:10:30b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.22; Wed, 25 May
 2022 09:00:20 +0000
Received: from PAXPR04MB9075.eurprd04.prod.outlook.com
 ([fe80::dcf2:9231:4657:4c23]) by PAXPR04MB9075.eurprd04.prod.outlook.com
 ([fe80::dcf2:9231:4657:4c23%7]) with mapi id 15.20.5186.021; Wed, 25 May 2022
 09:00:20 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: "kraxel@redhat.com" <kraxel@redhat.com>
CC: "pbonzini@redhat.com" <pbonzini@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH v3 0/2] modules: Improve modinfo.c support
Thread-Topic: [PATCH v3 0/2] modules: Improve modinfo.c support
Thread-Index: AQHYcAFLi0Rn1RUL6UCNF0GG4T5qHK0vS7SA
Date: Wed, 25 May 2022 09:00:20 +0000
Message-ID: <102e0a911b2f8c898fd97fbe1df71b61ed8f9273.camel@suse.com>
References: <20210928204628.20001-1-jziviani@suse.de>
 <20210929050908.3fqf3wwbk6vrtziu@sirius.home.kraxel.org>
 <077c28cfd3a7d10df6a08d26bcb721aa2d46bec1.camel@suse.com>
 <20220525063257.zs6cqwgtaj7r52bp@sirius.home.kraxel.org>
In-Reply-To: <20220525063257.zs6cqwgtaj7r52bp@sirius.home.kraxel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.1 (by Flathub.org)) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b5bbb68-16ce-4bf4-fda0-08da3e2cff2d
x-ms-traffictypediagnostic: DB9PR04MB9628:EE_
x-microsoft-antispam-prvs: <DB9PR04MB96289C04A15DB522F74B51D5C5D69@DB9PR04MB9628.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vJAKqCP6ZzenNNgld+vGOud2sTvwUFKH5DqYPiBsZZBUu7VY05RQqhdI2Mdmsu/VNlVS5UpyVr2FtExlwrH2+HuXVLe9eWfX7EGk4kqBQ8uk+P9wN/aYx2CA2XL5jvEOh5d59GspZ0y5PtAptfsZbfABCXQnxMf/XzYVQxV1I7Guv71LFtmpzPhZAtreiDiZd90lQX5NyrJ5RQydcTiyKRivGcu/xwkFEV9SjEymWatEx11GByoL7+wDKCGCN2BJEhJfUqcEi4z9R2KxtRyTM8wzuVSvxsPJK93yHNzgpCUqfWRby/TEWknVkJ9g7/5uwovDwFmp5auBsgdYQJvdAeyonzCWNIYluZD4ifQIwXyDEVBxeW+mkjJT4JBKR7pVDdx/CfNaLd26ymOXVjJUaGdjRz7Ap1bfgtwEf5QDT8+S1UrJh0aLUJ/TyqA/erDH+0MxYQi7oZK10GeevIfyCIsePH1yvwXck3Cl6YOc5hJT07ZPIHm5UGJyHRLx6+i045Ws+TrsX6Nu9bodi0F1c/oJzlhq26GbVzj0EZ3JIbZTOZfAByJ2CAON+gyklkwAedt9fMsEGbKXXRLp7qaEZu0NE1nu6jCBP4bBJZs9+tVIg9mE123W5Hu0dt60upmccacH9UWsKyWpGbtMBv4TjFrDLxrFLcAIZp0wAgDUJhRdOc5zaRhOfCZjBnxryuWnx6i9+QePQq1Eaqhuy97POKa2UGVRlTK3zmtBoNFwP2tzd2R9HDxk01RfLjeOTubuCxojabhb1nOsDNS/re3noeR50GmLMh6K9Em8UsBtIpLgrp1BgPVR5XEL7uqdaJdqgQHJg9D0TQs9m/DrbMkoeg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9075.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(966005)(6486002)(38100700002)(71200400001)(6512007)(8936002)(508600001)(5660300002)(38070700005)(2616005)(86362001)(186003)(122000001)(316002)(6506007)(2906002)(6916009)(64756008)(66476007)(66446008)(66946007)(66556008)(76116006)(26005)(4326008)(8676002)(99936003)(54906003)(91956017)(36756003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ejF0MUlnQ1dNMnloMnRZTnNSMzRXOHExMHdONjNpUFRrOVo5UGp0dGU4NVUy?=
 =?utf-8?B?T09KM3N1RVhXNmZSbGhWSE1MZG1JSDF5NTVEZDRlT0ZQMUpHaXoxNXdpYnJX?=
 =?utf-8?B?UEs0UWtiazlZcTlNNTlWOVNaMWlUcmpzb3g2QXNZU2t4U2xuZU95M3I2WTdw?=
 =?utf-8?B?enpyc2JZb0ljZUl2aTNkdUNVV2MxdEZaR0ZlN1VRRS9CTDkwM2hZTnoxOXh5?=
 =?utf-8?B?emoxZ2w3N21KN1Z0TVA5ZDk1MjlDRjNhNXdWRFM1dndjMng2WlBPL3AvTUNa?=
 =?utf-8?B?bFh1ZmMyM1NZWEllSFYrQzU0UVVqcjFBQkVkbVVHaExWdWtjVExrdjZzRmZj?=
 =?utf-8?B?cUwvWnN2dGdFRzVOZ2FZMHUxY1lKSy8yME5oR210RlJPU1g2QXdxUXFTZHFN?=
 =?utf-8?B?UittLzJWQkRacG1oaDVyNlVQZGl0KzJrd3VjYXk5VFQ4am5QcUIwbGpFcXpD?=
 =?utf-8?B?Y1FOUDJ5d1daVldwNm4zSldTQ2RydTJ5MlJ5UFRpc2U0cUdmdlJsRXFyWS8v?=
 =?utf-8?B?MUdFa2pFaEY5bCtEb0F1S3hQVUNUVUVHSGFoMHczdklWZ0lYTXllZWVnWGxB?=
 =?utf-8?B?akNlY3lZZzhIa04rUmJYQ0lScEhlK1JWelNFSEJWZ28yT0tkcDVROWNpQ3Bj?=
 =?utf-8?B?M05xcGpoSDV1dTRSNTNrMTJXRUQwdTBSbzFpWHZHaDZYWlR6TE5udHhJRUxH?=
 =?utf-8?B?cHBFcnJRRFJiaDQzUmpQb1IzUnlIeWtzQTM4R2c5dytLYm02aVd3TlV0Z2Vy?=
 =?utf-8?B?ZTErRFVETUY0eFhITkpmOHVicStuTk1hMHhQcUZRUU1UdTJ3S2xkTmtWWStC?=
 =?utf-8?B?dVNPTDUrbzZsT0JSTWF2VnVabE1MQXRlbW1nSG81d3JVNXFNYUlYL0l3U0Ni?=
 =?utf-8?B?aSs5V2ZHNkNONm9pOXBDTFF5SDVVMUVoWVR3bXhLTG9EZXcvOTY3OVF3RXZ4?=
 =?utf-8?B?OW44UlB1ajhxRHUwbTNub09qNmg1dzI3bmhsUkwvKzYrd0w1SitIOVN1REFu?=
 =?utf-8?B?TEZoNkd4WmNXN2JES1pIaUpiMFNia3B0cFo4dis1Ty9DOUJQc1N3VkE3UHY0?=
 =?utf-8?B?cFlkMEdSaEpKY3FBU3FaRjlrN3JSRTNqcTh3Y283Z2xndmcyQVRtNElZWXhV?=
 =?utf-8?B?N1o5bWNwTW1EUXZHckFkUDY0ak8vWGJWVzJWaEUwZEpZeld6ODlkNlFkMmEv?=
 =?utf-8?B?Z2k1bnViZjBPYytoNXdldnRKOHA3cmFOT2dYSFUzQitMalI2NDdFWDNDN3Zw?=
 =?utf-8?B?SXBpZjNqdkJJTnpmUE40SVRVNGRqazQ2Z2JJSS9WOTNMcjZrWklmb3dpOGVs?=
 =?utf-8?B?a0JndHRQRkUvMVMyT2lIYllrYVpjMGYvOXZ0T2ppRVRLNytMQkZmcmNFM25w?=
 =?utf-8?B?TndENFRqS1dWdllQaXJvVzVUSnJWOHoxMTRCMDFFeDg0ekZhdFNPb09yMjkx?=
 =?utf-8?B?MXVZVXYyYkg2WFZYYWRiYU9heFo1a1hYTXY5STcvNVBaOG9vTTJYeE5ieXlH?=
 =?utf-8?B?WmN2YmJOQkhGcUFMeGxqcUFiR0VJdnhDSG5LcG5WN3lCNjVVMFVZbWRoNVI4?=
 =?utf-8?B?bXkwOVgxWDVaVDk0QVJudEpJQzhRcWZGZkd2L3dyQjJZYlZjODl6Q3dXZzhz?=
 =?utf-8?B?QTNQM1hDdExpUGNEOGtjTUl5TzR2SG0yUDQzRWJnRnZqTTJORDBrTG5FdmFI?=
 =?utf-8?B?WERkRUJUL0l0TTNKZmdranQxcGhwNjFCMXFweGpMSzd3Um84Snc3UzNqUE9D?=
 =?utf-8?B?dVpPV1doaVM0MW5mMHUzMWN6VkpFY25NTDMxVHpOaEhNYzVQNjJJYUVwaC9o?=
 =?utf-8?B?WGFzMzhtSmFlbC9ERUUrSWdvNVdWelBhRCtWM0d2M3RFbTVFTGZvQllhaXdW?=
 =?utf-8?B?aG5mMFNHSWE3d1BTZ2NubkpXVkl4WGh5OWc1YnNzakZXMWdDeUhXSmIvUmd1?=
 =?utf-8?B?QkJDYytIWDFIQmcwYTd2dE4ycERlUGd5V2JId2RHQitXd05wcjg4RVZXVy8r?=
 =?utf-8?B?MG9wL1lqdzd6VHUvOFJreGNBL01helY2anViV1NhTklGU09UcXBIdUdUZXV5?=
 =?utf-8?B?K2RQdWswcWQyekt3dUFUL1BJVzdGNDR3MnRkOS93bE1uYTJwUi9maG9ZWVFY?=
 =?utf-8?B?YU9lS1YyeSs4N0NIRG5pdmlob3BERDdBMUhLZk4zTHlZcWwzRHlvUkNYeS80?=
 =?utf-8?B?KzR5am9XZzlYUVRmem5rNFhVME5ZWkRpVW1aK1ZWa0ZZOWJhUVdqZHpLaEFH?=
 =?utf-8?B?RXJFcE5NeDhUU2hyL0ZWY0k3SUlhWjFwQzZkdDd2TXVTdnNmTUhsVmJOU2JI?=
 =?utf-8?B?YU0xRlNGdVdKazZ4WWZZanJCajJjd2dLZ2thditLUFcxbEtiWFRRQT09?=
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-3DsVAl+UuPpOj1dh9HV3"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9075.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b5bbb68-16ce-4bf4-fda0-08da3e2cff2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2022 09:00:20.6721 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5nfsRDYWQobu8Bpkbor2nic5v2Ascm3tl7O/WSXcdRhpT0LwQm/+Bx5qcbq+loGkahNN+O5cQ9Fql1Kph/9AzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9628
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

--=-3DsVAl+UuPpOj1dh9HV3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2022-05-25 at 08:32 +0200, Gerd Hoffmann wrote:
> On Tue, May 24, 2022 at 01:49:41PM +0200, Dario Faggioli wrote:
> > Hello! Sorry for bringing up an old thread, but I'd have a question
> > about this series.
> >=20
> > As far as I can see, the patches were fine, and they were Acked,
> > but
> > then the series was never committed... Is this correct?
> >=20
> > If yes, can it be committed (I'm up for rebasing and resending, if
> > it's
> > necessary)? If not, would it be possible to know what's missing, so
> > that we can continue working on it?
>=20
> rebase, run through ci, resend is probably the best way forward.
>
Ok, great, thanks! I'll do all that.

> Don't remember any problems, not sure why it wasn't picked up,
> maybe paolo (who does the meson + buildsystem stuff) was just busy
> so it fell through the cracks,
>=20
Sure, and it's fine... It happens, I know it very well. :-)

I hope it's clear, but just in case, I wasn't complaining or anything.
I just wanted to know what we could do about it now, which is exactly
what you just told me. :-D

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-3DsVAl+UuPpOj1dh9HV3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmKN8CMACgkQFkJ4iaW4
c+78rQ/9ENOwwmx+byL5sXAnrPuqiIM/RcdCmEj9TX6rXNnPb2nl7nX2tJU2UUlS
B2o5g4CDKTVAdMBbNMucTCyWW625v4TkJOGR9DsaBN2+7qztUd6kmRWGkPn6mDWY
3PqPO2ddul/AP92tyfyJ/GdBuFPhssYeqYnfaN+GbkVDDwZuZ6o8fhdL/VjB46Y7
+z9Yt+T7s4TydmLFmg3E4pdpUMsvfehWXhIPjc2VhA3n2dfOfpR76oPUxVeBD06r
e9U5RtFY9AdgK0UEzh7brAJtPzLRo963AFBn6nAxGA57Td2hp+bgOQwbqJf0kqjJ
w+5rrj7Ib2VZIujZE1ORp65UjCFue8hHouKtATW2h8HDdBgwMSYh6/1KI6+g33+A
DiMAlb1e3On6GorWrpu+ZzvqwcFowO2OnO5z/53vbWFkApd4EiGVGSW1NJE9Vcnj
hGjchNocL02eM/BAVgcYPHfH3pdBzyApqmMqeEmVZehPx3W/EQLE+mWU2q2ABa95
AKtAK6CgKsL6WyqrHpcfcc73/EyCQ38b9bKYNuS45jeRJyovZXOLqu+EEZ+3nEdL
a9CR6sSAoArqf5oerCI/IlvhhgFLy1aE760/NvwnjjEjRdJiB8jA2OHl5YIbKwBS
csEPlg56ZZq19Tkn1km2Upf5wv+XNihozl17tKzfEt2cSu1Jkbg=
=8drf
-----END PGP SIGNATURE-----

--=-3DsVAl+UuPpOj1dh9HV3--


