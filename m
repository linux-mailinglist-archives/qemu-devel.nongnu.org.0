Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B52065CCC2
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 07:07:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCwul-00022f-EO; Wed, 04 Jan 2023 01:06:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1pCwuj-00022H-0q
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 01:06:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1pCwug-00049C-SG
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 01:06:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672812369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=18DDrjXqjGujNyuTWJ7XfzUO5POxPnfPq917QHEZ9dQ=;
 b=T/3W/M50ubJ04IONGR+7oLH4ba6Fa8oGzoJprhcg/AaJ8KFKk4CPXAc3/DNmKl8qKWYtKj
 WWYnYrtcfRN29CO4eSh3S1A5S8cEoNJBq8d2F7QRcHoUCb48hzE1yKO/QnM1DjEPFRxt0I
 cz0olj0J71NdM7o6oydK4OJvxJwuOWc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499-HTgD0w8_NzGaFzmnemvKBw-1; Wed, 04 Jan 2023 01:06:06 -0500
X-MC-Unique: HTgD0w8_NzGaFzmnemvKBw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 01BA63810789;
 Wed,  4 Jan 2023 06:06:06 +0000 (UTC)
Received: from [10.39.192.86] (unknown [10.39.192.86])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FA56C15BA0;
 Wed,  4 Jan 2023 06:06:04 +0000 (UTC)
Message-ID: <ea401dd3-53f1-b27c-4a5a-9085ce5ab051@redhat.com>
Date: Wed, 4 Jan 2023 07:06:03 +0100
MIME-Version: 1.0
Subject: Re: IO port write width clamping differs between TCG and KVM
From: Laszlo Ersek <lersek@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: "Ard Biesheuvel (kernel.org address)" <ardb@kernel.org>,
 qemu devel list <qemu-devel@nongnu.org>
References: <aaedee84-d3ed-a4f9-21e7-d221a28d1683@redhat.com>
Content-Language: en-US
In-Reply-To: <aaedee84-d3ed-a4f9-21e7-d221a28d1683@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 1/3/23 18:42, Laszlo Ersek wrote:
> (resending with qemu-devel on CC; sorry!)
> 
> Hi,
> 
> this is with QEMU-7.2.

This is a regression. It works fine with QEMU-5.0. The regression has
not been fixed since QEMU-7.2, as of master @ 222059a0fccf ("Merge tag
'pull-ppc-20221221' of https://gitlab.com/danielhb/qemu into staging",
2022-12-21).

I'm bisecting.

(It's a relief that this is a regression. I felt pretty certain that I
had tested CPU hotplug with TCG as well!

I've picked QEMU-5.0 as the start candidate for my bisection for the
following reason: per git-blame, Igor described the modern interface
detection steps in commit ae340aa3d2567 (which I reviewed), and the
first tag/release to contain that commit was QEMU-5.0. The first QEMU
release after Igor and I had worked on this in QEMU and OVMF definitely
worked with TCG too, by my account.)

Laszlo


