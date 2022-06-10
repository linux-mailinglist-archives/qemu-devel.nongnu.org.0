Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C74375466B0
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 14:32:39 +0200 (CEST)
Received: from localhost ([::1]:45154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzdoc-00074i-E7
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 08:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1nzdl4-0005dW-Du
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 08:28:58 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:46476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1nzdl0-0005iu-PV
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 08:28:57 -0400
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25A8I5dm009313;
 Fri, 10 Jun 2022 05:28:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=Lh3W7ozgOyqjXxcU5ORfVGByzekORkBmUf8EIz8YqUw=;
 b=Epuo+3FhWTomvpKOWVa7Q5BO6GKPhAWh6HWBqunNHAiFCp8FGAe/Pbkp2Qx9B5ynY3r0
 ik7ErRSMVEmdv5tHs80aCjPPuQuKbqQ38S6sfoTC2PY2HCC2J9YCX5OSyqTmRTX/r9dE
 25piEmyj+x3WK0aO/UCZnjrc+cNQgQojuUADTKj3LiZgRYXLiWdk12BXx6dJHzWVK9Dm
 RDxHCdC4OM5Pf+kspkCbdub9uIpxmYw7Es38MucmJj95mVYIbrUyrRDCX3vH1xN9DhFA
 SnsRrEq9x6ElH5BpWTL1BpKu8yPs42rfgL7FEIqz1R1+oVLpeT0PWrDiGDNtXaN+nV0X /Q== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3gg5gkdedx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jun 2022 05:28:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fyeHrAa0nuTQ6MeUHyDJjhySe8zdB9Fm/u6zHnGCXpqcm1xbGnBIMK4ncB2c91OSCAMpghHduprBO56smtGqQwJDBNxu9eN5aNBCrPZAe2zWAaoYKEyXQvnzoyCEFLRw8ZGPo7jKBYDf0Rre0KKveIH20i+6qEJLhzOttbNrVcidfx6a37ZnX2H+jDN6I25FgjHmlMmG7Qc6gU7L/ayiQnWCvbaRGJeKSU9IBz8M4SZWIr9tP92CTRpdWvUuB71FkS93am+G5+ZATXf/9dxYPip4KXacGuFi7fRrFQHy6x8S4KHDjb7fPrOX7QKZOrwps+znwue6ldcwTI46zyZbtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lh3W7ozgOyqjXxcU5ORfVGByzekORkBmUf8EIz8YqUw=;
 b=QBlnUa5aD7y3RdrQK9zvKmCSdgmMW8HW4uUh0yNIp6PCJ2dABFZ0mf9xKs9ve+1a2TtrvtIgAYJA1K03uPaBYR5k0O020OPQS2RnFTKFUjfDmzYEeMau/zAHwC3lYIV0QJZ+y3t5FoURUIR2uRdUttGv+hoJo+JRl6SCpbaaxrQwifq00Mfa5lSscrvYhAyvN1octVMmu/aWhPRDpoVm7vV5U+ZbFRdehNcSkCbzGF95x5qVLYGBQWlAkkRgzu86O9dD8bbHhYaouAn9aAnZmzp2TyUj4tVOiaKMxwsC56fNFOQgPMQS9Vmuqt36XdQk/bjBC7+SnSpdu5SprMAMsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by DM6PR02MB7017.namprd02.prod.outlook.com (2603:10b6:5:251::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Fri, 10 Jun
 2022 12:28:43 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::898c:892a:2385:3df6]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::898c:892a:2385:3df6%4]) with mapi id 15.20.5332.014; Fri, 10 Jun 2022
 12:28:43 +0000
Message-ID: <7209116d-ef87-ee6f-5126-e23b55121f49@nutanix.com>
Date: Fri, 10 Jun 2022 17:58:31 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 0/4] Multiple interface support on top of Multi-FD
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, armbru@redhat.com, eblake@redhat.com
References: <20220609073305.142515-1-het.gala@nutanix.com>
 <YqIWDoSJ/xQC8Vvt@redhat.com>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <YqIWDoSJ/xQC8Vvt@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0130.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::19) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bebb9ef9-8d8a-496b-3612-08da4adcc1e3
