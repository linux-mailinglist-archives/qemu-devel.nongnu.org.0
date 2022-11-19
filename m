Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83918630DD9
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Nov 2022 10:38:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owKHn-0000SS-8I; Sat, 19 Nov 2022 04:37:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1owKHX-0000HL-Uk
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 04:37:10 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1owKHV-0007Bb-Bp
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 04:37:03 -0500
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AJ4aY7S018323; Sat, 19 Nov 2022 01:36:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=xo4whEmOJJBUUfO2hyQGNq0jBWJWtbRZanzlEXknIiU=;
 b=zZq5TxG7cjplUFiMG0gQ79eGtffpTprAJKzaZcB7PTVPnwML3IK5GQKJg+9xj17+lvZP
 bVQmGL+AemXpcsI6KNb84fVX46XuQIiPsd4QdybZG+GR4n59RhtGIdeygqtirPoFs8fw
 4SJ8ziI2Qi3X6amXLx2J0cbdn4S/d+BcWrx8O5KxbLUWZAjl8583TCZ0Hc9Bnt05hX9f
 GPa48QKaXDUjyqLNCizkCih6TtuUYdI/Kr0YumeaVuneIKLmmGjSevAOncvmh7UDZDjr
 cIjHdUT+Qn/gHm/YJ5xVz0nuoNSyc8AN0bW4BALCrK6qztrpplSjuk1Gvl6S9L0A0psS og== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3kxr908c9m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Nov 2022 01:36:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q16xd2TC+3U1wNthRKO6Q3zOI/iREhcrLD5FACClF4ITr4mI2Ou3F3rGLiNesqlmrwxzoS0KoajCz+zlIlSRhdhpo4Bq6dVDbczx5Um5H/y5ZrSi2Luu82GJvY83/wRgk4cKUiY1o2E9qSSItAjwlNtYC3QJeAVXxjLzCmKyg6OF7I9paTSI2A5zCPu6Pf6PN1XEcv/dJAYP5ZXZ5uQMMj6MmIqVMxX2BsgocAos8Qd78tsDvBX55DBmkHtgnCt1V833jwEEy0YrkaLp7BG8pNQ3SUF/e5z/LWClHlF/WhlaFa08xWmLyIvqTmwnIaIFMEKzh6rmJHnjo2pEFqHjNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xo4whEmOJJBUUfO2hyQGNq0jBWJWtbRZanzlEXknIiU=;
 b=Y05eK178/zoEWowPvz/IE8RGXT+yLpRZImjUZ//T8teatjqIADXkunlCmpa7eiKbcCeeVIKT+MJAL4GksfuF1XQ/cKrW5ErqfkdlotGpikjQe4fVFsYvIZIxersLapkIhuxv4XXKJym7qawYs+LiZ9m/ME3pw4VkF4MPmlwy6Tyw20fQbvXqTzD1WtnLAGWrHdV6bqvUdeY6U++3+3QJsoOTBVyFpXN+8E4A43xdIQmALp5GjyRjh2PeVaJKfTN5tzIDF4jz6MxKRx61bXqj4UapR3CALSjsmGgVwcGQuL8Etk/BtYI7QWY+Aj/dxbm+538QCXGgY7u54wRumu6idg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xo4whEmOJJBUUfO2hyQGNq0jBWJWtbRZanzlEXknIiU=;
 b=JrAbIIqP67e15rVpOBQ3e9d79Sson8WYehshO1jpsrVlVVolD8r707/RrQrKlwgrQVYdHSdWlSStFQgCh3+OW4Fn6OzSEkERlyk0RIr8gYf4fQJ4e0iJ71MPI6gOAAVl5G4MFq7OumFucd9r+e0xO6zVcw6vEHp6sIp1yByXPDh4ko2tVvbFFndXapb63jacN9VrZh69t5odJV5jn5Hy5NGqg4KlZm2unpcUa7G9lOrZTfWS7cQ8cUjrUmicd9OhVgc+nIdc/W5+TupNopQ9ktd2aYxkhVcCSHflwfwjf10K+Cx6xP3hJlRt+MUNMEGeJxbe8tXw37mdziy1GvEjDQ==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by PH0PR02MB7479.namprd02.prod.outlook.com (2603:10b6:510:a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Sat, 19 Nov
 2022 09:36:56 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66%3]) with mapi id 15.20.5834.009; Sat, 19 Nov 2022
 09:36:56 +0000
