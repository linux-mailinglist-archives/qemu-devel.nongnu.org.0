Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7E63E9BD5
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 03:13:28 +0200 (CEST)
Received: from localhost ([::1]:41812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDzHj-0002hG-0w
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 21:13:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gsouther@qti.qualcomm.com>)
 id 1mDyHl-0002mX-Ha
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 20:09:25 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:14469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gsouther@qti.qualcomm.com>)
 id 1mDyHg-0004no-Qy
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 20:09:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=qti.qualcomm.com; i=@qti.qualcomm.com; q=dns/txt;
 s=qccesdkim1; t=1628726960; x=1629331760;
 h=from:to:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=k1FvWPZSU2/qnR7oFIbxr7YcUfnn6auaeaI5TfmDoGc=;
 b=YcwJM4yw1iP4Lv1CdvzeCogKOQmZ1CMNaC/PTzA432eDxuyj2EJPmxIF
 r71S6ijnGjz3+SKVC4Wl65jxuUM4iQQxm+/TXkkCNsvuVm2FysQ/FJchT
 rIIgRu5vjYjb17YD79wsYvNNKG8Xzs1kAr4/hp8lc64pV1yI8gn5tLGld Y=;
Received: from mail-bn1nam07lp2048.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.48])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2021 00:09:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzdlCjSuRbNaepQ5EW+NRpkLjvC0xmYTKm8wJJYTKhEG6eJkJrYUKyUuehcmd4bS58tRubDJyhdYn4rVASKF1QVVDcWloNc8BUzNO2/j2HhLLLtcxCJzX2tjLuIm43lNY/yRSkEo6zqhRKt6eypQEf1FPN9WLB1K9k1RIUAymJyrAm3TdEJG5h/4GSFvVgoCKjV+jrnoA1CJP2WD/ay/DumPkrv4MMLcBBlWkviJq+yEGRTw4QY3qo5kSo9dHG/oeFD6d7qlRRxhohtSXepY+PHeYYHO7LGXM34PuYdKEZhKpjg2N2WvjkySDZVFOhF+GsaTpVLazIhUl31NEliReQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1FvWPZSU2/qnR7oFIbxr7YcUfnn6auaeaI5TfmDoGc=;
 b=DSpl+cUdUaEZc6T+qGKvSO73MqMaab7D0MzmsHhlKwoQxw0mQP2v0Ad90654KC5FBc9F8kRzTfwGuh4hVXQvpq7v3BPlD9gr48JsqD8ffvcX9aMfQ1ahBSJgc9q8pMeAnOPbCO/Rc4lyHgQS/tyXOl/BFAGzNNNsJ36Q33IvoMZHvDfUIUcPVax96PfqZtM7SL00LkhOwWgL8zBCfpggp2QW1UfeC68GlTJOHR8H58atjzRsGdoa2yjEl+gsDZuRXBONVT9dw4VSnK/Lpunv/M0lzbdmwllhJZMBtO7Cd4gh6tYycZd5nWEhkOfLJmkHluGnjreEXcku+zd6LSkpAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BY5PR02MB7028.namprd02.prod.outlook.com (2603:10b6:a03:233::15)
 by SJ0PR02MB7311.namprd02.prod.outlook.com (2603:10b6:a03:29f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Thu, 12 Aug
 2021 00:09:15 +0000
Received: from BY5PR02MB7028.namprd02.prod.outlook.com
 ([fe80::c053:4c91:66aa:4be1]) by BY5PR02MB7028.namprd02.prod.outlook.com
 ([fe80::c053:4c91:66aa:4be1%7]) with mapi id 15.20.4394.026; Thu, 12 Aug 2021
 00:09:15 +0000
From: Gabriel Southern <gsouther@qti.qualcomm.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Using loadvm with snapshot
Thread-Topic: Using loadvm with snapshot
Thread-Index: AdePDGT25JLrx9Y9Tb+hm61tqISU2g==
Date: Thu, 12 Aug 2021 00:09:14 +0000
Message-ID: <BY5PR02MB7028431FD055B48DAD3841F7F7F99@BY5PR02MB7028.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none
 header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c171330e-5408-4d0d-7fcc-08d95d256ba4
x-ms-traffictypediagnostic: SJ0PR02MB7311:
x-microsoft-antispam-prvs: <SJ0PR02MB73118502F671A302239E878FF7F99@SJ0PR02MB7311.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z0f3GgOJ5HE/+6PjDOuOpSSvo8RNvHYYM08wzK0O8aOsGbJhLWWVUw/Tb14xN6Xg1smx4S+qQDa4Fg+R5kReKwe5gley2CgRkMuA1Qx//gnCLNE+r3IOHDls5FXfPjhfvUo7lehUGW8Cf35SgfWs2VFcvO/vcRBABaXNkMhC551QhF7zhyVdh/OdQRrvDKrDQfj4qkiVOnnqOIL8Mt0qI1pu65hJ3qab6bEQMrLkB4apNABHgxWRkaGJuFrObS+MdaQTL0tOtieR+NkIsNRfkVlb4EFTZTCz5R/KDph0eLy3iZfYWExuomdmAsl+j/nAKPN5tg96+1abobAVbMyY7LsYWsvq++0qe5OOwtxuVZBJVL0fcm704jVN8vtJHjAWxKnCh83CJX0XbeU9pAuy/FDmJ5ol5/VC1B3QLp1rM0lGNVqBqQJ257wM6Uv9VODyldWteaQd0H8tZT2q47iVWssbwpoI0FkErhMKMgd7EhZKj1kIJgStdpFXRFwUWddgjhTJwFqST6y0TQWXfw/XRQ/e7NH9aQuVtAe4365Xhhl2BeQCajTr/RjJDXmr4lcHn751dPxKd/afMXC5lCxwA5/OFYjgJzkma1JDwbMV9EfHn3NcgCVu2dCeB+I5oSVwUSdpD5raX5eyGS9VXatefFHFy2op6wOEtZEx4J/Sopisbw2Hv0fzMZW8DACU+Jdk5TCBqi8qLwT67Rirv9Vt5O3Noyfd8lDFknOIPBhoLMhCt6v0eA97KZYhDGWG/gJVdZEqlnyfWFyvaY28VIiTq9MaVttz2AezJCtV3cNt5qc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB7028.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6916009)(33656002)(9686003)(8676002)(55016002)(38070700005)(508600001)(8936002)(38100700002)(966005)(316002)(26005)(6506007)(122000001)(71200400001)(7696005)(66446008)(64756008)(186003)(5660300002)(83380400001)(86362001)(52536014)(3480700007)(2906002)(66476007)(76116006)(66946007)(66556008)(4744005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jE/wQRxJ0rzCgn5Lb+5bFg8vpJUosixjZWqKywfy9+fk3HywWlyGcsyQK3JH?=
 =?us-ascii?Q?6uFyP5Vb7cmF4ShXaMGR1gfo3ocjJT0Af3kKmzDsUAsPrE5Olp4fzTQvz6Ow?=
 =?us-ascii?Q?Eo8+mgiFAkQD6UJ+Ufg2ktYgKGk+HUm0Dzl+kh46XIOONVJNapVfbk8pRFyW?=
 =?us-ascii?Q?5YFxkUc9S1Z31jkQLRxUdhRe8h0qguQwEape7Vo5PA34CCHhQesO2ogFWBLy?=
 =?us-ascii?Q?vTBMqsFHucoV2xPiuNjSe5AgX/CW7//jRrf0Ze6Dz01ErDlZXuyKhA5qAWr/?=
 =?us-ascii?Q?fzCEfhmh9eu8ap6p18rF6D0jU4culEIxLFcsw2t3moQg3nC+DdeKCIDCTO1m?=
 =?us-ascii?Q?J+nzQNhQYGzHzhe9W+GcgC0pUkFW44a7Vc9fu/JxwtOKzFpneDqg7U4u5mNM?=
 =?us-ascii?Q?Hl5hvBFMtlNUiRHbRBQqUVCVznIkBrU3MAyVk67R3t63dylnIcdXt/ob6r1B?=
 =?us-ascii?Q?CmfyH5mEoTK7QdbctQh3BaBx/J5MHBYURHZcddV8NoX/R6+M0Ss+Gh+8nD/M?=
 =?us-ascii?Q?+2Q7iR0/YXQIWCEU14PznuapoPlMwD6B266GbMw1/TBYAembd+coMOSE7nO2?=
 =?us-ascii?Q?yOr9tOXVB7iDfYIz0I/Zrs74xLlHtyQ6bNb0TwyAmVJkGuXNCmii0+f6NwW3?=
 =?us-ascii?Q?yXyvwIFN7W9y9uhvIdSrlN1FpR1SKdrnMwq8NqCwb9aLH+bNK9YN9Z2TbJxM?=
 =?us-ascii?Q?xNAySUob1J3GZCuhItVg4Gg4KaFPmS18noquQFNAuwWFkcDaoIWNQWjV6Y6h?=
 =?us-ascii?Q?gO9Si0dGKtwekvmS0lbEGsopGNADiRXnu7eym2QomnAUd4XKFRh+/oWiJ7G/?=
 =?us-ascii?Q?tur5QrHwaQgeVaaNbgfT6cIsKTkLapoqQrPWcdjWYOXuLLBo8ogIhzO+/z5A?=
 =?us-ascii?Q?ObxRoIOCtee8L8hyYuAH8YgCSjCh7c5xhI2A9TQVtQG08fMHSnWOsfxs05ZJ?=
 =?us-ascii?Q?v6f6gmPVXD5ig18cut92Z2DAyzhLK+9cQgZqGhz4s89SbwzP+nweph7sMUc3?=
 =?us-ascii?Q?wHJRjxzJy/2pAH3H/oXs6OH7e5Fs/e7NEoppZ4ltJHfgmeK4/oLERIxM2s/g?=
 =?us-ascii?Q?7+UuLjFf2pvOMl5r29cYyGh5YeweQWHkMMFmejfprk3ofJHQUY2U6JS4cy4o?=
 =?us-ascii?Q?4YplbxfW0EpCGRh9bUo8up6eqJ0LEjhhkfzaXoVbC7/U+WOH9bm57ELVxhCM?=
 =?us-ascii?Q?4XxvkVwfeeoDKBwFhd6ea7GkagzjJLXSLvaXqD4bjJWZ2DP7JI8rpo0y3+SW?=
 =?us-ascii?Q?rZa0UwiqqsODubKeDCMTMfKcQiSdAHJjQWA9P1r58BD8fesM+IpHY4lA+WLZ?=
 =?us-ascii?Q?zQ0sYim1W5pdm99nZxrv0glK?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB7028.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c171330e-5408-4d0d-7fcc-08d95d256ba4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2021 00:09:14.9218 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1iBbVrEihzhKWqPv1YRg+IdEagBELU/KAoiqT3p0rcQkB4vUFm2JkJTAqAyGTSFEFWn7nMKd/CBKpARDC/8cjSDTeXEHiWnGxabDlYfyD0w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7311
Received-SPF: pass client-ip=216.71.140.77;
 envelope-from=gsouther@qti.qualcomm.com; helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 11 Aug 2021 21:12:14 -0400
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

Hi,

Are there plans to support using -loadvm with -snapshot?

I saw some past discussion on mailing list including bug that was closed ea=
rlier this year but no recent activity:

https://lore.kernel.org/qemu-devel/162424905685.11837.7303570061857383641.m=
alone@loganberry.canonical.com/

Testing with latest qemu it looks like -loadvm still does not work when com=
bined with -snapshot.

I'm curious how complex it would be to implement this feature and if it may=
 show up on QEMU roadmap in the future. Or if there is alterative command t=
hat can be used to save the state of a running VM and then use the same qco=
w to run multiple QEMU instances loading this VM state running in snapshot =
mode.

Thanks,

-Gabriel

