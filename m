Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3D63F52E8
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 23:37:28 +0200 (CEST)
Received: from localhost ([::1]:44838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIHdH-0001Pl-D5
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 17:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mIHcK-0000jT-AZ
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 17:36:28 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:21730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mIHcG-00067h-HV
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 17:36:28 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17NLZV6L029035;
 Mon, 23 Aug 2021 21:36:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=D1g1Xp47eQZXKc2r/03FJtsDulrch1PV8QtSr2OHlDo=;
 b=KjE0ZEJ7CAJ0sctTpYp7MFd7r86VJA12vZW3qYpvoBKvzcwUlTUvNryKh4ofNg48JBcG
 FxYKamZZHAwbiKDSMn7B1sdVftK1ZVOpcuOi8+SLJ+h8blelmjGTLQvt00N8FdWhOCDK
 lwvCMHxVjrtDPQshG6BZkBVngOtOyltpeNE86eYbKaCs5xMGzoNdDlj/+DUoS4jR6vi7
 3FpPDXQ8oCElBorHipY7jm2wsuQYjOhHwbltMXO7aMEfhSHQ/CXXeT1PIeXNxvAxyesw
 PZGVTiN/sWnnIe4fDjbWcWgsqq7EWx3EP0esaSmF30SJl74rvKr7WvnxfLy+4FwvKvCj YA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=D1g1Xp47eQZXKc2r/03FJtsDulrch1PV8QtSr2OHlDo=;
 b=tdf2mrbrLIzTMU3bpjhGT6p45KVcyVCoTiJABpvlilTSNn7KDfDVqhPgoHVfwwYQFkfU
 vi/Zo2j2K9Jv0c72ND12BU7Vwusu1ju/sGuJ5nWDp2A1OJRN3upZ66XV+QPD5ocTM8jK
 GYQb0C4/+IvS/ddqPNRCFLGJjeim1eBmn5fwTJsK98L20pUVz3XV3w48QMdqIxEInPRi
 fezCe4swkgF/ZQ4WnCfo/BUuYDhKcUsnNvIkK+XVXEx9goCPMS0OvKpVIhbhkFsx7+jj
 JgH9+/CTaeahD6ZRnLFUuEZWWg7OW08wMixVKEiXQdeEnw3/k0eM4xK5WprFjcQLvyY+ iw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3akwfm2qrt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Aug 2021 21:36:14 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17NLVBra149753;
 Mon, 23 Aug 2021 21:36:13 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by aserp3020.oracle.com with ESMTP id 3ajsa42h5n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Aug 2021 21:36:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H9EQt6CmVB78oIX3ieSUt7DW4CE/UEhViggZ5uzUIZZ1kVSyb+h9sSx3xtPmr9F0+dBkzLxG3t3Ik0ZqYH+Mp1Fe9KNRBsCNuJclVOaKecs4RzmnM55TgzIBxdshWYmYBDz+oRjDUkC2YbHm+tJvt2IiIDkwRHPBqtRrrFN0H5NLrR02GYhF4XLSkTBXdEYvsa2KsPHs2uPhID3x6D4NBcdjSTRN7qOEI2yj61sy0e/A4XWY+4FRjznGkkl9a3/Uw6AosddHaRylDRALGF8Mm8RdA9hecbExfv/Uvt5t+n1TtyXSgv+/iZEgrBcGAWLU4Cafc5hnR5YXRfV6ZMPmlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1g1Xp47eQZXKc2r/03FJtsDulrch1PV8QtSr2OHlDo=;
 b=DT9EwvuEola730XdZwctmP6qoKguh0OD6OMaAOllvgIRu+t5wup0WCv4FGbc+m6JF6yofHWU62kpWmiBqVmntJo7yQpaLA2E+dknr73qHv0rxQ2AcJAgP2o4kWEmJb/nsrQXpvqW3BR96jZPNuRiXnfetTln50e+1YGLiNtFEEMReJgmyxBt1CGUt9TzXUpvHVwqIW7ZWvWLFdW+2bMWzjvASCkuj0xuYzRA0Rmt6ADMwgLtFqIOjhRKSF7Ao9VL6QZeciX+qr5H4iw8UIy4nBIWC9NEwcbLpeXFnbescWIPA3cMPMYK71PEyOjSJArqFAlbzy1WHLlI4HUCVSwKow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1g1Xp47eQZXKc2r/03FJtsDulrch1PV8QtSr2OHlDo=;
 b=cIvJ/V5fLxF7MtOKJUZM7emi1lJWbK6SCQL2uFluP0q2xmvUcbgT+N2rFTk0oeQNuoGVPQYmWir2O6uNz+OaB1j8AFsBnRpnALHZUBYk+pAMCPiSxKH00IHweshQ/CQLYtug1+DestNoo1r+eGRH0LWivSnmXmSF/7bWu7+po6Y=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4242.namprd10.prod.outlook.com (2603:10b6:a03:20d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Mon, 23 Aug
 2021 21:36:11 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::5cdb:a037:dbd1:dcac]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::5cdb:a037:dbd1:dcac%6]) with mapi id 15.20.4436.024; Mon, 23 Aug 2021
 21:36:11 +0000
