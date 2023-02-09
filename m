Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DADC7690995
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 14:13:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ6ih-000438-B5; Thu, 09 Feb 2023 08:12:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQ6ie-000403-Hu
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 08:12:09 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQ6ib-0006yy-BZ
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 08:12:08 -0500
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 319CYimf016552; Thu, 9 Feb 2023 05:11:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=m9L1Vz37CZNbu/VPGm6BNnC7u+ev6jK6ctIZZBQt4aI=;
 b=ovRhLbSwFsia9/UziGwAKj4fpOslTmlDo8m2J80T67wXaQCIJT3L27OUiHIKWtLreY9j
 80o7/ts2BXqXjfMa1hSnY1hMOo8h5TpeaJyehr9v4o3EAf2L7hOjpTy/B4Wrt+yQF/Lf
 BPFvHXKrnyRkd2CthTXiqrgoyHDSy/24s1xiTWExyDygZbJr827aT14zIKcFwZ1hmnFZ
 hxQdKHgN8njWG5L3k7QQzXKaEeqtOcdUDtNnWC2YbMJl4G+wuaZOD4a7z3a7uBuJCbIY
 tivhwQxZx3csf8i45m+5MmYOKzoMaoQM7c7ORroMgaErELGcr968mjNhnoUr14B41NGV cw== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2047.outbound.protection.outlook.com [104.47.57.47])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3nhqanqj69-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Feb 2023 05:11:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UAfbRGN/LoBbGonODMrWgXc/jwF5Rg49mAjMOgdQbD6YPYLq72WPhpZKl5RzEtEu6lKId+jU359V2QBUwOuz/Ai5LCFcYRwtkKgMLSzoMeZlIKtFokVJ1csXSI8771vhLev3D0Fo5Hgam0F4aLZK26qcFBUT6pt5+nXk+6z0kPUNJe1ZKjCDIR0Ct6kC0l9Fkc8utQ1tVhmoucfwh3ire2DnmD1+OQGuM9HRuAH/MCooiFQS5Gtp1kwbNOSTDpTfUl0u6arfCBzzRaUU7aKzYW/jjRZCOC869+o3zEAKrRqdxpDNhtvwX+SNolzoysppUqZy1uZ7NJyUB3K+8VxcAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m9L1Vz37CZNbu/VPGm6BNnC7u+ev6jK6ctIZZBQt4aI=;
 b=LmIdpE380+DzwkzDwv3WDibC8VkCAj3g5qQ+y1MsPwOYE1G7MzqerhCtPi0B3HaWajdlRZcCSlD+5L1zf5kv9AkxpI2yaGAYo7hm0diOw1senwlC55OQj7Bj0E89HWHmtNzyk9h9+cdg+TzyIkNP9Fv+pv6dS1KEeJNCm6ppv6XN8ZexAMPEcPD7Yx2ywZSVscmn6NF+KL4iDHyRIJcrZVweqxDePvQ1lWX/IRNCC1zhZ6WpBHrec6u9di4n6WUitqzvV2my7g7Hbi4BHS5zZr7CnRuxo8WQLp88eYyep/IHNmGtG9DzRefkEjkuusGBJkgp9/9gC7IV9g+7ZLRRkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9L1Vz37CZNbu/VPGm6BNnC7u+ev6jK6ctIZZBQt4aI=;
 b=wIpjtBeaw/wJqq5s9RRvMrgLlEEDdYdkn2Q/JacZO7SdAFhmSrelJvipptCXmWpgkd3RjS5qn5xOC4JTlIcQ5MpYtMfw3OTHYmSIzfGDU+MlvyiXMHjVaQ67We2iiz6/jnZ5A+Ntw+7hWm3eL4WSSCqCih5W9buWo/k/S2xqxc8gR89A3a3JsKSzbNwHhG/RltMAAuVqjCFGDQ2VeKi8MujvaEyVfmKwxD3pulnwRoNp5cxfQsLAcj/kw+O/aQewMH3qCT8F130+cPZ9Jv8pgnrhMhTWgteyhg1thxCZJNOGHFO4WhUUVXpZqpdA+wRvKTKx2fg7YDpIolmDl6Vgdg==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by BY5PR02MB6852.namprd02.prod.outlook.com (2603:10b6:a03:207::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Thu, 9 Feb
 2023 13:11:53 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%3]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 13:11:53 +0000
