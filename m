Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AECDC6901A8
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 08:59:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ1ow-0005qG-El; Thu, 09 Feb 2023 02:58:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQ1ot-0005pQ-Bs
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 02:58:15 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQ1oq-0006lK-It
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 02:58:15 -0500
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3193RHSZ002005; Wed, 8 Feb 2023 23:58:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=AtuM2/atnwblYJcAxAg+0QItTqWtIqMfX8wIUvOuH+U=;
 b=CIBPTkP6pZSPyb3NCKfNmxJgSlGthzmZjINRwl8eneHnvOzfy//00wi6NVfOdsTAeXUb
 3p6AvuVmJpSCjRUl9hQX4fiBf/J+bG3Qeiaz7v+xK2i+W98NVhhQxz5U60fnCHh0IrzH
 XMEJo7Ngq9IM7+Absmh3Pa5en3oYj4DbWsCKOsmn2Le8B5cCyKb6W4zYWgRO2R+6C1vl
 R9kdsEITlBDQ172SxV92PIlxrGDVEjK2IpRKbctZq1RXMcXSbY9zpDly/g/rZ1jwtbz5
 JCdk1hNTmMh1LJxf3Rtl1Cs2/eV1WPC9dZRmy3eJ55lzR6qUFTqK6FALfyCWNtAzpXdq HA== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3nhqs6h2m8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Feb 2023 23:58:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ats5jx2xwPOv4luK8AFNs/UaBZWxbU8wXm9z8/Oz6iF7R6sIX8qOyoveHj72Yrqm5lVz1SL0GZC8DNKl5G/RZb8MlUYl9wWc3Uu7Z49bIoTS7OITppA11Fvo0SRkDcNKHI4PDZLR74SkhsAwM79rSpicfj8zf7h6bGPTqGcYH4qtK5zmNk8PL8tU4PO4jmQc0huyxGDDeyc6juRQY4rz7oNi2seOxk9IwvpLmevku0L5ZXBo+L2vkZmXU6YJf8nQycsWcS/SVF3LPd4GhsNwS41eXj6CpHmTmQbLrwfRHWP7ggnT4cZoAAdcBun3XGBFdBOqKj2S9LArjQlIonL/Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AtuM2/atnwblYJcAxAg+0QItTqWtIqMfX8wIUvOuH+U=;
 b=UE7rJgVAVxvov2pyBzOqf3Fv7mPS9ydQdJVTK+1MdiehlVs+eshyJViVQk2QyD0IAHsE1DdNRazoPAO+2jkSdhxVeoYOHr82/KrAJhlqUi9rddZ9QHomKYc09b/g7Net3PAU1Y3VZYRKsWwCqiI6bLMFnO77rcX/xPWpZJBViu3mmSlj0ZjGitUYEAqdXC0jPtxxFx4yTrz45/c5bO+4h3JAdhgwW+CNGyzLyN4TD4Fq6QFdjoXSCLeCdNtDS8xsbCAEX0LcZYIwXSV0HVszrwIx02btkCAfz/59z9zjrIu5KqwFQsJwCpM6QROehTrzrk8Zgt2EJcje59cT0TpQiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AtuM2/atnwblYJcAxAg+0QItTqWtIqMfX8wIUvOuH+U=;
 b=G+WEqNuWamV4xTkMk+jtEXqlCCdMH/EE3JtlvcD0+Po3ORML9pGn3CkA9h80YdFPZ5WymkOPX7VP1cLVR2QNTQUyhqGakGIG1+SXQRcjg9rbBXhEp8U4FLl0QygDPP+EalvZi8WXgr4hPxvNdXVNcijvItPnArvPrp1i+R2lQvrOBwGQDDGzpHf2JOxYFD6mVq0eYbbvJCb+CHurRZyUIhji7G3zYGqZ47qmiS5qf2jTtdlaXnATBhUNRBoi5VuxiVxPbItEYyra9Q0IyIJ4fSauQP5Ni/tlZ3Ps6krsqZIsLE4ZuNhVytWhD4/X599UnwtXKNIz8t9T6fgna72Ecg==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by SJ0PR02MB7837.namprd02.prod.outlook.com (2603:10b6:a03:327::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Thu, 9 Feb
 2023 07:58:08 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%3]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 07:58:07 +0000
Message-ID: <db23812a-edd3-f520-b229-5110d6576105@nutanix.com>
Date: Thu, 9 Feb 2023 13:27:56 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/6] migration: Updated QAPI format for 'migrate' qemu
 monitor command
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, berrange@redhat.com,
 armbru@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
