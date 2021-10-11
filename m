Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBDC4292AD
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 16:58:19 +0200 (CEST)
Received: from localhost ([::1]:60626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZwkr-0007x0-O3
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 10:58:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thomas.weissschuh.ext@zeiss.com>)
 id 1mZwj9-0005uy-D4; Mon, 11 Oct 2021 10:56:31 -0400
Received: from mail-eopbgr70124.outbound.protection.outlook.com
 ([40.107.7.124]:19222 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thomas.weissschuh.ext@zeiss.com>)
 id 1mZwj4-0007Nl-Mn; Mon, 11 Oct 2021 10:56:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MqgKTVDAzQHnR08g9h66m+3qYSdS1bGx1GuJcNCSTal1Kg/yzMxwRnZBzOCGvmenptYKLaL5Ie0AckWcLuerVnns1MbnlA6LLs+cI3NdztB05BAOujUYYtAmxtVHWtROzJJlUYFCpLUMCJaxgWzlR5T4RajzRgqwX86OxermHV4HG6e+K87E9HFbL/W2no7btcre3LcJvVPpy89rJ5pLHneSEPq75PvhWZnkOMi1eb1jLSyb0CbtRmL4IcTWousRV2qikG6D5XkgoCpDFr+8Jnj+SUkDDbIRI/VsCE0ZhP4HAKCIPVpfpsE2aIJ3TzzjGfreCjSDH4XkIRuYFhFt5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TCN+mu9CVkM3j9gHTAim4pXOvnEt17mS2ZWdEWVJp+Y=;
 b=lcXI6tlo1cBgn7YeZR6bDWbL75SfGeyz3lyyN0z7T6TYjRhC8HVFRthG26O7V10saQuXNAId5V+YrUoR8MBOz57Oh508/gOugzPke3b/fcPTrLWv0aQbAe+yPSGvyqh3NWxye/cmVTsIy3Z9/s0nHyjE5LwaPPIQjnwFCM3MdqYQzLPmjV9flhURvbFJX2s1n7wFmOG1cwEu8qSfvwY4HuTHZvFyWoBUBxZrhwTdbZbjifRQKdpQUJtuH/WxmOqwx95B55uzdPi/CJEZaEgrvBAFv+uw3UuOYkPYBz4dFQuyQXcxRbbV1/VkksYIKq6+PR5ym/sFscd8SF3DPAZ0Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zeiss.com; dmarc=pass action=none header.from=zeiss.com;
 dkim=pass header.d=zeiss.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zeiss.onmicrosoft.com; 
 s=selector2-zeiss-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TCN+mu9CVkM3j9gHTAim4pXOvnEt17mS2ZWdEWVJp+Y=;
 b=BjaXboUB/xUdmvdmY22WLuj6ilzP2Tm/xrf1JSMGA/7Sn8Uk7JQCL0b9uoezW9CD1K5I2Mufj7yRwtgXcQxoKKZCBqiGXtMUTVoR0HM+3O7kHdtTtUWVvJ6Q6A3lqliWp1swFWswnEl3ogsC23T96FhEUtwU3wB/hWwbHK9kn68=
Received: from DB8P190MB0699.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:fd::24) by
 DB8P190MB0779.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:123::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.20; Mon, 11 Oct 2021 14:56:17 +0000