Message-ID: <ce476f1c-a2ec-9dd5-c36a-d60bb2a29286@nutanix.com>
Date: Thu, 9 Feb 2023 18:41:41 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/6] migration: Updated QAPI format for 'migrate' qemu
 monitor command
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
References: <20230208093600.242665-1-het.gala@nutanix.com>
 <20230208093600.242665-3-het.gala@nutanix.com> <Y+TLJ9Ui790bIR3b@redhat.com>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <Y+TLJ9Ui790bIR3b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0070.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::15) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|BY5PR02MB6852:EE_
X-MS-Office365-Filtering-Correlation-Id: bc31cb59-7a60-4aa4-5dca-08db0a9f3639
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z52/g5rSEUg1Iil1GSowxms1IRLwaOz8szdDFTTpgCHyCRjwDUDDU96Jb+4OI6laDtgJefaD78vw4E7GluoWW5W7YjOsmzITPfkD3LV9i4Lz6lXpnT2RWl0BL0OejqX0qHd0Ro2Hh6H3HKaxPbh3vShRO19QnMWWqpu7ijhIWXgcnIfhKcMI4gRirHNYMaHRww8V2S8vPkyBROqofvfQRbiYdMhyk/oQgYnI2fjICuMIADYbomCpovDUhAS3JiRJJVbYbxyiT3UvnmmNw74qgcWbGctWDCDOnpKVyZokvTG6aDdNxmNdw3/IjF0ltVgMs1vUJqL6VzjITEUYSc4CkwNNWeBBXpASwCyFEbQnoJTR50SmWJ4djvMQOyNtgOzYNbCQf0PYW20z+SBFbk1ghexfebwCNFCJMgu/ZXxNA8LX4Dk4v7HxHZwYT9ghdOzk6nzP4/COHX31WIH32f1BkrZFqR4ERCtWmxBQoN4ctSuYEvMyyGN7JeaTtkDA3M11+RGpPCDTtawqbstP5ecXgYMFtNTQc3VkIClWQu27Zd8WBG6w4oEzRUPLnYBkq62s31Fmo7qv7JfAs2l8828v8LPnZbZdi5L3lcxQLFUyj10XMOUswzhqa+kceUM8tMkeJUaWvqxx8hknMm37u+cWZiaWBcg5BQdELiHWULFB0BpWdqH9TK6WVDu+/6Am+5CU561sMstoH14FWgNUT4BV4gooiTS02wrnC+MZzzq4fnA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(376002)(136003)(39850400004)(396003)(366004)(451199018)(66899018)(2906002)(44832011)(186003)(31696002)(86362001)(2616005)(8936002)(5660300002)(26005)(36756003)(6486002)(107886003)(53546011)(478600001)(6666004)(6506007)(31686004)(83380400001)(6512007)(38100700002)(316002)(6916009)(66946007)(41300700001)(4326008)(8676002)(66476007)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTRmQTZSK29YWDVxUzVjSnh5L1JONGJaeFdJWkRNSFVMVnQ5aDVKZWJUdTNJ?=
 =?utf-8?B?c0YvNFhFMm8ybUY1L2gvT3ZtNkR6Y3o5YzhMZHhYNTVBZzdyc2hUdHBvRHkv?=
 =?utf-8?B?M1pxQXkzSUZDQ2RxdGVicnBnNDVKZnR1Wk9uSUtjZGJwNHlFbUl6OFFlTjFm?=
 =?utf-8?B?bENQMmZCaFMyaklBWFFyNG5EMUZHVVcwaER0UlpydXZUK0FYZUE4WGsvY1ZD?=
 =?utf-8?B?MGxtZ3BnTUpjTlBXS2tZTUNyd3NZV3BudUQ4TzQrSWYrRVdLa2RPTVBhOERr?=
 =?utf-8?B?TUpWYkI1dTROZ2F5N0ZsOVB3V0Y3Und3ZXlhazl5THd4U2NvRzVoQnpMd3lX?=
 =?utf-8?B?N3FUN21UdFlvZWVKSndKd25lbXZJR3RCSUR3YTRzeXdsVzVBNEFBeUY5c2Ja?=
 =?utf-8?B?S09RS0I2RjV4WFRvTWxrL1BwcXVOT3VCOEtTelJNZm81SklZbmdZSXhsUTFn?=
 =?utf-8?B?MUJYUEVxc0JrcjRHOVl1dHRBOWFSa3FxSXdRWjdJZnhnTVJvL0tyT0QwYlht?=
 =?utf-8?B?cWR2WS93VnBKaGFwV3RYU3RmN3N5YW93QzloTFZGUWwxS3pXYnhOMVg4WUhT?=
 =?utf-8?B?M0Z5ZVVjZ283azFObS96dFk3WnVqbDRhaXNubkJUeXN3aXBQcllOOFp6Sndo?=
 =?utf-8?B?c09BZU5HT25XRG5vM0kxdkNkQ28weCt4ZXJubUFBcGJSYkg0NDRmTzJFWnJM?=
 =?utf-8?B?b1B4cEdlL3BlR05sbVlST1hZTDkvaGh2enJsWjhGaGFZQzRjZHNaUVJmdnNv?=
 =?utf-8?B?MUlIUXluMmU1YWpCeitpUWJTMkhrK1VhYU5XbG5kUHpqTVpaVjhVandlTTZR?=
 =?utf-8?B?djVYM2tkOWhoT2ZJYUlnMStWSUpaT2tiZlJDWHZsbTYyamNRTjFyb3BPdU9v?=
 =?utf-8?B?aU9mTXRDT2E2Wm9RQXFNSFRyMHgyR1pnY0pnd1F0cWlhaXJaNVZ4SmFsRlVk?=
 =?utf-8?B?eTQrVFhlVW11TytHaWVNTmZyU2hJVVZ0T2JVK21JanRrVkhUMnZXY1N6UXZp?=
 =?utf-8?B?YUQ3NDFJZC9pTHNnZVZLNHBwZFAxeW5zWWdNYytsZVZlc0JaZW9LRUV6M3Nv?=
 =?utf-8?B?WlJvS29xWFNreXNUZTBvZEh1RENsT2h0UENrMlM1clRJS3U3RkxnQXdSY3Zx?=
 =?utf-8?B?bEp1N3VrRThjWWIxVUx1My91NTM4NkVaSjU2YzlKRGxiQU94QzZCamZuZGJP?=
 =?utf-8?B?MWJSQjBVdlBKOWdObklsSTc4RlF1ais4UG45Q2UrNlhreEE5YWdFSFhXeFFL?=
 =?utf-8?B?RE1weDZVWFZSOWgwWi9rRWRtblNOdkE2YjZTQ21rQlladXZSK1l3VnNpN0pK?=
 =?utf-8?B?L2RYUENOaXc4cng0dWZNaVZZRGdVYlVNYkpsNkRoTUxHcW1ROW1rQWJic0JP?=
 =?utf-8?B?SXVublM0NVZ5dDNINi9TS3ozd0o0c2xNZ0lpRVE2K1BUSFI5TG5xY1JwOWlC?=
 =?utf-8?B?TkxiZFVSRk12RkVLUFo2VTJLWDdQc1JlRzVUOWduc3cyTHkyL3hURVZjdjlm?=
 =?utf-8?B?MlNjRmdlM3lhYkxianJJY1FVYm5ES2hmYkNpVldoLzQ5NVZlMy9SSWpPKzF2?=
 =?utf-8?B?SFY5bjVWbS83cW54Z2xIYnBwTkprelp1ZGlXQ0NMYlNmV0VYK0VnNWRSWmRw?=
 =?utf-8?B?cUNNNXUwa2w4cmJKb1YyODB4NmN1am4zK0hQZERwY1ZrOXNkMlJmRjd2SFRJ?=
 =?utf-8?B?cUpqYnQ5QkJEd2w0emEwcVRQb2grL3hoOTgvZy9JTUdjSUdrLzZmeFhwaFFw?=
 =?utf-8?B?bkVLclR2Z3N3ekxuQUpMdmJQV2FVRjdaTUU3d2Y5Tk00MEpKZG9BWkVxS25O?=
 =?utf-8?B?REcwYTdXbG5vQW1mNUhnYmIraDlyelFIVkpyTXlsVFhieVc3R1RrSVZ6ZUdW?=
 =?utf-8?B?c1hoZ093MXloRXduaWRTc2I3TDlCS1kwMzdsN21lZGhITTMyR2sxT1lrMk5K?=
 =?utf-8?B?eGJ2YXo3cnRCaDI2aE9qWlkybklvd2NiMnhRMDlBMDRxRXJFNDZzODJUSVo2?=
 =?utf-8?B?eXYzZFBXK04wY1J6UDkwRjFjUTlGOXh6VUJ5RS8vMXN6czRjWXZXRmJqY0Jl?=
 =?utf-8?B?KzBmcFZ0aGNiTnFxb2tTSmZIL28vU1A4cjg3ejZILzZtejVmYUVGcmUyZ1BP?=
 =?utf-8?B?WjN4b1RXV2VoTjVQMWRNQllMNW9ZOE5YR1dDZmkzTmdMYVBnTjlKeXFtVUd3?=
 =?utf-8?B?TVE9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc31cb59-7a60-4aa4-5dca-08db0a9f3639
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 13:11:53.2926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tIFzYAGLAxp8g4sKv5nQCeUfli17aYRQeKWAnehG2R8uYjRqod0qw7LF+Btncz5LYwJ9/ABqxftJq9d7ZXCsQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6852
X-Proofpoint-GUID: k_Tuf-tYky3STqa9TUyU78BDDx4uvTbf
X-Proofpoint-ORIG-GUID: k_Tuf-tYky3STqa9TUyU78BDDx4uvTbf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-09_10,2023-02-09_03,2022-06-22_01
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


