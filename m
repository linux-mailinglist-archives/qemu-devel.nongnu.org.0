Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3E0338876
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:20:57 +0100 (CET)
Received: from localhost ([::1]:49702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKdya-0004wk-EI
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:20:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lKdvT-0002N9-Bd
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:17:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lKdvP-0000yX-0q
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:17:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615540656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NvNBQoOBAmLEoNd8/XBJk8ofsVdHGTG4ods4Be9fzbQ=;
 b=K5ok4rUSdd4uvfYqw0RCa796uRbTIBanErcL2PnIXEiNNBPCBEjg2jkgGQMfASX87AW/3I
 Bu8e32S4SCc2Q5KBd/boTZslBQ3dytlvmxkA/ijhGUzrTN5C3Ern0eSJoHIGFCFAWoIElQ
 TpaJayrjWZ10CPwUnVPpguytmITVD9A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-WPNTuxpfORudPJNccOYoyg-1; Fri, 12 Mar 2021 04:17:34 -0500
X-MC-Unique: WPNTuxpfORudPJNccOYoyg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E053107ACCA;
 Fri, 12 Mar 2021 09:17:32 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CF80694CC;
 Fri, 12 Mar 2021 09:17:22 +0000 (UTC)
Date: Fri, 12 Mar 2021 10:17:19 +0100
From: Andrew Jones <drjones@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/6] accel: Introduce 'query-accels' QMP command
Message-ID: <20210312091719.6sfr673oppm7hpdr@kamzik.brq.redhat.com>
References: <20210311231202.1536040-1-philmd@redhat.com>
 <20210311231202.1536040-2-philmd@redhat.com>
 <CAJ+F1CLu=A4CaL+KbsSuOr9A36DX_9PpkVNg7PH7-4hCzpfoFg@mail.gmail.com>
 <651baead-dcc3-c0ef-f5dd-cda36c8d6599@redhat.com>
 <20210312084816.pnenjcbdjzwu3z54@kamzik.brq.redhat.com>
 <c36e5524-7eaf-16a7-5362-f992fe3a8383@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c36e5524-7eaf-16a7-5362-f992fe3a8383@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 QEMU <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 "open list:ARM" <qemu-arm@nongnu.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 12, 2021 at 10:01:43AM +0100, Paolo Bonzini wrote:
> On 12/03/21 09:48, Andrew Jones wrote:
> > > I think we definitely need the additional data section here: For KVM on
> > > POWER, it would be good to know whether it's KVM-HV or KVM-PR, for KVM on
> > > MIPS it would be good to know whether it's KVM_VM_MIPS_VZ or KVM_VM_MIPS_TE,
> > > for KVM on x86 whether it's the AMD flavor or Intel, ...
> > 
> > Could also pre-expand all of these and list them individually.
> 
> That seems worse (in general) because in a lot of cases you don't care; the
> basic query-accels output should match the argument to "-accel".
>

For these special subtypes, what's the property/state that indicates it
when just using '-accel kvm' on the command line? Because if this qmp
list matches the '-accel' parameter list, then qtest and other qmp clients
may need to query that other information too, in order for this accel
query to be useful. And, do we need an accel-specific qmp query for it?
Or, is that information already available?

Thanks,
drew


