Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 523E2547779
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 22:23:06 +0200 (CEST)
Received: from localhost ([::1]:49298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o07dQ-0004FZ-O5
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 16:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1o07ba-0003TR-QC
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 16:21:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1o07bX-0007mu-OB
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 16:21:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654978866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ch4FXttjMW+t645V+qTa4kHJjZ0xzG5vUxLj0/wYlWk=;
 b=dLFnV7TbZ2HLdC8h0XpsCHYlvZ5MvvLZpcRz5bzbDnxjj0Cy/DpVjD0ZlpbIJvM/oSpGEJ
 OkUAXyOfL1E/KsNNzddu4KuRt29fSf7yFr8xgKlLE0E5exeBQz7uFEhRN0E5keB5grQ5np
 gVvxts+gMq5DK3416Hml+dZk1ayYNkg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-G0XKa_r2OyCQ6cSI9Zafsw-1; Sat, 11 Jun 2022 16:21:04 -0400
X-MC-Unique: G0XKa_r2OyCQ6cSI9Zafsw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D461101AA45
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 20:21:04 +0000 (UTC)
Received: from [10.22.8.62] (unknown [10.22.8.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 594EE40E80E0;
 Sat, 11 Jun 2022 20:21:04 +0000 (UTC)
Message-ID: <323ea148-045c-798a-b44f-c5f995c306b3@redhat.com>
Date: Sat, 11 Jun 2022 16:21:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] dbus-display: fix test race when initializing p2p
 connection
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
References: <20220609152647.870373-1-marcandre.lureau@redhat.com>
From: Cole Robinson <crobinso@redhat.com>
In-Reply-To: <20220609152647.870373-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=crobinso@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/9/22 11:26 AM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The D-Bus connection starts processing messages before QEMU has the time
> to set the object manager server. This is causing dbus-display-test to
> fail randomly with:
> 
> ERROR:../tests/qtest/dbus-display-test.c:68:test_dbus_display_vm:
> assertion failed
> (qemu_dbus_display1_vm_get_name(QEMU_DBUS_DISPLAY1_VM(vm)) ==
> "dbus-test"): (NULL == "dbus-test") ERROR
> 
> Use the delayed message processing flag and method to avoid that
> situation.
> 
> (the bus connection doesn't need a fix, as the initialization is done
> synchronously)
> 
> Reported-by: Robinson, Cole <crobinso@redhat.com>
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  ui/dbus.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Fedora test build passed for me. Thanks Marc-André!

Tested-by: Cole Robinson <crobinso@redhat.com>

- Cole


