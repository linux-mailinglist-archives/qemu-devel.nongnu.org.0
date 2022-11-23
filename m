Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 665E06362C8
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 16:06:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxrKI-00078i-I7; Wed, 23 Nov 2022 10:06:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oxrKF-00077r-57
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 10:06:11 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oxrKB-0002BQ-JE
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 10:06:10 -0500
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ANA3v5D028869; Wed, 23 Nov 2022 07:06:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=HvCs4sSg1pf9vcjzQpw6IPOLgTDy+FZbbeRshDepcTU=;
 b=ZYX47zWX61guKk8vglxwq07MSgqmdfVgcWCiuhTFWz98dEyXgfsE41ZRcoAEXtOC3HuM
 v9Wr90nTWbSs2E7WyGj969YIZ7XhfgqEh8f3LC3BH3JvpBZAoDK5E6anJ3z07TeEKZn1
 S007WoXwhWX+oh1v6eUFrM+FqoW2GrlAoSDrhxKtEVGLwdtmnvJ4ysNUwrtB6T7hdrX3
 Ao8zjuV13+kA53EuuKW5LDnr2wGFnj5cjDt4CH2F4OGCQy82xzAqLQCZNRoVyjZtDJiS
 i1gqA+ZPxrdEw6iUbcMpWHC2KML0yUtPa6/4w9lFtUf2/wzilBCCfcDH/cRVY1tIbNF6 Mw== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2048.outbound.protection.outlook.com [104.47.74.48])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3kxx4pjst2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Nov 2022 07:06:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NdQqNEsAF51Y/aKe6T318aTq4gp/wUMuCz339DCGF0x48Vil8SOWlyTLTX675zgDPellBZC4SdDYHJ7zk5Qw6eumwggoT64FHAIUhRVn1ZYf7qHNF/+BHpBkXfsa2dhNnReBvo1801iKKmf+AwLZuGZnWc6OxNGVO92CHlW1oocMlqWGJiFLzLfF0V1H5RufPBkZugZqQsMR4ntRjPn4z70g/IEWxTSOCmm4W1lcbHh6LHgXob59ZI+5C1a9JjGQETtJg8QPE4dYkWqUyzkyax+FqFfNlZ8i8HrLcOBiQJffK/pgwwNQ9ZcjbxYbSQYkFT8pRv4CKoWEbshPsqV5Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HvCs4sSg1pf9vcjzQpw6IPOLgTDy+FZbbeRshDepcTU=;
 b=KNzGi3iK0RB6WWQ+cAwegCEVbYcfNh1s+wsX29RvO4yj0SI7oUUgLOHH/N//gKSb7vXVjYbwp9pyEcdmWBfnn/r8Mnm2Wns9D2G93VBddD+W7T2Lt7vF79apScCkWnpTDig7bZeIpIbjQl3hK6AA+caNNNkwiCVq+As/xtAQJA6/2gRlbuXnJ0ZmL8b80LIq63XurC0Mb5UeL6tpZcbbbDditEU/f6Sos9EkSx3jhLoCkEag2z+tEFzb5a1bloX3WCoWrRMUtb0AGbCVW8BgdhRXLRFLFPUbB6EL2htZUv6RZHZDEv+6Kxi4Y/BqKiTV7HLwhIM5NGUw5b+uc/vcSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HvCs4sSg1pf9vcjzQpw6IPOLgTDy+FZbbeRshDepcTU=;
 b=FOrouE8lubzKm2utsrMoWIcsvrj2q6ePekO33WJT7FtLbdsPg8cWDPusV4irhLxWTyUzOM49FvrCOzX7puKKIxPVLemADmbHyXtlRV+cPkKVZ/alKv/9DtSkvuVeqaAJL+4WaPPWnRJjp2amXLjrrym7JF6gFZ8tEu8oiqOpwpyq7Verf2H6iBdw6ME48Uxj3HDkP4xRo6PZirA9vyMzBOU63RBvvhkB1wQouF0iiro46ItFR0tPKFhyadMRWDKkXvhxyUFHb9nuUmc7rOmvpKOfXBjk6SdMdkvlFHfEnNBuGripO2EqEQT3AF6bMy5GiFQlYRRFqcFpQoDF371TUg==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by BL3PR02MB7908.namprd02.prod.outlook.com (2603:10b6:208:353::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 15:06:04 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66%3]) with mapi id 15.20.5857.017; Wed, 23 Nov 2022
 15:06:04 +0000
