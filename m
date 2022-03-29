Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D06C4EAEAF
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 15:44:59 +0200 (CEST)
Received: from localhost ([::1]:46016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZC9a-00058t-K0
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 09:44:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nZC86-0003gL-Vn
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 09:43:27 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:41038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nZC84-0006fD-5S
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 09:43:26 -0400
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22TA0q66014432;
 Tue, 29 Mar 2022 06:42:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=9+nymWdD1OZE7bTOh7Ta8REDHqHKpFEDpkDtjzatZAg=;
 b=oXJeULqwlyxHF5laFB4sJnjfx7qDxZG6vxMhed397d+zDM95VbeIJRf3KAZZT6AsRNdY
 MtkQNaA8XIi6q2PZvPrJAPwYCmv3mqqxUOn/vWNUu/EbwBriAIeqaKSriDsst1YI6UGm
 BWM9X8VwhVhbg9cf4swYXldAOvMkhdZ9RtzGd15Nvy3QWkEbndXjjmy2uMoC8+1ADg6P
 sMZBlPHP6MljI2h3plho4jnXD0eXBN0R8LWrE/0kpl/eGTolbXMRzTS5hAO//M4RfydM
 fq7KdQsnOqeupPTP1EqY5LoLN9WaJthHughp7yajPhoDTanvazImtauRAeZqPrNKnpuw NA== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3f21wf60ax-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Mar 2022 06:42:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cDwTOqlC0H0JvqjkmFEyUi8anJjnVhuOC03lHRoRUDmY8pJULfRGns0G63b6NZ9MHEp6hm8r2Vhc2ZyhevSm2z3SjAii6cLRk+7RzR5nY3E2O7yZfc/8p89B3tTb2JA1rPgXts4hejOyAIgQ21Vb4Uz7jgGHTXPTLso1dBtqPDRYwzRVZO3uttpQpxOdBAYP4ZFze5k5znbWp+PxSSrljPy1iEiwsaxApq0T/Ff5dAlejpUfAUEFNBCo5CKdU9DwcdeVhlpsa/CXCSLw3SZPituRmGH/Lr2X3PyTb+vSVvQDOnD2o55685RqCp5h090qFuQ6y35mbnvuFHQ9BGjzkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+nymWdD1OZE7bTOh7Ta8REDHqHKpFEDpkDtjzatZAg=;
 b=jQzyWAUCeo6NTYcCOSnrtsZP+2wtG+dww0IbnM9/vm/JBogNp5l4FgOpD8biAp0wfTyw7Eh5YyLUpqBQlnD5UJw5FNEgjvMyYqB/B6/2UfZP+qps7keGtJaLfPeO0os2L9xPKeVrPkjkSSy1VSGeNp54im3MF4evuCYVzydUwhY0i8mX48NFkXiTlIzqc/QvhRsyX07EMDMpxMG9kBKlQYBQSoAEwrMQTAHQFyr00eaXgXtXQY2FrVnPHXKjfq5IU2nt4cS3iaFk4q1wokV1yRt3nFqYoaLgdnuta0nzOO07LMiDMXUG/nWKgEoJiGN95letzTF0It3U0Ut9EWcw0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SN6PR02MB4048.namprd02.prod.outlook.com (2603:10b6:805:2c::26)
 by BY5PR02MB6193.namprd02.prod.outlook.com (2603:10b6:a03:1fd::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Tue, 29 Mar
 2022 13:42:54 +0000
Received: from SN6PR02MB4048.namprd02.prod.outlook.com
 ([fe80::f5cf:57d:ddf6:945]) by SN6PR02MB4048.namprd02.prod.outlook.com
 ([fe80::f5cf:57d:ddf6:945%3]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 13:42:54 +0000
From: Kshitij Suri <kshitij.suri@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/2] Added parameter to take screenshot with screendump as
 PNG
Date: Tue, 29 Mar 2022 13:42:35 +0000
Message-Id: <20220329134235.44298-3-kshitij.suri@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20220329134235.44298-1-kshitij.suri@nutanix.com>
References: <20220329134235.44298-1-kshitij.suri@nutanix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0208.namprd05.prod.outlook.com
 (2603:10b6:a03:330::33) To SN6PR02MB4048.namprd02.prod.outlook.com
 (2603:10b6:805:2c::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b61f8b69-f903-49e8-7202-08da118a06f9
X-MS-TrafficTypeDiagnostic: BY5PR02MB6193:EE_
X-Microsoft-Antispam-PRVS: <BY5PR02MB6193B1A447BDA687DA1FFE15991E9@BY5PR02MB6193.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6pD3CQSXtNjavK9z8/w0VkcvHg9Hap2qoZH8em6CBux1UYiE51nF4hdUwV2u0+dyUVN9FysJPOXrGRxi3Hspnbq0+PsO2UT7tLipiypgesRIJrh621und+kVrbMAFCHQP+vLRwy3wfIIsHqzWJj35NfP2JWamnuXIIDPTKC1xPMdGE0ZkIF83nQAzwTg+nEhh21IHgSqjDAaSJNVQz5vIS33tdCTIcG+bIkYv/dgaJ4q5LGUz6Xu7M7XeODwwpi+TlGbSIPMiclCpXQISWWvvxmqCl/kT/uZnXPAowyuEvJ/MXLISxMmEF8DkJsDC28RtOLXEHaE7GpiOMbZjwRjxV1V7TwPJdnhDzmqc18Y1sDLtKlAihEMkOyPFDBH0OtLI53mY01gJ4MyhMF9kip/iYVHxEV+oW6LpKZV1kkNIs/A2FV9JlNTQPP/YszJrVgaxfmX0g+xw+nPzdWIFiPNg3JG9BPkt7VRdBh6wJ0aSSnU9QjUJ/DNhGYDdT3Gz4/qZ98z4dQ3d+Vu7ntj0AKhkaJscYU+51etfq47kjdapKNYPyYny+bYPfj8Ed+GWwjX5NyeDv1XlDxzQRH4VlCDoRES35rJoxCKys1zsFwWTciqcsYmCdTKIgQHCJDAA6th0lwhk80ePJujaJuGldrpxmXG26z8hg6tq3Ih4f8iBOY3+fY+fEvUJkBCxrm++SZIOPk4v/T+KAjRd4iYNq+QAI25wnR1Hav+V4fT4crg4tXUU52ksPuTsxRfw8rlk4yTBkicVmJbJka614H2kma9bkUH8VasLe5krLPfjxwbG/w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4048.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(6506007)(508600001)(6666004)(52116002)(8936002)(66476007)(316002)(4326008)(44832011)(66946007)(5660300002)(36756003)(86362001)(966005)(6486002)(6916009)(8676002)(66556008)(83380400001)(38100700002)(38350700002)(2906002)(186003)(26005)(107886003)(66574015)(2616005)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFU5cER4OGVuZ2NjTzl3OWQvUkx6c1dxeUxNdW02MElaMzUwM3o3Q1hpQXRr?=
 =?utf-8?B?UDdJdUhLUU9qTFNYbU9xcDVWYW0yaFk4bW9qU1N2L0cxdTdhWnJoeVNQYS9p?=
 =?utf-8?B?RS9vLzY3bE0rY3BoSnRJTGdxZ0tNRExsSE5VSytEc0FvNllXSkIzZjcyNG9I?=
 =?utf-8?B?MExWSTk2R3lERVE5WXNidG8vQVM4cCthZ203RThLZFNqQzVFMEZHOENhMjNU?=
 =?utf-8?B?TWxVcFl3RjRKSEFXdXJBUnBiUUlBSzk3RnFVQ3FaR0Nka2xNODZlaE1vclBa?=
 =?utf-8?B?cFJudWpnZGwyclkxc2hsODZzMk44SDcxbE90RXIzUFQ3ZVZCa2g5V01MKzY2?=
 =?utf-8?B?dzZmV2ptaXZZb1pWZzlUcWZ0WnhPSmhJaTZqYm42WjNBYTNIWUduSGhxT2Ey?=
 =?utf-8?B?RUJCUm9sZzZMeElSZmtlSFJVTER3c0tyNUI0NE1HbnE3TE84QTh2RlREVWNH?=
 =?utf-8?B?ckVnaXBxWmNSTVk0bk9MRSthcU1IaDNMOXRnendnQzYvRFp3UnVlNGNJL1lE?=
 =?utf-8?B?ZVVqbm9XVFZSbWw1WUVxUkFzQ3c2TUJQekQyUkZ2Y0RyblYxL1lDbWx0MWdw?=
 =?utf-8?B?L0V6Wm1sbklIUWJZaHBkb2gyOVIrMkFSYUxBcmwya0NOWmxzb1IydjFZcGx4?=
 =?utf-8?B?VXhCUi92WDFoNWFScjFZWUEveDNwT05MRGhob0FFMGxMcnl4eTh4RVV1TDdo?=
 =?utf-8?B?S2ZLTzRVeGxsOE45WmdMNjQ4elFsYXQ1cG1oNkJFdHUwVXo2NHVNK0twMlJR?=
 =?utf-8?B?VERQKzByNkJVL3ZMSStWUkZxSHc0eHdDVGdwMVdzQWxRckdLZkl1SlhmZHcz?=
 =?utf-8?B?MjJWMzVOVXhJSFhWb296L3hlRUlJVU1iZTRQRllzbXNVUFRIbFFhSHJyeHZG?=
 =?utf-8?B?MXJQM0VKMEZEQnB5ZGY1eDRpV0RtZXRoTm1MUlNaNmNCYTdzRlBrd1djZW1l?=
 =?utf-8?B?RDhIUG0wdkpSQUJaaEVRQXJzczI5SlFOU1VFRm0xVTZWbStBWFBaN3NBaDRM?=
 =?utf-8?B?UHNvN1pxcE8vUnlPQlZJaHdTSit6bWpLUEJBek1MdVc2NnloYWhJTTlNTmlD?=
 =?utf-8?B?c0FaSWxPWWhVV3BSei9qNGY5V0c2MjRTMnZmd0J5VDN0SmFlNENoTG5SSkJW?=
 =?utf-8?B?QlZqZXdJRFRpK3BONlF1aTNtL09wUFlMZmtCZ2gra3VYczVpNHJ4cWt4cWo2?=
 =?utf-8?B?SjBKSnVjanMwaUF3d2JBdTZycmxxc2RXVklBeXlvdlNOcytYNTlCNmV2aUhU?=
 =?utf-8?B?Z1BxQVdWRDhHMG9sWFlTeWZFRUp3cjJ3QUgwM2RFdVNvSTRhc0hDZUh5SzFx?=
 =?utf-8?B?YmtJOStheDVhSmFJUlAwb1czMENRZWVVa1FML0d4Q1dWaUtvQitoQ1U3RDQ1?=
 =?utf-8?B?eHdiVzFjckMzOXo4UVRoc1NtaUFXTXJGdDNoQmlrdWJUM1JGMjZyTERTQ1di?=
 =?utf-8?B?a0pZdXJlc2llVERDWTU2Z1dYQTVrcnpDTE1wYUQ4MHFzRFRNNXh2dGIvV3Rk?=
 =?utf-8?B?VjMwL3krYkltQkUrVEdqcFhhaU1HWUhwb3h1NkpTbG5IYURML3hFVlNTdmwx?=
 =?utf-8?B?TFNMcHNGaERKYXkvTTFDd2xZRUMvNWY4SnpPZ2NtL1JsZFg2aEJEV1duM08x?=
 =?utf-8?B?SXZzZTFJT0U2bkRhZUhjcDZoMEZjSWRYaTgvcWtZQjE3M294TXdZQjBDQ0ZP?=
 =?utf-8?B?OStrRlNlaUE5SDBTUTNRT1pWS2FNMU1jazRzY0hhQlBQcjhRQ2xkc2NPdEUv?=
 =?utf-8?B?Z09OdmdTUmZpaDRhVDExdkZoK0tHWVVoejB3UzBKcVhCM2paYkhDMjE4Skkx?=
 =?utf-8?B?bjlCUm9XNkVHL3c3SkYrZWsyVDhUdVp1YU5tSVExMVpQYlVwWTVXUkFjRU8v?=
 =?utf-8?B?TlFlR2dIL29RQVZGamZvWUFVdWxxWVovVG1Ub1hWMXRUVnArelVaM0xCeGJp?=
 =?utf-8?B?S29GOENFVFRBcjVudEcvbG5namRwWStsUmRpWmxEODNWd3pzNFMxYStJczZP?=
 =?utf-8?B?NElqTGRRUGVRQndVb3dWbDZGdjF2VGI2WnVYd2ZSL3VXTlJjUFVueFd1dTBl?=
 =?utf-8?B?UTRJbVprTnl6eUk0ZW9CenRNd25WM0RUL3lPTW9NQmV3N1VRQXNRTEpqaHY0?=
 =?utf-8?B?ai95MFFGWlFTREtxbDFIa1JuMDQvd0VpdWsyK3JzMStkRjdBRElhdWxYbXJB?=
 =?utf-8?B?RUxzWUw4VG9nMTJ5NjVSN2xDeHRNK2VRUExTajdvZDdDZ25mamlVQzdFS2xC?=
 =?utf-8?B?aHhSbzNIbmFBUmE5aW1qVlNuNVlhQUpOUUdRSkVXb1Z3TXZMZWRSZVcydE9Y?=
 =?utf-8?B?WHliK1piRGdZZlM2UVJXVDFvdFVqM0FiMHNXMjVSS080OFQ4UXU4VkJCa2R1?=
 =?utf-8?Q?OQ0ksUxm2cGD8MZA=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b61f8b69-f903-49e8-7202-08da118a06f9
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4048.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 13:42:54.7610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZL1cKQ5GL3B60dwtyMwNBoxBUso5+jXWtk8z06vvTqCLW0MRjPrS4tkqEZbbrQ5HJhz2xxaCqJIqEK26A36/fcRKfoAYNwV4ZohzbhziVBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6193
X-Proofpoint-GUID: WwUPWaoIA8HgBY5hcAfg0sHEo1XVSKgO
X-Proofpoint-ORIG-GUID: WwUPWaoIA8HgBY5hcAfg0sHEo1XVSKgO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-29_05,2022-03-29_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=kshitij.suri@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: soham.ghosh@nutanix.com, peter.maydell@linaro.org, thuth@redhat.com,
 berrange@redhat.com, prerna.saxena@nutanix.com, dgilbert@redhat.com,
 armbru@redhat.com, Kshitij Suri <kshitij.suri@nutanix.com>,
 philippe.mathieu.daude@gmail.com, kraxel@redhat.com,
 prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently screendump only supports PPM format, which is un-compressed and not
standard. Added a "format" parameter to qemu monitor screendump capabilites
to support PNG image capture using libpng. The param was added in QAPI schema
of screendump present in ui.json along with png_save() function which converts
pixman_image to PNG. HMP command equivalent was also modified to support the
feature.

Example usage:
{ "execute": "screendump", "arguments": { "filename": "/tmp/image",
"format":"png" } }

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/718

Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
diff to v2:
  - HMP fixes for png
  - Used enum for image format
  - Fixed descriptions and updated qemu support versions
 hmp-commands.hx    |  11 ++---
 monitor/hmp-cmds.c |  12 +++++-
 qapi/ui.json       |  24 +++++++++--
 ui/console.c       | 101 +++++++++++++++++++++++++++++++++++++++++++--
 4 files changed, 136 insertions(+), 12 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 8476277aa9..19b7cab595 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -244,11 +244,12 @@ ERST
 
     {
         .name       = "screendump",
-        .args_type  = "filename:F,device:s?,head:i?",
-        .params     = "filename [device [head]]",
-        .help       = "save screen from head 'head' of display device 'device' "
-                      "into PPM image 'filename'",
-        .cmd        = hmp_screendump,
+        .args_type  = "filename:F,format:s?,device:s?,head:i?",
+        .params     = "filename [format] [device [head]]",
+        .help       = "save screen from head 'head' of display device 'device'"
+                      "in specified format 'format' as image 'filename'."
+                      "Currently only 'png' and 'ppm' formats are supported.",
+         .cmd        = hmp_screendump,
         .coroutine  = true,
     },
 
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 634968498b..2442bfa989 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1720,9 +1720,19 @@ hmp_screendump(Monitor *mon, const QDict *qdict)
     const char *filename = qdict_get_str(qdict, "filename");
     const char *id = qdict_get_try_str(qdict, "device");
     int64_t head = qdict_get_try_int(qdict, "head", 0);
+    const char *input_format  = qdict_get_try_str(qdict, "format");
     Error *err = NULL;
+    ImageFormat format;
 
-    qmp_screendump(filename, id != NULL, id, id != NULL, head, &err);
+    format = qapi_enum_parse(&ImageFormat_lookup, input_format,
+                              IMAGE_FORMAT_PPM, &err);
+    if (err) {
+        goto end;
+    }
+
+    qmp_screendump(filename, id != NULL, id, id != NULL, head,
+                   input_format != NULL, format, &err);
+end:
     hmp_handle_error(mon, err);
 }
 
diff --git a/qapi/ui.json b/qapi/ui.json
index 664da9e462..24371fce05 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -157,12 +157,27 @@
 ##
 { 'command': 'expire_password', 'boxed': true, 'data': 'ExpirePasswordOptions' }
 
+##
+# @ImageFormat:
+#
+# Supported image format types.
+#
+# @png: PNG format
+#
+# @ppm: PPM format
+#
+# Since: 7.1
+#
+##
+{ 'enum': 'ImageFormat',
+  'data': ['ppm', 'png'] }
+
 ##
 # @screendump:
 #
-# Write a PPM of the VGA screen to a file.
+# Capture the contents of a screen and write it to a file.
 #
-# @filename: the path of a new PPM file to store the image
+# @filename: the path of a new file to store the image
 #
 # @device: ID of the display device that should be dumped. If this parameter
 #          is missing, the primary display will be used. (Since 2.12)
@@ -171,6 +186,8 @@
 #        parameter is missing, head #0 will be used. Also note that the head
 #        can only be specified in conjunction with the device ID. (Since 2.12)
 #
+# @format: image format for screendump is specified. (default: ppm) (Since 7.1)
+#
 # Returns: Nothing on success
 #
 # Since: 0.14
@@ -183,7 +200,8 @@
 #
 ##
 { 'command': 'screendump',
-  'data': {'filename': 'str', '*device': 'str', '*head': 'int'},
+  'data': {'filename': 'str', '*device': 'str', '*head': 'int',
+           '*format': 'ImageFormat'},
   'coroutine': true }
 
 ##
diff --git a/ui/console.c b/ui/console.c
index da434ce1b2..f42f64d556 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -37,6 +37,9 @@
 #include "exec/memory.h"
 #include "io/channel-file.h"
 #include "qom/object.h"
+#ifdef CONFIG_PNG
+#include <png.h>
+#endif
 
 #define DEFAULT_BACKSCROLL 512
 #define CONSOLE_CURSOR_PERIOD 500
@@ -291,6 +294,89 @@ void graphic_hw_invalidate(QemuConsole *con)
     }
 }
 
