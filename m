Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CAC43261E
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 20:10:15 +0200 (CEST)
Received: from localhost ([::1]:38342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcX5S-0004a3-C3
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 14:10:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1mcX37-0003cv-67
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 14:07:49 -0400
Received: from mail-mw2nam10on2061a.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::61a]:54753
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1mcX34-0004LI-Pg
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 14:07:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGv05PCM3Xb0uiPwn5X8i/mqJdyqnYx28PG9K02dl/iN+XHZSJEbePHsVycRp1W43jb8V5p7HzD7tOUPDRonoi8MkLA0Dl/vz/XFRJq6IpRCltlAwWNdEbLwKku8DW7BFDv6RkPFF5wq/f7oHorFImxJ7UgcXQ5RDWOrK30O+JVNvAFCAYHIT4AB9hvbK/HWfqvYqq3oQLX/BIDJwWZMt5LTsY70M8o0tiMdESIiFIa6Ua3iFzsMg5rSlSU/5tjm2eZejBJ2aQkuCzyrOVfcGoA6UuZbwinngiA46cyh+VkCDAUtHlZhfMm7BDkN+CmKNXgghUX9858nPnJ8KaXSdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aizYIg8qNSTt6ZLA4scMe/VGbjAN0YQuNbZW6sCcIWQ=;
 b=ENDHg3ptsyY4aJ8bI4juMZz6G/7gC1dvEUBHlXr5mHv7V9kua3v3D+FbDY4PMmEm4PA9CAF05KzuTMOUXq+Z3Ny9bbe07JtS9IedwOnVWirNysubKOwonwuuqsnNODVd/wr4+iuVC1fveP7q/KSYoEjPJ/8g5onh7KTB67I3F0XWavZvtLpKRQMt7FI5772fTrj68s9m4cwB6JPmEPbN8rrT7YcI27Gsx6WZ7LNN7RN98/QWcpxnYKTrFxPidRGYQYGLBMisxpMnXPwcCQOy0kSBKhi6rGwtwCNfer4L6fUYdywbcpbW1S5HY9/vI7H4ZoKgzPT7+yTCyVkFVMrQPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aizYIg8qNSTt6ZLA4scMe/VGbjAN0YQuNbZW6sCcIWQ=;
 b=SkAaKDbSQnOsYTwQbtNXm3csd5npG/8R2Sf9YlEiXDvGCOe8yLrqzpAwp/rk/daFQfPxFr2zzZTuscfq46cdmLPnWMX78zTXkk6jfQD9UuSTBO3mjXbK0KThHd8Ww6p08MfH3m2ScaoSnv6hj0QrrueONGOkmu1v/PpAfefv1nQ=
Authentication-Results: us.ibm.com; dkim=none (message not signed)
 header.d=none;us.ibm.com; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by DM8PR12MB5462.namprd12.prod.outlook.com (2603:10b6:8:24::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Mon, 18 Oct
 2021 18:02:40 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::a87d:568d:994f:c5f9]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::a87d:568d:994f:c5f9%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 18:02:40 +0000
Subject: Re: [PATCH v4 1/2] sev/i386: Introduce sev_add_kernel_loader_hashes
 for measured linux boot
To: Dov Murik <dovmurik@linux.ibm.com>, qemu-devel@nongnu.org
Cc: James Bottomley <jejb@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Hubertus Franke <frankeh@us.ibm.com>
References: <20210930054915.13252-1-dovmurik@linux.ibm.com>
 <20210930054915.13252-2-dovmurik@linux.ibm.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
Message-ID: <3b9d10d9-5d9c-da52-f18c-cd93c1931706@amd.com>
Date: Mon, 18 Oct 2021 13:02:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210930054915.13252-2-dovmurik@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR08CA0013.namprd08.prod.outlook.com
 (2603:10b6:805:66::26) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
