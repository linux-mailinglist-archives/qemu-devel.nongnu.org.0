Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 851DD3F8DE9
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 20:36:24 +0200 (CEST)
Received: from localhost ([::1]:39646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJKEh-0008TC-5t
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 14:36:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eugeneh@nvidia.com>)
 id 1mJJzZ-000408-Jj
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 14:20:45 -0400
Received: from mail-dm3nam07on2073.outbound.protection.outlook.com
 ([40.107.95.73]:60000 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eugeneh@nvidia.com>)
 id 1mJJzS-0000sf-Ic
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 14:20:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gh215HpWFlNLq0ivSkJjyWXA5XOSDoicw3zJeC+aAtQ1YrNsUs5j2f7ucCVkCt+1R4nH+vW0cED2TTH5AyXukUDBSj4YZOl3wzS+jbxj0O/EFIxmZD8RYDR+ck3dMk10WEBI0TgAGMXffV+qipHeIxBRuTE6Il8fn7jvdpTzL8HnUkQKkuJzR1mlP+mTOHNjJMEQLRGkVlhvT6rYIogjdZOGENhnpR+8fJrv/qFtyqBn0M1ubCzeBjzzmfPVGK0+BKK7me0L2epWALrxPWfDId14ospMhOEwNoqThE9rStLQTuZU0GsJ65tHKxcvJwoK1zvvPdjCA2utsZJv1uDMtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/u5Y300SJ7TUrBX1tuLjNa7v7QXpRDmfiRjpMY8NHuk=;
 b=WHPAK2fDLE9oeGcTDW/7Jwarm5aA1XKwNyzofjPugohzww0sAUpOisP/qOe5nAuLu8po+51WLpCUhMfewzGbcwK8Q0bmY71MJPBFNZqIpvv2A1p9T/+5GRttSMjGrgy+MzepQt4A5sYkx6jqni0rkQCykBwAeH/6ok/CqxB/T5cP9AYbHWU7tCX5U37kXfea+FNPf5tlZPDubLiTWsRpQzLK/3DIivuzuaNBe/Ah+jjCDi/nrgPS3OchDLHsC/FPNzBsGQ750rDKmPkpoqyPYmPEKXSvJDJ+RsUj4/RpId57pBODQNRPGy6wBhO1WTxlOwq4pn4yKwMQOSJ3l3kFUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/u5Y300SJ7TUrBX1tuLjNa7v7QXpRDmfiRjpMY8NHuk=;
 b=L9BNby26pWMUjqZb7wI1wTuas+j+NLyuAYKa35ayZ2l6xeBfs1vqmhObgyzj9HWvywEtaPqNPLlflLduKTbvcUD12wWuRhM96PDkl/L7qox22b3rc8IEtGkUnCMXSqOw8SPkuZw/lG7+pJ0pC2pofz12l57kNb3Yz2+QyxWbWZ+zcvu5QA259hnXtJu2ocQLcnRULEhov+XuexZ8sA3pow1/meCWVJ3zg65vvS9y5jlW39I0ovE99Imb5YPXbmfUi/g1yjKrrEYlguU3SijGdmA4bymXBdw6OxpUG6tNOuEPvi7/yhHz0Dd/xuWvoJ9VlcNJ9A0GttpCnM5u1rlf9w==
Received: from BYAPR12MB3192.namprd12.prod.outlook.com (2603:10b6:a03:139::14)
 by BY5PR12MB4131.namprd12.prod.outlook.com (2603:10b6:a03:212::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.22; Thu, 26 Aug
 2021 18:00:50 +0000
Received: from BYAPR12MB3192.namprd12.prod.outlook.com
 ([fe80::f401:5034:c05e:73bb]) by BYAPR12MB3192.namprd12.prod.outlook.com
 ([fe80::f401:5034:c05e:73bb%3]) with mapi id 15.20.4436.024; Thu, 26 Aug 2021
 18:00:50 +0000
From: Eugene Huang <eugeneh@nvidia.com>
To: =?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@gmail.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH] Use EGL device extension in display initialization.
Thread-Topic: [PATCH] Use EGL device extension in display initialization.
Thread-Index: AdeKO1v5rK+V8M0rTaC/cxjh3v6BbgAWL2gAAPxdKeAABgNOAAMBfXGw
Date: Thu, 26 Aug 2021 18:00:50 +0000
Message-ID: <BYAPR12MB31924F63F9BC3F7AFF2B7446D9C79@BYAPR12MB3192.namprd12.prod.outlook.com>
References: <BYAPR12MB319275649A1403C254A9EA43D9F29@BYAPR12MB3192.namprd12.prod.outlook.com>
 <CAJ+F1CJGfZBR69gfO4kGxvh73=JRX-w2knZ-AemCoK3pit7XOw@mail.gmail.com>
 <BYAPR12MB3192EC20271BF35444CE2FF3D9F89@BYAPR12MB3192.namprd12.prod.outlook.com>
 <CAJ+F1C+dmfpRCWfSSMV6F0mxtb0TJ3PQekvzOeR2vCUtSjMhAQ@mail.gmail.com>
