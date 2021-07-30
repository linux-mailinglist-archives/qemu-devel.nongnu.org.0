Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B96713DB5A6
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 11:06:57 +0200 (CEST)
Received: from localhost ([::1]:41168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9OTo-0004lR-EV
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 05:06:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m9OSi-0003yB-4A
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 05:05:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m9OSe-0007Fh-5Z
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 05:05:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627635942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bQJ2XBwq+s2efBrBXl33Djj9u0KIgU4VpgYi8deYwI4=;
 b=JNDn42vp6ZngrlQksR+L9ocHxSFawfXEJDt/AT4mJ/M1DhaShxWVraT3V8NIYT2AlXpAnT
 md+j6lMifbbbnVoRrq8LbMH/jwSMfcc6AKCbJbN+wcyabNHw7ji/DoLYaott/K/xI5J3wY
 R9TpiJ2D8wtEe5Z1PDW8ZFNRuqDo9cY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-P8tIfvIDMOGnoV1kSMBVTA-1; Fri, 30 Jul 2021 05:05:41 -0400
X-MC-Unique: P8tIfvIDMOGnoV1kSMBVTA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 396F2801AE3;
 Fri, 30 Jul 2021 09:05:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E36E45B4BC;
 Fri, 30 Jul 2021 09:05:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 48A1418000BB; Fri, 30 Jul 2021 11:05:38 +0200 (CEST)
Date: Fri, 30 Jul 2021 11:05:38 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: modular tcg
Message-ID: <20210730090538.ypohhzrd4nzqngk6@sirius.home.kraxel.org>
References: <20210722220952.17444-1-jziviani@suse.de>
 <20210722220952.17444-2-jziviani@suse.de>
 <c26fc6f4-341f-c66f-5384-c811e1342891@suse.de>
 <20210723095231.sfbkhdwdg43nedkk@sirius.home.kraxel.org>
 <4b5c010f-1365-e746-c269-9b9e48771f7b@suse.de>
 <6a3940a4-ca70-343b-5724-0f8f59d6fde4@suse.de>
 <20210723124858.rh63jh2esxahib4e@sirius.home.kraxel.org>
 <20210729091407.n7bdlyw5rsievdch@sirius.home.kraxel.org>
 <80e5ceaf-a425-2343-ef2e-d33b6ff87389@redhat.com>
MIME-Version: 1.0
In-Reply-To: <80e5ceaf-a425-2343-ef2e-d33b6ff87389@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 richard.henderson@linaro.org, Claudio Fontana <cfontana@suse.de>,
 "Jose R. Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

On Thu, Jul 29, 2021 at 06:40:17PM +0200, Paolo Bonzini wrote:
> On 29/07/21 11:14, Gerd Hoffmann wrote:
> > The common functions could be added TCGCPUOps to allow them being called via
> > CPUClass->tcg_ops->$name instead of a direct symbol reference.  Not sure this
> > is a good idea though.  Experimental patch covering tcg_exec_realizefn +
> > tcg_exec_unrealizefn below.
> 
> A lot of these (though probably not all) are already stubbed out as "static
> inline" in include/exec/exec-all.h.  I think they can be changed to function
> pointers in the style of ui/spice-module.c (accel/tcg/tcg-module.c?).

Yep, was thinking about that too.  But then I noticed we already have
TCGCPUOps and wondered whenever extending that would be the better
option.

> > No idea yet how to handle arch-specific bits best.  Seems there is no existing
> > infrastructure to untangle target-specific code and tcg, so this probably needs
> > something new.
> 
> If they are few enough, I would just move them out of target/i386/tcg and
> into target/i386/cpu-sysemu.c.

I'll have a look.

> > Noticed softmmu/physmem.c has lots of CONFIG_TCG #ifdefs, splitting this into
> > softmmu/physmem-{common,tcg}.c is probably a good idea.
> 
> I only count one, and those function should be easily moved  to
> accel/tcg/cputlb.c (after all both physmem.c and cputlb.c used to be a
> single file, exec.c, so this is just an oversight).

Well, I noticed one larger block covering multiple functions, didn't
check the whole file ...

thanks & take care,
  Gerd


