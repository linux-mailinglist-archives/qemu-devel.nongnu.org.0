Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4496EE226
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 14:48:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prI48-00012i-6Z; Tue, 25 Apr 2023 08:46:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1prI46-00012B-DN; Tue, 25 Apr 2023 08:46:38 -0400
Received: from mail-ve1eur01on0722.outbound.protection.outlook.com
 ([2a01:111:f400:fe1f::722]
 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1prI44-0000dl-Ik; Tue, 25 Apr 2023 08:46:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lKLHooyPv1kDHDVvDO1M0KZRcc8OxDN1t8UsiFg3KIXqQLhmORz+kMOcrt5e5RfSR1wZkmZHBDOflwYaOrlM8knf87WkleRaZzZ1qGt64YHoS3r0PbW63THqtZ1Q6CZfmtRKr1FyRtyEPr3wiXm6zJd1XZfwIFeC6xmSbfaxXsUi+xfoPY5R41Ko13wSh8SX5N5Rre2x5idqpQxUU+i9LpCknJzYmsWNhsOVkL6Ivl4b7f1rGT2zzT66bd2C2B3p4LAkagEsnxmHObUO8g62uIIyeIKyXWhZSXuxcRoM96xRHZ7wOENMVUUiQNI5o3qaA1kyBs4DlV25tTo2NlgxGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uk7I4dAzmdN29D9AIJXGJSiGT8T8bEMxyKtmA16X+IA=;
 b=KNlLwpMJ40aG71Tfh9k4x6vnla6Ro8ZxxSM8gWHnVGtbaZC6Ac2i6n90eJUvRM9DtRPPFZ8EujO+UV+V0fw7xK1Pprnsw1IvYZAzS4KNEZxyzlVQWf79ATZkRfc31U/1fnKi54zvRINLuI+SwCFhJGxpMV6u8ScbIvLy0h8rNhWVqDESFp0Rh+Oz8l05dPIyayYOY9MK3u44vyjHoRFJ994b8oRZpREIaSQeEMFjEkxMEDhJhtxJHRARFLAtLL4raYRsGT4lWkaGwi3QhwazZg2V+L+/fE4ml4pGUOGwBV8iRJGAhweCk56qNvQ+LZqgk7i7uK20+1eE5vqkhf8SEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uk7I4dAzmdN29D9AIJXGJSiGT8T8bEMxyKtmA16X+IA=;
 b=NzEQxGKbKfRvoZi7vYrA0FRE1Fz9TMFWFHS9u3/RxKXT3Rp3yf00/7vy5ycMh6LdrDAlrym/BmtOSuyDlOVbg+y31MEdO7H3uwyrSH9/EjrK71Kakbriv8xNkV5NX8acHQN5HkoBaHPiuzKklYKk3UUhyNOFBQRIN0A88DIPBgE94hfyD+IXgG1IMHa4c9bP+FDPYfpqX3RHj5JA9v7yh+6M/gyNa0QFgyHfsvKVciVaGWPCTDQrO5nwx3nkkO2Uakv+q/qrQxir3EXqgv0lrSybAky1Zw/lXVD/ovVALkeZjMwuBi7/m/VqXfwRFV0f/WYRE5lDEyuF0279q1jwvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DBBPR08MB5961.eurprd08.prod.outlook.com (2603:10a6:10:203::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Tue, 25 Apr
 2023 12:46:32 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%6]) with mapi id 15.20.6319.034; Tue, 25 Apr 2023
 12:46:32 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 4/6] iotests: Refactor tests of parallels images checks (131)