From: "manish.mishra" <manish.mishra@nutanix.com>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, peterx@redhat.com, prerna.saxena@nutanix.com,
 quintela@redhat.com, dgilbert@redhat.com, lsoaresp@redhat.com,
 "manish.mishra" <manish.mishra@nutanix.com>
Subject: [PATCH v3 1/2] io: Add support for MSG_PEEK for socket channel
Date: Sat, 19 Nov 2022 09:36:14 +0000
Message-Id: <20221119093615.158072-4-manish.mishra@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20221119093615.158072-1-manish.mishra@nutanix.com>
References: <20221119093615.158072-1-manish.mishra@nutanix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0058.prod.exchangelabs.com (2603:10b6:a03:94::35)
 To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|PH0PR02MB7479:EE_
X-MS-Office365-Filtering-Correlation-Id: e96ceeb4-558d-476f-a3f8-08daca119944
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WZ+IAAWrhDSkySwpKu/mquLdW/DcmRuEokWqa8SObYKNIHvXMkpgxRPGUkeZvBC4RQ+yyKD0Ur+H+obG4ok6gSr1jBWUs1XdHCK9uK9G2RzSKw7jDyos1xNpRNm0clfyp/yWzhBQj8ChEHmgit254CeQxQHaIxcpVhWUw+M0bhCjfNRhCTCjnGodPdneEoDRHhUr71XSg5RYLQTGenwr+AbTXgFmz5DOvB4at3v/QS+un2IuI+BiGD8MmaKWiJjXE4X53UDumcU8ZgApZLKh1R/UGRw0uU0y0pYbQgtW/gCmJcBbtIQkpNhxhk/F9/duOnB6jt0HDQTAoZvUlpbjajTd4pnZL6ZsYz4pgwT7XpKWJLeETPM7UryovloMcQFzm1NP6n5t9WTbtYIqp+d9+gua4aSXji2hMwSTPJEOO2lwFFcFcLnP/ZVze8gBz+c55RqNHadd+9HaHyjzIrcMrTi+VT64v2QSIvG809vjwBSTDsp0svXjabaGg1KXUiNRJS1ye3G3uWIOpmEMhQmtvBNaewmJHUl/zcpgIbjAubRa90wuTCbn2ymW1+a99Jfy/EQgUvxP42Qa/PMvh+0rs2B97mgPw7YQDV+zW++NL7ad1b5r8kju/NIi+0JD27U50g37NQ2PNavXfkt4x/y5bqNjTcB0quirAGbS9lHryUM2pUAynXEV9fnH7UyWRfk1at1eQbpxW1GzZoTQlN08/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(366004)(346002)(136003)(376002)(451199015)(478600001)(6512007)(6506007)(6666004)(6486002)(52116002)(107886003)(86362001)(316002)(6916009)(38350700002)(38100700002)(66476007)(66556008)(66946007)(4326008)(8676002)(36756003)(26005)(2906002)(30864003)(41300700001)(83380400001)(186003)(8936002)(1076003)(5660300002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THkrd0Exam1rRHBHZHB5Z3ZJdHltdzJCVzJxeTRBYUcvYWdLTlVUQmxydjlo?=
 =?utf-8?B?VFByM1pkc1UzcllkZGdUdnN3bW5FSzgwbk50MjQxQzN3SVM4L2swRWN0M2NE?=
 =?utf-8?B?aUpRVW9TUFhvL1BqVXRrZU9iWTU1NU14ejk2WDB4cjc0RU5QTXYrMmlTRHdD?=
 =?utf-8?B?NkZ4MkVTN3QrQlIrSll3WWNLWFlKclJxR0FLSXphZlF2Q3U5RE12clhPMFhk?=
 =?utf-8?B?cnRPZ2VaRjRaRlhoNFdSOHBHbFRJZW1xcmhUQnJNRXRRK2ZXTHBvSGw5NGZy?=
 =?utf-8?B?aTlPZDNJM3R4dnVwbXNZUTEvcFN1bTdTSlIvSDRmdmhjWXdNc2t1dUJranE1?=
 =?utf-8?B?YmUxMDBhMW9jc0xrNU1hb3lKY2NRbHpJcERsRWV2ZytnK2xybjQ5YVJKL294?=
 =?utf-8?B?cG9pZHJRbFFNN0U3TXgrT2dlYkU2T2IxT3ZITEJ2clhNa2VXaUxTZjZucmh1?=
 =?utf-8?B?bHRnQzZsbXVScGs5bzVwWTBPQXBJeWkreW1MYVJYd3ZLOG1LVi80VTVFY2hx?=
 =?utf-8?B?RlloZ2FiU0U0eE5pdDhFZTJjQytPYTlVS2ZPdHFWcmNncFZzWC91YzBiZzVi?=
 =?utf-8?B?NmhSL1JFNVJmV1ZpVUJkM1dBbjJCK0l0QUYxNW1DWVg3S1JLQlcwVWNqMHVt?=
 =?utf-8?B?eEhCdDBMVFJweWRiWHZzTk1NaTV2cEdLb1hZSW9IWXR0ekZWMzRJQXJxSmpv?=
 =?utf-8?B?bWp6STZPdDFLZ3I1NU9xRVRpU0lIb0k2MGp3YWI5SUdMeGNZdDYybDRpNlBZ?=
 =?utf-8?B?aUZYbDNQTkxibkZYRW02dXRuRDJTdTRacFJHV0lLNUNJZ0NoeC9Lb2tQNEND?=
 =?utf-8?B?Mm5FWmVuellBZmpXd1QrbUtxQzBjRjc3WFVUNFZJY2NINmpvTkk0enAxcWxT?=
 =?utf-8?B?WnJINTc4M2wyUTNWRWxVenRDU1U0WUZuZ2JGTXFTeWplMC8zLzVhNVd4Zlhm?=
 =?utf-8?B?QWN0azlwK0Q4a011Y010dmk1bGRLa2VoNEdvMnV5ZU4ySnBnc2xOcmlpZ1ZU?=
 =?utf-8?B?b1dYK2hrVC9JUVV6MW9Pa0hkU0ZRRng5Ykpqb2Z0d1FhVUZUekppQUlHQUN4?=
 =?utf-8?B?aW9kOXVoQ3A3eEUvYUJ3UE5OejdkbERtLzF1WDc5bEVvVGZBZDI0NHZ2RlpI?=
 =?utf-8?B?UUNrSnpNTmNjaHkvVk9IbzZtTkUrNGFxMDVRaTR3cm9CRHVKb0F4UFhDSjVK?=
 =?utf-8?B?elRxaG1OUEh4TFZMQ0c5dEdXMXFMRjB5aFhPcVgxYjl0Tm5pQy9qS1hLTTFU?=
 =?utf-8?B?ZmpGQnNpejEzdmN5ZmZ5YVNIOWJ3blBNQ1I2eldOVXFQUFdoeFhyUDlTTVAz?=
 =?utf-8?B?L2tTcVR5NGhiWXNnREYyYmFHNmdhOXJkT2ZEMEVnaWNzaDFWL1Ywb0MxamlM?=
 =?utf-8?B?SVQ1clVwakNuOHM4VFVZVXFWRmd3Z3loTDRYeVJWRVFqZ0RpUHVjZTJXamxV?=
 =?utf-8?B?MlpaQXFjZ3l2OWdBSFgrcU82YjdiSWV5MFI2SmRjakVlRzBVZkxtY3FJdVpz?=
 =?utf-8?B?REpoNFc0cDc0b0twd21LRU0wRzYyWkVhV2lLdUkwUUwrdUN2YUNpY0NKd2JM?=
 =?utf-8?B?alpQU1NNTklRLzdwU2JnRnJlc3FpSktKZzM0aTNDbkVzQmo1RkVLdkx6NnU4?=
 =?utf-8?B?UzFiOURxU3VVTGYxbFlqN3lZRmFjOU5lUCsvUmlWaCtMU0VpYUw2SHg5eENs?=
 =?utf-8?B?eDVSMW5xR090OEh5SVQ1aWRwckNyU2VXOWllMWlseTFLOW9Gb2pzK1k0VllE?=
 =?utf-8?B?OUx1eExRVm1OcEpZUDVqVE03OFdpc1NQOS9EdUZjeWc4YzN0TXFGQWhkckxL?=
 =?utf-8?B?WEVtM0NBUStia0VlSGk3TzNWZUpjU0ZrcFhta2JEYXJaalBOeDVsMGNleTlY?=
 =?utf-8?B?YWgzczk0VFJQdnNwUnA1WWlTU3Y2VDRacDFhaDgzZUt3OW9tNVZ2YVVyNDdB?=
 =?utf-8?B?QldIV25PNnF0VDlGMlBuNXdKaytrM0NUalNYaWpTKzFVenh3azdiMk5MSkZm?=
 =?utf-8?B?NStoaU1NQ1lBajd1cVAyNjhiVU9EZUMvT203aUR0MytXWU1HT2IrTTNsck5K?=
 =?utf-8?B?a0VvUzNQbUpWUmxmODJRRms1YmFIQzdHcTRjcnBJV2xoYU90TndWVURjdXRi?=
 =?utf-8?B?cjZCbHVBeXJCSDlBTXlheHRLeHYxL3FwTDlFL2ZmemVrTCtvczZCLytZZUZK?=
 =?utf-8?B?Z2c9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e96ceeb4-558d-476f-a3f8-08daca119944
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2022 09:36:56.2419 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DqQd5kNVYbyJ5hotRn4J30jjbSjEYogW/5nE2BLIWYI7R1Q8uxpMK56MjdIKOsBLMap8YpEz4JkCaO5kU6zKw+LV3AzyQDINXK869TJWkeU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7479
X-Proofpoint-GUID: m0jOCht5iZ2zIQa_XgmzQsunwqMIBsTV
X-Proofpoint-ORIG-GUID: m0jOCht5iZ2zIQa_XgmzQsunwqMIBsTV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_08,2022-11-18_01,2022-06-22_01
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
 chardev/char-socket.c               |  4 +-
 include/io/channel.h                | 83 +++++++++++++++++++++++++++++
 io/channel-buffer.c                 |  1 +
 io/channel-command.c                |  1 +
 io/channel-file.c                   |  1 +
 io/channel-null.c                   |  1 +
 io/channel-socket.c                 | 16 +++++-
 io/channel-tls.c                    |  1 +
 io/channel-websock.c                |  1 +
 io/channel.c                        | 73 +++++++++++++++++++++++--
 migration/channel-block.c           |  1 +
 scsi/qemu-pr-helper.c               |  2 +-
 tests/qtest/tpm-emu.c               |  2 +-
 tests/unit/test-io-channel-socket.c |  1 +
 util/vhost-user-server.c            |  2 +-
 15 files changed, 179 insertions(+), 11 deletions(-)

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
index c680ee7480..cbcde4b88f 100644
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
 
 
@@ -300,6 +306,34 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
                               size_t niov,
                               Error **errp);
 
