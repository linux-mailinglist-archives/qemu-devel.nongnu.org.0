Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 767483D56BA
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 11:40:30 +0200 (CEST)
Received: from localhost ([::1]:34970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7x65-0000Tp-9D
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 05:40:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1m7x4I-0007O5-Tz; Mon, 26 Jul 2021 05:38:38 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:26906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1m7x4H-0003S7-3I; Mon, 26 Jul 2021 05:38:38 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16Q9WcY0025097; Mon, 26 Jul 2021 09:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=JAibxaMeFePYNJJb/0VIsPt4/Udd7jR2JIu6T07GATo=;
 b=y7oji971H5nyCBPxNFOmlMVXxNVUC2DxymQLgr+G27XznMgJmCZZ0QkYaqSEeHfcDOhY
 LNiOdquji/D6JykVEKmk3v8dFD+O3cNE6TmDYByA05qIwC/yztffwI98yY9WklczcnRD
 N7ZMS49SvHVMxszmE5A3Tqq+XCdRco4W1joHmjxxDqsBoTidETRUoJz1lPZnEw9/3Fow
 Xd2cR6HZEPfQJb+rsK2wuvFlhHzK2latFTLb8uwrN5VU11sZz/jIddB1MyfWiUnjYzxZ
 oyFl+pJGHqlz4wIZMAewaAkX3V7uCcxSs9K7ZG035S64FJDJiJwMtQdCKjjU4XimOWSz qg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=JAibxaMeFePYNJJb/0VIsPt4/Udd7jR2JIu6T07GATo=;
 b=in8gfdhvclzIcX99NooGXWCq9upinr6yica3GNn8OQ6aNP2nOK2QWfFFhqepvIB71ncC
 8vFOV8WV2ezXCgswJNmrui5fUH1j4FUsLj7wziNnoxbwCne/mCblTqCDup5rYRfXz/Xu
 kJLew5Uf6AoJ+bSBlCAp2CZjH9bFQsNj5hragu1T6ulxB6oVpBv9v0CwVryI7TavPoy4
 xXhjO5ChuBfeD+PVmT8UuSvQslfqXuYFOSTQMIJLKwFveYYbN0HMCvzSv5/ylESjERLN
 XUqTbq+46vu382DRnjtp/vzkSaKn+jVo4lLrOA8nAM2tR9jLAOc0hizwKlnShLQ3Y7yf pw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a1cmb10gr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Jul 2021 09:38:29 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16Q9UwNx035888;
 Mon, 26 Jul 2021 09:38:28 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
 by userp3020.oracle.com with ESMTP id 3a0vmsm74f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Jul 2021 09:38:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D8eHhyqOMiGURuun6kPE9RLA2X2Qmc5xSq8JiP2Il+luBo45xzx/rl419NTp+bydL9Z4R/jmHJfSllO6uBLNUCtAfKu7Nu0qIQ9IzO0Y4NzcSzU9z3Hx+WBw8f1VxAWw+gfJIw9Wsv+XjfkfAzoUw0I7Gc6Myoq/n3TbmVoLmaWyg4wrzxi4F2eCV7uO0Blwa0wbQYNb+QliBtlRkID4/N2a1KeOCuhZIDHwsnlX+vMn7w40Dq4hdwTtUU6xW5IdoCS4/QSotKi3Uu0sf22BzHsQzaEX54B7hg4fQVMQxfY/oVcHTgJw/DcPPX6DGoO9JtR4sMCcOoNd9EGxnSNn1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JAibxaMeFePYNJJb/0VIsPt4/Udd7jR2JIu6T07GATo=;
 b=b2hdhgqcxEblNmS3jGoWSnIP7gv9bzScnXYA7DTEwh2G8XosU+p8IoLyOrZwwWfAPC+zigMLGrDFtismRCeQjWEgUVaFgLvHCgC+7sgx8cah2q0XaLZAeAuWgS+TA5TCBV3m+07V+WaW5c74H5cnCXvCqRdtTmH7uOP3RVEAASouzmLRU/wi8e1UPajqtqqPYm+ox5Z/bde6gvGE0y+9ZatGvCZAV1xksKvFjsGLg3HZ7DP1wsEQmU8NI/2Vx+6Kl4bm2Ei3GUQfSD0lQy8XbZXMM2RFnk+9rPnI/dDQYTRWyw1R28fMrF+CBcwqH5dYVOTKKadXPDS89ko5kgUhGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JAibxaMeFePYNJJb/0VIsPt4/Udd7jR2JIu6T07GATo=;
 b=KWTlMEjMx4I+fZSj7Hu7TKV8rpXfPJA0rKkmmn09OcCSlHwCpG43e7n6/EUqjuN91SCuoPqiAJURzstpsoAZ1N+PjNGuFcvmQmLKVfMl52DGY7sqDVdkxdFMRdULUv2RqPZ+UIDAaV/mf4SkfDNFr7yrd13KnYUDjMMLZNE2GvM=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4551.namprd10.prod.outlook.com (2603:10b6:510:38::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Mon, 26 Jul
 2021 09:38:26 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c0ec:e3aa:9d8f:61c0]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c0ec:e3aa:9d8f:61c0%7]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 09:38:26 +0000
