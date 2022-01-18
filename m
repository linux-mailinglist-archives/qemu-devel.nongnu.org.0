Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4D749190A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 03:50:54 +0100 (CET)
Received: from localhost ([::1]:32820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9eaD-0001Lr-B4
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 21:50:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1n9eY6-0000J4-Vl
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 21:48:42 -0500
Received: from mga03.intel.com ([134.134.136.65]:18366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1n9eY4-0007WN-C3
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 21:48:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642474120; x=1674010120;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=w0JpAT8wjrwi1PhkHdZNFqAU1qMBjwPQsQjHS+Yw94g=;
 b=e6C3s6BvePBqZQgASR+ijXmQOg8TCiy9bJ/srvyz+cWLcvgJszalJ2cx
 Ql0GF5M8Ba5/TaGX4U7vojuVXxedieMTyJ8MSr6049rtM7Tcm79swvx0f
 YUbn60kNnOerRw8+2gnvtu+zdwh4B41mjqCVQtbUrA/Lqxq4/XojcPxiO
 Zi+Kn2o+TjPO3aVvAcBZGzSPMj+0FTjkqleRp39DKqeBSjbRd3HxXa+dH
 jLDaGc6dPEWdZHSViv5R6kQJPTGYDScrBsLJtJxU67GvrWuhHEShr3ULN
 VGAyY5QTJRaF0wI5PrJbsxZfQSSkgNYTKczmO2i1PnT5SnG5LM6AsgeAL w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="244682924"
X-IronPort-AV: E=Sophos;i="5.88,296,1635231600"; d="scan'208";a="244682924"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2022 18:48:32 -0800
X-IronPort-AV: E=Sophos;i="5.88,296,1635231600"; d="scan'208";a="531563617"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.145.56])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 17 Jan 2022 18:48:30 -0800
Date: Tue, 18 Jan 2022 10:33:12 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH 2/2] hw/i386/sgx: Attach SGX-EPC to its memory backend
Message-ID: <20220118023312.GA22498@yangzhon-Virtual>
References: <20220116235331.103977-1-f4bug@amsat.org>
 <20220116235331.103977-3-f4bug@amsat.org>
 <c1a8eba5-b1a1-bbcf-c237-23e16ce88475@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1a8eba5-b1a1-bbcf-c237-23e16ce88475@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=134.134.136.65; envelope-from=yang.zhong@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, yang.zhong@intel.com,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 17, 2022 at 12:48:10PM +0100, Paolo Bonzini wrote:
> On 1/17/22 00:53, Philippe Mathieu-Daudé via wrote:
> >We have one SGX-EPC address/size/node per memory backend,
> >make it child of the backend in the QOM composition tree.
> >
> >Cc: Yang Zhong <yang.zhong@intel.com>
> >Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> >---
> >  hw/i386/sgx.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> >diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
> >index 5de5dd08936..6362e5e9d02 100644
> >--- a/hw/i386/sgx.c
> >+++ b/hw/i386/sgx.c
> >@@ -300,6 +300,9 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
> >          /* set the memdev link with memory backend */
> >          object_property_parse(obj, SGX_EPC_MEMDEV_PROP, list->value->memdev,
> >                                &error_fatal);
> >+        object_property_add_child(OBJECT(list->value->memdev), "sgx-epc",
> >+                                  OBJECT(obj));
> >+
> >          /* set the numa node property for sgx epc object */
> >          object_property_set_uint(obj, SGX_EPC_NUMA_NODE_PROP, list->value->node,
> >                               &error_fatal);
> 
> I don't think this is a good idea; only list->value->memdev should
> add something below itself in the tree.
> 
> However, I think obj can be added under the machine itself as
> /machine/sgx-epc-device[*].
> 

  Thanks Philippe, calling object_property_add_child() in the hw/i386/sgx.c is more
  reasonable than in device_set_realized(), thanks!

  Yang

> Paolo

