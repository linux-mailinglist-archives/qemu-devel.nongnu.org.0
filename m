Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D09993B6AE9
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 00:16:38 +0200 (CEST)
Received: from localhost ([::1]:38062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxzYT-0000r6-Ho
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 18:16:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1lxzQn-0001oZ-QL
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 18:08:41 -0400
Received: from mail-dm6nam08on2060c.outbound.protection.outlook.com
 ([2a01:111:f400:7e8b::60c]:61761
 helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1lxzQk-0006ST-LT
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 18:08:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QkYcsKUxBqC40u9zO3Qe4Gm+SvSbskUNmBUqvrOINmLreAKRYCnV7uWKI+Dsgicd2Ywla3ijYZ/GjSCU/+i0nYiX14uDnviQJ8Br5VxpvMy3PD44+hf8tgJ3LudxbHjEdr8iytIuFHkyW4UqHdsvc2PIoubOuKB844rFt3lQ4Q5p4pH+2w855KBv7t6XmkMcyAj03SoJB2snTXyEfgozlX0wJBjKqVAKzEej2gSyCh356SugoxdQmoSP+pEqBSFHmF4OwxQJS6LZsBGOsr9Ofd5Mtzi8/lcrEqboy2AA2ruw/1hjRDWiWHX5NcMzZLumom3zBDwflXKUuUR9r1a4Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHqAyPJ755p1tWhcTivJ0Bh36JAdozwVk/3e0MfVCPQ=;
 b=Qeu+Ys+YJtwb1+Jfqg1a7/2QXNy0zkyTNJxu049XNcJHKgPhno2t8XqVV1p6BQQ4N6324vjUvRzjSxcywTVQneZg+DC1DdTGJjlWYMpWsJ/pvXylFcPGVLdL8ApIYV/vEMKv+IPNsBwVb/dBkZCR94UWY5Lsb6/OIxpXO/4q1fBlJVpEDVtBqAH/bgZSCyjjp0TjZFniQxZVsllVlmTZRI2vitQkh9GdkGQ+jhG/Uoum2SvdR6a9NkGk0xIgIrOGja8yfZNwqLWON1jumcOq1PwHo+6OYxHEAp3fKkplqLV94Nse3I7o4M9YjEM6iKq6IS5a0PEA3SsIWVhb4+b+cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHqAyPJ755p1tWhcTivJ0Bh36JAdozwVk/3e0MfVCPQ=;
 b=QHBcMW0Dlz5R1xot1KkY6VVrOkr7ozUoR/GmhdM+8Du98CnxMGWkMQVChiNLMhZmEcc7XKEXg0ixwpgNth1VaJX6+lbx2HN3mALvAGQwcUiyguEVN97ZZOTMAYPXgUh0sJsPAAFwGZOJ9BgYS/z7F4Gc61Mo1RuIUmdgkpOsGfI=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1355.namprd12.prod.outlook.com (2603:10b6:3:6e::7) by
 DM5PR1201MB0217.namprd12.prod.outlook.com (2603:10b6:4:54::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.23; Mon, 28 Jun 2021 22:03:33 +0000
Received: from DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::6437:2e87:f7dc:a686]) by DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::6437:2e87:f7dc:a686%12]) with mapi id 15.20.4264.026; Mon, 28 Jun
 2021 22:03:33 +0000
Subject: Re: [PATCH] hw/i386/pc: Document pc_system_ovmf_table_find
To: Dov Murik <dovmurik@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210622124419.3008278-1-dovmurik@linux.ibm.com>
 <838caecc-6d4a-6257-147e-fbef4148f679@redhat.com>
 <d5fbda1c-69dc-35b6-388e-443a697c2fdf@linux.ibm.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
