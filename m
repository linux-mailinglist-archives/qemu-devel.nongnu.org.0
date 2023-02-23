Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEABF6A0C55
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 15:57:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVD1l-0007VV-IL; Thu, 23 Feb 2023 09:56:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pVD1i-0007T1-Ey
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 09:56:54 -0500
Received: from mail-sn1nam02on2062a.outbound.protection.outlook.com
 ([2a01:111:f400:7ea9::62a]
 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pVD1g-00052x-0S
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 09:56:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C81uNxcky2oDYjh5dKGG2GzFMofKiMDTzzx7xaK5ffUmiGkrn7Z5GHW7iL+3QxYX4hKGNsvQ8sSRAIn/kooJJFnppfuyqusmpzgCRPTU94e4WaXEfm0TbGTRcYp1gfEaBfq43PnS1NIvSE7I/D8EU0O3qdyt+QUTp2f7fykgTWv8I+nQuE3yl73sYibS4yCRxe9NtLkFdPcO54QgrVLBOcpjgew5JmeF+YSuzDuNUFVSZilEBBWkLxpWXFnJKkIPJT6HYt05m/6YB/IhGDXNBNoP+MEYASspqAgiAHMmXNH1VGYIZSDgEEX3IbrvOiBSK+simZhTExcZrE6UNPrhaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LOUnf/vsHdL9oN9u6O4CY9KSJy/tJdi/m5Ztxa2m00M=;
 b=krCMbLsqj0U04BW+D/O1chBKQf4uHthrrsO5bVJKc09UKBfjeAOFYp+c0ucECGc+ot53RxKBli7IY9pb0mniloTpEFAwMpoulldwJXZyOEUuuW4dNx/JK1vnzAK2f3p4flh5JWysrvjA2RIlYN7BDtOAl3c3I3Z82B4oLTt/1Ncb6kvDNLSJgfuJX0yB2j42V/YVuey7GGJcRj8DAGXhxnwlyRqMYPX7GtE0FscZW/01fh0T3NSrx+tmwSXxGa/zUaohb326saDYRY69fhPihHdeqIL2gZ6pl21h//tScNAKL21MroK5hnfF2MydgjbmGP7Pyrj42eFRyE7vHPYECA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOUnf/vsHdL9oN9u6O4CY9KSJy/tJdi/m5Ztxa2m00M=;
 b=U0RFykzC7fdcko/rtmgRoya245rr+NPyrLqrQsack10hhKxWdRPxzhPjxQ3PUIC0nlMvn3NZhcHYG6LmkJZIrCaVekSvRsoVhIGuaxavbYavDpXNYXk8BLCSNlHYZAwT3jcApUtKqYOSUu8AaSFaLBqc9cvbhE/XO6b+/5WhOsUAaFw3VSSO5PVZetxcfDEgECYsAozbTbeAPdJzdig5Y8C7ljO2w2zClUR/9dqfQu2X+SoJCxrcZQDDyAdX422sRGYaaO1Lw57l0AmSmUVxOy+rJ6MDLd2kXWaon3uPHXaTfaj7uz2ix6/STLHo2DMKnb7/3AFbXe6GCLkrY90k6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by BN9PR12MB5337.namprd12.prod.outlook.com (2603:10b6:408:102::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Thu, 23 Feb
 2023 14:56:44 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::b980:cd87:77f2:3fbb]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::b980:cd87:77f2:3fbb%3]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 14:56:44 +0000
Message-ID: <79b05864-3feb-8e3c-ab03-7c656027741c@nvidia.com>
Date: Thu, 23 Feb 2023 16:56:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 00/20] vfio: Add migration pre-copy support and device
 dirty tracking
