Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CF43B8369
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 15:44:53 +0200 (CEST)
Received: from localhost ([::1]:44704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyaWJ-00049c-V9
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 09:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1lyaV9-00035n-4T
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 09:43:39 -0400
Received: from mail-mw2nam10on2061b.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::61b]:50272
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1lyaV6-0001yP-DF
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 09:43:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RawC3HuzR7mZfUd/ToHXTL/M96WQ5vA6H9jbJABQsmbOs34n4u/Ndg+CDClVvkuQvupkXsui770XV2sYe6c/HY+Qx084hI0xGy1IfnuvHyM8eCuGf1CPKsv5vsv+n/o+uP7v1pKamoKPdNUYXcYUZhRFMY5mi6FXRg6nYP7eMBwydwxoG/h31rXR0MofDi6ddmYUpnP4E9VUa0cZaBP8XSyWfMZWgWjMuIADLMw4XRmqYRUddeiVe7fMv3SKgNzd/FukRPzVyOY1FJE9guJuBW+D0Ytq1zf7N69cJX4QdRsxEDA7QANI9mLk1lcR1RmSE54SN4qM/ALCP01B9UoXBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/TNpq1+PUttZS1Hr2aeAGqZUZmEhfKuIx804s0OXoo=;
 b=BlQ7U6erXKPNs1Ag/cRFWbQIZInD4496umbz4SxOQ9LaQbUlSSJdLo/sEQD0/e3zQtAIGjAWtutfKIZJCrrIgBsCX1q/GP0UQ4FohLnD0Pq0+n5owOIDv96aH6m71vP8LAE4jTmXOQngrgKasL/WlBulD9Zt8dMiVHUiA0QcNe1JwptFwUbY3D1OrVj+ewj8c822jig4qpNsucEL7Kpz5dGQ3TxRh5hbp/OWe5Bx+4z/qax5DEhj1TLcr6Fg1iTvTzuZqkpyyMqIRw0/EnmnNo74qC4wbFai4pxhVka4+5nzo8lOwKkN5It2UdKjTYn+5XNQnbnjBzJH6snGuoqPqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/TNpq1+PUttZS1Hr2aeAGqZUZmEhfKuIx804s0OXoo=;
 b=UszyyYfMIdp+VOTKnX1NInUfqksMpHPGtrRJDs/tr2eprOQm1CQdVXb9tIkxviTJoCO+api0XSivZM+NQOLMv47CZCqmQnaPr3UkVdkA7MZMhSLqDagajaLhVxVWoU5vtqEeF+sj8OgcdGmIS0N/B8+wQ50DTsy4nDmq7O3cLYI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1355.namprd12.prod.outlook.com (2603:10b6:3:6e::7) by
 DM6PR12MB3468.namprd12.prod.outlook.com (2603:10b6:5:38::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.23; Wed, 30 Jun 2021 13:38:30 +0000
Received: from DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::6437:2e87:f7dc:a686]) by DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::6437:2e87:f7dc:a686%12]) with mapi id 15.20.4264.026; Wed, 30 Jun
 2021 13:38:30 +0000
Subject: Re: [PATCH v2 1/2] hw/i386/pc: pc_system_ovmf_table_find: Assert that
 flash was parsed
To: Dov Murik <dovmurik@linux.ibm.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20210630054625.3424178-1-dovmurik@linux.ibm.com>
 <20210630054625.3424178-2-dovmurik@linux.ibm.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
