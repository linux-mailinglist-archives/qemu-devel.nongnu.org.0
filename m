Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E325A4D7CE0
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 08:59:37 +0100 (CET)
Received: from localhost ([::1]:40492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTfc8-0001TV-95
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 03:59:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nTfa3-0000I0-BZ
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 03:57:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nTfZz-0001qH-VL
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 03:57:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647244642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rmN/N2xXTd2QO+dLoeusCHR8aLxgW97OUcUDCCfw6jY=;
 b=fIZ4+evCVf/zsWhX0rQOtTyV8XUQK8PgkjA8ATjsLEvf9h41G+IwK70u/fEKGSfLKK4vY3
 V2ufBW7QVRg0D7RuAJW2qk89rLgfNoj+5UZhSWubkRdnZeQvfc1ia7hsY64Tj78yKCC0su
 b7c1LBltsBHaydyr80y6h0i7hBOK3/8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-uk5Rc8_-MLSBhYmsHCLQkQ-1; Mon, 14 Mar 2022 03:57:19 -0400
X-MC-Unique: uk5Rc8_-MLSBhYmsHCLQkQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 q189-20020a1c43c6000000b003898de01de4so3174924wma.7
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 00:57:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=rmN/N2xXTd2QO+dLoeusCHR8aLxgW97OUcUDCCfw6jY=;
 b=p0PIa/COuAB4S6mWnW+CxGaDHTW9P39cEG4ozyp8vK+h5rQHR/+0gQ05BPYM+o195S
 5Vsy6tWrobfyBC5q5fxCyRJSavG5RuSktPTLI+vf7pjdil0yNO/21z9UUiQ+VMoyxi6K
 mb85GXEbw1EZy1bvjg8ViMIxSS64Ag3BviiFe7YoadBYm666nSVrP7vGZifsB4NHehBU
 YHrW56paml+UM7nZ2IF+Ceq7BBL5Wa2rbgTUGNLQlmcpKAOnF2omRCeN8KfjRdRljawb
 n5iJ+F3Xj2i+rFj7p3yhyxtL4qBFZbnN8stmbNjFYr2YOIJJ5IdHVHtgdAV8KjNbagIt
 Wctw==
X-Gm-Message-State: AOAM530HdyMox24FSqsUTjuGaTgVIZQFALf7U0qkfxr5B8+rtFLhh2mU
 N//4BRWd5MI6+sA2JxhDk/XX5kK5x1jB+MAFAPo6AJDsIBPUWQmEogmZpwid+nJeW7lqhdkjFCI
 xtlUnMlKrRge89X0=
X-Received: by 2002:a05:600c:4ec8:b0:389:f9fb:9aa5 with SMTP id
 g8-20020a05600c4ec800b00389f9fb9aa5mr7955251wmq.125.1647244637915; 
 Mon, 14 Mar 2022 00:57:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxebugOMbioMaD8cYm3YKxs6qYUhqOi7S253PumPpydstlj2okE2Mv8hcDLttkjNiLcF0r5kw==
X-Received: by 2002:a05:600c:4ec8:b0:389:f9fb:9aa5 with SMTP id
 g8-20020a05600c4ec800b00389f9fb9aa5mr7955230wmq.125.1647244637646; 
 Mon, 14 Mar 2022 00:57:17 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 2-20020a1c1902000000b00380d3873d6asm14653681wmz.43.2022.03.14.00.57.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 00:57:17 -0700 (PDT)
Message-ID: <93c2887a-61b7-e30a-bc94-432482e9aada@redhat.com>
Date: Mon, 14 Mar 2022 08:57:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] Resolves:
 https://gitlab.com/qemu-project/qemu/-/issues/542
To: zzl <linuxmaker@163.com>, qemu-devel@nongnu.org
References: <20220312082607.5974-1-linuxmaker@163.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220312082607.5974-1-linuxmaker@163.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/03/2022 09.26, zzl wrote:
> ---
>   hw/audio/intel-hda.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
> index 5f8a878f20..ff32936cfd 100644
> --- a/hw/audio/intel-hda.c
> +++ b/hw/audio/intel-hda.c
> @@ -328,7 +328,7 @@ static void intel_hda_corb_run(IntelHDAState *d)
>               dprint(d, 2, "%s: corb ring empty\n", __func__);
>               return;
>           }
> -        if (d->rirb_count == d->rirb_cnt) {
> +        if (d->rirb_count >= d->rirb_cnt) {
>               dprint(d, 2, "%s: rirb count reached\n", __func__);
>               return;
>           }

  Hi!

Please see https://www.qemu.org/docs/master/devel/submitting-a-patch.html 
for information how to correclty submit a patch. Especially you need to 
supply a "Signed-off-by" line, too, and please use a proper subject for the 
mail and place the "Resolves:" line into the patch description instead.

Apart from that, the bug ticket already links a patch series with a proposed 
fix ... could you elaborate why this needs a different approach?

  Thomas


