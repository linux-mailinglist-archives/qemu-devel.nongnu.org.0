Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C471B403832
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:49:21 +0200 (CEST)
Received: from localhost ([::1]:56592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNv8q-00062K-QZ
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:49:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1mNv3b-0005Vc-ID
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:43:55 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:57174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1mNv3Z-0000kK-Dw
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:43:55 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1889xKnD006035; 
 Wed, 8 Sep 2021 10:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2021-07-09;
 bh=kRaFQ1IGRnijfIqQj9be/zyuSiG9g8sc3xI5A960CTk=;
 b=RU2rqEd7pcK9VOOpLnKDjwwPLOfCMWIfCSteo1bUOuBlo3XcgY693XLjC+no028sMSRM
 eueM+SBa6iZL/0uzOhh8DeAec9/bJp24ygX9OzC/AxCmBhNACV0ZMhwu7QsTIibo6AZC
 9UUoZOQ0kEEuXWs7cPSVooD4BhJRsDoYdY8onJ/FB76OW2lQxtj997fdwtjtVw5Oq1Cz
 LIZIEHSOqgdgUk++fBLvc0zLn6FyxchSa63bqvK93bNEEsxtiJgaCHyLipeZOdNJ4NKN
 Km5HtKjcL7Cjc14aXV0WoYUv4JpIsNaP51AcmmKpFSITrTSp6fgMxE/ou9Gdc7rBI4k5 6w== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2020-01-29;
 bh=kRaFQ1IGRnijfIqQj9be/zyuSiG9g8sc3xI5A960CTk=;
 b=ZF7cLElB3B2JRHHlxitcw/LRVTuvudqrZeaYpbm0q1P+Ltn/65aAAhiy2pqQqpmJpZ/b
 AWS3sb+Z1oTHNN3im3wFLCM+MJQgUM7DiEiP+7ng3pHRkctRMbww+zUvLSjZB4fjPxWD
 MlPLYpWewxKEWQN2fGMsk34BdBkWD2z/4seJKLXYd9OsKmSHz9tVm8VCqRwumCJTLBtX
 fvc0KveM+Sj1US0uvpfYBOaOtEI7JhNcBmokRChQAFf3KVUl+lZ2cIxNDCzjzgPdRsnd
 jf3K7fkVEJYERH2EVDvSp8tP4rB2k7X/glevigdvdrcs4kAEG4rAwv9I7d5chWedu+Vo 2w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3axd8q28aa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Sep 2021 10:43:51 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 188Ae3FZ091494;
 Wed, 8 Sep 2021 10:43:49 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
 by aserp3020.oracle.com with ESMTP id 3axcpm2pr0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Sep 2021 10:43:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n9bRvrtngTTr6Csa63BD0YS9bvl+7hrsJ6fxNOXRhEqj8oy/ZqIOtFmkWS5FpLJySwCpgw0p+LLvRtE7+jwszWLGALs1zx0hc2046QEGa6VkMjC0CRPTTOA/gRgdQx54ru569l5nXXKM8+T5EyzVtCDhFcGNcnXr9O1+EzFXimcO9GTdMwpu1v7G2s7ocW31NFpq4uiA3M3cdF3o3qJ5nbEVZcs1oKRsToDEOem0riVxL/UBQxiMNoIoDGNDZlwipuhVxJ5IGyW6EmR2yRq7UPf0dahqn6sNFB490g9S0Ul/pvvC7fy+GjHVzoptthf2gIC41umGinSLnd2kfSXjYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=kRaFQ1IGRnijfIqQj9be/zyuSiG9g8sc3xI5A960CTk=;
 b=GEXwMWRjyD0Px6/cDfm3TtMZ3k+ls6uy6Juc+LQARXBvLCF1TzdpFpQ9OuPIPcc6kjOwmhoQSHN4oTIh8E3fCDNLfI8M7/NaD06Ig+NFlDnpov76SBG/T1bxMxEd3fIfTRnkTfEhSxd/oElKWgoaYW3+H2jIz66Ipz2Mt/gfxPDsgU7dxKMhAIJkwft+UBZ6yYcZsXrtbQ4TYdLykIv7sj4Io9z9SSA6qRsA3MLk535WyDM5mENKzjBkG2OUi1lBjKATxJna8rHJUZ6VMQAXB8UHjuTD8OaGTETJxdqyVVH/QWCEvxlc/zGJL/1AosBHIMQNmA4twc//GUWFkPPuLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRaFQ1IGRnijfIqQj9be/zyuSiG9g8sc3xI5A960CTk=;
 b=X2iD6v0SaHRt/MNGfToPjhrpyiAtcqV8iBFozz4KDMI7+llgGyVO//Fc73KQuYBXtr16vd2ZbH5MnRTw9Xmk6PsXyGLM9CS2xMq3ikBuasoKWMQXp77LgMDZm0NKmXl07HNzC2fuNzM5a7zBX59F+H/bJc8qGFIsx9Bf5lRJs4M=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from BN0PR10MB5144.namprd10.prod.outlook.com (2603:10b6:408:127::18)
 by BN7PR10MB2594.namprd10.prod.outlook.com (2603:10b6:406:ce::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.25; Wed, 8 Sep
 2021 10:43:47 +0000
Received: from BN0PR10MB5144.namprd10.prod.outlook.com
 ([fe80::996e:dd73:1933:88e9]) by BN0PR10MB5144.namprd10.prod.outlook.com
 ([fe80::996e:dd73:1933:88e9%5]) with mapi id 15.20.4500.014; Wed, 8 Sep 2021
 10:43:47 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] fuzz: fix unbound variable in build.sh
In-Reply-To: <e93ce7f6-2f0c-f676-e1e7-b5a59376561b@redhat.com>
References: <20210907110841.3341786-1-alxndr@bu.edu>
 <e93ce7f6-2f0c-f676-e1e7-b5a59376561b@redhat.com>
Date: Wed, 08 Sep 2021 11:43:37 +0100
Message-ID: <m28s07gxeu.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DB8PR03CA0018.eurprd03.prod.outlook.com
 (2603:10a6:10:be::31) To BN0PR10MB5144.namprd10.prod.outlook.com
 (2603:10b6:408:127::18)
MIME-Version: 1.0
Received: from oracle.com (46.7.162.180) by
 DB8PR03CA0018.eurprd03.prod.outlook.com (2603:10a6:10:be::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.15 via Frontend Transport; Wed, 8 Sep 2021 10:43:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7f8d037-5043-4f6b-c9af-08d972b58950
X-MS-TrafficTypeDiagnostic: BN7PR10MB2594:
X-Microsoft-Antispam-PRVS: <BN7PR10MB25948AB6C0EDB00D86D76C56F4D49@BN7PR10MB2594.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3zjGkJJ2aFwdVNllDJvuvkkQRW8PqA3tcqX+iLdXsUnZ1/L1LI4/of6mRwERy+ftSTLxUGQXMMej8cVhUZ5Fpn0ZHEbudPUKsaT+IMF3YEV21HMylmbixeARdt/7dr2Ew/7pxODzoQ+D6YA+WpKiBWpeLDnOBDXXyWwj1mf3T+yUiyh2BhyN740fX2MAjXLE0WkgI4QK7MzYCOq4IvGYXIk02IQDdzsfxZ7EuDFKzdJo+lgz/89kIh9hVX1ba96h7iL9JwBTAzwXtykxrJ4JC6Ctu0p3oYdrRDQWlA5rst4/iBfBlfwGnKzWL/M5mkwLmFEwyYoUbcm2p+BpM+ZkCv+Nchn/pTvYjobqNq1dB6kXnnARAhnPOtfQyPRQL+qn6gRFZFUobENedmBvK6q39J2PeEAQuj7sEs2EONqPp/3EY0Q5TYfU7QdZUNdLCIJP07gJSI6lEyH7h+uIXWdowtaMhkooUfjPEaBgOSZIpdDfEwmIXbMLwEyzwkmdg6asFb0iQ+FQBIazkPFFLndMUac1yaf6S1vO91iMRYe+mtb3tqcxgHhsm8y8HFxI8AdnAVFFZVdQ+lLf8Y8PDHUmZvqgWC9nHGOD+07cDGujRBZe9jfaWDpp7PmZudGCqFtG/PDIPUgolFc50y2t/4v50zYE7j7ZgDXOtDd+cG0r+UxyH7lJ/WKP9bZPN1p12h+dEuRNzGGO0Hc6IqqdNSEjmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR10MB5144.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(376002)(346002)(366004)(136003)(396003)(66946007)(66556008)(4326008)(5660300002)(7696005)(66476007)(52116002)(54906003)(316002)(53546011)(956004)(2616005)(8676002)(6666004)(110136005)(26005)(86362001)(478600001)(8936002)(44832011)(2906002)(38100700002)(38350700002)(4744005)(83380400001)(36756003)(55016002)(8886007)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fJPGoH3MVdW+RNm/A90euSFsQl1lSihvVhZZvCgTPErd/f+30oRMqx5IbsPr?=
 =?us-ascii?Q?CJtNKfcWJwSQQifcydRgSATarQWlsBnz9cyOalH4AwhRmrWikEdkr9hQS1qI?=
 =?us-ascii?Q?cvPnVLls8ozhRBuP8j5Hts6zKP0YkvTO8IMaQSw5Q0XDXBD859PVsY753gJO?=
 =?us-ascii?Q?x09KdamRi/EXUjzTr67uMudM4lIREcrQQyvyTFSG1kXKiP64bqiFWxXUpIUy?=
 =?us-ascii?Q?tiLp68gf4McNuKNn8tgwGwolUuNzyd17FxWvwuKzVLmozf7OVadBipTdb47J?=
 =?us-ascii?Q?SEWo60G1J78oNcXYyD5hE0RXMV+1K3Q/FNLJEKwHR21ru6d8JfrGBuUME3DR?=
 =?us-ascii?Q?VMmmlxGUR9n8hg/ny8GIDAK9jXomunvna56yxGBqGP7tytuTpHLdQneQQUHC?=
 =?us-ascii?Q?l39gHmEoJivSzpRSg+dvaahOJPskVuTyZwE9DNTwCrW6/nua/jkLEIIsc1iO?=
 =?us-ascii?Q?yEwKgWHLy6wcjVOD7nY2I8Z4m8i1cIWjQI35t7ls0MnvDggtsauCYegNX/kO?=
 =?us-ascii?Q?3JxITgKwwJCs+nAVRwYudsFfoQmJMJ1SeLFpkLxcL5pgJwxVCsUNS5blrYUW?=
 =?us-ascii?Q?LqTUZOc27wjKr4PZ3zRSvBZGceLrTR08dxt//5Io0NtMKhCW8N+xRhReRnUM?=
 =?us-ascii?Q?VGwHv+j7uxOsKpMoYv9EfKTrg8Trc/4I4i4ofVUgN+Z+JG0EER7b8qaGRXv3?=
 =?us-ascii?Q?uzq17GE0X5G4C9sUtX+txdtZ01Px2HCLX3dIK3Vy5wGBYXGHWnHgx9ZyCQYI?=
 =?us-ascii?Q?avtnuxBOeK277RN1k9x8vZX+vQVnzvA8LBFI+NEB9GsEa5n542iBsfWanHzr?=
 =?us-ascii?Q?uL2vBuJqvV4whHHDqFNN4w8Psln7Pa5FT/Vn1Krm9ZRBSdZMXyI+7njFcIhY?=
 =?us-ascii?Q?QXEFWeu86jdNN4y2MX6aNoeaFvb/4m/H/39ivtdayGmPSZZ5l6hYODL74Zvf?=
 =?us-ascii?Q?AUUkLzvFHJBPVuwNiQIPLWGwcgzVLzZSbZABOqqRkpeDYsi/FXBgv49STdiZ?=
 =?us-ascii?Q?0byxcSLdcv7UISwcjhgUM7oYGBuI9HSgILPgxYOkSwdWUgUCkV8TqP46qqzQ?=
 =?us-ascii?Q?kTzu/mf36mVIMZj+PV+zBkl8uE4CeVeQo1PgWlJvLKASKMG/45+tmi61mNOe?=
 =?us-ascii?Q?DVKCG68O4QOio9vShVty07iPPygrnncJTIALSycFvo/IZRV+ILsjrWlrsTbt?=
 =?us-ascii?Q?AfPZDs2Qeljq10p7kjtnEbsq8BdvGdXkXggINTa6fyDP5b8VrkJVv4rqnW1d?=
 =?us-ascii?Q?CDPtkAi7B/oWj24GFOx8QtI553D46TQu1ufLeN0R074HRsyDox3zWuOgkHLA?=
 =?us-ascii?Q?vETjQgPBEv9Ho9ZqJiTVA4+W?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7f8d037-5043-4f6b-c9af-08d972b58950
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5144.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 10:43:46.9648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XaC1I6HWr8DFE/B5PkbKuMC1oXeNSeGKeZw2xjIE5Wt8pNJvdPpaMh7Db0Erd/fQgyInNPHmc/CODWb95P/Ccg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR10MB2594
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10100
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0
 malwarescore=0 spamscore=0 mlxscore=0 phishscore=0 mlxlogscore=947
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109080068
X-Proofpoint-GUID: sugkuQXNaO_nWX1WD2GvBPcZ1iDvoRUd
X-Proofpoint-ORIG-GUID: sugkuQXNaO_nWX1WD2GvBPcZ1iDvoRUd
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Bandan Das <bsd@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wednesday, 2021-09-08 at 08:06:27 +02, Paolo Bonzini wrote:
> On 07/09/21 13:08, Alexander Bulekov wrote:
>>   
>> -if [ "$GITLAB_CI" != "true" ]; then
>> +if [ -z ${GITLAB_CI+x} ]; then
>
> I would slightly prefer to have "${GITLAB_CI+x}", since "test" in 
> general doesn't like parameters that go away:
>
> $ [ = abc ]
> bash: [: =: unary operator expected
>
> What you wrote however works, so it's okay.
>

If we are certain that the script is running a bash variant then we
really should be using the '[[ ... ]]' variant of test which doesn't
have that limitation since it can handle an empty or unset variable
correctly.

This doesn't appear to be the assumption though.

Thanks,

Darren.


