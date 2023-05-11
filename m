Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 966A46FF7E7
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 19:01:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px9eu-0003jH-A9; Thu, 11 May 2023 13:00:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px9es-0003j6-Am
 for qemu-devel@nongnu.org; Thu, 11 May 2023 13:00:50 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px9eq-0002Wl-QF
 for qemu-devel@nongnu.org; Thu, 11 May 2023 13:00:50 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f415a90215so66891355e9.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 10:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683824447; x=1686416447;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=20mL6ahqZNIiZWHzDkwRRqSTrSHs5qvtBtXea5jtm1c=;
 b=C5h8eMKhzZkMsDE4vrcprnyOA3xIZHIOljluvgT7z/j5/TaPgdOE5KtvhAxNVgMygv
 gRzMOJJRYG303v1YhyT/fxjTxwxnmK+czMyqLuucGz0fceij4G0PeZ4sBWYVYduuzd/p
 HJDdX5/XjP3Kak/W15v2jk11/HIqB6xqwbClYOI3xcQdOJgNNxkag8BAhS8ktQGy6zu8
 bGOuttGtndZwmU+JdH0CpH+PVFS23UjbeyFq9kS3GjYfh08neWq8GdnBDHY6WH2uJaf4
 /MqsZ7wC9vsE1mbnP9dZY3h2GyxE7iYw8hQWKlSRsYxrcOb3Hz5ld7Vko9YcgxwCIbKz
 iD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683824447; x=1686416447;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=20mL6ahqZNIiZWHzDkwRRqSTrSHs5qvtBtXea5jtm1c=;
 b=cvWCgEkvggSBfq1AT8yJ/V7ketsu+w+jkSZ9OjmAxqWNQZ9/v6AZO3pY4dvP7TXfXY
 Rv4TymkZGCUlYqOSF6Sm+admW0256laHGViTEh9tVABshW85doqaIVmCfvMjORyR8vrY
 fqLJCtVEylgo9T4ElhEtEw0cAA7dk9xrGPT3M37enBpyeRnQAAJZFYgNo0nN9CmRKy2e
 4WFILtO8Jm/hgoveavX1E1cpdUnwkmDji/yWOEbu+y4woVzvBui+1WU3eQwP7mw8MsI8
 AKuqg7BXxNoPSWsoLyahy91jOH2H54d4iw19j9k8jrudC29iNQUO0svp4CLITZndRr71
 k+CQ==
X-Gm-Message-State: AC+VfDwIV8fBIjpBLtSBLnyKLsDZkc/CODe5nCnhgsvrTfPLa400WyNv
 0nYRwQKJg2EfuVMWmB0sX8iW3A==
X-Google-Smtp-Source: ACHHUZ4JAbEz8iaMvf9kHYDNmTJ28HMqupvPmGf7jwix3SPCNJZHP3T3k/y/eiBXy1iXZTjtUInomg==
X-Received: by 2002:a05:600c:c5:b0:3f4:2610:5cd0 with SMTP id
 u5-20020a05600c00c500b003f426105cd0mr9483593wmm.7.1683824447184; 
 Thu, 11 May 2023 10:00:47 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a05600c474c00b003f07ef4e3e0sm12909126wmo.0.2023.05.11.10.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 10:00:46 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 874461FFBB;
 Thu, 11 May 2023 18:00:46 +0100 (BST)
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
 <20230503072331.1747057-24-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng, qemu-devel@nongnu.org
Subject: Re: [PATCH 23/84] tcg/loongarch64: Remove TARGET_LONG_BITS,
 TCG_TYPE_TL
Date: Thu, 11 May 2023 18:00:42 +0100
In-reply-to: <20230503072331.1747057-24-richard.henderson@linaro.org>
Message-ID: <873542zttt.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> All uses replaced with TCGContext.addr_type.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

