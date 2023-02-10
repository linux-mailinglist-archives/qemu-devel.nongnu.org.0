Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 368D76918F1
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 08:05:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQNSD-0001EB-Dq; Fri, 10 Feb 2023 02:04:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQNSA-0001Dx-34
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 02:04:14 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQNS7-0005Cq-94
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 02:04:13 -0500
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 319NNkdk002196; Thu, 9 Feb 2023 23:04:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=qz7t4+2kb2A1j0OZllYE4nPUYVntu8jo3pEL0lVnjyg=;
 b=v2X8HQ25k7jnMfB43YVXWyCg/x9x+OOVcbWS4N3AuMeXzR9iAxinX6fXALkE20/17Go4
 +5ghfuhEDQhJvxLK3F1hx1blt1R+4qXxZlruijIjoVB70b8cQRUT0Bbka3r4K2VBLmen
 IbIgWZXmknOlUoy5c6EAQESPWfLQ0B/isJ8ZdPSgwLg9OaiIOnB+j1v6PZGoGxmlMqVf
 L+jagxnZ3iIAm0587yuQ/oAEFs3ZYCjEROUwEwuIeiH5IxgGCuPaWCqjbBogFYbvH5Y9
 FZYqrwdOt5VJP6DXgcRZguFrwvj/eXrdTDNRJPcbkJ/KAHQmhDkzWov8uC82qPOEIhBM gA== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3nhqt4t109-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Feb 2023 23:04:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N9Vm/yUiPXJWTd1JmjfQXWBnxoseuLjgs8CrWONl7P/9a9Xl2t/6+gdIlrRWYUK7DXyv/903twFBwC5P6w4htACbIsHqN+QUOSeqpLjnRsQSzeIb3Crt+qu4d/EVhnx4fSZtWhBDujwxpNadCCoRW0c6AIvcScDvVZPNcJhJ7bFZ32d0Z8k+T6TIsSyptPC1ccZYFvWx8tw8IjIzVJDhudFEJNzIjlxWG1D2EHTmcCwAr2VhQUB8Gxj/Ex41CJhMmxqXNMNzdQPzyw8LxH829bdb/yCSwqJ4yShCsH4hzWHe67I4VjaPEULsXlBV3OqnAgdmCF+AmUQXsEnITz7ycQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qz7t4+2kb2A1j0OZllYE4nPUYVntu8jo3pEL0lVnjyg=;
 b=DqDyCtLrqZ2SWjPOUYRgdDk5yWbrLsLmVoJuCoZtYg8H0aaT8YiuZYQJ38d0Nh0cztHihj/CiqfN2mQ6xGZuh78PHRK+yMarfIbnPbm3Sgwgx5qXjhQZsfCzgt6SI/tcCLEq7KbY0oVLJ0EaAepVFynAjK51TFwYNCDVuZ67ClDShm52wRVtJybrihDNbjdGgDm2VfHXB4AoyB/aocGEqLA8clm/WHrpTKCJWUoP0WLOBRYrT3VCgY5FOT2zb2UeWc+2JEnxEERg6Q0VWQd9D9oS9qStlpXuS1ArSf4vII5ucDqqpKcAppo1B0eBBVE4eRgWFn7tqlm/BBdE6c7T3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qz7t4+2kb2A1j0OZllYE4nPUYVntu8jo3pEL0lVnjyg=;
 b=gg6pW/S3gF1kD/UopLnaY1DYyyexqrZrwT6LIONOTiWJ4KmPQs7gD48P/m46T7vQ/PoUva0XtVmgkZzCNWZLxlfWtQHlavWOVd5FhTS66fi8mWScVMKEUFmF3W93+lwqpUyE04USzUPaojh9POS21J8BOqwWs6pQqXd3HYk5Yq3S3M7j9Zc5bHovMuXx6ZY99/Hqmyf0/W0dcsR9g3i4AS9xJ4RANvrmtxbiD6Kmn9KbkpmsRcgeu/50TJQIKt7u/OlQXJfKKTKZOyzOuy0EHswx4/oo17dK3wGOZ91EYiaO/j3rmFbzeFGoivujvxkgnP1yzw1YXTis/hFPf/FfhQ==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by PH7PR02MB8979.namprd02.prod.outlook.com (2603:10b6:510:1f9::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Fri, 10 Feb
 2023 07:03:51 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%3]) with mapi id 15.20.6064.036; Fri, 10 Feb 2023
 07:03:50 +0000
