Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2269E68F233
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 16:39:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPmWl-0003KW-Hg; Wed, 08 Feb 2023 10:38:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1pPmWj-0003KM-Jn
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 10:38:29 -0500
Received: from mail-mw2nam12on20607.outbound.protection.outlook.com
 ([2a01:111:f400:fe5a::607]
 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1pPmWh-00044l-9g
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 10:38:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SsAvGt3fKDEvx26mDk/DqDi+KK61hPscC0aKw9QHTp6x052D1rozTqoWuViM6NXUwTTqPnCmJAQXunbI/96A4qL18ZXSG1zNsAuauY3i/L94LKZx9Zf4RpKVEGSvJ+d2847a8S8r3Bzyn5zkeqUgxupoGbwzO7gjxUYwXOGLFiFi7kndipFAs+pPgeSuaaqBgep6YFlWLeb6SxLceEVtS82g4p7erVTcoT5BKw7wUeV7PRZzVvbBSCifOF5xEBj1TWvRsjA6CN/UhmkC0lrW4V7xgmTa12gm3Uzj4CJpUm1jKKwWkT/Rm4LpSXzp9DVfVB0FZeiQiY4Xuxc4Vg5ttw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R086ULGjGXJ4uQ2vlSe+TFB6lPpgXQBPuTLCkjqUWh0=;
 b=LYzNvTI+9HCZ5Cu7FUjbBazHQ9KMYybSXcgqC/zeBFkyQNYyLrCwvOG+e8ETrTeqBRTqAzLA1cp6+BwyqCaFWHJbEtC34NnHO0BAm+79C0LnGgoymYbwfNdhaeRCj8CRkI9nDBBfWNAbBc7EeSlHWMS2fRKxRIuLipFiY8N4diVDZiPhvo9e9YfyJc4mC6bS3RSJmkvr27M69HtC2xzXDxQscVwxbR8vT0IarnGuoxgHgZuoJHzLb8hCgx2kCqtapjkPxSNtK95zF1VFWuaiZCvMHtYZ57BlkbhqgCYbq/Giiw7FAFeIKJCZQATNTWxxWygYGXhHPqXaMWvCNBhGyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R086ULGjGXJ4uQ2vlSe+TFB6lPpgXQBPuTLCkjqUWh0=;
 b=CKrUMHaegP/yIByBrCG7QPtEHoeMc+PqoW0F/VudFBFUofbWY8wXOYEo0hrW6WYDGSTSXmPGMz82ODFwTBrAwsBH2cjF7t9g03NcHrU7vmlLD+VeTvkDcTYrclKhQ5ObNQkI0+3wapowPkDipQyuWnWEtsVWqqIhjY4LD2MWkkY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by MN0PR12MB6245.namprd12.prod.outlook.com (2603:10b6:208:3c3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Wed, 8 Feb
 2023 15:38:22 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::6cc0:9c7a:bd00:441c]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::6cc0:9c7a:bd00:441c%5]) with mapi id 15.20.6064.036; Wed, 8 Feb 2023
 15:38:22 +0000
Message-ID: <4955a608-2e8d-e399-6ae0-58f9d289e06f@amd.com>
Date: Wed, 8 Feb 2023 09:38:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] x86: don't append setup_data to cmdline for SEV guests
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, mst@redhat.com,
 qemu-devel@nongnu.org
Cc: Dov Murik <dovmurik@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230207224847.94429-1-Jason@zx2c4.com>
 <20230207224847.94429-3-Jason@zx2c4.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <20230207224847.94429-3-Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:610:76::11) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|MN0PR12MB6245:EE_
