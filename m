Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F235EF9E7
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 18:12:40 +0200 (CEST)
Received: from localhost ([::1]:40198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odw9M-0000yy-Js
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 12:12:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1odubt-0003Tx-23
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 10:33:57 -0400
Received: from mail-eopbgr50132.outbound.protection.outlook.com
 ([40.107.5.132]:23475 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1odubm-00065c-NV
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 10:33:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iVvUHzfkLEaqJbxVxLxFUTlz2DPHL8ialQJ0UDpgKx5eMfr8TREQuKIJzuy/IFMKTfISNPgduYcyyWzUjx2P0Kx1k86IGhy5P6G2SMfionxGu1pJJuPkdwy9xNrmR1JMKbKoQTUtnnBsKd2XkW5oBhRO6Ajj/gBGMoKBVPv7AJPj6a8CVjZJS2nb82zZ83oADf/5C0ddJ/v+H9rElgk4f6cPy/7UQYvH+/jTP3ZlurzkrpA+Q0B0FqwX2A13V9335dX/36dBBZCX3DAIeEtYUJj9MrsFhY6nARe04VeM7HSDT7bFSaIcOYAeIqCTWjeVsYu+XO/MSFbPJqGm75RAug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yn6PPIBVKpK4SxMzfcG9ehJl3Ka1jT8KpvuLljfsKYA=;
 b=ZghE292HFzhJsY2vLI7qKrysBjrcu72jfbWvKQcFEW0rw8v/EcYHAaCMK5hd/Pc9B+8y/JZAfArGXNxSC6Z4eyWbOfXWVNrG4Ys6wWm/kzzDWWXxLqHYc/tQeTT2GOSAIK/xQIaGS280DptDZCETnYk0XY5gbt9U58X9ctPN6dHqVn3q0TxajHDvZichJwI63nAZ6BvZw5n40tC34PF4tMHcPyOjtoOUNmNK4NrYf3Km7LQ4JB6YGznQUxVbqETMXqm85jITTlMvUwg/mTL2YvxZM5aabj5PyjL/nkWALXR/hKyrnp3aJoSGm+dJns92yv+mY2lZvHU60NDoAUllsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yn6PPIBVKpK4SxMzfcG9ehJl3Ka1jT8KpvuLljfsKYA=;
 b=dwWQN2H03Ktt64OvNKXE4rX+iJf75usFy5EKEmRhAiRnCJ2YH1NYkz1l7aRo96afiNPH/F4y9Ur3lWHuWmEBANHZLSTYkdjr4miOQH6/2UdXEgOleYijQcEpUonRA+F/tNxnuPaTvXtL6y1mOHy0LA8SMJaPxSFhpZKQZUh2MDkelVMvFhVd5rksXq8C4KEOZBTkU/slLskkdUhQSp5HYkAaksWMPgahjfA7oF7N70x17GfyNR4SABXeghXAtWc2AjB2S4OVSqvurd//Izb4DexKwbUDxI8YcRlm+hcxxhxWe1k9CJ6GPpRrl/am5uqRP7/q1zdMZ8+FUSKm8lS4Ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DU0PR08MB9370.eurprd08.prod.outlook.com (2603:10a6:10:420::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Thu, 29 Sep
 2022 14:33:46 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5676.020; Thu, 29 Sep 2022
 14:33:45 +0000
Message-ID: <fd817f02-aa48-3c95-6ef0-6aa6fa7d96ae@virtuozzo.com>
Date: Thu, 29 Sep 2022 16:33:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 6/7] qga: Move HW address getting to a separate function
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, den@virtuozzo.com, michael.roth@amd.com,
 kkostiuk@redhat.com
References: <20220929075239.1675374-1-alexander.ivanov@virtuozzo.com>
 <20220929075239.1675374-7-alexander.ivanov@virtuozzo.com>
 <CAJ+F1CL1N5uZDHEN-vycDzDMKm=WkB29qfXbigeL5ZLM=71D=A@mail.gmail.com>
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
In-Reply-To: <CAJ+F1CL1N5uZDHEN-vycDzDMKm=WkB29qfXbigeL5ZLM=71D=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::8) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DU0PR08MB9370:EE_
X-MS-Office365-Filtering-Correlation-Id: 09736cda-6d2f-4207-12b8-08daa2279da0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5ap5Guzxqx/+ccOGjS7JC/w4g8JLKKbQuEdaVgbbkeOSIfaEnY667dFhBwGbpWEX/SMsWU0FGCDBrWkOi2cBriN3UMmpDEEuayJLVlMg+nIEjb/AfvoL+Up9XQPacnJAnZT+sacOT8ztxsgDCvDQpv5AGnhm5IXRdJYGItRXKI8Px4UsTxV9MaIEQ9GI+elsQhknsT8GVHl634dO6Qgqenkj0wf3m87db+ZlJDQYGH8O1Iz72MuyJkzjqwbQ4jd9mXl1cs4nSZRpRVb3DLldTEq153CO2a38QMQvlSmr9JwaOEF00WNBTA6UAwx3648IuXo2jLXmzS3R/UOvC7fKZk7NGXGD2WOsZQwA7A2O8fYsF5Vagz4BYil+SwLjvBky+uMfGuK6cHmrAjGQcbYfMFfr0CtWamR1FB/WoNfXSXE5dgT5L0YfZs1xCpvXuA0hTgE2CPm0fhnlJciDEbjhdFyUdIRiBpYjvEBvbC+f8bSm5qzxubtPPLVopiBjLwoMjckpoX+1tsMkIZR+w8plTPbg8QYvzKHtoW+NotivAvG7vDixtaXyH8T+vvqnPGWtcU1aCjSps1vMM7OEB9Rh2IxnAvNHO5pOK7jxDVWIDWeYDFqfcCXcSZRiJy7Kmb7ysMy1xKWKne+UY9DNCYoGVm7syVJkwVxzJnrhJBWu+WCuUmt6HBXkTQfcNEpdyJFqL6FoS1ko586qRIv9DFuDIXGY65miG8N5ulUKq/A3DC1fJHd2gQnXbN7ir4StUP/wbuiFRsIXn5xZ7u6x5ptRcT+q69iUc1fGS3S/pY4KA8mpWbmdwkrXaBlDGlCilmPkjTUerYgNPO3Rsx4JPVNb7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(366004)(396003)(39850400004)(346002)(451199015)(6916009)(316002)(5660300002)(8936002)(2906002)(36756003)(66556008)(31696002)(66946007)(44832011)(66476007)(41300700001)(8676002)(4326008)(2616005)(26005)(38350700002)(186003)(6506007)(478600001)(53546011)(52116002)(6486002)(6512007)(83380400001)(86362001)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVVyRUc1by9udy9RZDg3S1VRNDBHbHRhZFZrV08xRXRUQjErRHcwMVpWWW9T?=
 =?utf-8?B?am9ZNFRETi9FWUJIMmxlTG9HYzZoMkdPaDByTzAyWndaVng4SUNTelZsZzRm?=
 =?utf-8?B?RWxobDZVQVJacjBQUC9SS0ppMTBMTjJlYXJYaVVuUFhaa0dMNkRUR2Z3YjZn?=
 =?utf-8?B?UXZXWklUelY0ajdEbTdJVHdZY211dWlReUJ2c3RaSmx2amg4NXpIYm8vcER5?=
 =?utf-8?B?SW5wcWZMelUrYVVKOWN0bk9TTTAyak9CdmJ0bWJvZWxpdUxnTnNwc0FCMFBx?=
 =?utf-8?B?MEdmODlPU0c2NGRYd1JpKzRXYm02Sk9maVJpTEwvdUVyKzljSmkzMWY5VFlP?=
 =?utf-8?B?Nm9Cd3FHM2Fkd21mWm9iR3FEcE44L1VOVUl4cmtNV3h2WUEzYVNTYkdMS2Rl?=
 =?utf-8?B?VTZqU29VTEkwNDVWR1FhWStOSGt0NFRUMHRzVnFVY3MxYlF2VU9BWW5xY3FY?=
 =?utf-8?B?eFJ2bjRCc1VqbHFtZ0tjdk5ZV3ZuVitWbXEvL3crSUZwemdjUk1jYTY1RHMy?=
 =?utf-8?B?SkpPOEppZnpsNWpLdkdzOE9aL0RWck1YMUJDRUZuYUY3SkpCNFh3U0l6a1Nq?=
 =?utf-8?B?c2F2Y3lPYkw3aDBTK0U5RURCaWFSM3NZUWNnclBqWllYTW81VFJRL0VmdlFm?=
 =?utf-8?B?WE5BdGlZYzNlcDlIbnRhdXR3RU0vUks3U0ZZMldvVmVIcmlMVU1Jam9nN2R4?=
 =?utf-8?B?OGlrdjVGNE1DaHBhajg5dmdUakpqNzJsaDluSU1qVUlYVFAvdi9Pb204U1ZD?=
 =?utf-8?B?cG8vbXBnalJmYWhDRUx4bnZobCtNaU5tTUpRc01ZRzA4N01CTktEVVpvdlB1?=
 =?utf-8?B?dXZLeTBuNW1YRnZEUlV3RG5Oa2h4czhzQUM5RHZDL1psUEFCZGp0cmtvdHJ6?=
 =?utf-8?B?OEhCRStKa0thbHEycVl0ZGFPdzhNS0JpL1NPZFg5d2xWZ1FpWXU0elBrdU5C?=
 =?utf-8?B?OFpHdTR6S3F5VTZkQ24ycmczRzJrSkpoQnlVdVBzTFlKUXFNQmJqRitmQzJh?=
 =?utf-8?B?S242Vm5XbXZ0K2ljOWpLNGJJSlNkWjlVYzhYcjRaSEMrS2xGQW13SEVOUzlM?=
 =?utf-8?B?WGwzd2R2QWFTQVAyZ0lQcWNUMTIyQVB1eUlEZmV6Zjc1NEg2M3FqZ21lRDlF?=
 =?utf-8?B?Zmg4SlYwUmdTamRwUWdtSXliSitoZU5VMG05M2xLR2RPc1N0NVFuclo1MWh0?=
 =?utf-8?B?REh0UU1McndsWVJpa3ZNUzR1cENSY3c2V2pPSjNLdVRScmJJQk1adVVUNjU0?=
 =?utf-8?B?MjZha0R1N2FVQmo5VzluU0Z0azg4cmY3ZEcwa0pSWU0wZkFadDFVVFZLWWNo?=
 =?utf-8?B?Y2swaUhuQU4zWFByN1BHNGpLd0lncVVXTHNPVFg3cVZzTjd0dXJaOStaZFNw?=
 =?utf-8?B?ellhWmViblBjb2dIR1pyS0lPTHdNSjR6V29tUUZjbUVtM3oraHVmQ2RnOEdF?=
 =?utf-8?B?RXdTSmJzcWZMdUNoM1VPTUtVb3BoQjFFSEowbWk2M1dmaDBGQXF4alNjaGtN?=
 =?utf-8?B?L1hrOTdJK3EvazRPUHJXK2l5Z2pvaE85elpZK24xRWhyMXAzS0J6Q0NITUlr?=
 =?utf-8?B?dzVjVUFLSUdxc0orZ3J5NzVIUmhvT1ZCejFUUnUxOHg2VWdSMHJtc3RCbnV0?=
 =?utf-8?B?Nk8yUEpKWGJNSE5lbm5PUEREKzVwSzZnTFpEcDRiYk1paklXcERvdkQ2UW0v?=
 =?utf-8?B?akQyaGtzQ2I3bWtvaDdReUZwZDFxb0p2UUdOZjEvUk84VGw2akFiNDlmMjdo?=
 =?utf-8?B?S2p6cGhmWkNocXQwcVNLMHNpOEZYWXowaFVhRkJvOEpPdUFGR2xVTGVDVU9q?=
 =?utf-8?B?Ylg0UGwwd3BKVldFQkRJSS9lenI5TFdkOGhuSEU5S1B4Uy9XNmZlZnZuU1Zz?=
 =?utf-8?B?Vmt2ZHhXbzdlYW1mZTdHMnpRUVlNdzBsQUgvR0FkdGkxL3JNdEZxYW1EUHhB?=
 =?utf-8?B?Zkh2WDdyS0dHdDlGY1g5bzg0M2hiK0QvYVBRS05TTDF4ZTBoNmRxcGhOOXo2?=
 =?utf-8?B?VjJIUTFVR09OZ3RtUnp5UUp4OUo4dndWMmFCNlJoZjkvelVhMGJnSXVvZStl?=
 =?utf-8?B?WXdpVEM0eGw4d1RpT2R4RVc0UThGeW5Id1NVejhwUGJQWVFERENXQVNpbjFC?=
 =?utf-8?B?OWcrdW9Gd1ZZcm1ydDVDMG1CVjcxV256dVJpbHpzcllSU3ZtclFEU2Rjdm01?=
 =?utf-8?Q?m3BZDmSTn4dBlyI1knMqU0I=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09736cda-6d2f-4207-12b8-08daa2279da0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 14:33:45.9078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bSr1hUU6NouVD0Xn+/STN1crQWVwz+qRCe8R6FXjVzAgtgx3BPg3WVlGWWchT9NxVs1t5SCR7P4tZuKIcyIgxH8rAWC2DftxmRChiyY3m+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9370