Message-ID: <5818f2d2-a67d-adac-5411-92ea32ed358a@nutanix.com>
Date: Fri, 10 Feb 2023 12:33:39 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 4/6] migration: Avoid multiple parsing of uri in
 migration code flow
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
References: <20230208093600.242665-1-het.gala@nutanix.com>
 <20230208093600.242665-5-het.gala@nutanix.com> <Y+TicReIdgA9P6q3@redhat.com>
 <fbc3dc05-181b-9a13-1707-a42227eb0824@nutanix.com>
 <Y+T95ChV/BW09/pN@redhat.com>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <Y+T95ChV/BW09/pN@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::18) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|PH7PR02MB8979:EE_
X-MS-Office365-Filtering-Correlation-Id: 55407125-a0c0-4d1b-ec7e-08db0b34f667
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /mibAs3AED7/kEjJpE5BA1xBF6pSqf+UMQVnrWvnHlvqpJB1qvkKgr2rHEpMw8i6JIFgsrzpLgai8jYeMlPnMq740WeMwfPDxsWpGoQIAok2+6A/G9bjrlNZeG8n8cx8XRyc34M3R3V02B+fi+qmPa62DQcmlwrK5fzkhQ/LJ6Q2JXyPlFMbbCXWfhjZxKtYKQUB1+vh2tsQnPvBK3JmNUQTsxVXhGU9BZpMU9rYOXfAET8KDM8bIfXpwvRXRTxuVHshha/y/3cvdyxIwKurp59j5H+EcpcFueZyb3vSiylEZyPheaPxapRoMuFeFhoiV1Cv5t55b+oMAMHSMpeHapK/3wIYdb+CBFtTs0LqgYsq+0LkbBKm3YYi+nfoc7J9qEjl6kjRpPC9r+SOrwaPk22crfCqoS1YXHgHvn5kIUuIBPc6AjvLUrUefKfQelgmfnyhVFqBazy4EShLETc6O+Nf2/WziezHIcb48TpneaXbyRd8+0wQM9DkeEljViPU2l6CXAnkMmF0eOA2rUMa8WGD9IOPd7XClvh59ONtGTjm11hhBbPhHs4KjDrVFnM+TeZjNPJd0j2J9zpP8chjlEuVC+Ay82dV7bmz+401HCOz753+1fMMbO1v/CPrXPzMOqYk+kwuwmOyLoUGlUzl8JCagZkSAerc1MIjayn7+70dMY0B1G0m5BOA4ycujXm+yehmEG/VRx73rMNu9A4aK6fLaSRiHORNRdvueLurYuA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(366004)(39860400002)(136003)(396003)(376002)(451199018)(107886003)(53546011)(6666004)(41300700001)(8676002)(6916009)(4326008)(66946007)(66556008)(66476007)(31696002)(83380400001)(86362001)(38100700002)(6506007)(44832011)(36756003)(2616005)(186003)(8936002)(5660300002)(26005)(6486002)(31686004)(478600001)(2906002)(316002)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWZ0a013Mzh6Zkk3Szh3UTVnQm5Wa1NYb1dVK0FYak9VdE43dWdqUUdTK3dw?=
 =?utf-8?B?a2F2UUdnSWQ0b0doallHTzZpUjlxbllxY2VNZmdNZUdheFMxSU00eXl0cExJ?=
 =?utf-8?B?QlNoa3UwN3B3dFk0Y1NNMUJSS1UyVGlkaGRTdzdFeUs1Z2Q5bGlvV0s5MG10?=
 =?utf-8?B?bEMydXJ0SVA5ME8rdzdTM3B5Q2RjUGJIdW1sYWY5cisyOWp3VDR3RnFDR0oy?=
 =?utf-8?B?K1UxQkUxMTRkeXVBb1Y5bkRmRm9USENrWEdHZW9HS2NTc3F5eHBGYjNNbktQ?=
 =?utf-8?B?Zkd4QVhJUnNHMHArd0Q4Tjd2ckVrc1ZnK3BqRVdtdGgxTHRFaVAzV1V4Y29q?=
 =?utf-8?B?cERhdlhEVEg3MTcxVVA2NTk0UWVyZlZ4aWpyWkZ1TkpPQk4zeURQT1JGVVJs?=
 =?utf-8?B?YTN5N253WEZaWUdBNDZUTElVVkc1cEliaFZHTjIyS3RKVkVPL0FZUi9Bbnd6?=
 =?utf-8?B?aDM3ZVVrYm52azYvbHdEOG56WmpGVnJkeU4yOUxwcTQrbHdyOWY3RHdyM1Az?=
 =?utf-8?B?dFd2Q2FUVWFGTWljdVhFUmY4czR4NmlIR3JxYStHY0pPSE5WRk1JS2k0M0ph?=
 =?utf-8?B?WVZ0SEh5SzQ2Qit4WERXWjNYOXExQk4xZ09WMFN4UEs0NnVGR2Vwekp0RDFy?=
 =?utf-8?B?U2c4OHN1YnZ6eStYcDdpdjZ6M21NZkFTMktUR0ZkZ2ZTdm5OSDZUemxhand0?=
 =?utf-8?B?aTBMYXV6MW5jeUtINWJZM1VYaTY2UXZIa2hTVnBHeGdzTThvQTJ1ZXpWdEI0?=
 =?utf-8?B?T0hPSW4wUE11TS9YUUJDblRtK0ZWa1NKcGtRYndpY285aFpEa0VTVWRRdDd0?=
 =?utf-8?B?eXUxTXNIQzMrcFoxKzFhT0JOSUNrT2diSHRwN243WmQwSmFhWS9lVldrU0FO?=
 =?utf-8?B?N2c0SUhER0ZBVHFyMjNyMXRURkhELzhXU3hTTFlyK3RpTDdLdGtJUkRvQmxH?=
 =?utf-8?B?eE9NMmhWQlE0aG9tbGJOM0dKKzNQVDBGekZRbGxzUGV5UTJXRWpHYTZDQjNJ?=
 =?utf-8?B?REZSUU8vaFY5MlRJTUI3S3dZeWUyOWlldUtvT1lwNlZXYmtabEM1OHA4THZy?=
 =?utf-8?B?VmlBeHBtbVRwV2FhcFBLZjNHeVl1ZE50b0VoYm9NMTFJNzlteE81Uml6NDdI?=
 =?utf-8?B?VmtMeWtYVVpkNFY0MnBaT3lTQzBFaUhLazNQL0NXcUhmUExNc0lLcGdCdnFF?=
 =?utf-8?B?QlJUWXo3OC9rVy91YW1BNEZ1cHBNTXcwamptSmx3N2RKUEZLTEtPL0pORmJL?=
 =?utf-8?B?WFYzRW5adkYzWUJCS1Y2Yjc5RGJuK3NRMCtCQlZpUit3T3BDOFVQYnRFZkJD?=
 =?utf-8?B?cGdicHlISEYxSjYrTjhXS2daRE1zakM3SDhydkxsMDY1N01ram13YTJuVjBJ?=
 =?utf-8?B?TFpwQmxyUGRHaUdYKytoSzhqUHBONFBTWFdUUkxwUkFieTd4aXQvNWI0ako4?=
 =?utf-8?B?SExzTFFuVGl0dHU3bmVVQ2ZFSDBwcGRENWtHNDlJZVdya1F5T2RIOHE5dEM5?=
 =?utf-8?B?RFE2ZU8xUEZQc0tjOWNuNm53ejFVbjdpb1NvSys5Z25KelhqR0dUcVErdG9N?=
 =?utf-8?B?cEZ4ZUx1bVdPaUtUUTBoYzlIUHFXaTZYNWNlUmlXRE9RV0ZieWdicjN4TXVl?=
 =?utf-8?B?QXJmYzB1UExDdXd0c1VSS2REN0pTL0JkK0xlWUEwcHJSRHl0L1oxaWFDRElo?=
 =?utf-8?B?c1NPRmVSa2ROb0pkM2hqVmxBY0hwVlhJbVBvWFJ3T2RKMjdnNXk0UmMyazVy?=
 =?utf-8?B?Q09vUFllb0UzRUxaeVVqc2lST0FXekRacGVwSUVhRzBMdW80cGRaUTA2VGkv?=
 =?utf-8?B?c2o0Z1N4ckVsbFc3dUY4OXpWRUNPYWJKR0tadjhSMWZ4SXhRTU9VVnhXeWxn?=
 =?utf-8?B?OVhwQ2lhYmwvaWxrNW1SUGlmbXpaWnpkZndaczlSWkxPN1MxdUNGOTJWdEVN?=
 =?utf-8?B?YzhpdG5sZ1U4cjRteVZsTFFsVVZrRE5DK21ac3dGaTlKbEhLSFowdjlNb0VM?=
 =?utf-8?B?dDF3TzFlTXNCMXZrUFhZcGUrWXd1OEpxaWw5Qk9KeDVxaU5tV3dTN0I3RTJw?=
 =?utf-8?B?ZG15WTZlNXBkSS9DejZTS1ZweW53QlhDZnFYTXlmR3E2S2xNb1hyeW5MZ05Q?=
 =?utf-8?B?L09aN1hUeWJTd3U0RkJXRHowSW1mQ0ptZGlXTXhDSGllOUFYUlIvTkhIWWl4?=
 =?utf-8?B?UkE9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55407125-a0c0-4d1b-ec7e-08db0b34f667
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 07:03:50.7017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6xEWLmHrGn6pChga/5vWe47BkRtHE0fhpfoqTibZltPCU2Cr6Hfti4kOHWgXFv5bisfbM1Z7YGoL0aks51wcvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR02MB8979
X-Proofpoint-ORIG-GUID: OgEq-Tc-dYYbHyELcaLgS2Qv4jWuybT0
X-Proofpoint-GUID: OgEq-Tc-dYYbHyELcaLgS2Qv4jWuybT0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-10_02,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=het.gala@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 09/02/23 7:36 pm, Daniel P. Berrangé wrote:
> On Thu, Feb 09, 2023 at 07:24:48PM +0530, Het Gala wrote:
>> On 09/02/23 5:39 pm, Daniel P. Berrangé wrote:
>>> On Wed, Feb 08, 2023 at 09:35:58AM +0000, Het Gala wrote:
>>>> In existing senario, 'migrate' QAPI argument - string uri, is encoded
>>>> twice to extract migration parameters for stream connection. This is
>>>> not a good representation of migration wire protocol as it is a data
>>>> encoding scheme within a data encoding scheme. Qemu should be able to
>>>> directly work with results from QAPI without having to do a second
>>>> level parsing.
>>>> Modified 'migrate' QAPI design supports well defined MigrateChannel
>>>> struct which plays important role in avoiding double encoding
>>>> of uri strings.
>>>>
>>>> qemu_uri_parsing() parses uri string (kept for backward
>>>> compatibility) and populate the MigrateChannel struct parameters.
>>>> Migration code flow for all required migration transport types -
>>>> socket, exec and rdma is modified.
>>>>
>>>> Suggested-by: Daniel P. Berrange<berrange@redhat.com>
>>>> Suggested-by: Manish Mishra<manish.mishra@nutanix.com>
>>>> Suggested-by: Aravind Retnakaran<aravind.retnakaran@nutanix.com>
>>>> Signed-off-by: Het Gala<het.gala@nutanix.com>
>>>> ---
>>>>    migration/exec.c      | 31 ++++++++++++++++--
>>>>    migration/exec.h      |  4 ++-
>>>>    migration/migration.c | 75 +++++++++++++++++++++++++++++++++++--------
>>>>    migration/rdma.c      | 30 +++++------------
>>>>    migration/rdma.h      |  3 +-
>>>>    migration/socket.c    | 21 ++++--------
>>>>    migration/socket.h    |  3 +-
>>>>    7 files changed, 110 insertions(+), 57 deletions(-)
>>>>
>>>> diff --git a/migration/exec.c b/migration/exec.c
>>>> index 375d2e1b54..4fa9819792 100644
>>>> --- a/migration/exec.c
>>>> +++ b/migration/exec.c
>>>> @@ -23,14 +23,39 @@
>>>>    #include "migration.h"
>>>>    #include "io/channel-command.h"
>>>>    #include "trace.h"
>>>> +#include "qapi/error.h"
>>>> -void exec_start_outgoing_migration(MigrationState *s, const char *command, Error **errp)
>>>> +void init_exec_array(strList *command, const char *argv[], Error **errp)
>>>> +{
>>>> +    int i = 0;
>>>> +    strList *lst;
>>>> +
>>>> +    for (lst = command; lst ; lst = lst->next) {
>>>> +        argv[i++] = lst->value;
>>>> +    }
>>>> +
>>>> +    /*
>>>> +     * Considering exec command always has 3 arguments to execute
>>>> +     * a command directly from the bash itself.
>>>> +     */
>>>> +    if (i > 3) {
>>>> +        error_setg(errp, "exec accepts maximum of 3 arguments in the list");
>>>> +        return;
>>>> +    }
>>> By the time this check fires, the for() loop above has already
>>> done out of bounds writes on argv[].
>> Ack. check should be before for loop.
>>>> +
>>>> +    argv[i] = NULL;
>>>> +    return;
>>>> +}
>>>> +
>>>> +void exec_start_outgoing_migration(MigrationState *s, strList *command,
>>>> +                                   Error **errp)
>>>>    {
>>>>        QIOChannel *ioc;
>>>> -    const char *argv[] = { "/bin/sh", "-c", command, NULL };
>>>> +    const char *argv[4];
>>>> +    init_exec_array(command, argv, errp);
>>> If someone invokes 'migrate' with the old URI style, the
>>> strList will be 3 elements, and thus argv[4] is safe.
>>>
>>> If someone invokes 'migrate' with thue new MigrateChannel style,
>>> the strList can be arbitrarily long and thus argv[4] will be
>>> risk of overflow.
>> Okay, Can you give me an example where strList can be very long in the new
>> MigrateChannel ? because in that case,
> The new MigrateAddress struct allows the user to have arbitrary
> command args, so for example I would expect to be able to do
>
>
>   { "execute": "migrate",
>       "arguments": {
>           "channel": { "channeltype": "main",
>                        "addr": { "transport": "exec",
>                                  "exec": ["/bin/ssh",
> 				         "-p", "6000",
> 					 "-l", "root",
> 					 "-o", "CheckHostIP=no",
> 					 "-o", "ConnectTimeout=15",
>                                           "somehost" ] } } } }
>
>
>
>> trace_migration_exec_outgoing(argv[2]);
>>
>> will also be not correct right. Will have to come up with something that is
>> dynamic ?
> Yes, that will need addressing too.
>
> We already need to convert from strList to char ** in order
> to call qio_channel_command_new_spawn.
>
> Given that, you can use g_strjoinv(" ", argv) to generate a
> combined string that can be given to the trace func.
Thankyou Daniel for the example. I understood properly now. Will try to 
handle both the cases - coming from uri as well as coming from 
MigrateChannel struct.
> With regards,
> Daniel
Regards,
Het Gala