Received: from DB8P190MB0699.EURP190.PROD.OUTLOOK.COM
 ([fe80::c855:bcdb:7de:5d2a]) by DB8P190MB0699.EURP190.PROD.OUTLOOK.COM
 ([fe80::c855:bcdb:7de:5d2a%3]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 14:56:17 +0000
From: "Weissschuh, Thomas [ext]" <thomas.weissschuh.ext@zeiss.com>
To: Hanna Reitz <hreitz@redhat.com>, Fam Zheng <fam@euphon.net>, Kevin Wolf
 <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Subject: RE: [PATCH v2] vmdk: allow specification of tools version
Thread-Topic: [PATCH v2] vmdk: allow specification of tools version
Thread-Index: AQHXqJ/lSDUviTYuAU+pA88LkPt7hKvOAcaAgAAMv3A=
Date: Mon, 11 Oct 2021 14:56:17 +0000
Message-ID: <DB8P190MB0699AC9C0696CD32EA1625F0B8B59@DB8P190MB0699.EURP190.PROD.OUTLOOK.COM>
References: <20210913130419.13241-1-thomas.weissschuh.ext@zeiss.com>
 <e34673dc-ef79-a039-6165-85b5f149d10f@redhat.com>
In-Reply-To: <e34673dc-ef79-a039-6165-85b5f149d10f@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=zeiss.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ae20b9e-bb31-48e5-6cd5-08d98cc747bf
x-ms-traffictypediagnostic: DB8P190MB0779:
x-microsoft-antispam-prvs: <DB8P190MB07794E83EE946280B7093644B8B59@DB8P190MB0779.EURP190.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: owWlraWBgc6hcPeDq02CBnLki3u2Faf2kmaypuA8QWyEuqiWUFmU0AJ337R/U09JFTXB4K15aJRkldEBWfGgmOI0nrasCJZmT0LXp9BsxhD6uARcldILzz/+wANEPTMhT0202q+XSi4WXthCblXwSK3Hndlo7Bk++8tHdOhsUshagTIBW+BuhkUvCveNbYyq3tejE41fq+KaIcVV1Cx7jjndcv73aQcQmSm1cCphEHaARw2T8dP6KeOZxUTnirA/w8YaNC8tdjm09z6Rltb7dErRxfoTFbP7PmlWncJVgxfIGjs24LEkRr//dgQjyQd1JUPXRXo671pUU9XM903nKAouYS6yF8t1WUiTPYDsHWwpoQdYY7JFTpyHH6mZV1HULg13jm0On8zDc4lhLTGesLsFwGkjfijHIlPI+IHwEeUXOVj/p6ehzhWWPj3A4nyhJ7Cw90RiF0uR1KMFNPMXS81YJGSpFPpVlcps/2E4a8OEeeGr66j3tSJtzc1KFJIUBLZonCgphNfAxKatQXy9Tlf42rr1K/I/S/kAqlSgvB+ACE6cI2+dYHWJ9MOWWBQxMNCYpiiubQhIgAFTSN46Vm9+OmVd5d+iOftF7wVttSL5whXxy+N6W50NFSJJFjz0aV/Qi3Ve5wfzni3q0/xqhGVmPv9UiloobbyvZu3lFROPAu2WZ29tYZ+JFIZjpNt5PjOIEdZ2srHYQLMH0jGDnV8VbP8a95W50zRd2Cwh/5c5cHmK4mqCDx994Mn7xeLLLTn+/YHdif3rzXCYIBJC7oiamPMAtRrltcJyghq/Q7s=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8P190MB0699.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(66446008)(66556008)(64756008)(26005)(66476007)(83380400001)(9686003)(76116006)(66574015)(186003)(52536014)(33656002)(7696005)(71200400001)(55016002)(66946007)(53546011)(6506007)(8676002)(45080400002)(38100700002)(122000001)(110136005)(54906003)(316002)(38070700005)(4326008)(5660300002)(2906002)(508600001)(966005)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?V1bNBmfY4LQPlUV8w4KRWmA4Gs9wyanXwq4rO0Wr7M+rMlK5oqQVMuQcvL?=
 =?iso-8859-1?Q?6KyQsqfgIm4hfBSyuhS7mf8owFLB3iW1UqE6G2xnIOWkYjE733dqTmVLHD?=
 =?iso-8859-1?Q?WCXUB0WZENTTUuSxg+56mBXbOMRZ5iRlwShM9fXYueCw30O3bzXI1PBktQ?=
 =?iso-8859-1?Q?GbVKV2NBlg4nqsaQ9KahrK69HWrMWIvV/XXcO/R2o8/9G8gwy8HXGYfzto?=
 =?iso-8859-1?Q?3NaV0fOSx1A0tmkKVu9xIgnHBKyGly7yIMtLs+mWWpV0/d9mEC+TX84SnU?=
 =?iso-8859-1?Q?fpa8+SPwI+tJdyhL0LDL7WFkZEGwaYdtS+vJn7o89XJaVskuwgUZWr4SIJ?=
 =?iso-8859-1?Q?ovPqZveVAKJHDp7ArTidNab38dID+jd+yxlpZ1Pi5agBAZbKVasOvF7h0T?=
 =?iso-8859-1?Q?ztRvmRL6hlClQq5KfvyFsvlRx3zrCVwo7Ymngb+d8azHt0cQ58i82O8clB?=
 =?iso-8859-1?Q?Ju8GAJLz7Tfk/PG4TEVNRn07QOyERuWw/Md/KNc6M8Z7O7mMK6VAOwgwvg?=
 =?iso-8859-1?Q?v+7oVQfHFbfsJCfwFonMX+8RlbBKS7YTJeBQwZHyd6fPyWWCVyLpQ1HNYn?=
 =?iso-8859-1?Q?xR2MxqZOgZM1Ky3AVbfeACkjUw3IQSFPLJz0359lwKrhs6OYi1IH+/+Zfa?=
 =?iso-8859-1?Q?unAfN5ZU/jOVZCtdxTu02sCfDXA8xWiZ7FSUrqd+BAWfesKoePlJf++pa0?=
 =?iso-8859-1?Q?RgO8nIgxatKEloa5yDj8b7BVbDSO1i+xlDzOI/VyG7ugNYx1EUbh/8pYk8?=
 =?iso-8859-1?Q?bW3tb7WE6Ix2HDGJ7PRAJmEQgkNkFoIZRA2XsGy/8KW8ACe4gFUfFg24fj?=
 =?iso-8859-1?Q?iSel5KPzGEFJDx3SIhtgbbnyUpbZPUW2XGEy1JjaXCKh1NmKw0srA2bGfQ?=
 =?iso-8859-1?Q?Y9TbTlvorfFckd9YpKc2Rx+4dbDYXs6r/gza6zBZdoe5UJzUfEOHm6Hs86?=
 =?iso-8859-1?Q?6NaXkukeK1p5p6x4AQnaiFwkCeNoncIzq9bAKMsWHvqQkYfKx55XJv+x4N?=
 =?iso-8859-1?Q?idsajB3Gr4rVjsj6OasZkPzUepObwI8SKfAU51E7N/6cG7rXMd0AWfKYNQ?=
 =?iso-8859-1?Q?6k2+FzJe9dWucKP9BbZoH0r+38gtd5YHIcEjLApPeLaOoMRCwGcEO2i6+P?=
 =?iso-8859-1?Q?OLBt+RW+hWTZ1N8RnugdPmeUwO/IEKSpICxiMJSQdtcYgy+qXuXL2lpr3k?=
 =?iso-8859-1?Q?0fdw8M5B+kO1mwWDqgy9p2HB0v5aQ7PC6pquamrinjwJ5WlxVJ9oGd8qG1?=
 =?iso-8859-1?Q?QvGUnd2J9csEfgNH+DQKF7mBFfLck9YXcf2BBYIoYe/DbQrNArH3wgKYUv?=
 =?iso-8859-1?Q?qqfmEVe4b3JN8ZIYlpq3fRfLQ2/POel1W6PxW9F9B7/dQ0w2HN6kykltzi?=
 =?iso-8859-1?Q?kCxn4feUNs?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: zeiss.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8P190MB0699.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ae20b9e-bb31-48e5-6cd5-08d98cc747bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2021 14:56:17.8608 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 28042244-bb51-4cd6-8034-7776fa3703e8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2XAHn24mtYZ+8aV3zKDaqHrGUxUuvq0ZkbcXccQUR+g1ZQ1slzuVLJSRp1tgssk8GTXDdWZdwSsMP8ZQE1k5z5bDgyK8CVDfDMGg52ForBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P190MB0779
Received-SPF: pass client-ip=40.107.7.124;
 envelope-from=thomas.weissschuh.ext@zeiss.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "thomas@t-8ch.de" <thomas@t-8ch.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Hanna,

> -----Original Message-----
> From: Hanna Reitz <hreitz@redhat.com>
> Sent: Monday, October 11, 2021 4:09 PM
> Subject: Re: [PATCH v2] vmdk: allow specification of tools version
>=20
> On 13.09.21 15:04, Thomas Wei=DFschuh wrote:
> > VMDK files support an attribute that represents the version of the
> > guest tools that are installed on the disk.
> > This attribute is used by vSphere before a machine has been started to
> > determine if the VM has the guest tools installed.
> > This is important when configuring "Operating system customizations"
> > in vSphere, as it checks for the presence of the guest tools before
> > allowing those customizations.
> > Thus when the VM has not yet booted normally it would be impossible to
> > customize it, therefore preventing a customized first-boot.
> >
> > The attribute should not hurt on disks that do not have the guest
> > tools installed and indeed the VMware tools also unconditionally add
> > this attribute.
> > (Defaulting to the value "2147483647", as is done in this patch)
> >
> > Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh.ext@zeiss.com>
> > ---
> >
> > v1:
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flor=
e
> > .kernel.org%2Fqemu-devel%2F20210908174250.12946-1-thomas.weissschuh.ex
> > t%40zeiss.com%2F&amp;data=3D04%7C01%7C%7C6f16aae6ba9b49d75a0b08d98cc0c1=
c
> > a%7C28042244bb514cd680347776fa3703e8%7C1%7C0%7C637695581774186236%7CUn
> > known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW
> > wiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DwyrXC3HNxa5QFY8MW4PuzqZNpMh6NnzicD9=
k
> > 4Pw0j7o%3D&amp;reserved=3D0
> >
> > v1 -> v2:
> > * Expand QAPI docs (Eric Blake)
> >
> >   block/vmdk.c         | 24 ++++++++++++++++++++----
> >   qapi/block-core.json |  3 +++
> >   2 files changed, 23 insertions(+), 4 deletions(-)
>=20
> [...]
>=20
> > diff --git a/qapi/block-core.json b/qapi/block-core.json index
> > c8ce1d9d5d..42431f52d0 100644
> > --- a/qapi/block-core.json
> > +++ b/qapi/block-core.json
> > @@ -4597,6 +4597,8 @@
> >   # @adapter-type: The adapter type used to fill in the descriptor.
> Default: ide.
> >   # @hwversion: Hardware version. The meaningful options are "4" or "6"=
.
> >   #             Default: "4".
> > +# @toolsversion: VMware guest tools version.
> > +                 Default: "2147483647" (Since 6.2)
>=20
> There's a # missing at the start of the line, and so this doesn't compile=
.
>=20
> I've added it (hope that's OK for you) and taken this patch to my block
> branch:

Absolutely, thanks for noticing and fixing.

> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitla=
b.c
> om%2Fhreitz%2Fqemu%2F-
> %2Fcommits%2Fblock%2F&amp;data=3D04%7C01%7C%7C6f16aae6ba9b49d75a0b08d98cc=
0c1
> ca%7C28042244bb514cd680347776fa3703e8%7C1%7C0%7C637695581774186236%7CUnkn=
o
> wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
V
> CI6Mn0%3D%7C1000&amp;sdata=3DBsLGfL%2BpnI1NE4M%2FnBN6UCWUQkb19HOPjgKTveMa=
A1k
> %3D&amp;reserved=3D0

Thomas

