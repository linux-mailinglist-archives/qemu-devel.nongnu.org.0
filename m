Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C03492B19
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 17:21:32 +0100 (CET)
Received: from localhost ([::1]:56616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9rEg-0001nt-V3
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 11:21:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n9r35-0003P9-7C
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:09:31 -0500
Received: from mail-eopbgr40114.outbound.protection.outlook.com
 ([40.107.4.114]:1927 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n9r32-0000Oj-JM
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:09:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M/3WPi2S1INMRXwuJuo+M16E6SpiWXNiKV90penV046xuW0bIO0+eBskJ35/pNP2K+13u92HWsThkpFcurasLf9B4F6k9IDLcVcg3AVL+5foZdm46Ates/XefSvRURC9UKizpqpEC7D95m0TidKjTjsJCidYVpwNIbpRJRpZqVEXRfyjtO+eQLT9ynH3AQLAMFLauFN11zDWckZHP0colHVqi+/6DUFKceRdQ/LzS8K2qvGfEMZkxA2+aHrlLv0cZgr8P3hOnJ7+T6jzfwGAQ9K1TFmSxXXF/o6XHHOer89VFvg0HVpUNGn9ZtRLuUe6XOwETh7W1BxGqk98TNspQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lePoJ4+aOZF/JQDTCxH3HBAHufnsvvdD53N3Hu1GGI0=;
 b=Gnk7FJ/oIYMmLHCS7Ifn0WkVswbDPaR6TDnWQF+9DFxaU6s0+49SzCudj88qZfFL/VmtMGo5NOY2Q8ZYFIXvHiQLhnrgrfJuBOB5wmgOiWHm+Fi2LIrKinyAxuKwvo+OMdJU6xdq5RfS/7OSPr2Z/IMHwj+uYquCTKH9cxCtmw8cSGJ6b3IOFj2l3yCxCSE4YQ6IXiYG3dg+mthctuYzKjhn6HtKKJR60vQev7FACYfwCTc/NFUY86peZF/whh8ajt7d+nFL8NnS4TKhQmQpvKnFd1/LFkeI5zlsTTVqM6QHw19a0Apmw2nPMkRgz8W2xV6Fy8gy9C6nrvijLfuqCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lePoJ4+aOZF/JQDTCxH3HBAHufnsvvdD53N3Hu1GGI0=;
 b=URXg2R2sZKdiHcUyXXAkj8ISLdwWvE3c+TzSkY0Qh2VqPzPTCdGcmFw7tExZWz8hq4erDEfa/j/pJODK8Ckr2g0rV0x5o3kQgf5Q2JwxSr4Lb2WlWtsfMR3qeeEVUtp8uIXs6t/kl8VKeBwOW7Ukfv8p28UCUCiIJqAUP/cvAr0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Tue, 18 Jan
 2022 16:09:25 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b435:c0de:ef6b:5917]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b435:c0de:ef6b:5917%7]) with mapi id 15.20.4888.014; Tue, 18 Jan 2022
 16:09:25 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: bleal@redhat.com, wainersm@redhat.com, f4bug@amsat.org, crosa@redhat.com,
 eblake@redhat.com, armbru@redhat.com, kraxel@redhat.com,
 berrange@redhat.com, vsementsov@virtuozzo.com, marcandre.lureau@redhat.com
