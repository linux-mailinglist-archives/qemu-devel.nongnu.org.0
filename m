Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE046A818F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 12:51:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXhSq-000517-9c; Thu, 02 Mar 2023 06:51:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1pXhSo-00050r-JI
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:51:10 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1pXhSj-0006fA-JY
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:51:10 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 322AwwnJ028777; Thu, 2 Mar 2023 11:51:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=references : from :
 to : cc : subject : date : in-reply-to : message-id : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=gHP0EWgpZkxcotc+OSsOaCsZYnkOTlKO8nzjQLJCmZA=;
 b=gLABGplAE2WOOTOnQOmWs4uJa93sXhnAnsOK2FNfPQQ0q6uYIj/WTRaxNDKouG0HeflB
 J/YyMa81Oq6ySbvRCK8RQSbOZzr8an0232EKue+8MhTR0z4ukXlHiqKk5BHQp8eSLO/b
 6lMFbFtkaBkznLueczHoncw1SQzJy6TU4bJZX3FZcxmdaXvZdzTiov8TCk6F87Kn5OjM
 k5jsI1UtVrPLpl69gdCpKtoJO5dQc4jnbuehg+thF5s9ekWMgXaNeQKz0orxMVI8vRAf
 enc19yRgt9scKx/WvxVpiwghhZzhL9DUTr9K8RIJQpMEZGQScsyl1IL5diT1xF/yi19Q RA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nyb6ekp6k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Mar 2023 11:51:02 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 322Ak5eo028676; Thu, 2 Mar 2023 11:51:01 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2043.outbound.protection.outlook.com [104.47.74.43])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ny8sg13e5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Mar 2023 11:51:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZNEncqy+0dt6jHmJgrktN3B7l2oMIWEjuCXDPgcckUPiC3ly6La1RXpAuESQyY27bgeuqmdqTtLxL6bpdteO1J+jgt163hpjrDhVRPw7zee8Ltqffo1/U90EpwuTFgfPFGZ4bK8LdKtoy50wjlq9YVZjPiBLSxhdqfPR8641b9PnoAtD/bjD87vS16/oy96ZUn4vgTXxUjul1/AdmsVE28+g9+eFqt3Q+Vi2od/WlC6ey0OIZ+V06r7RW452u4WLXqBICEar+T2qLxiI/oiTMF6pmbOdQecr5jQg0F4HtUA+nKqVbY3k4QrARK7iwAPq/k2ItB2AIyLpSfbO1+oKrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gHP0EWgpZkxcotc+OSsOaCsZYnkOTlKO8nzjQLJCmZA=;
 b=DBTf9MHkTCOMyBAqmWR0JnqglF2mcMPwpXW9dqwaexTHZuU3ZsuAd9ajotbCFrWVuD16CE3+x+/NGK2uJugzZVDZnouxU7hmnQDBwhnKCf7fzU3dUpB+qwaYgyP4qoJ1TgyUMfkDiSyXnbAmck+Cql3pKePFit9tKntdo6vmBqV9YinLjQN09NLcF7Q1VfaaUqzAbjOKWezEKVW1JrUH8qQcXQYEaC5KwagEUx6SF2LgM8pHsY/OWxRJ43xEQV8xJtdBEP8caCQHOXduzkWQ9QObOHlDzoSw/ve0uPNg8XN7XGzzqhh6w1lcQEI4rqQvPaF6bgaCz0C7QWhda/6gQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gHP0EWgpZkxcotc+OSsOaCsZYnkOTlKO8nzjQLJCmZA=;
 b=IRQLNkaenlIQA2kFqpv7GBqgeCieankM69FgZNzKb8n4bG6BMfXXAjmp3zG6nL2z52QkkyM64UDNeKFTBU73KfH6ePKAbsgRt1HwMc6AmDwweU2kDAOVso+llY7OFSnEMMysGKxop067FW9DAElGg1lhBC6rK3k+543V0d9lsV4=
