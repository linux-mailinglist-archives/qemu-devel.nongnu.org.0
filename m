Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A0A33B24A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 13:11:59 +0100 (CET)
Received: from localhost ([::1]:35992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLm4k-00004v-Ue
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 08:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lLlyM-0004FW-ML
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 08:05:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lLlyI-0007vW-N3
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 08:05:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615809917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=72p4jdJPwUSpZ/3oav656AUlvjT9q6Bfgnrhmnli9VQ=;
 b=iCbiWyU1TupLFvQb8YVvoAhR2vT2+hQNjxjSpLABaKyfeU5Qv6ZFrka70eLWxW0LjLqILA
 eJ6BUZlycxSi5uKxFz9kzclYLZWXNyZePMb5lrios97Q+H9Funn9JL05MYcPpJIlbTPT2u
 Kg+npbhTMsNUyY/Uc6+rEGi/zQG4mG0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-LsLDa7eGOg-EnBRcMN6w0w-1; Mon, 15 Mar 2021 08:05:14 -0400
X-MC-Unique: LsLDa7eGOg-EnBRcMN6w0w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC26C93920;
 Mon, 15 Mar 2021 12:05:12 +0000 (UTC)
Received: from [10.3.113.66] (ovpn-113-66.phx2.redhat.com [10.3.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A82910190A7;
 Mon, 15 Mar 2021 12:04:47 +0000 (UTC)
Subject: Re: [PATCH 14/14] block: remove support for using "file" driver with
 block/char devices
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210224131142.1952027-1-berrange@redhat.com>
 <20210224131142.1952027-15-berrange@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <870d8911-32d1-b2b4-2bc6-5eec8c6424bc@redhat.com>
Date: Mon, 15 Mar 2021 07:04:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210224131142.1952027-15-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 7:11 AM, Daniel P. Berrangé wrote:
> The 'host_device' and 'host_cdrom' drivers must be used instead.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  block/file-posix.c               | 17 ++++++-----------
>  docs/system/deprecated.rst       |  7 -------
>  docs/system/removed-features.rst |  7 +++++++
>  tests/qemu-iotests/226.out       | 10 +++++-----
>  4 files changed, 18 insertions(+), 23 deletions(-)
> 

>      if (!device) {
> -        if (S_ISBLK(st.st_mode)) {
> -            warn_report("Opening a block device as a file using the '%s' "
> -                        "driver is deprecated", bs->drv->format_name);
> -        } else if (S_ISCHR(st.st_mode)) {
> -            warn_report("Opening a character device as a file using the '%s' "
> -                        "driver is deprecated", bs->drv->format_name);
> -        } else if (!S_ISREG(st.st_mode)) {
> -            error_setg(errp, "A regular file was expected by the '%s' driver, "
> -                       "but something else was given", bs->drv->format_name);
> +        if (!S_ISREG(st.st_mode)) {

We're testing with S_ISREG()...


> +++ b/docs/system/deprecated.rst
> @@ -21,13 +21,6 @@ deprecated.
>  System emulator command line arguments
>  --------------------------------------
>  
> -``-drive file=json:{...{'driver':'file'}}`` (since 3.0)
> -'''''''''''''''''''''''''''''''''''''''''''''''''''''''
> -
> -The 'file' driver for drives is no longer appropriate for character or host
> -devices and will only accept regular files (S_IFREG). The correct driver

but documented with S_IFREG().  Thankfully, the two have semantically
equivalent purposes, so the difference doesn't invalidate the docs.

Reviewed-by: Eric Blake <eblake@redhat.com>

but I wouldn't mind if at least one other block maintainer chimes in.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


