Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0403460C3
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 15:00:13 +0100 (CET)
Received: from localhost ([::1]:60332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOhZh-0007vD-Pd
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 10:00:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOhOP-0007BJ-DU; Tue, 23 Mar 2021 09:48:25 -0400
Received: from mail-eopbgr80108.outbound.protection.outlook.com
 ([40.107.8.108]:57092 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOhOJ-0001wR-36; Tue, 23 Mar 2021 09:48:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kVTMhYuJDfH1jbL5CT2ZdD/oXX1SOXctvx8D8k10Kcw+tfyZgth18BpLqQPk5kJNEeHZ6sGS1W2nBb9Zmve1aH7dO89CsinhHJSZHfpVLCYVIN9N2yHpP9tD+NLeq/rYEp0KsJv8DAtpkVJGnO98nQhx35ZN3YHMGCyDyNXDBsGdTNlAMuhX72ZsF3GOdnM2luW1GiEgFk1XdXX+MHknAgxj/rw+nUDGmtcIqX/5o8fFnvvj2ihqail0QwVXIvV7br4IJC8yzFayeoEg3u6Ajxu22nzItfXJHcAEsYP740Ak+Hc5pV/FCsOTQt+3ji8chgL0qUHehTRodteM+u8/wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=guRhk6dmphbdiOmIJPMxDpWhjWH4+mX/MXne+N+xYcQ=;
 b=nB8fidnb6IHN5JVRmY8INzFIUmGXHxxRDn1FEL0CsM5Rc80P9WQKp/08PCIrFS3dXw5x+B6Nll7H65gR75KJHUGhC9m9SQzgOqbqGhY/kFOT8TFB07MTvy0BnasT80IWiqiWy8DCHDKHI/KtveOGFqbtdrL9A7/AusIP13my4hqN5E1Y0xFMsJmXOBsG305MDvWNLf479k6+LAZ8Yii1e17PJ91X8hB5biF+CWONiVOzFFDgwCKVg9Xbt6GoBfEe7u1uXKmMD6OALmeoE/XixdZo2ZQj1DLqvuFRn4jX5nrDwtG4b2zNdTsK+g+uPVHTAefiw814gy2J2zXrzmFZyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=guRhk6dmphbdiOmIJPMxDpWhjWH4+mX/MXne+N+xYcQ=;
 b=eSxV6TDw4yOf3cBXdbym91vmENF+Iu6SoiFdec7Jh2gJ/dsln4G+MfeZNmR976vEAanOtDv63y9GpsRflkKYxIoJCxg+IRMxJgbcLxbbJDEEkb7IlHfS3zPfJPXfKMUYOKIM37t9kzncgjvKY6beuTpx/tevVrjP/AHRHI0f0F4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2034.eurprd08.prod.outlook.com (2603:10a6:203:4b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.25; Tue, 23 Mar
 2021 13:48:04 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 13:48:04 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, vsementsov@virtuozzo.com,
 mreitz@redhat.com, John Snow <jsnow@redhat.com>
Subject: [PATCH v3 5/9] simplebench/bench_block_job: handle error in
 BLOCK_JOB_COMPLETED
Date: Tue, 23 Mar 2021 16:47:30 +0300
Message-Id: <20210323134734.72930-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210323134734.72930-1-vsementsov@virtuozzo.com>
References: <20210323134734.72930-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR05CA0184.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::32) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR05CA0184.eurprd05.prod.outlook.com (2603:10a6:3:f8::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 13:48:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98664530-4063-4181-16f4-08d8ee024860
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2034:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB203485396E6AAAEEBF3BD132C1649@AM5PR0801MB2034.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O3wTBR8+CAKqd0p3G3IsJEAl5+uEQ4Ci+e/Sh+rOv8gIB+ehc2WGtdpBcszuNXimsxoNiCKxPpvkM24aPv1q7v9XiCi7QrMLH/CZ3vhdV8eWbEQTJPgnDjtVDc6mTu0cZuL36iPBXKP07AnFXXta44LWAIUoJGxz2idl27HJGuKljNGz98pa5fdorHLuWZMQol5TfiJmiO+qUxY96hB1W9UJbLqQ6Zxc15AMm8HPzLp3FivJzGHZNzBS8dESu/cb9TE1lBEqYwgGHuWlfW06WCAieOEGg8AILFZ+bQE1uayvvH2VzhQ9whqyWg/TokNBS4l/fgOUI4u+QsqBEId609OVSwRaWSNgXE2QXbpHGtuXI9AfPDel5vVS0tFaK81az6VLbxfBp+hoSUxR3InU7YWB/QtVRdzhIMwLg1lu8vX+ou/YRV62uid/NOAWNBxoJZzrlCOCY/OZmjFJuKB940HOM9Znd0qJ/+P9w+DeaqEmaW/m4lYlnD5Dgl8NcrSo/GKoQiyMZg6cU2x0iSsbLAQBU1qN+ndxBEAcPhrA6Oqcwiswg1VEBQsDZIqmNEnKX8obNba/ZuXLiYB76ppaPKhoUdiRqQR6c4YmP+ZMYzPJQn+acIB3314Z5D6QIIuQKdLykK/n4liGmasFrW+3AOwL0vYwgnCy9n6Ead2gI455UUKPYj3IRSgAQI74cSG9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(39830400003)(396003)(376002)(4326008)(186003)(1076003)(6506007)(52116002)(16526019)(66946007)(316002)(26005)(83380400001)(6512007)(6666004)(8936002)(2616005)(38100700001)(956004)(4744005)(2906002)(8676002)(86362001)(66556008)(66476007)(36756003)(6916009)(69590400012)(6486002)(478600001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?9KbKIFkqTys+pK8ne0gYb4SOOxnZX8Rw7SgovVJpNfd4B1so3y3Y5L6ZLBU4?=
 =?us-ascii?Q?Q8QwnKu6dur3vPn6SuUki+QJpHPtpvKZjwhkG55HbSUnlABNFc3/jo8/cuB1?=
 =?us-ascii?Q?6ZMPRUhpJQqpyTZBI96wKaw8aJPbv2dAUzvawy/ESsvJzQl3Xpj5azb5qnCa?=
 =?us-ascii?Q?BcYopgNWuHCeOd+zAEyhKVz181bKPQjPUu45kkaWf+0PVABHuG2JQARyf36a?=
 =?us-ascii?Q?JgngxmRHVIeRo6LxZN6XiVoxSn4Ytbj2oAyy6UPHeQEkp5p4epSQ/wmrrC4g?=
 =?us-ascii?Q?xpUeoOOUcWLSBr0y+5vpgbQ6HA8sRb+lzBCeyOSqEYZEhaaHbPTBXZ2pfB2H?=
 =?us-ascii?Q?xBDJrsRSmTRYScCVWBSnawxszD9CFE7bmtTgkN/Vv1UUi4m50XbeCqcesrlv?=
 =?us-ascii?Q?kSHzkbKSQmaZKmplsuX+2wTeAXrd0WMWvdjI/M4qhNVI3ADOmtEKnb1HCR2S?=
 =?us-ascii?Q?yExphrdsVv5DCgQEAG6omDin6xVco81dtJ1ZgHybqbAjH3kVEUY3OazdibJx?=
 =?us-ascii?Q?WQAb35z4S+qs1VbCrGlEnG5jm1h3AsM9eMUAlfEnkxMpscJNfMlGHrhhKjCs?=
 =?us-ascii?Q?NCzaykD+Kvkur5lNEFl0A9ddyuH/dBTpnB5Hg64rEGWOSc0FblQGKie094jA?=
 =?us-ascii?Q?q+0WqPKoD97HjVoQbtvgvMb6oMOXoC/d16V9zFAeyFDtecGe9dKT7URTunKs?=
 =?us-ascii?Q?AvxrMzUhH4DU0Hrzs0W1KDg678hP8Z2R5IchDD/ph0Q+XH4qhVU9Ho1oIiMW?=
 =?us-ascii?Q?94FexD0y+f3vRgvIVCKqTfJvxbmTtj+Jbia7mEJvSziu5rrOWQkcnux6/1m6?=
 =?us-ascii?Q?S7G7e8Dptpdg7Bhm28LOsLcMp5NYFs30g7essKswK8BD4vkszpKJKyyN1kh0?=
 =?us-ascii?Q?ReQgbrniAYmEHI1ugAi7B86DoPdN6FhNk4/xbq3zBiA2fy6SV4hk1N96YmOS?=
 =?us-ascii?Q?HaKi9miPcpBxaz2MtQNQLVZ86rJQPlzEoqjpNBNTK1+qfcG48TyeZIwg51Q1?=
 =?us-ascii?Q?8xJoT9FwHp8dwFOMs3lU1s9HyMcPUr5xX1sZgpEyzqBW8WDRrJbp+0JiPjbJ?=
 =?us-ascii?Q?2QDcCWagvax72K2vmkd+WGinAS9inGzCS9NVNH3yseQ+ac3SVL9uELQoYoBd?=
 =?us-ascii?Q?V/3Vf3+F1k4B0n0dPG43v16uQK1cKFvL0bXi/f8PyBUJCa6tD7kw+6sqxssB?=
 =?us-ascii?Q?1+ZRrCJcq5DpF06O//ZjHDlnsyYaJIAgfX2nSBE3E7gPIHDIxOJQ2mzWcmMo?=
 =?us-ascii?Q?JcaDBQ47jWx6pzPvfK398cGzxxvxG62FDDWUm/0Wo+JvYuFzK3VCNP5jdJFc?=
 =?us-ascii?Q?9NV1K8BlUm7T8TPQkw2bOFNl?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98664530-4063-4181-16f4-08d8ee024860
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 13:48:04.5851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FC4VBpT2tYpp6j20650nIiKKBI+JJ03Az0OlMeJxu9KtCeEBtwPmz362Z13BZlxCcAJEGp6knl3qvj8gomuTWZgmZPwvhhvkz3S+vur5Hiw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2034
Received-SPF: pass client-ip=40.107.8.108;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We should not report success if there is an error in final event.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 scripts/simplebench/bench_block_job.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/simplebench/bench_block_job.py b/scripts/simplebench/bench_block_job.py
index 8f8385ccce..71d2e489c8 100755
--- a/scripts/simplebench/bench_block_job.py
+++ b/scripts/simplebench/bench_block_job.py
@@ -70,6 +70,10 @@ def bench_block_job(cmd, cmd_args, qemu_args):
             vm.shutdown()
             return {'error': 'block-job failed: ' + str(e),
                     'vm-log': vm.get_log()}
+        if 'error' in e['data']:
+            vm.shutdown()
+            return {'error': 'block-job failed: ' + e['data']['error'],
+                    'vm-log': vm.get_log()}
         end_ms = e['timestamp']['seconds'] * 1000000 + \
             e['timestamp']['microseconds']
     finally:
-- 
2.29.2