X-MS-TrafficTypeDiagnostic: DM6PR02MB7017:EE_
X-Microsoft-Antispam-PRVS: <DM6PR02MB70173CEEDC8C1E50999BBB6BF6A69@DM6PR02MB7017.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fjF+z0KIf3JPZEbCvXPl8qLQtsgk8HICjR1Bx/WmYc3Yj3KLxw0LZDkvHYtrY1jJvBxoNE/0Dzvx1jVmsIRVfpdp1GORZiG57ioMzYxsbhm70JRLSoF5u4VLJjGYhDHWZCsKHIfQzApqT+HKp2fRk/HyOIfZGelC4hYStgJJeCXpFh5z8Jgai8LqssLAYbxrU6u+kmBHOSVUhTO9p21X/zsSXnHmpNcHhEZXZMRJWMsrFTR6a5zm5krKxHNup8pWb0HIn/Qb6Yz2XcINtMHok8oQhFl+fv/viWvwIoxEmH5mUSnC+nZeSPWM1AXa1rrSaNmyEqE5L28TfJmKUMK+XgPqoGcdY9rCDtT/FvopzzUJbwdA8/gKAzdN29vIICFk5MHcEEhV3K/uP5eig46EvtpgyLzVy7Spgg9eZ5Kv8DjqfDNpur32fPXRG7RmRIA0ph61hjCKKj4tJQ4YjJ5ZbD8khM3kRdLoUCglT3ZievJ5aX2jmA1H8npvr9MBsRxrSbxsWmH/J95RIHfvkQy29ABDY72E+ynZWRJixH96fO8uFQQdiKn7xGggyZ1mJ4tD8oo5MDsYrjI4PUIuKIOzb6Zuc+opXkSy4AQXlLgikUHV6f9r/VUZuIsLt4L61W+VbRlI7BsPsZGA+g0AA6EOOx5ARcFjocBFvUe2MaKBULTva/iLP+TYRil01WLUi6XC12v3QkrpauolpwYLqUqL37zZCKr608DqsFPgO+x9NTM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(53546011)(31696002)(186003)(31686004)(2616005)(6486002)(66946007)(8936002)(66556008)(508600001)(5660300002)(4326008)(8676002)(66476007)(110136005)(6666004)(2906002)(6636002)(38100700002)(26005)(316002)(36756003)(83380400001)(86362001)(6512007)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3BIVmFMbkorTlg2SVdKSmlEZFZSQzNqazdwOXBUWXlMVHROZ21IbVNUR0xN?=
 =?utf-8?B?QjhORDFlNjluTkVpTWZRRE5JZXQxZk52T0trOFkrdVhZWDVxQlVXWGVqS2U5?=
 =?utf-8?B?NGdkN2ZVREZBN0ljdWJLTW14ZFlzR0ZRTUtpb3FKMWlBbUlFeGpOdWpWbGFH?=
 =?utf-8?B?QUw0MFdXYmpKREVmckYrbmtreWE4cWNEc014NEsvU3RjQ3hKb3ZuUk9UbnVB?=
 =?utf-8?B?NDk1MVJ6ZFJyOG5aSThMQnNJMEY5a0hJZHFNQnN3WkUwY1ZZcDJBbEtJUW1B?=
 =?utf-8?B?YjNzZnhaV1lINUlwajFGN1g0UnNKdVBvNGE1TjNLLyt6NFFNeitLbFZwYVNl?=
 =?utf-8?B?SnU1N213QnNDb2R3MjhoR2pVY2NLU2pLeGc2VlJlMmw4eUx4TnBIUlhJaTcw?=
 =?utf-8?B?R3ByVURKR2FSdXNtSGp6SG9tY0hpZnVaMitNTEdvdEg1QVRWNTcxNVVRVEdz?=
 =?utf-8?B?WHZOakU3UFg4OWU5Z1grdmI4MHkxTDlTYlJXOXNuWFR6T1lKMlJ2TXdQblFQ?=
 =?utf-8?B?UzRYQ2dNQmkya0oraFZQSFU5Q1dhZGIwTDd1bGFidC9zTWI3N28zd2poaGZG?=
 =?utf-8?B?eitFQzZ5V2V4YmM1cWxEcUc2aTcrRWxvSkhESGp3L2JBTkhXNmtXdGQyZ2Y2?=
 =?utf-8?B?RHQ5NWtsN1V5TER1RGlsL0pZU3NnU1R6QzhqS1MwQ01VVVRmMWZHZDZieTVH?=
 =?utf-8?B?aUtMaEhiREQ1eXhPMGxtOExUR0lra3J6Zm5sVktuMTJQTUVLNHVKc21UWExl?=
 =?utf-8?B?TDd3Y2F0WTFmWHJWOENjOVBVeW91RUpIM1JKVk5kanJUNGMvL0MrREE0OExy?=
 =?utf-8?B?STdFRlIyaVo3OWIyd1ZKMGZ0VmJBb3UwUWlsdXFSWGdWS3dacmtaU2ZmcnBH?=
 =?utf-8?B?c3pLenA2eWUwdUp6NHJzS0l3cXZaTWdTbjE1djRFN2x4TTl4Sno4eis3N0xG?=
 =?utf-8?B?YzZIdk01b1FtMC80b3N6ci9ieHNTdG41OGo1cFhqVG5BR1BZeGFvWXRqZ3pH?=
 =?utf-8?B?d29zKy9yZTdMWUdGTVdkTFNLMHUxaHpUYVd2a0ttN1VPZmtnUzBCYXZkbW80?=
 =?utf-8?B?UEEvNU14aUhoWENGc3NtWmpKVG1laEZZWVdVa2EycC9sdGY2RVR6YjJWRFFP?=
 =?utf-8?B?QWtoRmJ6ZlZ4RWFXY29TRXNkL2V6a2xTOFNFUCtIYzdyUENVdWpReDlxclZq?=
 =?utf-8?B?ZnBLZUtLd0xmdDZYR1FkN0Z1VTJlbjZEdEVOYWhKK1lraVlPRDFvZ3Eya0Qw?=
 =?utf-8?B?RHZ3WHlNWUZNUHBRYWRJMlNJMEdpbFphNGppV0N6SG5ab3ZjMUtMNVF6T0da?=
 =?utf-8?B?YWYzTytpa096VWdjT21vbEtUTGUzbVBoNFhZRSsyaEcvZU53V0t5VmVXTXpS?=
 =?utf-8?B?WGV1dlpFajFmaGVoOXBRZkYzOURlTnBBY3YxbU9yUldSVG5LL2UzTklEclAy?=
 =?utf-8?B?b0Q1N2lEeGNacGxzcFA5WW9UREwxTTBDWmt2UTF1bCtFcE1PUnJQTUdDU0Uw?=
 =?utf-8?B?aWhiRVNtVEZZNXZpTHgrMklvWURGNU1kZ2hMd0h0T0p1SnJWMVQzNkhaSC9y?=
 =?utf-8?B?TE5nQ2lSOCtVYk9OSjEyUFB6dFVKVGJUMVFWQ2dndmNWRzFqbi9Deit0clcz?=
 =?utf-8?B?TkZKRjlHRVYxc1gzVm5DU3dYWGNhSmcxY3dacHBUam0rRzhMVXRQR3gyZkRL?=
 =?utf-8?B?bmNtZDRIWFo1YzBWcFFCZkw5MktBbDVaa3ZGSkRWRWV0VGZVYkpYL0JxbTMv?=
 =?utf-8?B?T0dFSEhXVkRXTFo5c3g5Wis4T2ErSEJvRFhCOW1NRDRzclFmM2Z4Qm81MDhN?=
 =?utf-8?B?cy9LQ3diT3gxMFBpY2lTbHIxUEFvdUJqaUhKcWVVUWM0SzRjOEpRdERRYUNH?=
 =?utf-8?B?TzZKMjIybVl2UGlML3pGSlByZkxqRDdYd241NHZlMDdrT1Z4aWV2RjRnS3dQ?=
 =?utf-8?B?YXdJdHI2M0t4WE5xZDRFVTNFaWxNSUZxZE5KcVdWOUJLN3RGN1IvWEo3WkxV?=
 =?utf-8?B?TEI3d3JuUTRJVVBMZ2RKeHl2am1VTktva0JvVEo2YXR2S0hZREpBc21lZmNo?=
 =?utf-8?B?UExEcXRtQnl4K0pUQUxZUlovekt0R2t2ZmF0UHV0azhwOGdocURPcUs1akpZ?=
 =?utf-8?B?Z0piRTg3NEFDZjdXZHBaYlBJb2tySTUxMnZyaUNFRlRSVlhvNTBwVnBCU1Bo?=
 =?utf-8?B?UWVIOWsxbktKK20xeHhEOGU1QkprZzdpTlNrL3FHYlp2M01OcVZRclMyeGNa?=
 =?utf-8?B?N0Z6ZDZ4OENodWUyRVRmWXBYaFA4RFp4cTg1YlJHNXh6SW5yYVZpUmtWMXdH?=
 =?utf-8?B?bjAydzBPMFVlSU1UQmNGaW5CWk1BMzROZmhFMDYxdzBRVlE2N3BBUTBGMmhX?=
 =?utf-8?Q?XsiuVsbY+f1Ea5eY=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bebb9ef9-8d8a-496b-3612-08da4adcc1e3
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 12:28:43.3906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U732GlC5cwhTB3TMo/JBvpyAPQSpzkxy3VRj5iY8hROKPT9lPmUYGx2BqYs0Wbgzk+LQfhvdWr0HeAhsZ05L5h2q38yCOzf7HDHLiUb90XY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB7017
X-Proofpoint-GUID: jXC9-AoMg4zPtIuyKmCaaYomeepK57ED
X-Proofpoint-ORIG-GUID: jXC9-AoMg4zPtIuyKmCaaYomeepK57ED
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_05,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=manish.mishra@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