Subject: Re: [PATCH v6 6/6] hmp: add virtio commands
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
References: <1626086137-16292-1-git-send-email-jonah.palmer@oracle.com>
 <1626086137-16292-7-git-send-email-jonah.palmer@oracle.com>
 <a92fd4c4-73cc-3b6b-89fa-b5ae35304a2d@redhat.com>
 <5fb48b8e-4380-45b5-2057-97d0e72dcf54@oracle.com>
 <d0ef30f7-518a-1e16-489c-c85889a3b9e2@redhat.com>
From: Jonah Palmer <jonah.palmer@oracle.com>
Message-ID: <219acf01-e2bb-7498-fade-a1eaead46522@oracle.com>
Date: Mon, 26 Jul 2021 05:38:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <d0ef30f7-518a-1e16-489c-c85889a3b9e2@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: BL1PR13CA0355.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::30) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jonpalme-lnx.us.oracle.com (209.17.40.39) by
 BL1PR13CA0355.namprd13.prod.outlook.com (2603:10b6:208:2c6::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.11 via Frontend
 Transport; Mon, 26 Jul 2021 09:38:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38c65076-c1bd-41e1-cc2e-08d950191dfd
X-MS-TrafficTypeDiagnostic: PH0PR10MB4551:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB4551AD5C98A95E4B0E380E85E8E89@PH0PR10MB4551.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6FQpJ6l87VikExsPQpp8NORn28z2oMtkA3ZoD8Hk0Y05Y2lUzyhw/YYB/NkD/cmgT2Z7ozCi+W2Zqf3tR/hyGWtj2TJGbhW9UoBcejkOd+eRl7DCQvoqHVNhFqu/onQHNaCrAE/TxWrS0f0QmGtMeK07yLdR5K8DvhhEp4GIXNHasEpsL/758BVipRpWMgMV6mdJvlXEZDjLTE+CFw50twX21a53EQ0uAFc6SWG+OWd2ENxDHTECb9NdAu2d48TwaVBVRKIr5eKV0UpJxmmHQ4AKFLiokLErGjY05pA+A2t0eEG4P8IcMmg/O6EgCTYxRt0Cm5jG99x+pHmjxhS1kg9yk3hw/OfT0myvMvancsMeb+TmBoUhUrfu5ZVQ2yx+qHrH0sOq79xl7Ip5re9Pmtx5vwxVD+5+xpMzFdh2MFmfH8msH/JUWILqsjgLIdfcYT121QRavS/D9J3Nz6maLnW3sOhm7YGXFSpdmwZPB+fZ0Bi79c9QAYbrPyiTwwVPWj8cg3WYcmLzUUGVWURa+oymS3XOBIOeLvxgUQXYLMB3Ka6ESxbcJcaHzTD9ds1u/1lZRBSg66yyOb0x8fWGFO+Ny7p4zEOWD4BWqB6OQlDRMdq08Dpr31a9ZlhWKwZTfObXbfkzS2UtUDvGIsyICNIyQ5gfgpoH4XLbI1j2SD+FM6lqoV7Cb/vbtbtGPVKix13iuhVM7tlQ+ndZc6YQV6tYbsyR9XYbjiYwDmVbZyw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(136003)(346002)(396003)(366004)(376002)(8676002)(2906002)(26005)(6486002)(66946007)(478600001)(7416002)(44832011)(5660300002)(38100700002)(956004)(86362001)(8936002)(186003)(66556008)(66476007)(2616005)(316002)(4326008)(31696002)(53546011)(107886003)(36756003)(31686004)(7696005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXBRbFRJcHNEdkIwV0JBZ3JqTWhBTGt6QmFEQk9LRG5iMHh2S2FpcUM0dUdC?=
 =?utf-8?B?R3JrclZPdHZ2RDBrbXZTelZRMEkxQmZZblFyOGZHdzU5aDR2S3hSb3NDazd5?=
 =?utf-8?B?bi9NUFpmM1hyZU80WEF1UlhIZ0wrb0w0VHNiamRZWFluUWRSSnhlc2Iza0hI?=
 =?utf-8?B?aHRlekthMXdocTdFKzA4T09jdUtZQStvWUhyZ3NyWnJWeFNpcVd5NWVUUTVV?=
 =?utf-8?B?VVl3QXg0THQzeWlSWDhQdEVPNm1wSUNaWG5YMk1Eb1RoUDJZVndBdGtYREhn?=
 =?utf-8?B?aEtPUjRDN0IxcW9kQnhYSi9CaDJiajBDMFI2cWpGMnVRUCtJOEVRQTJWVXNB?=
 =?utf-8?B?L3lWZXFyaFRKYVZESnRMV09raEQ3ektWWUk3UXJtSnJGUzhZTTV4czVqZDhZ?=
 =?utf-8?B?eGtsMmh3dFE4VFY1MDNOU0ppbXlvTC9ta2Zvb1UwTGFTVWFGcFhjajNLTE1D?=
 =?utf-8?B?OUd3bzBndndOQzk0cEQrRkVrYUtVdXQ3V2dRc1k0UHl2U01qQkQ0SFBPUlhj?=
 =?utf-8?B?VDhxM2VQUWE3bldtbDgycVJRNERickZHWXNUMSt2a0NPSmtEbUZUV3VqdzNK?=
 =?utf-8?B?Q1R4ZmRaSmlEMTBwRUJsaDBqZ0hHVWE3MGlOWXVWc2VBNnEvRzBETWlVVFov?=
 =?utf-8?B?Qjltd3hFYTQzQWdGK0VNNDNmS3RCN0JjZGxvekhhSWNFL1NFNGRGWHVoZ25l?=
 =?utf-8?B?T3JuSE8xempEcVJnYXQ3bUNCYk1BSmI1cUdtTHVlWmVvRlVzY25LSXJrb2ZB?=
 =?utf-8?B?Q3phTElpaEc2ZFJ1eERBS1p0U29yNGk5Q2dKcTdXZk1rN2NMWTlDeUpGT2Zu?=
 =?utf-8?B?U2FYcGE5ZHQxY3B5Y3lNU1hXaUt6bzdsbElrMHVmMjlDcUNYbFdoSHpZdm9I?=
 =?utf-8?B?V1NaNW0vU2llbGNxSkY2elZFVTZXcmphbHd6NXFoT2lWVm52V1J1dEZ4OHFC?=
 =?utf-8?B?dk92SFVmM1F4dzJMVkpzQ1RJYkg4WlBFdjNGNEgzdGZjWHlsSXMzbjl2MkRX?=
 =?utf-8?B?MURzdFNQSkhUeVl4M3pWVXdBd0xTa3BIYnZWTFRIK3dLZjVZS0F3RG5GeWNU?=
 =?utf-8?B?eXpOM1o0Vko1bHp0OXYySGluY1RjZjNESzNVdmhXcGRBTStwNmhpN2tFZGNx?=
 =?utf-8?B?NFdSRW15bGNmUWJLNFZ2bndiQndFZzJ3a0dDLzVuUkNYbXBVL2x3WkRIM0JG?=
 =?utf-8?B?b3NNczVkMHQrc3Q2Vi8vS2krcVN0MHF4bkxUZ2ZYKzBZbDE3bjJwRlpvaEdE?=
 =?utf-8?B?QTRJWWZHRmlIYzFadTNTeUY1WXZzYWtGMmJaSFg0UHNLK2tnV0tzTTI4dDJz?=
 =?utf-8?B?NUxhaHhUUTVJakpnMFJUL3JDNlZmanJUdUljaHZhYmtJZDZTWS9hUW1VWC8z?=
 =?utf-8?B?YUd4YUVJTEVWcEtOenhiOGFEOHJxKzUwazdJN0UwV3A3aVZ5VWU1L0VXeFFl?=
 =?utf-8?B?R3N0WlFWR0s4YXI3bjRIRWpjc2ltUlZSMmw5OXloU200V0U3MG9VS1FqUldH?=
 =?utf-8?B?bHpsMHB1eEM5a2gzTFdraXdFSjJValdwb2dWRjV3M1lWVlpNMERPZGdINm5a?=
 =?utf-8?B?dVZqNGlnbi9tMi9GZ3I1d29RZWZ0WGNHa09ETXBibTgxTUJNbjJrMUxYWk04?=
 =?utf-8?B?MXozUndiaEI0SWZ6SnoxdEpwMmZ3TkI5WloyOXBpSFVBRXpnWjFiME92eE9h?=
 =?utf-8?B?WnlxR0w3OHQ4OXhPc1pHUFFoWGdNTmpLY044cCtORXM2VWI4RWE4eldnMmhr?=
 =?utf-8?Q?P9BBzqNnnkrmGCuOsZEdrStlTlQzAMo+AHCLHGN?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c65076-c1bd-41e1-cc2e-08d950191dfd
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2021 09:38:25.9263 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wh3DOJSoIdWeIVLxTC8oMuFcORic8yhLtYATBJGacQm89IV6xCF3LgRvjq2UhRTxV7qQ+nqbJewGBW4LJSMJRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4551
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10056
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107260054
X-Proofpoint-GUID: bhBfBSMHEO1MUGCfVU3uZSwKxwWkzrTp
X-Proofpoint-ORIG-GUID: bhBfBSMHEO1MUGCfVU3uZSwKxwWkzrTp
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.091, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_BL=0.01, RCVD_IN_MSPIKE_L3=0.9, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, thuth@redhat.com, qemu-block@nongnu.org,
 mst@redhat.com, michael.roth@amd.com, david@redhat.com, armbru@redhat.com,
 amit@kernel.org, dgilbert@redhat.com, eric.auger@redhat.com,
 dmitrii.stepanov@cloud.ionos.com, kraxel@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, si-wei.liu@oracle.com, marcandre.lureau@redhat.com,
 joao.m.martins@oracle.com, mreitz@redhat.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 7/22/21 5:18 AM, Jason Wang wrote:
>
> 在 2021/7/21 下午5:11, Jonah Palmer 写道:
>>
>>
>> On 7/13/21 10:40 PM, Jason Wang wrote:
>>>
>>> 在 2021/7/12 下午6:35, Jonah Palmer 写道:
>>>> +void hmp_virtio_queue_status(Monitor *mon, const QDict *qdict)
>>>> +{
>>>> +    Error *err = NULL;
>>>> +    const char *path = qdict_get_try_str(qdict, "path");
>>>> +    int queue = qdict_get_int(qdict, "queue");
>>>> +    VirtQueueStatus *s = qmp_x_debug_virtio_queue_status(path, 
>>>> queue, &err);
>>>> +
>>>> +    if (err != NULL) {
>>>> +        hmp_handle_error(mon, err);
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    monitor_printf(mon, "%s:\n", path);
>>>> +    monitor_printf(mon, "  device_type:          %s\n",
>>>> +                   VirtioType_str(s->device_type));
>>>> +    monitor_printf(mon, "  index:                %d\n", 
>>>> s->queue_index);
>>>> +    monitor_printf(mon, "  inuse:                %d\n", s->inuse);
>>>> +    monitor_printf(mon, "  last_avail_idx:       %d (%"PRId64" %% 
>>>> %"PRId64")\n",
>>>> +                   s->last_avail_idx, s->last_avail_idx % 
>>>> s->vring_num,
>>>> +                   s->vring_num);
>>>> +    monitor_printf(mon, "  shadow_avail_idx:     %d (%"PRId64" %% 
>>>> %"PRId64")\n",
>>>> +                   s->shadow_avail_idx, s->shadow_avail_idx % 
>>>> s->vring_num,
>>>> +                   s->vring_num);
>>>> +    monitor_printf(mon, "  used_idx:             %d (%"PRId64" %% 
>>>> %"PRId64")\n",
>>>> +                   s->used_idx, s->used_idx % s->vring_num, 
>>>> s->vring_num);
>>>
>>>
>>> The modular information is not the case of packed ring where the 
>>> queue size does not have to be a power of 2.
>> Doesn't modulo work for any integer, regardless if it's a power of 2 
>> or not? Could you clarify this for me?
>
>
> For packed ring, the index doesn't increase freely, it's always small 
> than the virtqueue size.
>
> So showing the modulo arithmetic seems useless since the device or 
> driver doesn't use modulo for calculating the real offset.
>
> Thanks

I see, got it. Thank you for the explanation.

I should be able to easily determine a packed or split ring via. 
virtio_vdev_has_feature(vq->vdev, VIRTIO_F_RING_PACKED).


Jonah

>
>
>>
>> Thank you,
>