From: "manish.mishra" <manish.mishra@nutanix.com>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, peterx@redhat.com, prerna.saxena@nutanix.com,
 quintela@redhat.com, dgilbert@redhat.com, lsoaresp@redhat.com,
 "manish.mishra" <manish.mishra@nutanix.com>
Subject: [PATCH v4 1/2] io: Add support for MSG_PEEK for socket channel
Date: Wed, 23 Nov 2022 15:05:26 +0000
Message-Id: <20221123150527.24608-2-manish.mishra@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20221123150527.24608-1-manish.mishra@nutanix.com>
References: <20221123150527.24608-1-manish.mishra@nutanix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0026.namprd08.prod.outlook.com
 (2603:10b6:a03:100::39) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|BL3PR02MB7908:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ab9510c-9ae0-4332-ee94-08dacd643d80
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ly/buXYEyzJENowqr/brJsyi5CHBA9xtvlufk2GOd1ZZrLpjieOFn6uhQ65kBxmyxiOYKkWsYz7iwy6DU4JOHW4pqVporM/I2H5BzeFoBDOZHvAQjlawqz8cKeCiWZGVKQJMRWm3p62Ww+0goTPlwsKaaW6r45cCBzlz/0J20WrhPxjIERXBH8OVfM7pz8PkjE+8qnBSGjGJiPnTCtjL1vCbv8ausgrxr5rfC7Mc6M8GzCBSUbpubOkbSzy7SsXp4mZkdtz8QZ4vErgCpy61v82g7pkhakhJfHtoXXWBXyV+Rq0W5IUsB14GCcJz9KthuYuNp6culc3EcAys4tpJKFuYqpoA6M4dg+lAezqF8SB9Y3vRqlYfk8CRNRsSL9SnUkZJ/VlKtbxRQc26TXLKWGu9tA5GMbJIiPkCbUdc3+cack31Y21S9HQjCAJ2LTbrg9qDzEEa2r2GOlwi6kHjNlnk/VkhgDUtL8XNsxqrB4mwralpOtPiZ912yXbC3qpaQt991FD7+uj85ThCUDnailMajcq2ZhGyoRXuhgkKo9g8lskzqcPsyqmuxOo/Fm5qQ2fhal44fvzo1Gix/Nz4pKH9h5tekDWjBCP1BzNYHGsQsrZKOFAWXuWmNCfQ+e148Kjgmgu19KWNej3cEGxeyQu+Z1CKbWn85gDTha0pbqmYJIuXoFIxrifzik5CT6S52lMHcnNulr2Zbyt8zx19zw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(39860400002)(376002)(346002)(366004)(396003)(451199015)(36756003)(86362001)(6506007)(52116002)(38100700002)(38350700002)(30864003)(66556008)(2906002)(83380400001)(8676002)(41300700001)(1076003)(8936002)(316002)(6666004)(26005)(186003)(107886003)(5660300002)(66946007)(6512007)(6486002)(66476007)(478600001)(4326008)(6916009)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWVxZUMvVXZOWS9MTUdGRVU2MjNzT0tmRzduazlNZ28ybTZmQ1oxNHJORFl1?=
 =?utf-8?B?TUkvU2hkNmF3NDEzTElPb0lNQ2RkckVrR1ZYanBTTWRsV0xXR1NKakxDeVR5?=
 =?utf-8?B?bXZ4LzRja2dZUGltSzIwaTlWQU5SZ3ZKYmFyZk8ydExYd1hRQ2JPUXB4a2ZT?=
 =?utf-8?B?SWVjeVdTbVlvTEVYL3B2Rys4bit1eldneURNQzVaUEwwdGYzK3pZYjdvYkZT?=
 =?utf-8?B?ZlhTcGx4RVNyRk1uMUxZMUhTOVFtQTVYeG12TmRsUXpSSkNXTW1reUVqTlF1?=
 =?utf-8?B?U2dwSzhNQklMZE1XQy9Ud0VONDUxc2YwblVDV2h3Y0dBYmxsMytiUVB4WjRi?=
 =?utf-8?B?bUh2WUF4MUwxUkp5anpGa3p1V0t4MEc3WTlCSEEyU2lRcFVsRkZXL3VwamdP?=
 =?utf-8?B?ZDk3d3hOblU1cmI4QXBUOEFncVpwMGhxcFBYVmN4RjNic2Yvb25HZzNpOGY1?=
 =?utf-8?B?RHJIWk92UERWSjQ0dnZXM0dVRXlWVCt5bHdNVnEzcXhCMEZ5dkJFZmtEN0Zh?=
 =?utf-8?B?YnRTOVZoT29FeWU3SDdGcVMvY1R6VnZybjd3KzErOXRFbVRleTdQcEQ5VXpr?=
 =?utf-8?B?VG9UbWMrZmgvdmVvbTZVbGl0WmxzMWFNMmROZlFFV1VkMG92VDlGcys4SEdM?=
 =?utf-8?B?dkZlN2pQcWFzY1liRU9LajZ6LzBGTzNUdCtpeUF5M0pXay9aakZ0VkY1T3Ev?=
 =?utf-8?B?Vk93c29vWHZzbmRhb0xTZTJyQzlPU2p5OVN5Rk9KR3F3Wk5jQ0dkTFU5QnBv?=
 =?utf-8?B?TFp5M0d1V2ZGUlhrS2Q1R29iZ0dEVkdiVVBkRWFSWDhEeGVsQThUWDhKY1ls?=
 =?utf-8?B?NEtPb3g2ajF6MVlCT2l4UHRySmZRTTEranE1dXF3ZEZOdlhBTTdSUy9IWVhH?=
 =?utf-8?B?ZENHenBQUVY3SndWU1Zua2w1VFBGcEJZTHRXSDRlbCt0RVA3Y0V0RnA3VS9F?=
 =?utf-8?B?eTF5SGhxOFl6dE8rK3lpaXRvWWZ2RXZtd01sbFh5elV1aS9CUW4xT2dCNnI3?=
 =?utf-8?B?QUVCZHV4OGxIdEU4VFRzVkRWbTlSOTM5WWZ2aEpMMmFjdmw3UVRsR2R4d1o1?=
 =?utf-8?B?VEdoRWU1bEVKQWpkbDd0MXJzRzdFY1BVdzlTRmlZNEpKd2pac1JWWDFic0po?=
 =?utf-8?B?QUhrc296MlJzYTNSRVFCcnAwSzhpNTU5aEs4N0ZwS0FIZHpIcmgzc1NUMm9L?=
 =?utf-8?B?YVZIL0M2ZWt0VVZ0UmRxcDgvVzhRZExyaCtIUVdyUS9mZmI5WmxPUktrMGda?=
 =?utf-8?B?VWdtemJ6aldsbEJzdnVXSHV5bVZVV0RnL3FmLzBuZG1ETGZFWUJHWmw5d29J?=
 =?utf-8?B?bUF4azJIV3I1THMybVh5c3pLQ0JNOXB6cXN3R0xZM2tmS1RnRk9sSEpVbXMv?=
 =?utf-8?B?dkVROCt2Vy8rdFFmNWhUWkMvSWdkdnR2MWpuZFpidSs3bjVGM2dtalJmd0pm?=
 =?utf-8?B?K1lrOEU3ejhCbEZMbnR4Ynk4UjRoMDJnZWw2YVBndTF5ZVFwTXdaUnE5Ymt6?=
 =?utf-8?B?TVJTMGhiLytFZHdJdzd0OGdxd3ZqeVVzY2tEcDFIMldFZjNZYnJIZW03bC94?=
 =?utf-8?B?SXR2WGFvWEpDU2ZsbEV2aW9uYmRXN1lJMXV0dkdXUjBxaTM0N2hOMmt0OU5V?=
 =?utf-8?B?dWJLaUhObW1jU2lvUmtLcmpHdnMwVmpxb3JwYldXSndTWS9pdCtNN1JVZmRE?=
 =?utf-8?B?QjBONmZ1ZCtERTFJY3U4MWgvUWc0eU9UaUM0NHl6MTlNUmlRRmZIcjNBWDNo?=
 =?utf-8?B?RTk4NlNHaVptYXVPanNoemFrRm9PQUVZVXBaTUF6cEdNZW1RejhOTnhzZjI3?=
 =?utf-8?B?ZCtydFdEbzZXN0N6SmsxQmtPMlY2MlJBWmlkV1JvYk9mdW03cDUwaEVsenJk?=
 =?utf-8?B?VHE4RTBmUVR4NTJRR3J4SGNkQThGaEM4OUZqY2tlb3RXbE9GVVIwN0NtUWFT?=
 =?utf-8?B?ZHpvWk5sR0hBejU2UDZNYkZ0aUl1WFMydW9aZFQ4UEpNTWlkazVnZ1FnUmlP?=
 =?utf-8?B?bmNtcTFSUEZxcEJKWEF5Tk1CZ0FsbDZLOExOY1k1RUhSTmhoRDlpanNqTGxq?=
 =?utf-8?B?RWlYWURKWlM4SjRaMlFvYURwbG40Q0cwb2NCdGtqNFN6VFY5NVNmaDRRVGti?=
 =?utf-8?B?azVyTStpRWFzbWl6NmQ4S3poRDdjVC9xeGU3L0pFVStsNkhoTWNXOFZPMUxu?=
 =?utf-8?B?NlE9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ab9510c-9ae0-4332-ee94-08dacd643d80
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 15:06:04.0504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rr8C6cPJltO3QWbjeqPImPDkYNhlLTH0NyKq9ubUAtWA2pGGVaP0p4fknxhHs0bjYCTwZfOd9oSS7zW8OaHYlahKuDeChfoUBRi4wueQkJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB7908
X-Proofpoint-ORIG-GUID: 7t6b9PrPlsstcSdmS4rilbvGBT52WYc5
X-Proofpoint-GUID: 7t6b9PrPlsstcSdmS4rilbvGBT52WYc5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-23_08,2022-11-23_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=manish.mishra@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

