Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D1F544EA7
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 16:21:01 +0200 (CEST)
Received: from localhost ([::1]:58920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzJ1w-0004jS-9z
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 10:21:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1nzCfW-0002B3-Jl
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 03:33:29 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:46408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1nzCfQ-0007uI-Pm
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 03:33:26 -0400
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25964PeO022399;
 Thu, 9 Jun 2022 00:33:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=fVlopdvxuJj6Cz63nf3fC0gf0KuCacUk6nP1g4zXZXg=;
 b=JzWOYzA5pBry4s6Gtt9pbvMg44/9p1Hmuz7UmF86SfTP67mxjEGLV0q6gTi4Nw7prZRm
 wOi7Hxjt7RAKkYFT3YO+WKfi4JudZ1bj8Nr0f8wt3a4I9ShCXAg1HPiD0+3DF3SI5zr1
 3tesp6NGgyN3kaEhSfUg7Rjbctv2Ej8oxr8AxC8+LFLzOgvDvSvWthVpfIoU7wLi2K9/
 MfAC8qCzWpJdx0QJJYsilpQH6il8IF97KOA8YKCuWjI0ujwmRsrklVJDZRpaOL4IzVe4
 SPEUtQWtSEBvQ06mmflhR1JNFwBhMi3Nm4vSr4oJmQvjnFwIvqqiRov22S99Ncaisl2q aQ== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3gg6y0a3r2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jun 2022 00:33:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a06eldtezXhlUyrTH20DfjROPS2UBMs3uNZXV+UoTiSefGiFCmpn1LfNZOjocSE2YyqXk5ZUB3IDGsbLhn1dMuLDYAgL9nnNdZB/9gaM0PxwycsRIhWBPtUlW8hke4dcC04d4xKl3PB1bG94Db9Mkb6sqBJCVbEfW07XpsBrFxgm4bAfEuyCF4vRitqtpSd6BE/QG1pnzfmkOOYh9j0ffati5XtxdMVAS3OnXNHS4mDjN2uY/uQ6wYvuGmFN5ks8aWVSBawL4aRVWNun91sMt2zxZ2g1h1UbY1BQueC79YkBT0OVKgcI5DBLqEgw3N/6VzeaTBnhXdC4SHv8z4jX3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fVlopdvxuJj6Cz63nf3fC0gf0KuCacUk6nP1g4zXZXg=;
 b=M6AqpzVBAvsN0HKwmPGHIzzUrpcLdNNHPRScanHXcbRJFLzdX3pw/w6Q9EENLyqMu0B77AiJ4qS3mzed2xQzF7oR7i49YfLP+uqgQjt/PQZsnJNQ/wZGvA4TQJlHTYpaqUct45wp7sqDG0T480Qo1+UbUPCF7O6ns0rf2wLOmUxHcg3eimQxNivr6Q2jbOcuO6HbrRXHBAEqES2nxCzDNr1QBE8+zA0Q1BqlrOdKwsRsxRvdJltX6M8buoBbvr07oGGQ3l8/YzfvIevSKFdG0JPzby641fAUOTjF31SSyfz9pZY9694ynuiNscoifH6OBZrVDBuIS4yxjoIKigX/zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by SA1PR02MB8639.namprd02.prod.outlook.com (2603:10b6:806:1fe::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 9 Jun
 2022 07:33:14 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f%5]) with mapi id 15.20.5314.019; Thu, 9 Jun 2022
 07:33:14 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com, armbru@redhat.com, eblake@redhat.com,
 Het Gala <het.gala@nutanix.com>, Manish Mishra <manish.mishra@nutanix.com>
Subject: [PATCH 2/4] Adding multi-interface support for multi-FD on
 destination side
