Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C426909B5
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 14:17:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ6lQ-0006N6-Jj; Thu, 09 Feb 2023 08:15:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQ6lO-0006Lf-LH
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 08:14:58 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQ6lM-0007Gk-Mt
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 08:14:58 -0500
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3198vZlk025574; Thu, 9 Feb 2023 05:14:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=dpCLAjMJSJxEuyvEZ28WZsr/gxeZwBZFbuSjyYiuBEg=;
 b=2Xtm2GKpRW1dS5vQS2BQVPdBxTe1wY+6VjhEiIkte3F7wYz4jyxqw/T5psyI39NE36Tz
 g+FVGdad6fwH6QCz1VC8WWz0Xd9CDvOiiAC3C2kQZbw+PPDRbK6knTY+ecq/S16U9Iqi
 Y02lAKoeAdhk9ZGRv1fM4axFiJDLq2JnSTn3u0xVTSx7BUFyFCBy6kY6N3i+pitccL9T
 nW3PQXv/bJyc57h/i1OS/rXKYVfyaOA9Ox8B5lwAVRfqJRTGzxWJhLygoaq3ugQfca7c
 zfA9kWkO+5Be7CV49gQ9P8NaK5eE3/xqQbZx5cx7vDXdPm22SLaZnwePUYGOwrn3ZB1a LQ== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3nhmk1ftut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Feb 2023 05:14:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QEwsu82nO6+CVNwJ6g5fiYGCc6jVYFXFG4n4pMGEOaxy0BWc+q9pSl2PcM1cRK7LMaOtXhyF8qoLWt0PVAS3h0/xFmSQFjYBvlqCuHjDE3bbUeTatfvURU3vN7MQmdDJxdHxqtwYClV3z7K3iwd6BmXFB1fHzrFlpMGt+d24+sPi4xGU8vs7yJY1cwV6N9EoVDxM13mqORI1DsHizvcTrauQdPsXBVyjg5flkPffnKgxm3A83AGYb32eBiuy/A4mG3HBfGosm7SWz6znCbo8UNhFLHHqTPDtqQl6hTUqxk6LTmvrvi12bP0ohYFoaDa4ZaZT0AQxr8Zmmch3lrUI2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dpCLAjMJSJxEuyvEZ28WZsr/gxeZwBZFbuSjyYiuBEg=;
 b=ddUpr7fa9oqJ3hscZmAMyMC4thRcqM22jb5f/9FjaekMQw2twg44Acq4iP+wiZhJPIsPDmFNysAcfuZ3ge16PrZDDilgDFGZJ4q8ki1nbo+ufwo8Y9scy+4HtCMM/vvo853JUO/3zZMhVabG6xwvyEIj8mFhwYe0WnPpA6dG0rzpvWD7tiLIKV4/BvPFl0s9JDSmNgowohulB0auBLaoVdKeSqfLtL0z9Fo8YNCacnjm3KJYCm7c1vK+U3CsqTEjvfQqzIva+XL5fsNtUeo6hJ+T2zvdfHQL0rMBddzKUPz20YphGXczAJZQXLRrxZpfL3ONWNW1wdsL1/PRAgjSEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpCLAjMJSJxEuyvEZ28WZsr/gxeZwBZFbuSjyYiuBEg=;
 b=Ep4l+rpKhhyBpCR64chWXA3MKJUSzzBAYyfDW2K955QKqxOvtHULxdRcOhkTgdCXkzCD5mFQ7rBgnVpUIsK8FPMfokNIKfhm3WCzj39FUqW3gnPahkMMwEF0cJJu4U87ADuo0CRq8wd9bMO+UFPI0Xe/GWl/W8I2U3SxEJYeG6wYeWxF3f/tSJgAY/AVgPlc4vNCfgjsZcXHTxSE4k3Y8C8NN9AxMbxwzG+qEMNbIzz2fqWYBoMRkYLqq9WyP2mgusTIAxJP75z5g7SFsudzHZdMWS/sCDPOiAs87aVyD41LIWqmEcsSr+smAoc91wF0p1rg9Whs2lI5HMeJqXxxaw==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by CY8PR02MB9501.namprd02.prod.outlook.com (2603:10b6:930:70::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Thu, 9 Feb
 2023 13:14:53 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%3]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 13:14:52 +0000
Message-ID: <d91f29f2-75e4-71d8-2b33-da5d16770cf9@nutanix.com>
Date: Thu, 9 Feb 2023 18:44:40 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 5/6] migration: Modified 'migrate-incoming' QAPI and
 HMP side changes on the destination interface.
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
References: <20230208093600.242665-1-het.gala@nutanix.com>
 <20230208093600.242665-6-het.gala@nutanix.com> <Y+TLgrcmC4tdOpU0@redhat.com>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <Y+TLgrcmC4tdOpU0@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0110.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::7) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|CY8PR02MB9501:EE_
