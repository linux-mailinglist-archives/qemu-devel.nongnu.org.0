Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA0D6184CA
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:36:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqdBb-0003OM-V0; Thu, 03 Nov 2022 12:35:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oqdBW-0003Nj-Je
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 12:35:18 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oqdBT-0002hL-9j
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 12:35:18 -0400
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A3GPJ3n008041; Thu, 3 Nov 2022 09:35:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=proofpoint20171006;
 bh=ZyNQehP8EsnrUY2k77LJioT7e1vSxpp6cSWq+erMLlw=;
 b=W8p3R9vrLKnRV2n1TtbYYvh76VUqaQKBduPW3GZ42dW2g3EOxRksuA8O2kAC0O42niff
 l7ses/CcPeRWJJuhyYFPad7M9xRuPR/mKGHQjQvjcej+mBIxWzX+kQeGXtjjrKHbzTx4
 jNcZZnvi2Z7imvNLjssggqq4flVXA4Uu9Ch+J7QKHBjflrextr9WGfQLnKqY8O9Yxr9a
 o1pAXe97qvbzjJ7ouyDQznO6dBdXwnUwEtytgUULNVB231l7Royta7h86U3dqvFrl+lw
 bEqQsfmI9v7DgE9KEdVebgQlzpOReyF1qRmCdBhkg+WxwIMRrqxRkGwaAFa+8pZEvl5g tw== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3km3n01r81-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 09:35:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SiCVxb3QxOHJlGRrx1IgO0/rxEOtUGnaSbZfNLJGG8olC4urRP5EEfzTyP4zFMfxd1i8aqpouqtdMdijc7ENaDY8aygY5m5swFYsNOYNEMDceM0PUsgXhIgTgMNLuKPHcA4+J/nmtuj7xgpIPSA7a1tbrqVYQoccqMjk4RTaoAVBVBO8f6/klGTZaBUYKvP6p18iaqWFPRln4eTtnh0H3/wYQRklS17tLin5ZpTFXKsToTG5ZgqWQRVcG8rtJqhtca8NI+TXln1ffEmRMOFuhuIW26WDQrqostRPAMo+u0MdTfI46dEcR26zTgRsMMV70H07Bb+5HXixLa2tpNAnfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZyNQehP8EsnrUY2k77LJioT7e1vSxpp6cSWq+erMLlw=;
 b=NGRDPztxsiIiTfwKZzxoY21yqAejOb8bKTU0hXUxoNBDjjQ9Y0b021c/CfpwCcCkUKc5uFNik/CtRXiOyhMUE4o3nrSrzHsGKsvomB28mjSlkfLBsX4/UaSX9Nlc2Vo1fh6YX9K5XndccZp+zlgqsBdagLIbVFtFBTQEoUHv44iOI5d4+jmoLrmFQcpAZIWgSbFaNzXxkin8RgevPmndqrXhPFP7zt3F9SiJR0WssuePt3iiIixYRTq6C7VM36s03dNqzSYcEFsL3PG2w6xMc0idIFc538QqgwDMzVk9lhP+9UF6lk7vdu+NALfk3Mir1SwftZcHuVPqhdQMeI7/+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZyNQehP8EsnrUY2k77LJioT7e1vSxpp6cSWq+erMLlw=;
 b=ixV8kFDXBYLHL3bdoC6GBVOjyGUmRCVCfBV97C44UtDk6N55yNFJbiyFhXdumq/cebRVmWqKCeSDTn4a0+/d7UwfyyHYgdqy1LlSRTvDNxk76FNfGQSBKMBXZikF/uL4aTxKyOMA0PBDbRD96/FdYKVcvQT3yDO2aEwltjDyWSx5FMpG80NFr7GAf6w74RLlp395stf9VddLx/KMDnykyy4XWJwsvX+O/PHnRYPlP1ElNv4Kb2wq5V7WBUylU0fT2Qr6O4z5RdtXbkDxNxpgrbbU1pBKDzhifb87o6DfNLkWT2kWCEIL96MtTlcCa0Fw6iKT2ihTaaOYe0mljJqPOg==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by PH0PR02MB8764.namprd02.prod.outlook.com (2603:10b6:510:f1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Thu, 3 Nov
 2022 16:35:05 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::c63:8c2:93a6:8f82]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::c63:8c2:93a6:8f82%5]) with mapi id 15.20.5791.022; Thu, 3 Nov 2022
 16:35:04 +0000
