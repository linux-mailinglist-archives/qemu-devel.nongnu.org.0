Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D90B13BE6CD
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 13:02:09 +0200 (CEST)
Received: from localhost ([::1]:38994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m15Jg-0004f1-ST
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 07:02:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1m15Bq-0002w9-Rt
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:54:02 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:45226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1m15Bn-000227-Uz
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:54:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1625655238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tYrC7nli+Qon0Xsiw0D2A5C3cIAL0l2jXZJuh6baunQ=;
 b=BWs48Z/mxYWK40oMvnrPn8wpk7F6ZxEQHN4tXUXu/u7FUC3UO6nb4AuEBxy7Q6NM2Xwrs2
 Jloma4l0bkaDqLzTFuDV7b2ortTPgTuzS5yBNjE38xnrhWrkJLb/zoXewL7AR4Z1vL0YUc
 WUJAuByGkuV7BMjz5J0FWpgsTf3DkBE=
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-9-QAhPS9LsPQ6Qn_4V5Jxt6w-1;
 Wed, 07 Jul 2021 12:53:57 +0200
X-MC-Unique: QAhPS9LsPQ6Qn_4V5Jxt6w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ykh3oz+YhWfkYITf8aJu0SiDRZLJg62EJOujcV8OV9XHbYn0mDMN8XzJzH231u62A/+pC4b+uAzd7gR1jGbyNP0Ko/kkXIY080Jn6Uplodvi7QTD78+01fRvcN4OJAF7N7uIl4o2if9cm/HT51YN01AV8AFZfNE1Q18TAPWUR8PrE+rw21i46EPD2eItMaofuOh4OKNyrE5asKtTD90r48kYayLPZ/9P64GJ6q9826Tp+he2sSkbnb85WJV7JF9wKzghSdmMs2r2d2nU9mvt4mAnpH4ia8kw1GzHoxXSKQAwoNTHIWqlQL7+oE/f4KIx9J9iZ00xYgQMlFVJOLC4uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QXOGSMVQykh3iEnhfOX27DySSUEL4M1pRrU72QwL1T4=;
 b=erXdI1RAAhPD3yKWz+H4z8/mefD1B5a5ExFxHu2rCenSP8F1ZvMTr/C1IJPwUXOFxvmDexN5FRw++OjgOQJ55F71Qh3sNiJqJnwxrY371OKpkBf2GaWXQ9JD6f+Zv9WxlHSiPa9rB8RUiM5i4kHsu0vSaDUVIzROFmQBP4ZozWNNEq2G8s+8DgBCRNqrqSimtlM9J/0GSGNDvAmnqhBz/VHOOc/u0SDcjRCzW99RDJBc8iBhV2QTs4zMxWHu+LF7U1v1ydO4AwF3rqIqeDZirRYy/d85kIQ5tKr+sk5aMFLMGl6pQG6rRQSR4iWFB0iE4dl0Zuh9mEgwCtprkkB8BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR0401MB2238.eurprd04.prod.outlook.com
 (2603:10a6:800:28::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Wed, 7 Jul
 2021 10:53:56 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f%5]) with mapi id 15.20.4308.020; Wed, 7 Jul 2021
 10:53:56 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com, acho@suse.com, jose.ziviani@suse.com,
 Claudio Fontana <cfontana@suse.de>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v7 04/14] hw/s390x: only build tod-tcg from the CONFIG_TCG
 build