Message-ID: <f6eb39fe-50bd-5fae-99a3-11abd2141fea@amd.com>
Date: Mon, 28 Jun 2021 17:03:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <d5fbda1c-69dc-35b6-388e-443a697c2fdf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [67.79.209.213]
X-ClientProxiedBy: SA9PR11CA0015.namprd11.prod.outlook.com
 (2603:10b6:806:6e::20) To DM5PR12MB1355.namprd12.prod.outlook.com
 (2603:10b6:3:6e::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from office-ryzen.texastahm.com (67.79.209.213) by
 SA9PR11CA0015.namprd11.prod.outlook.com (2603:10b6:806:6e::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Mon, 28 Jun 2021 22:03:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea558c28-2301-446b-1bf5-08d93a809213
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0217:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0217F5ECF8CB869E43ED05D6EC039@DM5PR1201MB0217.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SU+t+uV9/682Jkqa6wvn/3Bw9a8/ZnpjjVsriGzmnqnahxgunEjuvVeaW9qhXAqVozXuS1QgNFLhrbxlU30QovIiafItk2lTNBuQLWHtKehznFwljAWXzQc8C3/McY1XN3KAKONNbYP7V/3Bgki6Nqf+GlhqcnGuGReXEsG24clKgIYAqpHcbCm99pPL5wtE+1/bAVQ012o4rzrlo7EKVSVXho5ptMlSrEZ6awuOiidbDKmMfwB4YQYVCc3q9pf+0Z2O4pi0NoH25Rb1zgQcpw1px36VQ1zpFSmtQgM/uxD/zp7RAMHeRxa1pezxogx05DFN1GZNqY+3b4eyOBbQS7oahXpv3mX5SMBK6Gv33TJwOyL9L05Y6YlVvRD/GzQJfpEfD1iVIOJFEuv+gk0y3OKR4uvqXOguNJlWH3Gu80w+pB0rnhdWnyQEaWBJfP/d5QsYuYy+SgNV8z27665rda2TMANiLvLc6EAMLlzIab7xelXkGLj45RE9oIaMLmE3ekRt07UqIWynf5n4NGVYRMx82/p8nTaZC2WLhT4/ORiUVd/HvtlFU0qw0rZJ40ntnfyQD3iWewhFVTX/FNnbqdoX7i3fYuYNyM6b6KPulJ6eO8Ht/JWNHBOyWfWiwhzOW9acP4E94ridE0ZoI18GdEYiqgQGxg0hGLH6Bt10W4q9z8u3v8xUZQDs2LNGUfXhC/Mn4GE7ObRUKKeEziWhNnw76m4fsN5BG/+lIyhljjo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1355.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(8676002)(8936002)(6486002)(53546011)(86362001)(110136005)(2906002)(6512007)(6506007)(31696002)(31686004)(38100700002)(478600001)(66476007)(5660300002)(316002)(956004)(66946007)(186003)(26005)(54906003)(66556008)(16526019)(2616005)(4326008)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEdac0NWQ05iWGVZQXcxMmJ3OHppL2RVNmZwZ1IvREx5VGhKNGtRa0s4eHgy?=
 =?utf-8?B?MC9EOXB0SGU0cXpOYkUyWnhtZVJnczNlWUZDK1R1elQ5SFVRM2ZVRFYzN0pp?=
 =?utf-8?B?UGt1VStydkIyNzJIMldPcU1jT3ZrRWNPTTdlZC9GZXMxNFh4ZkxYNkl5QlJ5?=
 =?utf-8?B?US9nbDhZRCt0UzVCbkVhWndtOUdhdWF5UnROQ25BS1BIVy93TXlpTnhUTnJ6?=
 =?utf-8?B?U2JnVU8yY3k0MEh0Y0VlYkxmRG5CT21zcmxlWFp0UEx6bEVrZUcxcTFhSW9k?=
 =?utf-8?B?MDZzTTBRUzdxdmFJa1paSVZFQUF0eStPNFB4Vi94bEE4UXQ5bWlIMENnUHJE?=
 =?utf-8?B?ZEs3UlovQy9qb1RuLzBLN0EwZThnOVpGOUU2Q3dxZ3hndGNGMVMvYmZQeWVR?=
 =?utf-8?B?bW9NTmZFU3hFYVpzTUF5ai9DbTdweG04TGZFT0w5VnBiOWNPdlZSeUdSYTFk?=
 =?utf-8?B?VVVjZjlNMVBEZExBTXREaXAyS1Y3dmE5STVuVWVzWUZLdUdDSjdXdUkydytF?=
 =?utf-8?B?UFZhRWNtNWtheU9FS1VML05pY1J0L2Y0bUpoZ1ZOOUtQMXQreWJDYS9GemtG?=
 =?utf-8?B?S2lDdU14OFFnV0dMTkpBZU5zRzBRcUpWMEZFQ3hiZ3hRSnlaUzN1YXdNSzNv?=
 =?utf-8?B?RG1lU3RpemJXckdKemN3VEZZVU01TWxkMHUwNnNvcHQxS0d1cEVDRzFnVDB2?=
 =?utf-8?B?TFhrSTh4WERQNGx2VjQ3UkxzeXV5ZGpJUVViT3FvLzNWZUdZQjVEdnRYMktN?=
 =?utf-8?B?UDFnZmVkVmlRVEpyUCtEa3B5WDhycnRjRW5LS2ZlY0FQc3Z0ak5ienBnbnNT?=
 =?utf-8?B?Yjh2MFUxNG1kNnphSUNIT2JBWWdSYk1VUXJTaVoySnl6NlhyYjkyTlJ1Q0U3?=
 =?utf-8?B?eHZBRnkvdnBUSVp4THIvODFucWRIMXNpWk1BVXlKdHNDdGtLY0JSdFN3dDRV?=
 =?utf-8?B?T09ERTVHVloxeXU2elJlTEhXNmJSbjRONHE0RlA4ZTJMY3hKU3pHZ3dxdWY0?=
 =?utf-8?B?cUFuQWZLVlFTVmZvQXFEaTk1bEs0cEVGK2RqWUJpaExqam5NQjVROFNaZXVV?=
 =?utf-8?B?YlRoaEdnQzdoRFdZMHd4UU96V2I0Smt2eUhQdmVuaUU5N3FWQUxLU0hVRkJE?=
 =?utf-8?B?aUp5Tmh3ckZ1V2c5T0dXbzcwWnVUUWhhMnVVQzAxN3FvWnUzVkJtSUxZUGZp?=
 =?utf-8?B?aUJOR0ZvWFFkL2dncU5qN0ZZTDhRTjVNMUxpM0VvaE43QkkzZC9CMVozZis1?=
 =?utf-8?B?ZGVKckt6aXNEd1E5b3dURVV2ZDh5Sllpak0zQU9NRlVadGRlM01YZUliWjM1?=
 =?utf-8?B?bkJLRTQ2V2RlVUZxSVBWM0o2RWlLK1NqYk9rZ1kzejFHakRXOVhnQ001Vkgv?=
 =?utf-8?B?ME5aM3UvSnVva0pCTUczcitlbzcya3NHamxRd2UzUEwrYWwrbGtMVDNnbm16?=
 =?utf-8?B?L2JDMUNmOWxrcXRnR1VZcEdUNG1oSlBObHBDTmttVVhWZXNkQ1FBTHQzS2Yr?=
 =?utf-8?B?RFBTdHloUFZUVFh4ajg5YnA0ODZkMGloaUJ6V0V0Zlh2MFpXNnhoVVFGN0xr?=
 =?utf-8?B?UHRTNVJBZnlUdURqVHZGRmEyaDFwRmlNa0M5cWMzZGJmL2UyRHNZbkNnZ04r?=
 =?utf-8?B?V29wbXFKb2tvd256OE9vcm1NeXY5eTlZeHhkZWNqUXBRV1VXWURIbEpwaTBH?=
 =?utf-8?B?YkRDTFdpNVUrNEcveUt6OXNPNWYyMWN0VVliYUVzcUVubzBwWld3a3EvR2ZC?=
 =?utf-8?Q?a8VFe1jNjyiCWqqvkyduWYmxk+/wfjYcym95Ddi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea558c28-2301-446b-1bf5-08d93a809213
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1355.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 22:03:33.1986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mM7VNY1KUQuGjG/RcD4IIoMVFXNeMoD9ujU1uGzUu8fK2QAy+KbnshHIoImhwaRGwN6ABf6Zx+vlLFqK7o+BqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0217
Received-SPF: softfail client-ip=2a01:111:f400:7e8b::60c;
 envelope-from=Thomas.Lendacky@amd.com;
 helo=NAM04-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001,
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

On 6/22/21 7:58 AM, Dov Murik wrote:
> +cc: Tom Lendacky
> 
> On 22/06/2021 15:47, Philippe Mathieu-Daudé wrote:
>> On 6/22/21 2:44 PM, Dov Murik wrote:
>>> Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
>>> ---
>>>  hw/i386/pc_sysfw.c | 14 ++++++++++++++
>>>  1 file changed, 14 insertions(+)
>>>
>>> diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
>>> index 6ce37a2b05..e8d20cb83f 100644
>>> --- a/hw/i386/pc_sysfw.c
>>> +++ b/hw/i386/pc_sysfw.c
>>> @@ -176,6 +176,20 @@ static void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size)
>>>      ovmf_table += tot_len;
>>>  }
>>>  
>>> +/**
>>> + * pc_system_ovmf_table_find - Find the data associated with an entry in OVMF's
>>> + * reset vector GUIDed table.
>>> + *
>>> + * @entry: GUID string of the entry to lookup
>>> + * @data: Filled with a pointer to the entry's value (if not NULL)
>>> + * @data_len: Filled with the length of the entry's value (if not NULL). Pass
>>> + *            NULL here if the length of data is known.
>>> + *
>>> + * Note that this function must be called after the OVMF table was found and
>>> + * copied by pc_system_parse_ovmf_flash().
>>
>> What about replacing this comment by:
>>
>>   assert(ovmf_table && ovmf_table_len);
>>
> 
> I think this will break things: in target/i386/sev.c we have SEV-ES code
> that calls pc_system_ovmf_table_find() and can deal with the case when
> there's no OVMF table.  An assert will break it.

Right, what would be best is to differentiate between an OVMF table that
isn't present in the flash vs the fact that pc_system_parse_ovmf_flash()
wasn't called, asserting only on the latter.

Thanks,
Tom

> 
> 
>> Otherwise,
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
> 
> Thanks!
> 
> -Dov
> 
> 
> 
>> Thanks!
>>
>>> + *
>>> + * Return: true if the entry was found in the OVMF table; false otherwise.
>>> + */
>>>  bool pc_system_ovmf_table_find(const char *entry, uint8_t **data,
>>>                                 int *data_len)
>>>  {
>>>
>>

