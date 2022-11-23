Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEB36362CA
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 16:07:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxrKa-0007Et-ME; Wed, 23 Nov 2022 10:06:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oxrKN-0007B5-Hz
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 10:06:19 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oxrKL-0002Cv-7k
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 10:06:19 -0500
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ANBoKvN001436; Wed, 23 Nov 2022 07:06:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=nSAtRg4O34s9QzGyhzO7+BjRKI+iLtdByHN4B/LMhH0=;
 b=zJmWTXEwMIG95hqmvDBUmsh+kNl424qXLS8PcB7OfUue2CAEhoElk5DeY/zGd7EomA2X
 oK/bbAVM/i9fJeQn9kI0KEsNrnFtEklzvB0Z3HJ2SkJjFEDa9dsfVxRO5l5f9cWt8wLt
 jCHwNhW5ZTr5nGrmg2snDiZlB3bBpSVleg2GOzA9W3zhzyr0u+d9BRDLtr/kPhYwzEgk
 LJ+tYLHyOcxgyhnv3ftqVft1dpJG/qSLA5cmImHcgoSSf3tFZIAOUmo7YaqoK2LZIUwC
 inct1XuG2cqqslzWBcaw8GfRo10OvMWslaUBFDDCRsFFSGKPZmHT8fJNbVih+o3tmBf5 7A== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3kxy3mtef7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Nov 2022 07:06:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YSydZb6OcCF3s/oXWbbFaH3m5EztfBn+iveiE4xbMWMzN4K2vHlaHJoMwfLN6ci1qPNGlV344uoDhQoFn6IkxVK7GEDP30eauFSQaybWca6UnwVSnL2a+3ydMHvTvDfh5UJ5jqE4riU1rLYlBrksfl/kEkhJWhFhkeALKp4sf01NvvldX3ET2mdWsoHKhGQdcRNKWxufM1VUfsxQUt80W+x+2Q1cj7YRa1PtfLN2EH1Vw6xupyCdA40CI8SmVXF6ulmg28wn0ysFfIkD0YRQKPKLZh2Xonir83LUaIyb35cE7yO47u0gghKZM82q0RhySXeSP4QrRbUhB/vU1Sz/jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nSAtRg4O34s9QzGyhzO7+BjRKI+iLtdByHN4B/LMhH0=;
 b=FBs5huZWnzUi8Hb7SZwp8U3GXXGF8cn6wVidMTlFl3V1eSjo4/zMfcjPmEi+5m4kfN0Q6HjagrLqHU/b2oAqtR84l/QWfor94hp3+6uvaLLBubJOmU1vbaQJaBJy98AjRmOPX+fbsZeK8lMIE1h6ca3fk4Xvun0pWZFNtCrIajeJ7ygPkUEYzUbVFYVXLc1NCp74jc53wYz/sU2g0sXMyl1HoXPQ2hXUVP8AAJbJQMz8Y/FmZK6FXAQqBuLX6PVC6do2YTW8TH+nfr4sLCuDpfSMtym9oO5hdTPdFqjMBIivH6B2Ud0Xxa3XgRF5PuJqLGlhx/LQqVApOmd8RWaOyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSAtRg4O34s9QzGyhzO7+BjRKI+iLtdByHN4B/LMhH0=;
 b=TsN/sKmOJhhNDx82kwiPDXUEEtQjc5mrCCXYXALmoidR8pmjXzvkALofx4xx3EUPgG59ICwn89WTb7ER/ruBlEQUsWRzd+rRX3G8W4LYeGtKbqQpf6WwayU+TWcWSEzbMzGV++0to/Uk9fAn6Q8yp7MPMq71IDR5VmQOjaKt4VIhQCRteHj4eH1tyPgK/34k0SXZ+qCnEwawA7+XKBIt1lWYaRMP+CCs9q7DEywF2+y3TtpolCfJdY7NZptNP4NYnhlGkDljbMsqcg1WTIyWJCeXBXmBe0thdxTl+q4qjBUn4EqYv2ypylY5koY8Ehv4eFDCItkEhw5BWJSyYiumPQ==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by CO1PR02MB8667.namprd02.prod.outlook.com (2603:10b6:303:15e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 15:06:12 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66%3]) with mapi id 15.20.5857.017; Wed, 23 Nov 2022
 15:06:11 +0000
