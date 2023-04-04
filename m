Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C446D689D
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 18:19:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjjMY-0008Gk-Sf; Tue, 04 Apr 2023 12:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pjjMV-0008GI-0K
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 12:18:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pjjMG-0005UW-HK
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 12:18:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680625072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UUSQMcQIYTf4jYu2LjzKQYlpgCYHgqOhc6m+tkbLF+U=;
 b=aIxruBZnFhJCz22WFRoh5HHINIziQXYeBje47zBSMl77SJhBqqiVHufE2JKGOYHYwATRGb
 eU64TZAwSYZMxiGNLyCJo+dB23WaxrT/IGG2lVjhQ5WZQI2YktAo938NhnuhXHCmgrye96
 vCgEL4h4XjiS/MG330k5L75HuU6lSGM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-w2hZb7I4OjaFHbPeDMsBTw-1; Tue, 04 Apr 2023 12:17:49 -0400
X-MC-Unique: w2hZb7I4OjaFHbPeDMsBTw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF8F229AA3BD;
 Tue,  4 Apr 2023 16:17:48 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 863741415117;
 Tue,  4 Apr 2023 16:17:46 +0000 (UTC)
Date: Tue, 4 Apr 2023 18:17:45 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Beraldo Leal <bleal@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, kvm@vger.kernel.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 armbru@redhat.com
Subject: Re: [PATCH v2 05/11] qemu-options: finesse the recommendations
 around -blockdev
Message-ID: <ZCxNqb9tEO24KaxX@redhat.com>
References: <20230403134920.2132362-1-alex.bennee@linaro.org>
 <20230403134920.2132362-6-alex.bennee@linaro.org>
 <ZCwsvaxRzx4bzbXo@redhat.com>
 <cbb3df0a-7714-cbc0-efda-45f1d608e988@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cbb3df0a-7714-cbc0-efda-45f1d608e988@msgid.tls.msk.ru>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

Am 04.04.2023 um 17:07 hat Michael Tokarev geschrieben:
> 04.04.2023 16:57, Kevin Wolf пишет:
> > Let's not make the use of -drive look more advisable than it really is.
> > If you're writing a management tool/script and you're still using -drive
> > today, you're doing it wrong.
> 
> Kevin, maybe I'm wrong here, but what to do with the situation which
> started it all, -- with -snapshot?
> 
> If anything, I think there should be a bold note that -snapshot is
> broken by -blockdev.  Users are learning that the *hard* way, after
> losing their data..

Ah, I missed this context.

Maybe -snapshot should error out if -blockdev is in use. You'd generally
expect that either -blockdev is used primarily and snapshots are done
externally (if the command line is generated by some management tool),
or that -drive is used consistently (by a human who likes the
convenience). In both cases, we wouldn't hit the error path.

There may be some exceptional cases where you have both -drive and
-blockdev (maybe because a human users needs more control for one
specific disk). This is the case where you can get a nasty surprise and
that would error out. If you legitimately want the -drive images
snapshotted, but not the -blockdev ones, you can still use individual
'-drive snapshot=on' options instead of the global '-snapshot' (and the
error message should mention this).

Would you see any problems with such an approach?

Kevin


