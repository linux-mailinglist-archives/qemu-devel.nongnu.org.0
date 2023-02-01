Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E754068653E
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 12:19:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNB7V-0003jr-G7; Wed, 01 Feb 2023 06:17:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNB7N-0003er-Ew
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 06:17:34 -0500
Received: from mail-vi1eur04on0727.outbound.protection.outlook.com
 ([2a01:111:f400:fe0e::727]
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNB7K-00059m-9l
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 06:17:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nNJIdcbOcjiB8P3EaqQQgBtlufGfcyfjGb+3wI33Lnv7QlAA8UTZeb24DCQqMB2cOABih9s3MnsfRBatiy7FijY7BSOUL8w+8M+qyMN6YNZdSDZRGfOkO4PbdwCOwccw3RHPOnuHcwaqIC3lqWWJXeVXzbAFxNNV29MXcTHSUuro6Ak5Cgcirnoa3FFj8BAbruv/v4k91ak7+S4CDKYF6ZuIPitDa0BI6HTXJufbS0sMzR51sbgphIEtTFFPQ5OIQBh9ok5Y/lr72haeKEvxLvn2YmyzS8HAqQ+cvGn9wIGU9/E02FkCjJ9/f/Mzfy45DPG0SyWq38S/c/UfwlOyTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WNZWosdRBJLSsQb9QhRstBHetxfR2I6yPzrY48PnTq0=;
 b=DJg4VHX9BkgM/qvTvHk7zfKvboQT3QuywHCwJio8vjn31gVJr/N+LRndsfCKcoiLeo4i0S7+VJRzV8A7jqvsC6zU9zQs37LV49PjHX44ABx1sten9SXf8LTJELibLyd6QaV1JzsbDK4PS6k3u7mWvNJ9skYy80ZsTRqUm3hAflU2hp6gMXaYz10EaEZS8MtRYJ1vJ4r9muNv7sosf+t0qvgob55xt6IczmfpNSU472KqN1IgP+ig6nuysJttN81rurgnZkaLJ/Yp9XJBNtvDNcK0NzlJ/DUeqfvxstvng4hfnDKGr9IAWlEzmuwx5f5sqiLUclR73lxwlYf1yaFPpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WNZWosdRBJLSsQb9QhRstBHetxfR2I6yPzrY48PnTq0=;
 b=KGAgxauT+ByJJs0qNf1tv5/oSiyvi0E5iDjb17t24/QudIpXNw+bOy2ty/cxhTYq3d3ug/kOZQOTBp4SbpBpY/RGgXC+nMtPH52D0IfwAzXaj3KVUMWQA8jQWd75kFuBbo5dhB6XbHaMN/og07BcOgrRfhmTx/r9qKRt9Z4S2aI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB5P189MB2551.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:489::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Wed, 1 Feb
 2023 11:17:25 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%8]) with mapi id 15.20.6043.038; Wed, 1 Feb 2023
 11:17:25 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v4 0/9] igb: merge changes from
 <20221229190817.25500-1-sriram.yagnaraman@est.tech>
