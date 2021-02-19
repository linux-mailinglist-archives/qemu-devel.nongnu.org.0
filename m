Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAB531F7EE
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 12:08:46 +0100 (CET)
Received: from localhost ([::1]:34104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD3eP-0004BR-Jx
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 06:08:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lD3dJ-0003Z5-NL
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 06:07:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lD3dH-0002IF-DJ
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 06:07:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613732853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CxMJnJFSyK8tKDZLqe8Dd18Tjid7MzZoGPsGZ4wMoIo=;
 b=YwfAHmMLI5UCNUV3hhJKcNIVVJy43X8NdZdxCDyy4JJqpVQrU1ASfmCkydD0CqEpQ6FrAR
 9VjWRbX50Mhd/MbJjqbZ/VKwh6Yty9SxJcIReKFDxeMg7IdzEAAzbGHm3VoAOzD268vuYY
 PZ3ktTHJEiuSr8gBkRvQylfIBAgNLRA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-cWHCqbCOOICU-8Yt0OxNlQ-1; Fri, 19 Feb 2021 06:07:32 -0500
X-MC-Unique: cWHCqbCOOICU-8Yt0OxNlQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2C5F100CCC2;
 Fri, 19 Feb 2021 11:07:30 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-112-191.ams2.redhat.com
 [10.36.112.191])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3501F702F2;
 Fri, 19 Feb 2021 11:07:19 +0000 (UTC)
Subject: Re: [PATCH v2 0/2] block: Use 'read-zeroes=true' mode by default with
 'null-co' driver
To: Fam Zheng <fam@euphon.net>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
References: <20210211142656.3818078-1-philmd@redhat.com>
 <20210213215448.GA67780@ip-172-44-255-31>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <3da6a2aa-472e-d9e1-b803-303891513274@redhat.com>
Date: Fri, 19 Feb 2021 12:07:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210213215448.GA67780@ip-172-44-255-31>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13.02.21 22:54, Fam Zheng wrote:
> On 2021-02-11 15:26, Philippe Mathieu-Daudé wrote:
>> The null-co driver doesn't zeroize buffer in its default config,
>> because it is designed for testing and tests want to run fast.
>> However this confuses security researchers (access to uninit
>> buffers).
> 
> I'm a little surprised.
> 
> Is changing default the only way to fix this? I'm not opposed to
> changing the default but I'm not convinced this is the easiest way.
> block/nvme.c also doesn't touch the memory, but defers to the device
> DMA, why doesn't that confuse the security checker?
> 
> Cannot we just somehow annotate it in a way that the checker can
> understand (akin to how we provide coverity models) and be done?

The question is, why wouldn’t we change the default?  read-zeroes=true 
seems the better default to me.  I consider silencing valgrind warnings 
and the like a nice side effect.

Max


