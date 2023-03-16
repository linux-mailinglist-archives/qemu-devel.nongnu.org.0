Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 365FE6BCBCF
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 11:01:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pckPz-00065r-7w; Thu, 16 Mar 2023 06:01:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pckPx-00065T-SL
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 06:01:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pckPw-0004bf-Db
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 06:01:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678960863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xw+ZNRz0KtyeWqj5dDXEJ8oKOxkhYiyXpDAY8Zy/cw0=;
 b=fzyMLDFLXaPkGOCL2bnXdEhawpJrl5+bEJFbjM2vqFhcMpzu8C3aJwkL7JxRMBxd3wZ1TA
 RsmTHGO/htIsMED1x7ExLS3MY9dwmd8p4c2zemH8qaEX2DksUDD44SKaXxqOR8czwKHWUx
 ORfhTXUUrt8KuDX0xR2YMLlXYliGczg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-OVTJLWoZOq6YDPWdTWJtoQ-1; Thu, 16 Mar 2023 06:00:59 -0400
X-MC-Unique: OVTJLWoZOq6YDPWdTWJtoQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD0662814241;
 Thu, 16 Mar 2023 10:00:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC20AC15BA0;
 Thu, 16 Mar 2023 10:00:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9F01621E6806; Thu, 16 Mar 2023 11:00:57 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Andrew
 Randrianasulu
 <randrianasulu@gmail.com>,  qemu-discuss@nongnu.org,  QEMU Developers
 <qemu-devel@nongnu.org>
Subject: Re: dropping 32-bit host support
References: <CA+rFky6A9Q_5sJ4WDO-Z2HBT59qiNgr8A-xk+O7-gnAMZmHt2A@mail.gmail.com>
 <f06fddef-1e40-1858-2715-50a0518a97f6@linaro.org>
 <CA+rFky5=kc0Pwf3RRhuKrBqtRVkmtm=NDKhrVgJV2_Ame2nUOQ@mail.gmail.com>
 <c33b0e07-5c46-6ebe-fe4c-5308ce508a70@linaro.org>
 <632e7256-34f5-ca87-ff60-a5c11aa1dd7f@redhat.com>
Date: Thu, 16 Mar 2023 11:00:57 +0100
In-Reply-To: <632e7256-34f5-ca87-ff60-a5c11aa1dd7f@redhat.com> (Thomas Huth's
 message of "Thu, 16 Mar 2023 09:31:15 +0100")
Message-ID: <878rfxuiau.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Thomas Huth <thuth@redhat.com> writes:

[...]

> The problem is really that we don't have unlimited resources in the
> QEMU project. Currently we're heavily struggling with the load in the
> CI, but also pure man power is always very scarce. So at one point in
> time, you have to decide to say good bye to some old and hardly used
> features - at least to stop testing and actively supporting it. If you
> want to continue testing and fixing bugs for such host systems, that's
> fine, of course, but don't expect the QEMU developers to do that job
> in the future.

This.

We're out of free lunch.  We're glad you enjoyed it while it lasted.

If you want more lunch, you need to join the kitchen.  Here are a few
things we need to keep a host or target supported:

* Competent maintainer(s) to relieve the ones who have maintained this
  for you so far

* CI runners to conserve scarce CI minutes (or the money to buy more)

* Trustworthy system administrator(s) to set them up and keep them
  running.


