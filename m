Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F31E84FC0EA
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 17:35:51 +0200 (CEST)
Received: from localhost ([::1]:55694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndw50-0008Cw-Mp
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 11:35:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ndvtn-0000S6-Pc
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 11:24:19 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:42617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ndvtl-00059S-T4
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 11:24:15 -0400
Received: by mail-ej1-x62d.google.com with SMTP id i27so31621120ejd.9
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 08:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=2tdmZQ+h8Lg4loXWWbEBl6cJo3pt3btsSXZEy3mLyrs=;
 b=fKECenc+vderWcmx1Zoa/AOzT415a6j+SOjUICVt9moJsX/mlxC/1HcVdBFGc9qdq5
 FjDDaugYPqJ4vk/FEfEN/0gFwD+cTmhMIYmYgSJ3PaGNonKZU8o9Q4/V1+8CCzdWkQzv
 P0nxNq9Snk8he+rAsMBVyRQRHJi5YkLMwX1GgQveKllxPFVu1gndO5fzsdOMMtvmv4X+
 gJ6iYZjNMbtUilvUtY6yb5P7aM+vnDXZVz79vYLMHpIDJgrAoMgM/X6OtCMsrTx10KnU
 m+OSFQ6jazKgaoGoAfUU6fOclMJqOZ6XSgL51hXKarUZnmNOs/q1WFAqEM/I/Q9exalS
 XG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=2tdmZQ+h8Lg4loXWWbEBl6cJo3pt3btsSXZEy3mLyrs=;
 b=PmOacAG/eFXT0C/8yuxcq1AYmbU/fFQcl4cKHdpNStOv7sCQIdHagrj0LXMmwefMWN
 i08usqwxRVGFjZbkLTNGF6u0HhLGhsK3s7nerio/KEfONNFcNdE4IpOyaOFFVVCiyRXF
 GGDJenB2ECnxGvaafv/RgH6u4JVqbkL62TZcxHrKaY/oeAYyeDe01Cz3YL7qD7fwB4GI
 uluxSzImlxFVc6QU38fqBCrTwdR6McPE0ofSi46m6/nzwT4nXFOfIgGedW9YsVMkcTIi
 A+FFqtuFwar65vQGNsaVLGI+6TS5pbSbVDokrLgSsiT2aELm3cFxIYTKGPeb+NsDeKE2
 TgYA==
X-Gm-Message-State: AOAM531ErT6O0ZnVY0/6PZ5YzSKsYyAgpmr8F4f5YsYZuwCJ/FSMvyu/
 m2ucqw3RpubPwzGXE9FmqEGurA==
X-Google-Smtp-Source: ABdhPJyqp6OLWEq1yxaMyZmDxPGI5utAumDUtXhRDbiYIXEGAjmPIrjDdX7lgqJnOb0NQ1W9NPcHbw==
X-Received: by 2002:a17:906:5597:b0:6ce:f3cc:14e8 with SMTP id
 y23-20020a170906559700b006cef3cc14e8mr30241737ejp.426.1649690652063; 
 Mon, 11 Apr 2022 08:24:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 y22-20020a170906559600b006e858ba2549sm3847686ejp.49.2022.04.11.08.24.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 08:24:10 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CFEC21FFB7;
 Mon, 11 Apr 2022 16:24:09 +0100 (BST)
References: <20220410035854.97056-1-jianchunfu@cmss.chinamobile.com>
 <c05d3c19-73d0-b16d-d1f1-dbb2fd817200@linaro.org>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [RFC] migration/dirtyrate: check malloc() return
Date: Mon, 11 Apr 2022 16:22:45 +0100
In-reply-to: <c05d3c19-73d0-b16d-d1f1-dbb2fd817200@linaro.org>
Message-ID: <875ynf1w4m.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-devel@nongnu.org, jianchunfu <jianchunfu@cmss.chinamobile.com>,
 dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 4/9/22 20:58, jianchunfu wrote:
>> Handling potential memory allocation failures in dirtyrate.
>> Signed-off-by: jianchunfu <jianchunfu@cmss.chinamobile.com>
>> ---
>>   migration/dirtyrate.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
>> index aace12a787..5dd40f32c8 100644
>> --- a/migration/dirtyrate.c
>> +++ b/migration/dirtyrate.c
>> @@ -523,9 +523,17 @@ static void calculate_dirtyrate_dirty_ring(struct D=
irtyRateConfig config)
>>       }
>>         dirty_pages =3D malloc(sizeof(*dirty_pages) * nvcpu);
>> +    if (!dirty_pages) {
>> +        error_report("malloc dirty pages for vcpus failed.");
>> +        exit(1);
>> +    }
>>         DirtyStat.dirty_ring.nvcpu =3D nvcpu;
>>       DirtyStat.dirty_ring.rates =3D malloc(sizeof(DirtyRateVcpu) * nvcp=
u);
>> +    if (!DirtyStat.dirty_ring.rates) {
>> +        error_report("malloc dirty rates for vcpu ring failed.");
>> +        exit(1);
>> +    }
>
> You might as well use g_new(), which handles the sizeof and
> multiplication, and error reporting.

It will also assert if the alloc fails. If this is an allocation QEMU
can recover from then you need to use the try_new variants of the
g_malloc/new functions. However here we are exiting so no actual check
is needed as the g_malloc will exit for us.

--=20
Alex Benn=C3=A9e

