Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C33966C6BD7
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 16:04:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfMSg-00025G-7W; Thu, 23 Mar 2023 11:02:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pfMSS-00022X-Ba
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 11:02:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pfMSL-0001Gk-8J
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 11:02:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679583732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zTHZsEdCrKnTGs99rJbSTnldZmmUHl8dHbdmN3HTpHo=;
 b=cSqkWRRT7Gwk2YwNBuEZldlMzirNtF4sMqTPMbCoLP/CnRgDzwT0LPZJFtZmoeujUOrP15
 QRUU88G7qRvtmkfr7aCI5xY1xIxNoObhiJsRdBgOYIm0vu72uXWCoPi9BUCGWiGBa6fPsE
 c3Cv0fXAB2XI4R0f6ELVZlDRsoaWzh4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-tDMWJ2xGPi6raSRbbCL4-Q-1; Thu, 23 Mar 2023 11:02:10 -0400
X-MC-Unique: tDMWJ2xGPi6raSRbbCL4-Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12C5385530D;
 Thu, 23 Mar 2023 15:02:10 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.236])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 78057202701E;
 Thu, 23 Mar 2023 15:02:09 +0000 (UTC)
Date: Thu, 23 Mar 2023 16:02:08 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Subject: Re: [PATCH 0/9] (mostly) block: add more coroutine_fn annotations,
 use bdrv/blk_co_*
Message-ID: <ZBxp8CeVYv9CTr3s@redhat.com>
References: <20230309084456.304669-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230309084456.304669-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 09.03.2023 um 09:44 hat Paolo Bonzini geschrieben:
> "Mostly" because there is a 9pfs patch in here too.
> 
> The series was developed with the help of vrc and the clang TSA annotations.

Thanks, fixed up some style issues and applied to block-next.

Kevin


