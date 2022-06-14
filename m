Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA20454B6BD
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 18:51:20 +0200 (CEST)
Received: from localhost ([::1]:58890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o19l9-0003Dz-H1
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 12:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1o19Zc-0004DJ-Bb
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 12:39:25 -0400
Received: from mail-mw2nam10on2060.outbound.protection.outlook.com
 ([40.107.94.60]:54461 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1o19ZW-000197-Qd
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 12:39:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mUObyyaa4oJCS38nmqE5Sje5uT6xR/tkME5C7bWNeqEleMqZPtDyKm05Y1MVsU6B/IkaH6jkCBRnCuopW7YJVE+q50nrT64B7+lyyud4tGGUoF+6dCsa5fO9emWTUgMSFV7sXyJjII2QRtKgwqUuy+d1wxdhsg0M8yJ3jaGDUHM73sv1xYQodelItriO2LHNQlYFuuPE/PX/TWzxh1rzJNpJF1LJN+Qg8kpry+QETc/AsJpisgSwbDGjoMwsWK1JL0aiXDaoPTXPwOzwbn7AnPDbsjNSY+g8C0zaduG8K5aPY9eH/3Vtv2f0FBMgUDLFbu0XXuQUpMH6BVkLaZLqtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RfckHRrXpAQc/b8eE2FfLqSFUJ55sah+XHPTfeCgivo=;
 b=QluascCqGWhmFlAzCTiecMoYUge6b0OgbJXvc8tGNIV6XJ8fKcMBz9ipzkzRt/F+LX+EZNtb5RDxCkhZPOLbBs5kBv5pkB+tneEEhRGfrmhoIRpcx69NgkdBKvxT2nBh3lms43Vle7Ef9/wRvBs9tML7hcz0iVyc6mbMVnCXeQCEWwYWaXRL+aYjx1tIv1TrVNWlLSBqpjYkWXixgXHfAOx7ZN8jmWdMrklf0zNHruAioe1mcoilcP2PMN7qjLXXAJ4YT8tcCAZ8m9J0eG6BuBtCPiJsvklfh0NxKOv3g410EE9rPN3va+PRG+m2FZid4zsYS4ECxgSw9wzsA304lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RfckHRrXpAQc/b8eE2FfLqSFUJ55sah+XHPTfeCgivo=;
 b=tmUSKI0xwzT4T6EY6XsefKIwSTceg0ift+WXigV5ckIb014yBOewpt/ml6UETJ8w5Fr3v5ZjhTvOJqLqGXZXh7CwizAelGC28y6Zy8tQJsyrTbeVYvSwBLoy2JZ8rU1T1LFpDQo7INds5PR/0UnwvTALwdGo/XNVK5rD+5LoiwfcsXsKIMjbpYsEYMcB1dlLR/WCFbocRcGRGo4TgpbYEnlObDxVL1aMr3mbtVsVM5MNfdzCi0dbfKVnByc6CaXl/ZL1BekZKCbEpjBuJyAJ6UG6+DGja9mq5F5n42LdI+T64eBFP5mrUClgNwhqyPJOZ7zo6AavqsA2U1AzG23GYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by BL1PR12MB5240.namprd12.prod.outlook.com (2603:10b6:208:319::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Tue, 14 Jun
 2022 16:34:13 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::bc8f:cb9f:6062:34ec]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::bc8f:cb9f:6062:34ec%8]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 16:34:13 +0000
Message-ID: <d090f3e9-2dad-f133-cd57-db84d9e08691@nvidia.com>
Date: Tue, 14 Jun 2022 19:34:05 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 07/11] vfio/migration: Implement VFIO migration
 protocol v2
Content-Language: en-US
To: Joao Martins <joao.m.martins@oracle.com>
Cc: Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Mark Bloch <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <20220530170739.19072-1-avihaih@nvidia.com>
 <20220530170739.19072-8-avihaih@nvidia.com>
 <7186d27f-16b8-8d6d-2c37-902f97526244@oracle.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <7186d27f-16b8-8d6d-2c37-902f97526244@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0056.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::20) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1298643-d72b-4fd2-ace8-08da4e23b74f
