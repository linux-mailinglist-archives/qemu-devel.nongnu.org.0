Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD94E42D1BC
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 06:54:09 +0200 (CEST)
Received: from localhost ([::1]:40646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maskq-000090-87
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 00:54:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1masjg-0007iQ-TL; Thu, 14 Oct 2021 00:52:56 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:53030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1masje-0007hV-H5; Thu, 14 Oct 2021 00:52:56 -0400
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19DNxP81026527; 
 Wed, 13 Oct 2021 21:52:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=rswSYre679I2nOWdXWcHI/TFHVd2bJmCUnz4B84rriM=;
 b=K54gE+yIY4JIyaNvv62VJdHilhowouAoViQxmCRD0aoBn5/CCAbK6nXgdQs1bD5rg/Ep
 nkj8XHUHTPhLQRo8fLFQUhX514ppq77d5NygmOEYhFJchINVSMMfHmMctrBrCEFpDhRg
 2xGmCMVtf+nkVUQNk86aKr+hI/qWNRGl4yXdxNmC2Yam6k+vEEwjvmCK/7a1/ceEzOwx
 iqysRkeCNze5HC0jnxXqt4HMIAJBBxj1CCfigMQxLgJX3DVCtbo7r6NPycPEp7EbN6NH
 Rf2EKs0AdHQ9z4adJNKQaKEcPvS3okBDL3XJo/KijNfDMxlRPeXahS+9jqJzfOaLlkGA Pw== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
 by mx0b-002c1b01.pphosted.com with ESMTP id 3bp6cyrqbt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Oct 2021 21:52:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VncUGAiL85/oAy+CaVf0wJilLgPLD2FDi6dPb4ktP80gqRUtOd7qw3lRQ8sWveuamy3iR8irOCArt7YNRYF/5aTKVp6aiRH2epQEFQl8edWWgizxo1QzB6jTfnfKXdFWszzibCdUGytu9ebm7clpRwPzDx8BalDgvlEOV3WcGLY9zBLkKjU4lX6eowKY3dHhdXIvgsD9uqHWLMxuv7af7FuACPpWtPwUmgVRfmNpI6ICtbE7KTDUMYBeQkWK2cbwdOJ1zXSvHpG/6FsoRhWqS4XZ36dkwaL/f1H9h9O6UP4gbGrOGVXeZgCkv667t2Jw8r1uXVnrZckYGpzO//DaHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rswSYre679I2nOWdXWcHI/TFHVd2bJmCUnz4B84rriM=;
 b=ZdgdIV66I2Sh37s5OdNDRshY3iY72071zYk3ZpcS1nnTNn1CX4maK69WOqTM43Qii9o+6q53NGyKvwNEkD71k2hrbaTt7e70HC3gtCynKLFeN2GreDYQvXm5y80uFTARmnPnbKZi8k6PzvTmR467fU0Y5v9tWav8AOUF87aF5qIWLwIQ75/juHes2A8tt4m8iE1L1wTE2YtQt7auDaJAahK3n3kbDsRPVA/P8hQ/5Xy9IzXHXj+fED8BAQnzEoh3O2KG9g8VhSuF/i5h5MQ8wU+1d1jzECR9KfYwaQP+YJKOcy8ke8uCJCEWjXxBCg4gMb1aTLvJduRKEEppW2tiBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BL0PR02MB4305.namprd02.prod.outlook.com (2603:10b6:208:4e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Thu, 14 Oct
 2021 04:52:49 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::804:50eb:bd2:eb3c]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::804:50eb:bd2:eb3c%7]) with mapi id 15.20.4608.016; Thu, 14 Oct 2021
 04:52:49 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v1] libvhost-user: fix VHOST_USER_REM_MEM_REG skipping
 mmap_addr
Thread-Topic: [PATCH v1] libvhost-user: fix VHOST_USER_REM_MEM_REG skipping
 mmap_addr
Thread-Index: AQHXvtwaeFZLuGJV1Eq0Q9rMxfifyavQrxMAgAFB1YA=
Date: Thu, 14 Oct 2021 04:52:48 +0000
Message-ID: <20211014045239.GA21284@raphael-debian-dev>
References: <20211011201047.62587-1-david@redhat.com>
 <YWapnsmfDMPj80Sd@stefanha-x1.localdomain>
