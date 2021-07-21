Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D592C3D12B9
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 17:44:39 +0200 (CEST)
Received: from localhost ([::1]:37978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6EOj-00053a-Di
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 11:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1m6EMw-0003qu-BH
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 11:42:46 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:37118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1m6EMt-0006Ed-7E
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 11:42:45 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16LFgGP9026604; Wed, 21 Jul 2021 15:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=HmDj5/tfKu7CpXpzzx39kfWru1irRWa0OVr8xLTVMtM=;
 b=A4n0p7ME5XRH5xKJzVflU5k4domgEHSXXOPf8J6nCay8Z7IJ1jUT91BRa16zxex60C+R
 2A+fePhvVXQMAuEp77JjIWs67EYgMgocJzv3/z/cXRqNZigE06f2x/O27rUYQPXBqDgz
 PzwdHng9nSsSfzoaZpqSzpkVpH5AJUvhL+DsUfNOg3vJL3PlEw+wILIVfh/5ee4dsyxe
 9CoWVSM2tFNI/bD/DroJLUFhJRvy73HJNMtrYEGcl/nuUWeDAk11RTFMkwmc6mCwE5Kk
 FNRQnGl1MDNYW0mfS7ajic3eU1dJVHKZnbKzu40OX7YXqdCKGiABqas3FmR8lkyDWH/D Bg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=HmDj5/tfKu7CpXpzzx39kfWru1irRWa0OVr8xLTVMtM=;
 b=0UfZrn4TOJqLrVWVoyfOrNnzNMKjpK6ddtzb6RXgsb3SUYZ05S/CiY6PWBb3UkQSwNGg
 u05PY0I6K/ioPsoJAubNtc/E8xexMfDG6RmbaytcP0EKCKJX3htwhOoICcTyurkHGhLm
 eh5RVfSwjlPJ3bfYMVE77kmEJyVSFYC6hs+MSAV7rK4KlHaKyOBG6tBq5/eEB5VNm5Qn
 J4gKUiONsretq++rwqhXzOWNiHty2WmcFfmLe18pNxIwbV3o88Hax2aJ0lSphCZEE66Z
 YzXxAxG3F+1xgK0CZDmvjK4eTCOJJz6TUzwvsdPDv/qcVR+AN/ZXaGDuABcmlnXMIa7R zg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39xmwgr95b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Jul 2021 15:42:40 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16LFeRcu196551;
 Wed, 21 Jul 2021 15:42:39 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 by userp3020.oracle.com with ESMTP id 39v8yxmw0m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Jul 2021 15:42:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMiJ+VbF6orXut2La6IXf0VIWixoKpACQegztYiGiMkoQKKVXoLLKukNCtllpO2oH0Zbr/1zJH5K0n6oWuRfO+8gFwLIw3d4NlJLqkIscbO2zExeRbn0dYy0il45/C5mDJBZWYj6R+ajbD+bPGfPh9j3oCAgCviW4GEWEvI+RJfjNfUsNxmR6ihHwjnHYAV7o90SvXT+8x4NdCtXat8A9qlSmukdgHeU36YOfPPm92rvzk1cbqXx5jZNr4X2zLWPUz0gaSQl47ebHvZ54xrKoXjEihcYjPk4LLgy9QVl+oLwPw5PjzjH5MCoUwvdMFhqvpCqQ11TTL6XnEjUH5/X3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HmDj5/tfKu7CpXpzzx39kfWru1irRWa0OVr8xLTVMtM=;
 b=S2Qo2SavtsUBX3L4B0im+UpKKoA7DYOSm+0n7IS3jza7/C2p1tAIGNbpUj/cboRLLg0/ZJ5KkMgCP5aHYurr4sa8sFojQA3H050L0QUbsiKjx1Z61zOefQFNf/CloIxmze2v0WBFU2W+eEc2unokEQO2/B9zC0DtIhNwXax+EN3uuVmxS3t8n21QJTTKQyq/aOZsovqotFC+LI5FH2kAm/wdjTEf5xykndTL7FqF3IqUlxy9GZ1KBf3cIdEkmcb2a10LI9mzaRXf6wyQiB1AmF9Yb27MdJmexOi1pxmseU7+op+o84uafwZE5QBChKZRvK8hu3/lrgHAQSgQY+Nfrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HmDj5/tfKu7CpXpzzx39kfWru1irRWa0OVr8xLTVMtM=;
 b=YChy5m/oI/9v7AibCUiAoodg07qh3LTp2U0CCBvToU8Py9+3JBps0G8cHt8huj8X4m9/PuPqvEmzG9O8NDn96sD72A4kaAljxk8ee1/RE6nPuIcBFyE/0Z6WWtn2dOyzqrr/D8s3PSxs9oI4/TE5XA8jc0+7QIavXy50oewzyOw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com (2603:10b6:a03:2da::19)
 by BYAPR10MB3656.namprd10.prod.outlook.com (2603:10b6:a03:11e::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Wed, 21 Jul
 2021 15:42:36 +0000
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::d1ad:b140:4d55:67a5]) by SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::d1ad:b140:4d55:67a5%9]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 15:42:36 +0000
Subject: Re: [PATCH v5 02/10] ACPI ERST: specification for ERST support
To: Igor Mammedov <imammedo@redhat.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
 <1625080041-29010-3-git-send-email-eric.devolder@oracle.com>
 <CO1PR10MB453117598D1ED99EB0A7AA3B97019@CO1PR10MB4531.namprd10.prod.outlook.com>
 <20210719170244.7402e008@redhat.com>
