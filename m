Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ED83E8500
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 23:13:39 +0200 (CEST)
Received: from localhost ([::1]:33226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDZ46-0004wl-Eo
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 17:13:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mDZ2j-0003lB-Kp
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 17:12:13 -0400
Received: from mail-mw2nam12on2068.outbound.protection.outlook.com
 ([40.107.244.68]:7122 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mDZ2h-0001uC-Ew
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 17:12:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lit7Zxe/BK+/cbIlAaXWo3GH3mqcJk4bsWfC2nwSHNOPXWCZHAs3aTO2IK8GJtDQcgtQEHcZ4dKQmsJWXGZ2OkgftX84Ur1wKDg/7/WVZK1PFNOUbuYsTHUr6qO3L4OO2XVmoCgINnutKO3KsfQaS/fiZ3hjIP7PZ4m1sZxzG4itYTfYU6Om0MhV/5K/TcG5OIX7zjExEelWrVqhiGdyHgXfnEwuHJ1xPzLqkrDvqKyQF36LS36vIbWwzf9tfJ+kt5nUViFkxMXwEgEw9mIn1Gkwcl9GC0R24zfwYK9IfkB1SRY5Hm+JjcCA5D7js/oSVCAqUXNzCjJhsrbxyd06BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EEZ1hl40gyD0F16beYh9mmIN+tG1EssMFbT40j7Y1Xs=;
 b=lrkqQY230sdFs+xGDyQo0laEx5txH+Q9CcvSbuYF/hRr76U5MgV9ny9i4oAKfDPkzpjtJz2SZhR5O/GCvpP50CjolFr7fXCADriZy0oiXLGpIAE4IWkuiQwvJVtKlS0oL5N6tEt6Jw2ZwKp4/CYmhrsdyQ0BthbWj4NLJ73iGwhV6n4cKYAr/5CuiJpnCHqI+C/m553M1x0/195kLBsR63WtLrfqsdRDyX5MGYm9TrGEPsG76lFT94Tembr/w+1EafDqPARndu+dQCrvFVLym84UZI58bi5bFbP3Zwn4AtYQ2konP52IQF3DK9V68lnj2jQto4TlT5YyWxDDwzdSDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EEZ1hl40gyD0F16beYh9mmIN+tG1EssMFbT40j7Y1Xs=;
 b=03boDsDnGAaewjXnyAwSZx6TIEpSEVCPP3ZuKGfObu1xWiikECdO/RFOtmoNtGIh6pnB2+Gu8w4kJhCkdXZLe+APAuxzHZ8D8l0fyGuebQQhv1R1v5seBz5WeXy5O34EAYJrIBxW3LYzXuYG7cHI5juBNeDrSI8uGwtHLrYjXFY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB4969.namprd12.prod.outlook.com (2603:10b6:610:68::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Tue, 10 Aug
 2021 21:12:07 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0%7]) with mapi id 15.20.4394.022; Tue, 10 Aug 2021
 21:12:07 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 6.1.0-rc3 is now available
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Date: Tue, 10 Aug 2021 16:09:00 -0500
Message-ID: <162862974021.269885.15077375616676906595@amd.com>
User-Agent: alot/0.9
X-ClientProxiedBy: SN1PR12CA0076.namprd12.prod.outlook.com
 (2603:10b6:802:20::47) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.77.1) by
 SN1PR12CA0076.namprd12.prod.outlook.com (2603:10b6:802:20::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Tue, 10 Aug 2021 21:12:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2260b4a3-2459-45c3-3172-08d95c4382b2
X-MS-TrafficTypeDiagnostic: CH2PR12MB4969:
X-Microsoft-Antispam-PRVS: <CH2PR12MB4969615C2B71AEB87D4B81E995F79@CH2PR12MB4969.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CQlZbIZwzD3QaUSWeJ1cmpWjhOTIqGmbkvwwMH19H07S+iuj9I1A6TpuO8r3/QgJENUQCpSiLXLPV0uU+Szr7yLQWdg/UvjIC7NZQM3kCie/ZC7jzUXrYQvXurifyTUuvprNGf8Wq+jNHsmFxtA1dGpBZySo3zO/HgAWSqa2XJFICvzcDmgQtu+zUqw4U1IydOw4V1bMYyRYRDNO3c+nRcvGe0hMYtKcb+Ha/lnP/eEQA7mUpRxTN1brfSa+mOTnbJwI3M9FLvbQgFhb9CxEE4lqqo7m/5XtIQGxUk5L4OwWxbT8qCdKV4oCNRvrToiibl4mImdZufkWxcgFPNBRKNoie/2ODqyce7V3Qc9NgsjEs2bVoJGTrViH11QrYusES7SS76FPnBjvXXF23fOcaahV0OWnVhmop2cqzqfPL+TYmrEOARwS8nUtutaCgXDomyeIZN5iZ86gf7PvFmyfXUOVEFzP/DHpIDsQ/Tu/RoZ+cEKKrCQZfDat0BY9l14RdVmY0TDSqtptDUhMhTYGiWKEZMVr8BLESHhPoAxzOnbm4UiMcsMADan+W9rl0HdjH897ICA1yEqZEzYAhxbp28N1v+LiTcEVlSCWqbtgLGJO160Tq4QxBKY4mmg4P0mplIvQ4XnPXhrUOJrUZ9XpIU1b9A8PkpcJW23bLJsOuqWI/Opbax1+6o+HLGbG/ytFouh4nx1qtvnKImEXAXsek/LaA23K4aK49JZdrxWrmUsCv/mTt7XVyM5sOyv9b0ymhB8FtfpUPbYO/ROEhFuPD79x6eJNyae6dPNPYX8riqeL6Xt7Rjus4ZtpC5qBH7Mo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(366004)(346002)(396003)(36756003)(4326008)(316002)(83380400001)(8936002)(66476007)(66556008)(66946007)(956004)(6486002)(2616005)(6916009)(2906002)(38100700002)(86362001)(6666004)(52116002)(5660300002)(8676002)(38350700002)(26005)(478600001)(44832011)(6496006)(66574015)(186003)(966005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDNIQUQyRnlNcFRHUW9oNUowdXd0ckxPaVV6ZWljc3NMbDNqY3d5aUFJZXM2?=
 =?utf-8?B?RzRxYmJGK0lpb3dQSFF2WWRrV0l6OFErcitUVXRsNm5wTUFvOUhsSk8wWnFS?=
 =?utf-8?B?Y2JQdUVuMmlqWVVVRnkrZDRVMGMwOEx6L09VNENOVURmR2VtOHNNM1F6WFRh?=
 =?utf-8?B?UzhDZWNVVmJMMXZRV0pKUndyUXhMVE1QVmh4Rzd3VnRPbGVjSnphbnYwTXdL?=
 =?utf-8?B?U3FzdTI4U0lkZnN0OUtTQVZ2QS9XR1lCcW5ma09RRFUwN1N5NWZoRUlLcElQ?=
 =?utf-8?B?Vk9VQlhjR2tabUNMYzMrb05aSHMvK2toV3NxVjJ5ZTZrKytTdUVLZFhFNlZz?=
 =?utf-8?B?bTVqaGI4L2xLcEtPdGZwcVhGTEdOalVlWWNCVlBmMFV1c3dubC9YVGNkeExZ?=
 =?utf-8?B?a0FjRzl4clBJMmVGRnBUWUlhZXd3ZzhOaVdxYTk3cjZIT3J1L2M3Ymkyb0Qx?=
 =?utf-8?B?NmluNTZEZG9aSkZUZjYxRU5VN21PQ3FEdkpDUUk4TnV6MnE2TzBJOEE1OWtU?=
 =?utf-8?B?WEZhaVh1L2UrcFd3OWtXdDZUS0l5NEs2M20zMmdmNnBhdDV3ZlNFUVo2NW1o?=
 =?utf-8?B?RGZ5L1FWOERXZ1FRcWFST1F5bDV2cmMzNlFQK1FQVnk4MThXV1JablpnU3JS?=
 =?utf-8?B?RVB5S2Q4RndKTlB0VHdvdG9CQnc5TkNPdjI0NS9Zb0czR0g0MjdBZ1VSUXNa?=
 =?utf-8?B?U3pTOXRtdit1S1FIOVptZ0FjSlJENkYweUhtYWpFbERBSld2TUpWVzlsUms5?=
 =?utf-8?B?SEpVZDlIUGVaQitTQnY4MXJKZk13aTdkRzhtd1BiVTFiTkFtcjV6YjVvWWh0?=
 =?utf-8?B?bkF3OFQ5MEpaRENXNkpjZDVBV1FlRnROQWxDRzBNTVEyMTRuZklLSU1jWnRC?=
 =?utf-8?B?WEp1N1Z2bFJUK1pvdnpTQWc5YU9Ra0o3OFprdngrQ0F4UllEMjdVVzdobjBw?=
 =?utf-8?B?cFM5YktUVklCZ1ZBVmc2bWMzcTNKQUFTZWRzc1pOaTcrejZzbGdDZlhIMFpK?=
 =?utf-8?B?VVBSSk5JRXFQeU5nb2R0SDYzRUYyY2gySWdLdG9iNWp1cXZlTldyS2tCYlZo?=
 =?utf-8?B?ZTdQTlNzb0ovQTYrVWc2dDZCd0ZSd0d5ZkhwWlh3WWhGRFlXK3RRRVp4dkpv?=
 =?utf-8?B?azFKVm5MbjZwdjJhcHoreDB2UmxZREh2ZEVTMDJxdThTZXViaXNzY3kvZWhF?=
 =?utf-8?B?d25JUUh1aGNnKzh3VVBZU0ZtbGJoOXBwS0E2eDBhb0I2TkhSK0oxQm5pTmVT?=
 =?utf-8?B?ZjFkdzJ0MmRnelRjVlpzeFRMYmkvQzNhQ1ZRaXVQOTE1LytQY09md2VpL2xV?=
 =?utf-8?B?TG5HZ3YvUC9RSzNNd1o2aFE0dWIxQ1l0Z21UQXFxekczVS9ZZzdrdkxpSDgy?=
 =?utf-8?B?ME5aRENpQ1ZzOTNsNlp0Kzg3WjhNTlVQZjlWSW5VU01VdG9EWFdaTWNSdUh5?=
 =?utf-8?B?RWF6Y0tSUzRnMWNvUkVZY3duYnhiZ3JmZkJWakYrZjIvbkRpSnVVOGdQdmJO?=
 =?utf-8?B?NWg5dWNKNG5lSmhDYlMvYkJ2VEN1ZGpLTTlhTUNjbUw1dTlUeHlNbG00cmhC?=
 =?utf-8?B?OHBaTlZ1SHo4SitsZFBTbEo2bFpkcDJMclJHRDlPRGFFQkRHbkw1T3d6NTBF?=
 =?utf-8?B?aVNjNktPNlVWMFdSNHh0UmE3K3IvUjBOQUVJZVY5akRPU0pHUjZ4STVzNnJQ?=
 =?utf-8?B?T2ptSi9Lb1hGZlhpcXlNZkIwU1VBVlQ4aStlZytDSVFLaDRydDRrSkQvRmFC?=
 =?utf-8?Q?9m+mTRKrxpIuBYHRcU65mRtur86oUIKM5GSK5Qt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2260b4a3-2459-45c3-3172-08d95c4382b2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2021 21:12:07.6598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +hqDbjvKrWc7kw6AW2OQgj/Aup/pyh3J/GigvU+E+Wly295crbTuYaaZjjTBVGG9IJxvwDMPXwHU/o9m7QOFbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4969
Received-SPF: softfail client-ip=40.107.244.68;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On behalf of the QEMU Team, I'd like to announce the availability of the
fourth release candidate for the QEMU 6.1 release.  This release is meant
for testing purposes and should not be used in a production environment.

  http://download.qemu-project.org/qemu-6.1.0-rc3.tar.xz
  http://download.qemu-project.org/qemu-6.1.0-rc3.tar.xz.sig

A note from the maintainer:

  If there are no show-stopper issues found in this release candidate,
  the final 6.1.0 release should be next week, on the 17th. If we need
  to roll an rc4 we'll probably release that on the 17th and do the
  final release the week after.

You can help improve the quality of the QEMU 6.1 release by testing this
release and reporting bugs using our GitLab issue tracker:

  https://gitlab.com/qemu-project/qemu/-/issues

The release plan, as well a documented known issues for release
candidates, are available at:

  http://wiki.qemu.org/Planning/6.1

Please add entries to the ChangeLog for the 6.1 release below:

  http://wiki.qemu.org/ChangeLog/6.1

Thank you to everyone involved!

Changes since rc3:

703e8cd618: Update version for v6.1.0-rc3 release (Peter Maydell)
b0c4798f97: MAINTAINERS: Name and email address change (Hanna Reitz)
6ff5b5d6d5: ui/sdl2: Check return value from g_setenv() (Peter Maydell)
da77adbaf6: audio: Never send migration section (Dr. David Alan Gilbert)
7bce330ae4: ui/gtk: retry sending VTE console input (Volker R=C3=BCmelin)
057489dd15: qga: fix leak of base64 decoded data on command error (Daniel P=
. Berrang=C3=A9)
a6d2bb25cf: tests: filter out TLS distinguished name in certificate checks =
(Daniel P. Berrang=C3=A9)
50482fda98: block/export/fuse.c: fix musl build (Fabrice Fontaine)
5f4884c441: hw/nvme: fix missing variable initializers (Klaus Jensen)
abc14fd056: meson: fix logic for gnutls check (Alyssa Ross)
a68403b0a6: chardev: report a simpler error about duplicated id (Marc-Andr=
=C3=A9 Lureau)
64195b0d36: chardev: give some context on chardev-add error (Marc-Andr=C3=
=A9 Lureau)
733ba02084: chardev: fix qemu_chr_open_fd() with fd_in=3D=3Dfd_out (Marc-An=
dr=C3=A9 Lureau)
46fe3ff6ea: chardev: fix qemu_chr_open_fd() being called with fd=3D-1 (Marc=
-Andr=C3=A9 Lureau)
bb2b058f1a: chardev: fix fd_chr_add_watch() when in !=3D out (Marc-Andr=C3=
=A9 Lureau)
bf7b1eab25: chardev: mark explicitly first argument as poisoned (Marc-Andr=
=C3=A9 Lureau)
030912e01c: linux-user/elfload: byteswap i386 registers when dumping core (=
Ilya Leoshkevich)
0c40c18ecd: linux-user: fix guest/host address mixup in i386 setup_rt_frame=
() (Ilya Leoshkevich)
30f80be34b: chardev/socket: print a more correct command-line address (Marc=
-Andr=C3=A9 Lureau)
4cfd970ec1: util: fix abstract socket path copy (Marc-Andr=C3=A9 Lureau)
68e6dc594a: docs: convert writing-qmp-commands.txt to writing-qmp-commands.=
rst (John Snow)
9c66762a60: docs/qapi-code-gen: add cross-references (John Snow)
55927c5f32: docs/qapi-code-gen: Beautify formatting (John Snow)
f7aa076dbd: docs: convert qapi-code-gen.txt to ReST (John Snow)
e0366f9f2b: docs/devel/qapi-code-gen: Update examples to match current code=
 (Markus Armbruster)