X-MS-TrafficTypeDiagnostic: BL1PR12MB5240:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB5240A04BBB3ADE3908C70960DEAA9@BL1PR12MB5240.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hS6dYlDeZ8ocB6YHQa91xDewEMtKpER+VSfeFR1RVuZQbznWrTsfyYdPC+DQMPaAFPvp6BBjnUNki3sJ395PatSZG7Om6gZJhOB8NTUQ/iZzcPlJ0P66gREPZKFKv9ATsUpXhyFwOPAtZNIfeV+5OIAF/FxMRgJCApFIG0E4TvP8tYATcDywH9HY3BX6qORajtZ+LGUaWNYLWdyIFOZRDtRGzY4WTu4IqdL0Kbf6sFP1nY03v20I+Ciy0X2wKi6dZNiaIiU/MMaTTCJiJLfn+fxUciHT48bALBczOmy72V/vKC+WW+oF5ZFpfd+Crm6bzawngXgaMJXdtv7pDiWr1n49LDWb7F6LY6vCfBsxt4i2sfy6yWgBmo6iloV8yNLkuEkLzosAAxFqQfQ7EvayQTLQGWhNmsdXETFFPsOuu+fM8PfE9HvuQg/VX7feCOeucltQGAr+byOYG0KdMwmlcbU+HLwlPOxtbfzSyig/L4r5ApDwIU8Me/hD8RLdectCwEjc9jQ+g9DnsCDlwhixUXObELIxF660sEn21lHkjkrWuFCztINhyLvnAH+Iff0sx0KaoNiKZTlSbJR7AYpju7YhHnE6YzqxR3s+edRch7/62c/YyefZPebYSvJE6Fwuk/N83VzS0bLssFNrul0tcdi/3MG3gJQLUPv+oCyuor6R8BhTWAAsbH6riDAuqXEcalcx9NM1Xo9AU6JZovDDteXnKzzoiDLgfIS+vqjLxK4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(4326008)(54906003)(8936002)(6916009)(8676002)(31696002)(86362001)(316002)(2616005)(66476007)(6666004)(38100700002)(66946007)(6512007)(6506007)(26005)(30864003)(53546011)(2906002)(6486002)(83380400001)(508600001)(5660300002)(31686004)(66556008)(186003)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azZ2eWpJS1I0RENGczNPZWFvVkdReXQ2MzRpdGE5T1RIak05alBZcjVDbmJG?=
 =?utf-8?B?ZUlkK3NrUGNRbWNJZUV2cWNXcXlhZG9CY2J2cHVCakVJTGF0b09BTGJkcjNl?=
 =?utf-8?B?YS9QbmNJV2F1bEllU0lCc2hVQ0hiYXR5RGw3amY4Yys5aFVUQ0JpR3Y5ODJl?=
 =?utf-8?B?elhTNldVTC9pcnFIa21IYTdBeGlGVVRHcGozSnF4MC84TmRPeDl5dWFVL0VR?=
 =?utf-8?B?WU9pRkl3ek15d1JMVnBvSEJrVnphdDVtdjNhelYvS3ZhQTJFVFN4Qkhpc2Ji?=
 =?utf-8?B?WEhpdjBBVXpRS2tXVmZ0NDRONmZ1SmRnSDZBcUdOSHFGNHF5N1dLSFNlZCsy?=
 =?utf-8?B?MnRSTDN3UWhlbklRY1lvMGhhWjByTWkvZFUzZ2pMeVdBOXRpdTQrcWViY2U4?=
 =?utf-8?B?S1BOdzNNc0hReitxcUNXVWx5YiswdmhpUnp2L2VXRUpseU1jT0diMjc1WVdB?=
 =?utf-8?B?SnZlbWgrV3lONGQrczlJdkErdlVHOHBacEMzVGhqVlo3WmNpNHZhODlXV2pQ?=
 =?utf-8?B?dngxUWVhRjc4aWg5QzhzakdLUU9BbTRFNTNCamlvU013VnhtakFMMzlweHBl?=
 =?utf-8?B?VWI2R1Y3by9sM2F4UnVGN2RGQmF1R0xNZDlZMEJyb296Q2RLNFB3dGdqbmxq?=
 =?utf-8?B?cW5qemNLK1lZbzVFQ2lIYm1VUWJ5RmJ1V2IyTURsUG9SbkYvaGJLdm5hWTho?=
 =?utf-8?B?TCtJSVdCdFZHUUFvWkQ1ZFIwWHcxOGx3UmFydzhxN01ZRU9lbjR5REl6Q2tr?=
 =?utf-8?B?VExETHNLUVNOaUxiMVgxTG5UL2JWeGIwRUpFRzY0V09hOFYzK2RTSzZKcHB5?=
 =?utf-8?B?VklxK0NKNWNHNjNJekN4VytMZmx2MXhOdWduYi8wUk1DeW5DT0ZISklCME1a?=
 =?utf-8?B?YWZlZ1Y2UlhFcmNPeHZrWjNzTEk1RklqVVVYUlpSV1dabXFYc2dtd2JPMFZ2?=
 =?utf-8?B?aG1UWjFRZmxqajE3VEc3RFIvbjJRRUNVUWhVQXEzUjFXNXNvQ1huYjFLK2dt?=
 =?utf-8?B?UjRvWjRxUlREV1pFeS9lQlpodUlaYUtWMW9BSE5vd2ptNmwzL2xCL1JTTzZN?=
 =?utf-8?B?ZTROTzZlalRtakdBTkxHMGFGRzJaUTJQdDI4bWlnRG5jNzExMnVQcU90N1ZN?=
 =?utf-8?B?cGJlazJDU25LaWc3SU1iMDBkZ0xtMFNRUzdOeUo4QlZQU05zbHltMVk5N2ZY?=
 =?utf-8?B?WWtGMDRETmJSMVRzOFRzWTFCRDRaNWJHcnJ2WW9mU3Z5WjFlVHdWVmpmazBv?=
 =?utf-8?B?WkhwajZ3clNra1BCblYwakpxSEZtUHdnRm1xN1RSbWFkNitPM0dxRDcwZE8r?=
 =?utf-8?B?OGNVKytYNFpwODRPMnMzeWd6RTRZZXkrMWtoWnVhSXJsb0Z6c1JjQmVBc2wv?=
 =?utf-8?B?NE9LSzZmWGowZW5GTHQxUVczYzRRZjRCQkZvSTlvQ28xMU1tZzR1U1RIU0w3?=
 =?utf-8?B?NWk3TFNKSE5vQURYTnVlek1nQVRrNk1jcFBFOUxYdGgwOWhrVkR0b2luNlFv?=
 =?utf-8?B?UWYzUk5uNFFxY2g3VHpHaG9ENkhWTGRISXAzN0g3TitwYytpcHBzQnhabHlx?=
 =?utf-8?B?VFhrMjJvVTlGU1ZKOWltQkl6QW95ZHhJN0YyV0pnek52bURFS2pjOWRCS3E4?=
 =?utf-8?B?VDhEc0w4R0d5RlRvdU9YVnZqdzRoZjVXR0N2MkVGdlplQ3dYTlhhRGk2MXEv?=
 =?utf-8?B?SzJsS2xLdy9BaEdma29BcFhhSjhsNUtJQWhEZ3poelN4VXNXSWZtUEdSK2VK?=
 =?utf-8?B?K2VlRHQwRXY0OWJ4Rk5CQkJIdlhvQm4vbjJYOEtNT1hkRWRQT2lVdlo2Mzhr?=
 =?utf-8?B?eFVKUGkxZ2VKY29jaFQxcTZaTTF3d0RLMHk3RWJ0U0lBM0JhOXEvbVJ3SWhX?=
 =?utf-8?B?dngrTGpIdWtBTm43dDcrRzZRbDJBRVhGSWZvNlZLc2hQb0c1M2xOOVk3Q2dY?=
 =?utf-8?B?MHZFMEU4QVprdUNnaEpnZWZJVTNPcEZpUDNGSzA1eTIvZjhCMTVRUE5lMFpJ?=
 =?utf-8?B?cEZNUi9nb24vTThhWU42MUUxN0NMVVdHWnNGSUVXbDRMbjhYU2gxekp6TElM?=
 =?utf-8?B?eTlyQVZIUUJ2dWdWdm1PWnFSek9GaTNnYnYzY1VKdkFtUEJWaUZONzArTEtO?=
 =?utf-8?B?YTN1aVhkd2d2QXB6ZDBwVG9EYTF6cGR5VWVrczdONG5VTmFZeWhITmZFdWtN?=
 =?utf-8?B?b0I0UUszSk81OGU2Q1VhcFByekRmSGJmTEszdmlSWmZBZk5HS0NEdS9TMFp5?=
 =?utf-8?B?YURtcmxOY0xwclN3c2Mxc3BRQmdCTWs5c09lV0VRU3U2WXl2YzM5VWRJWUQy?=
 =?utf-8?B?WHducnpVKzU3UGlhT0h2MS9vZldZL0Jsc2JzelQrTTZrVk9OVEI3QT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1298643-d72b-4fd2-ace8-08da4e23b74f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 16:34:13.5131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EpQm5Cwh8kHdr/Rx5nZm+hIAbSUaRjSe8ivRxA68LQB7y2Fz6eiRS2PNWcyNQdYOAhosAuityqVGvbohoueB0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5240
