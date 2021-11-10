Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C30C344CABC
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 21:40:27 +0100 (CET)
Received: from localhost ([::1]:35278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkuOQ-0003KL-HI
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 15:40:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brijesh.singh@amd.com>)
 id 1mkuNF-0002cd-Tt
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 15:39:13 -0500
Received: from mail-mw2nam08on2063.outbound.protection.outlook.com
 ([40.107.101.63]:25889 helo=NAM04-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brijesh.singh@amd.com>)
 id 1mkuN9-0006XM-Ro
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 15:39:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ShrqbdZvbQufYuWcrmY/zmdE3TToTgGejGRysOu8Qg5vFSb4LUC1jEwPduaf1fbhH2Zm07iK3HsQTKsfgb6As9gZj9VKJB3JEDPLqJR7FfKhsLIQgvclqIimXZURD6lXlZYvLAZEddwoCupbKiE6JVIo9/mlkge2K/Y+Bqep9WIj90/NowFs0mIxuoOuuehvMXnjgmM5Kq9V8qc0PK4sFO8TccVdSovFrxWGNcS616y7oUCea157iOX/UyFiKxEE6GgrcjtQRtvE0/nU/U+5MxEpElMWzz8Y+MzhqILkBgFQs4TcXS7Bep1Zidp48E0uYiaXM8mRWGU6ihqaTlK7PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6eby14ypTyISOtc7z/t76fS19Ax3n1IMRH0tATJi41I=;
 b=bHq+c9iJNWFkcdJD+qAZc2pBc8HfcZVAbf0usnZY6LHWHvFil+on1ZVJTZ2pncXUUqn7U5wgYt6dJZTNLCL42WcqhYQt4lJZkpsz8+pOi+9nYsnruW9kNGHlbCJvjkPFxkY5lvFjwoPZ62cPscweUAqBjinllcBSGsS+hKRLb3/AnDBcLOUSK2tOAXplYWHHDdEjcmx4kI6p6xmGYp5+QPqX+ExpawvPEuAgJTl3rdaXR/g9WgMVE+8hqqdNFEFCbAJnZdZejFzGEgzSpAm1nJ+8j+uimeWgb83F5uYKpUKa4goVzSwRugd0d1loiVqd9qrz7W5cQVvqkeHUsz/gkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6eby14ypTyISOtc7z/t76fS19Ax3n1IMRH0tATJi41I=;
 b=JCjABRXE/7RsZXxiN8xt/JlRhxcGy9yGRhaCvkESUv2rLq0zAkitkqhrl1upGjzbr9aPHu+s6uZNvohiIaVAnQAVvZJaETrPZvwK3pbCiNwjRXWhnHnTQIaDIofaUxFziqy+MeJ3cibhpznKBJ47Zb3pGZCxKvQcjVRibXFhsMY=