From: "manish.mishra" <manish.mishra@nutanix.com>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, peterx@redhat.com, prerna.saxena@nutanix.com,
 quintela@redhat.com, dgilbert@redhat.com, lsoaresp@redhat.com,
 "manish.mishra" <manish.mishra@nutanix.com>
Subject: [PATCH v4 2/2] migration: check magic value for deciding the mapping
 of channels
Date: Wed, 23 Nov 2022 15:05:27 +0000
Message-Id: <20221123150527.24608-3-manish.mishra@nutanix.com>
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
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|CO1PR02MB8667:EE_
X-MS-Office365-Filtering-Correlation-Id: b9ce0304-3345-44a6-3761-08dacd64420f
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6LwHlPTmr6gC6AbhmAEslgiI1D112G99JXrw1gZtNlF8IYDlwqzyUckyy93jCqBcibI98cZ9QmBorGy+Lka0rNhgK1wOiY4Tt/cBoNWXEZ5lZAT6+7AhkYthi1wfFj+5oYRnEFI/U4QETavT7rhKy5icQZL7Mf+uRjxvoYCHCMWokpGd0GKHo6ivU8oMjuKJM83luiSzju3WA+8rb0YewtGCdEqvOGW5GH7cBdbnVxoyx78+6hhj0cmtriFWPsgO1b7EGWhLoFS1rGHRZlJpzngHh50xy9migB929wOeniZdkDXnVpY5rDUqOLoJ73B6i0qk2EDahA5HH82W9UapXyM+lOTSLw0TqqWYrQLb993+Tnyi62IgxzPYSAG6tyCSrXhbKoCu8KsDkX7MJqWikvWvQXWMR6aqjBjXHkEaIB7+ceLYZZ9jpd1UBFitt7MZwiOwmHs54YkKRwdgm/EjmEW/j4eP/fhCyoHI3aYweT861YKbV+DGzoFJzKZ9qGKsCu+gsUWBYIO2LOxwSiVgPjYC9jwilQPNDLt6Cpf5aMd6tjSAr2VmMiJedjjmH1zJSfSKsQCLBrkLJ5huewAyzn/2YlJNPjUxKeJlB1pszbqw8uSias/ugSmbqc1lKjj4XAC/Zzr0MdpnC76EnY22XUh/EgV7U4arh3LNNdbyY4v5jfVJg+RvQo5XmU3o8kSlFbBaig53BoY0Z3sYR/lHIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(366004)(346002)(39860400002)(136003)(396003)(451199015)(36756003)(86362001)(26005)(38100700002)(38350700002)(2616005)(107886003)(186003)(2906002)(6512007)(1076003)(83380400001)(6916009)(8936002)(5660300002)(52116002)(478600001)(6506007)(6666004)(66556008)(41300700001)(8676002)(66476007)(316002)(6486002)(66946007)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUFTYVJOeGNJNXJ4SWRDVWdSdTlVYzZUeUtZamUwQkcwWFFDdDN4MDY3L3hF?=
 =?utf-8?B?WnZTWTNaWVduL0RSNUdyNjJRWGQzTm8wdTY2a3YxancwMW9ZdHlDRnZmb3g4?=
 =?utf-8?B?dGFUQnlsM1JFaXVVU2lOVHd3QnN3QW5NRWJOVW85TVdwRE1mTEJHNnRJNTNa?=
 =?utf-8?B?N0RwaVhBUUtYVlFlK0hDTmU3dC9wYlJSbmMxNitIelpSTTdWSXd2UHRibUho?=
 =?utf-8?B?WVF4U05oVjZWMTJIN3dMSHg5ZHM4N2RiSExGODRMR2ZUejl1aTBLVzd3dDUz?=
 =?utf-8?B?aFI3WEpRWVA5UEoreG1JY2czSTB4djVHZnFhMWFFR1QwcWYvbHF3bU0xSHp0?=
 =?utf-8?B?WEhjOG9VNERJQXBtSE5KeVhlRW1lai9HSndzWWt5YmNlWmJhMGc3cWxzUURj?=
 =?utf-8?B?TzdGUlRDREQzSHd0SzdBU1hGUGhZOUIyNUhZUUx1Wkp0L0ZleEVjdlg1THJG?=
 =?utf-8?B?ZDhnRG1ab1k4Ukx0MzhHZU1aU2czUUx1bEF3NkkwT0g4dzVzU291b0prcCtN?=
 =?utf-8?B?YW9ySSt1eStXTVFHRGpDSDQxK1cwYnpidXdHR2JjTTN6RlBLcFRmYmo3Ylhh?=
 =?utf-8?B?SkNkb2UreW9HcllJbnJBdngwTzNzK24xS0hiVlpwWXpCT2Q4LzZUa0Z6eGxq?=
 =?utf-8?B?c1pWbHFUZHhRdzR6WDBNVGduQWhVbFNOOXkzRjN6OXp1UHBOVjYrSkZoeGYw?=
 =?utf-8?B?SkdacFNTOG50ZXEvSlJxZDZ2OWxIb2Vja25ZWUVwRlZoTTBYN3lHeGhEVzkx?=
 =?utf-8?B?Slo2RWJXUmJoT2xOWGE3NWV3TVlERkR5aks3SWcxZ1hvSFBFL05KSzlSdzB4?=
 =?utf-8?B?QmExZnpybVc0S1RsZURMNm5JTnp5dU14UFBlcGdOR1FWRjl4OXVTTHRYNGl5?=
 =?utf-8?B?alhUUEhldVhhdG1wU21Ea0x2VTZCRWZlc0VqNjdFNG9jUGd2dEV3OGpUZHJO?=
 =?utf-8?B?Sy9mem1wRml1c2hDTnFXMitSU0Z0WVB1cVRjZSt4S2RNZ0NUdW96MlFqM0p6?=
 =?utf-8?B?OHdwLzlWSmVqSDNsMTl1QTk4dHkvTUNmblZCMzV4dlRoc1VtNHhRMWJPa0ZP?=
 =?utf-8?B?R1ovN1lUK1ZLU1FHQnBTdnRnaE0zSExQTThrcndTNjI1TVdyNXd2V0hzbHh0?=
 =?utf-8?B?R1RKMndEVUVOV3FkZTdPeCtQM0RLWGVFdTVSRTFQNFlQS0hUMlBoMXRacjJ5?=
 =?utf-8?B?di93dUNIb2llUWJDTi9IbU9xU3VvcVpNV3d5R0h2eng1Wnk1NC9qUU5xUldw?=
 =?utf-8?B?OUFTK0F2QkdWQ1dmdXFNUklMVCtpWFN6eUpzRGtwZzZaTTlxVkFJYU9LMmRD?=
 =?utf-8?B?Q2w3QzBDNDRTNE1tdzFBMDVYTjlCS2NzOTZVcWkzbjJrT01rWVJUeHVXWmxM?=
 =?utf-8?B?cHhNUkIvOUxpZGUxV09lMUJLTW9HMUpYYjBPTzMyM0syK2wyYUEwbTQ0R0xt?=
 =?utf-8?B?bEN0UitHMlpPb0ZyeXhmSXhmaVlEK2w1Z2JadFhvWk44eVdkajZjRk9ZTW1H?=
 =?utf-8?B?RW5aL1ZHWEhsNjdDcHNUS2w3QW1haTUrSWtiQW1hRU5BT2k0VTdyb3QxSmh0?=
 =?utf-8?B?alJaSVdTbWN3MWd6MGhJcXZOQWN4NmlVTTNMNTM2djUxQVY2Y2l4K2c4TGIv?=
 =?utf-8?B?aDZEbGVmR3VtYnAwQUorSWdlS01qSzN5Rk5xS1FsQ3hFdmN0OEZrb2psdTd1?=
 =?utf-8?B?RUJZV2RnS3NOYk1aeHZvak5YemZtMkZSUXc2VDl6c0g2NGFsaTBkQTBvaW13?=
 =?utf-8?B?ZVhvUzdWR0VpNUQ2RkI5ZFBLY3BOdlRJMWlyTENEcjJwVHRXYnFPN0xQWWkv?=
 =?utf-8?B?ckd2akxqWFhFUmZNbkx1VUV0R05FQzcrb3ZGaWd0ZXI4Q2NyelNtL284Q1FZ?=
 =?utf-8?B?UWNJWVkxWG9DTzhQcGlZMEZMUVFwcHREM3FveStaWk1qbldNWnZLRW5xb1NW?=
 =?utf-8?B?NnhuRWl3Y1FyOTNtMjNqT0txK08rMkVCUmx0eUF0TTVkamNnWm10TGFGTFgr?=
 =?utf-8?B?MXh4NkdWZ0t5RGVjUy9tQThURVNZRDNKRDJGcGhEbXlTcTFaL2JseENGVGUw?=
 =?utf-8?B?Zjd4emlUZmV6TlhIZllPd0RySHY2b3UyMmRWT2JMdmh1UlI4UjBtYi9xbmda?=
 =?utf-8?B?VElnWXdPYzIxdnU2UWErRDJEYWMvTTJGMU5BLytVSEloL29MWGRRWmtCRlgv?=
 =?utf-8?B?NkE9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9ce0304-3345-44a6-3761-08dacd64420f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 15:06:11.6625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HDj48zqt9jx80V/3yqiftKbolnd7x82BZGYFFGz+r8r4a0JXHT1E7zCGTnrUMtuQ18XgMcQCXyV4o4qw/oZAr1sO7ETB9Yoq9zYERH/ZWxg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR02MB8667
