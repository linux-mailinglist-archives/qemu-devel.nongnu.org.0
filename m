Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D745FD7CF
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 12:34:29 +0200 (CEST)
Received: from localhost ([::1]:56026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oivXn-0001m6-Gc
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 06:34:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oiuWD-0006j1-ST
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 05:28:47 -0400
Received: from mail-dbaeur03on20704.outbound.protection.outlook.com
 ([2a01:111:f400:fe1a::704]:25921
 helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oiuW8-0005PY-B1
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 05:28:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TqsC4EqdojGxyEVd3s0latAEzWYvy5Xz5eMq2jOYnVpuIGLKihTMsZUbViYJzKaWoOBfIZ1DLVlqtEVSJrbft1f2Wb1HVYU7WyCSJGPlv7hErHe+XYjDT4Rd6FTCIrnKh7P7tbSPoVN+UjADeIuQq9ggYvNAY5WKKp6OIAVj027bKcELdiTwuvRNw2a+1Fb1QdPJpfzwatbUy8Zdlu5BRbJBmU9OpLODE/USbLyFPyXxDFz0JjoBVZ7/Zs8QBKsWYHlXJ9iS+utbiMeaioDif3iI/KUW/W2VmWlHow7sJfoTQobQN87gSwyvmHaGvBAAKpMGjm1j4XXL1QYiDMIClg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQygvrujTze5/rYnxzj87MhORFpgDAY547WJ2q8i5G4=;
 b=jeigsFT5o7hJonyH9fyylAZPVWiTjrUVLVRjSOZkVSxe/7uC3gfULlqCDkQFlLEgIlHquRNmutZv5JGnNP3FC5UbbyHjNMTIreidWQGB6rag+fF6RVFJWTyhLpRpXkfjhT6c31gu+oqWSqHK5C/JCOdiIi8PTd481p3IBEMuEs0BzC/2UgcLlaw1sMsN2U6SummNXZq+2HfTYDAkUMByZtkL0IwRDaenbYJzWIU4YB30pdc8fHL0IoWJs9GOuyVM9m5aR5bLb2CVtJeIUYGOYF7bJGYUqgx1f+IlfG5YVSaeeku/Glk91GMBzzkqU7nCXRWKaA7xn+oTySQXCduk1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQygvrujTze5/rYnxzj87MhORFpgDAY547WJ2q8i5G4=;
 b=lDkzRKUJzDfksb0cGiF1HOivGdPSMgGmvqsWY/oYQGOaZxJMPPIRqd8WPLqCcnLP6zTT3lPwqLgllXUIUiN58PzSDLxxK2YZkNPdk6mPaSKUHuXH5SHuuFxT6siKEPE13luY7hAIMofZwQJePnk2jkO9ZMpcIyVPkhP2Ng+wLgEuNf4I4PXWTzMuvgt7kH1dgxKRAr0UIHCagHx+a2Yi+BkHfKTILPe8VOH0YcJE3Npk2EPCALuYZ5BqKim1gLh3Uc4mMcGqRM0xPWmhJJ9ERC1OF3yelq1bDIgh6bde/5S1cvlt4F9TlK06UGUZMjyUGA8scQc2PLiyjMC6ZbSfLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by VI1PR08MB5422.eurprd08.prod.outlook.com (2603:10a6:803:12e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 09:23:34 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5676.040; Thu, 13 Oct 2022
 09:23:34 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, michael.roth@amd.com, kkostiuk@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH v4 0/7] qga: Add FreeBSD support
Date: Thu, 13 Oct 2022 11:23:19 +0200
Message-Id: <20221013092326.2194646-1-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::22) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|VI1PR08MB5422:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a0860a3-94da-4c52-a988-08daacfc99d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3RvRU6fq/V+5P1H8GKQSNc5yu4f0iS8FGyF8CmiRSc+d32QxRiCmX7RhagNo30EXTEQvEP6VrnRhzTmUwlsQSmS9jh3ZppAOXquyc8SKZ/BeQGEAfG/kdo9XRVebfq++wwg7q5fCibalErXJNZOiAR+Lma1F4RiKYETNfEtWljB4dxpGQc6kk4vlWa+mc8Z7+TM5d/VyoaQGzRy6Krp9qnFVm2M37m9Vg6qO8SPMEmjCx1TaFw27+vwNxE9mjfCoPXFRk8PkpYH1LKXRchM+HypWR9LTnC5UC/yFX95/hEFJf4MR3FiuM9bozuLri7jM9VDrBDbgq1vsUYgxXhDpFPix7Z16Uud7aGKkmQgJMSw3KiVcvu9J0pEQ0Xh1Im8fPFQAOhrOmQSUmCeRqjfVDzFz25ZjpZHhcsIjHI950cOuhixYFMM17bfyn6g22pkfAMD5R4Q8TDosL/Lux2fbGI7nEZ9xwjU0cs+oilsay5vQhPF1fO4Wpfmjq8zmJKf/8YRKtX4P/an+7NWOP1vPHpjCgrcurDwPYA7ObdOO7H1nAcc9prbhYlrOA6vA60DEKTtDvy5DILrx1ENzyT9InD/nsPGC4619Cdh1aH1M7BmVv0NAyUrL/8OmT3xueKbVM2TCysofnlbd1PeI78eBXinp7Q0E+ruhSsGRiM35xhaBB8Apk9MFBieUbzZqNLtzAgoasKWg2kkCyAQV7XY0WVbmSdatV7Bd6Lb0Gg7N6cU1TfDq8ukYQMOo3JpTItSCM+n03aj4+JjMsfOaG3aSGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39850400004)(366004)(346002)(396003)(136003)(376002)(451199015)(6506007)(36756003)(52116002)(2616005)(66946007)(26005)(6486002)(6512007)(41300700001)(38100700002)(478600001)(66476007)(8676002)(66556008)(4326008)(38350700002)(86362001)(1076003)(8936002)(5660300002)(186003)(83380400001)(44832011)(6916009)(6666004)(316002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amlMbzc1UG84VUExQUx4U3NDOTU5R3pQOGpvNmtLMXVWNll2eWpFcC9ZTzdu?=
 =?utf-8?B?aWNrVmN4dWlaY3NjWEVKMjJkQTZucFRSdXNla1JLRlJpc1dORnRrRXFEb2x3?=
 =?utf-8?B?M1p3ZXpuRTRkU2UySHN1T0FvaVdiQkt6ZkFVamRnMUVMcXlqR2tzQThCWktG?=
 =?utf-8?B?ZGdpYzY4Njd0WUV4UnlvTHFjMUlmaFBHMlZKOVo4Qk1VZ215Vk1GR0xQQzZr?=
 =?utf-8?B?bGMyZ1hBWVhTN3U4UGFxK1Z4azBQSE84bzc3eEFSVmJibTVEQ1YzNG1rSmdS?=
 =?utf-8?B?TVduKzIybTJOZnQwYWswMVYzaU1RK3A4WXlqbVhsSnduNG1hZDRzdll0ZmhU?=
 =?utf-8?B?eW5lWW1RQnBhNzFVRkpJYmNmbWY5S1RPU0M5dVhkdFg0aG43YlU1NjdNMEM5?=
 =?utf-8?B?aXMrYVFkbi9RVW8vZS8zb3JKcmpXWDlJYUMvcldOSjhJbk9mazI0Tng1dUdY?=
 =?utf-8?B?VTNuQm9OelVab2htUDZNQklCMDlmYzZleGhLamlWWmx0ZnVFZGp0eE41bkxi?=
 =?utf-8?B?S1EzaDNlR24zL29jRkcwL3BRUUYzT3hTTVJKZUFqUk5iYlN3SHpRZDZSOHpI?=
 =?utf-8?B?b2drMi92ZzFGMU8yRXlWRWI2RkpuTEFNWndVMGVSTHpnVEN0TGxhUUhyenh6?=
 =?utf-8?B?bDRqaS9XeHpraVNTOTBKMHF2SEJTcWIzb0ZoR2pKaWRyL2g1bGdhNkVuL00z?=
 =?utf-8?B?SmgzSHBMVldRTm9BN2ZvNXl6dkVUR0MzVzhpalZya2xUZU13dkdPeXJpVG1n?=
 =?utf-8?B?TkxaaFZSeFlBSU9jQ0NNOXg5TGc5WWF5NXZSbWcvMURjK0E1alNPaDlFbHll?=
 =?utf-8?B?NE5lNXJweWl5RnBvYk41RHJGWm53Y3NReWRqNzcwMHAvNEI1ME9Nd1ZyQWhm?=
 =?utf-8?B?MDVxOHk2bW01UmtuZmxJSzR6eXMxZS9kekE4T0FJZkEwTzF1YUhzQlRzZFJi?=
 =?utf-8?B?NjZFK1Vmd1kva3FlSlRFek1rdDRDQm1ORTBtMzNFMTNKN1FoMlhBSzFReUhS?=
 =?utf-8?B?YVhhTnRKUEZvRlpnT2R5cmZtek9JN0xNT25WR2VpZ2pBWmVST2k1OGlhdEdk?=
 =?utf-8?B?UHdnMzQwcUo3dGJONlU1ZFF4UHlkM1Ftc3AycmZ5N0NiTnpXOFZ3RVA4NHd5?=
 =?utf-8?B?WXM2bjdMQ2NsV2tUUnZNZjltbW1Ja1YvaWV3NnM5d29pM1doaThpbU5Ib2Y5?=
 =?utf-8?B?cTZLd2xuOHFhdnRqNHRzcXJ4bStEVk9mSXZHNXh4VmhHL0V6bG5MeTlnL2pr?=
 =?utf-8?B?SXk0Z1QyT3pIa0hZaFpXSTZKVm80Unc4MENhSURPTzMrNEdPRnI3bWljengr?=
 =?utf-8?B?R0pnSjRQTlZIdEtTellhUWZ0Zmh1cHRIdUhHV0tDQktUbzBId1ZLemg4MmR0?=
 =?utf-8?B?SnlRU2Y0YTlac3IvUTlkU28rUk5QSFpacm5xSCtwaml1Z20wa0dyeE52dENJ?=
 =?utf-8?B?ZkJsQllsMlBnKzdlNC9KV1MvUzlzaWw5L1dFK1FBcTBabDhoem5mYXhtdUM5?=
 =?utf-8?B?c3NpaHhkbS9Ib3VtWTFXMzJHZHA2L3NkbkNYaElzcThkMSt6ZjZYdThIdTIx?=
 =?utf-8?B?b3hQTFRCTStiRFo4SWkzaTRpNGZHNndFazlkSTZsSldwbDVDQnViWmVsMkhn?=
 =?utf-8?B?S0RZZi9vNWVGT0pHY0xnNGNrY1R3SytkQ3pKdXZ4RCtvWjYrZWFDbW9YSm05?=
 =?utf-8?B?Ym9KUXhwdituNm9ueDdPU0lXSW9wWHFRZDg5WVdLalpPS0ZSdGkwem1YWXNP?=
 =?utf-8?B?NWtxRE1rK2ZrL0YvVDFPd0FrV3UyemQxUTZoTW5qTjdBSlNOK2NvRWQya0hV?=
 =?utf-8?B?VnpjS21nZ3R5Wmt2d25zVTRueU5PeUdrMTJoQzJOQm55eEtYQ2RRL2lPM3lF?=
 =?utf-8?B?eVM3RHQxbUMxSms5Nmo2Y1JPZXN2ZG9yTittNUlhTTZZYnFiUzBPc290Nnk2?=
 =?utf-8?B?ZnZ4andlSnB5SDZDTUtJQ2YycEhXZFVLTUlHcjRaY21LYm1HS3d1RStTVmlP?=
 =?utf-8?B?NFNDaUxrRUdLeEcvYjNoNTZVdWJpOUxpWFRHTm0vUWxLOE8vK290bk9YTHRO?=
 =?utf-8?B?MHE4cnhFcmlIeHNxVGJ2SW00bnZuZFlyWGcxV29CQVBtRjNhMzJzTUFseEc3?=
 =?utf-8?B?ZTR1d1JNbW9PTG9TT0tFWjg2VG82RWVlTzR3dmNlODh6UWFnYXlLRXltSGc3?=
 =?utf-8?B?UkE9PQ==?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a0860a3-94da-4c52-a988-08daacfc99d8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 09:23:34.1068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w3UkfgTYD4p8nIQmJ3gQ7z+5P5kfKjGQQ+m5QZjj0zBAkreM1jz95qgVIpYMtkf1oyph47zgp0rWXBTTl3Mt/S17ivIEZ/uHeZH6GCvHIIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5422
Received-SPF: pass client-ip=2a01:111:f400:fe1a::704;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR03-DBA-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Add freeze/thaw, shutdown/halt/reboot, password setting and
guest-network-get-interfaces command support for FreeBSD.

v4:
6,7: Return bool instead int in guest_get_hw_addr().

v3:
1: Add a comment about echo suppressing.
5: Replace code moving by splitting the code into a few blocks under
   architecture conditions.
5,6: Move actions with dumb qmp_guest_set_user_password() to
     the appropriate patch.
6: Fix error/obtained return.

v2:
1: Reject the idea to move all the Linux-specific code to a separate file.
   First commit now adds initial support of FreeBSD. Fixed device paths
   and fixed virtio device initialization (disable echo). Add comment why
   we should disable the code under HAVE_GETIFADDRS in FreeBSD.
2: Replace the second commit (which now is the first) by moving
   Linux-specific freeze/thaw code to a separate file commands-linux.c.
3: Add error raising if stat() returns error. Replaced strcmp() calls by
   g_str_equal(). Add a comment explaining why UFSRESUME isn't necessary.
4: Replace #elifdef by #elif defined().
5: Now the code doesn't move from one file to aanother but still is
   moving inside file so the patch doesn't become easier to review. =(
   Fixed typos.
6,7: New patches. Add guest-network-get-interfaces command support.

Alexander Ivanov (7):
  qga: Add initial FreeBSD support
  qga: Move Linux-specific FS freeze/thaw code to a separate file
  qga: Add UFS freeze/thaw support for FreeBSD
  qga: Add shutdown/halt/reboot support for FreeBSD
  qga: Add support for user password setting in FreeBSD
  qga: Move HW address getting to a separate function
  qga: Add HW address getting for FreeBSD

 meson.build           |   2 +-
 qga/channel-posix.c   |  19 ++
 qga/commands-bsd.c    | 200 +++++++++++++
 qga/commands-common.h |  52 ++++
 qga/commands-linux.c  | 286 +++++++++++++++++++
 qga/commands-posix.c  | 641 ++++++++++++++----------------------------
 qga/main.c            |  13 +-
 qga/meson.build       |   6 +
 8 files changed, 780 insertions(+), 439 deletions(-)
 create mode 100644 qga/commands-bsd.c
 create mode 100644 qga/commands-linux.c

-- 
2.34.1


