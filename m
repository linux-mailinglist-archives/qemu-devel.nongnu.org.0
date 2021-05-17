Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9069E383B05
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 19:16:35 +0200 (CEST)
Received: from localhost ([::1]:59432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ligr4-0008JE-Lv
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 13:16:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ligpK-0006AM-IC
 for qemu-devel@nongnu.org; Mon, 17 May 2021 13:14:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ligpI-0006jO-FW
 for qemu-devel@nongnu.org; Mon, 17 May 2021 13:14:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621271683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nPTz4XzVjK3r2tliPpjGmSntptw6o93MVcyP9AEJhhA=;
 b=TL72luZ1uGWLht1JNPavUrpKbJEzY8OgAxeKjUN9cGcUZfP5+sOBOWZItZLCJ6axoTGoQK
 QDbtbRq7Wl2m1/W+wzLL7MC9VvYill12TL/AVAGofYQEX08y/Wxiq888uHNrq9FpfS6qS4
 7kwvkyl7mW/9drDHFqiAXZqMFyTsA2k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-o6oZzqDsOUCx8Wm-DrCzyA-1; Mon, 17 May 2021 13:14:40 -0400
X-MC-Unique: o6oZzqDsOUCx8Wm-DrCzyA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B2911854E25;
 Mon, 17 May 2021 17:14:39 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9943660BE5;
 Mon, 17 May 2021 17:14:37 +0000 (UTC)
Subject: Re: [PATCH] fdc: check drive block device before usage
 (CVE-2021-20196)
To: P J P <ppandit@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
References: <20210123100345.642933-1-ppandit@redhat.com>
 <6881ef3c-99a1-1f5f-cca5-0850ec2bd6cf@redhat.com>
 <89fb8d54-707a-9965-75e2-665d4cb07d63@redhat.com>
 <bea5cec1-eb1b-3eab-8e71-4af7ae1078ff@redhat.com>
 <8n7o47n5-741n-819-187-n27p1o87q362@erqung.pbz>
From: John Snow <jsnow@redhat.com>
Message-ID: <a4277718-e26e-4b00-bea6-cdc2c3e4c8f1@redhat.com>
Date: Mon, 17 May 2021 13:14:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8n7o47n5-741n-819-187-n27p1o87q362@erqung.pbz>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-stable@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Gaoning Pan <pgn@zju.edu.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 7:12 AM, P J P wrote:
> +-- On Sat, 15 May 2021, Philippe Mathieu-Daudé wrote --+
> | This patch misses the qtest companion with the reproducer
> | provided by Alexander.
> 
> Do we need a revised patch[-series] including a qtest? OR it can be done at
> merge time?
> 
> Thank you.
> --
>   - P J P
> 8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D
> 

Unknown, haven't dug into this patch and problem yet.

If you have the time to write a qtest reproducer, you can send it 
separately and I'll pick it up if everything looks correct.

Sorry for the FDC/ATA delays. Working on it.

(...Maintainers wanted!)

--js