Content-Type: multipart/alternative;
 boundary="------------zx50FRIAYyGN1VwrBejjWxRt"
Message-ID: <cf399da1-8558-06f9-2865-98abe45ddcda@nutanix.com>
Date: Thu, 3 Nov 2022 22:04:54 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH] migration: check magic value for deciding the mapping of
 channels
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, peterx@redhat.com,
 Prerna Saxena <prerna.saxena@nutanix.com>
References: <20221101143029.14246-1-manish.mishra@nutanix.com>
 <Y2EyVkdLMln7CX15@redhat.com>
 <9faf2604-f0b9-f3c3-5ac8-e4deeeebc424@nutanix.com>
 <Y2E+/WZgWXQQgdY5@redhat.com>
 <e5f69a86-f625-3cdb-4a25-065a0612548e@nutanix.com>
 <Y2OKCel2FlMQw+bI@redhat.com>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <Y2OKCel2FlMQw+bI@redhat.com>
X-ClientProxiedBy: MA0PR01CA0090.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::19) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|PH0PR02MB8764:EE_
X-MS-Office365-Filtering-Correlation-Id: e87b0a64-d53a-4c1c-9f00-08dabdb95c6d
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LWVeFcFM1HatRPBHt4uI+pcw/9j9Z/X1+APGRMI2ChMxliaggu9Oj1NmiZnX1deAF4LN9Msp0dNxQ9go6sCSHNnQNHJrYy60Z1An7n01fzL4ONVbeJAj11ado4x8P4CxkVrj3e5SVd3bRTHupOja1COKzRh6qgnHXG/ILtT2Cxn699kMHvkgE4fZgSHlBLLgq9zVRI8J/J5Nkgr1iLO0rwJTJiak9tkfBcGaJ3cq7JUGaju2g+JVYX1d7DsKbAJ7I3mTgmzVzgSy1RDfiq6GOCOvl9rS09/HWYc+rlM7b8tXfXD9mFpNU9r/sheWrPFmaY+g2LRwdt9Qz63OR4sYxBLFLIP3iESVj1ZqR1wVVvg+pDIohKXb24+N4dthM7nq6rqWyDOA9oXl+HibeZ3TaFna+5rQHbp1BXS23wDC3kaRzaLw7vUUeYdc7FsSMwEYqTHeH075ZJ5a/xRHO5VTzDqI1NGIRIYyORIIofqRMtUxYNNT5z4Fg/tujeDiqlL2s0clMBMF54R6GZMJV85Lw7jh1VxcbIYiNNW/HuGZQfQ031wHyuwYdBjUtVuH4crNxS/VOvEiWswVnE07Hf9/GLh/9rS1VmRbLtbCpCqYBR3t6yncemxSExol6lIB4S0gUX/EQ6Gei0QKxOGKm8WBipZPhF3uNUzJHDO8PPIF9Tb/EcXNPA97rbB7UzCXpB5jwq3Tdvakg3LlbAKURxRO27RjxfJNZpXLkG+J8uha98qd/0xyF30JfUze0TAwA0KpoM8a7bJXlIFzQ2y+1oJb03WqUI7emROk1k0Vk4NCwgY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(366004)(376002)(39860400002)(136003)(396003)(451199015)(86362001)(8676002)(2906002)(83380400001)(6486002)(186003)(31696002)(38100700002)(5660300002)(66556008)(8936002)(4326008)(66476007)(6506007)(33964004)(41300700001)(107886003)(478600001)(6512007)(55236004)(26005)(6916009)(53546011)(2616005)(66946007)(316002)(6666004)(31686004)(36756003)(66899015)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFRsWkhyWENqTmpzblBJdmMrVVZCRnVFS2gxNXViNWJMM3liUlFYdmhJeXVy?=
 =?utf-8?B?Ly9BRVVIakhmM1FKVVpRR3FxSU12d0x5UnU2UHlRQTlFb3gwNDZ2N3puc1JR?=
 =?utf-8?B?b1dsWURzU1d2UXl1WENmUHl3NyszQzJTVWxGMUNTL09OeW9nL3dLeFBDNmp3?=
 =?utf-8?B?a2liUHBqYUg5ZVcvYWU2QWMzYUFjZzVxQWo1cE9aMHlVamppbCt0NTFwU2xR?=
 =?utf-8?B?b3VacHBkcnoxOHYvYmw4ZFBEQ2hJQ0Vrb1ZpMld2N1FsaUtNdVk5U016U09H?=
 =?utf-8?B?cUptOUF1c1RvT01zOUYrQVZhVW1XbkIwWkhxOEhCYUN1V05GZFJjdXJWWG9N?=
 =?utf-8?B?a3pqQmtLSEVoVDRBaTFDOXF3b3dNQ1JZbEhUanF0TVFmWVF2TU9MbmZ3emZW?=
 =?utf-8?B?NjQxWWVPeW56ZjExMGRneHBsbVljejhabHA5a2pHa1pmWERsOTNKTmo1TThH?=
 =?utf-8?B?Z3NQVVY0OUNVMGdZQmQ5bXJEQUJJZ2tkclp5L0NoMTdCWkM5Z1g5YUgwTERN?=
 =?utf-8?B?QlZ3QzBuUkZTV3ZhT2t2M3VkbzhEenpVU0liUlVpMG1LdThvbVd3THBFT29Y?=
 =?utf-8?B?blRGcmU3MU92N25DVk5wcElpMWdIUVpFVk5hT3dEQjhXWmlSSy9wNGtvZG9I?=
 =?utf-8?B?RUkySzU1WDBvTWxCZmFlN1ZTTGZTWmh6S3UxazFxZnZtb1VHeTVTRXgzbU5F?=
 =?utf-8?B?OGl5N1NpRU1GTUN4V3ZSc1VSWHNwbDN0SitJUUZqSWN1SkpiWFJob0FrWUtL?=
 =?utf-8?B?SHlkRlV2aHhBcmZyR3Vwa1djSXpsM3BERkkzTERFUXRhWkM5bFZNNjNUUzJq?=
 =?utf-8?B?REc0Q2xUemtEeXd3OUxrMEJ0N1ZjbDZoaHlrdUpDczFDaDJmNHFPK1hLL2di?=
 =?utf-8?B?SWw4RTlTL1dMUFZXc3FMN29GYm00cElwYVM2QW1WRE4rTzNTQmMrMFVKYW10?=
 =?utf-8?B?NWhDMllzSUMzc0hCSGQvanZIdkwyZ1JUVlgrajJTbjc1V2FHVGFESitKdGhS?=
 =?utf-8?B?ek9mZCtyVXByRnZtMElzdkhicDdQNG9qamFLUHk5Z05HM2tkU3JLMXN4cFZD?=
 =?utf-8?B?VUkyMzkvTC9kaWRXRFZjN3JRTDhZOExDem9tVFRvU0EvYjJYMDVTSDdxVUQv?=
 =?utf-8?B?eTNHdUwvNXlrSmtLQnNtZ3MrSDdzVmZ0NSs5TVZRTnh5cy8yR3h5SmtBM1dn?=
 =?utf-8?B?WTNKdW5xOXh5UktpcFhlVDl0c05hVFY4SmJ2TkYwZUE1QVlIOU5KbmFVY1pj?=
 =?utf-8?B?VkxHOUhzRlVXZmhUaFZOLzhPQmRGWWhpWU11dGVJUG5XRXBnNVROR3NiZ2Vv?=
 =?utf-8?B?K3UrUWkxTzRxSi9hUUhOK091V3JwZGVzcjJKcEdYa09uRTJDeUJqS0JtRm11?=
 =?utf-8?B?eGdmM0tqeE1jQ3QzVEI5TGhMcWI4SHB2OVRMWjNWdE00dVl5N2xiTVpON2kr?=
 =?utf-8?B?cmtWcTg4R1Q5ems4YWRueHE0RUNucURGNmhIQkVOVUQ0dncxRFowZ1ArZmVC?=
 =?utf-8?B?OTAzeUYvWGJVZmdrY1laQXU2RWJ3cGExVjV3SnhmRUVkbmc3MEx1aVFVOFNT?=
 =?utf-8?B?dXA5c2hQZENUcG1XQlF6elVXeUUrWW5UYkt0aWhiNVIvUUg3dFRmTFloY0Jk?=
 =?utf-8?B?NnlTZTlVWnpWVzJIWHRJZlhEcU00OEVqNHY3cEVXQmhlVk4yRTZ5STBlL2Fo?=
 =?utf-8?B?Q3BPdFQveFZ2ZW8vL0JkSklQcGtZYXZ0VlZCOEtIR1QveDZvS3h5L1lHSW9u?=
 =?utf-8?B?K0IzRFN5cDZwY3dCaFQwaFAwMzVrU2grek1nWUhEcUVGSlV1VWN2VnhKTFc5?=
 =?utf-8?B?dUNEaWM0cDZQYk90a1RSWmFONFhybWJKelVXTWhaTGJROXRUUUlsenIyUXlm?=
 =?utf-8?B?QlByZG9Nc05EQnhnTmprN25Fem9aeGNPbFpWc3pKa0tJbXZWWS8rY3pGYmZj?=
 =?utf-8?B?QzNOWWtFRDRvRFh3b3pxdUlQbVdSQnFRU3hVL2ZSZy94VzY3L1krWmwzSTdi?=
 =?utf-8?B?eWRicDNOK0JSMHRKRnNpNUo2VTVOcER6My90bytOTDJ3OC9BVXhEc2dXKzZU?=
 =?utf-8?B?blFHSWh1ZHBoZ2V0cUxzNkN2YTl6N2MwZzVWdUtJbGJLRGRmbVZ0MGlrWWtC?=
 =?utf-8?B?Z0pMa3NReWtqb0JmNWNWOGlNQTlaUk9VdnJMbTd3eTM3aWdUOWQxdlBkbXQ2?=
 =?utf-8?B?NWc9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e87b0a64-d53a-4c1c-9f00-08dabdb95c6d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 16:35:04.7070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KPGsLCUT2kRS5Lyfo+R/s6qSyLDzMiOD1myVpz5e/fbwqqy5K6kqhxscEY0s3r5DKizUz6WVNpKxegDhCZ+dFi4tEvT22EZGJsezFHOWXUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB8764
