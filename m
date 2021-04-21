Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4347036737E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 21:34:06 +0200 (CEST)
Received: from localhost ([::1]:43548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZIbt-0006dw-9Z
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 15:34:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1lZIZH-0005IX-4n
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 15:31:23 -0400
Received: from mail-co1nam11on2072.outbound.protection.outlook.com
 ([40.107.220.72]:37857 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1lZIZE-0002Ax-5P
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 15:31:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z9ckIAdpu1syIqoCczekV7w7M1Hlj563ZdjD/ipS+QNSE5pOvChEKl9Vu4z57lbMJ0E3NCjsc//Qx+7V3CE3bcVHHCyt48mVWA/RlEJU/ZmZO4+E/VMpUPGBnFWj5AlYpD6ucjerLeL6be2pLWgDfK7ouHu1vidrCXKT7BP18vXQW5fMlhj4oLdacNs3fzOVCfyA8MRJkFC9pNRGKJHlQUmVHU3YNw0xDQaBzUWCxuqarw65jAW730vfuEOhBQ1EPkP9ErSLJVhqo1n/bJTRt8CzeYuVerDyQ1TaRlKecFbson1k/t1DnU5MAvU2d3N8GN/HXm8Jp1Wj2gHVRcA46w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8E5GkHBruOLibxkwQcjmWeJ5KhNgoe1uh/TtpiF2Co=;
 b=S3rp4LB+mate5fJqs3AdStGkKap8RA7qb3DoRqTQiW2Su0JYLml4S2BY32Hdvvylxij2bubjnkMtJoz+qtJM0EO+dj9yYQYLm8DCSXOUivfPj19ycuplWovJ58pqjlSGDsQVTOvhr8lctF9qlp2I7/sQTBWHVPQKrIAgbW9OyfRTddJu+fAWITrPB4J5h/s1hX1pWNzup/rPS7re00bTPU6fCKACiuRj34/HJMKwzkSWfuoy6YXkSlqkZ3PkUdm+pz3ZIKrdjTS2r66YKh+1bHVd2rqHIot4kl+UhZ2wCH/w0QTa4ZRnLiTe8jaHyIl3UhjthH1IRig47AHX9lCsGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8E5GkHBruOLibxkwQcjmWeJ5KhNgoe1uh/TtpiF2Co=;
 b=rD72tBKznTyKHyR899ZjxqlfHveGfGbk4/2orPEKjRxDxMCMM3rncO9V1i4K9ygf2cqjj4AnYsMZEF2+0OEotgYRFs+P9kge5QvPU5yg7F1ocTJqUzzBIG8PTKCnsBEt+ktVRkJBpme0WHsksiwDwjOwBxt2GhacNcG7WfBuNRg=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1355.namprd12.prod.outlook.com (2603:10b6:3:6e::7) by
 DM6PR12MB4217.namprd12.prod.outlook.com (2603:10b6:5:219::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21; Wed, 21 Apr 2021 19:31:16 +0000
Received: from DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::b914:4704:ad6f:aba9]) by DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::b914:4704:ad6f:aba9%12]) with mapi id 15.20.4042.024; Wed, 21 Apr
 2021 19:31:16 +0000
Subject: Re: [PATCH] docs: Add SEV-ES documentation to
 amd-memory-encryption.txt
