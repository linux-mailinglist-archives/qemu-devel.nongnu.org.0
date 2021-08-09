Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAB73E41A6
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 10:34:09 +0200 (CEST)
Received: from localhost ([::1]:33382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD0jW-0000TF-UG
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 04:34:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mD0iL-0007WX-Dn
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 04:32:53 -0400
Received: from mga09.intel.com ([134.134.136.24]:20672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mD0iI-0007J3-1o
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 04:32:53 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="214636402"
X-IronPort-AV: E=Sophos;i="5.84,305,1620716400"; d="scan'208";a="214636402"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2021 01:32:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,305,1620716400"; d="scan'208";a="459998872"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 09 Aug 2021 01:32:39 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 9 Aug 2021 01:32:39 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 9 Aug 2021 01:32:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Mon, 9 Aug 2021 01:32:39 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Mon, 9 Aug 2021 01:32:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bXtaICp9ceeuVpztWLQaCbIoPd0gu2GcesG8b5UzJAzOgF7GD+MXwJ33v+8IT3Zw6XBzAa63JbkoilW6tqo0ef7TvaLC3HJEauMozUk8fqFwT80A7Aa7y2HxIXFILcYbPLsZQXsICA/NN2fekvfSRv9s9JJLPk1coEoVAFmh0C6l/fY5rl1S0LycBiETpFV4wtzRCV6DW+3SmVyIqWpFO/O51+e4QgUFCBoICOUrl3qFR49dH/vrHxuNehFZe3+NXFr/S2YwG61c/WkVobFDBRSdVGx7XyLSIssKH3QgtJCtL6GykJhxSd+FSbQBZb2ZnssOcwr2fBw5AQMLrPHbRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Frs+zh+TYgRaCOAtHq3jmfnAR1QyWbnfin1DDLmbS9c=;
 b=k6PQ0kHGzVVkXLjbkwwSeaG1Gf4+JO2+kxK26wv/GZs4fHOyfMIQNkcl89mRzSlwhHDTJ/xp1Qsc0ifApOBxsYbMj6/DR2Mj0yNG468xNA8VAUF9MH1Qhk91LE37sR9DdlhODaxlPVOVCpGVERCVHxypqjnoeKB6O3JZqZbFi6Mrza3T3dSQ+9yJQRltNNiGzjos8Cyfe5isu+/MPXvJWBvuxCoChN6mBRRnOgJvuAXHL0mWIkfY9HVq8jcznn2bJhpBQ/2RzYfMZqzEQ/C+4J77DPS0mXzSO0uJ9iPdeK4sLMBtRuSDzcdV5qhEAXZcROzpMwwruvrdvsd9enFU6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Frs+zh+TYgRaCOAtHq3jmfnAR1QyWbnfin1DDLmbS9c=;
 b=W7DQM2pafT2sVdM8N3KM39tb7AGPiF0wpyxq56Z2+Ctut8XzaxoVe/GTVG5oY01KpuqrSIUfAQSFLjayuwHXYmmPS+qNvxw1ZDl4S2snFt2qp9bvJ/g+Aji+tEEJmTnSh1bHOQvPbkeJb4vJa2/LF5/lVNcbHgyHhUCOrmWSzy8=
Received: from BN0PR11MB5757.namprd11.prod.outlook.com (2603:10b6:408:165::23)
 by BN0PR11MB5711.namprd11.prod.outlook.com (2603:10b6:408:14b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Mon, 9 Aug
 2021 08:32:35 +0000
Received: from BN0PR11MB5757.namprd11.prod.outlook.com
 ([fe80::d46a:98d6:d492:4d21]) by BN0PR11MB5757.namprd11.prod.outlook.com
 ([fe80::d46a:98d6:d492:4d21%6]) with mapi id 15.20.4394.023; Mon, 9 Aug 2021
 08:32:35 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: RE: [PULL V3 for 6.2 1/6] qapi/net: Add IPFlowSpec and QMP command
 for filter passthrough
Thread-Topic: [PULL V3 for 6.2 1/6] qapi/net: Add IPFlowSpec and QMP command
 for filter passthrough
Thread-Index: AQHXfH2vTZ1YIVg9tEaVF/PjpB14/6toBsvWgAKR0NA=
Date: Mon, 9 Aug 2021 08:32:35 +0000
Message-ID: <BN0PR11MB5757A48B5D13C24B8E5F1DB29BF69@BN0PR11MB5757.namprd11.prod.outlook.com>
References: <20210719090051.3824672-1-chen.zhang@intel.com>
 <20210719090051.3824672-2-chen.zhang@intel.com>
 <874kc1h4ne.fsf@dusky.pond.sub.org>
In-Reply-To: <874kc1h4ne.fsf@dusky.pond.sub.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6f15825c-4baa-495d-c68b-08d95b103d20
x-ms-traffictypediagnostic: BN0PR11MB5711:
x-microsoft-antispam-prvs: <BN0PR11MB5711FAE7877C62B07B1290DC9BF69@BN0PR11MB5711.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B0JcgOity2RLZtmHjsHYYdP1mQ7lK5s8QbHfh4Z4Usc3sPl8DTM/5XpwXvOhVgTl9Yyd67umcy145+P7h7N/45nycivSFt0ZXxxr/M5piwHfWh3wBYozyauoQTmTj8D0XHanFXusCLN/ccikNLcuJM2Uwgo9SqF/UJFNw2c536LSpeS/cI+JR0tX/RMl5Dv8wNmyMk++RURgNHXeCQEJdTmE/334rY4PTlT/bHIltlYvNHaKgxB/xyBA973y2TRAfHAlkzwcnLyJ5Ku/F9q8LQC4a7R++j6vLdD+Sect63Qac4E+gtgJPWP+EBmU7Kb48nTDBN6JogIdxvJLmUOfFV8HMsMPGelckQuZGQ5UnxswSFW0i57gfQYbGF/0btlkyh29frCS5aFRwUmIzj/Yi7zoOD2qAMN67BL+YkwezFgvdfJvEPjJOCSIvNyItBvlfe5NA4yIm78XYBabqpGCV4duFofhD14HbKGxcEdhq3/SbaCyaAbZ5p32DdxA9/n80Tt3Q9r7OGhB50S0bAw7mL8kVFEjf9tmiU3bT9Z7EWvJr36pJ/Prz3Nci1l5irA7RkWXEDW1WMof2CWLfOqmwY943dCUOlAYBY3WYTZTr6MGdvEYnO6pDPcmBosbXW5rTF553/gbNkZunLy6K0C9HAoSlj8RTW2EDkkmhq2C2kstVR4F2oCe20vWQBVWXE3iIwFCLKfYWHLA+T+XcQQaPw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52536014)(26005)(7696005)(55016002)(6506007)(33656002)(86362001)(71200400001)(76116006)(2906002)(38070700005)(4326008)(53546011)(38100700002)(122000001)(508600001)(8676002)(64756008)(66946007)(54906003)(66476007)(66556008)(316002)(8936002)(66446008)(9686003)(83380400001)(186003)(5660300002)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?lpQpjcby+EQkveWHeuh1xU+tE4eQD9kc8c00rXqaw6Y7i3WEHdr/6ROkVt?=
 =?iso-8859-1?Q?8Rtik4V6k6B79+v0lfd1W6wm+WvI6us2uNUYOD6D1UGOS4cXgk8MBLXe5h?=
 =?iso-8859-1?Q?NZmhfOunwpIkxhV22/oVxvIebpSzHA21PXc+m6+HTczNBGBi8H1V8Ktvsq?=
 =?iso-8859-1?Q?HA2al4snRgOZkiPDwR1kH11TxKU4P1oH/kF2D+NBT/N85Q1BYcAekzYFAT?=
 =?iso-8859-1?Q?ZObsJlKoXjLWIa1uTxt+/0geSsaq9moos7IRLL1NNDtTriACH3kcumW+Gr?=
 =?iso-8859-1?Q?cR2fQSlXhSptD+oXERDFzT3iGYuf80eII+6/hzaS2tz93Pt2bsMgArFjRA?=
 =?iso-8859-1?Q?Gz8ckUEe9Tor9KfehZMUcZGo70LJz84QP2QaZ/z+kefRKwCOcxd0XAdNCt?=
 =?iso-8859-1?Q?Gge3o9jp6ycmk9jPjLE+ag4eyKD+ngR4Mpyxpch1rkPL4uaKOkEHaiGbol?=
 =?iso-8859-1?Q?Sj180Xjrl7MhZ6yft9/vI0Ioq41LRiCFrKB/HzThx93rbCUrVKX9ujE+Pn?=
 =?iso-8859-1?Q?TvfpG2v7J8x++psZtlbMuLTGWv4Dvfa/2PiNdzEDq0mU48598xYFjXu39s?=
 =?iso-8859-1?Q?k0ur+bwofgSFT1/o3A/82SOq3jiXtE1kx9SdESE7EJ8C//KIj2XtA1BHBD?=
 =?iso-8859-1?Q?QZKzfPgS3L3cWun8V+gf5YvSTytHMLzY1XjeixInUvjl1Wi23TKepsaEzu?=
 =?iso-8859-1?Q?APjGftSfbHAaA7sJhLpw1TaTfI2Qkj85LUMXlJcgKWIf2r7jlm8uYAOMI5?=
 =?iso-8859-1?Q?TVulBTbqzb5PTIRMRqB/lSpM/+wJ6j/hJQh4hazDBGX49Zxi6+6broqlsT?=
 =?iso-8859-1?Q?udB6u4vJUMQk/w6FjyVmQDDB4JJg9o4P1uPLfqh1YEIjvEPhSJc+SpnSSl?=
 =?iso-8859-1?Q?fYiRgCuvcJS02E6WuypwzE4MeA7vad7vWHJ3HB8f/0wTKaqUpErVSIWQT5?=
 =?iso-8859-1?Q?B7SCgqVavlig8Hn+RS3Iox/1ohLyo1Kn54DmQO0tK/61RW4z7wgREBZ5A9?=
 =?iso-8859-1?Q?2eGuPy/z9bH88WsT+kk5EZb2HNHFxjntQ7xFpztY4xnGxsDeUbrDT7TGp6?=
 =?iso-8859-1?Q?jQpcdShgQzJlc1Ph4nPKa+O9Icdza7v/xEVSvjZKEI/cHtzmQYuKToU4Uy?=
 =?iso-8859-1?Q?0K78f+oVQZOGOlBu+jw27Bpj9aFuboNKAUkYb6e24LfmyglJDqY9eqoCpw?=
 =?iso-8859-1?Q?Z80x7rmvPfi3OXX7qGoxoaimCizy+rRTSnvzeSBYicOgqxa+zeILiN5iq3?=
 =?iso-8859-1?Q?DiYpZn72hKKg+rs94sHPemGeEhSGZ2OGkepvScL1BQkJxsD/oLREzeITpo?=
 =?iso-8859-1?Q?tbx0HRwN0ztBHDkZWX+OJzjHK9ObFjO7GegduVxZsOdtvXp0ivYBHrJPz4?=
 =?iso-8859-1?Q?5gK9/xrifL?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f15825c-4baa-495d-c68b-08d95b103d20
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2021 08:32:35.1733 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PjlWRfCOSfDV4OsNAD2q/8P7NS+fuJ9THN2sZrn7jG5CCbu97Z0WXkXKWT/erkTCri8vDDb/V6BRNxa7WrTicA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5711
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.24; envelope-from=chen.zhang@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Lukas Straub <lukasstraub2@web.de>,
 =?iso-8859-1?Q?Daniel_P=2EBerrang=E9?= <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Markus Armbruster <armbru@redhat.com>
> Sent: Saturday, August 7, 2021 7:32 PM
> To: Zhang, Chen <chen.zhang@intel.com>
> Cc: Jason Wang <jasowang@redhat.com>; Eric Blake <eblake@redhat.com>;
> Dr. David Alan Gilbert <dgilbert@redhat.com>; qemu-dev <qemu-
> devel@nongnu.org>; Daniel P.Berrang=E9 <berrange@redhat.com>; Gerd
> Hoffmann <kraxel@redhat.com>; Li Zhijian <lizhijian@cn.fujitsu.com>; Luka=
s
> Straub <lukasstraub2@web.de>
> Subject: Re: [PULL V3 for 6.2 1/6] qapi/net: Add IPFlowSpec and QMP
> command for filter passthrough
>=20
> I see Jason queued this while I was failing at keeping up with review.
> I apologize for dropping the ball.
>=20
> There still are a few unresolved issues I raised in prior review.  The
> documentation is not ready, and there is no consensus on the design of
> passthrough-filter-del.
>=20
> If we merge this as is for 6.2, then I want my review to be addressed on =
top.

OK, please hold the ball and let me know if I missed something.
I will try to do this well.

>=20
> Zhang Chen <chen.zhang@intel.com> writes:
>=20
> > Since the real user scenario does not need to monitor all traffic.
> > Add passthrough-filter-add and passthrough-filter-del to maintain a
> > network passthrough list in object with network packet processing
> > function. Add IPFlowSpec struct for all QMP commands.
> > Most the fields of IPFlowSpec are optional,except object-name.
> >
> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > ---
>=20
> [...]
>=20
> > diff --git a/qapi/net.json b/qapi/net.json index
> > 7fab2e7cd8..bfe38faab5 100644
> > --- a/qapi/net.json
> > +++ b/qapi/net.json
> > @@ -7,6 +7,7 @@
> >  ##
> >
> >  { 'include': 'common.json' }
> > +{ 'include': 'sockets.json' }
> >
> >  ##
> >  # @set_link:
> > @@ -696,3 +697,80 @@
> >  ##
> >  { 'event': 'FAILOVER_NEGOTIATED',
> >    'data': {'device-id': 'str'} }
> > +
> > +##
> > +# @IPFlowSpec:
> > +#
> > +# IP flow specification.
> > +#
> > +# @protocol: Transport layer protocol like TCP/UDP, etc. The protocol =
is
> the
> > +#            string instead of enum, because it can be passed to
> getprotobyname(3)
> > +#            and avoid duplication with /etc/protocols.
>=20
> In review of v8, I wrote:
>=20
>     The rationale is good, but it doesn't really belong into the interfac=
e
>     documentation.  Suggest:
>=20
>        # @protocol: Transport layer protocol like TCP/UDP, etc.  This wil=
l be
>        #            passed to getprotobyname(3).
>=20
> to which you replied "OK."  Please apply the change.

Sorry, I missed it.
I thought that more comments would make it clearer and avoid
misunderstandings like Eric Blake comments why not enum in V7.
I will change it as your comments here.

>=20
> > +#
> > +# @object-name: The @object-name means a qemu object with network
> packet
> > +#               processing function, for example colo-compare, filtr-r=
edirector
> > +#               filtr-mirror, etc. VM can running with multi network p=
acket
>=20
> s/qemu/QEMU/
>=20
> s/filtr/filter/ two times here, and more below.
>=20
> s/VM/The VM/
>=20
> s/multi/multiple/
>=20
> Also, limit doc comment line length to 70 characters or so.
>=20

OK, I will fix it.

> > +#               processing function objects. They can control differen=
t network
> > +#               data paths from netdev or chardev. So it needs the obj=
ect-name
> > +#               to set the effective module.
>=20
> Again, this is rationale, which doesn't really belong here.
>=20
> What does belong here, but isn't: meaning of @object-name, i.e. how it is
> resolved to a "qemu object with network packet processing function",
> whatever that is.
>=20
> I'm *guessing* it's the QOM path of a QOM object that provides a certain
> interface.  Correct?
>=20
> If yes, which interface exactly?  Is it a QOM interface?
>=20
> The comment could then look like
>=20
>   # QOM path to a QOM object that implements the MUMBLE interface.
>=20
> with the details corrected / fleshed out.

Yes, the QOM object need to maintain/apply their own passthrough list while=
 working.
I will remove original comments and change it to:

#    QOM path to a QOM object that implements their own passthrough work in
#    the original data processing flow. What is exposed to the outside is a=
n operable
#    passthrough list.


>=20
> > +#
> > +# @source: Source address and port.
> > +#
> > +# @destination: Destination address and port.
> > +#
> > +# Since: 6.1
> > +##
> > +{ 'struct': 'IPFlowSpec',
> > +  'data': { '*protocol': 'str', 'object-name': 'str',
> > +    '*source': 'InetSocketAddressBase',
> > +    '*destination': 'InetSocketAddressBase' } }
> > +
> > +##
> > +# @passthrough-filter-add:
> > +#
> > +# Add passthrough entry IPFlowSpec to a qemu object with network
> > +packet # processing function, for example filtr-mirror, COLO-compare, =
etc.
> > +# The object-name is necessary. The protocol and source/destination
> > +IP and # source/destination ports are optional. if only inputs part
> > +of the
>=20
> Start your sentences with a capital letter, please.
>=20
> More importantly, the paragraph is confusing.  I suggested
>=20
>    # Add an entry to the COLO network passthrough list.
>    # Absent protocol, host addresses and ports match anything.

Current passthrough command is not bind with COLO.
How about this:

  # Add an entry to the QOM object own network passthrough list.
  # Absent protocol, host addresses and ports match anything.

>=20
> > +# information, it will match all traffic.
> > +#
> > +# Returns: Nothing on success
> > +#
> > +# Since: 6.1
> > +#
> > +# Example:
> > +#
> > +# -> { "execute": "passthrough-filter-add",
> > +#      "arguments": { "protocol": "tcp", "object-name": "object0",
> > +#      "source": {"host": "192.168.1.1", "port": "1234"},
> > +#      "destination": {"host": "192.168.1.2", "port": "4321"} } }
> > +# <- { "return": {} }
> > +#
> > +##
> > +{ 'command': 'passthrough-filter-add', 'boxed': true,
> > +     'data': 'IPFlowSpec' }
> > +
> > +##
> > +# @passthrough-filter-del:
> > +#
> > +# Delete passthrough entry IPFlowSpec to a qemu object with network
> > +packet # processing function, for example filtr-mirror, COLO-compare, =
etc.
> > +# The object-name is necessary. The protocol and source/destination
> > +IP and # source/destination ports are optional. if only inputs part
> > +of the
>=20
> Likewise.  I suggested
>=20
>    # Delete an entry from the COLO network passthrough list.
>=20
> as first sentence.  The remainder needs to explain how the arguments are
> used to select the entry to delete.  Something like
>=20
>    # Deletes the entry with exactly this protocol, host addresses and
>    # ports.
>=20
> assuming that's what it actually does.
>=20

You are right.

Change it to:
  # Delete an entry from the QOM object own network
  # passthrough list. Deletes the entry with exactly this=20
  # protocol, host addresses and ports.

> I reiterate my strong dislike for selecting the object to delete with a p=
attern
> match.  The common way to refer to objects is by ID.

The QOM object is very like iptables:
iptables -A INPUT -s 127.0.0.1 -d 127.0.0.1 -j ACCEPT
iptables -D INPUT -s 127.0.0.1 -d 127.0.0.1 -j ACCEPT


>=20
> > +# information, only the exact same rule will be deleted.
> > +#
> > +# Returns: Nothing on success
> > +#
> > +# Since: 6.1

Will change to 6.2 tag.

Finally, thank you very much for your suggestions.
I also want to get your reviewed-by on QAPI, but V9 to Pull V3 I lost your =
voice.
If current reply is OK for you, I will send the V10 for Qemu 6.2.

Thanks
Chen


> > +#
> > +# Example:
> > +#
> > +# -> { "execute": "passthrough-filter-del",
> > +#      "arguments": { "protocol": "tcp", "object-name": "object0",
> > +#      "source": {"host": "192.168.1.1", "port": "1234"},
> > +#      "destination": {"host": "192.168.1.2", "port": "4321"} } }
> > +# <- { "return": {} }
> > +#
> > +##
> > +{ 'command': 'passthrough-filter-del', 'boxed': true,
> > +     'data': 'IPFlowSpec' }


