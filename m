Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5024A49C827
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 11:58:44 +0100 (CET)
Received: from localhost ([::1]:38654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCg0h-0004Px-3a
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 05:58:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCfyT-0003MV-Ee; Wed, 26 Jan 2022 05:56:25 -0500
Received: from mail-eopbgr150112.outbound.protection.outlook.com
 ([40.107.15.112]:50229 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCfyN-0005Hs-9K; Wed, 26 Jan 2022 05:56:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AH5/B/Lslj1knu9MZxMeWvcE5+ft1YjgHa1lYXZ8m/EWR9IP/4QKnfP66ZivE1kpkHaIjqYOQIiZBt5QVOpUoZTs0GeCFuQE6LPX13nAtg3OeJ9Ik9TVbDLOx0/Jc4kh2OSI2JDYj0h3bpi1w697bPGrZDZtUjNzZOMeV/IUO7DkdPe85B8EdYafDN9YA0EKiWmIXfvNzsi6MT6x2ci8gJUlyW+HrPNKRC8Rvdrv0pQM1szduSo7n7TjNyNVoX0NeZgMsPHEqTHSrq1GcL/z56DNsuIhgaK/oMzH4wH+ZQdOwrD88j4KCG2iN3KuOR6SWiyXQElRxhOiR9Kh0nJDdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Czq8NBVW9iCoMkOracGoftEDFTtBAB97f5hHi2IT+9c=;
 b=lfYyiJ3Ea+PaiIz5fVX5k8Ga/pgaehq5mKoKoTJ1RmTZGrwb6G0UG/OR4wXysSbb4UK4+eAYD4TCNkurV6mMihhLbkxZjPy1O+jmB9B4kxSZjjAEjYMD1vAYBsbx2ztHscgQrEby3A/y6tjgzDtULfoGeOtLarlIsGHW6nNWZAJJKdRzE50WdL5X3v5MR4OUEljlTrQrG3aLR61P8GMwPvGQVDRm82VZcjiqIF7MqR9V5C5vUf9t4adPVOvIzzb5Cx/8l6xCTtoS8b9V59H9c0AouErxJMfGAiXac/aHxJ9J4XV0TWkDo3kldvjIm+Gzh9CbwAoJt7DzXkGuOSg2Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Czq8NBVW9iCoMkOracGoftEDFTtBAB97f5hHi2IT+9c=;
 b=uKqnkONNRbcuTclpM2nb4YwjC3+r7mB5uM/ScW3l8J3NxiV0JZa8blkNiOKaj6e1fxSHW/j3Qb2LL0GvaFFwK/BHGm9A0qjeqp+Hfz03wvVGmC+/kQFoSfzM06NRcIEPj0WFckYqe3F4tLGlTUrMW9CbOHVgQR9j52KAGefDCg4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by PAXPR08MB6384.eurprd08.prod.outlook.com (2603:10a6:102:154::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 10:56:08 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd%3]) with mapi id 15.20.4909.017; Wed, 26 Jan 2022
 10:56:08 +0000
Message-ID: <e6c0908a-1662-a190-d01e-1722b79a7713@virtuozzo.com>
Date: Wed, 26 Jan 2022 13:56:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 07/19] block/dirty-bitmap: introduce
 bdrv_dirty_bitmap_status()
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, kwolf@redhat.com,
 jsnow@redhat.com, nikita.lapshin@virtuozzo.com
References: <20211222174018.257550-1-vsementsov@virtuozzo.com>
 <20211222174018.257550-8-vsementsov@virtuozzo.com>
 <b52ba04c-107e-0928-5a08-c07b3bcd6fe6@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <b52ba04c-107e-0928-5a08-c07b3bcd6fe6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::17) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 915b73ef-b545-42b3-e647-08d9e0ba74dd
