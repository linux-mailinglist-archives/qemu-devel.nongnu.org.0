Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 649544D0461
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 17:44:28 +0100 (CET)
Received: from localhost ([::1]:59232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRGTD-0000KL-Gn
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 11:44:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nRGR1-0005SI-5V
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:42:11 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:17064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nRGQy-0006wL-MT
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:42:10 -0500
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2279p3mB003139;
 Mon, 7 Mar 2022 08:42:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=jyharMy5u5BEo6s1gi+VMky6ZZtLsgNopN5ChXTsLu4=;
 b=KxrWSxd4UeeWkxV2372LsAQdYzR7x1dFnbE+u3RmRS3Cm0MTkWNp9neDeMBzZBSY97m5
 QRKH9AKSNKVTSUAWBx6EzNtpt4VahFxOxXDVaSqXIfzi3bSMTtLKrA7+4R8lv0JZrU1p
 9MISWSyddwMHONcgR7xP4Bn0AO3wx0i18WRH1tJU32ZxS/eeybh3vpLYitqnVcqCZBgf
 nmFJEVZ9qq9rzyNhyB1eK5y24GMzSEpo5CVVwm2FASYnBEBb2ulMlOBzdgg66rXyj3TH
 7XBCLb7mOXTf9XBHREx7gYOR96XSRD+wckZYSbiSlz3UJaYCIlu/M3mgooWlR2l3H6l0 Yg== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3em69c3r88-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Mar 2022 08:42:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KShqCU66tzpuvkaVtqU7GF1CAFSneFxMT5qBjHF8aj4Pnp5WT0EDWTRMZeugDRdaA9VURYIDreKtjKfNy+s/N6H2YxH2eLGXSAN6RNdQnfskJU8wQPDZtNgKVvwJJXLuSqVwbsTXHYKPd8lewjOLZlNijDPkzHZP05J4xlv2sXjIdhjLfcy8qL9LHOW0sjUOaxsM+/Cr2UfQNpZPGi0D68JJLypBm0qnFc62nM/YZnFEg9ThhgSRvrJGs5aokFlDlc/1UjcnGghvv4956ssiluw8TrU4Cprb7oSKji8tqYa2tM7jCHO122bCwaAmLAlWmMoNMCGUdl+LtQ043e86iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jyharMy5u5BEo6s1gi+VMky6ZZtLsgNopN5ChXTsLu4=;
 b=Pg3BLa6jjP2gTnuMaqbx7GBdYWw4hooE22EVT5v6tfxEv0TREOBjtvmDRJh30nAshRLzJZWqGy302jZ2st6GjBcAMTEhBxkppEG1HHsDwnHT78bm5rxmF+XKj41XpI/6ncqI6VO8aXGb+eM5Kv11RtugeideREtoswAJxKgXTMBMfdSoYXrW9+9gCTmtoHDvRBFpM4vY5Ovw5bplBOcuUkUyvVFeoKY/WxvmV6ZU+1NdUuftqfxGEfEbTVRSpixGfb9DYfW+eIdP9Oxeg5YMUhamz5Gh1Zc57Mz0H2Y3GCgmNwZfUN9sN1/TTvqB423M2LFFNlzuypirPpeUVV98Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by DM6PR02MB4635.namprd02.prod.outlook.com (2603:10b6:5:21::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 16:42:04 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::ade5:1204:b102:bfab]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::ade5:1204:b102:bfab%5]) with mapi id 15.20.5038.027; Mon, 7 Mar 2022
 16:42:04 +0000
Message-ID: <a3ee3eb9-759f-e008-6c22-655b34f5aea6@nutanix.com>
Date: Mon, 7 Mar 2022 22:11:51 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 2/2] Added parameter to take screenshot with screendump
 as PNG.
To: qemu-devel@nongnu.org
References: <20220301064424.136234-1-kshitij.suri@nutanix.com>
 <20220301064424.136234-2-kshitij.suri@nutanix.com>
