Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CE94A72CF
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 15:15:14 +0100 (CET)
Received: from localhost ([::1]:48752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFGPg-00056d-IS
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 09:15:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFFzo-0001yo-Ss
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 08:48:34 -0500
Received: from [2a00:1450:4864:20::535] (port=44618
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFFzn-0006jO-8x
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 08:48:28 -0500
Received: by mail-ed1-x535.google.com with SMTP id u24so41812544eds.11
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 05:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=4e6Bol9pBCE5KZ9gejbvABmpFNlKubJNgfHHwQtXTqU=;
 b=y/+8SQbWHKSa7QDNOLOMbKmUcb407jHJ26ZLaAlLQuqqL7WQQSXYNioYEMt0F7GgpY
 ZF0S87W7hJOE/Mp3qT6ZTir7T7g3BfNH5Shw0mP+l5tkM+se3pm3lv9sHE3kzcJj9ejg
 oq1cPuoAxbyKl6PWDlwcdCx+UzRwZ30hIA1qRuBs5fd3zWsKbXA3czZ7O4lJUjUqz7eI
 KZLVzaV8z11U4T1HV9FbZBPFENGtouQS04RRLEPPLXNZHErm6ii6dOTL4AyrHmXaGtkP
 5oRyhugytgnQZahVNOGT+aYJvzqCZItjajXe0navZcNF5UoUVX7uHm+7KZwQNfdaN4Yn
 RsNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=4e6Bol9pBCE5KZ9gejbvABmpFNlKubJNgfHHwQtXTqU=;
 b=U/gmXz7RQS+A84vHChWZeLp4sHcNtel19O3YQgtImIccTSUQjCmD1Y7xtaJQJLZDAG
 iU7hI+RuWaxUbY6M+nfA+VHGnRvS9AnRI938tRYM/Et8nNOesz6L32D1+uUfmOZsYhVg
 yv/FzRqNa4bEy/ksJQosHpFJ2qFABS3Oa+ZKF1bkLlVM89lgiX29zhVbniAE4X0Y/uiA
 MlM3nekI9xTqgLkXi4374vFzlOJTpWtFtjmn3xUxfYuY8D95bGbjVYqVV6cA5RRnjKKw
 Tj4rE232siiY72/kH5/uB/EDCyLFBeiiJ12umwRRPoC/zQMV2xfcarKBPnOnFRSn58W7
 rk4Q==
X-Gm-Message-State: AOAM530slf4SgGncQMZZKGS8AfcZ354YEWIJKdq9s304JdBTs7oTbNfj
 SLEe6+qX/muI1n00zdpdbtEUeQ==
X-Google-Smtp-Source: ABdhPJyphWt/Z8plbYQOdZj72Jl7Zxn8zA5Wv9AsRqk3Gx+XtzEeaV0Et9zqCJWCPjNFEMsHPsG92A==
X-Received: by 2002:a05:6402:350d:: with SMTP id
 b13mr30339089edd.125.1643809704494; 
 Wed, 02 Feb 2022 05:48:24 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id qb30sm15610638ejc.27.2022.02.02.05.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 05:48:23 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 02CE61FFB7;
 Wed,  2 Feb 2022 13:48:23 +0000 (GMT)
References: <20211218194250.247633-1-richard.henderson@linaro.org>
 <20211218194250.247633-10-richard.henderson@linaro.org>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 09/20] tcg/i386: Implement avx512 scalar shift
Date: Wed, 02 Feb 2022 13:48:18 +0000
In-reply-to: <20211218194250.247633-10-richard.henderson@linaro.org>
Message-ID: <875ypxwfa1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> AVX512VL has VPSRAQ.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