To: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222135512.51b62650.alex.williamson@redhat.com>
Content-Language: en-US
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20230222135512.51b62650.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-ClientProxiedBy: LO2P265CA0309.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::33) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|BN9PR12MB5337:EE_
X-MS-Office365-Filtering-Correlation-Id: 42314220-3c90-4c73-41ac-08db15ae2d8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SP3wfPHjw8RZIEE1VwKDiza0i5r9XdqXNjMZoth39HBNHho7WlzInsbp+mgWPYpnQeFYf6OFioRciMASypQXvXbATE+92jL9H/GtO4b/fsMqCzsLb1WiTRDRA2RdE96i3UCBYTveTzpY3FHYOq1gemnJNTdmSYl92PbbziUyQAIqTXxnLHZ/YrP8vPPoucqlsnpsY5oDA5MlWvaQT4kysM74k9b3o53EpEMW6NNaffovFgn7l4Bif5vvNnL8Vt8dIk3Xa8S9802O09fLXWWfwPXR5YAdbs+PhWFpml6Oy5p+rnscdgYy/8XTL75qiRz+BZJZUAqNg5kIFEFftH9uixj+RtVig6QgnSNN2b5CYwjmloTaYenbTsRlEdeGZIjQIqK1ZQdLxkU/i01o8OtKx19tyE1ROwpUxsDJbNk5r8R30qYbXjfVOdoWDjn5a//9m5g3i+lAzi29/Xq1/BsLsV+i3bWqitGnTKKV58NcnwcyuZuMPl8yHUT0LqF/XezWG9suzh38LE2tht1k6sHO0rHwDMGe7km+gPjYiOZP4jjSVe6snDyX3PV/qtPjKNIzKzDq3ZgX1WZItFj7nHz5rF2nxmUlLeWQ6MkZLeFF6ADoKBg3U6IJEKS5SQ+AvW7ZKCuRbZQ/FO8WPQlNTJtQp4weBhs+D6dY9+BHxS8/lw31wah153BeKLRpIlpqBi0p30Gw3z4IUT7mYrwkMA3vAAoNygyn4V6YaVAfRd7Z2LlduPgPuEq35UDas1ReJEmKmibC4qdVdOeC3oDVcA8gyzM88vixe3REYEGjIHNMB04=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(451199018)(66476007)(66556008)(66946007)(54906003)(83380400001)(8676002)(8936002)(316002)(5660300002)(6916009)(41300700001)(4326008)(6666004)(2616005)(6506007)(53546011)(186003)(6512007)(26005)(966005)(6486002)(478600001)(36756003)(86362001)(2906002)(38100700002)(31696002)(7416002)(31686004)(14143004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1gyeFBzZkx5RnNaQ3dZQkxEd0NpVEdqbE1KOUtjRG0vTHJrMmlHRFBCQ1JL?=
 =?utf-8?B?aG9ndExEbzI4bUVaV08rdUtXRHBPak5YUHVZNjlNS3g4eU9QOFNOb2h6Z2R3?=
 =?utf-8?B?TDdzTFQ0Q1VUdlRkSEVsc0tUVDRrai9yNElkTXhWRU96TEMzY2M5dExETEd4?=
 =?utf-8?B?dlJLUWk5Qk1MTzdHMVRQYWpnRG5EN2xNUFJEekJZTStKd2RIQjhNNzRuRVlp?=
 =?utf-8?B?RG5BOHNIZHAxemgrQkFUMUFSRi9iYlIrQkthS2JlRi81QXcwUG8wUkhMdm9C?=
 =?utf-8?B?dkdHUjlkWmg1UlBPQ2hPdmNjc3RnUHk5NnNNSXoxVzc4MGNneVhyckJwcHZ3?=
 =?utf-8?B?WmM5TVI2UzBLWllvSTVXV3BhOSsxYk5sZVhaaTFYUks0N2MrYXZib25YYmJK?=
 =?utf-8?B?MVdrSW85ZlcxS1l4Mlk0QlJ1WjFYb0V3b1RCZUQwTmt4Q3E4YzhIZU40YU1S?=
 =?utf-8?B?ZTVuNFNTNnhtV0VhVFJ1bzZXUndKZzZtVmJnZktGWlQ4dTFsVWVGd3FBY2hC?=
 =?utf-8?B?UldOazdTWVFoWVB4Q2NwR2dhMm44eWlPMGRyUjhsK0l0b01BLzBXMHE4N25V?=
 =?utf-8?B?bVUzcTJQKzRwaWo0cGVsNmlhcDFzZWQ3SVJRa1BEZWZuelNETFRzbmlUekVD?=
 =?utf-8?B?Y0VDdFNZQ3VCWVlQWnp3eFFLMDJHOVo3Vy8xRGtNMFhQUWxwYjJTQWtVZFB3?=
 =?utf-8?B?K1h2MHJTcWZCSmtMYVo5R3NveU4vZ0FmYlg4bWVPUWh6M3JPSWwwV2pla0p2?=
 =?utf-8?B?Rm1nc2gycEd2VjR4SHh0NXNmM29zbHdtTEUyVGFkNFFyaDBtOElmN01xalZw?=
 =?utf-8?B?aXc4Q0E2cmRIbnViOStoMzRJRnVjYUwwbVV4MlRhSnV1NmhnZUh5YzJndkYw?=
 =?utf-8?B?YlB4aDVXa3hrTjlNc2JiOE5MZWs4aUwyMG1qc0ZlU1I5elR5TkU2N2VtTTJK?=
 =?utf-8?B?cVMySDV5RVZmM1dwcXZGZXV6bm9TcFMzU1ZMajZ6UDNhWVp6UnJoYUtxM2ZT?=
 =?utf-8?B?NGJTSWxmM25reVNYOGZmU0grUGRFNHEva20vTUQ5M0xsVlIrR2hnQ1lnSWs1?=
 =?utf-8?B?NkZ5MnJwMTlHdThHUXEzZkh6cDNreUl3TlNhZXcwRDM2bkJ3ei9jTDQ2dTJq?=
 =?utf-8?B?NS9BM2tiOTFody8vSll2ZGlwZDZQYncyM2s2b2VPdnBxNlVEemRiOUFZdUoy?=
 =?utf-8?B?YmNnWGVkUjV6T2hVK3ZkM1A1MUJSVWZ4NVlEeXNSbGErTTljU3krRGtSU0RJ?=
 =?utf-8?B?UDBMWUFoMjhBZzVpMWdsMHBUQU5YMXBOUUd6SEpaeFgrUWNjRUtVNi9ycCt3?=
 =?utf-8?B?VDhYeXcyb0tUSFhUU0NKTXpNSEZvRVhWNWRIcGhJSFFDSVFLbUNVMk8vV21F?=
 =?utf-8?B?bWVNYUtJZEpOV0NXQyttYmNCTml2VWViampZdkNsbWZzWUhETlQxTWpxdG80?=
 =?utf-8?B?dzZKVzl2WWhtdEV4YUNKVVRUM1J4ak83N3R3d2JHUVpzeTY2RS9JYWhhQVhB?=
 =?utf-8?B?SEo5QnN3NG9URDd0bXZ2VzVwU2RSNHNDN1picWlyV3Aybi9oOW13ekVjTzN3?=
 =?utf-8?B?Zk1WTFZTZTdpblZyaEEwMTZmS05pb0hlRFdPZS8zeEhVVVUvRk8yN2NCMEtQ?=
 =?utf-8?B?cUdub1VYeTdreWJtTG11Uk05R0VLZUZJOWZMUk5xSFNRcjlTZW1JMXdpeUR6?=
 =?utf-8?B?UXFIM2s4ajdYVzlxYWFaUVZYY3lEMlNNMjdjSGdmcDMrM1FhUW9wRHhGZkNW?=
 =?utf-8?B?QkMrcHdFNm91UFhnd1JENzZvLzZqY1ZpemxraEY0Z3RsL0dYM3NGUnBUb0Jq?=
 =?utf-8?B?YlNXZTE1TnFtQlpkSnl5S2NXTlkzNjJwb3NvdzRxcEs5SkxYdlVLZ2ZsSDMw?=
 =?utf-8?B?Z0ZPL3A1ZGx6ck8wK3dKUHdETFkrRjF4M2xuYnZHbWdCbkZ0dWJaRUVXQk81?=
 =?utf-8?B?Z1BubDMyQWZ1MWl1djhXaWdVOUZtcmc2Ti92aUo2WWFaMFhzUU1WYTVLWHhv?=
 =?utf-8?B?UGxkMzU4c0R1cDkyTFoxM0tnaStuNWxtRGNzSkRTMmNGWkt0YjhBYWUyMDZL?=
 =?utf-8?B?Z1MzNHpxMER4UVJCNld6b2VZWVpnS21aZk1DSDNJNmM2RkJJMURUUE95Qkcv?=
 =?utf-8?Q?ALn/kXuiB8XIKPOHLseMEQO93?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42314220-3c90-4c73-41ac-08db15ae2d8a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 14:56:44.0441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H9KEKg7ezTfaOBAir18QyWcpYez/ctfNiQ/GEBHmVweIVgMcwhjSrbbL7b3WT5Ec0/TuMpUERlRgfNr2cBbfAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5337