X-MS-TrafficTypeDiagnostic: PAXPR08MB6384:EE_
X-Microsoft-Antispam-PRVS: <PAXPR08MB638451654468ABFB5B6DFA4AC1209@PAXPR08MB6384.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jil13n00OkK2soWgJK6Lh5nUuVKoM3dFpCXHyO5/qiNkZPJB3ThEjBYOWUSQ8H6igP01YS9YYKvf15VTbanQ7VTLY07ac3B3eCuWsaoyP1PBa4GKJOJr5j3+f4m0argyRwgwNV7oGhQPPLlNp8lDK6dYX/GKFNw6oIBwBq/pF/1cWt/6mhl7lKfWM/FTbnCM1srOGEBxoNzD8ATrIpL/C3A7wHUvpyLCWeaWszBJ5vcoJkfgRcEOKab2l/Qq02EbteFWNDMdsj+5ApZFifcOCO2Su8w5riXvHmaVw5KnsD/fMIPDTNFxg90imsxj80e6k3IMAaBVVW5j3NsQwHcWQ0R2mytc5v7ptDr3ngxa91OOi0Gx3KFouLASoY6aBFLksFXixGWQOXMRMhvNRB6sT8cU5Jkfk7x1RJJutBK3SLeQ6ijgphDrUvZTydaMnvu+jdJASsjpirmwAdhYUnv/Dh5uzSkTa1rgiWI7o/C6RrWvc7mWF7exZDrLUMuWnlFvwDn+L0qZCWaIOAl3aLiPjlOpUqzPxgL48lJoy226RLYJPk1WUWm6gHG0AzFpwYMFfoYvAPDnwPngp3yBU1QHm1LRAR7PDrMEuNwJW2Le36QkNs2ngx1RJL9VeYbibx/xtQrhRU8kCyEKRRx7oGS2zbjJfNQbyro8i766CXdlxSnuDs/NlfBOpY3fV87gFVFOJopdbl+9Fy1ve0ViblRKDbM38GDwTmdHPfUr1A1k4PSuAoqrd7RN9CvHQf77DQiQTmyCbq1iRWHGD+MG6DqyDIKQBoCByv1wGOdvertvD+8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(31696002)(38100700002)(66946007)(66556008)(6512007)(38350700002)(6666004)(6506007)(66476007)(2906002)(8676002)(52116002)(8936002)(4326008)(316002)(186003)(31686004)(5660300002)(86362001)(508600001)(107886003)(26005)(6486002)(2616005)(36756003)(14143004)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDM5V2NWRm4xTHlGZlB4dGV2WHpFbk50NzhyRExpRmgrRkM2QmdING9VRjcr?=
 =?utf-8?B?M2p2bWtmUEN6Vy94aDVLejBXSE9jcXAxNWloTzFNVHJtb3UwRGpMazFzeGFs?=
 =?utf-8?B?NkcvVlhoM3QxUmVIbWJZSmFhMUJJaXo2QXdGaS9vZUM0UlM3a0p2TzFsU2ZG?=
 =?utf-8?B?OVkvMTQ5Z0VML3NGYkxnaFJVQUs1Q1BySXl5SDBFQTNmTHVENS83aEdpY0Rl?=
 =?utf-8?B?VFN6eFNKdkZuUjRYanRLbkJsSk9Vak9XVEVmbEl2WUFRSWpvM0FxN281enZx?=
 =?utf-8?B?WU9MZmZCYVBpMnl1NVBURzNVOU8yQnZxRnV1M1lSTTJOWVR0ZTV0cWxCbTRF?=
 =?utf-8?B?aXJyM3RVVm90cDRkWkM2Q1F6NC9hbGtYMWlUTE5GV1ZWSXFrZFUveUtiRnQy?=
 =?utf-8?B?RWlTNGhiU2FpS1FVbjA3R0taeGNGTndiMXExc1ZOSzd3akE0b0JwTm5VdC8r?=
 =?utf-8?B?YXpUeHltc2FWUlFjUitnY2g3aDlQUnZPSlRNZkUvWUJrUmFyL2JUcmhSR1pP?=
 =?utf-8?B?NnR4UVlvam4wVjkwdnVZd2M1OW9uZ1R3ZWdHV253RzYxRHBIallmcy9GdzB2?=
 =?utf-8?B?NGlGSG5qaGpLNHhIK2NUTWZXbXJ3MlI3VGRqVS8xLzQycE1LaTJObXlzejVu?=
 =?utf-8?B?b1lFRkVBTURxa2hJaHJQaXRrbWVkN3FGOXI3NHFBVGEzVWY2aTI1b2VFdGxW?=
 =?utf-8?B?bnljRHVvT3FGbVpXa01DMXU3V1g2cDd4UkpPRlN3VXNpS0pwK09xRzRqM2s1?=
 =?utf-8?B?UzRRb0QyaXltdTV0cXIxdmY4RENiei95eDBkYmgvcWFsZUdZOUZrLzBic2Z1?=
 =?utf-8?B?QmdVQjJ2SEhkc3BQTkdMOG4wcUlPOHA0UDdhSmFpSUJLeHdjeE1lTi92V1VR?=
 =?utf-8?B?d0svNkpwTkdJcTNPYnJWMVJMU3Q3WTE1Q1c4Qkwza0VnZmYxVytkcXhyQjN6?=
 =?utf-8?B?aDROVTVFUjFBUUQ2UmRVaktORDRkMUE5c0pVME1BL2dzbWk4YkVoT281aGRo?=
 =?utf-8?B?cy8yLzVhdXlZSWp1RCs3RS81WWQ3RTdwQnp0VS9QNVdsL04xYWZrQzRwZDg4?=
 =?utf-8?B?SXZ0NjMzdzM1d1VvQk1XclkrSkNYYzQ5QnJEdThGdTJxU2V0TTlOdGpHVkRl?=
 =?utf-8?B?Ym1vSGI1Ym9iSnJkYUViTlhiSTFGU1psL21pVzY4eW9iN2lEOU1TTk92aU9R?=
 =?utf-8?B?NVNRVCs4UXNLTVpnUzZMaEFJeG5hcFRYVklmMVhhRVhtZ1hGQU52ak1xVFhk?=
 =?utf-8?B?bkJLcU8xMGtmMWZUOU9idTcvQWdZN0pCa3RRWVB0VmlITHl0UllYSDNEMFVD?=
 =?utf-8?B?bHdud0VtdEd6MHRjeGtZV0FVV0tQSDlCMklGaXpIUndEbUJBQTcxYjBRREJp?=
 =?utf-8?B?eG5KdUptUVpEajJDWUpzcnZYSytYRCtENHJ3YnBmZlEzdXA2SmhkWno4VmVS?=
 =?utf-8?B?RkJNVGRDRDhlQk12OVhMakpTcURBQ0puUXh3ZHgxWitIM0YweFdIL25xTXNL?=
 =?utf-8?B?U01YMWlrcXMyUVBCVmF1UDVZRE5UU0VBeXZoekJ6QkVLblZWd3hsUmdQQnMr?=
 =?utf-8?B?cjZnMmFaRGhTdVF2aHZxVTVnS0hVeThUTHlZWnl5SFh1Y0RLOUVld0VGN1RP?=
 =?utf-8?B?T3JxWnIwdWlkb2dIWU5qb0p5UnNmV1lnK1E5MVM4VEdpYXlFWkZudWw2UWpp?=
 =?utf-8?B?c0drTStRMmlIZGRTRlJHNGdoVGNBQ25tUW0rcVh2UHhURXVmTDZBZHNWckxa?=
 =?utf-8?B?WEVIYncrQ092TVN0MnpjM3B4V1diK3FkbWZwNXp5dnZYSEM4VGRtVGFaQU5z?=
 =?utf-8?B?SnBGZkpOeElvVzdwYXRZVndWanRodzhFRUwydXhEU0JTOHMwWmg0VzhWNTFp?=
 =?utf-8?B?QVNRTjZ6U1NDT3NlN0tYRHlZUFhqVEZzZTQ4RzBhbU1LN3pXMmhZSU5aZmVF?=
 =?utf-8?B?ZU1wM3B1dDZPbjBSNkN1bDBRTGtPaU9LbVdaeVRyWjRxUDBjUE9zYkRRTHEz?=
 =?utf-8?B?T1J3NUZNYWxFWTlZY3J1WnB4ZkIrdW5lQXZIMHdTbWFmdHV0NU1uL3M3MjVq?=
 =?utf-8?B?cS9IS2NveHIwdDE2VHdRYkorV1FMUzA4N3ZrM0VoREZKNnhEVHZ6VmdaRkhr?=
 =?utf-8?B?NEVRaFBsanhpTFd4NHRrTDBVcVd3ZjVndnBNYVVqaTJkTUFDUFhIa05qeEN5?=
 =?utf-8?B?N1lsL2dPaGg2UGpjQmIrQ0g1QVFSRzM1SERUbXdzSnJCY1lqbFBpclN0MTQz?=
 =?utf-8?Q?UrUeCP2kzv34OIOZipClJgJKNiWQ4PNZFnIOZc78uI=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 915b73ef-b545-42b3-e647-08d9e0ba74dd
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 10:56:08.1217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4s51FERWqRNrDWsfAinwh970G1X1y95NWTOBq/4DYd32iCM51WmGAQUQJ3Mk2h5XVi2RiMnoXFa2twP4h1SdvVvtnmsd/UYXFRO+zIpoT3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6384
Received-SPF: pass client-ip=40.107.15.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

18.01.2022 16:31, Hanna Reitz wrote:
>> +/*
>> + * bdrv_dirty_bitmap_status:
>> + * @hb: The HBitmap to operate on
>> + * @start: the offset to start from
>> + * @end: end of requested area
>> + * @is_dirty: is bitmap dirty at @offset
>> + * @pnum: how many bits has same value starting from @offset
>> + */
>> +void hbitmap_status(const HBitmap *hb, int64_t offset, int64_t bytes,
> 
> In addition to the comment not fitting the parameter names, I also don’t find it ideal that the parameter names here don’t match the ones in the function’s definition.
> 
> I don’t have a preference between `start` or `offset` (although most other bitmap functions seem to prefer `start`), but I do prefer `count` over `bytes`, because...  Well, it’s a bit count, not a byte count, right?  (And from the bitmap user’s perspective, those bits might stand for any arbitrary unit.)
> 
> Apart from that, looks nice to me.  I am wondering a bit why this function doesn’t simply return the dirty bit status (like, well, the block-status functions do it), but I presume you simply found this interface to be better suited for its callers.

Hmm, seems, no reason for it actually. Will change to use normal return value.

-- 
Best regards,
Vladimir

