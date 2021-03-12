Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B95338D21
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 13:32:27 +0100 (CET)
Received: from localhost ([::1]:60358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKgxu-0004tL-0W
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 07:32:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKgwQ-0004GC-Fb
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 07:30:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKgwN-0004JE-4x
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 07:30:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615552249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mAvq6FLSWr3cPvUo1t0rRytWMbisKTTggwPCXqTPQms=;
 b=aUw/fnTWNnAsTG2F6ojMA185t9L8JcpQgxJhJjKT6xI1Dw6kkHR9t4baQGJkLZAWJgLDt4
 d386GJA5NzK6qHtMA+S6oVd+7Vu6uC2l98xi7vEq7/hjd4Fdma2UCEJdKA2sKegRX1C1Kc
 lqJ6dWsl1OwaZ2YP7CGQvCrDJ8Kx+FM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-Tm339cA-OTaOSn72_ZOQ3g-1; Fri, 12 Mar 2021 07:30:46 -0500
X-MC-Unique: Tm339cA-OTaOSn72_ZOQ3g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4AE91932480;
 Fri, 12 Mar 2021 12:30:43 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-83.ams2.redhat.com [10.36.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD25219704;
 Fri, 12 Mar 2021 12:30:25 +0000 (UTC)
Subject: Re: [PATCH v21 00/20] Initial support for multi-process Qemu
To: Jagannathan Raman <jag.raman@oracle.com>, qemu-devel@nongnu.org
References: <cover.1611938319.git.jag.raman@oracle.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <d59d1987-75dd-4a75-c4d1-87b481dda0ee@redhat.com>
Date: Fri, 12 Mar 2021 13:30:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <cover.1611938319.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, kraxel@redhat.com, quintela@redhat.com,
 mst@redhat.com, armbru@redhat.com, kanth.ghatraju@oracle.com,
 felipe@nutanix.com, ehabkost@redhat.com, konrad.wilk@oracle.com,
 dgilbert@redhat.com, alex.williamson@redhat.com, stefanha@redhat.com,
 thanos.makatos@nutanix.com, kwolf@redhat.com, berrange@redhat.com,
 mreitz@redhat.com, ross.lagerwall@citrix.com, marcandre.lureau@gmail.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/01/2021 17.46, Jagannathan Raman wrote:
> Hi,
> 
> This is the v21 of the patchset. This version has the following changes:
> 
> [PATCH v18 08/20] io: add qio_channel_readv_full_all_eof &
>                 qio_channel_readv_full_all helpers
>    - Separates out the error handling for (len = 0) & (len < 0)
>    - (len = 0) does not necessarily mean EOF. It could also be
>      a case where only FDs are read, without any data with more data
>      possibly on the way. Addresses this scenario as well, as was
>      pointed out in the feedback from last time.
> 
> To touch upon the history of this project, we posted the Proof Of Concept
> patches before the BoF session in 2018. Subsequently, we have posted 20
> versions on the qemu-devel mailing list. You can find them by following
> the links below ([1] - [20]). Following people contributed to the design and
> implementation of this project:
> Jagannathan Raman <jag.raman@oracle.com>
> Elena Ufimtseva <elena.ufimtseva@oracle.com>
> John G Johnson <john.g.johnson@oracle.com>
> Stefan Hajnoczi <stefanha@redhat.com>
> Konrad Wilk <konrad.wilk@oracle.com>
> Kanth Ghatraju <kanth.ghatraju@oracle.com>
> 
> We would like to thank you for your feedback in the
> design and implementation of this project. Qemu wiki page:
> https://wiki.qemu.org/Features/MultiProcessQEMU
> 
> For the full concept writeup about QEMU multi-process, please
> refer to docs/devel/qemu-multiprocess.rst. Also, see
> docs/qemu-multiprocess.txt for usage information.

  Hi!

FWIW, the x-remote machine can be used to crash QEMU:

$ ./qemu-system-i386 -machine x-remote -device piix3-ide
Segmentation fault (core dumped)

... discovered with the scripts/device-crash-test script.

  Thomas


