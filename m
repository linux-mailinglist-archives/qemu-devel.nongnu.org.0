Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B8730857E
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 07:14:59 +0100 (CET)
Received: from localhost ([::1]:35886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5N3a-0006F7-Ci
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 01:14:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l5N2R-0005dQ-C8
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 01:13:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l5N2P-0000b4-An
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 01:13:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611900824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R6zA6qV84vOExpWoikaoEiXCWw3A87+hH2PlOh6C8Rc=;
 b=Zlw7Vh7ECJ4X0xxvUB9GAmjiHC3GKxoOVQVEFDrBLh8kxECeWaBXwNbogRJKu1RH5A5yTw
 eoKfuVhnZKJ2lU5KLSfiOL5AtwKUGx7z4iry8bbkdTMkWoCbo6YStre4wEOfgI6GE9STh3
 oiAkXkcrHTV+lzfha2qGOIwGHts2930=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-eJhNm-1UNvKc_v0OJeT5Fg-1; Fri, 29 Jan 2021 01:13:40 -0500
X-MC-Unique: eJhNm-1UNvKc_v0OJeT5Fg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75BAC10054FF;
 Fri, 29 Jan 2021 06:13:39 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-110.ams2.redhat.com [10.36.112.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF6C9271AB;
 Fri, 29 Jan 2021 06:13:37 +0000 (UTC)
Subject: Re: [PATCH] target/rx: Fix compiler errors for build with sanitizers
To: Stefan Weil <sw@weilnetz.de>, Yoshinori Sato <ysato@users.sourceforge.jp>
References: <20210128172127.46041-1-sw@weilnetz.de>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <13bd2f80-1467-4f2a-78ee-6b6e859115c7@redhat.com>
Date: Fri, 29 Jan 2021 07:13:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210128172127.46041-1-sw@weilnetz.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/01/2021 18.21, Stefan Weil wrote:
> gcc (Debian 10.2.1-6) 10.2.1 20210110 aborts builds with enabled sanitizers:
> 
> ../../../target/rx/op_helper.c: In function ‘helper_scmpu’:
> ../../../target/rx/op_helper.c:213:24: error: ‘tmp1’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>    213 |     env->psw_c = (tmp0 >= tmp1);
>        |                  ~~~~~~^~~~~~~~
> ../../../target/rx/op_helper.c:213:24: error: ‘tmp0’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
> ../../../target/rx/op_helper.c: In function ‘helper_suntil’:
> ../../../target/rx/op_helper.c:299:23: error: ‘tmp’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>    299 |     env->psw_c = (tmp <= env->regs[2]);
>        |                  ~~~~~^~~~~~~~~~~~~~~~
> ../../../target/rx/op_helper.c: In function ‘helper_swhile’:
> ../../../target/rx/op_helper.c:318:23: error: ‘tmp’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>    318 |     env->psw_c = (tmp <= env->regs[2]);
>        |                  ~~~~~^~~~~~~~~~~~~~~~
> 
> Rewriting the code fixes those errors.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> Those error are false positives, but simple code changes help the
> compiler (and perhaps reviewers) to understand it better.
> 
> Stefan

Reviewed-by: Thomas Huth <thuth@redhat.com>


