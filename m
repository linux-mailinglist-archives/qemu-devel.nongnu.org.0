Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD772BB154
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 18:23:07 +0100 (CET)
Received: from localhost ([::1]:59974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgA7m-0002Ff-62
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 12:23:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kgA64-0000xC-TQ
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 12:21:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kgA63-0000e8-9X
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 12:21:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605892878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Kq7a+Sx9c6DqclhKIEs4OhKSk2VLOCtOFaZQ/VOAxFU=;
 b=QkS2NJGqf7Umo6PDQWi3eh/y1i91RLceyfo0uuM2Oi1MOu+SdTqQTAaxGZEzCRCJO8NEnI
 RPGbYIRYIGsdxqk+O1KCMm++TCd3GiUAWD2HT61DyhM8cz8ADF4rjrQDb0v+1EbsVMFVIa
 1cgnrGGGMTEzZweDgdK+T/pTvYTGaJY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-Fa8yDCSGO6e0MkIK9xU6Og-1; Fri, 20 Nov 2020 12:21:15 -0500
X-MC-Unique: Fa8yDCSGO6e0MkIK9xU6Og-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BB561084423;
 Fri, 20 Nov 2020 17:21:12 +0000 (UTC)
Received: from localhost (ovpn-115-101.rdu2.redhat.com [10.10.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA4A613470;
 Fri, 20 Nov 2020 17:21:08 +0000 (UTC)
Date: Fri, 20 Nov 2020 12:21:07 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v4 9/9] i386: split cpu accelerators from cpu.c
Message-ID: <20201120172107.GB2271382@habkost.net>
References: <20201120144909.24097-1-cfontana@suse.de>
 <20201120144909.24097-10-cfontana@suse.de>
 <049561d0-0643-2e28-0f41-72d87a7925bc@suse.de>
MIME-Version: 1.0
In-Reply-To: <049561d0-0643-2e28-0f41-72d87a7925bc@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Olaf Hering <ohering@suse.de>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Wenchao Wang <wenchao.wang@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Bruce Rogers <brogers@suse.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 20, 2020 at 04:34:47PM +0100, Claudio Fontana wrote:
> On 11/20/20 3:49 PM, Claudio Fontana wrote:
> > split cpu.c into:
> > 
> > cpu.c            cpuid and common x86 cpu functionality
> > host-cpu.c       host x86 cpu functions and "host" cpu type
> > kvm/cpu.c        KVM x86 cpu type
> > hvf/cpu.c        HVF x86 cpu type
> > tcg/cpu.c        TCG x86 cpu type
> > 
> > The link to the accel class is set in the X86CPUClass classes
> > at MODULE_INIT_ACCEL_CPU time, when the accelerator is known.
> > 
> > Signed-off-by: Claudio Fontana <cfontana@suse.de>
> > ---
[...]
> > +#define TYPE_X86_CPU_ACCEL TYPE_X86_CPU "-accel"
> > +#define X86_CPU_ACCEL_TYPE_NAME(name) (name "-" TYPE_X86_CPU_ACCEL)
> > +
> > +OBJECT_DECLARE_TYPE(X86CPUAccel, X86CPUAccelClass,
> > +                    X86_CPU_ACCEL)
> 
> 
> Instead of OBJECT_DECLARE_TYPE, since this is never instantiated, this should probably be:
> 
> +typedef struct X86CPUAccelClass X86CPUAccelClass;
> +DECLARE_CLASS_CHECKERS(X86CPUAccelClass, X86_CPU_ACCEL, TYPE_X86_CPU_ACCEL)

Yes, and this way we get rid of the only difference between
OBJECT_DECLARE_TYPE and OBJECT_DECLARE_INTERFACE: the instance
type cast macro is a bit different (it uses INTERFACE_CHECK).

-- 
Eduardo


