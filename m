Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F30822B3DA3
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 08:28:17 +0100 (CET)
Received: from localhost ([::1]:40622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keYvw-0002we-JX
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 02:28:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1keYur-0002XA-Lv
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 02:27:09 -0500
Received: from mail-bn8nam11on2074.outbound.protection.outlook.com
 ([40.107.236.74]:10913 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1keYuo-0004iJ-CB
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 02:27:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P627Z+H4ienGk3ntCiM+0unN57beZgwWJAYFoesnhzM+UdpeYpDcQgSOvKxspdqmNrA6fcPyukgf63teU1F/+efRNOftBfTvCLuBhvk/+wtD9KyexTsz0wermRJraVjyagQ9gwCGmHDtVk/AwBv3ccsA/m6JwNcTlgCRhqZT61JGuy2j2AOBW146Npeclhcb0vERsyetuIW+mHA3NuVN1q2GzXgCN2ml3ujWIMi5Fw9K97czHcpHivaHry3SHjtrs5rt9y8tk9bINCmu27jVJQMq4Nyzbw2ipAqk+EvMgUkVzio6ba3+XLKJ2MFAauctOPNY14jEZvnZ/bxjtf6H8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQDjXsHzdmT1S8W5q0kxJL8ivDwk6Sx/2Njm/3vnDCY=;
 b=Q0caOKvISGXU6xddyyLMx2UIZgIt52xpGOzSqUU1vD5MzPrJApXY9Aqm9VgRJd662Z8jIJtZ30AwNBBULWczitSCCdqgXGglje9xjlgwxGRVqblQSZKhhhTpRAS2+ti1SESfeLeTKT3K1nlC1UkvCU/xGkPWTec+wwmfcUmPkJSNzSge6qxA+gyvCFBuK/k7xvkhz8jWD60g0F+7Rkj1sQGv1MwZwn1ltCjHU6x4wzgTkKQ0B7deKgS4+rYqET8jNh2JeAhrdorW0jBhK7Y4x8vUCriHn0J6oDvY1lg34cRBJrzHSERJ/yTzzqQ7SnqatWX+gtRRGXnGiGPMrWhjLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQDjXsHzdmT1S8W5q0kxJL8ivDwk6Sx/2Njm/3vnDCY=;
 b=B5+2S8nSJET4LDKyu8JK8Bgp+WL9FyB39i5jJ/XYrjbAN44TIRsasaECzoaaSNJaa2CtmQ0DvRl0ryIVVqmYDEdQ9TxthAWA0bKguzYyKVrU58IRctC09gZyR/yVIZdSqiM4boJgEHtDwn664uVFTziCaFyadHJWwGp2PvYpFAo=
Received: from BY5PR02MB6772.namprd02.prod.outlook.com (2603:10b6:a03:206::11)
 by BYAPR02MB5416.namprd02.prod.outlook.com (2603:10b6:a03:a4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Mon, 16 Nov
 2020 07:27:03 +0000
Received: from BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::75ed:4271:263b:fd15]) by BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::75ed:4271:263b:fd15%3]) with mapi id 15.20.3564.028; Mon, 16 Nov 2020
 07:27:03 +0000
From: Sai Pavan Boddu <saipava@xilinx.com>
To: "kraxel@redhat.com" <kraxel@redhat.com>
Subject: RE: nec-usb-xhci migration breakage
Thread-Topic: nec-usb-xhci migration breakage
Thread-Index: AQHWuE5pWzwvtuxFgkaiq/cAd2w4p6nKPlEwgAAeWICAAAZkoA==
Date: Mon, 16 Nov 2020 07:27:03 +0000
Message-ID: <BY5PR02MB6772C25B99007B278480A11FCAE30@BY5PR02MB6772.namprd02.prod.outlook.com>
References: <20201111171622.GI3232@work-vm>
 <BY5PR02MB6772B2DC08D1BAE7994CBA28CAE30@BY5PR02MB6772.namprd02.prod.outlook.com>
 <20201116070351.xafwshgegr224ylh@sirius.home.kraxel.org>
