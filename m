Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF0033D57A
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 15:07:50 +0100 (CET)
Received: from localhost ([::1]:37886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMAMP-0002rF-SL
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 10:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lMAKv-00022f-Sw
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 10:06:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lMAKt-000852-04
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 10:06:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615903573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J4YA1Pgt5AwHaI1pvAxC3+He+sC6dfEUTT9J0J1iLoU=;
 b=DkJxrj7qH5WsEkYAvYIeGLBBoo1U/CZKw9sFNwqr7rIxSsqMM86UMSYuxN4EI89zypScr/
 MbUnU0wwAe/GgZysZJEzQbmkMpsnRcl+B/knHzThNkJgcrAphA6pYDTG3PbVW9AFkyFsdE
 q3sws23+SBpIBqjQaWM9Js/ORGUnbHk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-IYqLHFa6NEyl78qnj7rMHw-1; Tue, 16 Mar 2021 10:06:09 -0400
X-MC-Unique: IYqLHFa6NEyl78qnj7rMHw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2071A835BD1;
 Tue, 16 Mar 2021 14:06:08 +0000 (UTC)
Received: from [10.3.113.66] (ovpn-113-66.phx2.redhat.com [10.3.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C14852B196;
 Tue, 16 Mar 2021 14:06:07 +0000 (UTC)
Subject: Re: [PATCH] yank: Avoid linking into executables that don't want it
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210316135907.3646901-1-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <9b906931-f664-cc4e-6498-9a6282eec215@redhat.com>
Date: Tue, 16 Mar 2021 09:06:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210316135907.3646901-1-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, lukasstraub2@web.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/21 8:59 AM, Markus Armbruster wrote:
> util/yank.c and stubs/yank.c are both in libqemuutil.a, even though
> their external symbols conflict.  The linker happens to pick the
> former.  This links a bunch of unneeded code into the executables that
> actually want the latter: qemu-io, qemu-img, qemu-nbd, and several
> tests.  Amazingly, none of them fails to link.
> 
> To fix this, the non-stub yank.c from sourceset util_ss to sourceset

This sentence no verb.

> qmp_ss.  This requires moving it from util/ to monitor/.
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  {util => monitor}/yank.c | 0
>  MAINTAINERS              | 2 +-
>  monitor/meson.build      | 1 +
>  util/meson.build         | 1 -
>  4 files changed, 2 insertions(+), 2 deletions(-)
>  rename {util => monitor}/yank.c (100%)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


