Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3652EFF88
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 13:44:23 +0100 (CET)
Received: from localhost ([::1]:56700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyDbS-0007hH-9U
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 07:44:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDLF-0008UN-HW; Sat, 09 Jan 2021 07:27:37 -0500
Received: from mail-am6eur05on2098.outbound.protection.outlook.com
 ([40.107.22.98]:57153 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDLA-00067J-Fd; Sat, 09 Jan 2021 07:27:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKNcYz1I1pglad1vP+16CLg6agUHMHjSQ15XshYckTVkAMhiLNz3ht7KKvhDP05uasoYSDMh3DaiYdTrIJnJacNKuhZXA+fP8Eb8vy7DUxWtZ0iHIdQtLhIcV+oHmoMtdDvy6vQ86IO5gJB2Ui4Sfq2RIRIMmqcZn0OSi16EYpM43WLwT2sXFKFqWdBgDlnphcr4nAONw5LLa1OmK2RBpNSFnmdgT+A8ef3dZ7PcBs5qbZrLDqcRMJ3j8WqTTH/anhsE+k5Q6Q3meVqKy0gBEHcDK7NJXMgtLdcly73Ssgj5irAAn2V6ct5rg6gGcVgKu9iko3bAydekJtZu7qho6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZOksE/ynFw5psjxUB1HFRQSRpVIOFjPc06zDedKziw=;
 b=JG59/foGLNDf4+Nh0z9c6z2qSO+G1GvH8QR+M0vJOq4Efv8tnsYoBGo4L+sI4i8P3MHw2e5k4I8TmhbQXc+ap/s+le17PO88nyTVfiU0R3uWDyOb444R9iYmv7OJRwatvN1M8oR9jCIo1WdshpdF0hpyIA/ZU3Yhf76KTfTnjkXSYYPmo9zgSMQdnNy2Y4+CRxyW/DUNRnAmio6puvs7pPJ+5wCfLdF8kFT/hA2/5Yb4u7W6OSBeROTszlWIRnq1pGBQa8uXRsBrfIcrW0ib0OeyGHWD9huigwhES7Z4HLJF5lYvGU63Pvw7ykZESu3eGOcsF7mkgXPj5zafgyUMxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZOksE/ynFw5psjxUB1HFRQSRpVIOFjPc06zDedKziw=;
 b=JG/yhxmNlYfoKme9xK0g2gcG46Cgt1yLyJjGZUDhVl9sAth1fAB07mu57LszAE9ykmhY8Wsybp4ZwG8bduOQrCYVJf//443WE0Nkhg/uZZ4CnMGt1s3UXTG2Aa/yOk7Q8900a4IWDLlpVHfpW4C1vHbhXRQa1ZV10X1/79VXcOA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2529.eurprd08.prod.outlook.com (2603:10a6:203:9e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.11; Sat, 9 Jan
 2021 12:27:08 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%7]) with mapi id 15.20.3742.011; Sat, 9 Jan 2021
 12:27:08 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 06/11] iotests: define group in each iotest
Date: Sat,  9 Jan 2021 15:26:26 +0300
Message-Id: <20210109122631.167314-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109122631.167314-1-vsementsov@virtuozzo.com>
References: <20210109122631.167314-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.119]
X-ClientProxiedBy: AM0PR02CA0217.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.119) by
 AM0PR02CA0217.eurprd02.prod.outlook.com (2603:10a6:20b:28f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Sat, 9 Jan 2021 12:27:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5124067c-c404-42d5-5319-08d8b499e1e7
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2529:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2529BFAB153FDAD1680A40CBC1AD0@AM5PR0802MB2529.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y628OhRkn0iA4RpaSoqAU7720acNMjPDB8F4yupA8Cx7BTu8pUDtdJ6+69cBL5uEM9a+LaMKdbafdL3oHamoBJdnvtl+oLH5MAWYsxetLQ3h0tbV6T3BnEjSxPM/eSdHH58KVYCvGv2asTdw06V6gNuI3wdOjG6hh+8K9wkqcip/GQ+wdqL4VvQk987/Dg1eZGygEyPXNSQYDTQc6IYM89m3+SCVcjNOpn6y1fXgdQpQbj2Bwv3F+Zo7zVwhBkDFKzChvGEBLS0JalRfhfy9rl+E9Br4tGrhLB4AhqoqZkaY9JfAon0bQo0E462n3pI0t5fMxNVTUhdAda7tzJgw1ZCE5pBCYCmlccX2bNeIGYrQMLNNUykxhvKGHSiQnw3hz4Y6n1v1+eVNso3e8Qa7pw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39840400004)(366004)(396003)(376002)(8936002)(6666004)(1076003)(6506007)(52116002)(478600001)(30864003)(2906002)(8676002)(16526019)(5660300002)(186003)(26005)(36756003)(66556008)(66476007)(6916009)(66946007)(2616005)(6486002)(6512007)(4326008)(83380400001)(86362001)(956004)(316002)(559001)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?AZ8HBAHoXY2wVqXG//DVMhqyGNdnWQ+OCC5k8cZWtzNr9Gf1x7HlNqvdzk7U?=
 =?us-ascii?Q?GsaiD2HYA9X7jD9uxwb5jtiwSBY4LTW0pPNyJvbYaS62KZzPxWK8I/ZREq1+?=
 =?us-ascii?Q?LJz6ejZFNNfFm9r/K/TexbnPO/OuLimoViZP8npztZBEIsAkCGTWscyUgcZT?=
 =?us-ascii?Q?bNsz3+Ew3Q4NvOrfK+etIxUO1Jn5wIH+riiJNxN84lKMfYSR5CWObu6DXKHi?=
 =?us-ascii?Q?O4OhKDN+OBEMfNrl7onSnyMieD2BQKodFZe0VQIU6DkHPPcREDWcJVmc7sjF?=
 =?us-ascii?Q?fpfPkp4iI/Az04lZO5BCbUZgX/RmpbP49qGgv626VUkCpHihW2buV82DJDb8?=
 =?us-ascii?Q?Hr0ZwYA3xX7b2eHE9R0xFmpxu3Z+qVe5n4pZE5hFDDILJlvc1jy0o7otf/Pa?=
 =?us-ascii?Q?kmeAteWLclneWLz6Fjc2Y6rQtQOyvkIVvQVBD46sVC6mCu4vZwo/dPjX51GI?=
 =?us-ascii?Q?6eiExoVn7mYti11xXGnYZEf1e0vaD0RpA5HRucK5H3uTulXl6zrWQWRZxkcz?=
 =?us-ascii?Q?hjKC+3FAM/X7vA3hGSZpSRlHQMqAL87VyjqiruZeWcNKJAuQ9r3zWJ8ALy4U?=
 =?us-ascii?Q?oFiBsIcUNxT37+mTHFJMdlP4EPTYXM5YvcnC3E5bkIN5JWG2pJMfcUnhWvVz?=
 =?us-ascii?Q?WZeXvzV82/w5mXEGm0x3Iakcj8ZWBNTcNYFXHXEe/t/hTj0s2i8HLC1b3Law?=
 =?us-ascii?Q?B9MNgVrFjAG7XxSA58Rs4vn5REIHIaJ7SxEowNc4rl/Uh+xi2c4YJJklWSPt?=
 =?us-ascii?Q?yGURwKFI6XFA0NdgxyjyIZhzwKNBtgojiY2ldKZ6CO2ny0JvRfljxMWCQPek?=
 =?us-ascii?Q?ofeLYqme+6zO+x87wk3HOs7MbQctQD1MbKp9dJ4p1jnW6uLpREoMD0O1NTa2?=
 =?us-ascii?Q?ZBZSt0q3FRTlOSl7m0mRbtIJAiWhotxgeYoPw6MQmITIm5enkhJ0FKLE63XG?=
 =?us-ascii?Q?vpTiBFh2GGD7s9de+VLhrAPDGKSNO9N1kvB+lq/tfCKe0mVs4tmnXbqctFzV?=
 =?us-ascii?Q?159X?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2021 12:27:08.5028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 5124067c-c404-42d5-5319-08d8b499e1e7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: trFtqxkGCkNm4jp5Y3VT5DGr7rBv7HsX36J0MP08gPH/DUVo5k+PH5bVuny5oqRqGO3lAuk3Rmsn+DX2BNiabj8vXw/OfSTxHu2Kso3pSvQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2529
Received-SPF: pass client-ip=40.107.22.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to drop group file. Define group in tests as a preparatory
step.