X-MS-Office365-Filtering-Correlation-Id: eaf9fc00-48b9-483e-5ead-08db09ea8277
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qJsqazG+4R1gEpmKfcsAeSfNLAWnVl+psJrTu8ov5wMZa0NacIHI0TSeCyLdkFDRvhe6kHqCZvPTtdR5MBJzZzPiSZ2OIU7nGFctJ9WPvAhKDECYZQ6yVq9EEn8np9OaQr1V8D2E9c4kX34BPDb9Tu7DZlPiQO3IcAgO1v10IUGraSIuqgZRgo1vyIicLc4MjntSVEkoLZrR0YIHlBMvEs9Vu7zETrTU+PSvx97lgUUedujK5+7LgvTwJlH8W/8EPg1xh1Tj7ZpkIH0kgRzdjxwAa2PGKfDFu1IlHPLY6ipP6LQeRO6tTHxHe++cNmoLhHZ1HpT8hflrovPIOMkf3WC1pZjthYkPzcYb+QfkZv5Mysb/SYub4ocvQ6ucL4ADKYc6gincw2RLI1tttwmBzSqn4aaT/tUSB7eAQ3sA7aoo8Ar+dDLaDHFovYVvp2KZwAbFX3bo68i97ojXinSgCjp0NcBuYTT47ydWDAys6mTvqXealoaNpB/Sa+XyLWiY/OQgt8iU6jOzbhnWiRpleLowG2Jj9TvPSpV/mTqYhPvtS5JjzBhh3l4YNJRrTPjXt5yykA9HjX1R2sZCjQLxRWYGdBKF3+MP2WJXtViftar8nFgxbaUEyawMXoEowzgiZhVihkk5a8Jdp1it2reijDxfOBv/GuAmz5XQIDLOqDyHGXaZx7P6p7FLcT+qaa9dFRoBUd83mQ4b6gRctFpWp676kt26GF2FlwgP5nulaoQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5229.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(346002)(136003)(376002)(396003)(366004)(451199018)(6506007)(86362001)(5660300002)(53546011)(26005)(31686004)(6512007)(186003)(66556008)(8936002)(6666004)(2906002)(66946007)(66476007)(4326008)(8676002)(38100700002)(41300700001)(316002)(2616005)(31696002)(478600001)(6486002)(54906003)(36756003)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXhidi9iRzRDOGNVVFJXS0hIbUdaQ0JqRnkzZzhaS0ozczY4Z29nT2NQOTB0?=
 =?utf-8?B?YkxzeGI5M3FTQXlCODJkSVI0RU1TQWNvd2lBa3B3bHBUZnFCdXhPMEFtTmY4?=
 =?utf-8?B?RThCa3NwYUdXWUJWOGVKWW9maEQ1RlBsa1pEMUFLSFZmdm9IOURneGZDdWZR?=
 =?utf-8?B?dlBpMUZkanZjdE95VDdpQTgzdTh4WXJ4d3kwd3dQRUJxNXA1Y2lGNFp0U2xE?=
 =?utf-8?B?a01rZWJOZnVNRDd3WER2QmZRUW1SV0VlVU1yUFZQeGhmS0MwUWF4WXpSdHNH?=
 =?utf-8?B?L0JQUEhMQUlBR2Vmc0pYd3ErRUJwWkd3YUV6dURWdWZ4NVdET0tlck0rQmo2?=
 =?utf-8?B?eDB1L2dUbVJtanpRQkpvYWpUWnhvYW1Mek14UWdTQ21rVWt6ZVp4c1FhK3hB?=
 =?utf-8?B?dEtpMDNtcVk5dW5vdThmdmhPZ3E4aEt2NmtvQ0hjd09HNEMrcUZTc0dZNlpJ?=
 =?utf-8?B?b3N2STU1bzNselZrMzBtb1F5SVMvVm1RQndDcW56SUswUWhBbDFYRms2ZS9J?=
 =?utf-8?B?d1dxdVk1RVZZVWJNR3hpOEdaYlMveWd3TVdqeElPZXB6K1BDYjh2ZXUxcms3?=
 =?utf-8?B?V3Z2azJVN2dhS09QaTJuWWEra0loU04rdnUzUko0Zm1oaGVVVUl2UGlyalZa?=
 =?utf-8?B?M3JmNDcyazZnR2tiTkROUlllUGdXM0JFc1NuU1NQUEFDcFdqdlVRU0pWamxi?=
 =?utf-8?B?Sk5kTmNLUnB1OW9yZ0ZvVGIzZHVuR0NxOWlzay9ZblcxTnlYNW5EQmNEc29Y?=
 =?utf-8?B?QkhxbW9YVitTWWJWZ3RYVXhIeS92dFo1eUp4TGVEcEhwTjcycjA3OEtUQzZK?=
 =?utf-8?B?TGJDK0RMU0QrVHBwWllWRmJUZ2w3Q21Xazk2RE1ydVFoVGNYdHRCTzFQS3Qw?=
 =?utf-8?B?ZVVuU3M1S2JMVFVNRENQYy90d0I4dis2Y2U3OUVQdnJETDBpUlowT3Zacm1H?=
 =?utf-8?B?d21CbWVKRGFXU0tLbjAyWGFURUNFY3liY1RtajBLbnVNMmZ2WWxQM3l0dHMw?=
 =?utf-8?B?WUxYVjRNZnVyTzdURmZPVU5SK0RUclk4c1orbTNyYVp1dkVoZmIycVlLKzFo?=
 =?utf-8?B?azNYTGRiMXZDNGV3NEJ0ejgzZ3lnZ0lGS25memVVbkUzL0VwWlcyK1oxaVJU?=
 =?utf-8?B?bmtHeTZYUlN0VkFNaFdoaGVRdzlWSUFLd1BEWlZ2VVBaV1QzTkNTYmpyeHNU?=
 =?utf-8?B?T3dodzIxMDdOUHhVVjJINFpDWVAxWTVER1VPU1JzV2lzeDFnUXFscTVncXFH?=
 =?utf-8?B?aU05U2ora1JRRHM1S3pnQW9ldHBWOEUyblJUMDRieG1TWkZ2WkwwK0F6bldY?=
 =?utf-8?B?My8xTXp5RDUyb3NWSFFPSEJKODRSNDJUSEdkRUJyLzVqV1MvdnMzWlNLMEpo?=
 =?utf-8?B?UWZoaTVjQ2EvK043a09zZURJUzFZVmp3Q3VJUmU3aXVrWW9yUWluRlg4VmR6?=
 =?utf-8?B?ZDJ4QmhYaHBJTXJCTjRWd0orS2ozeFFLSEtuaDY3ZVJrcGJ6WFd1eXpPdmpF?=
 =?utf-8?B?bkJUVnI2aUIram43L1FKRTZuYnV2TTByTEpweGFEbzBUWVU3OFJCeUJiUUNC?=
 =?utf-8?B?OVlKSWZIOXVtTVAwVDBYYXlkWEw2WnhCb3JYZWlsQzNvc0JEYXV6RXNCM3VY?=
 =?utf-8?B?NWJxQVA1YmNhVEI0a3FZVEk3eE9LaFRTUWg2UExKbldtWTdXeHY3KytEUlVm?=
 =?utf-8?B?MVNiVEJ6NnA4UTFwQzB2Q2hGOXcxak5OeXF4OWxRdmNFdGZzYXRBRC9YVHVL?=
 =?utf-8?B?UU1vb3JyOFNlVjR1M1ZNVWxZbGpMSnIxd1ZuWnk0ZUFmcVhsNDAzNC93Wmpw?=
 =?utf-8?B?akdPQzJpVnRPd2dsNzg4NC9YV3F3TWd3SmpyZGJZVk9XR3pGVDI0R0ZXOEUv?=
 =?utf-8?B?NE44dXRtWjZnZm9TNVdQUWZWVk9CeGZDTkZqTFl1VHFNR21LWDE0cEEyMDlh?=
 =?utf-8?B?cm5lSW8zVms0aElveGVJZUJoWkR6c2RiVDRWcmh4MDZaSS9TWXV3amh2R3ds?=
 =?utf-8?B?clRGSFlUVVZYRS9hRlZjMGpFd0FnNWRKWE5UM2VieEJCeUVYMmhDRkJ5aXVq?=
 =?utf-8?B?MTBBREQxNEo2dmlHTytlcXJhM2xpbjVtOXllUURjMFVPdSthSXRkcVJKM3Uz?=
 =?utf-8?Q?Bzlz6du5E9jelN70RMixusLyT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaf9fc00-48b9-483e-5ead-08db09ea8277
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 15:38:22.0633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eBy0Sh7E4jYFRkaTQTuX71/6R4j23sivK122U99+c9FI8m7Hx6sIg5pKwaUGVWurB0GQHMPm/9Qk6bh7Q+2HtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6245
Received-SPF: softfail client-ip=2a01:111:f400:fe5a::607;
 envelope-from=Thomas.Lendacky@amd.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
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

