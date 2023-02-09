Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A4A6905AC
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 11:51:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ4Vn-0000mL-8S; Thu, 09 Feb 2023 05:50:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1pQ4Vf-0000lq-Ue
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 05:50:36 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1pQ4Vd-000416-6T
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 05:50:35 -0500
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3199XZv7011953; Thu, 9 Feb 2023 02:50:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=content-type :
 message-id : date : subject : from : to : cc : references : in-reply-to :
 mime-version; s=proofpoint20171006;
 bh=efq7gE27zwLViIiVvq8B6l8UUhaWA4cIVQVPazepHhQ=;
 b=FMpZh7jMe9n92iik3dqBWwtv7SXbNW25XOhJqjabF4rIhEUdJ28vOp1eyGqKDuqt35eu
 4kuYb/yeSXh61VuYLqBFrC4hi6Ig3CdAk4333XqAObMfAp3l8K2lxeaLtLh9rinBeyon
 tZv3lfuY4k3bj5B0LKZoALiGH/wrVs7dMPS9d2h9nXFrZEB+6VK5ZRrlepzIbu4x1tEB
 8S45M1+xiFbkybds2BFA7053Xl+0xIUiPh5YCvmQ9k3TGZz3Ra7nrv2B8KUYqRJ8kVIn
 Ykoqi5ODn8yFz4OYEVyuNaCErTMk7ayL9DYEdxsF27WzocZtVwXRAF9lvcq8AXw/oplw 0A== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3nhqt4q4q6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Feb 2023 02:50:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lwBmocDETIgrGixekAVv5Ki8v46jlFWH6C0USiSDM2RcPw+XjgsbMuqema+5MLn5FlXzvM1tLM+oPeim9eOsgY5V0IgmUngdUMzm2f9MgfWL2VIKIpisBj2qVlmidecFU37xngFBk/vq7eGle5FX76TCAiuUVjYJ3jn5JDQNqDjSgsTsLQ6M9mMB6xemrOY9Zz4l3xJ35C8yy5J0B3oU2xxuTgDns2P76cxLr+fAsdliV0Zt1kW0kEbiBJNnRa9VsVNaqO3AfEbACwivixbbKRypsW6LuMJ5nm8Wx75N06GP95PFqz1Fcw7Y2XzXGDJhyjpy3q/TGcTZIJqltJAsVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efq7gE27zwLViIiVvq8B6l8UUhaWA4cIVQVPazepHhQ=;
 b=FC+GdbiiyT/sO28ELZvAHLAa876BzODKms2124Myb8Y8rvnWWYCpg+3uXtQ0V7xc8gFxP/U828YDdN4FmX2m/QXJfLsw9BQrQUzYFxISHbeaVkjyTkgIdqCxEehsztc9rL7VpOTL4slBO1TRCxjigUJJD63FxipgEICptYCPbCDvHZWFtDUro09MA2mPA4M+36Kg6OWo+pFi9Ef25doj+V+Tt86J/XgiTd5iEQdoKLvF9itTFzO3OsIN67hE8t9846TuCRZThnwMga0C7Zz0amGh0o2SGNjiEPiTP5TEWeBAcyUcWq1a0xHrUxjgsTtOXXwrRb3yheJUOenD8+GIjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efq7gE27zwLViIiVvq8B6l8UUhaWA4cIVQVPazepHhQ=;
 b=HbvEEa22/z+zAzF4Gi/oY44IRNB8JGWV0PqkPdEcyGuhszYl0jSGaD0k8ipeJNV7Vxq56TPgh+/+4w7xWW+z+9qPdFWqaywv4MzvNMloHd4CGWy+SdUzytNiUaAFBypTg4YJLuxtuEFmeqbfquTssNYr3bkn5/ibXx4lmwuIzcd3WUqcSpZRrgpsNkLTieM8XDcp4CO0qWTxkfc6J7Qc0bqNj3AM8CD9Lv68uEZujs5ZSdkDjGdikVpuqOgilbtg2gdN5xNj+Af9oHJtKg/mrKjypMhhCtsQ/9y1jF6Os92fkeLiX0Je+8aunOAXAf+/0XlmadBVWYwnNoDLc7X0Ww==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by PH0PR02MB9408.namprd02.prod.outlook.com (2603:10b6:510:28c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Thu, 9 Feb
 2023 10:50:27 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66%4]) with mapi id 15.20.6086.019; Thu, 9 Feb 2023
 10:50:27 +0000
