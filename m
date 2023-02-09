Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA30690B02
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 14:55:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ7OQ-00031j-6M; Thu, 09 Feb 2023 08:55:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQ7OI-00031M-Ms
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 08:55:11 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQ7OE-000602-OW
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 08:55:10 -0500
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 319Cft1e009789; Thu, 9 Feb 2023 05:55:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=proofpoint20171006;
 bh=5WzdNT7zyqbwgkXR2l3PQBmu0V7D8aO/LVSWuRVrQ7M=;
 b=LyswJBMi3f3iEeeEgzvRgdJ50Cbd4Ll73l80cELB9MoYgeXJzPUKNCevmVeUoqb8vlv9
 CaY7QkMuaygzUZRHvYW2ybbIbRuHDq6SfblPjMRWB0PRb7x4F0L4RPhibROUDp13W7XU
 2y7vW5LxMcz7qD4/1FA7POXtUfKcTbpRMnzP0BoveM3oln6zpu8wPLFCGAnNHgdR+f5a
 FrvOdQSHj6fkDuCSQsM1uDAxtmZwHsmGUaJWNFy9kp43A5gyYWQG8uScDn8P+nonndTl
 UfjIBPbAQ9E/+rpldIow8IvyJzbZDtF9aNrmRCjmzsMFbhB1EDs59bGSEfKKt9nbBBmb Sw== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2047.outbound.protection.outlook.com [104.47.57.47])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3nhqanqpar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Feb 2023 05:55:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EG3kp1CPs4f3kkDZgOHwn7aTID/k/4ukcoX4pBh/DLVcVcbsZRHqZspClAAmOiQOVJi9yg2mmvRFuXhyTsRMW9Adw+dsP/J6eXLN0hGwLPW9XjHM3HfNtLfOSn+5UE85noCNYdIV0wyXxr93OB4cec6fTtx8uCNayodZGZz+IYZ3W9tPzsnkgKdwRiLGJOlk5w5P7wNRFh9lzJJ1m4f+IR1NYD5iLAicinj2/BVjW6+FX9uu0xSQJeoqWjmZ2HWi9+AvS+0z9d6XcjKx5p05OmNCuU9hyX4rYgPHfxcCwNY5vukMFItYXKvPV1VIhQnoD10QEp6j4dszEPSbVP/uiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WzdNT7zyqbwgkXR2l3PQBmu0V7D8aO/LVSWuRVrQ7M=;
 b=dS2rTmH5aR0TZ9+p3Dv2mAbGpCb98YirW8cjVNa8w5J65NSeCprjrJ4642TDm5Q73P4w9xDO25QnulG9onp7xiq8im5tPR9C60uCfaO2KKkHBrorWqehkJktxdFuqe82uFZe3EvmRHGejt8DaZiPEIeXTpgpvf9gnhNDr2pRPEea4IgRa54/VMKpc3VgIX2pZw7TzAJlox0JX+x+rwzFZ9s7eUFEXgtEyxQdzVP21xxU47QqhaJrqsTjyNdWnGe+ia+5o6+Aj+6lzWjWX4TfPkpDna54qvyEMr8E/rHDJlFUrsnU5jNQZPm6U5/waCKJnsHsWzBNjEN/YUdFWE3pCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WzdNT7zyqbwgkXR2l3PQBmu0V7D8aO/LVSWuRVrQ7M=;
 b=ZKc8xcpPIa/DwTALt9PNblBxmbEnoPWCEtwhbc3M4qgeLNSeBvCdZi7sJfYp7AZPmipv6B5DRxrQYyhQq0aaM9AaknfOMkHiPNkSm41PvQC5Xjbs0IrGYXqx3d8013ImnsmpAO0AV3i8WqK1hO5duwb9fNzfejg95z0oTCzL8p81AO35vQ9D+jfa6mq/167mbAI5EXCaQZbBXEkKQGqVGf17LBPJN8xNAmOwBAu21HIXF3sAPnnU7LwzBmBHbkFDk0AAh3DOfpBSnFjc1KCFFAdAzeh5jO7UdjEyRtdH+mjrWxeCcs+BxkC9lCk5i/dKhYXFJpdsJobFIbFGfo+zLg==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by DM6PR02MB6479.namprd02.prod.outlook.com (2603:10b6:5:20e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Thu, 9 Feb
 2023 13:55:00 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%3]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 13:55:00 +0000
Content-Type: multipart/alternative;
 boundary="------------pH1SdQfV3W6ayJLoZFl60bpY"
Message-ID: <fbc3dc05-181b-9a13-1707-a42227eb0824@nutanix.com>
Date: Thu, 9 Feb 2023 19:24:48 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 4/6] migration: Avoid multiple parsing of uri in
 migration code flow
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
References: <20230208093600.242665-1-het.gala@nutanix.com>
 <20230208093600.242665-5-het.gala@nutanix.com> <Y+TicReIdgA9P6q3@redhat.com>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <Y+TicReIdgA9P6q3@redhat.com>