On 09/06/22 9:17 pm, Daniel P. Berrangé wrote:
> On Thu, Jun 09, 2022 at 07:33:01AM +0000, Het Gala wrote:
>> As of now, the multi-FD feature supports connection over the default network
>> only. This Patchset series is a Qemu side implementation of providing multiple
>> interfaces support for multi-FD. This enables us to fully utilize dedicated or
>> multiple NICs in case bonding of NICs is not possible.
>>
>>
>> Introduction
>> -------------
>> Multi-FD Qemu implementation currently supports connection only on the default
>> network. This forbids us from advantages like:
>> - Separating VM live migration traffic from the default network.

Hi Daniel,

I totally understand your concern around this approach increasing compexity inside qemu,

when similar things can be done with NIC teaming. But we thought this approach provides

much more flexibility to user in few cases like.

1. We checked our customer data, almost all of the host had multiple NIC, but LACP support

     in their setups was very rare. So for those cases this approach can help in utilise multiple

     NICs as teaming is not possible there.

2. We have seen requests recently to separate out traffic of storage, VM netwrok, migration

     over different vswitch which can be backed by 1 or more NICs as this give better

     predictability and assurance. So host with multiple ips/vswitches can be very common

     environment. In this kind of enviroment this approach gives per vm or migration level

     flexibilty, like for critical VM we can still use bandwidth from all available vswitch/interface

     but for normal VM they can keep live migration only on dedicated NICs without changing

     complete host network topology.

     At final we want it to be something like this [<ip-pair>, <multiFD-channels>, <bandwidth_control>]

     to provide bandwidth_control per interface.