MSG_PEEK reads from the peek of channel, The data is treated as
unread and the next read shall still return this data. This
support is currently added only for socket class. Extra parameter
'flags' is added to io_readv calls to pass extra read flags like
MSG_PEEK.

Suggested-by: Daniel P. Berrangé <berrange@redhat.com
Signed-off-by: manish.mishra <manish.mishra@nutanix.com>
---
 chardev/char-socket.c               |  4 ++--
 include/io/channel.h                |  6 ++++++
 io/channel-buffer.c                 |  1 +
 io/channel-command.c                |  1 +
 io/channel-file.c                   |  1 +
 io/channel-null.c                   |  1 +
 io/channel-socket.c                 | 17 ++++++++++++++++-
 io/channel-tls.c                    |  1 +
 io/channel-websock.c                |  1 +
 io/channel.c                        | 16 ++++++++++++----
 migration/channel-block.c           |  1 +
 scsi/qemu-pr-helper.c               |  2 +-
 tests/qtest/tpm-emu.c               |  2 +-
 tests/unit/test-io-channel-socket.c |  1 +
 util/vhost-user-server.c            |  2 +-
 15 files changed, 47 insertions(+), 10 deletions(-)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 879564aa8a..5afce9a464 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -283,11 +283,11 @@ static ssize_t tcp_chr_recv(Chardev *chr, char *buf, size_t len)
     if (qio_channel_has_feature(s->ioc, QIO_CHANNEL_FEATURE_FD_PASS)) {
         ret = qio_channel_readv_full(s->ioc, &iov, 1,
                                      &msgfds, &msgfds_num,
-                                     NULL);
+                                     0, NULL);
     } else {
         ret = qio_channel_readv_full(s->ioc, &iov, 1,
                                      NULL, NULL,
-                                     NULL);
+                                     0, NULL);
     }
 
     if (msgfds_num) {
diff --git a/include/io/channel.h b/include/io/channel.h
index c680ee7480..716235d496 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -34,6 +34,8 @@ OBJECT_DECLARE_TYPE(QIOChannel, QIOChannelClass,
 
 #define QIO_CHANNEL_WRITE_FLAG_ZERO_COPY 0x1
 
+#define QIO_CHANNEL_READ_FLAG_MSG_PEEK 0x1
+
 typedef enum QIOChannelFeature QIOChannelFeature;
 
 enum QIOChannelFeature {
@@ -41,6 +43,7 @@ enum QIOChannelFeature {
     QIO_CHANNEL_FEATURE_SHUTDOWN,
     QIO_CHANNEL_FEATURE_LISTEN,
     QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY,
+    QIO_CHANNEL_FEATURE_READ_MSG_PEEK,
 };
 
 
@@ -114,6 +117,7 @@ struct QIOChannelClass {
                         size_t niov,
                         int **fds,
                         size_t *nfds,
+                        int flags,
                         Error **errp);
     int (*io_close)(QIOChannel *ioc,
                     Error **errp);
@@ -188,6 +192,7 @@ void qio_channel_set_name(QIOChannel *ioc,
  * @niov: the length of the @iov array
  * @fds: pointer to an array that will received file handles
  * @nfds: pointer filled with number of elements in @fds on return
+ * @flags: read flags (QIO_CHANNEL_READ_FLAG_*)
  * @errp: pointer to a NULL-initialized error object
  *
  * Read data from the IO channel, storing it in the
@@ -224,6 +229,7 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
                                size_t niov,
                                int **fds,
                                size_t *nfds,
+                               int flags,
                                Error **errp);
 
 
diff --git a/io/channel-buffer.c b/io/channel-buffer.c
index bf52011be2..8096180f85 100644
--- a/io/channel-buffer.c
+++ b/io/channel-buffer.c
@@ -54,6 +54,7 @@ static ssize_t qio_channel_buffer_readv(QIOChannel *ioc,
                                         size_t niov,
                                         int **fds,
                                         size_t *nfds,
+                                        int flags,
                                         Error **errp)
 {
     QIOChannelBuffer *bioc = QIO_CHANNEL_BUFFER(ioc);
diff --git a/io/channel-command.c b/io/channel-command.c
index 74516252ba..e7edd091af 100644
--- a/io/channel-command.c
+++ b/io/channel-command.c
@@ -203,6 +203,7 @@ static ssize_t qio_channel_command_readv(QIOChannel *ioc,
                                          size_t niov,
                                          int **fds,
                                          size_t *nfds,
+                                         int flags,
                                          Error **errp)
 {
     QIOChannelCommand *cioc = QIO_CHANNEL_COMMAND(ioc);
diff --git a/io/channel-file.c b/io/channel-file.c
index b67687c2aa..d76663e6ae 100644
--- a/io/channel-file.c
+++ b/io/channel-file.c
@@ -86,6 +86,7 @@ static ssize_t qio_channel_file_readv(QIOChannel *ioc,
                                       size_t niov,
                                       int **fds,
                                       size_t *nfds,
+                                      int flags,
                                       Error **errp)
 {
     QIOChannelFile *fioc = QIO_CHANNEL_FILE(ioc);
diff --git a/io/channel-null.c b/io/channel-null.c
index 75e3781507..4fafdb770d 100644
--- a/io/channel-null.c
+++ b/io/channel-null.c
@@ -60,6 +60,7 @@ qio_channel_null_readv(QIOChannel *ioc,
                        size_t niov,
                        int **fds G_GNUC_UNUSED,
                        size_t *nfds G_GNUC_UNUSED,
+                       int flags,
                        Error **errp)
 {
     QIOChannelNull *nioc = QIO_CHANNEL_NULL(ioc);
diff --git a/io/channel-socket.c b/io/channel-socket.c
index b76dca9cc1..dfb8cb6c40 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -173,6 +173,8 @@ int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
     }
 #endif
 
+    qio_channel_set_feature(QIO_CHANNEL(ioc), QIO_CHANNEL_FEATURE_READ_MSG_PEEK);
+
     return 0;
 }
 
@@ -406,6 +408,8 @@ qio_channel_socket_accept(QIOChannelSocket *ioc,
     }
 #endif /* WIN32 */
 
+    qio_channel_set_feature(QIO_CHANNEL(cioc), QIO_CHANNEL_FEATURE_READ_MSG_PEEK);
+
     trace_qio_channel_socket_accept_complete(ioc, cioc, cioc->fd);
     return cioc;
 
@@ -496,6 +500,7 @@ static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
                                         size_t niov,
                                         int **fds,
                                         size_t *nfds,
+                                        int flags,
                                         Error **errp)
 {
     QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
@@ -517,6 +522,10 @@ static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
 
     }
 
+    if (flags & QIO_CHANNEL_READ_FLAG_MSG_PEEK) {
+        sflags |= MSG_PEEK;
+    }
+
  retry:
     ret = recvmsg(sioc->fd, &msg, sflags);
     if (ret < 0) {
@@ -624,11 +633,17 @@ static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
                                         size_t niov,
                                         int **fds,
                                         size_t *nfds,
+                                        int flags,
                                         Error **errp)
 {
     QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
     ssize_t done = 0;
     ssize_t i;
+    int sflags = 0;
+
+    if (flags & QIO_CHANNEL_READ_FLAG_MSG_PEEK) {
+        sflags |= MSG_PEEK;
+    }
 
     for (i = 0; i < niov; i++) {
         ssize_t ret;
@@ -636,7 +651,7 @@ static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
         ret = recv(sioc->fd,
                    iov[i].iov_base,
                    iov[i].iov_len,
-                   0);
+                   sflags);
         if (ret < 0) {
             if (errno == EAGAIN) {
                 if (done) {
diff --git a/io/channel-tls.c b/io/channel-tls.c
index 4ce890a538..c730cb8ec5 100644
--- a/io/channel-tls.c
+++ b/io/channel-tls.c
@@ -260,6 +260,7 @@ static ssize_t qio_channel_tls_readv(QIOChannel *ioc,
                                      size_t niov,
                                      int **fds,
                                      size_t *nfds,
+                                     int flags,
                                      Error **errp)
 {
     QIOChannelTLS *tioc = QIO_CHANNEL_TLS(ioc);
diff --git a/io/channel-websock.c b/io/channel-websock.c
index fb4932ade7..a12acc27cf 100644
--- a/io/channel-websock.c
+++ b/io/channel-websock.c
@@ -1081,6 +1081,7 @@ static ssize_t qio_channel_websock_readv(QIOChannel *ioc,
                                          size_t niov,
                                          int **fds,
                                          size_t *nfds,
+                                         int flags,
                                          Error **errp)
 {
     QIOChannelWebsock *wioc = QIO_CHANNEL_WEBSOCK(ioc);
diff --git a/io/channel.c b/io/channel.c
index 0640941ac5..a8c7f11649 100644
--- a/io/channel.c
+++ b/io/channel.c
@@ -52,6 +52,7 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
                                size_t niov,
                                int **fds,
                                size_t *nfds,
+                               int flags,
                                Error **errp)
 {
     QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
@@ -63,7 +64,14 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
         return -1;
     }
 
-    return klass->io_readv(ioc, iov, niov, fds, nfds, errp);
+    if ((flags & QIO_CHANNEL_READ_FLAG_MSG_PEEK) &&
+        !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_READ_MSG_PEEK)) {
+        error_setg_errno(errp, EINVAL,
+                         "Channel does not support peek read");
+        return -1;
+    }
+
+    return klass->io_readv(ioc, iov, niov, fds, nfds, flags, errp);
 }
 
 
@@ -146,7 +154,7 @@ int qio_channel_readv_full_all_eof(QIOChannel *ioc,
     while ((nlocal_iov > 0) || local_fds) {
         ssize_t len;
         len = qio_channel_readv_full(ioc, local_iov, nlocal_iov, local_fds,
-                                     local_nfds, errp);
+                                     local_nfds, 0, errp);
         if (len == QIO_CHANNEL_ERR_BLOCK) {
             if (qemu_in_coroutine()) {
                 qio_channel_yield(ioc, G_IO_IN);
@@ -284,7 +292,7 @@ ssize_t qio_channel_readv(QIOChannel *ioc,
                           size_t niov,
                           Error **errp)
 {
-    return qio_channel_readv_full(ioc, iov, niov, NULL, NULL, errp);
+    return qio_channel_readv_full(ioc, iov, niov, NULL, NULL, 0, errp);
 }
 
 
@@ -303,7 +311,7 @@ ssize_t qio_channel_read(QIOChannel *ioc,
                          Error **errp)
 {
     struct iovec iov = { .iov_base = buf, .iov_len = buflen };
-    return qio_channel_readv_full(ioc, &iov, 1, NULL, NULL, errp);
+    return qio_channel_readv_full(ioc, &iov, 1, NULL, NULL, 0, errp);
 }
 
 
diff --git a/migration/channel-block.c b/migration/channel-block.c
index f4ab53acdb..b7374363c3 100644
--- a/migration/channel-block.c
+++ b/migration/channel-block.c
@@ -53,6 +53,7 @@ qio_channel_block_readv(QIOChannel *ioc,
                         size_t niov,
                         int **fds,
                         size_t *nfds,
+                        int flags,
                         Error **errp)
 {
     QIOChannelBlock *bioc = QIO_CHANNEL_BLOCK(ioc);
diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c
index 196b78c00d..199227a556 100644
--- a/scsi/qemu-pr-helper.c
+++ b/scsi/qemu-pr-helper.c
@@ -614,7 +614,7 @@ static int coroutine_fn prh_read(PRHelperClient *client, void *buf, int sz,
         iov.iov_base = buf;
         iov.iov_len = sz;
         n_read = qio_channel_readv_full(QIO_CHANNEL(client->ioc), &iov, 1,
-                                        &fds, &nfds, errp);
+                                        &fds, &nfds, 0, errp);
 
         if (n_read == QIO_CHANNEL_ERR_BLOCK) {
             qio_channel_yield(QIO_CHANNEL(client->ioc), G_IO_IN);
diff --git a/tests/qtest/tpm-emu.c b/tests/qtest/tpm-emu.c
index 2994d1cf42..3cf1acaf7d 100644
--- a/tests/qtest/tpm-emu.c
+++ b/tests/qtest/tpm-emu.c
@@ -106,7 +106,7 @@ void *tpm_emu_ctrl_thread(void *data)
         int *pfd = NULL;
         size_t nfd = 0;
 
-        qio_channel_readv_full(ioc, &iov, 1, &pfd, &nfd, &error_abort);
+        qio_channel_readv_full(ioc, &iov, 1, &pfd, &nfd, 0, &error_abort);
         cmd = be32_to_cpu(cmd);
         g_assert_cmpint(cmd, ==, CMD_SET_DATAFD);
         g_assert_cmpint(nfd, ==, 1);
diff --git a/tests/unit/test-io-channel-socket.c b/tests/unit/test-io-channel-socket.c
index b36a5d972a..b964bb202d 100644
--- a/tests/unit/test-io-channel-socket.c
+++ b/tests/unit/test-io-channel-socket.c
@@ -460,6 +460,7 @@ static void test_io_channel_unix_fd_pass(void)
                            G_N_ELEMENTS(iorecv),
                            &fdrecv,
                            &nfdrecv,
+                           0,
                            &error_abort);
 
     g_assert(nfdrecv == G_N_ELEMENTS(fdsend));
diff --git a/util/vhost-user-server.c b/util/vhost-user-server.c
index 232984ace6..145eb17c08 100644
--- a/util/vhost-user-server.c
+++ b/util/vhost-user-server.c
@@ -116,7 +116,7 @@ vu_message_read(VuDev *vu_dev, int conn_fd, VhostUserMsg *vmsg)
          * qio_channel_readv_full may have short reads, keeping calling it
          * until getting VHOST_USER_HDR_SIZE or 0 bytes in total
          */
-        rc = qio_channel_readv_full(ioc, &iov, 1, &fds, &nfds, &local_err);
+        rc = qio_channel_readv_full(ioc, &iov, 1, &fds, &nfds, 0, &local_err);
         if (rc < 0) {
             if (rc == QIO_CHANNEL_ERR_BLOCK) {
                 assert(local_err == NULL);
-- 
2.22.3


