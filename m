Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5953757D1
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 17:45:53 +0200 (CEST)
Received: from localhost ([::1]:52084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1legCF-0001yr-Oy
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 11:45:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1leg9W-0000w6-PE
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:43:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1leg9T-000282-Tb
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:43:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620315778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4KmRXMHEZ+tVNwwgfG0qof+36HnLMbB1FdIrxdalX6M=;
 b=eAEuhkWrz7fDs3gILn4J8VOfGgNDErIJa4hxu764eiCT3rqQZMKB7zwYVca6vyOo1WqzOm
 yT2E4iSYUla+LdPMd3NwJ/a9RFLd+RpnUBWhZH5cF9frXpdHQ24sB1/kT5PRt0MYmEz/op
 40PdqRZDB+NnjKOHmBE0IaN27Mp/zEM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-HqYu6-wIOUGL-HnIy_9qew-1; Thu, 06 May 2021 11:42:56 -0400
X-MC-Unique: HqYu6-wIOUGL-HnIy_9qew-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D196D80ED9B;
 Thu,  6 May 2021 15:42:54 +0000 (UTC)
Received: from [10.3.113.56] (ovpn-113-56.phx2.redhat.com [10.3.113.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A7CAE60862;
 Thu,  6 May 2021 15:42:50 +0000 (UTC)
Subject: Re: [PATCH v2 4/9] bsd-user/syscall: Replace alloca() by g_new()
To: Warner Losh <imp@bsdimp.com>
References: <20210506133758.1749233-1-philmd@redhat.com>
 <20210506133758.1749233-5-philmd@redhat.com>
 <CANCZdfoJWEbPFvZ0605riUfnpVRAeC6Feem5_ahC7FUfO71-AA@mail.gmail.com>
 <39f12704-af5c-2e4f-d872-a860d9a870d7@redhat.com>
 <CANCZdfqW0XTa18F+JxuSnhpictWxVJUsu87c=yAwMp6YT60FMg@mail.gmail.com>
 <7a96d45e-2bdc-f699-96f7-3fbf607cb06b@redhat.com>
 <CANCZdfrcv9ZUcBv7z+z3JPCjy0uzzY07VLmC4dqr5r8ba_QPLw@mail.gmail.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <adfc5da4-a615-24d7-0c67-f04d4eaec9a6@redhat.com>
Date: Thu, 6 May 2021 10:42:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CANCZdfrcv9ZUcBv7z+z3JPCjy0uzzY07VLmC4dqr5r8ba_QPLw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kvm-devel <kvm@vger.kernel.org>, Kyle Evans <kevans@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/6/21 10:30 AM, Warner Losh wrote:

> 
> But for the real answer, I need to contact the original authors of
> this part of the code (they are no longer involved day-to-day in
> the bsd-user efforts) to see if this scenario is possible or not. If
> it's easy to find out that way, we can either know this is safe to
> do, or if effort is needed to make it safe. At present, I've seen
> enough and chatted enough with others to be concerned that
> the change would break proper emulation.

Do we have a feel for the maximum amount of memory being used by the
various alloca() replaced in this series?  If so, can we just
stack-allocate an array of bytes of the maximum size needed?  Then we
avoid alloca() but also avoid the dynamic memory management that
malloc() would introduce.  Basically, it boils down to auditing why the
alloca() is safe, and once we know that, replacing the variable-sized
precise alloca() with its counterpart statically-sized array allocation,
at the expense of some wasted stack space when the runtime size does not
use the full compile-time maximum size.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


