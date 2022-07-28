Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E61DA58449A
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 19:07:38 +0200 (CEST)
Received: from localhost ([::1]:33946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH6z3-000411-At
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 13:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1oH6uZ-00018Z-4L
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 13:03:00 -0400
Received: from mail-co1nam11on2062e.outbound.protection.outlook.com
 ([2a01:111:f400:7eab::62e]:39072
 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1oH6uU-0008FD-9T
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 13:02:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A0ynKkHCeXdkT5qLi0uhPchMNzSzWzfNKSqrMGcB2p06t4tEcWUxwhNim+2F8QJVrooPYyiS/tvzTTdwydGnNe2zjsxl4zYnqun+qAfPcQVSUPRZeN17DBBhbMgi5/OFSAZpL3mKnh+OWqs+8Mwrhi8Xng/lcWi51tH0owlGcXHxOQlLOqcU2fPmXCV1yyLcqbjWFI0ne7t1yHHlNGxnPKmVDk1P+1KwGHDFDcxvL549Sry+J5nCALf9ocxdKxF6kEXSPdXxseBQ0RjJ1q3VnVVnA6wpjXfETyXW37flGPWAUfVNMHW7Xpiyjd5C66VLUZu7co1Z4DIlpwsqKV4NGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4bLPadNEhqX6P+FD+2AFehiS+K8DPiRXIDAGsh9SVY=;
 b=eMiJVRjA4Fd+7Wmvk3hIX4FNPJHL9iZU029AktNGLJdgcQNo0KNcFZtz+6u28h/xEbv0txradHvTLQQ2gBFk1l6iR7ZB87TDeIxmwmKyIeDJEeKI+yduCSi6tr0wEWA27uurJOPf12WbFzjVpkHjjneX9SJgRsVO3T9MNzJ4v8cxZQuxC1S0F9msyEtD7ebHvWJJDi+L1f0IVek78G56Vw2VPghngjYHRadcWSOjH5EH40uvx4IVwkZa+n67udqhifjhqGE3L6TkPc/CQkxm52ulwpu8sv4uSQMgptk/9GiAnA34V3++Ndrcmo/lf1S4WVH5iJMlMBThDGCXzn+PKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4bLPadNEhqX6P+FD+2AFehiS+K8DPiRXIDAGsh9SVY=;
 b=5tcAnNsfSrjMBW3tySIYM6V8X3epKE9nZxjmNSK357yViIsIC7NGrh+VcUBbkGkmtf0lugaPyUo5o/dmhwNKrLJQZ0zfg/6LO6uPtIGdbli1xBkwwKG/lPOr/TzvoOyu9mQfUalu5ZqUEvx8i0zuGlGuF6XDUPnqH7kwZdewDfo=
Received: from BN9P222CA0017.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::22)
 by CH2PR12MB3926.namprd12.prod.outlook.com (2603:10b6:610:27::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.22; Thu, 28 Jul
 2022 16:57:45 +0000
Received: from BN8NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10c:cafe::66) by BN9P222CA0017.outlook.office365.com
 (2603:10b6:408:10c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11 via Frontend
 Transport; Thu, 28 Jul 2022 16:57:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT049.mail.protection.outlook.com (10.13.177.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Thu, 28 Jul 2022 16:57:44 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 28 Jul
 2022 11:57:44 -0500
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 7.1.0-rc0 is now available
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <richard.henderson@linaro.org>
Date: Thu, 28 Jul 2022 11:57:29 -0500
Message-ID: <165902744932.407137.16336985253861525657@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71fff46b-97d0-475d-6042-08da70ba4add
X-MS-TrafficTypeDiagnostic: CH2PR12MB3926:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c6JzNiO6wnA/rgKIRPmc6vJvAGuAETh6ipU+2k/u9EqCfyFrd/t2BATcj3hSoeqZvooLRtgjhR81f73APLX02y895e9c/tsBZZqSk153gQf59mZnXxYtYJGwkhOqBnatKlSNW//0ho6cPfna2IVp0TnnwXhDqwNlgFD4csrxxFVWoxUcbpHC0TCmy7HeP5XjgRZZ9+aeJ5rztU85+5FtqWb4eOFMlbZQhDVZ/VagOUnTJl71sCm4NZoJMvi8i12Yw50n9eF3Sw/R7yI3+1qvturTMWUSbQwLm9zvpSCOvSgf9RTOrQecRXFXp0rZNkzOVwH0Hm9y6KnG4LHkeT/j/4h5yGa3Q67Iz7kpZh+MpMmVzQ0JvzyXx9T7+dYwtCopOUhuHQshN1AqI5PC+PTQPrrSMcmwaipfaoO74jqLHd2kfOhGeyLQWJ92uX1ik5ZBkQTswCcw55JEdaaE1ZTOTOJATUiXtrdVxwjOPNySSkWqg8BHpUS0E2w/48rmt4rhX8OSlVcHPnWkz+rKnofGb0se/tmtxKzbDRWnTvJdilLI120k7HG79Mw5F1w6yw9QJ91rkf8CiU4zkx/b1B93RZuUjzb9nFd7nCVynztw9KHKt8JyINdlIkh2dFdaYMxL9+gSZ+9IDf28dUHj08UajkfqMRy8f8SjO3OZ3OgorBLABF1MC3PPvHI8UrGlilxr00aS5hE7CPwzOkYwefJMCcultAXRcaweoMAA6OFYEMYAr/qnkL7FSJVL9n75z5Q87HWF/xBNl6P15cB4aaPFDImi1DhYFERDIPeOWTdO+ZjOFZV4DNuEhEdjYHMmML3U2rLImsL6WbQjtyTIAmCrltEo05DiUR2TG2fELnrMggQoItJ28NyG27iUsbiaEa97
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(376002)(136003)(396003)(36840700001)(46966006)(40470700004)(70586007)(26005)(4744005)(6666004)(70206006)(83380400001)(6916009)(316002)(81166007)(336012)(36756003)(8676002)(47076005)(426003)(2616005)(4326008)(40480700001)(16526019)(41300700001)(82310400005)(36860700001)(966005)(40460700003)(8936002)(44832011)(186003)(2906002)(86362001)(478600001)(356005)(5660300002)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 16:57:44.7815 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71fff46b-97d0-475d-6042-08da70ba4add
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3926
Received-SPF: softfail client-ip=2a01:111:f400:7eab::62e;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

Hello,

On behalf of the QEMU Team, I'd like to announce the availability of the
first release candidate for the QEMU 7.1 release. This release is meant
for testing purposes and should not be used in a production environment.

  http://download.qemu-project.org/qemu-7.1.0-rc0.tar.xz
  http://download.qemu-project.org/qemu-7.1.0-rc0.tar.xz.sig

You can help improve the quality of the QEMU 7.1 release by testing this
release and reporting bugs using our GitLab issue tracker:

  https://gitlab.com/qemu-project/qemu/-/issues

The release plan, as well a documented known issues for release
candidates, are available at:

  http://wiki.qemu.org/Planning/7.1

Please add entries to the ChangeLog for the 7.1 release below:

  http://wiki.qemu.org/ChangeLog/7.1

Thank you to everyone involved!

