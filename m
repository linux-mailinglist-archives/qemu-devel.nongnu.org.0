Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F492FFF6A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 10:44:59 +0100 (CET)
Received: from localhost ([::1]:56884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2szy-0002LM-UA
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 04:44:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2syo-0001V7-16
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 04:43:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2syk-0003as-Af
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 04:43:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611308620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zzIg7XkdCtSn4i3Rl8dAI+7MJVESbrhboMIpQddrZgA=;
 b=N2KAHIM0FXf6NMzhdcQame4pknUN55TdFr6MZvba4+P4w6yL5wCMbdY6GmfJwxnXv+KJcx
 nhbvtThMOzw/sNGHNN7uEPTGHPQmGMwKzTlyjy9W4fTmJRBFcLG8/qPQgdEqmSAFLR25C6
 ZCW3RVvyDL2qE55ZAxj3YxxSZFm0GEM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-RxL9SdhqObSTX0inRtv0fA-1; Fri, 22 Jan 2021 04:43:38 -0500
X-MC-Unique: RxL9SdhqObSTX0inRtv0fA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 175D4806665;
 Fri, 22 Jan 2021 09:43:37 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-109.ams2.redhat.com [10.36.112.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C68E5DA34;
 Fri, 22 Jan 2021 09:43:28 +0000 (UTC)
Subject: Re: [PATCH 2/2] meson: Warn when TCI is selected but TCG backend is
 available
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210122092205.1855659-1-philmd@redhat.com>
 <20210122092205.1855659-3-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b661e53c-8c3a-ae19-0250-400d9977dc76@redhat.com>
Date: Fri, 22 Jan 2021 10:43:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210122092205.1855659-3-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
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
Cc: Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/01/2021 10.22, Philippe Mathieu-Daudé wrote:
> Some new users get confused with 'TCG' and 'TCI', and enable TCI
> support expecting to enable TCG.
> 
> Emit a warning when native TCG backend is available on the
> host architecture, mentioning this is a suboptimal configuration.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   meson.build | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/meson.build b/meson.build
> index 0a645e54662..7aa52d306c6 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -234,6 +234,9 @@
>         error('Unsupported CPU @0@, try --enable-tcg-interpreter'.format(cpu))
>       endif
>     endif
> +  if 'CONFIG_TCG_INTERPRETER' in config_host and cpu in supported_cpus
> +    warning('Experimental TCI requested while native TCG is available on @0@, suboptimal performance expected'.format(cpu))
> +  endif
>     accelerators += 'CONFIG_TCG'
>     config_host += { 'CONFIG_TCG': 'y' }
>   endif
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>

... maybe you could also add some wording to the help text of the configure 
script? Or maybe we could simply rename the "--enable-tcg-interpreter" 
option into "--enable-tci" to avoid confusion with the normal TCG ?