In-Reply-To: <CAJ+F1C+dmfpRCWfSSMV6F0mxtb0TJ3PQekvzOeR2vCUtSjMhAQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ae4ed09-9b84-43cf-a6bd-08d968bb7072
x-ms-traffictypediagnostic: BY5PR12MB4131:
x-microsoft-antispam-prvs: <BY5PR12MB41310FC09641A9F48A14F301D9C79@BY5PR12MB4131.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W4DK2DlblTQNq4OKG4EwCxOF7+f/I4QV2uE0fSwzKP4ebUrANIuF/Nw44RKD31GuKqrHTpIQ0+2nFjU91mYZah+DFv9vstmFKuvH353CHk8VgObu6ZN1dvrtKzx1/RTBRyyQ4QQ8CuPAxMcb282MmprhkmcknbrtDqthQglqeq9BW7734RZAeXN7Um9nnZdroJbTstLvKcHed8uqSHfmZz4L/4kouSZd3yRXUgYkWqfnEV8+vphCrAVMHriHsIqZi/6xAyidUhM12v6s+872W6Aw1Ivi+5HPaD5kCyygcaZuvdTa0LnTCoIzvz4jssFaYcBnROVqvCcrl7Iskv27jdm+9oHbBhFa2nvsKF2wI2zWZqqE0ATKrczRplEdOvCOyBqzbj0Gu9MxABuCQEFMoY8MyGlpZ7FjujAlUIVXIL1k/HiOA+UMOVBtzc++EMM+KUqE674CwzKM/RE8BkwB8cORepWB28UK0D5vvxpn71Jlf0weW/kZHL8LPvnM1FShsJqwn2G/PYCTXm+rxXEGBqmeIeNNU4fI2CrFROfK7HmrjPTmfF7pDmckcHBOk9ZnFsTPk9yyAQj/K1Y8i50KGGtquIyDhRmi/EkzRgWppRP8lUAGgM5K2N0g/r0nSC4Sq/v5mb3EhKJGVe0H6inUM37d4Slhn1QKvMzupmtSajeZkxaQX5adxDtV3cecXGsMsdLPkVC7ai1iAhujZMrmfGwH+oYjxNYAy8PXDuuEBc1Lq46GJZtO5kX5Iih5ujfI1xrIIX8AG4q2hoUwroCxek/+Y+eqRuzBGfZWN1Xkwr7Rimzz1xoOhqfLnnJkB0O5wgploZc2JhlgQTybBnM9H7rcmCEn1f9/MlFAJ6U2bm8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(346002)(136003)(396003)(316002)(166002)(122000001)(53546011)(966005)(66946007)(7696005)(9686003)(83380400001)(66446008)(6506007)(38100700002)(52536014)(76116006)(38070700005)(55016002)(4326008)(71200400001)(2906002)(186003)(8676002)(9326002)(66556008)(45080400002)(33656002)(66476007)(6916009)(478600001)(5660300002)(8936002)(86362001)(21615005)(64756008)(2004002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?8A87jtFzXRKchj84ITzk4phZi++UUsxrik8vbRYo+LjYk8SC497Iurvoly?=
 =?iso-8859-1?Q?Xa02cWJdYlE6DawkoNFVjiZXabzchvp2vYWK5fZxadUhq3bXnt+74lKYUf?=
 =?iso-8859-1?Q?/m0i5LQdVLItF8K8Mf0qptGLwLA/NdRCEe+RZdBatqCJWNYqXynKkzDEq5?=
 =?iso-8859-1?Q?yEuOTU382ZFTinXBn/mCouzLWdd+wP2Np17zdaWgKiuEnfP9J6TN9P3b/u?=
 =?iso-8859-1?Q?aDKfRSimFIW5dXf0iI8npEj0Jpq08FpSbTFsfuH/vjqwQmWZ3kkjML82pq?=
 =?iso-8859-1?Q?v8cFf+bBgL3JQhETeJml2HQ5JEsC0C3dTpVeinLJ1vZOeSbhetnWFyF096?=
 =?iso-8859-1?Q?7TbRiHo1sNRuqXJAoJfDyJN4mL1hMIflzwezOXNZEGRETr3/GSpbcmJFg7?=
 =?iso-8859-1?Q?2kJvFnm+behGfVjXBR3xMwwjh/7J3tEAMhMl1oE/TpMcsp3kqxbdYP0wfj?=
 =?iso-8859-1?Q?fBHjn6LcgT3/cchN0WkKprCf51w3MgfBd1y2YrcxKnHyh0mx3hdGW1zvgT?=
 =?iso-8859-1?Q?bh6hb0QT1KNWS/5NEk/v7V97PiCxrcoYPyLu3THfAX26/BJK1Z2qn7mqo1?=
 =?iso-8859-1?Q?RYJKZvusm3JfC0uYpJZAcRZH+S3sD3fDg2quFzN8nChvjiJ3AsVygi7lBV?=
 =?iso-8859-1?Q?RGTlsa0U+hlZUutfp/tL3hE1WW+e5a0xLr0cnsue/KFJo+uGFBZt1NQn8O?=
 =?iso-8859-1?Q?8jQpzOdszskjzCEg+ma8pMMhjk4K2M/FYNir3hmEP9/DnVyD56b6uYWFio?=
 =?iso-8859-1?Q?P8+7HVzZ4Nhix3qtWU8WjsHPVMjXvMQ8wY5Z0H3efreS8dcEbFNpjpPZPo?=
 =?iso-8859-1?Q?HH5w2y3dSUxBbnAHjmmESO9vjsUo1xIfIlpUWEtxSq3f5c3U8ZZpBX/DyN?=
 =?iso-8859-1?Q?wU97LBfYYO2wZK6M0al49KTK2f96VeO9Dqn0PR9Bz4s97t3066ENrzMqJ3?=
 =?iso-8859-1?Q?FXn2d3+v96F2qjcFIwuTj67ar+AvDhWN/77I/vk3EwgVMX1ffT36TbaZ3A?=
 =?iso-8859-1?Q?wVvxrdD1G+cpNpg0DRF5bD0wfntaaJZClZ/o/803441iBEu/DYYvnGV/QU?=
 =?iso-8859-1?Q?rXU4ImjDwjg7HcEbqdTW+6Ltv+DXu0fTaPZ2Cj13hLh/ukEtVEV7LGo0ao?=
 =?iso-8859-1?Q?M1JqrJvpF4Zi0t1Tsb/UY3McShdQK3iDbJf0YaxeZZRmvxr7HDyLkhgD5m?=
 =?iso-8859-1?Q?e1vfOmhECh7UmE+AI2WUM52bhZteU5xT1FxUbXbsHhWaC2zV8Hj218w0QZ?=
 =?iso-8859-1?Q?eq3clhoqhII0//PQPixZtM/qnV8CiZLRLPoMzpQgrqXhab9W4KUK+tJID0?=
 =?iso-8859-1?Q?kxG7FtlWyqtaQVwlga8BCZza52mwSxNF5CjQXppSafENYDg7+qL2kMRmLG?=
 =?iso-8859-1?Q?UKJjSkFyrdJ3KrlcL8rm6k9foIeVeSsEnrRzVAl5GJ7XKJMYMs31UqQng/?=
 =?iso-8859-1?Q?Gbp8JzgU+8dMqgj9?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_BYAPR12MB31924F63F9BC3F7AFF2B7446D9C79BYAPR12MB3192namp_"
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ae4ed09-9b84-43cf-a6bd-08d968bb7072
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2021 18:00:50.3341 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D1TCom5ym6ZROu9hLQOsZRLrN8p/1nxBrvYdA4jVsjdM3yMSeIQVs259gRTY22/+S+pFMKzHIwptQMtgsnI2eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4131
Received-SPF: softfail client-ip=40.107.95.73; envelope-from=eugeneh@nvidia.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, HTTPS_HTTP_MISMATCH=0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_BYAPR12MB31924F63F9BC3F7AFF2B7446D9C79BYAPR12MB3192namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

Sorry for the delay. Finally got git send-email working and resubmitted the=
 patch on Aug. 24:
https://lists.nongnu.org/archive/html/qemu-devel/2021-08/msg04112.html
https://lists.nongnu.org/archive/html/qemu-devel/2021-08/msg04113.html

If anything is still incorrect, please advise.

Regards,
Eugene Huang

From: Marc-Andr=E9 Lureau <marcandre.lureau@gmail.com>
Sent: Wednesday, August 11, 2021 3:43 AM
To: Eugene Huang <eugeneh@nvidia.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] Use EGL device extension in display initialization.

