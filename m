Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1476C2D44FD
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 16:02:40 +0100 (CET)
Received: from localhost ([::1]:35830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn0zG-00064A-Nq
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 10:02:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kn0xf-0005Rl-G6
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 10:01:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kn0xb-0007g6-W3
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 10:00:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607526054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+8iahfdBvcX5pfBQWYRsLI74xM1GF7SBuafdn6IRwxg=;
 b=GDfiQtZ3EEr5fsu1qGgD5TonK37E3eewm1Z13oqHat5eqDMUgYh2PPe1NpUcnCYg1rg61H
 oOZrUAGUfsFF4p441BCK2vgMZunXxTDR1viTJ4qeGs4i65BHVqKpcWIU+xKbHkRExBccpo
 VPJCyh9bHtnb2thtdCKT87DGEcD4Zy0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-BWn68gOAPF-kYQisV8SQFw-1; Wed, 09 Dec 2020 10:00:50 -0500
X-MC-Unique: BWn68gOAPF-kYQisV8SQFw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3A948D87A1;
 Wed,  9 Dec 2020 14:59:58 +0000 (UTC)
Received: from localhost (ovpn-120-147.rdu2.redhat.com [10.10.120.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 42F3F10023BD;
 Wed,  9 Dec 2020 14:59:32 +0000 (UTC)
Date: Wed, 9 Dec 2020 09:59:31 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v9 24/32] cpu: move cc->transaction_failed to tcg_ops
Message-ID: <20201209145931.GP1289986@habkost.net>
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-25-cfontana@suse.de>
 <18ac9b63-4e35-cfc2-24f6-b61ee5d201b4@redhat.com>
 <6f3f261a-8b79-e9d7-80a7-facc4731064e@suse.de>
MIME-Version: 1.0
In-Reply-To: <6f3f261a-8b79-e9d7-80a7-facc4731064e@suse.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Anthony Perard <anthony.perard@citrix.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 09, 2020 at 03:43:54PM +0100, Claudio Fontana wrote:
> On 12/9/20 10:31 AM, Philippe Mathieu-Daudé wrote:
> > On 12/8/20 8:48 PM, Claudio Fontana wrote:
> >> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> >> ---
> > ...
> >> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
> >> index 6b9b72e785..0cc0927738 100644
> >> --- a/include/hw/core/tcg-cpu-ops.h
> >> +++ b/include/hw/core/tcg-cpu-ops.h
> > 
> > Missing (for MemTxAttrs/MemTxResult):
> > 
> >   #include "exec/memattrs.h"
> 
> 
> right, this is included only from cpu.h though, which already does it, should we still repeat the include here?

It doesn't hurt, and may save some headache in the future.  A .c
file should be able to include tcg-cpu-ops.h directly if
necessary.

-- 
Eduardo


