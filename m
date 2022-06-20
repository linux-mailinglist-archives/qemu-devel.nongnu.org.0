Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 892045514F6
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 11:56:03 +0200 (CEST)
Received: from localhost ([::1]:45536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3E8Y-00049n-Cu
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 05:56:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o3Dtq-0003PK-RM
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 05:40:50 -0400
Received: from mga18.intel.com ([134.134.136.126]:58341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o3Dto-0001Dz-5m
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 05:40:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655718048; x=1687254048;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2QDJ27HuKfWXw/6QSp/ch3BbPifM83l/YhccHq7Xups=;
 b=bnq6Ylo6giB/FsFz4E8Ohe2XWMb8fVmhE/A2aBDDE4RvUnG2kWwepyo0
 tITDqrN7q6H0qmsr7XkDMjOBLomCwHBYMNUxcduDb8GZB5vvbemDJZOPL
 lEli97be86//C7yzQnb3CBmF3oE+3Qg6TTR2MyEY/HBncJXgqjnLH2Vm3
 Y+u2iOwUGvArKc0lCelClhQHvtlblTcRB2ox++FIN1OxzYfvnIT/Ki10Q
 YTwFUJ/wVWwr5QLDuOd9K5jRMbQyrpt04ZO+nNeowZhAttWb+jEdb243I
 W29TrD/OyMTgT+BxYAk1jyCVx86Vvznkkx0/V+sGjpIDqdK3P1VhhEnSp g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="262887142"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="262887142"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 02:40:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="584534692"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga002.jf.intel.com with ESMTP; 20 Jun 2022 02:40:45 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 20 Jun 2022 02:40:45 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 20 Jun 2022 02:40:44 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 20 Jun 2022 02:40:44 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 20 Jun 2022 02:40:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6PwVYZ5x8RIv5waEwhLSFcXq+Y5y5Ljz6GETUOXQld9VsfbFcrhs0v2a/DP0uLUNX3Do83wXDCs5TPxxFIjCFO/87fZEMv451K6y0JWooOP3ZNmGZ9UrJ1xYdesPyY9DM2Lydxtmzm53pOFaCwU8SQpTfzxL3r+PQG7uQUEJrEsXB3JKJ1AaX6WK7LKtUnvya5IRGZVrbYHZ4dH0uNRHY7fBZVtWhJIdiOEVRsSIZV7SFYpA3TihWmUqHg05MGnyiXFBxfmdh8o5d2yapWbsIYqifKPVnC+MDdS9++gAsVS8U6Go2aGYKjTKnwO4kU7j4zeily2+rOnKzloA3S0ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ILKcYxEdHZ9ReDMZMnTiRYn3UvvW8pYS0RwcfQKNFU=;
 b=MV//QC4YrS8pdanGsQWLz7nqMItk0BwRMB3h9Wgz1/v65pZIdyLl32Wcqtr7EufGnbx1ibEOCcxrv0D9R2A3ZVOP4jG1lnlVFHlPKo1J4DjvOpb3aNaYET0I7mKXkISufsfHKyp2p0hu+UYvAsj6/p8khsEXuFW/j2+fG84P4wCHNPqIwA6G6aSrHT+uVagzhe0n0zlexvmMAioQPwSux/Calf8+5XtHl8lrkAxrvFoSNCfg1m85uAxKxs14uIiSlALDXs2Kc4MizQtkrzvO/Kq/D+PckAt8pQMqGr9bCDCy0HBrIMoa3D868EezQAWkTZ40wuHtLCpybqXK7oJLcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by CH2PR11MB4376.namprd11.prod.outlook.com (2603:10b6:610:40::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Mon, 20 Jun
 2022 09:40:42 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::5908:5bb0:c7c0:85d]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::5908:5bb0:c7c0:85d%7]) with mapi id 15.20.5332.023; Mon, 20 Jun 2022
 09:40:42 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Markus Armbruster <armbru@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>, "Paolo
 Bonzini" <pbonzini@redhat.com>, =?iso-8859-1?Q?Daniel_P=2EBerrang=E9?=
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Eric Blake
 <eblake@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Thomas Huth
 <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Yuri Benditovich
 <yuri.benditovich@daynix.com>, Andrew Melnychenko <andrew@daynix.com>
Subject: RE: [RFC PATCH 08/12] qapi: Add FilterUbpfProperties and qemu-options
Thread-Topic: [RFC PATCH 08/12] qapi: Add FilterUbpfProperties and qemu-options
Thread-Index: AQHYgh8UPfWaWA5XsUmv4WG8uz4/vK1X7zCOgAAd30A=
Date: Mon, 20 Jun 2022 09:40:42 +0000
Message-ID: <MWHPR11MB00319BA13337EF236A7813AE9BB09@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20220617073630.535914-1-chen.zhang@intel.com>
 <20220617073630.535914-9-chen.zhang@intel.com> <871qvj6ant.fsf@pond.sub.org>
