Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EC45537A0
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 18:14:46 +0200 (CEST)
Received: from localhost ([::1]:41496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3gWb-0002Cx-WC
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 12:14:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1o3gUX-0001GU-Ja
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 12:12:37 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:14122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1o3gUU-0006IF-Hc
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 12:12:37 -0400
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25LC4FDo013526;
 Tue, 21 Jun 2022 09:12:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=IxXP2/PKgT4B5lLOn+N0jbx0mGgh9EtBUjhDNQzMWas=;
 b=d1YA9R+RjAskyC/CZZGXAksAGuK4WFQzDJFCq304Mx7AOGu4tPsOBBRHfc7MTFqkblGX
 NwNSVm2tsaVdTkpxEeok1fZWkes/wGhgQHpFrYDl83xvKYkVQuJh2OSkdC6LFx2QrPAr
 8Xc6eGbzWDxvCG5f3He8xsUfvurNmGc+1Jntz5zFPSBCsdBuHPviLI9YkZjr7t6S9TAf
 +NJwTgix8jipxaQgIFfJgz3qd8Ow3y3d4UgE91JBTqbdnQH3j27tIyT4BQTBqYdHbQae
 pl3exfbRnmJvM3l1WhVgIWjwwTnjvXwefcsYl0sVicOcw+hgG7mYhC5R8FcpUTZKkuk8 oQ== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2173.outbound.protection.outlook.com [104.47.73.173])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3gsama6kg3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jun 2022 09:12:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ntbLiwI7p3xz5vUGNLelVFtuTOYjz0FMvSkJQzaL/V29XgTaa2+ClFyHX9F4wZwwDm8ubsUoPelibob4o6Lk4LwAIf74dQDeHzwmlqVCM0mk8TQebmtRaYO+acLVM5ytkh7LGxfBvkelvvoGFXUf+DwgMbjdjzrgVzcNJ/NXqycOeFi34R1R7VA3w0PgXv54iP0HNoQxE1SfKBzbe1fhEI0HC9RCcgYmeU1QnpNJogoAAGO4sR9o6mH6x/m/UTfOet1DERQBsXELfkTuVwoPiZZe7znV+0uTQ763Q1ZlyLh1/4poLQtqMcCyw2vlOOSSbGTTVaZ5dqirwlurGolD0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IxXP2/PKgT4B5lLOn+N0jbx0mGgh9EtBUjhDNQzMWas=;
 b=WkAmxCDrcUiigofiKu6WporY/idx+I6TKejNRxLQBwEVkEzkzqcsKNlc0VRIpBAejlIzO6cKC9eCYxIQCJZWPK4rgty7TtN1jN9s44B2zQ1Z/mK6CGTpdqnubxuL0MLrgZS9q2fCW6gnUcNEEMd3OLwzOh+nNpKNEtG/Lu1M5JfBnG5+QQdEJ7ep+C0jYvlUbAOECDkT3pQkh7gy0RPtQr2HZu5K+wFN+SFD5R7l4PQcscP1K79iDrKVrME0tw2N67DiCCpEa7Vhmlvyi4lsj+5xdorDN+DHUzYMXMaCOnAxmhMNlzilWrvhi0E0aI8eSbyrhzFjBS4ICZ327HaYzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by CY4PR02MB2456.namprd02.prod.outlook.com (2603:10b6:903:6b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.18; Tue, 21 Jun
 2022 16:12:30 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::898c:892a:2385:3df6]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::898c:892a:2385:3df6%5]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 16:12:30 +0000
Message-ID: <fc8a5438-136f-141d-e7dc-1418dea06459@nutanix.com>
Date: Tue, 21 Jun 2022 21:42:20 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 4/4] Adding support for multi-FD connections dynamically
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com, armbru@redhat.com, eblake@redhat.com
References: <20220609073305.142515-1-het.gala@nutanix.com>
 <20220609073305.142515-5-het.gala@nutanix.com> <Yqt6wH8+i+pDBHNU@work-vm>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <Yqt6wH8+i+pDBHNU@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0331.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::6) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0fd1a186-8109-4139-47e6-08da53a0d793
