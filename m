Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C6A2D578C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 10:52:15 +0100 (CET)
Received: from localhost ([::1]:36312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knIcQ-0007rD-9z
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 04:52:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1knIJO-0007NJ-8b
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:32:36 -0500
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102]:41495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1knIJL-0002Rk-6J
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:32:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1607592746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wGUSTenQBGt7lm2QCebf7+uWoa8hXmn0CACCTI7kOpk=;
 b=lBZ96Djh2Gs1zTA9ivXCcLxl1kI8rp8PmD1AzFrPD0tEmaRi1aIE5VD0tmUJmR0CsLU4AV
 04nhuj7Ws4IcIgOkB5e6HGW2yVNPl8tSGcfFm5gon4v62Z9NGqFuGfIvEzO4HPDSxySTkF
 cmv5TQhxMR/2x27PXJVt3jwXERPOORU=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-8U9g9YhAMiCGn3OGR4VZWg-1; Thu, 10 Dec 2020 10:32:24 +0100
X-MC-Unique: 8U9g9YhAMiCGn3OGR4VZWg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c1OGCkzoBL+h8bR7OHEhVMLWkryQGqWnnvf8VWWwQ8pzsIVyRQUntvZdFXl48Ob53ZRYMLk48ZS5nxo1mW6u7qrnOHCAkwYkVgeybOPvUuMEEYQoyoF9v3nVrLHAfxnNOV6KKYb7chTkqkJY7Dn5EyoQu/qnzfrumEb/GnKOh14bdSXdPHg/xkTo9ljrrd1ADg/3CDrjvr2kn4W+aWZd8aq29keqLtdWsH8rKWN7yXOSw2+/aK9tHN+Jb8tIEVMHr6w+nNKUPs4w+rDiM9n0O0V4f6V5N+q/ACrBsOc9KRNW1th7s6Bebv5h4u31YkIq4ipUJ4emLGBQvVJ8uz6Q+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTF9e1P/K4usqGDKMB7UfmEw0zoR12fjPPdABASM0w8=;
 b=L6+4DV/2CK7SereGNOJi48MXUY5ADSL3m8Dl+ijv0cqJSPH3OJuo+mYYb1gHZxtwip/SCfTv8OM97m1De2pagMCyAm5bCsR6Dqhh0kWJDNaBO2RRmg84CZdPAzYhszVIK7ek27GI7UEZirLAsDgTkJ6eFpzwZQeWRemvCtLJCDAAuCeqZVgNTnOu9hAqiQtSftCX4lg7jAfxNWW7D4DyTPYN5VzdR6FaXp5fRRCcgvMQ/fQBMZ6pBf/Lt5Hu3VCrhIiPSDLzUaKrfcGWDm87V+fRKvZVRspMDfJLT7ppyg95nq9FOUInNYIAfRmqkTRBEVT+0qN3m8A4vXRNopeyHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR0401MB2590.eurprd04.prod.outlook.com
 (2603:10a6:800:5b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Thu, 10 Dec
 2020 09:32:21 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::c53b:66c3:e1dc:e5c6]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::c53b:66c3:e1dc:e5c6%7]) with mapi id 15.20.3654.013; Thu, 10 Dec 2020
 09:32:21 +0000
Message-ID: <ec5b267368e6b1936b697b8190aa04325f5aa673.camel@suse.com>
Subject: Re: [PATCH v2] gitlab-ci.yml: Add openSUSE Leap 15.2 for gitlab CI/CD
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Date: Thu, 10 Dec 2020 17:32:09 +0800
In-Reply-To: <d2a307da-d8c4-7ebc-cba0-abcd65e1c580@redhat.com>
References: <20201116113046.11362-1-acho@suse.com>
 <20201124094535.18082-1-acho@suse.com>
 <d2a307da-d8c4-7ebc-cba0-abcd65e1c580@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [60.251.47.115]
