Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4ED23DB8EA
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 14:53:52 +0200 (CEST)
Received: from localhost ([::1]:33754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9S1P-0001Q0-US
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 08:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m9S0E-0008QF-GK
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 08:52:38 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:34252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m9S0C-0002EX-GI
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 08:52:38 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16UCl21k031399; Fri, 30 Jul 2021 12:52:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=LfhFN23HEPectxHfyyJUH4wHHTib+16kNiQiTMLnovw=;
 b=EYV1CTI8I9D9zR5WLCbjmqWyMwh0CctOyNaSjFa63QMf20i0OGdtps00cAVZw3Mno9NP
 71YQtjrNk5oOGv+of/3shECOpf2IEbTf6hpHNp9UE5CoQZ4YIjbPA7WI9NQ+4paeLkby
 hY97Z/YhBqbk3Lq2yrl7cXiKdavIKgBMeSIdzyjUztRodv7thAhDi/0/abbYlzwK3s/N
 QUzOTbaHC0NS38OdrM8HKWf/airZxS4Qmt7uq521ufbD0CJoXP9p2TpLWpXgnDDQCMrN
 sxVKvreBTNhkEe1xmVMKd9/u1vPg9WjPaWhPq6B+Q8lqJ/DSG7AUQw68tbtyeF4wqJjb Tg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=LfhFN23HEPectxHfyyJUH4wHHTib+16kNiQiTMLnovw=;
 b=Gcwk205nc9jzqLDLaekM5mQD1cSeKteQ0V9c+AVCMFnENqlBVRlO62tJn72BSYuxgSL0
 8XJM1yR9/t27B1sTKv/bukBRD5VCw3rLtSezYpd0SQ6JmQ4JlenHRK2z6ozbsb71WbSf
 N1umlMH+U61IYUBuPAnSRXSirZXIAieB3F7ETZV3XGuaWjRBdFcJbmZZUztB9Mt/SwyF
 DS6DAexIRQXRlejv1YbSpHhbU6mXjOW2bh1cG8L5OMX03W9UwZSFbbEEonoaOsXxACA6
 ScLOPm6NWU70fZFlUpPE6Sb8jGf9KwKpRJTEOEZBwbjT5LgawK4H5eL+swO9Kr23JotF jQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a3rukk4sv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Jul 2021 12:52:28 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16UCnf4B020103;
 Fri, 30 Jul 2021 12:52:28 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
 by aserp3020.oracle.com with ESMTP id 3a234e6pqc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Jul 2021 12:52:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mIlKfZv55HRGfxfwzmrXdktJM8oElXnAeetkZhs5z7qnmxC+Yd8RPEPSbjcPlnSq3lNOGqUrf6kYKio7ljLYeccB5c49LNoi5oxbnxGHAjtmkcCJp+kglHPRG1REiqxs2wqd6WQ1ch4K4ZqE0v1WxeB91frW7d8e8t7hedhOqD0ViJ6PjoDkdMM1YQ7MRKjY5Ls86NONEWIpaZD23lR535eZKfgVP/XNt5q7GnBkKki0SdYH+JWTlg0XbHGcaQtXF/M018Lgh1W4mM6NIvtchJiplG874avFwuiWdKL1iijlk307qWR0tR19z2uWjy/yvHfa2t0000MZYxPeyOoMqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfhFN23HEPectxHfyyJUH4wHHTib+16kNiQiTMLnovw=;
 b=b5/kPTCVbMGJ0oWCCL0/rBfXJ5SkEisD72vIupjYkQcFAqA3oJICwIMR+BaTPbrouzQsG4+TyROMFYWpB7T/af5Lb7ymCiEw0etf560TCBtl5w+2wBKkJ6YRp0mjpRll7g5EYnyzmXeLZohRcX2KIplFGlOWIsC80ThHgVW7jcToLhwFFfKO2sE+r0yADEJWz8cgss/ZkJ63cvZnXYwoEUtv3QkycMApyOhmbxNAF4NTfKfHvghbBOEE4QPDBCcp1Haj/2l1iMAaVWVjwZZ1C8FELuEHSikvroLcaN8FC7tz6MFORie9AAJCk2WVGzvG4mZARV7CWIZIeHDZTcvOKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfhFN23HEPectxHfyyJUH4wHHTib+16kNiQiTMLnovw=;
 b=Fqp8969ObSdKbYCX2VvJvGqQHEkZ1RtoFVPe2JXbbckzwM6ZaqClsipNesreWsyTYuAp1YpG7yVrqPsQumymrJSD7wbspT4QsF07htnDz3v2YpzsUnGRYD+tRwPtrThlMmJi0zJOPXi6o4bxC/bN/EPWwVohbveXVlP1Is41JOc=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2805.namprd10.prod.outlook.com (2603:10b6:a03:8b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.19; Fri, 30 Jul
 2021 12:52:25 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3%5]) with mapi id 15.20.4373.025; Fri, 30 Jul 2021
 12:52:25 +0000
