Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A1A6EA3AF
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 08:19:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppk6f-0008FL-Q2; Fri, 21 Apr 2023 02:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppk6b-0008E9-4V
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 02:18:50 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppk6Y-0002Hl-Sv
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 02:18:48 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-2f6401ce8f8so807931f8f.3
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 23:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682057925; x=1684649925;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PO/a5ShqFCJtMSbVB2B854ubOLQvpt0irsUM9nDwxRc=;
 b=QFF/+1KSEW1HTqGSpj7oUQ1wTXPNOX5nAGRYXt3EHwYRKOqsYEUlDyBdFD1d7i7Ml6
 hnnA4yyU6w2B8nNFbWkgI16lyJkb3vkQPSeVVPB2Vjub3EWGiSm99VKMwc0UgP0dvFiM
 Ikqw4jJHH/dEF+/VS6LwneGyuH7qkz2wXfF423XYgtHvPBpTZmoM5+jpb37dzy+l3Ecf
 AOcpAmbkx7AgsWzcV7qouV9wwRdtUQe2gteLVgy2v15VZg7RSscwsqE30b8jYdlqM44/
 yoUc0k/5E5cEA//B7c1cF5VhOcL7vpCas83RDAiiPN1KvJk6LOpgyh/wUOQh/R+qT2ny
 lksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682057925; x=1684649925;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PO/a5ShqFCJtMSbVB2B854ubOLQvpt0irsUM9nDwxRc=;
 b=QQ24Avn12cRe+mPZzw7meJG+XLDXbkTvQ+GDdkyls5TuHPwPNM4R4QkyVDCHSQs2SH
 KGIboxHX6q/n5VntqoZ3X5H491t6BTuek/m7eWCB+bU8/Q3dicH8MtYlLb8/9Kd7+IHC
 ipF/RXJhBHGF19/+wE5yrKgihCXuvly7Bz/PE76JyrFho4h6cGtc4kEc45hlD4j+eJ3i
 bDPQU0HFfrjqXQ7ZdG1zMKXKbsWA+4oF7aFNBHgjRerKOwCgCRawg6n98FDCmPHRkPT5
 obWfM9UaDM2WToI7BB4qZNDCQjHIWrmtj0QJsd27Bln+DxDzcO6EciMvfBZKSAgjJwMp
 Vnzw==
X-Gm-Message-State: AAQBX9fvQn05TW3trntQ7Yy8r6s1r6mnSpu/ZD2S1ehHGRNKtib0ubvZ
 We0/LX1i3ErV88c+gqQVwc+mrA==
X-Google-Smtp-Source: AKy350bZtx0NZllV7eYkf7RGjWju5S3OHEJpkoSmenRioZuIrySL00cV/1RwpGH/0Cf818sEq0czFQ==
X-Received: by 2002:a5d:428f:0:b0:2d4:751d:675b with SMTP id
 k15-20020a5d428f000000b002d4751d675bmr2886188wrq.35.1682057924837; 
 Thu, 20 Apr 2023 23:18:44 -0700 (PDT)
Received: from [192.168.69.115] (min31-h02-176-184-28-119.dsl.sta.abo.bbox.fr.
 [176.184.28.119]) by smtp.gmail.com with ESMTPSA id
 q9-20020a1ce909000000b003f177c3672dsm7076808wmc.29.2023.04.20.23.18.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 23:18:44 -0700 (PDT)
Message-ID: <d864d359-56c1-6c0d-38c6-a1fbb7c143b9@linaro.org>
Date: Fri, 21 Apr 2023 08:18:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 2/9] qemu-options.hx: Update descriptions of memory
 options for NUMA node
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 peter.maydell@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, Juan Quintela
 <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Yohei Kojima <y-koj@outlook.jp>
References: <20230420155723.1711048-1-alex.bennee@linaro.org>
 <20230420155723.1711048-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230420155723.1711048-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 20/4/23 17:57, Alex Bennée wrote:
> From: Yohei Kojima <y-koj@outlook.jp>
> 
> This commit adds the following description:
> 1. `memdev` option is recommended over `mem` option (see [1,2])
> 2. users must specify memory for all NUMA nodes (see [2])
> 
> This commit also separates descriptions for `mem` and `memdev` into two
> paragraphs. The old doc describes legacy `mem` option first, and it was
> a bit confusing.
> 
> Related documantations:

Typo "documentation".

> [1] https://wiki.qemu.org/ChangeLog/5.1#Incompatible_changes
> [2] https://www.qemu.org/docs/master/about/removed-features.html
> 
> Signed-off-by: Yohei Kojima <y-koj@outlook.jp>
> Message-Id: <TYZPR06MB5418D6B0175A49E8E76988439D8E9@TYZPR06MB5418.apcprd06.prod.outlook.com>
> ---
>   qemu-options.hx | 25 ++++++++++++++++---------
>   1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 59bdf67a2c..174f0d0c2d 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -405,15 +405,22 @@ SRST
>           -numa node,nodeid=0 -numa node,nodeid=1 \
>           -numa cpu,node-id=0,socket-id=0 -numa cpu,node-id=1,socket-id=1
>   
> -    Legacy '\ ``mem``\ ' assigns a given RAM amount to a node (not supported
> -    for 5.1 and newer machine types). '\ ``memdev``\ ' assigns RAM from
> -    a given memory backend device to a node. If '\ ``mem``\ ' and
> -    '\ ``memdev``\ ' are omitted in all nodes, RAM is split equally between them.
> -
> -
> -    '\ ``mem``\ ' and '\ ``memdev``\ ' are mutually exclusive.
> -    Furthermore, if one node uses '\ ``memdev``\ ', all of them have to
> -    use it.
> +    '\ ``memdev``\ ' option assigns RAM from a given memory backend
> +    device to a node. It is recommended to use '\ ``memdev``\ ' option
> +    over legacy '\ ``mem``\ ' option. This is because '\ ``memdev``\ '
> +    option provides better performance and more control over the
> +    backend's RAM (e.g. '\ ``prealloc``\ ' parameter of
> +    '\ ``-memory-backend-ram``\ ' allows memory preallocation).
> +
> +    For compatibility reasons, legacy '\ ``mem``\ ' option is
> +    supported in 5.0 and older machine types. Note that '\ ``mem``\ '
> +    and '\ ``memdev``\ ' are mutually exclusive. If one node uses
> +    '\ ``memdev``\ ', the rest nodes have to use '\ ``memdev``\ '
> +    option, and vice versa.
> +
> +    Users must specify memory for all NUMA nodes by '\ ``memdev``\ '
> +    (or legacy '\ ``mem``\ ' if available). In QEMU 5.2, the support
> +    for '\ ``-numa node``\ ' without memory specified was removed.
>   
>       '\ ``initiator``\ ' is an additional option that points to an
>       initiator NUMA node that has best performance (the lowest latency or


