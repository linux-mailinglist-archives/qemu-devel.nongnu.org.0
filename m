Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 809BD3E53A0
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 08:38:30 +0200 (CEST)
Received: from localhost ([::1]:33278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDLPB-00014h-Ia
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 02:38:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mDLNq-0008Pw-J5; Tue, 10 Aug 2021 02:37:06 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:64486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mDLNn-0004Wd-JQ; Tue, 10 Aug 2021 02:37:06 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17A6Ugcb017678; Tue, 10 Aug 2021 06:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=corp-2021-07-09;
 bh=xvBzJp5rhJndNf1KanfcNOvggxoqiQV5cZY1D6/ma/I=;
 b=ejEHB3kYa+w0jN3bgqdTMpcadvJ+6JHLzi5oTOR34/zF85nxUYGcFVdwv2YPInFqfC0b
 J0JRb+TpHZr6b4FzrGHGCRCW2+DaZw46k/zHhcyNwEM1lHTl4ecmrr/oFj+uwaBSxrmb
 df+2bcj/ofTlDOXxZH/ekAUYPeyjtPHogUREt8ZAcVJaAPMXw4ss6ET98jPpJR65Rgam
 CxGzsN2pOqLsJJwy2ReIVZbuEeLYmHwHfPqI6/YUfKK4dE0Sk9ls2QbRZvRw0XeYGFa2
 3HdGTVlC/0lBLGniju1CQnWbQaDNt06mpHj4p0xeyGTD98pySoIuPVnVSuBOFpKHUXK4 AA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=xvBzJp5rhJndNf1KanfcNOvggxoqiQV5cZY1D6/ma/I=;
 b=QuelSDdeWs04YDrrdVUvpdbP3rhY+Nh+LV879lwH+bu+n4YNkvnHjORn3SLrrNAXifpD
 7/BofkOLYHcQKkeszQP/24Q4dFv8wph8fy1+SBdeyAPpRaxrTfNEpXII1jKOITzA1yYs
 TIPKV3kIEZxlgkEjVlURu/zMcdKOYJhzOX7JEmQzfGnADREbWDxC9ciMpT5sKjgNhvHL
 tgPPUBXkppHaWpwLGy/eqpDzuc2HosDigk2OQuXGxGPlr06DYA/zftTWNTrIu8hf1bNH
 7Hn2exPE+fE/92uTLsJBRlRXTX03cE7EjuHnc9315yTk43SXJ06bHNDWr0MEtMNypR4f BQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ab17dteec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Aug 2021 06:36:51 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17A6UOVi120860;
 Tue, 10 Aug 2021 06:36:51 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
 by aserp3020.oracle.com with ESMTP id 3a9vv45yrf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Aug 2021 06:36:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GwNW9dY92Go+Iv7O83uzkAkJK8bRmk3D5aQJtB0LebfpJToz7Rhqp4g33d8SJioPrt4rmLQuuch+86WmNFwgx9Ek/oH4Jz1nry2oU+B5F/R4Rrm+v8fJMAABnorZelAD3ZRi03KapxTCkkouX03fhoVAVusB/kzyfVTMgyH7f9CKqwPMMBmR0niXahvKggq8mbQeeAgipeQqaCW6MCZjpgP3Hj8Ux6kViMRiNYvUOmKQAsijjCSSnV05c7ANTd8UBjeDm98njkCR3vVtQkU4MokbUiW+dc6Vrq+F3UhPh7jqmoAtjm038D0hu316iQR0N3kecYEnZSZfMkaQjuNYCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvBzJp5rhJndNf1KanfcNOvggxoqiQV5cZY1D6/ma/I=;
 b=NLf6SQojITW5Fvu6aVs0cdCRI89r8ROb/rXitIs4bCTSVyEOcI400K9GzAzoZiGOdQyjrHOMc1VW3CQg5tfDZKYlpfNEgJfXVHemi+HWR12JRqdWyfO/OGfr1n2zkqbHsA85MCczUh0+d9cCEiPVOiA1PReodZrdOfPDZYnTCddZPUK9VMOyx7j1pYtSXShMfi2nIkFWAzuGzzhih1IOR4d9KzHIQeb0mACgoXMctvfgW30grsQFMCxnpT1PatKgxkg6adeIR+xmtsHvC4L/DF2G7EvEYjjD6tphZibVJN+ct2jamwwCq1wOa6yVOImEnd0zaovsrf6Q6m6GR/JXhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvBzJp5rhJndNf1KanfcNOvggxoqiQV5cZY1D6/ma/I=;
 b=m5NZcbQmZpCE8eSnRPmCkt5rNWK4bFWQqdu2LoG4Ki0DIBpDAmpPo9GAXf6a4rZ9rRSVLWyiXyeq2Z87ojR2KLCV3tUCnR/jn3MJlhD3FC0U5Hcr2PY2aAZHCiWyz8ijCGJYsPtL3yIZxYbuzXO0B7S+aWeRD5YLTNVMqaERYPY=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4488.namprd10.prod.outlook.com (2603:10b6:510:35::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Tue, 10 Aug
 2021 06:36:48 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c0ec:e3aa:9d8f:61c0]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c0ec:e3aa:9d8f:61c0%7]) with mapi id 15.20.4394.023; Tue, 10 Aug 2021
 06:36:48 +0000
