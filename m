Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 077522E8387
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jan 2021 12:04:23 +0100 (CET)
Received: from localhost ([::1]:57758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvIEH-0004Wq-K0
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 06:04:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kvICb-00046B-LW
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 06:02:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kvICY-0006WY-8h
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 06:02:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609498952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=36vFh3DPWCLjOngj3F20NKettC+QADXj/9i9/JDn6EU=;
 b=EyOGem0L8wBmYJOffXaEeOkytNoovIYx1XPh099+KhZb7eNDrSbyxUhDjhu5vst8Q9ilIz
 7WTc+P6E4EDkWTV/Gs26ZmZDpu4oHQt5UiFuTlldJkYSna8nzBGT2ZP3h/K9k+OF/ILbaF
 JofWRenlFEXUOrdNEs4HtYuQ0hz6/GE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-VcjUXkjrPj2aX3fXUvgSow-1; Fri, 01 Jan 2021 06:02:29 -0500
X-MC-Unique: VcjUXkjrPj2aX3fXUvgSow-1
Received: by mail-wr1-f71.google.com with SMTP id w5so10200883wrl.9
 for <qemu-devel@nongnu.org>; Fri, 01 Jan 2021 03:02:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=36vFh3DPWCLjOngj3F20NKettC+QADXj/9i9/JDn6EU=;
 b=dKogtN0DhSbCm9YTW0xY7//Ki9s5drrqfzb4vr3oWXSybIgxMVk7tIRjwDNdIgghrs
 iLli5sXm1pIuaSqkfZ99wBwZVkci0qlo4NK5U7o/pzfBRyWGltu7uE6Ib/AQax2pYeAi
 NbdOOp4jAK90cF8u7Zp5o6rmybcIYl8ZRpX40u6eyXa6u3QvAvDkSVryOHjWlx/crux4
 uO7buyBr9V1LmaKCb0Iu9aUERqsflrlEIdLtzxVt0xBxyQRWM+S5m9ffUsDMR4nQ38Lb
 +jjLEEpc3O1r4KW78fzE/gkJ+GDHTfiuN9Hs3bUpax0gICQ9X7NUINNK69iszix1Ha0p
 uB8A==
X-Gm-Message-State: AOAM532KbBiONe60wDEtmjsE8ZBfVuLLzbCFpsx5JVEuuVhXjoM9nihr
 7EVRkpkJrp8677k13lfYZ5/m6+rFinE5SZxBgRmxvPD0V+kmoTAEqvVay2Niz4qg3fwza4hi/oN
 K8PzUyvl9L3jf8i8=
X-Received: by 2002:adf:97ce:: with SMTP id t14mr68375741wrb.368.1609498948208; 
 Fri, 01 Jan 2021 03:02:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLfpKuYsSVdAyBOjoSdtEF58z5PgMVNpyb4B40sBA4Rm9Rk1kjUwL9Hq3a4xu7z9s4ENKHBg==
X-Received: by 2002:adf:97ce:: with SMTP id t14mr68375727wrb.368.1609498948043; 
 Fri, 01 Jan 2021 03:02:28 -0800 (PST)
Received: from [192.168.1.34] (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id c16sm52400991wrx.51.2021.01.01.03.02.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Jan 2021 03:02:27 -0800 (PST)
Subject: Re: [PATCH v2] meson: fix ncurses detection on macOS
To: Chris Hofstaedtler <chris@hofstaedtler.name>, qemu-devel@nongnu.org
References: <20201230221727.60579-1-chris@hofstaedtler.name>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <66ee4218-1641-5fc7-8a88-818722255f49@redhat.com>
Date: Fri, 1 Jan 2021 12:02:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201230221727.60579-1-chris@hofstaedtler.name>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.399, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>,
 Samuel Thibault <samuel.thibault@gnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/30/20 11:17 PM, Chris Hofstaedtler wrote:
> Without this, meson fails with "curses package not usable" when using ncurses
> 6.2. Apparently the wide functions (addwstr, etc) are hidden behind the extra
> define, and meson does not define it at that detection stage.
> 
> Regression from b01a4fd3bd7d6f2 ("configure: Define NCURSES_WIDECHAR if we're
> using curses"). The meson conversion has seen many iterations of the curses
> check, so pinpointing the exact commit breaking this is not so easy.
> 
> Signed-off-by: Chris Hofstaedtler <chris@hofstaedtler.name>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> Cc: Samuel Thibault <samuel.thibault@gnu.org>
> Cc: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  meson.build | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Suggested-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