Date: Thu,  9 Jun 2022 07:33:03 +0000
Message-Id: <20220609073305.142515-3-het.gala@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20220609073305.142515-1-het.gala@nutanix.com>
References: <20220609073305.142515-1-het.gala@nutanix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::12) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdc8117f-8c16-4444-832f-08da49ea506d
X-MS-TrafficTypeDiagnostic: SA1PR02MB8639:EE_
X-Microsoft-Antispam-PRVS: <SA1PR02MB8639CFB7975ED244AF1206D298A79@SA1PR02MB8639.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EXKnHtJQxpJZkOcKncpoxIrqZwkwLDvpe8WCHf3U7tGQqEtqfL6twlWw6CVfrlX0XfgwZSUTIwwsJn2yQ/AvnbCmZUQyIG5as+RAQzlOAZ5RTDMF7Vdwvd002hCkOgYDz9d/a/7v+vWj1hDhz7GTtp5O+LnmuUbX7ZBXrcLHjPbgRd4/0PstcVL+iPJPN34f5LvqnyUIADe/d/C09B+sVQC64R4RIAznDXtieNllLYQszGqxwclGaQyAr1g/XAm9AHpiSg/GChGhOXkTAd1tfmciLOh4Ox0TNdk72B69arlCwvBNFoSej8jpXmCXAJlYYc3ncih1ybSuNnFrLrG+Jh/yzPs534Rx72ulda0MSBs6MWjW9s4vVL6YcZbcntlWyqspSPlpptoMAhrRkkJ9M3D82p9KbIMitEruC2CcvKweZ82ONEe3DC3R1Ixplvm7yA6pkzBkj/xZjCAVnmO16ieiAn/IJUDxhGR89ruzUekGJRGzIzg3Wl1VfmBrBne2lk+1DwFwbU34VwcnYEwJxgoRMsZ5O9PbGkUVegvSKAXx5BaR8D3g1rJUtIzF3NZLrRn7xQFu0NXsKgdMHziHzSlibsKecXbyb5EOW619X3KkuYP4wLb6gM1jTVtRh+ZiG5FpCxDGgcBMtTciun/ZAMkMwzOUfleuT+8CLx5HaOO8TmZVWUCYSZKcL2L6LflMFK+6Z+nQJeIt1Cu82QPygxEIeZGZwvr3KjQIi0qg0Ho=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(107886003)(6666004)(1076003)(2906002)(8936002)(52116002)(54906003)(86362001)(6506007)(186003)(5660300002)(30864003)(83380400001)(6486002)(44832011)(38350700002)(26005)(38100700002)(36756003)(6512007)(2616005)(316002)(66556008)(66946007)(4326008)(6916009)(8676002)(66476007)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejBISmxGTUtNNGVJNFM4STY3SUlyZHJIblhhUVJlOFVQM2ZnM3ZNc0hNUVFs?=
 =?utf-8?B?LzRxeDlHZy9vcllOVEhrRzFneUJod1B0NGw0eHJtbVRNdXVVUlhhWVB6cEZB?=
 =?utf-8?B?YjFRSWZ1UVo0ZE1xSFMzbHpsdHVKZkxPRjJoN3VCaFlScS8xZWcxQ1NxK3RQ?=
 =?utf-8?B?bjI0ZFpJM1ZRQTc0RnBTWDhJRzJhV0lkWVJTWElwbEtFcmpBcFc1MjBibkcy?=
 =?utf-8?B?MVNlQk14MGIvMkFlOXJBY0hGSjQyYVlONys3VUhoSFBxUU50ejJXNm9lT1Vt?=
 =?utf-8?B?M1B6RG4wTmlQZWpGMW5sQlVPL2s0aXFwdEsyelFBVDIwWHhXTVZURVI1Y1hX?=
 =?utf-8?B?c1RiSmVpQ2E0NkwzNVVLbmdQMnhGWSswM09IcDArelRFaXlNeG4wNzFDbjdE?=
 =?utf-8?B?Mk9OMXl4WitUVTNqajRraWFGTC84VlY1dEFTdkVEdFZHOG5uYTZPT0JoSys2?=
 =?utf-8?B?QlFqT01WcXBmdmJLRHlGMHk2WUhSbG13YkRPR0FEQlMwQzBmbFVvTU5BWXc3?=
 =?utf-8?B?V3VKc3hjb01TbEYvTi9Hc1BxMTBHc2xzVFp2RE1mWjk4UmhjbGIxaWtwcVh0?=
 =?utf-8?B?OHpVRUpvSUc3ZDd0QVRrTFFRQkliTmtjd3BnTWliL3FCWVIwQ1pqZjZscHda?=
 =?utf-8?B?SFpjbTdjTDAySjJacDFEZnFjQUd6aUdYbWRJSG9iY1kwOUswMlF2VWFkeFdz?=
 =?utf-8?B?b2FkV08rRkNNRFBFTERVT2EzVFpPZzJHc2dEclVKUC9ha1F0TEUrckVPcEl1?=
 =?utf-8?B?am9ibFRLb3Y0SDdpcW52MHdpU3VBYVd2QTFyUEFPWHpWVVRIc3pZaVNiMjNX?=
 =?utf-8?B?RjB5dDAzdVVTdmpxTFpsMEVFOVRUMkNRTG9BYUREUjNpdEtDcUlZazVQZmFE?=
 =?utf-8?B?dmJUdGp6YXpHbWdPWXhIVXp6QUluZnZ4RGNMVjBsakc4YURJc0YreVEvNGx5?=
 =?utf-8?B?cy9XM0VRT2dpWjZzWnBEdW82ZGtHcmY0NzlJRitySnYrT1RNdFptd1RkaFBr?=
 =?utf-8?B?WllLL3poa2pKNG1sL3RXV0pKTDJiNlI0YmtiZDIvTXpoVGNiTXJaRmt4UG1V?=
 =?utf-8?B?REtnODVXajRLSlFyZjhFRS9Jdm1TWDJyV2JsR0ZCa0dtblc2bWFtNGxJZFVU?=
 =?utf-8?B?eGF4RCtaOVFMaTBtSWtuN09Xck9pV2VGTEdkbDR4WXJmcTg3NlF2R1grVlBl?=
 =?utf-8?B?Lzc5RlpUWnV5ZGZMQ1pzTUhYMWxrUXRaNzU0VHJMOXordGNxL3VzN3NpelRJ?=
 =?utf-8?B?RjFMdlBYaWZTVnhPOGo1TUZINzZ3NnpIYi9SZEI2Zk0xYnhDdnpEQVhtV0lx?=
 =?utf-8?B?V3BEdlZNZFlYckxza1p4d3MzSEtmL2MvN1ZlOHVmVUJ4YWlEYTY0aGJyNGxQ?=
 =?utf-8?B?ekVrWXJ2V01NUS9peGZ2RVFtclYvbFJIMUw1STQ3b3RLL0FIQWt6V081eU9K?=
 =?utf-8?B?cDlkQVBSTjYzSGt3bDU0RjB4SExOeHcrMjVaNksxRFpRN1ZiN25RQjk5cmlw?=
 =?utf-8?B?WlFYdVlTZXJIeUk3Wk9pMDdFVk10VVhEaGQ5SnJodG56b1FCampvVW41c0Fr?=
 =?utf-8?B?U3hteFc2QmFGM2xaRi9VQlZtZXNRRHNYMW9qbHJ2dklJMDZWNForVEZBRkM3?=
 =?utf-8?B?NUJQQmtDNk16U1ZFdWQ5cm55aWZUdW4vRGFmRExmN0JxNi9aRTM0OHJJSith?=
 =?utf-8?B?akhJUk1JNUs5ME9kS05VZ1p2STVnemVEK0xQeDZUVWw4d3dudlduRTZsZWVM?=
 =?utf-8?B?MFhQbFI1V0lLNXVjanVqVjlLNTYwcGp3V25LSmNWZ3NCY243WjZudmdKeWsy?=
 =?utf-8?B?TVBsdkR2cklSMFV2eE1ROGNlaTNUYkZ0Y1R1MW1SK2tZNGRscFR2YUlsWndq?=
 =?utf-8?B?SW90SkMzMG0xRzJ0cVNWSHlWUzRtWVNWNWlSTW8yREMyZm9QRkJpSFJmWmN3?=
 =?utf-8?B?ZVh5U3BUajRFOGkzTFd1R1FvT3BMUjh6bS9DaERxN2h5TThLOUNOT1A2R05u?=
 =?utf-8?B?b2hIaVlhbVNWcCtDdS9FdVpsdEtneEh2REpSNTlncUZPdjNEcEovaTVGdURx?=
 =?utf-8?B?N3hSSVYvd00xSVhKMitPakJvNSt6SUtTclZSRzUvWnpvbXE3bnBGcENIbVFv?=
 =?utf-8?B?TEh2S2tJNFhqUHgwM2VkWFZ0c3AzSTdseXcrai9CWDVFb2pOcC9FbWlGMFpB?=
 =?utf-8?B?Rk9aOTFMZ01WWE1ST1IrSTVlMTYzUmpkSDlmaVpYb0FJQTRVUTA3M3NjdEZX?=
 =?utf-8?B?VGlweWZpeGU3cVdvM3J4SWhidU5ub0RkOGZiZlNYWlkzdDVKMktYOHdZSFMv?=
 =?utf-8?B?WGJ5bnNzNm9BazA3U2JydVppQXRlWGVwYWtjVW5LYzlLaUpWK3V6SjgxRDhy?=
 =?utf-8?Q?KX741jAbvoIz8Cm4=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdc8117f-8c16-4444-832f-08da49ea506d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 07:33:14.7813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V/Rl4oYGR0kkxeOfSoxvvzeyVjralrM3pH6G5RmazfnVxrYcU7YCVhzesNc0cmkow3sAZxfRuua/tuRUSQJpAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR02MB8639