Message-ID: <563e4b65-b120-3232-cbe3-74299da6c351@amd.com>
Date: Wed, 30 Jun 2021 08:38:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210630054625.3424178-2-dovmurik@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [67.79.209.213]
X-ClientProxiedBy: SA9PR10CA0005.namprd10.prod.outlook.com
 (2603:10b6:806:a7::10) To DM5PR12MB1355.namprd12.prod.outlook.com
 (2603:10b6:3:6e::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from office-ryzen.texastahm.com (67.79.209.213) by
 SA9PR10CA0005.namprd10.prod.outlook.com (2603:10b6:806:a7::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Wed, 30 Jun 2021 13:38:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73c9c561-6dc7-4054-877c-08d93bcc58e2
X-MS-TrafficTypeDiagnostic: DM6PR12MB3468:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3468E2018F23989F96973D50EC019@DM6PR12MB3468.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q8tP9rpTehxUF+//PlnE2EWhhAx4S4m/Wyj/3V/4txi3w+CA5PRmmv6cQpcsshKGHVz4Gexo9qqGT18Pie2ih94afCFL58ZPEm6UTTTF9O+iBzgdbvxZhy+4UQVp7mPjcq7kPvtIoJEkRF99ztI8XA8gDsnt1HIm1Z/oR48EiDgEJjo7L7v27QrIubKz/Oor1BD7es4bdNAFax32wUpPyd+GxsV3WRIDXz30UfWrJLPyc3pT4TERP69Oqn4Xy2F6vgR0wlPMFVQzZrs3u0QV52Cq6mws3Ob6Lteyhq8vtkZz+ggevrElzrPSC1n3zr5dSdVkomCQrqysZw+ZXK/ff+6J0mJ3aGHeH9tD4TSAi6nrjSAIE0xGZCqNftPCDMl8sW5e4yCvbz+F9lr3dcUZ4sx7fFvzVXrVWCB6b+m47xvkhHOgj3X8bXIQHWojTF/7eZtQat3iqSQxKXluhxfDRrA4Tv5GKmSTyMC71rkOU3WPjnKaUHXxe9zhA/qAUH8bleGNmYNLjIjUZ+dmYZDak4Na5Egcu21OGAfbdUlt4Vykbb7vr01zHQLtakAeYTVKMSKu4iEoOaz8TlkNW0+XOIN6IppA6CGNH/vo2cy+PaIGZnoy985zd6UdWTSR2R4LbZyWQSy3HLdFd7GuWvWzZJLzfDU5HNeYbTRrnqdoQIERR4E+f4tip11qCxnbelhOYrDR+6EnqffHDp2Z5q8Tq4jZAaf/Xcw1qIWNTl+vU7E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1355.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(83380400001)(36756003)(6512007)(53546011)(8676002)(16526019)(956004)(2616005)(26005)(6486002)(186003)(38100700002)(31686004)(2906002)(4326008)(5660300002)(66476007)(66556008)(8936002)(66946007)(478600001)(31696002)(86362001)(6506007)(54906003)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXNaK056MWp2dXJibVBBYy9Jdm1nb3JtanQ3UDRYdUg0eVNJNVViR3UxQS8v?=
 =?utf-8?B?a1BNdjJaQXJnR1Jxc1lrNlE0b29oWG5OUGptakdNaDFSZ3BBdldNeE1uUlNh?=
 =?utf-8?B?d2EzYllGd1dySWtvdHhubm1iSjVNck50SXJxRklUeC9Hb0dpTG1QaFFkOTNK?=
 =?utf-8?B?YmlPWEpWSHBVRVRIc2dPZ0JFVVlPQjVJSnFkTDRmVHN4ZGlhZWt5aDhaMUIx?=
 =?utf-8?B?eDRJeVlmV21LbzJFRDkvU29PWmd4cFJPV1MxNFBJU3FndG5PSmx6WWdTZzRK?=
 =?utf-8?B?R1JSeEtFSnNhcXdGSzFUaGttSUZMaGVSTUZPMmpRWllaQ2xzZUQva3FyRVNX?=
 =?utf-8?B?cURLbUUxU0JpdGdvcmxrQ0V5Q01hV2lONUt0RnI5TmdvT0FVM0FVeHJmdlFM?=
 =?utf-8?B?SEhDeVpUWkJEY0tYU1hKRXRJUTRtS2x5a1RCN0ptdXRPK2E1NUdTc0pWMWVu?=
 =?utf-8?B?Z3NZdTZLMDhMMkZ1MSs4Y2pVdjBvc2gwc2F0cWc4RFNmTnF1elB5dHFYbmNV?=
 =?utf-8?B?LzFGUjhWd1JPaURkUUlZMWtoSHZmRk9SaFpTK3RGV3Z6YTRvZmMrN1FJREZn?=
 =?utf-8?B?TW13VE5CVUljTllrSW14Q25HK2IwalpWK2dKR2dBR29TMVRDRGx1TVNWRGZo?=
 =?utf-8?B?YlZZSTJFZnZHdDlZN1ZITTVmT2VjTzB5MGZ2NDRJRkhqQkJRR0gyS0lyWFcy?=
 =?utf-8?B?eGtNblBTNEIwMzhkVEFYRnBjbThoeEVJQ1pyeWMyb0xEM1JQNTJiblQ1clRE?=
 =?utf-8?B?UHpEOGpVaFQ4Z3FpR202cWtoU0hScFNzYnJYdXlENEZlbzlJYTlSWit6RlY2?=
 =?utf-8?B?NG5qRk9LRGxsaHh6MTZoV1JNcVgvQ2s3YXhXL05NM3lySTQrUlZZMUlFaGNn?=
 =?utf-8?B?NUorY0dOL0ZScXJuYVB3RUlKSWl4RDNkL1pNUHRDZVNndlV0YUdvcDZFbGlX?=
 =?utf-8?B?Q1pCZVBnUXpqcEp5WE5ENXZsMjRBQ1VEdUFGTlBBTGhMWW8wajFqMXNmKzlj?=
 =?utf-8?B?bE50WmFNWWtBWGhrTlp5eWJub05jTTNuRHRhOHZ5QTltL3g3MjlPVUR3RWFy?=
 =?utf-8?B?MXVKZ2JIOTFMNzVUcTgxUmEzTEEwSW5vZWRFMjNWTDlTUmRaSm9LVnE1K0I5?=
 =?utf-8?B?aEErbm5tLzdTMW5LQ3JiN2doL0ZkVHFWeHdYTWIxcTRlQUpiUHdPMDMwZHdW?=
 =?utf-8?B?QlVNYTJUSkNJVytKYlA1QzYrc0NYa3FNMFJLRjZhRERLQU02d200bkRrTXRs?=
 =?utf-8?B?Tm1YNkl2bENmQ0dveVYzSTlKMWY5bnk2bThSMlpZNnFJRjVqa3R2NksrQlYr?=
 =?utf-8?B?Tm93Q3NPd2ZGak1LOGh6WUIxdG1XYnFDWm85ZTVjU3JreTRCRzNxWm1qYjds?=
 =?utf-8?B?dGtUNXBEbUoyZ2Iycjk1RytmSGR1MmN1c21JREtkdTJLTHZCb0dqMG51Y1pl?=
 =?utf-8?B?ZlJRV2V5ZXF3RUZuenFQR3hXckpycHg0cVZRaDdTYStxWWtBYjBPMlpZUGFz?=
 =?utf-8?B?QW5ST2lqTG9NRWpuY2V2TUpjRmxzdzdGem1oeGcrbE8wQ2pHN3JCWGVMc0I3?=
 =?utf-8?B?SXlqRFdHWktyTEtTcDZ1TkNqMDR3SlVyQWpmY2FxWEt1MWswcjVKQWJJcFVy?=
 =?utf-8?B?SzVCNGc3QWdmUjhESDY3Wm40dXVzRENZNVJwZzlHcmtsMi9NbGtMZFZFeTJX?=
 =?utf-8?B?SzZTQjlUazdRS2hWc2Fnb2ZMMllwOWtzeGNJRUdud2V2WWZsdkdiQ2tGc3hB?=
 =?utf-8?Q?yS7yk45rN1vAOYutE1izoe4pRjMTu/c8i+3dFLQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c9c561-6dc7-4054-877c-08d93bcc58e2
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1355.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2021 13:38:30.2202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rmh6IYgJopsDKi5qN7297c1WzbfCYzW79YoEkjCLAVC2oNWKZhZG2d7f120S4kNM/iWdNSm43qrPeVkycBisWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3468
Received-SPF: softfail client-ip=2a01:111:f400:7e89::61b;
 envelope-from=Thomas.Lendacky@amd.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 6/30/21 12:46 AM, Dov Murik wrote:
> Add assertion in pc_system_ovmf_table_find that verifies that the flash
> was indeed previously parsed (looking for the OVMF table) by
> pc_system_parse_ovmf_flash.
> 
> Now pc_system_ovmf_table_find distinguishes between "no one called
> pc_system_parse_ovmf_flash" (which will abort due to assertion failure)
> and "the flash was parsed but no OVMF table was found, or it is invalid"
> (which will return false).
> 
> Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>

Does the qemu coding style prefer not initializing the bool to false since
it will default to that? Otherwise,

Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>

> ---
>  hw/i386/pc_sysfw.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
> index 6ce37a2b05..9eac36b830 100644
> --- a/hw/i386/pc_sysfw.c
> +++ b/hw/i386/pc_sysfw.c
> @@ -126,6 +126,7 @@ void pc_system_flash_cleanup_unused(PCMachineState *pcms)
>  
>  #define OVMF_TABLE_FOOTER_GUID "96b582de-1fb2-45f7-baea-a366c55a082d"
>  
> +static bool ovmf_flash_parsed = false;
>  static uint8_t *ovmf_table;
>  static int ovmf_table_len;
>  
> @@ -136,10 +137,12 @@ static void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size)
>      int tot_len;
>  
>      /* should only be called once */
> -    if (ovmf_table) {
> +    if (ovmf_flash_parsed) {
>          return;
>      }
>  
> +    ovmf_flash_parsed = true;
> +
>      if (flash_size < TARGET_PAGE_SIZE) {
>          return;
>      }
> @@ -183,6 +186,8 @@ bool pc_system_ovmf_table_find(const char *entry, uint8_t **data,
>      int tot_len = ovmf_table_len;
>      QemuUUID entry_guid;
>  
> +    assert(ovmf_flash_parsed);
> +
>      if (qemu_uuid_parse(entry, &entry_guid) < 0) {
>          return false;
>      }
> 