In-Reply-To: <20201116070351.xafwshgegr224ylh@sirius.home.kraxel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [49.205.235.17]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5eba9391-7cf9-4f6a-3640-08d88a01038e
x-ms-traffictypediagnostic: BYAPR02MB5416:
x-microsoft-antispam-prvs: <BYAPR02MB54161D6661C237E68DC2E9FECAE30@BYAPR02MB5416.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NGGZ/GVLnyr+T2srKO5X7wRCqy8fnpwJZWszGI094aM7Zy4hmVolfwCLRt8Kk2Ex08G5R/c74znOxrlSbZXK7dr4O73+/z70YHu7+jGUcC0cyOt50WU9NjOskhbPQK4dIKop3hj8ailSMsebiCU4MsalFSd7Evss2TIHYGxweBLGROx5UutHt+O4nGIciYRx8OKn0h3ZeV89O+b6ekXeqS7aoU9LLaCnJ7Sp85t9/63YHGCIdU+OxT6ujunSLy0WmVL3eazRotqI0TVZMIQQFchzlqPFzUkAweRHsdQF7517x80IuzwWlIivZuu/p72qJOkTI1SNs/RRMQmiHn9JgA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6772.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39850400004)(396003)(376002)(346002)(136003)(71200400001)(83380400001)(4326008)(9686003)(55016002)(8676002)(7696005)(478600001)(86362001)(33656002)(8936002)(3480700007)(52536014)(5660300002)(4744005)(54906003)(76116006)(26005)(66446008)(66946007)(66476007)(6506007)(66556008)(53546011)(2906002)(64756008)(6916009)(316002)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: q7DvhPe4btobbIa+JJXUYOudvzDkWei2YqBy2Dceopgj8ahtAzxWsctCaIc7aX1rgTJb1FacRr4zyvGbjIo+VMovSzcGe/KFCZqpPsHqjrGsHy9T0Pim1wd9s2qhbwC0oMoDPPjyvWG5pb3TC2Lr81itrnNyArq5W6A76HDMSFh7pYkiCLfolNRuwteyhNbrz/fZGdiMhIIDnz2X8RFSHLW5TgEfJIWrxv/Y74n8giPLVhOQzYeqZD3AEblmL3pnkYd5PkC3KW6khIjLGWYPuVc8/w/fJBxEGcw4yK8Ax8HzacfW+FlqTfd3bs8iBrg04dTSv2KTdsIxLv2teGtiQIpykiYZgFAledYoF9JCVX5zShaEJaPcFKndAvOsbgf9mR6NIChGSDMu2+BsRYhN8Hh5N73ZbVbPP6NzQS7jXwN8LWqeLoN5tVAc8j/ltXu9Rq5bVvZzxhCVQ3Sjo470QWUKhvo+WydlzD0PYcW2gm0Sw6snDPlTn3gPRfjm8UeUn8AWSVWR2xatynr6qL/b0oFWJ39MGsPy9b7ZvlU+MwZPSjjwvhXTrrJ8cHwekytHykwr4ALlyPgASGEMbFdEdyfM+zTAioFoq87nnxZe9Ga4V+ONL51hnXQQ6QedLLhk85FKg6rf1ZrTjaHHD5L+wQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6772.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eba9391-7cf9-4f6a-3640-08d88a01038e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2020 07:27:03.1012 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s4D4Z2l1oG4I9g/9WqiZZfTt9yu2vaVnmKvJwyM6DKqDtmd4OwZjAOtQ18gnLHi6xY0c89Vk+OMvD4uTguvaow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5416
Received-SPF: pass client-ip=40.107.236.74; envelope-from=saipava@xilinx.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 02:27:04
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
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
Cc: "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks, I did not observe that.

Regards,
Sai Pavan

> -----Original Message-----
> From: kraxel@redhat.com <kraxel@redhat.com>
> Sent: Monday, November 16, 2020 12:34 PM
> To: Sai Pavan Boddu <saipava@xilinx.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>;
> marcandre.lureau@redhat.com; qemu-devel@nongnu.org
> Subject: Re: nec-usb-xhci migration breakage
>=20
> On Mon, Nov 16, 2020 at 05:18:22AM +0000, Sai Pavan Boddu wrote:
> > +Gerd
> > Hi David,
> >
> > Sorry for the delayed response. I was able to reproduce your issue with=
 nec-
> usb-xhci,  in my previous testing we have tested with qemu-xhci model whi=
ch
> was good.
> > I would look further into this.
> >
> > @Gerd: Do you have any high level comments on this ?
>=20
> Already fixed in master, see commit
> 172bc8520db1cb98d09b367360068a675fbc9413
>=20
> take care,
>   Gerd


