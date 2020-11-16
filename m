Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 227EE2B3E1C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 08:56:48 +0100 (CET)
Received: from localhost ([::1]:52868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keZNW-00027q-OX
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 02:56:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1keZMA-0001KA-Q2
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 02:55:23 -0500
Received: from mail-bn8nam12on2079.outbound.protection.outlook.com
 ([40.107.237.79]:26048 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1keZM8-0006CI-8D
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 02:55:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dGuFVWalTisENQJ+wpaY6fvJaX//rqQZHeCZXLTAK7NsvL2zJHqNghMKx4muXOt0QrRYxWBVNY0EMd7Vf4CAkN80t+zkc2Ix5BjGtrNStYyRz5m+cAajb6oOiYhU63lxTFYX1guJLjkKyzwc53V+n0SXYPqA5NeLLBrJVlzu1af8oW6ZKuf2OzCHrZf8KweBvyTk2Md3uQxXF6rdQmToVQTnI9jKY5giKd6kEFlfV8Mz/i0uIYEwOKJbcO6OgzB4DuhrENzgyiLRHXRCGjXKVg8RI4xixqLolBbRXgMr3nfotF8NAGDAUzdgOiMp940tYyDKgCvHctU68Ejnwa9aOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4WnAlXM0bKExUsK35HrA3+kejPRuu77aqd0Ir+kQXXY=;
 b=PvhoY/sBaG8GORxX9bcVse/MPVRVvO3PG31GcPpxnGqWiwjX+APDydtHQ73vYklaNHtF1HyQa6JvA2pZWpMQC1skBTvhXf9w+XA4w10W498PcNhv5Uhw75TxeCkfQyZ19ysvECRIHDV5bCZ8famESEjJl+Ta8DPaUzZ0zRmrBWTa4Pu/6SaVqyVSoU+5RsV9KaAX7SKeJrOTHorxhRSO0/EbIr4F5dYi20gGQ9O1mTxboA7aijyHMBKK+u+LbcfFEqE4x63yU1VKMoqLdGbaVUteXQTKfxoWtS6ZKtwkeDXcOXWIsFDOQ8dVof3OglLMvf+mNZP0ZVEu/MQ/dikEsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4WnAlXM0bKExUsK35HrA3+kejPRuu77aqd0Ir+kQXXY=;
 b=eVQoO28hlbjYRR0IJIzaOOYbnpJ/P0fAxJOM8WDaQ2Cmo9B6CRRg5C2n6paVzBAvdQfzK7G9Jm508qaXzpG4xpV9jl0pd1Cf8CTjAWEGKowxAy5tx3glPgZ2XbdDBBFEKIaTnbtTihBadoPGuHFRUjYE+bcpcmhv+L1ypDvwfe8=
Received: from BY5PR02MB6772.namprd02.prod.outlook.com (2603:10b6:a03:206::11)
 by BY5PR02MB7025.namprd02.prod.outlook.com (2603:10b6:a03:238::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Mon, 16 Nov
 2020 07:55:15 +0000
Received: from BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::75ed:4271:263b:fd15]) by BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::75ed:4271:263b:fd15%3]) with mapi id 15.20.3564.028; Mon, 16 Nov 2020
 07:55:15 +0000
From: Sai Pavan Boddu <saipava@xilinx.com>
To: "kraxel@redhat.com" <kraxel@redhat.com>
Subject: RE: nec-usb-xhci migration breakage
Thread-Topic: nec-usb-xhci migration breakage
Thread-Index: AQHWuE5pWzwvtuxFgkaiq/cAd2w4p6nKPlEwgAAeWICAAA4esA==
Date: Mon, 16 Nov 2020 07:55:15 +0000
Message-ID: <BY5PR02MB6772C6DA3E356FF4F444EB3BCAE30@BY5PR02MB6772.namprd02.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: a32f6b2a-a866-4dc1-88e3-08d88a04f43c
x-ms-traffictypediagnostic: BY5PR02MB7025:
x-microsoft-antispam-prvs: <BY5PR02MB7025BE2D46D0EEADCB092E4ACAE30@BY5PR02MB7025.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NGwOUEvxg51hcpLX2XvJ1Xp1xUYqDJt2UHCP3wdj+QWQ+eBkUITL9dnkO83wQDIYijFBHv/4WCR6sKgu5JUQtoNYIqgHxbT22LZi7fxvDvTCTxIpPRegaS7dXpgRgR4gJwnjIMe1GpNnCn3JNJOVaCrzHcO56/akfv8mcDYdNb1VkFFar5X2Aljneru0MvG62c7pkjCSX6yf56y7AjB/0FkAT9wwPNY40FQWWegh1JQroajYwlUIF2Vam3SDOnBb2RrSwOSIdVJlflDmLTYSyx7h6ACEKBn7pHVL1rbnl/vgXRAvAI5/NF7I9g8w5biayP2n2U9RvvtKPaXi7YRtsQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6772.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39850400004)(136003)(346002)(396003)(376002)(52536014)(7696005)(26005)(186003)(66446008)(66946007)(66556008)(66476007)(64756008)(76116006)(83380400001)(55016002)(9686003)(6916009)(53546011)(6506007)(33656002)(71200400001)(8936002)(86362001)(8676002)(5660300002)(4744005)(3480700007)(54906003)(316002)(478600001)(4326008)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 03OP7FTVKt0BafloDncB6Fj8ygl7fI/9ut1i8LH8zd3qtlJqE8Imba+gT+FkcWxQyoOsGa50hl0s0P9gA1gYPPRV2fEh7lD8ClCV7EzS8jRe6tM3h8CEZ1aGQJ21tltBduMd5Y9owNt+A/RwANZWm0llCuY6j001NlLb61287mzaSnesG8QFkpyctIYZCfZcxfS830mQtN1sm66hKLfdk/k6dI980WftB0dTGv5xsHNQAFnzDqw84CqyoJrMUmxOPCmrPuGpeBjdpCASkN3Kj18DF+5lfRVz5HTrNl7reQe6cc0GNTqWelT0vgY70Kfvm1CdBAzqyAOaRU/FmvvxjqDVqrM5jSMEDD4PIGJ38TyV/ka8iaKNmIFCpMSZjxDaK1XkP+3rzNIKFpjlxuvGzyf6Z4uE74iIqNtncYe4lLwJbTPJVLoB98zVc7MPRH3SGIDxTUH8P4l9nu41f/sAiqh9f6MxqoTtEDJ6tLBkZz2W2p1VnhApgvaSSqDaSPS+tI7DagJzPzD1pESV3D++qgLpd71mSsdQ1lDOuBuzSLx6tHXo0rg59hsa0h+PeoPZKzNixuiNDA58J/JVOqnOtlgp3Jcu5OHdvHVqecEuvftOwr4TYbKH0NXT0jGpPKQKIBV8P1FnW0eXZNDbqt9R6g==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6772.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a32f6b2a-a866-4dc1-88e3-08d88a04f43c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2020 07:55:15.3900 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0EVhu1p6YQ4iwIlClBwgUHH5cjGFZqSpRrvWUPoHQuh/QeuCcyB4r4GRezpZkCJwby7SvmDVGpH64WTu4N+Tqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB7025
Received-SPF: pass client-ip=40.107.237.79; envelope-from=saipava@xilinx.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 02:55:17
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

HI,

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
[Sai Pavan Boddu] I went ahead and test this. Works fine!

Thanks,
Sai Pavan
>=20
> take care,
>   Gerd


