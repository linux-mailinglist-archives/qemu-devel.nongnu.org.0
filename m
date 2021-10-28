Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B510743F228
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 23:58:44 +0200 (CEST)
Received: from localhost ([::1]:46932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgDQ3-0002QR-ID
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 17:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.levon@nutanix.com>)
 id 1mgDNG-00083Q-La
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:55:50 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:2356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.levon@nutanix.com>)
 id 1mgDNE-0005hR-F3
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:55:50 -0400
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19SJZw2B018841; 
 Thu, 28 Oct 2021 14:55:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=31p19j61xmNC7Rq1RsATwP9h81fmw7PRyi4Pnq4y86o=;
 b=ePDTUXWV2pvIKbhShoxvvuAN2JWmCXqITmhTCg9451UlDn7bGrRsOzdJCld7RsEsZKHI
 fw6OZ9crarHGTk1y1eCOZWS7yHbBQl1hS9CbXRUQkIgITHgu06OCw3KWoHD8ZfQfoYwX
 x7VCOQmiqK/vPpEsSnieKM7mIV/gmTQPhA7QXIyYvGJYo7z/7/G6H4IEnHkByX5pCL3y
 vFI7FrJmOrdh8RTeyTQzm6rjGeYZxrprWqI3OL7H84gBIFS2gO604k7Li5GO8i1jcdJo
 whKnOuyBvX+2Bo6kDnnKRuO2j4smQHKeiaunfc0hoVnEeih4/KmidzYPHLUJaoPsZfVe fw== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by mx0a-002c1b01.pphosted.com with ESMTP id 3byw088xjr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 14:55:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ggW09GQSBNbS20iZzRGMOFXf9LrhSlUhRzIIJx/WWNun/GTU/Te/p6JMtVWsuVMvjYOWZaTTonx5PooeuffcqoEksuCAW4LyuTmXYfRz/KFVBPHRJHPi+3Gr8tD29oBG5FL2dV2U1NWFl8J1R1anwT89K5JFuTSpYkMAZXTHwRfRJ3nOBJtOGt+f0/K8hoEZgJuVCg8Ndaj9kznBTlL2YMxOdATQF9Bs3qOyp3O/Jz1GpdslPcnN2gILLmEaj40K630ZSVN3RndvXSc1c+kX9QH0eN8xj6U56jhTOyBkFtM8U0sFnKUQ3MOOjhRAzVD47SIeulQZGTCEhIe0rurn6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=31p19j61xmNC7Rq1RsATwP9h81fmw7PRyi4Pnq4y86o=;
 b=JUGOghRggeflG6p4NdFebMtZs7T5wK5r6Jk2l0H2PO45Xbp3J8o8IxbuHer2Rr4XbQjyn9JI3u323WNE3XGPiEjIkKGwxkE7x1bIoI9hcgQ37a1Nuog/QqIpj0SDP1GZUiHXE0VquggEL1x+N1tlQ6v+OoBPs30Xt1ZlpdkX4E6cqwEqZegoEIdbHXz2mUHAN9Zbm782Fxvg0wU7s0F7ykqBT6gQ/PYFz4NlGWm/eO0Xo6LP2T79qhIGL0f94hIguzd7Og2nUm94/yxOwHuncbYPSpHt1REeKMTaLXNuxK/q8NmtoWgO3pftYUMyoHj8pTPHoC4MowNM9KrnzMHhEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BY5PR02MB6115.namprd02.prod.outlook.com (2603:10b6:a03:1b2::26)
 by BYAPR02MB4693.namprd02.prod.outlook.com (2603:10b6:a03:4d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Thu, 28 Oct
 2021 21:55:38 +0000
Received: from BY5PR02MB6115.namprd02.prod.outlook.com
 ([fe80::1405:b5aa:5854:1e]) by BY5PR02MB6115.namprd02.prod.outlook.com
 ([fe80::1405:b5aa:5854:1e%5]) with mapi id 15.20.4649.015; Thu, 28 Oct 2021
 21:55:38 +0000
From: John Levon <john.levon@nutanix.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v3 06/12] vfio-user: run vfio-user context
Thread-Topic: [PATCH v3 06/12] vfio-user: run vfio-user context
Thread-Index: AQHXvmFNPay/e322Y0OXI4P0xiic/qvnIKMAgAHvroA=
Date: Thu, 28 Oct 2021 21:55:37 +0000
Message-ID: <YXscWS/qmwEDKOTO@movementarian.org>
References: <cover.1633929457.git.jag.raman@oracle.com>
 <489671ef49381437a03917a87dc143dd9fc90559.1633929457.git.jag.raman@oracle.com>
 <YXl8ilTXICU+0EHk@stefanha-x1.localdomain>