X-ClientProxiedBy: MA0PR01CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::10) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|DM6PR02MB6479:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ce2fa77-08b5-4110-7119-08db0aa53c71
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3JHu++RCgmoIkCz1Cx2QrQBse/a51zmMWUEcKQYYjXYGr8Mj5rSN03pLCjnZlGlYDCvXNF/AQ0PanHF4BK9okNSKvrzqd5ABetLmqHnGCX2yWN/Ltw4l/lFcjNzXd9Es9Y4WOZu2GMsy65UIJya75hYiXb9Rfpx6dmsb2ThVq+Ql/3gkbY9U12g1dYMWaPd0XKL6iwoWDdoRBR/jFatCJH4WchTdSVWwJ4hmjer5Wrhxlihe3ciWCIfNlVGVLy7c7M8ZhtbyiE3igIixxI18FQPqXepTvfvOp0AGAJuBKE2k4UaMnC1BfojSKWJh5wb0dTZTgfWOC1/oC6+J6Nc3x1PJBzSjVhcRIcNmESe1YuAlhptMPzNznLG3uIqpvGpk09kgNaxbvMekabifI5WitRqFdCuVSFTAa/zKS4Pg5Cp/JZk+DY4IRO4GZUp6aByee/7dU78W2+pmknTFjnwRvAvCADpipmXe5WmyviT/La8gvFcKOiw89wH6VebQgvtvSWc70ZAxPZjx2utAkM0LyeAhmO5hupRlhSvI6QsSF94XbqV9CQOswk3TmBHt7H9uBTyPIyra6zXFi5+mHWUchJ0W7J0pcIkQi3ZJ/YYy3DUQ//w7P+pfK+78LpuxiIMb2IMWAljrLkpTH9Hsi/wYbxZQwAFMUfc4XG0OTXZRoUcp0ixZASp8VXIDD9JzdVRNPRugyeGD2z6NyrS5abVTo4Q0FvPof6Z39rR8btdUHL4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(396003)(136003)(39860400002)(346002)(376002)(451199018)(31686004)(4326008)(6916009)(8676002)(66946007)(66476007)(66556008)(41300700001)(38100700002)(2616005)(316002)(186003)(26005)(2906002)(8936002)(33964004)(6506007)(53546011)(6512007)(6666004)(107886003)(86362001)(478600001)(31696002)(6486002)(5660300002)(83380400001)(30864003)(44832011)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVZoNEtPME5OOWZEckVhZDl3UHY1MmRCZkNEaVNzcTZyeTdzR3NKcjdPQkdM?=
 =?utf-8?B?R24wblEvMjZpZG90RDFTcTBpandLck4wcFZCc1JWMVZaY0NCcjJEdEx5K1F4?=
 =?utf-8?B?Mlg4UmZ1MEcxdGRWNDV0Skhqc0pUQVJLZ0RRTGl6SEVkOW9ONmZFZ25mWHF5?=
 =?utf-8?B?OVFsZE1CVGdWQUJScUpsWGVlbUJ1WEIwNERZdGNMSngyWmFQWDZzdkxUWEFB?=
 =?utf-8?B?bUpGczQ4YXZFUlpRemFPNlJ6MUdmQ2lkSmNjaVRNK0QzZzNlV05maGI2WDMz?=
 =?utf-8?B?eG9kMSt6bFhUNXg2OHhJNTNpeUcvT1dPRHVJNmprYXh2dTdYNVJLQ0FyMkdu?=
 =?utf-8?B?WDJwQXBWMXRkU0k0N25iWUNwcjVJMDhBbmVzZDlXUnA0TCtvNFlPWk80clJj?=
 =?utf-8?B?c3NtQks2ZFRVVkZZSThrTU1vUU9KTGhhUmt5aUp2ZVkrRHluMjN2Vmtxb0xQ?=
 =?utf-8?B?Z2xJdDBTYXFtU1NlUFlCTXVDL1FBdTN6Z2VJRTJpNUsvcjFzUEEzSDJSM05I?=
 =?utf-8?B?WUg4Tkl2WElWY1AwaTZhVVp2dW0rNzFBN1IwK2FhbjducWlYYUVQSjNUNExF?=
 =?utf-8?B?dWw0d05HMlBPSFh3Vml4OHB4ZGpLR1hINjQ0RnBPRjllRVBNYUxLUWk5aVhi?=
 =?utf-8?B?VjFCRVUrbFIrM3pUSThsbWdRaGxGUEdxOWkzaTY4K2RqNG5wV3FDTDA5cmIw?=
 =?utf-8?B?aDVBRGVqMEJLTnJhQTM1T0VNUC8zaGwvTWZlZUEySjRnVEM3UzNGYVBzRytN?=
 =?utf-8?B?bERlYmNaVnNVSXFVdmY4TFB2NDk3b1Bra2VZMFpjZTRZUzJQaTJRV1ZYeGdJ?=
 =?utf-8?B?TFRXeEFhdzFFbmp6WVE0dHB1V1UrUGhGYlE3cG00YjlsRDJIcUtNaC9UbUhh?=
 =?utf-8?B?NVVEaVhrb01veEtVcHlnZDlqeGNYWFdtTjJYeHNoeGNRbEdrR2ZTc1p0dEdv?=
 =?utf-8?B?WVdrZUpkTDMvU2JxbVkrVHpNRk44dXJIOHRBa2xTekNBalcxMTM5VGVxQjFj?=
 =?utf-8?B?U1FNVnBRdW9HVzhaZ1dSSExORWNWamNJWGRUc0xCOU5LMTFYZzFSREE2Nzdo?=
 =?utf-8?B?QmNVRDJxQ0pVVU5FSjJ5UkduRjloQlNiRldqbXhZZWlJZTNlUldha0JhcXhI?=
 =?utf-8?B?eDQrcTdDV0twclJkZXFrdjNRMUNmWDVHc1dSYlNYK3FVWUJyeWV2a2dsTkY2?=
 =?utf-8?B?RFNIMlY1cTVNeVVuUTZZd0tBRXpNR0xoVklHaGNER25aa1RYcUNsbjRwMk1Z?=
 =?utf-8?B?SWs1Y0Q3V3ZDc0ZHUi82M2Zhb0hDTjJudkt1SWtRV3Rpd0ZKNE41dGN0dlFV?=
 =?utf-8?B?OVRLMVpRRmFXaHVlL2lRREMyL0JQMjI5VnFKVmw2UWtzVzkrTWhvcUlDbTlV?=
 =?utf-8?B?a241M2lGcG1GKzY2anVMZmNmUStGdWI2S2t1c0JKZkU3L0tmUHlhd0pGRSt4?=
 =?utf-8?B?UThKanNBTGxWeWdxa2xCbDZSQVI1TmhTVUl0bEVzdEF2UmxLN3crajM1RThM?=
 =?utf-8?B?bFNJMnRFVHhraDkzR2JXK2tYZDNPdURERmhoVXlFUUVwQzVEV0RCSXNpbFIz?=
 =?utf-8?B?UStVRzU1dVJMMkNyb3RValp5eHg3amcwUjE0TTlpc2JQbnlnaDZBN2l2MW5H?=
 =?utf-8?B?ZXl3Z1dvbUxpTGZyVFFNSVBmUjMwNGdHRmo1MEc4V3dtUjVRblUzMTZubUw5?=
 =?utf-8?B?dUZEcGRKSXZMWlA1Sng0b0QxVlJEQ0NYRGoxcStMQ0puQ3ppMGpzTGthZ0hS?=
 =?utf-8?B?a3hpTC91eXgvRzUyUFVtWXFlWE43ckFmZ3luQjA2Zk1ocWc4cUZSQkRpTGlS?=
 =?utf-8?B?Mm41UCt6UE9TUEkvNjRIbWNhblVxUGRmSnRjRzZSaEoyQUlid1Y2bGxkQVpS?=
 =?utf-8?B?aUdOeXV0VkphK2c1cnlNelRGMHVQYU96czRuQldqOHRYSEVwMTA2UkRxS2ts?=
 =?utf-8?B?R0lBcjBXaFkrdUxiWDlzaUhPOUR3MlBvVkZNSGRacHduRkxXOFBWb090VUVo?=
 =?utf-8?B?SituVmozVTRBTEZZb0hsNC9vMWpESXM2MHk0bEVEUGJYVUg4OWVRT2dNUlVQ?=
 =?utf-8?B?cDdpZkJqbFBScDN3K3JPZ2RDbjQ5SzcvVmZHRUhLWGcwTi8xYzd0K0tzc1pn?=
 =?utf-8?B?WmdTSm5WdXpxT3p6dkZDbis2aFlmMHV4UTBiMWVPVVo0ZjBYd2tGVmdYZUtK?=
 =?utf-8?B?N0E9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ce2fa77-08b5-4110-7119-08db0aa53c71
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 13:55:00.6912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tE8c4+q+lQocCjNvl7l6v2KM/LHpGWkXzqck5RBmg/lAqBv2kHAP7qUNvrEds3qk+53ytyBIYE9+kqkVgC7URA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6479
X-Proofpoint-GUID: 4vuanOLDtrfysdH-rj2aAXdBFf7VKpFw
X-Proofpoint-ORIG-GUID: 4vuanOLDtrfysdH-rj2aAXdBFf7VKpFw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-09_10,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=het.gala@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-1.148, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--------------pH1SdQfV3W6ayJLoZFl60bpY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 09/02/23 5:39 pm, Daniel P. Berrangé wrote:
> On Wed, Feb 08, 2023 at 09:35:58AM +0000, Het Gala wrote:
>> In existing senario, 'migrate' QAPI argument - string uri, is encoded
>> twice to extract migration parameters for stream connection. This is
>> not a good representation of migration wire protocol as it is a data
>> encoding scheme within a data encoding scheme. Qemu should be able to
>> directly work with results from QAPI without having to do a second
>> level parsing.
>> Modified 'migrate' QAPI design supports well defined MigrateChannel
>> struct which plays important role in avoiding double encoding
>> of uri strings.
>>
>> qemu_uri_parsing() parses uri string (kept for backward
>> compatibility) and populate the MigrateChannel struct parameters.
>> Migration code flow for all required migration transport types -
>> socket, exec and rdma is modified.
>>
>> Suggested-by: Daniel P. Berrange<berrange@redhat.com>
>> Suggested-by: Manish Mishra<manish.mishra@nutanix.com>
>> Suggested-by: Aravind Retnakaran<aravind.retnakaran@nutanix.com>
>> Signed-off-by: Het Gala<het.gala@nutanix.com>
>> ---
>>   migration/exec.c      | 31 ++++++++++++++++--
>>   migration/exec.h      |  4 ++-
>>   migration/migration.c | 75 +++++++++++++++++++++++++++++++++++--------
>>   migration/rdma.c      | 30 +++++------------
>>   migration/rdma.h      |  3 +-
>>   migration/socket.c    | 21 ++++--------
>>   migration/socket.h    |  3 +-
>>   7 files changed, 110 insertions(+), 57 deletions(-)
>>
>> diff --git a/migration/exec.c b/migration/exec.c
>> index 375d2e1b54..4fa9819792 100644
>> --- a/migration/exec.c
>> +++ b/migration/exec.c
>> @@ -23,14 +23,39 @@
>>   #include "migration.h"
>>   #include "io/channel-command.h"
>>   #include "trace.h"
>> +#include "qapi/error.h"
>>   
>>   
>> -void exec_start_outgoing_migration(MigrationState *s, const char *command, Error **errp)
>> +void init_exec_array(strList *command, const char *argv[], Error **errp)
>> +{
>> +    int i = 0;
>> +    strList *lst;
>> +
>> +    for (lst = command; lst ; lst = lst->next) {
>> +        argv[i++] = lst->value;
>> +    }
>> +
>> +    /*
>> +     * Considering exec command always has 3 arguments to execute
>> +     * a command directly from the bash itself.
>> +     */
>> +    if (i > 3) {
>> +        error_setg(errp, "exec accepts maximum of 3 arguments in the list");
>> +        return;
>> +    }
> By the time this check fires, the for() loop above has already
> done out of bounds writes on argv[].
Ack. check should be before for loop.
>> +
>> +    argv[i] = NULL;
>> +    return;
>> +}
>> +
>> +void exec_start_outgoing_migration(MigrationState *s, strList *command,
>> +                                   Error **errp)
>>   {
>>       QIOChannel *ioc;
>> -    const char *argv[] = { "/bin/sh", "-c", command, NULL };
>> +    const char *argv[4];
>> +    init_exec_array(command, argv, errp);
> If someone invokes 'migrate' with the old URI style, the
> strList will be 3 elements, and thus argv[4] is safe.
>
> If someone invokes 'migrate' with thue new MigrateChannel style,
> the strList can be arbitrarily long and thus argv[4] will be
> risk of overflow.

Okay, Can you give me an example where strList can be very long in the 
new MigrateChannel ? because in that case,

trace_migration_exec_outgoing(argv[2]);

will also be not correct right. Will have to come up with something that 
is dynamic ?

>>   
>> -    trace_migration_exec_outgoing(command);
>> +    trace_migration_exec_outgoing(argv[2]);
>>       ioc = QIO_CHANNEL(qio_channel_command_new_spawn(argv,
>>                                                       O_RDWR,
>>                                                       errp));
>> diff --git a/migration/exec.h b/migration/exec.h
>> index b210ffde7a..5b39ba6cbb 100644
>> --- a/migration/exec.h
>> +++ b/migration/exec.h
>> @@ -19,8 +19,10 @@
>>   
>>   #ifndef QEMU_MIGRATION_EXEC_H
>>   #define QEMU_MIGRATION_EXEC_H
>> +void init_exec_array(strList *command, const char *argv[], Error **errp);
>> +
>>   void exec_start_incoming_migration(const char *host_port, Error **errp);
>>   
>> -void exec_start_outgoing_migration(MigrationState *s, const char *host_port,
>> +void exec_start_outgoing_migration(MigrationState *s, strList *host_port,
>>                                      Error **errp);
>>   #endif
>> diff --git a/migration/migration.c b/migration/migration.c
>> index f6dd8dbb03..accbf72a18 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -63,6 +63,7 @@
>>   #include "sysemu/cpus.h"
>>   #include "yank_functions.h"
>>   #include "sysemu/qtest.h"
>> +#include "qemu/sockets.h"
>>   #include "ui/qemu-spice.h"
>>   
>>   #define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throttling */
>> @@ -489,6 +490,44 @@ void migrate_add_address(SocketAddress *address)
>>                         QAPI_CLONE(SocketAddress, address));
>>   }
>>   
>> +static bool migrate_uri_parse(const char *uri,
>> +                              MigrateChannel **channel,
>> +                              Error **errp)
>> +{
>> +    Error *local_err = NULL;
>> +    MigrateChannel *val = g_new0(MigrateChannel, 1);
>> +    MigrateAddress *addrs = g_new0(MigrateAddress, 1);
>> +    SocketAddress *saddr = g_new0(SocketAddress, 1);
>> +    InetSocketAddress *isock = g_new0(InetSocketAddress, 1);
>> +
>> +    if (strstart(uri, "exec:", NULL)) {
>> +        addrs->transport = MIGRATE_TRANSPORT_EXEC;
>> +        addrs->u.exec.data = str_split_at_comma(uri + strlen("exec:"));
>> +    } else if (strstart(uri, "rdma:", NULL) &&
>> +               !inet_parse(isock, uri + strlen("rdma:"), errp)) {
>> +        addrs->transport = MIGRATE_TRANSPORT_RDMA;
>> +        addrs->u.rdma.data = isock;
>> +    } else if (strstart(uri, "tcp:", NULL) ||
>> +                strstart(uri, "unix:", NULL) ||
>> +                strstart(uri, "vsock:", NULL) ||
>> +                strstart(uri, "fd:", NULL)) {
>> +        addrs->transport = MIGRATE_TRANSPORT_SOCKET;
>> +        saddr = socket_parse(uri, &local_err);
>> +        addrs->u.socket.socket_type = saddr;
>> +    }
>> +
>> +    val->channeltype = MIGRATE_CHANNEL_TYPE_MAIN;
>> +    val->addr = addrs;
>> +    *channel = val;
>> +
>> +    if (local_err) {
>> +        error_propagate(errp, local_err);
>> +        return false;
>> +    }
>> +
>> +    return true;
>> +}
>> +
>>   static void qemu_start_incoming_migration(const char *uri, Error **errp)
>>   {
>>       const char *p = NULL;
>> @@ -2469,7 +2508,8 @@ void qmp_migrate(const char *uri, MigrateChannel *channel, bool has_blk,
>>   {
>>       Error *local_err = NULL;
>>       MigrationState *s = migrate_get_current();
>> -    const char *p = NULL;
>> +    MigrateAddress *addrs = g_new0(MigrateAddress, 1);
>> +    SocketAddress *saddr = g_new0(SocketAddress, 1);
>>   
>>       if (!migrate_prepare(s, has_blk && blk, has_inc && inc,
>>                            has_resume && resume, errp)) {
>> @@ -2490,22 +2530,29 @@ void qmp_migrate(const char *uri, MigrateChannel *channel, bool has_blk,
>>           error_setg(errp, "uri and channels options should be"
>>                             "mutually exclusive");
>>           return;
>> +    } else if (uri && !migrate_uri_parse(uri, &channel, &local_err)) {
>> +        error_setg(errp, "Error parsing uri");
>> +        return;
>>       }
>>   
>>       migrate_protocol_allow_multi_channels(false);
>> -    if (strstart(uri, "tcp:", &p) ||
>> -        strstart(uri, "unix:", NULL) ||
>> -        strstart(uri, "vsock:", NULL)) {
>> -        migrate_protocol_allow_multi_channels(true);
>> -        socket_start_outgoing_migration(s, p ? p : uri, &local_err);
>> -#ifdef CONFIG_RDMA
>> -    } else if (strstart(uri, "rdma:", &p)) {
>> -        rdma_start_outgoing_migration(s, p, &local_err);
>> -#endif
>> -    } else if (strstart(uri, "exec:", &p)) {
>> -        exec_start_outgoing_migration(s, p, &local_err);
>> -    } else if (strstart(uri, "fd:", &p)) {
>> -        fd_start_outgoing_migration(s, p, &local_err);
>> +    addrs = channel->addr;
>> +    saddr = channel->addr->u.socket.socket_type;
>> +    if (addrs->transport == MIGRATE_TRANSPORT_SOCKET) {
>> +        if (saddr->type == SOCKET_ADDRESS_TYPE_INET ||
>> +            saddr->type == SOCKET_ADDRESS_TYPE_UNIX ||
>> +            saddr->type == SOCKET_ADDRESS_TYPE_VSOCK) {
>> +            migrate_protocol_allow_multi_channels(true);
>> +            socket_start_outgoing_migration(s, saddr, &local_err);
>> +        } else if (saddr->type == SOCKET_ADDRESS_TYPE_FD) {
>> +            fd_start_outgoing_migration(s, saddr->u.fd.str, &local_err);
>> +        }
>> +    #ifdef CONFIG_RDMA
>> +    } else if (addrs->transport == MIGRATE_TRANSPORT_RDMA) {
>> +        rdma_start_outgoing_migration(s, addrs->u.rdma.data, &local_err);
>> +    #endif
>> +    } else if (addrs->transport == MIGRATE_TRANSPORT_EXEC) {
>> +        exec_start_outgoing_migration(s, addrs->u.exec.data, &local_err);
>>       } else {
>>           if (!(has_resume && resume)) {
>>               yank_unregister_instance(MIGRATION_YANK_INSTANCE);
>> diff --git a/migration/rdma.c b/migration/rdma.c
>> index 288eadc2d2..48f49add6f 100644
>> --- a/migration/rdma.c
>> +++ b/migration/rdma.c
>> @@ -316,7 +316,6 @@ typedef struct RDMALocalBlocks {
>>   typedef struct RDMAContext {
>>       char *host;
>>       int port;
>> -    char *host_port;
>>   
>>       RDMAWorkRequestData wr_data[RDMA_WRID_MAX];
>>   
>> @@ -2449,9 +2448,7 @@ static void qemu_rdma_cleanup(RDMAContext *rdma)
>>           rdma->channel = NULL;
>>       }
>>       g_free(rdma->host);
>> -    g_free(rdma->host_port);
>>       rdma->host = NULL;
>> -    rdma->host_port = NULL;
>>   }
>>   
>>   
>> @@ -2733,28 +2730,17 @@ static void qemu_rdma_return_path_dest_init(RDMAContext *rdma_return_path,
>>       rdma_return_path->is_return_path = true;
>>   }
>>   
>> -static void *qemu_rdma_data_init(const char *host_port, Error **errp)
>> +static void *qemu_rdma_data_init(InetSocketAddress *saddr, Error **errp)
>>   {
>>       RDMAContext *rdma = NULL;
>> -    InetSocketAddress *addr;
>>   
>> -    if (host_port) {
>> +    if (saddr) {
>>           rdma = g_new0(RDMAContext, 1);
>>           rdma->current_index = -1;
>>           rdma->current_chunk = -1;
>>   
>> -        addr = g_new(InetSocketAddress, 1);
>> -        if (!inet_parse(addr, host_port, NULL)) {
>> -            rdma->port = atoi(addr->port);
>> -            rdma->host = g_strdup(addr->host);
>> -            rdma->host_port = g_strdup(host_port);
>> -        } else {
>> -            ERROR(errp, "bad RDMA migration address '%s'", host_port);
>> -            g_free(rdma);
>> -            rdma = NULL;
>> -        }
>> -
>> -        qapi_free_InetSocketAddress(addr);
>> +        rdma->host = g_strdup(saddr->host);
>> +        rdma->port = atoi(saddr->port);
>>       }
>>   
>>       return rdma;
>> @@ -3354,6 +3340,7 @@ static int qemu_rdma_accept(RDMAContext *rdma)
>>                                               .private_data_len = sizeof(cap),
>>                                            };
>>       RDMAContext *rdma_return_path = NULL;
>> +    InetSocketAddress *isock = g_new0(InetSocketAddress, 1);
>>       struct rdma_cm_event *cm_event;
>>       struct ibv_context *verbs;
>>       int ret = -EINVAL;
>> @@ -4152,14 +4139,13 @@ err:
>>       error_propagate(errp, local_err);
>>       if (rdma) {
>>           g_free(rdma->host);
>> -        g_free(rdma->host_port);
>>       }
>>       g_free(rdma);
>>       g_free(rdma_return_path);
>>   }
>>   
>>   void rdma_start_outgoing_migration(void *opaque,
>> -                            const char *host_port, Error **errp)
>> +                            InetSocketAddress *addr, Error **errp)
>>   {
>>       MigrationState *s = opaque;
>>       RDMAContext *rdma_return_path = NULL;
>> @@ -4172,7 +4158,7 @@ void rdma_start_outgoing_migration(void *opaque,
>>           return;
>>       }
>>   
>> -    rdma = qemu_rdma_data_init(host_port, errp);
>> +    rdma = qemu_rdma_data_init(addr, errp);
>>       if (rdma == NULL) {
>>           goto err;
>>       }
>> @@ -4193,7 +4179,7 @@ void rdma_start_outgoing_migration(void *opaque,
>>   
>>       /* RDMA postcopy need a separate queue pair for return path */
>>       if (migrate_postcopy()) {
>> -        rdma_return_path = qemu_rdma_data_init(host_port, errp);
>> +        rdma_return_path = qemu_rdma_data_init(addr, errp);
>>   
>>           if (rdma_return_path == NULL) {
>>               goto return_path_err;
>> diff --git a/migration/rdma.h b/migration/rdma.h
>> index de2ba09dc5..8d9978e1a9 100644
>> --- a/migration/rdma.h
>> +++ b/migration/rdma.h
>> @@ -13,11 +13,12 @@
>>    * later.  See the COPYING file in the top-level directory.
>>    *
>>    */
>> +#include "io/channel-socket.h"
>>   
>>   #ifndef QEMU_MIGRATION_RDMA_H
>>   #define QEMU_MIGRATION_RDMA_H
>>   
>> -void rdma_start_outgoing_migration(void *opaque, const char *host_port,
>> +void rdma_start_outgoing_migration(void *opaque, InetSocketAddress *addr,
>>                                      Error **errp);
>>   
>>   void rdma_start_incoming_migration(const char *host_port, Error **errp);
>> diff --git a/migration/socket.c b/migration/socket.c
>> index e6fdf3c5e1..c751e0bfc1 100644
>> --- a/migration/socket.c
>> +++ b/migration/socket.c
>> @@ -27,6 +27,8 @@
>>   #include "io/net-listener.h"
>>   #include "trace.h"
>>   #include "postcopy-ram.h"
>> +#include "qapi/clone-visitor.h"
>> +#include "qapi/qapi-visit-sockets.h"
>>   
>>   struct SocketOutgoingArgs {
>>       SocketAddress *saddr;
>> @@ -107,19 +109,20 @@ out:
>>       object_unref(OBJECT(sioc));
>>   }
>>   
>> -static void
>> -socket_start_outgoing_migration_internal(MigrationState *s,
>> +void socket_start_outgoing_migration(MigrationState *s,
>>                                            SocketAddress *saddr,
>>                                            Error **errp)
>>   {
>>       QIOChannelSocket *sioc = qio_channel_socket_new();
>>       struct SocketConnectData *data = g_new0(struct SocketConnectData, 1);
>> +    SocketAddress *addr = g_new0(SocketAddress, 1);
>> +    addr = QAPI_CLONE(SocketAddress, saddr);
>>   
>>       data->s = s;
>>   
>>       /* in case previous migration leaked it */
>>       qapi_free_SocketAddress(outgoing_args.saddr);
>> -    outgoing_args.saddr = saddr;
>> +    outgoing_args.saddr = addr;
>>   
>>       if (saddr->type == SOCKET_ADDRESS_TYPE_INET) {
>>           data->hostname = g_strdup(saddr->u.inet.host);
>> @@ -134,18 +137,6 @@ socket_start_outgoing_migration_internal(MigrationState *s,
>>                                        NULL);
>>   }
>>   
>> -void socket_start_outgoing_migration(MigrationState *s,
>> -                                     const char *str,
>> -                                     Error **errp)
>> -{
>> -    Error *err = NULL;
>> -    SocketAddress *saddr = socket_parse(str, &err);
>> -    if (!err) {
>> -        socket_start_outgoing_migration_internal(s, saddr, &err);
>> -    }
>> -    error_propagate(errp, err);
>> -}
>> -
>>   static void socket_accept_incoming_migration(QIONetListener *listener,
>>                                                QIOChannelSocket *cioc,
>>                                                gpointer opaque)
>> diff --git a/migration/socket.h b/migration/socket.h
>> index dc54df4e6c..95c9c166ec 100644
>> --- a/migration/socket.h
>> +++ b/migration/socket.h
>> @@ -19,6 +19,7 @@
>>   
>>   #include "io/channel.h"
>>   #include "io/task.h"
>> +#include "io/channel-socket.h"
>>   
>>   void socket_send_channel_create(QIOTaskFunc f, void *data);
>>   QIOChannel *socket_send_channel_create_sync(Error **errp);
>> @@ -26,6 +27,6 @@ int socket_send_channel_destroy(QIOChannel *send);
>>   
>>   void socket_start_incoming_migration(const char *str, Error **errp);
>>   
>> -void socket_start_outgoing_migration(MigrationState *s, const char *str,
>> +void socket_start_outgoing_migration(MigrationState *s, SocketAddress *saddr,
>>                                        Error **errp);
>>   #endif
>> -- 
>> 2.22.3
>>
> With regards,
> Daniel
Regards,
Het Gala
--------------pH1SdQfV3W6ayJLoZFl60bpY
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 09/02/23 5:39 pm, Daniel P. Berrangé
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:Y+TicReIdgA9P6q3@redhat.com">
      <pre class="moz-quote-pre" wrap="">On Wed, Feb 08, 2023 at 09:35:58AM +0000, Het Gala wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">In existing senario, 'migrate' QAPI argument - string uri, is encoded
twice to extract migration parameters for stream connection. This is
not a good representation of migration wire protocol as it is a data
encoding scheme within a data encoding scheme. Qemu should be able to
directly work with results from QAPI without having to do a second
level parsing.
Modified 'migrate' QAPI design supports well defined MigrateChannel
struct which plays important role in avoiding double encoding
of uri strings.

qemu_uri_parsing() parses uri string (kept for backward
compatibility) and populate the MigrateChannel struct parameters.
Migration code flow for all required migration transport types -
socket, exec and rdma is modified.

Suggested-by: Daniel P. Berrange <a class="moz-txt-link-rfc2396E" href="mailto:berrange@redhat.com">&lt;berrange@redhat.com&gt;</a>
Suggested-by: Manish Mishra <a class="moz-txt-link-rfc2396E" href="mailto:manish.mishra@nutanix.com">&lt;manish.mishra@nutanix.com&gt;</a>
Suggested-by: Aravind Retnakaran <a class="moz-txt-link-rfc2396E" href="mailto:aravind.retnakaran@nutanix.com">&lt;aravind.retnakaran@nutanix.com&gt;</a>
Signed-off-by: Het Gala <a class="moz-txt-link-rfc2396E" href="mailto:het.gala@nutanix.com">&lt;het.gala@nutanix.com&gt;</a>
---
 migration/exec.c      | 31 ++++++++++++++++--
 migration/exec.h      |  4 ++-
 migration/migration.c | 75 +++++++++++++++++++++++++++++++++++--------
 migration/rdma.c      | 30 +++++------------
 migration/rdma.h      |  3 +-
 migration/socket.c    | 21 ++++--------
 migration/socket.h    |  3 +-
 7 files changed, 110 insertions(+), 57 deletions(-)

diff --git a/migration/exec.c b/migration/exec.c
index 375d2e1b54..4fa9819792 100644
--- a/migration/exec.c
+++ b/migration/exec.c
@@ -23,14 +23,39 @@
 #include &quot;migration.h&quot;
 #include &quot;io/channel-command.h&quot;
 #include &quot;trace.h&quot;
+#include &quot;qapi/error.h&quot;
 
 
-void exec_start_outgoing_migration(MigrationState *s, const char *command, Error **errp)
+void init_exec_array(strList *command, const char *argv[], Error **errp)
+{
+    int i = 0;
+    strList *lst;
+
+    for (lst = command; lst ; lst = lst-&gt;next) {
+        argv[i++] = lst-&gt;value;
+    }
+
+    /*
+     * Considering exec command always has 3 arguments to execute
+     * a command directly from the bash itself.
+     */
+    if (i &gt; 3) {
+        error_setg(errp, &quot;exec accepts maximum of 3 arguments in the list&quot;);
+        return;
+    }
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
By the time this check fires, the for() loop above has already
done out of bounds writes on argv[].</pre>
    </blockquote>
    Ack. check should be before for loop.<br>
    <blockquote type="cite" cite="mid:Y+TicReIdgA9P6q3@redhat.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+    argv[i] = NULL;
+    return;
+}
+
+void exec_start_outgoing_migration(MigrationState *s, strList *command,
+                                   Error **errp)
 {
     QIOChannel *ioc;
-    const char *argv[] = { &quot;/bin/sh&quot;, &quot;-c&quot;, command, NULL };
+    const char *argv[4];
+    init_exec_array(command, argv, errp);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
If someone invokes 'migrate' with the old URI style, the
strList will be 3 elements, and thus argv[4] is safe.

If someone invokes 'migrate' with thue new MigrateChannel style,
the strList can be arbitrarily long and thus argv[4] will be
risk of overflow.</pre>
    </blockquote>
    <p>Okay, Can you give me an example where strList can be very long
      in the new MigrateChannel ? because in that case, <br>
    </p>
    <pre>trace_migration_exec_outgoing(argv[2]);</pre>
    <p>will also be not correct right. Will have to come up with
      something that is dynamic ?
    </p>
    <blockquote type="cite" cite="mid:Y+TicReIdgA9P6q3@redhat.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> 
-    trace_migration_exec_outgoing(command);
+    trace_migration_exec_outgoing(argv[2]);
     ioc = QIO_CHANNEL(qio_channel_command_new_spawn(argv,
                                                     O_RDWR,
                                                     errp));
diff --git a/migration/exec.h b/migration/exec.h
index b210ffde7a..5b39ba6cbb 100644
--- a/migration/exec.h
+++ b/migration/exec.h
@@ -19,8 +19,10 @@
 
 #ifndef QEMU_MIGRATION_EXEC_H
 #define QEMU_MIGRATION_EXEC_H
+void init_exec_array(strList *command, const char *argv[], Error **errp);
+
 void exec_start_incoming_migration(const char *host_port, Error **errp);
 
-void exec_start_outgoing_migration(MigrationState *s, const char *host_port,
+void exec_start_outgoing_migration(MigrationState *s, strList *host_port,
                                    Error **errp);
 #endif
diff --git a/migration/migration.c b/migration/migration.c
index f6dd8dbb03..accbf72a18 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -63,6 +63,7 @@
 #include &quot;sysemu/cpus.h&quot;
 #include &quot;yank_functions.h&quot;
 #include &quot;sysemu/qtest.h&quot;
+#include &quot;qemu/sockets.h&quot;
 #include &quot;ui/qemu-spice.h&quot;
 
 #define MAX_THROTTLE  (128 &lt;&lt; 20)      /* Migration transfer speed throttling */
@@ -489,6 +490,44 @@ void migrate_add_address(SocketAddress *address)
                       QAPI_CLONE(SocketAddress, address));
 }
 
+static bool migrate_uri_parse(const char *uri,
+                              MigrateChannel **channel,
+                              Error **errp)
+{
+    Error *local_err = NULL;
+    MigrateChannel *val = g_new0(MigrateChannel, 1);
+    MigrateAddress *addrs = g_new0(MigrateAddress, 1);
+    SocketAddress *saddr = g_new0(SocketAddress, 1);
+    InetSocketAddress *isock = g_new0(InetSocketAddress, 1);
+
+    if (strstart(uri, &quot;exec:&quot;, NULL)) {
+        addrs-&gt;transport = MIGRATE_TRANSPORT_EXEC;
+        addrs-&gt;u.exec.data = str_split_at_comma(uri + strlen(&quot;exec:&quot;));
+    } else if (strstart(uri, &quot;rdma:&quot;, NULL) &amp;&amp;
+               !inet_parse(isock, uri + strlen(&quot;rdma:&quot;), errp)) {
+        addrs-&gt;transport = MIGRATE_TRANSPORT_RDMA;
+        addrs-&gt;u.rdma.data = isock;
+    } else if (strstart(uri, &quot;tcp:&quot;, NULL) ||
+                strstart(uri, &quot;unix:&quot;, NULL) ||
+                strstart(uri, &quot;vsock:&quot;, NULL) ||
+                strstart(uri, &quot;fd:&quot;, NULL)) {
+        addrs-&gt;transport = MIGRATE_TRANSPORT_SOCKET;
+        saddr = socket_parse(uri, &amp;local_err);
+        addrs-&gt;u.socket.socket_type = saddr;
+    }
+
+    val-&gt;channeltype = MIGRATE_CHANNEL_TYPE_MAIN;
+    val-&gt;addr = addrs;
+    *channel = val;
+
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return false;
+    }
+
+    return true;
+}
+
 static void qemu_start_incoming_migration(const char *uri, Error **errp)
 {
     const char *p = NULL;
@@ -2469,7 +2508,8 @@ void qmp_migrate(const char *uri, MigrateChannel *channel, bool has_blk,
 {
     Error *local_err = NULL;
     MigrationState *s = migrate_get_current();
-    const char *p = NULL;
+    MigrateAddress *addrs = g_new0(MigrateAddress, 1);
+    SocketAddress *saddr = g_new0(SocketAddress, 1);
 
     if (!migrate_prepare(s, has_blk &amp;&amp; blk, has_inc &amp;&amp; inc,
                          has_resume &amp;&amp; resume, errp)) {
@@ -2490,22 +2530,29 @@ void qmp_migrate(const char *uri, MigrateChannel *channel, bool has_blk,
         error_setg(errp, &quot;uri and channels options should be&quot;
                           &quot;mutually exclusive&quot;);
         return;
+    } else if (uri &amp;&amp; !migrate_uri_parse(uri, &amp;channel, &amp;local_err)) {
+        error_setg(errp, &quot;Error parsing uri&quot;);
+        return;
     }
 
     migrate_protocol_allow_multi_channels(false);
-    if (strstart(uri, &quot;tcp:&quot;, &amp;p) ||
-        strstart(uri, &quot;unix:&quot;, NULL) ||
-        strstart(uri, &quot;vsock:&quot;, NULL)) {
-        migrate_protocol_allow_multi_channels(true);
-        socket_start_outgoing_migration(s, p ? p : uri, &amp;local_err);
-#ifdef CONFIG_RDMA
-    } else if (strstart(uri, &quot;rdma:&quot;, &amp;p)) {
-        rdma_start_outgoing_migration(s, p, &amp;local_err);
-#endif
-    } else if (strstart(uri, &quot;exec:&quot;, &amp;p)) {
-        exec_start_outgoing_migration(s, p, &amp;local_err);
-    } else if (strstart(uri, &quot;fd:&quot;, &amp;p)) {
-        fd_start_outgoing_migration(s, p, &amp;local_err);
+    addrs = channel-&gt;addr;
+    saddr = channel-&gt;addr-&gt;u.socket.socket_type;
+    if (addrs-&gt;transport == MIGRATE_TRANSPORT_SOCKET) {
+        if (saddr-&gt;type == SOCKET_ADDRESS_TYPE_INET ||
+            saddr-&gt;type == SOCKET_ADDRESS_TYPE_UNIX ||
+            saddr-&gt;type == SOCKET_ADDRESS_TYPE_VSOCK) {
+            migrate_protocol_allow_multi_channels(true);
+            socket_start_outgoing_migration(s, saddr, &amp;local_err);
+        } else if (saddr-&gt;type == SOCKET_ADDRESS_TYPE_FD) {
+            fd_start_outgoing_migration(s, saddr-&gt;u.fd.str, &amp;local_err);
+        }
+    #ifdef CONFIG_RDMA
+    } else if (addrs-&gt;transport == MIGRATE_TRANSPORT_RDMA) {
+        rdma_start_outgoing_migration(s, addrs-&gt;u.rdma.data, &amp;local_err);
+    #endif
+    } else if (addrs-&gt;transport == MIGRATE_TRANSPORT_EXEC) {
+        exec_start_outgoing_migration(s, addrs-&gt;u.exec.data, &amp;local_err);
     } else {
         if (!(has_resume &amp;&amp; resume)) {
             yank_unregister_instance(MIGRATION_YANK_INSTANCE);
diff --git a/migration/rdma.c b/migration/rdma.c
index 288eadc2d2..48f49add6f 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -316,7 +316,6 @@ typedef struct RDMALocalBlocks {
 typedef struct RDMAContext {
     char *host;
     int port;
-    char *host_port;
 
     RDMAWorkRequestData wr_data[RDMA_WRID_MAX];
 
@@ -2449,9 +2448,7 @@ static void qemu_rdma_cleanup(RDMAContext *rdma)
         rdma-&gt;channel = NULL;
     }
     g_free(rdma-&gt;host);
-    g_free(rdma-&gt;host_port);
     rdma-&gt;host = NULL;
-    rdma-&gt;host_port = NULL;
 }
 
 
@@ -2733,28 +2730,17 @@ static void qemu_rdma_return_path_dest_init(RDMAContext *rdma_return_path,
     rdma_return_path-&gt;is_return_path = true;
 }
 
-static void *qemu_rdma_data_init(const char *host_port, Error **errp)
+static void *qemu_rdma_data_init(InetSocketAddress *saddr, Error **errp)
 {
     RDMAContext *rdma = NULL;
-    InetSocketAddress *addr;
 
-    if (host_port) {
+    if (saddr) {
         rdma = g_new0(RDMAContext, 1);
         rdma-&gt;current_index = -1;
         rdma-&gt;current_chunk = -1;
 
-        addr = g_new(InetSocketAddress, 1);
-        if (!inet_parse(addr, host_port, NULL)) {
-            rdma-&gt;port = atoi(addr-&gt;port);
-            rdma-&gt;host = g_strdup(addr-&gt;host);
-            rdma-&gt;host_port = g_strdup(host_port);
-        } else {
-            ERROR(errp, &quot;bad RDMA migration address '%s'&quot;, host_port);
-            g_free(rdma);
-            rdma = NULL;
-        }
-
-        qapi_free_InetSocketAddress(addr);
+        rdma-&gt;host = g_strdup(saddr-&gt;host);
+        rdma-&gt;port = atoi(saddr-&gt;port);
     }
 
     return rdma;
@@ -3354,6 +3340,7 @@ static int qemu_rdma_accept(RDMAContext *rdma)
                                             .private_data_len = sizeof(cap),
                                          };
     RDMAContext *rdma_return_path = NULL;
+    InetSocketAddress *isock = g_new0(InetSocketAddress, 1);
     struct rdma_cm_event *cm_event;
     struct ibv_context *verbs;
     int ret = -EINVAL;
@@ -4152,14 +4139,13 @@ err:
     error_propagate(errp, local_err);
     if (rdma) {
         g_free(rdma-&gt;host);
-        g_free(rdma-&gt;host_port);
     }
     g_free(rdma);
     g_free(rdma_return_path);
 }
 
 void rdma_start_outgoing_migration(void *opaque,
-                            const char *host_port, Error **errp)
+                            InetSocketAddress *addr, Error **errp)
 {
     MigrationState *s = opaque;
     RDMAContext *rdma_return_path = NULL;
@@ -4172,7 +4158,7 @@ void rdma_start_outgoing_migration(void *opaque,
         return;
     }
 
-    rdma = qemu_rdma_data_init(host_port, errp);
+    rdma = qemu_rdma_data_init(addr, errp);
     if (rdma == NULL) {
         goto err;
     }
@@ -4193,7 +4179,7 @@ void rdma_start_outgoing_migration(void *opaque,
 
     /* RDMA postcopy need a separate queue pair for return path */
     if (migrate_postcopy()) {
-        rdma_return_path = qemu_rdma_data_init(host_port, errp);
+        rdma_return_path = qemu_rdma_data_init(addr, errp);
 
         if (rdma_return_path == NULL) {
             goto return_path_err;
diff --git a/migration/rdma.h b/migration/rdma.h
index de2ba09dc5..8d9978e1a9 100644
--- a/migration/rdma.h
+++ b/migration/rdma.h
@@ -13,11 +13,12 @@
  * later.  See the COPYING file in the top-level directory.
  *
  */
+#include &quot;io/channel-socket.h&quot;
 
 #ifndef QEMU_MIGRATION_RDMA_H
 #define QEMU_MIGRATION_RDMA_H
 
-void rdma_start_outgoing_migration(void *opaque, const char *host_port,
+void rdma_start_outgoing_migration(void *opaque, InetSocketAddress *addr,
                                    Error **errp);
 
 void rdma_start_incoming_migration(const char *host_port, Error **errp);
diff --git a/migration/socket.c b/migration/socket.c
index e6fdf3c5e1..c751e0bfc1 100644
--- a/migration/socket.c
+++ b/migration/socket.c
@@ -27,6 +27,8 @@
 #include &quot;io/net-listener.h&quot;
 #include &quot;trace.h&quot;
 #include &quot;postcopy-ram.h&quot;
+#include &quot;qapi/clone-visitor.h&quot;
+#include &quot;qapi/qapi-visit-sockets.h&quot;
 
 struct SocketOutgoingArgs {
     SocketAddress *saddr;
@@ -107,19 +109,20 @@ out:
     object_unref(OBJECT(sioc));
 }
 
-static void
-socket_start_outgoing_migration_internal(MigrationState *s,
+void socket_start_outgoing_migration(MigrationState *s,
                                          SocketAddress *saddr,
                                          Error **errp)
 {
     QIOChannelSocket *sioc = qio_channel_socket_new();
     struct SocketConnectData *data = g_new0(struct SocketConnectData, 1);
+    SocketAddress *addr = g_new0(SocketAddress, 1);
+    addr = QAPI_CLONE(SocketAddress, saddr);
 
     data-&gt;s = s;
 
     /* in case previous migration leaked it */
     qapi_free_SocketAddress(outgoing_args.saddr);
-    outgoing_args.saddr = saddr;
+    outgoing_args.saddr = addr;
 
     if (saddr-&gt;type == SOCKET_ADDRESS_TYPE_INET) {
         data-&gt;hostname = g_strdup(saddr-&gt;u.inet.host);
@@ -134,18 +137,6 @@ socket_start_outgoing_migration_internal(MigrationState *s,
                                      NULL);
 }
 
-void socket_start_outgoing_migration(MigrationState *s,
-                                     const char *str,
-                                     Error **errp)
-{
-    Error *err = NULL;
-    SocketAddress *saddr = socket_parse(str, &amp;err);
-    if (!err) {
-        socket_start_outgoing_migration_internal(s, saddr, &amp;err);
-    }
-    error_propagate(errp, err);
-}
-
 static void socket_accept_incoming_migration(QIONetListener *listener,
                                              QIOChannelSocket *cioc,
                                              gpointer opaque)
diff --git a/migration/socket.h b/migration/socket.h
index dc54df4e6c..95c9c166ec 100644
--- a/migration/socket.h
+++ b/migration/socket.h
@@ -19,6 +19,7 @@
 
 #include &quot;io/channel.h&quot;
 #include &quot;io/task.h&quot;
+#include &quot;io/channel-socket.h&quot;
 
 void socket_send_channel_create(QIOTaskFunc f, void *data);
 QIOChannel *socket_send_channel_create_sync(Error **errp);
@@ -26,6 +27,6 @@ int socket_send_channel_destroy(QIOChannel *send);
 
 void socket_start_incoming_migration(const char *str, Error **errp);
 
-void socket_start_outgoing_migration(MigrationState *s, const char *str,
+void socket_start_outgoing_migration(MigrationState *s, SocketAddress *saddr,
                                      Error **errp);
 #endif
-- 
2.22.3

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
With regards,
Daniel</pre>
    </blockquote>
    Regards,<br>
    Het Gala
  </body>
</html>

--------------pH1SdQfV3W6ayJLoZFl60bpY--

