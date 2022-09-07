Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D03C45AFDAA
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 09:38:35 +0200 (CEST)
Received: from localhost ([::1]:56028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVpdq-0005gX-HX
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 03:38:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oVpcV-00043L-4h
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 03:37:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oVpcQ-00005L-EG
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 03:37:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662536225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TvA0meZ1fCArNe6R3biLHlOobmQ1CLXN38zai+lFRfU=;
 b=OGdp9FOc6ZZezZVMr13J/Vc8ONpNtX3fF2sIEOGVvHbsQcwpkK33E9jR9Og2ulAkFgVNPE
 msZKDKJOitihGbrWq4u4n0nmAPebfnt7R1sywLP5ZlbxIcc0JTgtf8tl+QB+gIvwZ9FFO7
 uWpWJJfnoSR9xBGJICPWuspzhG4icPc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-323-epAVZ_f6NGSd1yREJpANPg-1; Wed, 07 Sep 2022 03:37:00 -0400
X-MC-Unique: epAVZ_f6NGSd1yREJpANPg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D38D8037B7;
 Wed,  7 Sep 2022 07:36:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AF1640CF916;
 Wed,  7 Sep 2022 07:36:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8A4DB180039B; Wed,  7 Sep 2022 09:36:57 +0200 (CEST)
Date: Wed, 7 Sep 2022 09:36:57 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, dinechin@redhat.com,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 2/3] module: add Error arguments to module_load_one and
 module_load_qom_one
Message-ID: <20220907073657.d4c27abnctjlxviw@sirius.home.kraxel.org>
References: <20220906115501.28581-1-cfontana@suse.de>
 <20220906115501.28581-3-cfontana@suse.de>
 <6608303b-0e08-8045-3872-257450e1adb5@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6608303b-0e08-8045-3872-257450e1adb5@suse.de>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,
 
> For this module_load_qom_all() maybe Gerd has a bit more context on
> was should be the error reporting here?

Use case for module_load_qom_all() is someone enumerating the qom
objects available.  So we load all modules known to have all object
types registered and can return a complete list.

It could be that some of the known modules are not there.  Consider a
distro packaging modules which depend on shared libraries into optional
sub-rpms, to reduce the dependency chain of core qemu.  So, with core
qemu installed and (some of) the sub-rpms not installed
module_load_qom_all() will obviously fail to load some modules.

But I don't think those errors should be reported.  The object types
implemented by the missing modules will also be missing from the object
type list ...

Example: hw-usb-host.so is not installed.

  => 'qemu -device help' should IMHO not report the module load error
     and just not list the 'usb-host' device.
  => 'qemu -device usb-host' should report the module load error.

take care,
  Gerd


