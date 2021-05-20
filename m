Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFBE389CE4
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 07:05:12 +0200 (CEST)
Received: from localhost ([::1]:57166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljarv-00066r-CV
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 01:05:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsoni@quicinc.com>) id 1ljaqV-0005Ow-9l
 for qemu-devel@nongnu.org; Thu, 20 May 2021 01:03:43 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:58633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsoni@quicinc.com>) id 1ljaqR-00023g-CA
 for qemu-devel@nongnu.org; Thu, 20 May 2021 01:03:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1621487019; x=1622091819;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=g7KHnbL3F7t+vMw+YNBKZNXneFSAhT9iV19BqZ4g8D4=;
 b=pY9IEFp8q5Fv6siWDBr2jjPhcBhged77aPyEKrwt0Mz8VxtvkcgKhuKk
 ximT2qykxnslmqPNGZdE/epJfUA4bjbVollOoNNXQjIT7pW8wxIIjfCmo
 5Jr6G3sbLWy6vG68ImGhHvy5eJTNPN8ConGQQHbc0JBR9IcW/Xc1RbDHR g=;
IronPort-SDR: O2sWKtd+ethKZaXEKs2o88o/BQVdyBzgTj5W5xUoHpVCVvfpw9FIulLU+KUz3TcRoy3cglHarc
 o4roPf+QxGK+JHVl/roJtrRzw4ZWdv7LXUEp+nKrbNE8J1DBBOeBn6Tzy9hzzHMPqbrisXFij4
 t2ZLEEHbbk8M6wp6OuHBfUSGoHhGCCIZFkGoZjKz3TtSVPzu00GmI//tge4QDWTOnOpoTTWq7K
 jE3j1FhADzG/2IX4dta8OUgcfspvdjcHYWODyT3EgJbXyvtMSaqhhY4KdWBx25BQ5VYT/Rtehg
 hkw=
Received: from mail-bn7nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.109])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2021 05:03:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJv77D7GNKqveGSXQ+e2CfHqrlYXIsoOZy7pszpBRYBoVgBq/lHXOeNfhdIVJRnVUBIZYPk0ee5S8f/wM5+oOcrxokTYJEDdcJT66YoDPwF8v4pjwfRvFcgIYwDFK060jsTKCs7q6X76fzpr3zEFVmSqdfy3tytSC7dH/EWhm0/U+C8mtQQ9IdLGUR862WrTO7I0sWhNEkvtVzsgyJ3/BfNN0T2mO0You5QVfAT0VwUPBQgm1hQtQ5trSySk7SFr22b+OSCgSkC4patHd8Q9n6c5YD5vK/bUNJvlr0xfTtRd5lS73r0M8iHZ7ZczeIce2tOKVsf7/Ric62GTwNzdEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7KHnbL3F7t+vMw+YNBKZNXneFSAhT9iV19BqZ4g8D4=;
 b=Dzc9GFzkaatjZnosFk8lyWak5VsxyjsYHOkXu/zZh1v3KF2jByA7OLpBybSGAHFN6zc1GfMGNVCWw5wBvzv0dzS+18PSuYDWg92ReM9raiBi8HlWO9efxcvf4qcB02qkdRXTxrsTz1mvrNbPbYk7lRPmAVW8YJNdgi6ati+wTYuxyYn4ni8yDzjFxCWB8Y3U99b0zaUlhGI9qfT+D6wGL9W/b8FYYCIpbJl3x2xfrP/Z5G+BfGTirRCc47kLXXEB4OgSwi4FDErx4C8qHu+EIbPUfJJ1Ev9Cx3SF6KCn/og6LlOTItJGlQWVoRuzu0R+XZTQJgvMChVNtWKNZB5joA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BY5PR02MB6772.namprd02.prod.outlook.com (2603:10b6:a03:206::11)
 by BYAPR02MB5973.namprd02.prod.outlook.com (2603:10b6:a03:11d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Thu, 20 May
 2021 05:03:31 +0000
Received: from BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::47a:8ab5:560d:f7f2]) by BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::47a:8ab5:560d:f7f2%7]) with mapi id 15.20.4129.032; Thu, 20 May 2021
 05:03:30 +0000
From: Trilok Soni <tsoni@quicinc.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Subject: RE: [RUST] Add crate for generic vhost-user-i2c backend daemon
Thread-Topic: [RUST] Add crate for generic vhost-user-i2c backend daemon
Thread-Index: AQHXPCk3ArzJr3k09kiUN4EG3FfQgKrKKVcQgADrmwCAIMwfgIAADvrQ
Date: Thu, 20 May 2021 05:03:30 +0000
Message-ID: <BY5PR02MB6772DD26168B1E7106AD4265B02A9@BY5PR02MB6772.namprd02.prod.outlook.com>
References: <20210428122247.ymwshfuoojxzsebf@vireshk-i7>
 <BY5PR02MB6772BFF2315EEF33E187D468B0409@BY5PR02MB6772.namprd02.prod.outlook.com>
 <20210429070946.a6tw2gzzs6qyrtz6@vireshk-i7>
 <20210520040039.xiyk26hmub3os3i2@vireshk-i7>