X-MS-Office365-Filtering-Correlation-Id: dfe0340e-4d3b-4eaa-9d37-08db0a9fa158
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v9i4kyuKy6b8Ul/hJkcS9rPpmr8nvu0hmCcD6+EDEDJfqGHuB5noZVbaQadmVehcInxFyjzZ1nBWP3OsLEV7EIIkCSC39MDMgxUfEiqe/e7FMrFw726Vus9qyX90yJr5mITf8iqcyu7UiJoRObSESDSweYCdHHgxtdUL3a4SLdHjwavhco7fD/y+CnQMkvqLsCQAJdjrQQ3evhLmMeGtPMpLRgtv2UrZLTO3+JdVjA8J31/Dtpp2bpz6UZEP4a0h4x2bBapTkSYEn/WrimCKwU0jRX/GpcISg4g84bwgLh+nGz2dUUMSlAIy54al2O+XkA+0pSCl4nib5QwDXYqo7o1PoSVovDdb+50WqJfEkuDH47frWUABDk4u4g/4qZptQra9kyzxYbVHAiRu1ApNHewhcvZdtp+NHkjv56nXszBMfXN2bcE+o8OYp7Vs4n//iQP8nm9VvIAWu2weclwjJpfe1Skw4Y74bsmZ8dj7FPzTbs4SdNl79bqRQxkZGGbaElhqRQzULtKypksGnD++/FgSW7r4oMwEv6ch96QIryZroLZix8oUioZrg+488W5en+EX2AedQwptxkDmse5c8L1soedchsN3+JgiWeu1IJFJVWyRO5jTjt0+66+ood7QxBCOpXIjja3XLYQDm0NHYYQEB0IkJMPtx+Uw2CGuoBDSps4E/mSEhG9GRQweMRdpBXO9myy096S+dMnvFqyK6cE2G0O+XWrQYqduwGu4Rpg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(396003)(376002)(39860400002)(346002)(366004)(451199018)(66476007)(6916009)(66946007)(4326008)(8676002)(31696002)(316002)(38100700002)(66556008)(86362001)(478600001)(6486002)(31686004)(44832011)(6506007)(53546011)(186003)(83380400001)(6512007)(26005)(6666004)(36756003)(107886003)(2906002)(5660300002)(41300700001)(8936002)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFpMcndYRGkwaHNKRitKNlZweVlmMS9GZWsyRGhxTk5pdVdFSG0zYVkxT0tY?=
 =?utf-8?B?NmV5V21HU3JyOHpuanRlZzJ6dlh4REoyS2E5b1VvOVQ1Q29qUFpmbnIvYU1Z?=
 =?utf-8?B?NWhrMjNkQVJYWUdwMWZjbm94Y2pPRldoWTF6SFFIZ3FCMVJLbllTUnI0RjV6?=
 =?utf-8?B?VGdPcmNKaFZCMkNFNzhCVWUwSnc4RS9UT0ZQUVA5SVVQOWczK2hvM2NOdDVv?=
 =?utf-8?B?YnVsR1BGNC9jeHQzUGx4MmIyamJSanZrbzVQZWpOL0VqVGpFeDJHNGxiTUJN?=
 =?utf-8?B?aEViZkRqc21XeDhCTzRBYlZTbkQ1RnpQemN0blFMN1hkdTM5U0h6MG4zMkJK?=
 =?utf-8?B?d0hCZUUvTEtKU1gyVER6OGpNbm5RZG5PV21JejBncHdIMWVWRTY2UWxLc3lW?=
 =?utf-8?B?QlZmaVVaUFpVKzUrQ2NmRm5CU2JLOVdZWnBVa2NOYkxMZHhQbTZ3TUZqb3BX?=
 =?utf-8?B?bXZMUUxnU1VLMFVRUUEyZi9kZjU5WnRPZFZmbXgwZXV6RjRQY0hXaGtERnJj?=
 =?utf-8?B?SDd5Umo5WUNqV3hBV1pTMkFpU3hEc3NieFB2NjI0VlIyQWcxWFRYNEFoWm5Z?=
 =?utf-8?B?N09iMWxDcGI0NWhiNWxOMWVxUFV1WGZQMVVJZnh2ZENjMUtGUjZhYm0wUDlz?=
 =?utf-8?B?NFdURDEwTVE5VEZJbEFJaHVMeWtBc3VYRC80eEtZWTM1ZHZBaDRiNkg2dlZr?=
 =?utf-8?B?THZYUG1jQ1UvNXZ5MUMvTnc1UDRrMjJvaVRmZkNWMGt2emRZNGtGaGdXV3hM?=
 =?utf-8?B?b0VYVFF1Q0l6cVhiMlJrbTg4OXJZQVozZWVJUmIwWUJWS1lMRk5KSW1adzZV?=
 =?utf-8?B?RnV2Y0syQkhvdzcxUnFXOFErNG5lVzZDQmRlakRkeHJhZGRNc1NzM0JRemFN?=
 =?utf-8?B?eWlyWnEybzV2RWp6YlMwYll5V0VpZkNwL3BKeWRPTm4vdHIzOHl3TzFrcTND?=
 =?utf-8?B?dFhuUjFLcTh6emQxWHZVUlBOUlJqQS9XU2o0RDdJcWs1UzhZckQ4OVl1Ym03?=
 =?utf-8?B?dHhMVEdpSXF4akJtdGRHN0R3cjlYMWo4MWNlZlJjUW1FNVk2M0NCYmdSRGhk?=
 =?utf-8?B?bnF6NGI3T0Y5TTlrbmlZMlFsd3I3SUh3QlJKdlI5dzdtVHdleCsxNUVTRGkx?=
 =?utf-8?B?VHJJazJJdlpiOVpjSTBYaWdwQWtQL3I2T0ZKNitBdFY3RTZLSC82UHY0eFNs?=
 =?utf-8?B?WXcra0UycmoyY1hnRUY4MTY3YUJ0VWpCd2ZpOWI2OE5EaENUYlh1VGN1S2J0?=
 =?utf-8?B?QXdZbmlhcGZIbGx1bmMvdklwTGhsTGdNcFMzVWpXWXhmUjk3dzNGM2hQSnl5?=
 =?utf-8?B?Zkt4WS9ISHYzV0JrZWhRV2VYV2tHYUx6bDZ0eVBOeWhoWFpoek9sZDZwTVB2?=
 =?utf-8?B?ZFhURGR4TEZrWlFrMWNDRnU0UGM2bUZKRG1YSk9jaUdtNVVlcGFnYWdNQTlO?=
 =?utf-8?B?SlA0Q1k5MzFvQlNIejZvRzViRnpPWVpZVlJKc1loVjlRalhhaEpSOWNWUFA2?=
 =?utf-8?B?VkZNS0t0alVkM3pUN0xWUm5raDF4ejMrZDBrVVdsWE14cW5nRmpmWXZERjM5?=
 =?utf-8?B?N1ZlVTlybHQ2Q0VsZGQ4MG12ZEZDdEpPL1NoMnBmc2lxV2hBSENUVVdZYk1V?=
 =?utf-8?B?akJDYVZiV1Y5YTB2TCtldjhXOFQwOUtqbWp6VTRmM20rekdDUS9vNllDb0VJ?=
 =?utf-8?B?b3gzSkt4L1U0Z20rT3RiZVZVelJERFRnRjVXR1JqTUpaR1grUktyRG9NSDhE?=
 =?utf-8?B?UHZtWS80MzNwd2llL0J2MGZBaytoVkJsbWJ1dW1Fb2JDNkJOZE1tZTJmZnJ5?=
 =?utf-8?B?SWYycUpQM3JvRGlHWm9JVHFhWW45d2NBTUFrU2JybG0vVGZaWG5GcEduWFRy?=
 =?utf-8?B?VTdDUTUycmhVNUNlL0NJdUFVekcyZ2NmN1MwOEtPVUlCRytKQkl6ZSsxbGs2?=
 =?utf-8?B?RzI0OEljQXdKTE0yV0NiMTNMbU9sZTdDZnprRm5RQlltVFJJUWtDUEhMbnF0?=
 =?utf-8?B?dmdkTG1VcUh4L0JwNzFOdWFxR2EzaHpBYnRSK2U1cUFOMGswZkFweUZPd1lL?=
 =?utf-8?B?VDkzTTRaNWM3U0xsWkFjN2htUld3SiszRGNtSlBOYnZ2SFFhOUpJSzFuR25M?=
 =?utf-8?B?VHFya2tjdlNOL3JuV3VNZiszRkwwcUlpWkw2TDNTM0Y2WU9xOEtkam5BcjhG?=
 =?utf-8?B?SlE9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfe0340e-4d3b-4eaa-9d37-08db0a9fa158
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 13:14:52.8105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NozPDDsQjTgNxyumWSfZO7x2z3553OOvN+dG87KX65hOU3VETrTC1rfVq4ILgBYSjN3qeYBY5QQ63ywlKBwGCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR02MB9501
X-Proofpoint-GUID: eAvWwlHQgbf2xZEUq16KNsDiFT2wPj8v
X-Proofpoint-ORIG-GUID: eAvWwlHQgbf2xZEUq16KNsDiFT2wPj8v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-09_10,2023-02-09_03,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=het.gala@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, SPF_HELO_NONE=0.001,
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


