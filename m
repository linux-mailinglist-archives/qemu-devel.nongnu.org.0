Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE3D3B013D
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 12:20:42 +0200 (CEST)
Received: from localhost ([::1]:52502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvdWL-0005Xg-G7
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 06:20:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lvdTj-0002hE-Io
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:17:59 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:27497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lvdTf-0006Ab-HP
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:17:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1624357074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gSBbX1WXaZu+QwP+EK4Jb0gewy9eheCKRm2hVCQfCLs=;
 b=E8Ahg83TjzFmuUJAOlvgQmhdd/z71EJXTOwoRdpNnJCosNNrmRCp+0A9Lvta6obCoZR5q8
 dKa4McAYNTaJShp8KWer24VCBuNPPQRrwUdw4jGSLmj2W225FNUAXQ2cKFAUHeQT6+dKRj
 9pRPqaVtdV2iQIvWxyJmWTU+kvMVC4g=
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2052.outbound.protection.outlook.com [104.47.0.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-30EMvS7sME2D6SFDtab6kQ-1; Tue, 22 Jun 2021 12:17:53 +0200
X-MC-Unique: 30EMvS7sME2D6SFDtab6kQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bAlnjYODj3CD6dfiqn6cX2orxYQ4rktd1pcEdYwJKF0QE7Z72BkNit2H4C/evmveyQsmyHE9xp0J6MUTFdl+grDp/AHeP37jhz42zTTTomHVhu3sqCnCRAitoL1brZ+dJjsW066YU5O5wh/acOF+hrSs+c4BQXrouAAMpLlLVT8lcVQhj77szdszFdJkQAgJRUx06SKA1qHVLpCS8NPUIyf+YMPjF5Yql3I/9Y1VImZQEl9D3bslDxNdpKHyI7MQ68Q251W2nzf8Mz+pKdCnuqEp2RK5OoIMsJAHOy+HWJHOpA2buDItJD4lfbSbMJ9JfI+jO8gd5p+atdCpDEej/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CsJ4x9wsHMPluQQrp0HAkUlVSXc/ogjdBWddnj//TUk=;
 b=YBsU3m9BluFb1SlMrczD53oACTf5poh8A/9aHRp8zm6cq0MNOf2vCzViVjqPkfk6dl58Hkvy+olDoMe5T2rzoFzMcueHzgouy+NsjQmrnctub2TNUzJkZ8Mo1TOleeP3w/NOqKhoWT0hWTF8Eg5XNPQ4g3MuNPhwuxMSZJOXDPWDhxzKmsjHDMAnCQuLuIKoA6VV1rF0NlDHbwaPWTmK/065RiW6OEIQcvxzUfDAsBKB4V991VOY1cu92t8Q8dbV2tRLwFCT5vd1oz/1Gx/O8InHT20h7V/38/wWw95IlWoVtV5cve/n4a6zGiUl1Lg6lGpCnLo2UU93Cx6HNlVf3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB5405.eurprd04.prod.outlook.com
 (2603:10a6:803:d6::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Tue, 22 Jun
 2021 10:17:51 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::28dc:6111:d2dd:4777]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::28dc:6111:d2dd:4777%3]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 10:17:51 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com, acho@suse.com, Claudio Fontana <cfontana@suse.de>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>
Subject: [RFC v5 03/13] hw/s390x: only build tod-tcg from the CONFIG_TCG build
Date: Tue, 22 Jun 2021 18:17:16 +0800
Message-ID: <20210622101726.20860-4-acho@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210622101726.20860-1-acho@suse.com>
References: <20210622101726.20860-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [1.169.30.211]
X-ClientProxiedBy: HK2PR03CA0053.apcprd03.prod.outlook.com
 (2603:1096:202:17::23) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (1.169.30.211) by
 HK2PR03CA0053.apcprd03.prod.outlook.com (2603:1096:202:17::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.7 via Frontend Transport; Tue, 22 Jun 2021 10:17:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1df1a6c-24a0-4476-2673-08d93566fe01
X-MS-TrafficTypeDiagnostic: VI1PR04MB5405:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5405732B231CE52955D75EBCA0099@VI1PR04MB5405.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nIdxeJBaqUBBhUuNyvh+FEA+Rp+myxOSAGs4+OX7NiqcoZPFVg11CMaRrujFJYt0nNnpnlWWCdhqnyOrKOFnn93HHLHLqBHd08Guc9M26W3bUIXAM+wrM0bY9AqfpsJk6WmydeL5MfkOj5bZWahCQ9c3l/mwBR55IQ+M7ZpfVhIfbBxisNtzSgHljEKFvQfOSNJsoBjqugjCbw93qRyZn/0Yt93a8HWdZ105701IIRlZiRvN+W5KpwehDSzRlFQTh3oymfBOFrtQ1ZYIfC6tV9Nan99tq+fY/f7ta3sUM37N898YPBvGsqLCIHgWn2zi+WISG0XODoIXpavafgKQUmACJXrCaUVuZ0l5lYcSyd5LPFmn94lLR1V769bdsujYOnC8Mtd5Vx2Xe1GyntFcR+B8/pQuq5QjSPKaIr6ngAGo9ES0zvmodBv+gmFBCid/IqdpZfVumQoaeexeKeSIk/535SIreVj3dt6zCUxMjw1m6O7/N+KkKucXoQ77lYOVvF03Pb/zsck5cVU2jzuT0nSVrsM13q2+hhODV/c3F2iVs/zEH4MFINbpaNAeW/a9Cpmrh5cEwgNyWSNQ8rNaKJ36ZtsrYDDZ02Djp6bThiZfWL3uXi6k+l5ISbggHmspRmzAgIIpKlXoJOuzeXQ4TA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(376002)(136003)(39850400004)(346002)(4326008)(316002)(956004)(86362001)(2906002)(66946007)(6666004)(6496006)(2616005)(66556008)(66476007)(8676002)(186003)(16526019)(26005)(8936002)(36756003)(478600001)(38100700002)(5660300002)(83380400001)(54906003)(1076003)(6486002)(36456004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LK9xjfhQqQsBNNT0n82mJz9WMUXPnwBw+0wYkJzL/+3EV/hwoALYHDQV1dR9?=
 =?us-ascii?Q?KuOV7v4pvwT8rlfej+O4xP9tuKbnhkidDBJtPDX4zucujN88QjKDrmAyeB3K?=
 =?us-ascii?Q?wSpHPLnvIA75L5s8+RqIs8tmhsIgwFJkH3SvITHwm9Pija3Ms4SjJvv8nmd5?=
 =?us-ascii?Q?UZIePNrGMbYhCsVFT9z8RFSt3gpgZGDRZMOc0KfMT50FROUpbdEzb8DaRta8?=
 =?us-ascii?Q?6ErYumfarB2M8wCRnurEjvXe297dthq9ydxYbAVrmsgcAolVESP6k1oALEFo?=
 =?us-ascii?Q?fmTkFIfld3Egd+Z2MCAqC9vO94c13d/AK80UDhiGOWpTQdzvb+DAeDHbOe3H?=
 =?us-ascii?Q?oL/9zKiJ6T9aAMuj6NwSjcH5Z1PFmTJnggMyFDG0wurzkeh3N1uT9hnbdbNC?=
 =?us-ascii?Q?7In5jYT5YGOjUyQFQVVTOx2EqFflzE2UVzBjQuEG2+fBeK+d7fVfNxNwdlXD?=
 =?us-ascii?Q?81Jf2B05s56RbhrckClhAidOqc/qw+QtiGui1sPrw+qZqAzjGZRoDcHk6UTv?=
 =?us-ascii?Q?vIkqp2esG9Viy28G2VYq8CiuYdVtCtBttlQeM4ia3FbLAIJljLRgcxgb1CZo?=
 =?us-ascii?Q?IsTc1d/sA4AnzIxDAM4sMBiTRp82EtVijOI2AhUWPKkptUQ/V6VENoDWM+c3?=
 =?us-ascii?Q?jf1GTR/E9rzYpig8YU8TFtSOiR4DERQZMKiSnRXXw44r0z0BGkfi6jDi4C75?=
 =?us-ascii?Q?3HB+hhsXiIThbC5bd9eI/b4TJV451Rv+ZG2x1tuWQK5nouC1bhrv1zSEm9XX?=
 =?us-ascii?Q?DUJucetnHHDxxjmucKdzLR1/UJ1nf8YhT9xlLfPI5LSTTvlE+Grs6c4ymJDE?=
 =?us-ascii?Q?jZ1sQqtNZC4zeefM1qG3wrEuN5rGae/OhsQurHLk+WwwF2D+HXa6SCQHnyoy?=
 =?us-ascii?Q?WXPK67NLB1brU0Rm5GxN3nBDAlzyZFFKE1t0mCc6dIpo4WyzmABKsyZwIuZk?=
 =?us-ascii?Q?BbTjy5XRoK7qRgrF9kgRYxePyvXvM8ChKtnKUimLR63gssjWleTTwj4tF2w6?=
 =?us-ascii?Q?JdA1x8cavAkvuBlJQ8SKBr5A4M1f38FMmi2MlVxKtGLNS1A87S/E/vxSPbLX?=
 =?us-ascii?Q?4pqgvGqm1vpgemT7f8KiUvtEcCRiB+7Md/Na4YccexNJ5bqGChClKb1VTRey?=
 =?us-ascii?Q?TynKh61m6uptQX7xf+wjnnQ6vVOjCqHgZB5wdEsML0V1Rv3XYL171u5ea28+?=
 =?us-ascii?Q?gTi4dgIw2yyNhc3aW8q10y5I/cctAo/edI7u/QW8nTATTcAvJCZJb4gWhySN?=
 =?us-ascii?Q?Ao0SSWd5gCpHfFs4nCRSosJYksiA6ouR7YKgwCMGhwueeEHtEz+Jv9zhUeHr?=
 =?us-ascii?Q?C/bkVrTa9q0NBrq8g4z9hTkF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1df1a6c-24a0-4476-2673-08d93566fe01
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 10:17:51.5209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NIHuu5Y30jCK6iHJej0jeoUVXnWevwxVRpaMdOp8VMeUQVkGtmw+Q0wOp1HslNct
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5405
Received-SPF: pass client-ip=194.104.111.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

this will allow in later patches to remove unneeded stubs
in target/s390x.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
---
 hw/s390x/meson.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
index 02e81a9467..28484256ec 100644
--- a/hw/s390x/meson.build
+++ b/hw/s390x/meson.build
@@ -16,7 +16,6 @@ s390x_ss.add(files(
   'sclp.c',
   'sclpcpu.c',
   'sclpquiesce.c',
-  'tod-tcg.c',
   'tod.c',
 ))
 s390x_ss.add(when: 'CONFIG_KVM', if_true: files(
@@ -25,6 +24,9 @@ s390x_ss.add(when: 'CONFIG_KVM', if_true: files(
   's390-stattrib-kvm.c',
   'pv.c',
 ))
+s390x_ss.add(when: 'CONFIG_TCG', if_true: files(
+  'tod-tcg.c',
+))
 s390x_ss.add(when: 'CONFIG_S390_CCW_VIRTIO', if_true: files('s390-virtio-c=
cw.c'))
 s390x_ss.add(when: 'CONFIG_TERMINAL3270', if_true: files('3270-ccw.c'))
 s390x_ss.add(when: 'CONFIG_VFIO', if_true: files('s390-pci-vfio.c'))
--=20
2.32.0


