Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DDA38DF76
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 04:58:48 +0200 (CEST)
Received: from localhost ([::1]:46712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll0nm-00069d-G0
	for lists+qemu-devel@lfdr.de; Sun, 23 May 2021 22:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1ll0if-0005z5-5Y
 for qemu-devel@nongnu.org; Sun, 23 May 2021 22:53:29 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:37775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1ll0id-0003CW-Fy
 for qemu-devel@nongnu.org; Sun, 23 May 2021 22:53:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1621824806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FAVfYLRq3F4kMP0C02+1jQLmtix57Ju0LPuUXAiE6KU=;
 b=Z2RFkaO+3CU+VbkO8ALbK4LLycdD9+HrZRH39VzGUwAWy+KAKZD5/o62crD+x2zQ6bPath
 ExoD5b2EaKCyGj+Wz3V3WhyW96G0CVpAXzUurT1v40kV2jafXNoknyOCfbTDUSamNL566f
 WYWXUz9nezZa1rd6Vr5EJhLQKSPHwyQ=
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-sNOdL56zPWecBPZ3U67Vjg-1; Mon, 24 May 2021 04:53:25 +0200
X-MC-Unique: sNOdL56zPWecBPZ3U67Vjg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M1T8zcjzuiRZSA4n0Szxf1xBtjGzyZx91KgFyWvbUuiWayoKHpbpGgl9G0OQdLgUcR2dXSI2pg7dr5X3BJm0FEbqpwL6gc+1w27JJQR6yCA4QkwjUQmUVFHrMW9JyBin9aXGs/ZXikldK/yhh9v64Tz517LGpiQoAHy5N9sOReB54JVu/C8+kNfb4MCZUKcne9cwiondafccRNoU18J/BKqSe3jSlrCo8YgeDl2eXhATrAO5yLQmbgehaISxAVa6D6uxEvB6mf4ZMYypJ0Ja8Yplf2/7CsP0Q2YmnieGNAQvPxI7JuAwfkxO3dVP7/xnMD3Vf5q49wZdII+D35x+0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CW1peA5e4u8a/E2lfiWRmnQKrVc0coSa4HuIq5bDKs8=;
 b=lv4gq0KUd2edxBCJNpgnOQf1DugXknVmzCK/9/d7UiUpreaRDu1akhmzbjOfX0yDgmtR9fP/GO0DaNc6Khi0cZ9Tf1Ti+D1QaJeQLnmOnmNp3qkyE/rxSFCgo28RfsWcgzi665LXQnWCOR5xsRqL7tO60ESW1q7JCeGeRCt/L+7BD6n2ut0Ju70N1qCIqn3756Zxf8Zh2ZIxXj4bUWI2laoVD/IESgdIMS7qqlAWRR2RJeB4eilu5vjIaiGIBI0oEPtw5ktdvXqtuvkiVjI6pJ8SHq+q9ySanaGMaAX0fG2Na/c1/B9PMIYmedaUT4K5pJ/U8lnwt4k8Tksza7jeFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB4126.eurprd04.prod.outlook.com
 (2603:10a6:803:47::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Mon, 24 May
 2021 02:53:24 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::b446:f4ea:d07c:ef5f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::b446:f4ea:d07c:ef5f%7]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 02:53:24 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cohuck@redhat.com, thuth@redhat.com, richard.henderson@linaro.org,
 cfontana@suse.de, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, pbonzini@redhat.com, acho@suse.com
Subject: [RFC v4 03/14] hw/s390x: only build tod-tcg from the CONFIG_TCG build
Date: Mon, 24 May 2021 10:52:45 +0800
Message-ID: <20210524025256.22252-3-acho@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524025256.22252-1-acho@suse.com>
References: <20210524025256.22252-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [114.24.18.39]
X-ClientProxiedBy: HK2PR04CA0057.apcprd04.prod.outlook.com
 (2603:1096:202:14::25) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (114.24.18.39) by
 HK2PR04CA0057.apcprd04.prod.outlook.com (2603:1096:202:14::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Mon, 24 May 2021 02:53:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1fe7798b-81d6-4741-41b6-08d91e5f18d0
X-MS-TrafficTypeDiagnostic: VI1PR04MB4126:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB41263FDADBC7E5E70CC151EEA0269@VI1PR04MB4126.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TP2wiO2MjcnjNNtal8B9TThyiNTA5Tpjw0SUVb5yY7huzweAwOxm9kNodDI63uoyHoaQTiToGRi0jOMIcxxIzYW7ipw8D47W/PGTyXpjquEyWopvokmeoAeNijY0fVz1pIEsiOSCsb0jnIMIP1a2mHX5xrijNKSV6Zp/gSOiJvESauV0scTJrjNI7kaqDdJ1exDdi9mohbED+7ELQObvAgGZ6XzPwLoIR3QmJ2XpJ7cazhyGMriEMoR+J3/mM6bQmUlAXdzojocnGsqMy+fa4KJF8Kl4Px3ie16MQW9Zg/GqZXdFkehbZeA72s7vQQBG13tp5DwbCQyZL3fV7A14fC+EvYHmvnw8co4PX42E9t2MVsBDS+qVeGGlDILxB/FCQtlig2vyveO7uZJdBq2IrsL3LzREzCvjqgyF+n3mrU+mi6V04BLRuJJjXhWa3M57JYNSMZdZ+C/zBnD2Na5CAOGk+6kXL4Flr3NHBVA6boyUzbGJmXJdSKWCxoz2QrlrjKk4GtN+IL1Ju5X7ajMSxGQDscZhDrh5EP0DPzCjvwCi1cJ65LaOB+NYigwg5rdnJP/PFK6iG94xjdjapYhJZvsyfNE4ltRAjVZ31jty2yaaC01n6/3iXSaVBesKSLqVDnDZsMF1l7DkDjWqFquk6Lqdto+DigQpT6Pp+DZTDszZEfSWXh67HNBj0TR8zllt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(39860400002)(136003)(366004)(346002)(16526019)(6506007)(1076003)(2906002)(956004)(26005)(6512007)(7416002)(6666004)(4326008)(107886003)(66556008)(5660300002)(6486002)(2616005)(83380400001)(186003)(38100700002)(316002)(36756003)(66476007)(478600001)(52116002)(8936002)(66946007)(8676002)(38350700002)(86362001)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?qz3pFVNJxV6D8dMWlhB7NzWaocplLJzk16++ypbp/DvH+iHnLTYvVNstNLqB?=
 =?us-ascii?Q?cNB7Kce1G+2ecN+Nu7vM91+frSILtR8nYDf3+ZHInkber9oc1DORGKozeToc?=
 =?us-ascii?Q?vd0snGg+WPDlLTQpSYFiZti1qXVffonz/IfDZUpbm+ZlW9ud9Xh5+uEhE4M8?=
 =?us-ascii?Q?m4hDLL3tN3mL4t991zo0o/RmufeA1InN7ncYRnKmXbkk1+gC3tLJPju9vryW?=
 =?us-ascii?Q?6xTugxA8ZviMilKlK9pkJ4V6dGO9EsMMO6P7Qu/P8JrJ7Yr4cBsC3csDQhD4?=
 =?us-ascii?Q?czqEGIoL0wIZsWpnP1ofb6evriHVFf1AgP6Mme5dtaKpmNk6OHpxNJBQ5FzE?=
 =?us-ascii?Q?zJ8z4Vv5f96qSIEu0AHALrrI05s/D1OeHMrWXKXZGGGtjeZCJ8b+JvR+OlvI?=
 =?us-ascii?Q?UPXi3RSQ0vxyMvEB8bfpp6mSYmIzuA59UgaHpGRYNrBHXyOluKTvr0rixqK0?=
 =?us-ascii?Q?+m4TkryCQ+Wct8YV6s/2TX/OQ94+1RmmzcxyOlHXwSviRJhVyJUOhN03Bihx?=
 =?us-ascii?Q?dhBeFJDd6934qG5YM67resi7dzJ1nKycoM/imA/RWJecYSKowRbLAuLVfK0+?=
 =?us-ascii?Q?dEqhrgOUcwydNYpW6z+P1nCGhnTHkmKE7ilKak3MIoAaWzhiZp4fnr/YihZ3?=
 =?us-ascii?Q?C+YuEeob4PnYfjEmjnWPatGpLYEWy48ZgkEzarwgnrW+MDxDykasbA2L9QkJ?=
 =?us-ascii?Q?vrva717D1TlR4P+NdRyyEmLES7qPkR8oUqMvLCN1yIUJ6hRxpQ12hMBLoiP0?=
 =?us-ascii?Q?vr9uCQTIh/BECcwfYX+jZJEnJxTCbTSmIBjH//j7+BPnzh/cc8lC7Gw9BzUN?=
 =?us-ascii?Q?uwD0biJ6N9RGmyrkQGvZkTsxx42yaPASE/YUPe/3sQdKHdAQRlsZTeXeR8jB?=
 =?us-ascii?Q?kBHZMjZB0WewkJEQgzdMUQKtyahnMHnhflp3JGVyM4JSp77eOasG/v6lxGH4?=
 =?us-ascii?Q?ceTdeNqZwwvfeW/nC4lEcXKJ4ygUcoT2lxsq1/G2bQmyMk+z84NLZDYGkBPW?=
 =?us-ascii?Q?ND3x3QnSPNnGWb2U8Tn8gO+W78jtSlUdr2bO1/wmfpyBPlENdS4qMCu0movX?=
 =?us-ascii?Q?LE4mCMJl8jqWWwjlozm83L65xYY1XicdLRSADLt97mWllXK5qBnJ1LK9qr5X?=
 =?us-ascii?Q?6QKEfvVa+h1J1BRh0/goB0gfRndKGInD0DqLj74uKnI2dRC8zRho67v/kPPE?=
 =?us-ascii?Q?I3p1NTp3/KAk/P75CT6B5+q1iDzgCB9cUNf1rM2caitnJlliqb7QU/fawYf+?=
 =?us-ascii?Q?LAqVJkSqWuRq3LttSx4YNdTGv10olYBNSd/8AMf3r1NRiq6L4A7Hl+X1tjmB?=
 =?us-ascii?Q?cY/HqENWWrkpNILqr2Qi16S9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fe7798b-81d6-4741-41b6-08d91e5f18d0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 02:53:24.0271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rmZFZod7QilltlhrFyHxrJsvoFPYJD6KOhCFLAxoBdNRt98rtv04NKlrx5GjCqRl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4126
Received-SPF: pass client-ip=194.104.111.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
2.31.1


