Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEF43E2202
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 05:02:00 +0200 (CEST)
Received: from localhost ([::1]:51596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBq7T-0002XR-JK
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 23:01:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mBq63-0001Gl-0X
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 23:00:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mBq61-0000sc-GC
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 23:00:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628218828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=KU412xskKpo2yK0ge/2dmfNOITyUMjm2OVBFCuYVuxg=;
 b=YRF/MBvIadgVoR188U6DEqBXXFjVm0t4L9wSKlYL/8eegEILkBhHz/LF1askSc98VjLkzx
 0UqBJqleUVLDLliVIWM/5Eqq4e7J5fV+Zf0d7ReToHCtEqe/xji86xz87btGS8Z1v3KJ3r
 WtRf4Wt99sbill94GuNmZOE3kA7Ta9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-RXcOf1I0PfqKycSWtyXcEA-1; Thu, 05 Aug 2021 23:00:26 -0400
X-MC-Unique: RXcOf1I0PfqKycSWtyXcEA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE74C87180F;
 Fri,  6 Aug 2021 03:00:25 +0000 (UTC)
Received: from localhost (unknown [10.22.11.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6FE6A5DF21;
 Fri,  6 Aug 2021 03:00:25 +0000 (UTC)
Date: Thu, 5 Aug 2021 23:00:24 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: Win32 and ACCEL macro/function
Message-ID: <20210806030024.om77dfa4frxtpw7i@habkost.net>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Stefan Weil <sw@weilnetz.de>, "Daniel P. Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

I'm looking for help dealing with a naming conflict when building
QEMU for Windows hosts.

The summary is: I'm trying to replace the ACCEL() macro in
include/qemu/accel.h with an inline function, but the ACCEL name
conflicts with a symbol provided by winuser.h:

  In file included from /builds/ehabkost/qemu/include/exec/memory.h:28,
                   from /builds/ehabkost/qemu/hw/ppc/mac.h:30,
                   from ../hw/pci-host/uninorth.c:27:
  /builds/ehabkost/qemu/include/qemu/accel.h:63:45: error: 'ACCEL' redeclared as different kind of symbol
     63 | OBJECT_DECLARE_TYPE(AccelState, AccelClass, ACCEL)
        |                                             ^~~~~
  /builds/ehabkost/qemu/include/qom/object.h:178:5: note: in definition of macro 'DECLARE_INSTANCE_CHECKER'
    178 |     OBJ_NAME(const void *obj) \
        |     ^~~~~~~~
  /builds/ehabkost/qemu/include/qom/object.h:240:5: note: in expansion of macro 'DECLARE_OBJ_CHECKERS'
    240 |     DECLARE_OBJ_CHECKERS(InstanceType, ClassType, \
        |     ^~~~~~~~~~~~~~~~~~~~
  /builds/ehabkost/qemu/include/qemu/accel.h:63:1: note: in expansion of macro 'OBJECT_DECLARE_TYPE'
     63 | OBJECT_DECLARE_TYPE(AccelState, AccelClass, ACCEL)
        | ^~~~~~~~~~~~~~~~~~~
  In file included from /usr/x86_64-w64-mingw32/sys-root/mingw/include/windows.h:72,
                   from /usr/x86_64-w64-mingw32/sys-root/mingw/include/winsock2.h:23,
                   from /builds/ehabkost/qemu/include/sysemu/os-win32.h:29,
                   from /builds/ehabkost/qemu/include/qemu/osdep.h:135,
                   from ../hw/pci-host/uninorth.c:25:
  /usr/x86_64-w64-mingw32/sys-root/mingw/include/winuser.h:1757:5: note: previous declaration of 'ACCEL' was here
   1757 |   } ACCEL,*LPACCEL;
        |     ^~~~~
  [338/4278] Compiling C object libqemuutil.a.p/meson-generated_.._trace_trace-scsi.c.obj
  ninja: build stopped: subcommand failed.
  make: *** [Makefile:156: run-ninja] Error 1

(Full log at https://gitlab.com/ehabkost/qemu/-/jobs/1481978645)

Does anybody more experienced with Win32 have a suggestion on how
to deal with this?  Do we really need to include winsock2.h /
windows.h / winuser.h from qemu/osdep.h?

-- 
Eduardo


