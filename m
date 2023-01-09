Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C4666299A
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 16:15:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEtqV-0000bK-0W; Mon, 09 Jan 2023 10:13:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pEtpw-0000ZP-DD; Mon, 09 Jan 2023 10:13:25 -0500
Received: from mail-bn8nam12on2087.outbound.protection.outlook.com
 ([40.107.237.87] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pEtpq-0007Wf-TH; Mon, 09 Jan 2023 10:13:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZLPeeCvgjfjo9vh0kB5RGuIfWESImZ55CLpsMuNby1reBtx56EaxziXMl0jeR8pCSqVpV/bcVdP8F3LIXJ4GjDt+7VujY0jgtbzdHBcjsUldIFjXHZuIdM8QfIw+5Actvga7aPJsK01P/pOGLadtHyTLX6dqkr6nmuDvW3QRZ+rk/IhmhYxczcDpHU8iabxDhxGWBOmvmwpbffgAxEZ/vEZYG/vzjKHCNoIUNTua2qUeQQqRUt0Apzn2+C50MB3LF35A+pTgWYJRa+NLdtoAUlEVLcTAgAy+V2gJFoE7LCCS6ZuutDdFjJHfE2BK3US9zmNIQgZSiWkAn4cHZCADgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IoOM5Q5RzrrlCJij0n0Z2/yiMn17vXkRD+Ab0jzDNw=;
 b=a6/ilRtIPHiXOnx7qhLxjNCXAPlTR7U8+5FANkHlygKoZJztcSTGSh3a7dyrR2ivkyF/219AjJFL4W2ptJVyhGP0WwM4Z26O1Pi3k7dVNf+KtJ2WEorvcpAqOl2wjYj8nZBRIf9wv7Umpw7wSd1bB9xg/iXgbGn1o/K2jfaVzCeXeR7b0rwn02PgXkSF9GkVCOXDO1X8/bJIc6L153ylS7wqnhVUucr++rtZLUIzcGQrbgcAyC+/NV99PhZ6tYFAhusY5qjvc0GxfvUFQzLzQ3xSso6Srp0/veEUbide1N/Qz486mW2zcY7I+yen12B71BXncp+6J9S4GhWHmqYwVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8IoOM5Q5RzrrlCJij0n0Z2/yiMn17vXkRD+Ab0jzDNw=;
 b=NIWD7eVyis1VrfPoqEFLgMn5U4SV29U1M1EMTcy8tod7bBov8TuXKmjvyAoavAbDbfTDQZL+riD63+kmOi7v5Ax5iE+kz4NvgutgIckewJ3FsOQhnjaoz79fN/KvCJWJj3momW2sbUEPSu6niut1Y2Q6WaaSIu6LXFds1VYb9xXcG+GLEAHF9f/gkOVi5DFbsf8rbo+lVJdaNoUlu4E3xJmUUsQfhcjLFp80cGcDNvLSn8vxHYcKEKHeCQO/YyVlctd1Bh4ww5aO8XHUsz7Phyuq9NMHx1W6HBmPAjiw+y7vB4UWSn5Kt5Cs2rYTg6n6Rvnmyt13o4wBeqKoyOds7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by DM4PR12MB5054.namprd12.prod.outlook.com (2603:10b6:5:389::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 15:13:02 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::451d:1f37:aa83:f425]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::451d:1f37:aa83:f425%6]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 15:13:02 +0000
Message-ID: <5ccd6f67-3ad3-c9dd-634e-d2d0900c429e@nvidia.com>
Date: Mon, 9 Jan 2023 17:12:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 10/14] vfio/migration: Implement VFIO migration
 protocol v2
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 John Snow <jsnow@redhat.com>, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20221229110345.12480-1-avihaih@nvidia.com>
 <20221229110345.12480-11-avihaih@nvidia.com>
 <27a868cc-d816-76f1-1ce1-60b6552d791f@kaod.org>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <27a868cc-d816-76f1-1ce1-60b6552d791f@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0115.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::13) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|DM4PR12MB5054:EE_