In-Reply-To: <20210520040039.xiyk26hmub3os3i2@vireshk-i7>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [163.116.140.40]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 744b17f6-7404-418b-6116-08d91b4c9c99
x-ms-traffictypediagnostic: BYAPR02MB5973:
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB5973F132836827FC4ECBAF09B02A9@BYAPR02MB5973.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j2twZX3//xd89IRMoTaMuolidpRtiMXuS7XqdPjarbBjaFjPse/tBPTRuPQHoJNHiYZ5KAso/mPD3jMGc0vo3PplJTidL1sMilhoNUK6JdgggM/9UxWZE7taua+4MwU9kImW4Y2/8KgEoD2JNQi1PfDiwUa49l0RUZPWUhr/iUU+ERJ+kNbleX5uiFPTyUkvEwJWE5mF3gkpJIAZjYAHVVUuxLAsedB7WApnYABQqH0+eiG2I+bLxYrcbVv6VSYmA9nP2Fbk+/CBvb3VQbHEbZfc6+/Kunhp+XArDso1drAamS4nTXCom4fzR01X2NUb0oAOgcWmh22kuMUvg70IjMxZudyzO2Hw8/+aS+vLcjfcPVRr8KClRB/hJvtK+nkibU0gFwvIpG8KVLEM236OjhOAsUJdLnBBnVebvahJGmFbtMz34ncs1lpAfN0jMGZAwLVpGfxWTGZhqCnB4bivpOVwJJF5dEDGfyakK6/wcKoDb8gggdKxar+Y5FVARQk44FNMJ1j8No3KlpRy7Mr4h8S0eSy88lgL8IrrabjNfwAhB3+b/lA1Lp13uOT0HjI64D21uz5jRf/ShcjPHxj4UYtb8bfMDAfuoI16nRlPKi8pYUVv31Eo6FXHv4wL13ufiCeDuJ+RnlJxKW257QBNs9KcJ0K3hUIU4wxTQbHUJBPr74RZ8tteHAtL8u5lcx+ravIv37bFpD33MqeLKofzxsvEqXikzChXomLoaSwL2UQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6772.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(66476007)(64756008)(66446008)(5660300002)(7416002)(33656002)(55016002)(66946007)(9686003)(8936002)(316002)(66556008)(71200400001)(6916009)(86362001)(6506007)(53546011)(4326008)(76116006)(2906002)(122000001)(38100700002)(107886003)(966005)(26005)(83380400001)(54906003)(478600001)(52536014)(8676002)(7696005)(186003)(41533002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?zDSTrT6KMhh0H90keDws2xsbRJfHYGgqb4wM3o3ARSgvdWaU7qvYXN5xRv?=
 =?iso-8859-1?Q?AE0mnEyrXzltl1L83S7t+ICmcLNCVeb8p1cuG764cA9jAJFWNfc4L21c07?=
 =?iso-8859-1?Q?vvGhI1P4qjH4zJXO9Q0DODK6IVdbMgwvt01vVS5dVGeC7Ac08VmGZhEyTD?=
 =?iso-8859-1?Q?AgDlibeTXpenjyDDq0oWS5ZI4UHX8C39LhBqKxNec1KwJ5wIvKWXDM3MCI?=
 =?iso-8859-1?Q?dQsb086M5vPtyboj0GTMn+ZXc+FJFYDqPBQgNN7Z5580LsTKYXIJR/mUbS?=
 =?iso-8859-1?Q?yBfovoL/AbdjuL5RGYCRykrvALGnD8ilDW4+roMP9YpDvVLe5kCj3xg1tw?=
 =?iso-8859-1?Q?Km/RH8ojc+SZOYQCSMIj/cV12CqVouz4bi71u8Cxu0gqVDNkPd/VJZMwQZ?=
 =?iso-8859-1?Q?69vr2jSBO9nScqnddx8y79Yi3CVPQ1RuTbMj4OIaX3zkYi11ze5NY/TQu1?=
 =?iso-8859-1?Q?JwSGrXASf1FUto/V3Ml6FEgDVXLAhnWUCx5PktMf4+L/nlMnsZ+WuOxuAA?=
 =?iso-8859-1?Q?dldA7HdBY94IJx3ke+S01MBX4MhIdCuu99lSqPk14ml5na/fYCl17ghB05?=
 =?iso-8859-1?Q?vV8+ZB+CIY3eGVUv3qbnNuMSkbMHDlEoiUjdft9Hr8rhM8vwiL9pOFSHJe?=
 =?iso-8859-1?Q?Yi6zCIJTzQUgbjtSSH5j/Gx4IJPZrNYFnVYl23Z99q4ZOozF47E0WZoUQc?=
 =?iso-8859-1?Q?JT3g+LA0j5rJw/MAT158UpsEBsI0elY86fxIr01Biodp2VNFIn2tDmpfva?=
 =?iso-8859-1?Q?woGRFwK4qka7vb/xbj37vwYeWd/Z5rYIz21m4gDmpy9I9AceT37v57t/za?=
 =?iso-8859-1?Q?XQcn1UTutXdGVdjM1zmA8RykbnolcsFpzAuqc9ohLnGHFPIIF0nUCIWd3D?=
 =?iso-8859-1?Q?jDGbIhg6pCHvbncBdNQ2c1LgKN/89h8FIEhRFhOdFyYsIePviRAojAHz3d?=
 =?iso-8859-1?Q?557jDOAo61TRq0I2xoiYslN22VlH2sLqEkZLCqltKcG2eX6BgPhVyW2N51?=
 =?iso-8859-1?Q?Bsf/WCb9U1mCdw8CmMDD0oc9ohofnb4h2xTUeL4idpPwbaZQ0UAGs1ak6j?=
 =?iso-8859-1?Q?3HytZURQXBAHiFlE83Xc5T/hzrfFGZDWzmVaB3js+2n99f8MBWFxkjq9Uf?=
 =?iso-8859-1?Q?sO1XIXBrJIKqlaO/AivPhpLKO/NoENQhvIyyTBWLCFleBFbXbkSjg81XHg?=
 =?iso-8859-1?Q?Ir0zTycRUs88yEaq6lO4T2Le8Os3GUiQtpX/8O6Xp3caXIhgkHT5cRXebm?=
 =?iso-8859-1?Q?p39x5b1fvMQryL1oK7fz6GqQGr15i2kq0YfqhJe1j7fSusIqpbYZFLGUPB?=
 =?iso-8859-1?Q?lC9ihN8jtHK3rXmM/WSUhA0Hx4AKvNAPx0vOawM+q4uuMn0H2OQdWPGRm2?=
 =?iso-8859-1?Q?TZt9y8iv90?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6772.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 744b17f6-7404-418b-6116-08d91b4c9c99
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2021 05:03:30.6257 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /LL0n89k4MTttOWwh2Pkz/m3ob+3ftKhPkaLHdSiz+q2JeiWWujbLwntvTce2TX7odcZygPbxwuzMQtmo87T+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5973
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsoni@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Jie Deng <jie.deng@intel.com>,
 Bill Mills <bill.mills@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Arnd Bergmann <arnd.bergmann@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 "rust-vmm@lists.opendev.org" <rust-vmm@lists.opendev.org>,
 "Trilok Soni \(QUIC\)" <quic_tsoni@quicinc.com>,
 =?iso-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
 "stratos-dev@op-lists.linaro.org" <stratos-dev@op-lists.linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks Viresh.=20

