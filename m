Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B976B9880
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 16:06:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc6AX-000895-Bf; Tue, 14 Mar 2023 11:02:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sandra.loosemore@siemens.com>)
 id 1pbtk1-0006h0-PN
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 21:46:18 -0400
Received: from mail-bn7nam10on2069.outbound.protection.outlook.com
 ([40.107.92.69] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sandra.loosemore@siemens.com>)
 id 1pbtjz-0004uA-Qj
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 21:46:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jmgWDg1uVgzWk7gYjRWx9AEC7v4z8XxLodaXhuMWHDH2vVDKUPlfS5wbl9Goij10KHtpsLRwJ5G5xwlNnIR6DtyyjJxrCPYpbJm6gWadLRhRs0Tl0Fwx47HPGbqpfPe3QVsglcyhD8xHUpHAKkmtlSGH/IySiJ2xP4wBVu8V3pvd0n1+am9XDh8a1dCm7dNArX3+0w3s4hUgr0Rn2dOUhisK7GBBe7+1gHKGBrK8W2eSdz+k0eMyIQrjz6kAvG+kKdFNIA4pnoCnjXJxnvuuVZM9413O5/FdbVCERp0WpgOzqtUvqYWp6NK7QTPTNKAAxGi63twDv4+0zwIJdVGZDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=espNX4YlD28GKmwZPhiIvS2+N71Xy1xIe6uJn68Zj2s=;
 b=XZcivCAhP1ZDqh4HK30ZfjiD+ELiT0H4itzthpDrqcImeKGRZd1hTf//TLOwtWaGphe9hJuTz4m/DSf7ahgM9Jang6zVYNoy18luhR/x6TbqX+bJBBInwhY3USX+YJkUc42PXCl75DLmR0XWDSGAKfI41XPiighjng5oa9OmKJGzKonQKbs9YX8Rm+TJAyEURL2asH+kW39DKvBdsmL0vxWEM1VUU4zvrmH9aNqHQATgSoWYmK0fw+Jm6vSravuSnLZ6yrz1KMPcopI/5VzD15GLAXUWuGa3Mli7yPCljpPyzB0WbTp932/ds0y92tprIrsWq/cGU2oxA9LuiTXVXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=espNX4YlD28GKmwZPhiIvS2+N71Xy1xIe6uJn68Zj2s=;
 b=wtXICDR6TORul+1BMH7uM35Moihe+Ep8qwae4+F7ty025e1V3PFCSlJNsOVHh7VMmLgT9R5l+cxioO0YScyghnibCkQeFr2bfrQSddacgKckIpZzIwj1Msc/UEcoOF0zEaQVVcc9R0Dzq7k08aXTXx8SBfjm5sGT7DVF0gnxrCqCmZFEFbjsHnOCA0uLzuDC3MxrCbjxWMbJIjjURpfpP0Ase+ndjCDcIfLAxIIK6mxTiVeeD+17BGTlFYdJMpQSybmXQa2aBTiN0rbMzb8H6eqwhkMmTACrS0uDQTStsux9Gc/J7jEh7k+J2s5bUBIhbLPzI3xKYjRon4iUfNkGaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from CH2PR07MB7222.namprd07.prod.outlook.com (2603:10b6:610:ab::21)
 by PH0PR07MB9363.namprd07.prod.outlook.com (2603:10b6:510:16d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 01:40:58 +0000
Received: from CH2PR07MB7222.namprd07.prod.outlook.com
 ([fe80::5241:96f9:a640:6b29]) by CH2PR07MB7222.namprd07.prod.outlook.com
 ([fe80::5241:96f9:a640:6b29%3]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 01:40:57 +0000
Message-ID: <6c73e5ad-897e-de93-8177-d7bb93c6c5a4@siemens.com>
Date: Mon, 13 Mar 2023 19:40:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] MAINTAINERS: Mark the Nios II CPU as orphan
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Marek Vasut <marek.vasut@gmail.com>, Wentong Wu <wentong.wu@intel.com>,
 Sandra Loosemore <sandra@codesourcery.com>,
 Joseph Myers <joseph@codesourcery.com>,
 Julian Brown <julian@codesourcery.com>,
 Andrew Jenner <andrew@codesourcery.com>
References: <20230313183352.274744-1-thuth@redhat.com>
 <f3201c0a-8ac9-0147-ccc5-fa8195607b6c@linaro.org>
From: Sandra Loosemore <sandra.loosemore@siemens.com>
In-Reply-To: <f3201c0a-8ac9-0147-ccc5-fa8195607b6c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY8PR12CA0038.namprd12.prod.outlook.com
 (2603:10b6:930:49::26) To CH2PR07MB7222.namprd07.prod.outlook.com
 (2603:10b6:610:ab::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR07MB7222:EE_|PH0PR07MB9363:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cd61ef1-3818-41d1-4a6a-08db242d2877
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ADdO9EzH63LsZHICSADLSe0ynJQXDlf+bU+kVa39awtfukn08V9KNVCkLLW0O1HAe7eqTXYEq+LglwDvu0Bv5hNjyzCL63P+zIljEW+BPiVoJ2tDK1yjoiBPjUPxnCpYVQPMC/CNdMHrVpfRXxRKcIRBLEygn/wWt076Z5mHBK26cAJ3PRbXlkqQlIMFAIKktDDOIOZ3+GDmBvjMRFx+tnBFAtG/X6yTtJhLCWDrk6vojYmat7y3YJ5EXtg01ZxHKHIRFOWKy6sgeXbjOjwAgMv/WdZWM15aH5Jf2H4eH+7IqrElLfPDWdZn2cx+kiyKp48W+DCRZCXcdjbCI45WTIIznVm3B4cN1Ps9IMKc/Y3WWkgf+L28bjeYEjq+luh3HdD1/ML2iYVU0tjP6/rKO4rlCueUPkMF2gcbKj6JmSp0W2N6bkRUFCI7951nUCTcnGRcpjb11R38ngbAvvEkU71G4/dsjXjztaHmWVkZFkeef4io5qvkNxe+mL5mlN4uPk2MZ48QE0BdJfC6izDtxSx9pHnJ6vRcVW56WEjvtcuERJEbFLkUgenFGsdvUkEtbpIvdgEd5nt1N9e+2OSRr1IkI1Ob3L062Xz5bXurhbn07s4kIln4oz6UNuj0tZBQVs0Tk35Bzd/dTie158ZxWfCdXjJT+grn4ktjEKxIB6ntjqujDh/7hOJU8Ac2DMP5kvg1nikdFQvvmnEWo5KXnnHS0WHWHBsizs5+89rDT3M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR07MB7222.namprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(451199018)(31686004)(54906003)(110136005)(36756003)(316002)(186003)(86362001)(38100700002)(31696002)(82960400001)(53546011)(83380400001)(2616005)(6512007)(6506007)(26005)(7416002)(478600001)(41300700001)(6486002)(5660300002)(6666004)(66556008)(8936002)(44832011)(4744005)(2906002)(4326008)(66476007)(66946007)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHpTT0tiZ29pOFBHa1dOTzZHUXlMTllMci9nSnZKMkZ2aHlxaUF0ZS9LcW9a?=
 =?utf-8?B?TVlNL25kMVdGU2FVTDVPVjFtNW93V21ZSkRYTVI2dDJQTTZITnFINGtxVVV5?=
 =?utf-8?B?UU9mUnU2VTBGOThQbzNGKzNVL0IyU3dzUEZaTWVtdU8zQ2duSXFyNlBMaFZN?=
 =?utf-8?B?dUJDVFBGTTF0elNzNWFOSWUyVmVnbTNzQ1NwN0s5ZzUvT2k5aERPcThSTEFW?=
 =?utf-8?B?OWlnMTBObWdDSWVVSzk2Uk93bXFhRFhROHI0ZUtZTFNaSTBKblFCVWdzaVR6?=
 =?utf-8?B?bEdzSkFLMTVNZzR2emRSVVhiajk0ZTFmZi9Ea2h0TEtsYzJiMGFkNExGNVlC?=
 =?utf-8?B?N1ZLeXhoaTdOaWF4ZU9hSkZPY1ZCTUo5aENpc2poZFVvTXFjV0hVS25QMGx3?=
 =?utf-8?B?eXl6bVpwT1oyZ1NGb2l5MWpGd1ZTVStWU1BFWFVtRDdMNHFnd29abTNSTy9H?=
 =?utf-8?B?bWRoTkRjVmpYYytIcUE3dmpVT2I1aWk2bXBLd1JZSW5HM2x3ZjdlcFB0WXd0?=
 =?utf-8?B?WS8ydkxqMWYyNXlmNC9mSGdkekpDYjNYVzdXL1dXbFRub3BKbkwxZzEwYUEx?=
 =?utf-8?B?WXpDQnRPM3lhMU55SW5FNnk5aEZobDg2TGtZSUQrVFV1SUdmdExnSUdjS3ZM?=
 =?utf-8?B?S3VBZkVxdWFjQjBBcDVRbVlidmk4b3VIZ2RoMStDczBiTEJLUkdhQm1yV2Uv?=
 =?utf-8?B?VDFXZTBvWlBvSnZYVk9HY0RBc3NLSnZBS25CejZNZ0h5U2s3SDlKd1Q4cHdy?=
 =?utf-8?B?MStMdUpud2FtaVYySzJyeS9XVUFRb1Q4L0V0UEU0dmoyVEhOaTcwZFoxdUw0?=
 =?utf-8?B?UTV4ZVg0eEpjSm1pUVk5LzI5bitNSGVCNERxU3Y0b0lUcml3dXlVdlZHbE5T?=
 =?utf-8?B?SGFqbGNod0laZXpUWVp4MGZiQkhIS0JuYS9SYlUrMGhTMThRT3hwTmVrRU1s?=
 =?utf-8?B?TTB5TDI3MkJ3eU9qRDU4S2loYWZ5LzF2NmxIWWVSQ3JNU25Gb0JtQzlrZjRr?=
 =?utf-8?B?a2lBdWZ1WFhVLzF5TVU3VlQzaG9kVWZEN0s3Y0dnZzVMaVZGc2Ywck1oNndC?=
 =?utf-8?B?b0doVTBTNURHTjJGc1dLdmtrVHJZVm8vdU1CUXhQbUlmNThXaWM3LzIrQUx3?=
 =?utf-8?B?eWVkR3BvbXFqQUFLMVIyRGlEREpKSzdMSjZlR2NRWVdQMVBpenRkd1A4S0gy?=
 =?utf-8?B?S1JxSVhFZVkrRjRHeS9kUnd4Q05XMVlpYnlIWVlCd1oxZW9sbzY5dFptMk1r?=
 =?utf-8?B?YzM5MFdsSEE1QTIzYmNXSzZld2NZSzJoa1gyRFRFOXRyK3RFWmc1ZThUWDFD?=
 =?utf-8?B?aTBNWURtYkh6VERXNzZMQ0RhSGZ4Um9MZWUrK0ExdEFWV3NHWjRSVEtTcG95?=
 =?utf-8?B?MHBTay9IMjMyL2cwdTFiZ0R5bnltLzRQbXcrQlczR0R6d3RGcHlFVkRVakh2?=
 =?utf-8?B?T3I0bzFiZnhJT0YwWGxUbldHUnBscjBPMHNqUzUvaU5XQlpyeGZlbFNRcTM5?=
 =?utf-8?B?ZDU0N1ZnUEd6dlhKVVAxUUc0UDl6dDI0Q0JwS2xtUzJBL2pwTHJOTk5BSXZn?=
 =?utf-8?B?VWJoNTFaZW1GT2pTb2lvN2R5clFjSThRaTFBZ0tldm9vVDFnU0VtdXFlelBs?=
 =?utf-8?B?S0lpc2xubTBkRHB3YmVRSFN2WWY0UmlSQVBGb2lUM01vd3kxdDRnMnAyZ0Zh?=
 =?utf-8?B?Zy81ODFWaDYxMERBcFZQSENTNG9nMVNQejJFeXoyL2tZRWtObVpKL2RZZjZa?=
 =?utf-8?B?bGtjYzM0MklzbHFCSjVuSWYxV2lTZmNmTi9oU1JqMkxiaFF1OHhITEd0azFk?=
 =?utf-8?B?UjB2bnZuM2I0cHFzYXkyQXFuTkI4VXNEZzRGSnBEV2hjd3VPcEF2WUNTQU5X?=
 =?utf-8?B?T2hHNXhWYTNwRldyenBjQkl6dVJpWlZBMlhrc3dHU2loYWtlZk5RdzdyNDU4?=
 =?utf-8?B?R3pmZzdnVWZCSDhrdUZqLzBLbnJubEpUeE5mVkdpTlBTUWNPanlYV0JRSmR1?=
 =?utf-8?B?enlvbzFWSlFYOVdoTGg4azNsaHNRb0VpTnpkalpHNFhHSlJqbTJjMS8yKzI4?=
 =?utf-8?B?YmlUcW9sVXNrTzFPWDJTVlpRSzdPSzdMRXJyR1N3a1k0WGhGL3NGM1BNQWNl?=
 =?utf-8?B?a3JrZnBNNHlON3didSs2WlNOL3VIbFg0T2VaWm84NDVXc3FzQ2hCWGd3djBU?=
 =?utf-8?Q?dc9t5xfyuy2Un5/Ewpzh6nU=3D?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cd61ef1-3818-41d1-4a6a-08db242d2877
X-MS-Exchange-CrossTenant-AuthSource: CH2PR07MB7222.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 01:40:57.5966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8xC1A2EjtopNvTdgdw0JtC5tSgbYPE2cmXWyR4s7SAwgoGm7XJpfKqF0+8llUESROZzGLEe5/tgxIQqaCY9T+yMx19t7vjtq0hdQ9QvswPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR07MB9363
Received-SPF: pass client-ip=40.107.92.69;
 envelope-from=sandra.loosemore@siemens.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 14 Mar 2023 11:02:22 -0400
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

On 3/13/23 14:46, Philippe Mathieu-Daudé wrote:
> +CodeSourcery folks
> 
> On 13/3/23 19:33, Thomas Huth wrote:
>> Marek and Chris haven't been active for Nios II since years
>> (the last time seems to have been in 2017), and we've got
>> unhandled severe Nios II bug tickets in the bug tracker since
>> a long time, so to avoid wrong expectations of people who are
>> looking at the MAINTAINERS file, it's maybe best to mark the
>> Nios II entry as orphan nowadays.

Thanks for the heads up.  We're still maintaining Nios II support in 
other components like GCC for now, but I am not sure whether it makes 
any sense for us to take on QEMU too at this point.  I'll raise the 
issue, anyway.

-Sandra


