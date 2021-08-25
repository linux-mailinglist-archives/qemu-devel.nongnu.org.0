Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 832AE3F7D98
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 23:19:04 +0200 (CEST)
Received: from localhost ([::1]:45744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJ0IZ-0000wg-23
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 17:19:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mJ0Hm-00007Q-Lc
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 17:18:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mJ0Hk-0005z2-5d
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 17:18:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629926291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B1jY29D6dpiLLHQNutxXjRvVxreHgsWJmw5TQtcBaDw=;
 b=Hq9vPjNPK0CbMMv92l4K73x1tm/wy5deepZFW74/np/DYdrwI6Tb6mmVa6FE0bKyGi/Lbi
 PxWpG10lu+8uCJaDvah5s4duAdDtdASoOXvSornuLNyNVoKgkzFkfEhbbClp3jRCIdrXfF
 168FGaOHKl7xfEymVhB88O7RQ4+M1xc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-vn5YaxClN5m3b5UwhKyS7A-1; Wed, 25 Aug 2021 17:18:08 -0400
X-MC-Unique: vn5YaxClN5m3b5UwhKyS7A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04ED5189610B;
 Wed, 25 Aug 2021 21:18:07 +0000 (UTC)
Received: from localhost (unknown [10.22.32.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7EE372C00F;
 Wed, 25 Aug 2021 21:18:06 +0000 (UTC)
Date: Wed, 25 Aug 2021 17:18:05 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
Subject: Re: [PATCH 02/19] host-utils: move abs64() to host-utils
Message-ID: <20210825211805.cn6iodnnibn2vd6i@habkost.net>
References: <20210824142730.102421-1-luis.pires@eldorado.org.br>
 <20210824142730.102421-3-luis.pires@eldorado.org.br>
 <YSW8TigYwJVIrd5w@yekko>
 <CP2PR80MB36683DC7E9BEEA136FD0DD5EDAC69@CP2PR80MB3668.lamprd80.prod.outlook.com>
 <20210825202638.2vtjxcsau2cghbr3@habkost.net>
 <CP2PR80MB3668D3C0F23858EE7D4610F5DAC69@CP2PR80MB3668.lamprd80.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <CP2PR80MB3668D3C0F23858EE7D4610F5DAC69@CP2PR80MB3668.lamprd80.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "groug@kaod.org" <groug@kaod.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 25, 2021 at 08:37:17PM +0000, Luis Fernando Fujita Pires wrote:
> From: Eduardo Habkost <ehabkost@redhat.com>
> 
> > > Right, that's true of any standard implementation of abs().
> > > I thought about making it return uint64_t, but that could make it
> > > weird for other uses of abs64(), where callers wouldn't expect a type
> > > change from int64_t to uint64_t. Maybe create a separate uabs64() that
> > > returns uint64_t? Or is that even weirder? :)
> > 
> > Which users of abs64 would expect it to return int64_t?
> > kvm_pit_update_clock_offset() doesn't seem to.
> 
> Oh, I wasn't referring to any specific users. What I meant is
> that, if we make abs64() generically available from host-utils,
> callers could expect it to behave the same way as abs() in
> stdlib, for example.

That would be surprising, but do you think there are cases where
that would be a bad surprise?

I don't think anybody who is aware of the abs(INT_MIN),
labs(LONG_MIN), and llabs(LLONG_MIN) edge cases actually _like_
that behaviour.

If you really want to avoid surprises, providing a saner function
with a different name seems better than trying to emulate the
edge cases of abs()/labs()/llabs().

-- 
Eduardo