Content-Type: multipart/alternative;
 boundary="------------PvlZCAQBL0l7TcP2f3rV03lz"
Message-ID: <18bea7dd-c776-6328-2c6b-71c88838db72@nutanix.com>
Date: Thu, 9 Feb 2023 16:20:17 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: Expose support for HyperV features via QMP
From: "manish.mishra" <manish.mishra@nutanix.com>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: John Levon <john.levon@nutanix.com>, Florian Schmidt <flosch@nutanix.com>,
 carl.waldspurger@nutanix.com, Prerna Saxena <prerna.saxena@nutanix.com>,
 Aravind Retnakaran <aravind.retnakaran@nutanix.com>,
 rohit.kumar3@nutanix.com, "Daniel P . Berrange" <berrange@redhat.com>
References: <cfa1e51f-c74b-c1d1-d6ea-a25a5a5f6c4b@nutanix.com>
In-Reply-To: <cfa1e51f-c74b-c1d1-d6ea-a25a5a5f6c4b@nutanix.com>
X-ClientProxiedBy: BY5PR16CA0028.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::41) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|PH0PR02MB9408:EE_
X-MS-Office365-Filtering-Correlation-Id: a07871b3-54b7-41a0-e378-08db0a8b7428
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yqk0BWZ1VURP8jGAUQxlAW1Zsf/wLdR/J3Z3Eo7zSmcBG7sBui/EAwFrfavf6br4T6KllfbbVJp6zYyQTaIom6fUeA89vcEaVRvJyJ9fqDHNZhrRsduZq4DGqZ3nLWLeKD+935qTTylKatZYUncTBO4M9I7qIpFUgwaqoCjYVG4HwF7kRVDWBK3SsavecaX/rd0DDMAYuZ0+xa9MYgljPK9TxHV8Ce850Esv0Z+rdtHgTPne9MEpPm1Fw5Wn1AlYadbstEImwfBRjbJpO8Wd5UG49Mu8co0OmTB2IDxkRy61kRshUZh0wZ6ODbTKeYkmgWE3aL6zfIM02C+HpsVd9VVTJxtCqbmUA8UwM/G4Xm5unvuHbnubLB6RqHksFx+7mrzc4hD+lwXOEaXAESS7AJFiakbDgOhs+1wOZm4SliclvO5oIBgrp0Y8U11U+7QUUmrMwu1NnP17ONnl3KNZ71pKMqhrDYiFgBdtjQCol0LYcy3FcuXagvzvPCwRNJpMae4nQJ51IfAiRo3ebBYzZKTqisD2sLlYr6P7x/kP1XEP98hlQmJ/GUY3Vb3FDnPfU87YnTtILY8omTlrq5asUQzRGmUHb3rK5Qz72F7w2yR5bExdNSGSMjmf4HmjWh0cF4I47G32K5wXbLwLVz5WfK6SzY0+Q6OP7zLOBeD+OYU5plyrx+CiIbC97A+yMdCVBDDlHlz06jPvndcYTnfSq9a7V3nkMKqnoe0c5CZZ5sM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(346002)(366004)(376002)(136003)(396003)(451199018)(31686004)(2906002)(478600001)(6486002)(36756003)(316002)(38100700002)(5660300002)(86362001)(8936002)(54906003)(6512007)(186003)(2616005)(26005)(33964004)(53546011)(6506007)(31696002)(6666004)(4326008)(6916009)(8676002)(66476007)(66556008)(41300700001)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c09aS2FDRXMzdkV2bzE5SjJ0MXNNNUhnSElxdVE2WFlhUTBLNWpWMDlSSU11?=
 =?utf-8?B?UE9VYlQxWDZQa1g2RjdWbjJ2Q0JxNzhhd1FwZTlGRjExOGJENTRDdEFaU1Fa?=
 =?utf-8?B?bG5rVHhxNUhSOTFibHlpUUhQUG5oaVpMRmdBSnYra2JSQUZpcndtUGFZRDBN?=
 =?utf-8?B?a3Zxc2hWV2ZpemZsY3NOK2JUTU9xZk5zRHI2Uk1TNnhqRFZjTG9TUlgxNnZJ?=
 =?utf-8?B?dlMrUDFBaERYNWVQaW05d1IrNlZrRnU5U3dIa21iWlNIVVlYSHJFMWtlek5k?=
 =?utf-8?B?UmlxNjA3ZjdPV0RES3ZlMG9lU2FwRk00WTZUMGVSWG5MQldlRENaZjArRkpt?=
 =?utf-8?B?RDQ4eklQMXl4VjF2WnpSSnl3QklSeUNWVWtkSDlkMjRtQ0FublhwVGIwVlp1?=
 =?utf-8?B?cGljcDBkbUpZR0d1OFpUS1V2d0VqRnRaR0plbFliUVBCc3lJOGNsR0YxWXd3?=
 =?utf-8?B?MjVtN1ZueXk4eU5JNEw0Q1NpTzN4UGpaK05DaUlpaCtWZU1HeEJkaUJMbk1K?=
 =?utf-8?B?TzZLakd5UkxsYndwY1Y5WnMwbzZROVRPUlN4THFoZlRhL2VVYkwwR0VNQ25F?=
 =?utf-8?B?TG0rT2FEVXpWYlZ4aE1Mcm5YM2ZXT1BITm9YMnBzOFp5cmJIcXBrYldKOUJH?=
 =?utf-8?B?MEtjbTJsTWF2T0orSXB0cVZ3OVJsaHpzRGs5cFR4aEI1UlFiSkhmWDVScFNG?=
 =?utf-8?B?STg2bzNPWUkyUFdyM3IrQ0NQYzI3WVZHcWpSWHVuMkZKU1Q3aVJtN1JadXRj?=
 =?utf-8?B?RVJUUXdXREtnVjlhb2lrZFZ3WENWT2Q1Yit0ckVTYXA1Wm4wNG9lTHhGYlVL?=
 =?utf-8?B?VmpQenYwUklYdGdMY1BjSFpJalg1QWk3NVZtUWFuQ0NBUzE0bVpQOWljcEdn?=
 =?utf-8?B?T2ZiRHFuQno3K1NvNTFwalBueE1JWXdwR0Qydng4SXU3ZkFtb0dtN0NJajF2?=
 =?utf-8?B?R2h5bHRvd3NRMU43TnBnTnJqOGNZNWpjVkJLeVVUdm9LT3JsWGQ4K0JTaVNh?=
 =?utf-8?B?SHUzY1BKRzFQaGVuLzl1N1pqbHRtVWVVVktwU2dkY2pzaG5SQy96d29sZlR2?=
 =?utf-8?B?UUFBWGVHejJlMkd5d2kvTkpjZWk2ZDdLTHRFVG5PL2VtY1BhRnBXSDRDdlp6?=
 =?utf-8?B?a012ckNkck01eVdUN3ExQ3doOWZDNmZKL1ViUWFYV3JVMDFaa3ZJTWx4NTNX?=
 =?utf-8?B?YlJZN1UycHlDb1YzbG5uUWJXZ2xhUUZsbmRPQU5UdWR0R2lCblRRSzI5RS9y?=
 =?utf-8?B?MTlGbXg1aWx2dm1haUtCa05QTWNmb2FGcVZOR3RLeTdRZlk3N04ycUdwYVdQ?=
 =?utf-8?B?NUI4OS82VUd1ZUNFSTBjdzVxb3dVUjhFL3V3RkhyQ0ltNlo3YVo1VW91Z2Z2?=
 =?utf-8?B?YTNQMnNZRDBYNzVIUXJ2cWRMOWFydlJGY3JRaFB2eHF2QUIrZ0VYclE5YWk1?=
 =?utf-8?B?MjNmaDNpbmNnK0ZZN3VJSExZU2lsTkJaOWEyMytTVktIWGQxWG13a1NMR3V3?=
 =?utf-8?B?alBaQVdzTjZRYTFSanFMbmdrdDFUV3lyMWRFdnlOSFRMRUNxNGk4cFFFQ1h0?=
 =?utf-8?B?U21DWGNKVTRyeTkwNmdORS9sVEU4M3hFakk2SFNSQ0FnVzM1UHkwcG1QZ2hO?=
 =?utf-8?B?N01LRVhWSkR3dVBwQi84Zk5NZVBuR1pPbzY0cmc0S1RRY0VtcW1paUt4VnBL?=
 =?utf-8?B?eHpra011UWVkZ09rYTVnVDdwdlVsZGdHWVRoMnJWU2liSUFxbVN6UWlXait6?=
 =?utf-8?B?L0pKQzMwbXp1L2Nia2pJempueGZpRUNya3VGbWV0WGs4VEdwY3k0ZmdtWVFG?=
 =?utf-8?B?MFRkdzlTN01CQkNvUjdndnRZamlobTF0ODczYnJyZDhYeUJOd1BWTU5DVGZm?=
 =?utf-8?B?QlB4a2tOS2gyRGxLc3JramF3NkMzbGNyOFRKaU9yaitieGxVWkpWYU80bHFY?=
 =?utf-8?B?ZUxtSXVUMG5zdVE1bm95R2dYR2ZBZ3ZXMUJHdnc2WUs2M01aMFNvaFhvZmdT?=
 =?utf-8?B?cjNCNWZ0RnBFMGZZbGFtZjhhNUdKUk0vUTN1ZUlSU01DY1M5c29yWURPSDRM?=
 =?utf-8?B?UFhNM3Q4dDgrTC92OW9HRFdpOVdTVzhZOXk5L1FmOFRnVDZxVUN0K3l3cHEz?=
 =?utf-8?B?emZOQ0thUWliRGY5c2owcmtaeVdkTzZJS29kM0pOYWdNSTdQb0M1TW1jZVQ1?=
 =?utf-8?B?b0E9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a07871b3-54b7-41a0-e378-08db0a8b7428
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 10:50:27.0656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PQa6a7WEaKv20Rpt0GVfDEhlYNyoZWwZrK2gUPWC9TfPBPDxNssG2DGw6aXxsoVRmYD6pmVbBY2SEV3JFTgclOIrKMvWShzBxzSFbFJi+nQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB9408
X-Proofpoint-ORIG-GUID: YyDiOIXF5iee8eTFm6L4ZkPyNKy2-q-R
X-Proofpoint-GUID: YyDiOIXF5iee8eTFm6L4ZkPyNKy2-q-R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-09_08,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=manish.mishra@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-1.146, SPF_HELO_NONE=0.001,
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

