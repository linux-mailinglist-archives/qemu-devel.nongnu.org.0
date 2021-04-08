Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EA03588CA
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 17:45:02 +0200 (CEST)
Received: from localhost ([::1]:43730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUWq5-0000nJ-Ju
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 11:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Babu.Moger@amd.com>)
 id 1lUWol-0008RN-As
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 11:43:39 -0400
Received: from mail-mw2nam10on2070.outbound.protection.outlook.com
 ([40.107.94.70]:36032 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Babu.Moger@amd.com>)
 id 1lUWod-0005bj-8L
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 11:43:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EgMtenv6u/RIgxPcJcPZrfolFUQLQCBbyDSsLu7Gma0sdoULF6PZr0sNbBDw2HnRcwyUQ+U/oV9nYqrxb/4pfjl5sDnFuY9+GGfYe2aFiCAuAPS6pG6CybsFpp63/6JQnH1CbrNoUuYPf8h2Xb/xoioO6ucuq/COW7Ag3k8lQySZ9BRk0Q1vl/yeUEhnsWvWTqJ2OsqBLCYAcZM3cD2jJhcC3oC42i/OJ+Evs7CmHYf+N/HIlJK463jloS99zNEDJFpXxExPkpD6kYN67rjkX3Ux/K+ILityQdCQS/V3jMpUfw75mgf3vKFytHPoXfpRv7iaqc9zK+aiTUX7mmmoLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/ZQ7kljjCwYmyt/9ja+AgxWWcKuMLMEtnNdJ4KJoxk=;
 b=JPv0VHzijHj+YerTfeGdcST32Jb9YorT657xOeNDEwc51Zj7Rwslzp971+myZlJAElg7viHxZIPNdonvcu0WesUXLyjsbobNM3KqleN4Cql/DATAgSCjIZVbqCVTucJS731cg4XbVeVZCzmbyOFDMwFKXpf1eiHYHdV5MInIe7SwYIxCdIFOOMckd0uBI5grtJIiyw0evl9z3K5aGDnQzvnxlr4Ih8g2DzTHdrG0YwnmvXkc4tc8trMghloPxgKZ1yieWkAVZ5brNOF3fwHA78kw1SMS9mApEcJsbXQYCQ42JfMldNhBc7i1Qt99fSTm0SpDHGFKeZRM8I7QZ6auvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/ZQ7kljjCwYmyt/9ja+AgxWWcKuMLMEtnNdJ4KJoxk=;
 b=fOOnv59hNFTHwsIJ9mCX92+HkqKKHKec8uJY8RpTXzVze8GH6PYMv50CF0nk2UTH/ptiCaScNG7Og3Be5uVjgETuBDSXzfTDGiKiGQ2qDkg71owtH3lbriYh2fXt5r64xWMWgMx4cV5ALFftPSFl3tWZSatTC0POQcVCEokb06w=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2560.namprd12.prod.outlook.com (2603:10b6:802:26::19)
 by SN1PR12MB2461.namprd12.prod.outlook.com (2603:10b6:802:27::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Thu, 8 Apr
 2021 15:28:23 +0000
Received: from SN1PR12MB2560.namprd12.prod.outlook.com
 ([fe80::487b:ba17:eef5:c8eb]) by SN1PR12MB2560.namprd12.prod.outlook.com
 ([fe80::487b:ba17:eef5:c8eb%2]) with mapi id 15.20.4020.016; Thu, 8 Apr 2021
 15:28:23 +0000
Subject: RE: [PATCH v2] i386: Add missing cpu feature bits in EPYC-Rome model
To: Christian Ehrhardt <christian.ehrhardt@canonical.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <161478622280.16275.6399866734509127420.stgit@bmoger-ubuntu>
 <m28s74ky0y.fsf@oracle.com>
 <CAATJJ0KLga4V1vhyaAi9A6Gd6sXXah=RKo6PYEztgsjMmCHUww@mail.gmail.com>
From: Babu Moger <babu.moger@amd.com>
Message-ID: <8d472d0a-60c4-7d83-e91f-01c0b35a7429@amd.com>
Date: Thu, 8 Apr 2021 10:28:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAATJJ0KLga4V1vhyaAi9A6Gd6sXXah=RKo6PYEztgsjMmCHUww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.77.1]
X-ClientProxiedBy: SN4PR0501CA0058.namprd05.prod.outlook.com
 (2603:10b6:803:41::35) To SN1PR12MB2560.namprd12.prod.outlook.com
 (2603:10b6:802:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.236.31.136] (165.204.77.1) by
 SN4PR0501CA0058.namprd05.prod.outlook.com (2603:10b6:803:41::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.9 via Frontend
 Transport; Thu, 8 Apr 2021 15:28:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c8a8a55-987e-4e58-aa24-08d8faa2f214
X-MS-TrafficTypeDiagnostic: SN1PR12MB2461:
X-Microsoft-Antispam-PRVS: <SN1PR12MB246191CE7C24477E1A77DE7F95749@SN1PR12MB2461.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aJeB2nSpklXwQaUho8AWm3HLV1w1nRSnS5Ow21VY6Wv1y+Rnxj0S9aErARa/v9+8OATc6blMFNUEHFN/yIDs7/CXNwC81xAXccnMvAZ0iGyCtx5df7XJb/oMXRVsHsbR3nHb1Fv2z4Iq+L9Y5K0Y8d87yNdfvISPGJV7u/WqLVsk2q51334sasrtEMH/Bu565ikdHHKrOX9RfGs69y6Ax72Ml7tcUCwVisnQdtH4UxFxcJAID0Oo1/2NWVoyW7CvGbhWb0PljaiK7737bUso8oOinsTFmwaMr3CGDh08+mggKRRF6sP5UVgQLzWqC4c/lL4ftrdupLShiB0RAAT8jbKUKzpenUr6d2LjNKUeVXk5NVnxVmPVE0tMdiOnn0hj3RX+NOJxN3ev3nxcg7nOOJv/eHNVisapfuDj0ULT4mxMnLggCOQj+C61fMdwmK3fOFpoemnvRm4H5u/6Cpwod9TkCQsfEwLsj9SJzNPCUONgTGUm5dKyQFvFbnZFay34CA/Obn6vQtz+aajoTz8k4u26etBP756NLBpZNoc7ualvFHJ6NuXU0teGFDhrIb99S+aFFIA8TrnP6n2QvALaJybwep3wXvLDTluLlhlMW1LW4vMTU3vWi3iG/Uo8jAtIF/OqlHnlir7S2T/MERRjftSTTZT8wJpbml47T6zYyFbHYbD+3SJCzK+Jxj7rpOcGxhtJM6du1DKZSnYqlzpl/+qfEzm4tD/vWMZyOWgUqlkdToTGuYjqJGgOoAVcAJFkVXFMp+MS2s4AKq+p0GbhvzJHuBfQwCxo3deFqzfyzLeI4Jmf2ePo0zxinFMcxrtTXcI+OONG7zGoScb8ypYSEw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2560.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(186003)(16526019)(83380400001)(86362001)(8936002)(8676002)(316002)(38350700001)(31696002)(38100700001)(478600001)(966005)(26005)(4326008)(52116002)(16576012)(53546011)(956004)(31686004)(66556008)(66476007)(36756003)(54906003)(2906002)(5660300002)(110136005)(2616005)(66946007)(44832011)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cDJndldOaElNTnZ2OWhsVWFuK0c5TWxKeVo0ZUxOWm9UcTBVNE4zeFY0a2Rk?=
 =?utf-8?B?Y09iM3FRZ3V1dTdtRjZ4bVphcm5ZWWdYR1U1RjdRa1Rtb2ZaZWN5dldFVGY1?=
 =?utf-8?B?NVRTTjNxQU5TYVh6NUI0aTVUcDR2VXIxQ1h3MFNyQlpGaFNaTU8vNkFDTHpC?=
 =?utf-8?B?Y0FMcjRIbEF4dllsenVsdnA1U1B5UUJZYVk2VS9vaGVLSkVMbjNVM2g3R25Z?=
 =?utf-8?B?djYvUjFmVzYvMzZ3WFpkeStFOGFQS2lxMnNMNDZkVzU5V0xBVTA2eVZHR2lm?=
 =?utf-8?B?dmlMTEhFU0xvdk5Zd01IaXVCQXpmY3A3VFk0Z1FUVVY0VWg5dGFUT2JVVkZ6?=
 =?utf-8?B?dmVvcDRveGw2OGZZaU1TckxuS2JRb0FLMTNJb1N2V3FIT3d2UmhpNlREcDJo?=
 =?utf-8?B?RWREcDB5QjdyNXlHMzJ6TmpZeG11Ynd6VjhkdTdhQUN5U2RJVXYvQ0dBNjJK?=
 =?utf-8?B?QmN4ZHFzUSsrclZHUzk4NVpFb2tMNS80OGliNVZxMU5vNGd6R2hwUitqcnM0?=
 =?utf-8?B?OTA0cWdGekdXenIwamZ1T1Q5SkwxOUh6YWVDZHdubWcxSFNlTllsbHBCTWNK?=
 =?utf-8?B?NlhkeEJQVjhFMkZXRWE3U1AxekdDbmpkbmtUZGs5a2NGaTAwcXRBWVRmUU8w?=
 =?utf-8?B?TXFzK1dhTkZ0Z2hBcEFiNzJiNENCem1IeWtzTjgwZmVlSnlVckVoY28xYS9K?=
 =?utf-8?B?dHB4bEtEMHk4VS9zY2FJcWdoVmNEVWw0NVgrR2ptZ1g2enQ0OHZRWmVockZZ?=
 =?utf-8?B?ZWZNaVJzeDRzcjV3VFByWHpqSUc5WTE2dS8wYlBpbzd2N2o2cHlzcjM3VGlY?=
 =?utf-8?B?cVJsS3lCZkJZMEhOYUhnWVNnNDIwN08weElDa2FwNkxGSWZ3NFNFa1g3b1k5?=
 =?utf-8?B?VVRHazVXbUpjWGxDUVVLcmNrem9KeklQQVZrSlVTWm5ZaFkrSGhaQkJ0czA2?=
 =?utf-8?B?QWpDTytuQ0FrNmlaUTl4RDFjaGkvL25La3N2M3hadHhTSHdXb1pJK2ErWEFK?=
 =?utf-8?B?UXBSWnpYbURXZUdFdFZ3OVNjS0ZYYkUxU2dtZFE0U1dUTTBQVHhDN0F4UHhW?=
 =?utf-8?B?MUZ5SGN1NGg5a2pya0kvUTRYa25PWGFCb0ZnamJpTzZIdHZUVVRYZ3NCRDRj?=
 =?utf-8?B?ZExuTGZ5SUhmeW9SclYxcWlvUVNLSHZHc2UyRGFzeXNOY1NEaWtWdVZiWjBN?=
 =?utf-8?B?d3ora2Y3cnhldm9vNiswSFFLMlBGR3hlSTlEZ2tYY1RQaFRRYldXK3QvanNM?=
 =?utf-8?B?Q1F2RlYrLzdMYjBhdk1ibG1tYTlnTjNNWE0rbVowUGlsMnAyMU5KZ0RzaGRp?=
 =?utf-8?B?eU9KNjNNdjV0Nml5OVBRODM1bHQ1Tmg5clliQXlzQXByL1p3MkJIMk5LZm9Z?=
 =?utf-8?B?SVFsdVFUbmJjcEI4cStQazk4NTRJZEVVc0d3MTNhMldlYzY0ckZMemljOU5Z?=
 =?utf-8?B?NkVqbG9HSVk3N2tHZUxhNGdxNmZVRDY0Vmp2akZHNy9uOUgrY2Z4Ty9JWU1w?=
 =?utf-8?B?Sm82Z0FlMm13MjYzb0dCWFhzYjRWSjRNSnpic2VrZUF3NFZGa0ZxUklEQ0dv?=
 =?utf-8?B?c2dpNFdpN3MyMWpBZnpCQmVwR054aldoR0JRd0lhWHhxaEYvWkRYeThMK1dP?=
 =?utf-8?B?ZnZQRUxOMzFZdXlFVVNIUE4vdWZHUkdoZHZlbG1neFNzUTh6RFYzdWgwSWNz?=
 =?utf-8?B?TExBWVdQQzh4UE4zSW43bTlpY2RzNmZJR0I5eGF1RTFvVlpFQ0xFWndtVVpU?=
 =?utf-8?Q?W2vpULpvDPdqHRqe3gP1iPD+g+luwQ8eQR9sanh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c8a8a55-987e-4e58-aa24-08d8faa2f214
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2560.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 15:28:23.2358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 25CyNLcdkY3B0aA0bP0f17EMcYRCuJXrXRtHWqvdVsUhj01aEX7zo2JqXM2+C19X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2461
Received-SPF: softfail client-ip=40.107.94.70; envelope-from=Babu.Moger@amd.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "david.edmondson@oracle.com" <david.edmondson@oracle.com>,
 "pankaj.gupta@cloud.ionos.com" <pankaj.gupta@cloud.ionos.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Christian Ehrhardt <christian.ehrhardt@canonical.com>
> Sent: Thursday, April 1, 2021 3:06 AM
> To: david.edmondson@oracle.com
> Cc: Moger, Babu <Babu.Moger@amd.com>; Paolo Bonzini
> <pbonzini@redhat.com>; Richard Henderson
> <richard.henderson@linaro.org>; Eduardo Habkost
> <ehabkost@redhat.com>; pankaj.gupta@cloud.ionos.com
> Subject: Re: [PATCH v2] i386: Add missing cpu feature bits in EPYC-Rome
> model
> 
> On Wed, Mar 3, 2021 at 5:24 PM <david.edmondson@oracle.com> wrote:
> >
> > On Wednesday, 2021-03-03 at 09:45:30 -06, Babu Moger wrote:
> >
> > > Found the following cpu feature bits missing from EPYC-Rome model.
> > > ibrs    : Indirect Branch Restricted Speculation
> > > ssbd    : Speculative Store Bypass Disable
> > >
> > > These new features will be added in EPYC-Rome-v2. The -cpu help
> > > output after the change.
> > >
> > > x86 EPYC-Rome             (alias configured by machine type)
> > > x86 EPYC-Rome-v1          AMD EPYC-Rome Processor
> > > x86 EPYC-Rome-v2          AMD EPYC-Rome Processor
> > >
> > > Reported-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
> > > Signed-off-by: Babu Moger <babu.moger@amd.com>
> > > Signed-off-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
> >
> > Reviewed-by: David Edmondson <david.edmondson@oracle.com>
> 
> Hi,
> this change/discussion seems as it was good back then but I realized it wasn't
> applied in git yet.
> Was there a different thread discussing what holds it back that I could not yet
> find?
> Since we are already in v6.0.0-rc1 the window to get it in shrinks, so I wanted
> to give this a gentle ping.

Eduardo,
 Do you have any concerns with these patches?  It is also fixing another
problem reported here.
https://bugs.launchpad.net/ubuntu/+source/qemu/+bug/1915063
Can you please pull these changes?
Thanks
Babu

