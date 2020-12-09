Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCF32D3D8F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 09:35:19 +0100 (CET)
Received: from localhost ([::1]:35576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmuwQ-0003HI-Kf
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 03:35:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1kmuv7-0002dR-Vy
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 03:33:57 -0500
Received: from 3.mo51.mail-out.ovh.net ([188.165.32.156]:50919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1kmuv4-0006xV-OH
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 03:33:57 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.183])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id AF737240B8B;
 Wed,  9 Dec 2020 09:33:38 +0100 (CET)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 9 Dec 2020
 09:33:36 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R00683016755-4cd7-4a58-9314-76cd7bd62976,
 F89B705946B58AFC48376D7414C518838B559611) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 3/3] net: checksum: Introduce fine control over checksum
 type
To: Bin Meng <bmeng.cn@gmail.com>, <qemu-devel@nongnu.org>
References: <1607220847-24096-1-git-send-email-bmeng.cn@gmail.com>
 <1607220847-24096-3-git-send-email-bmeng.cn@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <adb845f8-8623-988f-cb11-148ec4cc2f4b@kaod.org>
Date: Wed, 9 Dec 2020 09:33:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1607220847-24096-3-git-send-email-bmeng.cn@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 481ee65c-d874-4de9-800e-f6db287e3d47
X-Ovh-Tracer-Id: 10079618919775570899
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudejjedguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefudeltdfhtddtieevudduveehffeutedvueeuleduiedvgffgueduhfehgfejheenucffohhmrghinhepohhffhhlohgrugdrnhgvthdpghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepsghmvghnghdrtghnsehgmhgrihhlrdgtohhm
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Paul Durrant <paul@xen.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Beniamino Galvani <b.galvani@gmail.com>,
 Zhang Chen <chen.zhang@intel.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Peter Chubb <peter.chubb@nicta.com.au>, Joel Stanley <joel@jms.id.au>,
 qemu-arm@nongnu.org, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello !

> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> index 782ff19..fbae1f1 100644
> --- a/hw/net/ftgmac100.c
> +++ b/hw/net/ftgmac100.c
> @@ -573,7 +573,15 @@ static void ftgmac100_do_tx(FTGMAC100State *s, uint32_t tx_ring,
>              }
>  
>              if (flags & FTGMAC100_TXDES1_IP_CHKSUM) {
> -                net_checksum_calculate(s->frame, frame_size);
> +                /*
> +                 * TODO:
> +                 * FTGMAC100_TXDES1_IP_CHKSUM seems to be only for IP checksum,
> +                 * however previous net_checksum_calculate() did not calculate
> +                 * IP checksum at all. Passing CSUM_ALL for now until someone
> +                 * who is familar with this MAC to figure out what should be
> +                 * properly added for TCP/UDP checksum offload.
> +                 */
> +                net_checksum_calculate(s->frame, frame_size, CSUM_ALL);
>              }
>              /* Last buffer in frame.  */
>              qemu_send_packet(qemu_get_queue(s->nic), s->frame, frame_size);


You can test your changes using the HOWTO Joel provided here : 

  https://github.com/openbmc/qemu/wiki/Usage

Please also check the Linux driver  :

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/ethernet/faraday/ftgmac100.c#n685

That said, something like the change below should be more appropriate.

Thanks,

C. 

+static int ftgmac100_convert_csum_flag(uint32_t flags)
+{
+    int csum = 0;
+
+    if (flags & FTGMAC100_TXDES1_IP_CHKSUM) {
+        csum |= CSUM_IP;
+    }
+    if (flags & FTGMAC100_TXDES1_TCP_CHKSUM) {
+        csum |= CSUM_TCP;
+    }
+    if (flags & FTGMAC100_TXDES1_UDP_CHKSUM) {
+        csum |= CSUM_UDP;
+    }
+    return csum;
+}
+
 static void ftgmac100_do_tx(FTGMAC100State *s, uint32_t tx_ring,
                             uint32_t tx_descriptor)
 {
@@ -602,6 +618,7 @@ static void ftgmac100_do_tx(FTGMAC100Sta
         ptr += len;
         frame_size += len;
         if (bd.des0 & FTGMAC100_TXDES0_LTS) {
+            int csum = ftgmac100_convert_csum_flag(flags);
 
             /* Check for VLAN */
             if (flags & FTGMAC100_TXDES1_INS_VLANTAG &&
@@ -610,16 +627,8 @@ static void ftgmac100_do_tx(FTGMAC100Sta
                                             FTGMAC100_TXDES1_VLANTAG_CI(flags));
             }
 
-            if (flags & FTGMAC100_TXDES1_IP_CHKSUM) {
-                /*
-                 * TODO:
-                 * FTGMAC100_TXDES1_IP_CHKSUM seems to be only for IP checksum,
-                 * however previous net_checksum_calculate() did not calculate
-                 * IP checksum at all. Passing CSUM_ALL for now until someone
-                 * who is familar with this MAC to figure out what should be
-                 * properly added for TCP/UDP checksum offload.
-                 */
-                net_checksum_calculate(s->frame, frame_size, CSUM_ALL);
+            if (csum) {
+                net_checksum_calculate(s->frame, frame_size, csum);
             }
             /* Last buffer in frame.  */
             qemu_send_packet(qemu_get_queue(s->nic), s->frame, frame_size);

