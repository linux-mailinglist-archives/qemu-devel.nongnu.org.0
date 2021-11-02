Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF78442BFC
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 11:59:41 +0100 (CET)
Received: from localhost ([::1]:53190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhrW0-0005zd-My
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 06:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brijesh.singh@amd.com>)
 id 1mhrUV-0004Bh-Dm
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:58:07 -0400
Received: from mail-mw2nam10on20620.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::620]:43744
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brijesh.singh@amd.com>)
 id 1mhrUS-0006gv-Hm
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:58:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZUxJ/Lo99I7kfN17erRqsI/GOWzEJXcPYhp2wrNUimQUp2RcrtDRnOzwtT+hishdsaK5JnmW6kDcB0OaQ9Rf5o5TWxp2P7tTfsr1mzhC9LZdVfYgfMtmNtjK5o3Zle4uL73J+RBimVSwIObBKrnVhodwDkuIlyaUrXIlttghT3k2lcxG1aXUgML4rodW0NKtkm+if2AGVnIOB+sqNUFX0N+FB/a7THCVSIA+qHbghcKlJCxDRVHFT3R93koojWmyhEivXC53TQwHKMCb0ZjTAdchGXiDfetRuRKvpEgADbYrFLId04pgxMQnv6xQkv3tc9jnof3CkYWzhVo1Cx4zvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLz9kT4RTGaN6GTHFerJy39r3hOLCjzimO86ONno99c=;
 b=FBeqVYuxTSVs4TRWbfIkonGQzdCBOQa0ZN1P+3Y7h7+/sbI0tOx0KyB1HHHQegqmcc6+llOjqn3krTY94MCAU4GV4k+uteX2CqGt2ZpPj9vatpqt1dz79aUOa4intLYIpDrLXr+6VhgB2aTAQ9UQNNapPrpTtBV2HeVrB4nCr4n+xRdvCK5VB/snw4dxujH4TrxfMNPGdFnz/lSchNxCQvT+qUtx6x/r1ECyq9UHHf6RsGRY1i/CjcmNqFiapyZI51mM/hzazMA8KeaRFL5eBdG/d+HUzgO0MQk6eDKPsPAizinYwQxbU93mRfjBuVlPFj0hwZw9cAffJMr6V/mw+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLz9kT4RTGaN6GTHFerJy39r3hOLCjzimO86ONno99c=;
 b=hk9rY04+cCqWKyl7GfLfnjMbYRgB8KqZxIP9sCYeY58UzB2zYfK2hjhNcYfu3TkaQq1IaN9JqTn12efCLdm33kdUIGwX7Q9OdWYsyK2xnX6mZ+drr1tgCKkg1Bgtc2p5XynOXL97m26hGgwm2K7b9QFn8E0cNIrtcx0eVYmBKDU=
