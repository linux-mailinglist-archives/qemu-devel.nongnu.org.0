Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F662E2268
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 23:24:16 +0100 (CET)
Received: from localhost ([::1]:53110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksCYJ-000624-1M
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 17:24:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ksCNo-0006YV-Fo
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 17:13:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ksCNm-0002RV-Sm
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 17:13:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608761602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ykHO//S7u8AD+LXzO9OQbG0rzEONeo+T4hjt5EE78as=;
 b=ENO9TnrIErCMpNzWE7+7F4clLzwE4dshlNlQf9q/31LiSVWIsnJCp0wsX6eDO7IF7QZFup
 S/iaGG8GtD3TrxziBnrHd2W3/kxg66PcAA8JLDGGL5U4yv6k0sbZEfQ6F4UQgTCQhvE28X
 dKvbFikTDpWxq3P7RliiGGM0S+pJ3uE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-0o19qSpBOgy3KIIguIbDeA-1; Wed, 23 Dec 2020 17:13:18 -0500
X-MC-Unique: 0o19qSpBOgy3KIIguIbDeA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28CD2801817;
 Wed, 23 Dec 2020 22:13:17 +0000 (UTC)
Received: from [10.3.113.9] (ovpn-113-9.phx2.redhat.com [10.3.113.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D470066D2E;
 Wed, 23 Dec 2020 22:13:13 +0000 (UTC)
Subject: Re: [PATCH v1 1/1] chardev: enable guest socket status/crontrol via
 DTR and DCD
To: "Darrin M. Gorski" <darrin@gorski.net>, qemu-devel@nongnu.org
References: <CACdcevLHrP_HZED=SHMUzpF5vfFawJ3gYOKdeH1X1PHRFpWLgg@mail.gmail.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <fd3a6a86-ead8-9ad2-c7e6-d67c8dc60afd@redhat.com>
Date: Wed, 23 Dec 2020 16:13:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CACdcevLHrP_HZED=SHMUzpF5vfFawJ3gYOKdeH1X1PHRFpWLgg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.521, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/20 4:06 PM, Darrin M. Gorski wrote:
> This patch adds a 'modemctl' option to "-chardev socket" to enable control
> of the socket via the guest serial port.
> The default state of the option is disabled.
> 
> 1. disconnect a connected socket when DTR transitions to low, also reject
> new connections while DTR is low.
> 2. provide socket connection status through the carrier detect line (CD or
> DCD) on the guest serial port
> 
> Buglink: https://bugs.launchpad.net/qemu/+bug/1213196
> 
> Signed-off-by: Darrin M. Gorski <darrin@gorski.net>
> 
> 
> diff --git a/chardev/char-socket.c b/chardev/char-socket.c

Hmm - your workflow did not produce the usual --- marker and a diffstat
of which files were in the patch; this makes it easier for reviewers to
see at a glance what the rest of the email will contain.  It's not
essential, but it does help.


> +++ b/qapi/char.json
> @@ -271,6 +271,9 @@
>  #             then attempt a reconnect after the given number of seconds.
>  #             Setting this to zero disables this function. (default: 0)
>  #             (Since: 2.2)
> +# @modemctl: allow guest to use modem control signals to control/monitor
> +#            the socket state (CD follows is_connected, DTR influences
> +#            connect/accept) (default: false) (Since: 5.2)

The next release will by 6.0, not 5.2.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