X-Proofpoint-GUID: N7GQt9PTXAnIpREplu6LCjWWbOrFCAX4
X-Proofpoint-ORIG-GUID: N7GQt9PTXAnIpREplu6LCjWWbOrFCAX4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-09_07,2022-06-07_02,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=het.gala@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 09 Jun 2022 09:30:34 -0400
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

i) Modified the format of qemu monitor command: ‘migrate-incoming’ by adding
   a list, each element in the list is to open listeners with a given number
   of multiFD channels.

ii) Qemu starts with -incoming flag defer and -multi-fd-incoming defer to
    allow the modified 'migrate-incoming' command to be used.

iii) Format for -multi-fd-incoming flag as a comma separated string has been
     added with each substring containing listener socket address and number
     of sockets to open.

Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
Signed-off-by: Het Gala <het.gala@nutanix.com>
---
 include/qapi/util.h   |   1 +
 migration/migration.c | 149 ++++++++++++++++++++++++++++++++++++------
 migration/migration.h |   2 +
 migration/socket.c    |  11 ++--
 migration/socket.h    |   3 +-
 monitor/hmp-cmds.c    |  42 ++++--------
 qapi/migration.json   |  43 ++++++++++--
 qapi/qapi-util.c      |  27 ++++++++
 qemu-options.hx       |  18 +++++
 softmmu/vl.c          |  30 ++++++++-
 10 files changed, 265 insertions(+), 61 deletions(-)