X-Proofpoint-GUID: AH_prMd5K3qMgzMF3bDkLK89sQKxPrpo
X-Proofpoint-ORIG-GUID: AH_prMd5K3qMgzMF3bDkLK89sQKxPrpo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-23_08,2022-11-23_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=manish.mishra@nutanix.com; helo=mx0a-002c1b01.pphosted.com
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

Current logic assumes that channel connections on the destination side are
always established in the same order as the source and the first one will
always be the main channel followed by the multifid or post-copy
preemption channel. This may not be always true, as even if a channel has a
connection established on the source side it can be in the pending state on
the destination side and a newer connection can be established first.
Basically causing out of order mapping of channels on the destination side.
Currently, all channels except post-copy preempt send a magic number, this
patch uses that magic number to decide the type of channel. This logic is
applicable only for precopy(multifd) live migration, as mentioned, the
post-copy preempt channel does not send any magic number. Also, tls live
migrations already does tls handshake before creating other channels, so
this issue is not possible with tls, hence this logic is avoided for tls
live migrations. This patch uses read peek to check the magic number of
channels so that current data/control stream management remains
un-effected.

Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.co
Suggested-by: Daniel P. Berrangé <berrange@redhat.com
Signed-off-by: manish.mishra <manish.mishra@nutanix.com>
---
 migration/channel.c      | 46 ++++++++++++++++++++++++++++++++++++++++
 migration/channel.h      |  5 +++++
 migration/migration.c    | 45 ++++++++++++++++++++++++++++-----------
 migration/multifd.c      | 12 ++++-------
 migration/multifd.h      |  2 +-
 migration/postcopy-ram.c |  5 +----
 migration/postcopy-ram.h |  2 +-
 7 files changed, 91 insertions(+), 26 deletions(-)

