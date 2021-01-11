Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E33752F22E1
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 23:36:51 +0100 (CET)
Received: from localhost ([::1]:48844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz5nu-0000Xd-Ih
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 17:36:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kz5mq-000058-2k
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 17:35:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kz5mn-0000hl-6V
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 17:35:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610404538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HqPxIPXsQenwU+vCDjXl8eb5ElD2cGps4OdbzWe64bw=;
 b=U5jUPUsI/UWuJfzTax7NtHqgmkVU3AK3etdcubpndvHUcF4kbYmHAd/GemLDAf/6jhbuux
 suL6yq9wUC6jCddPPBraAALe2Bcm69dUmHEbZWUJu2dTQ+V7Vin1RZm+rcbLAR41P30b/v
 cBOfvH/IF4MZH5Ke5tMkBUm3WusHxQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-kpapKDSlNti20ROwo1ZjfQ-1; Mon, 11 Jan 2021 17:35:36 -0500
X-MC-Unique: kpapKDSlNti20ROwo1ZjfQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E553A51F0;
 Mon, 11 Jan 2021 22:35:33 +0000 (UTC)
Received: from localhost (ovpn-119-212.rdu2.redhat.com [10.10.119.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E42B360C5B;
 Mon, 11 Jan 2021 22:35:29 +0000 (UTC)
Date: Mon, 11 Jan 2021 17:35:29 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v6 10/11] accel: introduce AccelCPUClass extending CPUClass
Message-ID: <20210111223529.GA4161@habkost.net>
References: <20201126223218.31480-1-cfontana@suse.de>
 <20201126223218.31480-11-cfontana@suse.de>
 <6cbd508c-b24b-3219-3302-196dfefaa8f7@redhat.com>
 <ff157643-5245-85ba-123e-32800f212f4b@suse.de>
 <51838c6c-8a44-afef-1acf-b8acb3eada19@redhat.com>
 <050bc10b-861c-f463-18e1-c4d1aa0c301e@suse.de>
 <4bca1b60-ceeb-4b99-dd92-77dac07e9064@suse.de>
 <343846ce-12ba-23d6-4832-4aa16cb22f9d@suse.de>
 <2f50e4f3-dd13-bbd4-1963-daf695bbe428@suse.de>
 <28d06da1-296d-3b2b-bb58-e41faed6fd16@suse.de>
MIME-Version: 1.0
In-Reply-To: <28d06da1-296d-3b2b-bb58-e41faed6fd16@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Mon, Jan 11, 2021 at 05:13:27PM +0100, Claudio Fontana wrote:
> Happy new year,

Hi!

> 
> picking up this topic again, i am looking at at now a different aspect of this problem, of setting the right tcg ops for the right cpu class.
> 
> This issue I am highlighting is present because different targets behave differently in this regard.
> 
> Ie, we have targets for which we always initialize all cpu classes, as a result of different machine definitions.
> 
> This is the case of arm, for example where we end up with backtraces like:
> 
> arm_v7m_class_init
> type_initialize
> object_class_foreach_tramp
> g_hash_table_foreach ()
> object_class_foreach
> object_class_get_list
> select_machine ()
> qemu_init
> main
> 
> with the arm_v7m_class_init called even if we are just going to use an aarch64 cpu (so the class initializer for arm_v7m is called even for unused cpus classes),
> 
> while in other cases we have the target explicitly relying on the fact that only the right cpu class is initialized, for example in cris we have code like:

This shouldn't matter at all, because class_init is not supposed
to have any side effects outside the corresponding ObjectClass
struct.

So, I don't understand what you mean below:

> 
> target/cris/cpu.c:
> 
> static void crisv9_cpu_class_init(ObjectClass *oc, void *data)
> {
>     CPUClass *cc = CPU_CLASS(oc);
>     CRISCPUClass *ccc = CRIS_CPU_CLASS(oc);
> 
>     ccc->vr = 9;
>     cc->do_interrupt = crisv10_cpu_do_interrupt;
>     cc->gdb_read_register = crisv10_cpu_gdb_read_register;
>     cc->tcg_initialize = cris_initialize_crisv10_tcg;
> }
> 
> where the class initialization of the cpu is explicitly setting the methods of CPUClass, therefore implicitly relying on the fact that no other class initializer screws things up.

I don't see the problem here.  Having all other class
initializers being called should be completely OK, because each
class has its own ObjectClass struct.


> 
> Given this context, which one of these methods is "right"?
> Should we rework things so that only used cpu classes are actually initialized?

This option wouldn't make sense.  class_init is supposed to be
called on demand on class lookup, and can be triggered by
object_class_get_list(), object_class_by_name(), or similar
functions.  This is by design.


> Or should we maybe not do these settings in cpu class_init at all, but rather at cpu initfn time, or at cpu realize time?

If you are talking about initializing
ObjectClass/CPUClass/...Class fields, they can always be safely
initialized in class_init.

If you are talking about touching anything outside the class
struct (like in CPUState), class_init is not the right place to
do it.

-- 
Eduardo


