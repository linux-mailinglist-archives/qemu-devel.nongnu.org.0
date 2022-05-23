Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E736E531537
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 19:21:55 +0200 (CEST)
Received: from localhost ([::1]:36582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntBke-0003yA-PQ
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 13:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1ntBhK-0001GP-UD
 for qemu-devel@nongnu.org; Mon, 23 May 2022 13:18:26 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:54792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1ntBhH-0005Ks-GE
 for qemu-devel@nongnu.org; Mon, 23 May 2022 13:18:25 -0400
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24NGnNHN007266;
 Mon, 23 May 2022 10:18:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=uHJ+iJMZMvZiXE2CA0f27K2sQbVkQTszkalB2xQaMdo=;
 b=0ekQe8/131CRFapUCQrA9dc1+xwMWiH6yswNvDKLzxibQ74hkde3AZmXpqnRWUr5f63W
 TmlIzmuIfBMjy183HNtElYdbBzyjcBU6Wfdb8vtD2Q9QvXv9P/+e5nMF0LvH5NjL66/s
 EXrm425cF+1CAo2GXRuaFOKqoB02DmNDxULRGA+/E/+aMbEgpaofiQ3SWZr8lj8YhR3P
 vjAZh/nKr5eJfZQWtgVbHsgCz3ib1upJ0ZA33MzCDSZjQgv5ZM8ZBmTDn5GUjIR3HQKp
 AzToBUltqygiTqu/LD51EreiAKFRirjKrbPIQTYBOJ3Kdm/jPC9Xl+x3akT3qIwGXqaK Ew== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3g6v06c09b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 May 2022 10:18:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JWs0bvXDQmIg2eR5Fe1EDbEuCklvD/oER9MCK1HyncIje2di49oKyyMe7iFWjVCyCvhUCRpPXjdvty5j4NZ5D5Y8DTjNpuVm+/NpKF3m4rzq+1Cdzs9eTY5gQEk/ZK4Ru6eScEslpHdMQiTdIDH87E464KRek9NohQBAeagTjvd9PcyfEhNaanblx1w3xxrsRn/4ocmS+WF1e3T4jaa8J5DIV4hTAQnDLLz39inFxuD4lGBw/AK+wwrvw8MdQWzae1fH+EnxTd9S0//tz+LvkO1pP/OPMLvwORFjuknOzDc/L31tRA9fiVs5CB2BTn5r0bNr7hjHykh2dmwL8C9ytg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHJ+iJMZMvZiXE2CA0f27K2sQbVkQTszkalB2xQaMdo=;
 b=HS8wDa+tmdUYO6DbhhiYyanPqWxMBRN1z3/USsTCzrJhh+EpkIDx8YnrJqHbGr5ZmKlX2KrgGkqJyaCiVRQ2ONqn4bCMzf4njubZgSnuIIwqyJDWKtAJAMCBIJAjC8pWs+WROdinibkfDn2k2wRUvbuxq3FqoDIVh8XZx6D3NF27Nb1GqkxNiyzCgLO6EDf7xAJR60WoPY6B2yXsRjgvn3Cr3BU0PaGmgRMnadVPtqdCgMb+d4/z+2CfqSJnn49EdpyGtZLSX2+0dVg89xdSo6zADKwD053sPTEjhGgvnsplv7pTVk7b3re9NAokE3/xTRlOVK5hzItu1AGkMwZpPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by BL0PR02MB4772.namprd02.prod.outlook.com (2603:10b6:208:52::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Mon, 23 May
 2022 17:18:18 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::7ded:77cd:1553:412b]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::7ded:77cd:1553:412b%6]) with mapi id 15.20.5273.022; Mon, 23 May 2022
 17:18:17 +0000
Message-ID: <b5a98b58-d812-5c45-2e3c-5ba837dfb788@nutanix.com>
Date: Mon, 23 May 2022 22:48:06 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v6 10/13] migration: Respect postcopy request order in
 preemption mode
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>, 
 Juan Quintela <quintela@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
