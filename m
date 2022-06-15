Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C6A54D1A8
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 21:31:57 +0200 (CEST)
Received: from localhost ([::1]:51464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Yk6-0003dz-AT
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 15:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o1YfK-00074y-3i
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 15:26:58 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:46930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o1YfI-0003Ug-JN
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 15:26:57 -0400
Received: by mail-ej1-x629.google.com with SMTP id v1so25111035ejg.13
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 12:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yX1IyI1KGlLG8bI4WswaihspQPv0S+C63smSfV2HZlE=;
 b=DUjhIdxncFeyiqE1KBb7SdG+7v/PsCVtKVWZZ9Nl+vuHd5SQMt++Ta6aHyMnpYUQRk
 Qpr09l885zeGmF5fsVtx5Ss7nKOuImq9HAKi/TgVO0XrrG/gjTh5T/DBvmp3SEcz0WAw
 8npiv+LR9WGHuGPQ3bPCW8kPoRwUZ0m9T0Llqyp7RDuz8VEKFMzFUh0vis217PSRVk8K
 lwNbZOziyIhL7AiL9CDPI23PvIolx4juI6LfUjt3BBOAgl0va+ex9BRhyyoMLhZ5WD7U
 WAuOq+6eUazPclDLcuIuI4+zPejwOyzGBH23aIDFFyQWBpzW1OzmYT2A9fDryDCK8LO+
 qlOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yX1IyI1KGlLG8bI4WswaihspQPv0S+C63smSfV2HZlE=;
 b=4i2+sEh+KLHFDFC1I74+FBr29vbmB2ES4h5u5HuX9f2aS4hqA0S0MXU93VMu+nsLDm
 kwkLb6TAj7HpHEIAXXyj32FMDcbExJBVdasOQYk0n6yBpCSc2bKnoTOhGCNIX/zcOyDZ
 OpVzN9huH1LW8rU9A3ot09uBkzcGytgg0ip16PaJFfkAeV9963A6YefmbBKxUyA+YRV2
 tbEc5wx5SNfPefte6dzIZiJWnn5hqQzzg7TxovelnHcn5j/dzB71cqs1+1wdcdih8ErU
 8ZKnEev/tD0/nfb4HDCWtFAKf7jK72lFM2rfup0YeYftEFbCDPbb4496voiSiO6Oj76e
 v80A==
X-Gm-Message-State: AJIora/hzJRu2+IOTwzPL3Mj4DyCF+yvM0/+MHY6HdfwLyi5a20Uf50B
 XtMMQmYOFFCYZMt/mwtdjmvI3bINAhU=
X-Google-Smtp-Source: AGRyM1sAgfUVYqh8led7QlFEerLKUBaYjqgfq1T74aA0VhbZT69/z8OEyYoIZ7mXFC3B27z7VV94lQ==
X-Received: by 2002:a17:906:7793:b0:715:7b:4e9f with SMTP id
 s19-20020a170906779300b00715007b4e9fmr1152243ejm.117.1655321214095; 
 Wed, 15 Jun 2022 12:26:54 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 h19-20020aa7cdd3000000b0042dd2f2bec7sm10401edw.56.2022.06.15.12.26.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 12:26:53 -0700 (PDT)
Message-ID: <6b21f0b4-2744-f4da-8015-fc07f3786b21@redhat.com>
Date: Wed, 15 Jun 2022 21:26:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 4/7] cutils: Introduce bundle mechanism
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang
 <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20220615155634.578-1-akihiko.odaki@gmail.com>
 <20220615155634.578-5-akihiko.odaki@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220615155634.578-5-akihiko.odaki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
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
> +void list_bundle_candidates(const char *path)
> +{
> +    const char *dir = qemu_get_exec_dir();
> +    int i;
> +
> +    for (i = 0; i < ARRAY_SIZE(bundle_formats); i++) {
> +        printf(bundle_formats[i], dir, path);
> +        putc('\n', stdout);
> +    }

This is not bisectable, bundle_formats[] doesn't exist here.

Paolo

