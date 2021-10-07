Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 401794254C9
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 15:52:25 +0200 (CEST)
Received: from localhost ([::1]:48610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYTou-0002s3-9j
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 09:52:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYTlA-0000C6-I3
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:48:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYTl8-0005VD-Fr
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:48:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633614509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mGvyvDl0KeHeIhqeC23e6PYlg+K5X3Y7I4VBhAFiOW4=;
 b=YaB6gWeOtgE9gf+gv10cUlacMviEikVXw68wf+0VN6cvnUb+kXXTbG6VAIjO59dGzIeE6B
 9bmhiQxRgYhOuPouQwwJF0fpIrpR50XJ1U+yYPy/DZGf0C1k7l0ECD7cz07iMGt1AcNY0+
 Av9LrZZKR/BORtozldMuPaVibBlsx7c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-uGncY2gFO1unSvw4IIJgJw-1; Thu, 07 Oct 2021 09:48:27 -0400
X-MC-Unique: uGncY2gFO1unSvw4IIJgJw-1
Received: by mail-wr1-f70.google.com with SMTP id
 h11-20020adfa4cb000000b00160c791a550so4564469wrb.6
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 06:48:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mGvyvDl0KeHeIhqeC23e6PYlg+K5X3Y7I4VBhAFiOW4=;
 b=dERBIUzn3PaXNKp8ypkv3RbSS8nb1S5BW6OxufpQSWcupFPBHaIJV/qUftMAZhAorb
 Z8gM/gqOvRddt6+Wy+kln80ejKZBfh3tRYKmkkmKEoQ1WqnanDGhwwMEFaBFqBCMX9CZ
 AJtNXkjd2IL6j8PPskhC8i2Bx5s0B03b3tdE/4VLUvnpn/sOhYI0Y1GiRQNjpKXaxbhd
 Fskfvrexgb9NRbnG2/a9akQktg7PyefMB1OUMoJ65NPNhd6uh6oDXo8GzKNQpVRIqDsk
 BIYDaOcK8bYIE1qafULEIWWalsa3SerZ1LMKTSxWNYhwPqO9lFtfTFxPZ0kf5uBHl/0W
 bndg==
X-Gm-Message-State: AOAM532pNEWYcKwVHdVsx6G844HcvtRPeq3ktGgBzLiaPfo2LrNdKPAf
 hqQ05ixwvZlIE1L7FdYj49pq9G7CegvoiL9oR0VHxYYxN2YzO9W6xOHTTym4MMwAdSPo2jqO46D
 2SlI93N86akwJCyo=
X-Received: by 2002:adf:b34c:: with SMTP id k12mr5473364wrd.1.1633614506433;
 Thu, 07 Oct 2021 06:48:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxKSv30r2c8OSAFnuskUTOyvNea6QDs/11xOXdZyr3iqyBTSq71nX0t0O7hOkOanzZQMgttA==
X-Received: by 2002:adf:b34c:: with SMTP id k12mr5473343wrd.1.1633614506256;
 Thu, 07 Oct 2021 06:48:26 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id a17sm1890125wrx.33.2021.10.07.06.48.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 06:48:25 -0700 (PDT)
Message-ID: <38e51f4b-5d9e-1606-314d-6ea196019f87@redhat.com>
Date: Thu, 7 Oct 2021 15:48:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 06/24] kconfig: split CONFIG_SPARSE_MEM from fuzzing
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211007130630.632028-1-pbonzini@redhat.com>
 <20211007130829.632254-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211007130829.632254-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
Cc: Alexander Oleinik <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/7/21 15:08, Paolo Bonzini wrote:
> Pass CONFIG_FUZZ via host_kconfig, and use it to select the
> sparse-mem device.
> 
> Cc: Alexander Oleinik <alxndr@bu.edu>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  Kconfig.host       | 4 ++++
>  hw/mem/Kconfig     | 3 +++
>  hw/mem/meson.build | 2 +-
>  meson.build        | 1 +
>  4 files changed, 9 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


