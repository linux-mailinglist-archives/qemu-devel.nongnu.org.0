Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D67748636A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 12:04:40 +0100 (CET)
Received: from localhost ([::1]:49162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5QZT-0005N1-7V
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 06:04:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDb-0007qg-H1
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:42:05 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:48667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDU-0004kg-IM
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:42:03 -0500
Received: from quad ([82.142.12.178]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MLAZe-1mnCZk2A0g-00IFBl; Thu, 06
 Jan 2022 11:41:54 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 26/27] linux-user: netlink: Add IFLA_VFINFO_LIST
Date: Thu,  6 Jan 2022 11:41:36 +0100
Message-Id: <20220106104137.732883-27-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220106104137.732883-1-laurent@vivier.eu>
References: <20220106104137.732883-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:eiifYzr1qyRugzBiB+78b5FMYMIzG3SEyquWuxy/9ot7TWf2OKv
 IhbTVWs7bxWOIQDceYyu+TLIMqYgrol+voLRt77ObRwV5IAEx4K167yUR7C1mJa78MNHUu+
 zr5Uby//1ZJlLwF4TE75ocQ62kCUN0oxgCVeO1KxjH4tGz2IL3McwZat244WQLTIQBYwHP3
 5pb0CUejCfLn2O+NiPrbA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+mExXe28UlI=:YECONTIK4j+wbdNUt2zPwH
 POGE1f/r8JzHf1rFXIulXIakFxcCiQ7FmwStwwmcDCZkOeSdqia1gEM7qDr8GpVkCw4yDpWB2
 ygf3lF/haHuzWKIpacq+2F6SazZ5cTjaFSP683BH6DnP+jpAV5J75tgbRLjuPkoXn15tGKckG
 86SVHY3/ZfBLo4dtQZXtotNDel3Aq+WSSazwBZU+QStlgksc5EFOi7QaIYnramZJutRivdSxK
 RQS+RaL5gfTsHo5BsrwPTy2b17XPr4Bxh5g4Qccd3CTUA+qeyVsGKR/nUYrmqsI9yEcj0PCJI
 9yOm8Lu/dTvZiGxYL1sHNY4gow5/53o3ObwZavuZk0K0R5K6vvUnBWLD705teU3BznTkIrNZJ
 xscfWfZsfbVF4QF8G6kfVsrBzGzT7/HikZEdJmS7+yIPqwGq39AM+OJBniqflC9bbQcQQaWQq
 HoUlM1C7n/QRJ6kDGXbhbxWag1ZqX7+/zm8gN/emRrk687tthpsDQ+KRdQBQG1YDmgaEUAMV9
 X6Kf+YafTljKKY3WWlY8XY1vcZXWPrEet38K13fC6TFqkFcFZT/tv3diRqW0tRDE4fyubi+Zh
 hHit0DYncqZTVVQwNxuvKFZoVUD3MGNdaXyTnv3vlZHVz38UnPnQXdBNS0sMmmtL4fq0RppEn
 72tiAdedXX0HZEIExq9VPSCOGi1xGTrqZyyV6JG6GX5/0/eI6Z+titMz5az8XY+gutbg=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

# QEMU_LOG=unimp ip a
  Unknown host QEMU_IFLA type: 22

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211219154514.2165728-2-laurent@vivier.eu>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/fd-trans.c | 174 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 174 insertions(+)

diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
index 14c19a90b2b0..36e4a4c2aae8 100644
--- a/linux-user/fd-trans.c
+++ b/linux-user/fd-trans.c
@@ -271,6 +271,37 @@ enum {
     QEMU___RTA_MAX
 };
 
+enum {
+    QEMU_IFLA_VF_STATS_RX_PACKETS,
+    QEMU_IFLA_VF_STATS_TX_PACKETS,
+    QEMU_IFLA_VF_STATS_RX_BYTES,
+    QEMU_IFLA_VF_STATS_TX_BYTES,
+    QEMU_IFLA_VF_STATS_BROADCAST,
+    QEMU_IFLA_VF_STATS_MULTICAST,
+    QEMU_IFLA_VF_STATS_PAD,
+    QEMU_IFLA_VF_STATS_RX_DROPPED,
+    QEMU_IFLA_VF_STATS_TX_DROPPED,
+    QEMU__IFLA_VF_STATS_MAX,
+};
+
+enum {
+    QEMU_IFLA_VF_UNSPEC,
+    QEMU_IFLA_VF_MAC,
+    QEMU_IFLA_VF_VLAN,
+    QEMU_IFLA_VF_TX_RATE,
+    QEMU_IFLA_VF_SPOOFCHK,
+    QEMU_IFLA_VF_LINK_STATE,
+    QEMU_IFLA_VF_RATE,
+    QEMU_IFLA_VF_RSS_QUERY_EN,
+    QEMU_IFLA_VF_STATS,
+    QEMU_IFLA_VF_TRUST,
+    QEMU_IFLA_VF_IB_NODE_GUID,
+    QEMU_IFLA_VF_IB_PORT_GUID,
+    QEMU_IFLA_VF_VLAN_LIST,
+    QEMU_IFLA_VF_BROADCAST,
+    QEMU__IFLA_VF_MAX,
+};
+
 TargetFdTrans **target_fd_trans;
 QemuMutex target_fd_trans_lock;
 unsigned int target_fd_max;
@@ -808,6 +839,145 @@ static abi_long host_to_target_data_xdp_nlattr(struct nlattr *nlattr,
     return 0;
 }
 
+static abi_long host_to_target_data_vlan_list_nlattr(struct nlattr *nlattr,
+                                                     void *context)
+{
+    struct ifla_vf_vlan_info *vlan_info;
+
+    switch (nlattr->nla_type) {
+    /* struct ifla_vf_vlan_info */
+    case IFLA_VF_VLAN_INFO:
+        vlan_info = NLA_DATA(nlattr);
+        vlan_info->vf = tswap32(vlan_info->vf);
+        vlan_info->vlan = tswap32(vlan_info->vlan);
+        vlan_info->qos = tswap32(vlan_info->qos);
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "Unknown host VLAN LIST type: %d\n",
+                      nlattr->nla_type);
+        break;
+    }
+    return 0;
+}
+
+static abi_long host_to_target_data_vf_stats_nlattr(struct nlattr *nlattr,
+                                                    void *context)
+{
+    uint64_t *u64;
+
+    switch (nlattr->nla_type) {
+    /* uint64_t */
+    case QEMU_IFLA_VF_STATS_RX_PACKETS:
+    case QEMU_IFLA_VF_STATS_TX_PACKETS:
+    case QEMU_IFLA_VF_STATS_RX_BYTES:
+    case QEMU_IFLA_VF_STATS_TX_BYTES:
+    case QEMU_IFLA_VF_STATS_BROADCAST:
+    case QEMU_IFLA_VF_STATS_MULTICAST:
+    case QEMU_IFLA_VF_STATS_PAD:
+    case QEMU_IFLA_VF_STATS_RX_DROPPED:
+    case QEMU_IFLA_VF_STATS_TX_DROPPED:
+        u64 = NLA_DATA(nlattr);
+        *u64 = tswap64(*u64);
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "Unknown host VF STATS type: %d\n",
+                      nlattr->nla_type);
+        break;
+    }
+    return 0;
+}
+
+static abi_long host_to_target_data_vfinfo_nlattr(struct nlattr *nlattr,
+                                                  void *context)
+{
+    struct ifla_vf_mac *mac;
+    struct ifla_vf_vlan *vlan;
+    struct ifla_vf_vlan_info *vlan_info;
+    struct ifla_vf_spoofchk *spoofchk;
+    struct ifla_vf_rate *rate;
+    struct ifla_vf_link_state *link_state;
+    struct ifla_vf_rss_query_en *rss_query_en;
+    struct ifla_vf_trust *trust;
+    struct ifla_vf_guid *guid;
+
+    switch (nlattr->nla_type) {
+    /* struct ifla_vf_mac */
+    case QEMU_IFLA_VF_MAC:
+        mac = NLA_DATA(nlattr);
+        mac->vf = tswap32(mac->vf);
+        break;
+    /* struct ifla_vf_broadcast */
+    case QEMU_IFLA_VF_BROADCAST:
+        break;
+    /* struct struct ifla_vf_vlan */
+    case QEMU_IFLA_VF_VLAN:
+        vlan = NLA_DATA(nlattr);
+        vlan->vf = tswap32(vlan->vf);
+        vlan->vlan = tswap32(vlan->vlan);
+        vlan->qos = tswap32(vlan->qos);
+        break;
+    /* struct ifla_vf_vlan_info */
+    case QEMU_IFLA_VF_TX_RATE:
+        vlan_info = NLA_DATA(nlattr);
+        vlan_info->vf = tswap32(vlan_info->vf);
+        vlan_info->vlan = tswap32(vlan_info->vlan);
+        vlan_info->qos = tswap32(vlan_info->qos);
+        break;
+    /* struct ifla_vf_spoofchk */
+    case QEMU_IFLA_VF_SPOOFCHK:
+        spoofchk = NLA_DATA(nlattr);
+        spoofchk->vf = tswap32(spoofchk->vf);
+        spoofchk->setting = tswap32(spoofchk->setting);
+        break;
+    /* struct ifla_vf_rate */
+    case QEMU_IFLA_VF_RATE:
+        rate = NLA_DATA(nlattr);
+        rate->vf = tswap32(rate->vf);
+        rate->min_tx_rate = tswap32(rate->min_tx_rate);
+        rate->max_tx_rate = tswap32(rate->max_tx_rate);
+        break;
+    /* struct ifla_vf_link_state */
+    case QEMU_IFLA_VF_LINK_STATE:
+        link_state = NLA_DATA(nlattr);
+        link_state->vf = tswap32(link_state->vf);
+        link_state->link_state = tswap32(link_state->link_state);
+        break;
+    /* struct ifla_vf_rss_query_en */
+    case QEMU_IFLA_VF_RSS_QUERY_EN:
+        rss_query_en = NLA_DATA(nlattr);
+        rss_query_en->vf = tswap32(rss_query_en->vf);
+        rss_query_en->setting = tswap32(rss_query_en->setting);
+        break;
+    /* struct ifla_vf_trust */
+    case QEMU_IFLA_VF_TRUST:
+        trust = NLA_DATA(nlattr);
+        trust->vf = tswap32(trust->vf);
+        trust->setting = tswap32(trust->setting);
+        break;
+    /* struct ifla_vf_guid  */
+    case QEMU_IFLA_VF_IB_NODE_GUID:
+    case QEMU_IFLA_VF_IB_PORT_GUID:
+        guid = NLA_DATA(nlattr);
+        guid->vf = tswap32(guid->vf);
+        guid->guid = tswap32(guid->guid);
+        break;
+    /* nested */
+    case QEMU_IFLA_VF_VLAN_LIST:
+        return host_to_target_for_each_nlattr(RTA_DATA(nlattr), nlattr->nla_len,
+                                              NULL,
+                                          host_to_target_data_vlan_list_nlattr);
+    case QEMU_IFLA_VF_STATS:
+        return host_to_target_for_each_nlattr(RTA_DATA(nlattr), nlattr->nla_len,
+                                              NULL,
+                                           host_to_target_data_vf_stats_nlattr);
+    default:
+        qemu_log_mask(LOG_UNIMP, "Unknown host VFINFO type: %d\n",
+                      nlattr->nla_type);
+        break;
+    }
+    return 0;
+}
+
 static abi_long host_to_target_data_link_rtattr(struct rtattr *rtattr)
 {
     uint32_t *u32;
@@ -945,6 +1115,10 @@ static abi_long host_to_target_data_link_rtattr(struct rtattr *rtattr)
         return host_to_target_for_each_nlattr(RTA_DATA(rtattr), rtattr->rta_len,
                                               NULL,
                                                 host_to_target_data_xdp_nlattr);
+    case QEMU_IFLA_VFINFO_LIST:
+        return host_to_target_for_each_nlattr(RTA_DATA(rtattr), rtattr->rta_len,
+                                              NULL,
+                                             host_to_target_data_vfinfo_nlattr);
     default:
         qemu_log_mask(LOG_UNIMP, "Unknown host QEMU_IFLA type: %d\n",
                       rtattr->rta_type);
-- 
2.33.1