X-ClientProxiedBy: HK2P15301CA0014.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::24) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.156.41.170] (60.251.47.115) by
 HK2P15301CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.5 via Frontend Transport; Thu, 10 Dec 2020 09:32:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64c252b0-8dac-4b66-82be-08d89cee7efc
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2590:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB259039E42B935E30386098C2A0CB0@VI1PR0401MB2590.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5ihxoeZiJCLhj2xDJSeCoQLJYRFoH/n85KCzDqokj9AfxASbX5JOl0oDh18yw6JdH3VwHWz60jrWDCwjdRHB54gJ3KvlYKqAvqPy9fOV54Ay5QAlvbOBpZh+DS2Fygg+sh3bIbZyac4MA9e03CbDF1n6Zc2bTRp9QKHNzShObnGIYmdBasb++9AIJe33B08uWobNosoWig666DzZc2gt1G1hZgqyXbn9no64bSgLr0qI9rl4kZnmACJ6NV+RDS7K32+p7wcuAJFc0XC6+6wdhcrqBeKWD+fo7Glk+VXSH+Qz8iOl0xP1x6nocOIBCVdhmx71NPT/9JKiZUWRYX6XEoDf2vkVfXFgVxSWkRQChFj+KX0OZBTte5MnWFhq6a3KAj5TdC3wT45YUG1qtflfuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(346002)(376002)(66476007)(86362001)(186003)(66946007)(83380400001)(6666004)(66556008)(55236004)(36756003)(52116002)(8936002)(4326008)(2906002)(2616005)(26005)(8676002)(16576012)(16526019)(956004)(6486002)(508600001)(5660300002)(966005)(107886003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?MZrP2T+dDYUyYC64hdPq5qjuyRA3YtZFx/8IOZNY4l05X2pOv9jkQ4hnjZ9y?=
 =?us-ascii?Q?F+JM7PNmO90kSx6KESyKp0QrhNq6viSC2hHHFDml/RC9PIaxwEkMDQlETMo4?=
 =?us-ascii?Q?QgiFCq+UqexMGbnfU/uuoidBcB/4fVBNCCJ1pgzxbRlRISU45EP79ID3KZ7b?=
 =?us-ascii?Q?xNcWAf5twtPLRnZ3cDRN/Xf2aYZ02pn5oq52bmbUDnxbxUV9mTiJSsQbOT7j?=
 =?us-ascii?Q?8FvvEscaZO3hdbEXyXXLXQn2MWSByVTy+itcNE7WhvJTiQ5O8fJGaBYf6IJq?=
 =?us-ascii?Q?dx9d/3+hv+pvEhR9bX8sPkKVlAXLt7hyBRVFkpAXPth24VS5pF2nP/pYh1tc?=
 =?us-ascii?Q?RAk2CSbLQrAtnREwxzJCfiC8hDql3rqspdvPg/yJWDpCuqTq3XIouNL8zdaH?=
 =?us-ascii?Q?+HhqPA9OMg632udIJP8wZp2wmA0iCsAyxLkl2LiNQIz6lyx95rANvzg1HzBR?=
 =?us-ascii?Q?ypctK61nSa9iC+MmtpC3gWG4ZefBUCQslW5k1W3tuGqCneFsN7Tn8Y84nSpa?=
 =?us-ascii?Q?Xq89oL2pj3ybzPd0EabOFN/CYFJk3tIRDZ21L5w4/aBfB42A/3fpwVMz0ID+?=
 =?us-ascii?Q?rKcguIugfLdsZaHYoRssz3EDpk+ehJRzqmS6KnVISYaCHW0cXVccsBWc+YGl?=
 =?us-ascii?Q?xYg0n6hOsfLb6XuELum4rlEi93nlg4t6GVniX6eGQ7kwOhwCSI6vV0FW2THu?=
 =?us-ascii?Q?rHGsA1PKznkE/IvFdMdVbBJ95nryrRhl5ZGMv6aNuKnD5XSQ0T/HPBQ2HNT1?=
 =?us-ascii?Q?ymhcfEyw0L+iJHMTV+1V9bI2VkGKKDZBGs9rKQZIxt/nEWWhPPdxcBjzHPH+?=
 =?us-ascii?Q?JC93VbLxA5wHTWetaS7cGt6Z4AimsGvUj5J+lYLzt7tQUQAYYpFrq8FP/bQe?=
 =?us-ascii?Q?G0icTIvmi/B0JN0sxhxeJ5pcY2dbuPVjxLso7K8510SEdsq3sx/YZSxRvsys?=
 =?us-ascii?Q?Rx7BE4KHZ2Zn0MIx3t5XSRseToMk9o5Nby7OKHR/LHeKBOfKznFZwB8n68RR?=
 =?us-ascii?Q?l1un?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 09:32:21.8483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-Network-Message-Id: 64c252b0-8dac-4b66-82be-08d89cee7efc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Df0Qt+y9XsrStPvs5v8dREBllBhLb3mG60L7i7n+ye0P8md8tXo7AWWHJ7HlZQlZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2590
Received-SPF: pass client-ip=62.140.7.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: fam@euphon.net, lyan@suse.com, philmd@redhat.com, wainersm@redhat.com,
 brogers@suse.com, cfontana@suse.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: AL Yu-Chen Cho <acho@suse.com>
From: AL Yu-Chen Cho via <qemu-devel@nongnu.org>

Hi Thomas,

I try to reproduce this failed in my repo, but it seems works fine.
Would you please give it a try again? I think you maybe just hit a bad
point in time...

Cheers,
      AL

On Tue, 2020-12-08 at 07:55 +0100, Thomas Huth wrote:
> On 24/11/2020 10.45, Cho, Yu-Chen wrote:
> > v2:
> > Drop some package from dockerfile to make docker image more light.
> >=20
> > v1:
> > Add build-system-opensuse jobs and opensuse-leap.docker dockerfile.
> > Use openSUSE Leap 15.2 container image in the gitlab-CI.
> >=20
> > Signed-off-by: Cho, Yu-Chen <acho@suse.com>
> > ---
> > =C2=A0.gitlab-ci.d/containers.yml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 5 ++
> > =C2=A0.gitlab-ci.yml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 30 +++++++++=
++
> > =C2=A0tests/docker/dockerfiles/opensuse-leap.docker | 54
> > +++++++++++++++++++
> > =C2=A03 files changed, 89 insertions(+)
> > =C2=A0create mode 100644 tests/docker/dockerfiles/opensuse-leap.docker
>=20
> =C2=A0Hi!
>=20
> While trying to pick up your patch, I noticed that it is failing now
> in the
> gitlab-CI:
>=20
> =C2=A0https://gitlab.com/huth/qemu/-/jobs/896384459
>=20
> Could you please have a look and send a fixed v3?
>=20
> =C2=A0Thanks,
> =C2=A0 Thomas
>=20



