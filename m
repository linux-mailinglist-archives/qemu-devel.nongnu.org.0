Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6642F2CACCB
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 20:53:52 +0100 (CET)
Received: from localhost ([::1]:38086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkBih-0005a7-Fc
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 14:53:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1kkBfd-0002xR-DV
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:50:41 -0500
Received: from mail-eopbgr770050.outbound.protection.outlook.com
 ([40.107.77.50]:55168 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1kkBfa-0005Gs-UC
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:50:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OFDz7QwtySgWWXFsPnbi1+PzxKo82VcagIDieEhyguTIZ2p6Ng7xfkifHbg5a2cPDuD6VgmPpvjaP0FOTwhUBualbTxA85eq/NvWB9z3nxZpLHiZJ5H1kwn1vPkwsuT1TCFO49mn7mOOVgEBM3oRMfT7NS25kmhLrELu1ShmZnf3WwVRbIMmOYC3BAbKZanPdpeGm4SHEJgoOi8RkZouV2h5YMlzoVSVhESybeGKO7UYZbQcSJbrXEjkLFZkWW41fPNl+P8nmJjfhWWsFQWyGWXCuEOfy7aF/pGyD8ZxcdCiKITesRJJ0gmonhZRyhjscxn7ElsxxiRYcHr8v8VwdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=inuIv5l/z0yUoMKKfvNT6ZXZvjsyc3yx+G0OAl4UmBY=;
 b=WXAu3RhnJS55+zwo9QzI67vJP8+s52LV+kTz7ZWas4Azmirw6eIQy4OYN7DkmfBpv/MdN5eS+sTKVw2fNqTeQXd0wG1mtgmeP8dwiibK+K9nZQLVsqKNrQycL5iwMhmKkpU9oicVqqixHv82o2U2MsZmDUHJqs2D03ZRZZbCo0/90kxDd5AEY2ZKz5FpDHZKZSSpUapyZ3zaYsB4UGfzraUG0qhgD8VLHTIP028C7kyN7vVHOF3cPmaOsa7JbrCj4k7U6iP4000l+ovqHVVyjANRQfrImu5gzht3LPYRMAU+qEzZVQSKOR4qapIlAaoTaKr7q6uQZcipuATs+bFA+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=inuIv5l/z0yUoMKKfvNT6ZXZvjsyc3yx+G0OAl4UmBY=;
 b=mLlH08u6Q+3VZGOsCiTSNSVKLNOsK2GfI/Lir6g+xL/SsQj6lWfLF/3p3U4iBcQVpO9trGpov4410WvVH/WxVQijhJPUqlSMgDygDeEDB2vBNQIzva+/Se0y63g7YI23eU4CIJNsuMry2BAjOFmIGqAwHa/JrPbD27iSgaYsFZA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB4309.namprd12.prod.outlook.com (2603:10b6:610:a4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23; Tue, 1 Dec
 2020 19:35:33 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::b965:3158:a370:d81e]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::b965:3158:a370:d81e%5]) with mapi id 15.20.3611.020; Tue, 1 Dec 2020
 19:35:33 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 5.2.0-rc4 is now available
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Date: Tue, 01 Dec 2020 13:35:22 -0600
Message-ID: <160685132294.749809.10154629983286965080@vm0>
User-Agent: alot/0.9
X-Originating-IP: [165.204.77.11]
X-ClientProxiedBy: SA9PR13CA0224.namprd13.prod.outlook.com
 (2603:10b6:806:25::19) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.77.11) by
 SA9PR13CA0224.namprd13.prod.outlook.com (2603:10b6:806:25::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.9 via Frontend Transport; Tue, 1 Dec 2020 19:35:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5f511d86-f952-4b0b-287b-08d896304465
X-MS-TrafficTypeDiagnostic: CH2PR12MB4309:
X-Microsoft-Antispam-PRVS: <CH2PR12MB4309A94AA20EE6511BD4414C95F40@CH2PR12MB4309.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3DSuFHXQwEnLJP86TDHB89Vo9cpAJFDOXEFuUCFCc59sa3fJa7inxFNeBoMHDhc9X+nJnigPEOFV1srXrCVG7It+PeStiHRoOH62jMlbyUVwQSLombsQ0DBWUylP/q2IkUUBVxg6R4t+k0M1fWAn/5Peua6EN0FOM0iU1Q//ZHkRMrY9fXtymWWpKrfdrgBgWskT0gQdf6MhwkFb342M0BJW4iVbUhzdShQmJFQkORUP6SvS0e0xWqNJPAn3od5MCU4poRWKdDHEVZYy+NEI7ArH+RCm5ThWrinvyl4RCeY/KIBoz8pKoSwOKlmta+hbyW1oXkn1s7XWNtOmIHC/CfgAAXtAks7uAfaYVcHFOk2npNoFKpNe3I6NRV0JdzJDtMadsptYdtSiD0ynuasl9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(366004)(52116002)(83380400001)(6916009)(9686003)(66946007)(498600001)(44832011)(8676002)(2906002)(26005)(66476007)(16526019)(966005)(6496006)(8936002)(6666004)(956004)(186003)(6486002)(86362001)(4326008)(66556008)(33716001)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WjdrN1JRRjdkWGtpUDRBdXcwL2QwZS8xUTA0aE5JUzZpNFVOY1VHMjNBWS9N?=
 =?utf-8?B?Uyt3Sjl6RndEdjVYL2tHOUFkKzFSWk1nWlQ3U2ZldFFVZS9oc0xNcjhuQk1C?=
 =?utf-8?B?a1piRW83dGVNeVVzczg5bmI0WWZybEtwUTZWN1ZPSStUUWpZUzNvY0MxZUVi?=
 =?utf-8?B?Uk9INDBFb0FFdCtkVFdmTzlQbDJPTEFBY05pN1FmUUd4THYyL2xRL2w2U05Z?=
 =?utf-8?B?VHhKM0NoZDJ6U1VWOTJaL2Ewc1J5K2d3bU43ZmZjajR4MXlSLzd2dVdZTk5S?=
 =?utf-8?B?Y1NHT2pMNjUvcmlsUmcrRmhwVE9WZ1BDWTBlSGNibVJLY1Q3Q0c4UE1qWWhN?=
 =?utf-8?B?YU9vVG5CWnFNSUZUUHUzOUhJVUlncVBaQ3RwNEVXRjZHUG1rb0Q1QWxYNmhk?=
 =?utf-8?B?b2JXVWlvOU5NUUVSaUtycUY1ZXRPa3pRdlRDQVZtV2FBYmFjd2dCSExja1Qy?=
 =?utf-8?B?M0JnVjVpVXhmTWJoeFp1dW9zUFF6OExNVVNIdk5ZT1Y3WlFEamlYUGMrWm5r?=
 =?utf-8?B?RFdvS3B4YlVFWXlOUVM0R0xEUE1XVjJUUUNraCtnbnE0RWhlaFZRcnF6cllR?=
 =?utf-8?B?bzV1RUZ2MzVnZ2FBYWp6UWNaVmkzbDZFZ21INWhaeXNJSFJTZThHamZ2MjRn?=
 =?utf-8?B?cGNva1FzNHoxMnFEWldTcit6TUR2RHMzZUtzQXRMR0ZacU9sMzAwRUdIT09X?=
 =?utf-8?B?NmFESURWdklwVlFpMlpFWE0xSHpmM3dwRXhtOE1lRENnMXQzWi80WTRKRXZz?=
 =?utf-8?B?UHp2dms4YVpkTjZTelhvMkZaMGFPMndZU0d1LzRDc0FZT0gwRWQvT1p1bDc3?=
 =?utf-8?B?TTkwblE4TjZHUFdlaVhuVHBtVDd6V3g2R2FGNjVST0x1RkRpQ1VtdGozenQ1?=
 =?utf-8?B?TVVYY2IrQzh1aFFZTU9DQ2tPVjM1aUc3RWgzeGViR2cxZVZzYUcwaTQyejRJ?=
 =?utf-8?B?QmZjWGhmbGppcWEyNkw1SWJLNnVuc1ZqSkQ2a3ZzSE16M2I4ZEdsYm1reDFC?=
 =?utf-8?B?em1ZNisxOUFZSnVmOUpHVzVZZkRqS0Vtc0xPb3ZBMkxscXhSdDQ0bjhlYjFu?=
 =?utf-8?B?b0lGcmVHaE5EVXNGM1lDS2YrbE9LTnNGSXNKdG5wL3NYVFBUVUNRQXA0Wlp6?=
 =?utf-8?B?bDQ0cWZid3FvcWdlVG5RQ3NxdDNBVlV6UkRrY0x1Qk1jMXRZRVFPdStvRGNM?=
 =?utf-8?B?aVF1QTFlMWhLNXo5WU1vR3dLdGR1MStjc2JsQjRma0FqRjlsNTd1UXg5K216?=
 =?utf-8?B?QzdaTUdDQTdBSjlaNVhHelZoRk90RjNxRTBET1EyQ1dzdGozZjh0dU9iMGJG?=
 =?utf-8?Q?4W9G4DZTYxn+uCWqBahu/X14TzObpETD++?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f511d86-f952-4b0b-287b-08d896304465
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 19:35:32.9573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 62ffvej3EdPw86XRJyGdzc/dhKO7oV+u+42qLHIAAHb91+/yCpsz+VjRapPDNWtyh90iVeV4finbwiSs6bl43A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4309
Received-SPF: softfail client-ip=40.107.77.50;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
fifth release candidate for the QEMU 5.2 release.  This release is meant
for testing purposes and should not be used in a production environment.

  http://download.qemu-project.org/qemu-5.2.0-rc4.tar.xz
  http://download.qemu-project.org/qemu-5.2.0-rc4.tar.xz.sig

A note from the maintainer:

  Unfortunately we had a few late-breaking issues, so we needed another
  release candidate. rc4 should be the last for this release cycle, and
  we plan to release 5.2.0 on Tuesday the 8th December.
 =20
  Note that QEMU has switched build systems so you will need
  to install ninja to compile it. See the "Build Information"
  section of the Changelog for more information about this change.

You can help improve the quality of the QEMU 5.2 release by testing this
release and reporting bugs on Launchpad:

  https://bugs.launchpad.net/qemu/

The release plan, as well a documented known issues for release
candidates, are available at:

  http://wiki.qemu.org/Planning/5.2

Please add entries to the ChangeLog for the 5.2 release below:

  http://wiki.qemu.org/ChangeLog/5.2

Thank you to everyone involved!

Changes since rc3:

d73c46e4a8: Update version for v5.2.0-rc4 release (Peter Maydell)
8132122889: ide: atapi: assert that the buffer pointer is in range (Paolo B=
onzini)
915976bd98: hw/net/dp8393x: fix integer underflow in dp8393x_do_transmit_pa=
ckets() (Mauro Matteo Cascella)
37c0c885d1: slirp: update to fix CVE-2020-29129 CVE-2020-29130 (Marc-Andr=
=C3=A9 Lureau)
24bdcc9608: nsis: Fix build for 64 bit installer (Stefan Weil)
92ea027017: tests/docker, tests/vm: remove setuptools from images (Paolo Bo=
nzini)
8e84bf984a: configure: remove python pkg_resources check (Olaf Hering)
6fc5183a65: qxl: fix segfault (Gerd Hoffmann)
8e242b3cb4: meson: use dependency() to find libjpeg (Paolo Bonzini)

