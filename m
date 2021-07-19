Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 513CB3CEC39
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 22:14:33 +0200 (CEST)
Received: from localhost ([::1]:34942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Zeq-0004PH-Ch
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 16:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1m5ZRk-0006Nj-Et
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:01:00 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:12232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1m5ZRf-0005iy-U0
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:01:00 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16JJuFa2017810; Mon, 19 Jul 2021 20:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=MsrwfBv4Fx2UFSWEbJUtmCDGEzMXHuBm1jHzVSoYl44=;
 b=v2Rd0Z3aP39rfrJCefRVidVdb5GCDWCIXrxPIzo8rvurvUtM4ecZduIPQ8ZvGgaFsV/l
 Bn/KQFvIOLqAoo+ebKdDIGVy3yOcU5mnugKHQqxNXbYzSwZD4Z6yTMND4TRtuR/wDzEL
 igh6sOAJA5yXrShop8ovyiCkLIvAi2quOOcOfUtNvahdhhEXAyJva6UQYLmWVaLEnSsB
 ydefYGxgkEuRBcr/Y+EhdzftQzqIXxhpHNnTYaKvvEcklpnav/l+FaYlbRJLH4o3TsSe
 OOEvCG+Vt/3Abjf5ZFyNqxmIAQmvUCpiOsjia3uePRzJfYdrWw/TMq8Jl2Endw6jaaBq SA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=MsrwfBv4Fx2UFSWEbJUtmCDGEzMXHuBm1jHzVSoYl44=;
 b=tILh2qxkbDJHj5LCYIpTvNwVtYlRUofJ3UR2pT4T9Qz+YxMpQBTfEDEMIg+/10dW1z0a
 UJu539tNF/xKB1DNawXXs7MhPYuhE7xXRrXFkj6hZM13LN1tD4OjwInrHP5inntIQWZz
 bYeaUUtqRsWUjVvRtSYo41ypK3x6yitnmNT01hsIkRMjf6EtW3mEYqewI6QxJKSAx3K9
 NBPpruRWUFP+PRlsvHTmhV3+wnRHabQdokhYTn5Z2fA/lpkcT6HXM4z/g7WYZShE+B4E
 Xo98fIt5gmz9Il2J9xEyfaeilibqpSQZoqM1EN+k1S+4UUAkQgjWh1fubF75Toy/XGkO Uw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39w9hfs0cw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 20:00:52 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16JK0WYp127596;
 Mon, 19 Jul 2021 20:00:49 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
 by userp3020.oracle.com with ESMTP id 39v8ytbghn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 20:00:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=crinxgf9eyJtZ7uUJxSh2J/joRw9QWvXafmHriRq8fZOADEhfFjKUk6EcWZljjoY4ugvfk/QusLbd+aOOnkttdc7SAN5FjQFLfrn4hD7DlA7rGSeptr14MjBOLUY+SrruowTDcJJ7oEXWqsgrCTGy8ElmJdQldsQLhmyWjMOfZgmPQekMf9fdSQO1x32Z8yOaXG1wh0+EuFn1h0wPIj/o7FjOzkE+l/qu0QJz+58cmUgGb/wZvuxIyWkK6/uFrV68tVdOvlYAvLKJwA2emfWs9iJsQ3A/t+C8yJdffSxRwF+2gMHc45efBChMFGiSggQbfPOpuCTxfLX6yEKWNwCTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MsrwfBv4Fx2UFSWEbJUtmCDGEzMXHuBm1jHzVSoYl44=;
 b=d/7BsrlE5nB/IuNpJE0TlzvND19lvcURbktcqXc4F6y9Fi/VUSxiicW+YXSh7xUcNTn24//pWDhePow2o2FtEbVbdPGEnLepF6KDH10w9xb4ilDrFbFxq90QHyUgktcqiongJYwxNwOI34O6um4kxcqWWI52UCS5iCQbxtbLEKDmGi6A23DMhRWc2SfJeXQKHmVUBlnI7WDjwnSLETLqH7lwpeRo+Uia4eyVF3MpNRa9XGCuQT5XbxG0ljuZqQ7om7mgZAEk2JjmV/YT56nXotZ+HIjY7AVPxfgWGQ4C+sNLyfTpUIncoYDY/RFlb7vZ0XTgFMjjBcOxijV0fUw8fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MsrwfBv4Fx2UFSWEbJUtmCDGEzMXHuBm1jHzVSoYl44=;
 b=pRmhj8ND+F1p2/57LlzNFrs7SHSpR5sB7nzRLpOKbac7Z6yGKPVzit8jbiIxeD4k+mkEhJnDaeaoXCr6Ni1TRgmRFXZ0xMfRTxpgD1fDGb+tcjeLH4GVOuRYB8/997/uu4fB7eCEyx0jaOoANDgioc1RNI4HxEpLGpuQdXwyt08=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB4240.namprd10.prod.outlook.com (2603:10b6:208:1d9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 20:00:17 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e935:82a8:3c37:8aa4]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e935:82a8:3c37:8aa4%4]) with mapi id 15.20.4331.033; Mon, 19 Jul 2021
 20:00:17 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC server 00/11] vfio-user server in QEMU