Received: from DS7PR10MB4926.namprd10.prod.outlook.com (2603:10b6:5:3ac::20)
 by IA1PR10MB7198.namprd10.prod.outlook.com (2603:10b6:208:3f3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Thu, 2 Mar
 2023 11:50:59 +0000
Received: from DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::9ee4:1e8a:76b6:959b]) by DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::9ee4:1e8a:76b6:959b%2]) with mapi id 15.20.6156.019; Thu, 2 Mar 2023
 11:50:59 +0000
References: <20230301124026.2930-1-quintela@redhat.com>
 <20230301124026.2930-2-quintela@redhat.com>
User-agent: mu4e 1.8.14; emacs 30.0.50
From: David Edmondson <david.edmondson@oracle.com>
To: Juan Quintela <quintela@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/3] migration: Merge ram_counters and ram_atomic_counters
Date: Thu, 02 Mar 2023 11:48:03 +0000
In-reply-to: <20230301124026.2930-2-quintela@redhat.com>
Message-ID: <m2h6v31ie8.fsf@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO6P123CA0034.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::16) To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB4926:EE_|IA1PR10MB7198:EE_
X-MS-Office365-Filtering-Correlation-Id: b7d763e8-7fe4-47be-132c-08db1b146429
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nDNbqA9S4NdEPELM7yEF+ygdvOIZXLNCyldz3PWfJuNN6/1sKmxGaBNdcXW0shPS7I2LXh8FBFrqOTavIUUDHCdAVql6taxIS+GWlYnW2oTxgG1Y72u0X4jRAQSoY+w++nZ0t7PplLa6Cxvod32EctqMCD6x5nBYV5ynmeuhDF5kra3g2BSJG0uVYJ9eTd9BKmQr5nxd9yLiF/NpUMR3YDEEwA3Xeqmlfx3R7bISSQ/echsFgEURbni2lRkCzMx7+neaV3fOo4pQC43dgPHXeKd94BNXqP1MPIfV4JxZwxXN++7UeL+T+/b+x/Qtnzy+Q+ORAgsrpvXafQwMUEEBSOhqVN3cCwXhigb5pqdrWzRMP4KgzC7X/7vqqDVeNAsmxV87fe7AIW56zExMYsXNRLCeVYIOj7QLd1nXMAtNAxOKAFjdApHbkeWZZhWoLn9tOsEzwXwJk+OJ+Vpv1ElQ5wd8EpjBC3YTAeZ8rx8I7sCQJLJI2uLlGomTnJb2opc/z0qk43t5Zi66B4FEcKPU85Iic+AgR6glCBsMLg/jCDX9ZPdQedDirtCCtAOpbYlD+AfRroTDcv1mwRgjFNt1DH1sl/zooenNYASZOX3uQlNZd2zz3yaeBk1ULu05Z2oRXjzAHwaj05mAunl0Rh6N7KX36/2q0II4Nv8MjtQaD7gehs5QWiUnJxpJBLtm9VX7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR10MB4926.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(136003)(39860400002)(366004)(396003)(346002)(451199018)(86362001)(36756003)(38100700002)(66946007)(66556008)(66476007)(8676002)(41300700001)(6916009)(316002)(4326008)(8936002)(2906002)(44832011)(5660300002)(2616005)(83380400001)(478600001)(6486002)(6512007)(186003)(26005)(6506007)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjhqamhSa3ppTkV0UkY3SDUxQ0g1ZkM2a1hNVjVlM3FlbzljOGp4SEpsSTNP?=
 =?utf-8?B?WlBYTVk4aEMrbnpOSmZhOFFZNFZIeFg3bWd1Tm02c1lwOEhxOGFUNExmSUIx?=
 =?utf-8?B?Q0oyRjRQQ3BFTGpIbUhMZE5Zcm9LTjVzSVlha2VCUVBXcmRLV1VMM3VtTGgy?=
 =?utf-8?B?L1ZuSHZYTjFzV2xhT3NZVjdnOWo5V2dyVjlDcTJxSEd4OTI2T1l6VEtSZlUv?=
 =?utf-8?B?QUpQVE1tK3RNdnZnUy9nMkJ1MEhWTXFwelM4dGN3UnFvMzBXQ2pCRncvRzlk?=
 =?utf-8?B?cW1nOFNDaWdYbWFNdm1Lb21oRXFXd3dLdEViY3dqaVRaTW9ML09QWHhMRnVF?=
 =?utf-8?B?UWtMU1QvRTM2cDdrY050SEVxbEhVSmtmM25SNG0yME5sVURVMFpCdVQ4MFA1?=
 =?utf-8?B?eU5xblVSRnFhdkZFQXkxVk5YRUpzUTZIOHBnWVg1ejN3Nm5NN21wYitkbzBW?=
 =?utf-8?B?S1orRUVCZ0JpMzhpTnhBOGw3Q3U1U2l4Zzl0a3lpajdRZDBHTXpsV0xNY3dJ?=
 =?utf-8?B?U1I5NjBzeWZNMWxpWXFqbnlyZTgxY3ZIMGZWalc3N2lnVm9PNEVBS3FsVjhK?=
 =?utf-8?B?ZDB6M0hqc3VVdlNLb3dXMWxOSWMzWTJqaFhjRVlkcXR0M0ZIdnJBWWtYK3RI?=
 =?utf-8?B?bnJnY3N6SEZ4TnJHeVZsQUNHdHBrSUYrMnpraThBRHVVSjlsUlErbXJpOWtG?=
 =?utf-8?B?cERZbkQzNEY4L21XYzltalFYUm96S0pQaHlES0NlcktwS0dXRzRvTWVuNlhU?=
 =?utf-8?B?ZVlRaTFncnNBL01kUnA0TUJNVXpjaHYyYlhjK0NqQjBYck55RkFTdVVUYVVy?=
 =?utf-8?B?enExa2JYZ1lGcjNIWmw2SHZueFJGODBZRDE3VXR1cmIzclIxSEZEMGpmRVIr?=
 =?utf-8?B?YjVyREtoVHp2K0VJWk45V2QzTmR1elpsWnhlelI4b01Ca3hQR2I0QklqZURj?=
 =?utf-8?B?V1pKcXFaMUwveVoyWm1VSWlhRlhFdHowK2s2UEtnVUQwL21GSnN2WFhITnhS?=
 =?utf-8?B?ZXFWUWdXLzM5c3d1U2JHWlBDa2ZLb1RLQmZ4RmJTNXEzUzJVNC9tdStLRi9a?=
 =?utf-8?B?Zm5SUG5iTnNxL1NFTTV0WG5udkpKL1MrQzVvMmYrU3V6NDk2VjdmQ21VeHdx?=
 =?utf-8?B?Y0g5M1l0ajhDbFZ3M3pYczJmN3VpWkhpOXdidFc5QmUyUnR0Wnh5QmpLSnVS?=
 =?utf-8?B?aVZBdXRTQTVET3pZLzZaWW9SbkF5azNxTE5meDlJU0tjVFBNQ0FpMVJzSUYy?=
 =?utf-8?B?c1VaRVdEaHVkeE1nUXl5Tmw5c29lSmJjbVhHbWJwOEFWUlRQbnMzS2Rrb3Y2?=
 =?utf-8?B?UUlxeHh6aDBDZ0Z0d0JsNkc0RCtUZlRrdVVqbEFqbG9sSnh6VHVpSnFOWDNs?=
 =?utf-8?B?S2lRMDg4djJhSGFVamhEb1hXYXowMk5nOEMwSmRVK2dnL3RhOEZxSWFRcDlC?=
 =?utf-8?B?QjZFVzMyaldoUXk5V0xqMCtrRnlHOGpjZDFNOEhsVjRHNy91MjFEcEs3dGZy?=
 =?utf-8?B?a0NUZEllejZYcXdTR2JCbWZFWTUyT3hRSTJEMWVsOEJuTWM1RnRlTmthUUFM?=
 =?utf-8?B?eXdhb2pDZVR1eHJzTGw3VVNwR2ZORCtKQ3Zqa045REdIclhMU1g3Wk91b2cw?=
 =?utf-8?B?ejgyS3ZkckRVTHU2aU0zazlHbVRDb001akpUanRrYkZCZitXOS8xZHpUWW5R?=
 =?utf-8?B?bUliL2hBNnNqcHZORzFjOVQwTElqcjNQRHNQVHJ6ZGJWUTlnT2ZxTmU2T3Uw?=
 =?utf-8?B?V1BuRnhjUld6MWhtbGZUNy9Qd1h4S2lNNit6NWVhVWNCQzNsa25tOFZlQ2Zs?=
 =?utf-8?B?UHZyQSthZkZnV2MxWVpNTlhEeGF4UStJQ2hGcXF6QjdvblZWS2ZWUERiWG5a?=
 =?utf-8?B?TFJsbmVYNnd5VGh5UVRDUnA1Z0tDTnU2L2c2SWo3Z3p2d3NaaXdGNFVWZWcw?=
 =?utf-8?B?VFFnQXo1bjlBdjJJWHR0N2NLMjVmKzM4d00rSkpnSFpVVHdibmpPWkF4d2R4?=
 =?utf-8?B?OVlHWkFSUXdHeVY2MW5KQmltZ1JlMUJ2M25lMXhZeGxXTit2em1RMlZBOHlz?=
 =?utf-8?B?VG5PVDBkYWxyaXpTNXVwRjJrcHBRRFZJb0tSa281QTRTRmVUMlpOS3BVcFdy?=
 =?utf-8?B?VlUrc0JuWGxNNGE5VHVKWmZaRjFpTGhWNTJKOUJOWUY4OUhsSjhSTDFwckR5?=
 =?utf-8?B?Z3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 1RLWNAr227zYxW5bp9ydL80KB1bXjJa0jZ8jUf4J1ZZ2vrDhpHtQaC6zso/NCGEtazWS04KRL0ikrdMzKfwxF2raWSjd73QjAtOU3zWRWCpypkRsa7pEjeGOe36b895dG1EO88H+oviqSq+bYLv4KQUBRoueHHK/4QLY77oHRuGXP1/9e98CbJ6b3Tvw1EOrfl2vuNdDqAH6A22Gls/vnJmPVl1BEFpeSscrUy19Uv04pyNUiiaiRDim911+pj1EQ3LIVvt0v7VsNjd5S1SeUV+Gde5pJD9P1aTWbtAsresVI5ZoZdC5uydp6sC2p1h4rQAL4BBcy9yUeTLBk7Zf6oIDT856A/S4XoysLWlzo5IMle1TMOE+RaNnQ9lS348mMxcdKTtWJzctu76MoVSu4CHYIMczJTbtjnpVkQkotjx+aE68GetgVks+yd1+pDfJ5V6+gKpdNUzM52qdwsulH25fBBKiYZt6it1r0rMbYy/vRBcGtX+LxWMnA6U6hcNsTvsLFdmwipqo0uYp3wu3AFwtLOJImYG0A+yLQFlzFeTVH1Vx1+614dA44A74CJ+df4wG3u+MEUJb44fwpeDFIn+Bio1kH+NVCZc35ZnKJIx1zN2Hs8tmfZpHG+kGsDHKLMaMNXZdEHzFO07k+eT+Ej5lonlH4grNNiNSQy0CnIBw75MOdZZHFWvHAP6Tgu043GBevZcoHl6YlwTWyeKOCh4GdBBdmIyru3QDjz4F2OGmsdOYggFB6nUu5bMHeH2kDuh85FEdfJJSYNX1EVQ0fw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7d763e8-7fe4-47be-132c-08db1b146429
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 11:50:59.7703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CydS8nntF098fJ41aARJ+0tWN51Yss9SVutKdJN9MzdZBRQMToQHMB+vB/oi5DqqIxQXdx88uK84oF8VUJwMAciDVhZD54c+pnhO9KI8OhQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7198
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_06,2023-03-02_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303020103
X-Proofpoint-ORIG-GUID: u52b-N4gadP5SdQ86NKFZ8EkEXIRYBMd
X-Proofpoint-GUID: u52b-N4gadP5SdQ86NKFZ8EkEXIRYBMd
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=david.edmondson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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