3. Dedicated NIC we mentioned as a use case, agree with you it can be done without this

     approach too.

> Perhaps I'm mis-understanding your intent here, but AFAIK it
> has been possible to separate VM migration traffic from general
> host network traffic essentially forever.
>
> If you have two NICs with IP addresses on different subnets,
> then the kernel will pick which NIC to use automatically
> based on the IP address of the target matching the kernel
> routing table entries.
>
> Management apps have long used this ability in order to
> control which NIC migration traffic flows over.
>
>> - Fully utilize all NICs’ capacity in cases where creating a LACP bond (Link
>>    Aggregation Control Protocol) is not supported.
> Can you elaborate on scenarios in which it is impossible to use LACP
> bonding at the kernel level ?
Yes, as mentioned above LACP support was rare in customer setups.
>> Multi-interface with Multi-FD
>> -----------------------------
>> Multiple-interface support over basic multi-FD has been implemented in the
>> patches. Advantages of this implementation are:
>> - Able to separate live migration traffic from default network interface by
>>    creating multiFD channels on ip addresses of multiple non-default interfaces.
>> - Can optimize the number of multi-FD channels on a particular interface
>>    depending upon the network bandwidth limit on a particular interface.
> Manually assigning individual channels to different NICs is a pretty
> inefficient way to optimizing traffic. Feels like you could easily get
> into a situation where one NIC ends up idle while the other is busy,
> especially if the traffic patterns are different. For example with
> post-copy there's an extra channel for OOB async page requests, and
> its far from clear that manually picking NICs per chanel upfront is
> going work for that.  The kernel can continually dynamically balance
> load on the fly and so do much better than any static mapping QEMU
> tries to apply, especially if there are multiple distinct QEMU's
> competing for bandwidth.
>
Yes, Daniel current solution is only for pre-copy. As with postcopy

