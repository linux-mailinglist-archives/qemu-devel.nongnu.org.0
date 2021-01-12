Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EB32F3BC0
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 22:13:18 +0100 (CET)
Received: from localhost ([::1]:53652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzQyb-0006oU-2h
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 16:13:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kzQx1-0005t9-Ni
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:11:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kzQx0-0002y1-3W
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:11:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610485897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8YyeQC8a7bvhShW2/xvj0SgtBCqLrPQAADJDEPCjupc=;
 b=XWwBgNHk2vyoorPpVnIHPbRlYXGfdhFNSid1VqsLfj0MZ2dQs/jA2hj52cwW5WhP85rRFo
 bRX112di4ZZ3FENJz7EWHhcyZKYYj4t2ztiyJw4cF2SwNPSjpv6Mjd9i4HPXkUYqUFoKll
 zoyhKFznugTP5Y5wJqC6k9uKZc96py4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-d3cU-S5bMgymZbYNdDrWKA-1; Tue, 12 Jan 2021 16:11:33 -0500
X-MC-Unique: d3cU-S5bMgymZbYNdDrWKA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFB8918C8C00;
 Tue, 12 Jan 2021 21:11:31 +0000 (UTC)
Received: from localhost (ovpn-119-212.rdu2.redhat.com [10.10.119.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C9189CA0;
 Tue, 12 Jan 2021 21:11:28 +0000 (UTC)
Date: Tue, 12 Jan 2021 16:11:27 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Daniele Buono <dbuono@linux.vnet.ibm.com>
Subject: Re: [PATCH] decodetree: Open files with encoding='utf-8'
Message-ID: <20210112211127.GC4161@habkost.net>
References: <20210108151632.277015-1-f4bug@amsat.org>
 <2cde5504-9df6-93fb-a014-daee2b907fde@linux.vnet.ibm.com>
MIME-Version: 1.0
In-Reply-To: <2cde5504-9df6-93fb-a014-daee2b907fde@linux.vnet.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[CCing John, Wainer]

On Fri, Jan 08, 2021 at 05:51:41PM -0500, Daniele Buono wrote:
> I had a similar issue in the past with the acceptance tests.
> Some VMs send UTF-8 output in their console and the acceptance test
> script would bail out if the locale was not UTF-8.
> 
> I sent a patch on the ml but it probably got lost:
> https://lists.gnu.org/archive/html/qemu-devel/2020-07/msg06086.html
> 
> I can re-spin it if you guys are interested

The mbox at
https://lore.kernel.org/qemu-devel/20200721125522.20511-1-dbuono@linux.vnet.ibm.com/
can still be applied cleanly, I don't think you need to resubmit.

However, we have no owner for tests/acceptance/avocado_qemu in
MAINTAINERS.  Is anybody currently taking care of
tests/acceptance patches and making sure they are merged?

-- 
Eduardo