Received-SPF: softfail client-ip=40.107.94.60; envelope-from=avihaih@nvidia.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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


On 6/14/2022 2:08 PM, Joao Martins wrote:
> External email: Use caution opening links or attachments
>
>
> On 5/30/22 18:07, Avihai Horon wrote:
>> +static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +    enum vfio_device_mig_state recover_state;
>> +    int ret;
>> +
>> +    /* We reach here with device state STOP or STOP_COPY only */
>> +    recover_state = VFIO_DEVICE_STATE_STOP;
>> +    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOP_COPY,
>> +                                   recover_state);
>> +    if (ret) {
>> +        return ret;
>> +    }
>> +
>> +    do {
>> +        ret = vfio_save_block(f, vbasedev->migration);
>> +        if (ret < 0) {
>> +            return ret;
>> +        }
>> +    } while (!ret);
>> +
>> +    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
>> +    ret = qemu_file_get_error(f);
>> +    if (ret) {
>> +        return ret;
>> +    }
>> +
>> +    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOP,
>> +                                   recover_state);
> Is it expected that you are setting VFIO_DEVICE_STATE_STOP while
> @recover_state is the same value (VFIO_DEVICE_STATE_STOP) ?


Yes.
Transitioning to any other state from STOP_COPY will first go through 
STOP state (this is done internally by kernel).
So there is no better option for the recover state but STOP.

