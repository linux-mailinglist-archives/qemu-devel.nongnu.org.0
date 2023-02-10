Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA11691C3F
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 11:06:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQQGj-0005uM-Jh; Fri, 10 Feb 2023 05:04:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQQGg-0005u0-VO
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 05:04:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQQGf-0008Ag-Bi
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 05:04:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676023470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iaEzEEluAqVCVENX0eNE8jnrsHm2s2Ti0s9AoTyIkHw=;
 b=OGcYbYffFd7Toc+y8PisuGXcHdB9tMIAtB5pi8OjSsL5uHPoivRG9EgktgvaDhzwPTDMN7
 tQdKKsY3UkBfzszT0txzax7nnOeI5aHsKmAmTaxZX8tQS0Z+etoR3fm2LZeXmygudGzYZS
 KVh36C7NjpGlcTnu9k8Wfj+1eFZ4Zss=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-599-Akan1RTkMna0nRkCKiiqKg-1; Fri, 10 Feb 2023 05:04:27 -0500
X-MC-Unique: Akan1RTkMna0nRkCKiiqKg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2BE823810B15;
 Fri, 10 Feb 2023 10:04:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 00A0E1121315;
 Fri, 10 Feb 2023 10:04:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CC94C21E6A1F; Fri, 10 Feb 2023 11:04:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  Thomas Huth <thuth@redhat.com>,  Daniel Berrange
 <berrange@redhat.com>,  Beraldo Leal <bleal@redhat.com>,  Michael Roth
 <michael.roth@amd.com>,  Wainer dos Santos Moschetta
 <wainersm@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org,  Hanna Reitz <hreitz@redhat.com>,  Alex
 =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 0/7] Python: Drop support for Python 3.6
References: <20230210003147.1309376-1-jsnow@redhat.com>
Date: Fri, 10 Feb 2023 11:04:25 +0100
In-Reply-To: <20230210003147.1309376-1-jsnow@redhat.com> (John Snow's message
 of "Thu, 9 Feb 2023 19:31:40 -0500")
Message-ID: <87o7q1vnti.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

First, a plea.  Supporting 3.6 has made a few of us prisoners dragging
ball and chain.  So, please, *please* let us cut of these leg irons!

The series does not include follow-up cleanups.  Fine with me.