Date: Wed,  7 Jul 2021 18:53:14 +0800
Message-ID: <20210707105324.23400-5-acho@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210707105324.23400-1-acho@suse.com>
References: <20210707105324.23400-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0079.apcprd04.prod.outlook.com
 (2603:1096:202:15::23) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (1.169.20.159) by
 HK2PR04CA0079.apcprd04.prod.outlook.com (2603:1096:202:15::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19 via Frontend Transport; Wed, 7 Jul 2021 10:53:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a34b095-df77-43f2-10bb-08d94135848f
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2238:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB22384E46A8FF05F434CFF4EAA01A9@VI1PR0401MB2238.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: db9APU1TJ8LG5fm8Sp3hmDexLUcTYGQGdXB5qi2d07BPKi9b20taq1qPmyj1XJC4PTFQ7NtBw/wY3iVmRoor993TmNYNAruBPYgdUqU/Bu6Kl4UhCc8ztTt7Uu1y1AxSh+7nr6plxbezTrprV25fmEifQu1AP7cq+o7gwun+vLnbclNxVC8PaRm7Y5P4MFG4VR/i4uRG8QV20zdRtDbflXkCzBN9lbTNGDOfWMjWuNtn4agKCrbXEtOu5Ro6ItHMkgRWuDy8ZVKokI8wj1J4WvhsmeZdRNp9mBnnohOfey/eUU6nUYo8ttXgAhGe92JZxG8xffTZ7E+joC9BaV6yHmAtprOXTk5B8zhX3WVAZaUCGXVmfOA0Dpg9AXRHBhE38TIX6tvq4iVXt1T8MN7jiUtXg4tBIfIvxNfmH9H5WCFJwvKH35PRI6PhKXldvj/moOWU59fZ3dDPFnkbDEXEcUA1mg3j1UlSouKDbYJ+x5WnYpbs4swjassy+Y9Womnh0dDK8ZEVr2tVv0CQbI9p93LjUGHoCVuifG3QZF0dfTdKcqvYrCDD1X3ZohAUpdt6DglbKzRu8CGFVjJojYbQhQUXu4+nOggOvqGAohgJDB6n2d35Os78uxZgSyUEpCHyB/2xzqliEiqTH4bK/8yJQ/te7RadrJjGVyz66DmkvNrHw4aGc5NFNEqtimK/reMT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39850400004)(366004)(396003)(136003)(54906003)(316002)(26005)(66946007)(66556008)(6496006)(6486002)(186003)(6666004)(86362001)(8936002)(8676002)(83380400001)(2906002)(5660300002)(66476007)(478600001)(36756003)(4326008)(2616005)(956004)(1076003)(38100700002)(36456004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VSL6LBRNY1zBHtTNsGJCqnOohETCGV6epwL1bJY0IeIhFZdThTGSun7zWbAh?=
 =?us-ascii?Q?0XvsLGaLvyBrtdgcmPxwAaeZGAnD+uS9AqPkIs8fQwBlNsDVh5xK7csBXt6e?=
 =?us-ascii?Q?4QTeDoKS2LPnuhPQFRjkdnGoJ5DGiceulfCFk82tTzbETghCMccjzn2oo7Ra?=
 =?us-ascii?Q?tpCMUU77rIuM7+83zm6tm6vfsMGxaACOyaRYtw9X/3/0hDg4RPIdJDB/uTB+?=
 =?us-ascii?Q?zZ+PKKmQsMcfb9AdnNW1W9UcF8gnglvHuUQfSnkxstsXll7yGRxt+cj9+WW1?=
 =?us-ascii?Q?NyLdNVb3VEhNLFjggv2GQOuT7v7zhn91eWlMQTQ2hbcUcisU5EFpQypaKwLP?=
 =?us-ascii?Q?eZcQyHlqhH87fGKc56HKjFjFquQlMhkP7UcRNLAL0BPACtYqzns2+in8YpQE?=
 =?us-ascii?Q?tYO1ExMzNnyycz4J7DoYucW+A8761HJhZZDKmTPD4s800gILwm60Chtyj4xo?=
 =?us-ascii?Q?9s80BZ4LiQc1PyAuPdh+jlD1agt90pmRA+lNEQigbdoIJ3ZRxMznxgBKCE58?=
 =?us-ascii?Q?GYi+H0pL8228PrEcF6AIIgNNwsZ3UoEx3VzgZhshSuAKwP79PiDU5k+3KohV?=
 =?us-ascii?Q?HT+QJ6V1TM+G5gctLl4KwH32iuBSavX7ZytFjpInukrDpyltlU6bYWEb/ibX?=
 =?us-ascii?Q?d8n72EOIpJniJs9ODQgGAvRjafqSQZMXSrmq45bKLc5QNnY3teXowXVKl7Kc?=
 =?us-ascii?Q?Vp9dtwHcQkNwqTMeZZo3XIuSnNWXRvrob3gm1rA+30AhtIfiyya/qdsbyQSQ?=
 =?us-ascii?Q?OTRlQLOFiWzpiMrAgsJTrwPi7ikexbiAv0nN9oB1O3LZ5UdAAIQ6sRtdrhJV?=
 =?us-ascii?Q?ph18UL2QeVLdDV71J8kixGTxtQIVQMQ7OVyzjl9bV/+JZY1YLeyAohaI/dsG?=
 =?us-ascii?Q?4qqPuFs8ZJcV8A41DorE90lzsJ/mQo4vA/DqQ3wPoGYVPS0WJAwuD92yrZLn?=
 =?us-ascii?Q?+hEhRFq9Ul43+gt3kPmskcJ0QfxBvCprV5YMaKQm148Q+QdjyJ3nMPeS1U6Q?=
 =?us-ascii?Q?CTwNKg5luI9EsaK0hscZcJN0Ho2ruqjsRBQoXP2KQ3eWkpu63vYNIBZ3XTAD?=
 =?us-ascii?Q?LGPbRW2mzb0aMwh32yLMG98AYtLT2SGO+ysoMvKhHXNDdilWORwsWpHxyvUp?=
 =?us-ascii?Q?IGsbKGc9xiv4q3V6G/awq9skdWMkpnpUtuKxLk+7aGTTqcD5AztJNOEiI9jb?=
 =?us-ascii?Q?3IJv/Z6se21l3HlZDYPkDV0YEeg7lMEsNZTfF63qYcHn3CXqs+tpP9wHTfv3?=
 =?us-ascii?Q?WlOH8MRDmha1FBFj70P/ERgoJBrol2hS0Kh2KWaL8YzAza8wHbrl6kzQxMOq?=
 =?us-ascii?Q?Jy2T/OPlo/RqIefSccRN5pSq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a34b095-df77-43f2-10bb-08d94135848f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 10:53:56.3535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8os/YrOluDYF9mqkBT9RH8bkCcUQiA/Cp53r3AuK5hsVLnTgOAJ3/Up678LUik83
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2238
Received-SPF: pass client-ip=194.104.109.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
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