The patch is generated by

    cd tests/qemu-iotests

    grep '^[0-9]\{3\} ' group | while read line; do
        file=$(awk '{print $1}' <<< "$line");
        groups=$(sed -e 's/^... //' <<< "$line");
        awk "NR==2{print \"# group: $groups\"}1" $file > tmp;
        cat tmp > $file;
    done

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/001 | 1 +
 tests/qemu-iotests/002 | 1 +
 tests/qemu-iotests/003 | 1 +
 tests/qemu-iotests/004 | 1 +
 tests/qemu-iotests/005 | 1 +
 tests/qemu-iotests/007 | 1 +
 tests/qemu-iotests/008 | 1 +
 tests/qemu-iotests/009 | 1 +
 tests/qemu-iotests/010 | 1 +
 tests/qemu-iotests/011 | 1 +
 tests/qemu-iotests/012 | 1 +
 tests/qemu-iotests/013 | 1 +
 tests/qemu-iotests/014 | 1 +
 tests/qemu-iotests/015 | 1 +
 tests/qemu-iotests/017 | 1 +
 tests/qemu-iotests/018 | 1 +
 tests/qemu-iotests/019 | 1 +
 tests/qemu-iotests/020 | 1 +
 tests/qemu-iotests/021 | 1 +
 tests/qemu-iotests/022 | 1 +
 tests/qemu-iotests/023 | 1 +
 tests/qemu-iotests/024 | 1 +
 tests/qemu-iotests/025 | 1 +
 tests/qemu-iotests/026 | 1 +
 tests/qemu-iotests/027 | 1 +
 tests/qemu-iotests/028 | 1 +
 tests/qemu-iotests/029 | 1 +
 tests/qemu-iotests/030 | 1 +
 tests/qemu-iotests/031 | 1 +
 tests/qemu-iotests/032 | 1 +
 tests/qemu-iotests/033 | 1 +
 tests/qemu-iotests/034 | 1 +
 tests/qemu-iotests/035 | 1 +
 tests/qemu-iotests/036 | 1 +
 tests/qemu-iotests/037 | 1 +
 tests/qemu-iotests/038 | 1 +
 tests/qemu-iotests/039 | 1 +
 tests/qemu-iotests/040 | 1 +
 tests/qemu-iotests/041 | 1 +
 tests/qemu-iotests/042 | 1 +
 tests/qemu-iotests/043 | 1 +
 tests/qemu-iotests/044 | 1 +
 tests/qemu-iotests/045 | 1 +
 tests/qemu-iotests/046 | 1 +
 tests/qemu-iotests/047 | 1 +
 tests/qemu-iotests/048 | 1 +
 tests/qemu-iotests/049 | 1 +
 tests/qemu-iotests/050 | 1 +
 tests/qemu-iotests/051 | 1 +
 tests/qemu-iotests/052 | 1 +
 tests/qemu-iotests/053 | 1 +
 tests/qemu-iotests/054 | 1 +
 tests/qemu-iotests/055 | 1 +
 tests/qemu-iotests/056 | 1 +
 tests/qemu-iotests/057 | 1 +
 tests/qemu-iotests/058 | 1 +
 tests/qemu-iotests/059 | 1 +
 tests/qemu-iotests/060 | 1 +
 tests/qemu-iotests/061 | 1 +
 tests/qemu-iotests/062 | 1 +
 tests/qemu-iotests/063 | 1 +
 tests/qemu-iotests/064 | 1 +
 tests/qemu-iotests/065 | 1 +
 tests/qemu-iotests/066 | 1 +
 tests/qemu-iotests/068 | 1 +
 tests/qemu-iotests/069 | 1 +
 tests/qemu-iotests/070 | 1 +
 tests/qemu-iotests/071 | 1 +
 tests/qemu-iotests/072 | 1 +
 tests/qemu-iotests/073 | 1 +
 tests/qemu-iotests/074 | 1 +
 tests/qemu-iotests/075 | 1 +
 tests/qemu-iotests/076 | 1 +
 tests/qemu-iotests/077 | 1 +
 tests/qemu-iotests/078 | 1 +
 tests/qemu-iotests/079 | 1 +
 tests/qemu-iotests/080 | 1 +
 tests/qemu-iotests/081 | 1 +
 tests/qemu-iotests/082 | 1 +
 tests/qemu-iotests/083 | 1 +
 tests/qemu-iotests/084 | 1 +
 tests/qemu-iotests/085 | 1 +
 tests/qemu-iotests/086 | 1 +
 tests/qemu-iotests/087 | 1 +
 tests/qemu-iotests/088 | 1 +
 tests/qemu-iotests/089 | 1 +
 tests/qemu-iotests/090 | 1 +
 tests/qemu-iotests/091 | 1 +
 tests/qemu-iotests/092 | 1 +
 tests/qemu-iotests/093 | 1 +
 tests/qemu-iotests/094 | 1 +
 tests/qemu-iotests/095 | 1 +
 tests/qemu-iotests/096 | 1 +
 tests/qemu-iotests/097 | 1 +
 tests/qemu-iotests/098 | 1 +
 tests/qemu-iotests/099 | 1 +
 tests/qemu-iotests/101 | 1 +
 tests/qemu-iotests/102 | 1 +
 tests/qemu-iotests/103 | 1 +
 tests/qemu-iotests/104 | 1 +
 tests/qemu-iotests/105 | 1 +
 tests/qemu-iotests/106 | 1 +
 tests/qemu-iotests/107 | 1 +
 tests/qemu-iotests/108 | 1 +
 tests/qemu-iotests/109 | 1 +
 tests/qemu-iotests/110 | 1 +
 tests/qemu-iotests/111 | 1 +
 tests/qemu-iotests/112 | 1 +
 tests/qemu-iotests/113 | 1 +
 tests/qemu-iotests/114 | 1 +
 tests/qemu-iotests/115 | 1 +
 tests/qemu-iotests/116 | 1 +
 tests/qemu-iotests/117 | 1 +
 tests/qemu-iotests/118 | 1 +
 tests/qemu-iotests/119 | 1 +
 tests/qemu-iotests/120 | 1 +
 tests/qemu-iotests/121 | 1 +
 tests/qemu-iotests/122 | 1 +
 tests/qemu-iotests/123 | 1 +
 tests/qemu-iotests/124 | 1 +
 tests/qemu-iotests/125 | 1 +
 tests/qemu-iotests/126 | 1 +
 tests/qemu-iotests/127 | 1 +
 tests/qemu-iotests/128 | 1 +
 tests/qemu-iotests/129 | 1 +
 tests/qemu-iotests/130 | 1 +
 tests/qemu-iotests/131 | 1 +
 tests/qemu-iotests/132 | 1 +
 tests/qemu-iotests/133 | 1 +
 tests/qemu-iotests/134 | 1 +
 tests/qemu-iotests/135 | 1 +
 tests/qemu-iotests/136 | 1 +
 tests/qemu-iotests/137 | 1 +
 tests/qemu-iotests/138 | 1 +
 tests/qemu-iotests/139 | 1 +
 tests/qemu-iotests/140 | 1 +
 tests/qemu-iotests/141 | 1 +
 tests/qemu-iotests/143 | 1 +
 tests/qemu-iotests/144 | 1 +
 tests/qemu-iotests/145 | 1 +
 tests/qemu-iotests/146 | 1 +
 tests/qemu-iotests/147 | 1 +
 tests/qemu-iotests/148 | 1 +
 tests/qemu-iotests/149 | 1 +
 tests/qemu-iotests/150 | 1 +
 tests/qemu-iotests/151 | 1 +
 tests/qemu-iotests/152 | 1 +
 tests/qemu-iotests/153 | 1 +
 tests/qemu-iotests/154 | 1 +
 tests/qemu-iotests/155 | 1 +
 tests/qemu-iotests/156 | 1 +
 tests/qemu-iotests/157 | 1 +
 tests/qemu-iotests/158 | 1 +
 tests/qemu-iotests/159 | 1 +
 tests/qemu-iotests/160 | 1 +
 tests/qemu-iotests/161 | 1 +
 tests/qemu-iotests/162 | 1 +
 tests/qemu-iotests/163 | 1 +
 tests/qemu-iotests/165 | 1 +
 tests/qemu-iotests/169 | 1 +
 tests/qemu-iotests/170 | 1 +
 tests/qemu-iotests/171 | 1 +
 tests/qemu-iotests/172 | 1 +
 tests/qemu-iotests/173 | 1 +
 tests/qemu-iotests/174 | 1 +
 tests/qemu-iotests/175 | 1 +
 tests/qemu-iotests/176 | 1 +
 tests/qemu-iotests/177 | 1 +
 tests/qemu-iotests/178 | 1 +
 tests/qemu-iotests/179 | 1 +
 tests/qemu-iotests/181 | 1 +
 tests/qemu-iotests/182 | 1 +
 tests/qemu-iotests/183 | 1 +
 tests/qemu-iotests/184 | 1 +
 tests/qemu-iotests/185 | 1 +
 tests/qemu-iotests/186 | 1 +
 tests/qemu-iotests/187 | 1 +
 tests/qemu-iotests/188 | 1 +
 tests/qemu-iotests/189 | 1 +
 tests/qemu-iotests/190 | 1 +
 tests/qemu-iotests/191 | 1 +
 tests/qemu-iotests/192 | 1 +
 tests/qemu-iotests/194 | 1 +
 tests/qemu-iotests/195 | 1 +
 tests/qemu-iotests/196 | 1 +
 tests/qemu-iotests/197 | 1 +
 tests/qemu-iotests/198 | 1 +
 tests/qemu-iotests/199 | 1 +
 tests/qemu-iotests/200 | 1 +
 tests/qemu-iotests/201 | 1 +
 tests/qemu-iotests/202 | 1 +
 tests/qemu-iotests/203 | 1 +
 tests/qemu-iotests/204 | 1 +
 tests/qemu-iotests/205 | 1 +
 tests/qemu-iotests/206 | 1 +
 tests/qemu-iotests/207 | 1 +
 tests/qemu-iotests/208 | 1 +
 tests/qemu-iotests/209 | 1 +
 tests/qemu-iotests/210 | 1 +
 tests/qemu-iotests/211 | 1 +
 tests/qemu-iotests/212 | 1 +
 tests/qemu-iotests/213 | 1 +
 tests/qemu-iotests/214 | 1 +
 tests/qemu-iotests/215 | 1 +
 tests/qemu-iotests/216 | 1 +
 tests/qemu-iotests/217 | 1 +
 tests/qemu-iotests/218 | 1 +
 tests/qemu-iotests/219 | 1 +
 tests/qemu-iotests/220 | 1 +
 tests/qemu-iotests/221 | 1 +
 tests/qemu-iotests/222 | 1 +
 tests/qemu-iotests/223 | 1 +
 tests/qemu-iotests/224 | 1 +
 tests/qemu-iotests/225 | 1 +
 tests/qemu-iotests/226 | 1 +
 tests/qemu-iotests/227 | 1 +
 tests/qemu-iotests/228 | 1 +
 tests/qemu-iotests/229 | 1 +
 tests/qemu-iotests/231 | 1 +
 tests/qemu-iotests/232 | 1 +
 tests/qemu-iotests/233 | 1 +
 tests/qemu-iotests/234 | 1 +
 tests/qemu-iotests/235 | 1 +
 tests/qemu-iotests/236 | 1 +
 tests/qemu-iotests/237 | 1 +
 tests/qemu-iotests/238 | 1 +
 tests/qemu-iotests/239 | 1 +
 tests/qemu-iotests/240 | 1 +
 tests/qemu-iotests/241 | 1 +
 tests/qemu-iotests/242 | 1 +
 tests/qemu-iotests/243 | 1 +
 tests/qemu-iotests/244 | 1 +
 tests/qemu-iotests/245 | 1 +
 tests/qemu-iotests/246 | 1 +
 tests/qemu-iotests/247 | 1 +
 tests/qemu-iotests/248 | 1 +
 tests/qemu-iotests/249 | 1 +
 tests/qemu-iotests/250 | 1 +
 tests/qemu-iotests/251 | 1 +
 tests/qemu-iotests/252 | 1 +
 tests/qemu-iotests/253 | 1 +
 tests/qemu-iotests/254 | 1 +
 tests/qemu-iotests/255 | 1 +
 tests/qemu-iotests/256 | 1 +
 tests/qemu-iotests/257 | 1 +
 tests/qemu-iotests/258 | 1 +
 tests/qemu-iotests/259 | 1 +
 tests/qemu-iotests/260 | 1 +
 tests/qemu-iotests/261 | 1 +
 tests/qemu-iotests/262 | 1 +
 tests/qemu-iotests/263 | 1 +
 tests/qemu-iotests/264 | 1 +
 tests/qemu-iotests/265 | 1 +
 tests/qemu-iotests/266 | 1 +
 tests/qemu-iotests/267 | 1 +
 tests/qemu-iotests/268 | 1 +
 tests/qemu-iotests/270 | 1 +
 tests/qemu-iotests/271 | 1 +
 tests/qemu-iotests/272 | 1 +
 tests/qemu-iotests/273 | 1 +
 tests/qemu-iotests/274 | 1 +
 tests/qemu-iotests/277 | 1 +
 tests/qemu-iotests/279 | 1 +
 tests/qemu-iotests/280 | 1 +
 tests/qemu-iotests/281 | 1 +
 tests/qemu-iotests/282 | 1 +
 tests/qemu-iotests/283 | 1 +
 tests/qemu-iotests/284 | 1 +
 tests/qemu-iotests/286 | 1 +
 tests/qemu-iotests/287 | 1 +
 tests/qemu-iotests/288 | 1 +
 tests/qemu-iotests/289 | 1 +
 tests/qemu-iotests/290 | 1 +
 tests/qemu-iotests/291 | 1 +
 tests/qemu-iotests/292 | 1 +
 tests/qemu-iotests/293 | 1 +
 tests/qemu-iotests/294 | 1 +
 tests/qemu-iotests/295 | 1 +
 tests/qemu-iotests/296 | 1 +
 tests/qemu-iotests/297 | 1 +
 tests/qemu-iotests/299 | 1 +
 tests/qemu-iotests/300 | 1 +
 tests/qemu-iotests/301 | 1 +
 tests/qemu-iotests/302 | 1 +
 tests/qemu-iotests/303 | 1 +
 tests/qemu-iotests/304 | 1 +
 tests/qemu-iotests/305 | 1 +
 tests/qemu-iotests/307 | 1 +
 tests/qemu-iotests/308 | 1 +
 tests/qemu-iotests/309 | 1 +
 tests/qemu-iotests/312 | 1 +
 291 files changed, 291 insertions(+)

diff --git a/tests/qemu-iotests/001 b/tests/qemu-iotests/001
index 696726e45f..6f980fd34d 100755
--- a/tests/qemu-iotests/001
+++ b/tests/qemu-iotests/001
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test simple read/write using plain bdrv_pread/bdrv_pwrite
 #
diff --git a/tests/qemu-iotests/002 b/tests/qemu-iotests/002
index 1a0d411df5..5ce1647531 100755
--- a/tests/qemu-iotests/002
+++ b/tests/qemu-iotests/002
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test simple read/write using plain bdrv_pread/bdrv_pwrite
 #
diff --git a/tests/qemu-iotests/003 b/tests/qemu-iotests/003
index 33eeade0de..03f902a83c 100755
--- a/tests/qemu-iotests/003
+++ b/tests/qemu-iotests/003
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto
 #
 # Test simple read/write using bdrv_aio_readv/bdrv_aio_writev
 #
diff --git a/tests/qemu-iotests/004 b/tests/qemu-iotests/004
index d308dc4b49..e955579a67 100755
--- a/tests/qemu-iotests/004
+++ b/tests/qemu-iotests/004
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Make sure we can't read and write outside of the image size.
 #
diff --git a/tests/qemu-iotests/005 b/tests/qemu-iotests/005
index b6d03ac37d..40e64a9a8f 100755
--- a/tests/qemu-iotests/005
+++ b/tests/qemu-iotests/005
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: img auto quick
 #
 # Make sure qemu-img can create 5TB images
 #
diff --git a/tests/qemu-iotests/007 b/tests/qemu-iotests/007
index 160683adf8..936d3f14fb 100755
--- a/tests/qemu-iotests/007
+++ b/tests/qemu-iotests/007
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: snapshot auto
 #
 # Check for one possible case of qcow2 refcount corruption.
 #
diff --git a/tests/qemu-iotests/008 b/tests/qemu-iotests/008
index 2b81b119bf..fa4990b513 100755
--- a/tests/qemu-iotests/008
+++ b/tests/qemu-iotests/008
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test simple asynchronous read/write operations.
 #
diff --git a/tests/qemu-iotests/009 b/tests/qemu-iotests/009
index 4dc7d210f9..efa852bad3 100755
--- a/tests/qemu-iotests/009
+++ b/tests/qemu-iotests/009
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Nolan I qcow2 corruption - incorrectly reports free clusters
 #
diff --git a/tests/qemu-iotests/010 b/tests/qemu-iotests/010
index df809b3088..4ae9027b47 100755
--- a/tests/qemu-iotests/010
+++ b/tests/qemu-iotests/010
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Nolan II qcow2 corruption - wrong used cluster
 #
diff --git a/tests/qemu-iotests/011 b/tests/qemu-iotests/011
index 57b99ae4a9..5c99ac987f 100755
--- a/tests/qemu-iotests/011
+++ b/tests/qemu-iotests/011
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test for AIO allocation on the same cluster
 #
diff --git a/tests/qemu-iotests/012 b/tests/qemu-iotests/012
index 12957285b3..3a24d2ca8d 100755
--- a/tests/qemu-iotests/012
+++ b/tests/qemu-iotests/012
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: auto quick
 #
 # Make sure we can open read-only images
 #
diff --git a/tests/qemu-iotests/013 b/tests/qemu-iotests/013
index 5cb9032f16..d39d0cd88b 100755
--- a/tests/qemu-iotests/013
+++ b/tests/qemu-iotests/013
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto
 #
 # qcow2 pattern test, empty and compressed image - 4k cluster patterns
 #