+/**
+ * qio_channel_readv_peek_all_eof:
+ * @ioc: the channel object
+ * @iov: the array of memory regions to read data into
+ * @niov: the length of the @iov array
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Read data from the peek of IO channel without
+ * actually removing it from channel buffer, storing
+ * it in the memory regions referenced by @iov. Each
+ * element in the @iov will be fully populated with
+ * data before the next one is used. The @niov
+ * parameter specifies the total number of elements
+ * in @iov.
+ *
+ * The function will wait for all requested data
+ * to be read, yielding from the current coroutine
+ * if required.
+ *
+ * Returns: 1 if all bytes were read, 0 if end-of-file
+ *          occurs without data, or -1 on error
+ */
+int qio_channel_readv_peek_all_eof(QIOChannel *ioc,
+                                   const struct iovec *iov,
+                                   size_t niov,
+                                   Error **errp);
+
+
 /**
  * qio_channel_readv_all:
  * @ioc: the channel object
@@ -328,6 +362,34 @@ int qio_channel_readv_all(QIOChannel *ioc,
                           Error **errp);
 
 
+/**
+ * qio_channel_readv_peek_all:
+ * @ioc: the channel object
+ * @iov: the array of memory regions to read data into
+ * @niov: the length of the @iov array
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Read data from the the peek of IO channel without
+ * removing from channel buffer, storing it in the
+ * memory regions referenced by @iov. Each element
+ * in the @iov will be fully populated with data
+ * before the next one is used. The @niov parameter
+ * specifies the total number of elements in @iov.
+ *
+ * The function will wait for all requested data
+ * to be read, yielding from the current coroutine
+ * if required.
+ *
+ * If end-of-file occurs before all requested data
+ * has been read, an error will be reported.
+ *
+ * Returns: 0 if all bytes were read, or -1 on error
+ */
+int qio_channel_readv_peek_all(QIOChannel *ioc,
+                               const struct iovec *iov,
+                               size_t niov,
+                               Error **errp);
+
 /**
  * qio_channel_writev_all:
  * @ioc: the channel object
@@ -456,6 +518,27 @@ int qio_channel_read_all(QIOChannel *ioc,
                          size_t buflen,
                          Error **errp);
 
+/**
+ * qio_channel_read_peek_all:
+ * @ioc: the channel object
+ * @buf: the memory region to read data into
+ * @buflen: the number of bytes to @buf
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Reads @buflen bytes from the peek of channel into @buf without
+ * removing it from channel buffer, possibly blocking or (if the
+ * channel is non-blocking) yielding from the current coroutine
+ * multiple times until the entire content is read. If end-of-file
+ * occurs it will return an error rather than a short-read. Otherwise
+ * behaves as qio_channel_read().
+ *
+ * Returns: 0 if all bytes were read, or -1 on error
+ */
+int qio_channel_read_peek_all(QIOChannel *ioc,
+                              const char *buf,
+                              size_t buflen,
+                              Error **errp);
+
 /**
  * qio_channel_write_all:
  * @ioc: the channel object
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
index b76dca9cc1..a06b24766d 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -406,6 +406,8 @@ qio_channel_socket_accept(QIOChannelSocket *ioc,
     }
 #endif /* WIN32 */
 
