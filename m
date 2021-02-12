Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4495C31A59D
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 20:48:08 +0100 (CET)
Received: from localhost ([::1]:44892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAeQB-0008Br-BR
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 14:48:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAdm3-0008LX-0s
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 14:06:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAdlz-0006S6-91
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 14:06:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613156794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G+5D8G+fYuURIKP7fXeQEJ+NPWWwrCWfls0kTgjIw4w=;
 b=eLlu2DP/AohiOmUtr5jYnnT4QMpS+o+U15rD1HAgt6VocpP9dkGe+9Ws7rzXH3oR/KzZ46
 jvQTbvjxOCqHX+eOYY7PyASYjp886/6MQCW2jREmiow9rLZzDu4t00TDyS3Q0dW9kzz/Qh
 4fmsclZqfLbnateG06PGDCzWfcVIkAM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-zVJbOCUbNcCm0jeIdJwk7A-1; Fri, 12 Feb 2021 14:06:31 -0500
X-MC-Unique: zVJbOCUbNcCm0jeIdJwk7A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C575801965;
 Fri, 12 Feb 2021 19:06:30 +0000 (UTC)
Received: from [10.3.114.150] (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 33C6C19716;
 Fri, 12 Feb 2021 19:06:20 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] block: Explicit null-co uses 'read-zeroes=false'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210211142656.3818078-1-philmd@redhat.com>
 <20210211142656.3818078-2-philmd@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <5f9277ec-2f3c-8238-358b-0ab177491a2a@redhat.com>
Date: Fri, 12 Feb 2021 13:06:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210211142656.3818078-2-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/11/21 8:26 AM, Philippe Mathieu-Daudé wrote:
> We are going to switch the 'null-co' default 'read-zeroes' value
> from FALSE to TRUE in the next commit. First explicit the FALSE
> value when it is not set.
> 
> Suggested-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---

> +++ b/tests/qemu-iotests/300
> @@ -44,12 +44,12 @@ class TestDirtyBitmapMigration(iotests.QMPTestCase):
>      def setUp(self) -> None:
>          self.vm_a = iotests.VM(path_suffix='-a')
>          self.vm_a.add_blockdev(f'node-name={self.src_node_name},'
> -                               'driver=null-co')
> +                               'driver=null-co,read-zeroes=off')
>          self.vm_a.launch()
>  
>          self.vm_b = iotests.VM(path_suffix='-b')
>          self.vm_b.add_blockdev(f'node-name={self.dst_node_name},'
> -                               'driver=null-co')
> +                               'driver=null-co,read-zeroes=off')
>          self.vm_b.add_incoming(f'unix:{mig_sock}')
>          self.vm_b.launch()
>  
> 

Incomplete: 300 has a couple more lines that look like:

tests/qemu-iotests/300-        result = self.vm_a.qmp('blockdev-add',
tests/qemu-iotests/300:
node_name='node-b', driver='null-co')
--
tests/qemu-iotests/300-        result = self.vm_b.qmp('blockdev-add',
tests/qemu-iotests/300:
node_name='node-a', driver='null-co')

that could use the same treatment (noticed while reviewing Peter's patch
to add yet more uses in that test).

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