Subject: [PATCH v3 0/3] qapi/ui: change vnc addresses
Date: Tue, 18 Jan 2022 17:09:06 +0100
Message-Id: <20220118160909.2502374-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM7PR03CA0006.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::16) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 584c068f-5da1-4741-afee-08d9da9ce583
X-MS-TrafficTypeDiagnostic: AM9PR08MB6737:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB67374A9F1F97DECC37D7E3E8C1589@AM9PR08MB6737.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N8Jqg/kxTUcGRFrKymYSg8nA484n98P//CVOtfbgw4ImhZgw/5/33uGmu0IwuVMQ4IdE36FVxk4nbkH0gv6N4Zk2dI46ErsHRC0y/DpKrAX13u9EJAcmVmuK7GJB3A/5FdaF3BzuEA08i13QY6X11FbYAf+EaNF1LmbWFzfTBQqS2u+hH1dMGnZSBZlw6uFOs/JTR7CAfWiKq5JOZT2X/iVzXPVUhY1GiBcfbfICaZNfpgnTz19nVZSxMaZWCvzye0bg9v5xMkuftSoBNb2dzvMcP3RYU8yfsUelPUV8lxTo9Md36CCNn4Ehl88HbjcgiPNMk9LOQ0qC6wF9T668ZhXaspRMpz5yzg0c/wYKBJPR6vaejg3lK/YOTp9x/K6QWVNMycqbQGyc+62oHzTmg7gIdre+iV5M1/4okB+S9jzyu16P29si5mM2pq64kOvK8N7KD8EEoDPv0h2XPTMPqI7ubjwO6zIr79iVfE3C4HZXWTLyYzQId9lyVIkN+WUIbBlhJQrGQSE8pM5gr8Dcja/gFVdz+jGYP0ew+IN7RL+Z7PiwBpkZViY541tYIb1Kx3ZDsO96XKhMeSu9SsbTcacKOwvSR0OqXoE9QhbK2YF5R4OID6ff5TogKeOeHVw54iZYoMgr74XWzc84ka3++kpuDA+ejJKA0HwxiTVj5zbczEBb7PtWGxY7idnButznQzoRf0f9otQh8xLJhfLaEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(38100700002)(508600001)(6666004)(6916009)(38350700002)(1076003)(2616005)(36756003)(26005)(2906002)(186003)(6486002)(6506007)(66556008)(66476007)(66946007)(8676002)(316002)(52116002)(83380400001)(7416002)(6512007)(8936002)(4326008)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2RRQXE2VmRGdmN4YkE2bGMwUC9RellBMWU5b2F5a1U4RjBtYmszd1pVMWZj?=
 =?utf-8?B?VU5FWUJ4VDFjNXRkSkhEcXd1a2h1b2ZZdkplZlRjay9uUmpObFppdk5MRUdU?=
 =?utf-8?B?VzJtMzk3Mno1QUJlRGIwT05HZm5pV1NXUE9KdjVhWmlOSHAyY2gxK0UzZERu?=
 =?utf-8?B?cmRuOU4zTFBmY3FwZ0V5UG5Wa2trUFcxOWUzUmo1SlMwbzNnSHRlNytvZ1Fs?=
 =?utf-8?B?ZkYwOWo0bWNUY0E2NWZlVFMraWFNbXNoeU9VNDAweWJrWFNlV3pBekJSSDAv?=
 =?utf-8?B?K1pkZlh6cXR4czBPQmRnWkhKeU1PUFF2bUtPU0lQZ3ZFZzNWdnNGdXpJMGI1?=
 =?utf-8?B?OXhCNitaTTZ3YXF6UmpTaFVTUEQ1WHpMU3VNbG5CNVZlYU5ZelhCSGJhMjlZ?=
 =?utf-8?B?Zi9Dc3JjZkZLcWtqK3QzZFl1Y0RQRGNHekFOcS9seElWT3F2emtoR2xpZjZS?=
 =?utf-8?B?QTllMHVXYzJ5OTFyUjN2Y2xzTFBVNjZVQk1MNHJ6QldJWC9zZCs4ZDAvR3JN?=
 =?utf-8?B?dDlDRnlsNm94RFRYZk03OVUxL1UybGp3eDhQRHk4UnFuajMrdEJWUFBSVkIz?=
 =?utf-8?B?N1V0VFZUTHByM283eC9PaVc5VWNJbmJyT2xlTzNmWE5tS0c1UFBRcVZJTDJv?=
 =?utf-8?B?eUprVVVUaGhvMVZ4Vi9vbEwwRzhhZ0EyRnp1N1VNa1FOUVExZGk1QWVnSW9z?=
 =?utf-8?B?amlNMmZXQy9QdlNyeDZMT05UTGJYYmgvZkppTXJhWFBsb0syZnBJSGNQd1dh?=
 =?utf-8?B?TnpTOEhTR21ndVFUNEJHYld4MGkrSStFc3ZWZForS0x4ZGtJSzZCMzhsM2NZ?=
 =?utf-8?B?VDhhL2diL1R0MS83SkRMeEU0VXBTcFRtbFAyTlppbStsdWxqdUlNOHBNVVN6?=
 =?utf-8?B?OWw3ZEFYa1N4QjFxY1BpYSsrWG4xVmRha0k3WVd5YVNNcnZLTzA4MldPZDdF?=
 =?utf-8?B?a1hCSGZqYnlKYUhqUk5yOTNYWU0yR2dJQTRkTDF3M0NPU2tmNXN4dTVDMmRQ?=
 =?utf-8?B?WWhURS81VTVhNENreFNaNCtZZ2oxY0Nna215Nkw0ZlhFOWdhc2lEUzBIb0dl?=
 =?utf-8?B?NmZYTWl5K0xnZUxCRGxLMjB0RGY0TmhueVpObkNWMWl4VWVydG51MkdmeHVp?=
 =?utf-8?B?ays4YkF2UTJDeUthZVAxZVBsM1VPckZFZ3JHcDRpZUFzd2tUbzdaV1pnUFAv?=
 =?utf-8?B?VEh0ZGhjNStFSExUbGI2dktHU0taSlJ6SXZ3bFlmWG82MjJHSnVId1NvVExD?=
 =?utf-8?B?SDc2cGlKSFlQbGtLelpqd2ZGK3pwMDRsbTBiMDE5N2VMSEl1NDhYYlpyZlZp?=
 =?utf-8?B?VkI3azZjbCtlVUl3QlVFUm50ZExNeDNhcW95VXpvVnVxQVR1eHdNdGVCdU9Q?=
 =?utf-8?B?SXhPZnV6SnJUS3lhRkxja1ZCWXZhaG9MNENQT2ZQS1pmNkFPdU53emVOTFlo?=
 =?utf-8?B?VUNkbDNqckRFQkdEWHdWUG41UmFibG5xRkY1NGtTNEdBNjMzSkt3dXViMVdD?=
 =?utf-8?B?cDlpazUyc2VYSG56U2lnRGx0WnhnR1lSLzdkdVZtTy8yS05QT0NCdTVXT2tR?=
 =?utf-8?B?Q0p6a09relR3UGV0SjlvUVB3T3lUMjBybWhDTkZib09TaFdUNWJ2M08xRFVY?=
 =?utf-8?B?OUVyNEJNN1cxNnNHYmpFSkFKMFgyQ0hobk11dXNhRXJQb2dJRFZOMVJvcXJw?=
 =?utf-8?B?YmEwZ2tKeU5hdFp5Q2lWYVN4bmhENjFkY1oydVVXblFNS3BHTjhZV2k2SVk1?=
 =?utf-8?B?Wk9OSUFGbjRaeGNQcEV1VHl2aGhqR2FNMG9TanhVNkx4SFk3SW5ZdGFDTnVQ?=
 =?utf-8?B?c2RwYy81bVJ3enN1MjNBWXE4bXVMNHJtWFhLcng3UnMwNktSeFhWV2wxYmE5?=
 =?utf-8?B?Q3pBcDZDME9ocmIrUkMyMjREdGQvc1liandyVGZBajNyV1FSNjRNeW93NXp5?=
 =?utf-8?B?a0pwdGFJdzk3dzBjaUNlSURvdmxUV3d6UTM3Zm4yNDhkTGZ2cTFYUWY4UWts?=
 =?utf-8?B?OHBIUXFyWC9IMjJWVmtWRCtzK0ZvSi9rTy96WDlRUllyMlR5dmVmMHFoUkpu?=
 =?utf-8?B?S0RheEhGOUNINFJlU0Z4dEQ2MExRZVp0T0VveE80bVZQSGVQWEMydjRTNjlF?=
 =?utf-8?B?L1pmYkg2QjRCTmRQMTJhamFMZjE2WmdYeGZYMGxRN0lmeHF5ZkJTQ1pYRkN2?=
 =?utf-8?B?cksvSWRwR0lNVkgyMnJjaFFEaWdyWEt5T0szRFMrZGxvTWJtVitDV0s5SXJN?=
 =?utf-8?B?R0k1R2J5V3dWRGMycmJHZmM2TGVRPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 584c068f-5da1-4741-afee-08d9da9ce583
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 16:09:25.4703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hdLt/14ZIn4HzyE1RbY+ztEA+J8lzlJn4nGQMY/BUbqXcCRg1xRpYQ8UtDkFXLRiByqI3TmQd1ZLIW1E9H2z0/u1i5zoNPLzi9QujIHHiR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6737
Received-SPF: pass client-ip=40.107.4.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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

v3: - instead of creating new qmp command add an argument to existing
      display-reload
    - also don't touch websockets for now. I'm not sure we need it.
      Additional argument for changing websockets may be added later on
      demand

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
  qapi/ui: display-reload: add possibility to change listen address
  avocado/vnc: add test_change_listen

 docs/about/removed-features.rst |   3 +-
 qapi/ui.json                    |   6 +-
 include/ui/console.h            |   2 +-
 monitor/qmp-cmds.c              |   4 +-
 ui/vnc.c                        | 166 ++++++++++++++++----------------
 tests/avocado/vnc.py            |  10 ++
 6 files changed, 100 insertions(+), 91 deletions(-)

-- 
2.31.1