MIME-Version: 1.0
Received: from [10.236.30.241] (165.204.77.1) by
 SN6PR08CA0013.namprd08.prod.outlook.com (2603:10b6:805:66::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Mon, 18 Oct 2021 18:02:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d631470e-51fd-4e1e-0a8d-08d992617993
X-MS-TrafficTypeDiagnostic: DM8PR12MB5462:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM8PR12MB54624ED48CAB9AD5D009F0F1ECBC9@DM8PR12MB5462.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jyp8BEzjZGIwRq8BxAQ8H4arH8x21EanbEtJirYcjbouw7OwaY/+gVelJMiS8wK95MxCjwhHNDsIkX7+Lj/aM6UPOlDk/u9XYP5H954Jl6MXD3eZ/ndlMuuWCLvUbrdsDaQfavdvN5dMiqPz8HaUYPYjpL449r1W/7FyeB6zfkHczCD5qEfRoFLnsNE68Xpz+ICyedi1BUHosdZvtktMzEJ4EHqrNTVv8z9fKzC0ypqPzq/wkffxa38kxS2icoJsQDX2WRixvyLMgM5FsSURw+Vcw7naLQIznT0Jbx3Q3Fnn0JVDJAXPrCG7iYKkO8JpslwUigSt/RwMOPAem778j6BTv6Bj0i3fFBPkBWtx6e7X/4INIwVzaqDtOLwc109lR0LOdOzReG+H30/XBCgOQDA+meseu/GGXWXVpy2YEoolhdxoZcW7KvXrKV7yIes053qHB+wsguQI/XXF5lXNJmodoE8I/AIoN7cOnSIzCGErmUxi/ET+I8OhYBUyD/LuVvvR1KHUa4MvhawhByBHZxXpLYCqtWdUbDLU8eF/4jN7FZ46IhjHsTHXYQfxjIOzo+fUjAXF/RkOWXc2U8GPUeiHq/mJn4f5SBPc7InRHh30Q2ACWAdirTxejuBpIqIxOdq5uPong69qVxEq6s5GHjvk2zxJb4gNqTs8w+U1Hjt/HNebmijeWPWhSXHY8rdUOV3gFRPte4KNMQb/IN2NYual3MLj/N/YP6KWxrp4nRYvVgmqJjAh6aW091Atb218
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5229.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(8676002)(54906003)(6486002)(7416002)(66946007)(8936002)(31696002)(2906002)(66476007)(38100700002)(956004)(2616005)(26005)(53546011)(31686004)(36756003)(16576012)(5660300002)(316002)(4326008)(508600001)(186003)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2xmVjZVaVBjeVY3Tzh3Q1lWb2hpMG5FSnkxa3NnY29ONHprTDBIbHhPK1Q3?=
 =?utf-8?B?cUhidkhka24ra1IzZENHQlBScnNsUytWNDlmbkdmZkg1TkI2STJtNng0Ymh3?=
 =?utf-8?B?UTQ4TmhEN1pIc2I3c1FENVk5N1ViMjhEbWVvWjR1bDdlWVdkNVFZc24rbWxW?=
 =?utf-8?B?U2Q4YUMyNVRHRG5EaVFVRGY3ajlkaHJFUWlya3lxaWFydG9RdFZjeGg1WlhR?=
 =?utf-8?B?eGlTaXcxWG5Nb3AzWGZLc3A0U1V6MzZseitZdndCUi9XVmZIV0NTWTNrb3Vs?=
 =?utf-8?B?Z1NDQ1hvVStzVnJoaHhraVpqMDhYRHp5cEk1Y0hjTUdHWjVyZ2paTVpNTjM3?=
 =?utf-8?B?UDUzakg2dU03V1BWOTdTNDc5Z2RZUWdIWm0wN0UzeEhrYnpIOHFpTHNObzZI?=
 =?utf-8?B?bXRiUjN6K09vYTI3bDJCUzEvNisrbDZkdEYwQ1RKc2M2dDhaanYybEJ4OXZL?=
 =?utf-8?B?SUtNQmRzc1dydnhURlJSZzVRdHJKaWxGekxjK3hpUzB3dkJrcEdFR3FVUHgy?=
 =?utf-8?B?N0hydlJseDlEMjBoT0YrSEwxNkRzWHFKanRsa2xOUFFoWG9lR3h2WUhhRGVD?=
 =?utf-8?B?dGJUaTBjVzBZckJsY0tWVDVyZjVzcEp0QkFncGlSdGdXQUlrOGxnQ0lackUy?=
 =?utf-8?B?cHBhWlA4dVdwNlNaMURKcWpIaWVEeU1RTzFXM1ZMQmVFNUYxQS9DTmxqN3BF?=
 =?utf-8?B?eDlJSExnMGR2cHBSTU81Yytya1ZaNmV4dkZ4dGVndEg2eXF1ZGRyOFZQa2R2?=
 =?utf-8?B?NDRiUkNQV3gwT2lEbFp1ZENvUEpnOXNWZzZ1TEFXZVZiSTl5dXl2ZUNZWGo2?=
 =?utf-8?B?bjJXNXlIOExUOVVtTmRDOHhWd3VMUWtxT2NwbUUzTDVwMEZSbHN6dVJjY3VF?=
 =?utf-8?B?c2JwK1NEU2pjQVl5Z09qSUVVTXRYRURTeFRjSmZLZWhqT0dEQzUyWEFnTUE4?=
 =?utf-8?B?eTZyYWlUQXRBMUhIeHA0ak9lRlZZd2JDTHlqZ1FkNUdCMEU4dlhiZEpWTi9C?=
 =?utf-8?B?ei9pTFF5bEhrQncxUHV0cnV5cmRmWDNoVjk0a1ZqR3N3dWdGOGFydCs2NXl5?=
 =?utf-8?B?aVMreFFELzZvczRKM3dQRkM1bHBKQlM2ZnRrc00xMHppdk5ydzBWZDhIb0dl?=
 =?utf-8?B?ZUZqZW9iNGFOMnVpRVV1QzZ3blpLZ1JnTk9GR2Z0dTRkL3BvYWdWZFBLbC9L?=
 =?utf-8?B?elVrUkY2eFppcng1Si9WeFMwTnA1MmhDdUJsaG1ONlRYbndtWXdlenZUeGgy?=
 =?utf-8?B?Y2NqSlMvSjlrR3RlSmx4SHUwZGEyZXpjOHliU0hjM0IzZnlsZVY1QThKOThD?=
 =?utf-8?B?UERQUUlVUVVmU2dBT0JicjdDVXNpWGVhUEtnc043czZQc0hadXZTRFZLQUlB?=
 =?utf-8?B?VWRBT2pMMVpHbTFwanUvbHRNODNBS052eS91cHoxWDRtbEdkN3l4YUpDK2d5?=
 =?utf-8?B?TlgvTGJveEkzMnBmSkZpZEhoK2lJYnkreDMzV2lvbDVMWTJVQVRWUkxEMXJj?=
 =?utf-8?B?QXVqdUN1aG9ZTllKOWhnbTdmbHFwZXpsTVd1Q2hpRm9zUjhZakF3RUNwWnJX?=
 =?utf-8?B?VW5xcFBwZ3pzTjk0MFVSeEVrL2xjN01aOHVOV1hQemM5QTZnYW8zdDFQaGJU?=
 =?utf-8?B?a1RiTnVJc0xleHNKWEpJWEVWNEhSWUdiaEMyZFpFdkZYcXpUUXpGaWE4NWZZ?=
 =?utf-8?B?RU1PQVVYWldoeXNXQWJQZGZCRGJYT3NGcmZKc0daKzdtZkJqczRqZkJydC9B?=
 =?utf-8?Q?UcP67bGuil7xBHFGR7e6LkpcOtheDa6dhmnIcr8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d631470e-51fd-4e1e-0a8d-08d992617993
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 18:02:40.2253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z7Ak3DzaN2LYI2Ydrvc+qfsJ/omZAd+oBNhwUMBYjI/yWXtllcqtAMI8zIg4h8yWvD8H7ula8OeSIKbWwTPOQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5462
Received-SPF: softfail client-ip=2a01:111:f400:7e89::61a;
 envelope-from=Thomas.Lendacky@amd.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/30/21 12:49 AM, Dov Murik wrote:

...

> +/*
> + * Add the hashes of the linux kernel/initrd/cmdline to an encrypted guest page
> + * which is included in SEV's initial memory measurement.
> + */
> +bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
> +{
> +    uint8_t *data;
> +    SevHashTableDescriptor *area;
> +    SevHashTable *ht;
> +    uint8_t cmdline_hash[HASH_SIZE];
> +    uint8_t initrd_hash[HASH_SIZE];
> +    uint8_t kernel_hash[HASH_SIZE];
> +    uint8_t *hashp;
> +    size_t hash_len = HASH_SIZE;
> +    int aligned_len;
> +
> +    if (!pc_system_ovmf_table_find(SEV_HASH_TABLE_RV_GUID, &data, NULL)) {
> +        error_setg(errp, "SEV: kernel specified but OVMF has no hash table guid");
> +        return false;
> +    }

This breaks backwards compatibility with an older OVMF image. Any older 
OVMF image with SEV support that doesn't have the hash table GUID will now 
fail to boot using -kernel/-initrd/-append, where it used to be able to 
boot before.

Is that anything we need to be concerned about?

Thanks,
Tom


