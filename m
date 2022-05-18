Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D6E52B2C5
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 09:08:05 +0200 (CEST)
Received: from localhost ([::1]:50280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrDmu-0002tN-4m
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 03:08:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrDjf-00013n-Uw
 for qemu-devel@nongnu.org; Wed, 18 May 2022 03:04:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrDjd-0002tg-Dg
 for qemu-devel@nongnu.org; Wed, 18 May 2022 03:04:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652857479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0yiFaXDCP5wKN1MiwBs4YIKWzPgHtP+zH0l+eopp/dU=;
 b=gJCLI47YKaBHbRee4QNx+Rwa+Gjk7+94z/TiNMLD/tM1nQsMjyb7ZdDZLg0sz67Gh0rbPO
 uEFRMUNPCeZ9hSMNIv9ZOFs+4fwoaNC1Z3dwy06jJ8Fhbs0Itv9YjG6YxI3E6Ke8vjGs5s
 NjlspDSC8p6gO5vGYyhrq9TlnEU1j9A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-26-xKHRBPW2RrJIPCCkOrQ-1; Wed, 18 May 2022 03:04:38 -0400
X-MC-Unique: 26-xKHRBPW2RrJIPCCkOrQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 m186-20020a1c26c3000000b003943e12185dso505824wmm.7
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 00:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0yiFaXDCP5wKN1MiwBs4YIKWzPgHtP+zH0l+eopp/dU=;
 b=XiE7fdBaflFO+fBbylvTopAz6zy1uQJ5r5KtD8iWUF+GsfjVGE8WNui46mL8VirXys
 p7XEkAO2GQZSYg5epNn2NqBK0npMzJio8h7iTXKd0UrPtBsvEKdB6O6/xsrnmx90qT/W
 QLvy7Y8JLWfEpR+Q1wB+xaXXqeHH5nQAoiQnsG3ppfHxtyL9yYnTr0cjhMBArUY+oS1N
 ky5fw9CkQnZfqmkUi9rpTfeAIrs0BZkl8+2GuNKY6Uw4InhLcqPly5SyFj6g8tVw2vIY
 NMOTR/ZtZDxxubziG/9Ajimc3KOrP7r2Wu2tyH+qtd0C7QQmek+0LDlu07Z3W2bQmeir
 WQSg==
X-Gm-Message-State: AOAM533nRg/P2xrJovUdhQnrQwda1sqNqSflSt/omagD/h5gDTeTNnDf
 JM/pS8043s3tNldykBXjDNQpRiCKLAxu88BteErlGG4b7r7V0cy0iYJs+DgtwCRbiQFto9BqKPC
 T4afM5SRLkifsZK0=
X-Received: by 2002:a05:6000:1786:b0:20e:6267:5700 with SMTP id
 e6-20020a056000178600b0020e62675700mr514417wrg.600.1652857476798; 
 Wed, 18 May 2022 00:04:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/rtoWy+F9CEUGChUVkEpnVnsUM7j+fffv97zva5NdEM5CGTb5zaFr+SOiNO1AeGIReHz5zw==
X-Received: by 2002:a05:6000:1786:b0:20e:6267:5700 with SMTP id
 e6-20020a056000178600b0020e62675700mr514404wrg.600.1652857476525; 
 Wed, 18 May 2022 00:04:36 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 t17-20020adfa2d1000000b0020cf071a168sm1133236wra.29.2022.05.18.00.04.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 00:04:36 -0700 (PDT)
Message-ID: <ed9a8e2d-77e1-1f75-11d6-5f06488b2e98@redhat.com>
Date: Wed, 18 May 2022 09:04:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] docs/devel: Fix broken internal link to mailing lists
Content-Language: en-US
To: Kashyap Chamarthy <kchamart@redhat.com>, qemu-devel@nongnu.org
References: <20220315155426.659426-1-kchamart@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220315155426.659426-1-kchamart@redhat.com>
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

On 15/03/2022 16.54, Kashyap Chamarthy wrote:
> Missed this during the initial conversion.
> 
> Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
> ---
> This patch should be merged on top of this[1].  Otherwise Sphinx will
> complain (correctly so).
> 
> [1] https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg03488.html
>      -- docs: rSTify MailingLists wiki; move it to QEMU Git
> 
> Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
> ---
>   docs/devel/submitting-a-patch.rst | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
> index e51259eb9c..3632b74585 100644
> --- a/docs/devel/submitting-a-patch.rst
> +++ b/docs/devel/submitting-a-patch.rst
> @@ -18,13 +18,13 @@ one-shot fix, the bare minimum we ask is that:
>      <http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/SubmittingPatches?id=f6f94e2ab1b33f0082ac22d71f66385a60d8157f#n297>`__
>      policy.) ``git commit -s`` or ``git format-patch -s`` will add one.
>   -  All contributions to QEMU must be **sent as patches** to the
> -   qemu-devel `mailing list <MailingLists>`__. Patch contributions

  Hi Kashyap!

This still seems to be broken - did you ever respin the other patches? (I 
was not able to spot a v3 of the series...?)

  Thomas


