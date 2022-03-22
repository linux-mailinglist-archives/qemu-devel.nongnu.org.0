Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE1B4E3C62
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 11:23:27 +0100 (CET)
Received: from localhost ([::1]:44408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWbfh-0008OJ-TW
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 06:23:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nWbcP-0006OF-Rc
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 06:20:01 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:52936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nWbcM-0006te-90
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 06:20:01 -0400
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22M3Q6Na006986;
 Tue, 22 Mar 2022 03:19:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=/1QZwx9OBCPhxukN3Uy0T4ps8vb1fHv+UB7PSVXbIxw=;
 b=BgmIK5kbL88QKMkiX9XNveqcXB4nVJJsWJSS6VG+lKzw7u0BJZf8R3/OXKYK8tMrOAOl
 Qgt0sUqYnJkzJY/zRpjcK4PX0suJrEi5ja90HQdzZ/nKveid/ny2XPU9b/aiiNgWbW5B
 JGZNasDFFmekYV61x2COLurDa6HaQMpkrM7hs7LwL80aB2rs2as/X+j/Jt+SC6M3wd/h
 Ga9YcnFBhSTZKwADN8sQ6n+Wj5tE1g2PS02HYgtzMhIzRT4kD5BiQYO9GdAPwh3EBlv7
 zyr1PkmtO+Yx48M38OYZsFshGSlJkwz0voluMDUqcjfI5R78OBBAKKXIvHAKP1h9s0KR tQ== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3ewd9gwq4w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Mar 2022 03:19:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FesMFvD2rGHnfmNkE3XB9pPlAWwRtW0e5c5kCN0DWJhAQRGyODUAb2zNPukPDqOtcvfKcie2C79HaWPBF1JYfqD96Ygmo0hGOZSVCSwkC+Z/yx/zuPaSjXiGwKtagXk/wqhw5WcPBJi99eSI9Px3IirJGsM+nZvmxWzl5AnD1mJL0sVBQbpL4rhQkC/80XHl+SMTW9xxSQhFMUqShrcijV+jkO+IJTMV0FtVlTbP9FAALy5JeFKtfj4OOrcEaDEJWgVL9Uf3NU9/QfUInEFHnEU1Xqn6Dzt/pahe9zqmz1diJmxNyhCzmzvAnGH/XUNT2BkxGemsuCCelT0lTWOyHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1QZwx9OBCPhxukN3Uy0T4ps8vb1fHv+UB7PSVXbIxw=;
 b=ZRDED+flxYHOwNYlfP7rnTklyEsbCcLsZRr/KG5YA/GRsUQt5kxPlAqPtLuGCN7FbP3xd0FnX4fyXLeLQAf7ebECFMms0kEzxFULlaI2t8g/Pkd23NfjWJ0mqqtyaVytahYv+R6WVjh4t/M1jg8MKAgZG694LbYNQyo7CQwxZmoN6YpZyK0NPZ4mFiaNq83rIm6wRBoqCBCQdAbx1xLpVwHBmJIGdxpzkUCMiEl292QDEoJa43Zi3MsWhcEpGC0367k7jNrHx8W3yarvdQH2QwQwVVEAnJzW56oK6bOcrJ10EXTxcHarO02I8oZIzf02qnkAKpcxFGys/hhShOH+4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by SJ0PR02MB7136.namprd02.prod.outlook.com (2603:10b6:a03:294::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Tue, 22 Mar
 2022 10:19:53 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d%6]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 10:19:53 +0000
Message-ID: <42151beb-30ca-775a-046d-365c547da87c@nutanix.com>
Date: Tue, 22 Mar 2022 15:49:43 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] Added parameter to take screenshot with screendump
 as PNG
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220322081845.19680-1-kshitij.suri@nutanix.com>
 <20220322081845.19680-2-kshitij.suri@nutanix.com>
 <YjmbL3E2CRqjFii1@redhat.com> <877d8mi98r.fsf@pond.sub.org>
