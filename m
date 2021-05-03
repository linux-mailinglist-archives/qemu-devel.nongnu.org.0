Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBB7371652
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 15:58:06 +0200 (CEST)
Received: from localhost ([::1]:59814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldZ5J-0000Fl-Ah
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 09:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldZ2w-0007BY-9x
 for qemu-devel@nongnu.org; Mon, 03 May 2021 09:55:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldZ2u-0008Hb-BA
 for qemu-devel@nongnu.org; Mon, 03 May 2021 09:55:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620050135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A8mWdKbgJ/CAsWk21BKv8qEbHVmWDmS/BNnnCG4Ppt8=;
 b=gb52fYlG3z2vsLLxliK1SUn2aJV3ianQEdUBcuU7mtzxruLHhqkWJxOSLcAXZtx8wocVjy
 3ZewZLhmaSiigBymqXHFDUKdSpiTwE1xV9VGd3cNE7xCrchVyMS3Kb7XDhLrX+6lzhjqZR
 Yf64kcvJd1OgfuU0+O85n27HxNB9voE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-DPWmvKljM8auOyDKqlwLIQ-1; Mon, 03 May 2021 09:55:34 -0400
X-MC-Unique: DPWmvKljM8auOyDKqlwLIQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 r10-20020a05600c2c4ab029014b601975e1so204635wmg.0
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 06:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A8mWdKbgJ/CAsWk21BKv8qEbHVmWDmS/BNnnCG4Ppt8=;
 b=uDQs2Ujo/6AJ1loFtPiWHPqZmtdWudF0gMVyqOLnSqi8YFKVDqXAYFwTuMNUutCLP0
 6pgf+8I9/VzZKy68LOoYPYpYFr0AwEup+VdzDhv8oHpzRKAE/pIp47QRxH5MH3/YxkPu
 Fc5gVdgeYFNCfVzGITFZU8RGUtungscr648h66dEfol7gTOStKaYgfANYsmCIuOZ3zNv
 JCZGJssQqXVCLzYPDJTx8rH9ufg+uChBLzcq02mSKlvVh4aI6qFOPHGg2ZPAbCUlHDlq
 u+6ZjoWFHqT6DoIwjAnz7kFbS6h0TkuziBWyGmj28yK7VwOMvlReBHPemcwSwbrAes1d
 t3lw==
X-Gm-Message-State: AOAM533D0g1IDNWqxSDXMvnH32yn3tEiEOUPPslWIozx3BTE2UvGAiOB
 hD4AJKO1MYIzNHPzWEIciTAvy/eabrJciTI6GPcB2QRXJrwl5bAVx2rkcaK1laBlkx4quXAD8M1
 uY5I6vdImSfK8g0k=
X-Received: by 2002:a5d:63cb:: with SMTP id c11mr25079332wrw.49.1620050133020; 
 Mon, 03 May 2021 06:55:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeCc7q+yAiY0y0d1hqE5Ishb3/KjffAcnE+UgoynbT3xNwfICjSzyBq4fUG84tJ+RnU5jIfQ==
X-Received: by 2002:a5d:63cb:: with SMTP id c11mr25079322wrw.49.1620050132924; 
 Mon, 03 May 2021 06:55:32 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id t206sm11595376wmb.11.2021.05.03.06.55.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 06:55:32 -0700 (PDT)
Subject: Re: [PATCH v2 3/5] usb/mtp: avoid dynamic stack allocation
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20210503132915.2335822-1-kraxel@redhat.com>
 <20210503132915.2335822-4-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ce3de4d3-79f2-1f22-f8df-4958f4c1d526@redhat.com>
Date: Mon, 3 May 2021 15:55:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210503132915.2335822-4-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: mcascell@redhat.com, remy.noel@blade-group.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/21 3:29 PM, Gerd Hoffmann wrote:
> Use autofree heap allocation instead.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/usb/dev-mtp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>


