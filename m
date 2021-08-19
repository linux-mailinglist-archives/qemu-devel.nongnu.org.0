Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F39D43F1E60
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 18:53:27 +0200 (CEST)
Received: from localhost ([::1]:60140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGlIF-0004WF-1n
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 12:53:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mGlHS-0003j9-Hd
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 12:52:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mGlHP-0001Vc-Sf
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 12:52:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629391954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Te0uu1wux1vZo/m9r1QEEFwbMYFiRhbZQLz7lOc8p9M=;
 b=coQ+eRvxNUU5mUYTztLveUK21t3v8INGSrYMzojMrbH9f208X2gsi7q7sVEnTxkIW91VRG
 mxa47tMs3yGwvjYu7OkOdOnKiS16QGN8XJCSP38wN1rjqHr5OH2Epi7i55Paj4mWp/KkkE
 3WWy1Tug+8nunnYftUC6TksVZbGtMhs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-eSCE9lEyOTCdRniPkaIJkg-1; Thu, 19 Aug 2021 12:52:32 -0400
X-MC-Unique: eSCE9lEyOTCdRniPkaIJkg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E44C01B2C993;
 Thu, 19 Aug 2021 16:52:31 +0000 (UTC)
Received: from localhost (unknown [10.22.32.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A657C5DAA5;
 Thu, 19 Aug 2021 16:52:31 +0000 (UTC)
Date: Thu, 19 Aug 2021 12:52:31 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 50/66] hw/core/cpu: Move cpu properties to cpu-sysemu.c
Message-ID: <20210819165231.6qc3bnfctufm2vvh@habkost.net>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
 <20210818191920.390759-51-richard.henderson@linaro.org>
 <CAFEAcA9Wdriiz-8Km2s9c3cZCVnov3Z2OY6wpP6o3e6cA2qRxw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Wdriiz-8Km2s9c3cZCVnov3Z2OY6wpP6o3e6cA2qRxw@mail.gmail.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 19, 2021 at 04:26:10PM +0100, Peter Maydell wrote:
> On Wed, 18 Aug 2021 at 21:09, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > The comment in cpu-common.c is absolutely correct, we can't
> > rely on the ifdef in a file built once.  This was only "working"
> > because we used ifndef.
> >
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> Fixes: 1b36e4f5a5de585
> 
> which moved the properties out of cpu.c and into cpu-common.c
> with the remark "There's no reason to keep the property list
> separate from the CPU class code" despite there being a big
> fat warning comment saying why it can't go in a compiled-once
> source file !

Ouch.  Sorry about that.  :(

> 
> Is there a reason to prefer this patch over just reverting
> 1b36e4f5a5de585 ?

I agree with reverting the commit.

-- 
Eduardo


