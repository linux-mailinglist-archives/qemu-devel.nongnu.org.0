Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9926B340AAF
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 17:52:22 +0100 (CET)
Received: from localhost ([::1]:57282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMvsj-0003kN-Lw
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 12:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1lMvXu-0003ux-JY; Thu, 18 Mar 2021 12:30:50 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:43778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1lMvXo-0008Av-R7; Thu, 18 Mar 2021 12:30:50 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12IGU1t3167498;
 Thu, 18 Mar 2021 16:30:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2020-01-29; bh=XOJwGe/SvD24EuvByM0tsmSlOMDTvXA38qO8OlbisDo=;
 b=qntiXc6p+dJ4rlMs3P2/F9+PRvYo81CnbLo4nS05Z6f0u37Uy5a13oP/u7IZLxtU2pvn
 HOebJVv81Cj2e2/X/+nwHaPe1JZc4K3BTbhYFVLXSQo5dec5R6mxAYerY1LH8tPubys+
 4zQL579AQ2iJbvb+gQByvY0iyEY7uOy+bPp1QQu8C59I7BkpXRR+UEb5CRW21Ym63khr
 0DShSYmI80l6worjmtquetsJ/zSAHTRokCngN1wilKeHnVfQyC981bsxBxPAjplM9tuw
 XBTAMHjAs5qKW/ouLfMeTkXIZqXAAJX9SrscB74UCBaeJNNXZwcp9WCxY6KVkEwIEzdl 8w== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 378jwbr7d3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Mar 2021 16:30:16 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12IGUAv7053881;
 Thu, 18 Mar 2021 16:30:15 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
 by userp3030.oracle.com with ESMTP id 3797b352yq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Mar 2021 16:30:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h94dQ+4atULwT84ws9msDXc1kemncNMduPlvj9Jlh5b1Bj0oq0onyJXfpPcBi2DjT9EENFm7Wb1ucvtLUPZ+o/wRo1HaQfOHzfQrs2CjMUKE2cbptMjfzJETLJNn4xTFqQdtWoXPrrx3EeUk6lU7BisdIXtRsyEi1OyeYQo6yWOwkNztcp7/kylj9+ly0pOAWCP3L5VBenkV+Ahx8iSVS11uG9ajTJRmvIzea2bkKrEJHl9+aq3Z3j9nzuCurYetTdijU/YT32CX9aRnR7Z5QDRzHhPL+qnX2Pjjma9XrrUxpxKr5CGpcFD1jWcjQl6pfnfBSj1aAoV8NgsP+ZUPVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XOJwGe/SvD24EuvByM0tsmSlOMDTvXA38qO8OlbisDo=;
 b=k3th5VYHDLJuc8sINFDad9+6W1h+wE4349plkSvxZOYI4rcfC1heKxFQl+FU/FUzsmmF40Q8HsEvAQ+P/CeQ12/TylrQYN11Ot0zVnzSRfILiUDLkiV+t9heT6mDLueigu6paFSO2qnh2AEpoT0tBG5MF7jVMQIXcVLysxuitCTcv5hBBr8T80+ZOA0+6kp7XhcDXlF9QUpvuzCcjkJrolgH0e6pzIppf2UKrR0cgHN1HLkv7bwwTDye2QUlXBhWoe0feKYBoFV8aiGTT846Angg27nWUZiBlW+kRwuTY6KadtuKFSU07izToUvSi5yli0v1xoit4OquQ1qJU7Q/hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XOJwGe/SvD24EuvByM0tsmSlOMDTvXA38qO8OlbisDo=;
 b=Lc9dZjWUr/7kPEz43W6PNmcqSYleWUexlGVE005Y7RfwoaeuOyTUuBJKSuUAv8UbRzaAsuI8FJMXtCGlB8rn2vW9dm/JHey3MEgp8iYs14fKPBy4ztmK56antTRTfjEtxDWYl0M7YVsojyFqzBGDp8ET0NIYzh8/EqjySF3+E5Y=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4565.namprd10.prod.outlook.com (2603:10b6:510:31::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 16:30:03 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::6819:aaf:9a92:c1db]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::6819:aaf:9a92:c1db%2]) with mapi id 15.20.3933.032; Thu, 18 Mar 2021
 16:30:03 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v5 0/6] hmp,qmp: Add some commands to introspect virtio deices