From: Kshitij Suri <kshitij.suri@nutanix.com>
In-Reply-To: <20220301064424.136234-2-kshitij.suri@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR0101CA0021.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:c::31) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7cd3064d-12b3-444b-f716-08da005968d3
X-MS-TrafficTypeDiagnostic: DM6PR02MB4635:EE_
X-Microsoft-Antispam-PRVS: <DM6PR02MB4635C1ECACEAB65F1AB31B6B99089@DM6PR02MB4635.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OFME/zLSBzVu7YEWy2/d6Pp+eUCd0C6DRZuYKKoTuKGmUy9VdCsftIVpsfbHTQKEWx5mGArMbuU+SdX560jmXkdibPGcyAEHJkqABXuw25NA03w9jN0SAbGLhKbdguUHZQJ3LtvQlsw3zlObMkT8iu4W3GULklXQ1p78A/d3ffxGFOH+c7mdNw3H0SZ9EZ5Hdw6dBbNQqUKIelbEPZAGc425w+xu3boL3TAPeqherk2xf67u02xl292cTuceUFUbPXxqmrnRYDwS85jbFdym6qUhLrhS5/yZjZnCfTTa4SLx5mJ9gW12sSLdUseQzob7eqWCOVTHrEKhZ5DekteibN21EYHDSXzNYmwWTge06KnAMNlqh0K+0sON8JakU+F6RIK9dSPB0Sd4HjwLalAgYKulwLsDqHH3w7lfFOlvm3ACdWBtwQ3BjMJXFlKnTlj8ocdnUq1vIgKOkk8acVNqMYmf6fejYtkYM7g/AN9twiWda+szRcR402kYBGmLsu3cgeqpbgH6KHrNGx10YCZ7GQC6m8jdQdxXGgBl94drPfyKQlSn6AGD5OccMtRs321fYTpPYn23I/tSTmGyEEXH0+fUyl9FrIN2s+yg8cSvJVOjwAmcU+gCw+VdaJCSDcrEqDH94nBlgKchhFDiALJ/WnfvjwcCfT0s4o4gxwhj4+PeE3QocFmNjvmTq0iZzP264gMYnIrMHNmPEXi9aqbh04499tnTb+IKtrnuKVurs2mT0MnkgfRQvRmxvzm3xh7QLfPaPEHBRrk0LVYieJJ/4YWvFagn6+chd+JQe3EvhbEKPzrM3JilncFIfUnHz6eTDfOgNxF4vzIwHUxCQx4cmvwTyFxRCfw6ZftwyFJgYjk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(966005)(38350700002)(38100700002)(36756003)(66574015)(6916009)(83380400001)(31686004)(316002)(2616005)(66946007)(66556008)(6666004)(86362001)(5660300002)(508600001)(6506007)(44832011)(8936002)(53546011)(52116002)(186003)(26005)(6512007)(2906002)(66476007)(31696002)(8676002)(4326008)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFBaQkFJV3hsUTFjVThjc0ZMekk2SWYwcktLMkl6NmdLTHRBbTVFby9XbHBr?=
 =?utf-8?B?V0d6OTJtWTlJRUdZTlhiUXVvL3MrTEFnVWo4dURqL0ZkUDdiUXkrMm8rWjhq?=
 =?utf-8?B?V3JJRzVhNWhwbEhzN25rSTV2dnpaU1NZTGlUc2pOSWtHRkRLQTcvVmsxYXdE?=
 =?utf-8?B?M3gwVXJJLzlYSk5idlluemkySGhDYjU3WGlEaVQ4Q2c3WStxV0xuTFFCVVd3?=
 =?utf-8?B?NnZmVHZyRTZxMFBiUVFvL0dTdWU0T3cyOWNTTkhQcSs2NXdJdnRPQ05LZjF3?=
 =?utf-8?B?L0V6TkRpZVYyUVc4Zng1OWJDV2FuZDR2SjhNdkRKYUJZZHJ1ZnRyelB4MTJO?=
 =?utf-8?B?Y1I3VlcvS0x3dHFoNU15OFBvTkVLSXVDRUtOMEtqYm1FS0xVL2prdHpCU093?=
 =?utf-8?B?NUZIVitHcTJKUDJQblBjUG5vOGVZbVdlNTZzN2xhVmhPWU9vWHFmZm92NU1Z?=
 =?utf-8?B?ZStpb3BWWTg0RjBRUGdFZWlNWk0wWEt4cDl6LzlKV2NjTGd1V1BQakRyejBX?=
 =?utf-8?B?OUZBYU81MUZJUzJZOWp1b3dGT0IwVGg3Q0NLQU56M2tMTU4zZ0puaC9Vd3J1?=
 =?utf-8?B?Z0MxbzFqanY0czQ2d3NwaHVHdHo4UUJ0OHRESGFwZFNMYUVKcWZtZVpBbUdj?=
 =?utf-8?B?WStrUEtQNHVkWG1iNUc3elhNQ3V4cDQwN1ZhSTArMDVaN205SjVndVBIWlRL?=
 =?utf-8?B?dkxGRVhUcW9wSzBrOURVVWRsa1dTYUNrYVdSNWhtT3B5MWVkeWdiT0ZLR3Nr?=
 =?utf-8?B?eGZYWWluRGxrNlJiZnppRWN4eU1QY3RWWGNyWldxTy81Q3JSNytSb2hBNUtN?=
 =?utf-8?B?TExrd0Q1WEFPMUc4Tnh0bEVEenBHTlBmbzU5Q3NqSjBGaDg5R3lybml0YkpD?=
 =?utf-8?B?YTl5eWJnNlpLTVhodTNjREdROUM0V25Nb3ZVdzZHeFI5Q3BOSUZLWUo0ck4z?=
 =?utf-8?B?VElEMDdxU2M0U0hIRzNMQXJPN20xZFJxTTk0S3pGaWs1c2h6ZkdzRGk5ZXlz?=
 =?utf-8?B?R1lOQWtjR09EK21ZRmt5R1VPU3NBYlJwOE1sMk0vSENBVk1PcVZJeVFJbjVD?=
 =?utf-8?B?bUFOQkxXUGZwR3lMMVZHMmhLT2E4RlpmaWRaRUxqeDJ5c1JOa3h1T3lTSEhh?=
 =?utf-8?B?TnZJaTV2Y1BMTWo4aWRlbGwxZmltSkNZK3hVditxclVXTHNsM2Z4V2N2VSs1?=
 =?utf-8?B?S2N0b2pnbVJyTlBmdWhJQmFJTEU3SUhENDJFdW9ubEFTbFFTUzNldXhiaTZF?=
 =?utf-8?B?REJWK3l0QlZtOE1GK1ljc2VnUzh6aVM2K045M3RZeVRra0wzTmVrRVY1czRZ?=
 =?utf-8?B?RGt0YitNMy9veW9hSG9WNTd6eUMrT2lsU25YVHBDV2NZOFQ4MzFVKzJyTlVs?=
 =?utf-8?B?RDVta0d2K0VoL1Z5dXFDVS95RzY3QXgzYklLOTRWdHZJL1ZyTHF6QTJIM21V?=
 =?utf-8?B?ZW1mZndZK0Y0dDdiZFQxUGpSSDlkOFlRWmwxVG16bFlGN2FEMDduYlFGSnNa?=
 =?utf-8?B?Q0VLM2VHVDl3YXYvcWhJeTJQb0psczlrZ293ZndLS081Z2pWdnJ1OEI2aGZU?=
 =?utf-8?B?K3ppMDZ0WWR1MWF5SlR2M1N1VGRLeDMydUs3ZVd3SlVHVFlac1EwZW91Vmkw?=
 =?utf-8?B?WFFic1BTNlAwK1hPTWxQNDVtMzJHMW9nczNNbzZQazIwV1gxb0R3VzBla1N1?=
 =?utf-8?B?WFk5QjExTWxEVTkvb2NaZXMxbFJtZnJQbWsxVUxrZGhYTWFZTWZ3VWcwdGJs?=
 =?utf-8?B?T2x2d0ttYjNhT05jMFFlWUtMSDlPN1l0TFRYRzVtL09xcElvdERWb3Evbits?=
 =?utf-8?B?SkM3TWlKNGY5YTZXc3ZhT29YVDQxZmJYVFF4eVR4Q091RFRKNDlVZ3dmdGxS?=
 =?utf-8?B?Y1RpNnJadERtUlRidXRSL1Zxb3lnazlWdCtwT1FCZmNnd2hERVZ0T3NNUlQ3?=
 =?utf-8?B?bDJpTXg2RGNFWnQ5NkR0TUpWczhBUGRSZzdCQXkrdzl3T2VkVzhlTnhhb2xK?=
 =?utf-8?B?dkNUYm5yejE1ZlFGVHFOY2NmL3RFQmRaN0Era3ducVViRlpBZk1STUh6YXl3?=
 =?utf-8?B?LzRielB2T3h1WXZpV2pXUjUxTFlsa2UvdjJaVTJWOHdoZE9VTlBUYUJVL09X?=
 =?utf-8?B?N0ZJenV4UE05cldmcmJEVU51SE42T2M0aG9ZQno2K3k5cEpRTmtVZjRadGRI?=
 =?utf-8?B?anE4YUR1U2RLTWc2bWlBWkpDUm1uYWJ0NGxWdEFnUUE0Y0NBK0ZLb2c1dDkv?=
 =?utf-8?B?SDdBNjFrQmRmSm1vN2pkTVFHaWF3PT0=?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cd3064d-12b3-444b-f716-08da005968d3
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 16:42:04.1063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4sZOa50tV0w8d7adrrY1xu8XEqfyoktykSpLuud0D507UeQ8ISxPDtH/ILEHeiKXoDl4FHq/i/sH+CGhIRiIxB4Ji3NcRDMgcWiZBjGCE48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4635
X-Proofpoint-GUID: TG8_K2mUeuzT1sqlhB8p4cfakf6Q1iP7
X-Proofpoint-ORIG-GUID: TG8_K2mUeuzT1sqlhB8p4cfakf6Q1iP7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-07_08,2022-03-04_01,2022-02-23_01
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
Cc: soham.ghosh@nutanix.com, thuth@redhat.com,
 =?UTF-8?Q?berrange=40redhat=2ecom_=3e=3e_Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, prerna.saxena@nutanix.com, dgilbert@redhat.com,
 armbru@redhat.com, philippe.mathieu.daude@gmail.com, kraxel@redhat.com,
 prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Hope this mail finds you well. I have updated the code as required and 
