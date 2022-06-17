Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C529A54F3B1
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 10:56:32 +0200 (CEST)
Received: from localhost ([::1]:34428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o27mJ-0004PK-7D
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 04:56:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o27i6-0003cg-9K
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 04:52:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o27i2-0004NJ-Ed
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 04:52:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655455924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bMJB2CZcMkCjS3eZn6fZk1+PXNxHZw7U28TRbXgINQw=;
 b=XwDenrfk8gepgbV+EI6KxtcyJoLH+/uId46HdFNXfE2BfQcObXRS6itntqXqXEAv5vqtpU
 UeyMFmZkud1PzqE60PBsLxC4zXTjm4UYgsCY2MIxIjSZ/XC9730NFHgDUXlb5S7UuX7ysq
 SPwsJR1iRUJ0HFP2o4T1c8ahfQS6QEI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-OW7dTbFIMPuO_3F6i-Rz-A-1; Fri, 17 Jun 2022 04:52:02 -0400
X-MC-Unique: OW7dTbFIMPuO_3F6i-Rz-A-1
Received: by mail-wm1-f70.google.com with SMTP id
 v125-20020a1cac83000000b0039c832fbd02so2428419wme.4
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 01:52:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bMJB2CZcMkCjS3eZn6fZk1+PXNxHZw7U28TRbXgINQw=;
 b=DHN3RBlCs91F00jRGZXON5AJp4AKicyNA22ISUYa+dygvea6lqUmmVrZEOq2CzRH54
 OMmSPGUzKol9uKYoejFqzmwMEl8Tk9ufw/2vW8W3IItbxT60VsoYj5nGUruvwBM+w+6H
 Jkx81srs1mzEWrFj5bZx8sdLTbZeXhocs5qrD25ruKASKKkT8Z3osGWF8aKU8q41cWVA
 nT4DbYiNP7t4TAH0c0BWYGp4gw7YxoL2Kw2tn6AMRqcKzLoCBwrAsibbTrSZjxEDzQ97
 CEin5tl7iRsnMGJkx6b6tQ5tOcH/jFh2qQjNf8MjqpM1BYincb0RnpiDUfus27CQv46q
 gOBg==
X-Gm-Message-State: AJIora/bRXs0I9g9AMGuZ90hUs9P8IWO0YvCj8qFgXrp6xs0KTtHyOWx
 ZmBKmgDKPOy7Tearnzd7Xqe4twrOBT17l+soi2TyPRJrYtQE8hMPhHCPB6v1dIngDDvpuEOfAey
 1E/zrBC/RBBwiUzk=
X-Received: by 2002:a5d:5012:0:b0:21a:3b82:ba51 with SMTP id
 e18-20020a5d5012000000b0021a3b82ba51mr3973152wrt.614.1655455921184; 
 Fri, 17 Jun 2022 01:52:01 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vCWFV2fsUCLd7tvldH+PKbxm2W//cKoWdJ5zAuHohfEOj4jzukuI01YRjI2hvwth2GyyNKZA==
X-Received: by 2002:a5d:5012:0:b0:21a:3b82:ba51 with SMTP id
 e18-20020a5d5012000000b0021a3b82ba51mr3973134wrt.614.1655455920932; 
 Fri, 17 Jun 2022 01:52:00 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-42-114-75.web.vodafone.de.
 [109.42.114.75]) by smtp.gmail.com with ESMTPSA id
 bi19-20020a05600c3d9300b0039c4506bd25sm5520398wmb.14.2022.06.17.01.51.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jun 2022 01:51:43 -0700 (PDT)
Message-ID: <0d996eea-834b-e9fb-c743-ed8bb4e9b7f7@redhat.com>
Date: Fri, 17 Jun 2022 10:51:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] tests/vm: do not specify -bios option
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, akihiko.odaki@gmail.com
References: <20220616083025.116902-1-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220616083025.116902-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 16/06/2022 10.30, Paolo Bonzini wrote:
> When running from the build tree, the executable is able to find
> the BIOS on its own; when running from the source tree, a firmware
> blob should already be installed and there is no guarantee that
> the one in the source tree works with the QEMU that is being used for
> the installation.
> 
> Just remove the -bios option, since it is unnecessary and in fact
> there are other x86 VM tests that do not bother specifying it.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   tests/vm/fedora  | 1 -
>   tests/vm/freebsd | 1 -
>   tests/vm/netbsd  | 1 -
>   tests/vm/openbsd | 1 -
>   4 files changed, 4 deletions(-)
> 
> diff --git a/tests/vm/fedora b/tests/vm/fedora
> index 92b78d6e2c..12eca919a0 100755
> --- a/tests/vm/fedora
> +++ b/tests/vm/fedora
> @@ -79,7 +79,6 @@ class FedoraVM(basevm.BaseVM):
>           self.exec_qemu_img("create", "-f", "qcow2", img_tmp, self.size)
>           self.print_step("Booting installer")
>           self.boot(img_tmp, extra_args = [
> -            "-bios", "pc-bios/bios-256k.bin",
>               "-machine", "graphics=off",
>               "-device", "VGA",
>               "-cdrom", iso
> diff --git a/tests/vm/freebsd b/tests/vm/freebsd
> index 805db759d6..cd1fabde52 100755
> --- a/tests/vm/freebsd
> +++ b/tests/vm/freebsd
> @@ -95,7 +95,6 @@ class FreeBSDVM(basevm.BaseVM):
>   
>           self.print_step("Booting installer")
>           self.boot(img_tmp, extra_args = [
> -            "-bios", "pc-bios/bios-256k.bin",
>               "-machine", "graphics=off",
>               "-device", "VGA",
>               "-cdrom", iso
> diff --git a/tests/vm/netbsd b/tests/vm/netbsd
> index 45aa9a7fda..aa883ec23c 100755
> --- a/tests/vm/netbsd
> +++ b/tests/vm/netbsd
> @@ -86,7 +86,6 @@ class NetBSDVM(basevm.BaseVM):
>   
>           self.print_step("Booting installer")
>           self.boot(img_tmp, extra_args = [
> -            "-bios", "pc-bios/bios-256k.bin",
>               "-machine", "graphics=off",
>               "-cdrom", iso
>           ])
> diff --git a/tests/vm/openbsd b/tests/vm/openbsd
> index 13c8254214..6f1b6f5b98 100755
> --- a/tests/vm/openbsd
> +++ b/tests/vm/openbsd
> @@ -82,7 +82,6 @@ class OpenBSDVM(basevm.BaseVM):
>   
>           self.print_step("Booting installer")
>           self.boot(img_tmp, extra_args = [
> -            "-bios", "pc-bios/bios-256k.bin",
>               "-machine", "graphics=off",
>               "-device", "VGA",
>               "-cdrom", iso

Reviewed-by: Thomas Huth <thuth@redhat.com>


