Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F983702695
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 10:02:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyTA4-0000BE-DO; Mon, 15 May 2023 04:02:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pyT9r-0000AM-Vr
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:02:16 -0400
Received: from mail-dm6nam12on2079.outbound.protection.outlook.com
 ([40.107.243.79] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pyT9o-0001Cf-W4
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:02:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uxo1khnJ45ZtrW20cYj1cy3g15NuESkXBYWP2wIu7QA1zNRIBVgx9210S/PpmQ9CZB7MnxFui0mJFuZUzuL+mcP5zPrYa987h4cRG/PYu+0YHpqcL+ayj8uxpFQ1PE1lKMnq1ZjJS18ZKEnGa3hsnL44JOppFDAtggYokshZowiFFciDzYZabEXNDZd+yKU5L8L2nZPWylxHAkooR2Vh2Xidf89uBTmSKRvod9Ej4NXQSmGufrbAb7QuxJVU5gJkj6Q4c3g20zab+ZqSPcEO3OhTBrlX9wdDXpBciNhYoY/U/PWeORWluUkOde2bjnwEy49vwzb3VOTD+/f3GNwlGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U6YpdRDLWDHTHq7mKL38Wq+4fojGE+xRRZiFbf6RT3o=;
 b=H/Ys73NBnQV6gcQExwp0TkSt1Oq1usYcgDgT+hRZ0xPK6OsEuko6hx76M2WWpjmZEBYg2AIaZKP4thU9N/ByojOlUWRZDUbMftC8edI5Rv/LRXEdbJBBW3xMYYtloJFs+jog74y4kgHbNtzT/VuvH7BPANXovih4DkwbuHxIm6YfU+ua0DnOmI3kvGiJzrF1/d+3HthfZM+BswhzzhTynOVrgoqBCLCMJwu2WmN/2FPvx3aGldkWPa2igCMJUSls5Y11p4R4RYckB0ltUHDWepgjuAncat8NTXTr/rpxUeGTzGbzXCUH3HVe+elEeKhxHQ7295UdrSSjHvvkw/dScQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6YpdRDLWDHTHq7mKL38Wq+4fojGE+xRRZiFbf6RT3o=;
 b=DyLhHu8VwxnbB31oNonJr0Eiz8arytd2ZveGsR4Wa/A4dOqr9yHBexsLeuG/WtG7aKgXhq6sBpq7sag4A7N2D8Vb6Y9pHvrfnjqVPeMxKcVBkvkwXbln0Aor2LlJT8ox0ySg0n/GlLMZVh670xlQZA13ykQj0G6aRQY1Qr2wC+ncmedcH0scdarh3PA7n+K1wRKjYfxBSRTF/7Astqy/yvSI5lr9eCPK5MBvtq/6AaSwN0KU+kHYW/rLZR8lsWSaWvK8OZawHGeHh/dpCS2YIYE2wcSj47/AHt5rtTdOXGZh335ItoY/r06nwup1cvlnvejw79f6WzALX0ArcvmIPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by BY5PR12MB5015.namprd12.prod.outlook.com (2603:10b6:a03:1db::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 07:57:08 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::a29a:c3cf:5edf:9dad]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::a29a:c3cf:5edf:9dad%7]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 07:57:08 +0000
Message-ID: <5f516bf7-ed33-f535-106a-51813342e422@nvidia.com>
Date: Mon, 15 May 2023 10:56:59 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/8] migration: Add precopy initial data handshake
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20230501140141.11743-1-avihaih@nvidia.com>
 <20230501140141.11743-3-avihaih@nvidia.com>
 <f673d018-b6e9-a5e1-9433-daffcad9406b@redhat.com>