X-MS-Office365-Filtering-Correlation-Id: 891f2533-53b9-45e0-3a70-08daf254006b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M4kt8Zzdp3YhXTDiCDfoqZmBoHu2LVnoNed9PPDjq+uXYH3rhSzQn0vb/6Nnh4cqMIUS7yl2HhW8UPLcJ0/3pW1wsgHCvnYeNUnAZn2qP5GnPTR+Jk3Lnsmi1FvviEEgghepY7x14JqjTDuaMafDomFEwmJ/WNPTiloJuSdSbh9UQx6120LowKNTtwM7VBZreaGsXGWp3BuJi5u92BI0AF/k5Hj4HyqVd4Kbo7SmnDXGVqIGNehz3EZ9qHR7e0psCEbz+CI9gaT+sR56xKczaNOWWeUrngs3QenAz8rdpx88tfErY0QWGKQ5YIwpu7e4eZk48PbnCxP3YQ9pAWGdHneGczEIkc234AFWLWPVlwVheJt/USG2GRIyd5e9SfAm9TABLVwE0W45Yb27xIrLaNFDoLvV92OqQtEsHwkArL8YAgiMO4t9xqeeHs1dPf7yDef49Yjcdmyk79JcMWgR9ooPiV9fH9PLXKw2STd/amePVyQKnfs0xj0x6CC7i8y4i12HGEIZkBMAfOGVOb4NSJRMtduogz64LYujHNM9BnFOvvkcfSZaYF9+Ic3rwMhmp3HPfQM9+0UNXlICEnPOm4NaCkYB7Rd/u+RgPG6bASoGgdKpeKIT+cv3vXsQTj6DOTikokEjHIj4+MXBkD15cDK3azPCEvv4d2B94EiIDTS8+4UMIxECXyXuyTyjePpFVtOBBzOl+Hz/V//lsjmBXZujBE4Oie72QJXe0waqp7FnLRM5dbeabxm4dyn3zNUM6C28YmeyAU3lcDJ99p1sZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(366004)(396003)(376002)(39860400002)(451199015)(66556008)(31686004)(84970400001)(2906002)(7416002)(8936002)(5660300002)(36756003)(41300700001)(6666004)(66574015)(66476007)(66946007)(8676002)(316002)(54906003)(4326008)(6486002)(53546011)(26005)(478600001)(6506007)(186003)(6512007)(2616005)(31696002)(86362001)(83380400001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDkxRUFMTkxMSGR6eTRoeWNkTFlTRGU5VTVsT3ZFZUV4eEUzc1dVQnZjcTNO?=
 =?utf-8?B?QUtjSTFoN0c4TTB2SHpyQTEvcE5CcW1KVDlLdlZ3S2FYUko3N0dlZXpCVW5Z?=
 =?utf-8?B?MTZJT3ROMndjK2Jtb2E4Z0QrK0ZDd0FmNHg4QXptajJSTStaaEg4UEEwMlZJ?=
 =?utf-8?B?aDlJdVF6WjBGMDZFZXNYL2QwV2M1QjFCL2c0YzBtNDI3Vlp6bzF5UXhLMTMz?=
 =?utf-8?B?VWpiM0FqWllaME1YYTZwNGxaNnpZU09mcnp4dTF0V0JKYVpDVS9Ec0w1NDJW?=
 =?utf-8?B?MWR3WHFWWlNuWEJlWVgxKzgwcW0xdE5tcVRuU2lsK0Rya3J1MHA1ZWN1Q2hp?=
 =?utf-8?B?YU50aklUV1VNR3JYMG9VZ2pubTY2b05LcVY4bzcvMHFQbU9kUEczWmJ1NWRF?=
 =?utf-8?B?cXNkVVRJK2xMSjNud2ptcTRCUm9qdThUUDg2ajMyOGx1OFdZWEgzN0lqWFNB?=
 =?utf-8?B?WUhvbnVacmtxTWxVOHJGajk3NnZhRlE2dzlYRkFjaWFhYzVGY3A0YmJXelpZ?=
 =?utf-8?B?VVREN2kzcEgrQlBJWEpGWHQ3VDE0YUxEdG9rTXEyVVFDeUFhKzlpVFR1QWU0?=
 =?utf-8?B?dHA2U1FwRXJHQnJmUDViMGJkUWpOMEw4TjBSblBDT2pVanU4NDZrL202aWtt?=
 =?utf-8?B?MGlGQy9DeHd2MWdCR2ZNeGpneVZLZGY4UzZsUGJWNnZDZzJlcGQ1V1MwRVpq?=
 =?utf-8?B?Tmd3ZlVROWpEenM0OW1rVytxU0g1dVlKMDBTNEx1Sll3dGhRbE5wRVZTOWNj?=
 =?utf-8?B?NmZHcFFJakE2czUxWWF4RHpHVktwTXhDdlBqNCttVDI0enBzZlYzVy8vZjBI?=
 =?utf-8?B?VlFrRG1EOGlRRHZWMlBSRDFJbnUyOGNma1RZVURwSnpqRUFwT3h5UEJiaDVu?=
 =?utf-8?B?NmNVQVRQZ0RJM1JlaW83M0VsTXNHWDhNbVZMR1pDZ01rQ2t3Sjk3QmpIQUYy?=
 =?utf-8?B?djNwcFFDVEVRbVVhdnZvelkrK1VDdTk0UG1SaWF4cGYwYWJUQnRWc2xYQzRG?=
 =?utf-8?B?SnpiaGRPa3RWNXdxOCtuVXZBZm1WUUlmR0pXMDRaSk8yeldOdTd6bXRZU0t1?=
 =?utf-8?B?QklKNHJlT3RNdzZVTThpSWZuL1ljKzFyTmcvdVllZzdmMTA1TmlzeHpHRkpO?=
 =?utf-8?B?UENKRFJkcFBzTlo5UkVQU0NobUtNU1JwQjZqQlBFZUdDSURNTlhQZ0hETHhI?=
 =?utf-8?B?aXRYejNxV0JIYi9kTGgvTEpGTHQwTU5sWlYzUlkveFlqa0F2b0p5YkdxWUNn?=
 =?utf-8?B?Nnd6QjhaNEw4d2JocjB6b3dCWlNKbGVTRVJlVG53WkNWL3RBY3RRcW1qUGVx?=
 =?utf-8?B?V0ZBSjM3UXJIRDZwdWtVYy9uVU4wbFc1RjlzQm00eXlmNXhvNmlCbDVRNFJF?=
 =?utf-8?B?Vk14OS9zY3VTcDU3aHNiSW5GL05xWE1DcnlobnAwb0l3amhlVUNRSmo2bUdM?=
 =?utf-8?B?eEdWU1ZJSlZGNWVZelhRZDI3Y2o1VnV6aDhwMnRGeG83UlhIYythSDZUS3k3?=
 =?utf-8?B?Z1ZxTWhVSG91dmlTTVdHUS92dVd3dUxLNlNwTDM5ay9MZ2RzUDd3UWRZVHdG?=
 =?utf-8?B?RHpHWTFacW1aRUJFM3BSNXMyeWROdjVzN2VPWENzQ2JrcjlFcWZSQzNhbkN0?=
 =?utf-8?B?NUVwbW9yQjZ1VWVLQkZQb041UDFTTGVBMHpENXcxOWdLRUx5eHRLTzRNMWU5?=
 =?utf-8?B?Vi81U0paY1FYc3owOEJQNURCYmRLY1ptVW02dTN0cE1VZW9YWGw5dFVYa0R1?=
 =?utf-8?B?S3U4L2hnOUNleXJScTdoUmRYNUVRdDJnNkQxSVRkaW1HVW9lcE0rQ2N6NEFU?=
 =?utf-8?B?amRiVW1OMlNTTk5lbEdGZkhqZzltTEx4cEdJQnVhZlNPV2pQNWtnQzZCKzUv?=
 =?utf-8?B?VlNnWWNZOWU4Ym5FWDN3ZjBQZGlGUi9URmJDWUhnaGNZanh0bVRyUEVhWjR3?=
 =?utf-8?B?ZGwrWWIrSnB0dlh3T2R1RUhOSnZDcmxETWIxTWJNeU1RSW5IaWJsN1VqQUxF?=
 =?utf-8?B?ejNqVzhKdTBDUExHeUlOQ20yWnBRYW1LVjM2Y2hCRDk1Z3lvUE80QWs5UHFv?=
 =?utf-8?B?aitBbUhmNllxUTN2eGJXN0xVeU5UY2pSS3hpOWpBV2V1TGUyRUZ6SnBHbzVX?=
 =?utf-8?Q?CUwWmBPlKykFeOyWVRdEhXcha?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 891f2533-53b9-45e0-3a70-08daf254006b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 15:13:02.7828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cj1GpO4iMqc/Dm73/MQzk9DAiTzDRXcvZzTm5qG7vN5HhaXIWY9jTdazzw2rvTY3LCKBzu4pWYX/862WlPZb9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5054
