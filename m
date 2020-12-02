Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C648C2CC316
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 18:10:18 +0100 (CET)
Received: from localhost ([::1]:46616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkVdx-0003LT-LE
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 12:10:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <priyankar.jain@nutanix.com>)
 id 1kkVXI-0005sq-Ep
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 12:03:25 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:28758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <priyankar.jain@nutanix.com>)
 id 1kkVXD-0004TA-Ct
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 12:03:23 -0500
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B2H2gER028975; Wed, 2 Dec 2020 09:03:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=Reb10Bw237vGMTMRUKxZoACNmv/ymju9qNoROt7KFyk=;
 b=hYNaXMFJqYgGDFA3jBLdWx11rPuHZMtju/FQ+geWEhiDlfzAxYxTKG2HDtLueymdTE1e
 cLkEu9ztaVKZ50+65GK4Y7OIa3B70/OV5p7B6e+YGZ14VwQz84inzn554bk05X/OIUGW
 wpDIgU6gvX/kNNOob8DhvfZjnmYEUutVzzuJ+3E2ttDxZoetNQW4PZBDVKXjEeJ9xK/V
 sR+gGvzB140RW2Qtg6vIhXZ8Gl+LtB5pgcNc+l2UB60L014wBSzS43/EGWXpICSSbGT6
 SIjcH8UcdDD9Yu9CjROV8cogT/4YWIOYbCJyaus+57dxb2pW8pfzGAiyX2m8Ollg+TVz fA== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
 by mx0a-002c1b01.pphosted.com with ESMTP id 353pgmrxhn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 09:03:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i82uRO17RsARrSLM6P63Sw16OAoIDKR9wxoT4frn48g+Z3W8XO3l4q8iMc1ALQg4AEN2IUGXaaJBUqPIcedrsJ5kAjslbb4geGVwPWu85H4D2byBtMJBxh+8MWme6jFbA/pr/WFKsqASs6SsjUP2AvbCiVvIT7BaO3iiyc7o7ekWYxHpcSo+flhWIO70nnNmaSqGtlkM0dMzc9okCSGt1Le/Ha7VDMc+m54tpPYWSGukkdjFUdmESwOOcUeGqElW9EfxBTjXvYPbnFTNQmwa1lJ9tWFQ5HZAhvrZsB1aF14Jx3I0r1HQ4snq9Xa9PVgfI1WP3hoFNVU85PawUiM8Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Reb10Bw237vGMTMRUKxZoACNmv/ymju9qNoROt7KFyk=;
 b=oSsWSTr5uGTKNJtaHkla46loHsz0dfM9tPhtGTFgx1YVo8qhjOYL4nlbsxK4a7Ay5xeqr41TNSXh2M3KRtQegj5rx1p1r5fstvSofAUxBdJKwElLt1LvBcHvQHN7SZnET08kRB33Pz8E9mQPsu5fjF+gYsF5bZzpPArSRDhS5xo8BWQBXQocAu64RYE43u+RYRTVkhSziw8VGQfD1yWLuqcaqE7wXutPVtM7DddGdTLHmk3J0iCHH2ZROqukmH6INcZY7TRYbceZTVMmQ0E0UsioJKC6E3ZDUPvHAKOei2FPssj5Z7pOvUJRsk3EWizYoSvR/ft3QV8tufJ3PMvdSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
