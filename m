Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 268032C331A
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 22:34:22 +0100 (CET)
Received: from localhost ([::1]:33442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khfx6-0004yL-PL
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 16:34:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khfv3-0004Lh-8d
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 16:32:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khfv0-0005zd-My
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 16:32:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606253530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3fE1yE0XJeGopa1Aulyxh4nlNSyjO+1VGfZOJFaLydk=;
 b=huBVxiHL9v4Q0T1R8NmyalsFQM0iwhYplqzOvMAfQ9Uv1AqutgNLyjvPtpOTeG67tz3/6F
 2gNI1UE3CCwkBK9oTlraX+OHTpIL+s59LwFAAL20301AcKKo7hglvc8CiSe+AaT81U+9u/
 oNQUl7VFCp6rN2e/wfJXqi/M7Y8SiXo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-n5eXaBLyNGOv6gORIHR9zg-1; Tue, 24 Nov 2020 16:32:06 -0500
X-MC-Unique: n5eXaBLyNGOv6gORIHR9zg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91E0C1074646;
 Tue, 24 Nov 2020 21:32:03 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBC4F1001281;
 Tue, 24 Nov 2020 21:31:59 +0000 (UTC)
Date: Tue, 24 Nov 2020 16:31:59 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC v5 11/12] i386: centralize initialization of cpu accel
 interfaces
Message-ID: <20201124213159.GA2271382@habkost.net>
References: <20201124162210.8796-1-cfontana@suse.de>
 <20201124162210.8796-12-cfontana@suse.de>
 <7dc27df6-1c81-f8fb-3e56-aa6ffe9e8475@redhat.com>
MIME-Version: 1.0
In-Reply-To: <7dc27df6-1c81-f8fb-3e56-aa6ffe9e8475@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Claudio Fontana <cfontana@suse.de>,
 Anthony Perard <anthony.perard@citrix.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 24, 2020 at 09:13:13PM +0100, Paolo Bonzini wrote:
> On 24/11/20 17:22, Claudio Fontana wrote:
> > +static void x86_cpu_accel_init(void)
> >  {
> > -    X86CPUAccelClass *acc;
> > +    const char *ac_name;
> > +    ObjectClass *ac;
> > +    char *xac_name;
> > +    ObjectClass *xac;
> > -    acc = X86_CPU_ACCEL_CLASS(object_class_by_name(accel_name));
> > -    g_assert(acc != NULL);
> > +    ac = object_get_class(OBJECT(current_accel()));
> > +    g_assert(ac != NULL);
> > +    ac_name = object_class_get_name(ac);
> > +    g_assert(ac_name != NULL);
> > -    object_class_foreach(x86_cpu_accel_init_aux, TYPE_X86_CPU, false, &acc);
> > +    xac_name = g_strdup_printf("%s-%s", ac_name, TYPE_X86_CPU);
> > +    xac = object_class_by_name(xac_name);
> > +    g_free(xac_name);
> > +
> > +    if (xac) {
> > +        object_class_foreach(x86_cpu_accel_init_aux, TYPE_X86_CPU, false, xac);
> > +    }
> >  }
> > +
> > +accel_cpu_init(x86_cpu_accel_init);
> 
> If this and cpus_accel_ops_init are the only call to accel_cpu_init, I'd
> rather make them functions in CPUClass (which you find and call via
> CPU_RESOLVING_TYPE) and AccelClass respectively.

Making x86_cpu_accel_init() be a CPUClass method sounds like a
good idea.  This way we won't need a arch_cpu_accel_init() stub
for non-x86.

accel.c can't use cpu.h, correct?  We can add a:

  CPUClass *arch_base_cpu_type(void)
  {
      return object_class_by_name(CPU_RESOLVING_TYPE);
  }

function to arch_init.c, to allow target-independent code call
target-specific code.

-- 
Eduardo


