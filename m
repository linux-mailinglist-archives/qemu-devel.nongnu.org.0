Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FF618C1DC
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Mar 2020 21:52:40 +0100 (CET)
Received: from localhost ([::1]:43054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jF29f-0002nr-Uf
	for lists+qemu-devel@lfdr.de; Thu, 19 Mar 2020 16:52:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42719)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jF287-0000uQ-Jj
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 16:51:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1jF285-0003i7-4K
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 16:51:03 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:52414)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1jF285-0003hZ-0H
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 16:51:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584651060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yNcrtDwED8OZRW7GIvKoIkNq3NxOeTnmFfGvej+p88k=;
 b=iYXjOhAQFGUW4dMMkJA51JK/nEHOGzvGwCk2WMXs0mcX0glgnKQ9AOhHvDz6Z2VWn5T2eT
 T7RM+6wf8uAZGe8dr5T8rxU2ZRaGzXHe3AycT6ijeiNGbbUYzkaLl0OhXhOCDzVCz6rxKC
 DHS5eV+I8/yIkeZYhZAhc2x0VwOvpK0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-xoM2sH5JNjyfiuSX0Uv00Q-1; Thu, 19 Mar 2020 16:50:54 -0400
X-MC-Unique: xoM2sH5JNjyfiuSX0Uv00Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9179B18C35A1;
 Thu, 19 Mar 2020 20:50:53 +0000 (UTC)
Received: from [10.3.112.193] (ovpn-112-193.phx2.redhat.com [10.3.112.193])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5188C60BF7;
 Thu, 19 Mar 2020 20:50:47 +0000 (UTC)
Subject: Re: [PATCH] lockable: replaced locks with lock guard macros where
 appropriate
To: qemu-devel@nongnu.org, dnbrdsky@gmail.com
References: <158464676094.8988.14433696028016433212@39012742ff91>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <66184696-f5e8-6285-cf88-7b507e5a7f74@redhat.com>
Date: Thu, 19 Mar 2020 15:50:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <158464676094.8988.14433696028016433212@39012742ff91>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, quintela@redhat.com, pl@kamp.de,
 armbru@redhat.com, mreitz@redhat.com, alex.williamson@redhat.com,
 kraxel@redhat.com, ronniesahlberg@gmail.com, pbonzini@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/19/20 2:39 PM, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20200319161925.1818377-2-dnbrdsky@gmail.com/
> 
> 
> 
> Hi,
> 
> This series failed the docker-quick@centos7 build test. Please find the testing commands and
> their output below. If you have Docker installed, you can probably reproduce it
> locally.
> 
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> make docker-image-centos7 V=1 NETWORK=1
> time make docker-test-quick@centos7 SHOW_ENV=1 J=14 NETWORK=1
> === TEST SCRIPT END ===
> 
>    CC      hw/i2c/trace.o
> In file included from /tmp/qemu-test/src/util/rcu.c:34:0:
> /tmp/qemu-test/src/util/rcu.c: In function 'synchronize_rcu':
> /tmp/qemu-test/src/include/qemu/lockable.h:173:29: error: redefinition of 'qemu_lockable_auto__COUNTER__'
>       g_autoptr(QemuLockable) qemu_lockable_auto##__COUNTER__ = \

Patchew was confused: you sent this message in-reply-to "[PATCH] misc: 
fix __COUNTER__ macro to be referenced properly" which addresses this 
complaint, but as you did not thread the messages 0/2, 1/2, 2/2, patchew 
applied this one out of sequence.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


