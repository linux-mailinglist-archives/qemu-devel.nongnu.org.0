Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCC054A83B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 06:42:01 +0200 (CEST)
Received: from localhost ([::1]:37516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0yNM-0002jC-7E
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 00:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o0yLV-0001Sc-JG
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 00:40:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o0yLT-0004P1-8U
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 00:40:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655181601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LRd3kRFSvdFsqDFB5tL+DO5p1ftp8EIf1RkGMsZPP3k=;
 b=IQDITEi/1oYasinWyk2nfPd10JUnVj7Avyo8zRgKPqsmUFlamjK+T6dZZpRLnAm1pIlKgI
 bWMTI9P9qXIZd72pqPPO/NcLMbTElIFVrpHMIlBFsfgODlde0Hzu1clfDwg7QkpzwfFtks
 yLBAlu91KpZUgV0ONz0/J48B2yGotpY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-33UwpxOMNQOnex_8ftAEEA-1; Tue, 14 Jun 2022 00:40:00 -0400
X-MC-Unique: 33UwpxOMNQOnex_8ftAEEA-1
Received: by mail-wr1-f72.google.com with SMTP id
 s3-20020adf9783000000b00219f10a7517so942426wrb.3
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 21:40:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LRd3kRFSvdFsqDFB5tL+DO5p1ftp8EIf1RkGMsZPP3k=;
 b=ust3flINQUC/T464Z9Phf7toYlzzX0RjQKTNzs4NTlbMwXI/UBjQPR9O22ZxNpLYal
 vCskZ+6dmkoXgUped98vtXB70pOkKpsTQE/zdMMSrpFoNPICuk6a2KslkQfHz3fDlN0Q
 yoMPyxLU3eeQHRrURoS/JWhzk73U2f41SnkWjZbMgJGVC9qeiA4aT++1BarPmfOdgqE+
 PQ83XVBlgP/RyceDfJKjMSu39fuUkTiY1SMZOKKxb3s8b9sspu5pzXbyanfdbux5ZAI1
 YzNlUW51xSYb69N3w739YcfDcWWbS8sxMSLZ2GsumCyH7H0Bchi/ZdXyDXgWf7arjuJT
 JbBA==
X-Gm-Message-State: AOAM532ilJUqH/hfVBefqYlRR+rwx+5/xnVwtNIkzgekQHUjn9w5CWud
 6XOJWaXzBOhUdobGJAi1soRIqNJg2W7I1QsnUC2K/Sq5WInL8GApEwo6kW/o0bJqYlRJWUwqVTw
 7g8Bit9QpMpLZX7M=
X-Received: by 2002:a05:600c:35c1:b0:39c:7930:7b5b with SMTP id
 r1-20020a05600c35c100b0039c79307b5bmr2020960wmq.162.1655181599095; 
 Mon, 13 Jun 2022 21:39:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIw6H1MApvsCg3qDxvQB8Fle32HKqpB0RLeBvZccfVeQiTLSjy9sLMyWMgeo+kpkq7OMNIDw==
X-Received: by 2002:a05:600c:35c1:b0:39c:7930:7b5b with SMTP id
 r1-20020a05600c35c100b0039c79307b5bmr2020943wmq.162.1655181598717; 
 Mon, 13 Jun 2022 21:39:58 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-42-114-75.web.vodafone.de.
 [109.42.114.75]) by smtp.gmail.com with ESMTPSA id
 k7-20020a5d6d47000000b00218453adaefsm10365145wri.101.2022.06.13.21.39.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 21:39:58 -0700 (PDT)
Message-ID: <1cff5046-4248-437f-eba9-de1ef7fe6c66@redhat.com>
Date: Tue, 14 Jun 2022 06:39:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/5] tests/vm: use 'cp' instead of 'ln' for temporary vm
 images
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20220614015044.2501806-1-jsnow@redhat.com>
 <20220614015044.2501806-4-jsnow@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220614015044.2501806-4-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 14/06/2022 03.50, John Snow wrote:
> If the initial setup fails, you've permanently altered the state of the
> downloaded image in an unknowable way. Use 'cp' like our other test
> setup scripts do.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/vm/centos | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/vm/centos b/tests/vm/centos
> index 5c7bc1c1a9a..be4f6ff2f14 100755
> --- a/tests/vm/centos
> +++ b/tests/vm/centos
> @@ -34,7 +34,7 @@ class CentosVM(basevm.BaseVM):
>       def build_image(self, img):
>           cimg = self._download_with_cache("https://cloud.centos.org/centos/8/x86_64/images/CentOS-8-GenericCloud-8.3.2011-20201204.2.x86_64.qcow2")
>           img_tmp = img + ".tmp"
> -        subprocess.check_call(["ln", "-f", cimg, img_tmp])
> +        subprocess.check_call(['cp', '-f', cimg, img_tmp])

I wonder whether it would make sense to use "qemu-img create -b" instead to 
save some disk space?

Anyway, your patch is certainly already an improvement, so:

Reviewed-by: Thomas Huth <thuth@redhat.com>


