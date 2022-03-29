Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 774924EAF20
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 16:18:17 +0200 (CEST)
Received: from localhost ([::1]:42814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZCfo-0007kB-AH
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 10:18:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1nZCdU-0005p1-Q4; Tue, 29 Mar 2022 10:15:53 -0400
Received: from mail-bn7nam10on2116.outbound.protection.outlook.com
 ([40.107.92.116]:16609 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1nZCdS-00042I-Mw; Tue, 29 Mar 2022 10:15:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hxCnnVl99l++ZBIJ5IqXaRlMgkthkoup3eZxSUozTOJuctZfCGcfkl6jeimpK19PXKMBp7vd1C29l7j7qRwbFDzJgHIHDD/ISEqFSIfAATeY1QvCacbIlmoPZEbTw8N3w02GGIQdzipm8OZTklLZE3lKj8hqVYlSOf16OlZRPia6iDnsg4l8/ixyBGFtxAehTO9P1bWZ6mqMBoJap6IX/lh4rPc5LXFX/c5uyAM6R4mW14PjgLp7+a911IA3KEiWd5TKcqQleiB/ykbdbp6n/omaMEdIpujYm5cwbMM0tCleBi7T+LvjUkJXo7bgDVUthdWUBa1kcm41MOShwosLzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3gxpjVQdfmpurFiAORKy4aELHpUKo4vWYGXIaIAbbsE=;
 b=CKyD90tT7+cv8Lp7aiHKMNaFKpfRMtdfeJe+K6DXlHUVsd3BB2zhwkv5gblqNhuRRV1AmHHmQaTaHWTf9uCwNVvIrQEULqQFNQ4fHnZHHaDfXgE1BTs7+WXykYT9bImlfQGRYkSFkFodHwKxz1oWy7r0CLLfxDaDN7U8h9lB2V7EJ1Yo0cRxSc5J/IZxxCj9E9QozloBra47SV3MNuJiVyYmrIbFHYuGthtC0ED1Zz8TM+WnyrtV39pXTdpBmwBIzU4pNzEsbiNvtS754RZ5hzUm5n34Vkq8Y6jJPWfI0/Dyy+jBB3znSdaqPHnEp9NqZ1+jRXVGAQ6itVz9+G1p4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3gxpjVQdfmpurFiAORKy4aELHpUKo4vWYGXIaIAbbsE=;
 b=ojVozKsUifA86IPt5rhdsa9WHB0bszF7YAlI4dccNhXDkzLxlxO1HCq56/6VV5r//Ukeg2mr71mwsbR8NWfD8SHiW6F2Y/su4ZvxuIFtU1asHJlK1t0CHJ5VEwdUOL9ABAC7VC/QP9J5CPL6XUK2p4xcg6D95Emnap6f5TcoJU8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 MW4PR01MB6371.prod.exchangelabs.com (2603:10b6:303:7b::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.16; Tue, 29 Mar 2022 13:56:18 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::fc95:d5f4:a26a:423d]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::fc95:d5f4:a26a:423d%8]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 13:56:18 +0000
Date: Tue, 29 Mar 2022 09:56:04 -0400
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, robhenry@microsoft.com
Subject: Re: Plugins Not Reporting AArch64 SVE Memory Operations
Message-ID: <YkMP9NHVzrsEMTow@strawberry.localdomain>
References: <YjzR3erB5ZhkAI2A@strawberry.localdomain>
 <87lewuxf8z.fsf@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87lewuxf8z.fsf@linaro.org>
X-ClientProxiedBy: CH2PR05CA0057.namprd05.prod.outlook.com
 (2603:10b6:610:38::34) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c6b22aa-fe65-4ffc-1718-08da118be5b9
X-MS-TrafficTypeDiagnostic: MW4PR01MB6371:EE_
X-Microsoft-Antispam-PRVS: <MW4PR01MB6371C0F1CEC5035BE02C4A3A8A1E9@MW4PR01MB6371.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tW6ftz1dBMA2H5r4GJQzRUo65cu6JxHhInyCzCeWwhDAqw9cUws1Euekh4GDwX0bWuFAPJOzrviisWNviUJn08QwnGyicREHj/mf6gXGRh/p6VoLjg+40eRbY1TgZdYGpoouNo+KEWJ7hnhc43Uqac+mIzYD45vcC5ANjXa7tEeC0ST7H3o+6sHkJVG9ltPqTTDGJ4HRygnzpvwwA3ztLbQoDhFrc7l10r9T/IkGKyFjkaJzYEE/KVCZJ+PO0n5K8KvRKTuIkD/wn9g6QKIGALCEUHP5STnVHMcisRQi2+w4/lTeRx/rjUWYp1SEWAbhKM/BZaCIa2qcX4kGpoz1cvENGv1j72vb9GwNeKcwxf9eHFcn5/yiLgHUbZdIMpxxBoOksJSYDzruYpAHmnfhZcpx805WFNvtRlAz73+Nsnlo9ec/ad8PycAtNBYLclTLUpAKlvDRJ8c7a6u0/LwOFt1awP2wWQOYUx2z+fbzJgwoX3UoFKNaiCFm6XYaycCMbCErSVpvSRF5t+OhrMt6JwRGsLz/tDwjmkH5u3SsLDx48jC0LhsssL8UXDVymc5dlFuDrH13Q17hWXqWytTeTK8jCh6MAy1xV0Cvogwtg53BuJAbnotZOUzYHCr6NjTQw3wWX4YrG0eOsTkZcCSfcA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR01MB7124.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(8936002)(83380400001)(66556008)(4326008)(66476007)(66946007)(508600001)(4744005)(6486002)(8676002)(186003)(316002)(6916009)(6666004)(38100700002)(2906002)(6506007)(6512007)(5660300002)(9686003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qvSrNdDFDm+nW4QPkYTFk+BvErEMiNgQsJVcZJ8/LrXEjF7kLHhGFMXoXw?=
 =?iso-8859-1?Q?d2pw76BQFBj+LTqLTkhJfu9p2pjsOZ/+YTyXVsXzyYv7o6q+r78eGz/NmM?=
 =?iso-8859-1?Q?FY4NoaY13CVkWTlcQuMSD0Z+Bx87RY0hNHtVFT3NOvf/pPjaYeB7mUs0dp?=
 =?iso-8859-1?Q?pg2cFyrCXcEsSBkV3gbkVlV7+ND8NkkloXc7m2OYrw+VjNzEuvFHw1nWWU?=
 =?iso-8859-1?Q?yjNrxquYOHWenI1n74aoXnqKbXRy11rjKB1e69xHGeKhgw2UFO2hOaWLxF?=
 =?iso-8859-1?Q?yJsIZpB52yg2DTtp7ALL16vR1cRKcRVIVYoPrAgAQuydHPhNR+1atqiCSM?=
 =?iso-8859-1?Q?zczKUsDsRBqaG/zuCHvQxAbMFvJLaCTalCxJ/F32mfVG8WeaghSe/23qaL?=
 =?iso-8859-1?Q?PDA+Py4vmqD7gmvXPsA+xOTW3h/ff0LxwW5Um/LMeJv+zkwSPKHGMTVHKP?=
 =?iso-8859-1?Q?Jj9DyeMVE2RoB4pV0hdpK095g0ZKAbFtreNudkqk7zNnja/PyXWnKtu+n4?=
 =?iso-8859-1?Q?iubEkvVdVcA8qdxqhL9tLRbI+dSspbR8DqaGSmveGKS7RfB/x5kVwO0z68?=
 =?iso-8859-1?Q?FWhNKjvsI61oJuNBvo6sMxhxDTBH7xvTdkmJO5g0C2SpQIHQDqfhITLpPN?=
 =?iso-8859-1?Q?Xq7hzBoRW0JIVmZ8xqXYLsSrlvXRDGLAwGpUkaWxj/HMJ+6S7NlnMir54B?=
 =?iso-8859-1?Q?zTKNopaFjYT2B8irOPlAF6VFXUkDKtf4bTBFHmFAW238WzJobYhO3QMHFi?=
 =?iso-8859-1?Q?cKXZ0q6vpStIgaBkWw5766wa7Qn6P2vQToY662rI3jZjmvlZg40ZmN5Swf?=
 =?iso-8859-1?Q?niA3Bok6o5+yGr+T5lby7v0fo9MLXxB7oxPfKH0b6KNePaHmVOD23xbnh9?=
 =?iso-8859-1?Q?Y1oi6cQNRyUFFXtqiiW6PerKH2UB4NxPly0X3O03xsue2Gv+/GJh0DX4dA?=
 =?iso-8859-1?Q?+5FsvB3rEJZCCB7llTVUgL4PEu6+TrVIHzqcx5mH1GMLi3cHcfbc3MVvaC?=
 =?iso-8859-1?Q?nMveN6303h7K3LzzrKOzPeRCnEiSzC93VZC0plnH5gdBsnGRieengkkOgj?=
 =?iso-8859-1?Q?Ul9Cde2kBqxODPF1Ytv1xxnT9jwULUyUOgiuMuOAKUtspN80pG30LRi4Jo?=
 =?iso-8859-1?Q?04ME3zjt2r7+tTGpreDC+X78am7uciy5OyyApoJ3IkUKDOU6SlPsSseTpQ?=
 =?iso-8859-1?Q?i/cSn/DhzEMr5LBRGGxV3TO8/YfHzJbMJlFu52/wkpHvYXyYNPxsuYTvKw?=
 =?iso-8859-1?Q?HUbJK4eVgU0dVDLlTXHNY0z1QrIxL+TSOdcNIrV0wQSv3e46ZCoJzSeX2k?=
 =?iso-8859-1?Q?bPEzvUUkSmE2BOqVp+QIfll4CnVmBNchQwbpMNm12xkBFAQGk7hr3In73j?=
 =?iso-8859-1?Q?LkCHx0DXoHhLs8SnsK1JxIa86L6bzPFHWSpGclPDsSyJpXyY51E114G2FE?=
 =?iso-8859-1?Q?nn40veA8K5ZqzlvKcSX9zdCanXbw89ugTo0rtRDlom6KCxBFbQWDb1BYEQ?=
 =?iso-8859-1?Q?sCLsrd9xOx6TylDHo2uq8cFmZeIxoDIt/PmGmQ3U51tdtDcG6AIGq9cLJ9?=
 =?iso-8859-1?Q?6ThCqHwbIjGbEd6JDk/w/uJj9CPFO85T9oar1hDdnN+Y2wZ6+Kudq3YEiJ?=
 =?iso-8859-1?Q?Ke6wdjxqTwsn1X2Yf7AaceYchy6VRXUEb+unQNEeivEnR2XI0lO8O7NSUq?=
 =?iso-8859-1?Q?veoU7/BWyS31PvEOLVkXEpq7v8476sMw4F/jhhUzD7bf4GY/crBnuDFhxd?=
 =?iso-8859-1?Q?vOVx1ShMKb0Y5WGpSUsJtwzk0k7cYWBDCLVDHTQEIsB3eWZJFpwE5grFr5?=
 =?iso-8859-1?Q?Zt5Lnq6IfbRnP/PsN9zqB7W0gVTw2WcM0O/oqGjqcH7itDXAGaeo?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c6b22aa-fe65-4ffc-1718-08da118be5b9
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 13:56:18.3440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M7TkuGk7eiWvTbOdl8u986y3AQmm/QXfz9joGK4PBc36i5xBQqzz879z1UAGmQDpiWzVWglpFnDa/ldn6FJx7JPOmzuevXrAwVc0R/nCJxNrJq5hn1joay3to1Pt2uaB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6371
Received-SPF: pass client-ip=40.107.92.116;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Aaron Lindsay <aaron@os.amperecomputing.com>
From:  Aaron Lindsay via <qemu-devel@nongnu.org>

On Mar 28 16:30, Alex Bennée wrote:
> 
> Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> 
> > Hi folks,
> >
> > I see there has been some previous discussion [1] about 1.5 years ago
> > around the fact that AArch64 SVE instructions do not emit any memory
> > operations via the plugin interface, as one might expect them to.
> 
> To help I updated one of the tests and extended the exec plugin. See:
> 
>   Subject: [PATCH  v1 0/2] some tests and plugin tweaks for SVE
>   Date: Mon, 28 Mar 2022 16:26:12 +0100
>   Message-Id: <20220328152614.2452259-1-alex.bennee@linaro.org>

This looks helpful, thanks!

-Aaron

