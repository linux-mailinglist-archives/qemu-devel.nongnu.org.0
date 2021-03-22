Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA1734383F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 06:22:53 +0100 (CET)
Received: from localhost ([::1]:44132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOD1f-0003uy-UJ
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 01:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lOCzw-000378-3m
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 01:21:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lOCzs-00084c-Mw
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 01:21:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616390458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XgbarxzYdxfZgBw9/xQxrTykPqeb4XSQt7qefagPsQY=;
 b=BfN90ylRvWwhwCLRzYtXNUqY5ArRMwBFowizIMDo/XIcIYf771aKTAE/twhERYxO7j3EYx
 8dMKNX9/bGcHnmfuCPaRqTm8lt4bC8ZJ3oBRKDhUga29p/MFd7rN72/UWOP9b5wtHk0a83
 6wU+xt9KxG6131QnZeuF+E3/ovNpDa8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-D3YWe3s7PReX75BccWOIPw-1; Mon, 22 Mar 2021 01:20:54 -0400
X-MC-Unique: D3YWe3s7PReX75BccWOIPw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FE0B107B768;
 Mon, 22 Mar 2021 05:20:53 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-79.ams2.redhat.com [10.36.112.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBE567086D;
 Mon, 22 Mar 2021 05:20:51 +0000 (UTC)
To: Lukas Straub <lukasstraub2@web.de>, qemu-devel <qemu-devel@nongnu.org>
References: <cover.1616368879.git.lukasstraub2@web.de>
 <950007e82e19e75831b29fac07ab990c213d2352.1616368879.git.lukasstraub2@web.de>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/5] tests: Use the normal yank code instead of stubs in
 relevant tests
Message-ID: <1fc6eff2-a8e5-4ae2-96a5-1b30325dff81@redhat.com>
Date: Mon, 22 Mar 2021 06:20:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <950007e82e19e75831b29fac07ab990c213d2352.1616368879.git.lukasstraub2@web.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Marc-Andre Lureau <marcandre.lureau@gmail.com>, Li Zhang <zhlcindy@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/03/2021 00.31, Lukas Straub wrote:
> Use the normal yank code instead of stubs in relevant tests to
> increase coverage and to ensure that registering and unregistering
> of yank instances and functions is done correctly.
> 
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> ---
>   tests/qtest/meson.build | 6 +++---
>   tests/unit/meson.build  | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 66ee9fbf45..40e1f495f7 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -234,9 +234,9 @@ tpmemu_files = ['tpm-emu.c', 'tpm-util.c', 'tpm-tests.c']
>   qtests = {
>     'bios-tables-test': [io, 'boot-sector.c', 'acpi-utils.c', 'tpm-emu.c'],
>     'cdrom-test': files('boot-sector.c'),
> -  'dbus-vmstate-test': files('migration-helpers.c') + dbus_vmstate1,
> +  'dbus-vmstate-test': ['migration-helpers.c', dbus_vmstate1, '../../monitor/yank.c'],
>     'ivshmem-test': [rt, '../../contrib/ivshmem-server/ivshmem-server.c'],
> -  'migration-test': files('migration-helpers.c'),
> +  'migration-test': ['migration-helpers.c', io, '../../monitor/yank.c'],
>     'pxe-test': files('boot-sector.c'),
>     'qos-test': [chardev, io, qos_test_ss.apply(config_host, strict: false).sources()],
>     'tpm-crb-swtpm-test': [io, tpmemu_files],

Is this really necessary for the qtests? I can understand the change for the 
unit tests, but the qtests are separate programs where I could not imagine 
that they use the yank functions in any way?

  Thomas


PS: Please add a proper description about the yank feature to either that 
yank.c file or to include/qemu/yank.h ... I had a hard time to find out what 
this code is all about until I finally looked up your cover letter of the 
original series on the mailing list.