diff --git a/migration/channel.c b/migration/channel.c
index 1b0815039f..a4600f52c5 100644
--- a/migration/channel.c
+++ b/migration/channel.c
@@ -92,3 +92,49 @@ void migration_channel_connect(MigrationState *s,
     migrate_fd_connect(s, error);
     error_free(error);
 }
+
+
+/**
+ * @migration_channel_read_peek - Read from the peek of migration channel,
+ *    without actually removing it from channel buffer.
+ *
+ * @ioc: the channel object
+ * @buf: the memory region to read data into
+ * @buflen: the number of bytes to read in @buf
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Returns 0 if successful, returns -1 and sets @errp if fails.
+ */
+int migration_channel_read_peek(QIOChannel *ioc,
+                                const char *buf,
+                                const size_t buflen,
+                                Error **errp)
+{
+   ssize_t len = 0;
+   struct iovec iov = { .iov_base = (char *)buf, .iov_len = buflen };
+
+   while (len < buflen) {
+       len = qio_channel_readv_full(ioc, &iov, 1, NULL,
+                                    NULL, QIO_CHANNEL_READ_FLAG_MSG_PEEK, errp);
+
+       if (len == QIO_CHANNEL_ERR_BLOCK) {
+            if (qemu_in_coroutine()) {
+                /* 1ms sleep. */
+                qemu_co_sleep_ns(QEMU_CLOCK_REALTIME, 1000000);
+            } else {
+                qio_channel_wait(ioc, G_IO_IN);
+            }
+            continue;
+       }
+       if (len == 0) {
+           error_setg(errp,
+                      "Unexpected end-of-file on channel");
+           return -1;
+       }
+       if (len < 0) {
+           return -1;
+       }
+   }
+
+   return 0;
+}
diff --git a/migration/channel.h b/migration/channel.h
index 67a461c28a..5bdb8208a7 100644
--- a/migration/channel.h
+++ b/migration/channel.h
@@ -24,4 +24,9 @@ void migration_channel_connect(MigrationState *s,
                                QIOChannel *ioc,
                                const char *hostname,
                                Error *error_in);
