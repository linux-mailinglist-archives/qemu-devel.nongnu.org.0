Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1128F5E6285
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 14:35:00 +0200 (CEST)
Received: from localhost ([::1]:56936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obLPo-0002nt-Sl
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 08:34:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1obLCY-0001VE-Ez
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 08:21:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1obLCS-0000lY-Ve
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 08:21:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663849263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e7qSItG4GJ0pjWkOrqf7j7YUBeEY/5XkBwaXQ44W3Ko=;
 b=DfBzdb4WU8HG7ERdcwfJZgUR6spe2S/UflyX+h/+fbk6k8ealhhYQ6uBfhUac9/mjsgw0i
 QuM0TqU44w4KX8JG8qkkr+CFKOD7ELXmWgKijr0cmRrrlPZ6HKD5jhlw/MdFlvfSbjiZRu
 I81r9vJCppKYheI9eapvxBkc0Uqc0sU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-MbS4KflOOsWJYHqC3yy1BQ-1; Thu, 22 Sep 2022 08:21:00 -0400
X-MC-Unique: MbS4KflOOsWJYHqC3yy1BQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7D293C10237;
 Thu, 22 Sep 2022 12:20:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7186253AA;
 Thu, 22 Sep 2022 12:20:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 353711800084; Thu, 22 Sep 2022 14:20:58 +0200 (CEST)
Date: Thu, 22 Sep 2022 14:20:58 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Sergio Lopez <slp@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 kvm@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v4] x86: add etc/phys-bits fw_cfg file
Message-ID: <20220922122058.vesh352623uaon6e@sirius.home.kraxel.org>
References: <20220922101454.1069462-1-kraxel@redhat.com>
 <YyxF2TNwnXaefT6u@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YyxF2TNwnXaefT6u@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 22, 2022 at 12:24:09PM +0100, Daniel P. Berrangé wrote:
> On Thu, Sep 22, 2022 at 12:14:54PM +0200, Gerd Hoffmann wrote:
> > In case phys bits are functional and can be used by the guest (aka
> > host-phys-bits=on) add a fw_cfg file carrying the value.  This can
> > be used by the guest firmware for address space configuration.
> > 
> > The value in the etc/phys-bits fw_cfg file should be identical to
> > the phys bits value published via cpuid leaf 0x80000008.
> > 
> > This is only enabled for 7.2+ machine types for live migration
> > compatibility reasons.
> 
> Is this going to have any implications for what mgmt apps must
> take into account when selecting valid migration target hosts ?
> 
> Historically, apps have tended to ignore any checks for phys
> bits between src/dst migration hosts and hoped for the best.
> 
> Will this new behaviour introduce / change any failure scenarios
> where the target host has fewer phys bits than the src host, that
> mgmt apps need to be made aware of ?

No.  This will basically inform the guest that host-phys-bits has been
enabled (and pass the number of bits).  So the firmware can make use of
the available address space instead of trying to be as conservative as
possible to avoid going beyond the (unknown) limit.

The phys-bits config itself is not touched.

take care,
  Gerd


