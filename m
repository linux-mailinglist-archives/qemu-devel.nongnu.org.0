Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E284434F468
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 00:44:39 +0200 (CEST)
Received: from localhost ([::1]:51220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRN6E-0003FT-IX
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 18:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1lRN4v-0002oc-C0
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 18:43:17 -0400
Received: from mail-eopbgr760082.outbound.protection.outlook.com
 ([40.107.76.82]:57707 helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1lRN4s-0007Sx-DB
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 18:43:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZxG7UJH80LtMaH7JzzC1UjI77hctw9tMN/SfRojMwYjFQQnRs+nknXCQoffavQ5PRChVcRuyXO35JYHvX+hlZUFp42/GBkldt41jKM5DioCxMOii3IPc7hzJ5Zl9E9RMUgumjsmlpbE4NrepmSFq2ZOL6e/Dejh1odYTEXeEnwdObuOYQzTs3gQ4jaSpFmKJGu7rt7IeSZLFfSZ/QETmLlA2CV2dcaBV+yfVcUtQTZq9wKfV0EPGPuGl02fAaYW+aV0GocvN3OEf8ggfBuYe5k1qox8hs4MnRVTlbG5TeDe24nuENHfw2Dt72JtBDSwmGKkMOGtEnJdXVeDu0aNJpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oeKKQSkvnbqqO865ZpSr3BwW8BQDH8ZeFuCdA4QvYV0=;
 b=b2lpe3nRcLUgV/SASqupljkuwHY/e3CKHeDJP50X0om7P4aNxjBdBR3OYmIZhPuYq3mMPDhQI+HSQfaZPBuD8HY8nACzRUP5zM6157HBGjihAHKQHjvbQS4wMsw4jF/Nsw6NY4XZzVO7AU3T4NShu/obyr73eQfKEjmcDnrRLU/MRCtLU+OIb4zD0m3hD+r9JV8ed5elUh5wrYbZYYUpggI6dEQJ+IQGe3qi6n5WTFN5OQPWVrycUfxEaJASWhQ6BaXd/mnUXXVXhcN12D9/z+Qrf/6bt0E9kLk+dd+JuCFMBpas4uEXOe6lkabxvvQTHePoogcwvQzq2v5jDjRxRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oeKKQSkvnbqqO865ZpSr3BwW8BQDH8ZeFuCdA4QvYV0=;
 b=PL97WXSnN5N6tHQngugpTxnK8TRMPZKmHqF0l/ltiBEVuEWBgIFlYQ+b4MXEOnSHbHJffmUFy7OqAGH4dZnD/xR/loj4iu6epkUyDEepKBTD3JomudtsIgQmnVhgyqsyFEIKF4n7JiUpilZd2CFdGmgMtpORgfgDqiwNynCoRFY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB3733.namprd12.prod.outlook.com (2603:10b6:610:15::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Tue, 30 Mar
 2021 22:28:08 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::929:2a80:f737:86fa]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::929:2a80:f737:86fa%7]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 22:28:08 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 6.0.0-rc1 is now available
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Date: Tue, 30 Mar 2021 17:28:00 -0500
Message-ID: <161714328050.2327232.8378776800936127553@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [165.204.77.11]
X-ClientProxiedBy: SA9PR13CA0158.namprd13.prod.outlook.com
 (2603:10b6:806:28::13) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.77.11) by
 SA9PR13CA0158.namprd13.prod.outlook.com (2603:10b6:806:28::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.14 via Frontend Transport; Tue, 30 Mar 2021 22:28:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4d640ec8-0531-4d5f-ba03-08d8f3cb1821
X-MS-TrafficTypeDiagnostic: CH2PR12MB3733:
X-Microsoft-Antispam-PRVS: <CH2PR12MB3733E39F465BDC102C7EE131957D9@CH2PR12MB3733.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B2TxVpsNJXrcigOQkC29+uoHaSWDMr81kI2xRvqGrL1XLjcjNsXlkwymgpSWYwe7WGUfDKUAkn5rdzs8N51AD2iTzsE+T45f5SCPFUD6FgLWVU3fkIyVyF2TARi9t24ue+2+ODMFwvq7WkkVhNu4vnlqKEhk5rlzx1DZVxHT2upug+Sbh9vBZe2BJmLtRTXQjlvowBCpjV4hOPSgsCq2cdazNhtC3XyW5IjZHR1Jt3aVrNvm3VY8JePm3YnYKNe2CG1P+pi25W4L6gh95Q743yeESoi94RPyDQktKf3SH1np+j3y+lNfiK/TvYtwwa8hjtH2wnIzj6WCstDb9f1YejGgELxy3xHb8QlQaYLVpsr9yPD1VGgyPdoN0Gp7GoJQeJTrL1wNSuoSeRiFGceQBM6W1xEMkwQ0aknMoG2z1mnuwQpdbVAtbBYVBFIfKqyBOB3PmQCpkzh/AxV/VrwLDL2utheWM627wNWyIl0j1eA24YVJhLNDHReXE2kmkEfQBNR5FU7JiXszCHl3d6qEbMLx2TkrGfQtuFIjjza+o8BO5cEa/DTehyGdw71cDYVW5SrmxLDMWb4R5iEoARy746UqIu5wAhA/+bJAqh3gzg3gEcpKG7GNKewDf0buRueMtezGDaxD/zXLQU0iuKfjVRzksLcYoXr5WoMFFN3kPcBHzbpFGBaQknkn44yhdL0o4nxWgjj2sfaWSThJDORrAGuH+jVWDp6gYTegIFl8jfM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(346002)(39860400002)(376002)(44832011)(26005)(38100700001)(83380400001)(52116002)(4326008)(316002)(6916009)(5660300002)(86362001)(478600001)(36756003)(2616005)(956004)(186003)(6486002)(6666004)(66946007)(2906002)(66476007)(66556008)(16526019)(966005)(8936002)(6496006)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Qm04b0ZoeTlBQUh5dUVPY1daL2pwQ01DTTRnaUZrVk1reUpFZGZjTjdhQUpt?=
 =?utf-8?B?MHNvazBnRnJNeGtqeUZkc2xWZDVaMHFPSVRFOE1lU3d3TGl6SVdUbVM4SDRV?=
 =?utf-8?B?NmdOVFVMdUJYeFVWUFBOcjIzdlBqK1NZaDJvazBWdlFaNW1HUzUrQUY4Y0tI?=
 =?utf-8?B?dnc5QmM0clZ3bkZmZWk2L1l5OGNZRTFJWFA3ZUJ6WW5LZDdvdWdRNURNcm5K?=
 =?utf-8?B?Q0lyV1hIOGtrZU5WQjd2bjFLSldhUFhJVzlZa2lMZm1QdlFIaHBKbXlNZnVj?=
 =?utf-8?B?T2xmRkcrTHRwSVlnS1Fxb0VMVjNaVnFQdVlxVVUrY2ZaOVRrc1VMQS9xbm1w?=
 =?utf-8?B?YS95NGNGNWdEYVo3UUVHZUVUS3JFQ3lLVEg0eFBNVk9BN0NSdy9UWGR6SzA1?=
 =?utf-8?B?aVorY0xWN3JLbzl4SG1wQjNLSFN2TUpMSE5kdEFJaTV6aGl2YVhRQThUNEFq?=
 =?utf-8?B?dVJzamxpZjVXUXcrSEQ1WGNwckxFUEhsUzA4cUFPRFI5bS9XQ2drSkhoM2RV?=
 =?utf-8?B?THlNY0JwejhJQWVEVEtoNFJ4bHJURERFeXZqUkVjM3Fqdm9DOTVFTXJldlZX?=
 =?utf-8?B?NkIwdDB6UEcrc0Jwek1JempMQlRnWm9SSlZoVXc2TzN6RUxzMDdTbHVkb084?=
 =?utf-8?B?a0NFNEt2bC9NWEc1UDdlWEg4RVBCQWMxa2l2bElyelQ5bTJWS3RxZnFUSVNi?=
 =?utf-8?B?OFdONHFVYkRjS0trM1FHRUM3TTZ1djY5T1ltMTV3RU5DWmNRK1hjdTE2Mkgx?=
 =?utf-8?B?U3ZDd1NidUJVRllLdi9aSFhkOWg3RnV4aE1BcURaRzVwU2JGUkp5a3VTZVdY?=
 =?utf-8?B?SUxuMW5tS3F0Nk04SStiVXAxR0hoUXJKdnowZFNKcklCZjJJUEhWcUNIYyt2?=
 =?utf-8?B?bVkwNkM2VGR6U2o3TTQ5M3d1Q0g5TmFkM0NOUC84NVFGWlZ4alNCeTB4dEtR?=
 =?utf-8?B?RWpqWDBoT2cvM0NXaGlUaWg0NXRzcXkyVW5GWUNhS2c0K2pPOGYvY3ZpUGUv?=
 =?utf-8?B?TUgyN1NBVVRtNkhCTFpNd2d5T3lnN0F0Qlh3UmNFMWFBNzZsRUFjbWNyUUJo?=
 =?utf-8?B?SUhPcFowMGdjTXNhMFVuUnk4dytXOGZxN2tURjYreXVUYVp3Y1NkUHVzOGp0?=
 =?utf-8?B?TCtqZEx1VEhiUEh3ZW9uVlNjcUhvWEpCekVJbDBGZmV1eWhYcWsxMkNzV2pV?=
 =?utf-8?B?NGRnc0dQVzNOYXJyOVZKZUVuS2dUNjkvYkNWN1hMajlZQTltdzh6S3l2c1Rz?=
 =?utf-8?B?TjhsNUdlK2VnYllmTjZDZU0vZGVjSWxmM2g2VFFNWTBtSmJpRGN2YkhXZldh?=
 =?utf-8?B?U3hDSFdNNzlsRW5odlZLVkpHZHpWd3gydEJNVGdvVEIwc1F2VzJPVWhJYS9W?=
 =?utf-8?B?NzE5ZGgrRUt6eGRpU0o3OG8rZDNrVzBUVFdhZWxjZThyNzRUY3p0V3VtMnFo?=
 =?utf-8?B?OGllS0UrcnowQU8wSkpmcFNRTTZxQXJwR3FoTUY0T2UxbEFJNnduQ24xOS95?=
 =?utf-8?B?RVp3WU4yY3FjMFl4KzIrLzl5eXVoMGRjV1pBc2lQelg1L1lvWENSODBOL3pz?=
 =?utf-8?B?a2FnSHhHam1ZMm5zRzkrV1FQaTZsOXFSbDVSTWt1eVh5QUYzbWNYTW1rVmdH?=
 =?utf-8?B?cHg0N2pCcHd6WHNlM1V1TXk0dFlzZnI0d0MvdzVScUFrUk5vcjdjNGdQN0ZS?=
 =?utf-8?B?YVZZdWNKWGJJY1BQMUt4N0FQaEQxVjZ0N1N4MWpOL3dzOWlIbitGdVZ1Y05h?=
 =?utf-8?Q?dN8tS/1PpvUcM1Mad1LXvErGiAGnFO2qfq7K5cA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d640ec8-0531-4d5f-ba03-08d8f3cb1821
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 22:28:08.3421 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9QCEqXq099hm9FY+TuuPBzixvL8vUabfJ+4XAaHpIFki55DyRnoS1W7MqGJiwBv5wMPJtnWjMSGz6VPkvHLkUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3733
Received-SPF: softfail client-ip=40.107.76.82;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM02-CY1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On behalf of the QEMU Team, I'd like to announce the availability of the
second release candidate for the QEMU 6.0 release.  This release is meant
for testing purposes and should not be used in a production environment.

  http://download.qemu-project.org/qemu-6.0.0-rc1.tar.xz
  http://download.qemu-project.org/qemu-6.0.0-rc1.tar.xz.sig

You can help improve the quality of the QEMU 6.0 release by testing this
release and reporting bugs on Launchpad:

  https://bugs.launchpad.net/qemu/

The release plan, as well a documented known issues for release
candidates, are available at:

  http://wiki.qemu.org/Planning/6.0

Please add entries to the ChangeLog for the 6.0 release below:

  http://wiki.qemu.org/ChangeLog/6.0

Thank you to everyone involved!

Changes since rc0:

6d40ce00c1: Update version for v6.0.0-rc1 release (Peter Maydell)
b471d55491: Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target=
-arm-20210330' into staging (Peter Maydell)
4a0ba67c77: Merge remote-tracking branch 'remotes/maxreitz/tags/pull-block-=
2021-03-30' into staging (Peter Maydell)
b9e3f1579a: hw/timer/renesas_tmr: Add default-case asserts in read_tcnt() (=
Peter Maydell)
f7fb73b8cd: target/arm: Make number of counters in PMCR follow the CPU (Pet=
er Maydell)
6c1bd93954: hw/arm/smmuv3: Drop unused CDM_VALID() and is_cd_valid() (Zengh=
ui Yu)
c8aaa24537: hw/display/xlnx_dp: Free FIFOs adding xlnx_dp_finalize() (Phili=
ppe Mathieu-Daud=C3=A9)
a62ee00aa0: net/npcm7xx_emc.c: Fix handling of receiving packets when RSDR =
not set (Doug Evans)
2ec7e8a946: iotests/244: Test preallocation for data-file-raw (Max Reitz)
484108293d: qcow2: Force preallocation with data-file-raw (Max Reitz)
7993b0f83f: Merge remote-tracking branch 'remotes/nvme/tags/nvme-fixes-for-=
6.0-pull-request' into staging (Peter Maydell)
3a69cadbef: hw/block/nvme: fix ref counting in nvme_format_ns (Klaus Jensen=
)
9561353ddc: hw/block/nvme: fix resource leak in nvme_dif_rw (Klaus Jensen)
220222a0fe: qsd: Document FUSE exports (Max Reitz)
53431b9086: block/mirror: Fix mirror_top's permissions (Max Reitz)
6d7bb95180: iotests/046: Filter request length (Max Reitz)
ad0ce64279: qcow2: use external virtual timers (Pavel Dovgalyuk)
d751448d4f: iotests/116: Fix reference output (Max Reitz)
c00316e9b2: iotests: fix 051.out expected output after error text touchups =
(Connor Kuehl)
93d8d1293b: iotests: Fix typo in iotest 051 (Tao Xu)
ec2e6e016d: Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-f=
or-6.0-pull-request' into staging (Peter Maydell)
4a1e6bce23: linux-user: allow NULL msg in recvfrom (Zach Reizner)
7b9a3c9f94: Merge remote-tracking branch 'remotes/kraxel/tags/fixes-2021032=
6-pull-request' into staging (Peter Maydell)
db0b034185: hw/usb/hcd-ehci: Fix crash when showing help of EHCI devices (T=
homas Huth)
adcf33a504: s390x: modularize virtio-gpu-ccw (Gerd Hoffmann)
2dd9d8cfb4: s390x: add have_virtio_ccw (Gerd Hoffmann)
d4c603d7be: s390x: move S390_ADAPTER_SUPPRESSIBLE (Gerd Hoffmann)
2da6e36b33: hw/usb/hcd-ehci-sysbus: Free USBPacket on instance finalize() (=
Philippe Mathieu-Daud=C3=A9)
59be75e7d8: vhost-user-gpu: fix cursor move/update (Marc-Andr=C3=A9 Lureau)
96ee096a13: vhost-user-gpu: fix vugbm_device_init fallback (Marc-Andr=C3=A9=
 Lureau)
0c27b9c568: vhost-user-gpu: glFlush before notifying clients (Marc-Andr=C3=
=A9 Lureau)
d2aea775d4: usb: Remove "-usbdevice ccid" (Thomas Huth)
23fff7a17f: linux-user/s390x: Use the guest pointer for the sigreturn stub =
(Andreas Krebbel)
63ad23fa24: Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/bloc=
k-pull-request' into staging (Peter Maydell)
3460fd7f39: migrate-bitmaps-postcopy-test: check that we can't remove in-fl=
ight bitmaps (Vladimir Sementsov-Ogievskiy)
4290b4834c: migration/block-dirty-bitmap: make incoming disabled bitmaps bu=
sy (Vladimir Sementsov-Ogievskiy)