From: Tom Lendacky <thomas.lendacky@amd.com>
To: qemu-devel@nongnu.org
References: <c06be7ec96e774bd6e17f14a27330c74266c5650.1619032376.git.thomas.lendacky@amd.com>
Message-ID: <83253264-764c-85e3-8bb0-0dbd58b9c1dc@amd.com>
Date: Wed, 21 Apr 2021 14:31:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <c06be7ec96e774bd6e17f14a27330c74266c5650.1619032376.git.thomas.lendacky@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [67.79.209.213]
X-ClientProxiedBy: SA0PR11CA0148.namprd11.prod.outlook.com
 (2603:10b6:806:131::33) To DM5PR12MB1355.namprd12.prod.outlook.com
 (2603:10b6:3:6e::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from office-linux.texastahm.com (67.79.209.213) by
 SA0PR11CA0148.namprd11.prod.outlook.com (2603:10b6:806:131::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19 via Frontend
 Transport; Wed, 21 Apr 2021 19:31:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4bf64c69-2385-4812-7be1-08d904fc07d4
X-MS-TrafficTypeDiagnostic: DM6PR12MB4217:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4217183C4C4A520A288E20E0EC479@DM6PR12MB4217.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b8oNBnAPlfVIIiMdhHUyv1wzpLchW/oX7tR/vZBINIzTpy0ab5f8GCZ0X/q7Z1TFprt3rB5Bb11yNHMC/YcZ2cxkVtbV1P9WAYqXfldkO9bHXlvIS1LtLtvgp7yIr/4XvZtYRPBAIhEHMwzSM/6ocBIXaS6py4hyMRJGTX6pPXAeyKIQdAsM9WvlgyHpyqtRgOsNrqeuVa9C0ZDLYKujDLqSRg8CFjSZlQEHZG5xjfx9Sguw2IBoERKQZT9+tb1flmP5A5ZowMWIXFk7v2UrRpuM2ryhMS3bjeV2c4rGIKoyEEzTBqwn+4JRdfFoIshdMPbZTDqFJKlwjYglp5gq5SdeULy8qZtsnzTLa9wn7Mr8iUhvPahoI6DvDccOSnQtB9Zy2QlEE03LHtDkr92MvhxAqCmTMNeK2S0j5as5CDccgw3X6craWkvDRjbH3N6RhY1qZuFMh0C7HxkFXK3t3gew+oS5h7Zioy9LmBay7BElSevel1UQ9GXtubNZxPJFWHND4IDt3qZgdeHQcaBO3gchcvsGXWGEqvnHYgJfM8rNoiesaLG6967EN7VfHtSoTCNpnF+FhGV+FchQwVqqgBcaJdy9qLv90RQJNtS2muUaEklqdmIxNWFbvsT9LFTqgyijvX7BtTv9Wb71bG2VZW40iX3rBXtMWxqXcT17YRiUKHkm4/GgKiugpIf2gim2SZhvTbmmfyb9+JqUMn9+1rdzPyeaH213DpVkiq8ZVquw32H4mgPYjEhZi/tsMBEwggptBwPiPpx2OntbIUU6/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1355.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(396003)(39860400002)(136003)(54906003)(6486002)(478600001)(53546011)(5660300002)(6506007)(956004)(4326008)(2616005)(86362001)(16526019)(2906002)(6916009)(316002)(26005)(186003)(31696002)(6512007)(31686004)(36756003)(83380400001)(966005)(66556008)(66476007)(66946007)(8936002)(8676002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NWd4aDhGTk15NHVRLzJRVDZyemdUL0NTb3kza1VTa3pPYzVJblE5NTkwWE5N?=
 =?utf-8?B?ZHhVais1TzBGYzZHZWN1amMzNVdoV3Z0dmVKdjBZWHMvaWlKZHhySndRMktD?=
 =?utf-8?B?MUVEVjhNMWtVMFNwQmQ3eDNpL3FUOWZrbWkrYUowdVN1SFNwbURYdGFMcGRp?=
 =?utf-8?B?c1VBdmxpeStmTW0rV0NvRlVtT1dNaEE5emxCbjUwTWVqT2t4NTQyc1REVGFR?=
 =?utf-8?B?dlBZSGNDMU1JQ3VUNjZBU3UyR3VPTkx6Zm85UHlGeDAzZVNnYitYQmNSQksx?=
 =?utf-8?B?K2dTSkdEcVl3SUNTU3lBVmk2VHh3WDNhRHhDYURUN0VsenZHVERSd2FSRGpR?=
 =?utf-8?B?U3d6QncwR2xKMlpwQUorbEtaL0lGVDNPd016ZmdxWk5qcEVFTi9DajhLNjhS?=
 =?utf-8?B?dHIzWkVjOG1MaHcxYmROMU1YZjM2cDg4ZnUxRkdvVU9uSVUydlBkb1g2Yzd5?=
 =?utf-8?B?ZUtqa0xPajdiUWV1T0xZTG00c1lENEM5N2RmTC9RekRrU1VyUzQ4VWphYVly?=
 =?utf-8?B?VWZKUzVxQTNRalhDYjM5V1FYL2d4RGVDTlFTbTVPVjkwYjJhY3p6VitlcEUw?=
 =?utf-8?B?d1BZNEFnaWM1cjhIQWZGN2p4WitlWWMwMERpaS96aENiVk45bitQZlZPSjhj?=
 =?utf-8?B?bVQzbXJmN1h0KzJOcjRiVUFKbWFaOXJhNy9TZWxOZi9XNjF6RzRoWEt3aW9l?=
 =?utf-8?B?bWtwM0hjWCtUUVk5YitOeC93VUN0Rzl0L25IYWlQc242MlFWOXAvYVJjQTVm?=
 =?utf-8?B?NnhuMU5BNlY3WkxOZlBUY2pqdFV1UXhDSU82UXJNMXp6b3ljT1NWVXdndy82?=
 =?utf-8?B?VzNoVkJ0c1RiSGoyNDJBNjJvbEMwTWxDSmdlMFBQRk9MUlExcVJoTDdVQWFF?=
 =?utf-8?B?anpGVFhlYk5DNENZZ2dqVkZ0K2VKT1pmK2oxQmM1N0RmWnYyM2Y0WjErUkNK?=
 =?utf-8?B?QUloTDE5c01KZ0FMVWU4czhnR3VoNWY4RTlrSFNDcUdydlFmVWJCdkVQZEZZ?=
 =?utf-8?B?VHVHcjJpSGtuME5mZXpvYkpjYXQ3MU5JRzY2eVhRUkxjY2FOMjVZd0FpZmly?=
 =?utf-8?B?eGFtc2UvVk45bXU2YTJ2V05ZUFFCSDVzakZZR2pHT0Z3bHpPUmU3M3huUUpl?=
 =?utf-8?B?T2h2R2l6RFg2M3l5NzdKaVVFSmI3N3ZCRTNobWcvRldGcjVEWENxMHdZekpl?=
 =?utf-8?B?N09oclFlbnZKdy9Qem9FdVNEMUJRNnVScnJVQlN5am4vNndqTkRuL0pFT3Bn?=
 =?utf-8?B?U1NZNEUvT1NHRHlGTkxTcHJhb2NCc2tGMEJoY0hSOXlla0FJUldhM2FudytS?=
 =?utf-8?B?czMxVXgwdWtKeU5GbzEyNlNZYjh6ajEzVm55TzZMM0wzV0pKejRKalE4UE02?=
 =?utf-8?B?dWpQU2lYRWdORWFTTXZmM05ob0IyYWhkdWNuelIxV2hxS3J3MzcySCs4Um1a?=
 =?utf-8?B?WHF5Q3crZUx1cUUzQ0RPdmJ5WjRVV0RDc0h2VXJYUmZYUTVld2ZuM2owdVRO?=
 =?utf-8?B?R2RMaVRXY2c4cStGSnlZTSs3Qjhoa2ZyZnZ3WldOY0hzYlB5cjFEUUFTVUd1?=
 =?utf-8?B?eUpFMnJBQVREY2JZcEVVa29HYlRYUEZTYmZlT3V4VzduZDgxc0U5WFRxWXNk?=
 =?utf-8?B?bEh2OWxiSjYxeW5xNmJGZmJEMm5mM2FYOEtJdVFPN3hGY2gyeVBsZ3FZc1Zs?=
 =?utf-8?B?RlJBaDJRM2RlbnI2N0NOVjlrSGNrR2d2NW5IU2VHdERzT250M20rTDVBVURH?=
 =?utf-8?Q?N/vzQAqJqN5rleE2+cvLeHV3fS5Djsi/Wy2gvZt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bf64c69-2385-4812-7be1-08d904fc07d4
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1355.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 19:31:16.0790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s8kO+J7kYspFrESq4DY3oMH/R5fe1lmVOJXTNVl/xldeqnAIgoSoTm86vUOsaqYvK5DLv4OZVcHuqrssq+5UFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4217
Received-SPF: softfail client-ip=40.107.220.72;
 envelope-from=Thomas.Lendacky@amd.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Pavel Hrdina <phrdina@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michal Privoznik <mprivozn@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/21/21 2:12 PM, Tom Lendacky wrote:
> From: Tom Lendacky <thomas.lendacky@amd.com>
> 
> Update the amd-memory-encryption.txt file with information about SEV-ES,
> including how to launch an SEV-ES guest and some of the differences
> between SEV and SEV-ES guests in regards to launching and measuring the
> guest.
> 

Hmm, it occurs to me that I should also mention some of the launch
restrictions between SEV and SEV-ES - such as not supporting SMM or reboot
in SEV-ES because of the requirements to modify the guest register state.

I'll wait for feedback on this version and send out a v2 with the added
information.

Thanks,
Tom

> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
> ---
>  docs/amd-memory-encryption.txt | 45 ++++++++++++++++++++++++++++------
>  1 file changed, 37 insertions(+), 8 deletions(-)
> 
> diff --git a/docs/amd-memory-encryption.txt b/docs/amd-memory-encryption.txt
> index 145896aec7..795b990fab 100644
> --- a/docs/amd-memory-encryption.txt
> +++ b/docs/amd-memory-encryption.txt
> @@ -12,18 +12,28 @@ The key management of this feature is handled by separate processor known as
>  AMD secure processor (AMD-SP) which is present in AMD SOCs. Firmware running
>  inside the AMD-SP provide commands to support common VM lifecycle. This
>  includes commands for launching, snapshotting, migrating and debugging the
> -encrypted guest. Those SEV command can be issued via KVM_MEMORY_ENCRYPT_OP
> +encrypted guest. Those SEV commands can be issued via KVM_MEMORY_ENCRYPT_OP
>  ioctls.
>  
> +Secure Encrypted Virtualization - Encrypted State (SEV-ES) builds on the SEV
> +support to additionally protect the guest register state. In order to allow a
> +hypervisor to perform functions on behalf of a guest, there is architectural
> +support for notifying a guest's operating system when certain types of VMEXITs
> +are about to occur. This allows the guest to selectively share information with
> +the hypervisor to satisfy the requested function.
> +
>  Launching
>  ---------
>  Boot images (such as bios) must be encrypted before guest can be booted.
> -MEMORY_ENCRYPT_OP ioctl provides commands to encrypt the images :LAUNCH_START,
> +MEMORY_ENCRYPT_OP ioctl provides commands to encrypt the images: LAUNCH_START,
>  LAUNCH_UPDATE_DATA, LAUNCH_MEASURE and LAUNCH_FINISH. These four commands
>  together generate a fresh memory encryption key for the VM, encrypt the boot
>  images and provide a measurement than can be used as an attestation of the
>  successful launch.
>  
> +For an SEV-ES guest, the LAUNCH_UPDATE_VMSA command is also used to encrypt the
> +guest register state, or VM save area (VMSA), for all of the guest vCPUs.
> +
>  LAUNCH_START is called first to create a cryptographic launch context within
>  the firmware. To create this context, guest owner must provides guest policy,
>  its public Diffie-Hellman key (PDH) and session parameters. These inputs
> @@ -40,31 +50,42 @@ The guest policy can be provided via the 'policy' property (see below)
>  # ${QEMU} \
>     sev-guest,id=sev0,policy=0x1...\
>  
> +Setting the "SEV-ES required" policy bit (bit 2) will launch the guest as an
> +SEV-ES guest (see below)
> +
> +# ${QEMU} \
> +   sev-guest,id=sev0,policy=0x5...\
> +
>  Guest owners provided DH certificate and session parameters will be used to
>  establish a cryptographic session with the guest owner to negotiate keys used
>  for the attestation.
>  
>  The DH certificate and session blob can be provided via 'dh-cert-file' and
> -'session-file' property (see below
> +'session-file' property (see below)
>  
>  # ${QEMU} \
>       sev-guest,id=sev0,dh-cert-file=<file1>,session-file=<file2>
>  
>  LAUNCH_UPDATE_DATA encrypts the memory region using the cryptographic context
> -created via LAUNCH_START command. If required, this command can be called
> +created via the LAUNCH_START command. If required, this command can be called
>  multiple times to encrypt different memory regions. The command also calculates
>  the measurement of the memory contents as it encrypts.
>  
> -LAUNCH_MEASURE command can be used to retrieve the measurement of encrypted
> -memory. This measurement is a signature of the memory contents that can be
> -sent to the guest owner as an attestation that the memory was encrypted
> +LAUNCH_UPDATE_VMSA encrypts all the vCPU VMSAs for an SEV-ES guest using the
> +cryptographic context created via the LAUNCH_START command. The command also
> +calculates the measurement of the VMSAs as it encrypts them.
> +
> +LAUNCH_MEASURE can be used to retrieve the measurement of encrypted memory and,
> +for an SEV-ES guest, encrypted VMSAs. This measurement is a signature of the
> +memory contents and, for an SEV-ES guest, the VMSA contents, that can be sent
> +to the guest owner as an attestation that the memory and VMSAs were encrypted
>  correctly by the firmware. The guest owner may wait to provide the guest
>  confidential information until it can verify the attestation measurement.
>  Since the guest owner knows the initial contents of the guest at boot, the
>  attestation measurement can be verified by comparing it to what the guest owner
>  expects.
>  
> -LAUNCH_FINISH command finalizes the guest launch and destroy's the cryptographic
> +LAUNCH_FINISH command finalizes the guest launch and destroys the cryptographic
>  context.
>  
>  See SEV KM API Spec [1] 'Launching a guest' usage flow (Appendix A) for the
> @@ -76,6 +97,12 @@ To launch a SEV guest
>      -machine ...,confidential-guest-support=sev0 \
>      -object sev-guest,id=sev0,cbitpos=47,reduced-phys-bits=1
>  
> +To launch a SEV-ES guest
> +
> +# ${QEMU} \
> +    -machine ...,confidential-guest-support=sev0 \
> +    -object sev-guest,id=sev0,cbitpos=47,reduced-phys-bits=1,policy=0x5
> +
>  Debugging
>  -----------
>  Since memory contents of SEV guest is encrypted hence hypervisor access to the
> @@ -102,8 +129,10 @@ Secure Encrypted Virtualization Key Management:
>  
>  KVM Forum slides:
>  http://www.linux-kvm.org/images/7/74/02x08A-Thomas_Lendacky-AMDs_Virtualizatoin_Memory_Encryption_Technology.pdf
> +https://www.linux-kvm.org/images/9/94/Extending-Secure-Encrypted-Virtualization-with-SEV-ES-Thomas-Lendacky-AMD.pdf
>  
>  AMD64 Architecture Programmer's Manual:
>     http://support.amd.com/TechDocs/24593.pdf
>     SME is section 7.10
>     SEV is section 15.34
> +   SEV-ES is section 15.35
> 

