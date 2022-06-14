Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA42D54A8EA
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 07:50:47 +0200 (CEST)
Received: from localhost ([::1]:39778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0zRu-0005Vg-Th
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 01:50:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o0zOE-0003rh-HS
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 01:47:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o0zOB-000577-7i
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 01:46:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655185613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RBrCXRF1O8NPqAlhKRttjWXlq/2VRGMHIa5CKqjtJ0s=;
 b=BZ4UTLCEObay+SGMPQvhT+E6E0xbuKyBs69V9XVMUILUN/8JBBkfG0P7erJ9IHAYnHOftP
 UyddPD6FA5SkZMsYYwWwpdmx7XbfkFXFprbqg5QZaRF4dKLLqcc+TRuh6LKYFqnQ+ha4hY
 KStXupkAe+fSn5Wv7dHb0hzrp4gVPq8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-TlTwxM3ZP4qQdk3wfMSJ1A-1; Tue, 14 Jun 2022 01:46:51 -0400
X-MC-Unique: TlTwxM3ZP4qQdk3wfMSJ1A-1
Received: by mail-wm1-f69.google.com with SMTP id
 o2-20020a05600c510200b0039747b0216fso7075980wms.0
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 22:46:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RBrCXRF1O8NPqAlhKRttjWXlq/2VRGMHIa5CKqjtJ0s=;
 b=iYAgHN7MUCCJ/UEfjKKNdnCI91Oas5F4uw+TBvyubEcbPws/CBNt1svvZNF1hYhmBZ
 TXZMdFit+NBHouxnS/hxbk7MiK7yqcYBZpySs2qOkw4DRspySFswXKYhr8vUpHpKIVI7
 Ot8phDd+QLLSC2mDE+rSmyN5l8N4WXkTvD0E7tvwrBkh3I8nj1iOJa137M76rdpXDuYp
 l/V01RQrOc8rxKe/dISIEeRSFUTVqIIKi/iobjxJInBvUTAqb10x+QzZLCr1UlDA+ZpI
 dyXWoKgXqpm71grsC+DPJZsMArS5YLYAWxAldtSFlIz6ZYIdsox6TySn4y8t8VXumWca
 ClRQ==
X-Gm-Message-State: AJIora8aNIfQ70iM+vqOr4MlvlAjzUjH36c5PfXNl2jv88YyUeLA+saF
 RHgKr3EhNKjHGOVUOYbRgPNaVZZHyN5L05QgT2SBPO00Gnn1NgviP1rr5w9k0yMqbGazxNqPm3o
 YeK6VjRufT1oC2RA=
X-Received: by 2002:a05:6000:1e1b:b0:219:e32d:cbe8 with SMTP id
 bj27-20020a0560001e1b00b00219e32dcbe8mr2980188wrb.129.1655185610279; 
 Mon, 13 Jun 2022 22:46:50 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s/dXCs/V4VaeBOyrzcToWhKEFyhpg954UOXDSc8J0g7yPHoU1ukPPiC/hRvCQ4GVRSsrYvCg==
X-Received: by 2002:a05:6000:1e1b:b0:219:e32d:cbe8 with SMTP id
 bj27-20020a0560001e1b00b00219e32dcbe8mr2980171wrb.129.1655185610051; 
 Mon, 13 Jun 2022 22:46:50 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-42-114-75.web.vodafone.de.
 [109.42.114.75]) by smtp.gmail.com with ESMTPSA id
 h206-20020a1c21d7000000b0039746638d6esm11971296wmh.33.2022.06.13.22.46.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 22:46:49 -0700 (PDT)
Message-ID: <bf53b02c-df25-728a-08c0-826337bb8594@redhat.com>
Date: Tue, 14 Jun 2022 07:46:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] qemu-iotests: Discard stderr when probing devices
Content-Language: en-US
To: Cole Robinson <crobinso@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <a535c532fb5a9a607f4e3e187cf386e3eaadf892.1654441037.git.crobinso@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <a535c532fb5a9a607f4e3e187cf386e3eaadf892.1654441037.git.crobinso@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 05/06/2022 16.57, Cole Robinson wrote:
> ./configure --enable-modules --enable-smartcard \
>      --target-list=x86_64-softmmu,s390x-softmmu
> make
> cd build
> QEMU_PROG=`pwd`/s390x-softmmu/qemu-system-s390x \
>      ../tests/check-block.sh qcow2
> ...
> --- /home/crobinso/src/qemu/tests/qemu-iotests/127.out
> +++ /home/crobinso/src/qemu/build/tests/qemu-iotests/scratch/127.out.bad
> @@ -1,4 +1,18 @@
>   QA output created by 127
> +Failed to open module: /home/crobinso/src/qemu/build/hw-usb-smartcard.so: undefined symbol: ccid_card_ccid_attach
> ...
> --- /home/crobinso/src/qemu/tests/qemu-iotests/267.out
> +++ /home/crobinso/src/qemu/build/tests/qemu-iotests/scratch/267.out.bad
> @@ -1,4 +1,11 @@
>   QA output created by 267
> +Failed to open module: /home/crobinso/src/qemu/build/hw-usb-smartcard.so: undefined symbol: ccid_card_ccid_attach
> 
> The stderr spew is its own known issue, but seems like iotests should
> be discarding stderr in this case.
> 
> Signed-off-by: Cole Robinson <crobinso@redhat.com>
> ---
>   tests/qemu-iotests/common.rc | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
> index 165b54a61e..db757025cb 100644
> --- a/tests/qemu-iotests/common.rc
> +++ b/tests/qemu-iotests/common.rc
> @@ -982,7 +982,7 @@ _require_large_file()
>   #
>   _require_devices()
>   {
> -    available=$($QEMU -M none -device help | \
> +    available=$($QEMU -M none -device help 2> /dev/null | \
>                   grep ^name | sed -e 's/^name "//' -e 's/".*$//')
>       for device
>       do
> @@ -994,7 +994,7 @@ _require_devices()
>   
>   _require_one_device_of()
>   {
> -    available=$($QEMU -M none -device help | \
> +    available=$($QEMU -M none -device help 2> /dev/null | \
>                   grep ^name | sed -e 's/^name "//' -e 's/".*$//')
>       for device
>       do

Reviewed-by: Thomas Huth <thuth@redhat.com>