Subject: Re: [PATCH v6 1/6] qmp: add QMP command x-debug-query-virtio
To: Markus Armbruster <armbru@redhat.com>
References: <1626086137-16292-1-git-send-email-jonah.palmer@oracle.com>
 <1626086137-16292-2-git-send-email-jonah.palmer@oracle.com>
 <87o8a9e8k8.fsf@dusky.pond.sub.org>
From: Jonah Palmer <jonah.palmer@oracle.com>
Message-ID: <a018750e-7066-8582-67a9-31584e24338a@oracle.com>
Date: Tue, 10 Aug 2021 02:36:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <87o8a9e8k8.fsf@dusky.pond.sub.org>
Content-Type: multipart/alternative;
 boundary="------------FE8666284D90C0A0CADA5D86"
Content-Language: en-US
X-ClientProxiedBy: SN2PR01CA0017.prod.exchangelabs.com (2603:10b6:804:2::27)
 To PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jonpalme-lnx.us.oracle.com (209.17.40.37) by
 SN2PR01CA0017.prod.exchangelabs.com (2603:10b6:804:2::27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Tue, 10 Aug 2021 06:36:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bfa8413c-7a92-4601-831a-08d95bc93aae
X-MS-TrafficTypeDiagnostic: PH0PR10MB4488:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB44886782A2096053B410677BE8F79@PH0PR10MB4488.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TLxTd0AjhBIkDcPQioNwVCfCmikqOONDIaT+X3vfi7jbN9LnPi+yn2MhnPFW5+PFelleshqE7aO7Nw6a7ScciMvz8XBCHV7HCgTTY0LM49bLBpMgfW05L0VMoExSr3M7l4s2BzHBp2DNCIGLmxbtobJnz4tJBUuyWxeAjHrSp74Hmk8Q91mQd7NZ68izVB7kDtC/vDebosQgDaw4lafBJD0ZHti5sENO6Q5UyLxeVjRTCzWD0ijNZ+9o10qDZQvg7BDu+JBOjYTLbkLcbnz+4IFyrwjUwbvDQ6iw/OY8mwM/hMnFpIhs4hjdV6Yi1RSQzXPAO6ygNykr++c/eoZtx+cvHW07deXqAU/Lvz/znxNyVkEJPc01CNyOjjzCNbsPneY2tcCV5+pki4ga5s6rkPMc9PTIsw3+0QFTuql4JTTt/a/0Im8Bh9oyyBZZRxvgWRHcJThnPqfHblnp3zDLi1ZonaypgGGnK8Zng/E3eGObQUsuJ4ThB5kKy7oDuGZhmFV2o1qicGGrEUGMiDLANH5Zv193TU0JhHlhzL1suo6oDW6oOLONwOAw8wQ8cv+tAaiDTu2ARvRkS5odgo/dAtJVGtzUjYbma7iOHOWAvtqaWXc+qKeUULL3icaQCMByJ7F6gE7Y9sv8IUzIs97toXUAvn73plQZPs+Q2qukQWOBq7VoGspvIGMenmxdZ1BatSxw736i2wNJwg5SvKAlew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(366004)(39860400002)(136003)(396003)(7416002)(26005)(66556008)(66476007)(186003)(5660300002)(66946007)(83380400001)(4326008)(107886003)(7696005)(316002)(956004)(33964004)(8936002)(2906002)(6916009)(6486002)(2616005)(44832011)(31696002)(38100700002)(8676002)(53546011)(478600001)(86362001)(31686004)(6666004)(36756003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTREV0h2OFBKYVBpVGtsWFNZbGlsZDQ2TmNxc1l2QnFwSmxqUnRoeEVIcm9K?=
 =?utf-8?B?SlBxc2JRSEUrVGRTYURURHBESGtWb2lIdWV6UTZoMkVydlROMVpBK2tlQzMw?=
 =?utf-8?B?cHdmdWdLK21xL05WRWV1SnJNVG9ZM0w1SURsWk11ZFVyYUYxeUVRT044MjRM?=
 =?utf-8?B?RWU1VWllS2d0STZUd1piNEo5cjROQ1M4ZnVjZlpuYzlUQ1ZZVnpCbmlrd0Fi?=
 =?utf-8?B?Qk0zNUN2MTE3RmpzdUFxaDc3NWk2NDg4aFdPZzhXYldjTmdLVWhGNW5VYVBk?=
 =?utf-8?B?RzJOZzVzSloxWFR6YVkyZXZBT0RLSTdhS1RrU0FOWDg4clBUNmFlWEZNSnps?=
 =?utf-8?B?NHNiSVY3YUs1ZTBIWVRmSVJabnBFdDRBN2UvbnhOQ2NQTlpIZ3hrSllDUDNw?=
 =?utf-8?B?ZldBaGF6MnVhcjdiSTNYWFlqU1RKbUtBTzYvZHBZUm1pVDIyYlkwY0FlaHQr?=
 =?utf-8?B?MU9LSGt4NlIzTHpMVWhuSWhoWG1ENnZYVEQ2UG44N2NqczlacVhLVzNWQlVj?=
 =?utf-8?B?cU93WUhWN2VvV3JHUGFyY2Z4WFNUa1NnZU9UdmFleHNPaXI5b3NXWWNYMStD?=
 =?utf-8?B?ajFLbUFkWE5TdnFWYlpNdmp2T0hnYVk1ZjZzZ3hSU2dlWnQyR0prSWJXKzVo?=
 =?utf-8?B?VmdpZHVqWElPZkxWdCsrTGgyaFBJdUdWajNha3VESURHOUxmbnk5eVJ6UUpS?=
 =?utf-8?B?c3pnNllPajFuV2QxWUsvblhGRk0wZFhxYkdTWHd6bXJSVjArMDVBcmZkNXQ2?=
 =?utf-8?B?SFFqeDkzQnpTV1VyUmM4MDhSSnhjUk9pQW9vRGRMQmtYM1loWkdNZUR2cjRz?=
 =?utf-8?B?dS9hQmZvc1RvR0xCZG1rbm14dUxFOERRNUUvVThoMVJzQTlOQUhETVZXZGQv?=
 =?utf-8?B?b1lQUkZPbm54cklhOEE3U1c5SnFIY0RuRUJ3OVU5amhYZmxWSll5R0hTKzdI?=
 =?utf-8?B?T0d4SXBzbVVOV0pDWllsclRFb1ZZcmF0WlF6THZNdi9ZSEZsbzAyV1p0QmVl?=
 =?utf-8?B?UlNvQi9UTUM2VnArM3E1V25hVTFveHhyNVphM1Zaalp6amRHNGZBMlBjUWpr?=
 =?utf-8?B?ZVFYcm1uUGJGN3J2L2hQRkRyaXBQSGtxRnUwYndBVnpNSXA3c2xnS2tOMmtr?=
 =?utf-8?B?Q0Q5M09XcEtUMk1wUGtDd2ljK2hYZ2ZJT3dzVmRlR2h3c1BSM2FCcHk4eUlQ?=
 =?utf-8?B?VDJLcjJmUGFhZE81QWhPUnJEN2RsVnowbE50UzdheTRia3RLUGs2c3VVNmEw?=
 =?utf-8?B?VVJseEtNeEJXakJRUVJaTVRISWxXSUZEZ3FOQzlNNTZJejQyZENHcHc4ZEln?=
 =?utf-8?B?aGpSQ2ZIMHRzZjMzUVFRL3lyTE9HaXM3YXZlcEFjLzRRTmtwVXJ3d1hYbE9x?=
 =?utf-8?B?R3E3ek9zWEV4SjNoandPRmhKcEVXd08rVVhiNDUyb3N1M0Q3ZVpkK01vdGdO?=
 =?utf-8?B?UnJ2RTJ1aGRiM21ZWXhxNy9OY205TkcrSXowL1JIcGVVZG1EazgxVUlYQmd2?=
 =?utf-8?B?NUtxMnFjdTFlb01OWUN2Uk9lSUlwV2Mwdnc1dkg1Mm1PT3R6bFd5R1ozeUo4?=
 =?utf-8?B?K01yelE0ZGxDdk1jNG5ONXNkUkJCdXZNejN0c1VOUDN4M3JnNys2b2RFaVJB?=
 =?utf-8?B?cWNkeTFMWUt6bGtvaDZMdGdrMmlhd2FJZEUyMXk1U2NTdVJWeDJya242NklF?=
 =?utf-8?B?UWI2L3JYWUpjNDhmcnpzZ09IenUwWlF3UGlucmxMeE1yL2xwcFRaaXdLSm9k?=
 =?utf-8?Q?7fjgLvFFZUV6P7G7+Ez9wtErdGf+4Vg1oApNeBB?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfa8413c-7a92-4601-831a-08d95bc93aae
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2021 06:36:48.3931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FEuSKdMqtiKtpjz6gPtDP6Ph/T3Sw7bhJvS/vtq91m57PXhM4qE+eFSFXlAgQMJ+TVjU32quqVLWuTSTh595cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4488
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10071
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 mlxscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108100041
X-Proofpoint-GUID: OorrKFGbP7IgZ2i86oSXMkwpW6a5gcHL
X-Proofpoint-ORIG-GUID: OorrKFGbP7IgZ2i86oSXMkwpW6a5gcHL
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: fam@euphon.net, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 kraxel@redhat.com, si-wei.liu@oracle.com, joao.m.martins@oracle.com,
 qemu-block@nongnu.org, david@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, amit@kernel.org, michael.roth@amd.com, dgilbert@redhat.com,
 eric.auger@redhat.com, dmitrii.stepanov@cloud.ionos.com, stefanha@redhat.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, kwolf@redhat.com,
 laurent@vivier.eu, mreitz@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------FE8666284D90C0A0CADA5D86
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/7/21 8:35 AM, Markus Armbruster wrote:
> QAPI schema review only.
>
> Jonah Palmer <jonah.palmer@oracle.com> writes:
>
>> From: Laurent Vivier <lvivier@redhat.com>
>>
>> This new command lists all the instances of VirtIODevice with
>> their path and virtio type.
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
> [...]
>
>> diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
>> index 4912b97..0c89789 100644
>> --- a/qapi/qapi-schema.json
>> +++ b/qapi/qapi-schema.json
>> @@ -91,5 +91,6 @@
>>   { 'include': 'misc.json' }
>>   { 'include': 'misc-target.json' }
>>   { 'include': 'audio.json' }
>> +{ 'include': 'virtio.json' }
>>   { 'include': 'acpi.json' }
>>   { 'include': 'pci.json' }
>> diff --git a/qapi/virtio.json b/qapi/virtio.json
>> new file mode 100644
>> index 0000000..804adbe
>> --- /dev/null
>> +++ b/qapi/virtio.json
>> @@ -0,0 +1,72 @@
> Please insert at the beginning
>
>     # -*- Mode: Python -*-
>     # vim: filetype=python
>     #

Will do.

>> +##
>> +# = Virtio devices
>> +##
>> +
>> +##
>> +# @VirtioType:
>> +#
>> +# An enumeration of Virtio device types.
>> +#
>> +# Since: 6.1
> 6.2 now, here and below.

Okay, will update for entire series.

>
>> +##
>> +{ 'enum': 'VirtioType',
>> +  'data': [ 'unknown', 'virtio-net', 'virtio-blk', 'virtio-console',
>> +            'virtio-rng', 'virtio-balloon', 'virtio-iomem', 'virtio-rpmsg',
>> +            'virtio-scsi', 'virtio-9p', 'virtio-mac80211-wlan',
>> +            'virtio-serial', 'virtio-caif', 'virtio-memory-balloon',
>> +            'unknown-14', 'unknown-15', 'virtio-gpu', 'virtio-clock',
>> +            'virtio-input', 'vhost-vsock', 'virtio-crypto', 'virtio-signal-dist',
>> +            'virtio-pstore', 'virtio-iommu', 'virtio-mem', 'unknown-25',
>> +            'vhost-user-fs', 'virtio-pmem', 'unknown-28', 'virtio-mac80211-hwsim' ]
> Please limit line length to approximately 70 characters.

Fixed, sorry about that. Also, should I continue this up to 'virtio-bluetooth'? E.g:

...
'virtio-mac80211-hwsim', 'unknown-30', 'unknown-31',
'unknown-32', 'unknown-33', 'unknown-34', 'unknown-35',
'unknown-36', 'unknown-37', 'unknown-38', 'unknown-39',
'virtio-bluetooth' ]

>
>> +}
>> +
>> +##
>> +# @VirtioInfo:
>> +#
>> +# Information about a given VirtIODevice
>> +#
>> +# @path: VirtIO device canonical path.
> Peeking ahead at the example, I conclude this is a QOM path.  Please
> spell that out, e.g. "@path: the device's canonical QOM path".

Got it - will do for rest of occurrences in the series.

>
>> +#
>> +# @type: VirtIO device type.
>> +#
>> +# Since: 6.1
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
>> +# Since: 6.1
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
> [...]
>

--------------FE8666284D90C0A0CADA5D86
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/7/21 8:35 AM, Markus Armbruster
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:87o8a9e8k8.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">QAPI schema review only.

Jonah Palmer <a class="moz-txt-link-rfc2396E" href="mailto:jonah.palmer@oracle.com">&lt;jonah.palmer@oracle.com&gt;</a> writes:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Laurent Vivier <a class="moz-txt-link-rfc2396E" href="mailto:lvivier@redhat.com">&lt;lvivier@redhat.com&gt;</a>

This new command lists all the instances of VirtIODevice with
their path and virtio type.

Signed-off-by: Laurent Vivier <a class="moz-txt-link-rfc2396E" href="mailto:lvivier@redhat.com">&lt;lvivier@redhat.com&gt;</a>
Reviewed-by: Eric Blake <a class="moz-txt-link-rfc2396E" href="mailto:eblake@redhat.com">&lt;eblake@redhat.com&gt;</a>
Signed-off-by: Jonah Palmer <a class="moz-txt-link-rfc2396E" href="mailto:jonah.palmer@oracle.com">&lt;jonah.palmer@oracle.com&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
[...]

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index 4912b97..0c89789 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -91,5 +91,6 @@
 { 'include': 'misc.json' }
 { 'include': 'misc-target.json' }
 { 'include': 'audio.json' }
+{ 'include': 'virtio.json' }
 { 'include': 'acpi.json' }
 { 'include': 'pci.json' }
diff --git a/qapi/virtio.json b/qapi/virtio.json
new file mode 100644
index 0000000..804adbe
--- /dev/null
+++ b/qapi/virtio.json
@@ -0,0 +1,72 @@
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Please insert at the beginning

   # -*- Mode: Python -*-
   # vim: filetype=python
   #
</pre>
    </blockquote>
    <pre>Will do.</pre>
    <blockquote type="cite" cite="mid:87o8a9e8k8.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+##
+# = Virtio devices
+##
+
+##
+# @VirtioType:
+#
+# An enumeration of Virtio device types.
+#
+# Since: 6.1
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
6.2 now, here and below.</pre>
    </blockquote>
    <pre>Okay, will update for entire series.</pre>
    <blockquote type="cite" cite="mid:87o8a9e8k8.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+##
+{ 'enum': 'VirtioType',
+  'data': [ 'unknown', 'virtio-net', 'virtio-blk', 'virtio-console',
+            'virtio-rng', 'virtio-balloon', 'virtio-iomem', 'virtio-rpmsg',
+            'virtio-scsi', 'virtio-9p', 'virtio-mac80211-wlan',
+            'virtio-serial', 'virtio-caif', 'virtio-memory-balloon',
+            'unknown-14', 'unknown-15', 'virtio-gpu', 'virtio-clock',
+            'virtio-input', 'vhost-vsock', 'virtio-crypto', 'virtio-signal-dist',
+            'virtio-pstore', 'virtio-iommu', 'virtio-mem', 'unknown-25',
+            'vhost-user-fs', 'virtio-pmem', 'unknown-28', 'virtio-mac80211-hwsim' ]
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Please limit line length to approximately 70 characters.</pre>
    </blockquote>
    <pre>Fixed, sorry about that. Also, should I continue this up to 'virtio-bluetooth'? E.g:

...
'virtio-mac80211-hwsim', 'unknown-30', 'unknown-31',
'unknown-32', 'unknown-33', 'unknown-34', 'unknown-35',
'unknown-36', 'unknown-37', 'unknown-38', 'unknown-39',
'virtio-bluetooth' ]

</pre>
    <blockquote type="cite" cite="mid:87o8a9e8k8.fsf@dusky.pond.sub.org">
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
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Peeking ahead at the example, I conclude this is a QOM path.  Please
spell that out, e.g. &quot;@path: the device's canonical QOM path&quot;.</pre>
    </blockquote>
    <pre>Got it - will do for rest of occurrences in the series.
</pre>
    <blockquote type="cite" cite="mid:87o8a9e8k8.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+#
+# @type: VirtIO device type.
+#
+# Since: 6.1
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
+# Since: 6.1
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
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
[...]

</pre>
    </blockquote>
  </body>
</html>

--------------FE8666284D90C0A0CADA5D86--

