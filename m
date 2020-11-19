Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 478B72B91E7
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 12:58:06 +0100 (CET)
Received: from localhost ([::1]:38082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfiZh-0000hi-7X
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 06:58:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kfiXt-0007iC-Dp
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 06:56:13 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:40572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kfiXq-0002z2-8k
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 06:56:12 -0500
Received: by mail-wm1-x341.google.com with SMTP id a3so6491696wmb.5
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 03:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=6+mnefPYYUMtLLzAhCHln9YzYSJreVJtjI9cM4R9vCQ=;
 b=kXDZEsglo99gFPKEH2QkmDz6EAE4KjdlEoPDV2GuT2Qt/UWcHL4AYBYQF3re635zKi
 jhvdaaUWqEGyW3VCEWKrkPXDKnDV3vE/1HkKKXuobjoq8yiPZia832x/hEJF/6CacuiI
 lFZ7YBUYF5Mz+0S86FqSeajJAdwVplldDCJ4uW3sy9pFfJb15r0wBxIjlIxkg/iVGZjX
 79JQyHGL3fJEnIsaFkoVm434R+AQqW+910m6TUgz76vP/6LFJJnmtUBqZL+1u6Pv3s7V
 35WIt0k7yQ22eyFOh9LB5fJ27Sz6ivhHHjcL1UXQmV6LmJy7pqzsl9c5xnlkwHRQDSMz
 DnGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=6+mnefPYYUMtLLzAhCHln9YzYSJreVJtjI9cM4R9vCQ=;
 b=sMuKJpGQifI5MIHh+b4XGfq3Z/ZpBJVnIDMpJ+3gYPdIzj6fDKcmuYs5TxVCXjSZHZ
 MD4nSmYIUwL7Q4NC8fmtMteZ7AjKLbFQENAoqXsnXxWjJu2zs/Dcj5wNEV4qAQnlX+tG
 /iKRKJo8FSmYzOOSjLnjw8tqWiXDeuIDshMmCr/2zd2Y5TzcoigopHB7NgAWTgLKpGzg
 Gco5ncYxI6vk8PpGQqNnuFH19bfo5Wq17m00gY8oWareh6k6CR+XlwlpXEsIwjY/kbQa
 6i5QML0xiFtT3enXwUfFJ58bPnKF/o9ZY+bM0pMlaiV/HMpXjAbFMie6x4icvTPS6/vd
 xllw==
X-Gm-Message-State: AOAM532nHLnx69lCLsqGj7o8B/tRmMEMNgOjMj+YVGVcvbqQ2SeE8n/h
 uVN3r9r65fUO9Xgv0T+dExnW4Q==
X-Google-Smtp-Source: ABdhPJwGhk92fqS7i78WknjwcTRkxto86Ej3nBeUTZd8FB4/Z2UNtW0BNrJH+GKLVIrMUaO1McrUNQ==
X-Received: by 2002:a7b:c1d2:: with SMTP id a18mr4346467wmj.41.1605786968053; 
 Thu, 19 Nov 2020 03:56:08 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w1sm8825262wmi.24.2020.11.19.03.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 03:56:06 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1979E1FF7E;
 Thu, 19 Nov 2020 11:56:06 +0000 (GMT)
References: <20201116104216.439650-1-david.edmondson@oracle.com>
 <20201116104216.439650-2-david.edmondson@oracle.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: David Edmondson <david.edmondson@oracle.com>
Subject: Re: [RFC PATCH 1/5] hw/block: blk_check_size_and_read_all should
 report backend name
In-reply-to: <20201116104216.439650-2-david.edmondson@oracle.com>
Date: Thu, 19 Nov 2020 11:56:06 +0000
Message-ID: <87d009v9ux.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


David Edmondson <david.edmondson@oracle.com> writes:

> If there are problems examining or reading data from the block
> backend, the error messages should include an appropriate identifier
> to assist in diagnoses.
>
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>

With Phillipe's suggested ''s:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


--=20
Alex Benn=C3=A9e

