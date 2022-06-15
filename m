Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A8654C224
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 08:49:40 +0200 (CEST)
Received: from localhost ([::1]:54168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1MqQ-0000Wz-Uu
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 02:49:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1o1Mhq-0006Sm-PZ
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 02:40:47 -0400
Received: from mail-dm6nam11on20605.outbound.protection.outlook.com
 ([2a01:111:f400:7eaa::605]:28128
 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1o1Mhh-0005Vw-Oa
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 02:40:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cRntjXWMwr8UjI/Y89WQfz+ZneNV8Lyc7/QlzexPsfBlwwG6fLyjvtQORnDvAci5g54M/LARIvIzKjFO6c2CdUr/jZPrRSHp+rRMrosCmGoEZuf6Pe5AuKAnYoIhQdsB2/hBfAOgtQb7M+k141RRHbJA+DZM6b4gJbF8xPIHEXeOAosud0kAoFHAX/LjWbHA7ZPrQImFwH4Mm4hNXn+bQkOVTRb7rf2rWlq8vtxAPjB/Sp1zMHa+UOgrWzfuN/+x1mRZlh1YdgTnvh+EgTYavDPByU+KldKY9Czy/1S7KVwPNXstsZPO3NQdfnklWC7U8ZcYjsMePUNL/I/2qWnORA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FK+eYtP9gx10qDzAXoJEupfBuT92QaObJYvXou/GRI8=;
 b=k+Y0ZpOdZtQoSfwDJkqsmjbdC6L7KlGZNd7b2H+805ARXpCugm5a6atI1I2rBLKdnSG2/ubytqQjbC8c/Cfg2gmKdhzeudp+AKaTXKqwHoaYL/mG5caHbmUed1wNz+yACMixYzYG0ZEqmR5wFZ6+rAxgN1SVaOaFhlDn82DCV3RSmgLZ+nzfLnHj/jgwjNJsfT1OJv2nqR8ewhzmAKT3w3oT9wstG4RZ2PgXft1zg6qn2VQilFemMt5w19BnKxlTYLkAhsWmwjiGtVSh5SUzvklzWo0OM6p9oST0auwLUWit9rIR8Tlz1/4crV32OWNR98wXxEObWUf0bQ8Ihm1jxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FK+eYtP9gx10qDzAXoJEupfBuT92QaObJYvXou/GRI8=;
 b=La0MG42+vqWUnXwJcxMjxgnp9pMe0/vL/jlVyMRn7ZG9WsMSZhW+gbLRf2nhinqvszMvcRTxGKeX9KPQso+llmhHb3mW/XpeqG1W13EB8o7YL9uVA0U9ONQ5M+cGsNVyDm2oCls2P7RT0qUbGBYX0XHSeGPFmCxbuIvzyFowmD8ftJVTbCN9e4Fa4KTjp15ubxh7eOO351ZX+FFFYQnLeczv1w0rHv59Uybk35qbcMmDg1eq4oxXjW3TgW3GU5GU5oTNxNffbOFmCflOLv1NUIsjuHMhSKCXZvaoqN1sYfzyALJZh20GCA5XNPN9slvLsenrO2u9p2XdGph4kHm4UQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB5544.namprd12.prod.outlook.com (2603:10b6:a03:1d9::22)
 by DS0PR12MB6390.namprd12.prod.outlook.com (2603:10b6:8:ce::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.14; Wed, 15 Jun 2022 06:40:34 +0000
Received: from BY5PR12MB5544.namprd12.prod.outlook.com
 ([fe80::922:fa59:c7e3:128c]) by BY5PR12MB5544.namprd12.prod.outlook.com
 ([fe80::922:fa59:c7e3:128c%8]) with mapi id 15.20.5332.022; Wed, 15 Jun 2022
 06:40:33 +0000
Message-ID: <0ffa9c4f-335f-2bb0-cef9-b8f6c0e2ee96@nvidia.com>
Date: Wed, 15 Jun 2022 09:40:25 +0300
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
 <d090f3e9-2dad-f133-cd57-db84d9e08691@nvidia.com>
 <3d064847-f69a-66e5-ab3e-bcc5eb566ebe@oracle.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <3d064847-f69a-66e5-ab3e-bcc5eb566ebe@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0430.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::21) To BY5PR12MB5544.namprd12.prod.outlook.com
 (2603:10b6:a03:1d9::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5813c979-28bf-48eb-38dd-08da4e99f28f
X-MS-TrafficTypeDiagnostic: DS0PR12MB6390:EE_
X-Microsoft-Antispam-PRVS: <DS0PR12MB6390F35F9E0B8AD6A3CFEF2BDEAD9@DS0PR12MB6390.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +2iQ37YdXKGnO1HgT0QmunqS25LENO49lqO1I5H9NVJmF9p33jcHbeYk4HfBnAhuZFjl677CIxwoxZScVXB9MswOl2BnAlGgidKauca2JnA+qrqhN7ek2JRb0CzlsUUMhPk96Pg+pwwpVm3aEiw5PZa5DF/BHzMRkC2s0L37n3c0mUU5asrwT4HTPY7ZYQaCjxs0DZPKkR0QudZou+KIA7OPbtruQf2yANHYzdHajda11aXG9okCZAEMstaueOnvOTCt6QtJxA6L5ndnYnkgYctA4TPcSlnq1/zKKkig5Wa/MUTQi96yZziouWCz6m6qe57FZA48dH+yAcFEomS3DT1NTDUu41Hm6Sp7R9bC7rFKEiOZlnXva7POucIHKMInvEHI6AEIojJwrqXQgYYMCRigR/55SpUZYnsaAitXYoq0cIix1ubnYMzC981wkG1IARyDhofkBWqhDNiEBY3V1hDAeWWuH9RsHzuPV4D++6UXNPFN1Mv7iBQoFLIBDq07YB9+ev8bF7QvIqsRzB3Ct3TvS1m6MgT5ILpE7B1iJpWYxDrFZdG2cJpoXTEwdnvSo2Niep6FtSTTUlVwQ/MyR7Ekd41EeVSAIWLHVN3fRpgTaRITCVqz1hUshAuZCrEiuiGBHf4BPXQORHy7Tpr5k7QXcyRUug+G0x399pXKB0KCskaYDGu0GwaBawp3w/0I+x8y88O+17h/6kOaQmjAaRseFxEMKwErnr5+Dv1cb6blJuwVEYlyxQ1bm4ExUmnM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB5544.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(6486002)(508600001)(5660300002)(8936002)(83380400001)(186003)(6512007)(6666004)(86362001)(2906002)(31696002)(26005)(53546011)(2616005)(4326008)(66946007)(66556008)(66476007)(6506007)(6916009)(316002)(38100700002)(8676002)(36756003)(54906003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1lxQ05NY3dpd25kcDRhZk4ra1UySkIzZzg5NldDRnNDblpNQk5VWkM4M0Ux?=
 =?utf-8?B?S2Qzb1RPVmhHSGt1bUpFWmg5eXAvT2Y2MW1mMjdHSHNxSzRoL1l2VTRxM1Vx?=
 =?utf-8?B?bjZjRHJaK2lyVXRWR1puSVUyQStTWGFWS3F2UWZGSGU0cE53NkhlS0plSHZq?=
 =?utf-8?B?b1ZWYzhVNVpHcy9wZ2FQelI3eDlZaiswTjYzSHc1VnovZkNqNk81OS9BMktO?=
 =?utf-8?B?THhnWWNWKzdNSmJiNHBSeEd2cHRKT1VaQXpTdGN4QW9SUkpDZ2tLMVQ5MHpp?=
 =?utf-8?B?V28rYzZGOGNSaTFJSVNiNU5oOURXU05QMndJN0JZYnd5RmNDbnB6OUZ3WWM3?=
 =?utf-8?B?ajlJbFZPSE9aVkkrVmhnbkZjcmZ5alYyelNxUXpxWENmNmtFNFNUSS83NUhQ?=
 =?utf-8?B?ZmdJMmRRWEplVmJYMXBxRElSeGNaT1dudXpCa0wxc3pTcnZWVUhoa0FoWnAv?=
 =?utf-8?B?cGc5VGM3VVlZSnc2WlRKUVNsL1Rnak85OU80UzUxVFJqaHdoN2JPWmxnVVlk?=
 =?utf-8?B?K21Vb05IbE1DUGxmZDZqWENPYVpvTThnS1dIMjhtUWtzN3E0NFAzQlhpMVdt?=
 =?utf-8?B?aGpJN2YzbEhPZFQvNTVuR0RWZXRSbi9NRW9kazlSY1JjUkZDRnZEVnoyMm5o?=
 =?utf-8?B?TDdSaGYwblpPSGRFczUwUjFaaEpZYjhzdUNQTDhiWGhqY0JIb1VLR0VwR3E1?=
 =?utf-8?B?SmkvbTc4VzJLUlZaUkhodm9JYkF2Uk9lTTZXWW83bzQ2RVlXZ1c1dmErTzh1?=
 =?utf-8?B?Wm9KYzlGNkpwZkJBQ1FGK0pOQ0txTGFRMDI0NlR0VngrcnBCMnpkMHd4L1BQ?=
 =?utf-8?B?amorakl6bVV0Yi9uT0sycTRhR2xMNVN0YmU4ZVpvMkVSTC9nU0xMUzlKdDFr?=
 =?utf-8?B?blpEN3V0cmF3TEZHTmg5TklmTHhhcjNkRnlQUngzcHk4cDV1NnBQcCtWRjdt?=
 =?utf-8?B?cHY3dDkzTE53LzFabzNpSVdTRDQ3SzMvdFFoVUJKejlOdHl1dG1Jd3MvQzEr?=
 =?utf-8?B?ZEVpa05rY3FaaEFyVXUwZTgzVytFSEZaRm4vNzZLa2orS1NvSmRSKzc5VUw4?=
 =?utf-8?B?d0R5WW5QSUErakdIaE9SZHMrb1BKMndubjhkZ1YvU2JGL04rTkpWNWo2Zk1C?=
 =?utf-8?B?VXVRSXhSWlp1anRkbVhnZ3c2WWJ0TXNJRDJkMThXcEYrVVRDNWJZaE1NazEr?=
 =?utf-8?B?dTNqbTUyYmt4NUh4djJKQ25DMENpWHYyM0d3STR6ZS9KRXdRVUYwbm9QLzE0?=
 =?utf-8?B?cW5aODZ0R0JnN0F5VGtHMGpZbXk0Zmx4UUl6Mi9TUWpqUXAzODBJdnllb3Z1?=
 =?utf-8?B?bmFhZElEWVFFTmVFSk41NkdvY1VkWFFSU1pCOG1zZXBudFhYMGN2MW5sSHZv?=
 =?utf-8?B?TXUvUVBaNjJ5R1V4SlpwL1ExSll6UTVhNkZhSHpiWGhHOW5nblcrV3lCMFEy?=
 =?utf-8?B?OExiN3RBeE0xRWFoZ0xDQURQa01hUERCak16MVBJc1JBcmxKd3gwUmc0Yitn?=
 =?utf-8?B?S2toM0pqUTNnQm50eUh5UnFUYk9UVHJmREFOd2RRZ0pKMFNxc3UrQURiQVBM?=
 =?utf-8?B?djRueG5DVjNHcTFtaXhQaDluMlNDQ1dmTjZFVGIwajRwN3lyWHZHdEVHWTZH?=
 =?utf-8?B?d0lJQTVGdlY3aVNVb3dHSjRwd1RPNjdaMmowUkd2TzdITTZuTnlYZ2dOU0kx?=
 =?utf-8?B?aEw0dlVJMHVYMDFDVkdlS2tvUnZOSkd6dnMrQ2QzS1pYT2xGNldRRzZDNG9H?=
 =?utf-8?B?M0Yzek9OTTVrN1UxMzAxQWlmeFk5Z1pGM0xsTVd1TGpLUnppdTNpUnQzRXM4?=
 =?utf-8?B?MDZFKzdmd3kzU3c5bXNYQTdnNGhFTjUxS0xKa1oxdjdJOGxFR0ZjN3Rha3J4?=
 =?utf-8?B?YzlRZGhQNGJyL3FLMlJtTjlEU0JHZU8wQ0hsdFdoWldXOTl6cDRpUlRURUhj?=
 =?utf-8?B?emJCcHJXdFVkVWRVVlFjTEY0dEhiUXFReDBuTURzYkl4cUVmZnpGblV2Wm9W?=
 =?utf-8?B?azhCUmpWQXVIODRtZnNsb29zd2cxdXFyZ2h5b3pGQXVNLzJtUlZMejVVNjNj?=
 =?utf-8?B?N2kwcDRoaERGaWFuTk1pQzNSRlFoS0wrdERnbFg0MEVpQ0RMS1lEV1VNSHpj?=
 =?utf-8?B?cTlsWTI0eERXK0o1YzVreEt2M3h4N3NiejVRc2Q2TC9qS2VTNHJFUlY0c01q?=
 =?utf-8?B?UU1TemhGeW5PMHlRT0xiQ1JyVjAveEM4WStEUHUvYjZObXQ3elB4enNQYk41?=
 =?utf-8?B?YmtPUDVuQ1VaRENhSkJ6am9LNVJpNStPVlZ2TWZFN0djY1FoS2NXMDFBd0Ft?=
 =?utf-8?B?QmNrejVWY1RmSkZlNUVTYUtxZERXdjhieTBsc21JRDZpOWx3WFE3UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5813c979-28bf-48eb-38dd-08da4e99f28f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB5544.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 06:40:33.8561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lz/Ym/hePHane1FSECgCO7ExoKmQ/eb+r2l0pRtcU59BIWjrz9qHAua6h4WF6QBpR1/kweZeyaljjjalLnMPGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6390
Received-SPF: softfail client-ip=2a01:111:f400:7eaa::605;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


On 6/14/2022 8:24 PM, Joao Martins wrote:
> External email: Use caution opening links or attachments
>
>
> On 6/14/22 17:34, Avihai Horon wrote:
>> On 6/14/2022 2:08 PM, Joao Martins wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> On 5/30/22 18:07, Avihai Horon wrote:
>>>> +static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
>>>> +{
>>>> +    VFIODevice *vbasedev = opaque;
>>>> +    enum vfio_device_mig_state recover_state;
>>>> +    int ret;
>>>> +
>>>> +    /* We reach here with device state STOP or STOP_COPY only */
>>>> +    recover_state = VFIO_DEVICE_STATE_STOP;
>>>> +    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOP_COPY,
>>>> +                                   recover_state);
>>>> +    if (ret) {
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    do {
>>>> +        ret = vfio_save_block(f, vbasedev->migration);
>>>> +        if (ret < 0) {
>>>> +            return ret;
>>>> +        }
>>>> +    } while (!ret);
>>>> +
>>>> +    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
>>>> +    ret = qemu_file_get_error(f);
>>>> +    if (ret) {
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOP,
>>>> +                                   recover_state);
>>> Is it expected that you are setting VFIO_DEVICE_STATE_STOP while
>>> @recover_state is the same value (VFIO_DEVICE_STATE_STOP) ?
>>
>> Yes.
>> Transitioning to any other state from STOP_COPY will first go through
>> STOP state (this is done internally by kernel).
>> So there is no better option for the recover state but STOP.
>>
> I was think about ERROR state given that you can transition there
> from any state, but wasn't quite sure if it's appropriate to make that arc
> while in stop copy migration phase.

Moving to ERROR is possible but it will just fail, triggering a 
hw_error() (and with following patch triggering a device reset).
Failing to move to STOP recover state will go the same path - trigger a 
hw_error() and with following patch a device reset.

The only difference is that by moving to STOP recover state we try one 
more time to set it to STOP.
Probably it's a useless try, since we failed the first time.

We can change the recover state to ERROR if it makes the code clearer 
and avoids the extra try.


>>>> +    if (ret) {
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    trace_vfio_save_complete_precopy(vbasedev->name);
>>>> +
>>>> +    return 0;
> just a cosmetic nit: you could probably rewrite these last couple of lines as:
>
>          if (!ret) {
>              trace_vfio_save_complete_precopy(vbasedev->name);
>          }
>
>          return ret;
>
> Let's you avoid the double return path.

Ah thanks! Will change.

>>>> +}
>>>> +
>>>>    static int vfio_v1_save_complete_precopy(QEMUFile *f, void *opaque)
>>>>    {
>>>>        VFIODevice *vbasedev = opaque;
>>>> @@ -593,6 +775,14 @@ static void vfio_save_state(QEMUFile *f, void *opaque)
>>>>        }
>>>>    }
>>>>
>>>> +static int vfio_load_setup(QEMUFile *f, void *opaque)
>>>> +{
>>>> +    VFIODevice *vbasedev = opaque;
>>>> +
>>>> +    return vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RESUMING,
>>>> +                                   vbasedev->migration->device_state);
>>>> +}
>>>> +
>>>>    static int vfio_v1_load_setup(QEMUFile *f, void *opaque)
>>>>    {
>>>>        VFIODevice *vbasedev = opaque;
>>>> @@ -620,6 +810,15 @@ static int vfio_v1_load_setup(QEMUFile *f, void *opaque)
>>>>        return ret;
>>>>    }
>>>>
>>>> +static int vfio_load_cleanup(void *opaque)
>>>> +{
>>>> +    VFIODevice *vbasedev = opaque;
>>>> +
>>>> +    vfio_migration_cleanup(vbasedev);
>>>> +    trace_vfio_load_cleanup(vbasedev->name);
>>>> +    return 0;
>>>> +}
>>>> +
>>>>    static int vfio_v1_load_cleanup(void *opaque)
>>>>    {
>>>>        VFIODevice *vbasedev = opaque;
>>>> @@ -662,7 +861,11 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
>>>>                uint64_t data_size = qemu_get_be64(f);
>>>>
>>>>                if (data_size) {
>>>> -                ret = vfio_v1_load_buffer(f, vbasedev, data_size);
>>>> +                if (vbasedev->migration->v2) {
>>>> +                    ret = vfio_load_buffer(f, vbasedev, data_size);
>>>> +                } else {
>>>> +                    ret = vfio_v1_load_buffer(f, vbasedev, data_size);
>>>> +                }
>>>>                    if (ret < 0) {
>>>>                        return ret;
>>>>                    }
>>>> @@ -683,6 +886,16 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
>>>>        return ret;
>>>>    }
>>>>
>>>> +static SaveVMHandlers savevm_vfio_handlers = {
>>>> +    .save_setup = vfio_save_setup,
>>>> +    .save_cleanup = vfio_save_cleanup,
>>>> +    .save_live_complete_precopy = vfio_save_complete_precopy,
>>>> +    .save_state = vfio_save_state,
>>>> +    .load_setup = vfio_load_setup,
>>>> +    .load_cleanup = vfio_load_cleanup,
>>>> +    .load_state = vfio_load_state,
>>>> +};
>>>> +
>>>>    static SaveVMHandlers savevm_vfio_v1_handlers = {
>>>>        .save_setup = vfio_v1_save_setup,
>>>>        .save_cleanup = vfio_v1_save_cleanup,
>>>> @@ -697,6 +910,34 @@ static SaveVMHandlers savevm_vfio_v1_handlers = {
>>>>
>>>>    /* ---------------------------------------------------------------------- */
>>>>
>>>> +static void vfio_vmstate_change(void *opaque, bool running, RunState state)
>>>> +{
>>>> +    VFIODevice *vbasedev = opaque;
>>>> +    enum vfio_device_mig_state new_state;
>>>> +    int ret;
>>>> +
>>>> +    if (running) {
>>>> +        new_state = VFIO_DEVICE_STATE_RUNNING;
>>>> +    } else {
>>>> +        new_state = VFIO_DEVICE_STATE_STOP;
>>>> +    }
>>>> +
>>>> +    ret = vfio_migration_set_state(vbasedev, new_state,
>>>> +                                   VFIO_DEVICE_STATE_ERROR);
>>>> +    if (ret) {
>>>> +        /*
>>>> +         * Migration should be aborted in this case, but vm_state_notify()
>>>> +         * currently does not support reporting failures.
>>>> +         */
>>>> +        if (migrate_get_current()->to_dst_file) {
>>>> +            qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
>>>> +        }
>>>> +    }
>>>> +
>>>> +    trace_vfio_vmstate_change(vbasedev->name, running, RunState_str(state),
>>>> +                              new_state);
>>>> +}
>>>> +
>>>>    static void vfio_v1_vmstate_change(void *opaque, bool running, RunState state)
>>>>    {
>>>>        VFIODevice *vbasedev = opaque;
>>>> @@ -770,12 +1011,17 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
>>>>        case MIGRATION_STATUS_CANCELLED:
>>>>        case MIGRATION_STATUS_FAILED:
>>>>            bytes_transferred = 0;
>>>> -        ret = vfio_migration_v1_set_state(vbasedev,
>>>> -                                          ~(VFIO_DEVICE_STATE_V1_SAVING |
>>>> -                                            VFIO_DEVICE_STATE_V1_RESUMING),
>>>> -                                          VFIO_DEVICE_STATE_V1_RUNNING);
>>>> -        if (ret) {
>>>> -            error_report("%s: Failed to set state RUNNING", vbasedev->name);
>>>> +        if (migration->v2) {
>>>> +            vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RUNNING,
>>>> +                                     VFIO_DEVICE_STATE_ERROR);
>>> Perhaps you are discarding the error?
>>>
>>> Shouldn't it be:
>>>
>>>           err =  vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RUNNING,
>>>                                           VFIO_DEVICE_STATE_ERROR);
>>>
>>>> +        } else {
>>>> +            ret = vfio_migration_v1_set_state(vbasedev,
>>>> +                                              ~(VFIO_DEVICE_STATE_V1_SAVING |
>>>> +                                                VFIO_DEVICE_STATE_V1_RESUMING),
>>>> +                                              VFIO_DEVICE_STATE_V1_RUNNING);
>>>> +            if (ret) {
>>>> +                error_report("%s: Failed to set state RUNNING", vbasedev->name);
>>>> +            }
>>> Perhaps this error_report and condition is in the wrong scope?
>>>
>>> Shouldn't it be more like this:
>>>
>>> if (migration->v2) {
>>>           ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RUNNING,
>>>                                    VFIO_DEVICE_STATE_ERROR);
>>> } else {
>>>           ret = vfio_migration_v1_set_state(vbasedev,
>>>                                             ~(VFIO_DEVICE_STATE_V1_SAVING |
>>>                                               VFIO_DEVICE_STATE_V1_RESUMING),
>>>                                             VFIO_DEVICE_STATE_V1_RUNNING);
>>> }
>>>
>>>
>>> if (ret) {
>>>       error_report("%s: Failed to set state RUNNING", vbasedev->name);
>>> }
>>
>> It was intentionally discarded.
>> The return value is used by v1 code to determine whether to print an
>> error message or not.
>> In v2 code the error message print is done inside
>> vfio_migration_set_state(), so there is no
>> need for the return value here.
>>
> Oh yes, I forgot that other print.

