Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9591B4E443D
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 17:32:18 +0100 (CET)
Received: from localhost ([::1]:43438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWhQf-00054Q-NZ
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 12:32:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWhOu-00036n-2X
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 12:30:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWhOs-0007VS-5X
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 12:30:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647966625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pLXzMmxkxNgGEVoV9UMrl0erpCYSvhV0M5InbcJNWWY=;
 b=Hxi6LghwSGiPegAcMub/qvUm3wM7wfB9Gw5hH+w+wNNyBot70CiauWMEdQUgkJpUJKU/8X
 oeD+mlPSLnzGcUuoNMdc6J5MyfR47OfR6KhB+uJ9SfDkYenwna4eP3GX9sKEoPnczomkcf
 wx6p/g4WilD9Jm/3bQ9bBS5WsL45Tyk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-IanuEhLtPlCYNh8DGgFspQ-1; Tue, 22 Mar 2022 12:30:23 -0400
X-MC-Unique: IanuEhLtPlCYNh8DGgFspQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 x2-20020a1709065ac200b006d9b316257fso9023234ejs.12
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 09:30:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pLXzMmxkxNgGEVoV9UMrl0erpCYSvhV0M5InbcJNWWY=;
 b=sKJfIY0lZ8B10cZn7hOkCSBHi2YQdS4wYB4VmGSmFvU13SW436s2syQ38rntcT9ePI
 O+2WBWd2Uajnf3ach8EMn8Ap6kJlEudaRWt4usiHsIYeZoHF1YnJEGzrOCQuVt5NUVbI
 nuoqjVeXYdvHZTM/lc47IVsNdCUU1SfkrRVESf94MQnwksrdv2I0EwPay27BPwNBjMzR
 XocsjVuZsb5ShuUzd4AocEUv7SnPk5KAj95K+xDYbzJ5y7SClv7XIq+hzQG4+ZJBm4DQ
 P4IVWxGlNOrsLpY50UJ92RrXs8ZEBzlYw1acqQL+93p3B6camTOPlxQq/5XelESjblJN
 /YSQ==
X-Gm-Message-State: AOAM5339XEMIHVN+02QCvlOy2P7aAmhewlDwEbc+4IW4rlVbpKWdhNst
 B9hol0ZH1Cl/ROrBN7n5rV+p9Z69hbPgEQg0t+CKSEL4Oxs55oduOrlhOSz2tEc23n0ffwnRqtJ
 QUSmAq5LiY9INuq0=
X-Received: by 2002:a17:907:7fa6:b0:6db:6e1b:c467 with SMTP id
 qk38-20020a1709077fa600b006db6e1bc467mr26899087ejc.552.1647966622498; 
 Tue, 22 Mar 2022 09:30:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFTwWbVNMGcEZkeVAZ/oXGCTby/WrDyQvF6D4hFWQ8a7rDhu0NUvQLQlOTxN2qrtq79Txuwg==
X-Received: by 2002:a17:907:7fa6:b0:6db:6e1b:c467 with SMTP id
 qk38-20020a1709077fa600b006db6e1bc467mr26899068ejc.552.1647966622295; 
 Tue, 22 Mar 2022 09:30:22 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 u4-20020aa7db84000000b004136c2c357csm9952420edt.70.2022.03.22.09.30.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 09:30:21 -0700 (PDT)
Message-ID: <258fcd46-38a6-2258-a39f-4126be26c8ce@redhat.com>
Date: Tue, 22 Mar 2022 17:30:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 10/15] iotests/245: fixup
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220318203655.676907-1-jsnow@redhat.com>
 <20220318203655.676907-11-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220318203655.676907-11-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.03.22 21:36, John Snow wrote:
> (Merge with prior patch.)
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/242 | 2 +-
>   tests/qemu-iotests/245 | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/qemu-iotests/242 b/tests/qemu-iotests/242
> index 4b7ec16af6..ecc851582a 100755
> --- a/tests/qemu-iotests/242
> +++ b/tests/qemu-iotests/242
> @@ -22,7 +22,7 @@
>   import iotests
>   import json
>   import struct
> -from iotests import qemu_img_create, qemu_io, qemu_img_info, \
> +from iotests import qemu_img_create, qemu_io_log, qemu_img_info, \
>       file_path, img_info_log, log, filter_qemu_io
>   
>   iotests.script_initialize(supported_fmts=['qcow2'],
> diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
> index 8cbed7821b..efdad1a0c4 100755
> --- a/tests/qemu-iotests/245
> +++ b/tests/qemu-iotests/245
> @@ -217,7 +217,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
>       # Reopen an image several times changing some of its options
>       def test_reopen(self):
>           # Check whether the filesystem supports O_DIRECT
> -        if 'O_DIRECT' in qemu_io('-f', 'raw', '-t', 'none', '-c', 'quit', hd_path[0]):
> +        if 'O_DIRECT' in qemu_io('-f', 'raw', '-t', 'none', '-c', 'quit', hd_path[0]).stdout:

This is to verify that O_DIRECT works or not.  If it doesn’t work, this 
will fail, so we need to pass check=False here.

(Or this test fails on tmpfs.)

Hanna

>               supports_direct = False
>           else:
>               supports_direct = True


