Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AEA3BC83C
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 11:03:38 +0200 (CEST)
Received: from localhost ([::1]:51258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0gzR-0000yo-5M
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 05:03:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0gxy-0006RW-UM; Tue, 06 Jul 2021 05:02:07 -0400
Received: from mail-vi1eur05on2099.outbound.protection.outlook.com
 ([40.107.21.99]:37345 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0gxv-0001jb-UR; Tue, 06 Jul 2021 05:02:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j9rZz7A1pzfN5HCsIQueNIbFHeoJGKwxpLf16gNdHf+W0CBnCLXq8sRz46CUa34c1ppuDavCY58fYEVYcwELwtNmtbhhS+Ryq37Pad4efJCM9PssxsAycQSPuKGpNL/S/wlJF74SaZ2KX6nnetyaEFbhWC0sSpGkROu0sSHh2oi6gNQVbESvp7SYcu/bviUg3y8tdUM00LY3uELj0J3pYBoh3Gl/QmU7nDrcF8/2+0YcQ2PtH33u5MwzucXuaSGTnp3wANdCnO0CbfikUWDR3eiU/8Kwa0dA3WmRInzZtx4No3m5kODykux1IZxaohmYrqsJ3wXC7OBkntKwNvCzHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jy+IQWQDqF5847MTd6gZghBgTkAZL+9/MZoAILNVH2M=;
 b=l2jYUcyxDHO4fFXEW6I8RYzQqwO896ADvr75Kzlb/MxxewzCFbMaRpfr/2M+0f6lOKwORrhPdXDot6KbvnfSQ2UsSPHEA8Soqs9XRdGUJdc0m7eFRSPSHtRVZy5+QSPfufRnO/jcysHbzqkutUp9IiZgxooOPydc0l2fXgIcmjghh13EzrIsHEVbYvbCOtwXlzL8IA8fZNX+q6PLfxiOEWxs/t/MGjoQNAIh3SikgKd+jkMiALL5eQetQ7A/dKwE5ehkanq/TIA/RR5+/xdQLSOclfXNyeGG/TtA1r4C7EThZ0OmiYwFQ0eUBRpsDjHL5SLChf+bSNJsFbKWdhB8oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jy+IQWQDqF5847MTd6gZghBgTkAZL+9/MZoAILNVH2M=;
 b=msDd2kY7L+gEyF6YbePlAkSNCHICBvl3hvRsy6nThkwr9DUiwE85T0enSrVVxnRBWmuIOxLPD43aLTCZiK7/OwsCbsmnEONIQr/vfPtc7DNhkDwTw3FC0X9BlYDESp+3FNw97gKQ5UVaVQToxYyFEetIJg6fSQBOaSDsaUAQlTA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4472.eurprd08.prod.outlook.com (2603:10a6:20b:bf::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Tue, 6 Jul
 2021 09:01:59 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Tue, 6 Jul 2021
 09:01:59 +0000
Subject: Re: [PATCH 02/10] iotests/297: Add get_files() function
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, qemu-block@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <20210625182021.803227-1-jsnow@redhat.com>
 <20210625182021.803227-3-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <49db446b-3960-50ea-9693-d3bd5d1701f8@virtuozzo.com>
Date: Tue, 6 Jul 2021 12:01:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210625182021.803227-3-jsnow@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: PR0P264CA0065.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::29) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 PR0P264CA0065.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1d::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Tue, 6 Jul 2021 09:01:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2d31734-a5a8-402a-3e55-08d9405cb644
X-MS-TrafficTypeDiagnostic: AM6PR08MB4472:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4472977EA75D618215C48EF0C11B9@AM6PR08MB4472.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 46TIEyRNGqpOKabdNfv0O8ecDUGLa/4THO7m16msialS9Pqde8iRgTUehjDDi6SUun+F3CYqo+HIaTFpws5CZNDxd0sppMQwmyZn5sw1qMCyA1aefp/r1MI82HqS5JvbDbyR6GW59lvDTsH1XcOB3piOPK9gGEWqBWAPhCJZlcSMiZeso2fe+LSECeh92Zjz4BiEPx2RLkckFFHNSmPX/E0EbH59f5nGe2YtXU46W3xujWj/XQ2lv8OWk2waAdagaZXluNC5tdG8UWacqfjvAEQ8487278PTzWhoXkuFxUgtXSKZfV7qwAd9WIhwilQ1In2ojNq8Jy+EoCd2KuxXBAQAhtx+0vawy2rC4DF2na6rm4byYfSJutySX83JUQ36MKcr+lIG+Xb8MbH0U2+m4P2to6m7w62zU3P51tt9xI+/qSOWnP7Mm/Zwn6PVw+xSkYSn1p6FKJO/PODqlt/9qXF7Tg4Xoj1lT0Lv5cD5wLJI79Ye9NaarrWPolz8k/4MAx2SGqi2PDAoAPiMMkJZ5ayJur4ArDRmV0ErT1rhigiyljYPc+KSSnY8FR9F8qauCGzHvbzj5f+psl+paqUt2x+574xOzdLr/aMUh3Jm4t4W1KulqrEGfdc+Q+2XcwU3ZxuuLTMrQSO4P+vtJRdHYvkGX7kG2FVB1keJD7juSyC5Pk0Kde3u5VbxEdUTyBvi7zeCZ5fZexA7SDAHsXIxa16NTZqrG3GcgjrAUYY8eohwBNBQKcU1FxLdabbAvC3j4A4nh6wKuI1ZkS8dGLiNoA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(39830400003)(136003)(346002)(31696002)(54906003)(16526019)(5660300002)(2616005)(8936002)(2906002)(478600001)(83380400001)(956004)(4326008)(66476007)(31686004)(38100700002)(38350700002)(66946007)(8676002)(26005)(66556008)(316002)(86362001)(52116002)(16576012)(6486002)(186003)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHk4MittQmJXcCt6Yk9iQitFWlBnSTYvcHRXeWxTUjVFcFlvaktBNjFSUk1S?=
 =?utf-8?B?VjBqYkoxay80Nis3d0VRMG5jZ0x5K3F5SWpXT2NZMjU3RjZIUFhBbVhZd1hB?=
 =?utf-8?B?M0xtVnRiZ2pET3ZYSlRpSHFZaktZaXdML3RPVjNZWGhTVG5ISU9kRDhwejB4?=
 =?utf-8?B?Z21jWHdtczl4OVFhcWxLT0lmU2tBcUt6STR0SWI2OUVMNzA1WjdrSHl0M2hs?=
 =?utf-8?B?RG5mRnRMbWVqbG5NY3RGZGRHa1JjOEs2Y1FHNFF0OHJNT0tiRkVoMnRMNUdS?=
 =?utf-8?B?V1VOS1pSU1JWV3FLWHhvUHFVMk5oTzluL1QzZ2dtbUYyTjV4Q3FyZk1scEdP?=
 =?utf-8?B?ckJxM2NjV3ZHOFp1QWwzeG81TnBMSlI5YU9YR0c2Vm9HOVRvT0JmdFZlQ09z?=
 =?utf-8?B?K3NNRVZOV1QzZkpObmRXZ3FEcHY5ZVp3VU9TbmJ6djZucmJKeVV5YWFJUG50?=
 =?utf-8?B?dE05TmZ4OGE2Vjh2UVJFeXFnY0RhZ2liM3pJUTQzS0ltb1p0bWNjNmk2cGs1?=
 =?utf-8?B?dzl2eW5SRlZtZDZIcE5wWHZSQnBKQk83bVpML2pyaTU5NzQycGJUYlNYZ21O?=
 =?utf-8?B?aVNyTThOaWc1eXBNL0VHdHFyWE9LbFQ4d1J2a1E3bmFkenluMnFOTkN4UjQv?=
 =?utf-8?B?NVNRbGRYdFRPOGZHNklCVUVid3ozTld3SG4rb25mbW9CaVVncGc3b0czSUdn?=
 =?utf-8?B?NVJyRzhnVngzdHJqYUJjS2FmNytneUhrR0p0U056ZkQ3TWpYQndabGo4TWJo?=
 =?utf-8?B?WUlmTjVqMEp5WlpLeEd4Y3A3d3JtS2dFeDdMaWlzVTVLMkVnWFhxMExwL1l6?=
 =?utf-8?B?bjFxN1BHNWNwVjdkSlMxdXdrUmJGMkZjbFdJM3JSb1lMc3FYVllFb2tOQUZ4?=
 =?utf-8?B?ZlhQcnE2M0REaGNSRFF4NU52ZzcyYWdlS3V6WTJ6ZjBCOVlvOGhyenhBSVJ5?=
 =?utf-8?B?dGdBaWFYSmFCVGJEa0MxZVoraFdUMTNHczN1UzNTUjlZdFlrMDA4a0Z5MmF5?=
 =?utf-8?B?KzNYQ3gyK2g1eWpodkN2NjZvbkc1RjMySlJHdEVsbTg4LzN1WnVHSkZSUlM0?=
 =?utf-8?B?MTB0TGFRSWRzVjRiWHdjOGl5MnExMFZ6RTlWZ1QyUVVFRHZoNFZNWHhXdWZ6?=
 =?utf-8?B?NVpvSGxMUWN1VzFYR0k0YmNRQmp2UzdPekF3eGJ6R1hwcmtmRHd2QUpKWGxr?=
 =?utf-8?B?cnZKblk5a210N1VjUlFlU3ZXQVZrT3NOM1BkNGFHM0NyRHRSUXlUWVNNNzJG?=
 =?utf-8?B?UlIwbVJJeHR2c0d2ejBqbFJzRzh3NmlPSGt3YzRpR2lIQWRkTjhIRFVSVDlm?=
 =?utf-8?B?QjVaL2J3bVVWN0x4VW83Rk9yRFA2dHk4TmNabDZJei9VKytzOUdlVEM1QWFC?=
 =?utf-8?B?QlM2bmNqQUJkdGw1QzFIQU5IU3ZmNnE5ai95QW84Zlg4QVFjZ3J4a0tVdEt1?=
 =?utf-8?B?RXN3UTk1TE1aMURTMk5Ycm5TVkxXVW54N0M1L1I5RytLQWFSOFE0U0Z0Ykth?=
 =?utf-8?B?bE82dEg2cDJ0Qlp3RVh1bldBblNRcmhFdWZ4Z1RiT0pGRHBKYXFCN0MybWJS?=
 =?utf-8?B?SDdDNWRBR2Z1b2JGblczYnFueGlaemdrS1V1OGhMYUJTRDFscnNTU3U1bUdk?=
 =?utf-8?B?cC9PZWozdzVVd1FPc1VMNVNjUit3Y2MzaEx3M2pvc2ZhRmZmYU9kSkhiTEcr?=
 =?utf-8?B?ajhhaTFUYzdQdW1IUHpuVmFiSFNqZXk5a2ZjR2dZZDhRUWVhZnNELzhQMFZH?=
 =?utf-8?Q?pCOgSA5NyT6v1xgjkE0oAv9kdgBn5ANKx5Sa+Uz?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2d31734-a5a8-402a-3e55-08d9405cb644
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 09:01:59.0164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jRfi+vehJamEiKBp6O+P+lDUSN/2rXJYoCPitEawG0q6Hi5++/D52jzQED0erhfqqkBw9KBxQWQlSvhJn8GulKOWjBX6FWY/ezYK6blhEc4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4472
Received-SPF: pass client-ip=40.107.21.99;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

25.06.2021 21:20, John Snow wrote:
> Split out file discovery into its own method to begin separating out the
> "environment setup" and "test execution" phases.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> ---
>   tests/qemu-iotests/297 | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
> index 493dda17fb..0bc1195805 100755
> --- a/tests/qemu-iotests/297
> +++ b/tests/qemu-iotests/297
> @@ -21,6 +21,7 @@ import re
>   import shutil
>   import subprocess
>   import sys
> +from typing import List
>   
>   import iotests
>   
> @@ -56,9 +57,15 @@ def is_python_file(filename: str, directory: str = '.') -> bool:
>               return False
>   
>   
> +def get_test_files(directory: str = '.') -> List[str]:
> +    return [
> +        f for f in (set(os.listdir(directory)) - set(SKIP_FILES))
> +        if is_python_file(f, directory)
> +    ]
> +
> +
>   def run_linters():
> -    files = [filename for filename in (set(os.listdir('.')) - set(SKIP_FILES))
> -             if is_python_file(filename)]
> +    files = get_test_files()

Hmm. It looks like files in tests/qemu-iotests/tests are ignored now.. That's bad

>   
>       iotests.logger.debug('Files to be checked:')
>       iotests.logger.debug(', '.join(sorted(files)))
> 


-- 
Best regards,
Vladimir

