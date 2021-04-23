Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6032369B3C
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 22:22:19 +0200 (CEST)
Received: from localhost ([::1]:52080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la2Je-0006yu-Tp
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 16:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1la2IP-00067v-5P
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:21:01 -0400
Received: from mail-bn7nam10on2076.outbound.protection.outlook.com
 ([40.107.92.76]:2528 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1la2IL-0004Fc-JI
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:21:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MT2uD4dj15cmN44g82NZYOnVtWsVNr6TehzTGFaiALFHOEhJ9Fo9IT80UbC2tQPoNLSo48Bz6UIXOp+KPQoczQ9fII1IrS24GJVqJyAt9Y8seoZYOLe9+US34/JcYodjjbzNa14+0vQFLekeZ0+sHKi2BhmL5iuWw+jVHzG6qV6tFI0+cFK86yoFs+Hffk9fIupPPX1yBkVrEH6iRpbDbq9D95QbsxhRt39LJSPSriYDoQbo3sfv0yISBmDI42aOo92c/lbcG8hNtLjVYDyzwEU8NpODgNAqLgpwORmObY38Qgd7bgjR/Zy8j+Dmk1ETDsaY4Q1nXUdbryabH+mhxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+8XdYlwHm7fTly7hJS1RSS+9hK/4Cjm3RPUIfFYf0c=;
 b=e9RAFYNEGRJm31c78c4IHi1KvQpMHirrP24pNvXmhjhHHRFZo6DmtOnm0QR+q+xELN3KyUvYPkRMGPLb0Fcjs9S1BNmGgr8cPYGe83HClBo3iSXwcV/7MXEz+fMS0N9yayXGoDj7i7/z5vbhsDIZojbKVCyVhFeYx31JgZJVWqnuyhtN0aVt4FlGqqV2wV9oX7Z5Lwg2GghYJevN0OWQLfEgnWo2ywYLmYTs9aonlx/e4b0Qqc5rb3jkhfkiN6IbNzrbjIXkeYqhNVzZXADxKOQhkvjCwjc6p4bpp8PBi56kXdZtPe+koCosmH+fsU9EcKAPPkdC2v/hbRFmsXH0/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+8XdYlwHm7fTly7hJS1RSS+9hK/4Cjm3RPUIfFYf0c=;
 b=SBXQ9/sXMzswDrVvYsOhUcSGUh8yRvzvW22VMc8Hb7syeS/f1S6C6Th92v7Yc3wdUZJnYYWhasFfs1WaLTjvlEYNhTtkHdAJaLVrMnGzgz7RPmRwBrOdWW76mW8FzS2KAibEM7f2h8JdN6ylPePclE/5cxup2cwaM5JbMOXFsPY=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1355.namprd12.prod.outlook.com (2603:10b6:3:6e::7) by
 DM5PR12MB4678.namprd12.prod.outlook.com (2603:10b6:4:a9::39) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.18; Fri, 23 Apr 2021 20:05:49 +0000
Received: from DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::b914:4704:ad6f:aba9]) by DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::b914:4704:ad6f:aba9%12]) with mapi id 15.20.4065.023; Fri, 23 Apr
 2021 20:05:49 +0000
Subject: Re: [PATCH] docs: Add SEV-ES documentation to
 amd-memory-encryption.txt
To: Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org
References: <c06be7ec96e774bd6e17f14a27330c74266c5650.1619032376.git.thomas.lendacky@amd.com>
 <83253264-764c-85e3-8bb0-0dbd58b9c1dc@amd.com>
 <dd9f9a84-b1e0-3740-6870-7c728f75e2ec@redhat.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
