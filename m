Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A74428DBF
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 15:24:04 +0200 (CEST)
Received: from localhost ([::1]:57802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZvHf-0003vG-CG
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 09:24:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mZvGC-00029b-44
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 09:22:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mZvG8-0003Ug-HQ
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 09:22:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633958547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NFTeAPvElxoORER5gQ2xaQahZvc/A7qaREe6Qtw8U0w=;
 b=ceSNTGE9vr2iQ7UaCKLcCMWTTwjsMSfwJ6+tA3kCjRj+Vwo+qNFOtZRkay5kcTCiwq82su
 KaxgdGfu9dRU+vnCf8JR7wumX5abAmt9cz1g0vPEzkXyBByf7xaDZ2PhFGhfD7Dn1XrcRl
 IjhwDcWtrqL1cBQ17VYv9+FCvqmIKoU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-HA8heTjEMz-cxHYW-pBbIQ-1; Mon, 11 Oct 2021 09:22:26 -0400
X-MC-Unique: HA8heTjEMz-cxHYW-pBbIQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 41-20020adf802c000000b00161123698e0so1423828wrk.12
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 06:22:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NFTeAPvElxoORER5gQ2xaQahZvc/A7qaREe6Qtw8U0w=;
 b=XS7tlLWRWzx6uKpEnynHgruJfP6jNNtO2E3S7aK5Lozf+y/ULTEN+PTtTaVt4sMpyh
 5zhHRWqu1XV7pT4nPxvc9f9R0NECIz1dLlXX8NuyYSP/RJ4myaJMsCRdf9rD41j0wCWv
 AkWuaEq0H7Bq9w++77ZyIFm63ND4lXG5h2ALpxWpKB9c3QcEallz31JLumbWSN0FENrH
 5dL39pCl3lFXZXGdIfLF8NMm/s9VUTvE7ZN/He9I1ywGXGnoAXDQ4O+Wn4WJOJJ2IrRx
 q9Yt4pO7sgWBUT1s5h5cU0el+m0lvOOVvP1MS/7oid/wwGSD9mVNVufOADXhYQeLHVrc
 T0Tw==
X-Gm-Message-State: AOAM532uD63Ha1DOlLn//B77/UERWcxkQP+ytikwtAlHp2R2czjDfYIm
 wUc5k9Zwu6RIGyvskEwu9RuAl0AouKBjDEzn4XUO2teFiF2Nz/RbdOlT+0a5b5g7r9ejZcHUKq4
 +qGauKy4xXRWM6t4=
X-Received: by 2002:a5d:648f:: with SMTP id o15mr24883919wri.3.1633958545707; 
 Mon, 11 Oct 2021 06:22:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhZHh5GXzjjI4SCNLqAKq13sR7AiWDcJ0W+KL7Jiuu7M3QM+TKBjIzp3sn9+RiA1UJlPRlXw==
X-Received: by 2002:a5d:648f:: with SMTP id o15mr24883895wri.3.1633958545531; 
 Mon, 11 Oct 2021 06:22:25 -0700 (PDT)
Received: from [192.168.3.103] ([94.228.4.120])
 by smtp.gmail.com with ESMTPSA id o23sm7912116wms.18.2021.10.11.06.22.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 06:22:25 -0700 (PDT)
Message-ID: <f25a7d3a-cc47-fc18-9c79-c80d4a300ff9@redhat.com>
Date: Mon, 11 Oct 2021 15:22:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] tests/acceptance: Add tests for the ppc405 boards
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20211011125930.750217-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211011125930.750217-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, qemu-ppc@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/11/21 14:59, Thomas Huth wrote:
> Using the U-Boot firmware, we can check that at least the serial console
> of the ppc405 boards is still usable.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Based-on: 20211006071140.565952-1-thuth@redhat.com
> 
>  tests/acceptance/ppc_405.py | 40 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 tests/acceptance/ppc_405.py

> +    def test_ppc_taihu(self):
> +        """
> +        :avocado: tags=arch:ppc
> +        :avocado: tags=machine:taihu

Please consider adding:

  tags=cpu:405ep

> +        """
> +        self.do_test_ppc405()
> +
> +    def test_ppc_ref405ep(self):
> +        """
> +        :avocado: tags=arch:ppc
> +        :avocado: tags=machine:ref405ep
> +        """
> +        self.do_test_ppc405()
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>


