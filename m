Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A40B597E74
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 08:20:27 +0200 (CEST)
Received: from localhost ([::1]:57772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOYtE-00075e-Rf
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 02:20:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <priyankar.jain@nutanix.com>)
 id 1oOYmE-00042f-Lj
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 02:13:10 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:19744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <priyankar.jain@nutanix.com>)
 id 1oOYmB-0007Hc-Ik
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 02:13:10 -0400
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27HLije2015471;
 Wed, 17 Aug 2022 23:12:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=gK614RbVaA1j9a2KDnY52bL81IPdqnDJN2UOgFHirq8=;
 b=OD+TnnRZU5f5ngmpn9JLePh9xLRC7Ke+8fkTi2XGvWgbqfD4bDScX7KCHZRGs8nFF2Q+
 aCgAtnTIIRROsGjt0n5CeVRnj7zVfRWCnPnfvpP9z9U1BYVglJaAH5ETViaM7hqominl
 vbiAkoSs40RzScWMmmxg2Z2ZyZLVfTaib6Toqs1izAA85Deu6DU0U3KDlae3GTt6TNDW
 rq3D/ffbGMx1JmegqseuX0CDwyXv98xhrYJVsrMGDiQV7B+jM2v7+/enSiaktxLP7Owc
 yF7HfFjWedjTl/VeNgPj3PKdvnpQLZc8z23nlhys0poDSIxj2qB1+r13uvZnRqomEzcq 7w== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3hxb1g2kc5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Aug 2022 23:12:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m1f42IfKT5OAy6EX2o3TuO00lBiNoBHqrxQFzDjfblde/xFwpfIb1PuvjVBw1omMTi1N27wduip7dlLLrqDKTxjzp+j6tpd173Tw0VJ93+lTVudFJLi/kNBXMz0G+zRnwO+nbXs5ubd/NDxj5+CwvongdT4m26VTKJny8eYy3dVCWJdr9xaHeiwyCVnlVkpQnLS/PsuopwQ5YNcCIqKlLI1Oy+za81KBFF0sXBnxF4TK/+Snv9mTeyKnx6EPztBwNVINVs7kYdPthGM6/3qWQvUqSz16Jr6vichjSgUtQ8CrHZ5kCJXf9uJCavZSNZwtAjhgQTyGJ93qkSDExflAdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gK614RbVaA1j9a2KDnY52bL81IPdqnDJN2UOgFHirq8=;
 b=T7K/jqbE9xgVhalls+wjnbp1Prh4fNQBDjaqJVSFEaHO4KHUsfGSwsPJfFs14UBdqEbRPxU1NHCLIwgVxTgI9tGZF7aisSWRhZ2BjMjqh1bqFSJwuoVdghuBvYGI81Hx8qtbYi3wOMTtTUZBc3x0x6c9Cm4144Wuf0AnMTo9YGhEcv7//9ohiWo1mJwI8e8N7a8aWUsiFDZvsi2+pjIMoodyMtX8+Vvff/+2gCJf3blNRdJYcNvZ5WUTHM5QsybmruBhDB0a2ySrgEuRukovZLfgGachlCMrA9y1te+mMhZzkd8s/cTqu7JirIl0bSnVfV9KiCfviqTQJdKXRvTkzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from PH0PR02MB7496.namprd02.prod.outlook.com (2603:10b6:510:16::12)
 by MN2PR02MB6445.namprd02.prod.outlook.com (2603:10b6:208:11a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 18 Aug
 2022 06:12:48 +0000
Received: from PH0PR02MB7496.namprd02.prod.outlook.com
 ([fe80::c4d:3484:ebc5:2060]) by PH0PR02MB7496.namprd02.prod.outlook.com
 ([fe80::c4d:3484:ebc5:2060%9]) with mapi id 15.20.5525.019; Thu, 18 Aug 2022
 06:12:48 +0000
Subject: Re: [PATCH v3] dbus-vmstate: Restrict error checks to registered
 proxies in dbus_get_proxies
To: qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <1637936117-37977-1-git-send-email-priyankar.jain@nutanix.com>
From: Priyankar Jain <priyankar.jain@nutanix.com>
Message-ID: <8ecd96c0-a3c9-07fc-bd53-a610962040bb@nutanix.com>
Date: Thu, 18 Aug 2022 11:41:47 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
In-Reply-To: <1637936117-37977-1-git-send-email-priyankar.jain@nutanix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::10) To PH0PR02MB7496.namprd02.prod.outlook.com
 (2603:10b6:510:16::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 455ad354-9ad3-4f66-8a8e-08da80e0aca0
X-MS-TrafficTypeDiagnostic: MN2PR02MB6445:EE_
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6cGnhRDLKH8j53R6tnEQlCSxMXjv2NhhUDjdSrPL7jbQS+W9uhZUWNSLwMFjY09IQ+czlEtsMUwmMsFc02GRVJE9S+iRCpGWdy01wIWa73/COVwFw/kDiXNB6YI+O5Iqh91SUtCRpe2REFvBAfP341uyilq6Pn6IUmxEjp31cD9A9sU5z+YkCLBOzyCKFyY6sybfUIFD9ibOJ1qmC835qTCgAe9uJD68586BTCjo7vICCbmgDCAVlggkiGxSTeORiU/Cmi7mkA7sweFXmQW44CWYVfSLS46uRosOutNbWryLfn1169zAa3QVUKM3zDhmSK3MvEtFORjStKD3Q5IEV4fgTqvS+hIxugRLc/9EZqMHBadKpJJpkWiqz/O5MKIr8fJkMEU32SdSQx5jHMUW1VofCLDNS6DjrEwtWQXH6/20iaeMZ3mYyrLrSaSZztX2qjChjrYaA/EyxrpkngdVTPlFKF98LOs6fD6h9y7AzGh2SwIU/UPyOMtYG+SfookBcluhuJKOFKRbMACWdsts6Jlf0wMn/RkPRDrI+kwZUEoyDZQ9IawaEMQaJc1n3Tet3J1QX7oTxGsNWT9lVwzmVkpqRkGS9F++EiNQHyyru4v7lk9KuSglxENhhm5TO16KwTDvb+4ubNHt+bnWgRDoFXbh76betPY9TSM4tcVo4POyms/sfrE9sSxMemBwB/OtLR0HpwUQLgCQmujVhEtUrnb6djygjW9ybtZGrJ5pyakYCzyincUF2lhGxdKUmFwkjEfqg1tgaeWbzRpAj/vN/uW9WsAYc9mangMQ688azkCbm0/ukjG/uhXl4cicAeDe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7496.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(366004)(346002)(39860400002)(396003)(136003)(41300700001)(6506007)(26005)(478600001)(6512007)(86362001)(31696002)(2616005)(31686004)(186003)(6486002)(52116002)(53546011)(83380400001)(36756003)(66556008)(66476007)(8676002)(4326008)(5660300002)(66946007)(316002)(6916009)(38350700002)(38100700002)(44832011)(8936002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGcyYVB3S2FkbWZRWmJGWVBFZkFLMnNTSDFSTG5wQnR6Z2RyOXcvaStaM3Rl?=
 =?utf-8?B?VGswVHM2b2JQV3BKRSszOG4zSXI4V0hjUkNNR1BPWWYzeXN2VnMwQkwyZUNX?=
 =?utf-8?B?Qkg0T2llM004UjV2a01xT1RETFljRU1LUkZpK3ArZHpJVS9UNFZseUVzd2ZF?=
 =?utf-8?B?bVA2L3VkQ1l6NS9Kak02Y3h1dFMveUdBaU5MYWpsZUI2cEppM1NLTGhQNTU3?=
 =?utf-8?B?ZUR1elJGa2YwWHpXS1pVUHhROUJjVHZwdVArZ2hHdGUvSGUrSmVFR2FGMW5y?=
 =?utf-8?B?MzNNSnpCQWdpcmxraEFWcy9KQnY2T0ZXQ3BSd1d0OUwxclZGOEhyd3F5d2tM?=
 =?utf-8?B?bklPNXFzdldtWit3MXpFUmw0dklmaTZCTlBrVnhQRkFQbklPZ1owQ0NYUXJN?=
 =?utf-8?B?NzBoUDNhcXIwUUdkT0JDdUlXeUw5UXB5alR6NllHVlhOVEVGWW4vdVhVWGlY?=
 =?utf-8?B?Y2JHZUlOOGNkdkZkR09GOXU2WlBLdkdjMDAyNFJ4RkZybExYNVVFU3ZsWEtw?=
 =?utf-8?B?MmJES0E0emRFc3lLeWxEUXpKdkgrZzJRSVZ5ZXRPRjhTcUR4c0xYR2w1T3dZ?=
 =?utf-8?B?UGRRZHZrSEZqL3J5QlA2NThEMVhxZXMydUd2OUQ0ZlhYKzN1U0VGckprZXU1?=
 =?utf-8?B?ajNFY29rM2RlZER3S2ZET1pGZlBsUUhVZzErZFlYdzlLMVc0UjhVNE11Y2Jk?=
 =?utf-8?B?RjRtZHd2OGNtbm9CenpUcFlHZkZxcTVnWk92ZWZncmhVN21LSEMvUnJxZXo3?=
 =?utf-8?B?N1d4K3E0MUFpYTArRmVzU0dTaE1EWU5UMytCOVNEUzRTbElNbUR2aG5zME9L?=
 =?utf-8?B?cVhGT2VLa2xBVHVFNjB5ZldKZ1lUaEZncFZzT3Nxc3JGWVdpQWlRcFFqdC9a?=
 =?utf-8?B?L1J4ZER3VkV1R3ZkbVBneEhSWFRBcnMyTFRlb2kzMmVPSDh2anh6SG1HejQz?=
 =?utf-8?B?UmlwbXNub1ozNFByaUNCb1VHYmxmUmhTbkZ0T25CV3o2Q3RMdSsrZTd6bVJz?=
 =?utf-8?B?S1I3UkpZTW1tdVoyS0RGQWNHVzM1bnVXOHFlcWV1ZGZTOFlJNzFYdlhUQVN4?=
 =?utf-8?B?WHN4MEtJZUNsOCs3WXc4VGRMdGt4dHRNWnpTcVcyUlQ4M2RGSUhsZ3NETjBJ?=
 =?utf-8?B?cURTcUQ5NW5NYWRvYi92eThKdTVJdjFPY21seGNUS2lHc2orMkhJdGRaeGNU?=
 =?utf-8?B?VEY3S2VoanZFeVdDQnVoY1dPOUc3UnNKc0tkSWpLWHh5Z3MrK0ptelZ3RWl6?=
 =?utf-8?B?c1RPNTN0Z1ZkTXg3VEIrUllFZWFaNGpQS0xaemdHUmc5RkNiOXRPODZKb3Fm?=
 =?utf-8?B?a01pYXpYZlZ0VS8wZnNTOVpZMS9CQ3orWFBSbTdsdk9RVW9lSlV1SGlBSXd0?=
 =?utf-8?B?MDFQZEhnV2NGMmFyRVBPNm5nR2NkSjd1RnBxNGhHUDE5TkJ0eXh2RURBRUxu?=
 =?utf-8?B?UXhiWlVNUmxkbWQ2ck4wVkVQMUhiaHBBRWFJQmwyd25pZjAvM1ZrTG54Q1RM?=
 =?utf-8?B?dE5UdVJNUkc0UkxjTlVuZ1UyVmYvVTZ0bmpIcXZnWWh2TzVkQWR1dm9KTHB2?=
 =?utf-8?B?dVN3bGNmd2xQVkU2UHhwLzN5VTZLRHJkWFBsWlU2akMvQ3RKcUFjUTd6a1Vm?=
 =?utf-8?B?cWRnTkwxYUNTZGlFTWlqMUVCMm5MaytqK1lIWVBQeDBldFJ4dDNlalRmS1Mr?=
 =?utf-8?B?akhVV0tKVGRQRnNYOHJCeGZmZTNON3h5a05iSDg4eE9hWGsxcnpWZTlBR1lj?=
 =?utf-8?B?bFZQRTZRV3NQVkdVdXlhZ2RjWlZiQThjZ1Z6UFU0SXhtckRqZm53dGtoRzF2?=
 =?utf-8?B?bmRuYnF1dDJFYUlQTSt3V0VtYVg1U1VIRGYrSm15dnpvbUVtR1I5aVhKMnBE?=
 =?utf-8?B?Rlpud3VUdU5JUHpNM0o1ZW1jKzBBSXgrR1N5U2puWjN0eWFETjBqVFlwWUJM?=
 =?utf-8?B?WlRwR1ByVkV3RG1uY0dXU0hrdXBQTWgrWkZJZUl2ZTR4NGlZR3hkell0eWJU?=
 =?utf-8?B?Z0JjRUo1dXZiUWlpcTI4S211R1o2c0RWZldiREthcjJmVTdjL1g5Q2ZOZm16?=
 =?utf-8?B?TWNqUUJCRTlzanlXQis2aFV6bFZ5MlhDN3RaTVFEbndiWU0vci9BY2NoNGFN?=
 =?utf-8?B?dnFpUlZwMDN6RlZnL2tvWWtZT3l2SGpkekxCMDJSR1AzaHViRGVQQmtJNFdx?=
 =?utf-8?B?OGc9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 455ad354-9ad3-4f66-8a8e-08da80e0aca0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7496.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 06:12:48.7327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: idmNxwh0OWlzah1fERvEdvzMN31/FoEo8oEFUHFQtOOOxn7LdA9vu0XvwNg6mDVX0rFducz7kX8CeK+w2h7yTzFCUz9TY7HMlD7S/1MQ3AY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6445
X-Proofpoint-ORIG-GUID: RiFgSLZDG_KXOjHtR6emVfqpf3SqQ8tt
X-Proofpoint-GUID: RiFgSLZDG_KXOjHtR6emVfqpf3SqQ8tt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-18_02,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=priyankar.jain@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Marc,
Could you please merge this in master? I see this commit is missing in 
master, although it was approved long back.

Thanks,
Priyankar Jain

On 26/11/21 7:45 pm, Priyankar Jain wrote:
> The purpose of dbus_get_proxies to construct the proxies corresponding to the
> IDs registered to dbus-vmstate.
> 
> Currenty, this function returns an error in case there is any failure
> while instantiating proxy for "all" the names on dbus.
> 
> Ideally this function should error out only if it is not able to find and
> validate the proxies registered to the backend otherwise any offending
> process(for eg: the process purposefully may not export its Id property on
> the dbus) may connect to the dbus and can lead to migration failures.
> 
> This commit ensures that dbus_get_proxies returns an error if it is not
> able to find and validate the proxies of interest(the IDs registered
> during the dbus-vmstate instantiation).
> 
> Signed-off-by: Priyankar Jain <priyankar.jain@nutanix.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   backends/dbus-vmstate.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/backends/dbus-vmstate.c b/backends/dbus-vmstate.c
> index 9cfd758c42..57369ec0f2 100644
> --- a/backends/dbus-vmstate.c
> +++ b/backends/dbus-vmstate.c
> @@ -114,14 +114,19 @@ dbus_get_proxies(DBusVMState *self, GError **err)
>                       "org.qemu.VMState1",
>                       NULL, err);
>           if (!proxy) {
> -            return NULL;
> +            if (err != NULL && *err != NULL) {
> +                warn_report("%s: Failed to create proxy: %s",
> +                            __func__, (*err)->message);
> +                g_clear_error(err);
> +            }
> +            continue;
>           }
>   
>           result = g_dbus_proxy_get_cached_property(proxy, "Id");
>           if (!result) {
> -            g_set_error_literal(err, G_IO_ERROR, G_IO_ERROR_FAILED,
> -                                "VMState Id property is missing.");
> -            return NULL;
> +            warn_report("%s: VMState Id property is missing.", __func__);
> +            g_clear_object(&proxy);
> +            continue;
>           }
>   
>           id = g_variant_dup_string(result, &size);
> 