On 09/02/23 3:59 pm, Daniel P. Berrangé wrote:
> On Wed, Feb 08, 2023 at 09:35:56AM +0000, Het Gala wrote:
>> Existing 'migrate' QAPI design enforces transport mechanism, ip address
>> of destination interface and corresponding port number in the form
>> of a unified string 'uri' parameter for initiating a migration stream.
>> This scheme has a significant flaw in it - double encoding of existing
>> URIs to extract migration info.
>>
>> The current patch maps QAPI uri design onto well defined MigrateChannel
>> struct. This modified QAPI helps in preventing multi-level uri
>> encodings ('uri' parameter is kept for backward compatibility).
>>
>> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
>> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
>> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
>> Signed-off-by: Het Gala <het.gala@nutanix.com>
>> ---
>>   qapi/migration.json | 131 +++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 129 insertions(+), 2 deletions(-)
>>
>> diff --git a/qapi/migration.json b/qapi/migration.json
>> index c84fa10e86..79acfcfe4e 100644
>> --- a/qapi/migration.json
>> +++ b/qapi/migration.json
>> @@ -1449,12 +1449,108 @@
>>   ##
>>   { 'command': 'migrate-continue', 'data': {'state': 'MigrationStatus'} }
>>   
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
> I'd really like this struct to go away, but if it must exist,
> then call this field 'addr', as I think 'socket-type' is overly
> verbose.
In v3 patchset, I have already changed from 'socket-type' to 'data'.
>> +
>> +##
>> +# @MigrateExecAddr:
>> + #
>> + # Since 8.0
>> + ##
>> +{ 'struct': 'MigrateExecAddr',
>> +   'data' : {'data': ['str'] } }
> Instead of having the field called 'data' lets me more
> descriptive, and perhaps rename the struct too:
>
>   { 'struct': 'MigrateCommand',
>      'data' : {'args': ['str'] } }
>
> Any thoughts on whether we should allow for setting env varibles
> too ?