In-Reply-To: <871qvj6ant.fsf@pond.sub.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c18cc291-8555-4a35-be88-08da52a0f181
x-ms-traffictypediagnostic: CH2PR11MB4376:EE_
x-microsoft-antispam-prvs: <CH2PR11MB4376CE74C28F9D5F43B91FD79BB09@CH2PR11MB4376.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OBmMaogJiJa7ufG4yO26HgV4PCREkQT7LpsPPk5jc/QshlvTbGCT1pFifWr2HWDiplMdC9GwXr9RNI0Egk4AJjlVb0J6VQYedFxOM469RwRd/Fp/bLS+ZJbxv8iuqukVun+6mJ33j2kywNmJDuhp2DV9UXuyop6DOjbL4GkYNNmiEBI1QXiJ5eTY14Pk8MlN9GmYVysHYpn/FM63Hi2RziBTbBThmlHrtXqjIYRk/EW7Bq0BTOFbsI+6D+7oWdZkolr1e03Ed7xHGB9JWiNvrDR5cvH0zsYbbh/H387Nd+rJVlphFJ06qV80gNr9YlmY7z1hyyWhaaixYcnw8YtBcs2KzHpQrgnZvtDvGZO9jW9hIohGWgrUh4Rob7KifSpr/EXuTcdxdved6MgxF8P7gdApS0vB+qadDWKXSygQv2kvtk8kiED/0jSiZDLZMNJPI0aV79w12H30RV96F0EHcy3FhwqzFwxiyEmQTmchdsXDoCy+o+QjJJpWWyJDyiDvkDKhQMe7Ah4b2lv3mmDqIjgjqH+45qkC0rXbD5Ls5JqYRD5sAydwK0dZPIsFTcbryBYxduhTs5PhJZkRpDgYjlP2NJx0ULnOKVE9ArYWc5rlcSnnxBsFZ/p9JAHlUZJVgmuwQcKTFRfMvMdFH82cLJhb6yWCP4ysFuCaBc40/TyTBjJET4FNJiChbK86bNLzgb6q//vQy0KfpxsQLhBd9w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(26005)(53546011)(7696005)(66446008)(66476007)(64756008)(66946007)(86362001)(6506007)(9686003)(38070700005)(2906002)(82960400001)(316002)(38100700002)(66556008)(76116006)(54906003)(6916009)(4326008)(8676002)(71200400001)(8936002)(498600001)(33656002)(5660300002)(122000001)(7416002)(55016003)(186003)(52536014)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?XmqAP7EpzfdzVumgfdvx8NaT6EFLXZJhHzHt/9HJVsHBFsove/tLAR6gu8?=
 =?iso-8859-1?Q?lDxWk4d08Jy+nnQKY8m4moiHiYuk/4x0KM31Vip+FfoTzVm3hghK6hPAgE?=
 =?iso-8859-1?Q?0lyO+1U0FJM9x3MTF/EKarayHWKLF4LLsqATS12tZynxLVGunukFM9N6QN?=
 =?iso-8859-1?Q?aXIxJA+pco7rRefz7dTFlJnbK2hK8UKUVw5xjODC0/INBnEJLhbI1V/ael?=
 =?iso-8859-1?Q?PNd6eVCZxAcCKuhykqkWM1VE5eQ/K01LRnrSJ6i3jEODrj2FkjkVxZLuNQ?=
 =?iso-8859-1?Q?/xOqrn8k1mK5oTHnA46MXzGE1D7XkjwqCtzYWPK4K1XEhje4HhXySmuTLo?=
 =?iso-8859-1?Q?Xah4vYUn+LNXDL7weE7QThstWOUEJQmmBTDv+4e0ZlbABqMlKPpv7GtGCI?=
 =?iso-8859-1?Q?wNy3XdhLuIGakXeuHjER6sVf3GKtZ/66er2Y3xu+F/fYbyz7PO/Uz2eCKv?=
 =?iso-8859-1?Q?/oXHGG3sr3tc4F1xONEEAIKez6C7Ktd5G0Vmw95q8oHqkFmb1DG5e1zO7x?=
 =?iso-8859-1?Q?fDD5jhpo1E7DynWx5mmxNtGilVEdP/R+hdwX0OuZ153DT7T0pRKSksQG19?=
 =?iso-8859-1?Q?G4G5E+nl8P7+C32NKzMTKj97jEUDgysMtQVVt4meYqzm/Ix4Q5luZEgjv5?=
 =?iso-8859-1?Q?fNHzxVOUo9IyIyseWZxm5dZkugoB9cDTPI1S3rk0Fd+SGEAYmZUNQKE3mf?=
 =?iso-8859-1?Q?o9N7YE6D3SEldJ01X+aLoagaZmmQ3UuoB/flomb/gOvLv/e48ja/wKlOlJ?=
 =?iso-8859-1?Q?sf3TXPXcSfaZd/u1DgZd+JYKY4N521nArhAIBavUGJocXeFDFDYUoXOW0K?=
 =?iso-8859-1?Q?Wic1LDLmPJB+Ga/a5ZZis4rrgfdRT8LORU9Jomi+XbShYTIywNbFZ0PIho?=
 =?iso-8859-1?Q?AkNkIk142k3/HgB6heshX0XCh7pdrXA4uB7WF7Q4Tyz9dRdQbf23XRw6q9?=
 =?iso-8859-1?Q?n9oxfqCOQ0A+hRHZWS0BXXChVrorX0Xln8KmeFMyejjLyXzQlmOa4a55OA?=
 =?iso-8859-1?Q?k41FnWxZJ6x9c76nStXsKQltuEhc6g4Qnf0+Hxr2wZxACHr2HVSfTTNjlF?=
 =?iso-8859-1?Q?U09CK/Nwc1f2xDdSAnmn81XTHD95SZ8N7BtAp7+R6LzElWaLnQXMqd4Une?=
 =?iso-8859-1?Q?7/lGRpd18FX/EvnYqxDvYKMGApCwGeLf0MkL10LZrvlyExB15NmfHA9lDS?=
 =?iso-8859-1?Q?mAQyulgzXELvsUTGkUVduzXylSOfDYihAHYu2BosGdlBlXzaJWjJro0dDw?=
 =?iso-8859-1?Q?bCqSBAaL86EKer0Z/fI2NUhEgqr/8oPHIpEIISBn/7aliZcur8eUyzVvGp?=
 =?iso-8859-1?Q?3n4HHjeailPonDCctohSxNj3j6B+29wjsS7zyE38sZEWqyG134Yy9biN6U?=
 =?iso-8859-1?Q?pcZIv8GVs5K/iE3D381/1GT86zEg8HjUSbdgQMWxY2+6N5hOi1imRCdSts?=
 =?iso-8859-1?Q?HzuJXmS5BQQMnX5+wC4RLi7gHHgSanvLIj8RgCx7wtD1FnreVueMDaLOZU?=
 =?iso-8859-1?Q?qpf2THLBDG8XSj30wEn7yUMPQwN2xoB9Y4PCYlpzeeM7F2DC6PW3TDLapY?=
 =?iso-8859-1?Q?txF8NM1AMZ5bQpYyG0udwu/iO5yJqJtJ9dbXIeKzGEjvj++4aQSTy+8hKq?=
 =?iso-8859-1?Q?cLMkQIx2qD/WnebI0JR1IGIB9jIloR1/QQqStaJqi3UyqvhXC5JrcZc3/z?=
 =?iso-8859-1?Q?CgEjT5dkKThsVOVRHS77jUk0A7Fl+GU4J59MTkx1lvsp2pvVvGIhzQWEPa?=
 =?iso-8859-1?Q?C8GvKHCHOJkP2cyc9w5qPB2hAtHF7aniLJ+/QPRBHYo42XRwpMaHZAzQnZ?=
 =?iso-8859-1?Q?9krKPBDDtg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c18cc291-8555-4a35-be88-08da52a0f181
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2022 09:40:42.5934 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AxAEsVsOImkXBDUTNw6Lb4JXpe0E2XQLPPdBvsLZMzNGkFzwFla1V8CtI3v0WoRr437aryV2mPZC7OEuZGZoPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4376
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=chen.zhang@intel.com; helo=mga18.intel.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



