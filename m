Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 646703E16CE
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 16:19:37 +0200 (CEST)
Received: from localhost ([::1]:33994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBeDg-0006Xe-Fd
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 10:19:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Sriyash.Caculo@amd.com>)
 id 1mBXqk-0003pp-Lg
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 03:31:30 -0400
Received: from mail-mw2nam12on20615.outbound.protection.outlook.com
 ([2a01:111:f400:fe5a::615]:28928
 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Sriyash.Caculo@amd.com>)
 id 1mBXqi-0004aj-An
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 03:31:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IrVKMJu7YfyI2YowbAa+rglKhg9ZDYbKm1AeOcDU8ld+kc7j/yUqRH2mYcsf1Ll8OUJWtmMwJXV07WF4HkODg1KY/LMOL3YI0YI8chyPb0d0Z5XORrgILrfDmnTdxiyo6Y6dDBbDS5TANDzKfnPa58/sWEPHOICeJb6SFen/1KRixnxeLRktq1yMpfsXC625YMmlMKAkSvWROPwpbm769yoHRyhqlq6yc2OMByc5CsU62EbG5p11HjfqsJC2YE0Prng5WZ2VrKGSEoBXxbZbzF6yzc8F3BLeMhhJ4bOgavYSEe5qtG8GRfUDArkbE7I11X6xHH5HRLr/BoBS2HogZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPxGUROAYg0t/12a4GBsxKPKhWZw9ZkvGXA8tfoigEo=;
 b=hRS33nyWGZpHR3X43lwpLa/CVdikEqVaQ/l9SN0ID+o+/TkfJH4jFwQoFaXLyJrtxoPU4cRcNQ7yNcWKvRHtkfajJRndg4jN0UwztcrMHuj+WrZP5WQ/VpKeXxpyqy1T8kdtKALX1sNEskQnTNfOKFEPoeCB9tkUMQe24ieAuDa2oC2YNDe9Aoa4nmtjAJcsb7Ck86CcwnitNi2LGjcFy8EKbW6zrCa3Nk3zvF6wKqRom067WDqu4vCBR8b/f/0PZz9inzLO+AgRrmYj+/QmdKFASoHn5ssJvMFfZ2N/praUdJS6SujFBvGuCWOYoIsVOcARFwRrwjF2Tbo/MB/1wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPxGUROAYg0t/12a4GBsxKPKhWZw9ZkvGXA8tfoigEo=;
 b=CLTBmlh2q9A0cLHab2mhxji1XGsMbVTjf1zR5XnyimUHbstxDqueHLgUPFDvOoVVrkGdOyYJB6mfHq3+Zr0GntHxZuW95PIH9jAs3RcbnLi+uBG1IZ9FjqKDW7nCvQB6gEvsIhI6P7zci2+MiHNXfAkNV1fr2TmBrijtM9purZo=
