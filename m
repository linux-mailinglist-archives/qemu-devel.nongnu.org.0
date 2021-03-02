Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C62329675
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 07:42:46 +0100 (CET)
Received: from localhost ([::1]:47932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGyk1-0005Uz-EK
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 01:42:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1lGyh8-0004WY-9g
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 01:39:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1lGyh5-0003p8-94
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 01:39:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614667182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E14yV2I+WYGMptq66Qo1RRFNyULGJiEBqJIhP22mE24=;
 b=SgKyNcPydCht2l0BVHZ5CCmf12qL1x2f5WDahQF7CFQIyyV1HsxUpnjPoCAmuozv7D9qGi
 zg5f70hzEGF3Fa+35AOsHyvPr5lM0lz8E/Js1YwbbM3HgiKa9L6IHUJAAOEIrAvYuWgCUG
 HjJ8ESPJrIT9pzAry1qNfTzz6Sdoowg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-e_eMY4faPlGcisWBS6omkg-1; Tue, 02 Mar 2021 01:39:38 -0500
X-MC-Unique: e_eMY4faPlGcisWBS6omkg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44BA0803F47;
 Tue,  2 Mar 2021 06:39:37 +0000 (UTC)
Received: from kaapi (unknown [10.74.9.119])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A7C775B4B0;
 Tue,  2 Mar 2021 06:39:34 +0000 (UTC)
Date: Tue, 2 Mar 2021 12:09:31 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2 7/7] rtl8193: switch to use qemu_receive_packet() for
 loopback
In-Reply-To: <20210302055500.51954-9-jasowang@redhat.com>
Message-ID: <42np32r6-nr45-psnq-n61r-8on26spo4rp0@erqung.pbz>
References: <20210302055500.51954-1-jasowang@redhat.com>
 <20210302055500.51954-9-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: alxndr@bu.edu, philmd@redhat.com, qemu-devel@nongnu.org,
 qemu-security@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


+-- On Tue, 2 Mar 2021, Jason Wang wrote --+
|          DPRINTF("+++ transmit loopback mode\n");
| -        rtl8139_do_receive(qemu_get_queue(s->nic), buf, size, do_interrupt);
| +        qemu_receive_packet(qemu_get_queue(s->nic), buf, size);
|  
...
|[PATCH V2 7/7] rtl8193: switch to use qemu_receive_packet() for loopback

* Patch 'V2' need not be here.

Thank you.
--
 - P J P
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D