X-MS-TrafficTypeDiagnostic: CY4PR02MB2456:EE_
X-Microsoft-Antispam-PRVS: <CY4PR02MB2456ED2800380A3B567F10FAF6B39@CY4PR02MB2456.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8ap6J8hEN/E8iNWeIZ2wTj2MPK1DApO1YBo9ZR4z20zHyxTajMGcFBxx4EhMAbLaL+t0DWMftGXIGWMyk+SAToIXgE/A+ZRodeIVoBC7IgXUzUWFOpkXw1TdYaYs2fcQOqxbBYCI+BXfoYmR7cgc3bOdmpjzFwICI5GYaoBLfzUANNOx/na0OdkLfcKJ74fgY5hHL3Xz3dOIxchO8PnoX/4IhdoWx2DnpFxVNKQWqfzLIRBsS7RX6rWc+xetE9APrOUMQg4qGJ+o4+DHfi5yJNfM913bFdYs98mK97J3L06TOJs1GVsCqGJEfyhjALN2bjpYf9PNlwb0ujk+Q7iGvUxQ8Y0q+y/XyygPGXt0xOBz+Z+avX4Z4xGfHdeXm3Z6vTnOf+q2zE6a4mu6AnqccJ0GSHJm5mUAFDGxAE6NBcDQ4lXlAW7tIYu5kfwuJTUCOhKlHhcl8qPSidwxW89AiEeKiwrt5elKNkb+E/Z77V0oaj+/wUOWzaX1AvbmAOMf13bCKJMcy5affXBc8aVHu0x7dk9ndavp0Z8MEou6vOBJnI9t8XZbjT2a48F841EPYh+24U0Hb6/VVk8EEDyBCKRi9qTbhK3Myiy/RSkjyWQpV6dEao5fgrbbxLsi1iHfVYRVuImJMWtcXdlMHEL0rHdDNl0QVmYyLXbRLV5EublnwrafQwGO5eo5+YT4V3wl+zYtnvrBnzp9xry9NtT6nOWOai1pa229jelM0gYm57OJXbvGIpF8lukPDKYsMvtQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(39860400002)(346002)(136003)(376002)(366004)(4326008)(8676002)(41300700001)(110136005)(66476007)(2616005)(83380400001)(66946007)(66556008)(36756003)(31686004)(186003)(55236004)(2906002)(6512007)(38100700002)(26005)(6666004)(31696002)(6506007)(8936002)(5660300002)(53546011)(30864003)(316002)(86362001)(6636002)(6486002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1c1ZmY5RG1CNlRTTDhvaEdsNURUZmFOS3VPendMK3k3ZG9UOFl5TDhsRGtB?=
 =?utf-8?B?UHpIc1BxMlZ3SmxCMVR6ejI5Nm15clRaRTEzYTZORytqZ2Fxa0RFZytTR0hO?=
 =?utf-8?B?M0dsVko4RVhObHlmSHJ2NWtCa0xKMEErMTRLeTBNTjg0QUVyOFZTTnpnV25N?=
 =?utf-8?B?MzAzY09sZjdCeVRHV1hSRWluWWpPTWpQaXFmNzhCOUQrbXpoV3JXVEdRZVdY?=
 =?utf-8?B?WVJZMWN2NEozaFBRMk5yUTVuN1JkSEpkcWFzUEhCekgyZ1lrL0VQVHpwLzFB?=
 =?utf-8?B?M2VnYlJSc0xpTVJZZERkZW82NHg3bkJoRTFqOERnSGFPZVN5dEZVSERmOHV0?=
 =?utf-8?B?eDNDZXF1NnFDaWVTaDJza09mRFIyTXY4cFpvNTFqZEZSZUMrc1ZhVFlsc2JK?=
 =?utf-8?B?RURJeHo1ZEhlUzRiNGhyT2NRTXFWM0N5dkFHKzhtZ2xVL24vRVRId1pYUGsx?=
 =?utf-8?B?b1Rib1p3aytqOXdzMDRvbEZObm5DdzNRNEFoeGIzQlU0NloxaWxoQUJpZ1VX?=
 =?utf-8?B?bW8wdW15Zk8wenJ4SUM4WGZkMFZCZmxHUGt2TnhFVWtwaHd2d3oxSU5HZENF?=
 =?utf-8?B?dkRrZzRubjhIb2pUMDJEanRhK3p0ellMTjFZZnNqQWcrNUMrUjZHWlU4aTJL?=
 =?utf-8?B?Y2lBOWZFR1VLdXNxeEY4Z1NBNE9WN251RlVLMEVYNGo4YjRiMFQyNFdvcTVa?=
 =?utf-8?B?UVdEZlBaTHNrb3ZhR0laNUZONlUwa20zYlZ5NkMweGwvcGVKOW85TjBHL2NJ?=
 =?utf-8?B?T2pxVHRhcm1raHNpVS9wb2RiU29kL2FZcFNMNUtLbDNjWUkxRitEc0s1VnRR?=
 =?utf-8?B?Z1dBbVgyUnBoTFkyOUZJKy91SjBJMjdvbnRzczIwMXZTZUpad3lOcHFZZWlC?=
 =?utf-8?B?bkRrdU1Hc0JTZ0pRcEZEOGxOVHNXVVhzcTBuNTlSYzdCTkRwbmtwUk9uRjVy?=
 =?utf-8?B?cXdrcGwveW4xeU9UcU9PcjRjY3B4UUYwVGovdGdYMVYwNVZXSzdNcjlvRU96?=
 =?utf-8?B?bGJkSVY3TnVMWTBaWWxvZlFsLzdINTZhWUFrckM0RzFDVnl1Nm1Uc2hwcGdS?=
 =?utf-8?B?VnQ2WUt1RFcwblA4dDdEYlBWRWYrQWswYklxOVZzWWlqU0prT1RObHVSekZM?=
 =?utf-8?B?dVhQRTQ5T09xc2h2UklSNzhjQVl4UEx2YTA0WjQ0b1ZHQUxkOFpnanhub253?=
 =?utf-8?B?N2pmWFhHQzB2ZFVSVjhjcUcvQWxsRVdBYVpTSFZGRlpkU1JDUFBDSmo4WGdF?=
 =?utf-8?B?aVdtUzMwdDI3TGtuemo0WnVNOENvUGxCa21hT3dlaFV3aUhpNUh1RXprMm9M?=
 =?utf-8?B?MVBHZUtCMVJvQUZUUXdIcW5QVXV4OGdiY2JaNzZKdjBPazVnVU1ZU01oNWdk?=
 =?utf-8?B?NDF1TWpaVUdzUGt2a3Fxb0FhUDJVS2orMVp6TXNiNUJFbFJwU0g1QTgvVWhI?=
 =?utf-8?B?VUMxSXEyNUdwSkJjYjJWTzFzekNDMXhualRhYm5jby92dkVFaFBuYzJyZGlF?=
 =?utf-8?B?dnhMVDVuUlhISjJDa21IY2FxQjhBdDZVTEk2Tk1zaTlUSEJKeHRJODhXcU9p?=
 =?utf-8?B?bnR3TEpvSU4yRENldFhaczdhb2hNdEV0bUt0YkFCbDdUWVZKSDdrdWlqbURr?=
 =?utf-8?B?ZERZRjlxcnp0WFJqNEtiZDlDUnpjRWxTdVk3TWhmQmx4MmpxeEwyQTVuRXFu?=
 =?utf-8?B?NVpIWnVxbklRMjBiR1YrTUNRbHJNeU40QXI3bE9LZ2VJV3llZGFRTXVyRVM5?=
 =?utf-8?B?WUw4cDF0L01aZFVUelBBZEJBOGlKc0dZc25keGg5azhsUEVleXdUSGszTVRk?=
 =?utf-8?B?b3JOYTNlOWZWRitEaTNiVTNnSWNHd3EzTytXNTloRDAwTzBVbUZlTU9OamVi?=
 =?utf-8?B?SDhLM0E5UnJoS082RkgwR1ZrMHZueXgyNzBjOGNBbDhIa204dWJuaDRmdVlN?=
 =?utf-8?B?VmJTWjM4cjY0MGZEQm0rT1ZIdjNHWHVoYXFPZlB4OWZEc3VoR1E3NFdqbVlu?=
 =?utf-8?B?Ukh4Wkh5Y0FpQXUyMFVpYUo0ZmZsUGc3Vm1vaXkyT2lMNHBVQjl4NnVzQWlk?=
 =?utf-8?B?VFI0dHNITDd3TDRWL09KcnN1UWJYMUl4MStlRXJVbGhCNE9IQUl6dURKd0FS?=
 =?utf-8?B?akJMSjNSNVc4U3pEaUMyZktFWXVNQ2FDZkJtcm80VnhpaG1pVCtMcHpud0la?=
 =?utf-8?B?VGZiVVZuTnZiRVl3QXZnNThlV1NiTG9YNjlCSk9zaTJrN0NkTXpDUkNoUnhw?=
 =?utf-8?B?QTBTbWMzcTJzZ0tQWnlCN3BqWTVHUFRlOVlFREdrbzNEOEpReDZROEFCTzFu?=
 =?utf-8?B?bVZ6MHRtUzBBZzVTMlBSOE96TzA0Rk96bU5XdmdqNlEybkZrQ3RLMmluam5N?=
 =?utf-8?Q?A1iG7qghvHLYf+Ko=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fd1a186-8109-4139-47e6-08da53a0d793
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2022 16:12:30.4066 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G2Z+aIOit8iVXENmAVCtpISn2Cav77hx+kalFiKlo9JDCALJyeQHPrLSpW3iRNMk9pbGUIbeuiVCxJYC2v9u1bEtJL3jRLD8DSHENaC1UeY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2456
X-Proofpoint-GUID: hhImHc3xtJ8t3GraGgQyj4TO-vKpVVvZ
X-Proofpoint-ORIG-GUID: hhImHc3xtJ8t3GraGgQyj4TO-vKpVVvZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-21_08,2022-06-21_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=manish.mishra@nutanix.com; helo=mx0a-002c1b01.pphosted.com
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


On 17/06/22 12:17 am, Dr. David Alan Gilbert wrote:
> * Het Gala (het.gala@nutanix.com) wrote:
>> i) Dynamically decide appropriate source and destination ip pairs for the
>>     corresponding multi-FD channel to be connected.
>>
>> ii) Removed the support for setting the number of multi-fd channels from qmp
>>      commands. As now all multiFD parameters will be passed via qmp: migrate
>>      command or incoming flag itself.
> We can't do that, because it's part of the API already; what you'll need
> to do is check that the number of entries in your list corresponds to
> the value set there and error if it's different.
>
> Dave
>
thanks for review David. Yes, we will make sure in V2 that nothing existing breaks.

