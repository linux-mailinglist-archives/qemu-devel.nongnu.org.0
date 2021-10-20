Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEE54345DF
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 09:26:30 +0200 (CEST)
Received: from localhost ([::1]:53470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md5zZ-00061o-H1
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 03:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1md5wp-00047r-Ib
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 03:23:40 -0400
Received: from mga11.intel.com ([192.55.52.93]:63035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1md5wn-0005WX-HH
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 03:23:39 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="226174477"
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; d="scan'208";a="226174477"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 00:22:59 -0700
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; d="scan'208";a="494497432"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.144.101])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 20 Oct 2021 00:22:57 -0700
Date: Wed, 20 Oct 2021 15:08:37 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 4/6] monitor: numa support for 'info sgx' command
Message-ID: <20211020070837.GB31332@yangzhon-Virtual>
References: <20211011111554.12403-1-yang.zhong@intel.com>
 <20211011111554.12403-5-yang.zhong@intel.com>
 <378c8641-c837-afe7-fabc-844f48cc3d13@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <378c8641-c837-afe7-fabc-844f48cc3d13@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=192.55.52.93; envelope-from=yang.zhong@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, philmd@redhat.com,
 qemu-devel@nongnu.org, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 12, 2021 at 12:59:17PM +0200, Paolo Bonzini wrote:
> On 11/10/21 13:15, Yang Zhong wrote:
> >This patch can enable numa support for 'info sgx' command
> >in the monitor, which can show detailed SGX EPC sections
> >info.
> >
> >(qemu) info sgx
> >  SGX support: enabled
> >  SGX1 support: enabled
> >  SGX2 support: enabled
> >  FLC support: enabled
> >  SECTION #0: size=67108864
> >  SECTION #1: size=29360128
> >
> >  The QMP interface show:
> >  (QEMU) query-sgx
> >  {"return": {"sgx": true, "sgx2": true, "sgx1": true, "sections": \
> >  [{"index": 0, "size": 67108864}, {"index": 1, "size": 29360128}], "flc": true}}
> >
> >Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> >---
> >  hw/i386/sgx.c         | 25 +++++++++++++++++++++++--
> >  target/i386/monitor.c | 11 +++++++++--
> >  2 files changed, 32 insertions(+), 4 deletions(-)
> >
> >diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
> >index 906facb645..8af45925c6 100644
> >--- a/hw/i386/sgx.c
> >+++ b/hw/i386/sgx.c
> >@@ -126,6 +126,28 @@ SGXInfo *sgx_get_capabilities(Error **errp)
> >      return info;
> >  }
> >+static SGXEPCSectionList *sgx_get_epc_sections_list(void)
> >+{
> >+    GSList *device_list = sgx_epc_get_device_list();
> >+    SGXEPCSectionList *head = NULL, **tail = &head;
> >+    SGXEPCSection *section;
> >+    uint64_t i = 0;
> >+
> >+    for (; device_list; device_list = device_list->next) {
> >+        DeviceState *dev = device_list->data;
> >+        Object *obj = OBJECT(dev);
> >+
> >+        section = g_new0(SGXEPCSection, 1);
> >+        section->index = i++;
> >+        section->size = object_property_get_uint(obj, SGX_EPC_SIZE_PROP,
> >+                                                 &error_abort);
> >+        QAPI_LIST_APPEND(tail, section);
> >+    }
> >+    g_slist_free(device_list);
> >+
> >+    return head;
> >+}
> >+
> >  SGXInfo *sgx_get_info(Error **errp)
> >  {
> >      SGXInfo *info = NULL;
> >@@ -144,14 +166,13 @@ SGXInfo *sgx_get_info(Error **errp)
> >          return NULL;
> >      }
> >-    SGXEPCState *sgx_epc = &pcms->sgx_epc;
> >      info = g_new0(SGXInfo, 1);
> >      info->sgx = true;
> >      info->sgx1 = true;
> >      info->sgx2 = true;
> >      info->flc = true;
> >-    info->section_size = sgx_epc->size;
> >+    info->sections = sgx_get_epc_sections_list();
> >      return info;
> >  }
> >diff --git a/target/i386/monitor.c b/target/i386/monitor.c
> >index 196c1c9e77..08e7d4a425 100644
> >--- a/target/i386/monitor.c
> >+++ b/target/i386/monitor.c
> >@@ -773,6 +773,7 @@ SGXInfo *qmp_query_sgx(Error **errp)
> >  void hmp_info_sgx(Monitor *mon, const QDict *qdict)
> >  {
> >      Error *err = NULL;
> >+    SGXEPCSectionList *section_list, *section;
> >      g_autoptr(SGXInfo) info = qmp_query_sgx(&err);
> >      if (err) {
> >@@ -787,8 +788,14 @@ void hmp_info_sgx(Monitor *mon, const QDict *qdict)
> >                     info->sgx2 ? "enabled" : "disabled");
> >      monitor_printf(mon, "FLC support: %s\n",
> >                     info->flc ? "enabled" : "disabled");
> >-    monitor_printf(mon, "size: %" PRIu64 "\n",
> >-                   info->section_size);
> >+
> >+    section_list = info->sections;
> >+    for (section = section_list; section; section = section->next) {
> >+        monitor_printf(mon, "SECTION #%" PRId64 ": ",
> >+                       section->value->index);
> >+        monitor_printf(mon, "size=%" PRIu64 "\n",
> >+                       section->value->size);
> >+    }
> >  }
> >  SGXInfo *qmp_query_sgx_capabilities(Error **errp)
> >
> 
> This needs to be squashed in the previous patch.
>
 
  Okay, let me do it in next version, thanks!

  Yang
 
> Paolo

