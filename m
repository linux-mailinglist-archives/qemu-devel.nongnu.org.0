Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 497BF2D1C1D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 22:32:12 +0100 (CET)
Received: from localhost ([::1]:40632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmO78-0007KK-6N
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 16:32:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kmO3g-0006IY-A0
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 16:28:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kmO3V-0004nm-VM
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 16:28:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607376503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LgVP0d+FLAg5wz/5aumgdzP06jtil+1++3XLVONNygo=;
 b=El/cOgwzUO91tuCMiF0ftBjgXaGH3+zw7bbeDGz7ckWozYaVE5aLeiCjKLf+POZ7lCvylX
 6Pok54X/UfwKYvOnZ9MeqSxUoWZ/WKNJwH/iac+ZShkdsXUW0kw9OAed3PyBEl75aOwMgh
 T0onln+gBhCpu3745/XmSnUr+QUbUS8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-vpVb3jkMP0Ollct2A94ajw-1; Mon, 07 Dec 2020 16:28:19 -0500
X-MC-Unique: vpVb3jkMP0Ollct2A94ajw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 575B01005504;
 Mon,  7 Dec 2020 21:28:15 +0000 (UTC)
Received: from localhost (ovpn-120-147.rdu2.redhat.com [10.10.120.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F076D60BE2;
 Mon,  7 Dec 2020 21:28:14 +0000 (UTC)
Date: Mon, 7 Dec 2020 16:28:14 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] target/arm: do not use cc->do_interrupt for KVM directly
Message-ID: <20201207212814.GJ1289986@habkost.net>
References: <20201207084042.7690-1-cfontana@suse.de>
 <20201207174916.GD1289986@habkost.net>
 <CAFEAcA_UUs6NJ_JYtNEQ3VubHnvsvo1BBx6=9nVT9GO_QrDwoQ@mail.gmail.com>
 <20201207182842.GE1289986@habkost.net>
 <CAFEAcA9OWLF01hR4qzPwKWAHiDZ9RkSab8rv+0rnkyNhQjAnOg@mail.gmail.com>
 <2e2e0160-7c17-cdfd-93e0-3d2002996108@suse.de>
 <CAFEAcA_X3Lhc0Pmea78fboTr_5kUjM4x4QbEXC2VWFXX=a98uQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_X3Lhc0Pmea78fboTr_5kUjM4x4QbEXC2VWFXX=a98uQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Dongjiu Geng <gengdongjiu@huawei.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 07, 2020 at 09:12:34PM +0000, Peter Maydell wrote:
> On Mon, 7 Dec 2020 at 21:06, Claudio Fontana <cfontana@suse.de> wrote:
> > As I understand it, for the purpose of code separation,
> > we could:
> >
> > 1) skip do_interrupt move to the separate tcg_ops structure, wait until KVM/ARM uses another approach (if ever)
> > 2) do the move, and just call arm_cpu_do_interrupt() directly, since for KVM64 it is the only one that can be assigned to cc->do_interrupt().
> >
> > Which way would you suggest?
> 
> So what's the intention here? To put tcg-only methods in their
> own struct so that on a KVM-only QEMU they're compiled out
> and attempts to use them are a compile error? In that case
> I guess if Arm really is the only user of do_interrupt outside
> TCG then we should do what this patch does and do a direct call.

Oh, I thought you were arguing that CPUClass.do_interrupt is
not TCG_specific.

If you agree with doing what this patch does, the plan sounds
good to me.

-- 
Eduardo