Subject: Re: [PATCH V5 17/25] vfio-pci: cpr part 2
To: Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-18-git-send-email-steven.sistare@oracle.com>
 <20210716145133.4aa3f341.alex.williamson@redhat.com>
 <be26577b-8df6-a8b5-fe06-ea33552aa472@oracle.com>
 <20210719121021.6babb9ff.alex.williamson@redhat.com>
 <2f85af36-5d64-99b0-5165-ceb73087d247@oracle.com>
 <93e7660d-6d89-8d35-b415-88ccb7e6d7fc@huawei.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <27ebf9ff-4a1c-db2c-6be7-d8092283e810@oracle.com>
Date: Fri, 30 Jul 2021 08:52:21 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <93e7660d-6d89-8d35-b415-88ccb7e6d7fc@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0217.namprd04.prod.outlook.com
 (2603:10b6:806:127::12) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 SN7PR04CA0217.namprd04.prod.outlook.com (2603:10b6:806:127::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20 via Frontend
 Transport; Fri, 30 Jul 2021 12:52:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 821d7a90-598e-40f1-24e1-08d95358e15b
X-MS-TrafficTypeDiagnostic: BYAPR10MB2805:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB2805CA544209C28159934F6BF9EC9@BYAPR10MB2805.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fH7hxVIi1Fg5zz7rElRfbp5arynCI8SeFbJ0psinHFKZbwtxO8LkBXOBNoTu9ZHE3k6roHY+56i+FxeDNBFubb0wDqrZBfq6ND9hH6fcqyqhFqgs2vcroFq1rPv/jfP6tkXCIObbBHNE3n4f3XWL+m71HbpJuENJuE2kEhdEucMXwzhy0lOJanAQSeCPL4Of4A9HmAgz8jN7rzeYvBcBUr+qgeOcZyuqjL/QM2lmcYJoW7EqiX/QdoPjfT918LLRMDbT2AfPW3Yxf2+W7qyaiAXxSqlADMC2CO/J3JrAP4OxrhPCcLlnaQmeXYtC3ewp93ZXJow/5mZoikzMksmhRFdvuW9GlsU6JnA1CYw6DtWwz53eLpoLIZP9iDfLN0kTSqP2OkDBR6/dVzZzx5HGnJlKbY9vZtrO8wDz6d+s9l95t7vFGqboM1tmRMHt4RF+2f4V9hFRptxBmpXfeY7tQUI1LnNeKvSohzxY2ntejFcvyuwfEDkChMifoh2n9DaDVWoM5eVlQuQCfTlMltxRzxw5NPH8Xk/bl2BixqrS49m+6rZVPXNrWGLzojWsSx0A1+MHvHOzZzMH8Ldy/DU6H5Xzs1WDCI7HmwiwKXF3koXUHNdvcNxK4RQTlYQxcDklB9H4xwMm/ZiqSO+Ns6keUkG488R1Vz1wFcc2WP945mGnvZGuuz9qPDHItaFLARAY3NbEu8VEhrIqTO1x1LrANwZFHPsCfj157FiVocKw52Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(366004)(376002)(396003)(136003)(346002)(2906002)(7416002)(38100700002)(2616005)(31696002)(66946007)(36916002)(54906003)(110136005)(26005)(478600001)(83380400001)(44832011)(4326008)(8936002)(86362001)(956004)(186003)(66556008)(31686004)(6486002)(5660300002)(16576012)(8676002)(53546011)(36756003)(316002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjZQc3FFWlZ0SEk2NXl1a3MrWGhBVWZ2cFNlczQxQ0NGTG0zS0EvRHNkZEUx?=
 =?utf-8?B?TDQxUDV5UllkVnBvM3RVL1IyakMxaHBxV2xTY2xlaS9UbWx3TVdJaGROWjJP?=
 =?utf-8?B?dlNjV3dvUzhOYjJVUml4RFBZVTBHazZoSmNnVlVRWnpySGkxMkpkeUJHRy8r?=
 =?utf-8?B?b01ZTEZFOEFmRDBSUlJHT2YrYlpQRllIVmRRcVFhaTViYVQxOXR0QzhHWE9t?=
 =?utf-8?B?Z3pZNHV0a3A4cE4xNlRMeGJGb0hmUkRRMWUvZGtsR09wbXVYNlRVa3ZaNU9a?=
 =?utf-8?B?V3ZJWHErNW16bUJ5dGpURk5rcVliTHVMbDFUcjZJOVJtOVBCSkM3WFNTYlVF?=
 =?utf-8?B?NzNmeHNHcm1uTlVZekxDQktGdGt2RVRoNTByNEZzNTJEZVZ3RmpUcjVqNTJG?=
 =?utf-8?B?dmhrQlFYQzZFTDRxMUg1OFE5K0dqbENFUHpIWDJONkVpWlltUGxEdXpyQzhP?=
 =?utf-8?B?NmFxV3lkRVh1UGZ2R2VVVEFSSjRnbnNweWxDU1dKRnMyMllFSkhMTVFOdUxh?=
 =?utf-8?B?TjN2M2pTN3JoV0p6VHVzdytYWnpleThPNFNMZ3N2YUg2SXR5eGlMRzVRNTky?=
 =?utf-8?B?NWVhdXFJWUkwdys5b3R1Y2xiNENubThEaHNLQU5Bd1RiK3pWS242TGcwcmU3?=
 =?utf-8?B?VjRJaEJ6d280N2o4aWx5R2V1MUV2RHowUUVMZXowOE94SHVoV2pkYnV6ek5w?=
 =?utf-8?B?ZFc0Q1N1L2MzZ3ZYcVVYZCtuQ1JJcHhJZlM4V0pPOS83VmM4QXp4bEZwMmEr?=
 =?utf-8?B?bkdySUdyNDdGOUh0VTBuU1BmVUdLaE5hbEV2TkdEZ1BrRnRNcVFYYklZZVVh?=
 =?utf-8?B?WHAxWDJrcmo3bE5saFlJc0hHUTFNYXE1RkM2dDNrTXVjVG00WGVCRFdmMDZ0?=
 =?utf-8?B?d3hTYVljL2ZPSHBMZGRLV3JuUWlVemZOSXYvRGZkenFXQ0NKK21RRjh6U2xL?=
 =?utf-8?B?SGlPdWdFaGtOZHliNVlKUllZcEIraTRGK2RuY0EwYnRYVVMycnFMZSt5anVh?=
 =?utf-8?B?QnBTR3RRc2Q0MmtmN0FXczhLVFljQmdJbS9CK3V1SldKcnhIaEI1K2QzNWE5?=
 =?utf-8?B?QVNSUmhRdlF6cEI3bHlzRk5jZEVtVXo4TTBCdE56YmdsVnF0bENKWFd6NWox?=
 =?utf-8?B?ZmE5UTk4Z3JXd3ZTU1RZb2grZzlXcEhFQkFGZlNvRHQyc2xrRkJKeHd2cFR2?=
 =?utf-8?B?T3hESzBNcXFYbGppdElnUjdvdnJUMm1SRXR2RzI1WVF3TjJ0V3c4bmxFbHhu?=
 =?utf-8?B?WDUwakplVzhPdU41TFg4WnNLd1lNdDZ1UFcxZ080MFliUS9JaFNUVm8zVGE4?=
 =?utf-8?B?WUs4STlmL1c0d29vL3lWTFhWR1hueTlJSktlWmRjRXBQMHhxS1FwcXNyUHZU?=
 =?utf-8?B?MWZJL25Sa08xMzBZczFCVnhxZ1NaNTlTNEU1RFVsTjV5SDFxeVNIUjhQWTVz?=
 =?utf-8?B?R1dVQ056aU8xOHB6U1BHSHc2d3FGelhLQ0R2Rm9PWStoZjlCcng2Ni9mdklh?=
 =?utf-8?B?SmpUNnpyOW15b3JzSndKZEZUa042VS9MT3cwN2h3UkpsUXJPZjJIVXFBSmRt?=
 =?utf-8?B?NXBMbndWY1FwZ0Vza0VqODl2dWk5b0RZdjdDdHYxc1QrcmVxbjFWNENJVXBS?=
 =?utf-8?B?R21SS2x2U29PYWNvR09HbTNFRVg0dGdjRmdQNWJQTEl6ME1rUUxsdUMvTlEv?=
 =?utf-8?B?d2YwWEo5N3NscnFSWkxscHVFYTZCcjJIcjNBMk4rNEdmL0huekRlOXhPRDdl?=
 =?utf-8?Q?dscWiH2ja7nKnVAnakuZVMUDwhE7CwSuJUIS7nr?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 821d7a90-598e-40f1-24e1-08d95358e15b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 12:52:25.4149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xj9ulg2KJdHXqCPjCoC6ynwkz+2ghU0mTQLZCkrOKiJ6+9QuRIIUpfO43nYWHIFS6jb012fcBYRubjcVnmlqj7K0e+CEE7hgOQVLE+4waJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2805
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10060
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 adultscore=0 suspectscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2107300083
X-Proofpoint-GUID: IDcsHqjGOTs7WmjZfqyUsHQQ0xNveOoH
X-Proofpoint-ORIG-GUID: IDcsHqjGOTs7WmjZfqyUsHQQ0xNveOoH
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.125, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/28/2021 12:56 AM, Zheng Chuan wrote:
> On 2021/7/20 2:38, Steven Sistare wrote:
>> On 7/19/2021 2:10 PM, Alex Williamson wrote:
>>> On Mon, 19 Jul 2021 13:44:08 -0400
>>> Steven Sistare <steven.sistare@oracle.com> wrote:
>>>
>>>> On 7/16/2021 4:51 PM, Alex Williamson wrote:
>>>>> On Wed,  7 Jul 2021 10:20:26 -0700
>>>>> Steve Sistare <steven.sistare@oracle.com> wrote:
>>>>>   
>>>>>> Finish cpr for vfio-pci by preserving eventfd's and vector state.
>>>>>>
>>>>>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>>>>>> ---
>>>>>>  hw/vfio/pci.c | 118 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>>>>>>  1 file changed, 116 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>>>>>> index 0f5c542..07bd360 100644
>>>>>> --- a/hw/vfio/pci.c
>>>>>> +++ b/hw/vfio/pci.c  
>>>>> ...  
>>>>>> @@ -3295,14 +3329,91 @@ static void vfio_merge_config(VFIOPCIDevice  
>>>>> *vdev)  
>>>>>>      g_free(phys_config);
>>>>>>  }
>>>>>>  
>>>>>> +static int vfio_pci_pre_save(void *opaque)
>>>>>> +{
>>>>>> +    VFIOPCIDevice *vdev = opaque;
>>>>>> +    PCIDevice *pdev = &vdev->pdev;
>>>>>> +    int i;
>>>>>> +
>>>>>> +    if (vfio_pci_read_config(pdev, PCI_INTERRUPT_PIN, 1)) {
>>>>>> +        error_report("%s: cpr does not support vfio-pci INTX",
>>>>>> +                     vdev->vbasedev.name);
>>>>>> +    }  
>>>>>
>>>>> You're not only not supporting INTx, but devices that support INTx, so
>>>>> this only works on VFs.  Why?  Is this just out of scope or is there
>>>>> something fundamentally difficult about it?
>>>>>
>>>>> This makes me suspect there's a gap in INTx routing setup if it's more
>>>>> than just another eventfd to store and setup.  If we hot-add a device
>>>>> using INTx after cpr restart, are we going to find problems?  Thanks,  
>>>>
>>>> It could be supported, but requires more code (several event fd's plus other state in VFIOINTx
>>>> to save and restore) for a case that does not seem very useful (a directly assigned device that
>>>> only supports INTx ?). 
>>>
>>> It's not testing that the device *only* supports INTx, it's testing
>>> that the device supports INTx _at_all_.  That effectively means this
>>> excludes anything other than an SR-IOV VF.  There are plenty of valid
>>> and useful cases of assigning PFs, most of which support INTx even if
>>> we don't expect that's their primary operational mode.  Thanks,
>>
>> OK, I'll look into it.  If this proves problematic, how do you feel about deferring
>> INTx support to a later patch?
>>
> I am curious about that does cpr restart mode work for GPU passthrough?

It should work for any vfio device (after I fix the INTX limitation), but I have not tested
a GPU yet.

- Steve