In-Reply-To: <YXl8ilTXICU+0EHk@stefanha-x1.localdomain>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef3472ab-490f-486d-d11a-08d99a5dad5c
x-ms-traffictypediagnostic: BYAPR02MB4693:
x-microsoft-antispam-prvs: <BYAPR02MB469315CE23BF2EE1158D33AA97869@BYAPR02MB4693.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RlbmP9fN6aC7nPDAuc9yfLR8mbbN1xeGTwFdCNypGaiEjfPB9JffsTlMVTT4JPzqqssJTaJt/e8P1sdETyfCYBoR2a0ZP/ZxPlKg70bGMyYUWj9LjgbfrJnw4Ol1dVFWMiD2B1h3LFRHAy7raZUW963J3Nhb0fsiG8qhwpn8iaaIooKeJKfNEyXffyLGLKJVvJeb23qcB3EZobATIhi2lDfYau8GtKyeK7Dghuj++GiJGNqDPbhFJQxRTES4rH1APmFs1x91Sf7/Pd5mTv8uav8P6sH02A9M70CpIK4wrzCH2UlCQtDjle2yRJvqoBq93axZWrIRmIBvRmTJQaYrUycPRFOT48+mylipr8XjymWRBHgU0EczRH0oAYOWivRZntXVpfgpMDcWDH+ze6gAAJN+jWRQZSw+B93N4in5I1aNb8ZTpcylNbIIlK5NnVqS8iAcGXbc6o1jiACI1X56ykevZ3muSpEjWgSM0MHecrTleM59AAli6UXePxhcxJ0W0EOm86sC5bZdt4lqWR52zlheitq2lTNH4AO3sZVQeeAnZEiShPUnewiDxsz7vOktkbBYu+dyuLWsKIio1appWUPr2/nxbNW/7e1bOjEX1gzOYVLOI5J731cnQQif1Lzbjwp+Ob3irYAsMTxNC9S5G7itd/9gykqMDXnBYzTaAc7yochn/zbmtE01+XF3McGQFyeVsBCqLScbyKoVMlwQ0A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6115.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6506007)(2906002)(508600001)(44832011)(4326008)(6916009)(6486002)(5660300002)(86362001)(83380400001)(26005)(71200400001)(66476007)(66446008)(7416002)(107886003)(76116006)(64756008)(9686003)(66556008)(6512007)(91956017)(122000001)(186003)(38100700002)(66946007)(8936002)(38070700005)(54906003)(36756003)(8676002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UJRSY+N/SZwIkWWc+OIQ9stvYlOn46xgB6nBklivRU6cdGT6TjWyC54ru5rd?=
 =?us-ascii?Q?P8JkEDgxzfOMlM3VuqS8B3V4S0mNMVjGLI1/l12KUyRK02XQ35Z//7w4vkgy?=
 =?us-ascii?Q?0Bagns853PztrJA9u9XlbE5V0ueLHRPArZge4pZN3HA6ueqYrKrLpNarStMH?=
 =?us-ascii?Q?cC5p75gotA/Cap73mDY+urvkVcqyvd2eAPEazSOYGK3gKd7ptCkYMvSjA5VL?=
 =?us-ascii?Q?LkkaQZ4QqoLIk/QX2/a1uI0gkmam+7fvopGzriIF/gL9B7h6dug3bHuc91pk?=
 =?us-ascii?Q?D8GZWL0oil9w+P9V2ikesxKYoGsnNpA3zrV2SjyKv679UlJf3DFo0qzftd+V?=
 =?us-ascii?Q?QgJo4X4ptljMCT9+hwTRVmWG6BrsPcWO2q87Y+NHJ9FEISCyVYrx37cclO7N?=
 =?us-ascii?Q?jal/uGhSDhR6CfSGWB5Y96Fy4ClRH/8Md5XtIOr1MoNjdM122YvVLiYTbzgb?=
 =?us-ascii?Q?j/BVzZVoTlxBzxElnYLFDEBX82NQohQO/PuykQQU4HUhbzt331uX1xOhXWsU?=
 =?us-ascii?Q?DXdY6ygcuu9L2KPgoLON8aH0y1W8m1BTfjDnLqF9tg8fAs80ROJwEC/tP/Sh?=
 =?us-ascii?Q?EQKi7PNBStRnAqnWl/O5X8z5QHwfW84Jnvx8PPZI0o5uDfq/p1PyGSFaGOSb?=
 =?us-ascii?Q?FPuW3CA3E5h9IJs1AwVF2dWpjIvHRBNsBLDSNozywe1uKJlTX6Qsm9JA6nZ0?=
 =?us-ascii?Q?kjJdMietDlo58VtGpMEsAF+Ljblpi/Jf5Dj5dGWcNL0oW8cbiOpCu8LzXFcM?=
 =?us-ascii?Q?7Wnnju14JBYNewLXPZB6NsSRJmnW8r+E8v5f40D6nhPNMGBNHz4uV22Ei039?=
 =?us-ascii?Q?/r5GOsvn7RDr50VINvcmUwLHWYw7aS1pRV1/7HmKA10nnFq8FV3Ep5uRIvga?=
 =?us-ascii?Q?zFOSLxYvbdCE2SMDoPacwaI3gPJxe2XEc+YKRrst7eES2Iws/rlwjnC3H4hy?=
 =?us-ascii?Q?1LM2CbYGfd9tu/cTennaC53W39YsDcNn/c/FSkdi7TiZIa2AVA3PF9G7SkCZ?=
 =?us-ascii?Q?m/atKAOKdulaJhjl3EKd+6CNyBVbMc1wVtGmytzYf4YMFEjrrN8+BOWUS1Xc?=
 =?us-ascii?Q?tJ3q1nUmgWKeNLgW0EkoW0rNdz9jlTw+ck42e9HnYzLqrZF0k+lyL8nXUXNh?=
 =?us-ascii?Q?AJa/41WEPwI1lz5IbYO74QIHHu2I9t7d8pSXB8B3Mko3+0vYgk9176zW84MU?=
 =?us-ascii?Q?pn/4MWxATLpF7vLgmIjACbIxT9IGcw5n3L1KRkLIOC0tbOBgDoiQLUsNu8Vs?=
 =?us-ascii?Q?QaHJVG68CIQmlx//PKf1c90Gb5BJZwmfgkfziPBytjiIKCGZWg7PwIdft6No?=
 =?us-ascii?Q?G4CdGykAwUFm5BMGf32frJ4bEGB3IN1UXIJaPJ8ATKxE61QLHhxnSZOqui9w?=
 =?us-ascii?Q?PbXvrsMvUGIjozL1xhYeBNnCcBptnKclG4MHyoE9O/9x/4oX28TNg0Rxs9bV?=
 =?us-ascii?Q?vRph+BeI/y3/gso50+J74I55mqPHdLvzx2fMaj+rTsvYcHxbXLMelMe5dYVw?=
 =?us-ascii?Q?yuK8qpCJiySFDEM0A7jj5dQujtakqCJdAATk0MjhI/03oA/SS2ig77C57dBN?=
 =?us-ascii?Q?6zHnoaU/esKiuzSdfxP+fYg7aVit33j8g+Sh0J+hlF4UQky+Jn1o2Oc1AUxc?=
 =?us-ascii?Q?HfuTn44DoPR3c5binE4Izic=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1A21C2A7E8F7294F94FAE892ADE8B4F0@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6115.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef3472ab-490f-486d-d11a-08d99a5dad5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2021 21:55:37.9213 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TSPIMrrpZyUyLfl47jjR7SfZzrdctaR9PhEwmq9Bzz0mPpy77OqZ4QY7wrjpa0mfpHjnQyodIsFCZmshPPddTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4693
X-Proofpoint-GUID: hqvIynZqSQ-q99kVi1A-KecZyv4G8GPa
X-Proofpoint-ORIG-GUID: hqvIynZqSQ-q99kVi1A-KecZyv4G8GPa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-28_05,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=john.levon@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "elena.ufimtseva@oracle.com" <elena.ufimtseva@oracle.com>,
 "john.g.johnson@oracle.com" <john.g.johnson@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "marcandre.lureau@gmail.com" <marcandre.lureau@gmail.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 27, 2021 at 05:21:30PM +0100, Stefan Hajnoczi wrote:

> > +static void vfu_object_ctx_run(void *opaque)
> > +{
> > +    VfuObject *o =3D opaque;
> > +    int ret =3D -1;
> > +
> > +    while (ret !=3D 0) {
> > +        ret =3D vfu_run_ctx(o->vfu_ctx);
> > +        if (ret < 0) {
> > +            if (errno =3D=3D EINTR) {
> > +                continue;
> > +            } else if (errno =3D=3D ENOTCONN) {
> > +                qemu_set_fd_handler(o->vfu_poll_fd, NULL, NULL, NULL);
> > +                o->vfu_poll_fd =3D -1;
> > +                object_unparent(OBJECT(o));
> > +                break;
> > +            } else {
> > +                error_setg(&error_abort, "vfu: Failed to run device %s=
 - %s",
> > +                           o->device, strerror(errno));
> > +                 break;
> > +            }
>=20
> The libvfio-user.h doc comments say this function can return -1 (EAGAIN)
> when LIBVFIO_USER_FLAG_ATTACH_NB was used. Is the doc comment wrong
> since this patch seems to rely on vfu_run_ctx() returning 0 when there
> are no more commands to process?

 * @returns the number of requests processed (0 or more); or -1 on error,  =
     =20
 *          with errno set as follows:

So in fact it does return 0. The EAGAIN line needs removing; I'll fix it
shortly.

> > +static void vfu_object_attach_ctx(void *opaque)
> > +{
> > +    VfuObject *o =3D opaque;
> > +    int ret;
> > +
> > +    qemu_set_fd_handler(o->vfu_poll_fd, NULL, NULL, NULL);
> > +    o->vfu_poll_fd =3D -1;
> > +
> > +retry_attach:
> > +    ret =3D vfu_attach_ctx(o->vfu_ctx);
> > +    if (ret < 0 && (errno =3D=3D EAGAIN || errno =3D=3D EWOULDBLOCK)) =
{
> > +        goto retry_attach;
>=20
> Can we wait for the poll fd to become readable instead of spinning? I
> don't know the libvfio-user APIs so I'm not sure, but it would be nice
> to avoid a busy loop.

At this point, ->vfu_poll_fd is a listening socket, no reason why qemu coul=
dn't
epoll on it.

regards
john=