Date: Thu, 18 Mar 2021 12:29:38 -0400
Message-Id: <1616084984-11263-1-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-Originating-IP: [24.147.51.11]
X-ClientProxiedBy: SJ0PR05CA0079.namprd05.prod.outlook.com
 (2603:10b6:a03:332::24) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jonpalme-lnx.us.oracle.com (24.147.51.11) by
 SJ0PR05CA0079.namprd05.prod.outlook.com (2603:10b6:a03:332::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.10 via Frontend
 Transport; Thu, 18 Mar 2021 16:30:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c579f4a4-ec87-43a8-542a-08d8ea2b155e
X-MS-TrafficTypeDiagnostic: PH0PR10MB4565:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB456587A1FCD0C8983F5F2565E8699@PH0PR10MB4565.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: msc5QXsgqtLiCOPnMoO7W37DVzhYlvAD5FB1ImwW9E+PqjZSdHb47fIYK4BfZb1JJJYOfv+B6p22zgp2M4PaDlBxti1CmSSKUn7smD7Vn/AHB1DuuvGB1NkZLydmaIltrH1Gl1+3IH8jN49Bk2lI9ShlA9UpJgWfXJGsqrdkJzy88xkqrTo0E8DMiurMv1whi/9lToPG2dZrZuJqlt4jRT7DR4lDjqbNSZfLsniGo6dvhxv40o8pgRhSWZF/r8ql8MfDN+GWyQK9aJvcH/6VdtgGKmmvOdc6hKBh3qTVQeckumfMWTJlDmoetMD6xUSPWHJQnGXgi9eHllSmbS+VYzXcQCiZJtvGfu+VyvPD9IAWNQYczfK5rXIu+8+DVuACiChYFJLhHWc+D/ZYhp4xIMA6h6rQFzwSIjF0tX6VMWS/JvcfG0UG58p6nZhvubjDGQqgFWsI5HF/aiy8iQ7GwkDo+1/VPuxpQvKv9e11Wxf1jJv6ORKTuFC3MGZ+v667sjeE6SajdsbxLIhYp5MGB022e6/HlYp1JZ7ay5AcGzrh9G/8fpTzmkEpVEpIj7xwAtWrQHizW1VMtc1GEh1XT3E+HXLJZ2etcmAEB4ym/D38IQUdAykbFZuzQwdds043Civq4uG7wNXGEGv8Cb0l6jcnQ7lWIXlVH4NO0n0nEW3nFM5BgJoy+AfQdVC3fkHk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(366004)(39860400002)(376002)(136003)(8676002)(66476007)(66556008)(66946007)(38100700001)(36756003)(186003)(966005)(5660300002)(2906002)(478600001)(86362001)(52116002)(7696005)(8936002)(316002)(16526019)(956004)(26005)(7416002)(6666004)(44832011)(83380400001)(2616005)(6916009)(107886003)(4326008)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?PUmjApjYb487Wp/LaPD1hoZQ3G0AIjjZxth51IMsDHrNIBykK3vyk1vVbJ15?=
 =?us-ascii?Q?cAZZ/lNEQrb9ZSH48jwlteeC5zuGL8t5XjbdSZJRDsUZkqIVQ0b+6kBPsfv5?=
 =?us-ascii?Q?4j0t3Ck+2WPAU4Sy2or6A6LEjXUrc+27dUI34mA65DJFvyh7LONsJwrJ7ooY?=
 =?us-ascii?Q?vMPt4UERHrXNMCiGx3Gw51wK11yufDJyz2k3KbNxC9IVP/jl4J+tJt4/apE9?=
 =?us-ascii?Q?1YzPXx7Y2Zgs75n9gzVO6zzVX5ijPxZgxzuRti6Yp9TJVHL8bNM18Yh8ZA/1?=
 =?us-ascii?Q?2cMAYxEKH8as0+6XN9ivdqxOqNGIo5tAZHK8r9fd/LC8l7Jb2lM5TnlBFPGB?=
 =?us-ascii?Q?Yj86/x9MeTREVO3gTDyXbCKY5MVpHadZh8Wley852cic3a1Tk/nX7UZSMxpa?=
 =?us-ascii?Q?XvVWHTRPuYWcSbhNgeVkZwHk24nzTa2GZZc1aVtO0PidDfYv3ZD52NVc3A7f?=
 =?us-ascii?Q?hRWDZc9WvhozATDH/ttUn5hhq9EII4/9RT5Kv14ZxQasaK1RNTOoe9z9xNWC?=
 =?us-ascii?Q?/bUmISDhUJR/XLknMKbOtHJgNPxZLNXX9EoSkgf/H5Q0gRDAAXQyrnFEnjcW?=
 =?us-ascii?Q?0TVTvosvQN3OBgorW0jr8Z4qDvqWz2NpzLtY8cpraMnJmWencrLxUZYaJH3E?=
 =?us-ascii?Q?x4M66CmQGkYaVPSvL69SPfOmw5dnOSGQnWhhQ+lY84U++5E8uOeO4n8GQ09e?=
 =?us-ascii?Q?Ps57O4BOauTtQtT0trxFhqOOqyh/T7VOcTQCVq8qyhAdU4TN3fbXONTAMmWa?=
 =?us-ascii?Q?1M8rGwkEzC1Jze19yo8Ak8s1MnoqWH6IBkF4rRV8ihRgGgfTsjfEWWu2vf79?=
 =?us-ascii?Q?ATV6Ush1yl368wyXEEvV595rSC4zONpOkVCqoy6Bws3J2kRSwJM/owRSh7ea?=
 =?us-ascii?Q?qvUt9eY39W9mArfltsz9zijRP/3mBDK0fa8nYMpDICRcks/ZlpdmNyKaYxt6?=
 =?us-ascii?Q?xUHVeLcczW3xE6nf45/n9EM5u9pS/gNSnHORmBvY9LyD+qEsyfzx9HQj/t2V?=
 =?us-ascii?Q?24bmqyR3dEBgO7wFOivPmiXevEwq9sIxfk8eQBlx+mAVpCWGs7UqOGHyBY8x?=
 =?us-ascii?Q?3msoWFPjhdQ2TKJYwXV0/tn6duDQ5VEE9xqyryN5+nwpuCCLFFMf3Bx6YBi+?=
 =?us-ascii?Q?jWxAiykL0KidibxoLNn8wReeICKL4ObMCAdDUjGopwTqDdBB1C0pGQTbnXJ+?=
 =?us-ascii?Q?Jka5d0oxAJll5v+F4lifmu4/xmsXNsQZZdeVPMO+H+/XvK3fVdaGIizgkO/m?=
 =?us-ascii?Q?P8UVwwMbFqOuCU0/G/rnv7v9x0qyw3suZNxBAVIKk4xMOdj+KtOXntrevlwl?=
 =?us-ascii?Q?cX2ScedUBxq7ya+TMGNVRI8D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c579f4a4-ec87-43a8-542a-08d8ea2b155e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 16:30:03.6987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UkcOBcWqZvwY3X40Tc+Yu88T9VLMPZOf7WLXTNendNzIniCZyNCTnZ1ny1Lyb7RMou/9WrJSX2PlfWvs6/P3+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4565
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9927
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103180116
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9927
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 spamscore=0 mlxscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1011 adultscore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103180116
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=jonah.palmer@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, mst@redhat.com, jasowang@redhat.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, qemu-block@nongnu.org,
 david@redhat.com, armbru@redhat.com, marcandre.lureau@redhat.com,
 jonah.palmer@oracle.com, thuth@redhat.com, amit@kernel.org,
 michael.roth@amd.com, dgilbert@redhat.com, eric.auger@redhat.com,
 dmitrii.stepanov@cloud.ionos.com, stefanha@redhat.com, kwolf@redhat.com,
 laurent@vivier.eu, mreitz@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series introduces new QMP/HMP commands to dump the status of a
virtio device at different levels.

[Jonah: Rebasing and upstreaming Laurent's qmp/hmp virtio commands from
last May (here: https://lore.kernel.org/qemu-devel/20200507134800.10837-1-lvivier@redhat.com/)
which mainly included Makefile to meson.build, minor patching, etc.

I've also added new features (since QEMU 5.0) to virtio-gpu, virtio-net, and
virtio-balloon. Lastly, I've added display for the virtio device name in a
few of the qmp/hmp commands as well as relative indicies for vrings (see
patches 4/6, 6/6).]

1. Main command

HMP Only:

    virtio [subcommand]

    Example:

        List all sub-commands:

        (qemu) virtio
        virtio query -- List all available virtio devices
        virtio status path -- Display status of a given virtio device
        virtio queue-status path queue -- Display status of a given virtio queue
        virtio queue-element path queue [index] -- Display element of a given virtio queue

2. List available virtio deices in the machine

HMP Form:

    virtio query

    Example:

        (qemu) virtio query
        /machine/peripheral-anon/device[2]/virtio-backend [virtio-scsi]
        /machine/peripheral-anon/device[1]/virtio-backend [virtio-net]
        /machine/peripheral-anon/device[0]/virtio-backend [virtio-serial]

QMP Form:

    { 'command': 'x-debug-query-virtio', 'returns': ['VirtioInfo']  }

    Example:

        -> { "execute": "x-debug-query-virtio"  }
        <- { "return": [
                {
                    "path": "/machine/peripheral-anon/device[2]/virtio-backend",
                    "type": "virtio-scsi"
                },
                {
                    "path": "/machine/peripheral-anon/device[1]/virtio-backend",
                    "type": "virtio-net"
                },
                {
                    "path": "/machine/peripheral-anon/device[0]/virtio-backend",
                    "type": "virtio-serial"
                }
             ]
           }

3. Display status of a given virtio device

HMP Form:

    virtio status <path>

    Example:

        (qemu) virtio status /machine/peripheral-anon/device[2]/virtio-backend
        /machine/peripheral-anon/device[2]/virtio-backend:
            Device Id:          8
            Guest features:     event-idx, indirect-desc, version-1, change,
                                hotplug
            Host features:      event-idx, indirect-desc, bad-feature, version-1,
                                any-layout, notify-on-empty, change, hotplug
            Backend features:
            Endianness:         little
            VirtQueues:         4

QMP Form:

    { 'command': 'x-debug-virtio-status',
      'data': { 'path': 'str' },
      'returns': 'VirtioStatus'
    }

    Example:

        -> { "execute": "x-debug-virtio-status" 
             "arguments": {
                "path": "/machine/peripheral-anon/device[2]/virtio-backend"
             }
           }
        <- { "return": {
                "device-endian": "little",
                "device-id": 8,
                "backend-features": {
                    "transport": [
                    ],
                    "type": "virtio-scsi",
                    "features": [
                    ]
                },
                "num-vqs": 4,
                "guest-features": {
                    "transport": [
                        "event-idx",
                        "indirect-desc",
                        "version-1"
                    ],
                    "type": "virtio-scsi",
                    "features": [
                        "change",
                        "hotplug"
                    ]
                },
                "host-features": {
                    "transport": [
                        "event-idx",
                        "indirect-desc",
                        "bad-feature",
                        "version-1",
                        "any-layout",
                        "notify-on-empty"
                    ],
                    "type": "virtio-scsi",
                    "features": [
                        "change",
                        "hotplug"
                    ]
                }
             }
           }

4. Display status of a given virtio queue

HMP Form:

    virtio queue-status <path> <queue>

    Example:

        (qemu) virtio queue-status /machine/peripheral-anon/device[2]/virtio-backend 3
        /machine/peripheral-anon/device[2]/virtio-backend:
            device_type:            virtio-scsi
            index:                  3
            inuse:                  0
            last_avail_idx:         4174 (78 % 256)
            shadow_avail_idx:       4174 (78 % 256)
            signalled_used:         4174 (78 % 256)
            signalled_used_valid:   1
            VRing:
                num:            256
                num_default:    256
                align:          4096
                desc:           0x000000003cf9e000
                avail:          0x000000003cf9f000
                used:           0x000000003cf9f240

QMP Form:

    { 'command': 'x-debug-virtio-queue-status',
      'data': { 'path': 'str', 'queue': 'uint16' },
      'returns': 'VirtQueueStatus'
    }

    Example:

        -> { "execute": "x-debug-virtio-queue-status",
             "arguments": {
                "path": "/machine/peripheral-anon/decice[2]/virtio-backend",
                "queue": 3
             }
           }
        <- { "return": {
                "signalled-used": 4188,
                "inuse": 0,
                "vring-align": 4096,
                "vring-desc": 1023008768,
                "signalled-used-valid": 1,
                "vring-num-default": 256,
                "vring-avail": 1023012864,
                "queue-index": 3,
                "last-avail-idx": 4188,
                "vring-used": 1023013440,
                "used-idx": 4188,
                "device-type": "virtio-scsi",
                "shadow-avail-idx": 4188
                "vring-num": 256
             }
           }

5. Display element of a given virtio queue

HMP Form:

    virtio queue-element <path> <queue> [index]

    Example:

        Dump the information of the head element of the third queue of virtio-scsi:

        (qemu) virtio queue-element /machine/peripheral-anon/device[3]/virtio-backend 3
        index: 122
        ndescs: 3
        descs: addr 0x7302d000 len 4096 (write), addr 0x3c951763 len 108 (write, next), 
               addr 0x3c951728 len 51 (next)

        (qemu) xp/128x 0x7302d000
        000000007302d000: 0xce 0x14 0x56 0x77 0x78 0x7f 0x00 0x00
        000000007302d008: 0x05 0x00 0x00 0x00 0x00 0x00 0x00 0x00
        000000007302d010: 0xf9 0x00 0x00 0x00 0x00 0x00 0x00 0x00
        000000007302d018: 0x4f 0xf9 0x55 0x77 0x78 0x7f 0x00 0x00
        ...		

QMP Form:

    { 'command': 'x-debug-virtio-queue-element',
      'data': { 'path': 'str', 'queue': 'uint16', '*index': 'uint16' },
      'returns': 'VirtioQueueElement'
    }

    Example:

        -> { "execute": "x-debug-virtio-queue-element",
             "arguments": {
                "path": "/machine/peripheral-anon/device[2]/virtio-backend",
                "queue": 0
             }
           }
        <- { "return": {
                "index": 122,
                "ndescs": 3,
                "descs": [
                    {
                        "flags": [
                            "write"
                        ],
                        "len": 4096,
                        "addr": 1929564160
                    },
                    {
                        "flags": [
                            "write",
                            "next"
                        ],
                        "len": 108,
                        "addr": 1016403811
                    },
                    {
                        "flags": [
                            "next"
                        ],
                        "len": 51,
                        "addr": 1016403752
                    }
                ]
             }
           }

[Jonah:
Comments:

One thing worth mentioning that this patch series adds is some maintenance
burden. More specifically, the following would need to be done if a new
virtio device type (with features) were to be added:

 - In the new */virtio-<device>.c: add #include "qapi/qapi-visit-virtio.h"
   and define a qmp_virtio_feature_map_t map structure with device feature
   entries (e.g. FEATURE_ENTRY(_FEATURE_))

 - In qapi/virtio.json: define a new enumeration of Virtio<Device>Feature
   (including its enumerated features) and define a new
   VirtioDeviceFeaturesOptions<Device> and add it to VirtioDeviceFeatures

 - In hw/virtio/virtio.c: add a case to switch statements in qmp_decode_features
   and hmp_virtio_dump_features

If you're just adding a new feature for an already existing virtio device:

 - In */virtio-<device>.c: add the new FEATURE_ENTRY(_FEATURE_) in the
   device's qmp_virtio_feature_map_t structure

 - In qapi/virtio.json: add the enumeration of the new virtio device
   feature in the corresponding Virtio<Device>Feature JSON structure

In the previous patch series (v4) there was a comment regarding the
implementation of the switch case in hmp_virtio_dump_features. It would
be nice to not need to explicitly define a case for each virtio device
type (with features) here, but it's not very clear (to me) on how this
could be achieved (and optimally we'd probably want something similar for
qmp_decode_features as well).

The suggestion to this problem (from last May) was to do something like:

    if (features->type < something_MAX) {
        features_str = anarray[features->type];
        ...
        monitor_printf(mon, "%s", features_str(list->value));
        ...
    }

But, (1): the device type enumerations were changed to "flat" enums in v4
and, as I understand it, flat enums have no value associated with them so
we wouldn't be able to use it to index anarray. And (2): not every virtio
device has features (e.g. virtio-9p, virtio-input, vhost-user-fs, etc.)
so we'd still need to take that into account and filter-out those devices
as well.

I've looked at it for awhile but, at least to me, it wasn't obvious how
this could be done.

Note: for patch 5/6, checkpatch.pl gives the following error:

   ERROR: "foo * bar" should be "foo *bar"
   #329: FILE: hw/virtio/virtio.c:4164
            type##FeatureList * list = features->u.field.features;

But doing both 'type##FeatureList * list = ...' and
'type##FeatureList *list = ...' give errors, so I just left it as the former
representation. ]

v5: rebased for upstream
    add device name, used index, and relative indicies to virtio queue-status 
    HMP command
    add device name to virtio queue-status QMP command
    add new virtio device features

v4: re-send series as v3 didn't reach qemu-devel

v3: use qapi_free_VirtioInfoList() on the head of the list, not on the tail.
    Prefix the QMP commands with 'x-debug-'

v2: introduce VirtioType enum
    use an enum for the endianness
    change field names to stick to naming convertions (s/_/-/)
    add a patch to decode feature bits
    don't check if the queue is empty to allow display of old elements
    use enum for desc flags
    manage indirect desc
    decode device features in the HMP command

Laurent Vivier (6):
  qmp: add QMP command x-debug-query-virtio
  qmp: add QMP command x-debug-virtio-status
  qmp: decode feature bits in virtio-status
  qmp: add QMP command x-debug-virtio-queue-status
  qmp: add QMP command x-debug-virtio-queue-element
  hmp: add virtio commands

 docs/system/monitor.rst      |   2 +
 hmp-commands-virtio.hx       | 162 ++++++++++++
 hmp-commands.hx              |  10 +
 hw/block/virtio-blk.c        |  23 ++
 hw/char/virtio-serial-bus.c  |  11 +
 hw/display/virtio-gpu-base.c |  10 +
 hw/net/virtio-net.c          |  35 +++
 hw/scsi/virtio-scsi.c        |  12 +
 hw/virtio/meson.build        |   2 +
 hw/virtio/virtio-balloon.c   |  13 +
 hw/virtio/virtio-iommu.c     |  14 +
 hw/virtio/virtio-stub.c      |  34 +++
 hw/virtio/virtio.c           | 574 ++++++++++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio.h   |  14 +
 include/monitor/hmp.h        |   4 +
 meson.build                  |   1 +
 monitor/misc.c               |  17 ++
 qapi/meson.build             |   1 +
 qapi/qapi-schema.json        |   1 +
 qapi/virtio.json             | 600 +++++++++++++++++++++++++++++++++++++++++++
 tests/qtest/qmp-cmd-test.c   |   1 +
 21 files changed, 1541 insertions(+)
 create mode 100644 hmp-commands-virtio.hx
 create mode 100644 hw/virtio/virtio-stub.c
 create mode 100644 qapi/virtio.json

-- 
1.8.3.1


