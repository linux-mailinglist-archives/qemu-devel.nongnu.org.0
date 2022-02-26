Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E009B4C5475
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 08:42:20 +0100 (CET)
Received: from localhost ([::1]:50422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNrie-000611-0a
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 02:42:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nNrf6-0003sC-RQ
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 02:38:40 -0500
Received: from [2a00:1450:4864:20::336] (port=55196
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nNrf5-0007uN-EC
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 02:38:40 -0500
Received: by mail-wm1-x336.google.com with SMTP id c192so2855727wma.4
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 23:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fRdDn6DMBJy8gHy3i/Yr3lfgeWLzNOVIlMzNNs216Eo=;
 b=flvnT2yiJ4KfdjjxifAAi6agUwwVs5tG40yyZZOAMOicNgH3reDuy1YJnsLkz1HR9z
 wHSz/P8fLHBRmytu8s7LLCodS3hFB/v7U1akvPi2ruVdLcAN3scubBFUNEAKB2wAcD9P
 tOKg7MqRVGUI7oFtjw/820yylwaARo8L0b3Hj5i0qI0gwYl+H/s96JwQQzKOyZU4zoEp
 GE28MXI43Z5+X+ePMlAlV2MqYqrmMJG7eYCBvw5KMxheQ3We/HlY/JzoMrYH8iJzAMyN
 AFuAZ4eT615JxBLg+z6yP6/gNEN78tXDCBdvgMVi1JjFCsJKAHVHEsCy+9twoNOQoRtQ
 rhDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fRdDn6DMBJy8gHy3i/Yr3lfgeWLzNOVIlMzNNs216Eo=;
 b=x1ykkBXHlc3KgYXlAYeZ5s9383AiQdyaPBt+dXG9nDa4Klrw72iXkjLbDd6V0nbrWc
 Oc2WD4mrNpjzvHK/7k5CbvkgIM3KVF3HGgnTkWzAqj0TA3J6ZwyC6KdCqa+qJeADY6la
 ZEXkxHmMdWLJBce28aZTt9xVv1Owsp8ZYv7GwhirQcq6kW8lxy+m8dcc1I3maMFxBtZ2
 VP5n2y2SKrpHgo72mgDMa3KKnz122zXsWVmKkbPm3U00X4Fg/MhdmDrZrw64aKIROzqF
 VWKa7MXjR15UcYMUY6IRzidfpt2lY05ySYmvejoUPu6zsHvl5ry4Eg0koEw/1YcLDMeS
 H2Fg==
X-Gm-Message-State: AOAM533ALfabL8xEQD0OHmIP742MiA4Ve5/Pje/bXND9iBzy4Sg7+LJS
 5yUtsa491hlZO9qn/2PbqRs=
X-Google-Smtp-Source: ABdhPJzUX4IKuX3fvIUekGU2Jc4MG8sGlaT7HBq8Ns+2mmGhkBM6j2BxcZqb40Flyb700ulLQl9Q3A==
X-Received: by 2002:a05:600c:4ed0:b0:37b:e983:287b with SMTP id
 g16-20020a05600c4ed000b0037be983287bmr5605288wmq.156.1645861117727; 
 Fri, 25 Feb 2022 23:38:37 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 k25-20020a05600c1c9900b00381481059a3sm660226wms.2.2022.02.25.23.38.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 23:38:37 -0800 (PST)
Message-ID: <8d5b4245-56e7-8384-4104-33d3ab1adf42@redhat.com>
Date: Sat, 26 Feb 2022 08:38:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 6/8] char: move qemu_openpty_raw from util/ to char/
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 QEMU <qemu-devel@nongnu.org>
References: <20220222194008.610377-1-marcandre.lureau@redhat.com>
 <20220222194008.610377-7-marcandre.lureau@redhat.com>
 <CAJ+F1C+QOAcjAiAY=7jcYgjJTQ79PTUDBRoJ3fzyHha2Syw4tA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAJ+F1C+QOAcjAiAY=7jcYgjJTQ79PTUDBRoJ3fzyHha2Syw4tA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/22 18:04, Marc-André Lureau wrote:
> Paolo,
> 
> This patch is ok, but in some (new?) circumstances it fails with freebsd 
> and reveals that -lutil was missing for kinfo_getproc() in 
> util/oslib-posix.c. Please add:
> 
> -util_ss.add(when: 'CONFIG_POSIX', if_true: files('oslib-posix.c'))
> +util_ss.add(when: 'CONFIG_POSIX', if_true: [files('oslib-posix.c'), util])
> 
> (even better if we made this specific to freebsd I guess, but not 
> strictly necessary)

Looking again at the patch (because indeed it broke CI :)), I'm not sure 
it's a good idea.  The code seems to be partly taken from other projects 
and doesn't follow the QEMU coding standards.

Paolo

