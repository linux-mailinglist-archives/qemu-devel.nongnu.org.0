Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3D5691864
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 07:17:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQMhM-0001U2-Lc; Fri, 10 Feb 2023 01:15:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQMhH-0001Tl-GH
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 01:15:49 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQMhD-0004K8-4M
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 01:15:45 -0500
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31A2wbW8002031; Thu, 9 Feb 2023 22:15:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=9fsyDTiKSJfHOCHNYiO+D1bxbQ0PkOWMFhmQON5xD5k=;
 b=F2O7x5mwU9D1zOlm5mujnwaj5zf4+Z3KOqFJmP+kcBejP7WrMEkE/+ZHLyVCsoi84gb6
 mUzmzBdkS5yxxGaWOfV45urgCCqe8Ymut41CfuzO9rVq1fryKw8Ox9ecTZ85nTxX26pR
 lEoLhN23ElcN6m6JDfcmyMJvfdpcIaR2CQgXpi9Fw/+bdDuTH3wx/zSYqtqlo2Yg/A86
 KBonWcx+uNOLk1ISmuSwfyV6znjkyt65M8enJdwt+pNV9YFFrko5xiMO2tDAM+WeTTZt
 FCZuBYApw9vP/45ujpn3H2tXAimBPiFypf8tHUcD+vki60+qjRkhxdAWQBUysQlwiguM fg== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3nhpbqk570-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Feb 2023 22:15:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UUuH/2gT8yxS5Avl2ZZdbzBxZ7OmzGNR7pa8QC6Vd/9qGXU+84GnNYGx/6io+nOcz4ma5CpuDIMgZmkrWdK5ln6nnOS0CyPfPTbaQ0/NnZymB1LGX+jQQhosuljQOqHpl1kIuKeEpjw2GP0zQeMh893frLl/m+CE/xb1pJfMhICjHdIdakBzpeZBW4g4FGfI0QJ7hVPJnSB1733CRwBW7gNO27hx1uSY+A2FsJUtZictgnN5T1Sq5hc9Ld2QlZvHDXuCUwaToLEB+F4x2lAkvYr0POfLqc2jxboUGLJXHsrhovotrZXI0orlgx4Pw812RIk4dpRS58iPVIAcDh032Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fsyDTiKSJfHOCHNYiO+D1bxbQ0PkOWMFhmQON5xD5k=;
 b=aD/M46zOad92EHWXcB+9q/p5l2UVq0UakrVmsuHaQ1ipQXGKbjdUYC19kvWG5BxqbLyrpWWPaYNUp2m4GvOcb5WmsBT6ERCFfNJtZHVGEHn+MZqCt3GMTJ/kmpXJTnNUdqXan5AcR9Ep4gQkfQg/92Lv3s6HFNvyqmsaE2VOACECthwe4LuW5DAdMF8EI4O6nS2ZKcysampBPZ7h4XdmxCZViKXqRRsHzfOCn1BnICkgF7eVE7RrfFFkYcV71LlU6f2TOV73X9zgAM2K3Dk5+UkHgiTkOg4+o5EnAOWb5L/gavXeCZWruNSH0oHKxqwgWK+tTBBWdkhCMvHMOP1Mqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fsyDTiKSJfHOCHNYiO+D1bxbQ0PkOWMFhmQON5xD5k=;
 b=Qz5thHjQVsU3NN6MLLLFqaPKXBaNTZKtVmq8lhczbGLHIIFH6jgiKJcOvz4wA+9aRp8t1vL1urABjT6ZnPwOWqyNMqY1uRwyYFwXqVCxsBNS0xJ+T1gISAWQpsLBvTVfhHO5awbeeFy3AzCNylXM+QesBNAyOQAsdz0qsK9sChzCx0b9PukVSIptaTbTkE5gUirdMaiDVLgBlcpH/R+pgGkNbEKUiYw2+P74NZUVpbsPghf2rd4cyEd0YY1T6ngq5rFczXNb08bkegUqoKoxwvL3T97k6PxV1EzJ2z1nEYB3xSfSmQii/BVzD5Brd2AsIfoECdjCIKq4wwVwB1P17Q==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by SN4PR0201MB8791.namprd02.prod.outlook.com (2603:10b6:806:202::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Fri, 10 Feb
 2023 06:15:36 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%3]) with mapi id 15.20.6064.036; Fri, 10 Feb 2023
 06:15:36 +0000