Received: from DM4PR12MB5216.namprd12.prod.outlook.com (2603:10b6:5:398::18)
 by DM8PR12MB5399.namprd12.prod.outlook.com (2603:10b6:8:34::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.21; Thu, 5 Aug 2021 07:26:23 +0000
Received: from DM4PR12MB5216.namprd12.prod.outlook.com
 ([fe80::203e:4c4f:677e:7cca]) by DM4PR12MB5216.namprd12.prod.outlook.com
 ([fe80::203e:4c4f:677e:7cca%4]) with mapi id 15.20.4394.017; Thu, 5 Aug 2021
 07:26:23 +0000
From: "Caculo, Sriyash" <Sriyash.Caculo@amd.com>
To: Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "chao.gao@intel.com"
 <chao.gao@intel.com>, "mst@redhat.com" <mst@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "dgilbert@redhat.com"
 <dgilbert@redhat.com>, "Huang2, Wei" <Wei.Huang2@amd.com>
Subject: Re: [PATCH 0/3] Disable vhost device IOTLB is IOMMU is not enabled
Thread-Topic: [PATCH 0/3] Disable vhost device IOTLB is IOMMU is not enabled
Thread-Index: AQHXiOOTN+umXJHqJUiQaEuefABqv6tjhDKAgAChWwCAABbkAIAARv/K
Date: Thu, 5 Aug 2021 07:26:23 +0000
Message-ID: <DM4PR12MB52162C7953DB2A87C7B5B5348FF29@DM4PR12MB5216.namprd12.prod.outlook.com>
References: <20210804034803.1644-1-jasowang@redhat.com>
 <YQq7h0OWlmQ+mX8z@t490s>
 <b401ebf7-9352-41a4-6cce-eada140d4d31@redhat.com>,
 <YQtWFvHThLTILA1B@xz-m1.local>
In-Reply-To: <YQtWFvHThLTILA1B@xz-m1.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-08-05T07:26:22.842Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use
 Only; MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard; 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ce296ed1-69da-4b29-9303-08d957e25407
x-ms-traffictypediagnostic: DM8PR12MB5399:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM8PR12MB53996EB838343651DB20373F8FF29@DM8PR12MB5399.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hSRnyE1XSrq+CZ3JthuNM57WNRbzYkEevbViCbo0zdPpGvqHyVEbpiN4yaawS2fSRd3bmvi7+PcJNUa1rVfZckryuOHSw4Y4kc/Nu4gqhJ4A208N8ws3OttwKMbNh3v+VxPAIm++i1vVGIe2KVHLzUBbOlLDPpgwlM/uM0EYrQugqVoQJJ+tA7FngRYdxiu5lca57CF7Xof6+nn2t/UJ8Fa43IiX1j9ufOXgOkL+LbcrXU6mwIZWJV3j0uAWqeivuo+loCWzHdNCpNDPLqhQ+CLlOjt8vbt3qFY5rLyofPtZgLD0wLIojDWvUMTKOZ0U31HfeuqzeDyISFRSn8DQRFgs+mwF0p2gSN2y88MaqrM3QB+tISHoc+7mqCgw46RkD4751mNa0UdWasayRDE6ARt8K5PiyniideUAncM/v5JqYGyLBd5h+7QuPOObZhiLh7WzKBRm+Ii5orAv6XFNy5Sai85a+cPuRqx/Uw3JFVDVyLMSy18OFhJIFc22CueEom2h5zv/IL7rmFTYn3X+/StvEZyriR/apw7/RzZq/vxjYKrNXgt23bo73T5DZYoEvOCwp+3mfEJYvq5MK+YbcfgXZSNUIdsOlZyNZZ/mXHpavxo00PMOvOPgERzNxQY4c5G+b91CxSIVWUh18o9gPkDZJKy9KarFX5XUnYkKjqidQEF/UNX1eXVcUDryYg58SEMtfoWu0auXXUxC7S5VHg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5216.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(55016002)(91956017)(76116006)(186003)(33656002)(66946007)(86362001)(316002)(66476007)(66446008)(66556008)(64756008)(9686003)(52536014)(8676002)(4326008)(8936002)(54906003)(7696005)(71200400001)(6506007)(4744005)(5660300002)(83380400001)(53546011)(508600001)(26005)(2906002)(122000001)(38100700002)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?C8P28YDtU2L8eFPwaMmXv1ote1fBzWziI6np5ANqZSk5wjaB38carTwuyoOQ?=
 =?us-ascii?Q?ASuMDmGGZfFlOHWCuThoyCuJ997dkqCnneVUXITsdTy5uVQW63dftBc+eBHG?=
 =?us-ascii?Q?kkPQ3s0mJcv8Svong3zq+U4sn7sSK4NKHjz5tUMPb5MVwSqnKtW2G8tfS267?=
 =?us-ascii?Q?Dc48ZjGb2ZXPrjv9fafOoCqQJGxxRahciZ3p5CFers8kSJgkSrjcPBSUsdVr?=
 =?us-ascii?Q?wPtxF97oAaLwGqApmSdf97juEL/Y+O9WUK/IdeNdvrztVQvUuoQeryrmnKg1?=
 =?us-ascii?Q?UM1VHxRjV937E6yPj3rdCtW584Z0i5unUDddXIAm0Ej2ctTXB1u/dWkgrBRh?=
 =?us-ascii?Q?9BQ2m0ZqqxzwM/ZATuNtW2HM7n4aC8Tt3ToXa1njrlB/S+mnwTe5NTLrIq78?=
 =?us-ascii?Q?ml+uhpRYie41Gyj7WX/Yo5QdXVZ5WhSHRcfz/RvR7Qo8pTrdZ3LiqdPze3MA?=
 =?us-ascii?Q?b8tWxmsYos+pNWorslVGBwumwmzu2xf5gFyy8Syau369jATtj/U0VOF26Py9?=
 =?us-ascii?Q?5F1wRNR4jYVz3SoEbcbQ3FD9BxmP+WAtA9DBAhL5buVlMh698chEshhDTf9a?=
 =?us-ascii?Q?//V4FyJLuwgXAAnhw9V8NQN83siIxAG9rApMJRnre6zK8r1EkGmo+1du6vU3?=
 =?us-ascii?Q?7VddRkk2kJyBXDfxupTz/2nMY1k1d5LbPtNKMsYH9p7svIekkMajh4eEUtEt?=
 =?us-ascii?Q?+RHL44J2+wRcpifQtGb1s5pU+gR1mqa0ouyxjLb/R2xxbJFamgrfKJM+1o64?=
 =?us-ascii?Q?IdsKd+SHE/mZfHoJbVZhlO34+sw0sqakVOUmxJvmVOdwIX6Gz8D7SFBpRGfN?=
 =?us-ascii?Q?8RaKjk8br64jRddVk9YCYcwkZfwhF2FAtREAl6XIq4Z7HRyoBnf/6BkyFe9x?=
 =?us-ascii?Q?3oR5eZr/gySOE7xIP3Um20Fo4kRbAWqNAQvSLS6tDtryABH6I83OiVCqOElT?=
 =?us-ascii?Q?tXm1DKNlQCPoEWE3MzdwjWUUlwI7i/RwYH5zh0yFKwyVtwvR7GQrCVZB7s0l?=
 =?us-ascii?Q?3T0n8qFnkJ8yn8PAyxNNYYXcTouDRIRLUAN2kWqQT0yTXNOc3lksiJ/HXXhU?=
 =?us-ascii?Q?Q59qPNtV8mUMKTvdqovjsByW6vAdjhvPmKHWO/YBZwCyrmVBavqSigGJ4Q57?=
 =?us-ascii?Q?8/aZHGhTmGuQLBsADBdntg5ggykOa5XX2+inTess4ee2h413NGZzM8Wes08F?=
 =?us-ascii?Q?rHAhdFzbTTjnZYeOG3XVLH/EdLbsy1CZ9bzGWHjG4ESd6I3XKLTYJtX7ii49?=
 =?us-ascii?Q?7FYG/dW7kIUp8sQNSQKZSifseBWPMzEPPnynJbl3DBMzepJgL2Qj0Vs8nRvw?=
 =?us-ascii?Q?Gu0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5216.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce296ed1-69da-4b29-9303-08d957e25407
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2021 07:26:23.2488 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AVpsneRF6quRDagUN/GtptvR7Y++7W2VthkaFiK2fPlXk1bWbt4M+o6m+uFg0/lClm/vDV4saRoouPbfBEPftg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5399
Received-SPF: softfail client-ip=2a01:111:f400:fe5a::615;
 envelope-from=Sriyash.Caculo@amd.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 05 Aug 2021 10:16:49 -0400
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

[AMD Official Use Only]

Tested-by: Sriyash Caculo <sriyash.caculo@amd.com>

________________________________________
From: Peter Xu <peterx@redhat.com>
Sent: Thursday, August 5, 2021 8:38 AM
To: Jason Wang
Cc: qemu-devel@nongnu.org; chao.gao@intel.com; mst@redhat.com; pbonzini@red=
hat.com; dgilbert@redhat.com; Huang2, Wei; Caculo, Sriyash
Subject: Re: [PATCH 0/3] Disable vhost device IOTLB is IOMMU is not enabled

[CAUTION: External Email]

On Thu, Aug 05, 2021 at 09:46:10AM +0800, Jason Wang wrote:
> > For the long term we may need to think about making device creation to =
be not
> > ordered by user cmdline input but still has a priority specified in the=
 code
> > itself.
>
> I fully agree.

I'll see whether I can work on that in the near future.  Before that, no
intention to block this series. :)

Acked-by: Peter Xu <peterx@redhat.com>

Will keep you in the loop if there will be something.  Thanks,

--
Peter Xu


