Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A2E47D793
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 20:22:11 +0100 (CET)
Received: from localhost ([::1]:52928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n07Bf-0001Em-M1
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 14:22:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n077Z-0007YT-MR
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:17:54 -0500
Received: from mail-eopbgr140119.outbound.protection.outlook.com
 ([40.107.14.119]:46656 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n077W-0001Jb-WD
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:17:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgE2uBUABDgEx6qE+0G2lvLAwQw1sMnOcGJBe7a4mBiRft7Nwkda8Dko8fKZ7+0qD0j0P7oV2wVfmqo4hBpZanvUB7UQDBckCe7+DxflBPT4R+Pu/v7AOVUbb3EZEmT5Y3YpRwm7r/qphJa45gZiilNyqTFAlIPEcE3+Uoh6B+PG8+5ytCqGY59tpfvseUPsOkWcqfemMRSW5OETy8ExGbZ66P1TIs+Z7LkCrGPrVFyQmEIf8clroYrx93cE8Hi11cTuRYVXbSSiw+bekol1lr3aBFV5DUXlwDwDXhQsbVIyaB/0sxDcOEXhMTFOX94f+ZZTIz2LQWdUr0VGou/h7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ECGDfiZFe7GybHSlZNVQZk+rbebvUFGrLrFBLs6UzGY=;
 b=QnzZ5B1Nv7wzCDebIGwGvSqwN3+vzGBHFltktFqnKy0e5swY6t+aBORI/4ssuPg4vJh2FQ1Ai3GP0uGGy6yvcD0qkCf9TttgiS2toid53IQkdlI/ElSxPiLRhyb1czeoxScmrzlQzF73aEKqS4bxG9S0kD9LrwRFkyN2uUMJUOtdKoWlzd0KculsIR1RR8gU59OXNHKgN6fboR2tPloW0QofHb5RydFuZf5a0rJWez20q65qC60uwBNUAY7x8cwZM3407g+J1HyKWBNfNKtX0yt7+Srm9dav3Wf0QUDm6s7KduoCN0Yyj7SNrUyY5nkty285bZMWMSRUi5gBjDZ7cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECGDfiZFe7GybHSlZNVQZk+rbebvUFGrLrFBLs6UzGY=;
 b=GsijmmGJAcdnBYld9DoFv0SMrasUay58p7gRSSyS+yfHFEZUC7/5caDm6HZxjck0i9kPsgTxVa2PsXB05EYXqWaxtuHdQKfcHDZxb42iLtqCOMZQgWEPReqDtvdqW2rm8mup9nMRw6YaMx2Xzw8lnF074MBjwty12d/E3wJLf2g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6290.eurprd08.prod.outlook.com (2603:10a6:20b:2d5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.14; Wed, 22 Dec
 2021 19:17:45 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Wed, 22 Dec 2021
 19:17:44 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: bleal@redhat.com, wainersm@redhat.com, philmd@redhat.com, crosa@redhat.com,
 armbru@redhat.com, eblake@redhat.com, kraxel@redhat.com,
 marcandre.lureau@gmail.com, vsementsov@virtuozzo.com
Subject: [PATCH v2 0/3] qapi/ui: add change-vnc-listen
Date: Wed, 22 Dec 2021 20:17:28 +0100
Message-Id: <20211222191731.467706-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::22) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bfc053d4-5588-45b8-43c7-08d9c57fbb75
X-MS-TrafficTypeDiagnostic: AM9PR08MB6290:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB62908094522B37736CD4B40FC17D9@AM9PR08MB6290.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mkH4FMrUQBR0p45V339TMGFA9aYCdqNTniYrz9IY167FLQdDyXuTQhyIrIxqKdpyesC9fGww6S35H2qixP5+lwg5cjMNv9hD6Bcte1AVhN2DPNrOFhgUmeSOB1K856xDW+lVi/N6your4wzMKjFmSedYTsjUr716NdY1wiUbAmv+Q0TzVO8iNqHO0B/S3h3VWLLVu+/VNEbyNb3utCZfcmKcasaml7lp6Lnh6yntqFKz/UXvRALAAMBLa4GydVyzhnljCmfWrKKvtGgsTDG81jm0n//qLWJjpXTgkuFNjOYqRWHYS4Qv4sLwyh/xWsVdGfST47R7/O6f3m4Eca86yS/wKLko9pYE4Nek/ecESwssIOxUYLaeXB1+ZyOV6ju67rjFlZMMGmITwKvSuPNWrF0LMeqWmYB9YkbdcXWsToJpbidDlVfy4thI85fOmGS9bsHk+37RWmD+M5neNiOlFqSK6gDGSeq9V3x8QkH4cE4stk1upoea0lht9kyujSWln+ehpitd7RiIBhkBQ2m9QAgNd2d7iAmDi6ntmEWtXP5Fg77q+LDZXecIM0ENooKukwS3pFnXOFIcYg0N0NihkzOJqd0mPfSb5IE5DISgnIa3YTI22pDMbX2n3cnz/YN2TaM9Br1X13J4pcBqsvW3PvaSflLyR2J4dNiUhoHVQKAeYU/xcjw2zHCL05DwBYmlkd8QkYb1hs7+olADCk4moQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(52116002)(38350700002)(38100700002)(6506007)(66476007)(66556008)(2906002)(66946007)(6486002)(8676002)(4326008)(36756003)(2616005)(6916009)(5660300002)(86362001)(107886003)(8936002)(186003)(26005)(1076003)(508600001)(6666004)(83380400001)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnlEVWNuVHFRa2Zma1ZBWndKbmVPb1k1N0ozdjVGVVFPM3RKaFU4WkI0NUNK?=
 =?utf-8?B?WjJ3SE0yNSt0V2Rjb0VUeHdDVTdxKzI2WWxnOVllQVk4QUZuUlgyVjROV3Ux?=
 =?utf-8?B?TFlPdWNKS1QycGlhcHhZdFI1bVQ2REZLWjczSlRhQVpMeTZKSExXZW9NbFFF?=
 =?utf-8?B?QmFzTzFFaGRCbUpDMWMrQjhSZnFoam5rMXdDd1NHWmczVEFkTkFudFc4ZXR5?=
 =?utf-8?B?ckRFcjU5R1dQNlRtTGVwYkt2TW1nc3VVb0Z3NWJyTW5aL242YkVxd0pGNjQ2?=
 =?utf-8?B?S09kdWVyVjZIT2ZyMU1wc2hiN0RCV2lMVi9LT3lPOU9BWDR3aVM1ZXNyN0ky?=
 =?utf-8?B?NHhDcG10MzJudmdjSHd4c1h4V3o2ZWNkMGMydlJrOXlYcm5ZM0c4MUVJWHpW?=
 =?utf-8?B?UCtCMWtpcEx0cjlXSmwvbUYydlp3WEFaemR6S0pKT0hxdEo2eVhNNDJtYVdI?=
 =?utf-8?B?K0ZlVHhFc05MQTdLU2krRDY0bXYvR0gxeGtVUFQrNHlsa0loTm5WOE8rd09p?=
 =?utf-8?B?bGdNOUdjdHUyTHdNZHFvbEZBNFdDa29QeW5STXNPRkRaeDI5azROeUV5MlNP?=
 =?utf-8?B?OEtNTW9GNWVVV2k3YnZYSXBZZFZsMnFwcWIwWTUvWHNjSWkrbFhXQnJXOW43?=
 =?utf-8?B?ZU1YRUFYd3JjM0Q5OVU2QW1neFhBK0VYckxkSVB5d2w4cTFFNTRnaGRYTTVN?=
 =?utf-8?B?alI5N1UrV3VkWWZKNDlKSC9xV1kxRHhLOHp6Q1BhanZHd3FMa3IwVFhRTDFt?=
 =?utf-8?B?VVJCNVdUSmtIUHAwaUR1dHJSa1lhaW5jUjhicHZSL0E1RmxZaVFvZlhLQWM3?=
 =?utf-8?B?QmhyTFR4QzQ4ZFNzTEdOQ3Zwc1VsSkl6M3JUNnFadU5IcW1RbllGaE1zZy9I?=
 =?utf-8?B?S2V6WHB5cnFqQlN2dzhTYkRoQmRWTFhvTFBQQVgzSjdXNk1ZZG90WDhMdjJa?=
 =?utf-8?B?K3hscmpyU0VSM3RtZjlveUlPUXdIUnY2MWNvQ3hZRmFPMEJQMFJHS1YzWUJH?=
 =?utf-8?B?VG5Henh5alZ5empDVHhuZFRHVmJ6eEhMTmtYQnJuMldHRWh4UWY3b1ByN1Qw?=
 =?utf-8?B?WXJCUzVZUThQc0tnOEZsRnc4YW1ldElhZU1QMDZtOEtvdmh4T0RuT1FZM0VJ?=
 =?utf-8?B?WGhqNkNVMW5lNFpUcXc4VGNlbi92YTRicktuUXAxckp6YXIyWlVQRE0vaWl3?=
 =?utf-8?B?ZGhOMjNWRjhRWnVvL3pLcGk1NFNjaTBhYjdFbUJHYmJVdzVjTUg2M2F1RnpS?=
 =?utf-8?B?VGx2QkVEeEkzbFJJMTEyMVpNWENoKzhPTk9RMWZhN3A2WUMzVXJWOUlITGdo?=
 =?utf-8?B?VytyZFdZUHUrTnZ5d09EVmpIdGQzeitPaFNvbEkxc0dsUkxpOGM2VlFZRDc0?=
 =?utf-8?B?c1dxVHFDTGhNK285bjlxZWJXTFlTMU04OGlFWkFMVk9mS2t2TTA2OEVWL0dY?=
 =?utf-8?B?WGxyZXZlUGRDbllMeXF1UVMzam1HWVB5ZVY2Y2FGZEFwemx4TU5QNnRnRmFz?=
 =?utf-8?B?NENLNHZkQWpvWENDNnZCdjc3bnVsQ3hFWDlzUEJSMWdxb3hlUW44TDNURWhX?=
 =?utf-8?B?RHJ1eXZidUxHbUxhQ0RxeVM3TDRwMHRHb29RTmtMeE1LOEEvSXFLL3YvT3pr?=
 =?utf-8?B?eDluYlhWY3NJY3RDdEhUN0NrRFp6REtHbTQzUUVpeVhQSyszVEI4bkxGcGhC?=
 =?utf-8?B?KzlSc3FaOFRzakYxRklLVml5b2ZIU2JJNHFHMkRLQUNwc2xVdDNOZnJLbkl5?=
 =?utf-8?B?NTNIN1FYQnduRVZ6ekpmNWFvY3h6Z2FTc2hKbkVFRFNXWnJ5SjlEYmhpVld0?=
 =?utf-8?B?Z3NjejFCc0k0RmtSZUVOcGYveGQxb1dtbUxZcStmSHk5S1gxcFFTQUFjSS9J?=
 =?utf-8?B?MUpXV09lQ2pYbUs0WHZZZldMcnNXUS85WmlSejJUQXFFK0xWOTJSdEMyakUz?=
 =?utf-8?B?VmpTMUIwcGljdWh4RFluMVR2ZjZCMjdqY21PaTlBRVE5R2ZlWW1WL1VBTkJr?=
 =?utf-8?B?NzcyMEtUc2wrelJrZTZTL0lramU1NGpVUzdDT0RlSktDUnQva0pBZEluR05V?=
 =?utf-8?B?TDU2a25pcitZdithV3dxSzBobkRRRnBpSk1tUmhkWm00UHRQOGdkcUNvU3Ax?=
 =?utf-8?B?bTZ0RWR4K1BXd0o4d3FDVVhEcDZNOWsraGV6MDM0dlhRd285aXFuMElsRjBm?=
 =?utf-8?B?YVUvTEFGb0M3OStJS3VpeURJdXRrSWc1VjJSN2FSL0k4V3J1WlplblBLUGlq?=
 =?utf-8?B?ZVFMNFJKbmtZV3BFc0FVaGRJUDZ3PT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfc053d4-5588-45b8-43c7-08d9c57fbb75
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 19:17:44.8365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RSPz2Kce8cC3b1ZbBoUmHCXB7llhLH+SK/oOSKTFOpIAnfc3fxkXleD63lzWKA2LLhBTGf8vg81yAYlQc2+SHS66CeVZlLAfQEWWh/2KU7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6290
Received-SPF: pass client-ip=40.107.14.119;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi all!

v2:
01, 03: add Mark-Andre's r-bs
02: add a bit of documentation and "'if': 'CONFIG_VNC'", still, keep
    Mark-Adnre's r-b here too

Recently our customer requested a possibility to change VNC listen port
dynamically.

Happily in Rhel7-based Qemu we already have this possibility: through
deprecated "change" qmp command.

But since 6.0 "change" qmp command was removed, with recommendation to
use change-vnc-password or blockdev-change-medium instead. Of course,
neither of them allow change VNC listen port.

So, let's reimplement the possibility.

Note: now, reconnecting may trigger existing deadlock, as I described
in my message "Re: [PULL 09/11] ui/vnc: clipboard support":
 <973ddebe-14a9-4ba7-c389-7a97d6017237@virtuozzo.com>

Simple hack helps, but I'm not sure it's safe itself:

    diff --git a/ui/vnc.c b/ui/vnc.c
    index 69bbf3b6f6..8c6b378e2e 100644
    --- a/ui/vnc.c
    +++ b/ui/vnc.c
    @@ -1354,12 +1354,12 @@ void vnc_disconnect_finish(VncState *vs)
             /* last client gone */
             vnc_update_server_surface(vs->vd);
         }
    +    vnc_unlock_output(vs);
    +
         if (vs->cbpeer.update.notify) {
             qemu_clipboard_peer_unregister(&vs->cbpeer);
         }
     
    -    vnc_unlock_output(vs);
    -
         qemu_mutex_destroy(&vs->output_mutex);
         if (vs->bh != NULL) {
             qemu_bh_delete(vs->bh);


Vladimir Sementsov-Ogievskiy (3):
  ui/vnc: refactor arrays of addresses to SocketAddressList
  qapi/ui: introduce change-vnc-listen
  avocado/vnc: add test_change_listen

 docs/about/removed-features.rst |   3 +-
 qapi/ui.json                    |  19 ++++
 ui/vnc.c                        | 155 ++++++++++++++++----------------
 tests/avocado/vnc.py            |  10 +++
 4 files changed, 108 insertions(+), 79 deletions(-)

-- 
2.31.1


