Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAC93B7336
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 15:29:59 +0200 (CEST)
Received: from localhost ([::1]:57780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyDoM-0007zw-2U
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 09:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1lyDmm-0006hU-DI
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 09:28:21 -0400
Received: from mail-dm3nam07on2049.outbound.protection.outlook.com
 ([40.107.95.49]:38401 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1lyDmj-0005FK-Gx
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 09:28:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IY3+Ivjrv1rJVayAVYWMlV9ooZIWmTn76j5MhYKrxwqEURAdJpj0WqrknB42du+hVM06ID1CxgAYLlF+GT1bd4LBUL8FxWtCZm+jz4fMc7J4JB7yeLIfQOftJgG48MqyT7nVqTRXFPJAZFyev/4UOhbXBYy7GuQ+c+x9tFdR+e2iBWKRMIwDe2+1Aovmw9wMfv19bFom5S5Fn/gplrQhfI9UYf4nJd1EJ4btEliWROaniU0FI1Hhd6417gisYkCQhGIgBSpyokGFVokYGNHhLn/8lQhcvICOplmFFr2AZCgiXNqbRYH7QcZaTeePmQx4JQ7ow/+5IalDRuIyw4j6Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mgZFNBjISM1l9E5mcnm2w7p6SMRiORzGEJBk5CLUU6k=;
 b=CxeFsVd9Yqw6du+AMKPDAk08KJfBiQrkxpu2w15Bn6zKbfkH8dNLXFFL1FwEy/PF9SyCU4g1BlT6VsUAhZkQnIQ0C6iYyc2TRVSRVMeKyHnhh21x3IFdUNCxUdJKzoYx6Olzbsks9x/FwwZG7uQL/nFv5JEqSa/6Eg5sNtE0I8mfCQS4cJiJaWZ2h3cSRxkGxDBZ+BIscEGtO8lIZWR7wsQgWcN+1k56xw24k9xhs89DrEmhUWVqRvD1I8hyNPM7L6FMdeTAONN9tyD6VA5EnZYRt5feEwV84JJ4uMv7pO9A9j1hEB/U0T8u89TsfjB2uQVCiE5Ad1g9JDRj78K18Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mgZFNBjISM1l9E5mcnm2w7p6SMRiORzGEJBk5CLUU6k=;
 b=l+EGmxHgrdrLuIq8CkVmpotfFIA6nSuPJ2HAe61DC1l4XTcOOk0YNejqUlksmdu4owX/ph8fuA61SMhnYhFVzaFMk7qoGOZvYLKtmll4d+Me1/vJ5jpvYtW+sJh8RiESnRAHRAVIZMrt4OntILcXNPYHA3THjJRZBnlktvzEtzA=
Authentication-Results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1355.namprd12.prod.outlook.com (2603:10b6:3:6e::7) by
 DM5PR12MB2502.namprd12.prod.outlook.com (2603:10b6:4:af::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18; Tue, 29 Jun 2021 13:28:14 +0000
Received: from DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::6437:2e87:f7dc:a686]) by DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::6437:2e87:f7dc:a686%12]) with mapi id 15.20.4264.026; Tue, 29 Jun
 2021 13:28:14 +0000
Subject: Re: [PATCH] hw/i386/pc: Document pc_system_ovmf_table_find
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 James Bottomley <jejb@linux.ibm.com>
References: <20210622124419.3008278-1-dovmurik@linux.ibm.com>
 <838caecc-6d4a-6257-147e-fbef4148f679@redhat.com>
 <d5fbda1c-69dc-35b6-388e-443a697c2fdf@linux.ibm.com>
 <f6eb39fe-50bd-5fae-99a3-11abd2141fea@amd.com>
 <fd154b04-847a-efbd-7ae6-abc54630ac8f@linux.ibm.com>
 <0fcb8bf0-f149-e0e6-5dde-8c21df96887c@redhat.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
