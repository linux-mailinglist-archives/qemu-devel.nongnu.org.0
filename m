Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1FD3D0A71
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 10:23:04 +0200 (CEST)
Received: from localhost ([::1]:33142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m67VP-0002On-6h
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 04:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m67UI-0001gy-GN
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:21:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m67UH-00054k-2g
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:21:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626855712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F53WzaWbQvjjXxzf6n/WXnbzir96lJd60Q/OcsSPiU8=;
 b=FdjWbVYl86NLFSg0Z9O2C2p+4YM8peaqnGJw8OjEfqzGezWCQOrvFiGSle+qj4bWisqKL7
 W7TKG7oAnY2Cm8uIl7svibmEHqU5DwTRebnLEro7D4y/iFwdSIgKoFiAPrbqN5fXv/opVp
 hniWFPdknn4gsEqpGILp0BmwNp/naiM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-mcX0ZzZgOIOLX-O3nxsGLQ-1; Wed, 21 Jul 2021 04:21:50 -0400
X-MC-Unique: mcX0ZzZgOIOLX-O3nxsGLQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 t8-20020a05600001c8b029013e2027cf9aso638256wrx.9
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 01:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F53WzaWbQvjjXxzf6n/WXnbzir96lJd60Q/OcsSPiU8=;
 b=c7FQ/5LO0A6c8nIotflKfBauBGB7rXjtXVaHv9T6pLlBxd3bsZ3rNucjzfVD6XmvXh
 9E55JIYhCZY45/8GOkGyaMln3+Pa4htXKjfRfP4LHH+wqnGCuGHjsWrQn83YpqMnF22F
 oM5s8qqrel9pEkVqIom2/uxeBf+RR2sMbaNdp72HhdVDIBckh4lsozvYb9XMtlc6muxw
 bJAmeU0pBLTkj9GiT0gFro+bUCvHsGab50/65+CwL32RQ64/aiAzdmn/8EFRCtqOb+il
 25ljG/sjSzQEQHncbyq7PzxXjGAVoRAsVG8f2VsbeUMgHTCjdRJocEvs6/hWjgKimcO1
 iWUQ==
X-Gm-Message-State: AOAM533D/qqzSrEPEs4IwSEc7tyMF9ThmhzHGWNULmkDrCqx9V+Pxdk2
 +XkUjdksj+48KRRFQAp3I3yiEJ++TwiWRPaE6OuQEyWt5pCvZNLeFneJB6thNcvo9AF3noaK99T
 CBadJCNnGfDclv5A=
X-Received: by 2002:a7b:c84d:: with SMTP id c13mr2828366wml.30.1626855709467; 
 Wed, 21 Jul 2021 01:21:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw871ipVw+UOcloC1fJy0QrcnXMesqSWX0sJdymd9a8cxL6TwFbFXu1E9/fovRWwubj4qXL8A==
X-Received: by 2002:a7b:c84d:: with SMTP id c13mr2828349wml.30.1626855709212; 
 Wed, 21 Jul 2021 01:21:49 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id t6sm26579349wru.75.2021.07.21.01.21.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 01:21:48 -0700 (PDT)
Subject: Re: [PATCH] usb: fix usb-host dependency check
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20210721081718.301343-1-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <aaed3100-cd1d-008a-8bdd-7ef584e18fc2@redhat.com>
Date: Wed, 21 Jul 2021 10:21:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210721081718.301343-1-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Programmingkid <programmingkidx@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/21/21 10:17 AM, Gerd Hoffmann wrote:
> Fixes: 627302afb2f8 ("usb: build usb-host as module")
> Reported-by: Programmingkid <programmingkidx@gmail.com>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/usb/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