In-Reply-To: <YWapnsmfDMPj80Sd@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 18a3545d-d988-4f7a-a262-08d98ece78e1
x-ms-traffictypediagnostic: BL0PR02MB4305:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR02MB430528C7E24C19096C17592AEAB89@BL0PR02MB4305.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IWyktYcnJU8LA/4JfcJrMCvjsAy45EH1blCKgbt0CrJlRUpQBlmCkS0H+TUxm/L0OOgstUbUkybbIjWNNeruRwNrCB80UST6ZMiiJif3Jcg0oJoflKeOn3BA4kIwJXK72y2x5HNXCEgTfP11kozYytaqvNxpaY0DxDnzn1gGx8yRoIY+bAdu7BEjWyAhM9Y5VzWubk9yVIK4lxd1bJdoRfZ4OjsD2VFKqp/QxP+DWS/y2mT0TpbV5+hZtiY2Ose2Uvz/QDmh93xleVF3DmifgO+mpjAIjUrhqZg18wkZp+eRLMDQnbYgraBZb/Tgs0zsQJJ5VJh3pObMDes0j2ev3DFYWdAhXlaImfwy+ylSZaVdHLfqIKLfGexBvzzqAedsekHVtDS8mzOhaPco2rC8XwWEOb9G6/GMWQ4qwyVj9yl5myrFwEGNG9RDt3vjTTek3WV1f0SoFWKlK/Z9+QrfpLqCToJWh1ZJtyzeZOVZYOqDGFJDirRrFYncrdUABXXXxIMeN6W4v4xJecxVR9zre1YW1sQI1vJfMITXRundQwHbugVWOYckdUj3fxGutIaZAQUQX+60BGZC6FZjPGuxOYJLfOHYh650SxPZVDwY1VV4FVUhgeN/QYkFJMcxYM1iAQ2OiDNOy1ReT9rr63d0Yigxrz0qASEX13wSzblOoTRr1QkDaxc/UBlblO1FRTeqPuGn1DGBxDxhIL1PSKoESA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(8676002)(186003)(54906003)(66476007)(76116006)(26005)(6512007)(316002)(66946007)(5660300002)(9686003)(91956017)(38070700005)(6506007)(44832011)(33716001)(6486002)(38100700002)(66446008)(122000001)(33656002)(8936002)(64756008)(66556008)(86362001)(1076003)(83380400001)(6916009)(508600001)(71200400001)(4326008)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?SLSaQpN6alHij0Hm+eTSZrAIROJhNMldS+DPXQjmS9dVG2jV5Tf8aNFwi7?=
 =?iso-8859-1?Q?R43rgDTLUp+tZRHH1C01kLagFNiWuAyTzrrw7gcNkos2jo+kMBUpOdtwyy?=
 =?iso-8859-1?Q?ES7kkHdhdyHX264wpn6jlnLvy61+bTxy2zmi9G9e85VLoCOhUs1oAXZL8j?=
 =?iso-8859-1?Q?ix3IYtg8NllWZs8YGxUqLNlj+q9IUb4ETN0UjYgu9Z64A0wVoV0/7zweFD?=
 =?iso-8859-1?Q?Gxy59wKLJG79J7bDg6/m0ORvAOItdTaHNoTpWmAYogKTYqXlr6WFbjERfU?=
 =?iso-8859-1?Q?R46MDK7mDsBdogxbytftdS21pWvyMeFKWC7jgQM/MUzSoUh99ap7u3SyzV?=
 =?iso-8859-1?Q?Pv+94Vg/B5Lk0zH1hXzER4VhFETK3nr4k43dYYFMmpywBOEZe1jloZCYwF?=
 =?iso-8859-1?Q?JTlJe1faKKcE+farOr2Oxf8HB/hcB81T4dYkILKE6xe50PjjGcmRsNuJA5?=
 =?iso-8859-1?Q?KZZOsyqyM06rIcAt0K3hIs0YC8I2AaHyC7w2MQPyKvTX2lU/fJdjWJrKDB?=
 =?iso-8859-1?Q?vY983MoJDVapFKRpK4XogRubiAsC+bN96scQz16X2f19MWXEkHvhKfhywf?=
 =?iso-8859-1?Q?JQWGnvDBvfwab+VkZFYDhYEIwBwFSpEcsGkpWhRJUj8oQ1I3qqs5eFuoGV?=
 =?iso-8859-1?Q?kWHSgXr3E2CtsF6pikjpNDGaaOmOPug9vt7VrkOx1D0xipygjSuhMYg9AA?=
 =?iso-8859-1?Q?vk/QJdambV3FGno/1HYn4yDJU8OFJi7nwqJ+YrqJwvxZbAL6XtD4heSY7I?=
 =?iso-8859-1?Q?WHKhWlW2H4Vqg7/FLyDOtNx/rHD6nyaZtEMvHncR57Vl2VMSHo6V4YU/jh?=
 =?iso-8859-1?Q?7n05ZMEhAoh0yNWWy6cEBWlpOqqMWNi5+y/FBnobuCkwkxbwegkgVOBvV8?=
 =?iso-8859-1?Q?ZlcNhXm9L7SqFKl3GS2mGdMhLwzzWFjEt7i4d5YTLPJRAWigvI2VV700Dn?=
 =?iso-8859-1?Q?2C1ZefT8LydgS4IExbrF8eq0+KXzg/LpQyKB+YkeA2yjUGEAf8InncTmbU?=
 =?iso-8859-1?Q?T6QqckODjhO5F+BKn7K7zSEAWjqnL5Gn3gafdZM8leAN3osKyEJWK4SCQE?=
 =?iso-8859-1?Q?fw1l5v/dsIaL0SbppV+KwNHq68lmcMXE7ntabdTZwfK7qb18Anv26gYCdQ?=
 =?iso-8859-1?Q?mLP0lUTeFuQHpPRvbFI0Td7UgNaU90sohIEdDNW1PS7JT74a/PzfUrnUe6?=
 =?iso-8859-1?Q?VUrGQ9XjGcGBnowxQY/MI173S8lfdzNhxFoninGEYWblTODiKOQ5q7dvcE?=
 =?iso-8859-1?Q?bupEaKvkFmwTedvJxzmt25dLJMScKhqgfb99mfZsCgRqqOjDQ2UYfFCsk4?=
 =?iso-8859-1?Q?ZAP26EzSyQRqSk7MnvOkXGJ5Vm38bf0XKJzTEmEanMmRu8G9ZjzpafTLO2?=
 =?iso-8859-1?Q?TACkZufqxO?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <63EB23A9F737F34EA6B508410128592C@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18a3545d-d988-4f7a-a262-08d98ece78e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2021 04:52:49.0941 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1lCk3o4fRUTgjEskas1YzG7S5Xib8eZZcrOPrbBqXw63mojsnI4l8X/fLJ3T5PoZcsLDoZYuTVbokJuxyqsyv9qlgmHirTI3UC8PsT+jLbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4305