Top posting since somehow I am not getting rust-vmm group emails on my open=
-source email ID subscription. I have received Vatsa's email on the Hypervi=
sor crate on rust-vmm mailing list but not this one. I am not sure you are =
receiving the rust-vmm bi-weekly meeting invites, i2c crate was discussed t=
his week.=20

https://etherpad.opendev.org/p/rust-vmm-sync-2021 - notes from the meeting =
and I have forwarded series to you.=20

---Trilok Soni

-----Original Message-----
From: Viresh Kumar <viresh.kumar@linaro.org>=20
Sent: Wednesday, May 19, 2021 9:01 PM
To: Trilok Soni <tsoni@quicinc.com>
Cc: stratos-dev@op-lists.linaro.org; rust-vmm@lists.opendev.org; Vincent Gu=
ittot <vincent.guittot@linaro.org>; Mike Holmes <mike.holmes@linaro.org>; B=
ill Mills <bill.mills@linaro.org>; Alex Benn=E9e <alex.bennee@linaro.org>; =
Arnd Bergmann <arnd.bergmann@linaro.com>; Jie Deng <jie.deng@intel.com>; qe=
mu-devel@nongnu.org
Subject: Re: [RUST] Add crate for generic vhost-user-i2c backend daemon

-------------------------------------------------------------------------
CAUTION: This email originated from outside of the organization.
-------------------------------------------------------------------------

On 29-04-21, 12:39, Viresh Kumar wrote:
> On 28-04-21, 17:13, Trilok Soni wrote:
> > Viresh,
> >=20
> > For rust-vmm, you need to create the new issue in the right project.
> > You can probably pick up vmm-reference project at rust-vmm and ask=20
> > for the new crate.
>=20
> Done.
>=20
> https://github.com/rust-vmm/vmm-reference/issues/118

The issue got moved a bit and we have received good response as of now.

https://github.com/rust-vmm/community/issues/106

--
viresh


