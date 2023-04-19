Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CA56E70D6
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 03:52:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1powyd-0002YB-H1; Tue, 18 Apr 2023 21:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1powyY-0002Xy-Sc
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 21:51:16 -0400
Received: from mail-co1nam11on2058.outbound.protection.outlook.com
 ([40.107.220.58] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1powyV-0002NO-I3
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 21:51:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PGRCwpJ3Odh1GLRyj9WBg+jA/lAu7Y3A67CT4CepTPR8XvmRj6/ZfxunD9KCjKI7nD7ESYsY0KkXP3L/+QAsQ0fpHfLuzlxkHtacwfpxiIzc1egmw3ccoQWWmvAbY3ByGjf91n3cI1OfB4IBWydoHsyxeTq7MJhJfaY6+HH23BDyYWYd+Ve6+SSn+7UckvbNeLZlvVFn94igZC+NILjxZ46oLOY5sXChKK5P5bqZlnZr1tq2fYnKddalwR7Enx76HxorWAlIZu0UWR81OjuaphxDNrRUnj0l36nhQfeWjc/6jXWaxBVEX6Us1i8WLvRkwF50tpcW8KFAN8MVGweMlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ue96mBVhos28uaBX8C8Rg1NjtqNailrX/7QMWpCZNHQ=;
 b=N/zvlB1gwohsAGUG7Pb4skfJ9Jmj5Vqp9BaT2jkB98YJ3NTfQXX/2zI7Ev799g0yk/WsQ9kDeOaSppCqS4/uGOW8GdB1esDjnzoD+zM+OQ/dm0I+ajWsD3iKZk3jRV+2cq+L/TB7Suo0ny1ffWzQ6Du4K31XeDwvybspiEQEaoqRfBnk4N9wfxsMg4f8sqALk2lFZN4NQwss9Hyqz1T5gFcspzeVcAo1AjW8uBG/h+KwsjmoY5kEX3xKXMugy6H21csbMF0BJbSHdWbhdM/sf1vLHfjPkNL0a9xINhJhddqO4FO3gssvzhmw741MHm/1XyDG3IKfBxUcKiZCacxK3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ue96mBVhos28uaBX8C8Rg1NjtqNailrX/7QMWpCZNHQ=;
 b=lvtjGoG7q6MgImjV8+RR/ubIXd5DnRMGwZ5hnm5qED42LGr8X6KodJw1sZebJIHYcePOv99VV4fFggKEkQcGjcnK27CKFU8d8DjZHUOlqSAJ6OXqqGm2Fi7C0bUSmiF/4eaH5poTq+o8JqUqUp5bV2V76X5ynIa/fxCgMxue4TqG9X4t1w9E8JmmWucB6MAVLnjoOZCC6fcDYml6usjVXW5UWuQ4Bn1coqX+mw4CVH+phLo8H2kXLTU5z3JWr8kYFBPUYIqfVVfHZDm2w3w7uiRKTgs0YppwyfPPTXhEdcgZxn/bwwLagDMgkqXww/KtNo/dGAwm/VWI5NmxQYk2yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5168.namprd12.prod.outlook.com (2603:10b6:5:397::8) by
 PH8PR12MB7184.namprd12.prod.outlook.com (2603:10b6:510:227::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35; Wed, 19 Apr
 2023 01:46:03 +0000
Received: from DM4PR12MB5168.namprd12.prod.outlook.com
 ([fe80::5104:21af:93c:9c30]) by DM4PR12MB5168.namprd12.prod.outlook.com
 ([fe80::5104:21af:93c:9c30%7]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 01:46:03 +0000
Message-ID: <d5465c66-638d-d0aa-53a1-fb60dfea7fe3@nvidia.com>
Date: Wed, 19 Apr 2023 09:45:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Move vhost-user SET_STATUS 0 after get vring base?
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Cc: Cindy Lu <lulu@redhat.com>, =?UTF-8?Q?Eugenio_P=c3=a9rez?=
 <eperezma@redhat.com>, qemu-devel@nongnu.org, maxime.coquelin@redhat.com
References: <20230418151811.GA4048149@fedora>
 <20230418113320-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Yajun Wu <yajunw@nvidia.com>
In-Reply-To: <20230418113320-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KL1PR01CA0137.apcprd01.prod.exchangelabs.com
 (2603:1096:820:4::29) To DM4PR12MB5168.namprd12.prod.outlook.com
 (2603:10b6:5:397::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5168:EE_|PH8PR12MB7184:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ee50b8d-f54e-4eeb-f654-08db4077d57b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h4UEDbRm8KOmK/y89uOVHFM4lLxivLmR/LzPxfGYqcfA6du9M6qxyJw8uvFzIdC4q07fne0aTzVrnwnf1HHbSf8YSwbWYp8CMZdgYKACARJDFb2zPJkOjUJW4nuC2LxBWKmvuGX90+c1stU1Hw+5MQFVthhsUOuUuZWF8LLSzJn8UdokHwOkP1xP1D1DeBc2yhIankWy0+4KZkZzDtY9xer7/FqWX3Y9nEkW/LjhW+NoUGV273/S3QNHvwGKCNLEWKUoVn4vLG9EfQHPj73rZe6kYiBS/TBkRjkbQuLPk1bx4DyvGHylLr2sra/Kx4CP8FppfDs0vIqIlJnlwpjuWpakvCSFXgZyMHDxVJ5k7puqANhUb6U+HdeoWHCJwpijYUkoKeIvqsYQQ2DTfIC7InvaXbsNHM6T2/kQSsoq2krHJx/hLXYmtdo5WUxh9eKoYIWMQ6TTGOYttyYtZmVZLbtRtO7yruSkj1ucrETmIdXBR84xY4wEIOmwFEzutURvT4rRwcPsitqr0L/tSQQy+7XRW3ruE7TFSgqU8oarVVFgdAhXY2Z6KJG+sTNl++A5Uu6uB1gruJMc7krops5GFeAAzOepffcWL8AaeYBZi529mvbsM6DoaoQ4VmREWutMoYQhfFyIb4f1dhkimNGGpA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5168.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(451199021)(478600001)(26005)(6666004)(54906003)(6486002)(66556008)(316002)(110136005)(6512007)(186003)(53546011)(8936002)(6506007)(2906002)(66476007)(4326008)(5660300002)(41300700001)(66946007)(8676002)(36756003)(38100700002)(31696002)(86362001)(2616005)(83380400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1MzamxMR09YVHBVTVRpNlJDUDRORnp0VWgyZkJuT3p5MGpYWWIvdEF2SytU?=
 =?utf-8?B?WVpNYlB5MUVhMDlRY28wSHVydWdLbVZIUHFrbXBNQXZDN2NPUkpNaVdFUWE1?=
 =?utf-8?B?eWpTcmcxRVpjbzg3YloxTnFrbVN3SVJWZ1V0MDA4ZEVoMjVkdTREL0lZcTRy?=
 =?utf-8?B?UHFML3c5N2lld1RJTVUzemFwWC9UbTBKMHVLQmtRcWp1UlFuaGVFWUdGYVJw?=
 =?utf-8?B?OEUxU2JsSURnSmVMZVFtbEhsTzdheUFsaEdwcHFIMnFiNDhGRHA4Q2htMXdM?=
 =?utf-8?B?dHdsNjJqMHljQ1dKYlJvVDhFU1c0Tno4QjdWbnRJV08yRVpvVDgzZTJObk9r?=
 =?utf-8?B?aXJrYUVsODF4SjVmMVRZczRGcGVnWG82dHUzU2JZUHhhQkwxQUd0REMyN2Rs?=
 =?utf-8?B?TEQ3Rjl0ODhCeVVoZkErSzdpVkszK092YTZOZFUrSjM3UVFGUy9NeUJQenJ6?=
 =?utf-8?B?NHN0TzNrTSt4RWhWZWtiaFZmaVBldlg0bFpKeERCNWVOYVNMZDZQUnR3MWs4?=
 =?utf-8?B?eS92K2R3TnR6T3hUUjZrWXVaeVVaVURycVNGNHA1RVY4L0tFbVJzS3pPNHNx?=
 =?utf-8?B?UmQzRE02ajEzQTc2RU54cFRGeUJMSzQwTVpaaEdSRFUvbXE0R1kxTW4xNVU2?=
 =?utf-8?B?ejVJWnRCbTNBekpBbzJqNUJ5dld1dlNXWUJTcnJtUXVzOHRKUVlxNU1JbGpx?=
 =?utf-8?B?QmlNcVpIYU81ZUlWeWZ5b09jQ0R0akNyZExZbFV2WUNaS0luTTNBblRQM3Fi?=
 =?utf-8?B?VExDUno4YjQ1MXl3bjBNaGxTR1dkWnhmYTJlOWJXZEM3ZE9EUTdZT0F3a295?=
 =?utf-8?B?c0dWcGYwVnc0RFl6aHlZN3paS3I0dktlYUdPd2Z5bXZ1UjNoc2pCWTVrMzhZ?=
 =?utf-8?B?ak8vZ0dRL2VxQkprajJNTEQ2NGtINFByUmkvMGxIZS9lVm5uN0gwZVFIYmZk?=
 =?utf-8?B?MXYvcWFaaVVpTU1aK2hZejBuOWMrWmMwOFRxR1ZLNTc2cTRCTTlESFFIa3Vy?=
 =?utf-8?B?Y3JBWjhWVW14YkUzdVkyRTVUYUQvR1lGRkk4QU1QdWdldUJVUXhtS2NFa0ds?=
 =?utf-8?B?MlZQY0g5UExuUVhxRU1WQ2JZejNkKzM4d1h2VzhBdXV6MSs5S29pVStHeU1C?=
 =?utf-8?B?VThXdWVTTFNHeU1GblVBVnRib2VhaEFnWWh2UFprQzdxTmFGK3c0K3pOV3RN?=
 =?utf-8?B?TjZYcFF3WWVIeklwaEttRkFYQ1hCSENhU0tETTRISnZMNGlVZUNvckxuU093?=
 =?utf-8?B?c3VQTkUvWWJqVkpCZ2phMDBvUThnaldIWllLTWo5Q2hpekF4Q1NPSlEyRUhM?=
 =?utf-8?B?TGNacGtQY0xIREszU05GSXlYQk5lNFFWcnZqNExraWE2a204OXRpT09BQXZr?=
 =?utf-8?B?SEVkZldvaGdPWEFYWFNTSjd6RWVDcXZpQ3NHaDAxdVJzelYyNHRyRmV1dGNB?=
 =?utf-8?B?akZrQmZHYVc1L01uMHRKdXYrcGV0OHRMVHMyWGQ1ZWNnNzVUL1Z0ZnJkblps?=
 =?utf-8?B?Y2x4WlBRa1NNMHhjMnd1MngzSzg1UFhjNWdreURaUnZrYnJENWJ0YVRqMEd5?=
 =?utf-8?B?cjE3d25hZHMrNFZWRC83N0l3VERkR1I3NHhZVy9YalR6Rmxoakc3WXozZkRW?=
 =?utf-8?B?Nzc2MjUrOWpIK3huY3l6RW4wL01SMllGVEZUYTJvVndKelV6b2VEUUkzN0Zq?=
 =?utf-8?B?bnp0em5mbHlleEVmdDI3NXFmVkdxOERHL0ljY2w2N2trZVF5akRUUDd1akgv?=
 =?utf-8?B?VUVTTjdSQjVHeWRUSzJnVEV5SE1xOSs0aEdaRTl1Ly8xTG84b1plZHhFNXVE?=
 =?utf-8?B?NkNBUm1aazk1alpCOWF3V1RFL3JJTDJiVjlGTHQ5NHFuenN6RmhmeEtMTkN2?=
 =?utf-8?B?cnBFRUJsb1V3d2RFeTIrVnJITXY1bkF4TnJYWlEzVlBOSnNZeDdkQ3Z2M2hk?=
 =?utf-8?B?V3FXdVhGZVFMWDVnQWFSbytKTytodGZHQXFBTTdvVjhSc3QxRXhjTHNqTGNJ?=
 =?utf-8?B?bTdLQ3dPNENNM3dwb3VjVVppZXdodlhmRGxHWHZsWmptV1pMcUhXcCtRN2d2?=
 =?utf-8?B?MUhnTUxmS0R3MHhsTXNHTTRITTB0KzBzNGNyYVdySzNaNTNReEZJM000NXRI?=
 =?utf-8?Q?ejvrjtuP8ykh91BEGkRWO1K9B?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ee50b8d-f54e-4eeb-f654-08db4077d57b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5168.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 01:46:03.3705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Sz4WuymMnqRZ5kwSvcMWbeCRCdG/NmzoVQrwhnSYd2FZ/cBZpDQBuXOD3ZOCurGc/5CbOSNftBF7etmh7AiQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7184
Received-SPF: softfail client-ip=40.107.220.58; envelope-from=yajunw@nvidia.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.597, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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


On 4/18/2023 11:34 PM, Michael S. Tsirkin wrote:
> On Tue, Apr 18, 2023 at 11:18:11AM -0400, Stefan Hajnoczi wrote:
>> Hi,
>> Cindy's commit ca71db438bdc ("vhost: implement vhost_dev_start method")
>> added SET_STATUS calls to vhost_dev_start() and vhost_dev_stop() for all
>> vhost backends.
>>
>> Eugenio's commit c3716f260bff ("vdpa: move vhost reset after get vring
>> base") deferred the SET_STATUS 0 call in vhost_dev_stop() until after
>> GET_VRING_BASE for vDPA only. In that commit Eugenio said, "A patch to
>> make vhost_user_dev_start more similar to vdpa is desirable, but it can
>> be added on top".
>>
>> I agree and think it's a good idea to keep the vhost backends in sync
>> where possible.
>>
>> vhost-user still has the old behavior where QEMU sends SET_STATUS 0
>> before GET_VRING_BASE. Most existing vhost-user backends don't implement
>> the SET_STATUS message, so I think no one has tripped over this yet.
>>
>> Any thoughts on making vhost-user behave like vDPA here?
>>
>> Stefan
> Wow. Well  SET_STATUS 0 resets the device so yes, I think doing that
> before GET_VRING_BASE will lose a state. Donnu how it does not trip
> up people, indeed the only idea is if people ignore SET_STATUS.
>
>
> --
> MST

For DPDK vhost-user backend SET_STATUS 0 (reset) is ignored.

Yajun