--------------PvlZCAQBL0l7TcP2f3rV03lz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Everyone,

Checking if there is any feedback on this.

Thanks

Manish Mishra


On 31/01/23 8:17 pm, manish.mishra wrote:
>
> Hi Everyone,
> I hope everyone is doing great. We wanted to check why we do not expose support for HyperV features in Qemu similar to what we do for normal CPU features via query-cpu-defs or cpu-model-expansion QMP commands. This support is required for live migration with HyperV features as hyperv passthrough is not an option. If users had knowledge of what features are supported by source and destination, VM can be started with an intersection of features supported by both source and destination.
> If there is no specific reason for not doing this, does it make sense to add a new QMP which expose support (internally also validating with KVM or KVM_GET_SUPPORTED_HV_CPUID ioctl) for HyperV features.
> Apologies in advance if i misunderstood something.
>
> Thanks
>
> Manish Mishra
>
--------------PvlZCAQBL0l7TcP2f3rV03lz
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Everyone,</p>
    <p>Checking if there is any feedback on this.</p>
    <p>Thanks</p>
    <p>Manish Mishra<br>
    </p>
    <p style="caret-color: rgb(33, 33, 33); color: rgb(33, 33, 33);
      font-family: Calibri; font-size: 16px; font-style: normal;
      font-variant-caps: normal; font-weight: 400; letter-spacing:
      normal; orphans: auto; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-size-adjust: auto;
      -webkit-text-stroke-width: 0px; text-decoration: none;"><br>
    </p>
    <p><font size="2"></font></p>
    <div class="moz-cite-prefix">On 31/01/23 8:17 pm, manish.mishra
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:cfa1e51f-c74b-c1d1-d6ea-a25a5a5f6c4b@nutanix.com">
      
      <p><font size="2">Hi Everyone,<br>
          I hope everyone is doing great. We wanted to check why we do
          not expose support for HyperV features in Qemu similar to what
          we do for normal CPU features via query-cpu-defs or
          cpu-model-expansion QMP commands. This support is required for
          live migration with HyperV features as hyperv passthrough is
          not an option. If users had knowledge of what features are
          supported by source and destination, VM can be started with an
          intersection of features supported by both source and
          destination.<br>
          If there is no specific reason for not doing this, does it
          make sense to add a new QMP which expose support (internally
          also validating with KVM or KVM_GET_SUPPORTED_HV_CPUID ioctl)
          for HyperV features.<br>
          Apologies in advance if i misunderstood something.</font></p>
      <p><font size="2">Thanks</font></p>
      <p><font size="2">Manish Mishra</font><br>
      </p>
    </blockquote>
  </body>
</html>

--------------PvlZCAQBL0l7TcP2f3rV03lz--

