Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 362C54C2BA1
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 13:26:50 +0100 (CET)
Received: from localhost ([::1]:51094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNDCr-0005wD-9N
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 07:26:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nNDAD-00031P-MQ
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:24:05 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:35538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nNDAA-0004tS-O2
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:24:05 -0500
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21O5FnM5015462;
 Thu, 24 Feb 2022 04:24:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=70KWPLIxRNLNUdXAaPfer24oVM6olGh5ryYNdR/RrD8=;
 b=uuT0Ev0EDEYx/sWuw7Ct6r5MsaLWooHGcGBGr3Hkc8z8SF7diS/0D/7By9Ey31nHg5UK
 mbgnkh6PQAM4wrTVoKy/4eDpZANFjS8e2v3J2Ztgvs3gMTuiLJXpBqQmrFdmifqv8rxG
 UXRDnv8YKKrsCLBCAMh9xaQ6Hw9Avjz7yIzrSNOBD0uBkK+oGOnJhp876dRcuC3RwVPj
 L3gdGysvNjT6jATnB/NABA3loojLjwaNr60jf3uzO8zVmiZ8Z1pKB2q3/cO3wS/Ss1Vv
 gCro1RFrCxYbDXnSUXIJyUiDxyRKdFAfuPo5nZuf6JRfiBFT7+BWnwcO5qhqit/25Vr+ Ew== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3edm99trmw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Feb 2022 04:24:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LyZCzBYVUbjwTwtBvySVyz0yqk0/qeEnjxs18f/AHqzq8hbbE2Ck6EoCbotSqvW9Ye+qpK53W9vcYdUu/FSklJTuNyAI/liguPqL9vXi1TbGjD4iYAtp0HGM+6jA3FYnDiINVXYqUbzSNi4IBOdj86pTXZVVkqwAjdaxfY3FlqUx3AGuAb36gfekc/0yJVsVMtWHXilDnUDO7peRriMl+MxU/zyJRWlNA1ax6wY6c/sPJ+X3FO0ObvFA2VXwaFnco+GSi+dmeg/j8ozaIli+bbpM7OoXaNCCsrGJNT1DuTyL69WVwdCwqLtZ+kOjRT8Jp/xfIqTi9eRCt5SVe01uhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70KWPLIxRNLNUdXAaPfer24oVM6olGh5ryYNdR/RrD8=;
 b=Bn9w/eBjrPuaDjYb0uv1ooJcO+TWUbTsGoSN1YCB4XYt7YnAUrqZPil8PoHe8QZzNJZZdUOuJ2B5AtlEN0MUizhRMkvFwWNlsXKh/saYogLv9dYDn8kwtPtB3CbIDXHt5NRHjnyT0mv6xsbtogEjF2OyQzgWyfb/15MChYXyetMh7aghR/3XcT5Tjjky6FWg1DQhJG58rb8fKGowtb0ob1jvXgrsILNb3faf8Xn1tREEuIFy8XMcJParou53mtOi1y6SFrw+k7mTTweHrWpm20PPObSupb16ddtcFOZAY6kjz0ZiYoGA53HzHIfcT84F7j5CZCwRA340MyeZIxquBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by DM5PR02MB3193.namprd02.prod.outlook.com (2603:10b6:4:62::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Thu, 24 Feb
 2022 12:23:58 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::ade5:1204:b102:bfab]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::ade5:1204:b102:bfab%5]) with mapi id 15.20.5017.022; Thu, 24 Feb 2022
 12:23:57 +0000
Message-ID: <f7f9bb82-4a09-b64e-5ab3-2595507e26c4@nutanix.com>
Date: Thu, 24 Feb 2022 17:53:45 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH] Added parameter to take screenshot with screendump as PNG
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20220222152758.207415-1-kshitij.suri@nutanix.com>
 <YhYT1i68j/VcSZsD@work-vm>
