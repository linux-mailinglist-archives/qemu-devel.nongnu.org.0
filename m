Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAAD54D183
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 21:25:35 +0200 (CEST)
Received: from localhost ([::1]:39746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Ydx-0003zF-Ll
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 15:25:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o1Ybr-0002kG-Rb
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 15:23:23 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:34306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o1Ybq-0002qJ-99
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 15:23:23 -0400
Received: by mail-ej1-x631.google.com with SMTP id o7so25176096eja.1
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 12:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IYvue2KCXfox+j1W8EWfcxKsGHuta0er+s/222TcEa8=;
 b=iUqILA5/t+DveYVadwC/zFfdHgvzndaGU0XlNl358XOWYfvOopkmxnlIzVxuvRvmXd
 uZpHLHxkKwKQ2GcIxSM3wx+2kOA9p+S8XN/UUTZGFWFbifqRu+D9SEWKuCbU6vVcX0vI
 Mf61enZjgvdBAZDfJVSX1BA8c57ytJ4xTM/FQrP/8+ieP+Hzd/JlChK9+xbyIiUI5ctC
 dq8y7cFNWKdvY1QCy9xiLK7EbJvT7xw1sxb/SAzwaVO2Pa2xqydlIxfuruGVtcKXEV4p
 OXGOGTRgqDM8OyXjzeerTp1Eer1QQb5ZG15qvM0IzkiwNNZwtzxMrx5vg6gCo2E863uH
 gHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IYvue2KCXfox+j1W8EWfcxKsGHuta0er+s/222TcEa8=;
 b=oc9zdfc0VFwX8eRpg/hQeZMWF87cB8IOjyxr+MH5OZaXlI3ZVskR2egDoqe1EJCVE9
 cBbwwWE6YFC7TWpGK8ai3rUknjzOJJ8azccupAs0r01j2tLrGvLqIowjq8YMZ3i/g3f1
 DP9Anoej95lBRN7ow1PUof/bl6YlBU0ggEXaZiXPfOtENx8GBnINF4barpbe3Oo8jNNP
 kVPLh/zH6hs5QL+0uMd1WTxRm1MAUl6hQkt7FoinuFGU1npuut1n48bHQsUK84OmWHmv
 nkRwbKbSsVTdUFmfEyQ/FKCAznzMZYLSa85gIuQJhgbAPuvdQb0uaKy1SxdWqYocnPpn
 S+Ow==
X-Gm-Message-State: AJIora/JjVkhckvgyCxLCf8cXSbZltfx1B2uufv16qIkym7abU0EQrwa
 m6GpZGpraRi2Q1bHr3V5Kdw=
X-Google-Smtp-Source: AGRyM1sydromeGIpl6AtivgLUkqD0xHcMOnpcqx8rjFJ9Of4c7dYQmfPj2H8DXO3tqVsBtcS6BJWsg==
X-Received: by 2002:a17:906:1193:b0:70d:cf39:a4db with SMTP id
 n19-20020a170906119300b0070dcf39a4dbmr1246556eja.44.1655321000687; 
 Wed, 15 Jun 2022 12:23:20 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 z23-20020a17090655d700b006fef0c7072esm6839331ejp.144.2022.06.15.12.23.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 12:23:20 -0700 (PDT)
Message-ID: <79228447-890d-b518-f379-55eaa74c190a@redhat.com>
Date: Wed, 15 Jun 2022 21:23:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 5/7] datadir: Use bundle mechanism
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang
 <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20220615155634.578-1-akihiko.odaki@gmail.com>
 <20220615155634.578-6-akihiko.odaki@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220615155634.578-6-akihiko.odaki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/15/22 17:56, Akihiko Odaki wrote:
> diff --git a/tests/vm/fedora b/tests/vm/fedora
> index 92b78d6e2c9..4ccd31bba61 100755
> --- a/tests/vm/fedora
> +++ b/tests/vm/fedora
> @@ -79,7 +79,7 @@ class FedoraVM(basevm.BaseVM):
>           self.exec_qemu_img("create", "-f", "qcow2", img_tmp, self.size)
>           self.print_step("Booting installer")
>           self.boot(img_tmp, extra_args = [
> -            "-bios", "pc-bios/bios-256k.bin",
> +            "-bios", "qemu-bundle/share/qemu/bios-256k.bin",
>               "-machine", "graphics=off",
>               "-device", "VGA",
>               "-cdrom", iso
> diff --git a/tests/vm/freebsd b/tests/vm/freebsd
> index 805db759d67..2095d8c5204 100755
> --- a/tests/vm/freebsd
> +++ b/tests/vm/freebsd
> @@ -95,7 +95,7 @@ class FreeBSDVM(basevm.BaseVM):
>   
>           self.print_step("Booting installer")
>           self.boot(img_tmp, extra_args = [
> -            "-bios", "pc-bios/bios-256k.bin",
> +            "-bios", "qemu-bundle/share/qemu/bios-256k.bin",
>               "-machine", "graphics=off",
>               "-device", "VGA",
>               "-cdrom", iso

I think -bios can be removed completely here.

Paolo

