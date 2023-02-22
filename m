Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B58469F906
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 17:32:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUs1m-0006ea-Le; Wed, 22 Feb 2023 11:31:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pUs1k-0006eN-Ow
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 11:31:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pUs1j-0006Rp-7F
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 11:31:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677083490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gnnO2neFokJK8TdjPLw69u4D03bvly8h4bb261vEEtg=;
 b=bf2WXimiJq5er+6Rg1R3xP09lsBLPj5nPjRWhFoy2LdZ1STFATMqNXyPcz+UgW0EDJbimR
 Y7OxRbvUB5fbJx7fhn086QEbQXX7g4gcy9VczySVfNrQGLPDlA/pvWEloHSk828MUFCbl7
 zJcGR2bsg/9G3RYHIGUyVLMOHSYdqZA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-ia3041qANMSrJo2NvFY-Hw-1; Wed, 22 Feb 2023 11:31:27 -0500
X-MC-Unique: ia3041qANMSrJo2NvFY-Hw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D79163848C39;
 Wed, 22 Feb 2023 16:31:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B084C440DD;
 Wed, 22 Feb 2023 16:31:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8DA8021E6A1F; Wed, 22 Feb 2023 17:31:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org,  jsnow@redhat.com,  peter.maydell@linaro.org,
 thuth@redhat.com,  alex.bennee@linaro.org,  berrange@redhat.com
Subject: Re: [PATCH 09/10] Python: Drop support for Python 3.6
References: <20230222143752.466090-1-pbonzini@redhat.com>
 <20230222143752.466090-10-pbonzini@redhat.com>
Date: Wed, 22 Feb 2023 17:31:25 +0100
In-Reply-To: <20230222143752.466090-10-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Wed, 22 Feb 2023 15:37:51 +0100")
Message-ID: <878rgpll0i.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Paolo Bonzini <pbonzini@redhat.com> writes:

> Python 3.6 was EOL 2021-12-31. Newer versions of upstream libraries have
> begun dropping support for this version and it is becoming more
> cumbersome to support. Avocado-framework and qemu.qmp each have their
> own reasons for wanting to drop Python 3.6, but won't until QEMU does.

In review of the original "[PATCH v3 6/6] Python: Drop support for
Python 3.6", I volunteered to rework the rationale.  Second thoughts: if
y'all think this is good enough, let's leave it there.

> Versions of Python available in our supported build platforms as of today,
> with optional versions available in parentheses:
>
> openSUSE Leap 15.4: 3.6.15 (3.9.10, 3.10.2)
> CentOS Stream 8:    3.6.8  (3.8.13, 3.9.16)
> CentOS Stream 9:    3.9.13
> Fedora 36:          3.10
> Fedora 37:          3.11
> Debian 11:          3.9.2
> Alpine 3.14, 3.15:  3.9.16
> Alpine 3.16, 3.17:  3.10.10
> Ubuntu 20.04 LTS:   3.8.10
> Ubuntu 22.04 LTS:   3.10.4
> NetBSD 9.3:         3.9.13*
> FreeBSD 12.4:       3.9.16
> FreeBSD 13.1:       3.9.16
> OpenBSD 7.2:        3.9.16
>
> Note: Our VM tests install 3.7 specifically for freebsd and netbsd; the
> default for "python" or "python3" in FreeBSD is 3.9.16. NetBSD does not
> appear to have a default meta-package, but offers several options, the
> lowest of which is 3.7.15. "python39" appears to be a pre-requisite to
> one of the other packages we request in tests/vm/netbsd.
>
> Since it is safe to under our supported platform policy, bump our
> minimum supported version of Python to 3.7.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>


