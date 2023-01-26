Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD1F67D322
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 18:27:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL61f-0004xc-Rl; Thu, 26 Jan 2023 12:27:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pL61W-0004hd-MN
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 12:26:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pL61V-00088m-0s
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 12:26:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674754011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7AllfWdtQA7z20VpC1DebeFhfDJJJZ8xk4BxaasVxso=;
 b=N9ODLTvrSoUiWhDgFancOkq+4gQy8yvkSesWIfNFULBpqM97Z5OFIXy+LMUcxGiWe863I7
 bBZUSAjqyPWFIy8D6Ad0XUiim8ZXxRDIQxFR+ITAYK+xak83XKONHE/mAolnlGiarmKoBi
 gOFueiEQN1oXkzZXddupw4Hjjv/uA8c=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-326-VVqpM2j7NNiN_SUbsCvYEg-1; Thu, 26 Jan 2023 12:26:49 -0500
X-MC-Unique: VVqpM2j7NNiN_SUbsCvYEg-1
Received: by mail-qv1-f69.google.com with SMTP id
 e5-20020a056214110500b0053547681552so1405338qvs.8
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 09:26:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7AllfWdtQA7z20VpC1DebeFhfDJJJZ8xk4BxaasVxso=;
 b=N4Jsum0cfeMY9eSq5NgW006XVQ/yJCk8efe1RwqKlQ7M7+VK2ReJNnGYZ0w+lv02pI
 5WQozvhoQIqk0YVPPF+B9ZtmK5+siHYLEIaY8KfSigwmnJPVfWEu9x6S2SIzlMEpqDxq
 9lRt3jNSjHj2MrJSVE4OYH8N9P87+fe/B/U8u9ZSr4xEZM59qVIJhXWYwXCcxdDFf30H
 SJdjBlbR5PkWeu7mw0PN345kvzH8X1H0ms+n1LUtkWdy+nlk4bTU9l7DiX+9qho9fhPc
 5UbOm8Ov2S981xS+NRw2v/8AK++NXoeTuWaT3zjaRuek6C+IgAMYRz3iXkkVmziRO2PT
 kx5A==
X-Gm-Message-State: AFqh2ko6xLYbDX/5DTqGzTz4DqS740MIPURc3jfva1OSamehyCUobbmW
 Q3J35G7X5kJ+2E+aQe8+FmPWXAgSGsy/AHyTTStJfuItif5lHmMlZOYrcqQlDVk8xD70EZlfoLj
 VrJgtGXgNqHxuu+g=
X-Received: by 2002:ac8:71c8:0:b0:3af:b6bd:aba7 with SMTP id
 i8-20020ac871c8000000b003afb6bdaba7mr55174794qtp.43.1674754008731; 
 Thu, 26 Jan 2023 09:26:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsEQHz1ex7QmIs7wMEGWGUgceM1fpHKCVkNlOqcf100PikQttIdQbBEx8wG5xizHKwYb+OAXw==
X-Received: by 2002:ac8:71c8:0:b0:3af:b6bd:aba7 with SMTP id
 i8-20020ac871c8000000b003afb6bdaba7mr55174773qtp.43.1674754008490; 
 Thu, 26 Jan 2023 09:26:48 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 12-20020a370c0c000000b006b5cc25535fsm1214336qkm.99.2023.01.26.09.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 09:26:47 -0800 (PST)
Date: Thu, 26 Jan 2023 12:26:45 -0500
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Michal =?utf-8?B?UHLDrXZvem7DrWs=?= <mprivozn@redhat.com>,
 qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH 0/3] util/userfaultfd: Support /dev/userfaultfd
Message-ID: <Y9K31a04dTChnaOV@x1n>
References: <20230125224016.212529-1-peterx@redhat.com>
 <0f8ad497-202d-ae55-e468-77bb726a2699@redhat.com>
 <Y9KK72k8dZU7Ccau@work-vm> <Y9KbUaMo8DaH0YKv@x1n>
 <Y9KjZeu9t37XyZ3q@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y9KjZeu9t37XyZ3q@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Jan 26, 2023 at 03:59:33PM +0000, Daniel P. Berrangé wrote:
> On Thu, Jan 26, 2023 at 10:25:05AM -0500, Peter Xu wrote:
> > On Thu, Jan 26, 2023 at 02:15:11PM +0000, Dr. David Alan Gilbert wrote:
> > > * Michal Prívozník (mprivozn@redhat.com) wrote:
> > > > On 1/25/23 23:40, Peter Xu wrote:
> > > > > The new /dev/userfaultfd handle is superior to the system call with a
> > > > > better permission control and also works for a restricted seccomp
> > > > > environment.
> > > > > 
> > > > > The new device was only introduced in v6.1 so we need a header update.
> > > > > 
> > > > > Please have a look, thanks.
> > > > 
> > > > I was wondering whether it would make sense/be possible for mgmt app
> > > > (libvirt) to pass FD for /dev/userfaultfd instead of QEMU opening it
> > > > itself. But looking into the code, libvirt would need to do that when
> > > > spawning QEMU because that's when QEMU itself initializes internal state
> > > > and queries userfaultfd caps.
> > > 
> > > You also have to be careful about what the userfaultfd semantics are; I
> > > can't remember them - but if you open it in one process and pass it to
> > > another process, which processes address space are you trying to
> > > monitor?
> > 
> > Yes it's a problem.  The kernel always fetches the current mm_struct* which
> > represents the current context of virtual address space when creating the
> > uffd handle (for either the syscall or the ioctl() approach).
> 
> At what point does the process address space get associated ? When
> the /dev/userfaultfd is opened, or only when ioctl(USERFAULTFD_IOC_NEW)
> is called ?  If it is the former, then we have no choice, QEMU must open
> it. if it is the latter, then libvirt can open /dev/userfaultfd, pass
> it to QEMU which can then do the ioctl(USERFAULTFD_IOC_NEW).

Good point.. It should be the latter, so should be doable.

What should be the best interface for QEMU to detect the fd passing over to
it?  IIUC qemu_open() requires the name to be /dev/fdset/*, but there's no
existing cmdline that QEMU can know which fd number to fetch from fdset to
be used as the /dev/userfaultfd descriptor.

monitor_get_fd() seems more proper, where we can define an unique string so
Libvirt can preset the descriptor with the same string attached to it, then
I can opt-in monitor_get_fd() before trying to open() or doing the syscall.

Thanks,

-- 
Peter Xu


