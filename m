Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F664329D0
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 00:35:50 +0200 (CEST)
Received: from localhost ([::1]:43248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcbET-0004AF-61
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 18:35:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mcbBw-00022k-Md
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 18:33:12 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:2726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mcbBq-0001Cb-Tp
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 18:33:11 -0400
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19IHWnV9021779; 
 Mon, 18 Oct 2021 15:33:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=S9KFXmVyezDvpHh8hyhdO3PJteuPDlXAYGK2m7xM748=;
 b=Lm9l+65oaxiQMoS36beDB82Q98FzwQ5qTXbvMbTKbet3zB4vLvtEoowJBSSKQMFfOn2h
 w38aXnunWY4STE+0A9ZU7UkLkj73GNs5MwJ3OcegI3DNIQXGrR9uViHxnpBiqoz+9Hat
 /fbBvjH7a9pxu2JgbEEkQenkoy9VeyzwDTMFnhtGJ9LXq4rqGy3AKdQ1nfYbnPwF0Oi/
 KYFNVZuacjjGVzpuPryTKTEdpp/fGU77T6sdGEOPjPoieMYD7AY+eI3sGdyOQr6L5Yq4
 m9ZHB9lGT/VyxT+RY2f3+f+wQC7A9zhMjIzo2ejpibN2kA8vc7/3hml65otSq14C6yd9 Hg== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
 by mx0b-002c1b01.pphosted.com with ESMTP id 3bs8vb1b0c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 15:33:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8fnODjSCIcDBTRRKRuNNsOtTnNa3SbzK4ucC4HaknirXgxfs9w3rZ2iZ3Fd6xtESFVIhXlJgKTstPI5+4sCw3BjGL5NUaR1bKGJSn0kxqnm2VQHu5q4PmfakXTFL6vRE8gyYojfNvJEpfDOCko4Vi/H9cLBdxHSqyTBQx8sNU94bj4C3jD5yIp0F5t8jAgk8b/k08R/GH8J4DPVpqkDvEB7leZh18DxCkQ+AyGRrZtH3NczMakq03At46uIM+MBYIDLR/qcQmkPbY+aqi55YfWEKad35GWzyjkiaau5VCI+DkZhFs1A6OOnVRzg6U9sQ82GK3lxhBuaEeTNFYNnIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S9KFXmVyezDvpHh8hyhdO3PJteuPDlXAYGK2m7xM748=;
 b=nZaQWI0DYLbkxHsEg9JqqMfNtDXDhWGmhM8z2Hpcm3vPwcssqfeIRgPH1gDMCaf6SZcXVYRW4NfRyxaJBo3Lj5T/r9SbTpY+QmfW+7dupreVXVDe6wRl/IwcmWfmFw6fWCqyNTssIV82uVlPApykZz+AAk5SX7LJzCYVKGRppD628ToJ1/TYdPqvdVvAKwp3mdob/t52TG3i32xI1XR/xZR57gANUYxEKrKwSpEjh9f95xL0j41wgLRJd8Af9l+Jg7T+e++ckn/OOmcdqX33532zVIxyijdCx8KffxfxHuuIBzdpmLpO/o4yXmohpWez/Av/DGMKEUnNu/RH0jp26A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BL3PR02MB8204.namprd02.prod.outlook.com (2603:10b6:208:33b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Mon, 18 Oct
 2021 22:33:03 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::804:50eb:bd2:eb3c]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::804:50eb:bd2:eb3c%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 22:33:03 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v6] Work around vhost-user-blk-test hang
Thread-Topic: [PATCH v6] Work around vhost-user-blk-test hang
Thread-Index: AQHXwLR7owf86s2m50iPvIronnTPVavZUvqAgAAL0AA=
Date: Mon, 18 Oct 2021 22:33:02 +0000
Message-ID: <20211018223258.GA11100@raphael-debian-dev>
References: <20211014043216.10325-1-raphael.norwitz@nutanix.com>
 <20211018171738-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211018171738-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6748a2c1-0612-4e83-4af3-08d992873f5a
