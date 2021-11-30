Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8538463455
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 13:32:39 +0100 (CET)
Received: from localhost ([::1]:56848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms2JK-0004lt-J3
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 07:32:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1ms2HZ-0003wu-6E
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 07:30:49 -0500
Received: from mga09.intel.com ([134.134.136.24]:24857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1ms2HW-000857-LT
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 07:30:48 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10183"; a="236028054"
X-IronPort-AV: E=Sophos;i="5.87,275,1631602800"; d="scan'208";a="236028054"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 04:30:24 -0800
X-IronPort-AV: E=Sophos;i="5.87,275,1631602800"; d="scan'208";a="499749988"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.144.101])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 30 Nov 2021 04:30:23 -0800
Date: Tue, 30 Nov 2021 20:15:36 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: Re: unable to execute QEMU command 'qom-get': Property
 'sgx-epc.unavailable-features' not found
Message-ID: <20211130121536.GA32686@yangzhon-Virtual>
References: <20211125124722.GA25401@yangzhon-Virtual>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125124722.GA25401@yangzhon-Virtual>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=134.134.136.24; envelope-from=yang.zhong@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 25, 2021 at 08:47:22PM +0800, Yang Zhong wrote:
> Hello Paolo,
> 
> Our customer used the Libvirt XML to start a SGX VM, but failed.
> 
> libvirt.libvirtError: internal error: unable to execute QEMU command 'qom-get': Property 'sgx-epc.unavailable-features' not found
> 
> The XML file,
> <qemu:commandline>
>     <qemu:arg value="-cpu"/>
>     <qemu:arg value="host,+sgx,+sgx-debug,+sgx-exinfo,+sgx-kss,+sgx-mode64,+sgx-provisionkey,+sgx-tokenkey,+sgx1,+sgx2,+sgxlc"/>
>     <qemu:arg value="-object"/>
>     <qemu:arg value="memory-backend-epc,id=mem1,size=16M,prealloc=on"/>
>     <qemu:arg value="-M"/>
>     <qemu:arg value="sgx-epc.0.memdev=mem1"/>
>   </qemu:commandline>
> 
> The new compound property command should be located in /machine path,
> which are different with old command '-sgx-epc id=epc1,memdev=mem1'.
> 
> I also tried this from Qemu monitor tool, 
> (qemu) qom-list /machine
> type (string)
> kernel (string)
> ......
> sgx-epc (SgxEPC)
> ......
> sgx-epc[0] (child<memory-region>)
> ......
> 
> We can find sgx-epc from /machine list.
> 

  This issue is clear now, which is caused by Libvirt to get the CPU's unavailable-features by below command:
  {"execute":"qom-get","arguments":{"path":"/machine/unattached/device[0]","property":"unavailable-features"}

  but in SGX vm, since the sgx is initialized before VCPU because sgx need set the virtual EPC info in the cpuid.  

  So the /machine/unattached/device[0] is occupied by sgx, which fail to get the unvailable-features from
  /machine/unattached/device[0].


  We need fix this issue, but this can be done in Qemu or Libvirt side.

  1) Libvirt side
     If the libvirt support SGX EPCs, libvirt can use /machine/unattached/device[n] to check "unavailable-features".
     n is the next number of sgx's unattached_count.

  2) Qemu side
    
     One temp patch to create one /sgx in the /machine in the device_set_realized() 
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 84f3019440..4154eef0d8 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -497,7 +497,7 @@ static void device_set_realized(Object *obj, bool value, Error **errp)
     NamedClockList *ncl;
     Error *local_err = NULL;
     bool unattached_parent = false;
-    static int unattached_count;
+    static int unattached_count, sgx_count;

     if (dev->hotplugged && !dc->hotpluggable) {
         error_setg(errp, QERR_DEVICE_NO_HOTPLUG, object_get_typename(obj));
@@ -509,7 +509,15 @@ static void device_set_realized(Object *obj, bool value, Error **errp)
             goto fail;
         }

-        if (!obj->parent) {
+        if (!obj->parent && !strcmp(object_get_typename(obj), "sgx-epc")) {
+            gchar *name = g_strdup_printf("device[%d]", sgx_count++);
+
+            object_property_add_child(container_get(qdev_get_machine(),
+                                                    "/sgx"),
+                                      name, obj);
+            unattached_parent = true;
+            g_free(name);
+        } else if (!obj->parent) {
             gchar *name = g_strdup_printf("device[%d]", unattached_count++);

             object_property_add_child(container_get(qdev_get_machine()
   
    This patch can make sure vcpu is still /machine/unattached/device[0].


    Which solution is best?  thanks!

    Yang




> I am not familiar with Libvirt side, would you please suggest how to implement
> this compound command in the XML file?  thanks a lot!
> 
> Regards,
> 
> Yang  
> 

