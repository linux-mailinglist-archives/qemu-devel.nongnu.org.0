Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34636318525
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 07:18:11 +0100 (CET)
Received: from localhost ([::1]:37470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA5In-0003Dj-PE
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 01:18:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <priyankar.jain@nutanix.com>)
 id 1lA5Et-0002CA-IZ
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 01:14:07 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:28336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <priyankar.jain@nutanix.com>)
 id 1lA5Eo-0006YY-CP
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 01:14:07 -0500
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11B6D3ri016398; Wed, 10 Feb 2021 22:13:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=7qY00vLkDVQhSzTkj5dAqHlsFg49niWxwYeCZMBbTlE=;
 b=wIU9XjwLGeDpuD9MzOVGIi11KpHz0m1T4+Yjds7WhADbT9KNX9vizYaiRtimMIBT1DeX
 ojOt0FcCck1eDW7oqiekvxqGe2YUA2T+HKKFYla6x52gccksGq+we3ebixrZpW3mOg4i
 TSGBysfZt133XDy9WSsCWLGIdEdbjFnv8D09b8qKA74KXsd3pION7TTFFdBsq2sWbSsB
 cH2NJPrD/AFOArl5csAzvTEhPKHQPieq8wf4WMHHPrqLeZjQa9Xi/jVQUJiWvl0CLbxo
 hHAg+CGr3Ohc4aFC7vc4+eCrO9gHmoYf/k+7BscxIrdTE4MubxCdNFxeWMO7uxXownL9 Mw== 
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2059.outbound.protection.outlook.com [104.47.37.59])
 by mx0a-002c1b01.pphosted.com with ESMTP id 36hs3djx94-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Feb 2021 22:13:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VBZOoa1qgIKb2ej4+tdhAZldf6nnxruVIBp6QS1a/ZMY6Lnq7/w14X3gQPFgnD3EY9paofSLSItNKhFLh6L/xTBU5GEKTwVlXJ5lzm8VoArYgGBSkRcS4fRaSPsRRlev6t9Jgx+8BTh5IEvMYt5b/31APUAPHMXCYY4nfwSMtYfMXPuB1fbbBJhkWYmQ5jsWiUcM9zfhsV374p2mV7x6WRbl83ttnEK2ORDMzZTXTb5ibVaHwW6p4dam8VibWtq7nJcQ3QvzJ8AYiC619maxMhVreIOF/kN70bD0sM2TWnTnZz9tK1NRk6lZzw+B64IXZwnasd9Fsl2BSMqv5bmUTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qY00vLkDVQhSzTkj5dAqHlsFg49niWxwYeCZMBbTlE=;
 b=dIdzz4ZkP+oxIH1NFtb/EvU1H3ALvRCqNJZVYGPwKGkw807Cb/rIZOXF8EVa6lYhwaE8qQqOqHy3HCrbUjpgxdhauE5cCXjMeyfuJzynDWk96Cz6BvAFjH3kVRIXLc4zNJnzDsl8kIsNOCKxhn7w1omCvRpoIZrwU4MZD35XlNqdDVEadLMCjDnhzzIVJ3jSxKyHr0s2iqMPGoKI7C49KNVL44U3P9p5St0IZg4/8zobl/hC4Mh7ez+K9C/IBMj8MJhfUmD197X/fQpUn+A5zJfJXXSWlsspPxwZ9yxyg8GJAMCFHS4aRMjPn4BY+H0sRZPSNmQKoJxkRRVZtc7bDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