diff --git a/include/qapi/util.h b/include/qapi/util.h
index 3041feb3d9..88fb2270db 100644
--- a/include/qapi/util.h
+++ b/include/qapi/util.h
@@ -29,6 +29,7 @@ bool qapi_bool_parse(const char *name, const char *value, bool *obj,
                      Error **errp);
 
 int parse_qapi_name(const char *name, bool complete);
+struct strList *strList_from_string(const char *in, char c);
 
 /*
  * For any GenericList @list, insert @element at the front.
diff --git a/migration/migration.c b/migration/migration.c
index c408175aeb..9b0ad732e7 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -477,28 +477,39 @@ void migrate_add_address(SocketAddress *address)
                       QAPI_CLONE(SocketAddress, address));
 }
 
-static void qemu_start_incoming_migration(const char *uri, Error **errp)
+static void qemu_start_incoming_migration(const char *uri, uint8_t number,
+                                          int idx, Error **errp)
 {
     const char *p = NULL;
 
-    migrate_protocol_allow_multi_channels(false); /* reset it anyway */
-    qapi_event_send_migration(MIGRATION_STATUS_SETUP);
-    if (strstart(uri, "tcp:", &p) ||
-        strstart(uri, "unix:", NULL) ||
-        strstart(uri, "vsock:", NULL)) {
-        migrate_protocol_allow_multi_channels(true);
-        socket_start_incoming_migration(p ? p : uri, errp);
-#ifdef CONFIG_RDMA
-    } else if (strstart(uri, "rdma:", &p)) {
-        rdma_start_incoming_migration(p, errp);
-#endif
-    } else if (strstart(uri, "exec:", &p)) {
-        exec_start_incoming_migration(p, errp);
-    } else if (strstart(uri, "fd:", &p)) {
-        fd_start_incoming_migration(p, errp);
+    if (number ==  0) {
+        migrate_protocol_allow_multi_channels(false); /* reset it anyway */
+        qapi_event_send_migration(MIGRATION_STATUS_SETUP);
+        if (strstart(uri, "tcp:", &p) ||
+            strstart(uri, "unix:", NULL) ||
+            strstart(uri, "vsock:", NULL)) {
+            migrate_protocol_allow_multi_channels(true);
+    #ifdef CONFIG_RDMA
+        } else if (strstart(uri, "rdma:", &p)) {
+            rdma_start_incoming_migration(p, errp);
+    #endif
+        } else if (strstart(uri, "exec:", &p)) {
+            exec_start_incoming_migration(p, errp);
+        } else if (strstart(uri, "fd:", &p)) {
+            fd_start_incoming_migration(p, errp);
+        } else {
+            error_setg(errp, "unknown migration protocol: %s", uri);
+        }
     } else {
-        error_setg(errp, "unknown migration protocol: %s", uri);
+        /* multi-FD parameters only support tcp network protocols */
+        if (!strstart(uri, "tcp:", &p)) {
+            error_setg(errp, "multifd-destination uri supports "
+                                "tcp protocol only");
+            return;
+        }
+        store_multifd_migration_params(p ? p : uri, NULL, number, idx, errp);
     }
+    socket_start_incoming_migration(p ? p : uri, number, errp);
 }
 
 static void process_incoming_migration_bh(void *opaque)
@@ -2140,7 +2151,17 @@ void migrate_del_blocker(Error *reason)
     migration_blockers = g_slist_remove(migration_blockers, reason);
 }
 