X-Proofpoint-ORIG-GUID: dc8uVPdHpm0QXhJ1zL9AVUybFfXMMp8F
X-Proofpoint-GUID: dc8uVPdHpm0QXhJ1zL9AVUybFfXMMp8F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-14_01,2021-10-13_02,2020-04-07_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
 Coiby Xu <coiby.xu@gmail.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 13, 2021 at 10:40:46AM +0100, Stefan Hajnoczi wrote:
> On Mon, Oct 11, 2021 at 10:10:47PM +0200, David Hildenbrand wrote:
> > We end up not copying the mmap_addr of all existing regions, resulting
> > in a SEGFAULT once we actually try to map/access anything within our
> > memory regions.
> >=20
> > Fixes: 875b9fd97b34 ("Support individual region unmap in libvhost-user"=
)
> > Cc: qemu-stable@nongnu.org
> > Cc: Michael S. Tsirkin <mst@redhat.com>
> > Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
> > Cc: "Marc-Andr=E9 Lureau" <marcandre.lureau@redhat.com>
> > Cc: Stefan Hajnoczi <stefanha@redhat.com>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Coiby Xu <coiby.xu@gmail.com>
> > Signed-off-by: David Hildenbrand <david@redhat.com>
> > ---
> >  subprojects/libvhost-user/libvhost-user.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/li=
bvhost-user/libvhost-user.c
> > index bf09693255..787f4d2d4f 100644
> > --- a/subprojects/libvhost-user/libvhost-user.c
> > +++ b/subprojects/libvhost-user/libvhost-user.c
> > @@ -816,6 +816,7 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
> >              shadow_regions[j].gpa =3D dev->regions[i].gpa;
> >              shadow_regions[j].size =3D dev->regions[i].size;
> >              shadow_regions[j].qva =3D dev->regions[i].qva;
> > +            shadow_regions[j].mmap_addr =3D dev->regions[i].mmap_addr;
> >              shadow_regions[j].mmap_offset =3D dev->regions[i].mmap_off=
set;
> >              j++;
> >          } else {
>=20
> Raphael: Some questions about vu_rem_mem_reg():
>=20
> - What ensures that shadow_regions[VHOST_USER_MAX_RAM_SLOTS] is large
>   enough? The add_mem_reg/set_mem_table code doesn't seem to check
>   whether there is enough space in dev->regions[] before adding regions.
>

Correct - it does not check if there is enough space as is. I can add that.

> - What happens when the master populated dev->regions[] with multiple
>   copies of the same region? dev->nregions is only decremented once and
>   no longer accurately reflects the number of elements in
>   dev->regions[].

That case is also not accounted for. I will add it.

>=20
> libvhost-user must not trust the vhost-user master since vhost-user
> needs to provide process isolation. Please add input validation.
>=20

Got it - let me start working on a series.

> Stefan