Message-ID: <f317384c-1e0d-06c8-64dc-c88f1b1cea5c@nutanix.com>
Date: Fri, 10 Feb 2023 11:45:22 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/6] migration: Updated QAPI format for 'migrate' qemu
 monitor command
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
References: <20230208093600.242665-1-het.gala@nutanix.com>
 <20230208093600.242665-3-het.gala@nutanix.com>
 <20230208201712.b3a5xtufscrvncqt@redhat.com> <Y+TJr7An261VcVJ/@redhat.com>
 <87bkm23ivx.fsf@pond.sub.org>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <87bkm23ivx.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0116.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::18) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|SN4PR0201MB8791:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a622d23-50d1-4303-60be-08db0b2e395a
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I8s+ddJot4jF/7sMiU/swWbr9KTkP5hS+yCrR9LqeD3nItxQEDlJmcleBpw3iCrYtU8o8xFBBDEB17s5oHEP7MTeitGFZjYVZYSaVXONqmi6Mh4Sv1/S7XSeUwpQHC+iNiMmm7zubB4hhRde/Z+aWauwq1deRghZriY039+sqWakGM+QT2OOOWRfIocvlqJaHWB0sC1/+Q2dP5QrAtV/aNgFsRiQ24Ymzv21ns/kM6EM2YuVmfzt98qaaJ9Qrrjee+jUlc1w0lhKiaJAc0F3rYPSpZeVEcKaX78pWJ5JfiI7gU1mrBRPkuF4a5y3suiJ01uBhLByInbTlxZ3CN5qL/8fygU3xdM4M31gPys83U/AkagqdCG9EDjgmv7gCxfP9g36/MTjijKiqV9UCP/pztzivcQ1O/Sa9urg+vCPF+pe7ZkJd7P0fa6JyKq6+qWOiRmFRi6UgFxN23w84cMPE2mVHaafAYtE7J/5mJr/XjvTwDa8ZzPUzuQAmA+qY7r8lQUBK1Onibn/OnRBwlpsRva8vnUQegbnFlYtOJVLmYguhmcCKAeUw/fz1cU7+m0NEkpZk+z/hGijXuvkmz+UoSr32uQbdXgUxt7noZg7vdthgU2vScIlimasFFBktamZZYlX31NE3plZlf3rTMGY/QlLfX9F+qvEJpMqS+PvRjI/pL96/oWv3k5b+zxevWEzT5eg7p/NPVRw8GkHaTyq/asXPlraeMy2iK/o2hHDcuM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(396003)(366004)(39860400002)(376002)(136003)(451199018)(2616005)(83380400001)(478600001)(6486002)(53546011)(107886003)(6512007)(6506007)(6666004)(26005)(186003)(86362001)(31696002)(36756003)(38100700002)(8676002)(4326008)(66946007)(66556008)(44832011)(41300700001)(5660300002)(316002)(8936002)(110136005)(66476007)(2906002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUZxenlyQnYxZUNHSWROUXBObXNSN1NJcXFENlVDNVZTUmRoN0xWZCtUa2w2?=
 =?utf-8?B?TDZMVlJKbHJXTVVUSC9zMWtNV3ZmVE5IZ3ErTnRlVlFPeFhrRm1IOUc3S2w3?=
 =?utf-8?B?TGZnNWx2ZFQ1aWkrb2wzdTMzR1FoVnRJejZQalFZYTc0cHB3TFJXenNWN2Q1?=
 =?utf-8?B?eGhCd3FiOXl2Y3ZzQjJJTitBVDFLNDc3VFJ5OFlTWHVwcUhocDJNWUU2RkZm?=
 =?utf-8?B?SjVyNE5mUmpBYWJxTy9nMmt6UjhrREhweGszZFJWRVlOeEZNTHUrUDNFUGda?=
 =?utf-8?B?d3RtUnZSNVNzdDFCTGQrNHpLbjlRRk1TZ3I1eDJCWE5mbFg5eG8rb3lLcFVJ?=
 =?utf-8?B?eVAwZW5sVmVwbFpwc0ttek8rZ3VlLzQ5VzBBV3BtVFZ1NWRTKzJXdnRsYXkz?=
 =?utf-8?B?ZzZQQzlIbFhPUUJUUVQ2VlVWa3NqNzh4c21DUDY3WGNBaWJnaDNnUHVFOUVK?=
 =?utf-8?B?REhsTGJsdzdqTkF5OUw4U3JJdFVhUWhWYW4zeVREWGFYcU9kMnVxSlFuK0pl?=
 =?utf-8?B?cWJ5OFFEQVVaRGU5WVJHaHo1S1A5N1lNamtkOUxJMFNmV1hzd3lZb1pKQVZx?=
 =?utf-8?B?MUY0Wnp2eXdOaWhIZjBKRGcweDdCbXhvbU5kb0tjb2Z5VmV6dDBqaFNTNjZV?=
 =?utf-8?B?cHArbkJ3aGgzQnJ4OXBXS3pza1ZJZ2VDS2ZFK2xjVFhyWEZ3TTdxazcxam1G?=
 =?utf-8?B?UndtblNkYmRJM1JPdXpvbjJBTXJOR2pmTldRQXVhRU5tVXJzQ1JrMW5yeXZZ?=
 =?utf-8?B?by8wYysyM29BSkdSQytpVEEwd0RxU01nRzQ0aHRiWk9yYkhwcnBISjI1dWFU?=
 =?utf-8?B?ZjJtUlBJUC9qTkdicUpVdHZEQk1QeFhoSE0xUnRXbVNRUGVibU9jbFpHRmd0?=
 =?utf-8?B?WXo4QS9CSjkveG1CMlUzamUrcktHdjhoa01KS0J4dkFQVlpzdEdLOEZSbnlK?=
 =?utf-8?B?VlFtK2x1eFVXZHVGSkM3SHpMbTlrK2UrSGViMUs1Y2N0dE9QWGE3Ry80aFlW?=
 =?utf-8?B?ZVl2cWhzNHpDK09odFAyaFdMdEVZSkJyZlZUS2hocXo2Q0g0SkI4eGoxanc5?=
 =?utf-8?B?MGhMNi91SjlmRHIzaXczd0NXbklYMnZ3K1dUR1BZNzdqcWs5eHpWVkZXU01l?=
 =?utf-8?B?L2xwRzExcUQwN2dPNHV5SHNJams3NjRIZXRvT2VLNXZPenJ0ZW9WeVRNS0lD?=
 =?utf-8?B?QS9wQmYwMHhjZWtSV0loMFlUS01xUjJwdXRnaWdnQXRpY1VzS0UzVFJjS2tB?=
 =?utf-8?B?a1JTUytaMHpjNnQwTWNheU5VOHM4R1k3bnB5VjRycDZiN1oxT2ZxNjdKdU5V?=
 =?utf-8?B?MWxlYjUwQmQ0SG1MWmVGSVNNajJLQk5TcHJlbkV2VHA2ckY1YnRsQzBWK1Jm?=
 =?utf-8?B?bVNaUHlDVGNIanlTZVhNNWRKWDNtZ2ZVTGVLeDVPZEg1bzdpWVhzbmt4Vmlh?=
 =?utf-8?B?YURydlJlN2MydE1oZjFSVkp2VEwxeXE4WGZZbndVUjUwQ1NhcFVtOTZ6aDJa?=
 =?utf-8?B?MXIvUzYwc1UyK29KQ0YxT0V3M0N0RHRhSlI1YUhrSkVDcGRsaTlwZ1BtalE4?=
 =?utf-8?B?QXNFaUZHNEpzTXNnY3J0ckpYNmt3TC9KK3NRSFVmd3FzcVRMWWppOXF1Lzd0?=
 =?utf-8?B?QUxySWlzUHdsMWRzWVNGb3JKYTVtRG9qL0QyZWo3cHJxRU4wVUtXOFJmOUFm?=
 =?utf-8?B?YmhTR283U3VCOEY4RUNFQkgxNVJsV0N1N2RDR0dNcWxDRzRzM2sxRW1NMmRs?=
 =?utf-8?B?RVVZdWtvYmFCM29SRk9hSnMreWtUQTBXT2REY1U1aVFmVHYrWUF2aXd5Y3pw?=
 =?utf-8?B?NC9wdlZsTjRXK294Z1hZcCtBd28wOFBDOTdzdjMxaDcxQ0NuTDMvM2JjZnNI?=
 =?utf-8?B?WHJEOWJZcWFTdFpKMWVBUjV0NDlMdXFFT0pKWGwyOFZWSWNraFNCUTNuQita?=
 =?utf-8?B?alNoZkQrOVRPcWpBMGhHdGt2c3U3d1Q0eVpIT0JDYkJuNnRzaWk5Rmk2bEdW?=
 =?utf-8?B?NUJ1N1FHbFowNjg3Sm5QNlRaMk9md0NWbk1FVm5tNGdLY0JSdktUYVlhcEVS?=
 =?utf-8?B?bjhmMjRWTXVyRXplRk41bkNtemcwRHMwa285RDJtcGVrVE1nUThMYzJPQ3d3?=
 =?utf-8?B?dEpOL2RMTlNQZkQyeHZsSkRKSnNhYnlLR1R3QlNOOWtaOW1vWFo3UHFQN1lw?=
 =?utf-8?B?N1E9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a622d23-50d1-4303-60be-08db0b2e395a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 06:15:36.5901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kHYUR0HyptSGAPwQItPhdFjKnsluSsbThLRfVQehdO4BbMRvBZ/OI9iDN0UwOtD6RwSWJ5DkvP55xcqIEZV23w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB8791
X-Proofpoint-GUID: QZKvXvNOrhnW0DzTJ4E8tad_QYI4enDb
X-Proofpoint-ORIG-GUID: QZKvXvNOrhnW0DzTJ4E8tad_QYI4enDb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-10_01,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12; envelope-from=het.gala@nutanix.com;
 helo=mx0b-002c1b01.pphosted.com
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


On 09/02/23 9:56 pm, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
>
>> On Wed, Feb 08, 2023 at 02:17:12PM -0600, Eric Blake wrote:
> [...]
>
>>> I'm guessing the reason you didn't go with 'socket': 'SocketAddress'
>>> is that SocketAddress is itself a discriminated union, and Markus does
>>> not yet have the QAPI generator wired up to support one union as a
>>> branch of another larger union?  It leads to extra nesting on the wire
>>> [2]
>> I don't know the backstory on this limitation. Is it something that
>> is very difficult to resolve ? I think it is highly desirable to have
>> 'socket': 'SocketAddress' here. It would be a shame to introduce this
>> better migration API design and then have it complicated by a possibly
>> short term limitation of QAPI.
> We evolve the QAPI language to satisfy concrete use cases.  If you could
> use a language improvement, make a case for it, and we'll see what we
> can do within a time frame that works for you.  Better than ugly
> work-arounds on the silent assumption the language cannot be adapted.

Hi Markus, Daniel has already left some comments on version 2, patch 2. 
In short, we want to make a union, where some of the branches of that 
union can call directly to another known union like 'SocketAddress'. 
Right now, QAPI does not allow to directly call a union inside a branch 
of union, and need to make a spearate struct, and then call a union 
again, and increases complexity of QAPI design which is contrary to what 
we aim for.

We can further discuss on the response Markus has given in the latest v2 
patch 2, and aim to, how we can evolve QAPI languge and reduce complexity :)


Regards,
Het Gala