-void qmp_migrate_incoming(const char *uri, Error **errp)
+static inline int incoming_multi_fd_uri_parse(const char *str, char delim)
+{
+    int count = 0;
+    for (int i = 0; i < strlen(str); i++) {
+        count += (str[i] == delim);
+    }
+    return count;
+}
+
+/* migrate_incoming comes from -incoming flag in qemu process */
+void migrate_incoming(const char *uri, Error **errp)
 {
     Error *local_err = NULL;
     static bool once = true;
@@ -2154,11 +2175,99 @@ void qmp_migrate_incoming(const char *uri, Error **errp)
         return;
     }
 
+    qemu_start_incoming_migration(uri, 0, 0, &local_err);
+
     if (!yank_register_instance(MIGRATION_YANK_INSTANCE, errp)) {
         return;
     }
 
-    qemu_start_incoming_migration(uri, &local_err);
+    if (local_err) {
+        yank_unregister_instance(MIGRATION_YANK_INSTANCE);
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    once = false;
+}
+
+/* multi_fd_migrate_incoming comes from -multi-fd-migrate-incoming flag in qemu process */
+void multi_fd_migrate_incoming(const char *uri, Error **errp)
+{
+    Error *local_err = NULL;
+    static bool once = true;
+
+    if (!once) {
+        error_setg(errp, "The incoming migration has already been started");
+        return;
+    }
+    if (!runstate_check(RUN_STATE_INMIGRATE)) {
+        error_setg(errp, "'-multi-fd-incoming' was not specified on the command line");
+        return;
+    }
+
+    strList *st = strList_from_string(uri, ',');
+    strList *r = st;
+    int length = QAPI_LIST_LENGTH(st);
+    init_multifd_array(length);
+
+    for (int i = 0; i < length; i++) {
+        const char *uri = NULL, *ret = NULL;
+        const char *str = r->value;
+        uint8_t multifd_channels = DEFAULT_MIGRATE_MULTIFD_CHANNELS;
+        int parse_count = incoming_multi_fd_uri_parse(str, ':');
+        if (parse_count < 2 || parse_count > 3) {
+            error_setg(errp, "Invalid format of string-id %d in "
+                             "'-multi-fd-incoming' flag", i);
+            return;
+        }
+        if (parse_count == 3) {
+            ret = strrchr(str, ':');
+            uri = g_strndup(str, strlen(str) - strlen(ret));
+            multifd_channels = atoi(ret + 1);
+        }
+        qemu_start_incoming_migration(parse_count == 2 ? str : uri,
+                                      multifd_channels, i, &local_err);
+        r = r->next;
+    }
+
+    if (local_err) {
+        yank_unregister_instance(MIGRATION_YANK_INSTANCE);
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    once = false;
+}
+
+/* qmp_migrate_incoming comes from qemu qmp monitor command */
+void qmp_migrate_incoming(const char *uri, bool has_multi_fd_uri_list,
+                          MigrateIncomingUriList *cap, Error **errp)
+{
+    Error *local_err = NULL;
+    static bool once = true;
+
+    if (!once) {
+        error_setg(errp, "The incoming migration has already been started");
+        return;
+    }
+
+    if (!yank_register_instance(MIGRATION_YANK_INSTANCE, errp)) {
+        return;
+    }
+
+    /* For migration thread */
+    qemu_start_incoming_migration(uri, 0, 0, &local_err);
+
+    /* For Multi-FD */
+    int length = QAPI_LIST_LENGTH(cap);
+    init_multifd_array(length);
+    for (int i = 0; i < length; i++) {
+        const char *multifd_dst_uri = cap->value->destination_uri;
+        uint8_t multifd_channels = cap->value->multifd_channels;
+        qemu_start_incoming_migration(multifd_dst_uri, multifd_channels,
+                                      i, &local_err);
+        cap = cap->next;
+    }
 
     if (local_err) {
         yank_unregister_instance(MIGRATION_YANK_INSTANCE);
@@ -2194,7 +2303,7 @@ void qmp_migrate_recover(const char *uri, Error **errp)
      * only re-setup the migration stream and poke existing migration
      * to continue using that newly established channel.
      */
-    qemu_start_incoming_migration(uri, errp);
+    qemu_start_incoming_migration(uri, 0, 0, errp);
 }
 
 void qmp_migrate_pause(Error **errp)
diff --git a/migration/migration.h b/migration/migration.h
index 485d58b95f..fa8717ec9e 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -353,6 +353,8 @@ bool migration_is_setup_or_active(int state);
 bool migration_is_running(int state);
 
 void migrate_init(MigrationState *s);
+void migrate_incoming(const char *uri, Error **errp);
+void multi_fd_migrate_incoming(const char *uri_str, Error **errp);
 bool migration_is_blocked(Error **errp);
 /* True if outgoing migration has entered postcopy phase */
 bool migration_in_postcopy(void);
diff --git a/migration/socket.c b/migration/socket.c
index 7ca6af8cca..21e0983df2 100644
--- a/migration/socket.c
+++ b/migration/socket.c
@@ -202,17 +202,17 @@ socket_incoming_migration_end(void *opaque)
 
 static void
 socket_start_incoming_migration_internal(SocketAddress *saddr,
-                                         Error **errp)
+                                         uint8_t number, Error **errp)
 {
     QIONetListener *listener = qio_net_listener_new();
     MigrationIncomingState *mis = migration_incoming_get_current();
     size_t i;
-    int num = 1;
+    uint8_t num = 1;
 
     qio_net_listener_set_name(listener, "migration-socket-listener");
 
     if (migrate_use_multifd()) {
-        num = migrate_multifd_channels();
+        num = number;
     }
 
     if (qio_net_listener_open_sync(listener, saddr, num, errp) < 0) {
@@ -239,12 +239,13 @@ socket_start_incoming_migration_internal(SocketAddress *saddr,
     }
 }
 
-void socket_start_incoming_migration(const char *str, Error **errp)
+void socket_start_incoming_migration(const char *str,
+                                     uint8_t number, Error **errp)
 {
     Error *err = NULL;
     SocketAddress *saddr = socket_parse(str, &err);
     if (!err) {
-        socket_start_incoming_migration_internal(saddr, &err);
+        socket_start_incoming_migration_internal(saddr, number, &err);
     }
     qapi_free_SocketAddress(saddr);
     error_propagate(errp, err);
diff --git a/migration/socket.h b/migration/socket.h
index bba7f177fe..b9e3699167 100644
--- a/migration/socket.h
+++ b/migration/socket.h
@@ -30,7 +30,8 @@ struct SrcDestAddr {
 void socket_send_channel_create(QIOTaskFunc f, void *data);
 int socket_send_channel_destroy(QIOChannel *send);
 
-void socket_start_incoming_migration(const char *str, Error **errp);
+void socket_start_incoming_migration(const char *str, uint8_t number,
+                                     Error **errp);
 
 void socket_start_outgoing_migration(MigrationState *s, const char *dst_str,
                                      Error **errp);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 2db539016a..32a6b67d5f 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -42,6 +42,7 @@
 #include "qapi/qapi-commands-run-state.h"
 #include "qapi/qapi-commands-tpm.h"
 #include "qapi/qapi-commands-ui.h"
+#include "qapi/util.h"
 #include "qapi/qapi-visit-net.h"
 #include "qapi/qapi-visit-migration.h"
 #include "qapi/qmp/qdict.h"
@@ -72,32 +73,6 @@ bool hmp_handle_error(Monitor *mon, Error *err)
     return false;
 }
 
-/*
- * Produce a strList from a comma separated list.
- * A NULL or empty input string return NULL.
- */
-static strList *strList_from_comma_list(const char *in)
-{
-    strList *res = NULL;
-    strList **tail = &res;
-
-    while (in && in[0]) {
-        char *comma = strchr(in, ',');
-        char *value;
-
-        if (comma) {
-            value = g_strndup(in, comma - in);
-            in = comma + 1; /* skip the , */
-        } else {
-            value = g_strdup(in);
-            in = NULL;
-        }
-        QAPI_LIST_APPEND(tail, value);
-    }
-
-    return res;
-}
-
 void hmp_info_name(Monitor *mon, const QDict *qdict)
 {
     NameInfo *info;
@@ -1117,7 +1092,7 @@ void hmp_announce_self(Monitor *mon, const QDict *qdict)
                                             migrate_announce_params());
 
     qapi_free_strList(params->interfaces);
-    params->interfaces = strList_from_comma_list(interfaces_str);
+    params->interfaces = strList_from_string(interfaces_str, ',');
     params->has_interfaces = params->interfaces != NULL;
     params->id = g_strdup(id);
     params->has_id = !!params->id;
@@ -1147,8 +1122,19 @@ void hmp_migrate_incoming(Monitor *mon, const QDict *qdict)
 {
     Error *err = NULL;
     const char *uri = qdict_get_str(qdict, "uri");
+    const char *dst_uri = qdict_get_str(qdict, "destination-uri");
+    uint8_t multifd_channels = qdict_get_try_int(qdict, "multifd-channels",
+                                        DEFAULT_MIGRATE_MULTIFD_CHANNELS);
+    MigrateIncomingUriList *caps = NULL;
+    MigrateIncomingUri *value;
+
+    value = g_malloc0(sizeof(*value));
+    value->destination_uri = (char *)dst_uri;
+    value->multifd_channels = multifd_channels;
+    QAPI_LIST_PREPEND(caps, value);
 
-    qmp_migrate_incoming(uri, &err);
+    qmp_migrate_incoming(uri, !!caps, caps, &err);
+    qapi_free_MigrateIncomingUriList(caps);
 
     hmp_handle_error(mon, err);
 }
diff --git a/qapi/migration.json b/qapi/migration.json
index fb259d626b..62a7b22d19 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1527,15 +1527,37 @@
   'data': {'uri': 'str', '*multi-fd-uri-list': ['MigrateUriParameter'], '*blk': 'bool',
            '*inc': 'bool', '*detach': 'bool', '*resume': 'bool' } }
 
+##
+# @MigrateIncomingUri:
+#
+# Information regarding which destination listening interface to be connected
+# and number of multifd channels over that interface.
+#
+# @destination-uri: the Uniform Resource Identifier of the destination VM
+#
+# @multifd-channels: number of channels used to migrate data in parallel for
+#                    for specific source-uri and destination-uri.
+#                    Default value in this case is 2 (Since 4.0)
+#
+##
+{ 'struct' : 'MigrateIncomingUri',
+  'data' : { 'destination-uri' : 'str',
+           '*multifd-channels' : 'uint8'} }
+
 ##
 # @migrate-incoming:
 #
 # Start an incoming migration, the qemu must have been started
-# with -incoming defer
+# with -incoming defer. qemu can also be started with optional
+# -multi-fd-incoming defer for opening multifd listening sockets
 #
 # @uri: The Uniform Resource Identifier identifying the source or
 #       address to listen on
 #
+# @multi-fd-uri-list: list of pair of source and destination VM Uniform
+#                     Resource Identifiers with number of multifd-channels
+#                     for each pair
+#
 # Returns: nothing on success
 #
 # Since: 2.3
@@ -1546,19 +1568,30 @@
 #    compatible with -incoming and the format of the uri is already exposed
 #    above libvirt.
 #
-# 2. QEMU must be started with -incoming defer to allow migrate-incoming to
+# 2. multi-fd-uri-list will have list of destination uri as listening sockets
+#    and multi-fd number of channels on each listening socket.
+#
+# 3. QEMU must be started with -incoming defer to allow migrate-incoming to
 #    be used.
 #
-# 3. The uri format is the same as for -incoming
+# 4. multi-fd-uri-list format is not the same as for -multi-fd-incoming flag.
+#    For -multi-fd-incoming flag, it is a comma separated list of listener
+#    sockets with multifd channels.
+#    Example: -multi-fd-incoming "tcp::6900:4,tcp:11.0.0.0:7789:5".
 #
 # Example:
 #
 # -> { "execute": "migrate-incoming",
-#      "arguments": { "uri": "tcp::4446" } }
+#      "arguments": {"uri": "tcp::6789",
+#                    "multi-fd-uri-list" : [ {"destination-uri" : "tcp::6900",
+#                                             "multifd-channels": 4},
+#                                            {"destination-uri" : "tcp:11.0.0.0:7789",
+#                                             "multifd-channels": 5} ] } }
 # <- { "return": {} }
 #
 ##
-{ 'command': 'migrate-incoming', 'data': {'uri': 'str' } }
+{ 'command': 'migrate-incoming',
+  'data': {'uri': 'str', '*multi-fd-uri-list': ['MigrateIncomingUri'] } }
 
 ##
 # @xen-save-devices-state:
diff --git a/qapi/qapi-util.c b/qapi/qapi-util.c
index 63596e11c5..9cc43ebcd3 100644
--- a/qapi/qapi-util.c
+++ b/qapi/qapi-util.c
@@ -15,6 +15,7 @@
 #include "qapi/error.h"
 #include "qemu/ctype.h"
 #include "qapi/qmp/qerror.h"
+#include "qapi/qapi-builtin-types.h"
 
 CompatPolicy compat_policy;
 
@@ -152,3 +153,29 @@ int parse_qapi_name(const char *str, bool complete)
     }
     return p - str;
 }