Received-SPF: softfail client-ip=2a01:111:f400:7ea9::62a;
 envelope-from=avihaih@nvidia.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

DQpPbiAyMi8wMi8yMDIzIDIyOjU1LCBBbGV4IFdpbGxpYW1zb24gd3JvdGU6DQo+IEV4dGVybmFs
IGVtYWlsOiBVc2UgY2F1dGlvbiBvcGVuaW5nIGxpbmtzIG9yIGF0dGFjaG1lbnRzDQo+DQo+DQo+
IFRoZXJlIGFyZSB2YXJpb3VzIGVycm9ycyBydW5uaW5nIHRoaXMgdGhyb3VnaCB0aGUgQ0kgb24g
Z2l0bGFiLg0KPg0KPiBUaGlzIG9uZSBzZWVtcyBib2d1cyBidXQgbmVlZHMgdG8gYmUgcmVzb2x2
ZWQgcmVnYXJkbGVzczoNCj4NCj4gaHR0cHM6Ly9naXRsYWIuY29tL2FsZXgud2lsbGlhbXNvbi9x
ZW11Ly0vam9icy8zODE3OTQwNzMxDQo+IEZBSUxFRDogbGlicWVtdS1hYXJjaDY0LXNvZnRtbXUu
ZmEucC9od192ZmlvX2NvbW1vbi5jLm8NCj4gMjc4NnMzOTB4LWxpbnV4LWdudS1nY2MgLW02NCAt
SWxpYnFlbXUtYWFyY2g2NC1zb2Z0bW11LmZhLnAgLUkuIC1JLi4gLUl0YXJnZXQvYXJtIC1JLi4v
dGFyZ2V0L2FybSAtSXFhcGkgLUl0cmFjZSAtSXVpIC1JdWkvc2hhZGVyIC1JL3Vzci9pbmNsdWRl
L3BpeG1hbi0xIC1JL3Vzci9pbmNsdWRlL2NhcHN0b25lIC1JL3Vzci9pbmNsdWRlL2dsaWItMi4w
IC1JL3Vzci9saWIvczM5MHgtbGludXgtZ251L2dsaWItMi4wL2luY2x1ZGUgLWZkaWFnbm9zdGlj
cy1jb2xvcj1hdXRvIC1XYWxsIC1XaW52YWxpZC1wY2ggLVdlcnJvciAtc3RkPWdudTExIC1PMiAt
ZyAtaXN5c3RlbSAvYnVpbGRzL2FsZXgud2lsbGlhbXNvbi9xZW11L2xpbnV4LWhlYWRlcnMgLWlz
eXN0ZW0gbGludXgtaGVhZGVycyAtaXF1b3RlIC4gLWlxdW90ZSAvYnVpbGRzL2FsZXgud2lsbGlh
bXNvbi9xZW11IC1pcXVvdGUgL2J1aWxkcy9hbGV4LndpbGxpYW1zb24vcWVtdS9pbmNsdWRlIC1p
cXVvdGUgL2J1aWxkcy9hbGV4LndpbGxpYW1zb24vcWVtdS90Y2cvczM5MHggLXB0aHJlYWQgLVVf
Rk9SVElGWV9TT1VSQ0UgLURfRk9SVElGWV9TT1VSQ0U9MiAtRF9HTlVfU09VUkNFIC1EX0ZJTEVf
T0ZGU0VUX0JJVFM9NjQgLURfTEFSR0VGSUxFX1NPVVJDRSAtZm5vLXN0cmljdC1hbGlhc2luZyAt
Zm5vLWNvbW1vbiAtZndyYXB2IC1XdW5kZWYgLVd3cml0ZS1zdHJpbmdzIC1XbWlzc2luZy1wcm90
b3R5cGVzIC1Xc3RyaWN0LXByb3RvdHlwZXMgLVdyZWR1bmRhbnQtZGVjbHMgLVdvbGQtc3R5bGUt
ZGVjbGFyYXRpb24gLVdvbGQtc3R5bGUtZGVmaW5pdGlvbiAtV3R5cGUtbGltaXRzIC1XZm9ybWF0
LXNlY3VyaXR5IC1XZm9ybWF0LXkyayAtV2luaXQtc2VsZiAtV2lnbm9yZWQtcXVhbGlmaWVycyAt
V2VtcHR5LWJvZHkgLVduZXN0ZWQtZXh0ZXJucyAtV2VuZGlmLWxhYmVscyAtV2V4cGFuc2lvbi10
by1kZWZpbmVkIC1XaW1wbGljaXQtZmFsbHRocm91Z2g9MiAtV21pc3NpbmctZm9ybWF0LWF0dHJp
YnV0ZSAtV25vLW1pc3NpbmctaW5jbHVkZS1kaXJzIC1Xbm8tc2hpZnQtbmVnYXRpdmUtdmFsdWUg
LVduby1wc2FiaSAtZnN0YWNrLXByb3RlY3Rvci1zdHJvbmcgLWZQSUUgLWlzeXN0ZW0uLi9saW51
eC1oZWFkZXJzIC1pc3lzdGVtbGludXgtaGVhZGVycyAtRE5FRURfQ1BVX0ggJy1EQ09ORklHX1RB
UkdFVD0iYWFyY2g2NC1zb2Z0bW11LWNvbmZpZy10YXJnZXQuaCInICctRENPTkZJR19ERVZJQ0VT
PSJhYXJjaDY0LXNvZnRtbXUtY29uZmlnLWRldmljZXMuaCInIC1NRCAtTVEgbGlicWVtdS1hYXJj
aDY0LXNvZnRtbXUuZmEucC9od192ZmlvX2NvbW1vbi5jLm8gLU1GIGxpYnFlbXUtYWFyY2g2NC1z
b2Z0bW11LmZhLnAvaHdfdmZpb19jb21tb24uYy5vLmQgLW8gbGlicWVtdS1hYXJjaDY0LXNvZnRt
bXUuZmEucC9od192ZmlvX2NvbW1vbi5jLm8gLWMgLi4vaHcvdmZpby9jb21tb24uYw0KPiAyNzg3
Li4vaHcvdmZpby9jb21tb24uYzogSW4gZnVuY3Rpb24g4oCYdmZpb19saXN0ZW5lcl9sb2dfZ2xv
YmFsX3N0YXJ04oCZOg0KPiAyNzg4Li4vaHcvdmZpby9jb21tb24uYzoxNzcyOjg6IGVycm9yOiDi
gJhyZXTigJkgbWF5IGJlIHVzZWQgdW5pbml0aWFsaXplZCBpbiB0aGlzIGZ1bmN0aW9uIFstV2Vy
cm9yPW1heWJlLXVuaW5pdGlhbGl6ZWRdDQo+IDI3ODkgMTc3MiB8ICAgICBpZiAocmV0KSB7DQo+
IDI3OTAgICAgICB8ICAgICAgICBeDQo+DQo+IDMyLWJpdCBidWlsZHMgaGF2ZSBzb21lIGFjdHVh
bCBlcnJvcnMgdGhvdWdoOg0KPg0KPiBodHRwczovL2dpdGxhYi5jb20vYWxleC53aWxsaWFtc29u
L3FlbXUvLS9qb2JzLzM4MTc5NDA3MTkNCj4gRkFJTEVEOiBsaWJxZW11LWFhcmNoNjQtc29mdG1t
dS5mYS5wL2h3X3ZmaW9fY29tbW9uLmMubw0KPiAyNjAxY2MgLW0zMiAtSWxpYnFlbXUtYWFyY2g2
NC1zb2Z0bW11LmZhLnAgLUkuIC1JLi4gLUl0YXJnZXQvYXJtIC1JLi4vdGFyZ2V0L2FybSAtSXFh
cGkgLUl0cmFjZSAtSXVpIC1JdWkvc2hhZGVyIC1JL3Vzci9pbmNsdWRlL3BpeG1hbi0xIC1JL3Vz
ci9pbmNsdWRlL2dsaWItMi4wIC1JL3Vzci9saWIvZ2xpYi0yLjAvaW5jbHVkZSAtSS91c3IvaW5j
bHVkZS9zeXNwcm9mLTQgLWZkaWFnbm9zdGljcy1jb2xvcj1hdXRvIC1XYWxsIC1XaW52YWxpZC1w
Y2ggLVdlcnJvciAtc3RkPWdudTExIC1PMiAtZyAtaXN5c3RlbSAvYnVpbGRzL2FsZXgud2lsbGlh
bXNvbi9xZW11L2xpbnV4LWhlYWRlcnMgLWlzeXN0ZW0gbGludXgtaGVhZGVycyAtaXF1b3RlIC4g
LWlxdW90ZSAvYnVpbGRzL2FsZXgud2lsbGlhbXNvbi9xZW11IC1pcXVvdGUgL2J1aWxkcy9hbGV4
LndpbGxpYW1zb24vcWVtdS9pbmNsdWRlIC1pcXVvdGUgL2J1aWxkcy9hbGV4LndpbGxpYW1zb24v
cWVtdS90Y2cvaTM4NiAtcHRocmVhZCAtVV9GT1JUSUZZX1NPVVJDRSAtRF9GT1JUSUZZX1NPVVJD
RT0yIC1EX0dOVV9TT1VSQ0UgLURfRklMRV9PRkZTRVRfQklUUz02NCAtRF9MQVJHRUZJTEVfU09V
UkNFIC1mbm8tc3RyaWN0LWFsaWFzaW5nIC1mbm8tY29tbW9uIC1md3JhcHYgLVd1bmRlZiAtV3dy
aXRlLXN0cmluZ3MgLVdtaXNzaW5nLXByb3RvdHlwZXMgLVdzdHJpY3QtcHJvdG90eXBlcyAtV3Jl
ZHVuZGFudC1kZWNscyAtV29sZC1zdHlsZS1kZWNsYXJhdGlvbiAtV29sZC1zdHlsZS1kZWZpbml0
aW9uIC1XdHlwZS1saW1pdHMgLVdmb3JtYXQtc2VjdXJpdHkgLVdmb3JtYXQteTJrIC1XaW5pdC1z
ZWxmIC1XaWdub3JlZC1xdWFsaWZpZXJzIC1XZW1wdHktYm9keSAtV25lc3RlZC1leHRlcm5zIC1X
ZW5kaWYtbGFiZWxzIC1XZXhwYW5zaW9uLXRvLWRlZmluZWQgLVdpbXBsaWNpdC1mYWxsdGhyb3Vn
aD0yIC1XbWlzc2luZy1mb3JtYXQtYXR0cmlidXRlIC1Xbm8tbWlzc2luZy1pbmNsdWRlLWRpcnMg
LVduby1zaGlmdC1uZWdhdGl2ZS12YWx1ZSAtV25vLXBzYWJpIC1mc3RhY2stcHJvdGVjdG9yLXN0
cm9uZyAtZlBJRSAtaXN5c3RlbS4uL2xpbnV4LWhlYWRlcnMgLWlzeXN0ZW1saW51eC1oZWFkZXJz
IC1ETkVFRF9DUFVfSCAnLURDT05GSUdfVEFSR0VUPSJhYXJjaDY0LXNvZnRtbXUtY29uZmlnLXRh
cmdldC5oIicgJy1EQ09ORklHX0RFVklDRVM9ImFhcmNoNjQtc29mdG1tdS1jb25maWctZGV2aWNl
cy5oIicgLU1EIC1NUSBsaWJxZW11LWFhcmNoNjQtc29mdG1tdS5mYS5wL2h3X3ZmaW9fY29tbW9u
LmMubyAtTUYgbGlicWVtdS1hYXJjaDY0LXNvZnRtbXUuZmEucC9od192ZmlvX2NvbW1vbi5jLm8u
ZCAtbyBsaWJxZW11LWFhcmNoNjQtc29mdG1tdS5mYS5wL2h3X3ZmaW9fY29tbW9uLmMubyAtYyAu
Li9ody92ZmlvL2NvbW1vbi5jDQo+IDI2MDIuLi9ody92ZmlvL2NvbW1vbi5jOiBJbiBmdW5jdGlv
biAndmZpb19kZXZpY2VfZmVhdHVyZV9kbWFfbG9nZ2luZ19zdGFydF9jcmVhdGUnOg0KPiAyNjAz
Li4vaHcvdmZpby9jb21tb24uYzoxNTcyOjI3OiBlcnJvcjogY2FzdCBmcm9tIHBvaW50ZXIgdG8g
aW50ZWdlciBvZiBkaWZmZXJlbnQgc2l6ZSBbLVdlcnJvcj1wb2ludGVyLXRvLWludC1jYXN0XQ0K
PiAyNjA0IDE1NzIgfCAgICAgICAgIGNvbnRyb2wtPnJhbmdlcyA9ICh1aW50NjRfdClyYW5nZXM7
DQo+IDI2MDUgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgXg0KPiAyNjA2Li4vaHcv
dmZpby9jb21tb24uYzoxNTk2OjIzOiBlcnJvcjogY2FzdCBmcm9tIHBvaW50ZXIgdG8gaW50ZWdl
ciBvZiBkaWZmZXJlbnQgc2l6ZSBbLVdlcnJvcj1wb2ludGVyLXRvLWludC1jYXN0XQ0KPiAyNjA3
IDE1OTYgfCAgICAgY29udHJvbC0+cmFuZ2VzID0gKHVpbnQ2NF90KXJhbmdlczsNCj4gMjYwOCAg
ICAgIHwgICAgICAgICAgICAgICAgICAgICAgIF4NCj4gMjYwOS4uL2h3L3ZmaW8vY29tbW9uLmM6
IEluIGZ1bmN0aW9uICd2ZmlvX2RldmljZV9mZWF0dXJlX2RtYV9sb2dnaW5nX3N0YXJ0X2Rlc3Ry
b3knOg0KPiAyNjEwLi4vaHcvdmZpby9jb21tb24uYzoxNjIwOjk6IGVycm9yOiBjYXN0IHRvIHBv
aW50ZXIgZnJvbSBpbnRlZ2VyIG9mIGRpZmZlcmVudCBzaXplIFstV2Vycm9yPWludC10by1wb2lu
dGVyLWNhc3RdDQo+IDI2MTEgMTYyMCB8ICAgICAgICAgKHN0cnVjdCB2ZmlvX2RldmljZV9mZWF0
dXJlX2RtYV9sb2dnaW5nX3JhbmdlICopY29udHJvbC0+cmFuZ2VzOw0KPiAyNjEyICAgICAgfCAg
ICAgICAgIF4NCj4gMjYxMy4uL2h3L3ZmaW8vY29tbW9uLmM6IEluIGZ1bmN0aW9uICd2ZmlvX2Rl
dmljZV9kbWFfbG9nZ2luZ19yZXBvcnQnOg0KPiAyNjE0Li4vaHcvdmZpby9jb21tb24uYzoxODEw
OjIyOiBlcnJvcjogY2FzdCBmcm9tIHBvaW50ZXIgdG8gaW50ZWdlciBvZiBkaWZmZXJlbnQgc2l6
ZSBbLVdlcnJvcj1wb2ludGVyLXRvLWludC1jYXN0XQ0KPiAyNjE1IDE4MTAgfCAgICAgcmVwb3J0
LT5iaXRtYXAgPSAodWludDY0X3QpYml0bWFwOw0KPiAyNjE2ICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICBeDQoNClN1cmUsIEkgd2lsbCBmaXggdGhlc2UgZXJyb3JzLg0KDQpUaGFua3MuDQoN
Cg==

