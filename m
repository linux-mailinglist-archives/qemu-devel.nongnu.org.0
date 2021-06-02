Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C37398667
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 12:25:52 +0200 (CEST)
Received: from localhost ([::1]:52224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loO4N-0004F0-Lw
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 06:25:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1loO2g-0003RB-BP; Wed, 02 Jun 2021 06:24:06 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:43760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1loO2d-0005Qx-FM; Wed, 02 Jun 2021 06:24:05 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 152ADuN4076319;
 Wed, 2 Jun 2021 10:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=bzhqmjKW7/AxwKnqPCh/GZtg92nWxY7BFvnn3lAZVuk=;
 b=xIeQACzTX+cX5R+8390+mGV8s6vcoz8xH5ipjDUVxjiJecpYJQVVeM9dUI/vgkyXyLqw
 AoyPjYlxG8XWexYhVNXvwYYQAbzw+8LGwt38NQisNSsOXVypzA8PFvKa2x1Zw3hvnqG6
 Dr/xmZ3OxPnKio3SwhboeIRO/A5VdbvJs6eJUMzL5c9SD10w+utb5Xi/uIgNs9ryPp7T
 zgdn4cTfdkHWyETHSKQCA1FoiU7cM7fT9ZrJ7UImca1bzYoqM64w4qR1KGv0nU/uIoeK
 xD67ev/hV1EP/sDmB0jEF5dpofNqD1mOg1HHFV6mblWBhLgMH5JRwQceKh/4FxfG3TsB qw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 38ue8pg20w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Jun 2021 10:23:44 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 152ANhek008860;
 Wed, 2 Jun 2021 10:23:44 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
 by userp3020.oracle.com with ESMTP id 38x1bcsv75-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Jun 2021 10:23:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F2TFzgt+7bIIPiBVaOMLrnU46kRP5OcJJWeNWgqSjK2cwBvFm0DS1IqSc01EyKLJ7r8TGhdiaFep2u/ZBdymGjuqEMZrkR9OQtp4nNYnV7NMtt3rIE6wpTnjgljkTyEGVzu2vARNN4fddSUAMnJeJctZduX+Tu5C76ME+omtYFqzUQGY4dvWjRsnlLTm+GhkhGP72O65HmNCeeQVDhmEDNmlB+0YLNFHmov0827yx4q6nQ755oMx280p8OEjG2z5xduqsAngrCWHk2Qb4OjmyrPkcl0B2FFhXeFoYaJStBigE6YYBlENZ0QTGtFge6Q9y1llzrUhgaX2YSdHLYuwFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bzhqmjKW7/AxwKnqPCh/GZtg92nWxY7BFvnn3lAZVuk=;
 b=WSqQ1kO0oW5kzFm62KkLKROJLCjwaixYiMo95VyG+oexq7EmmLZiY979HJZCTZoP5BKqiGKC8OiMo1xKOjySYlQXhXSvUacnBnJitY/Rt8oRbVvaKdGxEoBu4FBwsLu07kJf8nCtq3W698Yy2spfLWguaFIjsd96tcYvhSeQVh85LQhisaONWdUnvUmZntAuyK+ocRyTDNV36UcMVt9NrjwH7bRmcCjfSAOX2LXL43Huk462rnHg4cCETE3SD/QhcuMU4PN6DyserTrYo6G2kmCkEIRldcrdOCQgqPuDDJYz8LCPlgZlvP7lktCYh+Umli/hYmvL474LdyjYHqTFSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bzhqmjKW7/AxwKnqPCh/GZtg92nWxY7BFvnn3lAZVuk=;
 b=SXWmxtnfvyczdgD2H8xTSVr5fn12lFxR9qM22FAkReVeR6FMM68w7q+TEolovFQ86CDQtLh3O5bItxYNwFfPa+YZu8y+Bz+ARBgXguXmzxjxg8UfC1iMY09A6nPVFudTvAtN+IO3SgzDAirJQaVS1gsbKto1IfGnqUu29jqwmBs=
Authentication-Results: cloud.ionos.com; dkim=none (message not signed)
 header.d=none; cloud.ionos.com; dmarc=none action=none header.from=oracle.com; 
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4551.namprd10.prod.outlook.com (2603:10b6:510:38::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Wed, 2 Jun
 2021 10:23:39 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::2c91:3885:d138:60fa]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::2c91:3885:d138:60fa%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 10:23:39 +0000
Subject: Re: [RFC v5 1/6] qmp: add QMP command x-debug-query-virtio
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1616084984-11263-1-git-send-email-jonah.palmer@oracle.com>
 <1616084984-11263-2-git-send-email-jonah.palmer@oracle.com>
 <YFuFl933UxoBKQ1C@work-vm>
From: Jonah Palmer <jonah.palmer@oracle.com>
Message-ID: <93c20860-a9bb-0565-a5cc-88525c6ee71e@oracle.com>
Date: Wed, 2 Jun 2021 06:23:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <YFuFl933UxoBKQ1C@work-vm>
Content-Type: multipart/alternative;
 boundary="------------558C42D7FF1F73B980A6426A"
Content-Language: en-US
X-Originating-IP: [138.3.201.40]
X-ClientProxiedBy: BYAPR08CA0051.namprd08.prod.outlook.com
 (2603:10b6:a03:117::28) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jonpalme-lnx.us.oracle.com (138.3.201.40) by
 BYAPR08CA0051.namprd08.prod.outlook.com (2603:10b6:a03:117::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.15 via Frontend
 Transport; Wed, 2 Jun 2021 10:23:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d3fb029-e527-430d-ebe3-08d925b07cf9
X-MS-TrafficTypeDiagnostic: PH0PR10MB4551:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB4551C52DA898D7F95CAE76F9E83D9@PH0PR10MB4551.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S6Gsyi/0mL3MtO091B5iIPurcgPDWlFsYN54y0SUMnCBMO+wO91FpN1Qfb0cjyTxkj6d4uHD19tx9oK8xwKjv50u+YprVE0cJBEujpU8R6M/TS5hjitNBPzoq2Te5LpBxRmwEGwMrJD09TRHqlY+H5EGJ84XXh0EtQ3yuh+XfrwY5png9LuwJ0C5T8AiYmQxC84zoTlRFWWedmqVBsPETcrKxOTRinaOqqlsLnmqV0xD13UcMKLxeaC+2yNEsO9RsKHTT+2ofnZf3w8HYqaAqhSHbB4DGrrqUtO9kyXBVtkUtOmhyzBUhgSa8qdaPgNwL3aIX0XbOwZdZzzs8+X955CUF96q8v+kYO8qGj/US+gUNtoZLUnn86FjrcRx7cpY2QxykD0/ylTtw/MfRQrLxBcDB7VuqcIX/eHFffIsugcfzWHDNJNvAxXQMyjHOvJmqC74XyX15Tn6wJhJWtOjo8dqXekU6UCtQvVOKhK3z0AtJdh6KzZ11rMlvGxiRkg2kR2svA/aeS+mEUfXZLMQK6WJDOIw+gbRKbVTXbX18jUMCAfSBzP89i3WHWPbq3gEGWPoiMGRE4hydb6jCv12hM/KjRXL0FwOocOCFbC3oF5Ln4sSpprOQz6fOkTqZlqDv9KL4We1R+R+S/fV86iWH1ZXtJvAlBByk7v/xw5xkEKPZVWKfBc75kojbzq3ZB5P
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(366004)(376002)(396003)(346002)(316002)(6916009)(26005)(86362001)(7416002)(36756003)(38100700002)(31686004)(5660300002)(6486002)(7696005)(33964004)(53546011)(186003)(8936002)(66946007)(83380400001)(66556008)(66476007)(44832011)(4326008)(956004)(31696002)(2906002)(16526019)(478600001)(8676002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YnQrUEFOOW03aEVlY3E5WDcvNXdTZk8rSWlvUWRLYlYzRk5oSmRzRDQ3Zk55?=
 =?utf-8?B?dUk0NVdjSU5rczkwbEt5OUlpVFBRTm5hajNWcWk1a2VWaEJULzlmK1NyZWNI?=
 =?utf-8?B?azY3cnJCK25IM0pncTU3Q0d2RXM2UUpsTDF5akpRb05MWm9uc1NVMFAvQ0RB?=
 =?utf-8?B?UTVCUXA4WjdNeHBBRGpKYTNoNE1SQWZhbjN1d0lqYm9xczJwRkh1WEUzU0w3?=
 =?utf-8?B?UFVTZ1FSNENHcW1IeVExaG9QZmJ2QXQyQ09vdFkrM2R4MUVVRHdoYmEzeDZv?=
 =?utf-8?B?Q2g2VXpNc3YxaFRHaHVmcWszeWZjQ1dxcitLVE9QQ3NVWFhlKytwZXhPbWlP?=
 =?utf-8?B?bkUvOUxnYm4wV3JPSXdwdnRKRktFa0RMcDdTMmphT2NLMDBJMWtDYW04V1VZ?=
 =?utf-8?B?OTRLMlFtN0hNWXRvMVpVdjlwcGlya0pYVGVlem9acVIxMnNGYkp5QnFVVWRP?=
 =?utf-8?B?SFFmRGFxWWYwbmFlWFlwK3NVQjJzSis3NlIwY0xNdDlpMEVUd0g1eDdrdlpQ?=
 =?utf-8?B?NFdmZFA1Y0hhdEdRMDY0bFZscU50d3FpdUpTbFdPVjIvV3VTQlN1MlNJbkVs?=
 =?utf-8?B?SWdrb0x1K2pURUtjcDRtTitHM0FUYTJPQk9PV0RoeHorSzRuRmFRUnljenkz?=
 =?utf-8?B?T2dQVmoyc05JazBjYzB6eVNHZjkzdzl2NkNoL1MxdTVuNVRnc1d3aG9ocWdl?=
 =?utf-8?B?MURKc1RsWFBKdWs5ZVlOdTlSYVhvMWZrYWFHM2hsbUVUVUZvclNpWjcraDE2?=
 =?utf-8?B?SzduNXIyd1EyZkRUZElQZFlZV2k3eVlwdGdncVQxU21jL29ENlRCUk5JNFBL?=
 =?utf-8?B?NldpLzcxSFI1SzRRN2dRZEFWUzNnWmFPL0s4ZzExOGJDNjgzZXoxTCtpM1E4?=
 =?utf-8?B?L2Z0UGxjdDhpc3paOHRvbDJFS0VaNGI0UkloYSsvWkhiS2lGWWx4SkdGcEJy?=
 =?utf-8?B?WmdlWXNEcUhTNE5wZWVES0krU3l5REV4VSs3NXI5Wi9SRlBWMEJsVS9SZUVF?=
 =?utf-8?B?by84TXB3eUkreGoxZWN0cHpxT1lGalg2Smd3bmFWRWJZUi96NkRhSWlBZVZF?=
 =?utf-8?B?dTB2VzNYWE1zRGZjMUtqM0pyKzUxemVIdEhMcU52bWdkaVFMQmxBdWloREZz?=
 =?utf-8?B?V2VJckJIVXkvTUsxZlRoUC9wdkdVeHNDVkJPL3hCZU9oQkk0QWovVlE0b1Y4?=
 =?utf-8?B?Z3pOcXBDSWNXMllaSTJhajJTMSsrN3N3dEg1ZEhlS1ZVNitmcGMrZ08vZzZT?=
 =?utf-8?B?Z3VSbUtKY3FCcWJMUHB1TXU5RXdkOFEyWEovY1p2L2ZkNlphUS9VdlJyYm5w?=
 =?utf-8?B?U09ibGxPdXZOamx5RE1hOHNDRGZ2NjVjQ3lzUGJ2SFpKWUVmUGxOZW1qNHVH?=
 =?utf-8?B?QWtIZk1JZm9aeFVjOW5zRnVEeUxGZTh1a0Vpb3B3Z3M0VmhXVkRXNERGSXdC?=
 =?utf-8?B?aU5hZHVBZlVRVUdEbU9VYWhzQk9ldjZDcVlOekdLM29WWlJKMnAxc0VERSto?=
 =?utf-8?B?ZDZYazBUOFpCb0JJTFlRK2FaOEtsSUcxckFONHN6YmxHcUNMOEowcnBGbksv?=
 =?utf-8?B?WExLLzdiR2xuSFZXdGcrNU9sUXBiQmQrMU0vWUlZZjVDZFlEV2RNRHBwMDNT?=
 =?utf-8?B?UU1qa2tuRGxRVG1XbTVtMHVUZWtNTGlWd2V0cEFVWmNDaVRqeittSzlxZW84?=
 =?utf-8?B?ZFdvVUVBR3pQRFUycHFUUHhuZnA4N3FZVlZQZjdTYXRLVS9teCtKL0JIbEV6?=
 =?utf-8?Q?mxv8yLtaTkImjpp6UjlUisuX37M6x5ras1mNLZ8?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d3fb029-e527-430d-ebe3-08d925b07cf9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 10:23:39.4097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c8/uYbKZoqNqxAN/WI+wPFDklMP6QcWP8yetrmrDLFffARczHtbFsOiYmfn6TDb1tuEeYT9rusf7kmB2kFOoWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4551
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10002
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106020066
X-Proofpoint-GUID: REqtW56WyFvWRLyGfMQ2wv7whpECdyvj
X-Proofpoint-ORIG-GUID: REqtW56WyFvWRLyGfMQ2wv7whpECdyvj
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10002
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 impostorscore=0
 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 clxscore=1011 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106020066
Received-SPF: pass client-ip=156.151.31.85;
 envelope-from=jonah.palmer@oracle.com; helo=userp2120.oracle.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_PASS=-0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, thuth@redhat.com, qemu-block@nongnu.org,
 amit@kernel.org, michael.roth@amd.com, jasowang@redhat.com, mst@redhat.com,
 david@redhat.com, qemu-devel@nongnu.org, laurent@vivier.eu,
 eric.auger@redhat.com, dmitrii.stepanov@cloud.ionos.com, kraxel@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, si-wei.liu@oracle.com,
 marcandre.lureau@redhat.com, joao.m.martins@oracle.com, mreitz@redhat.com,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------558C42D7FF1F73B980A6426A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/24/21 2:31 PM, Dr. David Alan Gilbert wrote:
> * Jonah Palmer (jonah.palmer@oracle.com) wrote:
>> From: Laurent Vivier <lvivier@redhat.com>
>>
> <snip>
>
>> --- /dev/null
>> +++ b/qapi/virtio.json
>> @@ -0,0 +1,68 @@
>> +##
>> +# = Virtio devices
>> +##
>> +
>> +##
>> +# @VirtioType:
>> +#
>> +# An enumeration of Virtio device types.
>> +#
>> +# Since: 6.0
>> +##
>> +{ 'enum': 'VirtioType',
>> +  'data': [ 'unknown', 'virtio-9p', 'virtio-blk', 'virtio-serial',
>> +            'virtio-gpu', 'virtio-input', 'virtio-net', 'virtio-scsi',
>> +            'vhost-user-fs', 'vhost-vsock', 'virtio-balloon', 'virtio-crypto',
>> +            'virtio-iommu', 'virtio-pmem', 'virtio-rng' ]
> Can we make this be a complete list that's in the same order as include/standard-headers/linux/virtio_ids.h
> then if we add a few asserts somewhere to make sure we don't screwup, we
> don't need to do any translation.
>
> Dave

Hi Dave. Just so I understand correctly, you would like me to add all of the entries in the given order?
E.g. including 'virtio-rpmsg', ..., 'virtio-mac80211-wlan', etc.? Or just the supported virtio types in
the order as it's shown in virtio_ids.h?

Many of these devices may not be supported for introspection.

Jonah

>
>> +}
>> +
>> +##
>> +# @VirtioInfo:
>> +#
>> +# Information about a given VirtIODevice
>> +#
>> +# @path: VirtIO device canonical path.
>> +#
>> +# @type: VirtIO device type.
>> +#
>> +# Since: 6.0
>> +#
>> +##
>> +{ 'struct': 'VirtioInfo',
>> +  'data': {
>> +    'path': 'str',
>> +    'type': 'VirtioType'
>> +  }
>> +}
>> +
>> +##
>> +# @x-debug-query-virtio:
>> +#
>> +# Return the list of all VirtIO devices
>> +#
>> +# Returns: list of @VirtioInfo
>> +#
>> +# Since: 6.0
>> +#
>> +# Example:
>> +#
>> +# -> { "execute": "x-debug-query-virtio" }
>> +# <- { "return": [
>> +#        {
>> +#            "path": "/machine/peripheral-anon/device[3]/virtio-backend",
>> +#            "type": "virtio-net"
>> +#        },
>> +#        {
>> +#            "path": "/machine/peripheral-anon/device[1]/virtio-backend",
>> +#            "type": "virtio-serial"
>> +#        },
>> +#        {
>> +#            "path": "/machine/peripheral-anon/device[0]/virtio-backend",
>> +#            "type": "virtio-blk"
>> +#        }
>> +#      ]
>> +#    }
>> +#
>> +##
>> +
>> +{ 'command': 'x-debug-query-virtio', 'returns': ['VirtioInfo'] }
>> diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
>> index 1c7186e..8f0ae20 100644
>> --- a/tests/qtest/qmp-cmd-test.c
>> +++ b/tests/qtest/qmp-cmd-test.c
>> @@ -95,6 +95,7 @@ static bool query_is_ignored(const char *cmd)
>>           "query-gic-capabilities", /* arm */
>>           /* Success depends on target-specific build configuration: */
>>           "query-pci",              /* CONFIG_PCI */
>> +        "x-debug-query-virtio",   /* CONFIG_VIRTIO */
>>           /* Success depends on launching SEV guest */
>>           "query-sev-launch-measure",
>>           /* Success depends on Host or Hypervisor SEV support */
>> -- 
>> 1.8.3.1
>>

--------------558C42D7FF1F73B980A6426A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/24/21 2:31 PM, Dr. David Alan
      Gilbert wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:YFuFl933UxoBKQ1C@work-vm">
      <pre class="moz-quote-pre" wrap="">* Jonah Palmer (<a class="moz-txt-link-abbreviated" href="mailto:jonah.palmer@oracle.com">jonah.palmer@oracle.com</a>) wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Laurent Vivier <a class="moz-txt-link-rfc2396E" href="mailto:lvivier@redhat.com">&lt;lvivier@redhat.com&gt;</a>

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
&lt;snip&gt;

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">--- /dev/null
+++ b/qapi/virtio.json
@@ -0,0 +1,68 @@
+##
+# = Virtio devices
+##
+
+##
+# @VirtioType:
+#
+# An enumeration of Virtio device types.
+#
+# Since: 6.0
+##
+{ 'enum': 'VirtioType',
+  'data': [ 'unknown', 'virtio-9p', 'virtio-blk', 'virtio-serial',
+            'virtio-gpu', 'virtio-input', 'virtio-net', 'virtio-scsi',
+            'vhost-user-fs', 'vhost-vsock', 'virtio-balloon', 'virtio-crypto',
+            'virtio-iommu', 'virtio-pmem', 'virtio-rng' ]
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Can we make this be a complete list that's in the same order as include/standard-headers/linux/virtio_ids.h
then if we add a few asserts somewhere to make sure we don't screwup, we
don't need to do any translation.

Dave</pre>
    </blockquote>
    <pre>Hi Dave. Just so I understand correctly, you would like me to add all of the entries in the given order? 
E.g. including 'virtio-rpmsg', ..., 'virtio-mac80211-wlan', etc.? Or just the supported virtio types in
the order as it's shown in virtio_ids.h?

Many of these devices may not be supported for introspection. 

Jonah
</pre>
    <blockquote type="cite" cite="mid:YFuFl933UxoBKQ1C@work-vm">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+}
+
+##
+# @VirtioInfo:
+#
+# Information about a given VirtIODevice
+#
+# @path: VirtIO device canonical path.
+#
+# @type: VirtIO device type.
+#
+# Since: 6.0
+#
+##
+{ 'struct': 'VirtioInfo',
+  'data': {
+    'path': 'str',
+    'type': 'VirtioType'
+  }
+}
+
+##
+# @x-debug-query-virtio:
+#
+# Return the list of all VirtIO devices
+#
+# Returns: list of @VirtioInfo
+#
+# Since: 6.0
+#
+# Example:
+#
+# -&gt; { &quot;execute&quot;: &quot;x-debug-query-virtio&quot; }
+# &lt;- { &quot;return&quot;: [
+#        {
+#            &quot;path&quot;: &quot;/machine/peripheral-anon/device[3]/virtio-backend&quot;,
+#            &quot;type&quot;: &quot;virtio-net&quot;
+#        },
+#        {
+#            &quot;path&quot;: &quot;/machine/peripheral-anon/device[1]/virtio-backend&quot;,
+#            &quot;type&quot;: &quot;virtio-serial&quot;
+#        },
+#        {
+#            &quot;path&quot;: &quot;/machine/peripheral-anon/device[0]/virtio-backend&quot;,
+#            &quot;type&quot;: &quot;virtio-blk&quot;
+#        }
+#      ]
+#    }
+#
+##
+
+{ 'command': 'x-debug-query-virtio', 'returns': ['VirtioInfo'] }
diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index 1c7186e..8f0ae20 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -95,6 +95,7 @@ static bool query_is_ignored(const char *cmd)
         &quot;query-gic-capabilities&quot;, /* arm */
         /* Success depends on target-specific build configuration: */
         &quot;query-pci&quot;,              /* CONFIG_PCI */
+        &quot;x-debug-query-virtio&quot;,   /* CONFIG_VIRTIO */
         /* Success depends on launching SEV guest */
         &quot;query-sev-launch-measure&quot;,
         /* Success depends on Host or Hypervisor SEV support */
-- 
1.8.3.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------558C42D7FF1F73B980A6426A--