Message-ID: <7a4edf04-ff02-8c7a-a323-891ce2eb995d@amd.com>
Date: Fri, 23 Apr 2021 15:05:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <dd9f9a84-b1e0-3740-6870-7c728f75e2ec@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [67.79.209.213]
X-ClientProxiedBy: SN4PR0201CA0058.namprd02.prod.outlook.com
 (2603:10b6:803:20::20) To DM5PR12MB1355.namprd12.prod.outlook.com
 (2603:10b6:3:6e::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from office-linux.texastahm.com (67.79.209.213) by
 SN4PR0201CA0058.namprd02.prod.outlook.com (2603:10b6:803:20::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend
 Transport; Fri, 23 Apr 2021 20:05:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77e9d9ca-cfbb-46cb-a532-08d9069330a6
X-MS-TrafficTypeDiagnostic: DM5PR12MB4678:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB4678969CB3886EBEE64FE693EC459@DM5PR12MB4678.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yb3V7n0DxsdIucd+tKCz9VEv/beELwkNYoKkoOnGShUTwJzMSM7Kwf/CU9ECHz6hhg9ZUZIryGKLYTkmLht9EJI2RThtzVUvjHSKFuXgHfTLUt7Y8dbzggZGyDNfWD3DtxpdTizZUmFEFGpkkqvDPUyqlJUXQck/iyokjqkiRX1pAhsgG8xLaJAMgQ/vQcfUiWOd24BGDShq1xP40WkScc3tqT8RBiJhreTFKCZ/2OYnJg1N0yCBz6czfQg34SZ8TadO0THGM9+ziAYlNYdKmfZF9+02i9l88NLcPvGKYPHTVlnlcpCj4HiNyLjErZMDV0k7lwwHmxwgoHtDZ1sVQ9aZVn/oO7JCWI/9zQ0KDwFmtnAjYjN18SNU74y9+uFcLS1jwGwwkR17EozHCumCSZ6CSF0Ftjwpadsloc7V1lJ1v9uu68eycXn3zIymKLjCGjytkVFLDP8we+tbv9feUIHeXfvPgxEwuKrBUm90kFznFRPSPujmgGpE+6POxVYS7wr9BWAU90oHofvDwqDIIWx+DXBqdX8UkdaaKi/75xIF4kKHhWLWm++bR8oibK9J9QuqR0vK3DL4ggRoCyJY/6++3/7j4rBd+WihQb4Fcvq+vWs98oBweKxYGgzBKMzxbUKprLGgmIV3cZPdTmee+MX3x/w3JtuDzQYyAYeG4fdoBMlfl6cJuUZANospVVI9ecdGwVQwrcpJuJYeJiq+5+4yIRC2yKXKRgFLNCDlqv0nqmILtOgyMeo8AnbrYKLNtZ1z2VQtEULDw3XsibZu9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1355.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(6486002)(8676002)(36756003)(6512007)(66476007)(66946007)(26005)(956004)(478600001)(316002)(83380400001)(966005)(4326008)(186003)(66556008)(16526019)(86362001)(6506007)(2906002)(31686004)(54906003)(2616005)(53546011)(5660300002)(45080400002)(8936002)(31696002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SWFnVE15N1pKOWpaeC9ONDhkeDN3ci9LekNKVXNmV1dqS3U1WU5hK1NHNEZk?=
 =?utf-8?B?UlRITVg0YlFSOWlrREFreE1VQTA2ZCtUbFRxYThYaXkvRzlKb2tQRnR5MUc5?=
 =?utf-8?B?aFpTaFRFLytvdFJNbGNHb0llajdaemVCRHBPczlpQlMrZGFmU25GN3lrOTZH?=
 =?utf-8?B?WWtUWjRJVnEvTTUybnUydlhrTnVlNmR3NkdiNlRqUlhxd2h0TUNaRnorSXhI?=
 =?utf-8?B?cnVmYlJuOGZmNmFRbGs4RjB4Z21QaVJjTDFmS1NTS2JBMHIyZjdpU29pVHc2?=
 =?utf-8?B?SjF6T1FzSWg4STFnR21Sd3ZKcy9uS1ArYTFpUWgvdjk3NnZ6MTZvejRwYm8x?=
 =?utf-8?B?Z0N0VWpoeGx5d1pkcml2cGNUTmI1anVkVWZSazFsRkZrVWdwVEQ5dURHbFhC?=
 =?utf-8?B?d0Q1UVc3cHFEYnI4MEZFRmZMUjFQUlB3NVFJR2o5Q1A0ZmFQclhSVzhlRXlI?=
 =?utf-8?B?bm9vb1FhYytkNTJuaDJucHQvWFdzWi8rdVE0SGRRU2d0eURZV2Rvait5VTQy?=
 =?utf-8?B?TXBIY3NKY0RhWTBxekcwWkhCTFBvQi9jU0k1cXNnNU81dUhpaFhTM1MyTlEr?=
 =?utf-8?B?K2FLRGh3d092Mng3NnJabTFEMDUyTFRtT3pvZmxFOHRBeVBNZUxkK2ttWnox?=
 =?utf-8?B?RFp3VzkzMTVTQkZ4MHkzYWdQbXdTSjFZZnVjOFdVMDRlc3lLRG52d1E5cnhy?=
 =?utf-8?B?OVZXSEJmVEpISERiQUZJUThIOEpNL2JDc1pPQm51MkJob2JaRkgvNndZVzk3?=
 =?utf-8?B?VVlTY0pZRVRkUWxUMTE4WVBWRnptZ2VQWlEyaTBodnNZd0VweFBiaHRZTFJD?=
 =?utf-8?B?dW5oMEpnRFZvZ1JOTk1CajZVTm9BbDBaMWdUSnJ2TDVDeUVlWmtTOWxadGlk?=
 =?utf-8?B?YURybmtkdFRnVlhaL0NsR3RrNW9QQTZuZ3gxWEs5bVlwYTNDcjNYdklXL09S?=
 =?utf-8?B?NEJMZWUvalFubkp3djBOd2hsSVp4R1ZkVXRHNHZKemJLQ1REUE9xTmlvQzNr?=
 =?utf-8?B?YS9VeFZUREFGMmFDMndjNzFzYXR5WHJFWm5Ib0lzSHRqeWZUajlVR05CYjNt?=
 =?utf-8?B?NnpqWWY1YnhlUnFnNGFnTTNiTW9YWmpmNkFCS3ovZWlkdktudkV6Wkg4S1p2?=
 =?utf-8?B?Z0t6alFMZEtqZzNuYURUYVFFWXNnbWRDWU9Nd1pMKzdnOHdRbmZ2bmg3KzVi?=
 =?utf-8?B?UXU5VWtCRk1oU0xSc21ZTjViOTk4TnBmZi9samRLWmdkWE5pUTlvWEFSKzN0?=
 =?utf-8?B?ME50ei9GRU4wNzVZK1g4eHJZTy9jL2pIekRIYlJxSkFyaHlobmNML0NaV2l6?=
 =?utf-8?B?RVdQZjY5bndaM2F5ZUZ0RjBOY1MycVRWMU1pdjNhckhvUXFvNjRoMy9hMDFP?=
 =?utf-8?B?R2t1NFVlR3htZkVYUWVNMDNVckpyZ0IxNk1XWExXUmtEU1lJaHBSTGJEaWdi?=
 =?utf-8?B?R2xmSVI2Nmw5L0hFK3NzQSttQzdxZUFjelczV2g5UERtRkZJNmtZeEZUVHlv?=
 =?utf-8?B?ZGZRK2xiNGw3b0Uvell3LzJrdmE5K045bkp0NmVPSk9KMUFsUU1MMDNlU2o1?=
 =?utf-8?B?UXNOcmFhWFUzaGRtNCtxSzgzVmhKUjdMWEk0eFV2dUhrOHZwcVpLSWpoOUxL?=
 =?utf-8?B?OHI4UEg4dFo0eTJwVmVZVUo2SHZ2cTIxK0lQOUJFemdHMEJtdzFBWCtRYXph?=
 =?utf-8?B?am1UR0xpblFzK2tRNTcvRUJ4L290alhHY3hrZWFDS3JwdmFTVzdtY2QyRzQz?=
 =?utf-8?Q?3UowRMhhvpb+8bJ0jsv6z4BV4I8lyVIq0q3F1uX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77e9d9ca-cfbb-46cb-a532-08d9069330a6
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1355.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 20:05:49.7791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B14FuzIVSR7SO4vdIJNjrS/GYYIapSBt/2UjEFkdjLOXD4sksCSsoSmxqk+ZBfpKibbOSK8ss7l7RkUpNJuGYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB4678
Received-SPF: softfail client-ip=40.107.92.76;
 envelope-from=Thomas.Lendacky@amd.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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
 Brijesh Singh <brijesh.singh@amd.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/22/21 9:09 AM, Laszlo Ersek wrote:
> On 04/21/21 21:31, Tom Lendacky wrote:
>> On 4/21/21 2:12 PM, Tom Lendacky wrote:
>>> From: Tom Lendacky <thomas.lendacky@amd.com>
>>>
>>> Update the amd-memory-encryption.txt file with information about SEV-ES,
>>> including how to launch an SEV-ES guest and some of the differences
>>> between SEV and SEV-ES guests in regards to launching and measuring the
>>> guest.
>>>
>>
>> Hmm, it occurs to me that I should also mention some of the launch
>> restrictions between SEV and SEV-ES - such as not supporting SMM or reboot
>> in SEV-ES because of the requirements to modify the guest register state.
>>
>> I'll wait for feedback on this version and send out a v2 with the added
>> information.
> 
> I have two comments on v1 (and thanks much for posting it):
> 
> (1) Please split the typo fixes off to an initial patch. I tried to read
> your changes carefully and the typo fixes kept throwing me off.

Ok, will do. Since I'm splitting it I'll go through it in a bit more
detail and there will be additional changes without any new information.

> 
> (2) Since you are already doing great work on this :) , can you tack on
> the patch for "docs/interop/firmware.json"?
> 
> It would mean just duplicating the @amd-sev enum constant as @amd-sev-es
> (documentation paragraph and the actual enum definition).

I'll give that a shot. Let me know if I got it right when you review it :)

Look for a follow-on three patch series.

Thanks,
Tom

> 
> The new (SEV-ES) content in v1 looks plausible to me, but minimally
> Brijesh should review it more closely.
> 
> Thanks!
> Laszlo
> 
>>
>> Thanks,
>> Tom
>>
>>> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
>>> ---
>>>  docs/amd-memory-encryption.txt | 45 ++++++++++++++++++++++++++++------
>>>  1 file changed, 37 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/docs/amd-memory-encryption.txt b/docs/amd-memory-encryption.txt
>>> index 145896aec7..795b990fab 100644
>>> --- a/docs/amd-memory-encryption.txt
>>> +++ b/docs/amd-memory-encryption.txt
>>> @@ -12,18 +12,28 @@ The key management of this feature is handled by separate processor known as
>>>  AMD secure processor (AMD-SP) which is present in AMD SOCs. Firmware running
>>>  inside the AMD-SP provide commands to support common VM lifecycle. This
>>>  includes commands for launching, snapshotting, migrating and debugging the
>>> -encrypted guest. Those SEV command can be issued via KVM_MEMORY_ENCRYPT_OP
>>> +encrypted guest. Those SEV commands can be issued via KVM_MEMORY_ENCRYPT_OP
>>>  ioctls.
>>>  
>>> +Secure Encrypted Virtualization - Encrypted State (SEV-ES) builds on the SEV
>>> +support to additionally protect the guest register state. In order to allow a
>>> +hypervisor to perform functions on behalf of a guest, there is architectural
>>> +support for notifying a guest's operating system when certain types of VMEXITs
>>> +are about to occur. This allows the guest to selectively share information with
>>> +the hypervisor to satisfy the requested function.
>>> +
>>>  Launching
>>>  ---------
>>>  Boot images (such as bios) must be encrypted before guest can be booted.
>>> -MEMORY_ENCRYPT_OP ioctl provides commands to encrypt the images :LAUNCH_START,
>>> +MEMORY_ENCRYPT_OP ioctl provides commands to encrypt the images: LAUNCH_START,
>>>  LAUNCH_UPDATE_DATA, LAUNCH_MEASURE and LAUNCH_FINISH. These four commands
>>>  together generate a fresh memory encryption key for the VM, encrypt the boot
>>>  images and provide a measurement than can be used as an attestation of the
>>>  successful launch.
>>>  
>>> +For an SEV-ES guest, the LAUNCH_UPDATE_VMSA command is also used to encrypt the
>>> +guest register state, or VM save area (VMSA), for all of the guest vCPUs.
>>> +
>>>  LAUNCH_START is called first to create a cryptographic launch context within
>>>  the firmware. To create this context, guest owner must provides guest policy,
>>>  its public Diffie-Hellman key (PDH) and session parameters. These inputs
>>> @@ -40,31 +50,42 @@ The guest policy can be provided via the 'policy' property (see below)
>>>  # ${QEMU} \
>>>     sev-guest,id=sev0,policy=0x1...\
>>>  
>>> +Setting the "SEV-ES required" policy bit (bit 2) will launch the guest as an
>>> +SEV-ES guest (see below)
>>> +
>>> +# ${QEMU} \
>>> +   sev-guest,id=sev0,policy=0x5...\
>>> +
>>>  Guest owners provided DH certificate and session parameters will be used to
>>>  establish a cryptographic session with the guest owner to negotiate keys used
>>>  for the attestation.
>>>  
>>>  The DH certificate and session blob can be provided via 'dh-cert-file' and
>>> -'session-file' property (see below
>>> +'session-file' property (see below)
>>>  
>>>  # ${QEMU} \
>>>       sev-guest,id=sev0,dh-cert-file=<file1>,session-file=<file2>
>>>  
>>>  LAUNCH_UPDATE_DATA encrypts the memory region using the cryptographic context
>>> -created via LAUNCH_START command. If required, this command can be called
>>> +created via the LAUNCH_START command. If required, this command can be called
>>>  multiple times to encrypt different memory regions. The command also calculates
>>>  the measurement of the memory contents as it encrypts.
>>>  
>>> -LAUNCH_MEASURE command can be used to retrieve the measurement of encrypted
>>> -memory. This measurement is a signature of the memory contents that can be
>>> -sent to the guest owner as an attestation that the memory was encrypted
>>> +LAUNCH_UPDATE_VMSA encrypts all the vCPU VMSAs for an SEV-ES guest using the
>>> +cryptographic context created via the LAUNCH_START command. The command also
>>> +calculates the measurement of the VMSAs as it encrypts them.
>>> +
>>> +LAUNCH_MEASURE can be used to retrieve the measurement of encrypted memory and,
>>> +for an SEV-ES guest, encrypted VMSAs. This measurement is a signature of the
>>> +memory contents and, for an SEV-ES guest, the VMSA contents, that can be sent
>>> +to the guest owner as an attestation that the memory and VMSAs were encrypted
>>>  correctly by the firmware. The guest owner may wait to provide the guest
>>>  confidential information until it can verify the attestation measurement.
>>>  Since the guest owner knows the initial contents of the guest at boot, the
>>>  attestation measurement can be verified by comparing it to what the guest owner
>>>  expects.
>>>  
>>> -LAUNCH_FINISH command finalizes the guest launch and destroy's the cryptographic
>>> +LAUNCH_FINISH command finalizes the guest launch and destroys the cryptographic
>>>  context.
>>>  
>>>  See SEV KM API Spec [1] 'Launching a guest' usage flow (Appendix A) for the
>>> @@ -76,6 +97,12 @@ To launch a SEV guest
>>>      -machine ...,confidential-guest-support=sev0 \
>>>      -object sev-guest,id=sev0,cbitpos=47,reduced-phys-bits=1
>>>  
>>> +To launch a SEV-ES guest
>>> +
>>> +# ${QEMU} \
>>> +    -machine ...,confidential-guest-support=sev0 \
>>> +    -object sev-guest,id=sev0,cbitpos=47,reduced-phys-bits=1,policy=0x5
>>> +
>>>  Debugging
>>>  -----------
>>>  Since memory contents of SEV guest is encrypted hence hypervisor access to the
>>> @@ -102,8 +129,10 @@ Secure Encrypted Virtualization Key Management:
>>>  
>>>  KVM Forum slides:
>>>  https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwww.linux-kvm.org%2Fimages%2F7%2F74%2F02x08A-Thomas_Lendacky-AMDs_Virtualizatoin_Memory_Encryption_Technology.pdf&amp;data=04%7C01%7Cthomas.lendacky%40amd.com%7C6634432836a44cf1d8d008d9059841dc%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637546974656868321%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=WirOAt5yzLnftEm4Auroh5aKtlCQTdARYbucGeYIcpw%3D&amp;reserved=0
>>> +https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.linux-kvm.org%2Fimages%2F9%2F94%2FExtending-Secure-Encrypted-Virtualization-with-SEV-ES-Thomas-Lendacky-AMD.pdf&amp;data=04%7C01%7Cthomas.lendacky%40amd.com%7C6634432836a44cf1d8d008d9059841dc%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637546974656878322%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=5UeYN24AWUTrwetudnTaXCvP39IqY2OvUBts0ntnHNs%3D&amp;reserved=0
>>>  
>>>  AMD64 Architecture Programmer's Manual:
>>>     https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fsupport.amd.com%2FTechDocs%2F24593.pdf&amp;data=04%7C01%7Cthomas.lendacky%40amd.com%7C6634432836a44cf1d8d008d9059841dc%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637546974656878322%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=MY2RjiXVN5Dr8yz7RkusdMgTKumiK71C9CBVEOoHQVk%3D&amp;reserved=0
>>>     SME is section 7.10
>>>     SEV is section 15.34
>>> +   SEV-ES is section 15.35
>>>
>>
> 