diff --git a/tests/qemu-iotests/014 b/tests/qemu-iotests/014
index e1221c0fff..2d23469332 100755
--- a/tests/qemu-iotests/014
+++ b/tests/qemu-iotests/014
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # qcow2 pattern test, complex patterns including compression and snapshots
 # Using patterns for 4k cluster size.
diff --git a/tests/qemu-iotests/015 b/tests/qemu-iotests/015
index 4d8effd0ae..40c23235a6 100755
--- a/tests/qemu-iotests/015
+++ b/tests/qemu-iotests/015
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw snapshot
 #
 # Combined test to grow the refcount table and test snapshots.
 #
diff --git a/tests/qemu-iotests/017 b/tests/qemu-iotests/017
index 3413e34f27..2024b85e79 100755
--- a/tests/qemu-iotests/017
+++ b/tests/qemu-iotests/017
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw backing auto quick
 #
 # Simple backing file reads
 #
diff --git a/tests/qemu-iotests/018 b/tests/qemu-iotests/018
index 191b461a4d..6fcebbb40e 100755
--- a/tests/qemu-iotests/018
+++ b/tests/qemu-iotests/018
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw backing auto quick
 #
 # Merge backing file into test image when converting the image
 #
diff --git a/tests/qemu-iotests/019 b/tests/qemu-iotests/019
index d3c11256dc..fa4458fd27 100755
--- a/tests/qemu-iotests/019
+++ b/tests/qemu-iotests/019
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw backing auto quick
 #
 # When using a backing file for the output image in qemu-img convert,
 # the backing file clusters must not copied. The data must still be
diff --git a/tests/qemu-iotests/020 b/tests/qemu-iotests/020
index 596505be2d..60c672e17b 100755
--- a/tests/qemu-iotests/020
+++ b/tests/qemu-iotests/020
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw backing auto quick
 #
 # Commit changes to backing file
 #
diff --git a/tests/qemu-iotests/021 b/tests/qemu-iotests/021
index f888269fd4..0fc89df2fe 100755
--- a/tests/qemu-iotests/021
+++ b/tests/qemu-iotests/021
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: io auto quick
 #
 # Test handling of invalid patterns arguments to qemu-io
 #
diff --git a/tests/qemu-iotests/022 b/tests/qemu-iotests/022
index 99eb08f57f..a116cfe255 100755
--- a/tests/qemu-iotests/022
+++ b/tests/qemu-iotests/022
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw snapshot auto
 #
 # Test bdrv_load/save_vmstate using the usual patterns
 #
diff --git a/tests/qemu-iotests/023 b/tests/qemu-iotests/023
index 02ed047820..d19d13ff5d 100755
--- a/tests/qemu-iotests/023
+++ b/tests/qemu-iotests/023
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # qcow2 pattern test with various cluster sizes
 #
diff --git a/tests/qemu-iotests/024 b/tests/qemu-iotests/024
index 12aceb2d41..25a564a150 100755
--- a/tests/qemu-iotests/024
+++ b/tests/qemu-iotests/024
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw backing auto quick
 #
 # Rebasing COW images
 #
diff --git a/tests/qemu-iotests/025 b/tests/qemu-iotests/025
index 1569d912f4..da77ed3154 100755
--- a/tests/qemu-iotests/025
+++ b/tests/qemu-iotests/025
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Resizing images
 #
diff --git a/tests/qemu-iotests/026 b/tests/qemu-iotests/026
index 9ecc5880b1..d37e266dad 100755
--- a/tests/qemu-iotests/026
+++ b/tests/qemu-iotests/026
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw blkdbg
 #
 # qcow2 error path testing
 #
diff --git a/tests/qemu-iotests/027 b/tests/qemu-iotests/027
index 494be0921f..b279c88f33 100755
--- a/tests/qemu-iotests/027
+++ b/tests/qemu-iotests/027
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test that sub-cluster allocating writes zero the rest of the cluster
 #
diff --git a/tests/qemu-iotests/028 b/tests/qemu-iotests/028
index 57d34aae99..8c391f2adc 100755
--- a/tests/qemu-iotests/028
+++ b/tests/qemu-iotests/028
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw backing quick
 #
 # Test that backing files can be smaller than the image
 #
diff --git a/tests/qemu-iotests/029 b/tests/qemu-iotests/029
index 61d78c00a4..bd71dd2f22 100755
--- a/tests/qemu-iotests/029
+++ b/tests/qemu-iotests/029
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # qcow2 internal snapshots/VM state tests
 #
diff --git a/tests/qemu-iotests/030 b/tests/qemu-iotests/030
index dcb4b5d6a6..890784b116 100755
--- a/tests/qemu-iotests/030
+++ b/tests/qemu-iotests/030
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw auto backing
 #
 # Tests for image streaming.
 #
diff --git a/tests/qemu-iotests/031 b/tests/qemu-iotests/031
index 2bcbc5886e..58b57a0ef2 100755
--- a/tests/qemu-iotests/031
+++ b/tests/qemu-iotests/031
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test that all qcow2 header extensions survive a header rewrite
 #
diff --git a/tests/qemu-iotests/032 b/tests/qemu-iotests/032
index 8337a4d825..ebbe7cb0ba 100755
--- a/tests/qemu-iotests/032
+++ b/tests/qemu-iotests/032
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test that AIO requests are drained before an image is closed. This used
 # to segfault because the request coroutine kept running even after the
diff --git a/tests/qemu-iotests/033 b/tests/qemu-iotests/033
index 8b40991d55..da9133c44b 100755
--- a/tests/qemu-iotests/033
+++ b/tests/qemu-iotests/033
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test aligned and misaligned write zeroes operations.
 #
diff --git a/tests/qemu-iotests/034 b/tests/qemu-iotests/034
index 08f7aea6d5..ac1af8f646 100755
--- a/tests/qemu-iotests/034
+++ b/tests/qemu-iotests/034
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto backing quick
 #
 # Test bdrv_pwrite_zeroes with backing files (see also 154)
 #
diff --git a/tests/qemu-iotests/035 b/tests/qemu-iotests/035
index d950a0dd1e..0c0c4fdd42 100755
--- a/tests/qemu-iotests/035
+++ b/tests/qemu-iotests/035
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Let a few AIO requests run in parallel and have them access different L2
 # tables so that the cache has a chance to get used up.
diff --git a/tests/qemu-iotests/036 b/tests/qemu-iotests/036
index 6b82638080..5e567012a8 100755
--- a/tests/qemu-iotests/036
+++ b/tests/qemu-iotests/036
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test qcow2 feature bits
 #
diff --git a/tests/qemu-iotests/037 b/tests/qemu-iotests/037
index bb893c43dc..85b1015056 100755
--- a/tests/qemu-iotests/037
+++ b/tests/qemu-iotests/037
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto backing quick
 #
 # Test COW from backing files
 #
diff --git a/tests/qemu-iotests/038 b/tests/qemu-iotests/038
index 30f1f73c25..65bf7a753e 100755
--- a/tests/qemu-iotests/038
+++ b/tests/qemu-iotests/038
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto backing quick
 #
 # Test COW from backing files with AIO
 #
diff --git a/tests/qemu-iotests/039 b/tests/qemu-iotests/039
index ad3867c3fc..12b2c7fa7b 100755
--- a/tests/qemu-iotests/039
+++ b/tests/qemu-iotests/039
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test qcow2 lazy refcounts
 #
diff --git a/tests/qemu-iotests/040 b/tests/qemu-iotests/040
index dc6069edc0..7ebc9ed825 100755
--- a/tests/qemu-iotests/040
+++ b/tests/qemu-iotests/040
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw auto
 #
 # Tests for image block commit.
 #
diff --git a/tests/qemu-iotests/041 b/tests/qemu-iotests/041
index a7780853cd..5cc02b24fc 100755
--- a/tests/qemu-iotests/041
+++ b/tests/qemu-iotests/041
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw auto backing
 #
 # Tests for image mirroring.
 #
diff --git a/tests/qemu-iotests/042 b/tests/qemu-iotests/042
index e8f23a174c..411e54ae04 100755
--- a/tests/qemu-iotests/042
+++ b/tests/qemu-iotests/042
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test qemu-img operation on zero size images
 #
diff --git a/tests/qemu-iotests/043 b/tests/qemu-iotests/043
index 3271737f69..f8ce3288db 100755
--- a/tests/qemu-iotests/043
+++ b/tests/qemu-iotests/043
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto backing
 #
 # Test that qemu-img info --backing-chain detects infinite loops
 #
diff --git a/tests/qemu-iotests/044 b/tests/qemu-iotests/044
index 7e99ea7c68..64b18eb7c8 100755
--- a/tests/qemu-iotests/044
+++ b/tests/qemu-iotests/044
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw
 #
 # Tests growing a large refcount table.
 #
diff --git a/tests/qemu-iotests/045 b/tests/qemu-iotests/045
index 5acc89099c..45eb239baa 100755
--- a/tests/qemu-iotests/045
+++ b/tests/qemu-iotests/045
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Tests for fdsets and getfd.
 #
diff --git a/tests/qemu-iotests/046 b/tests/qemu-iotests/046
index ed6fae3529..50b0678f60 100755
--- a/tests/qemu-iotests/046
+++ b/tests/qemu-iotests/046
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto aio quick
 #
 # Test concurrent cluster allocations
 #