Subject: Re: [PATCH V6 00/27] Live Update
To: Zheng Chuan <zhengchuan@huawei.com>, qemu-devel@nongnu.org
References: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
 <6d048286-eef4-0f6a-58da-7fc7369dccf7@huawei.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <5e5821eb-ce92-f429-0ec8-985e714a171a@oracle.com>
Date: Mon, 23 Aug 2021 17:36:05 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <6d048286-eef4-0f6a-58da-7fc7369dccf7@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN4PR0501CA0139.namprd05.prod.outlook.com
 (2603:10b6:803:2c::17) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.39.217.55] (138.3.201.55) by
 SN4PR0501CA0139.namprd05.prod.outlook.com (2603:10b6:803:2c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.6 via Frontend
 Transport; Mon, 23 Aug 2021 21:36:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a5ddd75-1cb8-429a-093c-08d9667e0681
X-MS-TrafficTypeDiagnostic: BY5PR10MB4242:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB42426C7F6A0D605B8DD1E469F9C49@BY5PR10MB4242.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TiX/qdbC4ft6tCDkpHyKEa35YuapcfyIMGpO7C2xOva874oOzRfRbLUpv9jZbWnOHS6JX27hLTOXPJyGCYsVUIwULHZEauGiei4BRagWrqJwv9WcTkNll42lqpr5Fhb7goq+fgO5u3uRTKySNEzBzDLR0PTdKvqvRQk4zVMjHlQLTT9apTK/iH/duQGiUXRky0mZz6srD0PdO7prx3s0NJ+K6iXnDYO5beKQ0++lYf7rqIrt62s9PNHp8kqeM34LZOZR00E89DHmjMr4857dwevRO5Qg4WxKqnzgaf8MrbvQh31pncsPYGTSToRL3Ge/DubyFdw7U7HlJwehw0GNGA/A/7gGqNYtJna/4W+XznSo8GTLSNUXUyCdJ18bk5b+MSII7tFq62eu3hktEMAWtj/c/OxBAfZMXXijwSFmugu6dk+gKCrVRvIIF2lvPlPkNVjsAKqGRIHlxfQZu9OoS5JMVVoxFC+k4BVnWscn72PNQc6fvWuD8fMcLmzuPeKRAhJvKTz7NSN4YsGCghrDmD5LQzAQXL8Ikv6yWX02wGoInzBJ1vkn9mUruKzdsrUNk+cMuA6DcxxIav97GF1hz5Q9bPwSgj1E3fDpT8b5a3Sy5iDNZav/Roo+GlGZOGjptmkpeXWv+wR7by3a/2Qx6LLzScIPmHH1vP2dA/o/l2HoC7QZtZ/mdsejx272YpSWTSY+q4OktIr5qcLO3Zi3cmMgxptL7tlRKQIVCI5h19k6LBI0+yyC88Nf+katrNudXdbqjwaX5Vv5xF/l5lJlkcUxRz2NVDMa2Il559xqGOzolFsnFU+tXVVNIKUGvCfJn9NyCtt/y7rzNP6tHxFc8dgkRbDM74tNmPqVOy7mCgs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(366004)(136003)(396003)(39860400002)(6486002)(83380400001)(956004)(36756003)(44832011)(26005)(2616005)(107886003)(31686004)(7416002)(186003)(2906002)(8676002)(36916002)(38100700002)(30864003)(316002)(54906003)(31696002)(66556008)(4326008)(966005)(66476007)(66946007)(5660300002)(86362001)(8936002)(15650500001)(53546011)(478600001)(6666004)(16576012)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTB2cVJRVnBmZ1VSUzNUWG9McTg1OWluM29YbTJWZ0tiTTdtdW9MNWpZTHNR?=
 =?utf-8?B?K3JBaUlQNTRmcFFaQldEZzJsVFV3THBrdkppWjk3NzNYNzZZY0JTa3pxKzVx?=
 =?utf-8?B?TFpWQ3lLYVZQd3FQeTdaRHJ4OG9VUGIxbElDQWdvRS83dElnZVN0TU1YWUZp?=
 =?utf-8?B?M3lmOExuaGNGRGI2MzNLU0ZZb1p5TjV4bVQ1bGFRQ3owVENCckRvbEd1NzhB?=
 =?utf-8?B?cGFHdUt1aW5UaDdQM3pmVitOeDJidTI4SHBMbGhINHkrOE92UnZTT2VvUnV1?=
 =?utf-8?B?aTZEVUd2UmhiZFowZmFFSjhBM2U2c2daekpGNXB4Zk5LQy90dEMrYkdmN202?=
 =?utf-8?B?Z0h3eWpyTEtDckhNTU9iYmpHZHB4REowaURKSm9Dbyt0MCtXZFc4TXVPb3cz?=
 =?utf-8?B?K1B6eXI2OUtpazdVRm9ta0hIcXYzczR1USt0MGR4OGFoK2pOaWFmM1BIWnpV?=
 =?utf-8?B?UTlWZm9BQ0Q0TlBwZWxweHpsQlVWb3drZXNZQ2JNZE81bDJCRlhJTjVEUDVX?=
 =?utf-8?B?WEJCUnhHK0F4cmY0SHZXK05yR3hrY0VsRXJ0bUJnNklZL2RkUTVSSVM4d3JM?=
 =?utf-8?B?d3RrMTkxNmVrZDZzTEFXeW1kamFURkhaNWtmZ2NZVWZ5VGgvSHQwS014Uis1?=
 =?utf-8?B?c01TUDRqWEJKZUlNWVRQM2YzZUNlRlNKeDJiUC9JN2FRVWJia0RYMDBPMUE4?=
 =?utf-8?B?TGtYS3pReEpLY1Vlc2kxV0tzZXV2RXlOckY4T2xRZUpqbG1hWnVQT2tTZDFF?=
 =?utf-8?B?cWR3clBMOWl5b2VqeGZvUGQvdTU1WVQvUFZaTVNuUTAzOGdwOFN1NUt0TUls?=
 =?utf-8?B?VWhRenhnbUhueFlLeTQ2UC91aW5IMlkrMHZMNEx3aStOdFc5aTNJTkk0QjlV?=
 =?utf-8?B?bTlVZCtIeW5FRENoamcxanRhQkF0SlV4YXRzaFlkY1N1L3NNK3B6WVBJcWJU?=
 =?utf-8?B?YVZWcEV0L2lpcVJReXlHVnRPeDRwYndaU2FYVzh0MnBVcWszT0t4bDgrTUdU?=
 =?utf-8?B?dFdkYWZoTkZmdmhaYURmQjZwaEhOR3RRYkNTeGZFRVBsWENNZ2ZabU5CdnVp?=
 =?utf-8?B?blpJWDhma21ZbS9BZ2pFWXFpeUxEdmx0SStCcVFZd1k2T1ROdkNqM0Z6YVJD?=
 =?utf-8?B?ZEt5QW9HTzVlNzJqQWVkM0pnaG5rK3VmRm1lLzJWclVCTU03bVJGR0VNSk9B?=
 =?utf-8?B?dmlJendpZ1VCeWtycUhHSnN0MXJ3RUVLeGRoRjExbkFBNTNHSHdDakEzNXRl?=
 =?utf-8?B?Y1hSakxPS3FqclVSZmRNRTNKR3VKMXJVWGJBTHdQOWRUeDFvUWJZZ2tRUEg5?=
 =?utf-8?B?ZHVaMmt0clpoT25McXJWV1pLNEcvRGxpQ3NZdjNuM1NRYVdKYUNDa2FkYStQ?=
 =?utf-8?B?NFQ2bmwyQzc4QVg3bDJGM0svRFg2LzgwNkxyd3NDa25ja0tTaXR5aUp1ZDNz?=
 =?utf-8?B?WU1oc01QK3pmNjMwMTlpY2pzYzFDVXBOMmp5VGZaVUN4alR2bEUrd3hyNEV4?=
 =?utf-8?B?dUJ5bmU4MFl0eXhXTlljYi9vbXRXSTBoTGtDOUVoa2MyV09DSDY4MzExYWh1?=
 =?utf-8?B?d3dEVFlSRzArS2hFM3E0SkRIQVpuOXp2VVBoQmIzTVhPbXp2NnhNNHI2V3E4?=
 =?utf-8?B?YnBaTW1CT0xRRlRqbWg4ZTlCMU1HYndpZDRPY1oxdWpqMkcyL1hFbHlpbUIy?=
 =?utf-8?B?SEF3bmV4eTBIaGZEUmt5U0RqdzIzL0ZsUTA4bG90T1lGSDJtKzBZaVdZK1Bl?=
 =?utf-8?Q?TB7qxLXT1Dwl6dhFUbv9pLT4ZaJCWqPuFQb9UiG?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a5ddd75-1cb8-429a-093c-08d9667e0681
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 21:36:11.2876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jzf9tsTTvTdLhTDNudF/Z7cbTHNthQrCqbe6Q0gUK6GAwY/FehKJTXLkbGVqXwx0MlslSEcAR8BT6fY0LvXve1piaS6K/Jvh4YA3zjYM6tk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4242
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10085
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108230146
X-Proofpoint-ORIG-GUID: 5U62F4mW4-43Od04tOv8X5PfFux2iPTW
X-Proofpoint-GUID: 5U62F4mW4-43Od04tOv8X5PfFux2iPTW
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.023, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Zheng, testing aarch64 is on our todo list. We will run this case and try to 
reproduce the failure.  Thanks for the report.

- Steve

On 8/21/2021 4:54 AM, Zheng Chuan wrote:
> Hi, steve
> 
> It seems the VM will stuck after cpr-load on AArch64 environment？
> 
> My AArch64 environment and test steps:
> 1. linux kernel: 5.14-rc6
> 2. QEMU version: v6.1.0-rc2 (patch your patchset), and configure with `../configure --target-list=aarch64-softmmu --disable-werror --enable-kvm` 4. Steps to live update:
> # ./build/aarch64-softmmu/qemu-system-aarch64 -machine virt,accel=kvm,gic-version=3,memfd-alloc=on -nodefaults -cpu host -m 2G -smp 1 -drive file=/usr/share/edk2/aarch64/QEMU_EFI-pflash.raw,if=pflash,format=raw,readonly=on
> -drive file=<path/to/vm.qcow2>,format=qcow2,if=none,id=drive_image1
> -device virtio-blk-pci,id=image1,drive=drive_image1 -vnc :10 -device
> virtio-gpu,id=video0 -device piix3-usb-uhci,id=usb -device
> usb-tablet,id=input0,bus=usb.0,port=1 -device
> usb-kbd,id=input1,bus=usb.0,port=2 -monitor stdio
> (qemu) cpr-save /tmp/qemu.save restart
> (qemu) cpr-exec ./build/aarch64-softmmu/qemu-system-aarch64 -machine virt,accel=kvm,gic-version=3,memfd-alloc=on -nodefaults -cpu host -m 2G -smp 1 -drive file=/usr/share/edk2/aarch64/QEMU_EFI-pflash.raw,if=pflash,format=raw,readonly=on
> -drive file=<path/to/vm.qcow2>,format=qcow2,if=none,id=drive_image1
> -device virtio-blk-pci,id=image1,drive=drive_image1 -vnc :10 -device
> virtio-gpu,id=video0 -device piix3-usb-uhci,id=usb -device
> usb-tablet,id=input0,bus=usb.0,port=1 -device
> usb-kbd,id=input1,bus=usb.0,port=2 -monitor stdio -S
> (qemu) QEMU 6.0.92 monitor - type 'help' for more information
> (qemu) cpr-load /tmp/qemu.save
> 
> Does I miss something?
> 
> On 2021/8/7 5:43, Steve Sistare wrote:
>> Provide the cpr-save, cpr-exec, and cpr-load commands for live update.
>> These save and restore VM state, with minimal guest pause time, so that
>> qemu may be updated to a new version in between.
>>
>> cpr-save stops the VM and saves vmstate to an ordinary file.  It supports
>> any type of guest image and block device, but the caller must not modify
>> guest block devices between cpr-save and cpr-load.  It supports two modes:
>> reboot and restart.
>>
>> In reboot mode, the caller invokes cpr-save and then terminates qemu.
>> The caller may then update the host kernel and system software and reboot.
>> The caller resumes the guest by running qemu with the same arguments as the
>> original process and invoking cpr-load.  To use this mode, guest ram must be
>> mapped to a persistent shared memory file such as /dev/dax0.0, or /dev/shm
>> PKRAM as proposed in https://lore.kernel.org/lkml/1617140178-8773-1-git-send-email-anthony.yznaga@oracle.com.
>>
>> The reboot mode supports vfio devices if the caller first suspends the
>> guest, such as by issuing guest-suspend-ram to the qemu guest agent.  The
>> guest drivers' suspend methods flush outstanding requests and re-initialize
>> the devices, and thus there is no device state to save and restore.
>>
>> Restart mode preserves the guest VM across a restart of the qemu process.
>> After cpr-save, the caller passes qemu command-line arguments to cpr-exec,
>> which directly exec's the new qemu binary.  The arguments must include -S
>> so new qemu starts in a paused state and waits for the cpr-load command.
>> The restart mode supports vfio devices by preserving the vfio container,
>> group, device, and event descriptors across the qemu re-exec, and by
>> updating DMA mapping virtual addresses using VFIO_DMA_UNMAP_FLAG_VADDR and
>> VFIO_DMA_MAP_FLAG_VADDR as defined in https://lore.kernel.org/kvm/1611939252-7240-1-git-send-email-steven.sistare@oracle.com/
>> and integrated in Linux kernel 5.12.
>>
>> To use the restart mode, qemu must be started with the memfd-alloc option,
>> which allocates guest ram using memfd_create.  The memfd's are saved to
>> the environment and kept open across exec, after which they are found from
>> the environment and re-mmap'd.  Hence guest ram is preserved in place,
>> albeit with new virtual addresses in the qemu process.
>>
>> The caller resumes the guest by invoking cpr-load, which loads state from
>> the file. If the VM was running at cpr-save time, then VM execution resumes.
>> If the VM was suspended at cpr-save time (reboot mode), then the caller must
>> issue a system_wakeup command to resume.
>>
>> The first patches add reboot mode:
>>   - memory: qemu_check_ram_volatile
>>   - migration: fix populate_vfio_info
>>   - migration: qemu file wrappers
>>   - migration: simplify savevm
>>   - vl: start on wakeup request
>>   - cpr: reboot mode
>>   - cpr: reboot HMP interfaces
>>
>> The next patches add restart mode:
>>   - memory: flat section iterator
>>   - oslib: qemu_clear_cloexec
>>   - machine: memfd-alloc option
>>   - qapi: list utility functions
>>   - vl: helper to request re-exec
>>   - cpr: preserve extra state
>>   - cpr: restart mode
>>   - cpr: restart HMP interfaces
>>   - hostmem-memfd: cpr for memory-backend-memfd
>>
>> The next patches add vfio support for restart mode:
>>   - pci: export functions for cpr
>>   - vfio-pci: refactor for cpr
>>   - vfio-pci: cpr part 1 (fd and dma)
>>   - vfio-pci: cpr part 2 (msi)
>>   - vfio-pci: cpr part 3 (intx)
>>
>> The next patches preserve various descriptor-based backend devices across
>> cprexec:
>>   - vhost: reset vhost devices for cpr
>>   - chardev: cpr framework
>>   - chardev: cpr for simple devices
>>   - chardev: cpr for pty
>>   - chardev: cpr for sockets
>>   - cpr: only-cpr-capable option
>>
>> Here is an example of updating qemu from v4.2.0 to v4.2.1 using
>> restart mode.  The software update is performed while the guest is
>> running to minimize downtime.
>>
>> window 1                                        | window 2
>>                                                 |
>> # qemu-system-x86_64 ...                        |
>> QEMU 4.2.0 monitor - type 'help' ...            |
>> (qemu) info status                              |
>> VM status: running                              |
>>                                                 | # yum update qemu
>> (qemu) cpr-save /tmp/qemu.sav restart           |
>> (qemu) cpr-exec qemu-system-x86_64 -S ...       |
>> QEMU 4.2.1 monitor - type 'help' ...            |
>> (qemu) info status                              |
>> VM status: paused (prelaunch)                   |
>> (qemu) cpr-load /tmp/qemu.sav                   |
>> (qemu) info status                              |
>> VM status: running                              |
>>
>>
>> Here is an example of updating the host kernel using reboot mode.
>>
>> window 1                                        | window 2
>>                                                 |
>> # qemu-system-x86_64 ...mem-path=/dev/dax0.0 ...|
>> QEMU 4.2.1 monitor - type 'help' ...            |
>> (qemu) info status                              |
>> VM status: running                              |
>>                                                 | # yum update kernel-uek
>> (qemu) cpr-save /tmp/qemu.sav restart           |
>> (qemu) quit                                     |
>>                                                 |
>> # systemctl kexec                               |
>> kexec_core: Starting new kernel                 |
>> ...                                             |
>>                                                 |
>> # qemu-system-x86_64 -S mem-path=/dev/dax0.0 ...|
>> QEMU 4.2.1 monitor - type 'help' ...            |
>> (qemu) info status                              |
>> VM status: paused (prelaunch)                   |
>> (qemu) cpr-load /tmp/qemu.sav                   |
>> (qemu) info status                              |
>> VM status: running                              |
>>
>> Changes from V1 to V2:
>>   - revert vmstate infrastructure changes
>>   - refactor cpr functions into new files
>>   - delete MADV_DOEXEC and use memfd + VFIO_DMA_UNMAP_FLAG_SUSPEND to
>>     preserve memory.
>>   - add framework to filter chardev's that support cpr
>>   - save and restore vfio eventfd's
>>   - modify cprinfo QMP interface
>>   - incorporate misc review feedback
>>   - remove unrelated and unneeded patches
>>   - refactor all patches into a shorter and easier to review series
>>
>> Changes from V2 to V3:
>>   - rebase to qemu 6.0.0
>>   - use final definition of vfio ioctls (VFIO_DMA_UNMAP_FLAG_VADDR etc)
>>   - change memfd-alloc to a machine option
>>   - Use qio_channel_socket_new_fd instead of adding qio_channel_socket_new_fd
>>   - close monitor socket during cpr
>>   - fix a few unreported bugs
>>   - support memory-backend-memfd
>>
>> Changes from V3 to V4:
>>   - split reboot mode into separate patches
>>   - add cprexec command
>>   - delete QEMU_START_FREEZE, argv_main, and /usr/bin/qemu-exec
>>   - add more checks for vfio and cpr compatibility, and recover after errors
>>   - save vfio pci config in vmstate
>>   - rename {setenv,getenv}_event_fd to {save,load}_event_fd
>>   - use qemu_strtol
>>   - change 6.0 references to 6.1
>>   - use strerror(), use EXIT_FAILURE, remove period from error messages
>>   - distribute MAINTAINERS additions to each patch
>>
>> Changes from V4 to V5:
>>   - rebase to master
>>
>> Changes from V5 to V6:
>>   vfio:
>>   - delete redundant bus_master_enable_region in vfio_pci_post_load
>>   - delete unmap.size warning
>>   - fix phys_config memory leak
>>   - add INTX support
>>   - add vfio_named_notifier_init() helper
>>   Other:
>>   - 6.1 -> 6.2
>>   - rename file -> filename in qapi
>>   - delete cprinfo.  qapi introspection serves the same purpose.
>>   - rename cprsave, cprexec, cprload -> cpr-save, cpr-exec, cpr-load
>>   - improve documentation in qapi/cpr.json
>>   - rename qemu_ram_volatile -> qemu_ram_check_volatile, and use
>>     qemu_ram_foreach_block
>>   - rename handle -> opaque
>>   - use ERRP_GUARD
>>   - use g_autoptr and g_autofree, and glib allocation functions
>>   - conform to error conventions for bool and int function return values
>>     and function names.
>>   - remove word "error" in error messages
>>   - rename as_flat_walk and its callback, and add comments.
>>   - rename qemu_clr_cloexec -> qemu_clear_cloexec
>>   - rename close-on-cpr -> reopen-on-cpr
>>   - add strList utility functions
>>   - factor out start on wakeup request to a separate patch
>>   - deleted unnecessary layer (cprsave etc) and squashed QMP patches
>>   - conditionally compile for CONFIG_VFIO
>>
>> Steve Sistare (24):
>>   memory: qemu_check_ram_volatile
>>   migration: fix populate_vfio_info
>>   migration: qemu file wrappers
>>   migration: simplify savevm
>>   vl: start on wakeup request
>>   cpr: reboot mode
>>   memory: flat section iterator
>>   oslib: qemu_clear_cloexec
>>   machine: memfd-alloc option
>>   qapi: list utility functions
>>   vl: helper to request re-exec
>>   cpr: preserve extra state
>>   cpr: restart mode
>>   cpr: restart HMP interfaces
>>   hostmem-memfd: cpr for memory-backend-memfd
>>   pci: export functions for cpr
>>   vfio-pci: refactor for cpr
>>   vfio-pci: cpr part 1 (fd and dma)
>>   vfio-pci: cpr part 2 (msi)
>>   vfio-pci: cpr part 3 (intx)
>>   chardev: cpr framework
>>   chardev: cpr for simple devices
>>   chardev: cpr for pty
>>   cpr: only-cpr-capable option
>>
>> Mark Kanda, Steve Sistare (3):
>>   cpr: reboot HMP interfaces
>>   vhost: reset vhost devices for cpr
>>   chardev: cpr for sockets
>>
>>  MAINTAINERS                   |  12 ++
>>  backends/hostmem-memfd.c      |  21 +--
>>  chardev/char-mux.c            |   1 +
>>  chardev/char-null.c           |   1 +
>>  chardev/char-pty.c            |  14 +-
>>  chardev/char-serial.c         |   1 +
>>  chardev/char-socket.c         |  36 +++++
>>  chardev/char-stdio.c          |   8 ++
>>  chardev/char.c                |  43 +++++-
>>  gdbstub.c                     |   1 +
>>  hmp-commands.hx               |  50 +++++++
>>  hw/core/machine.c             |  19 +++
>>  hw/pci/msix.c                 |  20 ++-
>>  hw/pci/pci.c                  |   7 +-
>>  hw/vfio/common.c              |  79 +++++++++--
>>  hw/vfio/cpr.c                 | 160 ++++++++++++++++++++++
>>  hw/vfio/meson.build           |   1 +
>>  hw/vfio/pci.c                 | 301 +++++++++++++++++++++++++++++++++++++++---
>>  hw/vfio/trace-events          |   1 +
>>  hw/virtio/vhost.c             |  11 ++
>>  include/chardev/char.h        |   6 +
>>  include/exec/memory.h         |  39 ++++++
>>  include/hw/boards.h           |   1 +
>>  include/hw/pci/msix.h         |   5 +
>>  include/hw/pci/pci.h          |   2 +
>>  include/hw/vfio/vfio-common.h |   8 ++
>>  include/hw/virtio/vhost.h     |   1 +
>>  include/migration/cpr.h       |  31 +++++
>>  include/monitor/hmp.h         |   3 +
>>  include/qapi/util.h           |  28 ++++
>>  include/qemu/osdep.h          |   1 +
>>  include/sysemu/runstate.h     |   2 +
>>  include/sysemu/sysemu.h       |   1 +
>>  linux-headers/linux/vfio.h    |   6 +
>>  migration/cpr-state.c         | 215 ++++++++++++++++++++++++++++++
>>  migration/cpr.c               | 176 ++++++++++++++++++++++++
>>  migration/meson.build         |   2 +
>>  migration/migration.c         |   5 +
>>  migration/qemu-file-channel.c |  36 +++++
>>  migration/qemu-file-channel.h |   6 +
>>  migration/savevm.c            |  21 +--
>>  migration/target.c            |  24 +++-
>>  migration/trace-events        |   5 +
>>  monitor/hmp-cmds.c            |  68 ++++++----
>>  monitor/hmp.c                 |   3 +
>>  monitor/qmp.c                 |   3 +
>>  qapi/char.json                |   7 +-
>>  qapi/cpr.json                 |  76 +++++++++++
>>  qapi/meson.build              |   1 +
>>  qapi/qapi-schema.json         |   1 +
>>  qapi/qapi-util.c              |  37 ++++++
>>  qemu-options.hx               |  40 +++++-
>>  softmmu/globals.c             |   1 +
>>  softmmu/memory.c              |  46 +++++++
>>  softmmu/physmem.c             |  55 ++++++--
>>  softmmu/runstate.c            |  38 +++++-
>>  softmmu/vl.c                  |  18 ++-
>>  stubs/cpr-state.c             |  15 +++
>>  stubs/cpr.c                   |   3 +
>>  stubs/meson.build             |   2 +
>>  trace-events                  |   1 +
>>  util/oslib-posix.c            |   9 ++
>>  util/oslib-win32.c            |   4 +
>>  util/qemu-config.c            |   4 +
>>  64 files changed, 1732 insertions(+), 111 deletions(-)
>>  create mode 100644 hw/vfio/cpr.c
>>  create mode 100644 include/migration/cpr.h
>>  create mode 100644 migration/cpr-state.c
>>  create mode 100644 migration/cpr.c
>>  create mode 100644 qapi/cpr.json
>>  create mode 100644 stubs/cpr-state.c
>>  create mode 100644 stubs/cpr.c
>>
> 

