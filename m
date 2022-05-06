Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC6151D70E
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 13:50:38 +0200 (CEST)
Received: from localhost ([::1]:48872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmwTj-0004SK-JS
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 07:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmwQd-0002Kl-Dq
 for qemu-devel@nongnu.org; Fri, 06 May 2022 07:47:23 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:44980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmwQa-0008KT-1T
 for qemu-devel@nongnu.org; Fri, 06 May 2022 07:47:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651837637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dOsTO4eNY70GsQ58ik0bPhBc+URde0Vkc2h6aB9lHKY=;
 b=enVybAr1WXP84l+4pIurxqwhqqyZZ7QfQABLp++dg2o6RcBVgVoHNF9Nn168TTxGPyKvX+
 0k5kMR9j8yljmo6f8QfDQ09S3cvS5PIK9hTHmyOD1NZqSZWDPal/9P1SPP6b5Y9OAs+d3V
 Y6/VwIjA8PEDWpxOIXzDHpJAxHOff1U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-SuEqK6C2O-yxE1cxsZgYNg-1; Fri, 06 May 2022 07:47:15 -0400
X-MC-Unique: SuEqK6C2O-yxE1cxsZgYNg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 234C68038E3
 for <qemu-devel@nongnu.org>; Fri,  6 May 2022 11:47:15 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B430F9E75;
 Fri,  6 May 2022 11:47:11 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
	ldoktor@redhat.com
Subject: [PATCH 0/2] thread-pool: fix performance regression
Date: Fri,  6 May 2022 07:47:09 -0400
Message-Id: <20220506114711.1398662-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.74; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Together, these two patches fix the performance regression induced by
QemuSemaphore; individually they don't though.

6.2:
   iops        : min=58051, max=62260, avg=60282.57, stdev=1081.18, samples=30
    clat percentiles (usec):   1.00th=[  490],   99.99th=[  775]
   iops        : min=59401, max=61290, avg=60651.27, stdev=468.24, samples=30
    clat percentiles (usec):   1.00th=[  490],   99.99th=[  717]
   iops        : min=59583, max=60816, avg=60353.43, stdev=282.69, samples=30
    clat percentiles (usec):   1.00th=[  490],   99.99th=[  701]
   iops        : min=58099, max=60713, avg=59739.53, stdev=755.49, samples=30
    clat percentiles (usec):   1.00th=[  494],   99.99th=[  717]


patched:
   iops        : min=60616, max=62522, avg=61654.37, stdev=555.67, samples=30
    clat percentiles (usec):   1.00th=[  474],   99.99th=[ 1303]
   iops        : min=61841, max=63600, avg=62878.47, stdev=442.40, samples=30
    clat percentiles (usec):   1.00th=[  465],   99.99th=[  685]
   iops        : min=62976, max=63910, avg=63531.60, stdev=261.05, samples=30
    clat percentiles (usec):   1.00th=[  461],   99.99th=[  693]
   iops        : min=60803, max=63623, avg=62653.37, stdev=808.76, samples=30
    clat percentiles (usec):   1.00th=[  465],   99.99th=[  685]

Paolo

Supersedes: <20220505131346.823941-1-pbonzini@redhat.com>

Paolo Bonzini (2):
  thread-pool: optimize scheduling of completion bottom half
  thread-pool: replace semaphore with condition variable

 util/thread-pool.c | 34 +++++++++++++---------------------
 1 file changed, 13 insertions(+), 21 deletions(-)

-- 
2.31.1