+#ifdef CONFIG_PNG
+/**
+ * png_save: Take a screenshot as PNG
+ *
+ * Saves screendump as a PNG file
+ *
+ * Returns true for success or false for error.
+ *
+ * @fd: File descriptor for PNG file.
+ * @image: Image data in pixman format.
+ * @errp: Pointer to an error.
+ */
+static bool png_save(int fd, pixman_image_t *image, Error **errp)
+{
+    int width = pixman_image_get_width(image);
+    int height = pixman_image_get_height(image);
+    g_autofree png_struct *png_ptr = NULL;
+    g_autofree png_info *info_ptr = NULL;
+    g_autoptr(pixman_image_t) linebuf =
+                            qemu_pixman_linebuf_create(PIXMAN_a8r8g8b8, width);
+    uint8_t *buf = (uint8_t *)pixman_image_get_data(linebuf);
+    FILE *f = fdopen(fd, "wb");
+    int y;
+    if (!f) {
+        error_setg_errno(errp, errno,
+                         "Failed to create file from file descriptor");
+        return false;
+    }
+
+    png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING, NULL,
+                                      NULL, NULL);
+    if (!png_ptr) {
+        error_setg(errp, "PNG creation failed. Unable to write struct");
+        fclose(f);
+        return false;
+    }
+
+    info_ptr = png_create_info_struct(png_ptr);
+
+    if (!info_ptr) {
+        error_setg(errp, "PNG creation failed. Unable to write info");
+        fclose(f);
+        png_destroy_write_struct(&png_ptr, &info_ptr);
+        return false;
+    }
+
+    png_init_io(png_ptr, f);
+
+    png_set_IHDR(png_ptr, info_ptr, width, height, 8,
+                 PNG_COLOR_TYPE_RGB_ALPHA, PNG_INTERLACE_NONE,
+                 PNG_COMPRESSION_TYPE_BASE, PNG_FILTER_TYPE_BASE);
+
+    png_write_info(png_ptr, info_ptr);
+
+    for (y = 0; y < height; ++y) {
+        qemu_pixman_linebuf_fill(linebuf, image, width, 0, y);
+        png_write_row(png_ptr, buf);
+    }
+    qemu_pixman_image_unref(linebuf);
+
+    png_write_end(png_ptr, NULL);
+
+    png_destroy_write_struct(&png_ptr, &info_ptr);
+
+    if (fclose(f) != 0) {
+        error_setg_errno(errp, errno,
+                         "PNG creation failed. Unable to close file");
+        return false;
+    }
+
+    return true;
+}
+
+#else /* no png support */
+
+static bool png_save(int fd, pixman_image_t *image, Error **errp)
+{
+    error_setg(errp, "Enable PNG support with libpng for screendump");
+    return false;
+}
+
+#endif /* CONFIG_PNG */
+
 static bool ppm_save(int fd, pixman_image_t *image, Error **errp)
 {
     int width = pixman_image_get_width(image);
@@ -329,7 +415,8 @@ static void graphic_hw_update_bh(void *con)
 /* Safety: coroutine-only, concurrent-coroutine safe, main thread only */
 void coroutine_fn
 qmp_screendump(const char *filename, bool has_device, const char *device,
-               bool has_head, int64_t head, Error **errp)
+               bool has_head, int64_t head,
+               bool has_format, ImageFormat format, Error **errp)
 {
     g_autoptr(pixman_image_t) image = NULL;
     QemuConsole *con;
@@ -385,8 +472,16 @@ qmp_screendump(const char *filename, bool has_device, const char *device,
      * yields and releases the BQL. It could produce corrupted dump, but
      * it should be otherwise safe.
      */
-    if (!ppm_save(fd, image, errp)) {
-        qemu_unlink(filename);
+    if (has_format && format == IMAGE_FORMAT_PNG) {
+        /* PNG format specified for screendump */
+        if (!png_save(fd, image, errp)) {
+            qemu_unlink(filename);
+        }
+    } else {
+        /* PPM format specified/default for screendump */
+        if (!ppm_save(fd, image, errp)) {
+            qemu_unlink(filename);
+        }
     }
 }
 
-- 
2.22.3


