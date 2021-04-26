Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBE936BAD8
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 22:50:12 +0200 (CEST)
Received: from localhost ([::1]:41886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb8BH-0004N5-9U
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 16:50:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1lb89E-0003hj-S0
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 16:48:05 -0400
Received: from mail-dm6nam11on2078.outbound.protection.outlook.com
 ([40.107.223.78]:60256 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1lb898-0001aN-3c
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 16:48:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffiWd+OD5GKHF0YWdW9vO4n7ensHVXCLQR0WQh7O4WouEdaqad60fXrLx6Wi2mgc53gQDJEOcFs0YmnnqyDzj4t5kkvDnlUHQVqSxSL+M9oAYC3fHuQiZXhH0gGWcnTFWPdwmyHTv18JKCjKPpweBoA1zkKdDBsi76zT/xmmGFIMgojtTiNHbBX08yT+Vl2BOn14FkEgwTscZjegj7RJdGgRiy3c4KmpkMWwoOzvVCa+CzhN0XkTKzkFipLFEgaLBt3b/f74Uhg6HIhoZ6m6yyDoEm7Wy4B3SmXdTu61hBOh7VQ2WRo+TO62PbILalWwNfvRaTM3EjB6K28YLPEiUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFCHXPnyTaL8Mmilc19ZaYdMRkqfahrUSsxiMNk20uE=;
 b=DG+N0yPfmamiQVLV5I9X9rs4xkUMK1ZuHdBkDS3XwFURHVwtegr7TouzmNyvRO9MAQt7bD8f3ZifYyCTsTrKE6XegRbaIG2p4+dd7OI1dFRMO+WrXkyp7D3PAR7KkSN3RFvEVlocBUSqfCULrvlferYAD99/8O4BezaMn7CqGEtfr47iVEvRUy6UhDC5+biOMi/9oxqK0BLoAAtlqTc7LQFQdbz/SHNF7wvJ70YJOB4JtLGm6NyLJPcepNCxV890oh/90dwa/fA9sFYoiHGutCD+0UUo95nCOTLUoZngSDIc+i2N93G7RO8AWtWKJecWsxmjsuK2Tpa8k2NDgk/NOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFCHXPnyTaL8Mmilc19ZaYdMRkqfahrUSsxiMNk20uE=;
 b=qmOpbaGIJaAJiM90VluRzFTaEsjBCun4mi71OujZJShdllhdgtPG1zddBLL6n8ELbWNZGE+7XOYwsGp+mIlXRpPfq3lohvEOQEoh9gUJA8ZIp3xoO6PjmYTbwlLdUwqy4NXNxIAII18Z19XGuXDTK8VNKba/OJlcEljO07s08nc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB5018.namprd12.prod.outlook.com (2603:10b6:610:65::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Mon, 26 Apr
 2021 20:32:53 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::929:2a80:f737:86fa]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::929:2a80:f737:86fa%7]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 20:32:52 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 6.0.0-rc5 is now available
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Date: Mon, 26 Apr 2021 15:32:44 -0500
Message-ID: <161946916464.679257.18222470498817392933@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [165.204.77.11]
X-ClientProxiedBy: SN4PR0401CA0019.namprd04.prod.outlook.com
 (2603:10b6:803:21::29) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.77.11) by
 SN4PR0401CA0019.namprd04.prod.outlook.com (2603:10b6:803:21::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22 via Frontend
 Transport; Mon, 26 Apr 2021 20:32:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41ab95d1-343b-490b-12a1-08d908f27741
X-MS-TrafficTypeDiagnostic: CH2PR12MB5018:
X-Microsoft-Antispam-PRVS: <CH2PR12MB50182FDB82EED5AC366B7DD995429@CH2PR12MB5018.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3fAW+TqUv1S1wGxH3Vdlb03PUeEi0aAJKlzxBcv9709TmvIZy940FLD3B2XDnyPyqZUByk+/L7yEVuUVzbTtx5T3cj/tBUP7cWWLA+lMWCewOQpOccm3FMwiHSnzBF6T6fL+Nq9rq4mEcF6cdBEAWlK68IsA00JEPkuFbPSjyK5cDfn0hiVZvd/zMafJsBYFLLKeAVQCke3tbvT/DLxP5ELQ4a2NdoMT+5/sKr6LJHPvg3CrC3l10H99QNc7GlPJT24emHj9rOEoLG6lqsuKpiyo9Mg44zQ4uzsHIjaYXkfQO+mqfrVvX52y9IhdUOkbyleP9EIjvIHCNN9HxdZpi/el4yanw9RJbnzpuJzOdpn2TA/Al6PER8cvzl/F1pZUKLNg09F2gNuEyF1902OKKOlna1ALwKFfDAPdliJPayz4GNjSQIerAR7YGs3F/447y8/qfXAicL3wXUUGe2buk8ZSNHlDw0ZwQ6mMD6EEBVVm+uruQ3fo25Q3owzUz9D0M9polrYK4bSjUEpD2ZOSdk56iG0SQd7lZXspKMuelZ9kwCwSuvQQm6j9++FASwXezkZa2julL/tbbQ+uLl6HdXedxfZFOf/7r70GrclDGXj0BG4NWE0P/OzIjRjoq93ZQUoMu4oj/e/PYteMh3gWztZpRi3kqYHKA6oQoVKkmnK812Vq4FblQ/QVSVf/1HrGfky5aKzas7PtGV0MXRoSZ9s/peTKMBiJNQQsG0JYFWU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39850400004)(136003)(376002)(366004)(66946007)(478600001)(2906002)(5660300002)(6916009)(16526019)(52116002)(4326008)(8676002)(66476007)(956004)(66556008)(36756003)(6496006)(186003)(6666004)(2616005)(966005)(26005)(66574015)(86362001)(8936002)(6486002)(316002)(38100700002)(83380400001)(44832011)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZHRGY250Wm9aMU9EYXNyWnFoZmhISGk1NXY2OEpvOUljeVNCZUtwVVVtQmFF?=
 =?utf-8?B?eDZGb0d6ZjdLNngrNVJyWGVkSmZKNWlxMEtLd1BRYUZRQjFIUUFYZWtKTTlM?=
 =?utf-8?B?TXdQbWFNWlFqY1B0RzB3RVpieUQxM0ExNXJKSEI4dGZPYlBkY3VuSDJwdEY1?=
 =?utf-8?B?Q3MvYXBPcFZsTzQrak9TcXMzTzFoNzhkNTRXelRRY1FFU3AxTVVGNTlpMU55?=
 =?utf-8?B?ZHRHZ28vTW9HaWRsQlNxSGE5M0NzVWYvY2JES3hyeklxaElWYTFVKzdpakg1?=
 =?utf-8?B?dThJaG9nL2hEclV1eEJTN0RIOUVPbUxrOXl2UGNMYlA2VDFaMkhCdVRuZUpm?=
 =?utf-8?B?TGMzbEFrckZIUHJMMVpFYlU4endZa09aVVRZZ1BiOGtvb0ZSZzJnUC9pb1Rj?=
 =?utf-8?B?a3k4VmRWanUzNDJyaHhoTUtvN1c5ckNYS0hUcnJKQzZ1VmRoNmo3aGFwdk53?=
 =?utf-8?B?WmNDWTV1akU1b0w0MFpEUEJ2UlcvUlpUQzRVNFVSVDFRaUNvTC96T0RQWEta?=
 =?utf-8?B?bklFWGhhRVZkVnF5am5ZckVrTzJrQit2Y0ZKaC92MDU1ZG9hWGVXTXI5MHNN?=
 =?utf-8?B?N3RXUitrSUFKcmNydThvdGlCTDBLV3lIQVNIREFaNWdYeVJaMm16K3lFY0dx?=
 =?utf-8?B?U09HakhiR0RhVWdvTEQrMk4wNFR3WlJzem5QamFmR05XaE9IWEpPWjYrbU80?=
 =?utf-8?B?UGlsS1J4RC9XNzdVeWpLaFRpOVJ0RnZsaEZhZGdpZkExNmxWS0wzMEFoQ0xE?=
 =?utf-8?B?T3lvZlNYRExMUHM4Zk93Wmg1T1VjRE5tYzhXTXZUWEtjR29OK1dwcDA1V1Rp?=
 =?utf-8?B?bDdHQjV1dFFIUkhRQUhWVzQ2Yk1udDJEREhnYTg5ckZydnVVdmRXOHk0T0Uz?=
 =?utf-8?B?RHQzVUFtL0k5TTg0aGs2WmdVUXRUSi9LMnc0R1hVM2pVZjlpUGNCWGI2Nldp?=
 =?utf-8?B?WmlPWUU2WFBVZkFUQXFudHNzNWFaMklRTG42RHMyTldZYktSVU9pRGY1QXZH?=
 =?utf-8?B?R0ZyZXVPOFoyYzB5TjlIWGZQUStHYTQzb3VGZkh5ZHUxdkowcmNxdFlKYVVF?=
 =?utf-8?B?c0VNd2d1VXY4eXBQbjRkendzOWN0VjlHdGhpZDdTcGhUUUNHZzZoaWNWK2pz?=
 =?utf-8?B?Y2RrYmc0V1JXZ1ZyTks3RGdFNXI5UjJ2QzVCQU1sMmVGMHIvM3lVS1ArK2Rx?=
 =?utf-8?B?a3JjR2lDd2JEM3Jwc20vQXRMbTEza05WMHM3bXZkUXA0SFFpVXlONkxYcGFF?=
 =?utf-8?B?MnBuVk9zOHFmNUlmdllQZXZ1Y3BKOXQrK05WTEp0dVQ1YXpodjArL01UNHlU?=
 =?utf-8?B?d3orTG1MUjhWb0RWenRDRmdFaUFsajFWRGp1V0pwaHAySnpFN3RpTVRhVjNa?=
 =?utf-8?B?U0JMbHg0T2Q2MFFlei9vWnlrQ0x2bVlxY3pKbS85NDFCeTZ4aDJuTCtqSk8r?=
 =?utf-8?B?VE81Qm5GWjlQQ0ROUUt1eTFZZ3MwSU1sSVBKbGlaVzVud0NRbkZIT2g2RjdS?=
 =?utf-8?B?YW1UQ0FxMnN3a3BkbU1nOWlOYXEzQ3daL2MwbjVLRFg5d2ZYUUtHVWNZYzZr?=
 =?utf-8?B?SmRRdHgxZXJ4SUNhdG1GNFlKcUhDSzkvM2tMYTVMY1Nsb2NLa2lrSzlPQzJn?=
 =?utf-8?B?SVVXWnd2a2xHMnBaaTdJNXFVTzM2eEJVZ281Y3p3Q2RvU2ltaldTdE5BWEVj?=
 =?utf-8?B?c2pFVWVRVGoxcnJwS2VES0FxUjdmbW8zU3V4dFFGcnU4QlhicDhFdnRET1Rv?=
 =?utf-8?Q?/FGp5xsiDImnYWKiYnyY9YUI3DRgDrDqwSEy1EW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41ab95d1-343b-490b-12a1-08d908f27741
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 20:32:52.7318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3mNnzoQHCn7lWjVlD5FqxZ/n1GR0Hs93d0H0E3U6s1H/lKsdyeDpSJ0cM+txvWyyGRR2amUEm1Dg62Tj87mOnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5018
Received-SPF: softfail client-ip=40.107.223.78;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On behalf of the QEMU Team, I'd like to announce the availability of the
sixth release candidate for the QEMU 6.0 release. This release is meant
for testing purposes and should not be used in a production environment.

  http://download.qemu-project.org/qemu-6.0.0-rc5.tar.xz
  http://download.qemu-project.org/qemu-6.0.0-rc5.tar.xz.sig

A note from the maintainer:

  Unfortunately we found a couple of late-breaking bugs that we felt
  needed fixing before the release, so we're putting out an rc5 with
  those fixes today. We plan to make the final 6.0 release (with no
  further changes) on Thursday.

You can help improve the quality of the QEMU 6.0 release by testing this
release and reporting bugs on Launchpad:

  https://bugs.launchpad.net/qemu/

The release plan, as well a documented known issues for release
candidates, are available at:

  http://wiki.qemu.org/Planning/6.0

Please add entries to the ChangeLog for the 6.0 release below:

  http://wiki.qemu.org/ChangeLog/6.0

Thank you to everyone involved!

Changes since rc4:

0cef06d187: Update version for v6.0.0-rc5 release (Peter Maydell)
5351fb7cb2: hw/block/nvme: fix invalid msix exclusive uninit (Klaus Jensen)
ffa090bc56: target/s390x: fix s390_probe_access to check PAGE_WRITE_ORG for=
 writeability (Alex Benn=C3=A9e)
bc38e31b4e: net: check the existence of peer before trying to pad (Jason Wa=
ng)

