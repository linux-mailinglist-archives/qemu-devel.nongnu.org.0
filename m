Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F103BE9D0
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 16:33:35 +0200 (CEST)
Received: from localhost ([::1]:46480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m18cI-0004IC-Ft
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 10:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m18bS-00039B-3D
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 10:32:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m18bP-0003QN-Rm
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 10:32:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625668358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DBmjbrSzELJR8NDLVE3+kuvAOxmxUQVtEgZzxw6QNT8=;
 b=ESImycdB5RHi8V7gdlegrSw22fGL4ViaWy2vxwtSjZyU96X3TKZPiqNECAnV2Nu6VAp8DE
 TfEp+U4cJLy8+KRspTO19q+MYw+2DR9XVg9moJVCfahWn3p55ofb25ce6PA9hzk7b/m/RJ
 niW1PBSutaW4hOziblfOlF+svG5UckA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-I-_SfMdtOLC7W9uwfpx6aQ-1; Wed, 07 Jul 2021 10:32:37 -0400
X-MC-Unique: I-_SfMdtOLC7W9uwfpx6aQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 z6-20020a5d4c860000b029013a10564614so520000wrs.15
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 07:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DBmjbrSzELJR8NDLVE3+kuvAOxmxUQVtEgZzxw6QNT8=;
 b=LP+1zpV3x276Gf2m9pMjq/6Yp4E69x2LvbdBoc30pTR9/75jQncKjSE/+ZakUTSU2o
 gvQeVxHCyyMuLUO9CjBEbBa8a5MthkD78xn7LR6jPOAojrBQAwtniH66BrussjRhW3Tt
 MKCTzvOijAEFvE2sxRmr2LiYp+cTrdzG8LQwMKKscuJ5XimWue3s2hezVvjZ01oyM6aN
 se4gUzXq87FVsmsg5gOOpTzp5bZkXECPniemh+AbAijKQ7btCxdWbtt3diDTcQdX/2Zw
 yriIHT0YBYK+qNT7e0qWG8X/RUHsLv/pEUs47UQ0TfFsx63tXiqAAmWjQJHKeL/4from
 gy2w==
X-Gm-Message-State: AOAM531teyt56qJOHKftVeiRbyjJRUSlQTq4rdCuBWVEMGNWzgBzPwwM
 hbdkjj96fX0+cHP3O8hICQIodCDdttdBLsCwYu6x1Tm+EQtuIuqFXwQ1tpK0qDXprp+mVuJ72AQ
 yiMtb/daJe3zUO7KblIykupqSD+1C0EZfmJKdQfQcg4UI3hf4oGqnHGDaB2I8nB9EK3o=
X-Received: by 2002:a05:6000:1048:: with SMTP id
 c8mr9236059wrx.202.1625668355787; 
 Wed, 07 Jul 2021 07:32:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIxy0x3j9J1DjaDrIUjdzXcdiVfqSpuLw4NDFshwJ/u1E4aTkN0DreKFIckSSti7SNJhaDKA==
X-Received: by 2002:a05:6000:1048:: with SMTP id
 c8mr9236039wrx.202.1625668355566; 
 Wed, 07 Jul 2021 07:32:35 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id w3sm6500325wmi.24.2021.07.07.07.32.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 07:32:34 -0700 (PDT)
Subject: Re: pipe2 & configure script
To: Richard Zak <richard.j.zak@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAOakUfMKduLQe=juj-sZzVSkD-bSi48-k7SNiKkDKE-fTaiQ+A@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1317d8b6-4233-d239-9b51-3a525e23a8a8@redhat.com>
Date: Wed, 7 Jul 2021 16:32:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAOakUfMKduLQe=juj-sZzVSkD-bSi48-k7SNiKkDKE-fTaiQ+A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/07/21 05:24, Richard Zak wrote:
> What conditions are required for "#define CONFIG_PIPE2" to be set in 
> build/config-host.h? It prevents building for Haiku as pipe2() doesn't 
> exist. I didn't see anything in the configure script regarding pipe2. I 
> also updated my code to the latest in the repository and this issue just 
> popped up.

Does this help?

diff --git a/meson.build b/meson.build
index 660e294b7e..32d5bd3685 100644
--- a/meson.build
+++ b/meson.build
@@ -1339,7 +1339,7 @@ config_host_data.set('HAVE_STRUCT_STAT_ST_ATIM',
  config_host_data.set('CONFIG_EVENTFD', cc.compiles('''
    #include <sys/eventfd.h>
    int main(void) { return eventfd(0, EFD_NONBLOCK | EFD_CLOEXEC); }'''))
-config_host_data.set('CONFIG_FDATASYNC', cc.compiles(gnu_source_prefix + '''
+config_host_data.set('CONFIG_FDATASYNC', cc.links(gnu_source_prefix + '''
    #include <unistd.h>
    int main(void) {
    #if defined(_POSIX_SYNCHRONIZED_IO) && _POSIX_SYNCHRONIZED_IO > 0
@@ -1356,14 +1356,14 @@ config_host_data.set('CONFIG_MADVISE', cc.compiles(gnu_source_prefix + '''
  config_host_data.set('CONFIG_MEMFD', cc.compiles(gnu_source_prefix + '''
    #include <sys/mman.h>
    int main(void) { return memfd_create("foo", MFD_ALLOW_SEALING); }'''))
-config_host_data.set('CONFIG_OPEN_BY_HANDLE', cc.compiles(gnu_source_prefix + '''
+config_host_data.set('CONFIG_OPEN_BY_HANDLE', cc.links(gnu_source_prefix + '''
    #include <fcntl.h>
    #if !defined(AT_EMPTY_PATH)
    # error missing definition
    #else
    int main(void) { struct file_handle fh; return open_by_handle_at(0, &fh, 0); }
    #endif'''))
-config_host_data.set('CONFIG_PIPE2', cc.compiles(gnu_source_prefix + '''
+config_host_data.set('CONFIG_PIPE2', cc.links(gnu_source_prefix + '''
    #include <unistd.h>
    #include <fcntl.h>

?

Paolo