Authentication-Results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2718.namprd12.prod.outlook.com (2603:10b6:805:6f::22)
 by SN1PR12MB2414.namprd12.prod.outlook.com (2603:10b6:802:2e::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.17; Wed, 10 Nov
 2021 20:18:11 +0000
Received: from SN6PR12MB2718.namprd12.prod.outlook.com
 ([fe80::e4da:b3ea:a3ec:761c]) by SN6PR12MB2718.namprd12.prod.outlook.com
 ([fe80::e4da:b3ea:a3ec:761c%7]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 20:18:11 +0000
Cc: brijesh.singh@amd.com, Paolo Bonzini <pbonzini@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 James Bottomley <jejb@linux.ibm.com>
Subject: Re: [PATCH v2 0/6] SEV: add kernel-hashes=on for measured -kernel
 launch
To: Dov Murik <dovmurik@linux.ibm.com>, qemu-devel@nongnu.org
References: <20211108134840.2757206-1-dovmurik@linux.ibm.com>
From: Brijesh Singh <brijesh.singh@amd.com>
Message-ID: <f9ada686-06d3-8345-c379-4d68a46d4b4e@amd.com>
Date: Wed, 10 Nov 2021 14:18:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211108134840.2757206-1-dovmurik@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR02CA0005.namprd02.prod.outlook.com
 (2603:10b6:207:3c::18) To SN6PR12MB2718.namprd12.prod.outlook.com
 (2603:10b6:805:6f::22)
MIME-Version: 1.0
Received: from [10.236.30.107] (165.204.77.1) by
 BL0PR02CA0005.namprd02.prod.outlook.com (2603:10b6:207:3c::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10 via Frontend Transport; Wed, 10 Nov 2021 20:18:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c809d396-795a-4935-522d-08d9a487376e
X-MS-TrafficTypeDiagnostic: SN1PR12MB2414:
X-Microsoft-Antispam-PRVS: <SN1PR12MB24144A6B5185D479BC26EC6EE5939@SN1PR12MB2414.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:207;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3uvwCrYABtoaJZufCLeaeuae7LpkBAfaiyKwM1tGkbC6O6WhLROLn3f9vs8cBJDzzCrn36NkxEGk4CUEGS+EDOmmHRSk7/lYovjRVReY02tchx9d48iZs7OZuj0d6pWUNRoHVmVhfmIyxY712bsFGHknutdYgxjoO2kej7bk8Cvt/ls8NwLV4yaroDjdYbbnZfvcvYoo5NakgA6MxvY/ktN1OyraLKCM0LTgZ2UjW7bGKD+wLYUxjBNj49jUFOgk+WcBNWm+/7KaoFAi5gucLgxlRjIF5tAc0m6MDrbkcfXq8XHfH4B2hYEqw5+0jbMtsWKSuz+7UDYd0DFHZBF5AwYy/NOcClfRINPp6pKWPM6nxtD4Qxrp5OlCIIriivK0evTVHN1MZ3oMkiO/hmO4cgytAAcZQiDAXbEQBo+yPtQ3UcMN7hGIxRWoVVvclkht6Tonrkq0tXqKeLhVabz1JTHKthsbxVHHWS/WT1Gy1I9z0nACdv7CyiZBDlL+dGA1IvKYLGca/4I0OWRhdPrbIsMG1HEyzw+KiIB1OgGzGG0uioenVVXSDLTFoKas45x9o+AIGf5eIIxG9Gweouaox2UpayccpG8fy78nllb0CngrBkuYE0j/9QNHfhJZ5320v/xCZO+CJmZcSX/YFGYqpV5DNDdiHG464WcGtqoYzAs5yynNFbneaVd4YSwZn8SeDf1C1NfbNV0lpK9idNhlNtP5f308KIg1FXtm2lxYS2FHv2iWTG1RmqQFKPa6e/6Fjl99N9YdC9QQhFqRBCTf5GbF5jTrJRiEYn5CQx2dgD2m3/jiWeUGvEKiQXw1S8hrKrLR2qRPs1z3sEZnf0AIUkQiqPRwP6UR9SuQcqmxu5K+GjiFy+yt2johkpitTRuv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2718.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(36756003)(44832011)(956004)(38100700002)(53546011)(8936002)(66556008)(26005)(508600001)(2906002)(966005)(316002)(2616005)(31686004)(5660300002)(54906003)(45080400002)(16576012)(31696002)(7416002)(6486002)(4326008)(83380400001)(8676002)(186003)(86362001)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWc2TXp0Z3J5S3FFdkJadURrakFIK2twR1VmQlVKYWdkVmFhOW02YmpRREgr?=
 =?utf-8?B?WldGNHJ2YkNvL3hJUzFoZHNoVUJhd0ZqbXcrVFdkemMxdVM2QlZZTHNLYmJ2?=
 =?utf-8?B?T1R2TnBPbExYT21QV2Z5ZjlsSjQ1ZXZOTDltb2hya3crUktqbGZWOVI1Q0Jp?=
 =?utf-8?B?czJQTmMwemdoTUZuODEwaFRmWmt0bTV6d1l3RTlOYVZoVVQ2cVd3MUdYL1dK?=
 =?utf-8?B?aGZPNm9ZT21BYlU4UGVlSlp6N3VFUlE2LzJ0UHI5V1A2UHlCYkdoU2JTdkRB?=
 =?utf-8?B?aUs2ZGt3RDFUVTk0TnhqZ0FvMGZQZWV2ZWc5NDk3a2U2VkpiK0dDZUg0RE5N?=
 =?utf-8?B?YmJBYWxZdXpDRk1FRFhwYVllQUUrcEsyTUc5NmN3cGFoNjFVSDdqU0tadFV4?=
 =?utf-8?B?UnVDeCt2ZHJyQk16RlBQcStVekFqZVN3eWJ6N3lVbllxWTRoTE9DdUpXdEpZ?=
 =?utf-8?B?b0Q0K1Y3MmcwWUFGczYyN1IxclY1amJnc0lMN0V5b2RwaG5CaHZwTmZER1ZS?=
 =?utf-8?B?K2kyNzNLR2RoeEdLUGdYdncxeUZNQ3F5QzBOUm9WOStVQjROb3B4WkcyTXlz?=
 =?utf-8?B?VGFIdzdHV3N5TjFYNlhEVnZreWllSjd0eE1HVjNkU1NLemdGeHhJTUNYcnlr?=
 =?utf-8?B?d3ZBeDR3YVlGK2ZYUjBKYUxSWW9sTGp2RmRIQVFwb3UxZzNPYUdvWW1rcm5t?=
 =?utf-8?B?bFZjb3ZKeEVUdHFURlEzUkpmYlNIcTZmakVnM0pHMW0rNThQZE9RVUl0RW5X?=
 =?utf-8?B?VXoxTzNXK3lGNkJKenF5VHRzeWJ6SmdiUGVpc1BQY09CZDc2NkwyeFBuREV2?=
 =?utf-8?B?eGRUdDBOOUZ0bDVWc3FyTTBBVzJPbU9NbVZuSmV0a0htK0ZBblZtSFlTVVZt?=
 =?utf-8?B?TDR1VHNRamJneEh3c1RhU2xKcU9GMWtRUUZBMmdBSlM5SjQrbngranFOTUhm?=
 =?utf-8?B?NmpxQmJJZkx2VWhKaytEMjdPaDJGalo4YWRSazhUYlhNY2VwMVoyNldyckV2?=
 =?utf-8?B?UUx2K1lhbkFyL2xhTFVGMlJ2THUvamF1T2N6Tm1qL0tBU3VFS1BrcVdFTmdR?=
 =?utf-8?B?UWVscTloMEw2V3VWZkJaWWdoVThVNXMwMDFmcG1XUFVpWTNuRElCOFlLYmVp?=
 =?utf-8?B?dUZrUjBmeko0NUFwSWFUcldMajVsQ3NDb3QzeVRXTkVmT29IbXNGbEd0Wi9n?=
 =?utf-8?B?Y1AxU2RJcEZ4S2t4ZVdIYWJqV2REZmhIZjdyQWN1OFBSMERvR2xpak1YRVls?=
 =?utf-8?B?OVJoYUlsajlMcDRCd2ZpR3N4QlNWbWxXK1R5NWMwM3NtK1I1azVwQ1VwVXpJ?=
 =?utf-8?B?RDVNUHZPQjhGTXpxZXVhWmxGb0IwbExSbXFPNk00TTl0VTlRN0VmbXE0WUJS?=
 =?utf-8?B?RG9tZnl5MkRlM3FJN0I3K3BlYWpnbGk1ck41Yzd5WWdBTy82NjVIQkE3Umll?=
 =?utf-8?B?dXBzRkdMUU12Y3lPd3AraFJZQUkzdHF4OG9Jd1Z5ZHNQeVVvR254cDc5VE4z?=
 =?utf-8?B?c2JmcExaSGFkd0FqZCtCaFcyTHd1cDU0d2FqQzFFeW45RmNOdTlueXdzeFYy?=
 =?utf-8?B?bGJqT0RBQ3prRmJNZjN3RDRWZ0pxWFlzUWNMbzNqSVdnQVE4WXF6eFFYYXdK?=
 =?utf-8?B?UWgvVUxoWlo0RmtQNFNhTEhna2FuWlpGTUtobElKMzNrajJwNk1BeENGeTkw?=
 =?utf-8?B?R3d4TFg3SGZkaFc0L3UrK2RNeHIzYm5qNklzNzRUMTFvOG5OYThxZm5CM0dI?=
 =?utf-8?B?NDErbDIvSmtrUHFBUGcxZFRRN3ZuVkhBU2E5S3RYZmd5ZXVHUSt4akJtNWp0?=
 =?utf-8?B?TjlFYjlOUDc5VFJ5Z3I5S3VnMHZTYWMrTHNBNngxKzl4MkVmQ0dwdTkwQ3dP?=
 =?utf-8?B?bFNZalZwRG00TVpPejRRVXhSdlVZYUtvWHhZOU5uRUZrdFFZU0c5OCtENEYr?=
 =?utf-8?B?ZjNrMFZvQlVPOE83allXc3NMQXhKbytzYUsvTS8wMWdEYjd3cjBmQmJWeTZt?=
 =?utf-8?B?K1Awb3ZXZ21pQy9OS3JwOFk4NGw2d2JlZm10cG1VOW5xbGhDakNDOElEUU5T?=
 =?utf-8?B?VC82blc5RnVHZjJPZ3RpRG9zZjUyMjdYKzNpU1VpT09HMmpsQk81bGJkdkc5?=
 =?utf-8?B?OW5VclVOUURadzRnY3N2NE9wTEcwOE5VNWFwSFUxTXdCb2hNcS9wb1ZnTzRI?=
 =?utf-8?Q?dtruCSPLoDMcRXW2ubK5bSs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c809d396-795a-4935-522d-08d9a487376e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2718.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2021 20:18:10.9911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fA3CQV3cu3RNCzW251xKZNDbF/4UC8qEtUhmMrWMJZS0Z4cqOQNsW5iSfn8n7j/Yz45N4XhCiS4/4GeAC0ONYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2414
Received-SPF: softfail client-ip=40.107.101.63;
 envelope-from=brijesh.singh@amd.com;
 helo=NAM04-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.678, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/8/21 7:48 AM, Dov Murik wrote:
> Tom Lendacky and Brijesh Singh reported two issues with launching SEV
> guests with the -kernel QEMU option when an old [1] or wrongly configured [2]
> OVMF images are used.
> 
> To fix these issues, these series "hides" the whole kernel hashes
> additions behind a kernel-hashes=on option (with default value of
> "off").  This allows existing scenarios to work without change, and
> explicitly forces kernel hashes additions for guests that require that.
> 
> Patch 1 introduces a new boolean option "kernel-hashes" on the sev-guest
> object, and patch 2 causes QEMU to add kernel hashes only if its
> explicitly set to "on".  This will mitigate both experienced issues
> because the default of the new setting is off, and therefore is backward
> compatible with older OVMF images (which don't have a designated hashes
> table area) or with guests that don't wish to measure the kernel/initrd.
> 
> Patch 3 fixes the wording on the error message displayed when no hashes
> table is found in the guest firmware.
> 
> Patch 4 detects incorrect address and length of the guest firmware
> hashes table area and fails the boot.
> 
> Patch 5 is a refactoring of parts of the same function
> sev_add_kernel_loader_hashes() to calculate all padding sizes at
> compile-time.  Patch 6 also changes the same function and replaces the
> call to qemu_map_ram_ptr() with address_space_map() to allow for error
> detection.  Patches 5-6 are not required to fix the issues above, but
> are suggested as an improvement (no functional change intended).
> 
> To enable addition of kernel/initrd/cmdline hashes into the SEV guest at
> launch time, specify:
> 
>      qemu-system-x86_64 ... -object sev-guest,...,kernel-hashes=on
> 
> 
> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fqemu-devel%2F3b9d10d9-5d9c-da52-f18c-cd93c1931706%40amd.com%2F&amp;data=04%7C01%7Cbrijesh.singh%40amd.com%7C908b739400a747e1b22308d9a2be7e07%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637719761315906327%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=cMoOlNU2faGwRk6dXVmOE1SuNrg3VvySAC1Ds8fcaFQ%3D&amp;reserved=0
> [2] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fqemu-devel%2F001dd81a-282d-c307-a657-e228480d4af3%40amd.com%2F&amp;data=04%7C01%7Cbrijesh.singh%40amd.com%7C908b739400a747e1b22308d9a2be7e07%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637719761315916323%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=7IZ1%2B%2Fh%2B88xWDlHd%2FMKPN0fJfI6dmSX%2F1TbK8aL8bAs%3D&amp;reserved=0
> 
> 
> 
> Changes in v2:
>   - Instead of trying to figure out whether to add hashes or not,
>     explicity declare an option (kernel-hashes=on) for that.  When that
>     option is turned on, fail if the hashes cannot be added.
>   - Rephrase error message when no hashes table GUID is found.
>   - Replace qemu_map_ram_ptr with address_space_map
> 
> v1: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fqemu-devel%2F20211101102136.1706421-1-dovmurik%40linux.ibm.com%2F&amp;data=04%7C01%7Cbrijesh.singh%40amd.com%7C908b739400a747e1b22308d9a2be7e07%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637719761315916323%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=SrE9kYP0Qdhx0WqIXbnwHgeX%2BjBVT9BsK6I0OLU3naI%3D&amp;reserved=0
> 
> 
> Dov Murik (6):
>    qapi/qom,target/i386: sev-guest: Introduce kernel-hashes=on|off option
>    target/i386/sev: Add kernel hashes only if sev-guest.kernel-hashes=on
>    target/i386/sev: Rephrase error message when no hashes table in guest
>      firmware
>    target/i386/sev: Fail when invalid hashes table area detected
>    target/i386/sev: Perform padding calculations at compile-time
>    target/i386/sev: Replace qemu_map_ram_ptr with address_space_map
> 
>   qapi/qom.json     |  7 ++++-
>   target/i386/sev.c | 77 +++++++++++++++++++++++++++++++++++++++--------
>   qemu-options.hx   |  6 +++-
>   3 files changed, 75 insertions(+), 15 deletions(-)
> 
> 

Thanks for the fixing it Dov.

Acked-by: Brijesh Singh <brijesh.singh@amd.com>

thanks

