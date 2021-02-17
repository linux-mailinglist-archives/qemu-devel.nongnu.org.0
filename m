Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE9831DD7D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 17:40:44 +0100 (CET)
Received: from localhost ([::1]:36214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCPsZ-0004Uo-E2
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 11:40:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lCPqR-0003U6-3b
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 11:38:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lCPqP-0008RY-DB
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 11:38:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613579908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BSRAktRpY6cAhZwnbbacT43c0Sqn4Kk/sgKpoANAFdE=;
 b=ZqdVg47qQyfRifOF4DDml6mBybg+nI6IZ3rdpf7CYnlGbe+iK06uP+Wqx3En/dE4EpR9LZ
 w4+KOwMFs7E6Lqas4h1lBFbV/0oE8XQD4AH84U8zDdmP9JrDuWHyW2qDsAf6KhhCWzStQq
 ByILbPVw+zeAGeDPtUb4YeqBD8+1xTk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-70zEhrGEOZiShU4ZXlOOGQ-1; Wed, 17 Feb 2021 11:38:26 -0500
X-MC-Unique: 70zEhrGEOZiShU4ZXlOOGQ-1
Received: by mail-wm1-f71.google.com with SMTP id c125so2224720wmf.9
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 08:38:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BSRAktRpY6cAhZwnbbacT43c0Sqn4Kk/sgKpoANAFdE=;
 b=K/CBCdbQJZqsr2AWEg4P1APMWlJYOMTG8oh76M+FhVFaLvaE1VDRkK6qJ1rQG7oTCJ
 79gAKIP598JeQWmj8iXY5XCUT7q+fxcVusmolHRcpZVS0m8Yan403m0anrLcYkp7Ozlz
 qd9u9VwMCZhuQFRfVkPYnQJTh4gA2JDuWZsgVCqNS9OJ/x/t7bmyPYt5lbNIhDmQSYdJ
 RZL1pwnJC/YY4M60wq4yzJ3tTrBpDZ9qVFA7Z+4NX9aBJZZWPejItgxo/r3ZCzAolSNP
 jST0vkS/gV7ncTyONS4YOwYKuhjlhy0uUYD6ccA3Tic9KDeyQ3R4VNgQEjrHTPHE7Igc
 +8iw==
X-Gm-Message-State: AOAM531ahjrhQfedRG0TBrPITu6vMOoUR57ka9Pi5AIkSEAAZSJ33ki+
 4UQaj51aKAIGYFwkPweaboDxJ2ODJpCRq+XLF4bQcHbTVSvDgyNLQnavCQ3r/vvDjShv1hapFIi
 CpROt9TjUZvpkbGY=
X-Received: by 2002:a1c:f417:: with SMTP id z23mr7724649wma.29.1613579904728; 
 Wed, 17 Feb 2021 08:38:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzEYRNubezJwpVY0o6IdYked35eNfJNk7Me7X3tG5usuUPKMhiCxQkbqwS2MstKg1w9TftajA==
X-Received: by 2002:a1c:f417:: with SMTP id z23mr7724524wma.29.1613579902309; 
 Wed, 17 Feb 2021 08:38:22 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id j23sm3408634wmo.18.2021.02.17.08.38.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Feb 2021 08:38:21 -0800 (PST)
Subject: Re: [PATCH 01/10] gdbstub: use preferred boolean option syntax
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210216191027.595031-1-berrange@redhat.com>
 <20210216191027.595031-2-berrange@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8885e017-a699-62f0-3824-fcc1a79bb10a@redhat.com>
Date: Wed, 17 Feb 2021 17:38:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210216191027.595031-2-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/02/21 20:10, Daniel P. Berrangé wrote:
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   gdbstub.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index 759bb00bcf..3ee40479b6 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -3505,7 +3505,7 @@ int gdbserver_start(const char *device)
>           if (strstart(device, "tcp:", NULL)) {
>               /* enforce required TCP attributes */
>               snprintf(gdbstub_device_name, sizeof(gdbstub_device_name),
> -                     "%s,nowait,nodelay,server", device);
> +                     "%s,wait=off,delay=off,server=on", device);

Uff, this is ugly... The option should have been named nodelay (for 
TCP_NDELAY) but it was inverted to make "nodelay" work.  Should we do 
something like

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 9061981f6d..cb80af8d67 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -1469,8 +1469,8 @@ static void qemu_chr_parse_socket(QemuOpts *opts, 
ChardevBackend *backend,
      sock = backend->u.socket.data = g_new0(ChardevSocket, 1);
      qemu_chr_parse_common(opts, qapi_ChardevSocket_base(sock));

-    sock->has_nodelay = qemu_opt_get(opts, "delay");
-    sock->nodelay = !qemu_opt_get_bool(opts, "delay", true);
+    sock->has_nodelay = qemu_opt_get(opts, "delay") || 
qemu_opt_get(opts, "nodelay");
+    sock->nodelay = !qemu_opt_get_bool(opts, "delay", true) || 
qemu_opt_get_bool(opts, "nodelay", false);
      /*
       * We have different default to QMP for 'server', hence
       * we can't just check for existence of 'server'


?

Paolo

>               device = gdbstub_device_name;
>           }
>   #ifndef _WIN32
> 