Authentication-Results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2718.namprd12.prod.outlook.com (2603:10b6:805:6f::22)
 by SN6PR12MB2717.namprd12.prod.outlook.com (2603:10b6:805:68::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Tue, 2 Nov
 2021 10:52:59 +0000
Received: from SN6PR12MB2718.namprd12.prod.outlook.com
 ([fe80::e4da:b3ea:a3ec:761c]) by SN6PR12MB2718.namprd12.prod.outlook.com
 ([fe80::e4da:b3ea:a3ec:761c%7]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 10:52:58 +0000
Message-ID: <0291b6fc-b613-5eae-77a0-b344020a8376@amd.com>
Date: Tue, 2 Nov 2021 05:52:56 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Cc: brijesh.singh@amd.com, Paolo Bonzini <pbonzini@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Ashish Kalra <ashish.kalra@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 James Bottomley <jejb@linux.ibm.com>
Subject: Re: [PATCH 0/3] SEV: fixes for -kernel launch with incompatible OVMF
Content-Language: en-US
To: Dov Murik <dovmurik@linux.ibm.com>, qemu-devel@nongnu.org
References: <20211101102136.1706421-1-dovmurik@linux.ibm.com>
From: Brijesh Singh <brijesh.singh@amd.com>
In-Reply-To: <20211101102136.1706421-1-dovmurik@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0501CA0074.namprd05.prod.outlook.com
 (2603:10b6:803:22::12) To SN6PR12MB2718.namprd12.prod.outlook.com
 (2603:10b6:805:6f::22)
MIME-Version: 1.0
Received: from [10.0.0.5] (70.112.153.56) by
 SN4PR0501CA0074.namprd05.prod.outlook.com (2603:10b6:803:22::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.4 via Frontend
 Transport; Tue, 2 Nov 2021 10:52:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35668145-511e-45bc-a69d-08d99deeef01
X-MS-TrafficTypeDiagnostic: SN6PR12MB2717:
X-Microsoft-Antispam-PRVS: <SN6PR12MB271734469990F80E1D07DE07E58B9@SN6PR12MB2717.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TJasZAa9Km4FNZXCze/x9mpaOi7mgc/YmGFBtmLKLe8Gc0bJPHnD5VxZq/mVVDXA0wGClW3waHmV+7xMkups0hqJWL17QWDrlE2jIxOttbEBaVt14G5xjeb2GuYj/UILzTibrOeFZ6O3B0z9D7hzPM3apM8+yv1wz4ssdaXt6XSQsIYZB2iDdN+STcQeziCqYKFph6oNGxRLjhyXzshKI+LfwP62T5UUFQduXCF+EzoSjLYPikbBkQRYIaQs6o9iNMU/8BNrqD9S9BUfcauzcR1CV49/fsHCZcZdEBAS9fFtE5LO0M0gv7ErMwNJU2DlIipf6Yu0exa+rzYSLakzf9xFPFuH+qmdP+Fjs5nnaM4Z4EMOz1FQ5j/Xf7n2z008+FEsweZde134HYGoqATX5I/JT5Zqd5ZPe+zsErFchcBM99bE7l517k83jWDeUs2XffoDMEtfWdZ2WmaIanDNRno6ioaSFAXJITpOaNbpoGa1ERJv9ezUjj5iigw4OtgKCFDMxY8twRGXuudGF2TZr44hIHi0XxiI4RJNxc/3J+CH/Ez+wMuwxfeIIwQI+PbsPfKu8iLVqIOqBP8HIoZCGxhEQgkvu/JHx4UDtCRdtc1nFfbyl5YJ6rwl5k2M22VRFrEmLIPaeFTRX4+IX+oiAiEomv0O/YQD9JEkglPli60/TCm+3JHTOfbtNc3cWT3+1RxR9JEndPfs92o2VPQ0eEtlbajwFqG7Wl6AvhgeYxGppwnHZrW1g68dnr482uedj2rF5a29mjMnpbMvJtNhmXkSP8mSAm1d3UD6uOSqxYsTJR6MVPrFRwtaZ3+AmXS/7Jlf57dB7VSs5bQxR9bu9wS1rTNEOJ9Vv5lIyJ0Ji74=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2718.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(16576012)(54906003)(66946007)(66556008)(66476007)(8936002)(316002)(44832011)(8676002)(38100700002)(83380400001)(53546011)(4326008)(186003)(508600001)(86362001)(966005)(31686004)(5660300002)(26005)(36756003)(31696002)(2616005)(956004)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WElkbkNmaFJKSk8zT1pPdkZyZVdHMkdZV2Nzc3VaMmcvempBd3FDTUYrZHBI?=
 =?utf-8?B?M3FNazZHTDViQ2IycFhkdmhUd004RTAzQTRGWWFTWWlBc21CYzEreXZlYUgv?=
 =?utf-8?B?N2R4YVNJbXdLVTlTZFFXRllLTE45R0FraWcvVHJjQ1VPNEN5dzA2ZjI3eUxX?=
 =?utf-8?B?ZGNLaC9Yblo4SVg4dDUzMDJqRVNVNW1DdXZ0NjVpNy9Kak5hUXR4b2lGdTE5?=
 =?utf-8?B?QlRvRGViQStTNXp4YnpmeWN4emN6N0xXTmg5ZmtuM0lTZWRkMWsvSlV4S25L?=
 =?utf-8?B?UVU2bUYxZzBtV0Z1Q2Q5Y20xZDIzcDZpdEZad1BiRzBQRkpuaG9zUWxSOHps?=
 =?utf-8?B?eCtSNHZjc0lodGpIdTJnTHl4cWsyYnpVUDdBemRQQjhpKy9LTkJqWTV1TnJX?=
 =?utf-8?B?cDVDRTBWdnIyNlJMOG8zR1AwU0pTTHVEYTBXbzVSVFNNMDJkSW14TWQxeWho?=
 =?utf-8?B?YnFTSWVMY3YzVkpKZFRBYmJHbGxBMXVCOTU1ektlZGNXOUZkaG5KZU9zbWFN?=
 =?utf-8?B?MjF2cUM1YlJLMGRYL3l3bVk2dDhkN1F0Y2sra01GV2tGWGNNNFBTajJqT2hX?=
 =?utf-8?B?cERCMng2dkl2dVZHS1NseldYVFdsNHdFWGRpcFdLTkNlcWJUeWR1bHRRenZ1?=
 =?utf-8?B?Y0N1NzBuNGdtNUVpU0VPZ2Y2YStVNlZ6dGE5K0src2dmRjliblc0QU5HOHVq?=
 =?utf-8?B?TUxaa0VkWENTWnVDbWZkbzMvelcwekNkaXVwdXpjQmNLQXNDUGxmcjV1VU94?=
 =?utf-8?B?bXpUQjhSZTBLeTB2Q1dQckRrTTBVZDZPeldhbHhuK1R4dFJvNWVPQmJoLzgz?=
 =?utf-8?B?WTJwZlZLMEhEaGFZYzBYSTBjMDZFSDJlekh3WC93d2VTS0NsSWhkSVJvRzZu?=
 =?utf-8?B?c1ExL3VCWEJ1VUhRdUZ1RFJSdmJhemZkd2Q4Q0xtdEZxQXdIVjJ1Q0RFTkI0?=
 =?utf-8?B?U3I2TDBZdHowUUNTa3d4cVgvN3preHhaZUdiMUdjOEVRZWRTUHlyOUFUR1VX?=
 =?utf-8?B?ZEdTM3M2REJGOTBmRkRMWWlHalFrN1hteFcvc25raDZEeURRd2QxYnkwWmtI?=
 =?utf-8?B?aHpCc1BiRVE3OW1JRFp6K0dnTEhGU2dBMFJGVlBoaVg5b3VLV1N6MnZQRjQx?=
 =?utf-8?B?bmVqQjJRa1lGVFpPK1VONThkcm1lN1drcTlOc0RvUmdsZldGQ01YTERTUWhT?=
 =?utf-8?B?bFdzUDFRQ0V6andzOVovcHF0WmZCMVUrUjN3MHJVU0kxREJxVFBMNGdtMkw4?=
 =?utf-8?B?S011aVdzUWppeTJmK1BPSmVLMTY5UGxJSE53N0hHVXkzWHFJNnlHMk5kem1D?=
 =?utf-8?B?OW1LdjdpZU11OXBWZWFmeFlMNEV0SERwMmdyWCtsdXlYcmNBQmx5L20vdmw4?=
 =?utf-8?B?a3lMZjZHcXVzOVhLd20vaEFtRmZnRkFra1BINzg5QkY0eXF5bVdwTFNFQzVr?=
 =?utf-8?B?ckVpYlYzbVNIc2FlWm05MnNUL012YlRqZzFJaUJQWldwdWM1NndsR1o5RVdI?=
 =?utf-8?B?Uk1KMVFscEVYTm1FejFCdk1JMUZwVTRTZFkwK1RMOS9hTzRZNnpsOUxEY2F0?=
 =?utf-8?B?ZTVZQVUrelpqNXNTeTJra2V6Tm53L0N2elJRTWk4SGdPd0xNZ1lEQkNyQ0RL?=
 =?utf-8?B?NStucnd1MnN3VEFISGJMUWFCTWhkZUpvRGZxNTQ5ZWZFc3ZsdmNvcml3R2ov?=
 =?utf-8?B?azZPNGllb3VDUmRjT0hGcnFyZlZIK1piN0JiTEZTRmZzQVFDTmY2eFQyVzNt?=
 =?utf-8?B?elQ2WjUvSU5zNGtwbzI1Z0NrVVhCTDZ6a25GWGthcHdad3A4Si92cUF5RnFV?=
 =?utf-8?B?S3l0M3J1eEZ6bERZODBxNmcyOVgvbG4zVXhCcFY4bllQTkdGRlBqcXpYZC91?=
 =?utf-8?B?V3ltWEpXbXFOblM2ZHQwQjBpTHlpSGdvVnBvTnlqWGpXaGtMY2FKRVV4eWh2?=
 =?utf-8?B?aXB4U2I5VHluUElqQ2dDRjVNYnVCZHh1S1JpYXNrUS9Ja3RETTdNM25nb082?=
 =?utf-8?B?MTVlTVh3RHVDajVMSERvOGk2S01oWWZxZHJoeERRYXFadWhMRTJZamtQN1Qr?=
 =?utf-8?B?azRqMmlXWUxUVFkxSkpza2ZaakkzcERrK05CbWVNYVlXRkVjbkN6MlNQa1FJ?=
 =?utf-8?B?SE80ZmZ5U3haSFF0a2RUcUhQcXFPOEVjUUN4MWlSZ0dTRlNHY3NDeE5MVWNq?=
 =?utf-8?Q?tIOcSEl74B6uYPEKnjWTOlI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35668145-511e-45bc-a69d-08d99deeef01
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2718.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 10:52:58.8914 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 33KUT0xCoknm0i7fuWwRsUYLJrE5cZ+IqdOTwmG75Av0UEUp6Ja6bepET3UtVSTUm3XfrX8jeON6i6e0PeUCOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2717
Received-SPF: softfail client-ip=2a01:111:f400:7e89::620;
 envelope-from=brijesh.singh@amd.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_NONE=-0.0001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Dov,

Overall the patch looks good, only question I have is that now we are
enforce qemu to hash the kernel, initrd and cmdline unconditionally for
any of the SEV guest launches. This requires anyone wanting to
calculating the expected measurement need to account for it. Should we
make the hash page build optional ?

I am thinking this more for the SEV-SNP guest. As you may be aware that
with SEV-SNP the attestation is performed by the guest, and its possible
for the launch flow to pass 512-bits of host_data that gets included in
the report. If a user wants to do the hash'e checks for the SNP then
they can pass a hash of kernel, initrd and cmdline through a
launch_finish.ID_BLOCK.host_data and does not require a special hash
page. This it will simplify the expected hash calculation. Adding a
special page requires a validation of that page. All the prevalidated
page need to be excluded by guest BIOS page validation flow to avoid the
double validation. The hash page is populated only when we pass -kernel
and it will be tricky to communicate this information to the guest BIOS
so that it can skip the validation.

Thoughts ?

thanks

On 11/1/21 5:21 AM, Dov Murik wrote:
> Tom Lendacky and Brijesh Singh reported two issues with launching SEV
> guests with the -kernel QEMU option when an old [1] or wrongly configured [2]
> OVMF images are used.
>
> The fixes in patches 1 and 2 allow such guests to boot by skipping the
> kernel/initrd/cmdline hashes addition to the initial guest memory (and
> warning the user).
>
> Patch 3 is a refactoring of parts of the same function
> sev_add_kernel_loader_hashes() to calculate all padding sizes at
> compile-time.  This patch is not required to fix the issues above, but
> is suggested as an improvement (no functional change intended).
>
> Note that launch measurement security is not harmed by these fixes: a
> Guest Owner that wants to use measured Linux boot with -kernel, must use
> (and measure) an OVMF image that designates a proper hashes table area,
> and that verifies those hashes when loading the binaries from QEMU via
> fw_cfg.
>
> The old OVMFs which don't publish the hashes table GUID or don't reserve
> a valid area for it in MEMFD cannot support these hashes verification in
> any case (for measured boot with -kernel).
>
>
> [1] https://lore.kernel.org/qemu-devel/3b9d10d9-5d9c-da52-f18c-cd93c1931706@amd.com/
> [2] https://lore.kernel.org/qemu-devel/001dd81a-282d-c307-a657-e228480d4af3@amd.com/
>
> Dov Murik (3):
>   sev/i386: Allow launching with -kernel if no OVMF hashes table found
>   sev/i386: Warn if using -kernel with invalid OVMF hashes table area
>   sev/i386: Perform padding calculations at compile-time
>
>  target/i386/sev.c | 34 +++++++++++++++++++++++-----------
>  1 file changed, 23 insertions(+), 11 deletions(-)
>
>
> base-commit: af531756d25541a1b3b3d9a14e72e7fedd941a2e