External email: Use caution opening links or attachments

Hi

On Wed, Aug 11, 2021 at 11:58 AM Eugene Huang <eugeneh@nvidia.com<mailto:eu=
geneh@nvidia.com>> wrote:
Hi,

I have had some hard time to set up git send-email. I am not even sure if i=
t is doable here. I read that attachments can be used a last resort for fir=
st timers. Here are the attachments. Hope it works.


Unfortunately, the patches still fail to apply.
https://patchew.org/QEMU/BYAPR12MB3192EC20271BF35444CE2FF3D9F89@BYAPR12MB31=
92.namprd12.prod.outlook.com/<https://nam11.safelinks.protection.outlook.co=
m/?url=3Dhttps%3A%2F%2Fpatchew.org%2FQEMU%2FBYAPR12MB3192EC20271BF35444CE2F=
F3D9F89%40BYAPR12MB3192.namprd12.prod.outlook.com%2F&data=3D04%7C01%7Ceugen=
eh%40nvidia.com%7Cdee6cf4f0f4d412c2fe708d95cb4c69f%7C43083d15727340c1b7db39=
efd9ccc17a%7C0%7C0%7C637642753764629442%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3Du9cA=
CiyD12DPZ9QVnrnWCElQHCFznFsCq5qssXH1t64%3D&reserved=3D0>

