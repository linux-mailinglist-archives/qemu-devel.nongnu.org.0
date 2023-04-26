Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B4B6EF979
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 19:33:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prj0M-0005Bj-26; Wed, 26 Apr 2023 13:32:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prj0K-0005Bb-TS
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 13:32:32 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prj0J-0001SU-C5
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 13:32:32 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-2f8405b3dc1so4638742f8f.3
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 10:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682530349; x=1685122349;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ouk+CFI6kg611Cio4HE9+naBIppCiz0knrcE/G2ANHU=;
 b=jesq5xE9F7qsJSzdnsh0yNnypqKwx1xUJ0l0DangCifK7oFM0ZwSg8wuLwQu1zw1WY
 qDOf+rXEM3LQZNsUobQH+IGCwFle2D8oQl7oaHVsHmhP0vppvCIFdDpOXH0zQJ3C8LFh
 ckFQF2Js2S+vLmu71/lRkCvOBrfv3G4OQ6/KmcDCscbgQ9tgNTl3PRQ7S9eAMFM+mlIR
 rzG/sLIVwRcz6zkWoW+biw+hGiBaNBGit2aGZeCY2sFZT7nWo/XTl/b9sJ9Lpfl1pWau
 OPPbsrM+nUbBqvcauRPFjPf3RgAb75UU6BB7MUTKIkbUJwWkUEaj9QbtSbf8jqj4QLA1
 43mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682530349; x=1685122349;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ouk+CFI6kg611Cio4HE9+naBIppCiz0knrcE/G2ANHU=;
 b=H1v4xHLV5Txtnf+cxcux6HdYgrUg2ZT7OrIGD3DqHD1tYKcVkJehtZvXXtHK+rx/JK
 SCPPPdUeuAJiAvKhImyyT6uQm0kAELWESUl7O0onj6vZuckF2P4Oj/rpm2JfC7QE2Eu6
 uFtwKZmdPXPKNyIP0NqYxIdHO7LU9jo9K1Um1+jtVQd3g+pcTpuMAaXy8Ec5dlxJEVJy
 lm/brCzmBIcQ4L/5r+oup2H46tnKXYu+TnCPeHJyhQf2Sb/emqj2bI0cezAP9naIVUih
 7EkBDlO9wSEh05SpqaQiTclxsUBsSmOw24nxfqnkH9+/G6xpPjzaCFJLKs4XH9tar+ub
 ibDQ==
X-Gm-Message-State: AAQBX9dqtMdXxChxce18KrPX1vHG5F5NKSlIH0pPVGFD7KsHT00cccmp
 lztRRhMy5LsA2feuZPsvBD/w8Q==
X-Google-Smtp-Source: AKy350abAcawwMmqHWKCSrorBnDjFU4BiM4sEQcHrM95wdshI6Va066m9okxC87w9nAP77CDYD0MYw==
X-Received: by 2002:a5d:58e9:0:b0:2f6:1a30:605c with SMTP id
 f9-20020a5d58e9000000b002f61a30605cmr15607612wrd.3.1682530349266; 
 Wed, 26 Apr 2023 10:32:29 -0700 (PDT)
Received: from [172.23.3.19] ([195.167.132.10])
 by smtp.gmail.com with ESMTPSA id
 m7-20020adfe0c7000000b003048477729asm6249229wri.81.2023.04.26.10.32.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 10:32:28 -0700 (PDT)
Message-ID: <c9fd83bb-34d4-5f3c-3b75-6f0eafc70e0d@linaro.org>
Date: Wed, 26 Apr 2023 18:32:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 01/21] meson.build Add CONFIG_HEXAGON_IDEF_PARSER
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 berrange@redhat.com, thuth@redhat.com
References: <20230426004057.1318768-1-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230426004057.1318768-1-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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

On 4/26/23 01:40, Taylor Simpson wrote:
> Enable conditional compilation depending on whether idef-parser
> is configured
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   meson.build | 1 +
>   1 file changed, 1 insertion(+)

Are you not at the point where you want this unconditionally?
How long do you intend to keep this optional?


r~

