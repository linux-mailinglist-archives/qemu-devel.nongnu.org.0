Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF56680EDF
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 14:28:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMU8q-0000UP-O2; Mon, 30 Jan 2023 08:24:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMU7t-0006bm-P7
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:23:13 -0500
Received: from mail-db8eur05on2071e.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::71e]
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMU7r-00069g-Mx
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:23:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnnnD+TuHnyrK8895K6shqzuxnZB57Wa50s431xyBi6PJ5yGCaICteRRcoChguuesE8FrMimWBxou2bXvAjiPjrcbqyMTD/v7oi6g7C+N1jUIu4w39nNzr4PxQTI7i1NNl1UAzJj00CLl6HRK8/eC5hAlX8QhNQnHWsJa+X3ugHIQI1XtxfdBsdF5RvsAUeEuqb7Y5fLDvPoFws2qxnPo2Jei9QdV3933vpd8w9UzrSX3lpaXjHgrU2imgMSv7cV4QsD/PyiXQD/ekvF2uLdzbvx//i+gSqt1hDXDfaTlOhEGgFFS2v63btachm9oaKXq/1ssUxLFNXVmSPasXcsjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nWrow8M34OP3sZEH6I60eFyKh9NcOiFUb1sulU95NrE=;
 b=YFd5EzJqn5eDb4MNnzoJ7NGhd0Pyzyzx299+a2ksm+rT8u5GEQD62jcRpQx1a3sGQQEQMsqvQP96IYhvveRNY2I+MIGFLsvyiDpQPS/twp7oDGw57mJtAmk0JqhYEalcFdLE9RGAuHln3PZdzjcSlQ7T0qXbtKuQqY1DYImXDVqbiESZ1hCFRo+23HjXXyr0b3EOnq77FvdUP1V8DPMKs5R/NI7JZ/FLm6VRx24odV+wvKxHL8O8fHevCmBSJkLKqiL9qSAwjEFCTLVq3QqFyVjFE3D7mwLh4TwqtM4Th+76QaiuiZPLQacaT4MSpvnvyBUe6mhlbBi3D4wQdRg8Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nWrow8M34OP3sZEH6I60eFyKh9NcOiFUb1sulU95NrE=;
 b=hWxl4h5xCaahT6F9ZphgPRUTe/VphuWG0S1CcA0waOD9o8fYC+9cD49fjyFFyxNap5DWuCFJEyghvZawnR3zP9j+OocqCKx6hTIsW26iWI0eMVby3o6EbciNIwlfrNMjccG+sNcoyKPCc5gmWUiso/5gcNurSdUXIvhrmpjhzmk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DU0P189MB2225.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Mon, 30 Jan
 2023 13:23:09 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 13:23:08 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v2 0/9] igb: merge changes from
 <20221229190817.25500-1-sriram.yagnaraman@est.tech>