Received: from SN1PR02MB3822.namprd02.prod.outlook.com (2603:10b6:802:31::32)
 by SN6PR02MB5551.namprd02.prod.outlook.com (2603:10b6:805:ea::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26; Thu, 11 Feb
 2021 06:13:53 +0000
Received: from SN1PR02MB3822.namprd02.prod.outlook.com
 ([fe80::550f:6427:2444:2f72]) by SN1PR02MB3822.namprd02.prod.outlook.com
 ([fe80::550f:6427:2444:2f72%7]) with mapi id 15.20.3825.030; Thu, 11 Feb 2021
 06:13:53 +0000
Subject: Re: [PATCH v2] dbus-vmstate: Increase the size of input stream buffer
 used during load
To: qemu-devel@nongnu.org
References: <cdaad4718e62bf22fd5e93ef3e252de20da5c17c.1612273156.git.priyankar.jain@nutanix.com>
From: priyankar jain <priyankar.jain@nutanix.com>
Message-ID: <79e2ecbe-70ba-545a-0695-4f6bb62de93d@nutanix.com>
Date: Thu, 11 Feb 2021 11:43:23 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
In-Reply-To: <cdaad4718e62bf22fd5e93ef3e252de20da5c17c.1612273156.git.priyankar.jain@nutanix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2405:201:5801:a15f:f0c5:bab0:4d74:135a]
X-ClientProxiedBy: MA1PR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::18) To SN1PR02MB3822.namprd02.prod.outlook.com
 (2603:10b6:802:31::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2405:201:5801:a15f:f0c5:bab0:4d74:135a]
 (2405:201:5801:a15f:f0c5:bab0:4d74:135a) by
 MA1PR01CA0102.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:1::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25 via Frontend Transport; Thu, 11 Feb 2021 06:13:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 978626e8-b529-46db-9573-08d8ce5434b5
