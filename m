Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DF43110BC
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 20:09:21 +0100 (CET)
Received: from localhost ([::1]:58224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l86To-00056D-5S
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 14:09:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l86P2-00035p-BB
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 14:04:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l86Ow-0006Ed-4X
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 14:04:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612551856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YM/9Q6x1TGBrPzmZdzTgxv0gdyBOuXCdACYIn5KYe3Y=;
 b=TZclFS2CakBDhVv5xlw7M2NP1gCJNQsXdAHdMh+WiTXqoFfbhRx4xHwHLnj54YOKwfbV7q
 4G0gZPdW+QKfbJ3usqwqKV/sVwH0kOHB5CHLUzSzTTPde28AsOfJhCm+CMVmENXDNRHk/J
 DLOpqjc++9+AiAHUdnixjbOElVXusQo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436--7UqF_XUOCu50lRFLkVPBg-1; Fri, 05 Feb 2021 14:04:13 -0500
X-MC-Unique: -7UqF_XUOCu50lRFLkVPBg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8B66803F49;
 Fri,  5 Feb 2021 19:04:12 +0000 (UTC)
Received: from [10.3.112.253] (ovpn-112-253.phx2.redhat.com [10.3.112.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4519119712;
 Fri,  5 Feb 2021 19:04:09 +0000 (UTC)
Subject: Re: [PATCH] sockets: Use SOMAXCONN for Unix socket listen()
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210204222018.1432848-1-eblake@redhat.com>
 <20210205095548.GC908621@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <a07ba31b-66f4-aa85-8e3b-18caec6548c6@redhat.com>
Date: Fri, 5 Feb 2021 13:04:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210205095548.GC908621@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.33, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, rjones@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/21 3:55 AM, Daniel P. Berrangé wrote:

>> +++ b/util/qemu-sockets.c
>> @@ -1059,7 +1059,7 @@ int unix_listen(const char *str, Error **errp)
>>
>>      saddr = g_new0(UnixSocketAddress, 1);
>>      saddr->path = g_strdup(str);
>> -    sock = unix_listen_saddr(saddr, 1, errp);
>> +    sock = unix_listen_saddr(saddr, SOMAXCONN, errp);
>>      qapi_free_UnixSocketAddress(saddr);
>>      return sock;
>>  }
> 
> This method is a legacy back compat function, only used by the QEMU
> guest agent, so this can't explain the NBD problems, which use the
> QIONetListener class.
> 
> IOW, the problem is in the qemu-nbd.c / blockdev-nbd.c code I believe

D'oh. Serves me right for trying to guess the spot using just a grep on
listen() rather than running under gdb with a breakpoint to find the
actual backtrace.  v2 posted with a slightly changed subject line, and
this time tested to actually work.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