On 2/7/23 16:48, Jason A. Donenfeld wrote:
> From: Dov Murik <dovmurik@linux.ibm.com>
> 
> Modifying the cmdline by appending setup_data breaks measured boot with
> SEV and OVMF, and possibly signed boot. Previously this was disabled
> when appending to the kernel image, but with eac7a7791bb6 ("x86: don't
> let decompressed kernel image clobber setup_data"), this was changed to
> the cmdline file instead, with the sev_enabled() check left out.
> 
> Fixes: eac7a7791bb6 ("x86: don't let decompressed kernel image clobber setup_data")
> Reported-by: Tom Lendacky <thomas.lendacky@amd.com>
> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>   hw/i386/x86.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index c6d7bf6db2..80a1678acd 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -1079,7 +1079,7 @@ void x86_load_linux(X86MachineState *x86ms,
>       fclose(f);
>   
>       /* append dtb to kernel */
> -    if (dtb_filename) {
> +    if (dtb_filename && !sev_enabled()) {

Is this change necessary? From an SEV point of view, the DTB file should 
be "constant" and so a guest owner will be able to use that to correctly 
verify the SEV LAUNCH measurement. Additionally, it won't change from the 
time it was measured to the time OVMF validates everything. Of course, I 
don't really anticipate that a DTB file would be used with an SEV guest, 
anyway.

@Dov, does that make sense?

Thanks,
Tom

>           if (protocol < 0x209) {
>               fprintf(stderr, "qemu: Linux kernel too old to load a dtb\n");
>               exit(1);
> @@ -1103,7 +1103,7 @@ void x86_load_linux(X86MachineState *x86ms,
>           load_image_size(dtb_filename, setup_data->data, dtb_size);
>       }
>   
> -    if (!legacy_no_rng_seed && protocol >= 0x209) {
> +    if (!legacy_no_rng_seed && protocol >= 0x209 && !sev_enabled()) {
>           setup_data_offset = cmdline_size;
>           cmdline_size += sizeof(SetupData) + RNG_SEED_LENGTH;
>           kernel_cmdline = g_realloc(kernel_cmdline, cmdline_size);

