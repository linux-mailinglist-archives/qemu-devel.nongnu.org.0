Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B8B2AE0FE
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 21:48:43 +0100 (CET)
Received: from localhost ([::1]:45610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcaZG-0002yJ-A3
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 15:48:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcaW6-0001KX-Ql
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 15:45:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcaW4-0001WN-Po
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 15:45:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605041123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TjnaMYix/usFJTFiELwlsyeDoBWEqlB2cBfA/xmwJJI=;
 b=Uu3nN2xwZ0IKoVS99ECPH1nT1WVPZ2U0/lMa0Bjulmy4D6HmPPF10bDXTkClT9Lfil7GQA
 W4LdwapX0kAX1UdqQefwJNZ0bDKQfUqgrKozOAGuXndbpPM8VeYq0bObjIPY9DWUcdQ1UB
 LGvKfqKFyGWtf7vF/6yz5+DqExtwuqg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-wTOtia0CNDmfuNSqZ1eq2w-1; Tue, 10 Nov 2020 15:45:22 -0500
X-MC-Unique: wTOtia0CNDmfuNSqZ1eq2w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24F8B188C12F;
 Tue, 10 Nov 2020 20:45:20 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9469410013DB;
 Tue, 10 Nov 2020 20:45:16 +0000 (UTC)
Date: Tue, 10 Nov 2020 15:45:15 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC v1 09/10] i386: split cpu.c and defer x86 models registration
Message-ID: <20201110204515.GM5733@habkost.net>
References: <20201109172755.16500-1-cfontana@suse.de>
 <20201109172755.16500-10-cfontana@suse.de>
 <20201109180302.GB814975@redhat.com>
 <971cfde9-d24e-a3dc-6389-8a7c9e477f63@suse.de>
 <20201110100438.GF866671@redhat.com>
 <c4c56c06-7530-5705-9ce8-5eff8cf1a0d3@redhat.com>
 <20201110152314.GF5733@habkost.net>
 <8bc35f55-159f-5037-3355-12bf4fd48e74@redhat.com>
 <20201110175520.GI5733@habkost.net>
 <ce84dd58-a924-f022-905a-5b392e26fa46@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ce84dd58-a924-f022-905a-5b392e26fa46@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
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
Cc: Laurent Vivier <lvivier@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Claudio Fontana <cfontana@suse.de>,
 Anthony Perard <anthony.perard@citrix.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Bruce Rogers <brogers@suse.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 10, 2020 at 09:39:37PM +0100, Paolo Bonzini wrote:
> On 10/11/20 18:55, Eduardo Habkost wrote:
> > > I think we should not try yo implement interfaces conditionally (i.e. have
> > > TYPE_X86_ACCEL implemented only on qemu-system-{i386,x86_64} and not
> > > qemu-system-arm), even if technically the accel/ objects are per-target
> > > (specific_ss) rather than common.
> > If the accel objects are already per target, it seems appropriate
> > to have a QOM type hierarchy that reflects that.
> > 
> > `qemu-system-x86_64 -accel kvm` would create a kvm-x86_64-accel
> > object, but `qemu-system-arm -accel kvm` would create a
> > kvm-arm-accel.
> 
> ... and fall back to kvm-accel?  So accel_find would be the only place to
> change.

Sounds good.  This way we don't need to convert all accelerators
or all targets at the same time.

-- 
Eduardo