On Wednesday, 2023-03-01 at 13:40:24 +01, Juan Quintela wrote:
> Using MgrationStats as type for ram_counters mean that we didn't have
> to re-declare each value in another struct. The need of atomic
> counters have make us to create MigrationAtomicStats for this atomic
> counters.
>
> Create RAMStats type which is a merge of MigrationStats and
> MigrationAtomicStats removing unused members.
>
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/ram.h       | 26 ++++++++++++++------------
>  migration/migration.c |  8 ++++----
>  migration/multifd.c   |  4 ++--
>  migration/ram.c       | 39 ++++++++++++++++-----------------------
>  4 files changed, 36 insertions(+), 41 deletions(-)
>
> diff --git a/migration/ram.h b/migration/ram.h
> index 81cbb0947c..ca9adcb2ad 100644
> --- a/migration/ram.h
> +++ b/migration/ram.h
> @@ -35,25 +35,27 @@
>  #include "qemu/stats64.h"
> =20
>  /*
> - * These are the migration statistic counters that need to be updated us=
ing
> - * atomic ops (can be accessed by more than one thread).  Here since we
> - * cannot modify MigrationStats directly to use Stat64 as it was defined=
 in
> - * the QAPI scheme, we define an internal structure to hold them, and we
> - * propagate the real values when QMP queries happen.
> - *
> - * IOW, the corresponding fields within ram_counters on these specific
> - * fields will be always zero and not being used at all; they're just
> - * placeholders to make it QAPI-compatible.
> + * These are the ram migration statistic counters.  It is lousely

s/lousely/loosely/

> + * based on MigrationStats.  We change to Stat64 any counter that need

s/need/needs/

> + * to be updated using atomic ops (can be accessed by more than one
> + * thread).
>   */
>  typedef struct {
>      Stat64 transferred;
>      Stat64 duplicate;
>      Stat64 normal;
>      Stat64 postcopy_bytes;
> -} MigrationAtomicStats;
> +    int64_t remaining;
> +    int64_t dirty_pages_rate;
> +    int64_t dirty_sync_count;
> +    int64_t postcopy_requests;
> +    uint64_t multifd_bytes;
> +    uint64_t precopy_bytes;
> +    uint64_t downtime_bytes;
> +    uint64_t dirty_sync_missed_zero_copy;
> +} RAMStats;
> =20
> -extern MigrationAtomicStats ram_atomic_counters;
> -extern MigrationStats ram_counters;
> +extern RAMStats ram_counters;
>  extern XBZRLECacheStats xbzrle_counters;
>  extern CompressionStats compression_counters;
> =20
> diff --git a/migration/migration.c b/migration/migration.c
> index ae2025d9d8..923f4762f4 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1140,12 +1140,12 @@ static void populate_ram_info(MigrationInfo *info=
, MigrationState *s)
>      size_t page_size =3D qemu_target_page_size();
> =20
>      info->ram =3D g_malloc0(sizeof(*info->ram));
> -    info->ram->transferred =3D stat64_get(&ram_atomic_counters.transferr=
ed);
> +    info->ram->transferred =3D stat64_get(&ram_counters.transferred);
>      info->ram->total =3D ram_bytes_total();
> -    info->ram->duplicate =3D stat64_get(&ram_atomic_counters.duplicate);
> +    info->ram->duplicate =3D stat64_get(&ram_counters.duplicate);
>      /* legacy value.  It is not used anymore */
>      info->ram->skipped =3D 0;
> -    info->ram->normal =3D stat64_get(&ram_atomic_counters.normal);
> +    info->ram->normal =3D stat64_get(&ram_counters.normal);
>      info->ram->normal_bytes =3D info->ram->normal * page_size;
>      info->ram->mbps =3D s->mbps;
>      info->ram->dirty_sync_count =3D ram_counters.dirty_sync_count;
> @@ -1157,7 +1157,7 @@ static void populate_ram_info(MigrationInfo *info, =
MigrationState *s)
>      info->ram->pages_per_second =3D s->pages_per_second;
>      info->ram->precopy_bytes =3D ram_counters.precopy_bytes;
>      info->ram->downtime_bytes =3D ram_counters.downtime_bytes;
> -    info->ram->postcopy_bytes =3D stat64_get(&ram_atomic_counters.postco=
py_bytes);
> +    info->ram->postcopy_bytes =3D stat64_get(&ram_counters.postcopy_byte=
s);
> =20
>      if (migrate_use_xbzrle()) {
>          info->xbzrle_cache =3D g_malloc0(sizeof(*info->xbzrle_cache));
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 5e85c3ea9b..7cb2326d03 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -433,7 +433,7 @@ static int multifd_send_pages(QEMUFile *f)
>      transferred =3D ((uint64_t) pages->num) * p->page_size + p->packet_l=
en;
>      qemu_file_acct_rate_limit(f, transferred);
>      ram_counters.multifd_bytes +=3D transferred;
> -    stat64_add(&ram_atomic_counters.transferred, transferred);
> +    stat64_add(&ram_counters.transferred, transferred);
>      qemu_mutex_unlock(&p->mutex);
>      qemu_sem_post(&p->sem);
> =20
> @@ -628,7 +628,7 @@ int multifd_send_sync_main(QEMUFile *f)
>          p->pending_job++;
>          qemu_file_acct_rate_limit(f, p->packet_len);
>          ram_counters.multifd_bytes +=3D p->packet_len;
> -        stat64_add(&ram_atomic_counters.transferred, p->packet_len);
> +        stat64_add(&ram_counters.transferred, p->packet_len);
>          qemu_mutex_unlock(&p->mutex);
>          qemu_sem_post(&p->sem);
>      }
> diff --git a/migration/ram.c b/migration/ram.c
> index 96e8a19a58..9c2151307d 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -458,25 +458,18 @@ uint64_t ram_bytes_remaining(void)
>                         0;
>  }
> =20
> -/*
> - * NOTE: not all stats in ram_counters are used in reality.  See comment=
s
> - * for struct MigrationAtomicStats.  The ultimate result of ram migratio=
n
> - * counters will be a merged version with both ram_counters and the atom=
ic
> - * fields in ram_atomic_counters.
> - */
> -MigrationStats ram_counters;
> -MigrationAtomicStats ram_atomic_counters;
> +RAMStats ram_counters;
> =20
>  void ram_transferred_add(uint64_t bytes)
>  {
>      if (runstate_is_running()) {
>          ram_counters.precopy_bytes +=3D bytes;
>      } else if (migration_in_postcopy()) {
> -        stat64_add(&ram_atomic_counters.postcopy_bytes, bytes);
> +        stat64_add(&ram_counters.postcopy_bytes, bytes);
>      } else {
>          ram_counters.downtime_bytes +=3D bytes;
>      }
> -    stat64_add(&ram_atomic_counters.transferred, bytes);
> +    stat64_add(&ram_counters.transferred, bytes);
>  }
> =20
>  void dirty_sync_missed_zero_copy(void)
> @@ -757,7 +750,7 @@ void mig_throttle_counter_reset(void)
> =20
>      rs->time_last_bitmap_sync =3D qemu_clock_get_ms(QEMU_CLOCK_REALTIME)=
;
>      rs->num_dirty_pages_period =3D 0;
> -    rs->bytes_xfer_prev =3D stat64_get(&ram_atomic_counters.transferred)=
;
> +    rs->bytes_xfer_prev =3D stat64_get(&ram_counters.transferred);
>  }
> =20
>  /**
> @@ -1131,8 +1124,8 @@ uint64_t ram_pagesize_summary(void)
> =20
>  uint64_t ram_get_total_transferred_pages(void)
>  {
> -    return  stat64_get(&ram_atomic_counters.normal) +
> -        stat64_get(&ram_atomic_counters.duplicate) +
> +    return  stat64_get(&ram_counters.normal) +

Extra space after "return"? (Not yours, but =F0=9F=A4=B7.)

> +        stat64_get(&ram_counters.duplicate) +
>          compression_counters.pages + xbzrle_counters.pages;
>  }
> =20
> @@ -1193,7 +1186,7 @@ static void migration_trigger_throttle(RAMState *rs=
)
>      MigrationState *s =3D migrate_get_current();
>      uint64_t threshold =3D s->parameters.throttle_trigger_threshold;
>      uint64_t bytes_xfer_period =3D
> -        stat64_get(&ram_atomic_counters.transferred) - rs->bytes_xfer_pr=
ev;
> +        stat64_get(&ram_counters.transferred) - rs->bytes_xfer_prev;
>      uint64_t bytes_dirty_period =3D rs->num_dirty_pages_period * TARGET_=
PAGE_SIZE;
>      uint64_t bytes_dirty_threshold =3D bytes_xfer_period * threshold / 1=
00;
> =20
> @@ -1256,7 +1249,7 @@ static void migration_bitmap_sync(RAMState *rs)
>          /* reset period counters */
>          rs->time_last_bitmap_sync =3D end_time;
>          rs->num_dirty_pages_period =3D 0;
> -        rs->bytes_xfer_prev =3D stat64_get(&ram_atomic_counters.transfer=
red);
> +        rs->bytes_xfer_prev =3D stat64_get(&ram_counters.transferred);
>      }
>      if (migrate_use_events()) {
>          qapi_event_send_migration_pass(ram_counters.dirty_sync_count);
> @@ -1333,7 +1326,7 @@ static int save_zero_page(PageSearchStatus *pss, RA=
MBlock *block,
>      int len =3D save_zero_page_to_file(pss, block, offset);
> =20
>      if (len) {
> -        stat64_add(&ram_atomic_counters.duplicate, 1);
> +        stat64_add(&ram_counters.duplicate, 1);
>          ram_transferred_add(len);
>          return 1;
>      }
> @@ -1370,9 +1363,9 @@ static bool control_save_page(PageSearchStatus *pss=
, RAMBlock *block,
>      }
> =20
>      if (bytes_xmit > 0) {
> -        stat64_add(&ram_atomic_counters.normal, 1);
> +        stat64_add(&ram_counters.normal, 1);
>      } else if (bytes_xmit =3D=3D 0) {
> -        stat64_add(&ram_atomic_counters.duplicate, 1);
> +        stat64_add(&ram_counters.duplicate, 1);
>      }
> =20
>      return true;
> @@ -1404,7 +1397,7 @@ static int save_normal_page(PageSearchStatus *pss, =
RAMBlock *block,
>          qemu_put_buffer(file, buf, TARGET_PAGE_SIZE);
>      }
>      ram_transferred_add(TARGET_PAGE_SIZE);
> -    stat64_add(&ram_atomic_counters.normal, 1);
> +    stat64_add(&ram_counters.normal, 1);
>      return 1;
>  }
> =20
> @@ -1460,7 +1453,7 @@ static int ram_save_multifd_page(QEMUFile *file, RA=
MBlock *block,
>      if (multifd_queue_page(file, block, offset) < 0) {
>          return -1;
>      }
> -    stat64_add(&ram_atomic_counters.normal, 1);
> +    stat64_add(&ram_counters.normal, 1);
> =20
>      return 1;
>  }
> @@ -1499,7 +1492,7 @@ update_compress_thread_counts(const CompressParam *=
param, int bytes_xmit)
>      ram_transferred_add(bytes_xmit);
> =20
>      if (param->zero_page) {
> -        stat64_add(&ram_atomic_counters.duplicate, 1);
> +        stat64_add(&ram_counters.duplicate, 1);
>          return;
>      }
> =20
> @@ -2634,9 +2627,9 @@ void acct_update_position(QEMUFile *f, size_t size,=
 bool zero)
>      uint64_t pages =3D size / TARGET_PAGE_SIZE;
> =20
>      if (zero) {
> -        stat64_add(&ram_atomic_counters.duplicate, pages);
> +        stat64_add(&ram_counters.duplicate, pages);
>      } else {
> -        stat64_add(&ram_atomic_counters.normal, pages);
> +        stat64_add(&ram_counters.normal, pages);
>          ram_transferred_add(size);
>          qemu_file_credit_transfer(f, size);
>      }
--=20
And you're standing here beside me, I love the passing of time.

