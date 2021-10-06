Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB4A423CD3
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 13:27:28 +0200 (CEST)
Received: from localhost ([::1]:53364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY553-0006Qx-FF
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 07:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mY4t4-0003rF-F3
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 07:15:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mY4t2-0000AO-Mf
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 07:15:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633518898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1acbiovsXoYipIP+UdDnvSlo50E0wKS39+7+mKrvEs8=;
 b=GEZSxpoPGl8h1RXN/UutxXcWGRvUg2TN4uegaYNm63yskat8OCkBiu/6k09FRJAyCve70T
 QX6V15nww2WzcpT76sPCayQCjkyBjDQjeIjr/AGqfGp1AroqlefGb++QZsB00F5CAQkLj/
 UtIfKbQjjUoJN0KgkJb9a580gWFM3FU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-O658mJ3ROSO1auhI8aBoUQ-1; Wed, 06 Oct 2021 07:14:54 -0400
X-MC-Unique: O658mJ3ROSO1auhI8aBoUQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 m17-20020adffa11000000b00160c1ac74e9so1734674wrr.9
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 04:14:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1acbiovsXoYipIP+UdDnvSlo50E0wKS39+7+mKrvEs8=;
 b=wJwtRQuo/uRPNfyXD1uekpeRbTC4hfAhh2eFyScZdCWn5jsKB4aJT0y5iB8PN+MrFP
 4Kfv2rOfKaKVsfcky0Kx+EoCA6WpOHLmqmEOkZBmAoFITbFpCkdCjY/ZXAFj1zKU3lqm
 x032c6VXqFH6M9k8D7a0i8XWSfDj/zhvjajVpeLyWzD76qteQSAfKp7EPivQoxM9eQvR
 d/5xRF5cO9D2kqbUm/qLlB7hxZKoM2AlNFufj+kaHVOAw1njVEMp8ZbHv2QZq3aREdTA
 pHN7EY5q9v7QT42enJ/5bHZrvDp0f3fHSQLkNf0zGVvZKakaGHLVS1q5xBiYHb+BdcF3
 DkHw==
X-Gm-Message-State: AOAM533XVRZO/EqvuTyFbYUr9joVR7TxkNxZFP5SGVwGou5w7Tvu5dQ9
 AMSONYdXcmhlmIGFcHpjg5VGwi/hnvyLhZrpcPNBUdGZTxzvc9jFB5QnuyXajphDaQLoXVeaS2o
 KqN98qX1v9gH6c18=
X-Received: by 2002:a05:6000:144e:: with SMTP id
 v14mr28427236wrx.228.1633518893588; 
 Wed, 06 Oct 2021 04:14:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8nhso9rhqOyDG/EEWNUKYbE5HprNmEolCaFOoSv9pHDqexcJtc5YAtarmA6uGN+fYRaF10Q==
X-Received: by 2002:a05:6000:144e:: with SMTP id
 v14mr28427214wrx.228.1633518893362; 
 Wed, 06 Oct 2021 04:14:53 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id l17sm20675283wrx.24.2021.10.06.04.14.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 04:14:53 -0700 (PDT)
Message-ID: <467c7659-e4e2-77f4-b8f2-4864c81ea6e8@redhat.com>
Date: Wed, 6 Oct 2021 13:14:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/2] tests: add missing dependency for check-block
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211006093804.453503-1-pbonzini@redhat.com>
 <20211006093842.453750-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211006093842.453750-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/6/21 11:38, Paolo Bonzini wrote:
> qemu-iotests run qemu-storage-daemon, make sure it is up to date.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  tests/Makefile.include | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 7426522bbe..b42fd06462 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -152,6 +152,7 @@ QEMU_IOTESTS_HELPERS-$(CONFIG_LINUX) = tests/qemu-iotests/socket_scm_helper$(EXE
>  check: check-block
>  export PYTHON
>  check-block: $(SRC_PATH)/tests/check-block.sh qemu-img$(EXESUF) \
> +		storage-daemon/qemu-storage-daemon$(EXESUF) \

Finally, thanks.
https://www.mail-archive.com/qemu-devel@nongnu.org/msg747467.html

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