+
+int migration_channel_read_peek(QIOChannel *ioc,
+                                const char *buf,
+                                const size_t buflen,
+                                Error **errp);
 #endif
diff --git a/migration/migration.c b/migration/migration.c
index f485eea5fb..8509f20a80 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -31,6 +31,7 @@
 #include "migration.h"
 #include "savevm.h"
 #include "qemu-file.h"
+#include "channel.h"
 #include "migration/vmstate.h"
 #include "block/block.h"
 #include "qapi/error.h"
@@ -733,31 +734,51 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
     Error *local_err = NULL;
-    bool start_migration;
     QEMUFile *f;
+    bool default_channel = true;
+    uint32_t channel_magic = 0;
+    int ret = 0;
 
-    if (!mis->from_src_file) {
-        /* The first connection (multifd may have multiple) */
+    if (migrate_use_multifd() && !migrate_postcopy_ram() &&
+        qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_READ_MSG_PEEK)) {
+        /*
+         * With multiple channels, it is possible that we receive channels
+         * out of order on destination side, causing incorrect mapping of
+         * source channels on destination side. Check channel MAGIC to
+         * decide type of channel. Please note this is best effort, postcopy
+         * preempt channel does not send any magic number so avoid it for
+         * postcopy live migration. Also tls live migration already does
+         * tls handshake while initializing main channel so with tls this
+         * issue is not possible.
+         */
+        ret = migration_channel_read_peek(ioc, (void *)&channel_magic,
+                                          sizeof(channel_magic), &local_err);
+
+        if (ret != 0) {
+            error_propagate(errp, local_err);
+            return;
+        }
+
+        default_channel = (channel_magic == cpu_to_be32(QEMU_VM_FILE_MAGIC));
+    } else {
+        default_channel = !mis->from_src_file;
+    }
+
+    if (default_channel) {
         f = qemu_file_new_input(ioc);
 
         if (!migration_incoming_setup(f, errp)) {
             return;
         }
-
-        /*
-         * Common migration only needs one channel, so we can start
-         * right now.  Some features need more than one channel, we wait.
-         */
-        start_migration = !migration_needs_multiple_sockets();
     } else {
         /* Multiple connections */
         assert(migration_needs_multiple_sockets());
         if (migrate_use_multifd()) {
-            start_migration = multifd_recv_new_channel(ioc, &local_err);
+            multifd_recv_new_channel(ioc, &local_err);
         } else {
             assert(migrate_postcopy_preempt());
             f = qemu_file_new_input(ioc);
-            start_migration = postcopy_preempt_new_channel(mis, f);
+            postcopy_preempt_new_channel(mis, f);
         }
         if (local_err) {
             error_propagate(errp, local_err);
@@ -765,7 +786,7 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
         }
     }
 