x-ms-traffictypediagnostic: BL3PR02MB8204:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL3PR02MB8204796DEC09B238AC6FE8D2EABC9@BL3PR02MB8204.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:480;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BhRiKyMIAR7OBjdybq217q2xEtyAp2E5xuWbhgwQBJgd+hiSWdhJpUezqgZlMFSPpc9tt304HPvjN6jdgiRHHSaR7510fwnrlmvGxhvBaVGiXkvABPoPFkNFirwTAnYD0Q5nKXcGjajNBEsM5P0YCxFh7p59Tp0QK4XMlx8OAdoH1D9uvYsC/swMVWEjH9YyUpiaoKUbk1rTsDw9zs1c6feSD0s5Jyff9fOz++dVYV+sMFzR3nhOLzg5jY5LsTuB3uf4hBAvsFlE1WI3a8P4ArFVVOPn3wXy59cc+pFtR0tg6M0gD81z6bN9mgN/iHm2EJeM3eaox7uEv/jlsqAh4S/uUwq1WhU/YJUYBYg14bTKRcBOfPq3vhhJmwdP9pXLxn77UG7DdNZnEDjQJTewEoy6OdVvrWPQvG/ZE26Xur874H4++aKP6fsXtL1IM8Lotst2mNm9lp1Lktr9PboyKSzrKWGZ1u1wejNAXKdKlwUL5h9uW/m8kjAMJFbj4tt5flHrcg/++Rl7DXnP3aweO6tl96OETxZhmKSu1H3hUPg7cLUJUZEwf3+1z8pCfW2ZMp7fc/S2XztE7HokEynEUxCKHZPAM6FRhi/BR0UdwXBc0AoyCy+skBLWnCBqM2391hHjk4oWVHrO4zPYJ99OXNQkp8qXeXRmIBsnI3wvsgTD+BzEGi1q8j5WAgNL5RN71XhQUIE1fyvwt2kyX6X/LapFB3vaE2D4S0g9AD4HOHAjzawZgOh6FTwnAgEoqauj2QG1BZ73M5Tv96IPA4/PeJr/jYOAqPBbs/UhaikbPGz3TfZc4yREQaQ9721Cg9R4Ve3OcZteUUN142bdXjKG2A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(71200400001)(83380400001)(2906002)(54906003)(6512007)(122000001)(44832011)(5660300002)(38100700002)(316002)(9686003)(1076003)(91956017)(508600001)(66446008)(64756008)(86362001)(66556008)(33716001)(8936002)(26005)(33656002)(66946007)(38070700005)(6916009)(66476007)(8676002)(76116006)(186003)(6486002)(6506007)(4326008)(966005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vq/pEL7JO1HwnOCz6riY0PgtlR3gJIaaMZTUDUBVebBgDWrOJQ2x5sfvfTEQ?=
 =?us-ascii?Q?kqNzYFDK+ra+JP3h/m/nhx3KgQvMQkc2TfDzxcfgW4NoYWraooZckACjIrOw?=
 =?us-ascii?Q?SMfHZAHLTB/+Q4CBCTn5TtqlAorhIZyJikM28jYNeKzdkzSyGGYRx9XvxNWQ?=
 =?us-ascii?Q?eTSpx1g+gHqxDH80SIBRQNA2PNU5lxoVKgiy4Hdx5MBDrLwESgiDKTn96WQN?=
 =?us-ascii?Q?vFI3iUQhuvzvf981VjTukvv3d0P4YS+5557Ho3pHzemgOyzCc/Zv8+xPSaba?=
 =?us-ascii?Q?bfT0dEJ4KnCG+07VdIBQ9wlG6CROM9m93MSfzTcBp3wrtGPc0E8M/T+Yzcsl?=
 =?us-ascii?Q?xWpw3Nhu2u22yx4KMB0MSGwYctgGAffhtzUMsTXgyj1uwFVTx0fYialNEsE+?=
 =?us-ascii?Q?C+hrpdELHXs0bR3ZuqCP9/8wodfbpb0GpkJfqYcZVyOuSBlHwLQSFBLO6qm+?=
 =?us-ascii?Q?txgih+HowRFhueoSgakwZ0AEDQxsHgpK0O3zLBhRcABX1brwTaRCf1uUV8J1?=
 =?us-ascii?Q?tDWgOEacRUKDGyuN764uppQBg1ZdpXby5QTGNJRgWF/DXrv1FjMCBZebE8dr?=
 =?us-ascii?Q?pCZfMuU9i5tZH2HFmkPrNDLpM3vLIF3hIoHDcjCu0ZFfy6SbkLOVxBu4V5pB?=
 =?us-ascii?Q?SgQJYplv6KPrZM1iOeqPx/9zWs6LRpYXacynApewhyUBlfnenXyH65Hazx4s?=
 =?us-ascii?Q?qiE+D/O8vHEc8+wDP9HMJDMN5/oQD/9BhorISvtS1YMtPmO6S8qpplTMC3uT?=
 =?us-ascii?Q?q2FJU69xOFTXVX5jWDzoEW/BPxieLGKrpRE2mNzZmbNAeWIu0VnvEiBLF+7b?=
 =?us-ascii?Q?aRQQv8+5jbYYGC8one9lJfvpEfuh1vpaN2fL+781/sHPso2w2I7TDYYc3mWU?=
 =?us-ascii?Q?t5dK9Grj16sN0LnM6/oCMBYrUZM8fq/EsKA/hmWionjvk71joiYpwjy2Krv5?=
 =?us-ascii?Q?XIZT7SYcecMbezW8FGYoXohIyyJAlba9U0EeRF++DTknRjP9je9hN24RnR/g?=
 =?us-ascii?Q?tH9/v0p+9trGiXtQpnDsTbNuToRAd4KGUDUJq9UbgMCzJiSgmZiI8YEPFnt8?=
 =?us-ascii?Q?3g/hHYCT4YaRSvZN+EWG490NVSttLubymb8h8nH482WfNnaVU/7aeVCHK70y?=
 =?us-ascii?Q?B4fHtsFKI5XQZIXHEIOLwTD9sTvAF/cPXzMkszT60GuW/9o7trZl7sDsyuph?=
 =?us-ascii?Q?qiA58x1cF1YauqZrqn7oMVHu9TGAhg3ju7ewy9LpbvTdYGwISRhpic5v2iaO?=
 =?us-ascii?Q?SFWilLlO/Psj127mCvN/SL2mbh5mzKtl709voil4gURolI5pzcp2Dor3aFyO?=
 =?us-ascii?Q?Vu8naaBTTrRr3jqMkajfxHH2433kNjVyCUDuYLwUGIy4Bg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <ADE30EE126955D4A9FA507F0AD7BFB06@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6748a2c1-0612-4e83-4af3-08d992873f5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2021 22:33:02.9752 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4CkqJIEzT0wUY6irPXZv44LhndLnakmFm9ZD9tY8EXuYbyA0Z4mJOtPPdoBI3L9iQiG79y1ZeadSLDOdsXom/xM0LqBoxxoT32GVU6hIVyA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8204
X-Proofpoint-GUID: HgEPqO2FJ0MrYxFkoQJzG1eZvFPPPmcr
X-Proofpoint-ORIG-GUID: HgEPqO2FJ0MrYxFkoQJzG1eZvFPPPmcr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-18_07,2021-10-18_01,2020-04-07_01
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 18, 2021 at 05:50:41PM -0400, Michael S. Tsirkin wrote:
> On Thu, Oct 14, 2021 at 04:32:23AM +0000, Raphael Norwitz wrote:
> > The vhost-user-blk-test qtest has been hanging intermittently for a
> > while. The root cause is not yet fully understood, but the hang is
> > impacting enough users that it is important to merge a workaround for
> > it.
> >=20
> > The race which causes the hang occurs early on in vhost-user setup,
> > where a vhost-user message is never received by the backend. Forcing
> > QEMU to wait until the storage-daemon has had some time to initialize
> > prevents the hang. Thus the existing storage-daemon pidfile option can
> > be used to implement a workaround cleanly and effectively, since it
> > creates a file only once the storage-daemon initialization is complete.
> >=20
> > This change implements a workaround for the vhost-user-blk-test hang by
> > making QEMU wait until the storage-daemon has written out a pidfile
> > before attempting to connect and send messages over the vhost-user
> > socket.
> >=20
> > Some relevent mailing list discussions:
> >=20
> > [1] https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kernel.=
org_qemu-2Ddevel_CAFEAcA8kYpz9LiPNxnWJAPSjc-3Dnv532bEdyfynaBeMeohqBp3A-40ma=
il.gmail.com_&d=3DDwIBAg&c=3Ds883GpUCOChKOHiocYtGcg&r=3DIn4gmR1pGzKB8G5p6LU=
rWqkSMec2L5EtXZow_FZNJZk&m=3DeDRDFhe3H61BSSpDvy3PKzwQIa2grX5hNMhigtjMCJ8&s=
=3Dc6OKIl0NMsDqP0-ZNnVjHhDq2psXIVszz-uBKw_8pEo&e=3D=20
> > [2] https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kernel.=
org_qemu-2Ddevel_YWaky-252FKVbS-252FKZjlV-40stefanha-2Dx1.localdomain_&d=3D=
DwIBAg&c=3Ds883GpUCOChKOHiocYtGcg&r=3DIn4gmR1pGzKB8G5p6LUrWqkSMec2L5EtXZow_=
FZNJZk&m=3DeDRDFhe3H61BSSpDvy3PKzwQIa2grX5hNMhigtjMCJ8&s=3DB4EM_0f7TXqsh18Y=
EKOg-cFHabUjsVA5Ie1riDXaB7A&e=3D=20
> >=20
> > Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> > Reviewed-by: Eric Blake <eblake@redhat.com>
>=20
>=20
> Um. Does not seem to make things better for me:
>=20
> **
> ERROR:../tests/qtest/vhost-user-blk-test.c:950:start_vhost_user_blk: asse=
rtion failed (retries < PIDFILE_RETRIES): (5 < 5)
> ERROR qtest-x86_64/qos-test - Bail out! ERROR:../tests/qtest/vhost-user-b=
lk-test.c:950:start_vhost_user_blk: assertion failed (retries < PIDFILE_RET=
RIES): (5 < 5)
>=20
> At this point I just disabled the test in meson. No need to make
> everyone suffer.

Makes sense. Do you still want to persue the workaround?

If so, can you share some details on how you're running the test?

I've gone through 1000+ iterations using the script I posted here:
https://lore.kernel.org/qemu-devel/20210827165253.GA14291@raphael-debian-de=
v/
without hitting a failure.

>
>=20
> > ---
> >  tests/qtest/vhost-user-blk-test.c | 29 ++++++++++++++++++++++++++++-
> >  1 file changed, 28 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user=
-blk-test.c
> > index 6f108a1b62..c6626a286b 100644
> > --- a/tests/qtest/vhost-user-blk-test.c
> > +++ b/tests/qtest/vhost-user-blk-test.c
> > @@ -24,6 +24,7 @@
> >  #define TEST_IMAGE_SIZE         (64 * 1024 * 1024)
> >  #define QVIRTIO_BLK_TIMEOUT_US  (30 * 1000 * 1000)
> >  #define PCI_SLOT_HP             0x06
> > +#define PIDFILE_RETRIES         5
> > =20
> >  typedef struct {
> >      pid_t pid;
>=20
>=20
> Don't like the arbitrary retries counter.
>=20
> Let's warn maybe, but on a busy machine we might not complete this
> in time ...

So you would like it to warn and keep trying forever? Or would you
rather set a much more lenient deadline? (1 min? 5 min?)

>=20
>=20
> > @@ -885,7 +886,8 @@ static void start_vhost_user_blk(GString *cmd_line,=
 int vus_instances,
> >                                   int num_queues)
> >  {
> >      const char *vhost_user_blk_bin =3D qtest_qemu_storage_daemon_binar=
y();
> > -    int i;
> > +    int i, retries;
> > +    char *daemon_pidfile_path;
> >      gchar *img_path;
> >      GString *storage_daemon_command =3D g_string_new(NULL);
> >      QemuStorageDaemonState *qsd;
> > @@ -898,6 +900,8 @@ static void start_vhost_user_blk(GString *cmd_line,=
 int vus_instances,
> >              " -object memory-backend-memfd,id=3Dmem,size=3D256M,share=
=3Don "
> >              " -M memory-backend=3Dmem -m 256M ");
> > =20
> > +    daemon_pidfile_path =3D g_strdup_printf("/tmp/daemon-%d", getpid()=
);
> > +
>=20
> Ugh. Predictable paths directly in /tmp are problematic .. mktemp?
>=20

Ack

> >      for (i =3D 0; i < vus_instances; i++) {
> >          int fd;
> >          char *sock_path =3D create_listen_socket(&fd);
> > @@ -914,6 +918,9 @@ static void start_vhost_user_blk(GString *cmd_line,=
 int vus_instances,
> >                                 i + 1, sock_path);
> >      }
> > =20
> > +    g_string_append_printf(storage_daemon_command, "--pidfile %s ",
> > +                           daemon_pidfile_path);
> > +
> >      g_test_message("starting vhost-user backend: %s",
> >                     storage_daemon_command->str);
> >      pid_t pid =3D fork();
> > @@ -930,7 +937,27 @@ static void start_vhost_user_blk(GString *cmd_line=
, int vus_instances,
> >          execlp("/bin/sh", "sh", "-c", storage_daemon_command->str, NUL=
L);
> >          exit(1);
> >      }
> > +
> > +    /*
> > +     * FIXME: The loop here ensures the storage-daemon has come up pro=
perly
> > +     *        before allowing the test to proceed. This is a workaroun=
d for
> > +     *        a race which used to cause the vhost-user-blk-test to ha=
ng. It
> > +     *        should be deleted once the root cause is fully understoo=
d and
> > +     *        fixed.
> > +     */
> > +    retries =3D 0;
> > +    while (access(daemon_pidfile_path, F_OK) !=3D 0) {
> > +        g_assert_cmpint(retries, <, PIDFILE_RETRIES);
> > +
> > +        retries++;
> > +        g_usleep(1000);
> > +    }
> > +
> >      g_string_free(storage_daemon_command, true);
> > +    if (access(daemon_pidfile_path, F_OK) =3D=3D 0) {
> > +        unlink(daemon_pidfile_path);
> > +    }
> > +    g_free(daemon_pidfile_path);
> > =20
> >      qsd =3D g_new(QemuStorageDaemonState, 1);
> >      qsd->pid =3D pid;
> > --=20
> > 2.20.1
> =