+
+/*
+ * Produce a strList from a delimiter separated list.
+ * A NULL or empty input string return NULL.
+ */
+strList *strList_from_string(const char *in, char c)
+{
+    strList *res = NULL;
+    strList **tail = &res;
+
+    while (in && in[0]) {
+        char *ch = strchr(in, c);
+        char *value;
+
+        if (ch) {
+            value = g_strndup(in, ch - in);
+            in = ch + 1; /* skip the , */
+        } else {
+            value = g_strdup(in);
+            in = NULL;
+        }
+        QAPI_LIST_APPEND(tail, value);
+    }
+
+    return res;
+}
diff --git a/qemu-options.hx b/qemu-options.hx
index 60cf188da4..2e82e41dd5 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4480,6 +4480,24 @@ SRST
     to issuing the migrate\_incoming to allow the migration to begin.
 ERST
 
+DEF("multi-fd-incoming", HAS_ARG, QEMU_OPTION_multi_fd_incoming, \
+    "-multi-fd-incoming tcp:[host]:port[:channel][,to=maxport][,ipv4=on|off][,ipv6=on|off]\n" \
+    "-multi-fd-incoming defer\n" \
+    "                wait for the URI to be specified via\n" \
+    "                multi_fd_migrate_incoming\n",
+    QEMU_ARCH_ALL)
+SRST
+``-multi-fd-incoming tcp:[host]:port[:channel][,to=maxport][,ipv4=on|off][,ipv6=on|off]``
+    Prepare for multi-fd incoming migration, with multi-fd listening sockets
+    on that connection. Default number of multi-fd channels is 2.
+
+``-multi-fd-incoming defer``
+    Wait for the URI to be specified via multi_fd_migrate\_incoming. The
+    monitor can be used to change settings (such as migration parameters)
+    prior to issuing the multi_fd_migrate\_incoming to allow the migration
+    to begin.
+ERST
+
 DEF("only-migratable", 0, QEMU_OPTION_only_migratable, \
     "-only-migratable     allow only migratable devices\n", QEMU_ARCH_ALL)
 SRST
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 4c1e94b00e..2f5cf18eff 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -45,7 +45,7 @@
 #include "sysemu/seccomp.h"
 #include "sysemu/tcg.h"
 #include "sysemu/xen.h"
