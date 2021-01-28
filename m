Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 239D030712C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 09:18:25 +0100 (CET)
Received: from localhost ([::1]:53964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l52VT-0003tq-Lv
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 03:18:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l52UO-0003TF-6g
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:17:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l52UL-0003cA-Fj
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:17:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611821831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oTfiDzacX/lj6b1wF5/HWzeeeNoGMsPiEQqsjAdIfLI=;
 b=QNLrqtaSTK/3EnUGSeX2B2rfe6vFDlWy4qJnaQzW/YiQfYrEDG5S/z6Ij+WiyzFA9sIH1z
 0c9oNRsqa378uX//gQtbMM9scBdZ7qY0fgolNxRlH9RJbaclQidsr0ZbjDqxiyYGA/CsQ1
 yVLel2BECdi5qgE4qrc5aXYovpNB+4g=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-osKuLPkuNaij1HGe5KrtRA-1; Thu, 28 Jan 2021 03:17:09 -0500
X-MC-Unique: osKuLPkuNaij1HGe5KrtRA-1
Received: by mail-ej1-f71.google.com with SMTP id rl8so1853434ejb.8
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 00:17:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oTfiDzacX/lj6b1wF5/HWzeeeNoGMsPiEQqsjAdIfLI=;
 b=lauVYL2sVMDgW7W3s16I0jpZj1ZbTATcry+aKlRfscvkSHfKzOj4MEeQGH1HuMp5NO
 XZYgZKxgaW7fcOTeATBeGZKdTumHdm/qBAtK7yRn2WN73ldMriRu9Zl9d3QrpF7+fFj0
 eX5TlDT9zu1+XkC0Jhg4DfjyjQtRlaP/genNHqzla9ffvbWSbhJ3d6lEisKZKaH6maAN
 n+5d27LxaiGlLRHYcmWwt56BSxOo1PG/kQgy21VNd0XjCf+MgjLR98nMpML6MslyN55+
 bkuiFh5ZHeOQMSWyTbQg3BXW6zkv1fILatEmi/p7P64YXuDMmSAPAi8CUwQh0nLD2RXL
 Q1Fw==
X-Gm-Message-State: AOAM530JAHtA2zBfYWwJs6Uq+M/tK5vJYtYb7k4NAPs327g60Ys4VA59
 X6aVqxh3Gb3xrvYjYsgpmrwPDiOk83d1KWPLLP7jht/QB6avDmMbkkZ386QLnZTgh/tIi/AwBRm
 LZADaEAcTPieERbY=
X-Received: by 2002:a05:6402:50ca:: with SMTP id
 h10mr12656203edb.181.1611821828611; 
 Thu, 28 Jan 2021 00:17:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+UE/zcy7OmULGal90kvSqvPMgLdJZvepQytrNjGPrGSmZJJsw0UsEyVaScb6Txv/mRtYGFg==
X-Received: by 2002:a05:6402:50ca:: with SMTP id
 h10mr12656191edb.181.1611821828447; 
 Thu, 28 Jan 2021 00:17:08 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p16sm1916223ejz.103.2021.01.28.00.17.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 00:17:07 -0800 (PST)
Subject: Re: [PATCH] fuzz: fix wrong index in clear_bits
To: Qiuhao Li <Qiuhao.Li@outlook.com>, qemu-devel@nongnu.org
References: <SYCPR01MB3502E9F6EB06DEDCD484F738FCBA9@SYCPR01MB3502.ausprd01.prod.outlook.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <140b3f2a-56a9-91bb-2b5f-91bc60dd1f92@redhat.com>
Date: Thu, 28 Jan 2021 09:17:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <SYCPR01MB3502E9F6EB06DEDCD484F738FCBA9@SYCPR01MB3502.ausprd01.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
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
Cc: alxndr@bu.edu, thuth@redhat.com, bsd@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/01/21 04:59, Qiuhao Li wrote:
> Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
> ---
>   scripts/oss-fuzz/minimize_qtest_trace.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
> index 4cba96dee2..20825768c2 100755
> --- a/scripts/oss-fuzz/minimize_qtest_trace.py
> +++ b/scripts/oss-fuzz/minimize_qtest_trace.py
> @@ -261,7 +261,7 @@ def clear_bits(newtrace, outpath):
>                   data_try = hex(int("".join(data_bin_list), 2))
>                   # It seems qtest only accepts padded hex-values.
>                   if len(data_try) % 2 == 1:
> -                    data_try = data_try[:2] + "0" + data_try[2:-1]
> +                    data_try = data_try[:2] + "0" + data_try[2:]
>   
>                   newtrace[i] = "{prefix} {data_try}\n".format(
>                           prefix=prefix,
> 

Queued, thanks.

Paolo


