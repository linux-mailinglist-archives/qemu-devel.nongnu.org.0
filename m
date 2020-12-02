Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 382E92CC176
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 16:58:39 +0100 (CET)
Received: from localhost ([::1]:56886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkUWc-0007Qc-AL
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 10:58:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <priyankar.jain@nutanix.com>)
 id 1kkUTy-0005Ui-9V
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 10:55:54 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:39102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <priyankar.jain@nutanix.com>)
 id 1kkUTv-0007vi-N8
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 10:55:53 -0500
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B2FWRIQ029046; Wed, 2 Dec 2020 07:55:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=t1jYDhCMY9xmAPtI+DEQjBTPkZw+SZu4HjBTWYsWjTg=;
 b=AN9RPnNszYCGiLNIAXkP6Qn1ZKinL1fxCiLiyQ53twxsq3MeynsQqM3N4KQvA4pU0lRb
 CB132yWOv/mReF3GR/UNmGLldjr22cv+nfj0gvGIfeSezNUZyIkJjX1o+4MAcIXGu7PC
 ouzMnqiMTuVmctHLK8jfc3pYRYYoBcTJzfXFcGMyPd7VGk5xxNnI7AX99KzBzoWFVuf5
 PVPbGYCz++EKNviWNG0NkKazYbZZMApmIGaElsH1G3uFp/ty9PTcgkCAh7WFYyHEaX0O
 0SVRSBnXkW7yk8UzlUnBuuFayEwB77gVQA/G4yUV/sNpw16D9KuyivQWQh/Cslg76NSL 8A== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
 by mx0a-002c1b01.pphosted.com with ESMTP id 353kbdrypk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 07:55:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AbnNTfCqHp/yZihnjzz/vDQc4p3ThG9X91Du7yGdxbmCd9y2dTIA6gL03b31hZ3sroPC6WuevStoEiRn3LDohs+h2gzBgxevtZbFBuO4DTbNslMp+NAMM7LThVlsJtrej9gUwdds6oJoTTRr2uzsa41Bb/ubMlt4gNHO8MUhjQ+rtqTTFbivbJXiJtAAbBCQFjsM8PUkvoETwwHaXt9uYnIr8dsDftD3jYIcoAFO8cb4qKCihNvecI8L2ONjrHwJBX5iL0DlDHx5mcNPVP/toHrRFclC4Y3msYZKcVbueLCSQkayUUtuBn4bxgwq024GoqF8yj2MZZcJfMR4TQPreg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1jYDhCMY9xmAPtI+DEQjBTPkZw+SZu4HjBTWYsWjTg=;
 b=mRO5Tq0iPgiVxOQa+N3TD3Hc6jRFbQwNxAcWNQAtQvlJTISQn5qhaGxl3pBwxfZW+q8HLCa2WU6HqAO4PbDuHi1iZavrTVTwPLi4C1jtQ3ze+AtqQ1uLfok6ay9jJaebngDrQg3KODMnluu3qMvDcPFHf8Y4mVG8RPvVnQVl+X+XhZgcBpEOHsohVNgPQ64LD3TaF1VDf/eyZ4PNCqPZue9p1l4OqI8OKXs4zm3s5K7Tmd2Nrg31lnuTngabcNU8E8nBcR99hhuP6ZBgHHL+uJfZV3cUTAayiVZLZEDRqbfQDV7mHGkcfKTICKpVVvShu9tpol6s4ZDMhw/BtO0KtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
Received: from SN1PR02MB3822.namprd02.prod.outlook.com (2603:10b6:802:31::32)
 by SA2PR02MB7804.namprd02.prod.outlook.com (2603:10b6:806:137::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Wed, 2 Dec
 2020 15:55:45 +0000
Received: from SN1PR02MB3822.namprd02.prod.outlook.com
 ([fe80::50ff:8f29:a50d:b815]) by SN1PR02MB3822.namprd02.prod.outlook.com
 ([fe80::50ff:8f29:a50d:b815%7]) with mapi id 15.20.3611.025; Wed, 2 Dec 2020
 15:55:45 +0000
Subject: Re: [RFC] dbus-vmstate: Connect to the dbus only during the migration
 phase
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <1605810535-51254-1-git-send-email-priyankar.jain@nutanix.com>
 <20201119184724.GO579364@redhat.com>
From: priyankar jain <priyankar.jain@nutanix.com>
Message-ID: <057612c5-a9b8-c7be-c710-1b635aa361be@nutanix.com>
Date: Wed, 2 Dec 2020 21:25:27 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
In-Reply-To: <20201119184724.GO579364@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.146.155.8]
X-ClientProxiedBy: BYAPR08CA0036.namprd08.prod.outlook.com
 (2603:10b6:a03:100::49) To SN1PR02MB3822.namprd02.prod.outlook.com
 (2603:10b6:802:31::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.22.32.41] (192.146.155.8) by
 BYAPR08CA0036.namprd08.prod.outlook.com (2603:10b6:a03:100::49) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Wed, 2 Dec 2020 15:55:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8624e147-8ccc-47d5-629f-08d896daba79