On 09/02/23 4:01 pm, Daniel P. Berrangé wrote:
> On Wed, Feb 08, 2023 at 09:35:59AM +0000, Het Gala wrote:
>> 'migrate-incoming' QAPI design have been modified into well-defined
>> MigrateChannel struct to prevent multiple encoding of uri strings on
>> the destination side.'uri' parameter is kept for backward compatibility.
>>
>> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
>> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
>> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
>> Signed-off-by: Het Gala <het.gala@nutanix.com>
>> ---
>>   migration/migration-hmp-cmds.c |  8 +++++++-
>>   migration/migration.c          |  3 ++-
>>   qapi/migration.json            | 22 ++++++++++++++++++++--
>>   softmmu/vl.c                   |  2 +-
>>   4 files changed, 30 insertions(+), 5 deletions(-)
>>
>> diff --git a/migration/migration-hmp-cmds.c b/migration/migration-hmp-cmds.c
>> index a9f65ded7a..ae3c5ea5b2 100644
>> --- a/migration/migration-hmp-cmds.c
>> +++ b/migration/migration-hmp-cmds.c
>> @@ -500,8 +500,14 @@ void hmp_migrate_incoming(Monitor *mon, const QDict *qdict)
>>       Error *err = NULL;
>>       const char *uri = qdict_get_str(qdict, "uri");
>>   
>> -    qmp_migrate_incoming(uri, &err);
>> +    MigrateChannel *channel = g_new0(MigrateChannel, 1);
>> +    if (!migrate_channel_from_qdict(&channel, qdict, &err)) {
>> +        error_setg(&err, "error in retrieving channel from qdict");
>> +        return;
>> +    }
>>   
>> +    qmp_migrate_incoming(uri, channel, &err);
>> +    qapi_free_MigrateChannel(channel);
>>       hmp_handle_error(mon, err);
>>   }
>>   
>> diff --git a/migration/migration.c b/migration/migration.c
>> index accbf72a18..e22ce2dd15 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -2314,7 +2314,8 @@ void migrate_del_blocker(Error *reason)
>>       migration_blockers = g_slist_remove(migration_blockers, reason);
>>   }
>>   
>> -void qmp_migrate_incoming(const char *uri, Error **errp)
>> +void qmp_migrate_incoming(const char *uri, MigrateChannel *channel,
>> +                          Error **errp)
>>   {
>>       Error *local_err = NULL;
>>       static bool once = true;
>> diff --git a/qapi/migration.json b/qapi/migration.json
>> index 79acfcfe4e..3a88912f4d 100644
>> --- a/qapi/migration.json
>> +++ b/qapi/migration.json
>> @@ -1623,7 +1623,11 @@
>>   # with -incoming defer
>>   #
>>   # @uri: The Uniform Resource Identifier identifying the source or
>> -#       address to listen on
>> +#       the address to listen on
>> +#
>> +# @channel: Struct containing migration channel type, along with
>> +#           all the details of the destination interface required
>> +#           for the address to listen on for migration stream.
>>   #
>>   # Returns: nothing on success
>>   #
>> @@ -1640,14 +1644,28 @@
>>   #
>>   # 3. The uri format is the same as for -incoming
>>   #
>> +# 4. The 'uri' and 'channel' arguments are mutually exclusive but, atleast
>> +#    one of the two arguments should be present.
>> +#
>>   # Example:
>>   #
>>   # -> { "execute": "migrate-incoming",
>>   #      "arguments": { "uri": "tcp::4446" } }
>>   # <- { "return": {} }
>>   #
>> +# -> { "execute": "migrate-incoming",
>> +#      "arguments": {
>> +#          "channel": { "channeltype": "main",
>> +#                        "addr": { "transport": "socket",
>> +#                                  "socket-type": { "type": "inet",
>> +#                                                   "host": "10.12.34.9",
>> +#                                                   "port": "1050" } } } } }
>> +# <- { "return": {} }
>> +#
>>   ##
>> -{ 'command': 'migrate-incoming', 'data': {'uri': 'str' } }
>> +{ 'command': 'migrate-incoming',
>> +             'data': {'*uri': 'str',
>> +                      '*channel': 'MigrateChannel'} }
> Same question of whether we need to future proof now by making this
>
>    '*channels': ['MigrateChannel']
>
> ?
>
> Otherwise we'll have to add this 'channels' field later, and
> end up with 'channel' and 'channels' and 'uri'

Why do we need 3 fields ? We can directly convert 'channel' into 'channels'.

'*channels' will be of the form ['MigrateChannel']. Ex: In the list the 
first channel will be of type 'main' and other channel could be of type 
'data' for multifd.

> With regards,
> Daniel
Regards,
Het Gala