X-Proofpoint-ORIG-GUID: kdzcdaYE0FAsu7w2LVjgwZlzWBPbBeyA
X-Proofpoint-GUID: kdzcdaYE0FAsu7w2LVjgwZlzWBPbBeyA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-03_04,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=manish.mishra@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--------------zx50FRIAYyGN1VwrBejjWxRt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 03/11/22 2:59 pm, Daniel P. Berrangé wrote:
> On Thu, Nov 03, 2022 at 02:50:25PM +0530, manish.mishra wrote:
>> On 01/11/22 9:15 pm, Daniel P. Berrangé wrote:
>>> On Tue, Nov 01, 2022 at 09:10:14PM +0530, manish.mishra wrote:
>>>> On 01/11/22 8:21 pm, Daniel P. Berrangé wrote:
>>>>> On Tue, Nov 01, 2022 at 02:30:29PM +0000, manish.mishra wrote:
>>>>>> diff --git a/migration/migration.c b/migration/migration.c
>>>>>> index 739bb683f3..f4b6f278a9 100644
>>>>>> --- a/migration/migration.c
>>>>>> +++ b/migration/migration.c
>>>>>> @@ -733,31 +733,40 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
>>>>>>     {
>>>>>>         MigrationIncomingState *mis = migration_incoming_get_current();
>>>>>>         Error *local_err = NULL;
>>>>>> -    bool start_migration;
>>>>>>         QEMUFile *f;
>>>>>> +    bool default_channel = true;
>>>>>> +    uint32_t channel_magic = 0;
>>>>>> +    int ret = 0;
>>>>>> -    if (!mis->from_src_file) {
>>>>>> -        /* The first connection (multifd may have multiple) */
>>>>>> +    if (migrate_use_multifd() && !migration_in_postcopy()) {
>>>>>> +        ret = qio_channel_read_peek_all(ioc, (void *)&channel_magic,
>>>>>> +                                        sizeof(channel_magic), &local_err);
>>>>>> +
>>>>>> +        if (ret != 1) {
>>>>>> +            error_propagate(errp, local_err);
>>>>>> +            return;
>>>>>> +        }
>>>>> ....and thus this will fail for TLS channels AFAICT.
>>>> Yes, thanks for quick review Daniel. You pointed this earlier too, sorry missed it, will put another check !migrate_use_tls() in V2.
>>> But we need this problem fixed with TLS too, so just excluding it
>>> isn't right. IMHO we need to modify the migration code so we can
>>> read the magic earlier, instead of peeking.
>>>
>>>
>>> With regards,
>>> Daniel
>> Hi Daniel, I was trying tls migrations. What i see is that tls session
>> creation does handshake. So if we read ahead in ioc_process_incoming
>> for default channel. Because client sends magic only after multiFD
>> channels are setup, which too requires tls handshake.
> By the time we get to migrate_ioc_process_incoming, the TLS handshake
> has already been performed.
>
> migration_channel_process_incoming
>      -> migration_ioc_process_incoming
>
> vs
>
> migration_channel_process_incoming
>      -> migration_tls_channel_process_incoming
>          -> migration_tls_incoming_handshake
> 	     -> migration_channel_process_incoming
> 	         ->  migration_ioc_process_incoming
>

Yes sorry i thought we block on source side till handshake is done but that is not true. I checked then why that deadlock is happening. So this where the dealock is happening.

static int ram_save_setup(QEMUFile *f, void *opaque) {
+
+
     ram_control_before_iterate(f, RAM_CONTROL_SETUP);
     ram_control_after_iterate(f, RAM_CONTROL_SETUP);

     ret =  multifd_send_sync_main(f);
     if (ret < 0) {
         return ret;
     }

     qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
     qemu_fflush(f);

     return 0;
}

Now if we block in migration_ioc_process_incoming for reading magic value from channel, which is actually sent by client when this qemu_fflush is done. Before this qemu_fflush we wait for multifd_send_sync_main which actually requires that tls handshake is done for multiFD channels as it blocks on sem_sync which posted by multifd_send_thread which is called after handshake||. But then on destination side we are blocked in migration_ioc_process_incoming() waiting to read something from default channel hence handshake for multiFD channels can not happen. This to me looks unresolvable whatever way we try to manipulate stream until we do some changes on source side.

> With regards,
> Daniel
--------------zx50FRIAYyGN1VwrBejjWxRt
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 03/11/22 2:59 pm, Daniel P. Berrangé
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:Y2OKCel2FlMQw+bI@redhat.com">
      <pre class="moz-quote-pre" wrap="">On Thu, Nov 03, 2022 at 02:50:25PM +0530, manish.mishra wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
On 01/11/22 9:15 pm, Daniel P. Berrangé wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Tue, Nov 01, 2022 at 09:10:14PM +0530, manish.mishra wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On 01/11/22 8:21 pm, Daniel P. Berrangé wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">On Tue, Nov 01, 2022 at 02:30:29PM +0000, manish.mishra wrote:
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">diff --git a/migration/migration.c b/migration/migration.c
index 739bb683f3..f4b6f278a9 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -733,31 +733,40 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
   {
       MigrationIncomingState *mis = migration_incoming_get_current();
       Error *local_err = NULL;
-    bool start_migration;
       QEMUFile *f;
+    bool default_channel = true;
+    uint32_t channel_magic = 0;
+    int ret = 0;
-    if (!mis-&gt;from_src_file) {
-        /* The first connection (multifd may have multiple) */
+    if (migrate_use_multifd() &amp;&amp; !migration_in_postcopy()) {
+        ret = qio_channel_read_peek_all(ioc, (void *)&amp;channel_magic,
+                                        sizeof(channel_magic), &amp;local_err);
+
+        if (ret != 1) {
+            error_propagate(errp, local_err);
+            return;
+        }
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">....and thus this will fail for TLS channels AFAICT.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Yes, thanks for quick review Daniel. You pointed this earlier too, sorry missed it, will put another check !migrate_use_tls() in V2.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">But we need this problem fixed with TLS too, so just excluding it
isn't right. IMHO we need to modify the migration code so we can
read the magic earlier, instead of peeking.


With regards,
Daniel
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Hi Daniel, I was trying tls migrations. What i see is that tls session
creation does handshake. So if we read ahead in ioc_process_incoming
for default channel. Because client sends magic only after multiFD
channels are setup, which too requires tls handshake.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
By the time we get to migrate_ioc_process_incoming, the TLS handshake
has already been performed.

migration_channel_process_incoming
    -&gt; migration_ioc_process_incoming

vs

migration_channel_process_incoming
    -&gt; migration_tls_channel_process_incoming
        -&gt; migration_tls_incoming_handshake
	     -&gt; migration_channel_process_incoming
	         -&gt;  migration_ioc_process_incoming

</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Yes sorry i thought we block on source side till handshake is
      done but that is not true. I checked then why that deadlock is
      happening. So this where the dealock is happening.</p>
    <p>static int ram_save_setup(QEMUFile *f, void *opaque) {<br>
      +<br>
      +&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp; ram_control_before_iterate(f, RAM_CONTROL_SETUP);<br>
      &nbsp;&nbsp;&nbsp; ram_control_after_iterate(f, RAM_CONTROL_SETUP);<br>
      <br>
      &nbsp;&nbsp;&nbsp; ret =&nbsp; multifd_send_sync_main(f);<br>
      &nbsp;&nbsp;&nbsp; if (ret &lt; 0) {<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
      &nbsp;&nbsp;&nbsp; }<br>
      <br>
      &nbsp;&nbsp;&nbsp; qemu_put_be64(f, RAM_SAVE_FLAG_EOS);<br>
      &nbsp;&nbsp;&nbsp; qemu_fflush(f);<br>
      <br>
      &nbsp;&nbsp;&nbsp; return 0;<br>
      }<br>
      <br>
      Now if we block in migration_ioc_process_incoming for reading
      magic value from channel, which is actually sent by client when
      this qemu_fflush is done. Before this qemu_fflush we wait for
      multifd_send_sync_main which actually requires that tls handshake
      is done for multiFD channels as it blocks on sem_sync which posted
      by multifd_send_thread which is called after handshake<code class="Code-module__code_1c6VC test-blob
        Blob-module__blob-code_2w-Pp"><span class="hl-source hl-c"><span class="hl-keyword hl-operator hl-c"><span><span><span></span></span></span></span><span class="hl-meta hl-function hl-c"><span class="hl-entity
              hl-name hl-function hl-c"><span><span><span></span></span></span></span></span><span class="hl-meta hl-function hl-parameters hl-c"><span class="hl-meta hl-group hl-c"><span class="hl-punctuation
                hl-section hl-group hl-begin hl-c"><span><span><span></span></span></span></span></span></span></span></code>.
      But then on destination side we are blocked in
      migration_ioc_process_incoming() waiting to read something from
      default channel hence handshake for multiFD channels can not
      happen. This to me looks unresolvable whatever way we try to
      manipulate stream until we do some changes on source side.<br>
    </p>
    <blockquote type="cite" cite="mid:Y2OKCel2FlMQw+bI@redhat.com">
      <pre class="moz-quote-pre" wrap="">
With regards,
Daniel
</pre>
    </blockquote>
  </body>
</html>

--------------zx50FRIAYyGN1VwrBejjWxRt--