>> +    if (ret) {
>> +        return ret;
>> +    }
>> +
>> +    trace_vfio_save_complete_precopy(vbasedev->name);
>> +
>> +    return 0;
>> +}
>> +
>>   static int vfio_v1_save_complete_precopy(QEMUFile *f, void *opaque)
>>   {
>>       VFIODevice *vbasedev = opaque;
>> @@ -593,6 +775,14 @@ static void vfio_save_state(QEMUFile *f, void *opaque)
>>       }
>>   }
>>
>> +static int vfio_load_setup(QEMUFile *f, void *opaque)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +
>> +    return vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RESUMING,
>> +                                   vbasedev->migration->device_state);
>> +}
>> +
>>   static int vfio_v1_load_setup(QEMUFile *f, void *opaque)
>>   {
>>       VFIODevice *vbasedev = opaque;
>> @@ -620,6 +810,15 @@ static int vfio_v1_load_setup(QEMUFile *f, void *opaque)
>>       return ret;
>>   }
>>
>> +static int vfio_load_cleanup(void *opaque)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +
>> +    vfio_migration_cleanup(vbasedev);
>> +    trace_vfio_load_cleanup(vbasedev->name);
>> +    return 0;
>> +}
>> +
>>   static int vfio_v1_load_cleanup(void *opaque)
>>   {
>>       VFIODevice *vbasedev = opaque;
>> @@ -662,7 +861,11 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
>>               uint64_t data_size = qemu_get_be64(f);
>>
>>               if (data_size) {
>> -                ret = vfio_v1_load_buffer(f, vbasedev, data_size);
>> +                if (vbasedev->migration->v2) {
>> +                    ret = vfio_load_buffer(f, vbasedev, data_size);
>> +                } else {
>> +                    ret = vfio_v1_load_buffer(f, vbasedev, data_size);
>> +                }
>>                   if (ret < 0) {
>>                       return ret;
>>                   }
>> @@ -683,6 +886,16 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
>>       return ret;
>>   }
>>
>> +static SaveVMHandlers savevm_vfio_handlers = {
>> +    .save_setup = vfio_save_setup,
>> +    .save_cleanup = vfio_save_cleanup,
>> +    .save_live_complete_precopy = vfio_save_complete_precopy,
>> +    .save_state = vfio_save_state,
>> +    .load_setup = vfio_load_setup,
>> +    .load_cleanup = vfio_load_cleanup,
>> +    .load_state = vfio_load_state,
>> +};
>> +
>>   static SaveVMHandlers savevm_vfio_v1_handlers = {
>>       .save_setup = vfio_v1_save_setup,
>>       .save_cleanup = vfio_v1_save_cleanup,
>> @@ -697,6 +910,34 @@ static SaveVMHandlers savevm_vfio_v1_handlers = {
>>
>>   /* ---------------------------------------------------------------------- */
>>
>> +static void vfio_vmstate_change(void *opaque, bool running, RunState state)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +    enum vfio_device_mig_state new_state;
>> +    int ret;
>> +
>> +    if (running) {
>> +        new_state = VFIO_DEVICE_STATE_RUNNING;
>> +    } else {
>> +        new_state = VFIO_DEVICE_STATE_STOP;
>> +    }
>> +
>> +    ret = vfio_migration_set_state(vbasedev, new_state,
>> +                                   VFIO_DEVICE_STATE_ERROR);
>> +    if (ret) {
>> +        /*
>> +         * Migration should be aborted in this case, but vm_state_notify()
>> +         * currently does not support reporting failures.
>> +         */
>> +        if (migrate_get_current()->to_dst_file) {
>> +            qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
>> +        }
>> +    }
>> +
>> +    trace_vfio_vmstate_change(vbasedev->name, running, RunState_str(state),
>> +                              new_state);
>> +}
>> +
>>   static void vfio_v1_vmstate_change(void *opaque, bool running, RunState state)
>>   {
>>       VFIODevice *vbasedev = opaque;
>> @@ -770,12 +1011,17 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
>>       case MIGRATION_STATUS_CANCELLED:
>>       case MIGRATION_STATUS_FAILED:
>>           bytes_transferred = 0;
>> -        ret = vfio_migration_v1_set_state(vbasedev,
>> -                                          ~(VFIO_DEVICE_STATE_V1_SAVING |
>> -                                            VFIO_DEVICE_STATE_V1_RESUMING),
>> -                                          VFIO_DEVICE_STATE_V1_RUNNING);
>> -        if (ret) {
>> -            error_report("%s: Failed to set state RUNNING", vbasedev->name);
>> +        if (migration->v2) {
>> +            vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RUNNING,
>> +                                     VFIO_DEVICE_STATE_ERROR);
> Perhaps you are discarding the error?
>
> Shouldn't it be:
>
>          err =  vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RUNNING,
>                                          VFIO_DEVICE_STATE_ERROR);
>
>> +        } else {
>> +            ret = vfio_migration_v1_set_state(vbasedev,
>> +                                              ~(VFIO_DEVICE_STATE_V1_SAVING |
>> +                                                VFIO_DEVICE_STATE_V1_RESUMING),
>> +                                              VFIO_DEVICE_STATE_V1_RUNNING);
>> +            if (ret) {
>> +                error_report("%s: Failed to set state RUNNING", vbasedev->name);
>> +            }
> Perhaps this error_report and condition is in the wrong scope?
>
> Shouldn't it be more like this:
>
> if (migration->v2) {
>          ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RUNNING,
>                                   VFIO_DEVICE_STATE_ERROR);
> } else {
>          ret = vfio_migration_v1_set_state(vbasedev,
>                                            ~(VFIO_DEVICE_STATE_V1_SAVING |
>                                              VFIO_DEVICE_STATE_V1_RESUMING),
>                                            VFIO_DEVICE_STATE_V1_RUNNING);
> }
>
>
> if (ret) {
>      error_report("%s: Failed to set state RUNNING", vbasedev->name);
> }


It was intentionally discarded.
The return value is used by v1 code to determine whether to print an 
error message or not.
In v2 code the error message print is done inside 
vfio_migration_set_state(), so there is no
need for the return value here.

>>           }
>>       }
>>   }
>> @@ -784,12 +1030,35 @@ static void vfio_migration_exit(VFIODevice *vbasedev)
>>   {
>>       VFIOMigration *migration = vbasedev->migration;
>>
>> -    vfio_region_exit(&migration->region);
>> -    vfio_region_finalize(&migration->region);
>> +    if (migration->v2) {
>> +        g_free(migration->data_buffer);
>> +    } else {
>> +        vfio_region_exit(&migration->region);
>> +        vfio_region_finalize(&migration->region);
>> +    }
>>       g_free(vbasedev->migration);
>>       vbasedev->migration = NULL;
>>   }
>>
>> +static int vfio_migration_query_flags(VFIODevice *vbasedev, uint64_t *mig_flags)
>> +{
>> +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
>> +                                  sizeof(struct vfio_device_feature_migration),
>> +                              sizeof(uint64_t))] = {};
>> +    struct vfio_device_feature *feature = (void *)buf;
>> +    struct vfio_device_feature_migration *mig = (void *)feature->data;
>> +
>> +    feature->argsz = sizeof(buf);
>> +    feature->flags = VFIO_DEVICE_FEATURE_GET | VFIO_DEVICE_FEATURE_MIGRATION;
>> +    if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
>> +        return -EOPNOTSUPP;
>> +    }
>> +
>> +    *mig_flags = mig->flags;
>> +
>> +    return 0;
>> +}
>> +
>>   static int vfio_migration_init(VFIODevice *vbasedev)
>>   {
>>       int ret;
>> @@ -798,6 +1067,7 @@ static int vfio_migration_init(VFIODevice *vbasedev)
>>       char id[256] = "";
>>       g_autofree char *path = NULL, *oid = NULL;
>>       struct vfio_region_info *info = NULL;
>> +    uint64_t mig_flags;
>>
>>       if (!vbasedev->ops->vfio_get_object) {
>>           return -EINVAL;
>> @@ -808,32 +1078,48 @@ static int vfio_migration_init(VFIODevice *vbasedev)
>>           return -EINVAL;
>>       }
>>
>> -    ret = vfio_get_dev_region_info(vbasedev,
>> -                                   VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
>> -                                   VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
>> -                                   &info);
>> -    if (ret) {
>> -        return ret;
>> -    }
>> +    ret = vfio_migration_query_flags(vbasedev, &mig_flags);
>> +    if (!ret) {
>> +        /* Migration v2 */
>> +        /* Basic migration functionality must be supported */
>> +        if (!(mig_flags & VFIO_MIGRATION_STOP_COPY)) {
>> +            return -EOPNOTSUPP;
>> +        }
>> +        vbasedev->migration = g_new0(VFIOMigration, 1);
>> +        vbasedev->migration->data_buffer_size = VFIO_MIG_DATA_BUFFER_SIZE;
>> +        vbasedev->migration->data_buffer =
>> +            g_malloc0(vbasedev->migration->data_buffer_size);
>> +        vbasedev->migration->data_fd = -1;
>> +        vbasedev->migration->v2 = true;
>> +    } else {
>> +        /* Migration v1 */
>> +        ret = vfio_get_dev_region_info(vbasedev,
>> +                                       VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
>> +                                       VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
>> +                                       &info);
>> +        if (ret) {
>> +            return ret;
>> +        }
>>
>> -    vbasedev->migration = g_new0(VFIOMigration, 1);
>> +        vbasedev->migration = g_new0(VFIOMigration, 1);
>>
>> -    ret = vfio_region_setup(obj, vbasedev, &vbasedev->migration->region,
>> -                            info->index, "migration");
>> -    if (ret) {
>> -        error_report("%s: Failed to setup VFIO migration region %d: %s",
>> -                     vbasedev->name, info->index, strerror(-ret));
>> -        goto err;
>> -    }
>> +        ret = vfio_region_setup(obj, vbasedev, &vbasedev->migration->region,
>> +                                info->index, "migration");
>> +        if (ret) {
>> +            error_report("%s: Failed to setup VFIO migration region %d: %s",
>> +                         vbasedev->name, info->index, strerror(-ret));
>> +            goto err;
>> +        }
>>
>> -    if (!vbasedev->migration->region.size) {
>> -        error_report("%s: Invalid zero-sized VFIO migration region %d",
>> -                     vbasedev->name, info->index);
>> -        ret = -EINVAL;
>> -        goto err;
>> -    }
>> +        if (!vbasedev->migration->region.size) {
>> +            error_report("%s: Invalid zero-sized VFIO migration region %d",
>> +                         vbasedev->name, info->index);
>> +            ret = -EINVAL;
>> +            goto err;
>> +        }
>>
>> -    g_free(info);
>> +        g_free(info);
>> +    }
>>
>>       migration = vbasedev->migration;
>>       migration->vbasedev = vbasedev;
>> @@ -846,11 +1132,20 @@ static int vfio_migration_init(VFIODevice *vbasedev)
>>       }
>>       strpadcpy(id, sizeof(id), path, '\0');
>>
>> -    register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
>> -                         &savevm_vfio_v1_handlers, vbasedev);
>> +    if (migration->v2) {
>> +        register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
>> +                             &savevm_vfio_handlers, vbasedev);
>> +
>> +        migration->vm_state = qdev_add_vm_change_state_handler(
>> +            vbasedev->dev, vfio_vmstate_change, vbasedev);
>> +    } else {
>> +        register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
>> +                             &savevm_vfio_v1_handlers, vbasedev);
>> +
>> +        migration->vm_state = qdev_add_vm_change_state_handler(
>> +            vbasedev->dev, vfio_v1_vmstate_change, vbasedev);
>> +    }
>>
>> -    migration->vm_state = qdev_add_vm_change_state_handler(
>> -        vbasedev->dev, vfio_v1_vmstate_change, vbasedev);
>>       migration->migration_state.notify = vfio_migration_state_notifier;
>>       add_migration_state_change_notifier(&migration->migration_state);
>>       return 0;
>> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
>> index ac8b04f52a..6e8c5958b9 100644
>> --- a/hw/vfio/trace-events
>> +++ b/hw/vfio/trace-events
>> @@ -163,6 +163,8 @@ vfio_save_complete_precopy(const char *name) " (%s)"
>>   vfio_load_device_config_state(const char *name) " (%s)"
>>   vfio_load_state(const char *name, uint64_t data) " (%s) data 0x%"PRIx64
>>   vfio_v1_load_state_device_data(const char *name, uint64_t data_offset, uint64_t data_size) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64
>> +vfio_load_state_device_data(const char *name, uint64_t data_size) " (%s) size 0x%"PRIx64
>>   vfio_load_cleanup(const char *name) " (%s)"
>>   vfio_get_dirty_bitmap(int fd, uint64_t iova, uint64_t size, uint64_t bitmap_size, uint64_t start) "container fd=%d, iova=0x%"PRIx64" size= 0x%"PRIx64" bitmap_size=0x%"PRIx64" start=0x%"PRIx64
>>   vfio_iommu_map_dirty_notify(uint64_t iova_start, uint64_t iova_end) "iommu dirty @ 0x%"PRIx64" - 0x%"PRIx64
>> +vfio_save_block(const char *name, int data_size) " (%s) data_size %d"
>> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
>> index bbaf72ba00..2ec3346fea 100644
>> --- a/include/hw/vfio/vfio-common.h
>> +++ b/include/hw/vfio/vfio-common.h
>> @@ -66,6 +66,11 @@ typedef struct VFIOMigration {
>>       int vm_running;
>>       Notifier migration_state;
>>       uint64_t pending_bytes;
>> +    enum vfio_device_mig_state device_state;
>> +    int data_fd;
>> +    void *data_buffer;
>> +    size_t data_buffer_size;
>> +    bool v2;
>>   } VFIOMigration;
>>
>>   typedef struct VFIOAddressSpace {