X-MS-TrafficTypeDiagnostic: SN6PR02MB5551:
X-Microsoft-Antispam-PRVS: <SN6PR02MB55511BCC754698AAF15BF0CF838C9@SN6PR02MB5551.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D2VCz9m+8S+cw5Eei3e9+ezKn6rWTvE74+lt+FW5Jsf4IhONTxyUK7sDtoaqWU495h2bjixWb0q/k+P8caKaWPBvMfzy3SPG9iM70qT9Ep8shx9yXG85rC2hlIGQhx60KOaGI2+ctjB0oIGifB6jJFGwaRo+rb306IXjjT/4WlY9g6tmeOXXWwCcMOdsLr7dRd1qqopNztuc0I1z/WJBrgqEgFOvxJvip8fnFNm3wvWZOfDAogAOwv/6tdR9FBcGIBzy3DLqnV9Lb+RzGIaQqV/oBtjkdbCqBMft4c/ZNK913+dGkr6Q8kiFQMlnyxW2empH8c0l0EVEbzv8Uwa376p8tGHj5Hy1f6yiXuqd3MM7A/SpS7g50Hua0f1bhLkcviNnF4sImE+CfRW6k77akFoEaddy3+3mLhhVZPjIIPXSKeua9E2aAvhWl6nKw9LKz35ekgh1qnkV3gep6okfcqsdQRPR5BsK+s/5YJpN7JA1IB4ugpa0pUDOOxU8hxqoUu+qhboMYg+CUa01E8h0vJV4jJ4AN/I5xOWYHPnZW1ZjR9dSDuJkVaUan9EFN8/4ywlFam3QGgqBfp2m3eIZ9z3YT4UXOeADoS0RJ/5VzPo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR02MB3822.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(396003)(366004)(346002)(376002)(136003)(66946007)(5660300002)(6666004)(8936002)(66556008)(478600001)(53546011)(52116002)(66476007)(2616005)(6486002)(16526019)(186003)(4326008)(31686004)(86362001)(8676002)(31696002)(83380400001)(2906002)(6916009)(316002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SS91bE5iZUtiNVRTK2tyT2x1eU5PanQ1QS9NdUVVT3BqL2c3UmRUa2FtK1ps?=
 =?utf-8?B?U2ZCc0Fnb2h4aDZNM0ZmeXpuekVSU281TWZmNDd5dHpTSVlrekZiNWtPOUcx?=
 =?utf-8?B?MFFNMmNJSis1eUorVStUcnRwRlhJZTVJK0xtU2h3VHA4djlXUlVJU0hxRGN2?=
 =?utf-8?B?OGRlUkJBcDlDVTUySXZwNGUwdDl6SGRDdmFDS2Z6SnZHUHpYK0h3ODhMQmZk?=
 =?utf-8?B?bUNKa3A0UjBkVExUWTdmK2paRFNjZ1ZuaGg1ZkQ2SzNoRGEraytZNjk2TVIw?=
 =?utf-8?B?NFQyYkFRblEwQWErZFZKOXM5bVQvNmRvY0NCdFRaNW53aDFMck1tVWh4K0F5?=
 =?utf-8?B?QnlVaXRkRTgwbkhDc2Z6MGN4MTE2N015bjNVak5JRGxqSE5PNTZ2d0Y1SElM?=
 =?utf-8?B?QzJuanRQZnRtM01PTWFhTVA5NktWQ1JVWnRzb2ZsYm8wUmpNSURxMEJXN1ds?=
 =?utf-8?B?NDFFNklhS2h5dEdGaC9DT1ltNGJxNEM2OVBEVWJVandrdXVZSFlWZGpWdWZ4?=
 =?utf-8?B?cFF6SlFZMkVMcFlZQUNHdERkTWtlRVB5ZFJXUDdkTEUyeHBzLzF1UFdhVWov?=
 =?utf-8?B?cTNUVjNkd3hVdlZlYmorSUd3LzFpK29qRWZSY21wRzkxak1EdGU1cjNVUVVM?=
 =?utf-8?B?WHphTWJZc2FoaUNZS0QwRmVod1VnNk44NWJ1TDhxblJZRktXbXRnNmhiRjR6?=
 =?utf-8?B?cFhuend0VFYyaGpCUndNS2FjY3FMWXkxMFM2MWN6d2VScHJRc3VRVVdzSHdG?=
 =?utf-8?B?YkhZTWtVd2w2R0QwNS9CUEM1N214V2J3dTR5alJGeDdDME0xU2M3bUQxTGlB?=
 =?utf-8?B?NS9kVzk1RWtzMFJRRFovYVBEK1pRK1htTjdtaFlsNTlFSjlIL3NJZGs4anF0?=
 =?utf-8?B?Y3ZaTzV3K25nZURVZTVWam9tK0dUUkNiNVVoaUltMUJzVnFQTmJsSzMvM0Nn?=
 =?utf-8?B?ZXFockFkTnlweStiMEVnVGxTMFNQNkVLb2ZQZkh5STJsNjZaTVFvWVdlK1hO?=
 =?utf-8?B?dkJUTDFTVHo4Y1hOWlN3WDVlTllvOW04bG1ZR0NRT3RoVGRiUVNKWWJMZXly?=
 =?utf-8?B?R1Q0TDRycG50QWNoWDlnVUN6cXlNcXp6UWZZMlRLYXVMVTdsUHhvMnVaam9O?=
 =?utf-8?B?MHFIZ0JLV0s0K0VkSk1PRjhZK0k5OFVDL0h6WHkvZHpGdVVrbEc2aEhES04z?=
 =?utf-8?B?UWdQQjhCZGh4N1BsT05IYlF6bEpZT1JLR2E0dUxUZExPTlF6OGFuT2MySnFK?=
 =?utf-8?B?OENpRVpPT0lqMlBNaGxDSis5NUx5SFlNZ3FBNWw3LytwRzFRMnp3UjF3czBj?=
 =?utf-8?B?NVhhNEpiVHcydzUvNUQ4U1dsekxvTmVLY2tEam9WNWxYWFZEdlVIbVc2K1FG?=
 =?utf-8?B?Qmh5WW0zc3U2MlFiQVFSRzhXSlRaWHpEbTZML2FscFhtcU56V3pxdXpjUERH?=
 =?utf-8?B?bTVtNXV3R0JGZlVsQ3Q0VmtvOXM1VEFKcktJUHVYV3pmMUVabFFvd1phSUd0?=
 =?utf-8?B?YUpPeFdpbGtmWVFIVXRlSnNLYjdSWEZ2YzQ1eG8yelVwQ3RwcG14NFlpazMx?=
 =?utf-8?B?Rmk4RVhRTWRDSjhxUU85dWxHa3BPaDZrM2E2VHVDbENhbmIxSG5iR3JCSFJZ?=
 =?utf-8?B?TjNSK21QdU1tZjA1a3V5cGpocDJ1azMwT0ZlQmVrV2lESWlGV3RYRHZXdXlQ?=
 =?utf-8?B?QXQ5MDVZdjNtNUFmY0YvZVc3WXQ3NDhMLzZJdVk3b1VQRjBDQ01yZ244ZURE?=
 =?utf-8?B?OXNUcEh3Um4yWDd2MytTSHpSRUZxMFZXbE5TakdSeWFzVmVselc4aDJKSHJu?=
 =?utf-8?B?NjNucEVlVi9qcE96bitMdHpab29oaE9vYTBGKzJYODkvS2E2MXlKYldmTktD?=
 =?utf-8?Q?X3ILnX12dKKyl?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 978626e8-b529-46db-9573-08d8ce5434b5
X-MS-Exchange-CrossTenant-AuthSource: SN1PR02MB3822.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 06:13:53.1614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YrBxPoI/0ussDYeEqpZA56fyysPo6YPbr12g8UtZvS8c608/el4daXfjbSZTf4Cz3Cyuzjk+mns54PdDSbKWTy5vCPWeTpZQwuaqmmJkt/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5551
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-11_05:2021-02-10,
 2021-02-11 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=priyankar.jain@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.211, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Marc,

Requesting you to please pull these changes. Without this fix, migration 
is failing in case any helper has more than 4KiB of data.

Thanks and Regards,
Priyankar Jain

On 02/02/21 7:24 pm, Priyankar Jain wrote:
> This commit fixes an issue where migration is failing in the load phase
> because of a false alarm about data unavailability.
> 
> Following is the error received when the amount of data to be transferred
> exceeds the default buffer size setup by G_BUFFERED_INPUT_STREAM(4KiB),
> even when the maximum data size supported by this backend is 1MiB
> (DBUS_VMSTATE_SIZE_LIMIT):
> 
>    dbus_vmstate_post_load: Invalid vmstate size: 4364
>    qemu-kvm: error while loading state for instance 0x0 of device 'dbus-vmstate/dbus-vmstate'
> 
> This commit sets the size of the input stream buffer used during load to
> DBUS_VMSTATE_SIZE_LIMIT which is the maximum amount of data a helper can
> send during save phase.
> Secondly, this commit makes sure that the input stream buffer is loaded before
> checking the size of the data available in it, rectifying the false alarm about
> data unavailability.
> 
> Fixes: 5010cec2bc87 ("Add dbus-vmstate object")
> Signed-off-by: Priyankar Jain <priyankar.jain@nutanix.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   backends/dbus-vmstate.c | 20 +++++++++++++++++---
>   1 file changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/backends/dbus-vmstate.c b/backends/dbus-vmstate.c
> index bd050e8..3b8a116 100644
> --- a/backends/dbus-vmstate.c
> +++ b/backends/dbus-vmstate.c
> @@ -204,6 +204,8 @@ static int dbus_vmstate_post_load(void *opaque, int version_id)
>       m = g_memory_input_stream_new_from_data(self->data, self->data_size, NULL);
>       s = g_data_input_stream_new(m);
>       g_data_input_stream_set_byte_order(s, G_DATA_STREAM_BYTE_ORDER_BIG_ENDIAN);
> +    g_buffered_input_stream_set_buffer_size(G_BUFFERED_INPUT_STREAM(s),
> +                                            DBUS_VMSTATE_SIZE_LIMIT);
>   
>       nelem = g_data_input_stream_read_uint32(s, NULL, &err);
>       if (err) {
> @@ -241,11 +243,23 @@ static int dbus_vmstate_post_load(void *opaque, int version_id)
>           }
>   
>           len = g_data_input_stream_read_uint32(s, NULL, &err);
> +        if (len > DBUS_VMSTATE_SIZE_LIMIT) {
> +            error_report("%s: Invalid vmstate size: %u", __func__, len);
> +            return -1;
> +        }
> +
> +        g_buffered_input_stream_fill(G_BUFFERED_INPUT_STREAM(s), len, NULL,
> +                                     &err);
> +        if (err) {
> +            goto error;
> +        }
> +
>           avail = g_buffered_input_stream_get_available(
>               G_BUFFERED_INPUT_STREAM(s));
> -
> -        if (len > DBUS_VMSTATE_SIZE_LIMIT || len > avail) {
> -            error_report("%s: Invalid vmstate size: %u", __func__, len);
> +        if (len > avail) {
> +            error_report("%s: Not enough data available to load for Id: '%s'. "
> +                "Available data size: %lu, Actual vmstate size: %u",
> +                __func__, id, avail, len);
>               return -1;
>           }
>   
> 

