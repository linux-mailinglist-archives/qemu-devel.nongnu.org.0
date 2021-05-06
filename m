Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB13A37590C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 19:16:19 +0200 (CEST)
Received: from localhost ([::1]:59084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lehbm-0005rQ-PE
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 13:16:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1leh67-0000a9-Gs
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:43:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1leh64-0003Xv-3W
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:43:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620319410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tSPPfai6muMSre9M/0HODpHigfcYp8z1RXLVppzMxBY=;
 b=H++1rFLbXcyu98GXKDyQpB0uWyaCMwjr/cQjfELuB1FGJ6+NzGhqT2ZOrVULigU5fiMW23
 0mKHQF1pjOvAnHThTDqQkLfK41PfOIRoRXuDbEN5jxHyfsQKAYQNpBvEZ84AxczYKxFEXm
 sbhAZTJjXiEQNqJJA654YPcar2vBaBk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-9pciTDkEOdO7mu9oHierEg-1; Thu, 06 May 2021 12:43:28 -0400
X-MC-Unique: 9pciTDkEOdO7mu9oHierEg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DCF9106BB24;
 Thu,  6 May 2021 16:43:27 +0000 (UTC)
Received: from localhost (unknown [10.22.8.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B51560871;
 Thu,  6 May 2021 16:43:27 +0000 (UTC)
Date: Thu, 6 May 2021 12:43:25 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Subject: Re: [PATCH v6] i386/cpu_dump: support AVX512 ZMM regs dump
Message-ID: <20210506164325.qfexxgvwxgiph776@habkost.net>
References: <1618986232-73826-1-git-send-email-robert.hu@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1618986232-73826-1-git-send-email-robert.hu@linux.intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 robert.hu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 21, 2021 at 02:23:52PM +0800, Robert Hoo wrote:
> Since commit fa4518741e (target-i386: Rename struct XMMReg to ZMMReg),
> CPUX86State.xmm_regs[] has already been extended to 512bit to support
> AVX512.
> Also, other qemu level supports for AVX512 registers are there for
> years.
> But in x86_cpu_dump_state(), still only dump XMM registers no matter
> YMM/ZMM is enabled.
> This patch is to complement this, let it dump XMM/YMM/ZMM accordingly.
> 
> Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Queued, thanks!

-- 
Eduardo