Thanks,
Eugene

From: Marc-Andr=E9 Lureau <marcandre.lureau@gmail.com<mailto:marcandre.lure=
au@gmail.com>>
Sent: Friday, August 6, 2021 12:25 AM
To: Eugene Huang <eugeneh@nvidia.com<mailto:eugeneh@nvidia.com>>
Cc: qemu-devel@nongnu.org<mailto:qemu-devel@nongnu.org>
Subject: Re: [PATCH] Use EGL device extension in display initialization.

External email: Use caution opening links or attachments

Hi

On Fri, Aug 6, 2021 at 2:28 AM Eugene Huang <eugeneh@nvidia.com<mailto:euge=
neh@nvidia.com>> wrote:

This patch enables running generic EGL devices such as Nvidia's in headless=
 mode. It assumes single device. More work is needed to support multiple de=
vices.



Signed-off-by: Eugene Huang <eugeneh@nvidia.com<mailto:eugeneh@nvidia.com>>

Thanks for the patch. It isn't correctly formatted and git apply fails  (ht=
tps://patchew.org/QEMU/BYAPR12MB319275649A1403C254A9EA43D9F29@BYAPR12MB3192=
.namprd12.prod.outlook.com/<https://nam11.safelinks.protection.outlook.com/=
?url=3Dhttps%3A%2F%2Fpatchew.org%2FQEMU%2FBYAPR12MB319275649A1403C254A9EA43=
D9F29%40BYAPR12MB3192.namprd12.prod.outlook.com%2F&data=3D04%7C01%7Ceugeneh=
%40nvidia.com%7Cdee6cf4f0f4d412c2fe708d95cb4c69f%7C43083d15727340c1b7db39ef=
d9ccc17a%7C0%7C0%7C637642753764639436%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3D1GyXOJ=
%2B9xKBDsX3q9Uemj4xMZBjhNTeR0le8Upm843w%3D&reserved=3D0>). Please use git s=
end-email.


---

ui/egl-helpers.c | 41 +++++++++++++++++++++++++++++++++++++----

1 file changed, 37 insertions(+), 4 deletions(-)



diff --git a/ui/egl-helpers.c b/ui/egl-helpers.c

index 7c530c2825..c11610c083 100644

--- a/ui/egl-helpers.c

+++ b/ui/egl-helpers.c

@@ -1,6 +1,8 @@

/*

  * Copyright (C) 2015-2016 Gerd Hoffmann <kraxel@redhat.com<mailto:kraxel@=
redhat.com>>

  *

+ * Copyright (c) 2021, NVIDIA CORPORATION & AFFILIATES. All rights reserve=
d.

+ *

  * This library is free software; you can redistribute it and/or

  * modify it under the terms of the GNU Lesser General Public

  * License as published by the Free Software Foundation; either

@@ -349,11 +351,26 @@ static EGLDisplay qemu_egl_get_display(EGLNativeDispl=
ayType native,

     EGLDisplay dpy =3D EGL_NO_DISPLAY;

     /* In practise any EGL 1.5 implementation would support the EXT extens=
ion */

