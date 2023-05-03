Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F36BA6F5549
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:51:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu98h-0002Ln-NJ; Wed, 03 May 2023 05:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu98f-0002LZ-Lp
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:51:09 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu98d-0007WB-Pc
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:51:09 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f1958d3a53so48862745e9.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683107465; x=1685699465;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r2jXfyhBFVxtp0BH59YXWFkWuwTP/6VCKWdrHmXAVsg=;
 b=BJRL3JnX/LuFReo9S5AY6K0MMHYUSkIkdXTp0+JFnNlHo2AbTPcaatQUhs44/1Lc7H
 d1Dche0L/17NEeYAvL5wkK0+PWH3c4ttDNha2Yjhl5hv8jw9FG5IFIUsWcDNejCGTPU4
 LPR2GIa7DGmws4eKFz7IEjg3Po5TZ92Oc3axa3jWcLoyif420ISfx22bincDn1gvqP5H
 asjkaoZiqS3X/3prjwtFEdvMNdtu9UNs7hYWZ8KmVzKjvvY+o3sW1xGctmG5vYVk28tr
 VqkzwgAuwj/7M0JgVmmO+qMcykunZwV2+PLvxb/LrS6stKo8gKIe9dhnQdump8wb66H+
 l3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683107465; x=1685699465;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r2jXfyhBFVxtp0BH59YXWFkWuwTP/6VCKWdrHmXAVsg=;
 b=lD29X6NmPeiFH3n2iQJ0vQ1+h1AINL2QhAXS02lY5uC6S6kNAIGJ1DBoqjVF79Un6M
 7sPt3dFoY4vUJVrbRstuGRG/R270xgn6G7Tt87T7oT8rsbNmEUFtZjRWd7f76SA6QjDs
 aeRI1J4CiKJjVrMqjl+vIloOr6TynwbqfrtSQ/z5S2eT8YRjD5R09x/b4TfKDO3u2gX2
 pQW+wOwzvLovB0mt7ioPcYPbwP88XmIU4AYiNEOQa+OMrv2URJU0r9q5jiVamSJdaEiZ
 OShHBKhmzPGi45xRmTg8A1iexxLnX/1m2BhV6+VjuLPK2j2E/20CwdJAs6/saBNVCMz3
 wGpA==
X-Gm-Message-State: AC+VfDxC8kUW1xOR5sKICwPjjiJhGDavSBwDf9jlZ6d/4KiuRKgo40ob
 fhyyNmzMxDfxyWSw8rQnkSnaZA==
X-Google-Smtp-Source: ACHHUZ7hjuGTiFjsnKuzrI6ooavLqeYTZQ/zC17IZVwBQRf9lRoxXHwKQ8s5frMpYnCwyFWRMOru6Q==
X-Received: by 2002:a1c:7707:0:b0:3f1:78d0:fc3f with SMTP id
 t7-20020a1c7707000000b003f178d0fc3fmr15067844wmi.14.1683107465210; 
 Wed, 03 May 2023 02:51:05 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:c01d:9d74:b630:9087?
 ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a7bce15000000b003f17003e26esm1359977wmc.15.2023.05.03.02.51.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 02:51:04 -0700 (PDT)
Message-ID: <db029346-afc9-429e-b129-166c33b0461d@linaro.org>
Date: Wed, 3 May 2023 10:51:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 02/10] trace-events: remove the remaining vcpu trace
 events
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Kyle Evans <kevans@freebsd.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Riku Voipio <riku.voipio@iki.fi>, Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 Warner Losh <imp@bsdimp.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Eric Blake <eblake@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20230503091756.1453057-1-alex.bennee@linaro.org>
 <20230503091756.1453057-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230503091756.1453057-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
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

On 5/3/23 10:17, Alex Bennée wrote:
> While these are all in helper functions being designated vcpu events
> complicates the removal of the dynamic vcpu state code. TCG plugins
> allow you to instrument vcpu_[init|exit|idle].
> 
> We rename cpu_reset and make it a normal watch point.

"... normal trace point."

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