Content-Language: en-US
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <f673d018-b6e9-a5e1-9433-daffcad9406b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0197.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::20) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|BY5PR12MB5015:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e8955b1-38ff-4a9a-ea3f-08db5519fb4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1Wq+fQU81lr9ngwl/Hj0ZJ1Q/MN3tX9SrKg8AoIKU7fzKAkl5TqAOKlRmw4v5V4fRN/5CEXC/O4/Nf6pEfqsEDY20K0B7ZsKJ6kMAWne/JqlZ/OpNYPiLJurdM/okLhp92okc7jkSprUNACmPitYTMnALR4Xi7mOYm61LxM8P+hjdxLbdGYUoRxR3l67QLa6sn9bNa0ci5JRE8fuQkkyLxDx5Vcqd7kWgr+NV/ZwGB8veKZVu6SdCh4ZAw+n10tbSB0uWMMOh9z4uAZYaaZQxNCtNk0dMQLOptMdHFEPRO657hSo2ccM0McROg/7aKmd91edMSriZtB7LaDC+vIpC6LYS9lE67jFPI7lB/arpogXgF+FTmFZdh1uSoiQT0GvIXuE4dpZm/12dBp/4xfT/BMRGyBNxFosVYhm5PeWi7Dy+gWjbtTI3ciVcp7/KHNGIJ49h6ZoQjZG8XzNg6AQDLYwuAAPItVP7OlIF1UqKczuFidYO5V9aazPX9+/NPPdho1T4eCWRolEnxL1mniP3F1bTdQqUbzM94MSCR+5noPVOvrjmKG6KszA6ajo86K6RmQkVFihZpC9y7JGXhdf7B+/2kqXfZdQxLxrkj9U5Elbyf3+gF7QYqfaT2LbA9wbShw646qpIwf3REtQvlE6Pw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(366004)(376002)(346002)(136003)(39850400004)(451199021)(31686004)(4326008)(316002)(36756003)(41300700001)(38100700002)(6512007)(26005)(6506007)(53546011)(6486002)(478600001)(66946007)(66476007)(66556008)(2616005)(86362001)(5660300002)(4744005)(2906002)(31696002)(8676002)(8936002)(54906003)(7416002)(186003)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTZwRzhDTlhEZ01FWnZOcVQ3bE1CMVBubUF2aWNKQVJndEx5Q2dYRFZRbTEx?=
 =?utf-8?B?V0VidlBpSVJRSFJjeVNGNEtwMmtybTE2elIyVnFpZmFxVjQxb3R3WHV6bEZB?=
 =?utf-8?B?cEVIMTNkc3dLTVVOSFQ0TTVRNTl5NGhRSFZhL09maUpCQ1hIczVmZFZaUlRI?=
 =?utf-8?B?RFVQUEJpVk5TQzM5cFNJN1NLSEwweVk3THY5VlB5STFKcEVLakovcmUrT1RI?=
 =?utf-8?B?L1ROUlhQeWMxdVRwTmFhQXgvYWxoam9aVzdQemdSYTAwNE85TC9ZZ0pnN2dD?=
 =?utf-8?B?TXRYTFRmK1lzTDRLWVZMYzgxOVg3dzV6LzlndUF1OUt3REdBNnhMYndjeTFU?=
 =?utf-8?B?U0lSdThnV2pvdUpheEZNT0R4ZDhQRlVCZC9WOWJHNFBqSlArcjY1RlRvdWh3?=
 =?utf-8?B?SE1IaXpyVmR4VEROemZxb21Sb0tiTTdjazlIdjFOZTFEMVd3a1lobmZaTUVu?=
 =?utf-8?B?a2tmbVdzSTMyamNxK3orazJpZTdIVXd5N0FNYUZtWEZMQWU1V1RMTWpCbzdH?=
 =?utf-8?B?bnkrZVFocnIxZDdLdzZtc2RJZzFEaThkWmVkSFp0UUxrOHRxOTNZUXNJMERI?=
 =?utf-8?B?VEFhdEFHcndvdzNSbjRwVEdDODBVWkMreHlYUEp5bk81eTM1ckJGdEtkbTZx?=
 =?utf-8?B?V1A1aVNJa255VlVrTFFBU01scm5QSmJLZHFISHE4TmdkTHdFaUdEcS9BckQ3?=
 =?utf-8?B?c3BPNVhNTHNBdGdqU1F1amNWbGFNZjI0VmdDQ1hXSVdXa2tabnhTK3BqbTZV?=
 =?utf-8?B?NzBGcWxCeUxWNHV1ZmZNZFZJK3hVZVA1a0dSZDlsa05hcXdUd0VZWk1XZ2xq?=
 =?utf-8?B?Y3F0TktmT3AxbDc1NmJKYURaN0FnU3FlUTh0UkhqZVVZb24vUlJoaG9YSHNk?=
 =?utf-8?B?blhVMGtxR1UzTXc1WEtPaGRJTEE1Mm1iUzFCOStkVEVYLzI3V1htZjdUSVNz?=
 =?utf-8?B?T0cxZHIzNFUzQXhZVlh2RWNCQlVBbU9obEM0Y0M3ZlAzTHZETlluaVg1R2Jq?=
 =?utf-8?B?Yi9QSTYvbVF3L3ovMEVUdEdydUI5QWhQSmxHdVpOWUhkTy96RUtXOHFvSkdi?=
 =?utf-8?B?eU1xSFNLeU1QWTV1OFZvcHovSjhEd055UjEveFpLOUdaVUtqdU1BdVdVT1Fp?=
 =?utf-8?B?bFdSYnRMam1tcmF0VkErUURLM2JPdXoyTHBvaUxCUitsMXo4Rzd2ejZwMmVm?=
 =?utf-8?B?TGhuL0xYbE1NTldKd1dCUTFsYWgxUEtjM2I3RlArby9PTktVRDdyMEV5WFJo?=
 =?utf-8?B?bDlESS9MdFdGaGlMU3JsNzBiQUNtbVY4WUVmYXBRRnhndFczWE1kZGtCdkNi?=
 =?utf-8?B?TUlqK3ZmSmZ6b3pxTG5vNEh4OGphVFFkemdKdWxnenNRS05pRWNnNEVsNUxm?=
 =?utf-8?B?TlpVMzJlNW5jSW9yS3Y0aXRtbEdoQ1FYZ05WMU1QVS9McTRuQ3dmQ3kvSTBk?=
 =?utf-8?B?WEJOYmxHNFRTM3l5a2g4cWZuVm95WlZ1T20rOGlJUW51VnIza0F6MXpJQjgv?=
 =?utf-8?B?dUdoRUtyaVdJQkVNV08yTG0yNkZSdlR0Zi8zZUFWTitvbHVvemN0OSs3Z0lX?=
 =?utf-8?B?c0dOYitGYm9NcFJHbGRPSUhNUG9BcklzZGkvNlZNbUttVEFWYitjeDhSTkFU?=
 =?utf-8?B?aUhQcVlhZERLenVqNWw3ZWxDZmcwZHZab1RoeThGbkNWSWIray84ZjAzamRj?=
 =?utf-8?B?QzY2UEo3SkJBYzgzRVNaOEFJbEhVLzJrZndDdUR2V050dFpjeFhzNXNGUWhv?=
 =?utf-8?B?eEE3TWZEQktoVEpNM3dKTHdBd3RIOWJNNE11d0tUNkQvL2hJVFNud0UxSUxl?=
 =?utf-8?B?QlR4UnNJSEc5WG9wUnZUVkxBRzIvbjRVekpJREFPQnlEQTBwdFhmaW14eGVp?=
 =?utf-8?B?OHpYQjl3a3VKcTl2RGx4MG5nZ2t5TklTMXQ3U2Fwd1I3NWU0eG8vWkdpOTli?=
 =?utf-8?B?Zzh3OUlKUkNHeXFuNzMzcXF6MGFUZ3lndFVQYTZKNDlwZ0p1TFUxMzZ5dmcx?=
 =?utf-8?B?NjVuZk1lVEJ2ejNWZG0rV2dGNWVJbGZEYk9sNmJTZXVXZXpaa1lHcWNsUUtT?=
 =?utf-8?B?R1lGRG5VbjkvRGlwVHNwT0hkUkZFUTQ3NzVqNk52emJxK3dQM1hjcmtoR0Za?=
 =?utf-8?Q?RtJs8PsMi8By9kPIBIhYNQDbX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e8955b1-38ff-4a9a-ea3f-08db5519fb4a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 07:57:08.6820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t2f7cI1FzSIZ2RuNYgvBW9Sbeo+kppXvOdjhqkVocmfS8tE2dYS3eB6clLcrpeB5UBnVVoZ/eSr2IOnYU/AYhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5015
Received-SPF: softfail client-ip=40.107.243.79;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.93, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 14/05/2023 19:42, Cédric Le Goater wrote:
> External email: Use caution opening links or attachments
>
>
> Hello Avihai,
>
>> +static int loadvm_handle_initial_data_enable(MigrationIncomingState 
>> *mis)
>> +{
>> +    InitialDataInfo buf;
>> +    SaveStateEntry *se;
>> +    ssize_t read_size;
>> +
>> +    read_size = qemu_get_buffer(mis->from_src_file, (void *)&buf, 
>> sizeof(buf));
>> +    if (read_size != sizeof(buf)) {
>> +        error_report("%s: Could not get data buffer, read_size %ld, 
>> len %lu",
>
> please use %zd and %zu for ssize_t.
>
Ah, right. Sure will change.

Thanks.