Date: Wed,  1 Feb 2023 12:17:13 +0100
Message-Id: <20230201111722.28748-1-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0015.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:fa::13) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|DB5P189MB2551:EE_
X-MS-Office365-Filtering-Correlation-Id: 6474d590-8a8d-4c90-4d5e-08db0445e548
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PrBRiqyemBwVguMkql+ajNwiDTuh6mRzo/5du1t+PBh3NVKi9V6clduwi8NnTvNliLvNXRd46DVTcox9fGcM1WuPZBoUgdJcVn21BJY1TkBrjZGrTVlf21t3fuEcpvLGwItcGdK+B+7YWSHDqowBAj/wSI045v+Cl9BynFfT2OUEKlcUAbSvOqcqzuM75ESUck+n+fF3SJ29pZCVhOSC06TMAqzSDDsfbWVbsgrNu6f+bgURMrY+gGI6t18ylpBqTWgcypaAs9th3w88CMUVAlyyNNHwl5ByB/yswrrSgiZw26+flDwol9IwUNe1vPJ1lNaPtcJH78WEOKRqD82nBH0TuD1/eLqDfCFJIc09IJe5y3bkKEODJZshu2QMUeuluLexvCR8rk691KyLnGKKrVeK59TYDCftHm3GmaRqJ1+XtBxGlXh4fkxWMp0pdmWnwQjFwXeTdCGLJvEo3NZA2QWYoS43xRQQyZJCTS0U/hq8ii/M5H9tLUNCEqO5SPHNGwAeIUhs3+lXdii82e6diZFQQg/WKIat4KtgFT91sDYEGihChQ86GHo7nMY8syAi6w0vVN2dyFOzvyFpyOYojM0TzGyDabgTaG2zHTOpMN4PCkIsOxkcFaIAbkURIffPPhTrRCv4M0qvvOUI/uJL+Ev6agvsuP1YnxVyeyCy/iPQTjC1t1yE0/WtLTtb9G9g4uYGDQaVZYDRWBD05nDYZuSrGAEU4ELEt14s7q26eic3s4h84w29yeNwJgFtS487
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(39830400003)(376002)(346002)(396003)(136003)(109986016)(451199018)(36756003)(2616005)(6666004)(6486002)(966005)(478600001)(2906002)(86362001)(38100700002)(8936002)(54906003)(1076003)(6506007)(66556008)(8676002)(5660300002)(316002)(41300700001)(44832011)(66476007)(66946007)(70586007)(4326008)(26005)(6512007)(186003)(83380400001)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JCIzn5HdIQdETuB7Q5DFjPj2NR+3sqIIeoyaAsrVwIAOE51UTGHFSz9oMs4Q?=
 =?us-ascii?Q?/q5QmydJqr1WyGYkRxMDrrnkuzVWiOQbsV+zJhbLW9oyhf0c39wFEnc1a/MQ?=
 =?us-ascii?Q?t7CfT5Ch6IClGWf+aPwmtRBIeGMuH0ayri5bmq1f5FpZ43CgRScMtFd9WJYd?=
 =?us-ascii?Q?oOidonK4CgInc/+JVPzdTntvDA9EWjIQE9so2AnjYDwgeX+61ksY6cf6+pqG?=
 =?us-ascii?Q?uKf/Mdb3bQTwVqyQdoEKPwMCSRtl0i2QWJ+FfWsLKaH5WpmCgMvaSuUiS8PK?=
 =?us-ascii?Q?E7kZJwNXzuZ/M35FJUuw4xkBeT2mUL2jcVPrkxJOd1y2ow1dv39wb1u7xN54?=
 =?us-ascii?Q?lnwwqmOwbLdsm96Ls4SEES3K1oQ72og6I4dZNX5MuVbhT7YQJDsRzj/+1ROz?=
 =?us-ascii?Q?Uez+QXI2cbkXxrXC6JaaT8wpCSw0sJnQdyQNU40Dm5H1YS+gMQPJ76SDRMlS?=
 =?us-ascii?Q?aTqoJ2uAK6TMdGNXrZh2aryHGZXEIp08GFt3AOQ+8MxZrlMB726Pbqf0ioky?=
 =?us-ascii?Q?E3VTZbKn6ChtCZSc9xD78sisbDcaw5SSknt8XFdjqxQieMhCmcTyV+T0S3N/?=
 =?us-ascii?Q?Yf8W98vwSTMbcMp3Q/KYCFgtav99hF8N/pZHccaJKhk/9TAGf8+vb1SxF0pQ?=
 =?us-ascii?Q?g1oEl+WyXlrrIJYgYrK9Yh7jKSQeNa6gEcnlqlFC9eZqIuPAcKldwWEbIIjS?=
 =?us-ascii?Q?PBHGbLY8+cZZ2nBA+E3dwpus/MZWJ+lUijj8F7nfkMf3HA1zzzY7KCCQyFmH?=
 =?us-ascii?Q?u0gvqBooPeLhgohO2lWK6qr1b2aZ+bTx5F387MC3M5S4oSB+4etWCE7jwFXA?=
 =?us-ascii?Q?wIwWJwcwovN6fAelvfZsqVB9Gbxt3xfMPBMHAIl7GOHMFyuH0fDq2MibGNkP?=
 =?us-ascii?Q?K/bo64hSpaf5ae8LI4EURi8Pbt8aNHUKTUfUrNzCd5EnFRt60bjQAwBOsGDx?=
 =?us-ascii?Q?HeBlPSvNnniPXdIqQL2jSxqaeEXWle24w6U5TjmJZCqsWu48wL41LFmqamaU?=
 =?us-ascii?Q?M7Y/JjWkF6hoKvr4jqmFfWeUSXr5j9NHAHL3ZIz5waBObgrU5dRQjFyfxM3L?=
 =?us-ascii?Q?FOET2cenQHJu0LLsCsYZYFXqEph1VFzYbwDVqHKdCYZibawgrqRjybqPcMIe?=
 =?us-ascii?Q?UbqxpmvhpmWmKeymNaOzTQHV/lzcSp7gkmIkniIk8Bm1WTj2hvXfs+h25Z7N?=
 =?us-ascii?Q?uKbWnEv/GPhGdW9v314p/VgEf4kThitQb30z82TiFvlriPS7qzCixUk3PB9B?=
 =?us-ascii?Q?OLIwpVjR7OlsdrPj3uX4ts/YbBWbtdyMK7bRgiX8T2ZAKMmCYYzWrJ6IqHCB?=
 =?us-ascii?Q?vKuEMA5xwSM9CW9IKWRakkcIYcN5LGvVINNLuwRR2KKpOJDwzX/6nHXoknTk?=
 =?us-ascii?Q?UMgzXuYCYVVUQNKq+YSoKQardOFp4aYVb6lRbxTZplpKJtpIcNZf/AKuURRW?=
 =?us-ascii?Q?UOHyUrlqIWoTmZxfCk8DpZjS9s17czQB25TfPIPa2+KyoeFlBrSBSJzZHSWy?=
 =?us-ascii?Q?qOszdxEhahl+c5teIFVc63olehE8DxbhKmjWzjvvFLwEr8sc/cyZbvt4fetH?=
 =?us-ascii?Q?+P0cBo/fHtYvzN4ynu4vEPuAwbpA7f2LoWSaSUbUmgwkVffl8zXYP+f7upz+?=
 =?us-ascii?Q?+g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 6474d590-8a8d-4c90-4d5e-08db0445e548
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 11:17:25.0126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lRs+mZFf+MnfP0DNzshRy9N8clAWefKDa2qMol84nqbWxNaA6oaBT6jh58oeaxhkvK01oDvua++ehySt6IzPTU7gDeUlv7CGlrB2gLJL5Ak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5P189MB2551
Received-SPF: pass client-ip=2a01:111:f400:fe0e::727;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001,
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

