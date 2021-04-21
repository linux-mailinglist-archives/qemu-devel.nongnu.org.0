Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D1B366F5A
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 17:43:27 +0200 (CEST)
Received: from localhost ([::1]:33524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZF0g-0007z1-4q
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 11:43:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1lZEyJ-0007Ex-Hk
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 11:40:59 -0400
Received: from mail-eopbgr700078.outbound.protection.outlook.com
 ([40.107.70.78]:9441 helo=NAM04-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1lZEyG-0005KK-G4
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 11:40:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eFekcRIiF1tNXcimg3O9pFWZiJrwh8RyEOiax1MC14Jwn2fvpBcOYSc2zWbCrk80enT+CypHeSwvYyxfRci47RRIF2S0WEwXoighKvjPRYS1wtisECarwDd4ZO1evNNmlTmMsY/Zbr+GyfL5mBR9gp/NVoHWDKcwY6pBRHAe7TkLKKrknFLdM8wyISz76kwvgCWf10rx03/6NZ6YNwBzCVVJ/N1bzJIpYdzYfj6vmAMUtwQiO4Gy5kE5z4yZap91SxMnpmF/w93jV6+xNOf+/Jzs3xx7GVyppRpkM5qkSfpvwBcjvMmhQpcDjmci5zoAlamehZV2f7wPEMbhdr+clA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHp+yIqn0eEB0q0FVCCNbB4Wxf3L36Eb+nK2Hhsrbrg=;
 b=QKmDxHsnJ88V/bbUZ080Ar+UuPVYkJhbabjzpgti8QBJukSM94QxZRDkYiH7QcFbddv+ROR0+XaR8B0J0SZNFraj/GpVOnfO4On/DViytS6V2xctAd4ZL1Ggw9H0WMGUy6Sat4sxIxl7swLggr9Z1YzF0nzG1FpCk0DlK0IhuSocQn4R7CoENNErwEalc3kyzNq4S+DmDYZE+vkdNdGs9Kv5IHcUhCTQSWvf/jwlkB+Flf+HPp37AyUp/7tTZU8cGNllgSz/ddwSVGt9/bSnbeRkyKEOiV8lFvjeBAhhB//PC2P5Z0k1YCfgg/uA5OUfmfQrYjnQWqJ9bmnXMr5YwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHp+yIqn0eEB0q0FVCCNbB4Wxf3L36Eb+nK2Hhsrbrg=;
 b=weujW1JfOSZdBWVV0cIu+DTD1TwEEub3vS3bfKVbHSAIe8X9TvR5w66uStfgwBeaAGNDoRksQrTVu8lse72mITHr2d7doP4GzqbBS9zQLEV5itBI0N+7A/lzOCxTl3P1fdB2tHDcp5a3Sb7eSPmiUo1LI93V1ZF0Wph7afQe8kw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1355.namprd12.prod.outlook.com (2603:10b6:3:6e::7) by
 DM5PR12MB1867.namprd12.prod.outlook.com (2603:10b6:3:10d::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.20; Wed, 21 Apr 2021 15:25:51 +0000
Received: from DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::b914:4704:ad6f:aba9]) by DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::b914:4704:ad6f:aba9%12]) with mapi id 15.20.4042.024; Wed, 21 Apr
 2021 15:25:51 +0000
