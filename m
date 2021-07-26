Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE70C3D563E
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 11:13:04 +0200 (CEST)
Received: from localhost ([::1]:42682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7wfX-0002kb-RZ
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 05:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1m7weM-0001pG-5X; Mon, 26 Jul 2021 05:11:50 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:46904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1m7weJ-0005ug-QZ; Mon, 26 Jul 2021 05:11:49 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16Q96Tgi014622; Mon, 26 Jul 2021 09:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=B7e9LsKkyVFKOllkRvWEbhUdhF+oyjBJKBRoOq5ylj4=;
 b=iwfuiHnd+I5W54OazJe1bSos/VolYTcIn4GNr8zRTTMWCCRR+P6XdEdDall0OwOjKryo
 +jJVP92FK8tetlQqQw+udL9HkKHCjym15k+B00UKtYNwWIk109RK4SkhJmQYsqU98CqX
 HUCNt+1ByV8DUx7NKCDKVQrIgtidQRpSr958oX7VczrAiw4UOycY9gdL6pkunlFEDtfM
 0M76bH6U5yynG+Ysw4erTMOOmkJWOCMEGmPW57KWM6sIhtCaeH7dq1A5r/NWdsaAdTTY
 9JEfL5OAnoA63anRv4QJw1TFUh70haOGsdP9GhI24XPHAcrXKG2YvTrNcrb8ugzjc2FO sA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=B7e9LsKkyVFKOllkRvWEbhUdhF+oyjBJKBRoOq5ylj4=;
 b=M+eiMXRm28inEwUyqb+36OGX8o2SIzzozJwH/v6x795Vzv2//gXFK6O8pwpTSdtOzGzz
 pdUdTtBNjhfuoTgGwsCkCpn0XX2M065Vyid72RUM6zNcSG7qsYAiwRqKOoPRXQglVybm
 aDqnO4D/PImdUYh7DiInbLckgI9gXQvylW/yQMSzeuyNQmm3pPT/8ny0s6aFZ+oNnWM9
 z/nk8orY1gcxrE/yUyLbMZbhkY2sCALYVCZYffmd0vSVAw8MYoT/EgsQpDVk7Stihthy
 NwzVydWqZiMzZMXGEjHWAv2yJ3YUMyYHPq/D4aop0oMoYCmNrb4SCU/DgMFuRcIKRYlW 7w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a1cmb0x8a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Jul 2021 09:11:36 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16Q95doj066357;
 Mon, 26 Jul 2021 09:11:35 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by aserp3030.oracle.com with ESMTP id 3a08we5env-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Jul 2021 09:11:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W9XYad052QUMQZCHr/QVx0HePdP54S9qslRqfib1xb8hBfp96zudx6H1Rt4eXM1GuNVr5bULarujHyocZJmtsru2v60hMCrUgFKcM+Sl5vHGzmML/6WT5he47WgTngaxWazYi05pEoG8AwsUVkWlTRLnS6HM9fcvGpydqKN0Ox6rttqVlHiIA3yoMX/JKpBxAhj800CbT3Dz0Z0WACWC9OTf3IT4dqW00owN57bl/QKSawdd9UWbfLFCuszRjjcwJFy49pGqFRWGhAVV3g7jfYjQMiW0pC3ERpjk45qRynTKOtsVVjQmENPgO0LcqWcTZxyhvToTrKKqVIFbBUrsZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7e9LsKkyVFKOllkRvWEbhUdhF+oyjBJKBRoOq5ylj4=;
 b=IikCqP9xdRhAOlTHSTkAGEbsPikgygYGAMrmmqLWTQKxhrkECuChWVBQWxjRGJBdB87b1UBkSujFXbtLlyFRJB4C0rRLnmwc8sEOZluSpLo7lhZpl7+dXL93tQW7GBPXnQRonACZQ2jf9s86jvF4uexmaJiCDpuVHM29czTlLL2x4YFAd1ZaxpBCiRnn5p78yswgTNBdxrFp2aWDeHC6pDFH4ffic4PS11yVk9z9I3SZfHWxm5lPFItovZK0zFkVNowkYwbHX+/kbI5LxkQIQ87DAwHeKIL+agPVOoIuKwzi5een/j3/MzeJ8L9nCcMTVrGLkZX4PFEds4g9HjkCGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7e9LsKkyVFKOllkRvWEbhUdhF+oyjBJKBRoOq5ylj4=;
 b=n6Pb2GdJTYQdy5GWFTr0B6b3dwqldzhaB0/RBryEr+nZqA7WI0WIYlUqVKEp30h5YxywbomFTKqRzl1Y61eYBwISK0z1dmeqZ5nlrP3Z2+1rW2Cx8vzYsHuB5M6FS8iTNfx/+gG9pxeGKChgze+EWpi8PQJE/kgXTNIEASNGPAo=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4776.namprd10.prod.outlook.com (2603:10b6:510:3f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28; Mon, 26 Jul
 2021 09:11:33 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c0ec:e3aa:9d8f:61c0]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c0ec:e3aa:9d8f:61c0%7]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 09:11:33 +0000