Received-SPF: pass client-ip=40.107.5.132;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.099,
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


On 29.09.2022 13:28, Marc-André Lureau wrote:
> Hi
>
> On Thu, Sep 29, 2022 at 12:02 PM Alexander Ivanov 
> <alexander.ivanov@virtuozzo.com> wrote:
>
>     In the next patch FreeBSD support for guest-network-get-interfaces
>     will be
>     added. Previously move Linux-specific code of HW address getting to a
>     separate functions and add a dumb function to commands-bsd.c.
>
>     Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>     ---
>      qga/commands-bsd.c    |  18 +++++++
>      qga/commands-common.h |   6 +++
>      qga/commands-posix.c  | 114
>     +++++++++++++++++++++++-------------------
>      3 files changed, 87 insertions(+), 51 deletions(-)
>
>     diff --git a/qga/commands-bsd.c b/qga/commands-bsd.c
>     index ca06692179..ca81114171 100644
>     --- a/qga/commands-bsd.c
>     +++ b/qga/commands-bsd.c
>     @@ -167,3 +167,21 @@ GuestCpuStatsList
>     *qmp_guest_get_cpustats(Error **errp)
>          return NULL;
>      }
>      #endif /* CONFIG_FSFREEZE */
>     +
>     +#ifdef HAVE_GETIFADDRS
>     +/*
>     + * Fill buf with MAC address by ifaddrs. Pointer buf must point to a
>     + * buffer with ETHER_ADDR_LEN length at least.
>     + *
>     + * Returns -1 in case of an error, 0 if MAC address can't be
>     obtained or
>     + * 1 if MAC addres is obtained.
>
>
> Not a typical Error function return value...
>
> Eventually, you could return a bool for error/ok and take an 
> additional "bool *obtained/valid" argument. Just a suggestion.
Got it.
>
>     + */
>     +int guest_get_hw_addr(struct ifaddrs *ifa, unsigned char *buf,
>     Error **errp)
>     +{
>     +    /*
>     +     * We can't get the hw addr of this interface,
>     +     * but that's not a fatal error.
>     +     */
>     +    return 0;
>     +}
>     +#endif /* HAVE_GETIFADDRS */
>     diff --git a/qga/commands-common.h b/qga/commands-common.h
>     index 2d9878a634..2485a037fd 100644
>     --- a/qga/commands-common.h
>     +++ b/qga/commands-common.h
>     @@ -56,6 +56,12 @@ int64_t qmp_guest_fsfreeze_do_freeze_list(bool
>     has_mountpoints,
>      int qmp_guest_fsfreeze_do_thaw(Error **errp);
>      #endif /* CONFIG_FSFREEZE */
>
>     +#ifdef HAVE_GETIFADDRS
>     +#include <ifaddrs.h>
>     +
>     +int guest_get_hw_addr(struct ifaddrs *ifa, unsigned char *buf,
>     Error **errp);
>     +#endif
>     +
>      typedef struct GuestFileHandle GuestFileHandle;
>
>      GuestFileHandle *guest_file_handle_find(int64_t id, Error **errp);
>     diff --git a/qga/commands-posix.c b/qga/commands-posix.c
>     index 6ce894ca6e..0bebd9e690 100644
>     --- a/qga/commands-posix.c
>     +++ b/qga/commands-posix.c
>     @@ -41,20 +41,12 @@
>      #endif
>      #endif
>
>     -#ifdef __FreeBSD__
>     -/*
>     - * The code under HAVE_GETIFADDRS condition can't be compiled in
>     FreeBSD.
>     - * Fix it in one of the following patches.
>     - */
>     -#undef HAVE_GETIFADDRS
>     -#endif
>     -
>      #ifdef HAVE_GETIFADDRS
>      #include <arpa/inet.h>
>      #include <sys/socket.h>
>      #include <net/if.h>
>     +#include <net/ethernet.h>
>      #include <sys/types.h>
>     -#include <ifaddrs.h>
>      #ifdef CONFIG_SOLARIS
>      #include <sys/sockio.h>
>      #endif
>     @@ -2659,14 +2651,6 @@ int64_t
>     qmp_guest_set_vcpus(GuestLogicalProcessorList *vcpus, Error **errp)
>          return -1;
>      }
>
>     -void qmp_guest_set_user_password(const char *username,
>     -                                 const char *password,
>     -                                 bool crypted,
>     -                                 Error **errp)
>     -{
>     -    error_setg(errp, QERR_UNSUPPORTED);
>     -}
>     -
>
>
> Why this in this patch?
Something went wrong when I re-created patches. My bad. Will fix it.
>
>      GuestMemoryBlockList *qmp_guest_get_memory_blocks(Error **errp)
>      {
>          error_setg(errp, QERR_UNSUPPORTED);
>     @@ -2804,7 +2788,15 @@ out:
>              close(datafd[1]);
>          }
>      }
>     -#endif
>     +#else /* __linux__ || __FreeBSD__ */
>     +void qmp_guest_set_user_password(const char *username,
>     +                                 const char *password,
>     +                                 bool crypted,
>     +                                 Error **errp)
>     +{
>     +    error_setg(errp, QERR_UNSUPPORTED);
>     +}
>     +#endif /* __linux__ || __FreeBSD__ */
>
>      #ifdef HAVE_GETIFADDRS
>      static GuestNetworkInterface *
>     @@ -2887,6 +2879,54 @@ static int guest_get_network_stats(const
>     char *name,
>          return -1;
>      }
>
>     +#ifndef __FreeBSD__
>     +/*
>     + * Fill buf with MAC address by ifaddrs. Pointer buf must point to a
>     + * buffer with ETHER_ADDR_LEN length at least.
>     + * Returns -1 in case of an error, 0 if MAC address can't be
>     obtained or
>     + * 1 if MAC addres is obtained.
>     + */
>     +int guest_get_hw_addr(struct ifaddrs *ifa, unsigned char *buf,
>     Error **errp)
>     +{
>     +    struct ifreq ifr;
>     +    int sock;
>     +
>     +    /* we haven't obtained HW address yet */
>     +    sock = socket(PF_INET, SOCK_STREAM, 0);
>     +    if (sock == -1) {
>     +        error_setg_errno(errp, errno, "failed to create socket");
>     +        return -1;
>     +    }
>     +
>     +    memset(&ifr, 0, sizeof(ifr));
>     +    pstrcpy(ifr.ifr_name, IF_NAMESIZE, ifa->ifa_name);
>     +    if (ioctl(sock, SIOCGIFHWADDR, &ifr) == -1) {
>     +        /*
>     +         * We can't get the hw addr of this interface, but that's
>     not a
>     +         * fatal error. Don't set info->hardware_address, but keep
>     +         * going.
>     +         */
>     +        if (errno == EADDRNOTAVAIL) {
>     +            /* The interface doesn't have a hw addr (e.g.
>     loopback). */
>     +            g_debug("failed to get MAC address of %s: %s",
>     +                    ifa->ifa_name, strerror(errno));
>     +        } else{
>     +            g_warning("failed to get MAC address of %s: %s",
>     +                      ifa->ifa_name, strerror(errno));
>     +        }
>     +        close(sock);
>     +        return 0;
>     +    }
>     +#ifdef CONFIG_SOLARIS
>     +    memcpy(buf, &ifr.ifr_addr.sa_data, ETHER_ADDR_LEN);
>     +#else
>     +    memcpy(buf, &ifr.ifr_hwaddr.sa_data, ETHER_ADDR_LEN);
>     +#endif
>     +    close(sock);
>     +    return 1;
>     +}
>     +#endif /* __FreeBSD__ */
>     +
>      /*
>       * Build information about guest interfaces
>       */
>     @@ -2907,10 +2947,9 @@ GuestNetworkInterfaceList
>     *qmp_guest_network_get_interfaces(Error **errp)
>              GuestNetworkInterfaceStat *interface_stat = NULL;
>              char addr4[INET_ADDRSTRLEN];
>              char addr6[INET6_ADDRSTRLEN];
>     -        int sock;
>     -        struct ifreq ifr;
>     -        unsigned char *mac_addr;
>     +        unsigned char mac_addr[ETHER_ADDR_LEN];
>              void *p;
>     +        int ret;
>
>              g_debug("Processing %s interface", ifa->ifa_name);
>
>     @@ -2924,45 +2963,18 @@ GuestNetworkInterfaceList
>     *qmp_guest_network_get_interfaces(Error **errp)
>              }
>
>              if (!info->has_hardware_address) {
>     -            /* we haven't obtained HW address yet */
>     -            sock = socket(PF_INET, SOCK_STREAM, 0);
>     -            if (sock == -1) {
>     -                error_setg_errno(errp, errno, "failed to create
>     socket");
>     +            ret = guest_get_hw_addr(ifa, mac_addr, errp);
>     +            if (ret == -1) {
>                      goto error;
>                  }
>     -
>     -            memset(&ifr, 0, sizeof(ifr));
>     -            pstrcpy(ifr.ifr_name, IF_NAMESIZE, info->name);
>     -            if (ioctl(sock, SIOCGIFHWADDR, &ifr) == -1) {
>     -                /*
>     -                 * We can't get the hw addr of this interface,
>     but that's not a
>     -                 * fatal error. Don't set info->hardware_address,
>     but keep
>     -                 * going.
>     -                 */
>     -                if (errno == EADDRNOTAVAIL) {
>     -                    /* The interface doesn't have a hw addr (e.g.
>     loopback). */
>     -                    g_debug("failed to get MAC address of %s: %s",
>     -                            ifa->ifa_name, strerror(errno));
>     -                } else{
>     -                    g_warning("failed to get MAC address of %s: %s",
>     -                              ifa->ifa_name, strerror(errno));
>     -                }
>     -
>     -            } else {
>     -#ifdef CONFIG_SOLARIS
>     -                mac_addr = (unsigned char *) &ifr.ifr_addr.sa_data;
>     -#else
>     -                mac_addr = (unsigned char *) &ifr.ifr_hwaddr.sa_data;
>     -#endif
>     +            if (ret == 1) {
>                      info->hardware_address =
>      g_strdup_printf("%02x:%02x:%02x:%02x:%02x:%02x",
>                                          (int) mac_addr[0], (int)
>     mac_addr[1],
>                                          (int) mac_addr[2], (int)
>     mac_addr[3],
>                                          (int) mac_addr[4], (int)
>     mac_addr[5]);
>     -
>                      info->has_hardware_address = true;
>                  }
>     -            close(sock);
>              }
>
>              if (ifa->ifa_addr &&
>     -- 
>     2.34.1
>
>
>
> looks ok to me otherwise
>
> -- 
> Marc-André Lureau