Date: Mon, 19 Jul 2021 16:00:02 -0400
Message-Id: <cover.1626722742.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1626675354.git.elena.ufimtseva@oracle.com>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0040.namprd11.prod.outlook.com
 (2603:10b6:806:d0::15) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jaraman-bur-1.us.oracle.com (209.17.40.44) by
 SA0PR11CA0040.namprd11.prod.outlook.com (2603:10b6:806:d0::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 20:00:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc1213cc-b567-46ec-6fc6-08d94aefd48f
X-MS-TrafficTypeDiagnostic: MN2PR10MB4240:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR10MB42402CE51305AA68F1D456FC90E19@MN2PR10MB4240.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ffWM3pITC46+9NBjTcKMoSrYJk09fXd5rWb6TR6jmv9FHna5uc9xrl//7VUuRvn0oQkh7KcspNOHuxk7obE5VsgfXB6Zr1yWQ5FYojwi+uIy/oKm/vMUf2kODZbjpPzThdCB32H5k0wUWUu4PcL//XpMaOZLIUfeL26WAPxUiPu5ePasD5L3LTsSW9ezt07fG1/8vwYZo+VGt70oJbJsEXU/kntZDyzIoxaY/TOtZS9HqrSEPJY3eSKMNhX0LdQB0DPk+Teo8CFhp/sEQeGIRVPQ5Y4ZlcX20UEfmbY1d4SWg4cR3UnWRXWwo+IX23zSkcDuiHnqP8098iLh7dn+MjlltLRs+0K1bWEAUNG+2mbaHMkYTgh0LpqG9RwkljiD9ZSfhBcNQqD2i0yhnOHSI3cAiwhhz0l2r6ShasmPGaIBgsUpexKp7IjtdfV1c/j/F5Mx4ta0LsVKJLFETNWzLpmRXjPSJ5zMLSTMBvFGcnTko2Vrp3/u9bkXct1ASifA5fNLQOEycqWTxif28PdJUQauOs8exQ9LeHH6XllYFurAQlaPdU2XebRAWFjKhV+oZxydMaWuiPWLaUUvjTSTg0go08agFKY1ynbIsOP2RQ/lKXg4y2KNa08JHoXcLHWaSUSoP5qrbvvA3UEC4p5/bGCqbLby8ExSTrf2I3kURKwebY/+mHgoXKCs0tunvxh40opNRow2YqPOYXeFheHZ08WY8AAo0JSumBlh3PaJXVE9oEkdsZ9SsuBcNaEK0oU0Kjit5Z9ZwKIky3BizSiyBoXt9jjx7ooYHggrhaYAJAsNpLtPAeCBId8n9HRB3Dd1ylGxBZqGiqdQqEQvZ6Sfzg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(366004)(346002)(136003)(376002)(66476007)(966005)(66556008)(8936002)(6486002)(66946007)(36756003)(478600001)(52116002)(38350700002)(7696005)(4326008)(38100700002)(316002)(107886003)(6666004)(6916009)(2906002)(5660300002)(186003)(26005)(83380400001)(8676002)(86362001)(956004)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: BWkK0howlfXWhRfFy0uo2utpnv9EKLh39wVLWoIoSgb2zcCWN2koNrLtDq4eLqK/OXkibZdvcqD1xbiNGR4U8JFVwIdv9qSzz1rMXjqTjGJIF3kuRFGdM6cqtnyJquMuB+Xw9Y6fpFoU8DpcSfHNMvfbPj0zGJDXKuOq463mioCsHYL+nEamNgpZ2zL0zrWgV8KMPNM7VtFT3EgCpIvQ9ZWUAaHI563hkLgQNbuNLP+C1lWrIk/0ScsMMEtG1JEeJlxQ18keFrcW5FnD6zLV07YdXGCoqwPcHOZfHp5jwzfitqINtL72yeGzUV3FToGEGlrXOkYkkisYa63Xm3rNOTUXksPOFdgJ2lxukC20NP0YrMxAi1Al7ev0IAMTKPd8XRBnjSfqXkuYX5Lr9UlRJvBwi0RgfB/50UjzgqEqTiYRnkq/8HyrWnWT9QfrAbErKj5wxZoLgVL4pWcf/SLgxmhZxmCg61uBb029C05nNOO480jNk1eoYTt6X3cNWCyOthtZc1zevEd9CkyySVrIOPO0yL55poo3WeF7uigvolSdZn46YSsre1KdDJADbcnz68KTcL1ENZ27mk/zJTHZLt70o6k155n/eBxLtTxaY/NZQ+sZcMZ9HhZbvohwCrCHSEJLAtvuv7a0emZBQoUtftywPdrUNtDjgNWp2v9XYK+WP13QHaihQZbqKYWx+hne8SPE+iYCfgjRklQHNWWUCzdSEsLbcaK0qe7RCiKQNWT0eu1Qv/omaHwA5lwwSO+/
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc1213cc-b567-46ec-6fc6-08d94aefd48f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 20:00:17.5224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1zIiv4IV05e7GAm6iONJlo0viOmtG3oHL7MCTy3Z6v9XPAF6s9C4QF25NEUo5L0pziBpEThRKDxG+fVDQdO2LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4240
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10050
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107190113
X-Proofpoint-GUID: Y0PhoKAfCdtcKkPrW7J9VeeycJQjeVnX
X-Proofpoint-ORIG-GUID: Y0PhoKAfCdtcKkPrW7J9VeeycJQjeVnX
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, jag.raman@oracle.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, alex.williamson@redhat.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This series adds on to the following series from
Elena Ufimtseva <elena.ufimtseva@oracle.com>:
[PATCH RFC 00/19] vfio-user implementation

QEMU enabled out-of-process device emulation with multi-process [1].
multi-process used a custom protocol to interact between the client
and server, which is not desirable.

The vfio-user user protocol [2] implements a VFIO based mechanism to interact
between the client and server. Since VFIO is a well-established specification,
it is preferable in terms of maintenance. It makes sense for multi-process to
switch to the vfio-user protocol.

Nutanix implemented the vfio-user protocol in their libvfio-user library. The
source for this library is located below:
https://github.com/nutanix/libvfio-user

Elena previously sent the patches for the vfio-user client.

This series implements a vfio-user server for QEMU. It includes the
libvfio-user as a git submodule to QEMU, and builds it along with QEMU.

We would like to make the following notes:
  - Some of the existing multi-process code would become obsolete, and would
    need to be removed. This series does not remove them to keep the number
    of patches to a minimum. We will address them subsequently.
  - The libvfio-user library needs json-c package to build. It looks like the
    GitLab CI images used for build test don't have this package. As such it
    causes build failure.

The patches from both series are available in the following github repo:
https://github.com/oracle/qemu.git
The vfio-user-client-server branch provides the same patches along with a
python script (scripts/vfiouser-launcher.py) to launch the VM.

Contributors:
John G Johnson <john.g.johnson@oracle.com>
John Levon <john.levon@nutanix.com>
Thanos Makatos <thanos.makatos@nutanix.com>
Elena Ufimtseva <elena.ufimtseva@oracle.com>
Jagannathan Raman <jag.raman@oracle.com>

We are looking forward to your comments and questions.

Thank you!

[1]: https://patchew.org/QEMU/20210210092628.193785-1-stefanha@redhat.com/
[2]: https://patchwork.kernel.org/project/qemu-devel/patch/20210614104608.212276-1-thanos.makatos@nutanix.com/

Jagannathan Raman (11):
  vfio-user: build library
  vfio-user: define vfio-user object
  vfio-user: instantiate vfio-user context
  vfio-user: find and init PCI device
  vfio-user: run vfio-user context
  vfio-user: handle PCI config space accesses
  vfio-user: handle DMA mappings
  vfio-user: handle PCI BAR accesses
  vfio-user: handle device interrupts
  vfio-user: register handlers to facilitate migration
  vfio-user: acceptance test

 configure                     |  11 +
 meson.build                   |  35 ++
 qapi/qom.json                 |  20 +-
 include/hw/remote/iohub.h     |   2 +
 migration/savevm.h            |   2 +
 hw/remote/iohub.c             |   6 +
 hw/remote/vfio-user-obj.c     | 754 ++++++++++++++++++++++++++++++++++++++++++
 migration/savevm.c            |  63 ++++
 .gitmodules                   |   3 +
 MAINTAINERS                   |   9 +
 hw/remote/meson.build         |   3 +
 hw/remote/trace-events        |  10 +
 libvfio-user                  |   1 +
 tests/acceptance/vfio-user.py |  94 ++++++
 14 files changed, 1011 insertions(+), 2 deletions(-)
 create mode 100644 hw/remote/vfio-user-obj.c
 create mode 160000 libvfio-user
 create mode 100644 tests/acceptance/vfio-user.py

-- 
1.8.3.1


