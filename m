Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 241833BDF60
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 00:21:56 +0200 (CEST)
Received: from localhost ([::1]:47274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0tRy-0003a0-KH
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 18:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m0tQW-0002Qd-CG
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 18:20:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m0tQN-0000pk-Qo
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 18:20:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625610013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rjyH+CXojeHX7zSU1AFzWnU9hn5rQVYicw5ZLHamtgE=;
 b=diHEjJKyTzSz8fsJuQiC8UVclnZ0whKkTcSgEqAOmISPd51AQLfrlKMeKvJ0Rj3YCDzhx8
 K9OspR4gDBfwTmVCheboAmLHEHIIwQKVNT60MDh+vInp1CipEI+8kNV0/H2IRFtXP6lNuY
 eu9sptmB4vItP5TefYTD88VZhwJIvzU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-3qxP0Bi9Pj61Ca8z43WmKQ-1; Tue, 06 Jul 2021 18:20:11 -0400
X-MC-Unique: 3qxP0Bi9Pj61Ca8z43WmKQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40DA036303;
 Tue,  6 Jul 2021 22:20:10 +0000 (UTC)
Received: from localhost (ovpn-113-79.rdu2.redhat.com [10.10.113.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB9A019C44;
 Tue,  6 Jul 2021 22:20:09 +0000 (UTC)
Date: Tue, 6 Jul 2021 18:20:08 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Ziqiao Kong <ziqiaokong@gmail.com>
Subject: Re: [PATCH v7 2/2] target/i386: Correct implementation for FCS, FIP, 
 FDS and FDP
Message-ID: <20210706222008.qxlidk57djrz27fo@habkost.net>
References: <20210530150112.74411-1-ziqiaokong@gmail.com>
 <20210530150112.74411-2-ziqiaokong@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210530150112.74411-2-ziqiaokong@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, May 30, 2021 at 11:01:14PM +0800, Ziqiao Kong wrote:
> Update FCS:FIP and FDS:FDP according to the Intel Manual Vol.1 8.1.8. Note that
> CPUID.(EAX=07H,ECX=0H):EBX[bit 13] is not implemented by design in this patch
> and will be added along with TCG features flag in a separate patch later.
> 
> Signed-off-by: Ziqiao Kong <ziqiaokong@gmail.com>

Richard, are you OK with merging this?  I'm not familiar enough
with TCG code to be confident in reviewing it.

-- 
Eduardo


