Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BBB39939C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 21:35:41 +0200 (CEST)
Received: from localhost ([::1]:44800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loWeS-00083M-56
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 15:35:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1loWdU-00072S-NI
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 15:34:40 -0400
Received: from mail-dm6nam08on2055.outbound.protection.outlook.com
 ([40.107.102.55]:5889 helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1loWdR-0007UV-Sx
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 15:34:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J8v6MyKDJGm0ZhrEGrQ65YEE0D3y+QOLd9OETCOPOiImptPkeC4ARhxqtZKeqeuwic1xrszT/vTI0/Jwobz7pTR+pGU+tUkUUqoz5LaEoWHZXzIrR+DjjzqvO3kT8vqFlClIrvv3bI1VzEJA3Pg/BymltWXD+yL9q0/UdGN4IPlPSVAGlU+tQGgYoFVwmPAUaAs97b1MW0fPiIn3OdxtHD3k5yyHTwNwECt0IADN7YH20oAwxg5ZtdSOyJY+uv051We3N/Cxcl5K5Ue97kyKhDcmLLj0HQvYw4ihXZD1UTefiTd9lx6klK7UsSqY+QxL7jE7panG85oucFodyAmjYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ujf+g4HA4Cmyr68gIpXasliG/B3D318uZeGI/lZKhe8=;
 b=kEkehr3SP9vbjSb1Ksvqdb4FxGBW1wmS+pRNtvxFk09lCW16youDWvphWOnhXswolXemKJYJ2zsqqs6ELe7uuAh8ch3FoYLJ9RtSEZYQ2YM/6O0cp/GbqsK8YCxYA/gxmsTo29DGjhyFOA94wtzjrhqYy7LHM7JELQq8RBj8i0/hozoWaPrKpolDPDlHVIyVlC580Hc6YeD90VF6JcIBwbpg8dPrz20L9TvBLC1PeKK5m8L8l6b3aQs5SJBwVag+/M/2Tu8TE3JAZ3J9fiDTKYOwVYxzDPROL2wFk5zODtcPxfzwJFVe58BibAAJRALKtqimJRE3cKv+u1BhMaBnzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ujf+g4HA4Cmyr68gIpXasliG/B3D318uZeGI/lZKhe8=;
 b=0ADa30wBvNHGGzIszIE4uC/nvZmc3Adj9kQgw7lx4CQDv7UCQH+MhP3maZJon6s4MG3fEY7OwJxT6nICX6T8+CFxOGY9wVP5//qbzeIsIYTfYDGUkteCD90UUnz9mQL0Xrjo/I0XqKf6LLjCjX7J9/Jm1kOmA9Jn7aLmUQb01s4=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1355.namprd12.prod.outlook.com (2603:10b6:3:6e::7) by
 DM6PR12MB4960.namprd12.prod.outlook.com (2603:10b6:5:1bc::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.21; Wed, 2 Jun 2021 19:19:32 +0000
Received: from DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::b914:4704:ad6f:aba9]) by DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::b914:4704:ad6f:aba9%12]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 19:19:32 +0000
Subject: Re: [PATCH v2 1/3] doc: Fix some mistakes in the SEV documentation
From: Tom Lendacky <thomas.lendacky@amd.com>
To: qemu-devel@nongnu.org
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pavel Hrdina <phrdina@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>
References: <a7c5ee6c056d840f46028f4a817c16a9862bdd9e.1619208498.git.thomas.lendacky@amd.com>
Message-ID: <95a079ae-a6b3-b7f6-5d22-c8114b3da991@amd.com>
Date: Wed, 2 Jun 2021 14:19:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <a7c5ee6c056d840f46028f4a817c16a9862bdd9e.1619208498.git.thomas.lendacky@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [67.79.209.213]
X-ClientProxiedBy: SN4PR0601CA0003.namprd06.prod.outlook.com
 (2603:10b6:803:2f::13) To DM5PR12MB1355.namprd12.prod.outlook.com
 (2603:10b6:3:6e::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from office-linux.texastahm.com (67.79.209.213) by
 SN4PR0601CA0003.namprd06.prod.outlook.com (2603:10b6:803:2f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.15 via Frontend
 Transport; Wed, 2 Jun 2021 19:19:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09ede0e9-4f8c-4c50-4ee1-08d925fb59b6
X-MS-TrafficTypeDiagnostic: DM6PR12MB4960:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB49607F03C37F0EABA1F96BE2EC3D9@DM6PR12MB4960.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O6qQG8VvebQtzw6HTHCy381KJKTIIAZg6Psdv/19wgQV6CBdVzIQ4Ppviz6XuXZQdh20sM6lD33KB80w+iprOYoIBeDMW9az8XxVyRsBVI7aEmW4AZqheIYjH4x/8bo95svo8TsF/TKYLE1BlXMeZnVQwpv+CJRjQdKXqgHQ0wEnUL5AS1M0yWjwxodl+m/xUOWepx9wdskBBo87AYttAPg/U3N/jNVl2g0I6t5DybJ73m0W9NHxAgEqGxmeudaIj2SKPcWXxoTPe0ZFHqPyAtXk1obVwzSD+/VJxhnf9Z2wOuK89RMRRoV+zkdzRu8l05DRvxkg18kkUH3T7hUznZDmwOoDml+q2n8oBvmbNMd3q1myv5qiinh5Kg1ZB3HjvWrS573kjq4SVEhv4EFa39ydCir+4h0GCIN5DiquK68xodZEMyyawOPK0sOjDPjRMOLPiVzsMbeBbZlgWTYhUexG2E/Vs7CFgUh0YMCZmXaKHuovcnzekER0m8gG5ACOVsjVMM6jZmd6zQjljjdakMMUQ09l37LiVhkwdqm/1dzn1/P4TcWVZ5N5oUfADWommo0WE6FVZj9e7x7Ssl9b8I4ef5EDSMWHC92Xq8KrixU+SP0iFwO8W+iFszTox5wPrRTyg/mZtJVIpFOqXBsfZ+Dq95bb04wuOaqHH1z7GMiWU09I2QVswH44TsAsDi6Y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1355.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(36756003)(4326008)(5660300002)(6486002)(31696002)(8936002)(6916009)(6512007)(38100700002)(8676002)(86362001)(53546011)(478600001)(956004)(66946007)(66476007)(66556008)(16526019)(186003)(6506007)(2616005)(26005)(2906002)(31686004)(54906003)(316002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aHA1c1Y4bHlMK2s5M3VqeEJFcDRXdU53YVZQUXNsbWZUU0hLaGpxS0xVQlNU?=
 =?utf-8?B?SHpLa291cFdoWU44Mm1Jc3RoeXVkNkNxUTRCTXZCcVRsSHh0U1FRd3YycFpI?=
 =?utf-8?B?U1Q0S0txTWlkSllKc25rc2hYMHQ4Rkh1ZXVDLzBUdXkwdkNUNFluUUxCQkFn?=
 =?utf-8?B?cnlPVHVWSGJEMGFlMDRNVEwvZDAyK3JXMklBbWk5QzVIVmNMZytMd2FEMUY5?=
 =?utf-8?B?eGxlSXNIU29lbGRhMStZVWdoMmRTZ2JuSmNZekFxS2pNdkZoYk9XK2d3YUlj?=
 =?utf-8?B?ZlI0ZHlWV2JmVnpCZDR4U1lGRlJLTjlwQitRUjdtaUJBVEtRK1NMUE1Cd3J1?=
 =?utf-8?B?aEk5a3RadzBqbXRhVi9USTVGTzhTdUFvem5HSHNlMkd1NWpzQjAzZWxRRGVY?=
 =?utf-8?B?WU5lc08yNUxrNFNnb0ZpWnpGN3RNempNL0lITW1POUtPSHpUdWEzK2xFMUdZ?=
 =?utf-8?B?Z3B3dmd1cUhNUzdkdlE5R0o3ZzFld1I0SXFsbGtpa3ZXNHRqMERoMGZnbFo1?=
 =?utf-8?B?Nm5uS3NkaVN5akwzQklpUHAzS1RGOHllcnJOcEM4QzluQlpRMXI5U1VrRnFr?=
 =?utf-8?B?Q1F5dWJYd3RUTW1teGx2M3IyNW50bGZjaTVVSCswRUQ3RXQ2dUtadnFrcWZk?=
 =?utf-8?B?Wk9JanlCVW4rbThDWnZFdG5jcGFnakhHY2Jlakx4bWFHU2FoYVpPRTJqOFV6?=
 =?utf-8?B?Mm51WTNBYmJIZlhhRTlIdU05SU5RUEVLbERZWWc5K2dweEFaUzFpdkdJUkJo?=
 =?utf-8?B?U3BobG1IUHcxbmRRa3NwbFJsV0J1SVRMdldsT2FtQUVwdTA0VzlHRVNVWmJl?=
 =?utf-8?B?NXN0aU1jSVJNUW52VTJTMWlycUdscS85aExWekF3cHNoL2M1U0krVU1uRFdn?=
 =?utf-8?B?UFVnQW5xODdJdkwyTlpJcC80Y2FvZkk5NlYzeFRoNjNkWlR2S0dZTnZlNDQ5?=
 =?utf-8?B?SGVqOHlJZ2ttQ0NQbkFKOXBhdnFqaU9KbVZ5RjE5YzdzY0dLbEhUMHh4a0Ri?=
 =?utf-8?B?SktqM2gzMGdkd1ZteGp2T2FWVk9LeTlHRC9mRU52dkdCMVpVN0k2RS9oVTFU?=
 =?utf-8?B?elFYeUIvZ0wyK2NzS2dySTdSeUowWk56N3JRMVI1NVNxME9QZGdiLzlLalZ1?=
 =?utf-8?B?Q0FVdGVvV3B1eGd3Nlc5SFZjQ3A1SENSRjZBQ1dIWU1kdUk3ZjJHY2FudlJ0?=
 =?utf-8?B?cnZDYWdiVXpycGJpbjYwd3ZSWEhpL0QwZ2kzaGpDYzVkQWZVN2tJUkp6YzZT?=
 =?utf-8?B?ZTJvQ25XMUd4Q053UWIwRnF3WERCSkxoTzFTNmdXQWUrMUYyVC9CWFNGb2I1?=
 =?utf-8?B?ZmpwNUQ1d0QzVGZXODBkQzA5Z3hsMFAxNllCY3FLckdkdjhIU3ZzakNhSmpF?=
 =?utf-8?B?NVFRNm5obkh2eHpwK1JuNDE3NjBaMnJvWDdPR2M4YzVWWFBuMy9wNGdLZFkr?=
 =?utf-8?B?c0t1K0pqajNrVDVkcFljMDEyN1FQWjVmUGFCMWd5YW5iVXVrVjE0ZkF0VTFD?=
 =?utf-8?B?bnlMTEsrYmxCYTJrRVFDQVB4Y2tHSzRrTzl2NEhlV3lBTlpPemp5SnV3b2lH?=
 =?utf-8?B?Mkw4eUtML1F0UVRKTjdncFpuOUd0TndadVN5RnlLeERLR1oraHliOTRKSk12?=
 =?utf-8?B?ZXpYNzlKaVJPaXFzcmw1V2IyUXUxSzd2MllNMjV4SWlPdTJKT25Ba2hIRGJo?=
 =?utf-8?B?emFtaVcrcmZJWGRscTk0UnZlQ25wQ1ZKZVV6NHJOVTMraUJ0TDlwMzdNeDZw?=
 =?utf-8?Q?6WGgbXgoytmV47GmPjL1YgccZRBLD8iZ9rhw3m9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09ede0e9-4f8c-4c50-4ee1-08d925fb59b6
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1355.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 19:19:32.4673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GACNKiF63t7RNmykmDSyyYd0B74b2k7T+9BH300wSK6gKhDAkJBM4UY9o5KwBqkisCIkmy9T1Z1ydX9ZW8xBlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4960
Received-SPF: softfail client-ip=40.107.102.55;
 envelope-from=Thomas.Lendacky@amd.com;
 helo=NAM04-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_NONE=-0.0001,
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

Just a quick ping on this series...

Thanks,
Tom

On 4/23/21 3:08 PM, Tom Lendacky wrote:
> From: Tom Lendacky <thomas.lendacky@amd.com>
> 
> Fix some spelling and grammar mistakes in the amd-memory-encryption.txt
> file. No new information added.
> 
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
> ---
>  docs/amd-memory-encryption.txt | 59 +++++++++++++++++-----------------
>  1 file changed, 29 insertions(+), 30 deletions(-)
> 
> diff --git a/docs/amd-memory-encryption.txt b/docs/amd-memory-encryption.txt
> index 145896aec7..ed85159ea7 100644
> --- a/docs/amd-memory-encryption.txt
> +++ b/docs/amd-memory-encryption.txt
> @@ -1,38 +1,38 @@
>  Secure Encrypted Virtualization (SEV) is a feature found on AMD processors.
>  
>  SEV is an extension to the AMD-V architecture which supports running encrypted
> -virtual machine (VMs) under the control of KVM. Encrypted VMs have their pages
> +virtual machines (VMs) under the control of KVM. Encrypted VMs have their pages
>  (code and data) secured such that only the guest itself has access to the
>  unencrypted version. Each encrypted VM is associated with a unique encryption
> -key; if its data is accessed to a different entity using a different key the
> +key; if its data is accessed by a different entity using a different key the
>  encrypted guests data will be incorrectly decrypted, leading to unintelligible
>  data.
>  
> -The key management of this feature is handled by separate processor known as
> -AMD secure processor (AMD-SP) which is present in AMD SOCs. Firmware running
> -inside the AMD-SP provide commands to support common VM lifecycle. This
> +Key management for this feature is handled by a separate processor known as the
> +AMD secure processor (AMD-SP), which is present in AMD SOCs. Firmware running
> +inside the AMD-SP provides commands to support a common VM lifecycle. This
>  includes commands for launching, snapshotting, migrating and debugging the
> -encrypted guest. Those SEV command can be issued via KVM_MEMORY_ENCRYPT_OP
> +encrypted guest. These SEV commands can be issued via KVM_MEMORY_ENCRYPT_OP
>  ioctls.
>  
>  Launching
>  ---------
> -Boot images (such as bios) must be encrypted before guest can be booted.
> -MEMORY_ENCRYPT_OP ioctl provides commands to encrypt the images :LAUNCH_START,
> +Boot images (such as bios) must be encrypted before a guest can be booted. The
> +MEMORY_ENCRYPT_OP ioctl provides commands to encrypt the images: LAUNCH_START,
>  LAUNCH_UPDATE_DATA, LAUNCH_MEASURE and LAUNCH_FINISH. These four commands
>  together generate a fresh memory encryption key for the VM, encrypt the boot
> -images and provide a measurement than can be used as an attestation of the
> +images and provide a measurement than can be used as an attestation of a
>  successful launch.
>  
>  LAUNCH_START is called first to create a cryptographic launch context within
> -the firmware. To create this context, guest owner must provides guest policy,
> +the firmware. To create this context, guest owner must provide a guest policy,
>  its public Diffie-Hellman key (PDH) and session parameters. These inputs
> -should be treated as binary blob and must be passed as-is to the SEV firmware.
> +should be treated as a binary blob and must be passed as-is to the SEV firmware.
>  
> -The guest policy is passed as plaintext and hypervisor may able to read it
> +The guest policy is passed as plaintext. A hypervisor may choose to read it,
>  but should not modify it (any modification of the policy bits will result
>  in bad measurement). The guest policy is a 4-byte data structure containing
> -several flags that restricts what can be done on running SEV guest.
> +several flags that restricts what can be done on a running SEV guest.
>  See KM Spec section 3 and 6.2 for more details.
>  
>  The guest policy can be provided via the 'policy' property (see below)
> @@ -40,31 +40,30 @@ The guest policy can be provided via the 'policy' property (see below)
>  # ${QEMU} \
>     sev-guest,id=sev0,policy=0x1...\
>  
> -Guest owners provided DH certificate and session parameters will be used to
> +The guest owner provided DH certificate and session parameters will be used to
>  establish a cryptographic session with the guest owner to negotiate keys used
>  for the attestation.
>  
> -The DH certificate and session blob can be provided via 'dh-cert-file' and
> -'session-file' property (see below
> +The DH certificate and session blob can be provided via the 'dh-cert-file' and
> +'session-file' properties (see below)
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
> -correctly by the firmware. The guest owner may wait to provide the guest
> -confidential information until it can verify the attestation measurement.
> -Since the guest owner knows the initial contents of the guest at boot, the
> -attestation measurement can be verified by comparing it to what the guest owner
> -expects.
> +LAUNCH_MEASURE can be used to retrieve the measurement of encrypted memory.
> +This measurement is a signature of the memory contents that can be sent to the
> +guest owner as an attestation that the memory was encrypted correctly by the
> +firmware. The guest owner may wait to provide the guest confidential information
> +until it can verify the attestation measurement. Since the guest owner knows the
> +initial contents of the guest at boot, the attestation measurement can be
> +verified by comparing it to what the guest owner expects.
>  
> -LAUNCH_FINISH command finalizes the guest launch and destroy's the cryptographic
> +LAUNCH_FINISH finalizes the guest launch and destroys the cryptographic
>  context.
>  
>  See SEV KM API Spec [1] 'Launching a guest' usage flow (Appendix A) for the
> @@ -78,10 +77,10 @@ To launch a SEV guest
>  
>  Debugging
>  -----------
> -Since memory contents of SEV guest is encrypted hence hypervisor access to the
> -guest memory will get a cipher text. If guest policy allows debugging, then
> -hypervisor can use DEBUG_DECRYPT and DEBUG_ENCRYPT commands access the guest
> -memory region for debug purposes.  This is not supported in QEMU yet.
> +Since the memory contents of a SEV guest are encrypted, hypervisor access to
> +the guest memory will return cipher text. If the guest policy allows debugging,
> +then a hypervisor can use the DEBUG_DECRYPT and DEBUG_ENCRYPT commands to access
> +the guest memory region for debug purposes.  This is not supported in QEMU yet.
>  
>  Snapshot/Restore
>  -----------------
> 

