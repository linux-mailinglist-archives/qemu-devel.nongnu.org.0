Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E04A924D7B0
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 16:51:17 +0200 (CEST)
Received: from localhost ([::1]:39010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k98Nx-00048I-1A
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 10:51:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1k98N9-0003WU-B5
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 10:50:27 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:22542
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1k98N6-0001Ua-Ma
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 10:50:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598021423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=thk4uK4jeeeBOJn0GtXI9RZP5xA2uiitnMpvbxQVqBM=;
 b=Py3I2zqiXM/s56qnpZqlrLUw5zXLEJjO5gW+DvAIF7/WsI16YZyLlcL+hCUU9jdslMf2CM
 3PuB4u62v8fQAr1r2i2UHspGdfFEzFQZKfMUGUajwJ8BcRmhIe3RqEBrcRI9rUF5Q1MTse
 32SPl1amRVmRIXzgMr7wvBYuN/FDKI4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-fkCLQHD-M9aYXX_Rha6frg-1; Fri, 21 Aug 2020 10:50:18 -0400
X-MC-Unique: fkCLQHD-M9aYXX_Rha6frg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C13218A2242;
 Fri, 21 Aug 2020 14:50:17 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-164.ams2.redhat.com
 [10.36.113.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CADAB10013C2;
 Fri, 21 Aug 2020 14:50:16 +0000 (UTC)
Subject: Re: ANNOUNCE: build system conversion to Meson has landed
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAFEAcA-87BcmoPjY9BCodx9+m6QmhfikHv5sLVJ8w20cszDvDA@mail.gmail.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <be069d22-510c-7c5f-7b57-00e8abd0ba41@redhat.com>
Date: Fri, 21 Aug 2020 16:50:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Firefox/52.0 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-87BcmoPjY9BCodx9+m6QmhfikHv5sLVJ8w20cszDvDA@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=lersek@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 23:41:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/21/20 15:49, Peter Maydell wrote:

> https://wiki.qemu.org/Features/Meson/Next has a summary of changes
> and is worth a quick scan through.

I'd like to propose a wording clarification:

"""
For bisection: incremental builds work fine in the forward direction.
They probably don't work at all backwards. This is mitigated by the fact
that bisection usually starts at a release, and the patches should be
applied on top of the 5.1.0 tag.
"""

namely:

- s/forward direction/forward direction, across the conversion/
- s/backwards/backwards, across the conversion/

Because the way the paragraph is worded now, it suggests that *any*
individual bisection step that moves backwards in the git history will
not build. That would be of course catastrophic. We should clarify that
the symptom is limited to steps that straddle the conversion commit range.

If the suggested replacements are OK, I can make the edit myself (if
that's preferred).

(Not trying to be a busybody -- exactly because I contribute little to
QEMU, bisection is a comparatively large part of what I *do* do with QEMU.)

Thanks!
Laszlo


