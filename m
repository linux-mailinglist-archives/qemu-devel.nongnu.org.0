Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6460C376715
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 16:35:24 +0200 (CEST)
Received: from localhost ([::1]:59072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf1Zb-0005FH-GS
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 10:35:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lf1YM-0004oZ-JH
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:34:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lf1YL-00033z-4b
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:34:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620398044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w9OvK+6BrGw3MzbHmr/IX151SkuAVU+jaDpaue+3Jdw=;
 b=KGjc49gxK5VDJW5S13m9zkLBxUir9cIFhCl8lCbDA7eyY6xIEkhQ/GpC8+29X7bGgu4zv0
 DCBiysCBe4/IzeD9ph05IUYNqgX03Gf1MmC3csj8AhfPhn1f02EJvR3JwzMhaf5LBjXr7u
 gEhj3kKHANX+98Xm6xonJ0MCeNx195Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-aDt3b-1ZPIGg1MysL6_6pg-1; Fri, 07 May 2021 10:33:59 -0400
X-MC-Unique: aDt3b-1ZPIGg1MysL6_6pg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B7AF1800D50;
 Fri,  7 May 2021 14:33:58 +0000 (UTC)
Received: from [10.3.113.56] (ovpn-113-56.phx2.redhat.com [10.3.113.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DCC3E144;
 Fri,  7 May 2021 14:33:22 +0000 (UTC)
Subject: Re: [PATCH V3 16/22] chardev: cpr framework
To: Steve Sistare <steven.sistare@oracle.com>, qemu-devel@nongnu.org
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
 <1620390320-301716-17-git-send-email-steven.sistare@oracle.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <a02486f7-3882-1117-d60b-9775d534576e@redhat.com>
Date: Fri, 7 May 2021 09:33:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1620390320-301716-17-git-send-email-steven.sistare@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/7/21 7:25 AM, Steve Sistare wrote:
> Add QEMU_CHAR_FEATURE_CPR for devices that support cpr.
> Add the chardev close_on_cpr option for devices that can be closed on cpr
> and reopened after exec.
> cpr is allowed only if either QEMU_CHAR_FEATURE_CPR or close_on_cpr is set
> for all chardevs in the configuration.
> 
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---

> +++ b/qapi/char.json
> @@ -204,12 +204,15 @@
>  # @logfile: The name of a logfile to save output
>  # @logappend: true to append instead of truncate
>  #             (default to false to truncate)
> +# @close-on-cpr: if true, close device's fd on cprsave. defaults to false.
> +#                since 6.0.

6.1, actually.


> @@ -3182,6 +3196,10 @@ The general form of a character device option is:
>      ``logappend`` option controls whether the log file will be truncated
>      or appended to when opened.
>  
> +    Every backend supports the ``close-on-cpr`` option.  If on, the
> +    devices's descriptor is closed during cprsave, and reopened after exec.

device's

> +    This is useful for devices that do not support cpr.
> +
>  The available backends are:
>  
>  ``-chardev null,id=id``
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


