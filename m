Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3411E1209F5
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Dec 2019 16:41:56 +0100 (CET)
Received: from localhost ([::1]:55780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1igsVP-0005Rf-2r
	for lists+qemu-devel@lfdr.de; Mon, 16 Dec 2019 10:41:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33434)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1igsSy-0003G1-Dv
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 10:39:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1igsSx-0008PW-Be
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 10:39:24 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:37264
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1igsSx-0008Oc-80
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 10:39:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576510762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=buaMern/o9m9Y6G2SnlGPsf9M46QtSDj1V27n8M0xcc=;
 b=eiCUOWOWi5NEmrSbtlgJYa0oDJEn0tkoqGIFTBIFBF/XGQesUp4n+bdCDMP91kOQzvrXG7
 n1a5sJjHHA1FmGxjhygbGTQU+vnuFJ7JWF66FHJAQAMUlklpKwuJL9BBLF4aEnH8k8tP8r
 z5hds1jpDJR3eXFnKFp6KSfBCtVeUVo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-Ze5OiM6XPJeuTMt75ruVvQ-1; Mon, 16 Dec 2019 10:39:20 -0500
Received: by mail-wr1-f71.google.com with SMTP id f17so3911988wrt.19
 for <qemu-devel@nongnu.org>; Mon, 16 Dec 2019 07:39:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5hjbl7EKfl/UqTJ4jD9VwiBtzVvJh5drPvDVTAE8GKU=;
 b=eYSC4Y1sSaDL3YRKbeQUP0AmkDZOYQz5dXCbjYrR4KaXEaqyBR8tZXuu2aGGfT434L
 ZWiPGZdtS5eaJrkyYUsH26Gg3RMgrmb8Gd3HfZOzaVRDgfEskMRbZ0AO6xQEdYLLTLcC
 uykySLlJxUfc7jdSDCiQXxFGH661Vgua6v1w235ko1zM/VmXEEIaka7Ye6Ipaui2vY+G
 sBqoRqANQy+4ZZitl+uw46OqWc4HJ52SCnpM4OhTrm6JGzsZD5TuMpU7oh7OOexNi/9H
 dJgFJGiVtZjHkLzq8IXDuwXuQczjqAQU68b8uVpQTImrSKU6fAoc2VF3I2cCxQXMrNwM
 SYSA==
X-Gm-Message-State: APjAAAWWZ5HrMUPR1oIvIyO7J4hJuJPKLR3AhsCAON4fjsbhr8nKuQYX
 lX8R+eCZvr/MnHtlpNx7Yoyb2ORijQy7y/5RFasrr1f6XAb0yfB2PNqZ+3TctcCehy9qxh5JJ88
 gDUmWd1DsekO386E=
X-Received: by 2002:a1c:2089:: with SMTP id g131mr14704725wmg.63.1576510759884; 
 Mon, 16 Dec 2019 07:39:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqy0X7BZnLS0uyapIjvdin3N9St/Wgd5FbTEOaJGtsBZn5DkK0WodgMf2wNNwZp29Vo6XXyV4A==
X-Received: by 2002:a1c:2089:: with SMTP id g131mr14704712wmg.63.1576510759718; 
 Mon, 16 Dec 2019 07:39:19 -0800 (PST)
Received: from [192.168.1.35] (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id q6sm23238017wrx.72.2019.12.16.07.39.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2019 07:39:19 -0800 (PST)
Subject: Re: [PATCH] qemu-doc: Remove the unused "Guest Agent" node
To: Thomas Huth <thuth@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>, 
 qemu-devel@nongnu.org
References: <20191216132941.25729-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4578bf73-ffc8-9173-1aff-2508f85edde7@redhat.com>
Date: Mon, 16 Dec 2019 16:39:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191216132941.25729-1-thuth@redhat.com>
Content-Language: en-US
X-MC-Unique: Ze5OiM6XPJeuTMt75ruVvQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/19 2:29 PM, Thomas Huth wrote:
> The node has been removed from the texi file some months ago, so we
> should remove it from the menu section, too.
>=20
> Fixes: 27a296fce982 ("qemu-ga: Convert invocation documentation to rST")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   qemu-doc.texi | 1 -
>   1 file changed, 1 deletion(-)
>=20
> diff --git a/qemu-doc.texi b/qemu-doc.texi
> index 3ddf5c0a68..4b62b23264 100644
> --- a/qemu-doc.texi
> +++ b/qemu-doc.texi
> @@ -38,7 +38,6 @@
>   * Introduction::
>   * QEMU PC System emulator::
>   * QEMU System emulator for non PC targets::
> -* QEMU Guest Agent::
>   * QEMU User space emulator::
>   * System requirements::
>   * Security::
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