Based-on: <20230201042615.34706-1-akihiko.odaki@daynix.com>
([PATCH v7 0/9] Introduce igb)

Rebased on latest changes from Akihiko, and merged changes from my
original patchset:
https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg04670.html

Changes since v3:
- Fix comments
- Rebased on latest patchset from Akihiko
- Remove Rx loop improvements that Akihiko has pulled into his patchset

Changes since v2:
- Fixed more comments from Akhiko
- Reordered the patches to make changes easier to understand

Changes since v1:
- Fix review comments from Akihiko

Sriram Yagnaraman (9):
  MAINTAINERS: Add Sriram Yagnaraman as a igb reviewer
  igb: handle PF/VF reset properly
  igb: add ICR_RXDW
  igb: implement VFRE and VFTE registers
  igb: check oversized packets for VMDq
  igb: respect E1000_VMOLR_RSSE
  igb: implement VF Tx and Rx stats
  igb: respect VT_CTL ignore MAC field
  igb: respect VMVIR and VMOLR for VLAN

 MAINTAINERS          |   1 +
 hw/net/e1000x_regs.h |   4 +
 hw/net/igb_core.c    | 204 +++++++++++++++++++++++++++++++++++--------
 hw/net/igb_core.h    |   1 +
 hw/net/igb_regs.h    |   6 ++
 hw/net/trace-events  |   4 +
 6 files changed, 182 insertions(+), 38 deletions(-)

-- 
2.34.1


