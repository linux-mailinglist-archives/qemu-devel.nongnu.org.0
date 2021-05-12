Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FA937B70F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 09:46:41 +0200 (CEST)
Received: from localhost ([::1]:56726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgjZo-0008Rk-Kf
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 03:46:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1lgjY6-0007Tp-2r
 for qemu-devel@nongnu.org; Wed, 12 May 2021 03:44:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1lgjY3-0001ox-2O
 for qemu-devel@nongnu.org; Wed, 12 May 2021 03:44:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620805490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UZRlrlibgvgOLyV2MlkaTlxHnbOH2X0fJtE9/ZCb/Lk=;
 b=Smr4jdRXyKgLKKve+VOGOqSTNrKuHNAlexWoNBYnxAdu2uqM7FM8PjhhdIynZIIszY7+L0
 u2HkKjG0HzU+Dd1xowARSETnR/n7TaAyzZoMtYXA21cMEGTsrd9Gkzp9NAjBWXcN5ilHXe
 CFx2y4yNlQZZ3K4OGq/aNdf4dEaXwfo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-9DcGptIWP8y_XyD07HDQng-1; Wed, 12 May 2021 03:44:48 -0400
X-MC-Unique: 9DcGptIWP8y_XyD07HDQng-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FEAD107ACC7;
 Wed, 12 May 2021 07:44:47 +0000 (UTC)
Received: from [10.36.114.90] (ovpn-114-90.ams2.redhat.com [10.36.114.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EDB2F2C1A1;
 Wed, 12 May 2021 07:44:46 +0000 (UTC)
Subject: Re: [PATCH] scripts: add a script to list virtio devices in a system
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210506193341.140141-1-lvivier@redhat.com>
 <CAFEAcA8d6BQGHWUPp2cu-8eqYpXh5S6uV8va2A0KSq=f+9aWaw@mail.gmail.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <b402ffd8-4f89-1b6c-f01d-67b4b31923d5@redhat.com>
Date: Wed, 12 May 2021 09:44:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8d6BQGHWUPp2cu-8eqYpXh5S6uV8va2A0KSq=f+9aWaw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/05/2021 11:17, Peter Maydell wrote:
> On Thu, 6 May 2021 at 20:36, Laurent Vivier <lvivier@redhat.com> wrote:
>>
>> Add "lsvirtio" that lists all virtio devices in a system
>> the same way lspci does for the PCI cards.
> 
> This is cool, but it's not really QEMU specific -- it should
> work on any Linux guest running on some hypervisor or hardware
> that exposes virtio devices, right? So I'm not sure it really
> belongs in QEMU's source tree...
> 
> If you're a distro packager you'd probably want to have this be in its
> own package or at least not in the same package as the QEMU binaries,
> for instance, because this lives in the guest, not the host.
> 

Yes, I agree with that, but if it is in its own package I think it will never reach user
because no one will find it. I can try to push this into util-linux where we can find
tools like lscpu, lsblk ... but the competencies to review the code are in qemu-devel ML
not in util-linux ML.

Thanks,
Laurent


