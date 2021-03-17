Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E49C33EE86
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 11:44:14 +0100 (CET)
Received: from localhost ([::1]:52006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMTev-0006fS-6I
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 06:44:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1lMTcU-0005Rd-Gs
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 06:41:46 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:10628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1lMTcQ-00026y-Tc
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 06:41:42 -0400
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12HAcMDx017124; Wed, 17 Mar 2021 03:41:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=k7lj+gE1r2RNY7zoDWs9emMehniV+mdmE1gGBprgS8s=;
 b=siryVed7F2BdRMPTT0T6IFnhso8RkMFL7IGypC6aJhd9lhADbdDrs7G/vurz1m3L7xIh
 NHdbAou9b78sJ8goVFk2rA2erDIvu21Mq3xyEOxDAMNa5Om1E+MlCkflZJk4iQhmpvMR
 9wU5L9wLe2+lif2ECPyJF51oKq0vh9umo/bD+pwIHEXg3RGYOp+CzyyjYde4HnQ0Yymu
 XoY/L2idmLO5M5/avTSGRiBDdk+fgLX7UQiQNAbLZhUsKhKjCcQeTXO3ANVfDtXrH/F+
 xqHabUHPaE9WKDMOfo7IXssbczHlunrEEkt1JaVE4+Ern6IjCqxmFSTRMHs/iHaPh5Nq dA== 
Received: from nam04-bn3-obe.outbound.protection.outlook.com
 (mail-bn3nam04lp2052.outbound.protection.outlook.com [104.47.46.52])
 by mx0b-002c1b01.pphosted.com with ESMTP id 378utersyy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Mar 2021 03:41:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cijO9OybCu0CUxJZTfIGuwYlGVlhdYspGGNn9hRp19dilzrmlFImpDyu0Z6P7BI0FLLquZRU8ZES9vBFlPioJH9hoRbiutFgmj1lz4MMGxWZzjTl8SEdaW137IUeew1F9rlHcVxMhnSEBq+H/ko5mVMV4Nhxa88yPGr0Z2vYYYWbbj1hncKcv2f/uTbiwD5Wkl6X0P7wqf+OkqNbOEDnZKI645P7e+9YYgZTcZKc5tnAkixJL00+QuTn5iQ8r5Q11NsP4tp7YMSxaAyfJFCZqHX/bW2V/Sj248bMzbLFvcGylDeHLDNyfuJLqDf+u5EZSOF9QxSD2oFWFEhvxmXaMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k7lj+gE1r2RNY7zoDWs9emMehniV+mdmE1gGBprgS8s=;
 b=XdSeHZp1FvOYu1cg86/V6/zv1QEubU+7asrVC6M5+gvFQIZwAKE5a+bPUYftFU7ciqezcC+echbysZPaquCTcaJif4V3csPGBmLq0iqMKkjGp8wgfWIKcEUGb50OqLjhwKpj7LzNvurrbv70/sNE+MLbuQRriLbCZm8eTtiCUDgLZZGJ4J9jcKtLsZr/+7Qx6uSdfy3gBZWycoa9BNi29FJ7fHTP2X/3QiuaLtnI30eDR0dQMwg9wawsoXop/uEc1cZRP2Z9xMEYVEPZpuEkJXRU6wXsBP1WprCsZRPu/mUl0oYHXMpk0BaNT1BWSU2IA/oAJ0KvyE1go9koAaaNNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from MW2PR02MB3723.namprd02.prod.outlook.com (2603:10b6:907:2::32)
 by MW4PR02MB7235.namprd02.prod.outlook.com (2603:10b6:303:77::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Wed, 17 Mar
 2021 10:41:32 +0000
Received: from MW2PR02MB3723.namprd02.prod.outlook.com
 ([fe80::140e:841f:fd3e:eb3d]) by MW2PR02MB3723.namprd02.prod.outlook.com
 ([fe80::140e:841f:fd3e:eb3d%4]) with mapi id 15.20.3912.029; Wed, 17 Mar 2021
 10:41:32 +0000
From: Thanos Makatos <thanos.makatos@nutanix.com>
To: Gerd Hoffmann <kraxel@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>
Subject: RE: Half a usb-redir idea
Thread-Topic: Half a usb-redir idea
Thread-Index: AQHXGo2lp1KrCtGWa0WGNJfkkcq5dqqHtyUAgAAumYCAABJwAIAABl8w
Date: Wed, 17 Mar 2021 10:41:32 +0000
Message-ID: <MW2PR02MB372382DC9A56471C89ADBD458B6A9@MW2PR02MB3723.namprd02.prod.outlook.com>
References: <YFDo/oHikOEcXFcg@work-vm>
 <20210317062404.bkl5s4qmtaeg2yeo@sirius.home.kraxel.org>
 <YFHHm8CWwUUc2B7o@work-vm>
 <20210317101650.2jyc67vy7y7yasgo@sirius.home.kraxel.org>
In-Reply-To: <20210317101650.2jyc67vy7y7yasgo@sirius.home.kraxel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-originating-ip: [88.106.77.121]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 831858a4-0fe1-4d51-e8dc-08d8e9313aca
x-ms-traffictypediagnostic: MW4PR02MB7235:
x-microsoft-antispam-prvs: <MW4PR02MB72359DF7BC3671E9BFF850B98B6A9@MW4PR02MB7235.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5Klsy+R0RkglG6HoNRMen2zT7ahlJR7imE1uyWnWuyf8UB4aDTjTUC93TcFyLqMqWFvuI+BxkWxqzWjgGvYtptXhDozpUlPwnJrt5gGh/dD9ZQp1F9zvncz9SEEBjpbFFaZZrLdtYaxVLqAhgxNgiW4b5tkuEADdAxmPJ6Xd1r4SZiyp/K5zCscATMM5qTmRbKelB0n9HPUfivlZGIEcPRiybESRoYEyezo/q5wv5cPI4bSPB9+Ss2VIcunpkCGwu7OmV4cX7ROReAyfw7BN8KjkaDoEdFYkNkXCAgvV3J+DGDX/A6AVZeLcylbKyxq+o/E6t0tNFBjg3m8EjvnrH/Dy5NOMdcqiuYf5qxnKm7U9zgR2/+0DgXxVvlsQlXuUviXpMLK/zUGXS9Wg/+3RqgKogijgqRshIzqrpyF1aQhrhtUZtcdhJyNi2/jyLOjlUvveKmReucJmsFuidNDC4/z6t7CA33/ORWtkem62u6ikCf2WfcmuuCL5sVvbv5eE2VdEm6uChxq2REXT8xfqPCUDLR1idEdtKw9+MBez9SVyJECDTk0Y5EXKVvepnbAH
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR02MB3723.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(136003)(376002)(366004)(396003)(3480700007)(4326008)(7696005)(6506007)(83380400001)(9686003)(478600001)(55016002)(66946007)(8936002)(33656002)(66476007)(64756008)(71200400001)(66446008)(44832011)(66556008)(8676002)(52536014)(53546011)(110136005)(76116006)(86362001)(2906002)(54906003)(316002)(5660300002)(26005)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?SBK1P4Av07F2wUMq19UIFDQ4W1WXR1mwRGEU902vykNT9mlVFmnL6TXVdfjM?=
 =?us-ascii?Q?LryZAzr7JotSmfclN/lT1c4I/We5qOnxpa/v0XMBMvEuhAuk1EP12gIFl5Yq?=
 =?us-ascii?Q?4DBAZNYmkZibh0n7EaRcNqZAF3tIWg0f5up9sn3Ehj7FF5gyUr65XzaUqUEI?=
 =?us-ascii?Q?+OaWXck/pmaLLNvHU7unIpo1T/WjjXGZrqksZ6b534F/04QujIj81z/PATjp?=
 =?us-ascii?Q?zgfiuqGIodWFRSzQw/eyYOJZTZJzk/ymUNPf2XP8yRxBYNTD6nLKDbcP/7Yu?=
 =?us-ascii?Q?aqUoQdAQWKDvP3oahYHayL39WKK6g//qw1dzIPbX3+O62XmN16DDEeB4PBPI?=
 =?us-ascii?Q?rW65VH8AQdvPgebFpXvQPN8QoscaDOPwFg0BrucCyVz2Nha/saYDebjsbW3O?=
 =?us-ascii?Q?duzcwHE4C2DN73ElpJN5WZag9ELGDfjgLOnLL4atMwWdOPHOjHyL9Q+TyAjg?=
 =?us-ascii?Q?1mQTQ2/AINA1OGTEPcz4OU2akdIJ7hoIBg33/sxIahaB5Dc/mv5yAk8H8am/?=
 =?us-ascii?Q?DXBq3oVwL4IpjOdlRAtr3eQLO9Z0hnYIbMxfNmgbTa0alyqxsw6izkFbtI7v?=
 =?us-ascii?Q?zIngOJQcGZjyuDZI/FzV1viXKK3wq28R4WgzJ+75vXr4+UL6Pd3ZRUNYnB2w?=
 =?us-ascii?Q?PkNhX2uB2h1OIr6RU0ynzNY/UqEyK+CnGc1Js5BYlrd+PMU5RCH7lWP+kpAK?=
 =?us-ascii?Q?RwO/RfvLM3toOnS3BoNXeq7ziIyx9uUO6BhQWtRK5T+ZR1Zp0s0uH6OyP+FA?=
 =?us-ascii?Q?Jx/VTuGZMr2jtrde2VmmmLMPY26cXQfUgdnYCRFt9T+IEuLeELIkWBvSUd/C?=
 =?us-ascii?Q?9FAvxnuwS8gfhLgZQ36T4A1QfJ9UFiCFtrTlminkOQk05inrkiJ2uh9YU16f?=
 =?us-ascii?Q?c72G9qzKhfUX6U6DFcumq3DGTGjfShd4mzqnK7WXCyJs+hbhTGemcpjuT+LS?=
 =?us-ascii?Q?zFSTujGdvvoBbdPNN0smKmM96CyFBCKqwpf5T5O1IT2Mcu14GKt5CXYDnAaH?=
 =?us-ascii?Q?L4UIqL5gVlqM2xjj+oKzJIjeaNnseitKV61VtK6eCg/5KOYHk+/ItPjvnodq?=
 =?us-ascii?Q?MpQSFP4SIswt5769vDeuFJpckwarxRQZB6N8MDFpL2mTOqXAGAeieAVQ87i+?=
 =?us-ascii?Q?lmPuWfhomxwNH9F3IfIPAzgW7xsm6nJREKzNtQQXDcC0Fy4SOPV7w2GsvUGS?=
 =?us-ascii?Q?4NrCqu2UD85Xod17Ojao3FIdX3G+0z/s5eQXcV3cvTRsZbmvKJVlXf/f3GTX?=
 =?us-ascii?Q?G+fZ/XREmuxuYch+HZ1B/sc0z81QAb/Y6bxr488qwf4Dqb7yQRHLWrpVfTHU?=
 =?us-ascii?Q?T0uI5GKwkdeL/PUKmsfTs3xQ?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR02MB3723.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 831858a4-0fe1-4d51-e8dc-08d8e9313aca
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2021 10:41:32.0681 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rLA0CH1+Q/tDJ90zcgiahtkyJb/0m+wcGEsaEOB+q/W26oodga9AVe4tQhNwQkOBDpwg/bAxvCvSTQN+y37QkVljePCRRTFD6JVwLhiGEnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7235
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-17_05:2021-03-17,
 2021-03-17 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=thanos.makatos@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "berrange@redhat.com" <berrange@redhat.com>,
 "victortoso@redhat.com" <victortoso@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Qemu-devel <qemu-devel-
> bounces+thanos.makatos=3Dnutanix.com@nongnu.org> On Behalf Of Gerd
> Hoffmann
> Sent: 17 March 2021 10:17
> To: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: victortoso@redhat.com; berrange@redhat.com; qemu-
> devel@nongnu.org
> Subject: Re: Half a usb-redir idea
>=20
> On Wed, Mar 17, 2021 at 09:10:51AM +0000, Dr. David Alan Gilbert wrote:
> > * Gerd Hoffmann (kraxel@redhat.com) wrote:
> > > On Tue, Mar 16, 2021 at 05:21:02PM +0000, Dr. David Alan Gilbert wrot=
e:
> > > > Hi,
> > > >   I've got a half-baked idea, which I thought might be worth mentio=
ning.
> > > >
> > > > How hard would it be to give qemu a usbredir server rather than cli=
ent?
> > >
> > > The usb part is probably not that hard.  The devices are not
> > > standalone though.  Tricky is the integration with the rest of qemu,
> > > with the input subsystem (hid devices), chardevs (usb-serial),
> > > network (usb-net), sound (usb-audio), block (usb-storage), ...
> >
> > As long as this was still the qemu binary would that be a problem?
>=20
> Well, depends a bit on where you are heading to ...
>=20
> If you just want move usb emulation to a separate process (using the mult=
i-
> process qemu infrastructure, or using something like "qemu -machine none =
-
> device usbredirserver") then no, for the most part it wouldn't be a probl=
em.
> You can just add chardevs, netdevs and blockdevs to the usbredirserver
> qemu process then.  input + hid devices are still a bit tricky though.
>=20
> If you want refactor usb emulation to move it into a library and allow re=
use
> outside qemu (see vncviewer idea elsewhere in the thread) it would be
> more of a problem of course.
>=20
> > > ccid and u2f are probably easierst.
> > > mtp should not be hard too.
> > > maybe storage when limiting support to storage daemon.
> > > then it'll be tricky.
> > > maybe the multi-process qemu effort solves (some of) these problems.
> >
> > It doesn't handle remote does it?
>=20
> Not fully sure, but I think vfio-user depends on a shared mapping of gues=
t
> ram, so no remote support.

The vfio-user spec allows for remote support, but it will be over a socket =
so not particularly fast.

>=20
> take care,
>   Gerd
>=20