References: <20220517195730.32312-1-peterx@redhat.com>
 <20220517195730.32312-11-peterx@redhat.com> <YotoTrRaTIaQdVR4@work-vm>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <YotoTrRaTIaQdVR4@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN1PR01CA0118.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00::34)
 To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be41cc9a-4cd9-4e0c-fd49-08da3ce03a5f
X-MS-TrafficTypeDiagnostic: BL0PR02MB4772:EE_
X-Microsoft-Antispam-PRVS: <BL0PR02MB4772516F0E1A9F644524ABC3F6D49@BL0PR02MB4772.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zvoHriMUm5ng+DHNBURQZCjmbdzH1E8v/fBy+VqWpeiGiuIChWde+k4XpYPoWnDP2v7Oc1CrPXxm7X81H52wdvb1eDHRgk9QdFz3l7khPheWf2/BWQbkuSsWrUNxGpRS2CPpUWkpaeonD6QxS2s5ZsRjRUxW+dca6GPWSgqliqmkMo34537+GnBsNJDeTLtv+JV6LhKrx/QHMt8OSmg4Qaeopi9hC2aziyaGyt+HGOtFIpY6FhfPr/G3CYVJPll8Y0MiMYzzYRZPNWa9z4z/UWxuE+LAJ4d41urEA0VTVLOTJtXJHBuJQret/GPm67+QZjaaSFXAvWqAdR3htsLClH95vCyMYuIiLhm3tmCxsXnaHmEcKSi3g0ppVMURRPrIexfItfTc3mQ2Zd7jt9U8NvVe+i4OY0KSD1fAyZs4JEjZZILtMFXf9d1EZK1U7XapqiHakbu2mvXlpM0ddaZa1Af472S0j86i/XTYXUIAaTvZlO+ZJ3e4hpfJHl6oWChtJj1Ho3cDSdKZcDvm2UV0X2O49sBcWCA1Ot9ojwaLESIuYGRH+2VfRAdHQJDWSAuR0glJ+PN+RkxJOEdeTH0G88ztKd2dWUatJ+Zx0yIPv5ruDcCCDE5TGYwhXJyZ6G21kcmMFJv1w/uGHF6fi1lapfZG9FI8Y3SPkbNTjdFKZikDnwCypLCgzf1uwqso6itJErnuXnuiONVcfbiUOe7Q2+FWI5yoPEpyB9C6hR4bbGI4M4l2HZlaP4zL7VpFs+rnU9QJ/msKeTMfmwPjfOuqEw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(84040400005)(316002)(110136005)(54906003)(31696002)(2616005)(86362001)(66556008)(8676002)(4326008)(66476007)(66946007)(6666004)(38100700002)(53546011)(6506007)(6512007)(508600001)(36756003)(6486002)(2906002)(26005)(186003)(31686004)(83380400001)(8936002)(5660300002)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHlnNDJtZ1NMQWg2SHJwU1IyRm9wK2laRlpXR3RVYWN0a0E4WXlQSGVTWUoy?=
 =?utf-8?B?Y05nazBENGl3OFRLZVJUcDhYZytBRWFaSml0WUlKR2ovRitIVkpqazcyZGZ2?=
 =?utf-8?B?dzk4LzZUWXU1MnFRVkhDeTdMRklMaEVTS0svSVFlQ1REUlRlcFB5dFZnOVNj?=
 =?utf-8?B?YTI2ZncrMHZwUExUM2VocDkxK3pabEhZUURrcWlxN3dESmloS1RTTWYrNnU2?=
 =?utf-8?B?aDdSOUh0SUUxZ1B2WHhzTm1YalMyTk12K212MEZLcmc5MUdtMUpzNFB3bEFr?=
 =?utf-8?B?cUpwaTRIVndiNmF6U0phTmE2Vk1MeVB1K0RkeVFaRm9sOTJQaENoWm9vcm1D?=
 =?utf-8?B?OXJJYjZ6Vm5JWmNtcUlRa0grRGJLSFo5QU9QZm1NaC9FWmEyVXZxMGo2UHdw?=
 =?utf-8?B?cmFSRk51SGlOd215TkVBQzRKbGxiWmlmUjFtbm4xOUJwVkdtZjNPWFhkSmNu?=
 =?utf-8?B?QUpUc2RwL1d3V1ViRFpEMWNmRkJmVjd4Rm03NTRKdXdWN1I4WGNRSW43dE1V?=
 =?utf-8?B?MXBxNktpWVBneFVsalZ4TWJkSUNOMTBHK3lOQ3lVYnNEUUxXb2Q4MWx5RDF3?=
 =?utf-8?B?V1NGekoyVjJhUy9MQnhyMWJoekJwUllsWnluK2lhcXAxczNORE9uTEl6SVZU?=
 =?utf-8?B?SzhCaFE4eHNlU2Vid3BNcXo0TjVia25PaENZbHY2WHhiL3d6SFUrOEMzTHZF?=
 =?utf-8?B?T0dnbjRXelhDWXI3eGFPRmpJUWhPbE1DVnVWd0hFeWRMblc0SERJb2lhNEg0?=
 =?utf-8?B?bTc1bkRPa0FhSC9KaGgzMXJkZjY0YWJ3YTZMNVZaM0JxVDUzWnBoQWNSUDFh?=
 =?utf-8?B?a0dTWE5Ka0NHeFBycThNQUY4V0krbXR3RUZNYlh6QjRnSlRXWUNJV2ZhZUZQ?=
 =?utf-8?B?SmhjcmdKLzJ3YjM4K0EvUkk4V3YxVFRXTk1VdW1PM3pWOU12YTk1dGRPY3A1?=
 =?utf-8?B?dkxvY3l3TXQ3d3kzZGgzRk1PQVNad0FOcE1BWW92K0thQXcyR2FxN2dZNW5E?=
 =?utf-8?B?SjgxRGZHZkdhMnhXM2tMUmhweGxoL1lqb2lZSHZFdGZzYXpteHRPK093Tzl3?=
 =?utf-8?B?cUFtelJlNUMwLzlJZ1JTUGhuR3ZDQ0NWMUdlYlZLTmVpaSt0em1xRkFXUEwy?=
 =?utf-8?B?OTdoQTVuaDkrdnVlZVA3QlhyM3BscWsyb3V5TVlMRUtIQndFRTlSMmpWS3pn?=
 =?utf-8?B?LzlwYXhFVERla3poWDlNWVJaN0ZJclBaR3lqMEhVK25hYUxsTUZWQjYwR044?=
 =?utf-8?B?ek4wU2J3elcvcDczRWI4djdGZFNhOVZtSWtnalVBSHhicHg4b0FydjZBVVQy?=
 =?utf-8?B?VzZUQ2FUR2I3ZnJFYWdLa0FFelREWnJiV3Z5QzN6bXJ3ZGNlMVBlZk9rSFZ3?=
 =?utf-8?B?TjE5OXVMdnZyN0lqQXVZelNSNTJQSVNoMXV2MWRoUDcwZW04bU0xZHVUcEs3?=
 =?utf-8?B?dmR4V3kxWEwxUmNPNHRvL0NuTXNENVZRNFhjUkxJcU56UG80UUpleFBrNVR3?=
 =?utf-8?B?cS9HeVVTUEN1eklFNCs5YUdEVURKZlJNQm8vQnRDdWM5WE9LUGJpd29WTmdw?=
 =?utf-8?B?TEpRc083SjVidHBTdmx6Y2dRRG9HTHloVXFEcCs3K2tDNHZIZ1ZGSEtZQTVS?=
 =?utf-8?B?STF1dkdiT3MzNjdYVHNBekJ4bjVWaW1tRzFZcCtVZG1sdkxLUExJTnNUd0FB?=
 =?utf-8?B?WGhOK25hclRadk1Oei9TWUFOdGVHTVpmL1h5T3NxeGpFamJ6Q0dKWGRxb2la?=
 =?utf-8?B?RFp2VHRQdU02R2pvdkVrMXZvRlYxUWsvTE9takFFNWQzN0wrZGZZUXY1Tmc5?=
 =?utf-8?B?bTlKMkdEWml5ZklyVTZrbG5WQkVwUUxDcktWVUIyaXJ6ODdHMUNacXhUVFpX?=
 =?utf-8?B?MnBBdE1vU05pM0ZFN1VZQ1NMNVVyNFdhcVFYM0JYQllTdHo0QmZrWHp2aUlS?=
 =?utf-8?B?c3EyL1RKQkxtQUxNeFZ5VmMzYitJMGluZCs2eGpnbis0YWQvSHA2aXZjeTBM?=
 =?utf-8?B?ZDk2MEFVR3M4QTIvWVBQOTlHUytuUFB3b25OTklyaUd3Q29laWwzd0M5NjIx?=
 =?utf-8?B?MXpHWGwvZ2x1SUVOSU9KY1hzeEY2Q1NWcXF1NktjZkV1SkdVRFU3VnA5SHR1?=
 =?utf-8?B?enB3cExYSS8yUnZmK202blp4M3FUUjZ4b1BYNENOUWcwWFNFMHJpWGR3Nm5E?=
 =?utf-8?B?d091U3A5VmJTNFBaSG10dkoxU2VISXhXSmlZc2pTQis4QURFanFkMDhjc3B6?=
 =?utf-8?B?TVdmRWhKZC9MSGVMUlErd09leHJKbmlZcjU5RjVqTXdpTVQzekF5Ukd2Wmk0?=
 =?utf-8?B?RDRqT1k5amVTNEpyK3dRQW9GSFFOeVNrS2szemVvMzdRVG9ScHg2KzF1Uk9j?=
 =?utf-8?Q?JDTTIZrBXuHw7fdg=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be41cc9a-4cd9-4e0c-fd49-08da3ce03a5f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 17:18:17.9025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WLmjGFZZr/o3hZhKnRWpAA6WrK8WzJmz0AG24M3d7J4um9MBWc9ghWUhI1uxMzRAl/vL9gjBfhcmQr4FKCVKBhUIVLKs4Ejei65Zci6udWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4772