-
+#include "migration/migration.h"
 #include "qemu/error-report.h"
 #include "qemu/sockets.h"
 #include "qemu/accel.h"
@@ -167,6 +167,7 @@ typedef struct DeviceOption {
 static const char *cpu_option;
 static const char *mem_path;
 static const char *incoming;
+static const char *multi_fd_incoming;
 static const char *loadvm;
 static const char *accelerators;
 static bool have_custom_ram_size;
@@ -2349,6 +2350,11 @@ static void qemu_validate_options(const QDict *machine_opts)
         error_report("'preconfig' supports '-incoming defer' only");
         exit(EXIT_FAILURE);
     }
+    if (multi_fd_incoming && preconfig_requested &&
+        strcmp(multi_fd_incoming, "defer") != 0) {
+        error_report("'preconfig' supports '-multi-fd-incoming defer' only");
+        exit(EXIT_FAILURE);
+    }
 
 #ifdef CONFIG_CURSES
     if (is_daemonized() && dpy.type == DISPLAY_TYPE_CURSES) {
@@ -2621,7 +2627,7 @@ void qmp_x_exit_preconfig(Error **errp)
     if (incoming) {
         Error *local_err = NULL;
         if (strcmp(incoming, "defer") != 0) {
-            qmp_migrate_incoming(incoming, &local_err);
+            migrate_incoming(incoming, &local_err);
             if (local_err) {
                 error_reportf_err(local_err, "-incoming %s: ", incoming);
                 exit(1);
@@ -2630,6 +2636,20 @@ void qmp_x_exit_preconfig(Error **errp)
     } else if (autostart) {
         qmp_cont(NULL);
     }
+
+    if (multi_fd_incoming) {
+        Error *local_err = NULL;
+        if (strcmp(multi_fd_incoming, "defer") != 0) {
+            multi_fd_migrate_incoming(multi_fd_incoming, &local_err);
+            if (local_err) {
+                error_reportf_err(local_err, "-multi-fd-incoming %s: ",
+                                multi_fd_incoming);
+                exit(1);
+            }
+        }
+    } else if (autostart) {
+        qmp_cont(NULL);
+    }
 }
 
 void qemu_init(int argc, char **argv, char **envp)
@@ -3355,6 +3375,12 @@ void qemu_init(int argc, char **argv, char **envp)
                 }
                 incoming = optarg;
                 break;
+            case QEMU_OPTION_multi_fd_incoming:
+                if (!multi_fd_incoming) {
+                    runstate_set(RUN_STATE_INMIGRATE);
+                }
+                multi_fd_incoming = optarg;
+                break;
             case QEMU_OPTION_only_migratable:
                 only_migratable = 1;
                 break;
-- 
2.22.3