From: Kshitij Suri <kshitij.suri@nutanix.com>
In-Reply-To: <877d8mi98r.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0168.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::23) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e32fe6a7-b3c9-4838-1e50-08da0bed8143
X-MS-TrafficTypeDiagnostic: SJ0PR02MB7136:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR02MB7136778D2C8B93CD084E1CB499179@SJ0PR02MB7136.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5tJ4MgO3fyc2PEvr5sAwu7KeIT0HfdmBH6rthmtJL3utnAaS7N0N0kah8xfV8dZ0f+0IqYy3al25bMvdY0lgpklnmq5/u0QHyHr+MNgt5GFW6UHDQNlxZBHx2FhjDCy0QEJ1ipzuFl8D5D5ALd+Ys8G/MEmjoFRkVdmcYZI1jKQk54TgH3lxmLKh/LUbdGbiUJZ1bbToLwcNgNEA5fmpQOk/onKHKIVml3NtZ8oDQ8EK7BcmTzbM95amS6ZKDpeYICiMNjSBOvoshKAIBtZZVezcE4wqDDemFnDhCsNNdPA16+3+nPMCcmGILB2sUB/6tbWZab9qicNEYlbDTHJ8aFzF8/pVY77WdCJuFe9aQVxZgOrNbCEbVHWK11ERPNQIuJCtKkyIwM7sLRB1NmYQh2wvr6wWVO2oub7jwa787kJJGu2dJeVDRBypRxXyTk7I9FP2cnP/V4vqRXDASvYnFaDv0bXgc4erGaIJzNMBREwLjeIImTkn6DIT6c5ijB33WIh5jaB0G39CSvGE6KBqopCx4Za/VQWro2PF67J1xGOm1e1D8pA+ONpDacisIaI53jJomqnma2AXnGx9bGvnGiC4fDhBHz36txVPVBToB/QAuBfhFYYGqx5Vdpnk3kYXUdMUVlAUArTrO+NiNjseWGwc9V/GwPPjpgA6jix1uhDNg30cXqXvmRF1i8LkqDZ6iNPrao/QldvQhZvpYJ9UYEdkBt/WYwst5KeB97ExQUDoZvb7FJDMNZN7baPVi7hLeXcPEGts78lqRUt5o+0k6yQCkAUlS5ZaK6KK4NrSEt8JdVRlIDhgaUWUzDtwqhvscZO+iGspB1u0DDP+J5PKWyqP/4aUDOrXxp8XHT18gR8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(8676002)(66476007)(66556008)(66946007)(316002)(31686004)(2906002)(966005)(6486002)(110136005)(508600001)(86362001)(38100700002)(38350700002)(31696002)(36756003)(6506007)(6666004)(6512007)(186003)(26005)(2616005)(53546011)(52116002)(8936002)(44832011)(5660300002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXJROEdSSGo0Z3pydVR2Qnp5NzlNT2Y3SFllL3NnYWM4c2hFWjZVZU5CcGVT?=
 =?utf-8?B?MXpXKzFGWGVaZUFWWG9PZVRZZ0s0UVM3OXVMYWp3ZCt0OUU1YlluMnZvYkQx?=
 =?utf-8?B?VlozMkxKSGQ2QTZXZC9CMm50Q3M3QTJ6UUc1aEhJMXZDUDJ3OEFTTUNLT3Nz?=
 =?utf-8?B?NFBpMk9rZEd3MytGM3BMaG1kVHV1M2NSQzRycWJJK3FrWk9JMVp6ZTM3MTZz?=
 =?utf-8?B?dnJIMGY2WDRIRnZVN2xJaGZjaFMrRFFLTFZ0Z3hxRWNOcFpqVVMxa3dscTZs?=
 =?utf-8?B?bHhRekU0aHh1aC9WMktxU2gyUzBuNUtRNUZpTGRWVzZpenQ4aUdCelJJOVd2?=
 =?utf-8?B?SDFGMUEwR2VEWnd6K0w1czF6OVZWYW1venBSNU03dXFkZ0U2NitoZXdVS3dz?=
 =?utf-8?B?TTZEV2QybE9WR2lWUkN4MmRidHFRSytzOEtuUGVMTVVoaFh6OXdSZ2kzRmxo?=
 =?utf-8?B?Rk9Pd1FYUlVsb2NsWnljYzNSQzc5a2RDVHZZL0F3SHd4WVVTM1RKSUh3VXYw?=
 =?utf-8?B?Z21uL2ZYaFRnR1RBUDNxL3dkNklXNUwrS3hZVWp5bWloZFlYQm9vcDlPNjBu?=
 =?utf-8?B?RTNDb01FcHM2NExBcVdKdWtWQmdRcWIyMURhcDBaMXVqNjRZdGVKMDFFNysw?=
 =?utf-8?B?OG5ZM1plbWlQV2hsMWxFdm1oRDl6WWJCL3BPNVlyejFIVnB1UkV1dnFjZkNW?=
 =?utf-8?B?VkJuV1hoUGY0YkZtQjByaUhiK1NFT1FBaEN2emVHdldrcjhPYWlOY2NtYlJJ?=
 =?utf-8?B?TGZsR0cyZzN1RVF0NExKU1lCQUk4R3ZXNkNYem81OU1BSXkvTnAzY2JBTFVS?=
 =?utf-8?B?MVYyUFJaa0UxMXdLc3R2RktTcUhONlFwK1RWUzNqM0ZXRVhXVnpPNjZpMEdN?=
 =?utf-8?B?S1FoWGVCM2VES3ovNWp3OTBrMVYxR2QvSllsRWMyV2EvUnNUdjRORkRNWHJN?=
 =?utf-8?B?Q2Z4TW16Wkw5V3VZUnpCbnhYTnByY0V3RC96VFNOVkdFaGNiYVMxRzRVRVc0?=
 =?utf-8?B?eXlhak9sZ0hBcHlWZ1RWSktIQVY4VGZacUJDa2dFaHJzRVFOTWd6dzFCMVBE?=
 =?utf-8?B?ck5xVi80enc1TkhpeGZpMjNqMk5qYTROY2hUY2dwS0tabTljZk1GOW4wUVp1?=
 =?utf-8?B?RVRhMWpEUXZhd3l4SXJGS1h4SVBoRXlESExVY3RGcGdSTEdVRnVlcEZ3Y1FD?=
 =?utf-8?B?dXZwYVpTUS82RjlYc1kvcGtvRlNQcnhxVXhkaXdCbjRudW00VzFyK05xQVpa?=
 =?utf-8?B?d04ydndFOGVNMlhiQWdyYlRRS254Z0YvLzFwbG1CNW1OQmxXWHc0SUlHcHpk?=
 =?utf-8?B?L0JIVFlNTWZtUGNWMno4S0ZHVncya1R6L3ROWUNSanZjOXN2WTBDV0hoRTZY?=
 =?utf-8?B?alNLWFc0NzQ0cldORGZDSjhDQUNKbWg5eHV2ZkJ1TW5mTnYzYVZ6dWYxS1Qy?=
 =?utf-8?B?T3g3TGNKeXZDOHBOMVVQMVpmQzl6THVjV3RidHpDenNrVFI4K3JuOXNHSms2?=
 =?utf-8?B?NlNhVHVDd29aNEx4UmduTTF4eWEwRlJRSG9oV0hmbmFOMWZKaytrRzEwdk9M?=
 =?utf-8?B?OEVBS0VCcFJzWlMwNjFTRDZjZ0l1aXNtdzJKV0dlejFxYTJBMHhsY2x0eVR2?=
 =?utf-8?B?bW9iQ2hxS3NKc01SdFFMREtYZjBpY1Ivc2s2bGs3UnM0YXhNanJOSHB6TGpZ?=
 =?utf-8?B?UUVxVmNtRElyWnNDOE1Rb3JIT3F6TDg3ZG82NFkvWm9aUXhqR3dvdng4NExl?=
 =?utf-8?B?eSs5OXNHczlaTi82UGJ6RlJOTHd1Q1BnbVQrNlVGMWxORmxrSEh4ckFnWkFF?=
 =?utf-8?B?em5uVUVjNElSaEJuSUd0Z0NIQkdmQVJjcU9kTDVYenRRd2dkQ3dFeWNyVkQv?=
 =?utf-8?B?UWpOQ1N5TDhGNGY1L3ZsdTNLMDJqeXcwS1FIZC9MQm8xRVlhdGJDQUxhSU5O?=
 =?utf-8?B?SEtnSW9WVEpQOUduWkZaL3JWeHN3c0ZjcWJJNjFsbnZiT0VDZ013Ny9sZUVJ?=
 =?utf-8?B?U3V6QkpKQ1hBPT0=?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e32fe6a7-b3c9-4838-1e50-08da0bed8143
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 10:19:53.3910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I00r7nObJRPs0Ew4g3/xyfoIUljppOfFYm5I0FH0sQDId7iWS7ONuKv6NRK/MPuxhdaKDRGc3eGZaLPppUMuy34MwA18A8FbcCn4Rp8tHgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7136
X-Proofpoint-ORIG-GUID: 6coj-xZyDLHPvVU1U8DcTIYZGvVSm6C4
X-Proofpoint-GUID: 6coj-xZyDLHPvVU1U8DcTIYZGvVSm6C4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-22_03,2022-03-22_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=kshitij.suri@nutanix.com; helo=mx0b-002c1b01.pphosted.com
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
Cc: soham.ghosh@nutanix.com, thuth@redhat.com, prerna.saxena@nutanix.com,
 qemu-devel@nongnu.org, dgilbert@redhat.com, philippe.mathieu.daude@gmail.com,
 kraxel@redhat.com, prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 22/03/22 3:45 pm, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
>
>> On Tue, Mar 22, 2022 at 08:18:45AM +0000, Kshitij Suri wrote:
>>> Currently screendump only supports PPM format, which is un-compressed and not
>>> standard. Added a "format" parameter to qemu monitor screendump capabilites
>>> to support PNG image capture using libpng. The param was added in QAPI schema
>>> of screendump present in ui.json along with png_save() function which converts
>>> pixman_image to PNG. HMP command equivalent was also modified to support the
>>> feature.
>>>
>>> Example usage:
>>> { "execute": "screendump", "arguments": { "filename": "/tmp/image",
>>> "format":"png" } }
>>>
>>> Resolves: https://urldefense.proofpoint.com/v2/url?u=https-3A__gitlab.com_qemu-2Dproject_qemu_-2D_issues_718&d=DwIFaQ&c=s883GpUCOChKOHiocYtGcg&r=utjv19Ej9Fb0TB7_DX0o3faQ-OAm2ypPniPyqVSoj_w&m=xFoMMCA3XaOs_syRsqPtgrgJy9F4pkHZI4GT5W-tgE7tns-XSTSdrcEjEu3Ft8gY&s=71h7PAt6kWooW2flunhGC7SDoQJeI46QCYxdIwnrA1Y&e=
>>>
>>> Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
>>> ---
>>> diff to v1:
>>>    - Removed repeated alpha conversion operation.
>>>    - Modified logic to mirror png conversion in vnc-enc-tight.c file.
>>>    - Added a new CONFIG_PNG parameter for libpng support.
>>>    - Changed input format to enum instead of string.
>>>    - Improved error handling.
>>>   hmp-commands.hx    |  11 ++---
>>>   monitor/hmp-cmds.c |  20 ++++++++-
>>>   qapi/ui.json       |  24 +++++++++--
>>>   ui/console.c       | 101 +++++++++++++++++++++++++++++++++++++++++++--
>>>   4 files changed, 144 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/hmp-commands.hx b/hmp-commands.hx
>>> index 8476277aa9..19b7cab595 100644
>>> --- a/hmp-commands.hx
>>> +++ b/hmp-commands.hx
>>> @@ -244,11 +244,12 @@ ERST
>>>   
>>>       {
>>>           .name       = "screendump",
>>> -        .args_type  = "filename:F,device:s?,head:i?",
>>> -        .params     = "filename [device [head]]",
>>> -        .help       = "save screen from head 'head' of display device 'device' "
>>> -                      "into PPM image 'filename'",
>>> -        .cmd        = hmp_screendump,
>>> +        .args_type  = "filename:F,format:s?,device:s?,head:i?",
>>> +        .params     = "filename [format] [device [head]]",
>>> +        .help       = "save screen from head 'head' of display device 'device'"
>>> +                      "in specified format 'format' as image 'filename'."
>>> +                      "Currently only 'png' and 'ppm' formats are supported.",
>>> +         .cmd        = hmp_screendump,
>>>           .coroutine  = true,
>>>       },
>>>   
>>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>>> index 634968498b..bf3ba76bd3 100644
>>> --- a/monitor/hmp-cmds.c
>>> +++ b/monitor/hmp-cmds.c
>>> @@ -1720,9 +1720,27 @@ hmp_screendump(Monitor *mon, const QDict *qdict)
>>>       const char *filename = qdict_get_str(qdict, "filename");
>>>       const char *id = qdict_get_try_str(qdict, "device");
>>>       int64_t head = qdict_get_try_int(qdict, "head", 0);
>>> +    const char *input_format  = qdict_get_try_str(qdict, "format");
>>>       Error *err = NULL;
>>> +    ImageFormat format;
>>>   
>>> -    qmp_screendump(filename, id != NULL, id, id != NULL, head, &err);
>>> +    int val = qapi_enum_parse(&ImageFormat_lookup, input_format,
>>> +                              IMAGE_FORMAT_PPM, &err);
>>> +    if (err) {
>>> +        goto end;
>>> +    }
>>> +
>>> +    switch (val) {
>>> +    case IMAGE_FORMAT_PNG:
>>> +        format = IMAGE_FORMAT_PNG;
>>> +        break;
>>> +    default:
>>> +        format = IMAGE_FORMAT_PPM;
>>> +    }
>> This switch looks pointless - the code is passing the default into
>> qapi_enum_parse already, this doesn't need to handle defaulting
>> again. This just needs
>>
>>          format = qapi_enum_parse(&ImageFormat_lookup, input_format,
>>                                   IMAGE_FORMAT_PPM, &err);
>>          if (err) {
>>             goto end;
>>           }
> Correct.  See my review of v1 for a detailed explanation.
Thank you! Will modify it in the upcoming patch
>
>>> +
>>> +    qmp_screendump(filename, id != NULL, id, id != NULL, head,
>>> +                   input_format != NULL, format, &err);
>>> +end:
>>>       hmp_handle_error(mon, err);
>>>   }
>>>   
>>> +    for (y = 0; y < height; ++y) {
>>> +        qemu_pixman_linebuf_fill(linebuf, image, width, 0, y);
>>> +       png_write_row(png_ptr, buf);
>>> +    }
>> Tiny style bug, indent off-by-1
>>
>>
>> With regards,
>> Daniel
Thank you for review!

Regards,
Kshitij Suri

