Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 420A331B790
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 11:49:53 +0100 (CET)
Received: from localhost ([::1]:40588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBbRw-0005A3-C6
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 05:49:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lBbQe-0004j6-A2
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:48:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lBbQc-0008TX-Uu
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:48:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613386109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QlmyTgqDynys31AY47yrwAPgxdYm5TI/DoXZuRY5R9I=;
 b=OPT9SIOpvwZ8Bb9UnJHniIHALQLpEWprhTVYotCO5MMmiqkGHPRzULArU4mfnQe76I7isi
 KsR6WeHO5DK+PZccYnFPHW5M7pitTnxRT+2r3eYRHUfN0fHbd+/4Q7hjgu49juCYj+BKHP
 4dGhl432NDg/jJ1oy1Y0KyMBUyW50HQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-8OSHkTjwN0-9crrIqLriSg-1; Mon, 15 Feb 2021 05:48:27 -0500
X-MC-Unique: 8OSHkTjwN0-9crrIqLriSg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BE041E561
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 10:48:26 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.195.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 15F6F60C5F;
 Mon, 15 Feb 2021 10:48:24 +0000 (UTC)
Date: Mon, 15 Feb 2021 11:48:22 +0100
From: Andrew Jones <drjones@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v4 16/21] i386: track explicit 'hv-*' features
 enablement/disablement
Message-ID: <20210215104822.vo4npvyp4vqowiyl@kamzik.brq.redhat.com>
References: <20210210164033.607612-1-vkuznets@redhat.com>
 <20210210164033.607612-17-vkuznets@redhat.com>
 <20210211183555.2136b5c8@redhat.com>
 <87tuqhllmn.fsf@vitty.brq.redhat.com>
 <20210212151259.3db7406f@redhat.com>
 <87k0rdl3er.fsf@vitty.brq.redhat.com>
 <20210212170113.30a902b2@redhat.com>
 <87eehhlnj5.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
In-Reply-To: <87eehhlnj5.fsf@vitty.brq.redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Igor Mammedov <imammedo@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 15, 2021 at 09:53:50AM +0100, Vitaly Kuznetsov wrote:
> I have no clue why scratch vCPUs were implemented on ARM, however, I'd

We don't have an ioctl like KVM_GET_SUPPORTED_CPUID, which operates on
the KVM fd. Perhaps we should.

Thanks,
drew