Daniel, won't 'MigrateCommand' be too generic ? I am of the opinion 
that, if its related to 'exec' transport, the struct name should reflect 
that ?

I did not get your question allowing setting environment variables. 
Could you explain it in more detail ?

>> +##
>> +# @MigrateRdmaAddr:
>> +#
>> +# Since 8.0
>> +##
>> +{ 'struct': 'MigrateRdmaAddr',
>> +   'data' : {'data': 'InetSocketAddress' } }
> InetSocketAddress is a plain struct, so I think we can use
> that directly, no ?
Yes, we can use it directly. Just to keep consistency with other 
transport mechanisms, I made a separate struct even for rdma.
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
> Ideally this would be
>
>     'data' : {
>       'socket' : 'SocketAddress',
>       'exec' : 'MigrateCommand',
>       'rdma': 'InetSocketAddress' } }
>
> though the first SocketAddress isn't possible unless it is easy to
> lift the QAPI limitation.

Yes, I agree with you Daniel. If we can fix the first one - 
SocketAddress one, can we also allow ['str'] to also be directly 
represented by modifying QAPI ?

ex: 'exec': ['str'] ... something like this ?

>> +# -> { "execute": "migrate",
>> +#      "arguments": {
>> +#          "channel": { "channeltype": "main",
>> +#                        "addr": { "transport": "socket",
>> +#                                  "socket-type": { "type': "inet',
>> +#                                                   "host": "10.12.34.9",
>> +#                                                   "port": "1050" } } } } }
>> +# <- { "return": {} }
>> +#
>> +# -> { "execute": "migrate",
>> +#      "arguments": {
>> +#          "channel": { "channeltype": "main",
>> +#                       "addr": { "transport": "exec",
>> +#                                 "exec": ["/bin/nc", "-U",
>> +#                                          "/some/sock" ] } } } }
>> +# <- { "return": {} }
>> +#
>> +# -> { "execute": "migrate",
>> +#      "arguments": {
>> +#          "channel": { "channeltype": "main",
>> +#                       "addr": { "transport": "rdma",
>> +#                                 "rdma": { "host": "10.12.34.9",
>> +#                                           "port": "1050" } } } } }
>> +# <- { "return": {} }
>> +#
>>   ##
>>   { 'command': 'migrate',
>> -  'data': {'uri': 'str', '*blk': 'bool', '*inc': 'bool',
>> -           '*detach': 'bool', '*resume': 'bool' } }
>> +  'data': {'*uri': 'str', '*channel': 'MigrateChannel', '*blk': 'bool',
>> +           '*inc': 'bool', '*detach': 'bool', '*resume': 'bool' } }
> IIRC, the intention was to allow multiple channels to be set in a
> follow up to this series. If so that would require adding yet another
> field as an array of MigrateChannel.  Should we just go for the
> array straight away, and just limit it to 1 element  as a runtime
> check ? eg
>
>    'data': {'*uri': 'str', '*channels': ['MigrateChannel'], '*blk': 'bool',
>             '*inc': 'bool', '*detach': 'bool', '*resume': 'bool' } }
Yes, I got your point Daniel. But I feel it is better to introduce it in 
follow up series along with introducing different channel types (main, 
data, postcopy). It would then also make sense to introduce a list of 
'MigrateChannel'.
> With regards,
> Daniel
Regards,
Het Gala