X-MS-TrafficTypeDiagnostic: SA2PR02MB7804:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR02MB7804386EDB69B1B59AF240A283F30@SA2PR02MB7804.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0/hih512ywgy971iJKNmo8ptHVr5XDS1bUBp32g5OLjMn7EwxN3TLCfGc7d454IvAN5zHQLoDOlS1RAqJPzVYdbBE1iHHAP6DYs20I+CQOvcR50APRGinhRisslIUNexQ4sdETvUUPdznKsgDn1TVz2TVZjlbT6fbP/7NJdWZbD6sb+6HcGwSbWtYLsfBkzdITd0cpjnAiU0cMfIXAvb0cPBiADZpoLAO8GmHPyZTDDbl9BZ8FJ+HCoITC2tPfaLZywLuVP+TFPuvwzUWhi/+XkHETUAy7TAGxotn4KfZBIGd8GKuVi1VBE4mVTqwGtamfxNqxZVEOwt/Qwh+cSrVtqnP8Zc+s9JxSqMoV+IqswxL8ibwVLP578WrNF00DNrK7I8OT+mbdd6tKqIq/bCDZXBEa8Q1rzCPkdOTTnSsHU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR02MB3822.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(136003)(366004)(376002)(396003)(2616005)(31696002)(956004)(5660300002)(8676002)(86362001)(31686004)(8936002)(54906003)(52116002)(478600001)(4326008)(36756003)(53546011)(2906002)(316002)(16576012)(6916009)(6666004)(26005)(83380400001)(16526019)(186003)(6486002)(66946007)(66556008)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Zkk3NVdPRnJ3SlJRTHlQU3FjVUR4THdXSm1yRnU5dzhFeVZZMjFUZ29zS3hV?=
 =?utf-8?B?UDV4aEcvNklPNDV3TEVLdlZySmdwb1c2ME8vUCtEZ0xJUkc4bG5WYjk1T0gx?=
 =?utf-8?B?SHFCU2NXSUFQMzJNbDI0MlBDZU42c1RlRmFJRzRzWFRGNTZzWjJQR1Q0cGpU?=
 =?utf-8?B?RmVYd3RTMmtBQW00YjdxT2h1UlQvbTJXa2Vzam1VUy90cHBFZEpLc09jVGJN?=
 =?utf-8?B?dzFSdDIvN3dWdE5RM0daSnNKL29KYW5MWCtIWE9ZUGphQmI2TTkxTzlIRGFM?=
 =?utf-8?B?U3QxTWlwOHJ3cXBhZ2g2cGtCQWlGS1ZSTGFFVXBNUUczdGpWWGlTaUozaUJL?=
 =?utf-8?B?V3dpcU13RFhIbWJ3anhmTlN2SmtWWFRXYWQ4QTNudHcxNW9ob1VYdG8rNGgw?=
 =?utf-8?B?L2pmR0ZWNWFtYnJlL3liR2N2V0hWNHAyZXRLV25XdzdQeEpZZ0tmMTJyekVR?=
 =?utf-8?B?YkY3aVB3NnltYkM5c3V5SUpwcnR5QVBTa2dLUVFDRWh3S1JQV1dKclNvOHdK?=
 =?utf-8?B?V0kyUmRGa3N2bHNhaDNVaFZKbzVyU1I5Z0psdkZmck5FdkVpelVVTHl6dFVq?=
 =?utf-8?B?Mmt5SHp6KzVxYmtqYXAzVmgvcXloQnBBRUxuSGdwNTFkZDVtbmNvMDBSalJw?=
 =?utf-8?B?SGtnZ1F3NEZQbnN2aEVDY2R4YnNtUUE0YjZIRUlhT2dDZEhTZFZYekY2NVRK?=
 =?utf-8?B?ZFJVYy9UM1Uvck5tdmRSeDlXS1hSbG9QVWQwenFFL0VIQ21yTWg3bCsvN05r?=
 =?utf-8?B?S3BIemVyVGlvemZzcjdMYnJsRDV6V0ZORi9UcWp1a0pka3ErVmpDc2lSM2lL?=
 =?utf-8?B?TGIyTEZONU41SmlVcEhhMDNTcHhzY3h4cmZHRHphWkRqUmhQYmtSQ1FiekxR?=
 =?utf-8?B?QlJvQ2k2dEYzamgycmFZQzlqNitNT2VtSjNJZHZwMzI2Z1diZXAyVWFQY3Rj?=
 =?utf-8?B?VGx0ZW5KYnFnTkZHMS85YlhBK1hFT3JrcTJKR0x2bFhCb2ZDQkkxQW56bTNn?=
 =?utf-8?B?eTNFWTJ6a1hFcFYzZkJRdDlpdUhsY2VkUnU3Q0NqMloxYk00ZU4vcUdIQ3Bu?=
 =?utf-8?B?RHhHUWJ0OGhhMkpVV3VXYlhEVkR2VlVEczQzUllIb25MeE9UTERIV3VpNWRW?=
 =?utf-8?B?Rm1lTFZaZThweEQxbzFUdG56YVRQQWdrUEUrekRFWnlPdFhjbjNEVVYwNDY0?=
 =?utf-8?B?OGVKUjdISGZ0WmVBM1doUmJRYUNtNHVodHlmMm1kZEgwbE4rNVlRcVRiNHFP?=
 =?utf-8?B?ZlNvMkVLMGJxYnZMWEYvQ1c0NEgrTGJmaG1NZHh5Q3pkUzdoeEg2UkxWakd6?=
 =?utf-8?Q?NK81Ckc9CABNKCff0UCdlW2TrWeYQvtFYF?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8624e147-8ccc-47d5-629f-08d896daba79