Subject: Re: firmware selection for SEV-ES
To: Laszlo Ersek <lersek@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>
References: <6af8c5c7-6166-7f83-9ff0-4c24460577e2@redhat.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
Message-ID: <a851a4fd-aa7e-21fb-6814-cc2960f50258@amd.com>
Date: Wed, 21 Apr 2021 10:25:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <6af8c5c7-6166-7f83-9ff0-4c24460577e2@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [67.79.209.213]
X-ClientProxiedBy: SN4PR0501CA0035.namprd05.prod.outlook.com
 (2603:10b6:803:40::48) To DM5PR12MB1355.namprd12.prod.outlook.com
 (2603:10b6:3:6e::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from office-linux.texastahm.com (67.79.209.213) by
 SN4PR0501CA0035.namprd05.prod.outlook.com (2603:10b6:803:40::48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.16 via Frontend
 Transport; Wed, 21 Apr 2021 15:25:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a54565d-78ab-4356-11e9-08d904d9bef6
X-MS-TrafficTypeDiagnostic: DM5PR12MB1867:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB186738A0388DE80B5826D0B8EC479@DM5PR12MB1867.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hf/whNErJNs1yTLRN3yhJxF7pbx6G8atRpicWqLszaZ/c07jXT9aHv0qOtJmBleIgOtiNI/rxphQ+0XkBs8azF7eZaWYkgSYgz5c86Bi/uAXGbRoLgn2MHAuGxlV/l+n+JTC8ywuGLq0hgOxq5ad79OonBE4pBnVe9NAKeu4+SQpY3AZByF6l3jCtkFMYqIuwfhJlekASOxOVi/zOEK1MpGCAkOFZuVIeEQ+DAdODgK4J+8furytmqzolUz29iyJU8zgHdsvVBJfrKOnUyEwuj9SRtL0tRjBLMc4FMFrngKFOTYeEbDZv2SJWbfkAce63yBlSIOBp6LkFwGQgZJw+kgZmDqxTkTrp/Yz8/bSB8RuSzJA/7qgAqDj5lRbVSnxHumdLGO3Fz6j75M7GTP7xBd+Qaomf9pi6JZOQ8Jo+AWG2wMjNbcD2xGICK/xlk0k5SKbUVhKyX+n0umC9l9vZlbFUk2sAQdihWX0TVnOPZGeb/XgBvcEIo/QUxlxXqSn4SGQZKyWXF8QghB/8yYwG1PUx3tGukOdzzlp7vrNrgq262sCqkYMv9SDAlsQwjfuvReWD1nJLDlaLHgzCp4d5r3vlKvFhn4jlq4kdjyvZRz+Xm5fjSHXvpnuc0FgU5RmTQKOmyjMC8r1w2rc7qakStjWLknI6daH1vNGftoNL77QbaECyLhYSpEPRvoOYKtM/jL3viBTXSn9ZLgZtb4vX3tWDd/EX8USNYFaNXpNFoOoCNaITnFCTm3MydLErX+IsMCT8qwA44x+lSE1Gc315A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1355.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(110136005)(4326008)(6486002)(31696002)(26005)(186003)(498600001)(5660300002)(36756003)(956004)(2616005)(8676002)(53546011)(2906002)(6506007)(16526019)(45080400002)(86362001)(83380400001)(38100700002)(31686004)(66556008)(66946007)(66476007)(6512007)(8936002)(6636002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NFBqWE9RaFJOL0xXRWhQdlFqbk5BV0h2VnlWRTdaSG9ML25DQno3MEU5cVQ0?=
 =?utf-8?B?eU4weTdIVjAxY2ZwdUsvb2FJdTNpaGFzUHdYQnZpRjkzQ1EvMktMemxkWEo4?=
 =?utf-8?B?c3J4N1JEeWJTNnhxQS9qWDhnZDJ0cVh6cE54cGlkOVpqc0gzUzNtUXhDekRU?=
 =?utf-8?B?aG0wRnR1aFptU1E3K3BCZ2NQd0J3YnZudTZQQTl1cmZoVDY4THV2YzRsTlRi?=
 =?utf-8?B?QlUvc3NxOEliNjJ1V1ptV3VDV3pxQk9mckd3a2FoZEwvcXY2MTF6ZllhQU5v?=
 =?utf-8?B?RnEveldyWnlRTC9PSFIyV3lPSGhzcEcxVmxwc2xQN2l0NDhiSG5kbE1JbkdP?=
 =?utf-8?B?cjFXRElXTWxXYzg5cEllK1c2Y0RiUTV0L0lMUzRZREMvTVVEWDhockVWeXBP?=
 =?utf-8?B?em01TWxxYUJmVlo3T3Y4bEtLaWdWNzFFMGlDQ2QxTVhabElaU0RUcisvczFB?=
 =?utf-8?B?bmlNYnREdmFCbGxCdkRzWk5zckJQOTJadUIrTGo1WlI5bDlSZUZHTzMzemRZ?=
 =?utf-8?B?Q2hWRHhvYmVHS3J4SWU5N0QvRllZZ0M4Ti9jQlRVV2RQaWZER0poOVh6dFpl?=
 =?utf-8?B?Q1orL2w5WExpWGlZWWpOdWNFRW5ZK2wzazJuY3VNTjhZQnI0NnlZSGdiNmo1?=
 =?utf-8?B?bm9SemtQL2lteGRKc1EvdTRHMlYyUk9oQWg2QkhlL3V1S1QySnFxdVdNZmhS?=
 =?utf-8?B?Q2tXTTB4K0NZSzJUeG1ROWd3RG1JeTRBc0RNQ0VXengybXNiQlJERHNzQklk?=
 =?utf-8?B?SmFuVk5wNnl1SVdnKzErZ3RPN1YvMFc4SU05ekVpV3JsK2MwNmFnalo0OHRU?=
 =?utf-8?B?VklVMzAza2pvZDczSUVLUFFYd2tadzNrQ1FQNkZwVG5jc2ZYc3c4VkpERnRh?=
 =?utf-8?B?cm8yM0pmQ0FFQjdlaHJ4bnpDc2ZvaXlPMVlYaXdma0J5c1lGSFBHN2N1Q2FS?=
 =?utf-8?B?Uy8zR0lLUS9PSldsQnJrc016WmZnUGluZVRkem5uaEYyaTlLT2t6Zk8vMnNr?=
 =?utf-8?B?WnNvcTRrT1dTMjNNWjlrcEZ4WHBnR3p6ZU5DOFRkalF4dS91NTdBdjAxV0VJ?=
 =?utf-8?B?ZHpwNFhzb0NIV21hL0s1TkQ1ZUYzNVNGSGZnMHZzLzBmVU9FNDUybTBrVFRk?=
 =?utf-8?B?Z1FIMU83UU1RMUdpSmU4eFJoV3VVWEZqd2JGZGIxMWFVcUtWc2ZielhVK0lX?=
 =?utf-8?B?cmExWEs5ZE5oZXgxSVNaRHhkdUoxNWx5Q25sWlU0N2lxdFdXZFdvenBrclRw?=
 =?utf-8?B?aGRkZnhDRXh3K0QwRWtNd0I3QUw2MEZwVGE5dEdGbVVWMXNvenpBYm1xMHRW?=
 =?utf-8?B?Z2xKdThmdVluMi8vOFpLUWV3N0ZJZDQrL3ptenZJVU5KUTVnK0RtYjkvWlNB?=
 =?utf-8?B?cC9oVE1NKzZtbXplZ09yTGhhbFFOL1dEVGI0MEsyYk5FdHk1WVVrbnRZbUh0?=
 =?utf-8?B?U3V5QWh1T0hyUG1ucCtKQlgyYWJuem54SEZnL25kL28zWEllYzZmYkRySEJW?=
 =?utf-8?B?ZUtqRTNCNkxScHV4UXpLVUZPT0pWTFdDOWVseVRFRWNSdnhRRUtpUjNvazFw?=
 =?utf-8?B?UFM0UStIQWdOdDI2Sm1Gem95NHdiL2ZCVlJ6dHFWTjZBckhVQWJOWDYwalZG?=
 =?utf-8?B?WXI4VDRyZFhkUitzdHZNd0l0ZVNpU0RPNDA1djVXUEtHMTlYMnJ6ZERldDh3?=
 =?utf-8?B?RXFKek84N2w2WFNXcmF5VkpoL1o0T0xrMkhCcjJTWE1JWldZbDYzZ2pFZy9D?=
 =?utf-8?Q?rft1SsC8swjG8qqzpoph0cQFiORENRVpG+tnTWP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a54565d-78ab-4356-11e9-08d904d9bef6
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1355.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 15:25:50.9696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8sf3E2TCWnNE3ttdNBb5panCxjhwu+VQ6SRftdrEIg3Eo+65RAnnloHtvPUsnfwXojAkCT+jjjm2SFHM5PvEEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1867
Received-SPF: softfail client-ip=40.107.70.78;
 envelope-from=Thomas.Lendacky@amd.com;
 helo=NAM04-SN1-obe.outbound.protection.outlook.com
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
Cc: Michal Privoznik <mprivozn@redhat.com>, Pavel Hrdina <phrdina@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu devel list <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/21/21 4:54 AM, Laszlo Ersek wrote:
> Hi Brijesh, Tom,

Hi Laszlo,

> 
> in QEMU's "docs/interop/firmware.json", the @FirmwareFeature enumeration
> has a constant called @amd-sev. We should introduce an @amd-sev-es
> constant as well, minimally for the following reason:
> 
> AMD document #56421 ("SEV-ES Guest-Hypervisor Communication Block
> Standardization") revision 1.40 says in "4.6 System Management Mode
> (SMM)" that "SMM will not be supported in this version of the
> specification". This is reflected in OVMF, so an OVMF binary that's
> supposed to run in a SEV-ES guest must be built without "-D
> SMM_REQUIRE". (As a consequence, such a binary should be built also
> without "-D SECURE_BOOT_ENABLE".)
> 
> At the level of "docs/interop/firmware.json", this means that management
> applications should be enabled to look for the @amd-sev-es feature (and
> it also means, for OS distributors, that any firmware descriptor
> exposing @amd-sev-es will currently have to lack all three of:
> @requires-smm, @secure-boot, @enrolled-keys).
> 
> I have three questions:
> 
> 
> (1) According to
> <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flibvirt.org%2Fformatdomain.html%23launch-security&amp;data=04%7C01%7Cthomas.lendacky%40amd.com%7Ca80df30ddbc54479df1008d904ab7ab8%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637545956815983695%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=aQ1yttPryxCjO%2B7cIPfxathftEPEKb0QYhdHI7WkWLU%3D&amp;reserved=0>, SEV-ES is
> explicitly requested in the domain XML via setting bit#2 in the "policy"
> element.
> 
> Can this setting be used by libvirt to look for such a firmware
> descriptor that exposes @amd-sev-es?
> 
> 
> (2) "docs/interop/firmware.json" documents @amd-sev as follows:
> 
> # @amd-sev: The firmware supports running under AMD Secure Encrypted
> #           Virtualization, as specified in the AMD64 Architecture
> #           Programmer's Manual. QEMU command line options related to
> #           this feature are documented in
> #           "docs/amd-memory-encryption.txt".
> 
> Documenting the new @amd-sev-es enum constant with very slight
> customizations for the same text should be possible, I reckon. However,
> "docs/amd-memory-encryption.txt" (nor
> "docs/confidential-guest-support.txt") seem to mention SEV-ES.
> 
> Can you guys propose a patch for "docs/amd-memory-encryption.txt"?

Yes, I can submit a patch to update the documentation.

> 
> I guess that would be next to this snippet:
> 
>> # ${QEMU} \
>>    sev-guest,id=sev0,policy=0x1...\
> 
> 
> (3) Is the "AMD64 Architecture Programmer's Manual" the specification
> that we should reference under @amd-sev-es as well (i.e., same as with
> @amd-sev), or is there a more specific document?

Yes, the same specification applies to SEV-ES.

Thanks,
Tom

> 
> Thanks,
> Laszlo
> 