> -----Original Message-----
> From: Markus Armbruster <armbru@redhat.com>
> Sent: Monday, June 20, 2022 3:45 PM
> To: Zhang, Chen <chen.zhang@intel.com>
> Cc: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
> devel@nongnu.org>; Paolo Bonzini <pbonzini@redhat.com>; Daniel
> P.Berrang=E9 <berrange@redhat.com>; Eduardo Habkost
> <eduardo@habkost.net>; Eric Blake <eblake@redhat.com>; Peter Maydell
> <peter.maydell@linaro.org>; Thomas Huth <thuth@redhat.com>; Laurent
> Vivier <lvivier@redhat.com>; Yuri Benditovich
> <yuri.benditovich@daynix.com>; Andrew Melnychenko
> <andrew@daynix.com>
> Subject: Re: [RFC PATCH 08/12] qapi: Add FilterUbpfProperties and qemu-
> options
>=20
> Zhang Chen <chen.zhang@intel.com> writes:
>=20
> > Add filter-ubpf related QOM and qemu-options.
> >
> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > ---
> >  qapi/qom.json   | 18 ++++++++++++++++++
> >  qemu-options.hx |  6 ++++++
> >  2 files changed, 24 insertions(+)
> >
> > diff --git a/qapi/qom.json b/qapi/qom.json index
> > 6a653c6636..820a5218e8 100644
> > --- a/qapi/qom.json
> > +++ b/qapi/qom.json
> > @@ -444,6 +444,22 @@
> >    'base': 'NetfilterProperties',
> >    'data': { '*vnet_hdr_support': 'bool' } }
> >
> > +##
> > +# @FilterUbpfProperties:
> > +#
> > +# Properties for filter-ubpf objects.
> > +#
> > +# @ip-mode: if true, IP packet handle mode is enabled(default: true).
>=20
> Space between "enabled" and "(default: true)", please.
>=20
> I'm not sure about the name @ip-mode.  A mode tends to be an enum.  A
> boolean tends to be a flag, like @disable-packed-handle-mode.  Note that =
I
> reverted the sense there, to make the default false.