X-MS-Exchange-CrossTenant-AuthSource: SN1PR02MB3822.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 15:55:45.0178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z4f8g+vJ2x2YJl19xXYvGbjW5f6bmyJw5hoaj8HYjo42NB4SZGF/eTxSobEy5iWLkB3BvA8IgKRnQKxP61L+YTuehTq+eR+MfrE/hdZmzsc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7804
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-02_08:2020-11-30,
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

On 20/11/20 12:17 am, Daniel P. Berrangé wrote:
> On Thu, Nov 19, 2020 at 06:28:55PM +0000, Priyankar Jain wrote:
>> Today, dbus-vmstate maintains a constant connection to the dbus. This is
>> problematic for a number of reasons:
>> 1. If dbus-vmstate is attached during power-on, then the device holds
>>     the unused connection for a long period of time until migration
>>     is triggered, thus unnecessarily occupying dbus.
>> 2. Similarly, if the dbus is restarted in the time period between VM
>>     power-on (dbus-vmstate initialisation) and migration, then the
>>     migration will fail. The only way to recover would be by
>>     re-initialising the dbus-vmstate object.
>> 3. If dbus is not available during VM power-on, then currently dbus-vmstate
>>     initialisation fails, causing power-on to fail.
>> 4. For a system with large number of VMs, having multiple QEMUs connected to
>>     the same dbus can lead to a DoS for new connections.
> 
> The expectation is that there is a *separate* dbus daemon created for
> each QEMU instance. There should never be multiple QEMUs connected to
> the same dbus instance, nor should it ever connect to the common dbus
> instances provided by most Linux distros.
> 
> None of these 4 issues should apply when each QEMU has its own dedicated
> dbus instance AFAICT.
> 
> 
> Regards,
> Daniel
> 

How does having a separate dbus daemon resolve issue (2)? If any daemon 
restarts between VM power-on and migration, the dbus-vmstate object for 
that VM would have to be reinitialized, no?

Secondly, on a setup with large number of VMs, having separate 
dbus-daemons leads to high cummulative memory usage by dbus daemons, is 
it a feasible approach to spawn a new dbus-daemon for every QEMU, given 
the fact that majority of the security aspect lies with the dbus peers, 
apart from the SELinux checks provided by dbus.

Regards,
Priyankar Jain