-    if (start_migration) {
+    if (migration_has_all_channels()) {
         /* If it's a recovery, we're done */
         if (postcopy_try_recover()) {
             return;
diff --git a/migration/multifd.c b/migration/multifd.c
index 509bbbe3bf..b54b6e7528 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -1228,11 +1228,9 @@ bool multifd_recv_all_channels_created(void)
 
 /*
  * Try to receive all multifd channels to get ready for the migration.
- * - Return true and do not set @errp when correctly receiving all channels;
- * - Return false and do not set @errp when correctly receiving the current one;
- * - Return false and set @errp when failing to receive the current channel.
+ * Sets @errp when failing to receive the current channel.
  */
-bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
+void multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
 {
     MultiFDRecvParams *p;
     Error *local_err = NULL;
@@ -1245,7 +1243,7 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
                                 "failed to receive packet"
                                 " via multifd channel %d: ",
                                 qatomic_read(&multifd_recv_state->count));
-        return false;
+        return;
     }
     trace_multifd_recv_new_channel(id);
 
@@ -1255,7 +1253,7 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
                    id);
         multifd_recv_terminate_threads(local_err);
         error_propagate(errp, local_err);
-        return false;
+        return;
     }
     p->c = ioc;
     object_ref(OBJECT(ioc));
@@ -1266,6 +1264,4 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
     qemu_thread_create(&p->thread, p->name, multifd_recv_thread, p,
                        QEMU_THREAD_JOINABLE);
     qatomic_inc(&multifd_recv_state->count);
-    return qatomic_read(&multifd_recv_state->count) ==
-           migrate_multifd_channels();
 }
diff --git a/migration/multifd.h b/migration/multifd.h
index 519f498643..913e4ba274 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -18,7 +18,7 @@ void multifd_save_cleanup(void);
 int multifd_load_setup(Error **errp);
 int multifd_load_cleanup(Error **errp);
 bool multifd_recv_all_channels_created(void);
-bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
+void multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
 void multifd_recv_sync_main(void);
 int multifd_send_sync_main(QEMUFile *f);
 int multifd_queue_page(QEMUFile *f, RAMBlock *block, ram_addr_t offset);
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index b9a37ef255..f84f783ab4 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1539,7 +1539,7 @@ void postcopy_unregister_shared_ufd(struct PostCopyFD *pcfd)
     }
 }
 
-bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
+void postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
 {
     /*
      * The new loading channel has its own threads, so it needs to be
@@ -1548,9 +1548,6 @@ bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
     qemu_file_set_blocking(file, true);
     mis->postcopy_qemufile_dst = file;
     trace_postcopy_preempt_new_channel();
-
-    /* Start the migration immediately */
-    return true;
 }
 
 /*
diff --git a/migration/postcopy-ram.h b/migration/postcopy-ram.h
index 6147bf7d1d..25881c4127 100644
--- a/migration/postcopy-ram.h
+++ b/migration/postcopy-ram.h
@@ -190,7 +190,7 @@ enum PostcopyChannels {
     RAM_CHANNEL_MAX,
 };
 
-bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
+void postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
 int postcopy_preempt_setup(MigrationState *s, Error **errp);
 int postcopy_preempt_wait_channel(MigrationState *s);
 
-- 
2.22.3