From: Eric DeVolder <eric.devolder@oracle.com>
Message-ID: <c0b0a60a-bd4e-ef2c-d398-bef96d8731dc@oracle.com>
Date: Wed, 21 Jul 2021 10:42:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210719170244.7402e008@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY4PR2201CA0024.namprd22.prod.outlook.com
 (2603:10b6:910:5f::34) To SJ0PR10MB4542.namprd10.prod.outlook.com
 (2603:10b6:a03:2da::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by CY4PR2201CA0024.namprd22.prod.outlook.com
 (2603:10b6:910:5f::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24 via Frontend
 Transport; Wed, 21 Jul 2021 15:42:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21b66d27-fbbf-4718-3754-08d94c5e2a16
X-MS-TrafficTypeDiagnostic: BYAPR10MB3656:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB36569FC21899D3D9B6098BD097E39@BYAPR10MB3656.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZXEkQAG3Y2ND0l+7fDOGix04HZW2X3RIJsg+c8mYKAHAKZdEsga2O9D1dIxVyOz/95MnUkkPmA24OpFBNFAokGPNXmc60E0clGv/01bVJUjXLR9LCLqfKnsPcXhfnE1yjtiVHMYBnVY5gQN3cjq+HDsW0w+ssercFdY6iaswVsCfMYcNXScuEwTNbkVjlCIUzU5/e+YVW0EWTfKOAzmooFertgb3Dvg8ioz7IT819GVcBu0qByV9SN06WcRITVSdgHvg1jE9Ed1wwrxXr6/2mCj/9ctW78dPm/4pZvdugtHxwc/VF+rcedGsN9LnSUrBsrIXMj9V+Fn500s0fOnD+uxlIK0c2Qe7sjTrhQ77UtYvXHmQyNnReDxlopQDnBMpKMdb1GKfYuv93rXjLGihJTfIzfTYid2+ogaeYhJvHVeD/Ajcrz5uvgCHPUgvJP/RQiXyNw66lmAZ5V6PRClBgVpfKJDA/Dx8dDfAN7hoYTbbxN3brPQiC1EZOdcAXoeFTwj7fG/sCkxkFLFRosG89GpgKdu+vMUD66FSUYpBuPz6lChqO2TdrcIt4dVw7jmwbWbzV1FVDVZ5vdtcvG0PiqNu3rX/ZCmkuYysK1+5uIxWETazKZP8kVua7xwQ+XLN/mrcbLm2Sd1aE012IT70gAJBOzaqMaFofY0g3CBUObnW5oESJ95nFQ2E6kjobAg6A9EpPl91zPF5lguq6tcPvWeWmx0Jq11PeFAiO0grq3QdwPYF/9Pnbjd994Sn99oXrQmB0945cfdKgoD8vxPEzqRE5LzJfgRihDZ8410XzKEW7YsV1rwPTzHo8YW/BHQe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4542.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(396003)(376002)(136003)(366004)(2906002)(31686004)(186003)(45080400002)(83380400001)(8676002)(316002)(86362001)(2616005)(54906003)(31696002)(6486002)(38100700002)(36756003)(66556008)(66476007)(66946007)(4326008)(6916009)(966005)(478600001)(30864003)(53546011)(8936002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnkzR1JFMzYza2k2cWxXc1FGd3hEUDR1c1dWOE9ad2FMUmFQT0gyM205SzlN?=
 =?utf-8?B?cERLWkdJNFZJRTQ3dzQwS01yekZ1QnZHYVRzOVlKZWI0aHd4U3RHLzlLRU1k?=
 =?utf-8?B?L2c2bEpHUGJLZWlEaDU0bGQ0d3Q0SVF6ZDY1ajdsNzE4djUya1hPMXkxeDND?=
 =?utf-8?B?WEhSREJGU1laSXo3YnlaUzZBSkI0cHJIU1FIY0VpQk12a3FhU1lYK2pTV296?=
 =?utf-8?B?UVRGNm5ZaXNvdVJhUG9hRWxhQm03ZldBVkJ4MU9kYTZDYlV3NnJlWisvSEhW?=
 =?utf-8?B?ZlNuZFhmN295U1NTaW16cktIajdvME9na1RDV2tuMUpmRGxyZXltMG4weEJG?=
 =?utf-8?B?S2FlbzA4WWRrc05UalNDN1dzeDVkNHB3UmtReitwckIvODFwL3NNMHFZVThW?=
 =?utf-8?B?VS9IM1J4UklrcWlUNUJ3U2owc2tHVmNBQkUrYWQ5U2NRMFg2bXZiMUpjRFRD?=
 =?utf-8?B?ck4wYmJCd3p4UnJlbWM4ckE5SjVaai82NnQ4U253MUJXcmV0NjdBWTI5c3k3?=
 =?utf-8?B?UnV0QnBQWi9xSUUreXBWVHdMRVVPZ01mTEJtWVFmb0ZKSC9KTDJGQk9xemlN?=
 =?utf-8?B?VWVGK2lEcjFFTEF4eTA3eHEzT0prOWNRcS9wNHZuVWc1cWRzSlVNdWJjK1R4?=
 =?utf-8?B?czE3QmJTUG9yc0lIV25xVHBBYzk1dWFYTFpxVk5YRDFCR1VjUlFKUU41RHRz?=
 =?utf-8?B?R01LS0hSQW5kNkkySzRSZVE1T1plSC9iWENQcVhNaVZpZ0VJQklQS2pCTkpG?=
 =?utf-8?B?Wm9ITytEN0NrdjM4a1NxUXFEeHlaS2s2SUY2OGg1dk54Zzhlb2VUTnJWYW0w?=
 =?utf-8?B?VFYybUdMSmM5SnJUSFNlSlYra3NaMlNrbW5hd3dpdnpLVS96MWp5TkVQT0pu?=
 =?utf-8?B?MW1CRnNyVy9xbGxCcVp3WlprQ0I3NlVNNXJtbjRjUlZSK2FXd2o0R1BjSVNE?=
 =?utf-8?B?RUY5eFVKOVh5VTA0OURLN0s0Y2xZa0cyaUR0TDNoUWpSbVUzMWdLL3cvOEQ5?=
 =?utf-8?B?eG44MVNkWDMzbzJrdE1UZjNRQVdFTGdGbEcrZXU5eXBsZkJyZ0pQQnVudWJI?=
 =?utf-8?B?UWduQWxiM3hVRjRnZzl6T1B3K1UrdnZiZjMxVXNuQW9EeVdORW9iVno5dVNV?=
 =?utf-8?B?WERSVnVWTW5jbWFwdk1kU0plczJGRXhkV3VEY3laSDNqS3IxS2JOVWhOeEZG?=
 =?utf-8?B?R3FsWWovL0V0UXVoaWU1T2lkMHpZalk4STRzOVJxT0g1SkdQYnNYbnNZTnZJ?=
 =?utf-8?B?TmVnd1VlaFE2MVRIbWMvQTVnT00ydW93RUJHSHM5M3dKQmFZeTJmazlWTC82?=
 =?utf-8?B?bnU0MjBVYnNQdXZXWUsrZ3VVeDhRNjdUWTMrSDlGQlNkRkZEeHRaaksvd2Ny?=
 =?utf-8?B?OWlVZ2ZWb2wvWDY1cDBSK3BxTkFJSUtEUTl6TG13VC9BODhlbzN6aGNXNjBT?=
 =?utf-8?B?N21JNVdybnhDMCs2d09KZHpFYjJ2bGpVd0VPUitsMENxQ3kyZHNTTHlyM0cy?=
 =?utf-8?B?aFFhUmU5cGRLVnB0V0RHU1BmVHdXNUUvRUE5cVkwNGY4Q2JmYkdxSW11b1RE?=
 =?utf-8?B?c0RkRVZ0Rk1ZYkR0S3lNak4rRmp4V2NNZFdubWM3ejdZaTEzTExoZVBXMDQ2?=
 =?utf-8?B?VlE1MExub2JXNUgzbEVidC8vS1lvUHBjbTRaZHpxdUhOcXFFVDlEWjh4WkUx?=
 =?utf-8?B?cnRpdExNVEJIRERyWWs5NW50QUhCMk80M3I0S3dETU1aaVhBQ21JT3M3RVJD?=
 =?utf-8?B?WlhKNWpQa0V4QzJqUUd0VS93S01GQXRFVWRwK09TU0ZYRXZPSzljU1ptcWIy?=
 =?utf-8?B?WURLYkx5V2pWeG5lako2UT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b66d27-fbbf-4718-3754-08d94c5e2a16
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4542.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 15:42:36.7556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7PQ4xEVKjLSAbWzek56PeOnvPBFBM7R1idD+OZYluaIMr/JzYfE7Jc9rY2b59QUa+UaooAiVdk+TEfOok9ttN+OUDrNoTevAv0FmF2cCb/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3656
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10052
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107210091
X-Proofpoint-ORIG-GUID: On1nA7ljdxbeHYf0sdHVeruUzyhzU835
X-Proofpoint-GUID: On1nA7ljdxbeHYf0sdHVeruUzyhzU835
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.117, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "mst@redhat.com" <mst@redhat.com>, Konrad Wilk <konrad.wilk@oracle.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Eric Blake <eblake@redhat.com>,
 "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/19/21 10:02 AM, Igor Mammedov wrote:
> On Wed, 30 Jun 2021 19:26:39 +0000
> Eric DeVolder <eric.devolder@oracle.com> wrote:
> 
>> Oops, at the end of the 4th paragraph, I meant to state that "Linux does not support the NVRAM mode."
>> rather than "non-NVRAM mode", which contradicts everything I stated prior.
>> Eric.
>> ________________________________
>> From: Eric DeVolder <eric.devolder@oracle.com>
>> Sent: Wednesday, June 30, 2021 2:07 PM
>> To: qemu-devel@nongnu.org <qemu-devel@nongnu.org>
>> Cc: mst@redhat.com <mst@redhat.com>; imammedo@redhat.com <imammedo@redhat.com>; marcel.apfelbaum@gmail.com <marcel.apfelbaum@gmail.com>; pbonzini@redhat.com <pbonzini@redhat.com>; rth@twiddle.net <rth@twiddle.net>; ehabkost@redhat.com <ehabkost@redhat.com>; Konrad Wilk <konrad.wilk@oracle.com>; Boris Ostrovsky <boris.ostrovsky@oracle.com>
>> Subject: [PATCH v5 02/10] ACPI ERST: specification for ERST support
>>
>> Information on the implementation of the ACPI ERST support.
>>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>> ---
>>   docs/specs/acpi_erst.txt | 152 +++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 152 insertions(+)
>>   create mode 100644 docs/specs/acpi_erst.txt
>>
>> diff --git a/docs/specs/acpi_erst.txt b/docs/specs/acpi_erst.txt
>> new file mode 100644
>> index 0000000..79f8eb9
>> --- /dev/null
>> +++ b/docs/specs/acpi_erst.txt
>> @@ -0,0 +1,152 @@
>> +ACPI ERST DEVICE
>> +================
>> +
>> +The ACPI ERST device is utilized to support the ACPI Error Record
>> +Serialization Table, ERST, functionality. The functionality is
>> +designed for storing error records in persistent storage for
>> +future reference/debugging.
>> +
>> +The ACPI specification[1], in Chapter "ACPI Platform Error Interfaces
>> +(APEI)", and specifically subsection "Error Serialization", outlines
>> +a method for storing error records into persistent storage.
>> +
>> +The format of error records is described in the UEFI specification[2],
>> +in Appendix N "Common Platform Error Record".
>> +
>> +While the ACPI specification allows for an NVRAM "mode" (see
>> +GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES) where non-volatile RAM is
>> +directly exposed for direct access by the OS/guest, this implements
>> +the non-NVRAM "mode". This non-NVRAM "mode" is what is implemented
>> +by most BIOS (since flash memory requires programming operations
>> +in order to update its contents). Furthermore, as of the time of this
>> +writing, Linux does not support the non-NVRAM "mode".
> 
> shouldn't it be s/non-NVRAM/NVRAM/ ?

Yes, it has been corrected.

> 
>> +
>> +
>> +Background/Motivation
>> +---------------------
>> +Linux uses the persistent storage filesystem, pstore, to record
>> +information (eg. dmesg tail) upon panics and shutdowns.  Pstore is
>> +independent of, and runs before, kdump.  In certain scenarios (ie.
>> +hosts/guests with root filesystems on NFS/iSCSI where networking
>> +software and/or hardware fails), pstore may contain the only
>> +information available for post-mortem debugging.
> 
> well,
> it's not the only way, one can use existing pvpanic device to notify
> mgmt layer about crash and mgmt layer can take appropriate measures
> to for post-mortem debugging, including dumping guest state,
> which is superior to anything pstore can offer as VM is still exists
> and mgmt layer can inspect VMs crashed state directly or dump
> necessary parts of it.
> 
> So ERST shouldn't be portrayed as the only way here but rather
> as limited alternative to pvpanic in regards to post-mortem debugging
> (it's the only way only on bare-metal).
> 
> It would be better to describe here other use-cases you've mentioned
> in earlier reviews, that justify adding alternative to pvpanic.

I'm not sure how I would change this. I do say "may contain", which means it
is not the only way. Pvpanic is a way to notify the mgmt layer/host, but
this is a method solely with the guest. Each serves a different purpose;
plugs a different hole.

As noted in a separate message, my company has intentions of storing other
data in ERST beyond panics.

> 
>> +Two common storage backends for the pstore filesystem are ACPI ERST
>> +and UEFI. Most BIOS implement ACPI ERST.  UEFI is not utilized in
>> +all guests. With QEMU supporting ACPI ERST, it becomes a viable
>> +pstore storage backend for virtual machines (as it is now for
>> +bare metal machines).
>> +
> 
>> +Enabling support for ACPI ERST facilitates a consistent method to
>> +capture kernel panic information in a wide range of guests: from
>> +resource-constrained microvms to very large guests, and in
>> +particular, in direct-boot environments (which would lack UEFI
>> +run-time services).
> this hunk probably not necessary
> 
>> +
>> +Note that Microsoft Windows also utilizes the ACPI ERST for certain
>> +crash information, if available.
> a pointer to a relevant source would be helpful here.

I've included the reference, here for your benefit.
Windows Hardware Error Architecutre, specifically Persistence Mechanism
https://docs.microsoft.com/en-us/windows-hardware/drivers/whea/error-record-persistence-mechanism

> 
>> +Invocation
> s/^^/Configuration|Usage/

Corrected

> 
>> +----------
>> +
>> +To utilize ACPI ERST, a memory-backend-file object and acpi-erst
> s/utilize/use/

Corrected

> 
>> +device must be created, for example:
> s/must/can/

Corrected

> 
>> +
>> + qemu ...
>> + -object memory-backend-file,id=erstnvram,mem-path=acpi-erst.backing,
>> +  size=0x10000,share=on
> I'd put ^^^ on the same line as -object and use '\' at the end the
> so example could be easily copy-pasted

Corrected

> 
>> + -device acpi-erst,memdev=erstnvram
>> +
>> +For proper operation, the ACPI ERST device needs a memory-backend-file
>> +object with the following parameters:
>> +
>> + - id: The id of the memory-backend-file object is used to associate
>> +   this memory with the acpi-erst device.
>> + - size: The size of the ACPI ERST backing storage. This parameter is
>> +   required.
>> + - mem-path: The location of the ACPI ERST backing storage file. This
>> +   parameter is also required.
>> + - share: The share=on parameter is required so that updates to the
>> +   ERST back store are written to the file immediately as well. Without
>> +   it, updates the the backing file are unpredictable and may not
>> +   properly persist (eg. if qemu should crash).
> 
> mmap manpage says:
>    MAP_SHARED
>               Updates to the mapping ... are carried through to the underlying file.
> it doesn't guarantee 'written to the file immediately', though.
> So I'd rephrase it to something like that:
> 
> - share: The share=on parameter is required so that updates to the ERST back store
>           are written back to the file.

Corrected

> 
>> +
>> +The ACPI ERST device is a simple PCI device, and requires this one
>> +parameter:
> s/^.*:/and ERST device:/

Corrected

> 
>> +
>> + - memdev: Is the object id of the memory-backend-file.
>> +
>> +
>> +PCI Interface
>> +-------------
>> +
>> +The ERST device is a PCI device with two BARs, one for accessing
>> +the programming registers, and the other for accessing the
>> +record exchange buffer.
>> +
>> +BAR0 contains the programming interface consisting of just two
>> +64-bit registers. The two registers are an ACTION (cmd) and a
>> +VALUE (data). All ERST actions/operations/side effects happen
> s/consisting of... All ERST/consisting of ACTION and VALUE 64-bit registers. All ERST/

Corrected

> 
>> +on the write to the ACTION, by design. Thus any data needed
> s/Thus//
Corrected

> 
>> +by the action must be placed into VALUE prior to writing
>> +ACTION. Reading the VALUE simply returns the register contents,
>> +which can be updated by a previous ACTION.
> 
>> This behavior is
>> +encoded in the ACPI ERST table generated by QEMU.
> it's too vague, Either drop sentence or add a reference to relevant place in spec.
Corrected

> 
> 
>> +
>> +BAR1 contains the record exchange buffer, and the size of this
>> +buffer sets the maximum record size. This record exchange
>> +buffer size is 8KiB.
> s/^^^/
> BAR1 contains the 8KiB record exchange buffer, which is the implemented maximum record size limit.
Corrected

> 
> 
>> +Backing File
> 
> s/^^^/Backing Storage Format/
Corrected

> 
>> +------------
> 
> 
>> +
>> +The ACPI ERST persistent storage is contained within a single backing
>> +file. The size and location of the backing file is specified upon
>> +QEMU startup of the ACPI ERST device.
> 
> I'd drop above paragraph and describe file format here,
> ultimately used backend doesn't have to be a file. For
> example if user doesn't need it persist over QEMU restarts,
> ram backend could be used, guest will still be able to see
> it's own crash log after guest is reboot, or it could be
> memfd backend passed to QEMU by mgmt layer.
Dropped

> 
> 
>> +Records are stored in the backing file in a simple fashion.
> s/backing file/backend storage/
> ditto for other occurrences
Corrected

> 
>> +The backing file is essentially divided into fixed size
>> +"slots", ERST_RECORD_SIZE in length, with each "slot"
>> +storing a single record.
> 
>> No attempt at optimizing storage
>> +through compression, compaction, etc is attempted.
> s/^^^//

I'd like to keep this statement. It is there because in a number of
hardware BIOS I tested, these kinds of features lead to bugs in the
ERST support.

> 
>> +NOTE that any change to this value will make any pre-
>> +existing backing files, not of the same ERST_RECORD_SIZE,
>> +unusable to the guest.
> when that can happen, can we detect it and error out?
I've dropped this statement. That value is hard coded, and not a
parameter, so there is no simple way to change it. This comment
does exist next to the ERST_RECORD_SIZE declaration in the code.

> 
> 
>> +Below is an example layout of the backing store file.
>> +The size of the file is a multiple of ERST_RECORD_SIZE,
>> +and contains N number of "slots" to store records. The
>> +example below shows two records (in CPER format) in the
>> +backing file, while the remaining slots are empty/
>> +available.
>> +
>> + Slot   Record
>> +        +--------------------------------------------+
>> +    0   | empty/available                            |
>> +        +--------------------------------------------+
>> +    1   | CPER                                       |
>> +        +--------------------------------------------+
>> +    2   | CPER                                       |
>> +        +--------------------------------------------+
>> +  ...   |                                            |
>> +        +--------------------------------------------+
>> +    N   | empty/available                            |
>> +        +--------------------------------------------+
>> +        <-------------- ERST_RECORD_SIZE ------------>
> 
> 
>> +Not all slots need to be occupied, and they need not be
>> +occupied in a contiguous fashion. The ability to clear/erase
>> +specific records allows for the formation of unoccupied
>> +slots.
> I'd drop this as not necessary

I'd like to keep this statement. Again, several BIOS on which I tested
ERST had bugs around non-contiguous record storage.
> 
> 
>> +
>> +
>> +References
>> +----------
>> +
>> +[1] "Advanced Configuration and Power Interface Specification",
>> +    version 4.0, June 2009.
>> +
>> +[2] "Unified Extensible Firmware Interface Specification",
>> +    version 2.1, October 2008.
>> +
>> --
>> 1.8.3.1
>>
> 