Date: Tue, 25 Apr 2023 14:46:17 +0200
Message-Id: <20230425124620.241022-5-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425124620.241022-1-alexander.ivanov@virtuozzo.com>
References: <20230425124620.241022-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0238.eurprd07.prod.outlook.com
 (2603:10a6:802:58::41) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DBBPR08MB5961:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dd9e40e-d2e5-4dcf-632d-08db458b18f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4gvXj/cvtshnw0c7axP/zqmsW0mY0wxcJ5R+UOah+1BHlc17HKy6NI5OieceudSpIGuOuP9d7Cm15MEmRvET7U2c8LTDSjGmN4nRWLL0oCFpYo3IjvanJw60rW4eIv1dFdpXXPR7pJCF6vCnIH0Lbe9Q2bUdjqRNgBrQlEdYwmP7cg9lxbACzHX1KoKyPmURcS9znAus/OtJPsgk9ndBzRjjSMyKKR8DkTWqBskz1r9RL0X5UDaF4B88bb3EXnM25MdW9plCgCwj6pe8FA0ViJhChQSTEB7q/LblozVs+C+B+/vR+jBkgC4EvKWodigEw9/QsHK9XRyLYW1EqTpBKkz74wV5Iy8lpzgkXJVS/rULWCy9se7hbuSdNUZ8R6j6oOPza8pytIVjl6BCPFr+3RHlhnKJo+jOhnlvRzG5rKD3Bupl2SxJbpNm4dhGEm6KvLl9m+rJDrtNNaeazMzCA5OvHj2lpzewIn+1zqd45lmX54dQ+kQgVSwYI8B2+OE6s5DKxCZ8+BDvevuEYj5zYfuEhRnpuN52wQyJMz/iy/xAvjKJVdQzjpPah4WKtUKuQC71KpXEde6Ubpb3rrAYn98knqGmnYMisuSvaIMbw6FiT9RHbG1fBVzpRk2sZol3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(376002)(39850400004)(366004)(396003)(451199021)(83380400001)(478600001)(52116002)(6486002)(6666004)(2616005)(6512007)(1076003)(26005)(6506007)(186003)(5660300002)(44832011)(36756003)(38350700002)(38100700002)(66946007)(66556008)(4326008)(6916009)(66476007)(41300700001)(86362001)(2906002)(8936002)(316002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t6EyIjWAvkBtiDaUcf727Z1fcfb1XeK8+MxgAJTT82oBdvMPtL7Mo3DNS5Tk?=
 =?us-ascii?Q?0vIQ6ekPuAb40QBadYNK9fDqd2nexEbnx/o7DqYgVvDDZvMCzCCQy9cQ/RCg?=
 =?us-ascii?Q?/sv/6FiuhcnXYBBOJGtP+UflU297uFZHm5HHz2WAbVsuNjEH7av/m8e4X0EB?=
 =?us-ascii?Q?fBqmbOD5pTkbxoRr4AY3LOp4QttqTQ0QAGheKGMGi5N5ZSjuNk0d4q+CVACV?=
 =?us-ascii?Q?GkRMPEGNLXV7H1HOcKGafiokYCz0TnMsApXUSbfwZ6V1lSO1xGACQh8UJls9?=
 =?us-ascii?Q?L+6q3C4fHrhWJQK+6Zj7phvm5azCzXtFpPnGlo1McH59aYLGoBwAsR0xbRCl?=
 =?us-ascii?Q?lobBe0pv8GCGFbfQ33EpOXdfDbNG8WydT7yeXW+Qnczv2fjLfUNowCQg/LV8?=
 =?us-ascii?Q?GXFG0euacWNobxu+wGDgEi3S6Y8MdJq1pcfqi0avn+wmGGeNwtlA8rRnDTfo?=
 =?us-ascii?Q?us9UGc7pW6vCKHqe9m8egedBY8QSeAD+GmUs2XgEHRyoh8tc7TTraNyRblLz?=
 =?us-ascii?Q?lk1JHbQR3h1uMFjn9qm90E699gccBlEeP3C8KEbbkpq2j6J1dLqwokJP2ayZ?=
 =?us-ascii?Q?vbXSMZhlZf1amP8ihMOkUX9IXR9JrG07Ce+i1ofA4Mt6pPYklXhOHq5yjbWR?=
 =?us-ascii?Q?8JHThO9gHgSOVgkRD2gkeB7oJbG44+97xb/zG5oH4OP83EhGaH/eFawzA68N?=
 =?us-ascii?Q?YyOfWfgG5362VpaLIjckl7oqYS2Co4D4Cl/hY98ILdmoq+lzO7GwCgtkYR74?=
 =?us-ascii?Q?Bux+qHN2I0PMU0bjJpEyZrxaO/7kIDSHrYAvddN1utoLL9T/W8St09c7f40u?=
 =?us-ascii?Q?A5SYlnnypOutfw/lSimcd4u3FN/7o2dn4vHEbFkosZGlYo7fLwbD2E7Q+esN?=
 =?us-ascii?Q?pE8sKzDin5rh/gaxIO3wSJanFfnTWRzka1K0BUTSBh4CfneEP4AAPGxx4T9l?=
 =?us-ascii?Q?TjkVa8ZCB08ySKoaDU5MKxT1BzQ0eC1dW435xXrt57fo+VJig10a4lM6I5rx?=
 =?us-ascii?Q?jJBQKQoLl7Oj88fWLa3FCYuyqJilnsRRlHhpp/faFWhQdWUsoFaGSbcDjCfB?=
 =?us-ascii?Q?gkIFLcBGPGxLxPCVgrVrB0e0y39zG4kIYrt5XfooeD0bCRMEQZxOVkvBJ4o3?=
 =?us-ascii?Q?VD3sTlzavcH21MODCaTLy9Wt7lksGnz7y4f2QCXU0xbgIzUt/mqNqhBf0O2y?=
 =?us-ascii?Q?Nb55Es4aTtvF/NeOZsqlIEF8zL3z+AGOJeRp9zYLsjMWBgLlEGZ0KUcLZJEi?=
 =?us-ascii?Q?Ce5eQgM/LPX4xgK7xEaBgOXbZ042d5azBeIQc/8q9dA/qc8CBpTzwqAV1n/2?=
 =?us-ascii?Q?h7wi+cUZDW/ZPIDpIAJbKAThifunnP7yvHITJWG9/dO/j2z5ZWnHl+pgmAnR?=
 =?us-ascii?Q?Y07VJ0hVUaO3/uiUXdmVJFpzswPCtKc7qMww4SLLe+iZjQy013ppjWbVV90g?=
 =?us-ascii?Q?7ElIPFYRY517rKuy9zwsE0EV0Eunn7dcATfmClseLMWIKlpvSSkZGoI5fRXK?=
 =?us-ascii?Q?RK9LvIzrtZLeoX/om9ux9mMiQ8LTDga5EDMAu2nLInmd20Q42lWSbN5SHqNW?=
 =?us-ascii?Q?/vvLhRs52rNtbV3XBnYjygc8le9g50rOOfyklCk2xcnO/inZdCOm3qo+zE6r?=
 =?us-ascii?Q?SA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dd9e40e-d2e5-4dcf-632d-08db458b18f2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 12:46:32.5754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VPJqCihcbZ5Q1qPUcXiM+mn5XNHt789xu9B8IrBuOL+2/FJ84NMaBcO3yybr833OBpPETJLA+gwYhwHMkp8vPlFiYvCy7FtCWXZaOy0T2sw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5961
Received-SPF: pass client-ip=2a01:111:f400:fe1f::722;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Replace hardcoded numbers by variables.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 tests/qemu-iotests/131 | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/tests/qemu-iotests/131 b/tests/qemu-iotests/131
index a847692b4c..601546c84c 100755
--- a/tests/qemu-iotests/131
+++ b/tests/qemu-iotests/131
@@ -44,31 +44,34 @@ _supported_os Linux
 inuse_offset=$((0x2c))
 
 size=$((64 * 1024 * 1024))
-CLUSTER_SIZE=64k
+CLUSTER_SIZE=$((64 * 1024))
 IMGFMT=parallels
 _make_test_img $size
 
+CLUSTER_HALF_SIZE=$((CLUSTER_SIZE / 2))
+CLUSTER_DBL_SIZE=$((CLUSTER_SIZE * 2))
+
 echo == read empty image ==
-{ $QEMU_IO -c "read -P 0 32k 64k" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+{ $QEMU_IO -c "read -P 0 $CLUSTER_HALF_SIZE $CLUSTER_SIZE" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
 echo == write more than 1 block in a row ==
-{ $QEMU_IO -c "write -P 0x11 32k 128k" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+{ $QEMU_IO -c "write -P 0x11 $CLUSTER_HALF_SIZE $CLUSTER_DBL_SIZE" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
 echo == read less than block ==
-{ $QEMU_IO -c "read -P 0x11 32k 32k" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+{ $QEMU_IO -c "read -P 0x11 $CLUSTER_HALF_SIZE $CLUSTER_HALF_SIZE" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
 echo == read exactly 1 block ==
-{ $QEMU_IO -c "read -P 0x11 64k 64k" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+{ $QEMU_IO -c "read -P 0x11 $CLUSTER_SIZE $CLUSTER_SIZE" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
 echo == read more than 1 block ==
-{ $QEMU_IO -c "read -P 0x11 32k 128k" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+{ $QEMU_IO -c "read -P 0x11 $CLUSTER_HALF_SIZE $CLUSTER_DBL_SIZE" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
 echo == check that there is no trash after written ==
-{ $QEMU_IO -c "read -P 0 160k 32k" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+{ $QEMU_IO -c "read -P 0 $((CLUSTER_HALF_SIZE + CLUSTER_DBL_SIZE)) $CLUSTER_HALF_SIZE" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
 echo == check that there is no trash before written ==
-{ $QEMU_IO -c "read -P 0 0 32k" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+{ $QEMU_IO -c "read -P 0 0 $CLUSTER_HALF_SIZE" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
 
 echo "== Corrupt image =="
 poke_file "$TEST_IMG" "$inuse_offset" "\x59\x6e\x6f\x74"
-{ $QEMU_IO -c "read -P 0x11 64k 64k" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+{ $QEMU_IO -c "read -P 0x11 $CLUSTER_SIZE $CLUSTER_SIZE" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
 _check_test_img
 _check_test_img -r all
-{ $QEMU_IO -c "read -P 0x11 64k 64k" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+{ $QEMU_IO -c "read -P 0x11 $CLUSTER_SIZE $CLUSTER_SIZE" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
 
 echo "== allocate with backing =="
 # Verify that allocating clusters works fine even when there is a backing image.
@@ -83,7 +86,7 @@ TEST_IMG="$TEST_IMG.base" _make_test_img $size
 
 # Write some data to the base image (which would trigger an assertion failure if
 # interpreted as a QEMUIOVector)
-$QEMU_IO -c 'write -P 42 0 64k' "$TEST_IMG.base" | _filter_qemu_io
+$QEMU_IO -c "write -P 42 0 $CLUSTER_SIZE" "$TEST_IMG.base" | _filter_qemu_io
 
 # Parallels does not seem to support storing a backing filename in the image
 # itself, so we need to build our backing chain on the command line
@@ -99,8 +102,8 @@ QEMU_IO_OPTIONS=$QEMU_IO_OPTIONS_NO_FMT \
 QEMU_IO_OPTIONS=$QEMU_IO_OPTIONS_NO_FMT \
     $QEMU_IO --image-opts "$imgopts" \
     -c 'read -P 1 0 64' \
-    -c "read -P 42 64 $((64 * 1024 - 64))" \
-    -c "read -P 0 64k $((size - 64 * 1024))" \
+    -c "read -P 42 64 $((CLUSTER_SIZE - 64))" \
+    -c "read -P 0 $CLUSTER_SIZE $((size - CLUSTER_SIZE))" \
     | _filter_qemu_io
 
 # success, all done
-- 
2.34.1