Date: Mon, 30 Jan 2023 14:22:55 +0100
Message-Id: <20230130132304.2347-1-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0051.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::35) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|DU0P189MB2225:EE_
X-MS-Office365-Filtering-Correlation-Id: de6e15a1-4bc4-4790-c162-08db02c520eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kVxtskFIcK1DqG4HxyqW3Hw6a6EAo+OG9/3TiyNg6WOzq41jYJ7b53/ICz7ph+0qSc+r3R4HQ9PnpxIO+J/nqhb62G3d5TePV9hcofagDca5msoQpK6fsYCCcJpzbNG0KdIirlfZ8h5MWTFE/k+t4cd49JRCkvBHdVvkL+KDHKUm+oTDZekbXroF38aqXtbBy6jLg3pXxMtQPK3WV15ppUSvnYCmDWMwZewnwl4xtscUAOIBFUG3CxCz9KCtZ9atpgInn9RMJKxGrBAo0VQ5UhhV07Tw2rgWdrPJjPLYuhdO1zw4/1mSVWKPgGgPi0q7jD78XssEB0wVzfq3lwo2MhufNLrvsQKmc9X+ru4p06XS+Q4Q/d1R5IGJXmTRF01PqLl2P6dTRcj1USQ9GnIjJdE2x0xeBG3fyWwYooY9cWSLdR7KCdXZxy8f9hbKjNhvNHgFvtyLUf9PnGbbwHvohQzVgvh4hifZZwQHhbc+pwouoNbuIofDLrNqbsHP4cLbRLlvHua0uagKBx6qiXXIURyB30wY2dvmQh1aBz9Dbq9+8n8sUFhDuywZ/wRDkOqGjmp7/hOakHSIq2aHvteEXy2rcqUlHJD/TY7yyvVuTD8H6d5zel2grHqTQjWuc9f9irxZDKlp5lE4RLOG/na+TvDqLCAhRnhH0qmkVu7DWNk2ALQUXBHQqBXKXiCp3pJuzFFExmiBFf5dwx2lSySsGYJAhqX72n0TfN2qrksXZyq0terhjd3pVhu1EG9sdb/C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(39840400004)(396003)(346002)(376002)(136003)(109986016)(451199018)(70586007)(66946007)(8676002)(4326008)(8936002)(38100700002)(316002)(6666004)(5660300002)(6506007)(1076003)(26005)(54906003)(44832011)(186003)(4744005)(6512007)(66476007)(41300700001)(66556008)(478600001)(36756003)(2616005)(83380400001)(6486002)(2906002)(966005)(86362001)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s5dCh9Yha7YYxAuJY7LOFtSw7+fOfyHpopVEaosT5Mh+AM34i+ww30j99gPX?=
 =?us-ascii?Q?fEK5B615mT5FJRIjysRwzZitjEKg8Qv9/sKOyHnUrKa5oFSsCri7jW5tsPxS?=
 =?us-ascii?Q?2DswDXlsAionD01/Mv6QYkZG8sOwEEU8h3pCq2+gZxjibV/vo5PzeiwQQ05j?=
 =?us-ascii?Q?2O3Sphtm4vgUbG6JAumYCbbwoeP9NgY0OkMCITuTx1n3x4/DqJGQL2FlOItz?=
 =?us-ascii?Q?fmQAX4nI6srVmW+a2PjCKzLPLkpJopT92Acp0kn4mczQUsFg1G+DN4CSNO1C?=
 =?us-ascii?Q?rF28OofdEoZLVzwN3vNRk90uTC3PaK9d00pvbkgd43SfcsifWxFur1ekZhIg?=
 =?us-ascii?Q?IvnJtI6izGhuq9qERUUDxTStcy/opG5GBHExbg8Q45DQk1zbc643/lOj/z6S?=
 =?us-ascii?Q?3gFXWt4RSaa5GKZZphQLxiswGWdfiE+GMb/QYqh3/CvG9g4PPgqIXsmaM6Iy?=
 =?us-ascii?Q?OdhXRRJjEQpN+U7VaL4EsZt1eGoaGyEVWVKjeZ6YONYuNlm8sCQCePpcRfUw?=
 =?us-ascii?Q?VR4K27MgAZUVSdbY5DF53rr6JTx1LxJ2KCkj57CElzyiQrbI0E1kqF4tkmGH?=
 =?us-ascii?Q?b5CU6FnpgGscWZdl8DnhfEVLtdLzSt6YLAovS/bOJs6vXu1ip2R2/dN6tHlX?=
 =?us-ascii?Q?mMfR5NbU8KQ/wg8jV0ZLl+1g2yMpWoCSrAuQFCXCSIg2gTaKgg6UCK2ZQr/A?=
 =?us-ascii?Q?UnowYr+t7duQiVdZRlqioV8hCxTotwW1H1Yw409KGcxgUPMKnDiMBDtbvMbL?=
 =?us-ascii?Q?KwGt9nh3JJ/Y51K4DJbVE+rJPPvcqAFU8R4Xe6XVhjWLxxCQyGAEIlRIs4xF?=
 =?us-ascii?Q?v5LESTg7RwI8/n2ZLxZY+8C8iNhK1/XOyHNXKQTboQGEEMGUPqzEYqDVKoJW?=
 =?us-ascii?Q?1NquhJYmcPwz03SkBk86hpMIcOrgImchMZgNS+hoG3l+6XYx6UhF300vwKZj?=
 =?us-ascii?Q?3oDziKJCWT3WFpSWK9i4dwlGybE99ytjtOxeIrrwyXloxSq9DRLueUFT0ahb?=
 =?us-ascii?Q?F8rPknHXkW7UrsrHzkpbOFwqDlx0kvo4/2ERZMwETVrwExBlTSo5vCfNURhF?=
 =?us-ascii?Q?0afL++JXpwGHAfNmYA/BnFGQOym923OXGNMRuRP8eK8+j9eiOxy4Kd11MCYe?=
 =?us-ascii?Q?yMnsjD83sP74+h7380EGQK6XG/Z0TqNJMoMojUsuuV9poLAUL9LOs+WIdeLR?=
 =?us-ascii?Q?CgQz+Qz62QagLpMBKic+QWvJrI8bgQ70+lnyR8ypmytxte1kKEAKpUONyTZR?=
 =?us-ascii?Q?a0xWjkxeUScVUiotzAlcTfC3Le4uBS0ZZ7da9ffi9UvpCv9QGTexl5GeQ+nr?=
 =?us-ascii?Q?5gClGKy6JR/aMGGXeYCkMI7O829ZYoW7MXceFVZtvv+pY8K9M3vNrhblXJSo?=
 =?us-ascii?Q?lLWjtbRF7ipQdQxDTeJbgBfPVROpd1Gcc/G7SNQHTAc2TeOdhN7gSxuuMruw?=
 =?us-ascii?Q?dTsOGW9pmq17qjgGvHVrUidMkvffVrg1H0HyutTPTpNF0YT1aMx8egD72W2O?=
 =?us-ascii?Q?j/cTqGExZ2a2KlzJozbeooKJle0SGxiNLC3uhvt53XKoU7UfU78/xe4k1b3/?=
 =?us-ascii?Q?4B3uVxe4fxsxEtotbpy/XHWX/isF2f6OmSYjZpuolwzxDZi6iKmRNOTw9q27?=
 =?us-ascii?Q?nw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: de6e15a1-4bc4-4790-c162-08db02c520eb
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 13:23:08.8441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OhS6zzUUn19SMEhWA6dqhLZKMYoQK7P4FInnzqTpoJ2RmdAxpqyyHu+Tvlor4DYWoJYd9xiq6z768ICli/U5C5Iffqd0gh4VNyqjIRrXTos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2225
Received-SPF: pass client-ip=2a01:111:f400:7e1a::71e;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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

Based-on: <20230126111943.38695-1-akihiko.odaki@daynix.com>
([PATCH v4 00/13] Introduce igb)

Rebased on latest changes from Akihiko, and merged changes from my
original patchset:
https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg04670.html

Changes since v1:
- Fix review comments from Akihiko

Sriram Yagnaraman (9):
  MAINTAINERS: Add Sriram Yagnaraman as a igb reviewer
  igb: handle PF/VF reset properly
  igb: implement VFRE and VFTE registers
  igb: add ICR_RXDW
  igb: check oversized packets for VMDq
  igb: respect E1000_VMOLR_RSSE
  igb: implement VF Tx and Rx stats
  igb: respect VT_CTL ignore MAC field
  igb: respect VMVIR and VMOLR for VLAN

 MAINTAINERS          |   1 +
 hw/net/e1000x_regs.h |   5 +
 hw/net/igb_core.c    | 246 ++++++++++++++++++++++++++++++++-----------
 hw/net/igb_regs.h    |   4 +-
 hw/net/trace-events  |   4 +
 5 files changed, 195 insertions(+), 65 deletions(-)

-- 
2.34.1


