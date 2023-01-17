Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3160766E56E
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 18:57:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHqD6-0007Iq-Ba; Tue, 17 Jan 2023 12:57:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHqD4-0007Gk-2W
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 12:57:22 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHqCy-0006Nh-Th
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 12:57:21 -0500
Received: by mail-wm1-x32d.google.com with SMTP id j17so4392912wms.0
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 09:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WRNmp2OF9j7ime4sG+nzUIcK+y6FHrL/RAdoKYCQ5Uo=;
 b=JOTNEDObbMqVo9mNHsQlXDsqAA//LFxBrVJUZk+PtoIn6KEowQ0cJOHLX4ywQOAYA0
 RAGPR/x9ytfEPNjLZx6/WIyTPr0tnhX6sMp/tagvnwpQV7sMe/l5ye/yT38Udc8RAvCk
 gIlnAkAzTkpeJlwET6gRe7HKHfvSzzDAXaQ6PmBNSyBUhF8wi7OmzOqmwqmC2vlNqtaO
 FvZ2Kog0ZPPB5tVzMP+PQ/EckUCE6XdAtw/pc9CKjm7vkiMM+iLIh9ltIgZo16bUlUb3
 hoxYU3GJpLyxt7eWms0k9wuxwM7Mi++5+ouO6j7xxju59d4OUawWH9UnMuoamutMIwka
 1ghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WRNmp2OF9j7ime4sG+nzUIcK+y6FHrL/RAdoKYCQ5Uo=;
 b=670IRwEhsbuJRN/JHG4B89rPOMby5tHFYHguZiq6pkNYshzHE7JNFpUIk0mklN7Llf
 ShTscIoWPjNt5tH7IYuMfp6yR+r14w43Hz97Cb8FIg5vhQcp12vNeBaQFUoqBxkdLLX1
 /NTT9ZPXU4k6At7R9+mHMcHO2vLxvwBbqu+be+3mjW9HWIaztBT89woWYsg01BHJfDH/
 PRoz0XgCASQBTLJq5K+tYqQMItX6byVeKPr2oUhyPgT4an3P/9dpppBXG+7H9N5AnqkU
 51YVgFcvN6wKjuEeZ4eHUeVJVsInud/bGs+pg/TTiISxpSdHZzG0vgf6xTeLWj+gFTEf
 S93g==
X-Gm-Message-State: AFqh2krfJzoAlGBuZ0psAxxDzPoFBujZIhP62E7RU1KgcvMf+HkXdcNv
 Juu1EIg6nQWGIEI7EpxnEHnP5Q==
X-Google-Smtp-Source: AMrXdXtpiGdytRwK5JTxXjpkYR5aayDIT80rMypdfofKyg7sNk3+NgcoVmoF4336bfutQlISpOnK0A==
X-Received: by 2002:a05:600c:6011:b0:3cf:85f7:bbc4 with SMTP id
 az17-20020a05600c601100b003cf85f7bbc4mr4045369wmb.2.1673978235265; 
 Tue, 17 Jan 2023 09:57:15 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a05600c2d0800b003dafcd9b750sm5821364wmf.43.2023.01.17.09.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 09:57:14 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7D9E61FFB7;
 Tue, 17 Jan 2023 17:57:14 +0000 (GMT)
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
 <20230109014248.2894281-10-richard.henderson@linaro.org>
User-agent: mu4e 1.9.15; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 09/22] tcg: Rename TB_JMP_RESET_OFFSET_INVALID to
 TB_JMP_OFFSET_INVALID
Date: Tue, 17 Jan 2023 17:57:10 +0000
In-reply-to: <20230109014248.2894281-10-richard.henderson@linaro.org>
Message-ID: <87o7qx2ged.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

> This will shortly be used for more than reset.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