Thanks for your review Markus~

Makes sense. Current mode just include ip-mode and raw-mode, it looks
Need change to a enum mode for it, maybe will add other mode in the future.

>=20
> > +#
> > +# @ubpf-handler: The filename where the userspace ebpf packets
> handler.
> > +#
> > +# Since: 7.1
> > +##
> > +{ 'struct': 'FilterUbpfProperties',
> > +  'base': 'NetfilterProperties',
> > +  'data': { '*ip-mode': 'bool',
> > +            '*ubpf-handler': 'str' } }
> > +
> >  ##
> >  # @InputBarrierProperties:
> >  #
> > @@ -845,6 +861,7 @@
> >      'filter-redirector',
> >      'filter-replay',
> >      'filter-rewriter',
> > +    'filter-ubpf',
> >      'input-barrier',
> >      { 'name': 'input-linux',
> >        'if': 'CONFIG_LINUX' },
> > @@ -911,6 +928,7 @@
> >        'filter-redirector':          'FilterRedirectorProperties',
> >        'filter-replay':              'NetfilterProperties',
> >        'filter-rewriter':            'FilterRewriterProperties',
> > +      'filter-ubpf':                'FilterUbpfProperties',
> >        'input-barrier':              'InputBarrierProperties',
> >        'input-linux':                { 'type': 'InputLinuxProperties',
> >                                        'if': 'CONFIG_LINUX' }, diff
> > --git a/qemu-options.hx b/qemu-options.hx index 60cf188da4..3dfb858867
> > 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -5080,6 +5080,12 @@ SRST
> >          stored. The file format is libpcap, so it can be analyzed with
> >          tools such as tcpdump or Wireshark.
> >
> > +    ``-object filter-ubpf,id=3Did,netdev=3Ddev,ubpf-handler=3Dfilename=
[,ip-
> mode][,position=3Dhead|tail|id=3D<id>][,insert=3Dbehind|before]``
> > +        filter-ubpf is the userspace ebpf network traffic handler on n=
etdev
> dev
> > +        from the userspace ebpf handler file specified by filename.
>=20
> I believe the conventional capitalization is eBPF.

Yes, will fix it.

>=20
> > +        If disable ip_mode, the loaded ebpf program will handle raw
>=20
> Markup: ``ip_mode``.

OK.

>=20
> > +        network packet.
>=20
> Suggest something like "If ``ip_mode`` is off, the eBPF program is fed ra=
w
> network packets" (hope I'm not misinterpreting things).

OK. I will address your comments in next version.

Thanks
Chen

>=20
> > +
> >      ``-object colo-
> compare,id=3Did,primary_in=3Dchardevid,secondary_in=3Dchardevid,outdev=3D=
chard
> evid,iothread=3Did[,vnet_hdr_support][,notify_dev=3Did][,compare_timeout=
=3D@
> var{ms}][,expired_scan_cycle=3D@var{ms}][,max_queue_size=3D@var{size}]``
> >          Colo-compare gets packet from primary\_in chardevid and
> >          secondary\_in, then compare whether the payload of primary
> > packet