Received: from SN1PR02MB3822.namprd02.prod.outlook.com (2603:10b6:802:31::32)
 by SA0PR02MB7482.namprd02.prod.outlook.com (2603:10b6:806:ef::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Wed, 2 Dec
 2020 17:03:15 +0000
Received: from SN1PR02MB3822.namprd02.prod.outlook.com
 ([fe80::50ff:8f29:a50d:b815]) by SN1PR02MB3822.namprd02.prod.outlook.com
 ([fe80::50ff:8f29:a50d:b815%7]) with mapi id 15.20.3611.025; Wed, 2 Dec 2020
 17:03:15 +0000
Subject: Re: [RFC] dbus-vmstate: Connect to the dbus only during the migration
 phase
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <1605810535-51254-1-git-send-email-priyankar.jain@nutanix.com>
 <20201119184724.GO579364@redhat.com>
 <057612c5-a9b8-c7be-c710-1b635aa361be@nutanix.com>
 <20201202161659.GL2360260@redhat.com>
From: priyankar jain <priyankar.jain@nutanix.com>
Message-ID: <f80b1164-c422-c606-88e2-39fa4d7ec1ca@nutanix.com>
Date: Wed, 2 Dec 2020 22:33:01 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
In-Reply-To: <20201202161659.GL2360260@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.146.155.8]
X-ClientProxiedBy: BYAPR07CA0073.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::14) To SN1PR02MB3822.namprd02.prod.outlook.com
 (2603:10b6:802:31::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.22.32.41] (192.146.155.8) by
 BYAPR07CA0073.namprd07.prod.outlook.com (2603:10b6:a03:12b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Wed, 2 Dec 2020 17:03:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c986205-ca9e-4cb3-b6f5-08d896e42887
X-MS-TrafficTypeDiagnostic: SA0PR02MB7482:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR02MB74822FAA09A928744924BB4E83F30@SA0PR02MB7482.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +ida095V8FwPBJkHtAq7oIcvb+8m74WdnpQESZZbPUrnJBVxU+X7SbtTHXM+XHPa6XSIJkJVRhPQhDQl388uUjANrlVCQRHQ9wbwCgMIcGcILA/HNkjIjnzBBQYoh90MFSVw03TiprLiqpBFcvMItn1k9YvA+emLzcpIUiG5N65abRJ9eslzx5QTi8J73JSClmoO3Av9xghjrM8YVQb71EtXS3I8K3mw6ImdQVYG6Jml9yAjUamLq2pYpBOrKAJogquXzNm1cas5a5J31mR/0bDxdCQXNjxxCVVDs6lgli6Yas1AD/KWIiC5JsEDOhqymrLpEHizo+DLDMDX8ZaQ466XvEYBpS/dwm3gU2BsbNUK9PRCeS0E2jiAXC1jTI0b2dwHixv4yioGPRSrYzEYYNxmYs8p4NVDIFWlInveEY4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR02MB3822.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(396003)(136003)(376002)(39860400002)(8676002)(4326008)(66556008)(2906002)(6666004)(83380400001)(956004)(2616005)(31686004)(54906003)(316002)(8936002)(31696002)(66476007)(5660300002)(52116002)(86362001)(186003)(16526019)(53546011)(16576012)(26005)(36756003)(6916009)(66946007)(478600001)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cHpHZUxpS2JrMjNqc3NSQkxFbTlSQ3lwdTJHdHNJTE1iOFExaFAwUHNsNUV6?=
 =?utf-8?B?eEdKVloyWC9pMmVPaFhCd0tGOHlNUFVmT2RrSThadURLamNZOEp6dWlyOVRT?=
 =?utf-8?B?b2lSMjFERkFhNjFLOEJ3WkRyUENDaDBNVlJDa0pYOTFkZ3FMRW4yWHhZYVh2?=
 =?utf-8?B?RlpXcnFaSXFXUmJLRjZHeWhnNGtwWU5UKzcxOGpLQlhBNjhhN0czUTV6cnlh?=
 =?utf-8?B?TXkxbFNHUy9sdWxYL0JiRmVCV3cvYkdHVUlHeWZ2YTJOeFdKeHF1eXluVlNi?=
 =?utf-8?B?RW1DTlduZm5MNVJWeXkvSDlFRVh0emlpblRIMmRuR3dTVllBQ0huT09zTlVN?=
 =?utf-8?B?ZkV5UXpPdHNVcDZWLytEWDVJc1cyNk52MnZESGVGY29aa0NSejZwbTgxV0Jx?=
 =?utf-8?B?RkxiaGV4ekVKc05JVEJXcXNrYVk4b0F1NDcrY1Btd3ZlelhKYTVIOHk4aGdD?=
 =?utf-8?B?UC9YRzBCdWd5U2RmQm5zamNmOWVldFVqOFZJSXlldlNrQXphU0Q1RjZsbmVO?=
 =?utf-8?B?VGs2dGUwSFVNQlZKYkxwd1lXcXQ5T01xRThiUTk4L29jYmo1dHREZ0dXa0Jk?=
 =?utf-8?B?RDBVZnZyZzBuQlBRaEx3NkliclJTaDFweEpqNUcwZTNVSHdocTc5aEJBdFhF?=
 =?utf-8?B?cG9ETWFVa0tyVTBBZnNTd1EzVXVJYldNb0JCRTdrVWZDR1FURXI2cGFCT3RC?=
 =?utf-8?B?WXBWVjZ3bzZOa3pIOG42YzVUWFcyYm8zSGF4NHZ6TW42anFsclFQMjVKVXhP?=
 =?utf-8?B?aUFSbkZOMFhYaVNFS3FaRHh4a1BodlBhZHdOL3hSS1VsQmhDQjJtSUNJaFU3?=
 =?utf-8?B?UzUwZThjc1duNnZRN1Bab1pxRmttZzNTQ0dRRDRQb2JEMXNrdDZoSFg5RUJB?=
 =?utf-8?B?dkNsMmFJemJ2VER2Y2tYYjJQTDBOd3ZySmhZclQ2ZlZUenZ0bHloN2RUekYx?=
 =?utf-8?B?N0EyaldmNTNkclBUOHI1bEpIL01ESGx1YWlUSDlKc0trMXZQc0s2Vjd4Ykkz?=
 =?utf-8?B?bW5adWR0QWE3cjhyUTVoM0VLRWJGbEhNTWlTQzZsRG5SZjV0MlBQdzZTbEsz?=
 =?utf-8?B?aXc1YXR6NEZPZmdaU1dpdW1UNzlYK2xtdEJ3Y3JVYm41b3h2T3RjbVliZmp4?=
 =?utf-8?B?S2pXMW8ram5TdnpRVnVOQVM2UXlJeFFuaUxxUFhweGg2YUh5MVRrYkhkOFNF?=
 =?utf-8?B?WFZrTXlndGsvbmxzMExsenc4RXJoN2VLMTJSNXUxT0pRZGphVkZwREJaMUI2?=
 =?utf-8?B?N2xkQ01ObFFyQTBSeVBBOVZFSTFiTnA5eWl5a1B0MURqNEcrYWc0N2puRDVq?=
 =?utf-8?Q?JtbCjZjHpOP4iBXx1PXJkqSRI3p+Kao7fY?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c986205-ca9e-4cb3-b6f5-08d896e42887
X-MS-Exchange-CrossTenant-AuthSource: SN1PR02MB3822.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 17:03:15.5154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 46O5kF4ZxIEJqpUzIzyAJdCpxty57HwGXel7RsvIiXuVmdb/cRir2/bDhIFu+Bv+MRyeAvj/EwIVNPqQOwXWOBSYHmTOk6VS0zHWGCFaLOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7482
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-02_10:2020-11-30,
 2020-12-02 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=priyankar.jain@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Turschmid <peter.turschm@nutanix.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/12/20 9:46 pm, Daniel P. Berrangé wrote:
> On Wed, Dec 02, 2020 at 09:25:27PM +0530, priyankar jain wrote:
>> On 20/11/20 12:17 am, Daniel P. Berrangé wrote:
>>> On Thu, Nov 19, 2020 at 06:28:55PM +0000, Priyankar Jain wrote:
>>>> Today, dbus-vmstate maintains a constant connection to the dbus. This is
>>>> problematic for a number of reasons:
>>>> 1. If dbus-vmstate is attached during power-on, then the device holds
>>>>      the unused connection for a long period of time until migration
>>>>      is triggered, thus unnecessarily occupying dbus.
>>>> 2. Similarly, if the dbus is restarted in the time period between VM
>>>>      power-on (dbus-vmstate initialisation) and migration, then the
>>>>      migration will fail. The only way to recover would be by
>>>>      re-initialising the dbus-vmstate object.
>>>> 3. If dbus is not available during VM power-on, then currently dbus-vmstate
>>>>      initialisation fails, causing power-on to fail.
>>>> 4. For a system with large number of VMs, having multiple QEMUs connected to
>>>>      the same dbus can lead to a DoS for new connections.
>>>
>>> The expectation is that there is a *separate* dbus daemon created for
>>> each QEMU instance. There should never be multiple QEMUs connected to
>>> the same dbus instance, nor should it ever connect to the common dbus
>>> instances provided by most Linux distros.
>>>
>>> None of these 4 issues should apply when each QEMU has its own dedicated
>>> dbus instance AFAICT.
>>>
>>>
>>> Regards,
>>> Daniel
>>>
>>
>> How does having a separate dbus daemon resolve issue (2)? If any daemon
>> restarts between VM power-on and migration, the dbus-vmstate object for that
>> VM would have to be reinitialized, no?
> 
> The private dbus damon for QEMU is expected to exist for the lifetime of
> that QEMU process.

Totally agree on the expectation. But any external stimuli (maybe 
unintended) can easily break this condition, and this would indeed 
result into a situation where the VM is basically non migratable until 
the VM is powered cycled or the dbus-vmstate is removed by manual 
intervention.

Secondly, having dbus-vmstate backend connect to dbus at migration time 
eases the complexity for any management plane to recover in these 
failure situations by monitoring dbus and restarting it with the same 
params if dbus gets killed without affecting QEMU.

>> Secondly, on a setup with large number of VMs, having separate dbus-daemons
>> leads to high cummulative memory usage by dbus daemons, is it a feasible
>> approach to spawn a new dbus-daemon for every QEMU, given the fact that
>> majority of the security aspect lies with the dbus peers, apart from the
>> SELinux checks provided by dbus.
> 
> The memory usage of a dbus daemon shouldn't be that high. A large portion
> of the memory footprint should be readony pages shared between all dbus
> procsses. The private usage should be a functional of number of clients
> and the message traffic. Do you have any measured figures you're concerned
> with ?

One of our setup had a long running private dbus-daemon (nearly 4-5 
days) in the destination hypervisor after performing migration, it was 
showing the following memory usage (figures in kB):
Virt  - 90980
Rss   - 19576
Total - 110556

Extrapolating these figures for 100s of daemons results in considerable 
Rss usage. These figures were taken using `top` linux utility. But I had 
not considered the readonly shared pages aspect at the time of capture.

Regards,
Priyankar