From: Kshitij Suri <kshitij.suri@nutanix.com>
In-Reply-To: <YhYT1i68j/VcSZsD@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR0101CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:c::25) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b3eb67d-9045-4772-ae50-08d9f79087bb
X-MS-TrafficTypeDiagnostic: DM5PR02MB3193:EE_
X-Microsoft-Antispam-PRVS: <DM5PR02MB3193CF175EA613CB0DBB92B2993D9@DM5PR02MB3193.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hl3mqyUqaFMIFeHBNR6q5XlOEJ/Al3HfpGit5E2CAaz+IXqtEGwTJMVBcfer94x110BjtoIXnmr8cLC75SgR875dtbI1mdbowtSTjP12VaM1+bp9eq8DByAOQQfTGGss8qi9MgculadJF2oWEsJcwLvxe1RDlIkKhrwIPhOqRcusvUd+qMy3cnwPWwnnN9iZUs6WH2BBWcStVjfHQEuXomZzWiX5ngSAqw2nKb9xMXKTYm2SKs7YkYtb/P3UpQyY1NyF/YMkfrC8wwIwOjTA2pORzISdw1XR9hUl4w2kHDGz6/oS7fZo1+H/BRZwdUZk/CnFjnsNHfbo5MYgd0dcu8XPMHeT7ohK6KX5bXRkh4CEMlPyFU09eeB1ZgSP6yWMIAptPw9QjB0Ux9E8hvgJBMI6NCHhtWzVopjhlq/yrtYjVAL5kEbnOtX/zEpL0HoIHvrPXFOLEHkcQ7H6IoByO6JSLoEn+GG8vhaBTfqLh7QLLYp3Wta98z30pR/wEb3Gck6p75jCjJ17OXElqzRdpiRnR9t4ORDck3jvGDDTnyIncTpc9CNBCDqm6HuqRKrDjq0IAC7ybRLNcy8y9F7a/026TG6n+DTdxYdB2g1Duu/R39hAgCzwoe3Suv1TpyIj0MeJwB3Mqfu8vmpsWIaQeDIO0HxRLaSi3ckfL4ima0kJ0ATIHeYvOjD93FHD31+cYz+befOoAGmosJ+B493EGBoSNZqK/kl5nbax3TNWRNT6TRt23/aiSWcX4qy+GU7yMzhEIo2s1Y7xkTrd4YOSIh0FCSKXuF5wyZHa8C8jhEIjn3yG/3E9mk9j3poB9cis/0PW8DjgEhwuK2A3CdGEyDhm80rnQmIKBNa+2Bli1dmSOWMLSsOQD3HFRTphhsXtDb5fpNOr5GIhg/oh6eZDMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31696002)(38100700002)(38350700002)(508600001)(66946007)(8676002)(316002)(6666004)(4326008)(6916009)(66556008)(86362001)(6506007)(66476007)(6486002)(966005)(66574015)(5660300002)(36756003)(44832011)(53546011)(26005)(52116002)(8936002)(2616005)(31686004)(83380400001)(107886003)(6512007)(186003)(2906002)(30864003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzZtbGZLTGxnbWlZeVI5a1ZkOFVFcmlsMm1DR3o2TzI2UWVvTkFjWVNUKytk?=
 =?utf-8?B?aThRcS9hNjZXNWJUMmNsSlg2Y0NCdmhzR21tK1lOVXdUY1pPRUM1bkRhMEs3?=
 =?utf-8?B?UHg4Qm9GNGJvL0tXdE9TZlNmNXpmNmsxZkdFNENPNXBDbHV0Tm5GWmRlblIv?=
 =?utf-8?B?ODdBUVFKK2VteDNBY0xjZGhOTlM2TUMxeWk4Z2xRaUIxWkpEWU85ai9iM1dh?=
 =?utf-8?B?UmdvNGhoeTVxczM4eHBKQkVJa0NqK3JMZ1N5cjlMREV0Y1ZjaXlEaENQSTZF?=
 =?utf-8?B?dDEwdVFEQ1pycHBQRzZXQldGRGdscUhzUXFqMFNSREdrWEsya25oRVhKaVFJ?=
 =?utf-8?B?akRNTHZ5djhML21PeVFqOG8rYURKOFpmOFBQRDNjbUNWeXQvQWJ0b1RzUkgv?=
 =?utf-8?B?U2cwUVc0cDZONmJ2RDcxUEYxdEl1Q2hBT3ZUV1pVbm5vbStvR2RoMXBtS1cz?=
 =?utf-8?B?N21BQUNYOW95bnNJYzg4d1dyaU9nNXJrSHpBclhNZjRkbUJ4UlN5WEtBckhi?=
 =?utf-8?B?cWdNWEUwaVVlN05lK2NXVFJrcVFBdzVFNEwyYmM5RElFdmU1Zytjc0VQTGtj?=
 =?utf-8?B?VlM1LzhydHRxTTZUQVZqY2dmUmpOckJZV2dZc3dOU2FwYzFTRFhnNXFQa3Ew?=
 =?utf-8?B?bnBlbHFBODI1TUxUYkY2SjdhbVJWcmh6Q1hRWEZuNi9aNWxIbXlrcXg0NFJS?=
 =?utf-8?B?YUhuN3czeXE2WEY0UWFUd2RFcEZXQ0ZuRGZ3YmpUZ2x0djhsWnpQYXZ6M2o1?=
 =?utf-8?B?aithV05RUWFvVXlGQWdJKzVNTUdNeE9RMkRvOTJ6S1JMU0lpU2syN3hNVE4v?=
 =?utf-8?B?M0d2UzhXSnp2dURuVzVlaC8rZzNmeGxlenN4MkFjNHovWkpsbGNBelNONHFU?=
 =?utf-8?B?YmhhTHFrNXBSeFAybmo2NFdFN3VqT0srYjZ6aE1JRk5lazlHbnhHdit2UGxR?=
 =?utf-8?B?ZVExVDhJbHdORCtkUXRPR2x6N0VGbVBPb0lZRzRZc1Vpckx5QTV5cTVHbFgz?=
 =?utf-8?B?aUQzS1B6ZXR4eDdmRWcvMzdFbUc4OFo3RjBKTnhBUlFIazNZM2E4bmlLUzMz?=
 =?utf-8?B?bUZlNUY0MktaWWphNFh0WHNpb09oak9xT01XeFJyNEFIZVM1Z01EcWt0VmdQ?=
 =?utf-8?B?YjZ6REUxa2FCWStuTXArQWxzeUlwaEx4dllkc04yUXZhclhjMFZXMFV2T2ds?=
 =?utf-8?B?cHRxTWU5aHBwdjVPM1R6R3cvbDZ2K2VzdGp4S1dWenlZR1FpcDRXdVU5aS9a?=
 =?utf-8?B?SzNZYWJ3RWFMSlVrV3V2OHlicW1GSUI3QXlGRzJlWURYbDdXczU4T3VKcHB2?=
 =?utf-8?B?WEc4aDNObS8vNFpLK1NlaTZERkxpdFNUVFl0elVQYU04dWpqSHc2dEdJZ1pt?=
 =?utf-8?B?ak1HUEZrME9BT242b3ltcVFaZUdYWG5wcmQ0MVBuVFdIY05lTkVUZktvQkxN?=
 =?utf-8?B?QW5GSDkrWmxwV05GQmx0VWlwTGQ1Wk1XdnYzakFqVmJFbTFWYVZKbjBwR2tV?=
 =?utf-8?B?blU4QTNqUTh1YTMzdHBLRWpyYTZGRURHMll6Q0p5UkhjZTFUUFp0M3ZEdW9S?=
 =?utf-8?B?Y0VWdlRhdjJsTW5PUDVjOStMR3VOM1hmU2o5c0IvWDhUYjhUcGNBQ3RzaE12?=
 =?utf-8?B?SmhGSzJoMHM3anFQZmJkNmtjQ3RKcTdwNGt1YkttdHUwa1BTc08zVitvOEhX?=
 =?utf-8?B?blNPK1prVm5BbGFuVElEUTRRTzdEaEtOOStYNThvSEhiQlV3YTlsT3lKWUhV?=
 =?utf-8?B?eHI2bUh2ODlTTUNFTUNnR1RsYXJueERmbEZEd0xTZXUrOUMrby9LdUNFRGNF?=
 =?utf-8?B?Y2ROVzVhcUMvMW1lYmZzSVJJK2lkZFVlNUVmVGpWUnYxTHZSdmduaW1tS1dE?=
 =?utf-8?B?V2Z0ZU03djBLdlA0VUJMUTlHZlVqaDNkN1J0K2h2SE14cFVPNmZJM3d4UER6?=
 =?utf-8?B?bGpvYVNUakhST3Q5QlVhcnJudkxXMzVtRTdtM2pHVGFnVzRUSzIyV0h0UU1Z?=
 =?utf-8?B?eDNpUnYzUkxnTmxGMUhaL2tONnI0ZUV5TnlxWmJuellSOVprTE1veFR6VVZi?=
 =?utf-8?B?U2ZjVVh5UGJENE42cms0YkhiRVFZZmJZNkJubmJvUFVzY1d1T3RheXV5Q0lz?=
 =?utf-8?B?UU5hVG1wNjRyMVMvS0VzbDVLdnBreVNqM0pQMWpzTkttLzBqMEdGQmJxLzRT?=
 =?utf-8?B?U0w2TmhEdUNKSkxjbWxyVDhjWXNzMVU1NytBeFZCZlRnNlZ0WS95OENUb0t0?=
 =?utf-8?Q?BaUi8k+XtgALKAJQM0mYR2pM3D8NBWfPzI3T+tCQ1I=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b3eb67d-9045-4772-ae50-08d9f79087bb
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 12:23:57.8117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZukcrRnZFKxq39ioGasy9zVOl7ISUsKl/1VocL7m4WsBiWr7VWyhjVM2fZ3xms/81KSXnGgdYAWKOYaoJ3Cq/x1ts3DwvQ40Zm8zYmuwoGg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3193
X-Proofpoint-GUID: N2iTOsyZE6QAgOaK7kUJdTIMWbD0HHqu
X-Proofpoint-ORIG-GUID: N2iTOsyZE6QAgOaK7kUJdTIMWbD0HHqu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-24_02,2022-02-24_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=kshitij.suri@nutanix.com; helo=mx0a-002c1b01.pphosted.com
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
 qemu-devel@nongnu.org, armbru@redhat.com, kraxel@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 23/02/22 4:30 pm, Dr. David Alan Gilbert wrote:
> * Kshitij Suri (kshitij.suri@nutanix.com) wrote:
>> Currently screendump only supports PPM format, which is un-compressed and not
>> standard. Added an "format" parameter to qemu monitor screendump capabilites
>> to support PNG image capture using libpng. The param was added in QAPI schema
>> of screendump present in ui.json along with png_save() function which converts
>> pixman_image to PNG. HMP command equivalent was also modified to support the
>> feature.
>>
>> Example usage:
>> { "execute": "screendump", "arguments": { "filename": "/tmp/image", "format":"png" } }
>>
>> Resolves: https://urldefense.proofpoint.com/v2/url?u=https-3A__gitlab.com_qemu-2Dproject_qemu_-2D_issues_718&d=DwIBAg&c=s883GpUCOChKOHiocYtGcg&r=utjv19Ej9Fb0TB7_DX0o3faQ-OAm2ypPniPyqVSoj_w&m=YAoUy9TYXWb8lktv5hZwRWjZEBcoHKxfdrHMd8KkTnQAESANHEcW96C1ukSngzJ2&s=xJP6q9IE0req5UkOFLablyJWWREdmwS1NX4Yse0pYxE&e=
>>
>> Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
>> ---
>>   hmp-commands.hx    |  11 ++--
>>   monitor/hmp-cmds.c |   4 +-
>>   qapi/ui.json       |   7 ++-
>>   ui/console.c       | 153 ++++++++++++++++++++++++++++++++++++++++++++-
>>   4 files changed, 165 insertions(+), 10 deletions(-)
>>
>> diff --git a/hmp-commands.hx b/hmp-commands.hx
>> index 70a9136ac2..2163337f35 100644
>> --- a/hmp-commands.hx
>> +++ b/hmp-commands.hx
>> @@ -244,17 +244,18 @@ ERST
>>   
>>       {
>>           .name       = "screendump",
>> -        .args_type  = "filename:F,device:s?,head:i?",
>> -        .params     = "filename [device [head]]",
>> -        .help       = "save screen from head 'head' of display device 'device' "
>> -                      "into PPM image 'filename'",
>> +        .args_type  = "filename:F,device:s?,head:i?,format:f?",
>> +        .params     = "filename [device [head]] [format]",
>> +        .help       = "save screen from head 'head' of display device 'device'"
>> +                      "in specified format 'format' as image 'filename'."
>> +                      "Default format for screendump is PPM.",
>>           .cmd        = hmp_screendump,
>>           .coroutine  = true,
>>       },
>>   
>>   SRST
>>   ``screendump`` *filename*
>> -  Save screen into PPM image *filename*.
>> +  Save screen as image *filename*.
>>   ERST
>>   
>>       {
>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>> index 2669156b28..3fb1394561 100644
>> --- a/monitor/hmp-cmds.c
>> +++ b/monitor/hmp-cmds.c
>> @@ -1665,9 +1665,11 @@ hmp_screendump(Monitor *mon, const QDict *qdict)
>>       const char *filename = qdict_get_str(qdict, "filename");
>>       const char *id = qdict_get_try_str(qdict, "device");
>>       int64_t head = qdict_get_try_int(qdict, "head", 0);
>> +    const char *format  = qdict_get_str(qdict, "format");
>>       Error *err = NULL;
>>   
>> -    qmp_screendump(filename, id != NULL, id, id != NULL, head, &err);
>> +    qmp_screendump(filename, id != NULL, id, id != NULL, head,
>> +                   format != NULL, format, &err);
>>       hmp_handle_error(mon, err);
>>   }
> I think that's OK from the HMP front, see some questions below.
>
>> diff --git a/qapi/ui.json b/qapi/ui.json
>> index 9354f4c467..9fdb56b60b 100644
>> --- a/qapi/ui.json
>> +++ b/qapi/ui.json
>> @@ -76,7 +76,7 @@
>>   ##
>>   # @screendump:
>>   #
>> -# Write a PPM of the VGA screen to a file.
>> +# Write a screenshot of the VGA screen to a file.
>>   #
>>   # @filename: the path of a new PPM file to store the image
>>   #
>> @@ -87,6 +87,9 @@
>>   #        parameter is missing, head #0 will be used. Also note that the head
>>   #        can only be specified in conjunction with the device ID. (Since 2.12)
>>   #
>> +# @format: image format for screendump is specified. Currently only PNG and
>> +#             PPM are supported.
>> +#
>>   # Returns: Nothing on success
>>   #
>>   # Since: 0.14
>> @@ -99,7 +102,7 @@
>>   #
>>   ##
>>   { 'command': 'screendump',
>> -  'data': {'filename': 'str', '*device': 'str', '*head': 'int'},
>> +  'data': {'filename': 'str', '*device': 'str', '*head': 'int', '*format': 'str'},
>>     'coroutine': true }
>>   
>>   ##
>> diff --git a/ui/console.c b/ui/console.c
>> index 40eebb6d2c..7813b195ac 100644
>> --- a/ui/console.c
>> +++ b/ui/console.c
>> @@ -37,6 +37,9 @@
>>   #include "exec/memory.h"
>>   #include "io/channel-file.h"
>>   #include "qom/object.h"
>> +#ifdef CONFIG_VNC_PNG
>> +#include "png.h"
>> +#endif
>>   
>>   #define DEFAULT_BACKSCROLL 512
>>   #define CONSOLE_CURSOR_PERIOD 500
>> @@ -289,6 +292,137 @@ void graphic_hw_invalidate(QemuConsole *con)
>>       }
>>   }
>>   
>> +#ifdef CONFIG_VNC_PNG
>> +/**
>> + * a8r8g8b8_to_rgba: Convert a8r8g8b8 to rgba format
>> + *
>> + * @dst: Destination pointer.
>> + * @src: Source pointer.
>> + * @n_pixels: Size of image.
>> + */
>> +static void a8r8g8b8_to_rgba(uint32_t *dst, uint32_t *src, int n_pixels)
>> +{
>> +    uint8_t *dst8 = (uint8_t *)dst;
>> +    int i;
>> +
>> +    for (i = 0; i < n_pixels; ++i) {
>> +        uint32_t p = src[i];
>> +        uint8_t a, r, g, b;
>> +
>> +        a = (p & 0xff000000) >> 24;
>> +        r = (p & 0x00ff0000) >> 16;
>> +        g = (p & 0x0000ff00) >> 8;
>> +        b = (p & 0x000000ff) >> 0;
>> +
>> +        if (a != 0) {
>> +            #define DIVIDE(c, a) \
>> +            do { \
>> +                int t = ((c) * 255) / a; \
>> +                (c) = t < 0 ? 0 : t > 255 ? 255 : t; \
> I can't see how 't' can be less than 0 here?
>
>> +            } while (0)
>> +
>> +            DIVIDE(r, a);
>> +            DIVIDE(g, a);
>> +            DIVIDE(b, a);
>> +            #undef DIVIDE
>> +        }
>> +
>> +        *dst8++ = r;
>> +        *dst8++ = g;
>> +        *dst8++ = b;
>> +        *dst8++ = a;
>> +    }
>> +}
> Now, I'm not too much of a graphics person, but I'm a bit confused; this
> seems to be applying the alpha scaling to the r/g/b/ data - but then
> still including the alpha value in the output; doesn't that mean that
> the thing displaying the result will also apply the alpha scaling again?
Yes, missed that. Modified it in the updated patch.
>> +/**
>> + * png_save: Take a screenshot as PNG
>> + *
>> + * Saves screendump as a PNG file
>> + *
>> + * Returns true for success or false for error.
>> + * Inspired from png test utils from https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_aseprite_pixman&d=DwIBAg&c=s883GpUCOChKOHiocYtGcg&r=utjv19Ej9Fb0TB7_DX0o3faQ-OAm2ypPniPyqVSoj_w&m=YAoUy9TYXWb8lktv5hZwRWjZEBcoHKxfdrHMd8KkTnQAESANHEcW96C1ukSngzJ2&s=WhMqvptTX23UfMHwjTaBDTYU4xqtPO0dvK7B8Tc1nCw&e=
>> + *
>> + * @fd: File descriptor for PNG file.
>> + * @image: Image data in pixman format.
>> + * @errp: Pointer to an error.
>> + */
>> +static bool png_save(int fd, pixman_image_t *image, Error **errp)
>> +{
>> +    int width = pixman_image_get_width(image);
>> +    int height = pixman_image_get_height(image);
>> +    int stride = width * 4;
>> +    g_autofree uint32_t *src_data = g_malloc(height * stride);
>> +    g_autofree uint32_t *dest_data = g_malloc(height * stride);
>> +    g_autoptr(pixman_image_t) src_copy;
>> +    g_autoptr(pixman_image_t) dest_copy;
>> +    g_autofree png_struct *write_struct;
>> +    g_autofree png_info *info_struct;
>> +    g_autofree png_bytep *row_pointers = g_malloc(height * sizeof(png_bytep));
>> +    FILE *f = fdopen(fd, "wb");
>> +    int y;
>> +    if (!f) {
>> +        error_setg(errp, "Failed to create file from file descriptor");
>> +        return false;
>> +    }
>> +
>> +    src_copy = pixman_image_create_bits(PIXMAN_a8r8g8b8, width, height,
>> +                                        src_data, stride);
>> +
>> +    pixman_image_composite32(PIXMAN_OP_SRC, image, NULL, src_copy, 0, 0, 0, 0,
>> +                             0, 0, width, height);
> Nothing in the rest of qemu uses pixman_image_composite*32* - all the
> rest uses the plain version; what's the difference?
>
>> +    memcpy(dest_data, src_data, sizeof(*src_data));
> Why if you're just about to nuke dest_data with the converted version?
>
>> +    a8r8g8b8_to_rgba(dest_data, src_data, height * width);
>> +
>> +    for (y = 0; y < height; ++y) {
>> +        row_pointers[y] = (png_bytep)(src_data + y * width);
>> +    }
>> +
>> +    write_struct = png_create_write_struct(PNG_LIBPNG_VER_STRING, NULL,
>> +                                                 NULL, NULL);
>> +    if (!write_struct) {
>> +        error_setg(errp, "PNG creation failed. Unable to write struct");
>> +        return false;
>> +    }
>> +
>> +    info_struct = png_create_info_struct(write_struct);
>> +
>> +    if (!info_struct) {
>> +        error_setg(errp, "PNG creation failed. Unable to write info");
>> +        return false;
>> +    }
>> +
>> +    png_init_io(write_struct, f);
>> +
>> +    png_set_IHDR(write_struct, info_struct, width, height, 8,
>> +                 PNG_COLOR_TYPE_RGB_ALPHA, PNG_INTERLACE_NONE,
>> +                 PNG_COMPRESSION_TYPE_BASE, PNG_FILTER_TYPE_BASE);
>> +
>> +    png_write_info(write_struct, info_struct);
>> +
>> +    png_write_image(write_struct, row_pointers);
> Had you considered using png_write_row and avoiding having to
> hold/allocate the destination and row_pointers at all?
> (In actual fact, can you steal the code in ui/vnc-enc-tight.c
> send_png_rect ? )
>
> Dave
yes thank you for the reference! Updated patch according to vnc-enc-tight.c.
>> +    png_write_end(write_struct, NULL);
>> +
>> +    if (fclose(f) != 0) {
>> +        error_setg(errp, "PNG creation failed. Unable to close file");
>> +        return false;
>> +    }
>> +
>> +    return true;
>> +}
>> +
>> +#else /* no png support */
>> +
>> +static bool png_save(int fd, pixman_image_t *image, Error **errp)
>> +{
>> +    error_setg(errp, "Enable VNC PNG support for png screendump");
>> +    return false;
>> +}
>> +
>> +#endif /* CONFIG_VNC_PNG */
>> +
>>   static bool ppm_save(int fd, pixman_image_t *image, Error **errp)
>>   {
>>       int width = pixman_image_get_width(image);
>> @@ -327,7 +461,8 @@ static void graphic_hw_update_bh(void *con)
>>   /* Safety: coroutine-only, concurrent-coroutine safe, main thread only */
>>   void coroutine_fn
>>   qmp_screendump(const char *filename, bool has_device, const char *device,
>> -               bool has_head, int64_t head, Error **errp)
>> +               bool has_head, int64_t head, bool has_format,
>> +               const char *format, Error **errp)
>>   {
>>       g_autoptr(pixman_image_t) image = NULL;
>>       QemuConsole *con;
>> @@ -383,8 +518,22 @@ qmp_screendump(const char *filename, bool has_device, const char *device,
>>        * yields and releases the BQL. It could produce corrupted dump, but
>>        * it should be otherwise safe.
>>        */
>> -    if (!ppm_save(fd, image, errp)) {
>> +
>> +    if (has_format && strcmp(format, "png") == 0) {
>> +        /* PNG format specified for screendump */
>> +        if (!png_save(fd, image, errp)) {
>> +            qemu_unlink(filename);
>> +        }
>> +    } else if (!has_format || (has_format && strcmp(format, "ppm") == 0)) {
>> +        /* PPM format specified/default for screendump */
>> +        if (!ppm_save(fd, image, errp)) {
>> +            qemu_unlink(filename);
>> +        }
>> +    } else {
>> +        /* Invalid specified for screendump */
>> +        error_setg(errp, "Invalid format provided for screendump.");
>>           qemu_unlink(filename);
>> +        return;
>>       }
>>   }
>>   
>> -- 
>> 2.22.3
>>
Thank you for your prompt review!

Regards,
Kshitij

