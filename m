Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E42A245C538
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 14:53:22 +0100 (CET)
Received: from localhost ([::1]:51326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpsiA-0006N0-0w
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 08:53:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpsPB-0003lU-EB
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 08:33:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpsP9-00015K-Nr
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 08:33:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637760823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jj+UvSnQawD6jxJLdjFESLaNnrqbZBymd/lImBbFy7I=;
 b=DcM7OGXaxsQ9eVzUTIxQEZmN0P3p2pH8M5uwSEvDfOTTfcG5QJ0su3qOW2QzNYQAmggfur
 mlGCaG1tDDWhj+4wCsG3D7oYu1qt5hHGWA1TlDr52Wix2XbyWTqropottJayULXG8NFApE
 3SAfNg3O68pTHgwehyVjAvrMDSowhfo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-0qoytKwWPgOeIdc7S2fYCw-1; Wed, 24 Nov 2021 08:33:41 -0500
X-MC-Unique: 0qoytKwWPgOeIdc7S2fYCw-1
Received: by mail-wr1-f70.google.com with SMTP id
 q15-20020adfbb8f000000b00191d3d89d09so500953wrg.3
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 05:33:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jj+UvSnQawD6jxJLdjFESLaNnrqbZBymd/lImBbFy7I=;
 b=xVWD9BoIx9aUEPC7oKwjTE5TFXcHjYMihIY+6UHkJLEYblujgTxB210Lb++Txf3krQ
 9c9Q9UhWnzBw+9aJDzI/d/fn4iXFw/H/pS56E+HJPXqc6E+Q9kgG5n+QgK3LHrc5dMU+
 E+9GMqFT3dZjWT2s4bMhlxstzvoF/mYSco1xtBUA6IR6usdCX3QiFoRbyw2njzTpqAbx
 BE84FRb+/eK8yjHSCOsU2+5WyL3stcXwNetH7WCYXQeeWEONBFooIkX2+9+qAkGkaOw8
 jNpDKsd9ol6gfbI6jNr3hN3iGSAPf8CA5uSezJfDDqab6DjPVQC1ni6Oqg0r8M11Kpbm
 bOKw==
X-Gm-Message-State: AOAM533IlizqcFDK+jbm4M3P5KUZynPiBlS2H1zfyoVpUZOKfF4lJ2j8
 x0K7h+RAA3wbSQWvR0zhZDZPvZIuPVpvIIsgjjtS3kE4nJBwI+kzaScez8pHOg3gxt5hZaFUXC6
 kBphP0wKq8XqHPHM=
X-Received: by 2002:a05:600c:1f0e:: with SMTP id
 bd14mr15203253wmb.3.1637760820768; 
 Wed, 24 Nov 2021 05:33:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzh8TtnE82XWK0lSlkNg0wRD7B169EjlDIEu9hiNjN5itKM5qAL1y1AZVcYj+Z4qfg1xxybrg==
X-Received: by 2002:a05:600c:1f0e:: with SMTP id
 bd14mr15203207wmb.3.1637760820532; 
 Wed, 24 Nov 2021 05:33:40 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id d7sm14654120wrw.87.2021.11.24.05.33.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 05:33:39 -0800 (PST)
Message-ID: <f3ca85e6-822d-1004-3875-4d3dbeb16855@redhat.com>
Date: Wed, 24 Nov 2021 14:33:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 01/18] ui: avoid compiler warnings from unused
 clipboard info variable
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211124130150.268230-1-berrange@redhat.com>
 <20211124130150.268230-2-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211124130150.268230-2-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/21 14:01, Daniel P. Berrangé wrote:
> With latest clang 13.0.0 we get
> 
> ../ui/clipboard.c:47:34: error: variable 'old' set but not used [-Werror,-Wunused-but-set-variable]
>     g_autoptr(QemuClipboardInfo) old = NULL;
>                                  ^
> 
> The compiler can't tell that we only declared this variable in
> order to get the side effect of free'ing it when out of scope.
> 
> This pattern is a little dubious for a use of g_autoptr, so
> rewrite the code to avoid it.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  ui/clipboard.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>