+    qio_channel_set_feature(QIO_CHANNEL(cioc), QIO_CHANNEL_FEATURE_READ_MSG_PEEK);
+
     trace_qio_channel_socket_accept_complete(ioc, cioc, cioc->fd);
     return cioc;
 
@@ -496,6 +498,7 @@ static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
                                         size_t niov,
                                         int **fds,
                                         size_t *nfds,
+                                        int flags,
                                         Error **errp)
 {
     QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
@@ -517,6 +520,10 @@ static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
 
     }
 
+    if (flags & QIO_CHANNEL_READ_FLAG_MSG_PEEK) {
+        sflags |= MSG_PEEK;
+    }
+
  retry:
     ret = recvmsg(sioc->fd, &msg, sflags);
     if (ret < 0) {
@@ -624,11 +631,17 @@ static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
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
@@ -636,7 +649,7 @@ static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
         ret = recv(sioc->fd,
                    iov[i].iov_base,
                    iov[i].iov_len,
-                   0);
+                   sflags);
         if (ret < 0) {
             if (errno == EAGAIN) {
                 if (done) {
@@ -705,7 +718,6 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
 }
 #endif /* WIN32 */
 
-
 #ifdef QEMU_MSG_ZEROCOPY
 static int qio_channel_socket_flush(QIOChannel *ioc,
                                     Error **errp)
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
index 0640941ac5..23c8752918 100644
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
 
 
@@ -109,6 +117,37 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
     return qio_channel_readv_full_all_eof(ioc, iov, niov, NULL, NULL, errp);
 }
 
+int qio_channel_readv_peek_all_eof(QIOChannel *ioc,
+                                   const struct iovec *iov,
+                                   size_t niov,
+                                   Error **errp)
+{
+   ssize_t len = 0;
+   ssize_t total = iov_size(iov, niov);
+
+   while (len < total) {
+       len = qio_channel_readv_full(ioc, iov, niov, NULL,
+                                    NULL, QIO_CHANNEL_READ_FLAG_MSG_PEEK, errp);
+
+       if (len == QIO_CHANNEL_ERR_BLOCK) {
+            if (qemu_in_coroutine()) {
+                qio_channel_yield(ioc, G_IO_IN);
+            } else {
+                qio_channel_wait(ioc, G_IO_IN);
+            }
+            continue;
+       }
+       if (len == 0) {
+           return 0;
+       }
+       if (len < 0) {
+           return -1;
+       }
+   }
+
+   return 1;
+}
+
 int qio_channel_readv_all(QIOChannel *ioc,
                           const struct iovec *iov,
                           size_t niov,
@@ -117,6 +156,24 @@ int qio_channel_readv_all(QIOChannel *ioc,
     return qio_channel_readv_full_all(ioc, iov, niov, NULL, NULL, errp);
 }
 
+int qio_channel_readv_peek_all(QIOChannel *ioc,
+                               const struct iovec *iov,
+                               size_t niov,
+                               Error **errp)
+{
+    int ret = qio_channel_readv_peek_all_eof(ioc, iov, niov, errp);
+
+    if (ret == 0) {
+        error_setg(errp, "Unexpected end-of-file before all data were read");
+        return -1;
+    }
+    if (ret == 1) {
+        return 0;
+    }
+
+    return ret;
+}
+
 int qio_channel_readv_full_all_eof(QIOChannel *ioc,
                                    const struct iovec *iov,
                                    size_t niov,
@@ -146,7 +203,7 @@ int qio_channel_readv_full_all_eof(QIOChannel *ioc,
     while ((nlocal_iov > 0) || local_fds) {
         ssize_t len;
         len = qio_channel_readv_full(ioc, local_iov, nlocal_iov, local_fds,
-                                     local_nfds, errp);
+                                     local_nfds, 0, errp);
         if (len == QIO_CHANNEL_ERR_BLOCK) {
             if (qemu_in_coroutine()) {
                 qio_channel_yield(ioc, G_IO_IN);
@@ -284,7 +341,7 @@ ssize_t qio_channel_readv(QIOChannel *ioc,
                           size_t niov,
                           Error **errp)
 {
-    return qio_channel_readv_full(ioc, iov, niov, NULL, NULL, errp);
+    return qio_channel_readv_full(ioc, iov, niov, NULL, NULL, 0, errp);
 }
 
 
@@ -303,7 +360,7 @@ ssize_t qio_channel_read(QIOChannel *ioc,
                          Error **errp)
 {
     struct iovec iov = { .iov_base = buf, .iov_len = buflen };
-    return qio_channel_readv_full(ioc, &iov, 1, NULL, NULL, errp);
+    return qio_channel_readv_full(ioc, &iov, 1, NULL, NULL, 0, errp);
 }
 
 
@@ -336,6 +393,14 @@ int qio_channel_read_all(QIOChannel *ioc,
     return qio_channel_readv_all(ioc, &iov, 1, errp);
 }
 
+int qio_channel_read_peek_all(QIOChannel *ioc,
+                              const char *buf,
+                              size_t buflen,
+                              Error **errp)
+{
+    struct iovec iov = { .iov_base = (char *)buf, .iov_len = buflen };
+    return qio_channel_readv_peek_all(ioc, &iov, 1, errp);
+}
 
 int qio_channel_write_all(QIOChannel *ioc,
                           const char *buf,
diff --git a/migration/channel-block.c b/migration/channel-block.c
index c55c8c93ce..0b0deeb919 100644
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