-    if (epoxy_has_egl_extension(NULL, "EGL_EXT_platform_base")) {

+    if (epoxy_has_egl_extension(NULL, "EGL_EXT_platform_base")

+        && epoxy_has_egl_extension(NULL, "EGL_EXT_platform_device")

+        && (epoxy_has_egl_extension(NULL, "EGL_EXT_device_base")

+        || epoxy_has_egl_extension(NULL, "EGL_EXT_device_enumeration"))) {

         PFNEGLGETPLATFORMDISPLAYEXTPROC getPlatformDisplayEXT =3D

             (void *) eglGetProcAddress("eglGetPlatformDisplayEXT");

         if (getPlatformDisplayEXT && platform !=3D 0) {

-            dpy =3D getPlatformDisplayEXT(platform, native, NULL);

+            if (platform =3D=3D EGL_PLATFORM_DEVICE_EXT) {

+                static const int MAX_DEVICES =3D 4;

+                EGLDeviceEXT eglDevs[MAX_DEVICES];

+                EGLint numDevices;

+

+                PFNEGLQUERYDEVICESEXTPROC eglQueryDevicesEXT =3D

+                    (PFNEGLQUERYDEVICESEXTPROC)

+                eglGetProcAddress("eglQueryDevicesEXT");

+                eglQueryDevicesEXT(MAX_DEVICES, eglDevs, &numDevices);

+                dpy =3D getPlatformDisplayEXT(platform, eglDevs[0], 0);

Given that the function has a lengthy comment to explain it, and this is qu=
ite archaic stuff, I think you should update the comments with your additio=
ns.


+            } else {

+                dpy =3D getPlatformDisplayEXT(platform, native, NULL);

+            }

         }

     }

@@ -386,6 +403,17 @@ static int qemu_egl_init_dpy(EGLNativeDisplayType dpy,

         EGL_ALPHA_SIZE, 0,

         EGL_NONE,

     };

+

+    static const EGLint conf_att_pbuffer[] =3D {

+        EGL_SURFACE_TYPE, EGL_PBUFFER_BIT,

+        EGL_RED_SIZE, 8,

+        EGL_GREEN_SIZE, 8,

+        EGL_BLUE_SIZE, 8,

+        EGL_DEPTH_SIZE, 1,

+        EGL_RENDERABLE_TYPE, EGL_OPENGL_BIT,

+        EGL_NONE

+    };

+

     EGLint major, minor;

     EGLBoolean b;

     EGLint n;

@@ -411,8 +439,8 @@ static int qemu_egl_init_dpy(EGLNativeDisplayType dpy,

     }

     b =3D eglChooseConfig(qemu_egl_display,

-                        gles ? conf_att_gles : conf_att_core,

-                        &qemu_egl_config, 1, &n);

+        gles ? conf_att_gles : (platform =3D=3D EGL_PLATFORM_DEVICE_EXT ? =
conf_att_pbuffer : conf_att_core),

+        &qemu_egl_config, 1, &n);

     if (b =3D=3D EGL_FALSE || n !=3D 1) {

         error_report("egl: eglChooseConfig failed (%s mode)",

                      gles ? "gles" : "core");

@@ -434,6 +462,11 @@ int qemu_egl_init_dpy_x11(EGLNativeDisplayType dpy, Di=
splayGLMode mode)

 int qemu_egl_init_dpy_mesa(EGLNativeDisplayType dpy, DisplayGLMode mode)

{

+    // Try EGL Device Extension

+    if (qemu_egl_init_dpy(dpy, EGL_PLATFORM_DEVICE_EXT, mode) =3D=3D 0) {

+        return 0;

+    }

+

#ifdef EGL_MESA_platform_gbm

     return qemu_egl_init_dpy(dpy, EGL_PLATFORM_GBM_MESA, mode);

#else

--

2.17.1



thanks

--
Marc-Andr=E9 Lureau


--
Marc-Andr=E9 Lureau

--_000_BYAPR12MB31924F63F9BC3F7AFF2B7446D9C79BYAPR12MB3192namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Verdana;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
p.gmail-m3560069331736637333gmail-m-5372014696273679682msoplaintext, li.gma=
il-m3560069331736637333gmail-m-5372014696273679682msoplaintext, div.gmail-m=
3560069331736637333gmail-m-5372014696273679682msoplaintext
	{mso-style-name:gmail-m_3560069331736637333gmail-m-5372014696273679682msop=
laintext;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Sorry for the delay. Finally got git send-email work=
ing and resubmitted the patch on Aug. 24:<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://lists.nongnu.org/archive/html/qem=
u-devel/2021-08/msg04112.html">https://lists.nongnu.org/archive/html/qemu-d=
evel/2021-08/msg04112.html</a><o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://lists.nongnu.org/archive/html/qem=
u-devel/2021-08/msg04113.html">https://lists.nongnu.org/archive/html/qemu-d=
evel/2021-08/msg04113.html</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">If anything is still incorrect, please advise.<o:p><=
/o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Eugene Huang<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Marc-Andr=E9 Lureau &lt;marcandre.lurea=
u@gmail.com&gt; <br>
<b>Sent:</b> Wednesday, August 11, 2021 3:43 AM<br>
<b>To:</b> Eugene Huang &lt;eugeneh@nvidia.com&gt;<br>
<b>Cc:</b> qemu-devel@nongnu.org<br>
<b>Subject:</b> Re: [PATCH] Use EGL device extension in display initializat=
ion.<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<table class=3D"MsoNormalTable" border=3D"1" cellpadding=3D"0" style=3D"bac=
kground:#FFEB9C">
<tbody>
<tr>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><b><span style=3D"font-size:7.5pt;font-family:&quot;=
Verdana&quot;,sans-serif;color:black">External email: Use caution opening l=
inks or attachments</span></b><span style=3D"font-size:7.5pt;font-family:&q=
uot;Verdana&quot;,sans-serif;color:black">
</span><o:p></o:p></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<div>
<p class=3D"MsoNormal">Hi<o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<p class=3D"MsoNormal">On Wed, Aug 11, 2021 at 11:58 AM Eugene Huang &lt;<a=
 href=3D"mailto:eugeneh@nvidia.com">eugeneh@nvidia.com</a>&gt; wrote:<o:p><=
/o:p></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
<div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">I have had some hard time to set up git send-email. I am not even =
sure if it is doable here. I read that attachments can be used a last resor=
t for first timers. Here are the attachments.
 Hope it works.<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">&nbsp;<o:p></o:p></p>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Unfortunately, the patches still fail to apply.<o:p>=
</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><a href=3D"https://nam11.safelinks.protection.outloo=
k.com/?url=3Dhttps%3A%2F%2Fpatchew.org%2FQEMU%2FBYAPR12MB3192EC20271BF35444=
CE2FF3D9F89%40BYAPR12MB3192.namprd12.prod.outlook.com%2F&amp;data=3D04%7C01=
%7Ceugeneh%40nvidia.com%7Cdee6cf4f0f4d412c2fe708d95cb4c69f%7C43083d15727340=
c1b7db39efd9ccc17a%7C0%7C0%7C637642753764629442%7CUnknown%7CTWFpbGZsb3d8eyJ=
WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;=
sdata=3Du9cACiyD12DPZ9QVnrnWCElQHCFznFsCq5qssXH1t64%3D&amp;reserved=3D0">ht=
tps://patchew.org/QEMU/BYAPR12MB3192EC20271BF35444CE2FF3D9F89@BYAPR12MB3192=
.namprd12.prod.outlook.com/</a><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
<div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">Eugene<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">&nbsp;<o:p></o:p></p>
<div>
<div style=3D"border:none;border-top:solid windowtext 1.0pt;padding:3.0pt 0=
in 0in 0in;border-color:currentcolor currentcolor">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><b>From:</b> Marc-Andr=E9 Lureau &lt;<a href=3D"mailto:marcandre.l=
ureau@gmail.com" target=3D"_blank">marcandre.lureau@gmail.com</a>&gt;
<br>
<b>Sent:</b> Friday, August 6, 2021 12:25 AM<br>
<b>To:</b> Eugene Huang &lt;<a href=3D"mailto:eugeneh@nvidia.com" target=3D=
"_blank">eugeneh@nvidia.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:qemu-devel@nongnu.org" target=3D"_blank">qemu-=
devel@nongnu.org</a><br>
<b>Subject:</b> Re: [PATCH] Use EGL device extension in display initializat=
ion.<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">&nbsp;<o:p></o:p></p>
<table class=3D"MsoNormalTable" border=3D"1" cellpadding=3D"0" style=3D"bac=
kground:#FFEB9C;background-attachment:scroll;background-position-x:0%;backg=
round-position-y:0%">
<tbody>
<tr>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><b><span style=3D"font-size:7.5pt;font-family:&quot;Verdana&quot;,=
sans-serif;color:black">External email: Use caution opening links or attach=
ments</span></b><span style=3D"font-size:7.5pt;font-family:&quot;Verdana&qu=
ot;,sans-serif;color:black">
</span><o:p></o:p></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"color:black">&nbsp;</span><o:p></o:p></p>
<div>
<div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">Hi<o:p></o:p></p>
</div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">&nbsp;<o:p></o:p></p>
<div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">On Fri, Aug 6, 2021 at 2:28 AM Eugene Huang &lt;<a href=3D"mailto:=
eugeneh@nvidia.com" target=3D"_blank">eugeneh@nvidia.com</a>&gt; wrote:<o:p=
></o:p></p>
</div>
<blockquote style=3D"border:none;border-left:solid windowtext 1.0pt;padding=
:0in 0in 0in 6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0in;marg=
in-bottom:5.0pt;border-color:currentcolor currentcolor currentcolor rgb(204=
,204,204)">
<div>
<div>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt">This patch enables running generic EGL devices such as Nvidia&#8217;s i=
n headless mode. It assumes single device. More work is needed to support m=
ultiple devices.<o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt">&nbsp;<o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">Sig=
ned-off-by: Eugene Huang &lt;<a href=3D"mailto:eugeneh@nvidia.com" target=
=3D"_blank">eugeneh@nvidia.com</a>&gt;</span><o:p></o:p></p>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">Thanks for the patch. It isn't correctly formatted and git apply f=
ails&nbsp; (<a href=3D"https://nam11.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fpatchew.org%2FQEMU%2FBYAPR12MB319275649A1403C254A9EA43D9F2=
9%40BYAPR12MB3192.namprd12.prod.outlook.com%2F&amp;data=3D04%7C01%7Ceugeneh=
%40nvidia.com%7Cdee6cf4f0f4d412c2fe708d95cb4c69f%7C43083d15727340c1b7db39ef=
d9ccc17a%7C0%7C0%7C637642753764639436%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D1G=
yXOJ%2B9xKBDsX3q9Uemj4xMZBjhNTeR0le8Upm843w%3D&amp;reserved=3D0" target=3D"=
_blank">https://patchew.org/QEMU/BYAPR12MB319275649A1403C254A9EA43D9F29@BYA=
PR12MB3192.namprd12.prod.outlook.com/</a>).
 Please use git send-email.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">&nbsp;<o:p></o:p></p>
</div>
<blockquote style=3D"border:none;border-left:solid windowtext 1.0pt;padding=
:0in 0in 0in 6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0in;marg=
in-bottom:5.0pt;border-color:currentcolor currentcolor currentcolor rgb(204=
,204,204)">
<div>
<div>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">---=
</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">ui/=
egl-helpers.c | 41 +++++++++++++++++++++++++++++++++++++----</span><o:p></o=
:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">1 f=
ile changed, 37 insertions(+), 4 deletions(-)</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">&nb=
sp;</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">dif=
f --git a/ui/egl-helpers.c b/ui/egl-helpers.c</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">ind=
ex 7c530c2825..c11610c083 100644</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">---=
 a/ui/egl-helpers.c</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">+++=
 b/ui/egl-helpers.c</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">@@ =
-1,6 +1,8 @@</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">/*<=
/span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">&nb=
sp; * Copyright (C) 2015-2016 Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@re=
dhat.com" target=3D"_blank">kraxel@redhat.com</a>&gt;</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">&nb=
sp; *</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">+ *=
 Copyright (c) 2021, NVIDIA CORPORATION &amp; AFFILIATES. All rights reserv=
ed.</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">+ *=
</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">&nb=
sp; * This library is free software; you can redistribute it and/or</span><=
o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">&nb=
sp; * modify it under the terms of the GNU Lesser General Public</span><o:p=
></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">&nb=
sp; * License as published by the Free Software Foundation; either</span><o=
:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">@@ =
-349,11 +351,26 @@ static EGLDisplay qemu_egl_get_display(EGLNativeDisplayT=
ype native,</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">&nb=
sp;&nbsp;&nbsp;&nbsp; EGLDisplay dpy =3D EGL_NO_DISPLAY;</span><o:p></o:p><=
/p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;/* In practise any EGL 1.5 implementation would =
support the EXT extension */</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">-&n=
bsp;&nbsp;&nbsp; if (epoxy_has_egl_extension(NULL, &quot;EGL_EXT_platform_b=
ase&quot;)) {</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">+&n=
bsp;&nbsp;&nbsp; if (epoxy_has_egl_extension(NULL, &quot;EGL_EXT_platform_b=
ase&quot;)</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">+&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; epoxy_has_egl_extension=
(NULL, &quot;EGL_EXT_platform_device&quot;)</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">+&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; (epoxy_has_egl_extensio=
n(NULL, &quot;EGL_EXT_device_base&quot;)</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">+&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; || epoxy_has_egl_extension(NULL, &=
quot;EGL_EXT_device_enumeration&quot;))) {</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PFNEGLGETPLATFORMDISPLAYEXTPR=
OC getPlatformDisplayEXT =3D</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (void=
 *) eglGetProcAddress(&quot;eglGetPlatformDisplayEXT&quot;);</span><o:p></o=
:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (getPlatformDisplayEXT &am=
p;&amp; platform !=3D 0) {</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">-&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dpy =3D ge=
tPlatformDisplayEXT(platform, native, NULL);</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">+&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (platfo=
rm =3D=3D EGL_PLATFORM_DEVICE_EXT) {</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">+&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; static const int MAX_DEVICES =3D 4;</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">+&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; EGLDeviceEXT eglDevs[MAX_DEVICES];</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">+&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; EGLint numDevices;</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">+</=
span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">+&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; PFNEGLQUERYDEVICESEXTPROC eglQueryDevicesEXT =3D</span><o:p><=
/o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">+&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (PFNEGLQUERYDEVICESEXTPROC)</span><o:=
p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">+&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; eglGetProcAddress(&quot;eglQueryDevicesEXT&quot;);</span><o:p=
></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">+&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; eglQueryDevicesEXT(MAX_DEVICES, eglDevs, &amp;numDevices);</s=
pan><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">+&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; dpy =3D getPlatformDisplayEXT(platform, eglDevs[0], 0);</span=
><o:p></o:p></p>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">Given that the function has a lengthy comment to explain it, and t=
his is quite archaic stuff, I think you should update the comments with you=
r additions.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">&nbsp;<o:p></o:p></p>
</div>
<blockquote style=3D"border:none;border-left:solid windowtext 1.0pt;padding=
:0in 0in 0in 6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0in;marg=
in-bottom:5.0pt;border-color:currentcolor currentcolor currentcolor rgb(204=
,204,204)">
<div>
<div>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">+&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {</=
span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">+&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; dpy =3D getPlatformDisplayEXT(platform, native, NULL);</span>=
<o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">+&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</span><o=
:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">&nb=
sp;&nbsp;&nbsp;&nbsp; }</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">@@ =
-386,6 +403,17 @@ static int qemu_egl_init_dpy(EGLNativeDisplayType dpy,</s=
pan><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EGL_ALPHA_SIZE, 0,</span><o:p=
></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EGL_NONE,</span><o:p></o:p></=
p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">&nb=
sp;&nbsp;&nbsp;&nbsp; };</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">+</=
span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">+&n=
bsp;&nbsp;&nbsp; static const EGLint conf_att_pbuffer[] =3D {</span><o:p></=
o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">+&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EGL_SURFACE_TYPE, EGL_PBUFFER_BIT,=
</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">+&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EGL_RED_SIZE, 8,</span><o:p></o:p>=
</p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">+&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EGL_GREEN_SIZE, 8,</span><o:p></o:=
p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">+&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EGL_BLUE_SIZE, 8,</span><o:p></o:p=
></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">+&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EGL_DEPTH_SIZE, 1,</span><o:p></o:=
p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">+&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EGL_RENDERABLE_TYPE, EGL_OPENGL_BI=
T,</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">+&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EGL_NONE</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">+&n=
bsp;&nbsp;&nbsp; };</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">+</=
span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">&nb=
sp;&nbsp;&nbsp;&nbsp; EGLint major, minor;</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">&nb=
sp;&nbsp;&nbsp;&nbsp; EGLBoolean b;</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">&nb=
sp;&nbsp;&nbsp;&nbsp; EGLint n;</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">@@ =
-411,8 +439,8 @@ static int qemu_egl_init_dpy(EGLNativeDisplayType dpy,</sp=
an><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">&nb=
sp;&nbsp;&nbsp;&nbsp; }</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;b =3D eglChooseConfig(qemu_egl_display,</span><o=
:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">-&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gles ? conf_a=
tt_gles : conf_att_core,</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">-&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;qemu_egl=
_config, 1, &amp;n);</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">+&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gles ? conf_att_gles : (platform =
=3D=3D EGL_PLATFORM_DEVICE_EXT ? conf_att_pbuffer : conf_att_core),</span><=
o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">+&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;qemu_egl_config, 1, &amp;n);<=
/span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">&nb=
sp;&nbsp;&nbsp;&nbsp; if (b =3D=3D EGL_FALSE || n !=3D 1) {</span><o:p></o:=
p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error_report(&quot;egl: eglCh=
ooseConfig failed (%s mode)&quot;,</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gles ? &quot;gles&quot; : =
&quot;core&quot;);</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">@@ =
-434,6 +462,11 @@ int qemu_egl_init_dpy_x11(EGLNativeDisplayType dpy, Displ=
ayGLMode mode)</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">&nb=
sp;int qemu_egl_init_dpy_mesa(EGLNativeDisplayType dpy, DisplayGLMode mode)=
</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">{</=
span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">+&n=
bsp;&nbsp;&nbsp; // Try EGL Device Extension</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">+&n=
bsp;&nbsp;&nbsp; if (qemu_egl_init_dpy(dpy, EGL_PLATFORM_DEVICE_EXT, mode) =
=3D=3D 0) {</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">+&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">+&n=
bsp;&nbsp;&nbsp; }</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">+</=
span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">#if=
def EGL_MESA_platform_gbm</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">&nb=
sp;&nbsp;&nbsp;&nbsp; return qemu_egl_init_dpy(dpy, EGL_PLATFORM_GBM_MESA, =
mode);</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">#el=
se</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">--
</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">2.1=
7.1</span><o:p></o:p></p>
<p class=3D"gmail-m3560069331736637333gmail-m-5372014696273679682msoplainte=
xt"><span style=3D"font-size:8.0pt;font-family:&quot;Courier New&quot;">&nb=
sp;</span><o:p></o:p></p>
</div>
</div>
</blockquote>
</div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><br clear=3D"all">
<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">thanks<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">--
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">Marc-Andr=E9 Lureau<o:p></o:p></p>
</div>
</div>
</div>
</div>
</div>
</div>
</blockquote>
</div>
<p class=3D"MsoNormal"><br clear=3D"all">
<br>
-- <o:p></o:p></p>
<div>
<p class=3D"MsoNormal">Marc-Andr=E9 Lureau<o:p></o:p></p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_BYAPR12MB31924F63F9BC3F7AFF2B7446D9C79BYAPR12MB3192namp_--