multiFD is not yet supported but in future we can extend it for postcopy

channels too.

>> Implementation
>> --------------
>>
>> Earlier the 'migrate' qmp command:
>> { "execute": "migrate", "arguments": { "uri": "tcp:0:4446" } }
>>
>> Modified qmp command:
>> { "execute": "migrate",
>>               "arguments": { "uri": "tcp:0:4446", "multi-fd-uri-list": [ {
>>               "source-uri": "tcp::6900", "destination-uri": "tcp:0:4480",
>>               "multifd-channels": 4}, { "source-uri": "tcp:10.0.0.0: ",
>>               "destination-uri": "tcp:11.0.0.0:7789",
>>               "multifd-channels": 5} ] } }
>> ------------------------------------------------------------------------------
>>
>> Earlier the 'migrate-incoming' qmp command:
>> { "execute": "migrate-incoming", "arguments": { "uri": "tcp::4446" } }
>>
>> Modified 'migrate-incoming' qmp command:
>> { "execute": "migrate-incoming",
>>              "arguments": {"uri": "tcp::6789",
>>              "multi-fd-uri-list" : [ {"destination-uri" : "tcp::6900",
>>              "multifd-channels": 4}, {"destination-uri" : "tcp:11.0.0.0:7789",
>>              "multifd-channels": 5} ] } }
>> ------------------------------------------------------------------------------
> These examples pretty nicely illustrate my concern with this
> proposal. It is making QEMU configuration of migration
> massively more complicated, while duplicating functionality
> the kernel can provide via NIC teaming, but without having
> ability to balance it on the fly as the kernel would.

Yes, agree Daniel this raises complexity but we will make sure that it does not

change/imapct anything existing and we provide new options as optional.

Few of the things about this may not be taken care currently as this was to

get some early feedback but we will definately modify that.

>
> With regards,
> Daniel

