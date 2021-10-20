Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5804346C9
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 10:24:55 +0200 (CEST)
Received: from localhost ([::1]:59332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md6u6-0008LD-Gt
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 04:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1md6sQ-0006kv-Mx
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 04:23:10 -0400
Received: from mga09.intel.com ([134.134.136.24]:61797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1md6sO-0005TT-BX
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 04:23:09 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="228598951"
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; d="scan'208";a="228598951"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 01:23:06 -0700
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; d="scan'208";a="662154154"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.144.101])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 20 Oct 2021 01:23:04 -0700
Date: Wed, 20 Oct 2021 16:08:44 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 3/6] numa: Add SGXEPCSection list for multiple sections
Message-ID: <20211020080844.GD31332@yangzhon-Virtual>
References: <20211011111554.12403-1-yang.zhong@intel.com>
 <20211011111554.12403-4-yang.zhong@intel.com>
 <5cedb309-c12a-5d90-01fa-c129a457aa10@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5cedb309-c12a-5d90-01fa-c129a457aa10@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=134.134.136.24; envelope-from=yang.zhong@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, philmd@redhat.com,
 qemu-devel@nongnu.org, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 12, 2021 at 01:01:34PM +0200, Paolo Bonzini wrote:
> On 11/10/21 13:15, Yang Zhong wrote:
> >The SGXEPCSection list added into SGXInfo to show the multiple
> >SGX EPC sections detailed info, not the total size like before.
> >
> >Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> >---
> >  qapi/misc-target.json | 19 +++++++++++++++++--
> >  1 file changed, 17 insertions(+), 2 deletions(-)
> >
> >diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> >index 594fbd1577..89a5a4250a 100644
> >--- a/qapi/misc-target.json
> >+++ b/qapi/misc-target.json
> >@@ -334,6 +334,21 @@
> >    'returns': 'SevAttestationReport',
> >    'if': 'TARGET_I386' }
> >+##
> >+# @SGXEPCSection:
> >+#
> >+# Information about intel SGX EPC section info
> >+#
> >+# @index: the SGX epc section index
> >+#
> >+# @size: the size of epc section
> >+#
> >+# Since: 6.2
> >+##
> >+{ 'struct': 'SGXEPCSection',
> >+  'data': { 'index': 'uint64',
> >+            'size': 'uint64'}}
> >+
> >  ##
> >  # @SGXInfo:
> >  #
> >@@ -347,7 +362,7 @@
> >  #
> >  # @flc: true if FLC is supported
> >  #
> >-# @section-size: The EPC section size for guest
> >+# @sections: The EPC sections info for guest
> >  #
> >  # Since: 6.2
> >  ##
> >@@ -356,7 +371,7 @@
> >              'sgx1': 'bool',
> >              'sgx2': 'bool',
> >              'flc': 'bool',
> >-            'section-size': 'uint64'},
> >+            'sections': ['SGXEPCSection']},
> >     'if': 'TARGET_I386' }
> >  ##
> >
> 
> I am not sure the index is particularly useful, but perhaps you
> should add the node there?
>

  Good point! The node is much better than index here. thanks!

  Yang

 
> Paolo

