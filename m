Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BD042F6B2
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 17:14:11 +0200 (CEST)
Received: from localhost ([::1]:60848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbOuQ-0006Cr-VK
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 11:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mbOtE-0005U2-2A
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 11:12:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mbOt8-0001CY-49
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 11:12:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634310769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=65pDGsk3pcOm6sB8bTL5Ywt0A9qyNKuISEGUs/CSKUU=;
 b=KdjZOoAbec8b8xKpzzdIc/mtcWK91RzM+wEmEzC5WR71PM5DHqQEtzailD+EsLiq4LTXqs
 gpPqvsmom51mLarM4tflmQJLd+FV+ocRGcvaiP7n7l9JvdfHd/QNDaNKjfrggHcKc+LFrz
 hYGadYRMJZBLtJT1szw3/Dw7Av4MoPc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-F7FWnPMyP0-IuKY9LOgkxA-1; Fri, 15 Oct 2021 11:12:47 -0400
X-MC-Unique: F7FWnPMyP0-IuKY9LOgkxA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73B9D19200EE;
 Fri, 15 Oct 2021 15:12:19 +0000 (UTC)
Received: from localhost (unused-10-15-17-6.yyz.redhat.com [10.15.17.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B10210016F4;
 Fri, 15 Oct 2021 15:12:19 +0000 (UTC)
Date: Fri, 15 Oct 2021 11:12:18 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Subject: Re: [RFC PATCH 1/5] target/i386: Print CPUID subleaf info for
 unsupported feature
Message-ID: <20211015151218.6eawtcjefblc7dcr@habkost.net>
References: <20210909144150.1728418-1-xiaoyao.li@intel.com>
 <20210909144150.1728418-2-xiaoyao.li@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210909144150.1728418-2-xiaoyao.li@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 09, 2021 at 10:41:46PM +0800, Xiaoyao Li wrote:
> Some CPUID leaves have meaningful subleaf index. Print the subleaf info
> in feature_word_description for CPUID features.
> 
> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo


