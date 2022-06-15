Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F5E54C396
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 10:35:37 +0200 (CEST)
Received: from localhost ([::1]:49162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1OUw-0000D1-V7
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 04:35:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o1OFg-0000lD-Cs
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 04:19:48 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:34341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o1OFe-00087b-TH
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 04:19:48 -0400
Received: by mail-wr1-x429.google.com with SMTP id c21so14313057wrb.1
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 01:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vmD0CmTYyUrCiauCc/ijtZ26xjZC0W83BSHEaQ+jT0I=;
 b=qIuf6lN84F2fj5Pz8EBb0I6DeYBIRWpVZM6jNrCh1IFmaadowDlNhhSC1K6c6kb0+H
 dfLXdaeetkxvV3F4ccJCpNsV2cqRgj8mXRGDv2Vj5nDNGt3YS9faWn0NsAGZW8+Qcw9h
 GaffuNlOKuZSJ3bK59B1y56d6+59LGSl13aycmD1fAF9NE2gmxBiu8UhX7TkAtS9lnAq
 QaLpo4h9RMOERHi6iFuKf99on2D9Nxv+a9aYxmgrPsIhJD7KbDvyosyfFfobHli5qVCE
 bTZ+92+lNGf3gFlEjIy6sX7GC0r3wgHmeq+kJnyQO4KyCRZtcrJqsxmawdDEx4q75MQ/
 4/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vmD0CmTYyUrCiauCc/ijtZ26xjZC0W83BSHEaQ+jT0I=;
 b=Ufu0a0J/syaIED3NwkskjwTcFt03U8EjoBdyktyp5Or7Y7yGWoZs9U1oYWv+tlgckS
 XSyFqziPpCEb9BTPE3XcCRFzOYStZZD0H5YZ2l6Av3+XDAWBJ3vaNG6gQY5s+Ek5ai4V
 db0XqunRDC0/zuehX4o0c/lS4Dsce797/NyY3m20Ed7o30ghSRTYoo/MllniLAOVTLw8
 Klvz4nL/W2t4ZNfTTOUiwlZN3jV5EmjJogZUjSnyh0WoUsISHJfWuFrxlQdR+f1nR3qq
 Mj2iNz8GjOeoZE0IjD/t6AHzaUGssvrNthY1UqeaU/JM5sw1cmMraC8SI+bs8iclwQTo
 MHGA==
X-Gm-Message-State: AJIora8SQ/cfMwicHDgNSE3oAkmMqzaL+/jALsC5V4u8PNoSi7qKqxML
 /Jtv1Y/CY+bR4U+qd9Yz7nk=
X-Google-Smtp-Source: AGRyM1v6tFmXrnu1NvOY98Ba7/MGGa+McmSeW4e7W42HS7gwLy1dH3SHzsgyEUrnomusO+MMBbxeOg==
X-Received: by 2002:a05:6000:108b:b0:213:abed:50fe with SMTP id
 y11-20020a056000108b00b00213abed50femr8587282wrw.425.1655281185459; 
 Wed, 15 Jun 2022 01:19:45 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 p6-20020adfce06000000b00213ba0cab3asm14307224wrn.44.2022.06.15.01.19.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 01:19:44 -0700 (PDT)
Message-ID: <77746ff5-b069-8657-5d64-24d03bca8a75@redhat.com>
Date: Wed, 15 Jun 2022 10:19:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 1/4] cutils: Introduce bundle mechanism
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang
 <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20220614210746.78911-1-akihiko.odaki@gmail.com>
 <20220614210746.78911-2-akihiko.odaki@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220614210746.78911-2-akihiko.odaki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x429.google.com
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

On 6/14/22 23:07, Akihiko Odaki wrote:
> diff --git a/util/cutils.c b/util/cutils.c
> index a58bcfd80e7..fe3bbb1c4eb 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -1086,3 +1086,36 @@ char *get_relocated_path(const char *dir)
>       }
>       return g_string_free(result, false);
>   }
> +
> +static const char * const bundle_formats[] = {
> +    "%s" G_DIR_SEPARATOR_S ".." G_DIR_SEPARATOR_S "%s",
> +    "%s" G_DIR_SEPARATOR_S "qemu-bundle" G_DIR_SEPARATOR_S "%s"
> +};

Why do you need both?

Paolo

