Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDD257AE11
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 04:37:04 +0200 (CEST)
Received: from localhost ([::1]:33642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDzaA-0000Vb-RS
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 22:37:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1oDzZ6-0007at-JQ
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 22:35:56 -0400
Received: from mga14.intel.com ([192.55.52.115]:29640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1oDzZ3-0008S2-Vl
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 22:35:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658284553; x=1689820553;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7ArnIP0boiW5ZqaPph+KDpHH8aPOSCGibBqQkhmi6+0=;
 b=cCkasiWK6gyNK7prh655yg8UOeTlNbitCbo4pC+QQ2vqavDaoUStB+2L
 GE72L9T/3tQ6Qpk5ECXEogg8JDDOlAcRw743OW9cIIOephIAn81oB0oB9
 wc7V8641EhU2dGqRPlbPRchsSUndSvB94e35y/Xr6s0JApUaon2Ty+QH4
 RsSinuK5t/vCHQTlG99Cm4qTY5rppaGNS7cIH8fez3gLGYHwTE+SC78ZD
 mnS9QJxzLWa039jyOPWHInoD+sKmzIUkBd0UPPoZWcjwHGLR1BbWeWODj
 yNNbRsQP62vKvORpuGu8bpXrTWg8Mjzrcqp5qCXzhDS9oy8+c2c2EmPDc w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10413"; a="286671289"
X-IronPort-AV: E=Sophos;i="5.92,285,1650956400"; d="scan'208";a="286671289"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 19:35:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,285,1650956400"; d="scan'208";a="573113414"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 19 Jul 2022 19:35:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 19 Jul 2022 19:35:48 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 19 Jul 2022 19:35:48 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 19 Jul 2022 19:35:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NFpBjgXKYmGu5Vtmrr2JTcuPdMZgyisMNUkGF5ayFNuTNog/FgNIvM/OP+FMw1CqB8EsfhteuVoKtSDpvOPabvqyXQxDwHRJSDD7b2ibnAuaZl3YMvZ6pBw2WwxR9uyeodM6hMACz6Lx3z2VBq9Oqzi9DZ++fofB5SfWjagaboBF61UTvf95OL9xVyIVLgejto4OkDr9mFXf5mU2RTQpoZQobWN5zKCSOaLwzF9RakkloBZe9u6tQIHsW0QCrUYcb9/bSUI1mk63GmS7aItwP+6FaEJaOPMb6t9v08D3fkYuoQRi689TG5zCw85HLwCZfNYTmAW1wDjram34dYiang==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rGygJ+j96VO8XSOG6rKSs9SsntHG7schsqlu9XgF3dY=;
 b=QVEWHa5P40+w1jk8S8IQrUdIlXDMfvSzzjHXo1GkmQcJdUM7KUKTk0KvRX08oHYE/ExoejK7F7BcVh/3DmsNSEkajVbi6WMpuc1M+eTlUWUQUTpyr2Pqwv9WiWWH6ugQjc056ENK5QlM5g88B6jo7m+M2wnF3JBYodtvuMNnmSsMhjY6pQyJTNKgDHmKpDT/AElaPdReIXkE7d4YZFPQcs9BCXTkBCqGtmRRfsOia3A75XFYiah7t6/nVWY+Y3EGW0igzM4BIE29p65T15r6TwRsBeYMczwzb8C8nyLt3fHPTTVBIRFL0Xm5UAkIgva2DXUDfnAj0XIcMxjGEYZRGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR1101MB2110.namprd11.prod.outlook.com
 (2603:10b6:301:4f::15) by SJ0PR11MB6767.namprd11.prod.outlook.com
 (2603:10b6:a03:47e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.21; Wed, 20 Jul
 2022 02:35:46 +0000
Received: from MWHPR1101MB2110.namprd11.prod.outlook.com
 ([fe80::d73:edaf:8500:a40d]) by MWHPR1101MB2110.namprd11.prod.outlook.com
 ([fe80::d73:edaf:8500:a40d%5]) with mapi id 15.20.5438.024; Wed, 20 Jul 2022
 02:35:46 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: "Christopherson,, Sean" <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "mtosatti@redhat.com"
 <mtosatti@redhat.com>, "likexu@tencent.com" <likexu@tencent.com>, "Ma,
 XiangfeiX" <xiangfeix.ma@intel.com>
Subject: RE: [PATCH] i386: Disable BTS and PEBS
Thread-Topic: [PATCH] i386: Disable BTS and PEBS
Thread-Index: AQHYmlazwj8/cO8xi0SzVzXLZpnnXa2ETJ2AgABEQQCAAXJugIAACZWAgAB6iHA=
Date: Wed, 20 Jul 2022 02:35:46 +0000
Message-ID: <MWHPR1101MB21109B9363739A573F6391DD928E9@MWHPR1101MB2110.namprd11.prod.outlook.com>
References: <20220718032206.34488-1-zhenzhong.duan@intel.com>
 <a7bccbc5-fcb7-eaa8-ce95-fa7f380b8af9@redhat.com>
 <YtW+ymE654W662X4@google.com>
 <9dbe748c-57b4-eab5-3933-0e9891b031c1@redhat.com>
 <Ytb9kTFtnltT3fdf@google.com>
In-Reply-To: <Ytb9kTFtnltT3fdf@google.com>
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
x-ms-office365-filtering-correlation-id: 87cc844a-dadc-4bf0-e61c-08da69f88cc4
x-ms-traffictypediagnostic: SJ0PR11MB6767:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J4zk6IWU3aDlDUCwT1IScFcauZfOCUgyHEDDvNgH27Bkjzx+f4JUagcW5Q56W4uhwk0Ukxp65hwNtPHn7sc84Ca1vtebDkSRbisrnTfpiR9APye0GmgiYmveWe5K9oJzKhojkoDYFsWWiEJHRnZ5fW2d8I6AaQzpkgIt7TJfLNdEiL4yxRRxJRlfqk/ToVmlNVmEXKBvNksgpLzhhaCyeAZ4ZaLeGOQeUL6vbT/wmKYg10fFZEfuHRkzRxv3ST+/Dy6a8xAvCp/Q+/IcV5HjRzcjH6VN029aTrzteqSHo22/R+iP/w0zMo4Wu0XeWQX88ssr68GfmKt6FPNkWQmrcIA5CCgZBMa0vu41TMgJpBGUZNbZ9Ux2Icp8Mn97upgU68lZsGsmpE2c6RalLra3l+A1r8mOlxVoz3lgeZo1bmc7jIQbFtA5BYbeXxO0WoL+rGT87gZfQfeVgG3M2YdJYOFnyHJqVfNK7BHN4WrioifLPkirJD0ZiXNg1hiCJUnw+gm9XyXQc0dSlc8PLoAMoBLo67dJwRPuu1Xx/FM47qXqlOq8ds3MNe1A4WQ9uDvHvosy5IRWU79ridHeS3dMNuhUFG9gh20QqCvpTxmQ6kRlGZwJFAglwpIqe2eI8p52nAcE3q3yISbx1tAnwyCeVtQIlh2geBQsBYtO7A3nA6ry4rjOaanadMPeBbF1JSS4ZKzf+ZRvCvt8FacjNiM698Rdz+90WOuaezme9lkQKD3eSQV/AWrD6fziGFnCU0X1I8moN73m/RTGAwz3g09XIG7Qo4fCMpRcdmU3rMJ7C6aZ7U5vmIdtzyJaQgO3Pm7e0n2xu1RuSxvUC8+r03zMrw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2110.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(376002)(39860400002)(346002)(366004)(396003)(83380400001)(2906002)(9686003)(8676002)(4326008)(186003)(33656002)(41300700001)(478600001)(7696005)(6506007)(53546011)(26005)(52536014)(86362001)(5660300002)(8936002)(107886003)(122000001)(54906003)(55016003)(38100700002)(66556008)(82960400001)(71200400001)(64756008)(66476007)(66946007)(110136005)(38070700005)(66446008)(76116006)(316002)(13296009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QyE29GT2/xNhs3CuaCDcb9OQfdH78ftKHQqDxcJKKq2jJUrG2EONIHr6ZyhP?=
 =?us-ascii?Q?FSD5LHXHIG0+NP11Kf0XxXZzoLhJR9nFVC+RJw5U1iJz3gkWZLh2BbBkzaUc?=
 =?us-ascii?Q?EBOVx1jx09MncAUUVIosbXJSAtUnF0Ah8WSajkQqZq37EBJV4zBMuYkBmpX4?=
 =?us-ascii?Q?F4S+GX1ss97KImzBryEMZUVphzqzru49cnCx/3uV5xe4RH0oi0nbURgSQVog?=
 =?us-ascii?Q?DVzLmJVBfvd8wRG8x5/ZrOda2oHl7hUCNfAv5Qjzbz6T3OYdd/ZOjw1iBUJg?=
 =?us-ascii?Q?n0SuykwjHONexaiqjJh6KQCMj5Inaeyspd+tjy/6DyYzvt0um+VMXTBX1ibj?=
 =?us-ascii?Q?82SEpPxszPSUvGuA1NAT7vqtdBpNHhcKUlxPP4tEgeHnVpRDO1isl7cg7xiF?=
 =?us-ascii?Q?KDcZl1jiTcbFN/lz3kkpEgpA19H8vq3Mg56opt8e51KIjhNiGSsH8CfeyOXw?=
 =?us-ascii?Q?lY+xlUTzUqTvXaUJvvF8bhaCpeheRK1Wq9fpeiO6xaE79qZVWoih3RjqraP3?=
 =?us-ascii?Q?RObCvHveCKWf94qLrHGRg+GKZgkWzIKKlOAoTmVUTyGrC0MxIMzSBguh75Wp?=
 =?us-ascii?Q?nXSYfo9+NN+Em0PsraEIWJq1jDukdeBwHORIc6MZwGVP/TsRuBsMfObbbdTp?=
 =?us-ascii?Q?PnGYCEnZRMagutxP8wByA+27gf1FppF2A15iZ3woW7X0jb8jvzbuJEe6siwn?=
 =?us-ascii?Q?1wHrlchF1DMmUGO/IcobpvZJyDf1jUKxmgszYFQeBU1XjhknG8AJjphJKX4a?=
 =?us-ascii?Q?4NzIP8bf5DRODTg709eGE/wSZD4qXmDBlazOEw5LqdRP8+bEE2bCx3hMZlLo?=
 =?us-ascii?Q?/1wxaqWfNDDt0Xwcx2GkglexSrtDh1pJEa+GgTSNlhEwZPDfGPOUVxuK1SCI?=
 =?us-ascii?Q?3eHcysQlSB5dfH+uCnyXqWo403TrEBo2LDuTCzGwnpcLQx8GNNoTloUChuO2?=
 =?us-ascii?Q?o0IsiFCroYUDOyh1QNZAEUe/+Uei095NTIOL6jSmFQkduWiPeNmZg1T2SgXl?=
 =?us-ascii?Q?QrBN8ugtoPHRWinxkZBf7zJaJP17t0UEAsgc7xGHYxgDiPe+Q7BS2QWJ340q?=
 =?us-ascii?Q?618X6lWYFSqWiQb1z7lL99+fcYNEgTFXOD2Po1D2fN0xZ4nxwfxbFCJJfi9I?=
 =?us-ascii?Q?2n/v704A3ZZT1sTM7ouivCbUY/Q82CWJJi4FHd8QnleI3dDp8cPmU71bONn5?=
 =?us-ascii?Q?IpB9Hy0fxsF5MPk32uXa3q9FXbCmZUS5VZumvJTwdWWh4msMOHwG4w4mr5gd?=
 =?us-ascii?Q?82p1d5yZlUFznUpNMfnvzfhKTibzy6mQVw0PYVV9z8m2PM/i4t5zB8kcgnN1?=
 =?us-ascii?Q?musQdMGnFNPBetJZCND5+QU+v3cilCO7B+L18uLIIWamDqia4YL5T+x/bum2?=
 =?us-ascii?Q?Nx6B/9N/vbmUBdg/dUE+ymkuR7JTXlWTirxfFRJttqe9Jy1GHvv+VYNMSKK8?=
 =?us-ascii?Q?0weQMXw6rEtcu/c1g/aYkhJD6EtDVxWOVCZlpVXYsDn3FAwZocxUfowrh8Py?=
 =?us-ascii?Q?hX2ZuJLBoZpa19nHwcEEfBzvb/JJLoMpM9PJgOVB9mrJxNZOm5R+d0mWq/+F?=
 =?us-ascii?Q?Ef3/NzZvrFW7rhN7fevZTr5gcsXwSDv0A3CciyIm?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2110.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87cc844a-dadc-4bf0-e61c-08da69f88cc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2022 02:35:46.0554 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kvDwaGvqpULG8T6UsXmtgfW14iHwDoFenLDfaeqVHxHJw3YAIIf5PvuY7CXg9dkssnZZXh59Ro7TiyFrtEWu0SGdUUd+v8eytP4S0akQ7EI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6767
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.115;
 envelope-from=zhenzhong.duan@intel.com; helo=mga14.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



>-----Original Message-----
>From: Sean Christopherson <seanjc@google.com>
>Sent: Wednesday, July 20, 2022 2:53 AM
>To: Paolo Bonzini <pbonzini@redhat.com>
>Cc: Duan, Zhenzhong <zhenzhong.duan@intel.com>; qemu-
>devel@nongnu.org; mtosatti@redhat.com; likexu@tencent.com; Ma,
>XiangfeiX <xiangfeix.ma@intel.com>
>Subject: Re: [PATCH] i386: Disable BTS and PEBS
>
>On Tue, Jul 19, 2022, Paolo Bonzini wrote:
>> On 7/18/22 22:12, Sean Christopherson wrote:
>> > On Mon, Jul 18, 2022, Paolo Bonzini wrote:
>> > > This needs to be fixed in the kernel because old QEMU/new KVM is
>supported.
>> >
>> > I can't object to adding a quirk for this since KVM is breaking
>> > userspace, but on the KVM side we really need to stop "sanitizing"
>> > userspace inputs unless it puts the host at risk, because inevitably i=
t
>leads to needing a quirk.
>>
>> The problem is not the sanitizing, it's that userspace literally
>> cannot know that this needs to be done because the feature bits are
>> "backwards" (1 =3D unavailable).
>
>Yes, the bits being inverted contributed to KVM not providing a way for
>userspace to enumerate PEBS and BTS support, but lack of enumeration is a
>seperate issue.
>
>If KVM had simply ignored invalid guest state from the get go, then
>userspace would never have gained a dependency on KVM sanitizing guest
>state.  The fact that KVM didn't enumerate support in any way is an
>orthogonal problem.  To play nice with older userspace, KVM will need to
>add a quirk to restore the sanizting code, but that doesn't solve the
>enumeration issue.  And vice versa, solving the enuemaration problem
>doesn't magically fix old userspace.
Hi,

I didn't clearly understand the boundary of when to use quirk and when to f=
ix it directly, appreciate your guide.
My previous understanding for quirk is about backward compatibility, old be=
havior vs. new behavior.
But this issue is more like a regression or bug, and the sanitizing code is=
 only in kvm/next branch,
not in kernel upstream yet, why bother to use a quirk?

Thanks
Zhenzhong