- Manish Mishra

>> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
>> Signed-off-by: Het Gala <het.gala@nutanix.com>
>> ---
>>   migration/migration.c | 15 ---------------
>>   migration/migration.h |  1 -
>>   migration/multifd.c   | 42 +++++++++++++++++++++---------------------
>>   migration/socket.c    | 42 +++++++++++++++++++++++++++++++++---------
>>   migration/socket.h    |  4 +++-
>>   monitor/hmp-cmds.c    |  4 ----
>>   qapi/migration.json   |  6 ------
>>   7 files changed, 57 insertions(+), 57 deletions(-)
>>
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 9b0ad732e7..57dd4494b4 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -1585,9 +1585,6 @@ static void migrate_params_test_apply(MigrateSetParameters *params,
>>       if (params->has_block_incremental) {
>>           dest->block_incremental = params->block_incremental;
>>       }
>> -    if (params->has_multifd_channels) {
>> -        dest->multifd_channels = params->multifd_channels;
>> -    }
>>       if (params->has_multifd_compression) {
>>           dest->multifd_compression = params->multifd_compression;
>>       }
>> @@ -1702,9 +1699,6 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
>>       if (params->has_block_incremental) {
>>           s->parameters.block_incremental = params->block_incremental;
>>       }
>> -    if (params->has_multifd_channels) {
>> -        s->parameters.multifd_channels = params->multifd_channels;
>> -    }
>>       if (params->has_multifd_compression) {
>>           s->parameters.multifd_compression = params->multifd_compression;
>>       }
>> @@ -2686,15 +2680,6 @@ bool migrate_pause_before_switchover(void)
>>           MIGRATION_CAPABILITY_PAUSE_BEFORE_SWITCHOVER];
>>   }
>>   
>> -int migrate_multifd_channels(void)
>> -{
>> -    MigrationState *s;
>> -
>> -    s = migrate_get_current();
>> -
>> -    return s->parameters.multifd_channels;
>> -}
>> -
>>   MultiFDCompression migrate_multifd_compression(void)
>>   {
>>       MigrationState *s;
>> diff --git a/migration/migration.h b/migration/migration.h
>> index fa8717ec9e..9464de8ef7 100644
>> --- a/migration/migration.h
>> +++ b/migration/migration.h
>> @@ -372,7 +372,6 @@ bool migrate_validate_uuid(void);
>>   bool migrate_auto_converge(void);
>>   bool migrate_use_multifd(void);
>>   bool migrate_pause_before_switchover(void);
>> -int migrate_multifd_channels(void);
>>   MultiFDCompression migrate_multifd_compression(void);
>>   int migrate_multifd_zlib_level(void);
>>   int migrate_multifd_zstd_level(void);
>> diff --git a/migration/multifd.c b/migration/multifd.c
>> index 9282ab6aa4..ce017436fb 100644
>> --- a/migration/multifd.c
>> +++ b/migration/multifd.c
>> @@ -225,7 +225,7 @@ static int multifd_recv_initial_packet(QIOChannel *c, Error **errp)
>>           return -1;
>>       }
>>   
>> -    if (msg.id > migrate_multifd_channels()) {
>> +    if (msg.id > total_multifd_channels()) {
>>           error_setg(errp, "multifd: received channel version %u "
>>                      "expected %u", msg.version, MULTIFD_VERSION);
>>           return -1;
>> @@ -410,8 +410,8 @@ static int multifd_send_pages(QEMUFile *f)
>>        * using more channels, so ensure it doesn't overflow if the
>>        * limit is lower now.
>>        */
>> -    next_channel %= migrate_multifd_channels();
>> -    for (i = next_channel;; i = (i + 1) % migrate_multifd_channels()) {
>> +    next_channel %= total_multifd_channels();
>> +    for (i = next_channel;; i = (i + 1) % total_multifd_channels()) {
>>           p = &multifd_send_state->params[i];
>>   
>>           qemu_mutex_lock(&p->mutex);
>> @@ -422,7 +422,7 @@ static int multifd_send_pages(QEMUFile *f)
>>           }
>>           if (!p->pending_job) {
>>               p->pending_job++;
>> -            next_channel = (i + 1) % migrate_multifd_channels();
>> +            next_channel = (i + 1) % total_multifd_channels();
>>               break;
>>           }
>>           qemu_mutex_unlock(&p->mutex);
>> @@ -500,7 +500,7 @@ static void multifd_send_terminate_threads(Error *err)
>>           return;
>>       }
>>   
>> -    for (i = 0; i < migrate_multifd_channels(); i++) {
>> +    for (i = 0; i < total_multifd_channels(); i++) {
>>           MultiFDSendParams *p = &multifd_send_state->params[i];
>>   
>>           qemu_mutex_lock(&p->mutex);
>> @@ -521,14 +521,14 @@ void multifd_save_cleanup(void)
>>           return;
>>       }
>>       multifd_send_terminate_threads(NULL);
>> -    for (i = 0; i < migrate_multifd_channels(); i++) {
>> +    for (i = 0; i < total_multifd_channels(); i++) {
>>           MultiFDSendParams *p = &multifd_send_state->params[i];
>>   
>>           if (p->running) {
>>               qemu_thread_join(&p->thread);
>>           }
>>       }
>> -    for (i = 0; i < migrate_multifd_channels(); i++) {
>> +    for (i = 0; i < total_multifd_channels(); i++) {
>>           MultiFDSendParams *p = &multifd_send_state->params[i];
>>           Error *local_err = NULL;
>>   
>> @@ -594,7 +594,7 @@ int multifd_send_sync_main(QEMUFile *f)
>>   
>>       flush_zero_copy = migrate_use_zero_copy_send();
>>   
>> -    for (i = 0; i < migrate_multifd_channels(); i++) {
>> +    for (i = 0; i < total_multifd_channels(); i++) {
>>           MultiFDSendParams *p = &multifd_send_state->params[i];
>>   
>>           trace_multifd_send_sync_main_signal(p->id);
>> @@ -627,7 +627,7 @@ int multifd_send_sync_main(QEMUFile *f)
>>               }
>>           }
>>       }
>> -    for (i = 0; i < migrate_multifd_channels(); i++) {
>> +    for (i = 0; i < total_multifd_channels(); i++) {
>>           MultiFDSendParams *p = &multifd_send_state->params[i];
>>   
>>           trace_multifd_send_sync_main_wait(p->id);
>> @@ -903,7 +903,7 @@ int multifd_save_setup(Error **errp)
>>       int thread_count;
>>       uint32_t page_count = MULTIFD_PACKET_SIZE / qemu_target_page_size();
>>       uint8_t i;
>> -
>> +    int idx;
>>       if (!migrate_use_multifd()) {
>>           return 0;
>>       }
>> @@ -912,7 +912,7 @@ int multifd_save_setup(Error **errp)
>>           return -1;
>>       }
>>   
>> -    thread_count = migrate_multifd_channels();
>> +    thread_count = total_multifd_channels();
>>       multifd_send_state = g_malloc0(sizeof(*multifd_send_state));
>>       multifd_send_state->params = g_new0(MultiFDSendParams, thread_count);
>>       multifd_send_state->pages = multifd_pages_init(page_count);
>> @@ -945,8 +945,8 @@ int multifd_save_setup(Error **errp)
>>           } else {
>>               p->write_flags = 0;
>>           }
>> -
>> -        socket_send_channel_create(multifd_new_send_channel_async, p);
>> +        idx = multifd_index(i);
>> +        socket_send_channel_create(multifd_new_send_channel_async, p, idx);
>>       }
>>   
>>       for (i = 0; i < thread_count; i++) {
>> @@ -991,7 +991,7 @@ static void multifd_recv_terminate_threads(Error *err)
>>           }
>>       }
>>   
>> -    for (i = 0; i < migrate_multifd_channels(); i++) {
>> +    for (i = 0; i < total_multifd_channels(); i++) {
>>           MultiFDRecvParams *p = &multifd_recv_state->params[i];
>>   
>>           qemu_mutex_lock(&p->mutex);
>> @@ -1017,7 +1017,7 @@ int multifd_load_cleanup(Error **errp)
>>           return 0;
>>       }
>>       multifd_recv_terminate_threads(NULL);
>> -    for (i = 0; i < migrate_multifd_channels(); i++) {
>> +    for (i = 0; i < total_multifd_channels(); i++) {
>>           MultiFDRecvParams *p = &multifd_recv_state->params[i];
>>   
>>           if (p->running) {
>> @@ -1030,7 +1030,7 @@ int multifd_load_cleanup(Error **errp)
>>               qemu_thread_join(&p->thread);
>>           }
>>       }
>> -    for (i = 0; i < migrate_multifd_channels(); i++) {
>> +    for (i = 0; i < total_multifd_channels(); i++) {
>>           MultiFDRecvParams *p = &multifd_recv_state->params[i];
>>   
>>           migration_ioc_unregister_yank(p->c);
>> @@ -1065,13 +1065,13 @@ void multifd_recv_sync_main(void)
>>       if (!migrate_use_multifd()) {
>>           return;
>>       }
>> -    for (i = 0; i < migrate_multifd_channels(); i++) {
>> +    for (i = 0; i < total_multifd_channels(); i++) {
>>           MultiFDRecvParams *p = &multifd_recv_state->params[i];
>>   
>>           trace_multifd_recv_sync_main_wait(p->id);
>>           qemu_sem_wait(&multifd_recv_state->sem_sync);
>>       }
>> -    for (i = 0; i < migrate_multifd_channels(); i++) {
>> +    for (i = 0; i < total_multifd_channels(); i++) {
>>           MultiFDRecvParams *p = &multifd_recv_state->params[i];
>>   
>>           WITH_QEMU_LOCK_GUARD(&p->mutex) {
>> @@ -1166,7 +1166,7 @@ int multifd_load_setup(Error **errp)
>>           error_setg(errp, "multifd is not supported by current protocol");
>>           return -1;
>>       }
>> -    thread_count = migrate_multifd_channels();
>> +    thread_count = total_multifd_channels();
>>       multifd_recv_state = g_malloc0(sizeof(*multifd_recv_state));
>>       multifd_recv_state->params = g_new0(MultiFDRecvParams, thread_count);
>>       qatomic_set(&multifd_recv_state->count, 0);
>> @@ -1204,7 +1204,7 @@ int multifd_load_setup(Error **errp)
>>   
>>   bool multifd_recv_all_channels_created(void)
>>   {
>> -    int thread_count = migrate_multifd_channels();
>> +    int thread_count = total_multifd_channels();
>>   
>>       if (!migrate_use_multifd()) {
>>           return true;
>> @@ -1259,5 +1259,5 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
>>                          QEMU_THREAD_JOINABLE);
>>       qatomic_inc(&multifd_recv_state->count);
>>       return qatomic_read(&multifd_recv_state->count) ==
>> -           migrate_multifd_channels();
>> +           total_multifd_channels();
>>   }
>> diff --git a/migration/socket.c b/migration/socket.c
>> index d0cb7cc6a6..c0ac6dbbe2 100644
>> --- a/migration/socket.c
>> +++ b/migration/socket.c
>> @@ -28,9 +28,6 @@
>>   #include "trace.h"
>>   
>>   
>> -struct SocketOutgoingArgs {
>> -    SocketAddress *saddr;
>> -} outgoing_args;
>>   
>>   struct SocketArgs {
>>       struct SrcDestAddr data;
>> @@ -43,20 +40,47 @@ struct OutgoingMigrateParams {
>>       uint64_t total_multifd_channel;
>>   } outgoing_migrate_params;
>>   
>> -void socket_send_channel_create(QIOTaskFunc f, void *data)
>> +
>> +int total_multifd_channels(void)
>> +{
>> +    return outgoing_migrate_params.total_multifd_channel;
>> +}
>> +
>> +int multifd_index(int i)
>> +{
>> +    int length = outgoing_migrate_params.length;
>> +    int j = 0;
>> +    int runn_sum = 0;
>> +    while (j < length) {
>> +        runn_sum += outgoing_migrate_params.socket_args[j].multifd_channels;
>> +        if (i >= runn_sum) {
>> +            j++;
>> +        } else {
>> +            break;
>> +        }
>> +    }
>> +    return j;
>> +}
>> +
>> +void socket_send_channel_create(QIOTaskFunc f, void *data, int idx)
>>   {
>>       QIOChannelSocket *sioc = qio_channel_socket_new();
>> -    qio_channel_socket_connect_async(sioc, outgoing_args.saddr,
>> -                                     f, data, NULL, NULL, NULL);
>> +    qio_channel_socket_connect_async(sioc,
>> +                       outgoing_migrate_params.socket_args[idx].data.dst_addr,
>> +                       f, data, NULL, NULL,
>> +                       outgoing_migrate_params.socket_args[idx].data.src_addr);
>>   }
>>   
>>   int socket_send_channel_destroy(QIOChannel *send)
>>   {
>>       /* Remove channel */
>>       object_unref(OBJECT(send));
>> -    if (outgoing_args.saddr) {
>> -        qapi_free_SocketAddress(outgoing_args.saddr);
>> -        outgoing_args.saddr = NULL;
>> +    if (outgoing_migrate_params.socket_args != NULL) {
>> +        g_free(outgoing_migrate_params.socket_args);
>> +        outgoing_migrate_params.socket_args = NULL;
>> +    }
>> +    if (outgoing_migrate_params.length) {
>> +        outgoing_migrate_params.length = 0;
>>       }
>>   
>>       if (outgoing_migrate_params.socket_args != NULL) {
>> diff --git a/migration/socket.h b/migration/socket.h
>> index b9e3699167..c8b9252384 100644
>> --- a/migration/socket.h
>> +++ b/migration/socket.h
>> @@ -27,7 +27,9 @@ struct SrcDestAddr {
>>       SocketAddress *src_addr;
>>   };
>>   
>> -void socket_send_channel_create(QIOTaskFunc f, void *data);
>> +int total_multifd_channels(void);
>> +int multifd_index(int i);
>> +void socket_send_channel_create(QIOTaskFunc f, void *data, int idx);
>>   int socket_send_channel_destroy(QIOChannel *send);
>>   
>>   void socket_start_incoming_migration(const char *str, uint8_t number,
>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>> index 32a6b67d5f..9a3d76d6ba 100644
>> --- a/monitor/hmp-cmds.c
>> +++ b/monitor/hmp-cmds.c
>> @@ -1281,10 +1281,6 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
>>           p->has_block_incremental = true;
>>           visit_type_bool(v, param, &p->block_incremental, &err);
>>           break;
>> -    case MIGRATION_PARAMETER_MULTIFD_CHANNELS:
>> -        p->has_multifd_channels = true;
>> -        visit_type_uint8(v, param, &p->multifd_channels, &err);
>> -        break;
>>       case MIGRATION_PARAMETER_MULTIFD_COMPRESSION:
>>           p->has_multifd_compression = true;
>>           visit_type_MultiFDCompression(v, param, &p->multifd_compression,
>> diff --git a/qapi/migration.json b/qapi/migration.json
>> index 62a7b22d19..1b1c6d01d3 100644
>> --- a/qapi/migration.json
>> +++ b/qapi/migration.json
>> @@ -877,11 +877,6 @@
>>   #                     migrated and the destination must already have access to the
>>   #                     same backing chain as was used on the source.  (since 2.10)
>>   #
>> -# @multifd-channels: Number of channels used to migrate data in
>> -#                    parallel. This is the same number that the
>> -#                    number of sockets used for migration.  The
>> -#                    default value is 2 (since 4.0)
>> -#
>>   # @xbzrle-cache-size: cache size to be used by XBZRLE migration.  It
>>   #                     needs to be a multiple of the target page size
>>   #                     and a power of 2
>> @@ -965,7 +960,6 @@
>>               '*x-checkpoint-delay': { 'type': 'uint32',
>>                                        'features': [ 'unstable' ] },
>>               '*block-incremental': 'bool',
>> -            '*multifd-channels': 'uint8',
>>               '*xbzrle-cache-size': 'size',
>>               '*max-postcopy-bandwidth': 'size',
>>               '*max-cpu-throttle': 'uint8',
>> -- 
>> 2.22.3
>>