Subject: Re: [PATCH v6 0/6] hmp, qmp: Add some commands to introspect virtio
 devices
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
References: <1626086137-16292-1-git-send-email-jonah.palmer@oracle.com>
 <11b4c5b0-e595-2b86-2dab-54e821e47ad2@redhat.com>
 <f6902815-df0b-949a-4eac-9f2a0093499d@oracle.com>
 <d8c3705f-a99f-a7a7-c8d7-fa93e5367744@redhat.com>
From: Jonah Palmer <jonah.palmer@oracle.com>
Message-ID: <3fd0927f-4cd4-866f-7420-8fe5f5883bea@oracle.com>
Date: Mon, 26 Jul 2021 05:11:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <d8c3705f-a99f-a7a7-c8d7-fa93e5367744@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: SN7PR04CA0103.namprd04.prod.outlook.com
 (2603:10b6:806:122::18) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jonpalme-lnx.us.oracle.com (209.17.40.39) by
 SN7PR04CA0103.namprd04.prod.outlook.com (2603:10b6:806:122::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend
 Transport; Mon, 26 Jul 2021 09:11:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c296af2-14d3-4afc-b79f-08d950155d03
X-MS-TrafficTypeDiagnostic: PH0PR10MB4776:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB4776E599EC5AB27E27B8B00CE8E89@PH0PR10MB4776.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nRPY5zZWSZookUo8Th614wdMk+SMT3mLXRBOuQJSvT50sg6gLIjU6FBywKwf0bOrjkJmtTpMxQpsBLoTOISu7sW2BrR5kB+jRoE8dI9BCnmYhqngwaadkKorhXS5fKdOaYuxDlXBKWOsYsvFxcg53qwCB+wP5L02FttO2T/EqtZYI6BHYqa8b0jxiZti6Lew256rfLiaWYrVwkmwePf0Na64mhudh4yPV8Zm6ZfBq94fe955tnBPC8BVn1/z+X7di7OA4cxVSa+9d3RHX5xyZL8kqMIsOlsgWh3IslMepO68yCS+SH+GKw80zKPKkAWQiIN/leg36RLsaWeZG/dcisdKMgu+UU8efWMyFoGmThbok91oZWEPMcwO/LuAsL1QZkikFuttOJTr5nD8kxKGFcLJkqiBh8oJ5/qSIjY4hQIQ/6cgPMcphwtJ6aiRFXXhGVXboBwvSICr5ZedFeUY24uzshgzxoVfqbmdYEv/JhibSwsnsvb3wg+Bg/2jN+Yp7HLmb9udMxIZK4RqWGuCYq728A+E6BTgSlaK/w0/BMJlFDe/sRXwKSxjXt+I+405LYXHW6CeWUQTZbZg52sUz6j+vZhEKd3M09WRrtuHrzUURR7J7CxNV3I0xy7gW2VG3uQ6nXde6Vfpe3y6AS2QsOrg5Mh9egSZvogRZQLXThG1u3cOudeGWRitpSxCr0mh3zYFK8NAY2cRxYH4qVeHTqWcAePVyJtBVXPNXR005Zw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(346002)(136003)(39860400002)(396003)(36756003)(83380400001)(8936002)(186003)(2906002)(316002)(31686004)(44832011)(956004)(107886003)(8676002)(4326008)(66476007)(26005)(38100700002)(86362001)(31696002)(478600001)(53546011)(7416002)(7696005)(66556008)(66946007)(2616005)(5660300002)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cm9LMGNLVTh1MmZVVlRnbFl5cjhtYzNmZ3E3R1Q0a1FCZVNldVhtbm8wdWNB?=
 =?utf-8?B?a3F3ZHZXbGdmL3ZMS2JhaWFrYXhFSWlLaXFHd1ZEbFdGVkczYVdJSUpySFVm?=
 =?utf-8?B?UGF6bGRTTG9BTG1OdkthZGxwa21aVWh6OU1Rb09DcXFLbmFGSFF3L0tQWGpY?=
 =?utf-8?B?M2wxMWtkZnNWckg1WTRvSzJUYVJZMDR2UnVBZ29NZ0RKTG1Td2lMbXJKb3RG?=
 =?utf-8?B?bXR2K2pGbnE0T1A2cnp3QmpRUUV2aVkway9EbmdvWkhJUXlzQW9MSHhQUWh6?=
 =?utf-8?B?QlpMZHlxNUROSVd2Y3g5R05JNFdMVC9XcFl1MVJ2SlVXOTFTNjdsYmt2bHpO?=
 =?utf-8?B?ckJiZTE5WHB1QUNmR21GZVBISjhCRWgzWmJUWjJHYVlzc09PbU0zVjU1ckZE?=
 =?utf-8?B?R0hQSlVyUXBoVm5VR2wvUVMwSUxXcVB2WWszYkRCMGxHZXJ1MGxwMGxpdGNR?=
 =?utf-8?B?TVlqcTdEeFJncnA5dW9sOCt4a2VPRWRnWDNWc29GWENzYnNFc082NHpIRk9o?=
 =?utf-8?B?SmhLOU1qM3BJRVNDVTlhZ1dqUmhPT2pZcTlUTURVOWxSOTZkMlNmdW5KdUQ2?=
 =?utf-8?B?MGUrRUcveThiOVNWNm5pNGM3Ni83ckorVXh6Wm1aUUJBVGsvQkwxbEIwVFlO?=
 =?utf-8?B?T2RYRmpPTUpDeXZ1cE9IVlg3cEdJKzVidUdVTzAyZk5BQUpjRitZelJTT293?=
 =?utf-8?B?VVo0eGlrNUpRTCs5QVZ0VC80bVI4UkY4cTBuTEkyeFdkVCs1VEtheGtyNUxz?=
 =?utf-8?B?amkwY3hXOU9OLzZNK2lsaDVndnFqa2JTSjAwYmUxbjg3d0hiWStjbTZ0V2ZB?=
 =?utf-8?B?WTRINXplaFFxb1hmek5EanI0c0RnTDlGeUFqTnAzSkg1Z25FdkdoNDhobTF4?=
 =?utf-8?B?N2M3UDVEWUxwaGNBQjRjVlVjREFiWHJBR1dvMEtZSnJFTW43citseGc0UjBS?=
 =?utf-8?B?WE45RDhYRWkrNGk0NUk5UGV4OWdwTzUwc2N5VlMwWnhpSXU1SFI0WGo0dXk3?=
 =?utf-8?B?a05xOVBrSGdRRDFTRGtIbDI5WlhjcWwwS3I5SmRiWUZKamZXYlFiVjBQR1lF?=
 =?utf-8?B?NXNHSm5GekZtaHdVRFJPRWxsQTVFTFRvL3pKUFJTTXgveHcwR3BpR1gvb3Yw?=
 =?utf-8?B?SFVkMUtPRkFuekRQU00rcFB5NHo3LzQzcTh0L3hjZ0F5bTFnU2FGYWwzNThN?=
 =?utf-8?B?b21FSjNBakJrdUFzbVJQNUt1VTFWazNITGVic3hMZHlZdWhxeEVpZy92TUxD?=
 =?utf-8?B?QnlySVBlQXBobGNoMFhMWXRLbXY1MXZ1SjRoUDRNYy9tZ1Z1WHlMeS9LaHJt?=
 =?utf-8?B?TTBvRnF2MjRnd2dES2ZKbVk2T2xSeDFTeUxUdXVxRG51R21abzJqeGxMQ0Qr?=
 =?utf-8?B?dzRJdXdDdEUyY1JKblBicFFrQmp0TUpYV2cvbUVRNFRUUW92SkUyd1VEK0V2?=
 =?utf-8?B?MTFEZGsxT0VkSlh6ZHgrd3dkM1JaTnpZYURyV2Jmd3FIb2FnYkhLWVJieDYy?=
 =?utf-8?B?TUF3eFhXakE4dmRlOGpRQTFXUzVEdXFZSGZpdm1wZ3l5T2UyRVBsSFJES0Ra?=
 =?utf-8?B?Si96SXl5RkdrYmp3QmRVcTloNzNpMjRrOXRybWhZd0JlbEhQU09KbWxvSDlN?=
 =?utf-8?B?aXByVTFiMFJJOSt3VEJpNmxjRm1BSW9aNUFsUGNPWjBDSUtwVDVYTTRSd0xh?=
 =?utf-8?B?QmlRTkNvbjdQUGZ6MGNxNXhDNWMxR2RqUUpSc3FMdEpqb2xYL1dETTBjOUJI?=
 =?utf-8?Q?L3v+zwanCZTHPocJpJryF71wQtfv6Ft8ow9eAX/?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c296af2-14d3-4afc-b79f-08d950155d03
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2021 09:11:33.6567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WfUtD5gpfV/1L2q4b0gjF+jBj8DZJFYQ+4N7wE1HNQOIdXfpuQ6ons7OqLvm9Lu0rNihp50sUhQJ19dTcOuYGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4776
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10056
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107260052
X-Proofpoint-GUID: 2sL8nyN-2ne2m99KlBAcBGvkdkEoSjmd
X-Proofpoint-ORIG-GUID: 2sL8nyN-2ne2m99KlBAcBGvkdkEoSjmd
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.091, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_BL=0.01, RCVD_IN_MSPIKE_L3=0.9, SPF_HELO_NONE=0.001,
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
 mst@redhat.com, michael.roth@amd.com, david@redhat.com, armbru@redhat.com,
 amit@kernel.org, dgilbert@redhat.com, eric.auger@redhat.com,
 dmitrii.stepanov@cloud.ionos.com, kraxel@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, si-wei.liu@oracle.com, marcandre.lureau@redhat.com,
 joao.m.martins@oracle.com, mreitz@redhat.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 7/22/21 5:16 AM, Jason Wang wrote:
>
> 在 2021/7/21 下午4:53, Jonah Palmer 写道:
>>
>> Hi Jason. My apologies for the delayed response, several work-related 
>> things came up recently, but they're slowing down now so I'm turning 
>> my attention these patches to get taken care of.
>>
>> A few questions and comments below (and in other following patches):
>>
>>
>> On 7/13/21 10:42 PM, Jason Wang wrote:
>>>
>>> 在 2021/7/12 下午6:35, Jonah Palmer 写道:
>>>>          Dump the information of the head element of the third 
>>>> queue of virtio-scsi:
>>>>
>>>>          (qemu) virtio queue-element 
>>>> /machine/peripheral-anon/device[3]/virtio-backend 3
>>>>          index: 122
>>>>          ndescs: 3
>>>>          descs: addr 0x7302d000 len 4096 (write), addr 0x3c951763 
>>>> len 108 (write, next),
>>>>                 addr 0x3c951728 len 51 (next)
>>>
>>>
>>> I think it would be nice if we can show driver area and device area 
>>> as well here.
>> Sure thing. And I apologize if it's obvious (I'm relatively new to 
>> virtio), but how can I expose the driver area?
>
>
> So the spec defines three parts: the device area, the driver area, and 
> the descriptor area. And they are all located in the guest memory.
>
>
>> I understand that virtio devices are part of the Qemu process, but I 
>> also thought that virtio drivers are in the
>> guest's kernel, which I don't believe I can see into from Qemu (or, 
>> at least, it's not obvious to me).
>
>
> It works like how you access the descriptor ring (descriptor area).
>
> Thanks

Oh, I see now! I didn't realize the device area is essentially the used 
ring and the driver area is the avail ring (at least for the split 
virtqueue model). I see this in the virtio spec now.


Thank you!

>
>
>>
>> Jonah
>>>
>>> Thanks
>>>
>

