Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 007C250B6A1
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:56:23 +0200 (CEST)
Received: from localhost ([::1]:57616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhrte-0005IU-3J
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:56:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nhqic-0003jV-On
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:40:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nhqia-0008V5-1y
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:40:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650624051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PAuucCbo3qLFpvPSw8VpRrHOmmStcCZLD50v3awWHDw=;
 b=QVJcNuY/x0L4BgcgA0sbEqiApcEg3FMcHi/G5OJzBFCQHkToZ0jXbWoH7YXqqj/Xk3tead
 EFZzXnWYVHLFfilJ4P7Yn52gUAZn/8MIFADZ5NxiKK1MzCXVkYBXUdF3tx1A7cxjpqjyTJ
 VVgsj9BpMGoyc99rMWDWPVBJ62YrEt0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-KPJrm1qFPcS__zDk7x2pdA-1; Fri, 22 Apr 2022 06:40:45 -0400
X-MC-Unique: KPJrm1qFPcS__zDk7x2pdA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A74C1014A60;
 Fri, 22 Apr 2022 10:40:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2376F40D0174;
 Fri, 22 Apr 2022 10:40:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1FE37180098B; Fri, 22 Apr 2022 12:40:30 +0200 (CEST)
Date: Fri, 22 Apr 2022 12:40:30 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Carwyn Ellis <carwynellis@gmail.com>
Subject: Re: [PATCH v3 2/2] hw/display/vmware_vga: do not discard screen
 updates
Message-ID: <20220422104030.kte6wcu3zc4oywey@sirius.home.kraxel.org>
References: <20220206183956.10694-1-carwynellis@gmail.com>
 <20220206183956.10694-3-carwynellis@gmail.com>
 <2CBB155B-88D6-42EC-9EA0-88968C3FD3B7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2CBB155B-88D6-42EC-9EA0-88968C3FD3B7@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: qemu trivial <qemu-trivial@nongnu.org>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Apr 10, 2022 at 05:49:30PM +0100, Carwyn Ellis wrote:
> ping
> 
> https://patchew.org/QEMU/20220206183956.10694-1-carwynellis@gmail.com/20220206183956.10694-3-carwynellis@gmail.com/
> 
> Originally submitted as one of two patches, the first patch to use trace events has been merged, however the patch that fixes garbled output hasn’t been reviewed yet.

Hmm, slipped through for some reason, IIRC I cherry-picked the trace
events patch from v2 series and probably simply missed v3.  Queued now.

thanks,
  Gerd


