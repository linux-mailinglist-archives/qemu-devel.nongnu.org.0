Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAB3456C35
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 10:17:50 +0100 (CET)
Received: from localhost ([::1]:58656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo01l-00054N-6P
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 04:17:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mnzzC-00036z-Eq
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:15:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mnzz5-0000Cp-Hv
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:15:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637313300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3PK0YQdPvh2/txWomJjDtzp5fGGkzwaS26QIhLWiCS0=;
 b=HNprIr8VEmczLMyWgl+bzsWUyi3foxDGFym0F42RI1vEodO9miIaVEcvLmKnmVM/VvNUyg
 gP12Qrge6fOV7VWM0AjdUYFf+z63hAkaieWKU3u1nz47lW34QjMq/37Ffr8RI9i9bzSQHw
 bw6Pt9i4WUJKUn2b+T2TxEWzHcRit34=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-30-36pmE1QfMJis0pzA-ZuJVw-1; Fri, 19 Nov 2021 04:14:59 -0500
X-MC-Unique: 36pmE1QfMJis0pzA-ZuJVw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00470804140;
 Fri, 19 Nov 2021 09:14:58 +0000 (UTC)
Received: from [10.39.194.192] (unknown [10.39.194.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA87519D9B;
 Fri, 19 Nov 2021 09:14:54 +0000 (UTC)
Message-ID: <f1093393-bf6d-480c-8b3b-70e9d4a7532b@redhat.com>
Date: Fri, 19 Nov 2021 10:14:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH for-6.2 0/2] esp: add fix for reset before transfer
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, fam@euphon.net,
 thuth@redhat.com, lvivier@redhat.com, qemu-devel@nongnu.org
References: <20211118100327.29061-1-mark.cave-ayland@ilande.co.uk>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211118100327.29061-1-mark.cave-ayland@ilande.co.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-1.727, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On 11/18/21 11:03, Mark Cave-Ayland wrote:
> This is the fix for Gitlab issue #724 discovered by fuzzing which I think is
> worth including in 6.2 for 2 reasons: firstly the fix is to zero out
> an extra field during chip reset which normally only occurs during driver
> initialisation and durring IO timeouts, and secondly the bug causes a stale
> SCSI data buffer pointer dereference rather than triggering a FIFO assert.
> 
> The first patch contains the very simple fix, whilst the second patch adds a
> qtest based upon the original Gitlab issue.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> 
> Mark Cave-Ayland (2):
>    esp: ensure that async_len is reset to 0 during esp_hard_reset()
>    qtest/am53c974-test: add test for reset before transfer
> 
>   hw/scsi/esp.c               |  1 +
>   tests/qtest/am53c974-test.c | 30 ++++++++++++++++++++++++++++++
>   2 files changed, 31 insertions(+)
> 

Queued, thanks.

Paolo


