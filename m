Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09118307B08
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 17:35:54 +0100 (CET)
Received: from localhost ([::1]:37924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5AGv-0008I8-0C
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 11:35:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l5AFe-0007Rj-AO
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:34:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l5AFc-0000F9-68
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:34:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611851671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JlDzhCYVkDQa818Dfxbo1r9MQtBDSzuFQVvtuQrt7b4=;
 b=RBqDiAqdXXHSWPHp3c5fQgr9s02Q5QvK7eDCXDR+0q9+G1ZvEcNfAYiWvfXugN/5MQ1gKk
 myoUgygELeDF9HCxm4Xh2BkCuxf6sOTG9chPzWhveUHaFj+AgE2Jk7KW93mxvkKizcBDLf
 eHQj5Q1m0Ier83BEJxT6dXXPsLDctrU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-m2LBp5eGOVOk8c39tL8Z1g-1; Thu, 28 Jan 2021 11:34:29 -0500
X-MC-Unique: m2LBp5eGOVOk8c39tL8Z1g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F7AD1052BB6;
 Thu, 28 Jan 2021 16:34:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-27.ams2.redhat.com
 [10.36.113.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 112F510016F5;
 Thu, 28 Jan 2021 16:34:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 17F4F18000B1; Thu, 28 Jan 2021 17:34:26 +0100 (CET)
Date: Thu, 28 Jan 2021 17:34:26 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH] spice: delay starting until display are initialized
Message-ID: <20210128163426.lsd2y3w7htovfnfx@sirius.home.kraxel.org>
References: <20210128111319.329755-1-marcandre.lureau@redhat.com>
 <20210128114352.tvwnx435qbqcv4a4@sirius.home.kraxel.org>
 <CAMxuvazAToFV_uD3Q7whGymoY07eiq-hErToDPB41F2T9ZY7hg@mail.gmail.com>
 <CAMxuvazChfKDHyjP2o1ipfgquawMab9zc4p8J5wnNnmVMmJ1yw@mail.gmail.com>
 <20210128142625.vzdrehzw6mufja3s@sirius.home.kraxel.org>
 <CAJ+F1CJ0Z378KCLGDzLYOfBor7HkHM2YemRj5F-3kTSnVK7ADg@mail.gmail.com>
 <20210128144202.2pqjjn3epspfvlgk@sirius.home.kraxel.org>
 <CAJ+F1C+1LdY2gJp0trTx_pR7iLeJG9j7O+FjqF6pgnDZGUa=YA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1C+1LdY2gJp0trTx_pR7iLeJG9j7O+FjqF6pgnDZGUa=YA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Bonzini, Paolo" <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > So move the vmstate handler registration call too?
> > I'd prefer to not add more state variables if we can avoid it ...
> 
> Does that seem right to you?

> @@ -626,7 +625,7 @@ static int add_channel(void *opaque, const char
> *name, const char *value,
>  static void vm_change_state_handler(void *opaque, int running,
>                                      RunState state)
>  {
> -    if (running && spice_display_init_done) {
> +    if (running) {
>          qemu_spice_display_start();
>      } else if (state != RUN_STATE_PAUSED) {
>          qemu_spice_display_stop();
> @@ -635,7 +634,7 @@ static void vm_change_state_handler(void *opaque,
> int running,
> 
>  void qemu_spice_display_init_done(void)
>  {
> -    spice_display_init_done = true;
> +    qemu_add_vm_change_state_handler(vm_change_state_handler, NULL);
>      vm_change_state_handler(NULL, runstate_is_running(), runstate_get());

I'd just call qemu_spice_display_start() directly here, the need for
runstate_get() goes away then.  Otherwise looks good to me.

take care,
  Gerd


