Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBC32FFEA7
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 09:49:58 +0100 (CET)
Received: from localhost ([::1]:53212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2s8j-0002O3-GF
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 03:49:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l2s78-0001ej-49
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 03:48:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l2s76-00031p-OE
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 03:48:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611305295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1C3vvZ8pJShozVXJrN0lcwo0sgIbQkhM+4rXBecX5EE=;
 b=dxCp4Doyk50zcKhOfDHn/lk4YH/OALF5Vn7+BHRBKdi4CAJAZNdLzw32wsQTTJkrvFRwHa
 I9uzcoVdvUlAveKKiBkb6WVT2XEy3O8pOgSCBilN2tDllds2zHjvZxF2c/3vm7xWSSw+2K
 2lh8EJrHxv/2VMrMAeQWMD+omRdW/GA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-HClW-OszO_-CcmKjgY0RCA-1; Fri, 22 Jan 2021 03:48:13 -0500
X-MC-Unique: HClW-OszO_-CcmKjgY0RCA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F22EE192D78A
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 08:48:12 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-109.ams2.redhat.com
 [10.36.114.109])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 103256EF40;
 Fri, 22 Jan 2021 08:48:09 +0000 (UTC)
Subject: Re: Thread safety of coroutine-sigaltstack
To: Laszlo Ersek <lersek@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <7b8155ad-0942-dc1c-f43c-bb5eb518a278@redhat.com>
 <445268c9-d91f-af5a-3d7e-f4c6f014ca52@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <fc35da77-a5c2-08dd-05f2-0ebe781b338c@redhat.com>
Date: Fri, 22 Jan 2021 09:48:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <445268c9-d91f-af5a-3d7e-f4c6f014ca52@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.01.21 18:25, Laszlo Ersek wrote:

[...]

> A simple grep for SIGUSR2 seems to indicate that SIGUSR2 is not used by
> system emulation for anything else, in practice. Is it possible to
> dedicate SIGUSR2 explicitly to coroutine-sigaltstack, and set up the
> action beforehand, from some init function that executes on a "central"
> thread, before qemu_coroutine_new() is ever called?

I wrote a patch to that effect, but just before sending I wondered 
whether SIGUSR2 cannot be registered by the “guest” in user-mode 
emulation, and whether that would then break coroutines from there on.

(I have no experience dealing with user-mode emulation, but it does look 
like the guest can just register handlers for any signal but SIGSEGV and 
SIGBUS.)

Max


