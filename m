Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38601372621
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 09:02:21 +0200 (CEST)
Received: from localhost ([::1]:47568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldp4W-0001Qi-6n
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 03:02:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldouD-0008NB-MN; Tue, 04 May 2021 02:51:41 -0400
Received: from mail-eopbgr10135.outbound.protection.outlook.com
 ([40.107.1.135]:37309 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldouA-00029H-5U; Tue, 04 May 2021 02:51:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/KcIpru5vxwnbneQmtPUXvF98R4i+5X0vbqIJ5mXOWvX1MRhQG3EAfGpJsw+sfU/7aszajHAcoBSixMQBVYajUbfxbGqpcUH4P27ijOTaP4R4os5OOEJYHUOiMg9O+XGa9EXBK3QumAWeDpbhPwV+Tm7Rn15y7+x90h6jhZxj4XLh3KY9VOhMBP47yMdbHSxi/Dyx/6+PfmLTHQGoZ6f2NCVe9sLHOEOfuupvvldDxIZCM3toZYb4SadXLNYS0/qZuMKVhdOK87v8b4dHktKmOlj4xX1fvfjuwPIsrvf/y6b7GCUOia/IO2hMcBSVkDTGfcGz+Xv4MMZOBd0FpNAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qCsS9a2Q8EiMQxIpN3ggztPbQcA5+9uUjGr2aTZCxX8=;
 b=eDNkA1CQSftlYNszfFjJjWXypgxQaEilF90txSfzK/NUMkMe7tT5cvBB1NAteK/Pl+Qk4ZJ2YVe86/tQBnxd+L8F/xe2mnRzBpPaR5sU8HT2hlN+RvJz0x/PB05v8IVpPtM73xonfaC+lY1ozSHx4ldMaWzrxYGMvFA3zv3F5/8x+VFh25B5BZM4xdARGm3H6dvtN9cQdxpNS5aad+L2XAwN8Q/pAEBiLBc04Dm6wrp3AnaR9unJO5mmq3e6L6FScKK9xnzNJ9qawC1J9HkBjZ8Ih63gGoJbj4P49lYbH5S/exCDGPRYgmGHmTJ/5EUL0AlNRgsNMQYFoVsbJ1ushw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qCsS9a2Q8EiMQxIpN3ggztPbQcA5+9uUjGr2aTZCxX8=;
 b=SJqRaK2G2ynY65nb5w49WKrQRiptFbAlR6Gk0WiPzIAXHN5poRyXi1OK/kVrefZBz99rjXUFPXkVKfBV02fjxKIAY578BPFxGnN0r+awyWZjZAe8ufBYdDOQLRmXqFmQ8fKd4CuKtTeWo0f5dAdlVupOBbKyr55MVGwdwyvbsXk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4852.eurprd08.prod.outlook.com (2603:10a6:20b:cc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25; Tue, 4 May
 2021 06:51:34 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 06:51:34 +0000
Subject: Re: [PATCH 2/2] block: Fix Transaction leak in bdrv_reopen_multiple()
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: mreitz@redhat.com, qemu-devel@nongnu.org
References: <20210503110555.24001-1-kwolf@redhat.com>
 <20210503110555.24001-3-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <d2074232-90ad-fa16-5faf-9bb4d258d9c7@virtuozzo.com>
Date: Tue, 4 May 2021 09:51:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <20210503110555.24001-3-kwolf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: AM0PR06CA0117.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.251) by
 AM0PR06CA0117.eurprd06.prod.outlook.com (2603:10a6:208:ab::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.28 via Frontend Transport; Tue, 4 May 2021 06:51:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e94d4bd8-b45d-4153-a544-08d90ec90e4b
X-MS-TrafficTypeDiagnostic: AM6PR08MB4852:
X-Microsoft-Antispam-PRVS: <AM6PR08MB48520EE786D687A564824FECC15A9@AM6PR08MB4852.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:529;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: srFi5v9X8hNppnAOqlUCvbZDmomf2tkdR16wB5xI39v3vhaWWMnDKu2lvh24ELql/YiAuhF/L6OUsGvuyLJpGzqosEZaCzgOMcnskANIs8g9WLe5KVlXSuP67iOOCg5InL3HQ2La7uDa2JKozBCuJercM7+fDSWmuL42MboAtC3GzFVXK2l9E1YSJDP9XqjHBtz+1V0KmfrWqzzejveOzWtdgW8gEqL6Dc3OS8Wo2HdiC8soKKsBhPio0lMjUhQoJGAO9MWu9jAKPjZC1geMSHIVWOobDlmFZanzZEMTxV0bTZNGqt6VUkWmR8lrrDQIB/94Xx14hqAfT32v4OsExSBBXwi1B/pZ97zIKG5590OZOLbSyr70Ae47rsALmf5qpANSm44DC5a09jEApETqZgsYSA5EPhlQcEfHTbf0e2ESW0bGyMKl5gZWyjjOVHkNyNBwWO10JHGRweWIr79+lnkdRIc26eJSPmxyFh59dh4ZkMIyjHcDEWcsjjO+kawKDf4FGyM1MCAm+vv4FE4tTk9T9EjgFGz+6Muh8XU2+OqNWNsd0AwUM60Tip/7DUd+n8fc6E8uXCCmkLuR2wAuJsRrpwPmMeXBp6bCko6xl6AE9DYSoURMmwCpfH1nknkprcg20ejT/rEcuV+qmindXb5zlzib6HYgVm4iF8vKwnNiCXdzgoXirU9fLyn0S6RuckLOSSxSbyx80AlRAapbvA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(366004)(376002)(39840400004)(52116002)(4744005)(316002)(2906002)(36756003)(5660300002)(8936002)(31686004)(2616005)(16576012)(186003)(38100700002)(66476007)(956004)(8676002)(86362001)(38350700002)(83380400001)(26005)(66556008)(478600001)(6486002)(16526019)(66946007)(4326008)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eGpLWTlKMGJqL2RGeC9yYlZQQWZYMWdUSzc0YXIrZXUrbUxZZjZXelVibXky?=
 =?utf-8?B?MTVGSDE4cC9uQldpT1VDYnp6WXVsZ0JYUXB0YWZHaHllWnJZdmt1R3czd2pV?=
 =?utf-8?B?ejQ5QXB0U0xOOWw4ZXVqR2YrTlE1em5adGdhSll0TmNNSEdtalZhRXRhYXVs?=
 =?utf-8?B?cWFMV0diRjN4K3pWLzhZdTBBL3kxRkxLR2kwVFZxNEtLdjhOTWRjT1VRRUI4?=
 =?utf-8?B?RzNqUFBXdHpPSXl0U0h0WVU5NkdMNk1HcDh2clE1UkMyWHZ4RGNZYTNvOTRW?=
 =?utf-8?B?OEo5RFdWWndrdGphWjJpNDFGMHdBNEVlc3hhaHhidjlsYXgxcUFvN1JtWjZ4?=
 =?utf-8?B?SEROOFhLK2JneUw5QlhCUFppWEJOclI5aGVEQytlcktpOWlUNENxL3VMcEp5?=
 =?utf-8?B?aXFyWVpXbkZaN3dkaGZpNnpGQmxUd1RtWFc2bkR2Ny8wcTQ1S3k4MUZwOW5Q?=
 =?utf-8?B?WTBQM2dkWmRzV1ZXVWdKZ0d1NUxIVE5UU1l0eEhuZmFiQ2JRQ0xJa0FYQm54?=
 =?utf-8?B?MXBJRU5sTkVqL2xvc3MySDdpcmI2SnJkbTBMQTNlOGVNY25MQysvZVZtN2hK?=
 =?utf-8?B?QTNZVjY2b2U1UnZqSmtjYTNxZmJtZzNHNlFQVGNyMW9pdnZXOGNqN3Q0V2J0?=
 =?utf-8?B?ZlZRMXlhVmV3bldNbTkxM1k5ZmNKMmMvanZROUFXUTlGcEVidlhpOG9VVS9v?=
 =?utf-8?B?SnJuLzhJbjV2TjNoYTJIYlVDdGZ2Z0RhMWhxa2pJd2xZVHdRUTEwOUZPUGZz?=
 =?utf-8?B?UWtZVURsRWs2c1BuUzNXbWNDckovOG0xOU5HdU03bWE2WGZSTXZoNW9vWVNV?=
 =?utf-8?B?eTh1bEVxNmVwTUhoUFQvRGc0YmM0azRTQlFNTmJoeHowOG9pZXFicHRNcS9Z?=
 =?utf-8?B?Tnhvd1ZaRUlOZFJUTG1rRGgzdm1tSDV4Ri9jUVNaUzFRN2hWQno2aXJoTUpj?=
 =?utf-8?B?d0JleWdvUnZIWDFsc3p3enZZTWd2WThaMkNiRStNODVLd3J0STU5MHJzRmx0?=
 =?utf-8?B?cEpEeFYxb05MWEhZVHBYVFhTUklUL1BHSDFkREZBOFZJU0FrbW53WDcwdDRa?=
 =?utf-8?B?enBqdzRZdTBZSEdoYUxWZzNYOVd2ZXBVWnVPa2M0ejZWdG5HMzFFUTNUcW1t?=
 =?utf-8?B?UjlQWngwZmc2bkFFOE5CWFdZVU8wTlJtS3QwSWNpYkFjL094cjNRVHczb0JI?=
 =?utf-8?B?c0h0eXJXRGtiY0hVTWI3THUvdGEzUTRpSFpybU5XcHU0MDF6c3Q2eW5Udjkw?=
 =?utf-8?B?VThEaDk4NitJWWJaRjNpb0RWOEE3ZVhkR1MwaEdsTkxYOERaaGZQYUM0eWNK?=
 =?utf-8?B?aTd2YUF6eStYM3ZzTGhQUE0zb2o3eFdnZi9LWDRmaXNBa2VnRXpmK3dScTFB?=
 =?utf-8?B?T1JSV0JpZFQxZjRaZzVpeWEzVGY4Ym9oSHFoR2hsZE9NU1RjbVJYaXR4ekx6?=
 =?utf-8?B?eFVPU0dvakRDSldhRStwUmdTcmNsdlEyRnF4OU14dXhDZlpuR05heEkxb3Vr?=
 =?utf-8?B?R1k2dmUxT3dyYVZTU1BmaWJFRUd1YVFCd1pNMFlwOWVUUk1UU1dWS1dzQ1pN?=
 =?utf-8?B?eTIvN200c3VVVnVoamY0aU9Oa2hJV1pwOTR0Skc1Q0JrZmZBYUNweldFcC9S?=
 =?utf-8?B?b000OHV2Qk1XZkdKVXZyUTBMcWExRHhqSmhWNVdMMUFZUFdWQmhqemF1c1gx?=
 =?utf-8?B?TnFZV1pwTHRmSngvZHNUUy9LWjZJOVQ4WjNib3RDcHdSN1NwSlJaOTZwTWE3?=
 =?utf-8?Q?t7cQHVLm94dpmYy6GvRGrBF2VeuEWv8I27vmuVH?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e94d4bd8-b45d-4153-a544-08d90ec90e4b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 06:51:34.2641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ciSvjO8S6Yczl+nS/TGhikJ8VJRhtpeHunmFLqWE8p/zv0a5bkaHD25MvV3taROljR8dvm4leMLOlJf2wAvqPw4yK5h7NOWtpW7c3E9OBjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4852
Received-SPF: pass client-ip=40.107.1.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

03.05.2021 14:05, Kevin Wolf wrote:
> Like other error paths, this one needs to call tran_finalize() and clean
> up the BlockReopenQueue, too.
> 
> Fixes: CID 1452772
> Fixes: 72373e40fbc7e4218061a8211384db362d3e7348
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   block.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/block.c b/block.c
> index 5c0ced6238..69615fabd1 100644
> --- a/block.c
> +++ b/block.c
> @@ -4052,7 +4052,7 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
>           ret = bdrv_flush(bs_entry->state.bs);
>           if (ret < 0) {
>               error_setg_errno(errp, -ret, "Error flushing drive");
> -            goto cleanup;
> +            goto abort;
>           }
>       }
>   
> 


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

