Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D63629F395
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Oct 2020 18:46:09 +0100 (CET)
Received: from localhost ([::1]:49908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYC00-0000C5-4g
	for lists+qemu-devel@lfdr.de; Thu, 29 Oct 2020 13:46:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kYBvc-0005YO-SS
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 13:41:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kYBva-0006cl-FK
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 13:41:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603993292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NFoxW9FEp1PMI0/ZHaScrJsOS+WkAmfpHnkiGkjxXyI=;
 b=FNNzedcz1QfOL8j4dexD5WUEQTkeaIqVZ/7lm37QCKzPksbwoVWxHT5A1yQDt4IGZ6w7on
 /YsAWRpkc452JOekd+LhFOZergw79rYxwEwV5kbbIrv/WgQionI9A/LnQ6wwp+RE+ED8kz
 KBRx8xmyEEqKjGDe/n9zJGyxuMTVrIE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-i89KmzDzN02FvqTonV-_MA-1; Thu, 29 Oct 2020 13:41:29 -0400
X-MC-Unique: i89KmzDzN02FvqTonV-_MA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 583671018F7C;
 Thu, 29 Oct 2020 17:41:28 +0000 (UTC)
Received: from work-vm (ovpn-114-233.ams2.redhat.com [10.36.114.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 632795C22D;
 Thu, 29 Oct 2020 17:41:27 +0000 (UTC)
Date: Thu, 29 Oct 2020 17:41:24 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: recent flakiness (intermittent hangs) of migration-test
Message-ID: <20201029174124.GD3335@work-vm>
References: <CAFEAcA-EsEZWDbUSy6_AXym5e-wP_B4buZYG0swF946ue41WKg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-EsEZWDbUSy6_AXym5e-wP_B4buZYG0swF946ue41WKg@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 00:47:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> Recently I've seen the 'make check' migration-test developing an
> intermittent hang; I've seen this now on aarch32 host several times
> and also on s390x host. The symptom is that the test just hangs
> with a couple of child qemu processes sitting around doing nothing.
> ^Cing out of 'make check' doesn't kill the qemu processes; they
> seem to need a 'kill -9'.

If you can send us a copy of the ps -eaf of the qemu commandlines
in the failing case it would be interesting to see.

> Sorry for the low-information-density bug report, but I don't really
> have time at the moment to debug failures in merge build test runs
> because the queue of stuff still to merge is enormous...

If you get a moment to breath then a backtrace of the migration-test
process itself would be useful to see where it's hanging.

Dave

> thanks
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


