Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C92D467ABD4
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 09:33:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKbCb-0005Zq-Il; Wed, 25 Jan 2023 03:32:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKbCS-0005Y5-8m
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 03:32:09 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKbCQ-0005wu-6D
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 03:32:07 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 o17-20020a05600c511100b003db021ef437so689402wms.4
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 00:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lgAiDMVvZQfshpzbC4dmAWLfoahPjSqo70AhNR+CR+Y=;
 b=uA4P61LkjoY8dv1zOX5JF6PXLPs1RuFu0u80vHbmrgwWUF4uFmhoVqhnUReoWxS9Gp
 WKHbKbU1M97cNvXyGb8g5jRJSgHuFatLlqonbgOzX3CfZjy+bOMrr5SGqJPaYfbUGXG1
 q2KwB+19lHtyqfTS5eMyoThsXR2a4bTOuRnY+T+ZJ38TiPin4exFqen6X4NYHVdMhqv7
 /CX5PXXLASfuvG65Xl12aXwrtFvrqA/6T9/a7cVuhrc9M/Vt0oyZEA+wS43fEpKfN61O
 hxTM4m7qU0mbqh5rmiI6CxmYhwOZM6oiKawh5hGNaFja5G0MdHhp5jkcOp7AaWByWpqy
 8kzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lgAiDMVvZQfshpzbC4dmAWLfoahPjSqo70AhNR+CR+Y=;
 b=KiSvqcW5j9cc2+96u10PbSpnXp/k8twjzL3UrY/Bp4/kRjxR9oMam/Vb5tIugYJvaJ
 CjtyP6C72/mAD05I+YtFzMraDkpgj14DAJAI4zlNrFWX8UoH27DHkTai0QoZdSVjRqmt
 7Wh8a4oJdMzA8pWJV6aDghCuZHUWOFOgb3byA6M3stLBDJMcbZtvxS6n5J0krmX8syeb
 NGcUI3Piv5LDveyS4eczRgvFmbI5ECtj+dqmXU1mQfoqxXskQZ2AlBKh+0sqZUwA1dLc
 sZLtVI4YhBN0N9d/9ga0WA5sdHaiUs5CPCQfcFZQY+iaVFPVz8k071Z+wJiL7yGtnR3A
 F6xw==
X-Gm-Message-State: AFqh2kp0tfw9hwImstkEsvNsOh/A5nAA1Rt+al0CKe+0Av/ePUYOLZdH
 V/aAhOBfMhasiD9EHMfuHxvHrw==
X-Google-Smtp-Source: AMrXdXuqM5Go4vh0paC2EI6BjCs6kpn8ScH3fJUHLPEH6gbZofaACvc0aXuwWklFTMr/KVf5VCkjNw==
X-Received: by 2002:a05:600c:4d98:b0:3d3:5c7d:a5f3 with SMTP id
 v24-20020a05600c4d9800b003d35c7da5f3mr38506652wmp.37.1674635523581; 
 Wed, 25 Jan 2023 00:32:03 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a1c5457000000b003da286f8332sm983539wmi.18.2023.01.25.00.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 00:32:03 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A75F81FFB7;
 Wed, 25 Jan 2023 08:32:02 +0000 (GMT)
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
 <20230108023719.2466341-5-richard.henderson@linaro.org>
User-agent: mu4e 1.9.16; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net, Daniel
 Henrique Barboza <danielhb413@gmail.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH v4 04/36] tcg: Introduce tcg_out_addi_ptr
Date: Wed, 25 Jan 2023 08:31:57 +0000
In-reply-to: <20230108023719.2466341-5-richard.henderson@linaro.org>
Message-ID: <87wn5bqakd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


Richard Henderson <richard.henderson@linaro.org> writes:

> Implement the function for arm, i386, and s390x, which will use it.
> Add stubs for all other backends.
>
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