References: <20230208093600.242665-1-het.gala@nutanix.com>
 <20230208093600.242665-3-het.gala@nutanix.com>
 <20230208201712.b3a5xtufscrvncqt@redhat.com>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <20230208201712.b3a5xtufscrvncqt@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0066.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::8) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|SJ0PR02MB7837:EE_
X-MS-Office365-Filtering-Correlation-Id: bfc6aaa1-476c-40f4-49a1-08db0a73615e
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JZ/LqVxWU71gYwLU1wo2BK0cW9oLBsO6tvGyS97Dc0gnlFa5OEtf2BR24621rh6/rQFVPOGFBf9J2Zy23TZCmtkhNQELeAGm/9/CJHYLRIVgHtF+UHbGgVYuSKS1CjaqqjR5SBFLkoXY789BdxgKv4dNkEaCbcbwh12yoIq+mnHpb8/+qRYCOi6+4Uf372uZo8+3HUGLJu7qSSF4/4VlGCxXYleeCRXmwK813BaKB5HwSA13VCKgHMd2J338LA62iO57LLX18c73IQ8H2my1EbWdJp2tJtuZoPJag1tc4O9f827VQQ8cARSiTowLE+6xt9Sz4S1TEUX3cE2My3xj04wcAV/PTl5s2jxWO4IuWo7xER49tMxwuoH+naKuB0U4JRZhTnaKXg0CfQiJHcQ97aPQZaFTvw6n1AenMWGFajY8tZhzti3j/WXR8efBfwnV4PJoFQqcvK+uYUxvt9vZENFwnqC4x/eJJ65s+y5bQ5uwfH2OYNrnQrSv1MBB7arydpGaiyo8XTAznXOH0WCcWsbrWjcod+rju+ExCL2MZK5rksdsPZpuDJqbiFGo41FB7VBgVOpdm66bZNprduIc2CrTmGj8nC9xVLRyJ4s8nrsn+v82AleleFxR/aFMV9EOgyVgvWokwm1WMnZ7xflRqvTQ/KIogeJjyG93SVoErvYsNDg56JFQ0/i4SXAeJjMpDOySjmyKvxf31td7ZWzLyJxkLuifLOe9+dWg/BPr8RM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(346002)(366004)(396003)(376002)(136003)(451199018)(2616005)(83380400001)(31686004)(38100700002)(316002)(5660300002)(31696002)(86362001)(36756003)(6512007)(2906002)(26005)(186003)(6666004)(478600001)(6486002)(66476007)(66946007)(6916009)(66556008)(44832011)(4326008)(8676002)(41300700001)(107886003)(8936002)(6506007)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dG0wWDRYWHdRSG9jaE5EVGlmTjg4LzFFZUtjUjlWTXpvVUJQTmIzZjg2ZVhZ?=
 =?utf-8?B?amFIelRabC9zbVFOT1YwQlNwWFdidndvVVoxTlo5cHozdW9xT2VLeCtzNHhN?=
 =?utf-8?B?ejduKzdFd2FvU2tBOVZIZFc0bzhvSkhIQ3dEYWFxQndXUWVlblJFSnppeGdS?=
 =?utf-8?B?ZjVVdG5nU1k1WG5hVnd5WlIzMDU3RHFFNzF4UFRPbVZLd0swT3BTTlBmaTky?=
 =?utf-8?B?aW1VazQzQk8rQ2dNQzBxRkFDZSthOGcvUzRpb3JpbFFWdEVjL3VValZEekFt?=
 =?utf-8?B?VmZlOTlkUml3NnduTVpWNzRlTFdpMTcvOU5mMGJlanRzTFBrUFluc0E2Q1ZQ?=
 =?utf-8?B?ek9NZ0k5UndobC9XaFlqMWxXY0d2cUdCRDVFOHpHQWdkTUJkL0J4S3EvUHJ1?=
 =?utf-8?B?V0JqQVFyRmlCU1VzclNCbjdFZDl1U3R1aXVBcmVjSzBLcXkxL0JLSUZPSlRp?=
 =?utf-8?B?T3ZUbEFOOTZjU3UwbWZNaWlaeHhQUDdpOWF0SVphVGk1VkozNm9udXdmY0xM?=
 =?utf-8?B?cktjUmJTRmhhcWs2VkJJL0NaTFlOZ05Ja2YwQ3lkdkxNNll4VlNueHl0ZnVm?=
 =?utf-8?B?UFhmOTY2VTZVa1MydnArOGpUYjJ2RThWWko1cis2d0I3em9tdTcrWWVkRzlP?=
 =?utf-8?B?djhLc1dDSElWSDJrQ25jRzlUVXRjTHN6d295Y3FsSEorWDk2OVJYZFVJRDdU?=
 =?utf-8?B?OFZnUW4xV3Bzdk1MZ3JLM2d1SGdIQWphdE5JZ3FUekhKZnBCcFM3a2Vsa2ds?=
 =?utf-8?B?TnpWYlYySzZuNUw4Y0hZN00wS3BBN053bW42dTFPRmJ3YmhjZlFKblA5cmQy?=
 =?utf-8?B?eUIyYzdDV3Awd2hEaC9EVjFZdzNSR3FjNUxZVjNXN0RpRWpNb3J1QzJOR2cv?=
 =?utf-8?B?dGd4TkZhTUxrUHZkOFlobGZqKzFTTklUZzV6N3RQMlpDbE83bVJUYTliTFg2?=
 =?utf-8?B?bzhIQXc5em1rLzJINGs0ODdadjVyc2dDUjJFU3VlcDJqUUI5b2Q1QytLQWxU?=
 =?utf-8?B?dVkyMGpFazFRR2xjandZb204OElNSjhleGZaS0w5dkJCamcwTmMxblFzV2tK?=
 =?utf-8?B?V3dmYWFTa0UvbjZCRXZkd1psYU9ZV0ZDSjFZZnBFdmlxK1ZIcURyTkVhNTdD?=
 =?utf-8?B?Smh0eEMzV2xtUmFpM2xOcXlGSjZBb2hYRnBhRWRpbjBveGZwTFhlKy91aHVN?=
 =?utf-8?B?YkI1ZytETmVDWEZ6VW95NUxUYlJhTUlSdTRtelhVU1Z2NDAzVThROUZBVkZ5?=
 =?utf-8?B?RkF0Z3F2NWphbWE4YXBhNGdjMVJSYmd6dEdKNVFvS0pxSHZ4akgrMjl3Q0g1?=
 =?utf-8?B?cFNGNU92dHRJbDdtcWR4T3JtYmk5OEErMWFjenM1L1FsV3pwd0FTNkFtY1N3?=
 =?utf-8?B?TDdTSmIzVldqRGkxbjVDL2N6bCtlMEFFWU9scmpsS0xZSURnN2VjTkNEeExF?=
 =?utf-8?B?WE40QWFRV21mTzZ0SzkvY2IvcVZheUFTK0UwNC9qQldmRENkYnJ5MXZEanlN?=
 =?utf-8?B?NElHOFVaZnpYVE50dDFXTTIyN0ZlK0JSNm0zKzJNSFBQdzhFcDRwUGZZMEVG?=
 =?utf-8?B?TlN0RFZOUGVuTlg3NDVucXNhYkF2TzVZZjNkZWFqam5uQmRaYmFsVTRRRWNB?=
 =?utf-8?B?TW9WUHBXNEJSeFBod3dsYlVFWjViQzV2S0NTNmV6MC9WUjB0UlVsdWJ2S3Za?=
 =?utf-8?B?eTBPcnYwMTBIOTRMS0lidG02aU9PUjVENG5DUDMzUWNhVzJERkVXVkgzQjA0?=
 =?utf-8?B?T3BtRmNoTzhUbDJUMlM1WkRmZi9mNStPZzJNSWpURCtpLzg0dEd6VHlIRG5y?=
 =?utf-8?B?b0c0UTZqY2MxaG9BZ09TWTZFV0JXaFhWdkM4SDJGdjMzSTB2cTFhNEZGdk5x?=
 =?utf-8?B?MkR4TnNtenBiNm40U1FMMFFHK1JVei8wVVRTdU16TnNqTlZOaEZhZ1RValZG?=
 =?utf-8?B?M0p6bDhBMmJuSXFYVzR4RFgyS0VFWFdhQmdZKzRsdU5HSEplNGIvdml0SlRl?=
 =?utf-8?B?Z1hhWDRleWZkNVRRWSsvRU1CWjMyZExEbjNCYW1JV3JZUVVyUDRGVHNBeDBo?=
 =?utf-8?B?MkVXMUtsUklLeGdjVVJaSU42MWQ2OWlNZ3NPYWNkbDUvL0tRS0tIV01UWE8w?=
 =?utf-8?B?Vm1xNzJpU3FOVzdjZkhCMzdGTThLQVpWdktLYW55UEdYa3FsWXVlSW5FTG1J?=
 =?utf-8?B?TlE9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfc6aaa1-476c-40f4-49a1-08db0a73615e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 07:58:07.8361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tlCc9gBYfOtCmVszNlFE5na9d2FpQSmSWVZGIV099QDDzNkQRNMIK3fOedX4Cntif2wUo2xz86lsydoeFODVnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7837
