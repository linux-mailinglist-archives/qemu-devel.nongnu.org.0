Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF732B8323
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 18:31:54 +0100 (CET)
Received: from localhost ([::1]:40612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfRJB-0006zM-5j
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 12:31:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kfRF3-0005N3-4B
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 12:27:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kfREx-0003KP-PM
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 12:27:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605720445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PM5KyHwWGpMAbqXxkjzU0Zl1iDNMYiswJrNyc8D8HUg=;
 b=Ws6ciUnPJMQmuxoYQFhWZfdE0AO3SqPysgd5ovgAH+HeZcmxS/eSyH4meCVUCOYhBM23Zh
 pygJvAPrYEdLAfS8iq+i6sYnor9VFi1t0kbi3nFxOGa9ueGzLz1Wm/tkk72U43M9/L2zmf
 Hf1V4wmfMbbMJXq5JEeTu4Gtoolnsf8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-p0ReASz1OhiF-UglCGNM3Q-1; Wed, 18 Nov 2020 12:27:21 -0500
X-MC-Unique: p0ReASz1OhiF-UglCGNM3Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 042D81005D4F;
 Wed, 18 Nov 2020 17:27:21 +0000 (UTC)
Received: from [10.3.112.188] (ovpn-112-188.phx2.redhat.com [10.3.112.188])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A65815D6A8;
 Wed, 18 Nov 2020 17:27:20 +0000 (UTC)
Subject: Re: [PATCH 5/6] configure / meson: Move check for sys/signal.h to
 meson.build
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20201118171052.308191-1-thuth@redhat.com>
 <20201118171052.308191-6-thuth@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <3b3bacda-c6fc-a038-49df-0ca0bc5422e4@redhat.com>
Date: Wed, 18 Nov 2020 11:27:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201118171052.308191-6-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 11:10 AM, Thomas Huth wrote:

In the subject: s/signal/kcov/

> This check can be done in a much shorter way in meson.build. And while
> we're at it, rename the #define to HAVE_SYS_KCOV_H to match the other
> HAVE_someheader_H symbols that we already have.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---

> -# check for kcov support (kernel must be 4.4+, compiled with certain options)
> -kcov=no
> -if check_include sys/kcov.h ; then
> -    kcov=yes
> -fi

> +config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
>  config_host_data.set('HAVE_SYS_SIGNAL_H', cc.has_header('sys/signal.h'))
>  
>  ignored = ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


