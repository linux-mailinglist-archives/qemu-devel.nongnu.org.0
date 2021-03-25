Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2C3349785
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 18:03:15 +0100 (CET)
Received: from localhost ([::1]:57980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPTO5-0001zw-Qi
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 13:03:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lPTJG-0007TK-Jt
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 12:58:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lPTJE-0001Wq-QB
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 12:58:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616691490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=V/U1NZIstR+UNfYiD66TOJxGWDNy1ofJqvwlRQeqXDw=;
 b=AJwqw9Qb9sOGiMWpjdbN5wIJ9D7K5DS+TL+PliGlSAOdUTY94iX0UJylndSxAOQ8j+IQGv
 kSvwgVoIfhzkOtomzHbPoEKVZrkf0/2sWBJuIGrt+hLOrYVIQYKPKFNXgYCkFcEIMr87ai
 ilw4ryXI43+mVr3xJIMq38UFmIYJH+U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-y971qC6oM6aDCKCioUqq3A-1; Thu, 25 Mar 2021 12:58:08 -0400
X-MC-Unique: y971qC6oM6aDCKCioUqq3A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EDDF107ACCD;
 Thu, 25 Mar 2021 16:58:07 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-114-244.ams2.redhat.com [10.36.114.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58ED317258;
 Thu, 25 Mar 2021 16:58:01 +0000 (UTC)
To: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
From: Thomas Huth <thuth@redhat.com>
Subject: qemu-system-aarch64 crashes with device ich9-usb-ehci1
Message-ID: <2542a79a-c143-1db4-de97-6b04929158db@redhat.com>
Date: Thu, 25 Mar 2021 17:58:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


In case anybody is interested, ich9-usb-ehci1 can be used to crash QEMU:

$ ./qemu-system-aarch64 -M virt -device ich9-usb-ehci1,help
qemu-system-aarch64: ../../devel/qemu/softmmu/physmem.c:1154: 
phys_section_add: Assertion `map->sections_nb < TARGET_PAGE_SIZE' failed.
Aborted (core dumped)

  Thomas


