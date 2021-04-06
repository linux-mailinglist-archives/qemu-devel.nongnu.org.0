Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7658355A10
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 19:11:48 +0200 (CEST)
Received: from localhost ([::1]:47018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTpEx-0005Ua-OZ
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 13:11:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lTpA8-000351-RN
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:06:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lTpA6-0004T2-LI
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:06:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617728805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gBlxXb5Jffm/L8JnMtGi082umGnIAUrQo8UfQZZX4tA=;
 b=ElbMcOGs0AG/yhgZwWgiwoY75PUhqQouXyWeJK9x4fEPnjDSp2TXZee3NulO8MaK/NvwBH
 eYaTe/l9N3HzG5cGvE1VMc5Ikvy8UZDtVzBJhg8y7vME7ZyPhRCyd6ZhyGKOGjUmyWezIy
 to5Bja2US3hOcLJn/tygq8IWpMy3CzA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-4Gldt4ilMYGg4Z2M77uU4w-1; Tue, 06 Apr 2021 13:06:43 -0400
X-MC-Unique: 4Gldt4ilMYGg4Z2M77uU4w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 432D11018F64;
 Tue,  6 Apr 2021 17:06:42 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-169.ams2.redhat.com
 [10.36.113.169])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A5FA160C4A;
 Tue,  6 Apr 2021 17:06:37 +0000 (UTC)
Subject: Re: [PATCH 0/2] block/rbd: fix memory leaks
To: Stefano Garzarella <sgarzare@redhat.com>, qemu-devel@nongnu.org
References: <20210329150129.121182-1-sgarzare@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <b6c205ab-356a-ed3c-0442-105668db19d9@redhat.com>
Date: Tue, 6 Apr 2021 19:06:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210329150129.121182-1-sgarzare@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Jason Dillaman <dillaman@redhat.com>,
 Florian Florensa <fflorensa@online.net>, Peter Lieven <pl@kamp.de>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29.03.21 17:01, Stefano Garzarella wrote:
> This series fixes two memory leaks, found through valgrind, in the
> rbd driver.
> 
> Stefano Garzarella (2):
>    block/rbd: fix memory leak in qemu_rbd_connect()
>    block/rbd: fix memory leak in qemu_rbd_co_create_opts()
> 
>   block/rbd.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>

I’m not quite sure whether this is fit for 6.0...  I think it’s too late 
for rc2, so I don’t know.

Max


