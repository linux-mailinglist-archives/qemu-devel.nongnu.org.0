Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 936776A58BD
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 12:59:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWydL-00085E-OR; Tue, 28 Feb 2023 06:59:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWydK-00084X-53
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 06:59:02 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWydH-0001XP-NZ
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 06:59:01 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 p23-20020a05600c1d9700b003ead4835046so802451wms.0
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 03:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Cu2HY+g3VzeC7uyCoEf0D0JLI5yrMiBoPgvJVLxHObg=;
 b=h5gTV3+M0jFAcKNrhJwhcVnjKeZcT5o4APilOMlg45MVRZCAeN6VkGYCX6zOtWXcMF
 h2/EvAI/ci4C8TM3/oMobol0t54ZIbQA5KwuoJvki8bbEDlXIca3xv2Tb4KM7yBk3UBH
 +qgj9kPgZfkb+VtKZCEcF+Z3KZfKG+OcnbV/6ZnAwqZrLj08aZGeJDURiKCib7O8c0Wk
 Jjihag3hcqyD6LKBYpUVT9o68ocD2uCs0vA47y6Dy+SecuyIBMSvmSmvk9ADutroK/g2
 TfgyePhQMa4iEoMyNoDGQWg6FJn4eCaIcf3qzf9QWGekyJMJRBE94vMCfizqVpDdFQHK
 AlIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cu2HY+g3VzeC7uyCoEf0D0JLI5yrMiBoPgvJVLxHObg=;
 b=E/7WWJrzawNR0nz32lyo10pEzyeRNsGOICRKK5UPdibtm4E/LqhM+Vl4G5UULK/mpN
 f14IZ8JMu+SU4KQE8eJjf1ORp1Fl25MbROiZn1gieQxpLovHHmTHHBFntTT1zY6Ylq4s
 TkRjC0nfRvqy9GwKFtMn7u7qnDPii1vG8POvn+xVNoHCgPAeBpTKKQoD+DuDf4TZ1JdO
 /OxS90Vb2HQ/TZJ+uRuP5pHFVrPTiCNwLKVrxXMlsVhrD1j8T9eSDnuvX+e+P46cJjWc
 /gWVcPRBGEJUbzZUha6J+izNPmobuAbus2Cm3KThBRdeyy1LAAJWzmNACFwnq/ORNMlG
 gwYA==
X-Gm-Message-State: AO0yUKUDTQJIFE/eqLtxC21n9p0M92ZyeeBVpQ0Lx7rhKZS4Q15r6cB4
 H2mKtCSQhtnjpiIVCBr7kgw48A==
X-Google-Smtp-Source: AK7set/San4WGyyTQLKDreCmQvqDw1DBGczJLSFqL3CM8aRwh64BZf+xY8i6kt/18LeFzWd3y6sHow==
X-Received: by 2002:a05:600c:3d8f:b0:3e2:d3:b2b6 with SMTP id
 bi15-20020a05600c3d8f00b003e200d3b2b6mr2064158wmb.14.1677585537952; 
 Tue, 28 Feb 2023 03:58:57 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r14-20020adff70e000000b002c567881dbcsm9635844wrp.48.2023.02.28.03.58.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 03:58:57 -0800 (PST)
Message-ID: <c6081ec9-d192-aa24-f8f7-717d7957c67b@linaro.org>
Date: Tue, 28 Feb 2023 12:58:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 0/7] testing/next: docker.py removal and kaniko updates
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Li-Wen Hsu <lwhsu@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Beraldo Leal <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Ed Maste <emaste@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Hanna Reitz <hreitz@redhat.com>, Bandan Das <bsd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Darren Kenny
 <darren.kenny@oracle.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
References: <20230224180857.1050220-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230224180857.1050220-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 24/2/23 19:08, Alex Bennée wrote:
> This series attempts to remove our dependence on the docker.py script
> and build things directly with the appropriate tool. I've been
> noodling around with how we build images on gitlab to see if they can
> cache better because the normal case should be we don't need to
> rebuild everything if the upstream distro hasn't updated its package
> list.
> 
> Anyway what do people think?

Removing dind limitation is interesting.

Unrelated, can we tag registry.gitlab.com/qemu-project's
docker images along with releases?