request you to review and suggest changes that are needed to be 
implemented. In case no change is required, please do let me know the 
next steps for the same.

Regards,

Kshitij Suri

On 01/03/22 12:14 pm, Kshitij Suri wrote:
> Currently screendump only supports PPM format, which is un-compressed and not
> standard. Added a "format" parameter to qemu monitor screendump capabilites
> to support PNG image capture using libpng. The param was added in QAPI schema
> of screendump present in ui.json along with png_save() function which converts
> pixman_image to PNG. HMP command equivalent was also modified to support the
> feature.
>
> Example usage:
> { "execute": "screendump", "arguments": { "filename": "/tmp/image",
> "format":"png" } }
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/718
>
> Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
> ---
> diff to v1:
>    - Removed repeated alpha conversion operation.
>    - Modified logic to mirror png conversion in vnc-enc-tight.c file.
>    - Added a new CONFIG_PNG parameter for libpng support.
>    - Changed input format to enum instead of string.
>    - Improved error handling.
>   hmp-commands.hx    |  11 ++---
>   monitor/hmp-cmds.c |  19 ++++++++-
>   qapi/ui.json       |  25 +++++++++--
>   ui/console.c       | 102 +++++++++++++++++++++++++++++++++++++++++++--
>   4 files changed, 145 insertions(+), 12 deletions(-)
>
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 70a9136ac2..5eda4eeb24 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -244,17 +244,18 @@ ERST
>   
>       {
>           .name       = "screendump",
> -        .args_type  = "filename:F,device:s?,head:i?",
> -        .params     = "filename [device [head]]",
> -        .help       = "save screen from head 'head' of display device 'device' "
> -                      "into PPM image 'filename'",
> +        .args_type  = "filename:F,device:s?,head:i?,format:f?",
> +        .params     = "filename [device [head]] [format]",
> +        .help       = "save screen from head 'head' of display device 'device'"
> +                      "in specified format 'format' as image 'filename'."
> +                      "Currently only 'png' and 'ppm' formats are supported.",
>           .cmd        = hmp_screendump,
>           .coroutine  = true,
>       },
>   
>   SRST
>   ``screendump`` *filename*
> -  Save screen into PPM image *filename*.
> +  Save screen as an image *filename*, with default format of PPM.
>   ERST
>   
>       {
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 8c384dc1b2..9a640146eb 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1677,9 +1677,26 @@ hmp_screendump(Monitor *mon, const QDict *qdict)
>       const char *filename = qdict_get_str(qdict, "filename");
>       const char *id = qdict_get_try_str(qdict, "device");
>       int64_t head = qdict_get_try_int(qdict, "head", 0);
> +    const char *input_format  = qdict_get_str(qdict, "format");
>       Error *err = NULL;
> +    ImageFormat format;
>   
> -    qmp_screendump(filename, id != NULL, id, id != NULL, head, &err);
> +    int val = qapi_enum_parse(&ImageFormat_lookup, input_format, -1, &err);
> +    if (val < 0) {
> +        goto end;
> +    }
> +
> +    switch (val) {
> +    case IMAGE_FORMAT_PNG:
> +        format = IMAGE_FORMAT_PNG;
> +        break;
> +    default:
> +        format = IMAGE_FORMAT_PPM;
> +    }
> +
> +    qmp_screendump(filename, id != NULL, id, id != NULL, head,
> +                   input_format != NULL, format, &err);
> +end:
>       hmp_handle_error(mon, err);
>   }
>   
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 9354f4c467..6aa0dd7c1b 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -73,12 +73,27 @@
>   ##
>   { 'command': 'expire_password', 'data': {'protocol': 'str', 'time': 'str'} }
>   
> +##
> +# @ImageFormat:
> +#
> +# Available list of supported types.
> +#
> +# @png: PNG format
> +#
> +# @ppm: PPM format
> +#
> +# Since: 7.0
> +#
> +##
> +{ 'enum': 'ImageFormat',
> +  'data': ['ppm', 'png'] }
> +
>   ##
>   # @screendump:
>   #
> -# Write a PPM of the VGA screen to a file.
> +# Write a screenshot of the VGA screen to a file.
>   #
> -# @filename: the path of a new PPM file to store the image
> +# @filename: the path of a new file to store the image
>   #
>   # @device: ID of the display device that should be dumped. If this parameter
>   #          is missing, the primary display will be used. (Since 2.12)
> @@ -87,6 +102,9 @@
>   #        parameter is missing, head #0 will be used. Also note that the head
>   #        can only be specified in conjunction with the device ID. (Since 2.12)
>   #
> +# @format: image format for screendump is specified. ppm is the set as the
> +#          default format. (Since 7.0)
> +#
>   # Returns: Nothing on success
>   #
>   # Since: 0.14
> @@ -99,7 +117,8 @@
>   #
>   ##
>   { 'command': 'screendump',
> -  'data': {'filename': 'str', '*device': 'str', '*head': 'int'},
> +  'data': {'filename': 'str', '*device': 'str', '*head': 'int',
> +           '*format': 'ImageFormat'},
>     'coroutine': true }
>   
>   ##
> diff --git a/ui/console.c b/ui/console.c
> index 40eebb6d2c..aab561e1ac 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -37,6 +37,9 @@
>   #include "exec/memory.h"
>   #include "io/channel-file.h"
>   #include "qom/object.h"
> +#ifdef CONFIG_PNG
> +#include <png.h>
> +#endif
>   
>   #define DEFAULT_BACKSCROLL 512
>   #define CONSOLE_CURSOR_PERIOD 500
> @@ -289,6 +292,89 @@ void graphic_hw_invalidate(QemuConsole *con)
>       }
>   }
>   
> +#ifdef CONFIG_PNG
> +/**
> + * png_save: Take a screenshot as PNG
> + *
> + * Saves screendump as a PNG file
> + *
> + * Returns true for success or false for error.
> + *
> + * @fd: File descriptor for PNG file.
> + * @image: Image data in pixman format.
> + * @errp: Pointer to an error.
> + */
> +static bool png_save(int fd, pixman_image_t *image, Error **errp)
> +{
> +    int width = pixman_image_get_width(image);
> +    int height = pixman_image_get_height(image);
> +    g_autofree png_struct *png_ptr = NULL;
> +    g_autofree png_info *info_ptr = NULL;
> +    g_autoptr(pixman_image_t) linebuf =
> +                            qemu_pixman_linebuf_create(PIXMAN_a8r8g8b8, width);
> +    uint8_t *buf = (uint8_t *)pixman_image_get_data(linebuf);
> +    FILE *f = fdopen(fd, "wb");
> +    int y;
> +    if (!f) {
> +        error_setg_errno(errp, errno,
> +                         "Failed to create file from file descriptor");
> +        return false;
> +    }
> +
> +    png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING, NULL,
> +                                      NULL, NULL);
> +    if (!png_ptr) {
> +        error_setg(errp, "PNG creation failed. Unable to write struct");
> +        fclose(f);
> +        return false;
> +    }
> +
> +    info_ptr = png_create_info_struct(png_ptr);
> +
> +    if (!info_ptr) {
> +        error_setg(errp, "PNG creation failed. Unable to write info");
> +        fclose(f);
> +        png_destroy_write_struct(&png_ptr, &info_ptr);
> +        return false;
> +    }
> +
> +    png_init_io(png_ptr, f);
> +
> +    png_set_IHDR(png_ptr, info_ptr, width, height, 8,
> +                 PNG_COLOR_TYPE_RGB_ALPHA, PNG_INTERLACE_NONE,
> +                 PNG_COMPRESSION_TYPE_BASE, PNG_FILTER_TYPE_BASE);
> +
> +    png_write_info(png_ptr, info_ptr);
> +
> +    for (y = 0; y < height; ++y) {
> +        qemu_pixman_linebuf_fill(linebuf, image, width, 0, y);
> +        png_write_row(png_ptr, buf);
> +    }
> +    qemu_pixman_image_unref(linebuf);
> +
> +    png_write_end(png_ptr, NULL);
> +
> +    png_destroy_write_struct(&png_ptr, &info_ptr);
> +
> +    if (fclose(f) != 0) {
> +        error_setg_errno(errp, errno,
> +                         "PNG creation failed. Unable to close file");
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
> +#else /* no png support */
> +
> +static bool png_save(int fd, pixman_image_t *image, Error **errp)
> +{
> +    error_setg(errp, "Enable PNG support with libpng for screendump");
> +    return false;
> +}
> +
> +#endif /* CONFIG_PNG */
> +
>   static bool ppm_save(int fd, pixman_image_t *image, Error **errp)
>   {
>       int width = pixman_image_get_width(image);
> @@ -327,7 +413,8 @@ static void graphic_hw_update_bh(void *con)
>   /* Safety: coroutine-only, concurrent-coroutine safe, main thread only */
>   void coroutine_fn
>   qmp_screendump(const char *filename, bool has_device, const char *device,
> -               bool has_head, int64_t head, Error **errp)
> +               bool has_head, int64_t head, bool has_format,
> +               ImageFormat format, Error **errp)
>   {
>       g_autoptr(pixman_image_t) image = NULL;
>       QemuConsole *con;
> @@ -383,8 +470,17 @@ qmp_screendump(const char *filename, bool has_device, const char *device,
>        * yields and releases the BQL. It could produce corrupted dump, but
>        * it should be otherwise safe.
>        */
> -    if (!ppm_save(fd, image, errp)) {
> -        qemu_unlink(filename);
> +
> +    if (has_format && format == IMAGE_FORMAT_PNG) {
> +        /* PNG format specified for screendump */
> +        if (!png_save(fd, image, errp)) {
> +            qemu_unlink(filename);
> +        }
> +    } else {
> +        /* PPM format specified/default for screendump */
> +        if (!ppm_save(fd, image, errp)) {
> +            qemu_unlink(filename);
> +        }
>       }
>   }
>   