X-Proofpoint-GUID: eIlqPmbO0_WG8cnRcfyfuo5xr7cfJCDZ
X-Proofpoint-ORIG-GUID: eIlqPmbO0_WG8cnRcfyfuo5xr7cfJCDZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-23_07,2022-05-23_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=manish.mishra@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, URG_BIZ=0.573 autolearn=no autolearn_force=no
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


On 23/05/22 4:26 pm, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
>> With preemption mode on, when we see a postcopy request that was requesting
>> for exactly the page that we have preempted before (so we've partially sent
>> the page already via PRECOPY channel and it got preempted by another
>> postcopy request), currently we drop the request so that after all the
>> other postcopy requests are serviced then we'll go back to precopy stream
>> and start to handle that.
>>
>> We dropped the request because we can't send it via postcopy channel since
>> the precopy channel already contains partial of the data, and we can only
>> send a huge page via one channel as a whole.  We can't split a huge page
>> into two channels.
>>
>> That's a very corner case and that works, but there's a change on the order
>> of postcopy requests that we handle since we're postponing this (unlucky)
>> postcopy request to be later than the other queued postcopy requests.  The
>> problem is there's a possibility that when the guest was very busy, the
>> postcopy queue can be always non-empty, it means this dropped request will
>> never be handled until the end of postcopy migration. So, there's a chance
>> that there's one dest QEMU vcpu thread waiting for a page fault for an
>> extremely long time just because it's unluckily accessing the specific page
>> that was preempted before.
>>
>> The worst case time it needs can be as long as the whole postcopy migration
>> procedure.  It's extremely unlikely to happen, but when it happens it's not
>> good.
>>
>> The root cause of this problem is because we treat pss->postcopy_requested
>> variable as with two meanings bound together, as the variable shows:
>>
>>    1. Whether this page request is urgent, and,
>>    2. Which channel we should use for this page request.
>>
>> With the old code, when we set postcopy_requested it means either both (1)
>> and (2) are true, or both (1) and (2) are false.  We can never have (1)
>> and (2) to have different values.
>>
>> However it doesn't necessarily need to be like that.  It's very legal that
>> there's one request that has (1) very high urgency, but (2) we'd like to
>> use the precopy channel.  Just like the corner case we were discussing
>> above.
>>
>> To differenciate the two meanings better, introduce a new field called
>> postcopy_target_channel, showing which channel we should use for this page
>> request, so as to cover the old meaning (2) only.  Then we leave the
>> postcopy_requested variable to stand only for meaning (1), which is the
>> urgency of this page request.
>>
>> With this change, we can easily boost priority of a preempted precopy page
>> as long as we know that page is also requested as a postcopy page.  So with
>> the new approach in get_queued_page() instead of dropping that request, we
>> send it right away with the precopy channel so we get back the ordering of
>> the page faults just like how they're requested on dest.
>>
>> Alongside, I touched up find_dirty_block() to only set the postcopy fields
>> in the pss section if we're going through a postcopy migration.  That's a
>> very light optimization and shouldn't affect much.
>>
>> Reported-by: manish.mishra@nutanix.com
>> Signed-off-by: Peter Xu <peterx@redhat.com>
> So I think this is OK; getting a bit complicated!
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Reviewed-by: Manish Mishra <manish.mishra@nutanix.com>
>
>> ---
>>   migration/ram.c | 69 +++++++++++++++++++++++++++++++++++++++----------
>>   1 file changed, 55 insertions(+), 14 deletions(-)
>>
>> diff --git a/migration/ram.c b/migration/ram.c
>> index 9d76db8491..fdcd9984fa 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -441,8 +441,28 @@ struct PageSearchStatus {
>>       unsigned long page;
>>       /* Set once we wrap around */
>>       bool         complete_round;
>> -    /* Whether current page is explicitly requested by postcopy */
>> +    /*
>> +     * [POSTCOPY-ONLY] Whether current page is explicitly requested by
>> +     * postcopy.  When set, the request is "urgent" because the dest QEMU
>> +     * threads are waiting for us.
>> +     */
>>       bool         postcopy_requested;
>> +    /*
>> +     * [POSTCOPY-ONLY] The target channel to use to send current page.
>> +     *
>> +     * Note: This may _not_ match with the value in postcopy_requested
>> +     * above. Let's imagine the case where the postcopy request is exactly
>> +     * the page that we're sending in progress during precopy. In this case
>> +     * we'll have postcopy_requested set to true but the target channel
>> +     * will be the precopy channel (so that we don't split brain on that
>> +     * specific page since the precopy channel already contains partial of
>> +     * that page data).
>> +     *
>> +     * Besides that specific use case, postcopy_target_channel should
>> +     * always be equal to postcopy_requested, because by default we send
>> +     * postcopy pages via postcopy preempt channel.
>> +     */
>> +    bool         postcopy_target_channel;
>>   };
>>   typedef struct PageSearchStatus PageSearchStatus;
>>   
>> @@ -496,6 +516,9 @@ static QemuCond decomp_done_cond;
>>   static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
>>                                    ram_addr_t offset, uint8_t *source_buf);
>>   
>> +static void postcopy_preempt_restore(RAMState *rs, PageSearchStatus *pss,
>> +                                     bool postcopy_requested);
>> +
>>   static void *do_data_compress(void *opaque)
>>   {
>>       CompressParam *param = opaque;
>> @@ -1516,8 +1539,14 @@ retry:
>>    */
>>   static bool find_dirty_block(RAMState *rs, PageSearchStatus *pss, bool *again)
>>   {
>> -    /* This is not a postcopy requested page */
>> -    pss->postcopy_requested = false;
>> +    if (migration_in_postcopy()) {
>> +        /*
>> +         * This is not a postcopy requested page, mark it "not urgent", and
>> +         * use precopy channel to send it.
>> +         */
>> +        pss->postcopy_requested = false;
>> +        pss->postcopy_target_channel = RAM_CHANNEL_PRECOPY;
>> +    }
> Do you need the 'if' here?
>
> Dave
>
>>       pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page);
>>       if (pss->complete_round && pss->block == rs->last_seen_block &&
>> @@ -2038,15 +2067,20 @@ static bool get_queued_page(RAMState *rs, PageSearchStatus *pss)
>>       RAMBlock  *block;
>>       ram_addr_t offset;
>>   
>> -again:
>>       block = unqueue_page(rs, &offset);
>>   
>>       if (block) {
>>           /* See comment above postcopy_preempted_contains() */
>>           if (postcopy_preempted_contains(rs, block, offset)) {
>>               trace_postcopy_preempt_hit(block->idstr, offset);
>> -            /* This request is dropped */
>> -            goto again;
>> +            /*
>> +             * If what we preempted previously was exactly what we're
>> +             * requesting right now, restore the preempted precopy
>> +             * immediately, boosting its priority as it's requested by
>> +             * postcopy.
>> +             */
>> +            x(rs, pss, true);
>> +            return true;
>>           }
>>       } else {
>>           /*
>> @@ -2070,7 +2104,9 @@ again:
>>            * really rare.
>>            */
>>           pss->complete_round = false;
>> +        /* Mark it an urgent request, meanwhile using POSTCOPY channel */
>>           pss->postcopy_requested = true;
>> +        pss->postcopy_target_channel = RAM_CHANNEL_POSTCOPY;
>>       }
>>   
>>       return !!block;
>> @@ -2324,7 +2360,8 @@ static bool postcopy_preempt_triggered(RAMState *rs)
>>       return rs->postcopy_preempt_state.preempted;
>>   }
>>   
>> -static void postcopy_preempt_restore(RAMState *rs, PageSearchStatus *pss)
>> +static void postcopy_preempt_restore(RAMState *rs, PageSearchStatus *pss,
>> +                                     bool postcopy_requested)
>>   {
>>       PostcopyPreemptState *state = &rs->postcopy_preempt_state;
>>   
>> @@ -2332,8 +2369,15 @@ static void postcopy_preempt_restore(RAMState *rs, PageSearchStatus *pss)
>>   
>>       pss->block = state->ram_block;
>>       pss->page = state->ram_page;
>> -    /* This is not a postcopy request but restoring previous precopy */
>> -    pss->postcopy_requested = false;
>> +
>> +    /* Whether this is a postcopy request? */
>> +    pss->postcopy_requested = postcopy_requested;
>> +    /*
>> +     * When restoring a preempted page, the old data resides in PRECOPY
>> +     * slow channel, even if postcopy_requested is set.  So always use
>> +     * PRECOPY channel here.
>> +     */
>> +    pss->postcopy_target_channel = RAM_CHANNEL_PRECOPY;
>>   
>>       trace_postcopy_preempt_restored(pss->block->idstr, pss->page);
>>   
>> @@ -2344,12 +2388,9 @@ static void postcopy_preempt_restore(RAMState *rs, PageSearchStatus *pss)
>>   static void postcopy_preempt_choose_channel(RAMState *rs, PageSearchStatus *pss)
>>   {
>>       MigrationState *s = migrate_get_current();
>> -    unsigned int channel;
>> +    unsigned int channel = pss->postcopy_target_channel;
>>       QEMUFile *next;
>>   
>> -    channel = pss->postcopy_requested ?
>> -        RAM_CHANNEL_POSTCOPY : RAM_CHANNEL_PRECOPY;
>> -
>>       if (channel != rs->postcopy_channel) {
>>           if (channel == RAM_CHANNEL_PRECOPY) {
>>               next = s->to_dst_file;
>> @@ -2505,7 +2546,7 @@ static int ram_find_and_save_block(RAMState *rs)
>>                * preempted precopy.  Otherwise find the next dirty bit.
>>                */
>>               if (postcopy_preempt_triggered(rs)) {
>> -                postcopy_preempt_restore(rs, &pss);
>> +                postcopy_preempt_restore(rs, &pss, false);
>>                   found = true;
>>               } else {
>>                   /* priority queue empty, so just search for something dirty */
>> -- 
>> 2.32.0
>>