X-Proofpoint-ORIG-GUID: CoqWQ6aA1odiJM-L216Jig6XbkpeUbLi
X-Proofpoint-GUID: CoqWQ6aA1odiJM-L216Jig6XbkpeUbLi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-09_05,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12; envelope-from=het.gala@nutanix.com;
 helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.146, SPF_HELO_NONE=0.001,
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


On 09/02/23 1:47 am, Eric Blake wrote:
> On Wed, Feb 08, 2023 at 09:35:56AM +0000, Het Gala wrote:
>> Existing 'migrate' QAPI design enforces transport mechanism, ip address
>> of destination interface and corresponding port number in the form
>> of a unified string 'uri' parameter for initiating a migration stream.
>> This scheme has a significant flaw in it - double encoding of existing
>> URIs to extract migration info.
>>
>> +##
>> +# @MigrateTransport:
>> +#
>> +# The supported communication transport mechanisms for migration
>> +#
>> +# @socket: Supported communication type between two devices for migration.
>> +#          Socket is able to cover all of 'tcp', 'unix', 'vsock' and
>> +#          'fd' already
>> +#
>> +# @exec: Supported communication type to redirect migration stream into file.
>> +#
>> +# @rdma: Supported communication type to redirect rdma type migration stream.
>> +#
>> +# Since 8.0
>> +##
>> +{ 'enum': 'MigrateTransport',
>> +  'data': ['socket', 'exec', 'rdma'] }
>> +
>> +##
>> +# @MigrateSocketAddr:
>> +#
>> +# To support different type of socket.
>> +#
>> +# @socket-type: Different type of socket connections.
>> +#
>> +# Since 8.0
>> +##
>> +{ 'struct': 'MigrateSocketAddr',
>> +  'data': {'socket-type': 'SocketAddress' } }
> Here, you use 'socket-type',...
Yes, I wanted a suggestion here actually. Will 'data' instead of 
'socket-type' be the right fit ? It will also be consistent with exec 
and rdma if changed to 'data'.
>> +
>> +##
>> +# @MigrateExecAddr:
>> + #
>> + # Since 8.0
>> + ##
>> +{ 'struct': 'MigrateExecAddr',
>> +   'data' : {'data': ['str'] } }
> Inconsistent on whether you have a space before :.  Most of our qapi
> files prefer the layout:
>
> 'key': 'value'
>
> that is, no space before, one space after.  It doesn't affect
> correctness, but a consistent visual style is worth striving for.
Okay, thanks Eric for pointing it out. Will make sure I follow this 
going forward.
>> +
>> +##
>> +# @MigrateRdmaAddr:
>> +#
>> +# Since 8.0
>> +##
>> +{ 'struct': 'MigrateRdmaAddr',
>> +   'data' : {'data': 'InetSocketAddress' } }
> ...while these branches supply everything else under 'data'. Also,
> while you documented @socket-type above, you did not document @data in
> either of these two types.  [1]
Ack. In that case, I feel it would be better if I change from 
'socket-type' to 'data' to keep consistency among the QAPI.
>> +
>> +##
>> +# @MigrateAddress:
>> +#
>> +# The options available for communication transport mechanisms for migration
>> +#
>> +# Since 8.0
>> +##
>> +{ 'union' : 'MigrateAddress',
>> +  'base' : { 'transport' : 'MigrateTransport'},
>> +  'discriminator' : 'transport',
>> +  'data' : {
>> +    'socket' : 'MigrateSocketAddr',
>> +    'exec' : 'MigrateExecAddr',
>> +    'rdma': 'MigrateRdmaAddr' } }
> Another example of inconsistent spacing around :.
>
> I'm guessing the reason you didn't go with 'socket': 'SocketAddress'
> is that SocketAddress is itself a discriminated union, and Markus does
> not yet have the QAPI generator wired up to support one union as a
> branch of another larger union?  It leads to extra nesting on the wire
> [2]
Yes Eric. I did search if it is possible for a union inside a branch of 
union. That's the reason, I had to choose this path for 'socket' and 
'rdma', and to keep consistency, I did the same with 'exec' too.
>> +
>> +##
>> +# @MigrateChannelType:
>> +#
>> +# The supported options for migration channel type requests
>> +#
>> +# @main: Support request for main outbound migration control channel
>> +#
>> +# Since 8.0
>> +##
>> +{ 'enum': 'MigrateChannelType',
>> +  'data': [ 'main'] }
> A different spacing issue: most arrays in QAPI either have spaces at
> both ends (as in [ 'string' ]) or neither (as in ['string']).  Here,
> it looks lopsided with space at the front but not the back.
Ack Eric. Thanks for pointing it out. Will take care about this small 
issues from next time.
>> +
>> +##
>> +# @MigrateChannel:
>> +#
>> +# Information regarding migration Channel-type for transferring packets,
>> +# source and corresponding destination interface for socket connection
>> +# and number of multifd channels over the interface.
>> +#
>> +# @channeltype: Name of Channel type for transfering packet information
>> +#
>> +# @addr: SocketAddress of destination interface
> More than just a SocketAddress, per the discriminated union type defined above.
Yes, infact one of the branches MigrateChannel. Ack.
>> +#
>> +# Since 8.0
>> +##
>> +{ 'struct': 'MigrateChannel',
>> +  'data' : {
>> +	'channeltype' : 'MigrateChannelType',
>> +	'addr' : 'MigrateAddress' } }
>> +
>>   ##
>>   # @migrate:
>>   #
>>   # Migrates the current running guest to another Virtual Machine.
>>   #
>>   # @uri: the Uniform Resource Identifier of the destination VM
>> +#       for migration thread
>> +#
>> +# @channel: Struct containing migration channel type, along with all
>> +#           the details of destination interface required for initiating
>> +#           a migration stream.
>>   #
>>   # @blk: do block migration (full disk copy)
>>   #
>> @@ -1479,15 +1575,46 @@
>>   # 3. The user Monitor's "detach" argument is invalid in QMP and should not
>>   #    be used
>>   #
>> +# 4. The uri argument should have the Uniform Resource Identifier of default
>> +#    destination VM. This connection will be bound to default network
>> +#
>> +# 5. Both 'uri' and 'channel' arguments, are mutually exclusive but, at least
>> +#    one of the two arguments should be present.
> Grammar suggestion:
>
> 'uri' and 'channel' are mutually exclusive; exactly one of the two
> should be present.
Ack.
>> +#
>>   # Example:
>>   #
>>   # -> { "execute": "migrate", "arguments": { "uri": "tcp:0:4446" } }
>>   # <- { "return": {} }
>>   #
>> +# -> { "execute": "migrate",
>> +#      "arguments": {
>> +#          "channel": { "channeltype": "main",
>> +#                        "addr": { "transport": "socket",
>> +#                                  "socket-type": { "type': "inet',
>> +#                                                   "host": "10.12.34.9",
>> +#                                                   "port": "1050" } } } } }
> [2] This is the extra nesting that occurs because of the
> 'socket-type':'MigrateSocketAddr' above; getting rid of the nesting
> would require 'socket-type':'SocketAddress', but QAPI would need to
> support that first.
Yes Eric, excatly.
>> +# <- { "return": {} }
>> +#
>> +# -> { "execute": "migrate",
>> +#      "arguments": {
>> +#          "channel": { "channeltype": "main",
>> +#                       "addr": { "transport": "exec",
>> +#                                 "exec": ["/bin/nc", "-U",
>> +#                                          "/some/sock" ] } } } }
> Another lopsided spacing in [].
Ack.
>> +# <- { "return": {} }
>> +#
>> +# -> { "execute": "migrate",
>> +#      "arguments": {
>> +#          "channel": { "channeltype": "main",
>> +#                       "addr": { "transport": "rdma",
>> +#                                 "rdma": { "host": "10.12.34.9",
>> +#                                           "port": "1050" } } } } }
> [1] These examples look wrong; above, the schema named the nesting as 'data', rather than 'exec' or 'rdma'.
Yes, instead of 'rdma' or 'exec', it should be replaced by 'data' here 
in the examples. Ack.
>
>> +# <- { "return": {} }
>> +#
>>   ##
>>   { 'command': 'migrate',
>> -  'data': {'uri': 'str', '*blk': 'bool', '*inc': 'bool',
>> -           '*detach': 'bool', '*resume': 'bool' } }
>> +  'data': {'*uri': 'str', '*channel': 'MigrateChannel', '*blk': 'bool',
>> +           '*inc': 'bool', '*detach': 'bool', '*resume': 'bool' } }
>>
> But overall, I'm a fan of using a more type-accurate description of
> the channel than the open-coded 'uri':'str'.
Yes, 'uri':'str' is kept for backward compatibility right now. This will 
be depricated in later stages.
Regards,
Het Gala.

