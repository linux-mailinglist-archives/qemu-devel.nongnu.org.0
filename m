Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 724952237D5
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jul 2020 11:10:05 +0200 (CEST)
Received: from localhost ([::1]:55630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jwMNX-0000Cm-Uv
	for lists+qemu-devel@lfdr.de; Fri, 17 Jul 2020 05:10:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1jwMMb-0007ux-Jd
 for qemu-devel@nongnu.org; Fri, 17 Jul 2020 05:09:05 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41613
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1jwMMZ-0000nW-KL
 for qemu-devel@nongnu.org; Fri, 17 Jul 2020 05:09:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594976942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U+SQTO/LdPhXi+iiDRCXGRz7FKFGXHlRx4X4xRi30gs=;
 b=Fb3y3cL4L3EmYYbKHAzcE8m0KuaE+jn5kugLg8+0n8sDhYSeHAOiKvzZ4ZdvkKibs4i/do
 Mfy2+Z0WxzOWynrdq54zI7mkW4HRl65acITSYNEMBwmm5XbQzt+8STYn1IK37EnfH9ujKn
 C/Zwjpcc3O95P8Q5YIqvBQTWYsl3dGM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-cpn_FlHdMgu4GEBKeNDTOA-1; Fri, 17 Jul 2020 05:08:58 -0400
X-MC-Unique: cpn_FlHdMgu4GEBKeNDTOA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CA591005274;
 Fri, 17 Jul 2020 09:08:57 +0000 (UTC)
Received: from kaapi (ovpn-112-116.phx2.redhat.com [10.3.112.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B0797B439;
 Fri, 17 Jul 2020 09:08:54 +0000 (UTC)
Date: Fri, 17 Jul 2020 14:38:52 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@kaapi
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] net: check payload length limit for all frames
In-Reply-To: <3620abab-a464-8e3c-d5b9-0bd80b35e2f1@redhat.com>
Message-ID: <nycvar.YSQ.7.78.906.2007171326100.4380@xnncv>
References: <20200716192335.1212638-1-ppandit@redhat.com>
 <CAKXe6SKL3aNiOKKLEMof6GGNjYLcX9fvfSf-0PBSX48rh4--FQ@mail.gmail.com>
 <20200717012151.tlfmc6hsfia22f4e@mozz.bu.edu>
 <4e4909ae-db2f-4a32-ae5c-d52149e80a8c@redhat.com>
 <nycvar.YSQ.7.78.906.2007171016480.950384@xnncv>
 <3620abab-a464-8e3c-d5b9-0bd80b35e2f1@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.120; envelope-from=ppandit@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/17 03:33:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Alexander Bulekov <alxndr@bu.edu>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Li Qiang <liq3ea@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+-- On Fri, 17 Jul 2020, Jason Wang wrote --+
| Thanks but I don't see a direct relation between 64K limit and this 
| calltrace. Maybe you can elaborate more on this?

The use-after-free is not function of the size per say; The reproducer given 
sends large(>64k) packets via loopback interface with gso_type=none(0). The 
proposed patch helps to fix it. The large size & payload_len may result in 
other oob kind of access issues too I think.

@Alex, would it be possible to share the reproduces on the upstream bug 
LP#1886362?

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D