diff --git a/tests/qemu-iotests/047 b/tests/qemu-iotests/047
index 4528465fb0..8dd21e0a81 100755
--- a/tests/qemu-iotests/047
+++ b/tests/qemu-iotests/047
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Regression test for commit b7ab0fea (which was a corruption fix,
 # despite the commit message claiming otherwise)
diff --git a/tests/qemu-iotests/048 b/tests/qemu-iotests/048
index 2af6b74b41..bf8e4bf528 100755
--- a/tests/qemu-iotests/048
+++ b/tests/qemu-iotests/048
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: img auto quick
 ##
 ## qemu-img compare test
 ##
diff --git a/tests/qemu-iotests/049 b/tests/qemu-iotests/049
index 82b1e6c202..ed12fa49d7 100755
--- a/tests/qemu-iotests/049
+++ b/tests/qemu-iotests/049
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto
 #
 # Check qemu-img option parsing
 #
diff --git a/tests/qemu-iotests/050 b/tests/qemu-iotests/050
index 741bdb610e..1de01c312e 100755
--- a/tests/qemu-iotests/050
+++ b/tests/qemu-iotests/050
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto backing quick
 #
 # Test qemu-img rebase with zero clusters
 #
diff --git a/tests/qemu-iotests/051 b/tests/qemu-iotests/051
index bee26075b2..7cbd1415ce 100755
--- a/tests/qemu-iotests/051
+++ b/tests/qemu-iotests/051
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # Test command line configuration of block devices and driver-specific options
 #
diff --git a/tests/qemu-iotests/052 b/tests/qemu-iotests/052
index 8d5c10601f..2f23ac9b65 100755
--- a/tests/qemu-iotests/052
+++ b/tests/qemu-iotests/052
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto backing quick
 #
 # Test bdrv_pread/bdrv_pwrite using BDRV_O_SNAPSHOT
 #
diff --git a/tests/qemu-iotests/053 b/tests/qemu-iotests/053
index 71d299c4f9..9a2958d42d 100755
--- a/tests/qemu-iotests/053
+++ b/tests/qemu-iotests/053
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test qemu-img convert when image length is not a multiple of cluster size
 #
diff --git a/tests/qemu-iotests/054 b/tests/qemu-iotests/054
index 40922db2b1..ea147012c3 100755
--- a/tests/qemu-iotests/054
+++ b/tests/qemu-iotests/054
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test huge qcow2 images
 #
diff --git a/tests/qemu-iotests/055 b/tests/qemu-iotests/055
index 4d3744b0d3..5d6b607051 100755
--- a/tests/qemu-iotests/055
+++ b/tests/qemu-iotests/055
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw
 #
 # Tests for drive-backup and blockdev-backup
 #
diff --git a/tests/qemu-iotests/056 b/tests/qemu-iotests/056
index 052456aa00..0e6b8591e7 100755
--- a/tests/qemu-iotests/056
+++ b/tests/qemu-iotests/056
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw backing
 #
 # Tests for drive-backup
 #
diff --git a/tests/qemu-iotests/057 b/tests/qemu-iotests/057
index a8b4bb60e0..b0d431999e 100755
--- a/tests/qemu-iotests/057
+++ b/tests/qemu-iotests/057
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw
 #
 # Tests for internal snapshot.
 #
diff --git a/tests/qemu-iotests/058 b/tests/qemu-iotests/058
index d84740ed9f..ce35ff4ee0 100755
--- a/tests/qemu-iotests/058
+++ b/tests/qemu-iotests/058
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test export internal snapshot by qemu-nbd, convert it by qemu-img.
 #
diff --git a/tests/qemu-iotests/059 b/tests/qemu-iotests/059
index dcc442be9f..65c0c32b26 100755
--- a/tests/qemu-iotests/059
+++ b/tests/qemu-iotests/059
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test case for vmdk
 #
diff --git a/tests/qemu-iotests/060 b/tests/qemu-iotests/060
index 4b81d1aa51..db26c6b246 100755
--- a/tests/qemu-iotests/060
+++ b/tests/qemu-iotests/060
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test case for image corruption (overlapping data structures) in qcow2
 #
diff --git a/tests/qemu-iotests/061 b/tests/qemu-iotests/061
index 5747beb7ed..e26d94a0df 100755
--- a/tests/qemu-iotests/061
+++ b/tests/qemu-iotests/061
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto
 #
 # Test case for image option amendment in qcow2.
 #
diff --git a/tests/qemu-iotests/062 b/tests/qemu-iotests/062
index f26b88df9d..321252298d 100755
--- a/tests/qemu-iotests/062
+++ b/tests/qemu-iotests/062
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test case for snapshotting images with unallocated zero clusters in
 # qcow2
diff --git a/tests/qemu-iotests/063 b/tests/qemu-iotests/063
index c750b3806e..3a44758053 100755
--- a/tests/qemu-iotests/063
+++ b/tests/qemu-iotests/063
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # test of qemu-img convert -n - convert without creation
 #
diff --git a/tests/qemu-iotests/064 b/tests/qemu-iotests/064
index 90673186ec..71fc575b21 100755
--- a/tests/qemu-iotests/064
+++ b/tests/qemu-iotests/064
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test VHDX read/write from a sample image created with Hyper-V
 #
diff --git a/tests/qemu-iotests/065 b/tests/qemu-iotests/065
index 29a7f7ad60..3c2ca27627 100755
--- a/tests/qemu-iotests/065
+++ b/tests/qemu-iotests/065
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Test for additional information emitted by qemu-img info on qcow2
 # images
diff --git a/tests/qemu-iotests/066 b/tests/qemu-iotests/066
index a4ac613f8e..a780ed7ab5 100755
--- a/tests/qemu-iotests/066
+++ b/tests/qemu-iotests/066
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test case for preallocated zero clusters in qcow2
 #
diff --git a/tests/qemu-iotests/068 b/tests/qemu-iotests/068
index ccd1a9f1db..03e03508a6 100755
--- a/tests/qemu-iotests/068
+++ b/tests/qemu-iotests/068
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test case for loading a saved VM state from a qcow2 image
 #
diff --git a/tests/qemu-iotests/069 b/tests/qemu-iotests/069
index a4da83b2d9..222dcba741 100755
--- a/tests/qemu-iotests/069
+++ b/tests/qemu-iotests/069
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test case for deleting a backing file
 #
diff --git a/tests/qemu-iotests/070 b/tests/qemu-iotests/070
index cb0f927c16..b181e00f9b 100755
--- a/tests/qemu-iotests/070
+++ b/tests/qemu-iotests/070
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test VHDX log replay from an image with a journal that needs to be
 # replayed
diff --git a/tests/qemu-iotests/071 b/tests/qemu-iotests/071
index 49faae6684..d99cef5a42 100755
--- a/tests/qemu-iotests/071
+++ b/tests/qemu-iotests/071
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test case for the QMP blkdebug and blkverify interfaces
 #
diff --git a/tests/qemu-iotests/072 b/tests/qemu-iotests/072
index f0b73e7e65..c492ab8a78 100755
--- a/tests/qemu-iotests/072
+++ b/tests/qemu-iotests/072
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test case for nested image formats
 #
diff --git a/tests/qemu-iotests/073 b/tests/qemu-iotests/073
index 68517821e8..90afd420bd 100755
--- a/tests/qemu-iotests/073
+++ b/tests/qemu-iotests/073
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test count_contiguous_clusters in qcow2
 #
diff --git a/tests/qemu-iotests/074 b/tests/qemu-iotests/074
index db03edf0b0..c32c94b50d 100755
--- a/tests/qemu-iotests/074
+++ b/tests/qemu-iotests/074
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 ##
 ## qemu-img compare test (qcow2 only ones)
 ##
diff --git a/tests/qemu-iotests/075 b/tests/qemu-iotests/075
index 389d5675fa..ca2ed2a05c 100755
--- a/tests/qemu-iotests/075
+++ b/tests/qemu-iotests/075
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # cloop format input validation tests
 #
diff --git a/tests/qemu-iotests/076 b/tests/qemu-iotests/076
index 0d405ef3f2..1a8927d765 100755
--- a/tests/qemu-iotests/076
+++ b/tests/qemu-iotests/076
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: io
 #
 # parallels format input validation tests
 #
diff --git a/tests/qemu-iotests/077 b/tests/qemu-iotests/077
index c284952082..fbb90d8036 100755
--- a/tests/qemu-iotests/077
+++ b/tests/qemu-iotests/077
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test concurrent pread/pwrite
 #
diff --git a/tests/qemu-iotests/078 b/tests/qemu-iotests/078
index 54fc654d8e..0b48b7f137 100755
--- a/tests/qemu-iotests/078
+++ b/tests/qemu-iotests/078
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # bochs format input validation tests
 #
diff --git a/tests/qemu-iotests/079 b/tests/qemu-iotests/079
index 0f0d94a2ac..793e1f9d08 100755
--- a/tests/qemu-iotests/079
+++ b/tests/qemu-iotests/079
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto
 #
 # Test qcow2 preallocation with different cluster_sizes
 #
diff --git a/tests/qemu-iotests/080 b/tests/qemu-iotests/080
index bda8617c38..3306500683 100755
--- a/tests/qemu-iotests/080
+++ b/tests/qemu-iotests/080
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto
 #
 # qcow2 format input validation tests
 #
diff --git a/tests/qemu-iotests/081 b/tests/qemu-iotests/081
index 4e19972931..1ac66f197e 100755
--- a/tests/qemu-iotests/081
+++ b/tests/qemu-iotests/081
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test Quorum block driver
 #
diff --git a/tests/qemu-iotests/082 b/tests/qemu-iotests/082
index 2135581867..021b9bef06 100755
--- a/tests/qemu-iotests/082
+++ b/tests/qemu-iotests/082
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test qemu-img command line parsing
 #
diff --git a/tests/qemu-iotests/083 b/tests/qemu-iotests/083
index 10fdfc8ebb..bc32b537b2 100755
--- a/tests/qemu-iotests/083
+++ b/tests/qemu-iotests/083
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # Test NBD client unexpected disconnect
 #
diff --git a/tests/qemu-iotests/084 b/tests/qemu-iotests/084
index c29d7395e9..e51e91a7c8 100755
--- a/tests/qemu-iotests/084
+++ b/tests/qemu-iotests/084
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: img quick
 #
 # Test case for VDI header corruption; image too large, and too many blocks.
 # Also simple test for creating dynamic and static VDI images.
diff --git a/tests/qemu-iotests/085 b/tests/qemu-iotests/085
index e99eb44581..d557522943 100755
--- a/tests/qemu-iotests/085
+++ b/tests/qemu-iotests/085
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # Live snapshot tests
 #
diff --git a/tests/qemu-iotests/086 b/tests/qemu-iotests/086
index fea1a7bd8a..c055e7bfe1 100755
--- a/tests/qemu-iotests/086
+++ b/tests/qemu-iotests/086
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test qemu-img progress output
 #
diff --git a/tests/qemu-iotests/087 b/tests/qemu-iotests/087
index 678e748c58..edd43f1a28 100755
--- a/tests/qemu-iotests/087
+++ b/tests/qemu-iotests/087
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test unsupported blockdev-add cases
 #
diff --git a/tests/qemu-iotests/088 b/tests/qemu-iotests/088
index ef1163346c..e3102fe888 100755
--- a/tests/qemu-iotests/088
+++ b/tests/qemu-iotests/088
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # vpc (VHD) format input validation tests
 #
diff --git a/tests/qemu-iotests/089 b/tests/qemu-iotests/089
index f0929b64c0..48bdc42e42 100755
--- a/tests/qemu-iotests/089
+++ b/tests/qemu-iotests/089
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test case for support of JSON filenames
 #
diff --git a/tests/qemu-iotests/090 b/tests/qemu-iotests/090
index 87e872ebf4..2044c09e9b 100755
--- a/tests/qemu-iotests/090
+++ b/tests/qemu-iotests/090
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test for discarding compressed clusters on qcow2 images
 #
diff --git a/tests/qemu-iotests/091 b/tests/qemu-iotests/091
index 8dee168bf6..9d144b9439 100755
--- a/tests/qemu-iotests/091
+++ b/tests/qemu-iotests/091
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw migration quick
 #
 # Live migration test
 #
diff --git a/tests/qemu-iotests/092 b/tests/qemu-iotests/092
index 40ec62b6f1..bfa116d191 100755
--- a/tests/qemu-iotests/092
+++ b/tests/qemu-iotests/092
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # qcow1 format input validation tests
 #
diff --git a/tests/qemu-iotests/093 b/tests/qemu-iotests/093
index 32ded11430..7745cb04b6 100755
--- a/tests/qemu-iotests/093
+++ b/tests/qemu-iotests/093
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: throttle
 #
 # Tests for IO throttling
 #
diff --git a/tests/qemu-iotests/094 b/tests/qemu-iotests/094
index 2d3e1004d3..a295fb20ef 100755
--- a/tests/qemu-iotests/094
+++ b/tests/qemu-iotests/094
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test case for drive-mirror to NBD
 #
diff --git a/tests/qemu-iotests/095 b/tests/qemu-iotests/095
index 7604ae6966..20b5f9bf61 100755
--- a/tests/qemu-iotests/095
+++ b/tests/qemu-iotests/095
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test for commit of larger active layer
 #
diff --git a/tests/qemu-iotests/096 b/tests/qemu-iotests/096
index 5915f92786..b5d7636bdc 100755
--- a/tests/qemu-iotests/096
+++ b/tests/qemu-iotests/096
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Test that snapshots move the throttling configuration to the active
 # layer
diff --git a/tests/qemu-iotests/097 b/tests/qemu-iotests/097
index 1837d4e8e0..30313f8867 100755
--- a/tests/qemu-iotests/097
+++ b/tests/qemu-iotests/097
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto backing
 #
 # Commit changes into backing chains and empty the top image if the
 # backing image is not explicitly specified
diff --git a/tests/qemu-iotests/098 b/tests/qemu-iotests/098
index a35ce7205e..4c37eb0cf5 100755
--- a/tests/qemu-iotests/098
+++ b/tests/qemu-iotests/098
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto backing quick
 #
 # Test qcow2's bdrv_make_empty for images without internal snapshots
 #
diff --git a/tests/qemu-iotests/099 b/tests/qemu-iotests/099
index 65e8e92572..2f1199ce04 100755
--- a/tests/qemu-iotests/099
+++ b/tests/qemu-iotests/099
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test valid filenames for blkdebug and blkverify representatively for
 # other protocols (such as NBD) when queried
diff --git a/tests/qemu-iotests/101 b/tests/qemu-iotests/101
index a4c1b6366a..4c4a8cea11 100755
--- a/tests/qemu-iotests/101
+++ b/tests/qemu-iotests/101
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test short file I/O
 #
diff --git a/tests/qemu-iotests/102 b/tests/qemu-iotests/102
index 9d747c7bbf..8b4c4c905f 100755
--- a/tests/qemu-iotests/102
+++ b/tests/qemu-iotests/102
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test case for qemu-io -c map and qemu-img map
 #
diff --git a/tests/qemu-iotests/103 b/tests/qemu-iotests/103
index 220481db4c..726f8313ef 100755
--- a/tests/qemu-iotests/103
+++ b/tests/qemu-iotests/103
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test case for qcow2 metadata cache size specification
 #
diff --git a/tests/qemu-iotests/104 b/tests/qemu-iotests/104
index c70f28a9a1..3ebb74cf6e 100755
--- a/tests/qemu-iotests/104
+++ b/tests/qemu-iotests/104
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto
 #
 # Test image creation with aligned and unaligned sizes
 #
diff --git a/tests/qemu-iotests/105 b/tests/qemu-iotests/105
index 4d55a2d3ef..d804685110 100755
--- a/tests/qemu-iotests/105
+++ b/tests/qemu-iotests/105
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Create, read, write big image
 #
diff --git a/tests/qemu-iotests/106 b/tests/qemu-iotests/106
index 20ad7bd5a2..333144502c 100755
--- a/tests/qemu-iotests/106
+++ b/tests/qemu-iotests/106
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test preallocated resize of raw images
 #
diff --git a/tests/qemu-iotests/107 b/tests/qemu-iotests/107
index d24829ccf9..e68f1e07c7 100755
--- a/tests/qemu-iotests/107
+++ b/tests/qemu-iotests/107
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Tests updates of the qcow2 L1 table
 #
diff --git a/tests/qemu-iotests/108 b/tests/qemu-iotests/108
index ba67748bdf..8eaef0b8bf 100755
--- a/tests/qemu-iotests/108
+++ b/tests/qemu-iotests/108
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test case for repairing qcow2 images which cannot be repaired using
 # the on-disk refcount structures
diff --git a/tests/qemu-iotests/109 b/tests/qemu-iotests/109
index 3ffeaf3c55..e207a555f3 100755
--- a/tests/qemu-iotests/109
+++ b/tests/qemu-iotests/109
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # Test writing image headers of other formats into raw images
 #
diff --git a/tests/qemu-iotests/110 b/tests/qemu-iotests/110
index f1813d0dfb..1fa36ccdb7 100755
--- a/tests/qemu-iotests/110
+++ b/tests/qemu-iotests/110
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto backing quick
 #
 # Test case for relative backing file names in complex BDS trees
 #
diff --git a/tests/qemu-iotests/111 b/tests/qemu-iotests/111
index bd839a39f4..3ba25f6161 100755
--- a/tests/qemu-iotests/111
+++ b/tests/qemu-iotests/111
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test case for non-existing backing file when creating a qcow2 image
 # and not specifying the size
diff --git a/tests/qemu-iotests/112 b/tests/qemu-iotests/112
index 6e413f5651..07ac74fb2c 100755
--- a/tests/qemu-iotests/112
+++ b/tests/qemu-iotests/112
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # Test cases for different refcount_bits values
 #
diff --git a/tests/qemu-iotests/113 b/tests/qemu-iotests/113
index 71a65de2e7..ee59b9a4b8 100755
--- a/tests/qemu-iotests/113
+++ b/tests/qemu-iotests/113
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test case for accessing creation options on image formats and
 # protocols not supporting image creation
diff --git a/tests/qemu-iotests/114 b/tests/qemu-iotests/114
index 80e5e5e591..43cb0bc6c3 100755
--- a/tests/qemu-iotests/114
+++ b/tests/qemu-iotests/114
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test invalid backing file format in qcow2 images
 #
diff --git a/tests/qemu-iotests/115 b/tests/qemu-iotests/115
index 7f53987d1b..26dd37dd6d 100755
--- a/tests/qemu-iotests/115
+++ b/tests/qemu-iotests/115
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # Test case for non-self-referential qcow2 refcount blocks
 #
diff --git a/tests/qemu-iotests/116 b/tests/qemu-iotests/116
index 941b07a1a9..4f40fcb3d2 100755
--- a/tests/qemu-iotests/116
+++ b/tests/qemu-iotests/116
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test error code paths for invalid QED images
 #
diff --git a/tests/qemu-iotests/117 b/tests/qemu-iotests/117
index 9039555ac4..48ebc012b1 100755
--- a/tests/qemu-iotests/117
+++ b/tests/qemu-iotests/117
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto
 #
 # Test case for shared BDS between backend trees
 #
diff --git a/tests/qemu-iotests/118 b/tests/qemu-iotests/118
index 2350929fd8..1a2e219057 100755
--- a/tests/qemu-iotests/118
+++ b/tests/qemu-iotests/118
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw
 #
 # Test case for the QMP 'change' command and all other associated
 # commands
diff --git a/tests/qemu-iotests/119 b/tests/qemu-iotests/119
index ea6770a484..5770b50045 100755
--- a/tests/qemu-iotests/119
+++ b/tests/qemu-iotests/119
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # NBD test case for overriding BDRV_O_PROTOCOL by explicitly specifying
 # a driver
diff --git a/tests/qemu-iotests/120 b/tests/qemu-iotests/120
index 45c55c1c01..7187731253 100755
--- a/tests/qemu-iotests/120
+++ b/tests/qemu-iotests/120
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Non-NBD test cases for overriding BDRV_O_PROTOCOL by explicitly
 # specifying a driver
diff --git a/tests/qemu-iotests/121 b/tests/qemu-iotests/121
index 8357ce089a..ba3d8d9377 100755
--- a/tests/qemu-iotests/121
+++ b/tests/qemu-iotests/121
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # Test cases for qcow2 refcount table growth
 #
diff --git a/tests/qemu-iotests/122 b/tests/qemu-iotests/122
index 0f3d4ca851..5d550ed13e 100755
--- a/tests/qemu-iotests/122
+++ b/tests/qemu-iotests/122
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # Test some qemu-img convert cases
 #
diff --git a/tests/qemu-iotests/123 b/tests/qemu-iotests/123
index 01b771c76e..e19111f70d 100755
--- a/tests/qemu-iotests/123
+++ b/tests/qemu-iotests/123
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test case for qemu-img convert to NBD
 #
diff --git a/tests/qemu-iotests/124 b/tests/qemu-iotests/124
index 3705cbb6b3..3b21bc497f 100755
--- a/tests/qemu-iotests/124
+++ b/tests/qemu-iotests/124
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw backing
 #
 # Tests for incremental drive-backup
 #
diff --git a/tests/qemu-iotests/125 b/tests/qemu-iotests/125
index 5720e86dce..bd390b3a99 100755
--- a/tests/qemu-iotests/125
+++ b/tests/qemu-iotests/125
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # Test preallocated growth of qcow2 images
 #
diff --git a/tests/qemu-iotests/126 b/tests/qemu-iotests/126
index dd5a211227..92c0547746 100755
--- a/tests/qemu-iotests/126
+++ b/tests/qemu-iotests/126
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto backing
 #
 # Tests handling of colons in filenames (which may be confused with protocol
 # prefixes)
diff --git a/tests/qemu-iotests/127 b/tests/qemu-iotests/127
index 77fdfd0205..98e8e82a82 100755
--- a/tests/qemu-iotests/127
+++ b/tests/qemu-iotests/127
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto backing quick
 #
 # Test case for mirroring with dataplane
 #
diff --git a/tests/qemu-iotests/128 b/tests/qemu-iotests/128
index 3606c41760..d0e00d24b1 100755
--- a/tests/qemu-iotests/128
+++ b/tests/qemu-iotests/128
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test that opening O_DIRECT succeeds when image file I/O produces EIO
 #
diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
index 0e13244d85..f57a2e19f6 100755
--- a/tests/qemu-iotests/129
+++ b/tests/qemu-iotests/129
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Tests that "bdrv_drain_all" doesn't drain block jobs
 #
diff --git a/tests/qemu-iotests/130 b/tests/qemu-iotests/130
index a7b365701c..7257f09677 100755
--- a/tests/qemu-iotests/130
+++ b/tests/qemu-iotests/130
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test that temporary backing file overrides (on the command line or in
 # blockdev-add) don't replace the original path stored in the image during
diff --git a/tests/qemu-iotests/131 b/tests/qemu-iotests/131
index 27870231cf..d7456cae5b 100755
--- a/tests/qemu-iotests/131
+++ b/tests/qemu-iotests/131
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # parallels format validation tests (created by QEMU)
 #
diff --git a/tests/qemu-iotests/132 b/tests/qemu-iotests/132
index 39ea43067e..367ea08036 100755
--- a/tests/qemu-iotests/132
+++ b/tests/qemu-iotests/132
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Test mirror with unmap
 #
diff --git a/tests/qemu-iotests/133 b/tests/qemu-iotests/133
index bc82d8ebd7..d997db1685 100755
--- a/tests/qemu-iotests/133
+++ b/tests/qemu-iotests/133
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: auto quick
 #
 # Test for reopen
 #
diff --git a/tests/qemu-iotests/134 b/tests/qemu-iotests/134
index 17fe1d6ed4..ded153c0b9 100755
--- a/tests/qemu-iotests/134
+++ b/tests/qemu-iotests/134
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test encrypted read/write using plain bdrv_pread/bdrv_pwrite
 #
diff --git a/tests/qemu-iotests/135 b/tests/qemu-iotests/135
index 3b3d1dc2a5..299075b4c9 100755
--- a/tests/qemu-iotests/135
+++ b/tests/qemu-iotests/135
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # Test VPC open of image with large Max Table Entries value.
 #
diff --git a/tests/qemu-iotests/136 b/tests/qemu-iotests/136
index d59400c9fc..8fce88bd67 100755
--- a/tests/qemu-iotests/136
+++ b/tests/qemu-iotests/136
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw
 #
 # Tests for block device statistics
 #
diff --git a/tests/qemu-iotests/137 b/tests/qemu-iotests/137
index de555a91c9..4680d5df3d 100755
--- a/tests/qemu-iotests/137
+++ b/tests/qemu-iotests/137
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto
 #
 # Test qcow2 reopen
 #
diff --git a/tests/qemu-iotests/138 b/tests/qemu-iotests/138
index e87a64eb89..951cfa67d4 100755
--- a/tests/qemu-iotests/138
+++ b/tests/qemu-iotests/138
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # General test case for qcow2's image check
 #
diff --git a/tests/qemu-iotests/139 b/tests/qemu-iotests/139
index 1452fd24b3..e79b3c21fd 100755
--- a/tests/qemu-iotests/139
+++ b/tests/qemu-iotests/139
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Test cases for the QMP 'blockdev-del' command
 #
diff --git a/tests/qemu-iotests/140 b/tests/qemu-iotests/140
index ff6b904fa0..91e08c30d4 100755
--- a/tests/qemu-iotests/140
+++ b/tests/qemu-iotests/140
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test case for ejecting a BlockBackend with an NBD server attached to it
 #
diff --git a/tests/qemu-iotests/141 b/tests/qemu-iotests/141
index 21aa0b42d8..115cc1691e 100755
--- a/tests/qemu-iotests/141
+++ b/tests/qemu-iotests/141
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test case for ejecting BDSs with block jobs still running on them
 #
diff --git a/tests/qemu-iotests/143 b/tests/qemu-iotests/143
index d2349903b1..72151acf27 100755
--- a/tests/qemu-iotests/143
+++ b/tests/qemu-iotests/143
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: auto quick
 #
 # Test case for connecting to a non-existing NBD export name
 #
diff --git a/tests/qemu-iotests/144 b/tests/qemu-iotests/144
index 4569ac0b4b..60e9ddd75f 100755
--- a/tests/qemu-iotests/144
+++ b/tests/qemu-iotests/144
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 # Check live snapshot, followed by active commit, and another snapshot.
 #
 # This test is to catch the error case of BZ #1300209:
diff --git a/tests/qemu-iotests/145 b/tests/qemu-iotests/145
index 9427549651..a2ce92516d 100755
--- a/tests/qemu-iotests/145
+++ b/tests/qemu-iotests/145
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: quick
 #
 # Test the combination of -incoming and snapshot=on
 #
diff --git a/tests/qemu-iotests/146 b/tests/qemu-iotests/146
index ddc3c1fd80..98aca96732 100755
--- a/tests/qemu-iotests/146
+++ b/tests/qemu-iotests/146
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: quick
 #
 # Test VHD image format creator detection and override
 #
diff --git a/tests/qemu-iotests/147 b/tests/qemu-iotests/147
index d7a9f31089..47dfa62e6b 100755
--- a/tests/qemu-iotests/147
+++ b/tests/qemu-iotests/147
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: img
 #
 # Test case for NBD's blockdev-add interface
 #
diff --git a/tests/qemu-iotests/148 b/tests/qemu-iotests/148
index 5e14a455b1..7ccbde4633 100755
--- a/tests/qemu-iotests/148
+++ b/tests/qemu-iotests/148
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Test the rate limit of QMP events
 #
diff --git a/tests/qemu-iotests/149 b/tests/qemu-iotests/149
index 852768f80a..328fd05a4c 100755
--- a/tests/qemu-iotests/149
+++ b/tests/qemu-iotests/149
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw sudo
 #
 # Copyright (C) 2016 Red Hat, Inc.
 #
diff --git a/tests/qemu-iotests/150 b/tests/qemu-iotests/150
index 3b1f32197a..ac6930ae20 100755
--- a/tests/qemu-iotests/150
+++ b/tests/qemu-iotests/150
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test that qemu-img convert -S 0 fully allocates the target image
 #
diff --git a/tests/qemu-iotests/151 b/tests/qemu-iotests/151
index f2df72c29c..182f6b5321 100755
--- a/tests/qemu-iotests/151
+++ b/tests/qemu-iotests/151
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw
 #
 # Tests for active mirroring
 #
diff --git a/tests/qemu-iotests/152 b/tests/qemu-iotests/152
index cc2ea09654..4e179c340f 100755
--- a/tests/qemu-iotests/152
+++ b/tests/qemu-iotests/152
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Tests for drive-mirror with source size unaligned to granularity
 #
diff --git a/tests/qemu-iotests/153 b/tests/qemu-iotests/153
index 34045ea3cf..607af59091 100755
--- a/tests/qemu-iotests/153
+++ b/tests/qemu-iotests/153
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test image locking
 #
diff --git a/tests/qemu-iotests/154 b/tests/qemu-iotests/154
index 34a1c051b6..24e29ae2ff 100755
--- a/tests/qemu-iotests/154
+++ b/tests/qemu-iotests/154
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto backing quick
 #
 # qcow2 specific bdrv_pwrite_zeroes tests with backing files (complements 034)
 #
diff --git a/tests/qemu-iotests/155 b/tests/qemu-iotests/155
index 988f986144..bafef9dd9a 100755
--- a/tests/qemu-iotests/155
+++ b/tests/qemu-iotests/155
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw
 #
 # Test whether the backing BDSs are correct after completion of a
 # mirror block job; in "existing" modes (drive-mirror with
diff --git a/tests/qemu-iotests/156 b/tests/qemu-iotests/156
index 9c7878dd2d..65dcedd493 100755
--- a/tests/qemu-iotests/156
+++ b/tests/qemu-iotests/156
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Tests oVirt-like storage migration:
 #  - Create snapshot
diff --git a/tests/qemu-iotests/157 b/tests/qemu-iotests/157
index 7cbac38099..0dc9ba68d2 100755
--- a/tests/qemu-iotests/157
+++ b/tests/qemu-iotests/157
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: quick
 #
 # Test command line configuration of block devices with qdev
 #
diff --git a/tests/qemu-iotests/158 b/tests/qemu-iotests/158
index cf23742c59..a95878e4ce 100755
--- a/tests/qemu-iotests/158
+++ b/tests/qemu-iotests/158
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test encrypted read/write using backing files
 #
diff --git a/tests/qemu-iotests/159 b/tests/qemu-iotests/159
index f9690053a2..4eb476d3a8 100755
--- a/tests/qemu-iotests/159
+++ b/tests/qemu-iotests/159
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # qemu-img dd test with different block sizes
 #
diff --git a/tests/qemu-iotests/160 b/tests/qemu-iotests/160
index 0572b5ae9a..7984a9c6f7 100755
--- a/tests/qemu-iotests/160
+++ b/tests/qemu-iotests/160
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # qemu-img dd test for the skip option
 #
diff --git a/tests/qemu-iotests/161 b/tests/qemu-iotests/161
index 4fb7d0cbf0..f25effab93 100755
--- a/tests/qemu-iotests/161
+++ b/tests/qemu-iotests/161
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test reopening a backing image after block-stream and block-commit
 #
diff --git a/tests/qemu-iotests/162 b/tests/qemu-iotests/162
index c0053ed975..cf17f494d8 100755
--- a/tests/qemu-iotests/162
+++ b/tests/qemu-iotests/162
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: quick
 #
 # Test case for specifying runtime options of the wrong type to some
 # block drivers
diff --git a/tests/qemu-iotests/163 b/tests/qemu-iotests/163
index 5a3cc840a5..dedce8ef43 100755
--- a/tests/qemu-iotests/163
+++ b/tests/qemu-iotests/163
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw
 #
 # Tests for shrinking images
 #
diff --git a/tests/qemu-iotests/165 b/tests/qemu-iotests/165
index fb56a769b4..abc4ffadd5 100755
--- a/tests/qemu-iotests/165
+++ b/tests/qemu-iotests/165
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Tests for persistent dirty bitmaps.
 #
diff --git a/tests/qemu-iotests/169 b/tests/qemu-iotests/169
index 40afb15299..a5c7bc83e0 100755
--- a/tests/qemu-iotests/169
+++ b/tests/qemu-iotests/169
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw migration
 #
 # Tests for dirty bitmaps migration.
 #
diff --git a/tests/qemu-iotests/170 b/tests/qemu-iotests/170
index 6c8f0e8085..41387e4d66 100755
--- a/tests/qemu-iotests/170
+++ b/tests/qemu-iotests/170
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # qemu-img dd test
 #
diff --git a/tests/qemu-iotests/171 b/tests/qemu-iotests/171
index f3582edb10..d1d77f7013 100755
--- a/tests/qemu-iotests/171
+++ b/tests/qemu-iotests/171
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test 'offset' and 'size' options of the raw driver. Make sure we can't
 # (or can) read and write outside of the image size.
diff --git a/tests/qemu-iotests/172 b/tests/qemu-iotests/172
index b45782e8db..0ac942a6c5 100755
--- a/tests/qemu-iotests/172
+++ b/tests/qemu-iotests/172
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: auto
 #
 # Test floppy configuration
 #
diff --git a/tests/qemu-iotests/173 b/tests/qemu-iotests/173
index ec6d1705e5..9594f3c5ea 100755
--- a/tests/qemu-iotests/173
+++ b/tests/qemu-iotests/173
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # Test QAPI commands looking up protocol based images with relative
 # filename backing strings
diff --git a/tests/qemu-iotests/174 b/tests/qemu-iotests/174
index 1b0dd2e8b7..d4cecb5756 100755
--- a/tests/qemu-iotests/174
+++ b/tests/qemu-iotests/174
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: auto
 #
 # Test that qemu-io fail with non-zero exit code
 #
diff --git a/tests/qemu-iotests/175 b/tests/qemu-iotests/175
index 21a77a2bf5..f74f053b71 100755
--- a/tests/qemu-iotests/175
+++ b/tests/qemu-iotests/175
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: quick
 #
 # Test creating raw image preallocation mode
 #
diff --git a/tests/qemu-iotests/176 b/tests/qemu-iotests/176
index 5ce3b27069..27ac25467f 100755
--- a/tests/qemu-iotests/176
+++ b/tests/qemu-iotests/176
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto backing
 #
 # Commit changes into backing chains and empty the top image if the
 # backing image is not explicitly specified.
diff --git a/tests/qemu-iotests/177 b/tests/qemu-iotests/177
index 595bfd4236..8d8745b29a 100755
--- a/tests/qemu-iotests/177
+++ b/tests/qemu-iotests/177
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test corner cases with unusual block geometries
 #
diff --git a/tests/qemu-iotests/178 b/tests/qemu-iotests/178
index f09b27caac..3b1a7adce4 100755
--- a/tests/qemu-iotests/178
+++ b/tests/qemu-iotests/178
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: img
 #
 # qemu-img measure sub-command tests
 #
diff --git a/tests/qemu-iotests/179 b/tests/qemu-iotests/179
index 7ada04c641..09447b5610 100755
--- a/tests/qemu-iotests/179
+++ b/tests/qemu-iotests/179
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test case for write zeroes with unmap
 #
diff --git a/tests/qemu-iotests/181 b/tests/qemu-iotests/181
index 438c2dcd80..820c53ef35 100755
--- a/tests/qemu-iotests/181
+++ b/tests/qemu-iotests/181
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto migration quick
 #
 # Test postcopy live migration with shared storage
 #
diff --git a/tests/qemu-iotests/182 b/tests/qemu-iotests/182
index 56a2dd58e6..55a0384c08 100755
--- a/tests/qemu-iotests/182
+++ b/tests/qemu-iotests/182
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test image locking for POSIX locks
 #
diff --git a/tests/qemu-iotests/183 b/tests/qemu-iotests/183
index d889a3b19c..ee62939e72 100755
--- a/tests/qemu-iotests/183
+++ b/tests/qemu-iotests/183
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw migration quick
 #
 # Test old-style block migration (migrate -b)
 #
diff --git a/tests/qemu-iotests/184 b/tests/qemu-iotests/184
index eebb53faed..513d167098 100755
--- a/tests/qemu-iotests/184
+++ b/tests/qemu-iotests/184
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test I/O throttle block filter driver interface
 #
diff --git a/tests/qemu-iotests/185 b/tests/qemu-iotests/185
index fd5e6ebe11..7bc8fe5767 100755
--- a/tests/qemu-iotests/185
+++ b/tests/qemu-iotests/185
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # Test exiting qemu while jobs are still running
 #
diff --git a/tests/qemu-iotests/186 b/tests/qemu-iotests/186
index 0db25b0e68..072e54e62b 100755
--- a/tests/qemu-iotests/186
+++ b/tests/qemu-iotests/186
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto
 #
 # Test 'info block' with all kinds of configurations
 #
diff --git a/tests/qemu-iotests/187 b/tests/qemu-iotests/187
index f262d83e3a..70b74b033c 100755
--- a/tests/qemu-iotests/187
+++ b/tests/qemu-iotests/187
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto
 #
 # Test switching between read-only and read-write
 #
diff --git a/tests/qemu-iotests/188 b/tests/qemu-iotests/188
index 13b225fded..ce087d1873 100755
--- a/tests/qemu-iotests/188
+++ b/tests/qemu-iotests/188
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test encrypted read/write using plain bdrv_pread/bdrv_pwrite
 #
diff --git a/tests/qemu-iotests/189 b/tests/qemu-iotests/189
index 3e5ded14c6..4e463385b2 100755
--- a/tests/qemu-iotests/189
+++ b/tests/qemu-iotests/189
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # Test encrypted read/write using backing files
 #
diff --git a/tests/qemu-iotests/190 b/tests/qemu-iotests/190
index c22d8d64f9..7fb8447354 100755
--- a/tests/qemu-iotests/190
+++ b/tests/qemu-iotests/190
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # qemu-img measure sub-command tests on huge qcow2 files
 #
diff --git a/tests/qemu-iotests/191 b/tests/qemu-iotests/191
index 95a891350d..ce695b95c2 100755
--- a/tests/qemu-iotests/191
+++ b/tests/qemu-iotests/191
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto
 #
 # Test commit block job where top has two parents
 #
diff --git a/tests/qemu-iotests/192 b/tests/qemu-iotests/192
index d2ba55dd90..d809187fca 100755
--- a/tests/qemu-iotests/192
+++ b/tests/qemu-iotests/192
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test NBD export with -incoming (non-shared storage migration use case from
 # libvirt)
diff --git a/tests/qemu-iotests/194 b/tests/qemu-iotests/194
index 7a4863ab18..3889266afa 100755
--- a/tests/qemu-iotests/194
+++ b/tests/qemu-iotests/194
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw migration quick
 #
 # Copyright (C) 2017 Red Hat, Inc.
 #
diff --git a/tests/qemu-iotests/195 b/tests/qemu-iotests/195
index 967af5b7b5..f1df69079f 100755
--- a/tests/qemu-iotests/195
+++ b/tests/qemu-iotests/195
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test change-backing-file command
 #
diff --git a/tests/qemu-iotests/196 b/tests/qemu-iotests/196
index e8fcf37273..2451515094 100755
--- a/tests/qemu-iotests/196
+++ b/tests/qemu-iotests/196
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick migration
 #
 # Test clearing unknown autoclear_features flag by qcow2 after
 # migration. This test mimics migration to older qemu.
diff --git a/tests/qemu-iotests/197 b/tests/qemu-iotests/197
index a161c89816..a2547bc280 100755
--- a/tests/qemu-iotests/197
+++ b/tests/qemu-iotests/197
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test case for copy-on-read into qcow2
 #
diff --git a/tests/qemu-iotests/198 b/tests/qemu-iotests/198
index 46f0c54537..b333a8f281 100755
--- a/tests/qemu-iotests/198
+++ b/tests/qemu-iotests/198
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # Test commit of encrypted qcow2 files
 #
diff --git a/tests/qemu-iotests/199 b/tests/qemu-iotests/199
index 58fad872a1..dbf10e58d3 100755
--- a/tests/qemu-iotests/199
+++ b/tests/qemu-iotests/199
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw migration
 #
 # Tests for dirty bitmaps postcopy migration.
 #
diff --git a/tests/qemu-iotests/200 b/tests/qemu-iotests/200
index 046539154f..f80517e342 100755
--- a/tests/qemu-iotests/200
+++ b/tests/qemu-iotests/200
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # Block job co-routine race condition test.
 #
diff --git a/tests/qemu-iotests/201 b/tests/qemu-iotests/201
index 483eb189c5..1b8eb51d8f 100755
--- a/tests/qemu-iotests/201
+++ b/tests/qemu-iotests/201
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw migration quick
 #
 # Test savevm and loadvm after live migration with postcopy flag
 #
diff --git a/tests/qemu-iotests/202 b/tests/qemu-iotests/202
index e3900a44d1..8eb5f32d15 100755
--- a/tests/qemu-iotests/202
+++ b/tests/qemu-iotests/202
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Copyright (C) 2017 Red Hat, Inc.
 #
diff --git a/tests/qemu-iotests/203 b/tests/qemu-iotests/203
index 4b4bd3307d..ea30e50497 100755
--- a/tests/qemu-iotests/203
+++ b/tests/qemu-iotests/203
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw auto migration quick
 #
 # Copyright (C) 2017 Red Hat, Inc.
 #
diff --git a/tests/qemu-iotests/204 b/tests/qemu-iotests/204
index 536bb8b534..ab68b6d75c 100755
--- a/tests/qemu-iotests/204
+++ b/tests/qemu-iotests/204
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test corner cases with unusual block geometries
 #
diff --git a/tests/qemu-iotests/205 b/tests/qemu-iotests/205
index 43432cb599..c0e107328f 100755
--- a/tests/qemu-iotests/205
+++ b/tests/qemu-iotests/205
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Tests for qmp command nbd-server-remove.
 #
diff --git a/tests/qemu-iotests/206 b/tests/qemu-iotests/206
index d12d7cb566..c3cdad4ce4 100755
--- a/tests/qemu-iotests/206
+++ b/tests/qemu-iotests/206
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw
 #
 # Test qcow2 and file image creation
 #
diff --git a/tests/qemu-iotests/207 b/tests/qemu-iotests/207
index a6621410da..f9f3fd7131 100755
--- a/tests/qemu-iotests/207
+++ b/tests/qemu-iotests/207
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw
 #
 # Test ssh image creation
 #
diff --git a/tests/qemu-iotests/208 b/tests/qemu-iotests/208
index 54aa4be273..6117f165fa 100755
--- a/tests/qemu-iotests/208
+++ b/tests/qemu-iotests/208
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Copyright (C) 2018 Red Hat, Inc.
 #
diff --git a/tests/qemu-iotests/209 b/tests/qemu-iotests/209
index 8c804f4a30..ff7efea11b 100755
--- a/tests/qemu-iotests/209
+++ b/tests/qemu-iotests/209
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Tests for NBD BLOCK_STATUS extension
 #
diff --git a/tests/qemu-iotests/210 b/tests/qemu-iotests/210
index 7bf591f313..5a62ed4dd1 100755
--- a/tests/qemu-iotests/210
+++ b/tests/qemu-iotests/210
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw
 #
 # Test luks and file image creation
 #
diff --git a/tests/qemu-iotests/211 b/tests/qemu-iotests/211
index 4969edb00c..f52cadade1 100755
--- a/tests/qemu-iotests/211
+++ b/tests/qemu-iotests/211
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Test VDI and file image creation
 #
diff --git a/tests/qemu-iotests/212 b/tests/qemu-iotests/212
index 45d08842bb..d4af0c4ac8 100755
--- a/tests/qemu-iotests/212
+++ b/tests/qemu-iotests/212
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Test parallels and file image creation
 #
diff --git a/tests/qemu-iotests/213 b/tests/qemu-iotests/213
index cf638eb927..78d839ab64 100755
--- a/tests/qemu-iotests/213
+++ b/tests/qemu-iotests/213
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Test vhdx and file image creation
 #
diff --git a/tests/qemu-iotests/214 b/tests/qemu-iotests/214
index 75ae7a14b5..0889089d81 100755
--- a/tests/qemu-iotests/214
+++ b/tests/qemu-iotests/214
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto
 #
 # Test qcow2 image compression
 #
diff --git a/tests/qemu-iotests/215 b/tests/qemu-iotests/215
index f99bae78c7..d464596f14 100755
--- a/tests/qemu-iotests/215
+++ b/tests/qemu-iotests/215
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test case for copy-on-read into qcow2, using the COR filter driver
 #
diff --git a/tests/qemu-iotests/216 b/tests/qemu-iotests/216
index f93c61aad6..c02f8d2880 100755
--- a/tests/qemu-iotests/216
+++ b/tests/qemu-iotests/216
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Copy-on-read tests using a COR filter node
 #
diff --git a/tests/qemu-iotests/217 b/tests/qemu-iotests/217
index 7385342498..e693f326a3 100755
--- a/tests/qemu-iotests/217
+++ b/tests/qemu-iotests/217
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # I/O errors when working with internal qcow2 snapshots, and repairing
 # the result
diff --git a/tests/qemu-iotests/218 b/tests/qemu-iotests/218
index 5586870456..ae7c4fb187 100755
--- a/tests/qemu-iotests/218
+++ b/tests/qemu-iotests/218
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # This test covers what happens when a mirror block job is cancelled
 # in various phases of its existence.
diff --git a/tests/qemu-iotests/219 b/tests/qemu-iotests/219
index db272c5249..16c3ca7fff 100755
--- a/tests/qemu-iotests/219
+++ b/tests/qemu-iotests/219
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw
 #
 # Copyright (C) 2018 Red Hat, Inc.
 #
diff --git a/tests/qemu-iotests/220 b/tests/qemu-iotests/220
index 9ba3b3fdcb..7d08b9b040 100755
--- a/tests/qemu-iotests/220
+++ b/tests/qemu-iotests/220
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto
 #
 # max limits on compression in huge qcow2 files
 #
diff --git a/tests/qemu-iotests/221 b/tests/qemu-iotests/221
index 7e6086b205..c463fd4b11 100755
--- a/tests/qemu-iotests/221
+++ b/tests/qemu-iotests/221
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test qemu-img vs. unaligned images
 # (See also 253, which is the O_DIRECT version)
diff --git a/tests/qemu-iotests/222 b/tests/qemu-iotests/222
index 14d67c875b..b48afe623e 100755
--- a/tests/qemu-iotests/222
+++ b/tests/qemu-iotests/222
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # This test covers the basic fleecing workflow, which provides a
 # point-in-time snapshot of a node that can be queried over NBD.
diff --git a/tests/qemu-iotests/223 b/tests/qemu-iotests/223
index d68bc3cb6f..da87f2f4a2 100755
--- a/tests/qemu-iotests/223
+++ b/tests/qemu-iotests/223
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test reading dirty bitmap over NBD
 #
diff --git a/tests/qemu-iotests/224 b/tests/qemu-iotests/224
index 017b0685ba..38dd153625 100755
--- a/tests/qemu-iotests/224
+++ b/tests/qemu-iotests/224
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Test json:{} filenames with qemu-internal BDSs
 # (the one of commit, to be precise)
diff --git a/tests/qemu-iotests/225 b/tests/qemu-iotests/225
index 0186ec8156..c0053790db 100755
--- a/tests/qemu-iotests/225
+++ b/tests/qemu-iotests/225
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test vmdk backing file correlation
 #
diff --git a/tests/qemu-iotests/226 b/tests/qemu-iotests/226
index c1e1fb2b1c..6a9adb4a0b 100755
--- a/tests/qemu-iotests/226
+++ b/tests/qemu-iotests/226
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: auto quick
 #
 # This test covers expected filetypes for the file, host_cdrom and
 # host_device drivers.
diff --git a/tests/qemu-iotests/227 b/tests/qemu-iotests/227
index 637d7c3726..7e45a47ac6 100755
--- a/tests/qemu-iotests/227
+++ b/tests/qemu-iotests/227
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: quick
 #
 # Test query-blockstats with different ways to create a BB
 #
diff --git a/tests/qemu-iotests/228 b/tests/qemu-iotests/228
index 266fce6cda..a5eda2e149 100755
--- a/tests/qemu-iotests/228
+++ b/tests/qemu-iotests/228
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Test for when a backing file is considered overridden (thus, a
 # json:{} filename is generated for the overlay) and when it is not
diff --git a/tests/qemu-iotests/229 b/tests/qemu-iotests/229
index 273ac2472d..4bc99390b5 100755
--- a/tests/qemu-iotests/229
+++ b/tests/qemu-iotests/229
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: auto quick
 #
 # Test for force canceling a running blockjob that is paused in
 # an error state.
diff --git a/tests/qemu-iotests/231 b/tests/qemu-iotests/231
index c0b053ac30..0f66d0ca36 100755
--- a/tests/qemu-iotests/231
+++ b/tests/qemu-iotests/231
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: quick
 #
 # Test legacy and modern option parsing for rbd/ceph.  This will not
 # actually connect to a ceph server, but rather looks for the appropriate
diff --git a/tests/qemu-iotests/232 b/tests/qemu-iotests/232
index 685356ac3b..b30faaa218 100755
--- a/tests/qemu-iotests/232
+++ b/tests/qemu-iotests/232
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: quick
 #
 # Test for auto-read-only
 #
diff --git a/tests/qemu-iotests/233 b/tests/qemu-iotests/233
index a5c17c3963..7ce5764903 100755
--- a/tests/qemu-iotests/233
+++ b/tests/qemu-iotests/233
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: quick
 #
 # Test NBD TLS certificate / authorization integration
 #
diff --git a/tests/qemu-iotests/234 b/tests/qemu-iotests/234
index 73c899ddae..cb5f1753e0 100755
--- a/tests/qemu-iotests/234
+++ b/tests/qemu-iotests/234
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: quick migration
 #
 # Copyright (C) 2018 Red Hat, Inc.
 #
diff --git a/tests/qemu-iotests/235 b/tests/qemu-iotests/235
index d1b10ac36b..20d16dbf38 100755
--- a/tests/qemu-iotests/235
+++ b/tests/qemu-iotests/235
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: quick
 #
 # Simple mirror test
 #
diff --git a/tests/qemu-iotests/236 b/tests/qemu-iotests/236
index 6f5cee2444..f6c44517d6 100755
--- a/tests/qemu-iotests/236
+++ b/tests/qemu-iotests/236
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: quick
 #
 # Test bitmap merges.
 #
diff --git a/tests/qemu-iotests/237 b/tests/qemu-iotests/237
index 5b21ad3509..43dfd3bd40 100755
--- a/tests/qemu-iotests/237
+++ b/tests/qemu-iotests/237
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Test vmdk and file image creation
 #
diff --git a/tests/qemu-iotests/238 b/tests/qemu-iotests/238
index b8fcf15a1f..8a10af57f1 100755
--- a/tests/qemu-iotests/238
+++ b/tests/qemu-iotests/238
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: quick
 #
 # Regression test for throttle group member unregister segfault with iothread
 #
diff --git a/tests/qemu-iotests/239 b/tests/qemu-iotests/239
index b0991ffe59..4f0037148d 100755
--- a/tests/qemu-iotests/239
+++ b/tests/qemu-iotests/239
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test case for dmg
 #
diff --git a/tests/qemu-iotests/240 b/tests/qemu-iotests/240
index c0f71f0461..ab077f4ceb 100755
--- a/tests/qemu-iotests/240
+++ b/tests/qemu-iotests/240
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: quick
 
 # Test hot plugging and unplugging with iothreads
 #
diff --git a/tests/qemu-iotests/241 b/tests/qemu-iotests/241
index 8dae8d39e4..c962c8b607 100755
--- a/tests/qemu-iotests/241
+++ b/tests/qemu-iotests/241
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test qemu-nbd vs. unaligned images
 #
diff --git a/tests/qemu-iotests/242 b/tests/qemu-iotests/242
index a16de3085f..a9b27668c2 100755
--- a/tests/qemu-iotests/242
+++ b/tests/qemu-iotests/242
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Test for qcow2 bitmap printed information
 #
diff --git a/tests/qemu-iotests/243 b/tests/qemu-iotests/243
index 17388a4644..8bbb510120 100755
--- a/tests/qemu-iotests/243
+++ b/tests/qemu-iotests/243
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test qcow2 preallocation
 #
diff --git a/tests/qemu-iotests/244 b/tests/qemu-iotests/244
index f2b2dddf1c..a46b441627 100755
--- a/tests/qemu-iotests/244
+++ b/tests/qemu-iotests/244
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test qcow2 with external data files
 #
diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index e60c8326d3..86f00f290f 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw
 #
 # Test cases for the QMP 'x-blockdev-reopen' command
 #
diff --git a/tests/qemu-iotests/246 b/tests/qemu-iotests/246
index 58a479cc1f..fa3102c546 100755
--- a/tests/qemu-iotests/246
+++ b/tests/qemu-iotests/246
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Test persistent bitmap resizing.
 #
diff --git a/tests/qemu-iotests/247 b/tests/qemu-iotests/247
index 6cf2679750..ace6dba052 100755
--- a/tests/qemu-iotests/247
+++ b/tests/qemu-iotests/247
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test for auto-read-only with commit block job
 #
diff --git a/tests/qemu-iotests/248 b/tests/qemu-iotests/248
index 18ba03467e..4daaed1530 100755
--- a/tests/qemu-iotests/248
+++ b/tests/qemu-iotests/248
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Test resume mirror after auto pause on ENOSPC
 #
diff --git a/tests/qemu-iotests/249 b/tests/qemu-iotests/249
index 29453b8c90..28bffd4d57 100755
--- a/tests/qemu-iotests/249
+++ b/tests/qemu-iotests/249
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test that a backing image is put back in read-only mode after
 # block-commit (both when it fails and when it succeeds).
diff --git a/tests/qemu-iotests/250 b/tests/qemu-iotests/250
index 3df275c76b..f069ca1759 100755
--- a/tests/qemu-iotests/250
+++ b/tests/qemu-iotests/250
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test big discard in qcow2 shrink
 #
diff --git a/tests/qemu-iotests/251 b/tests/qemu-iotests/251
index 294773bdc1..8bdec37d32 100755
--- a/tests/qemu-iotests/251
+++ b/tests/qemu-iotests/251
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test qemu-img convert --salvage
 #
diff --git a/tests/qemu-iotests/252 b/tests/qemu-iotests/252
index 1d74afff99..2134b9993a 100755
--- a/tests/qemu-iotests/252
+++ b/tests/qemu-iotests/252
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto backing quick
 #
 # Tests for rebasing COW images that require zero cluster support
 #
diff --git a/tests/qemu-iotests/253 b/tests/qemu-iotests/253
index d88d5afa45..35039d20a8 100755
--- a/tests/qemu-iotests/253
+++ b/tests/qemu-iotests/253
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test qemu-img vs. unaligned images; O_DIRECT version
 # (Originates from 221)
diff --git a/tests/qemu-iotests/254 b/tests/qemu-iotests/254
index 150e58be8e..49da948407 100755
--- a/tests/qemu-iotests/254
+++ b/tests/qemu-iotests/254
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw backing quick
 #
 # Test external snapshot with bitmap copying and moving.
 #
diff --git a/tests/qemu-iotests/255 b/tests/qemu-iotests/255
index 8f08f741da..c43aa9c67a 100755
--- a/tests/qemu-iotests/255
+++ b/tests/qemu-iotests/255
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Test commit job graph modifications while requests are active
 #
diff --git a/tests/qemu-iotests/256 b/tests/qemu-iotests/256
index db8d6f31cf..8d82a1dd86 100755
--- a/tests/qemu-iotests/256
+++ b/tests/qemu-iotests/256
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw auto quick
 #
 # Test incremental/backup across iothread contexts
 #
diff --git a/tests/qemu-iotests/257 b/tests/qemu-iotests/257
index c80e06ae28..a2f4b5afe6 100755
--- a/tests/qemu-iotests/257
+++ b/tests/qemu-iotests/257
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw
 #
 # Test bitmap-sync backups (incremental, differential, and partials)
 #
diff --git a/tests/qemu-iotests/258 b/tests/qemu-iotests/258
index e305a1502f..9a2d33ae5e 100755
--- a/tests/qemu-iotests/258
+++ b/tests/qemu-iotests/258
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Very specific tests for adjacent commit/stream block jobs
 #
diff --git a/tests/qemu-iotests/259 b/tests/qemu-iotests/259
index 62e29af05f..76cde429c4 100755
--- a/tests/qemu-iotests/259
+++ b/tests/qemu-iotests/259
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test generic image creation fallback (by using NBD)
 #
diff --git a/tests/qemu-iotests/260 b/tests/qemu-iotests/260
index 804a7addb9..a35cb7b61f 100755
--- a/tests/qemu-iotests/260
+++ b/tests/qemu-iotests/260
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Tests for temporary external snapshot when we have bitmaps.
 #
diff --git a/tests/qemu-iotests/261 b/tests/qemu-iotests/261
index 847b4c6a37..d1c8037ab1 100755
--- a/tests/qemu-iotests/261
+++ b/tests/qemu-iotests/261
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # Test case for qcow2's handling of extra data in snapshot table entries
 # (and more generally, how certain cases of broken snapshot tables are
diff --git a/tests/qemu-iotests/262 b/tests/qemu-iotests/262
index 03af061f94..32d69988ef 100755
--- a/tests/qemu-iotests/262
+++ b/tests/qemu-iotests/262
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick migration
 #
 # Copyright (C) 2019 Red Hat, Inc.
 #
diff --git a/tests/qemu-iotests/263 b/tests/qemu-iotests/263
index f598a12899..ec09b41405 100755
--- a/tests/qemu-iotests/263
+++ b/tests/qemu-iotests/263
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test encrypted write that crosses cluster boundary of two unallocated clusters
 # Based on 188
diff --git a/tests/qemu-iotests/264 b/tests/qemu-iotests/264
index 666f164ed8..960f0449a4 100755
--- a/tests/qemu-iotests/264
+++ b/tests/qemu-iotests/264
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw
 #
 # Test nbd reconnect
 #
diff --git a/tests/qemu-iotests/265 b/tests/qemu-iotests/265
index 0e800fb524..4b3b52c6e6 100755
--- a/tests/qemu-iotests/265
+++ b/tests/qemu-iotests/265
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test reverse-ordered qcow2 writes on a sub-cluster level
 #
diff --git a/tests/qemu-iotests/266 b/tests/qemu-iotests/266
index 91bdf8729e..71ce81d0df 100755
--- a/tests/qemu-iotests/266
+++ b/tests/qemu-iotests/266
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Test VPC and file image creation
 #
diff --git a/tests/qemu-iotests/267 b/tests/qemu-iotests/267
index e44be49c77..2e2afdad9c 100755
--- a/tests/qemu-iotests/267
+++ b/tests/qemu-iotests/267
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick snapshot
 #
 # Test which nodes are involved in internal snapshots
 #
diff --git a/tests/qemu-iotests/268 b/tests/qemu-iotests/268
index ddf4312284..9a8a563760 100755
--- a/tests/qemu-iotests/268
+++ b/tests/qemu-iotests/268
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test write request with required alignment larger than the cluster size
 #
diff --git a/tests/qemu-iotests/270 b/tests/qemu-iotests/270
index 00339c0f78..74352342db 100755
--- a/tests/qemu-iotests/270
+++ b/tests/qemu-iotests/270
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw backing quick
 #
 # Test large write to a qcow2 image
 #
diff --git a/tests/qemu-iotests/271 b/tests/qemu-iotests/271
index e242b28b58..599b849cc6 100755
--- a/tests/qemu-iotests/271
+++ b/tests/qemu-iotests/271
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto
 #
 # Test qcow2 images with extended L2 entries
 #
diff --git a/tests/qemu-iotests/272 b/tests/qemu-iotests/272
index de475bf6f0..4bcf410d81 100755
--- a/tests/qemu-iotests/272
+++ b/tests/qemu-iotests/272
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # Test compressed write to a qcow2 image at an offset above 4 GB
 #
diff --git a/tests/qemu-iotests/273 b/tests/qemu-iotests/273
index 79b4ab4b05..6c33305b4d 100755
--- a/tests/qemu-iotests/273
+++ b/tests/qemu-iotests/273
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: backing quick
 #
 # Test multiple blockdev-snapshot calls with 'backing': null
 #
diff --git a/tests/qemu-iotests/274 b/tests/qemu-iotests/274
index 76b1ba6a52..caab008e07 100755
--- a/tests/qemu-iotests/274
+++ b/tests/qemu-iotests/274
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw backing
 #
 # Copyright (C) 2019 Red Hat, Inc.
 #
diff --git a/tests/qemu-iotests/277 b/tests/qemu-iotests/277
index a39ce2d873..24833e7eb6 100755
--- a/tests/qemu-iotests/277
+++ b/tests/qemu-iotests/277
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Test NBD client reconnection
 #
diff --git a/tests/qemu-iotests/279 b/tests/qemu-iotests/279
index 2a6315cf17..6afef78bc8 100755
--- a/tests/qemu-iotests/279
+++ b/tests/qemu-iotests/279
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw backing quick
 #
 # Test qemu-img --backing-chain --image-opts
 #
diff --git a/tests/qemu-iotests/280 b/tests/qemu-iotests/280
index f594bb9ed2..628f3c33ca 100755
--- a/tests/qemu-iotests/280
+++ b/tests/qemu-iotests/280
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw migration quick
 #
 # Copyright (C) 2019 Red Hat, Inc.
 #
diff --git a/tests/qemu-iotests/281 b/tests/qemu-iotests/281
index 0bf973bca6..956698083f 100755
--- a/tests/qemu-iotests/281
+++ b/tests/qemu-iotests/281
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Test cases for blockdev + IOThread interactions
 #
diff --git a/tests/qemu-iotests/282 b/tests/qemu-iotests/282
index 27da2a0023..3140445989 100755
--- a/tests/qemu-iotests/282
+++ b/tests/qemu-iotests/282
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw img quick
 #
 # Test qemu-img file cleanup for LUKS when using a non-UTF8 secret
 #
diff --git a/tests/qemu-iotests/283 b/tests/qemu-iotests/283
index 383797ed62..79643e375b 100755
--- a/tests/qemu-iotests/283
+++ b/tests/qemu-iotests/283
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: auto quick
 #
 # Test for backup-top filter permission activation failure
 #
diff --git a/tests/qemu-iotests/284 b/tests/qemu-iotests/284
index 9f6c29a79c..5a82639e7f 100755
--- a/tests/qemu-iotests/284
+++ b/tests/qemu-iotests/284
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # Test ref count checks on encrypted images
 #
diff --git a/tests/qemu-iotests/286 b/tests/qemu-iotests/286
index f64e0eccea..120a8375b7 100755
--- a/tests/qemu-iotests/286
+++ b/tests/qemu-iotests/286
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test qemu-img snapshot -l
 #
diff --git a/tests/qemu-iotests/287 b/tests/qemu-iotests/287
index 3bb383fd4b..22ce9ff0e4 100755
--- a/tests/qemu-iotests/287
+++ b/tests/qemu-iotests/287
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: auto quick
 #
 # Test case for an image using zstd compression
 #
diff --git a/tests/qemu-iotests/288 b/tests/qemu-iotests/288
index 6c62065aef..47aca6592a 100755
--- a/tests/qemu-iotests/288
+++ b/tests/qemu-iotests/288
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: quick
 #
 # qemu-img measure tests for LUKS images
 #
diff --git a/tests/qemu-iotests/289 b/tests/qemu-iotests/289
index fe69bde1eb..5dd6ec62db 100755
--- a/tests/qemu-iotests/289
+++ b/tests/qemu-iotests/289
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # qcow2 v3-exclusive error path testing
 # (026 tests paths common to v2 and v3)
diff --git a/tests/qemu-iotests/290 b/tests/qemu-iotests/290
index 35c38d4f80..ed80da2685 100755
--- a/tests/qemu-iotests/290
+++ b/tests/qemu-iotests/290
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test how 'qemu-io -c discard' behaves on v2 and v3 qcow2 images
 #
diff --git a/tests/qemu-iotests/291 b/tests/qemu-iotests/291
index bc70d5e389..20efb080a6 100755
--- a/tests/qemu-iotests/291
+++ b/tests/qemu-iotests/291
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test qemu-img bitmap handling
 #
diff --git a/tests/qemu-iotests/292 b/tests/qemu-iotests/292
index 3ae2772e3b..73cbb9364a 100755
--- a/tests/qemu-iotests/292
+++ b/tests/qemu-iotests/292
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test resizing a qcow2 image with a backing file
 #
diff --git a/tests/qemu-iotests/293 b/tests/qemu-iotests/293
index 3363bf07f0..37294487b1 100755
--- a/tests/qemu-iotests/293
+++ b/tests/qemu-iotests/293
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # Test encryption key management with luks
 # Based on 134
diff --git a/tests/qemu-iotests/294 b/tests/qemu-iotests/294
index 4c375ed609..9059eb26b3 100755
--- a/tests/qemu-iotests/294
+++ b/tests/qemu-iotests/294
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Copyright (C) 2019 Red Hat, Inc.
 #
diff --git a/tests/qemu-iotests/295 b/tests/qemu-iotests/295
index 59e674fa85..01a6c0b31f 100755
--- a/tests/qemu-iotests/295
+++ b/tests/qemu-iotests/295
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw
 #
 # Test case QMP's encrypted key management
 #
diff --git a/tests/qemu-iotests/296 b/tests/qemu-iotests/296
index fb7dec88aa..0bc3c6c7d7 100755
--- a/tests/qemu-iotests/296
+++ b/tests/qemu-iotests/296
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw
 #
 # Test case for encryption key management versus image sharing
 #
diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index 5c5420712b..85bc1c0c85 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: meta
 #
 # Copyright (C) 2020 Red Hat, Inc.
 #
diff --git a/tests/qemu-iotests/299 b/tests/qemu-iotests/299
index e129c7f7cb..a7122941fd 100755
--- a/tests/qemu-iotests/299
+++ b/tests/qemu-iotests/299
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: auto quick
 #
 # Test shutdown when bitmap is exported through NBD server
 #
diff --git a/tests/qemu-iotests/300 b/tests/qemu-iotests/300
index 5b75121b84..23aca59d9c 100755
--- a/tests/qemu-iotests/300
+++ b/tests/qemu-iotests/300
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: migration
 #
 # Copyright (C) 2020 Red Hat, Inc.
 #
diff --git a/tests/qemu-iotests/301 b/tests/qemu-iotests/301
index 3823e95617..9f943cadbe 100755
--- a/tests/qemu-iotests/301
+++ b/tests/qemu-iotests/301
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: backing quick
 #
 # Test qcow backing file warnings
 #
diff --git a/tests/qemu-iotests/302 b/tests/qemu-iotests/302
index a8506bda15..5695af4914 100755
--- a/tests/qemu-iotests/302
+++ b/tests/qemu-iotests/302
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: quick
 #
 # Tests converting qcow2 compressed to NBD
 #
diff --git a/tests/qemu-iotests/303 b/tests/qemu-iotests/303
index 11cd9eeb26..425544c064 100755
--- a/tests/qemu-iotests/303
+++ b/tests/qemu-iotests/303
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Test for dumping of qcow2 image metadata
 #
diff --git a/tests/qemu-iotests/304 b/tests/qemu-iotests/304
index aaf9e14617..198f282087 100755
--- a/tests/qemu-iotests/304
+++ b/tests/qemu-iotests/304
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Tests dirty-bitmap backup with unaligned bitmap granularity
 #
diff --git a/tests/qemu-iotests/305 b/tests/qemu-iotests/305
index 5a415eb2a4..8b26156923 100755
--- a/tests/qemu-iotests/305
+++ b/tests/qemu-iotests/305
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test the handling of errors in write requests with multiple allocations
 #
diff --git a/tests/qemu-iotests/307 b/tests/qemu-iotests/307
index de7c25fcfc..9008974346 100755
--- a/tests/qemu-iotests/307
+++ b/tests/qemu-iotests/307
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick export
 #
 # Copyright (C) 2020 Red Hat, Inc.
 #
diff --git a/tests/qemu-iotests/308 b/tests/qemu-iotests/308
index b30f4400f6..f122065d0f 100755
--- a/tests/qemu-iotests/308
+++ b/tests/qemu-iotests/308
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # Test FUSE exports (in ways that are not captured by the generic
 # tests)
diff --git a/tests/qemu-iotests/309 b/tests/qemu-iotests/309
index fb61157c2e..b90b279994 100755
--- a/tests/qemu-iotests/309
+++ b/tests/qemu-iotests/309
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test qemu-nbd -A
 #
diff --git a/tests/qemu-iotests/312 b/tests/qemu-iotests/312
index 41340494b0..4139745f0e 100755
--- a/tests/qemu-iotests/312
+++ b/tests/qemu-iotests/312
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test drive-mirror with quorum
 #
-- 
2.29.2


