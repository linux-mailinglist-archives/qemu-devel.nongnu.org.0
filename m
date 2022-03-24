Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 011A64E5FBF
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 08:53:11 +0100 (CET)
Received: from localhost ([::1]:38692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXIHN-0000jE-R4
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 03:53:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nXIG1-0008Rv-0Z
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 03:51:45 -0400
Received: from [2a00:1450:4864:20::62f] (port=39592
 helo=mail-ej1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nXIFz-00059N-7r
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 03:51:44 -0400
Received: by mail-ej1-x62f.google.com with SMTP id dr20so7435198ejc.6
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 00:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=annc3LSp2Q/G+r/+vY4p/As7b7Ld/8n0njtydbWVlOw=;
 b=f16zKTMsQKgmyPSxissKCHHZ/ycRBciYBhS3HCiXAyPgxTfbXCPx66B7CKB40e0qYh
 u0nfH2zmywWmNSjtQ7XhzIqrEChnVDdiP1lYP/QBAQ/I4DrDCEgKJaQ84lls3L96RTYz
 fy+nt2fEsWv+RP0vgTt7kpp2prbpmzg/cD8vwYOo4qgF8Wn68vzSJehKzeX9RGw+ZEF6
 2M+i8CNbk86AyFoHmlwNctM50WygvlJ4jxF/O0RIPKskO4L/HIR7jpRgEWEGPW9UMqvK
 n1hYAM2mTegLvbLd0nd21JcemCBe8CEKV8KkOYnr5SwzoTH2eFUYYMxLvrulfhcoFPnj
 OA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=annc3LSp2Q/G+r/+vY4p/As7b7Ld/8n0njtydbWVlOw=;
 b=DsNqY65ZTeGYPY4EBO26b7ScDbYthhdfykRlIL4vfPVmXDjrEisqUNiR0Zk1ZAQ/IE
 M2vxJ682nWBJv3E0DmhnriKmdjGxOCmM84iTV7RyM14mXf9E1UCByxwKEhbK1rGLFrva
 oNeTOAsxtrh4CVgk1hA8gjbUTzEd1CqR3feymEhvYQo2DpCcWFwfsLwrdKXZZXFm8Y4N
 AkbJ8XrFSIz+YFD/lAM5IP3bsGgyNiGvvIcdTSVL7OxJB/ugeZK+BC72Pd3O3duXfhn5
 wOWbTJWRYe3W1qPTWmg431fgeSdoISiuh8GczkH/nK9SrnvzJTjvW1Acw2R6CsvWgUfP
 Lo7w==
X-Gm-Message-State: AOAM531eWwG72/1fiPDPV7tNz2m9VPXvF+oLapQ5DSD94i6T6UP0a0iL
 O23SoEABgxdvT1mjGgZvPbw=
X-Google-Smtp-Source: ABdhPJzn2n/ffXhwa0dtGVRYUrvyI6LrHWWHwJKW9VtERGX6/aVPo3OysM+PHwV4hUbUgT+GB86pWQ==
X-Received: by 2002:a17:906:3583:b0:6d1:c07:fac0 with SMTP id
 o3-20020a170906358300b006d10c07fac0mr4253343ejb.749.1648108300579; 
 Thu, 24 Mar 2022 00:51:40 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 d7-20020a50cd47000000b004187eacb4d6sm1056835edj.37.2022.03.24.00.51.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 00:51:40 -0700 (PDT)
Message-ID: <a5f8ae01-d1e2-2a99-e9ca-d0e5414f8674@redhat.com>
Date: Thu, 24 Mar 2022 08:51:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 31/32] RFC: Simplify softmmu/main.c
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
 <20220323155743.1585078-32-marcandre.lureau@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220323155743.1585078-32-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/22 16:57, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau<marcandre.lureau@redhat.com>
> 
> Move qemu_main() declaration to a new header.
> 
> Simplify main.c since both cocoa & sdl cannot be enabled together.
> 
> (there might be some small conflict with the RFC patch "cocoa: run qemu_init
> in the main thread", but the two look like they could be used together
> to improve the code)

That patch enables cocoa and SDL to be in the same binary, so I think 
this one (while a good idea in theory) should be the one that loses.

Akihiko has ideas on how to use the standard main() for Cocoa, by 
turning qemu_main_loop() into a function pointer, like

-void qemu_main_loop()
+static void (*qemu_main_loop)(void) = qemu_default_main_loop;
+void qemu_default_main_loop()
  {
      ...
  }

and cocoa_display_init() would do "qemu_main_loop = qemu_cocoa_main_loop;".

Paolo

