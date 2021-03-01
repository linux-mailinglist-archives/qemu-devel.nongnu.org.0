Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FB13282AC
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 16:39:31 +0100 (CET)
Received: from localhost ([::1]:58496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGkdt-0007QV-S9
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 10:39:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lGkco-0006U3-LJ
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 10:38:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lGkck-0004kb-1c
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 10:38:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614613096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lzf7uQzOkBy89QAZ4omcHjYitYA7TbcIh/V5HxbAR98=;
 b=DUMUWKQMViDFUG9IlTxcNz/w9cfbIW8e6un2Vu7tuJevOhIYFbbOBittKgt6jhNfNo+ofv
 j4kSFdY7wdX7a0lQMmzyQKMx4+FhuW0ZCyvvpOgVeJBRUo8na1oAkmahQ7//t5PfnhIiws
 I5WlhUJUJF2pchHdikqmyguu16GErV0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-vyu-ZdcCOgmyX8R730Ek7Q-1; Mon, 01 Mar 2021 10:38:13 -0500
X-MC-Unique: vyu-ZdcCOgmyX8R730Ek7Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 623061966339;
 Mon,  1 Mar 2021 15:38:12 +0000 (UTC)
Received: from [10.3.113.12] (ovpn-113-12.phx2.redhat.com [10.3.113.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FE971002C11;
 Mon,  1 Mar 2021 15:38:12 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] storage-daemon: report unexpected arguments on the
 fly
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210301152844.291799-1-pbonzini@redhat.com>
 <20210301152844.291799-2-pbonzini@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <b7b29e6a-4fe6-ab6a-87d9-e2e794b2b5d0@redhat.com>
Date: Mon, 1 Mar 2021 09:38:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210301152844.291799-2-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/21 9:28 AM, Paolo Bonzini wrote:
> If the first character of optstring is '-', then each nonoption argv
> element is handled as if it were the argument of an option with character
> code 1.  This removes the reordering of the argv array, and enables usage
> of loc_set_cmdline to provide better error messages.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  storage-daemon/qemu-storage-daemon.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

Nice.  The man page for 'getopt_long' is unclear whether setting
POSIXLY_CORRECT in the environment would break this (that is, setting
POSIXLY_CORRECT has the same effect as a leading '+'; but you can't have
both leading '+' and leading '-' and when both are set, it is not clear
which one wins).  But that's a corner case that I don't think will ever
bite us in real life.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