Message-ID: <faf8b5b6-435d-44fb-a198-0c5382dd12b4@amd.com>
Date: Tue, 29 Jun 2021 08:28:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <0fcb8bf0-f149-e0e6-5dde-8c21df96887c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [67.79.209.213]
X-ClientProxiedBy: SA9P223CA0015.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::20) To DM5PR12MB1355.namprd12.prod.outlook.com
 (2603:10b6:3:6e::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from office-ryzen.texastahm.com (67.79.209.213) by
 SA9P223CA0015.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.21 via Frontend Transport; Tue, 29 Jun 2021 13:28:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f13b9f3-bcce-435a-656a-08d93b01bf81
X-MS-TrafficTypeDiagnostic: DM5PR12MB2502:
X-Microsoft-Antispam-PRVS: <DM5PR12MB250254A32F61C0DEA60A794EEC029@DM5PR12MB2502.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hsu3hoB4+gs2FxB7DVR2IQkk+I/tQRxAtE3/S5zgstgzTz5dOnhUagZdlrsgKJuBY5vn1PJnFU56tuyoSVygaF4NBNjYi7vCvNtqwlQaeIFxd6/diAhfenHpvzDXUZ4eSLnIno0DcEGAAQmSZ1X/q/ZxEsTxrV8KQx9WM428nSSH/Sk1ZRYK5v25/3/T0J/tS4BAiZHy42LamkQm3QwauO5H1cILsvSTfnfCgBuC8fNvkj0KNcHX2xjJst80dSts6Ozi46hP475wbRtj0tLhfFgPK9ca/e/NEF4ycEoW4MDBw/pwcnaHq3vd6BOnyEll5GUSIY6HI6YogXlLdtOqPuzDiumx9lvxtirglG53QzKdxct0DyyZhflG3XBZc4iCfoDywnPlTXC49SZt1LJSrhwqLfanhSr8cQWWwJX2nO5bhN7GLE+hfNyUWPVApElRDcOt58VGMkDOEucrCac4ZQx9KkdWMQes4cqqs58qPNnP918AYNi4/jfgQ4h3qOUDqcK1OfPg+fM1/QjZjdfZBRT9d/t1Bhxy9KYSEHhIPlGDZ89JrjpNiFXwDFqDE55EKQvE24EN69JXzkt9IM6kdBHJSZTddVnKoESUaTN2kmlzCy/wtQc2TStJ/qt0RFiUX/dSbEja2YMQxN4ZEHAUo7u9OCketmHW8T3HyyQAYv56LwOp9tmyOOV8tvGua0jPwAh0eYLXecOxvkNG/+LBT5AaYI3Gq4ITE3avo1R1kyw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1355.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(31686004)(316002)(6512007)(2906002)(16526019)(66946007)(8936002)(186003)(6486002)(110136005)(54906003)(8676002)(26005)(66556008)(86362001)(478600001)(36756003)(4326008)(38100700002)(53546011)(6506007)(956004)(66476007)(5660300002)(2616005)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3dqM0pmTGc4M1UwdzdaTVpCaWZJZ3NlY2MyamxTNGNZa0hMOCtOcHFaU1N6?=
 =?utf-8?B?RU42ODM4M0d5MXhJYUVNTjAxYjJxSExDTjAwS2dQWFNQeVROeWFseEhDU3lE?=
 =?utf-8?B?KzJnUjBWd1BnMXRDeFBILzgxVlVpbERUa1M1SkJ6QzVNak5hWHNTUW4yN2xl?=
 =?utf-8?B?YjcvaG45eTVNSUlwdWZkbDJtK0ZBMHdrUEZieGltQkFKbjhSQ0hvMmRsd2Jt?=
 =?utf-8?B?cjl1eVkwWXdnQW9JVGg0YXFiT0Y0VlFEYlZPcEVOVi9jTm8xb2J1Yk0zaDEw?=
 =?utf-8?B?dUk1aHo4ellhRDNRaDZqVXFOSks3VEFuWXhnMlUrUzVMR1pjU0JhZy84all2?=
 =?utf-8?B?VHFBL2JIMjhZOUVkSVJQdFc2aGMrWmpBQXVVNkxJT3pBSTQ0cFFvcDhVYjdN?=
 =?utf-8?B?NzlDNktlY3VDaHIvbGU2VXJkcEVBekZ2T1lZRkZqV3V2M09SU1FFUit4akxj?=
 =?utf-8?B?SlhSRUNHV3hBOVRGSkhxNmNFSXNIL1B5WUp0WVJTcmNtMTlMV1NxczBSdHRF?=
 =?utf-8?B?QTBmRmk3MWRCNmdaNnpESkZQWEtTblFDREprMndmdDBXN2E4NDlOZ0hqc2lh?=
 =?utf-8?B?U1VEUW9EalE1bDdPcWMxL3U3RzdZVE5iUmhrVWFQZ05xbzNMMDlLdVZBSkxy?=
 =?utf-8?B?YjZPZEhHZ2J1NHR4bkg3bmxTSlRPbjJSRTNIMlBidlNzNGY1M2d4QklJTDh0?=
 =?utf-8?B?Zk05UE5RTDZQcUVNbmhmalJVRi9oSUpobWpuRm4vSUVPbGtucHlFMGRIbDFo?=
 =?utf-8?B?U2NkaGlFMzgwQmc1bUdEMFFuS1NtejhtRERxdzlFWUdmUDFXYkhHODJnVHZs?=
 =?utf-8?B?WUZLWnluLzBjc1VmQUp0am9JVlpZU1F0WVZhVnJ5VkZSb2dPZDMvUmFjTmp4?=
 =?utf-8?B?RjVPSGg2MlZCMUh0NTc5UlZhOTRvaVBmSjdlNHlROVNVZ2lxM1hyU3NaY3BN?=
 =?utf-8?B?VW9EbW1iSnJSTXFDbWlmakFVZlo0dkRpZDFzTUpBZm1TbUt6UU5KcDRKeUpS?=
 =?utf-8?B?YlFRQXh2d2k2VE52b3grUUljMG1yUytEbngrLzIrTWpEOGJ5UG81eVR5VUdO?=
 =?utf-8?B?d1RsUThmcDlFV2pwUEdSYnoxQkZoYjZqaGNhOEtBZEFmckszY1FzUFI0d1o4?=
 =?utf-8?B?ZUxvemhMN2d0VG8vZjBVbHVyMlo2WkNBWnBNSllnR2psc2FtRTY1VUdJR0pP?=
 =?utf-8?B?MDBSaGhoc3N3R3NsMmF3M0MxZ1VGdVBhRm9ZQk8wN1dEYitHZjNzdjZwMHV0?=
 =?utf-8?B?WUxjVDhYMDllYzBBd3NWeU9CVUpiZHJwL2RKTW5qYzVNTGIrQWZ3bDJEeGRv?=
 =?utf-8?B?VlhqbmJVdlovYUtFZnZtYkhkZGdBUjJKbjQrMFBydzN5YTJSR2VqWEtuTEJN?=
 =?utf-8?B?aUhhMXhKWU1HUndnZDR5L0VhSjI0bmE5N1M2eS8xdkhMdGlPSVlrcTh6aXdW?=
 =?utf-8?B?U3hlSmhIS0ZpQURmOFhTNkkxMm5GVDBiMzFTdDBjd1Rsei9kSithQ2FoQzA2?=
 =?utf-8?B?RlZhZzB6OHJIZkZVczBidXgwbDN0dVVBajYxdXBBTnZQN2dNM0VwWHJONE1t?=
 =?utf-8?B?Y3NiQTVJYWlZUEZybXBUSFA4ZXIyNkFvYTREUjk5V3ROaUdjZ055Z3dtTkFI?=
 =?utf-8?B?WXRpVnpkaWQrWEZMdmFMZE9nTENTNTVKaWxqR3gyaDZ1MEN3S241WlpKaTdV?=
 =?utf-8?B?NUE4RnE5T2h2Y0loSXlTM3FYU2VRRGpXYm1GYmd4RzFzZitnaXFIOW9KSXJE?=
 =?utf-8?Q?uDNwx8jLsTyWV7Y5YEmYsjIpFOb7K5u0f4xo3zy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f13b9f3-bcce-435a-656a-08d93b01bf81
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1355.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 13:28:14.5960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NgK4+G00ztheYQTYHMAT+wezEixjhqiDy6HuOoROsdetnBME6wfj3IsgE4pBC+tWQ60TBRfjV2RZh7krEbT0oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2502
Received-SPF: softfail client-ip=40.107.95.49;
 envelope-from=Thomas.Lendacky@amd.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/29/21 2:11 AM, Philippe Mathieu-Daudé wrote:
> On 6/29/21 7:56 AM, Dov Murik wrote:
>> On 29/06/2021 1:03, Tom Lendacky wrote:
>>> On 6/22/21 7:58 AM, Dov Murik wrote:
>>

>> (a) add a 'static bool ovmf_table_parsed' which will be set to true at
>> the beginning of pc_system_parse_ovmf_flash(). Then, at the beginning of
>> pc_system_ovmf_table_find add: assert(ovmf_table_parsed).
>>
>> (b) (ab)use our existing ovmf_table_len static variable: initialize it
>> to -1 (meaning that we haven't parsed the OVMF flash yet). When looking
>> for the table set it to 0 (meaning that OVMF table doesn't exist or is
>> invalid). When a proper table is found and copied to ovmf_table, then
>> set it to the real length (>= 0). At the beginning of
>> pc_system_ovmf_table_find add: assert(ovmf_table_len != -1). (this -1
>> can be #define OVMF_FLASH_NOT_PARSED -1).
>>
>>
>> Phil, Tom, James: which do you prefer? other options? Rust enum? ;-)
> 
> Since we are discussing code that should not be called, I don't have
> strong preference as long as we keep the code easy to review :)
> 
> With that in mind, (a) seems simpler.

Yes, to me (a) seems simpler, too.

Thanks,
Tom

> 
> Regards,
> 
> Phil.
> 

