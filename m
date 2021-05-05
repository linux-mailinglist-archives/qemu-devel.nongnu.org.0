Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 572613748EE
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 21:55:17 +0200 (CEST)
Received: from localhost ([::1]:42674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leNc3-0005od-V4
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 15:55:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1leNaH-0004va-Jt
 for qemu-devel@nongnu.org; Wed, 05 May 2021 15:53:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1leNaE-0007NN-Bv
 for qemu-devel@nongnu.org; Wed, 05 May 2021 15:53:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620244401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TSXQe5B/zTQd2bpmhHvwnRz4cgyg0Z1QHKhS+x++eg8=;
 b=Cq46eBw/DN04voM/bwyfpHg0INbyNtIAfji1n2WMrgoqJyn8+UpDigQo2x9C5bWtkEubBb
 G1ASrCmrWn/b0HFJGdA6wFsDUUZ6zFJzC4ctGW8ajPMX2jPtqlHPmDb5UCSjEavpa34qSZ
 jqm1ej3YtB9IE52NxcaiH8iTm09nBA4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-mNBPs1TVNOSsNxr9FxULIg-1; Wed, 05 May 2021 15:53:19 -0400
X-MC-Unique: mNBPs1TVNOSsNxr9FxULIg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5224518982A3;
 Wed,  5 May 2021 19:53:18 +0000 (UTC)
Received: from localhost (unknown [10.22.8.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 098D55C1A3;
 Wed,  5 May 2021 19:53:17 +0000 (UTC)
Date: Wed, 5 May 2021 15:53:17 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 0/2] target/i386/cpu: Constify CPUCaches and
 X86CPUDefinition
Message-ID: <20210505195317.ahbrqya7etlpqjje@habkost.net>
References: <20210503173524.833052-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210503173524.833052-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 03, 2021 at 07:35:22PM +0200, Philippe Mathieu-Daudé wrote:
> X86CPUDefinition[] is never written, move it to .rodata section
> by marking it const.
> 
> Philippe Mathieu-Daudé (2):
>   target/i386/cpu: Constify CPUCaches
>   target/i386/cpu: Constify X86CPUDefinition

Queued, thanks!

-- 
Eduardo