Received-SPF: permerror client-ip=40.107.237.87;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


On 09/01/2023 12:20, Cédric Le Goater wrote:
> External email: Use caution opening links or attachments
>
>
> Hello Avihai,
>
>
> On 12/29/22 12:03, Avihai Horon wrote:
>>
>> +static int vfio_save_setup(QEMUFile *f, void *opaque)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +    VFIOMigration *migration = vbasedev->migration;
>> +    uint64_t stop_copy_size;
>> +
>> +    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_SETUP_STATE);
>> +
>> +    if (vfio_query_stop_copy_size(vbasedev, &stop_copy_size)) {
>> +        stop_copy_size = VFIO_MIG_DEFAULT_DATA_BUFFER_SIZE;
>> +    }
>> +    migration->data_buffer_size = 
>> MIN(VFIO_MIG_DEFAULT_DATA_BUFFER_SIZE,
>> +                                      stop_copy_size);
>> +    migration->data_buffer = 
>> g_try_malloc0(migration->data_buffer_size);
>> +    if (!migration->data_buffer) {
>> +        error_report("%s: Failed to allocate migration data buffer",
>> +                     vbasedev->name);
>> +        return -ENOMEM;
>> +    }
>> +
>> +    trace_vfio_save_setup(vbasedev->name, migration->data_buffer_size);
>> +
>> +    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
>> +
>> +    return qemu_file_get_error(f);
>> +}
>> +
>
> This fails to compile with :
>
>   gcc version 12.2.1 20221121 (Red Hat 12.2.1-4) (GCC) complains with :
>
>
>   ../include/qemu/osdep.h:315:22: error: ‘stop_copy_size’ may be used 
> uninitialized [-Werror=maybe-uninitialized]
>     315 |         _a < _b ? _a : _b;                              \
>         |                      ^
>   ../hw/vfio/migration.c:262:14: note: ‘stop_copy_size’ was declared here
>     262 |     uint64_t stop_copy_size;
>         |              ^~~~~~~~~~~~~~
>   cc1: all warnings being treated as errors
>
> May be rework the code slightly to avoid the breakage :
>
> +++ qemu.git/hw/vfio/migration.c
> @@ -259,13 +259,11 @@ static int vfio_save_setup(QEMUFile *f,
>  {
>      VFIODevice *vbasedev = opaque;
>      VFIOMigration *migration = vbasedev->migration;
> -    uint64_t stop_copy_size;
> +    uint64_t stop_copy_size = VFIO_MIG_DEFAULT_DATA_BUFFER_SIZE;
>
>      qemu_put_be64(f, VFIO_MIG_FLAG_DEV_SETUP_STATE);
>
> -    if (vfio_query_stop_copy_size(vbasedev, &stop_copy_size)) {
> -        stop_copy_size = VFIO_MIG_DEFAULT_DATA_BUFFER_SIZE;
> -    }
> +    vfio_query_stop_copy_size(vbasedev, &stop_copy_size);
>      migration->data_buffer_size = MIN(VFIO_MIG_DEFAULT_DATA_BUFFER_SIZE,
>                                        stop_copy_size);
>      migration->data_buffer = g_try_malloc0(migration->data_buffer_size);
>
>
> and report the error in vfio_query_stop_copy_size()
>
Thanks, Cedric.

There is another similar case in vfio_save_pending().
I will fix both of them.

> Thanks,
>
> C.

