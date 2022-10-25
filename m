Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E279B60C728
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 11:03:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFk0-0005b9-3l; Tue, 25 Oct 2022 04:56:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onFa7-0004zT-Kf
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:46:45 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onFa6-0006vj-4Z
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:46:43 -0400
Received: by mail-wr1-x42e.google.com with SMTP id a14so16845045wru.5
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 01:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/47H39SoqXVKcD/g05r1MpvbHNehQTCJ2PDvhtO75Ls=;
 b=gJhCVMP3EgdLHA7xmNyKGjlUzThGCh3dRkCqycdckoGKgo/qTECwP97T2BZE3cHCAR
 FY7K+Gzceg18+0ap44miImieFsXUqwAGUcqUbG9N7U61ifSufvbjQJUtWBWuRNTrcnxf
 xyxPwxzAk07hKptrc+Zd/enFicxD3213n8SKV6AoPDk8GmSgbxwnfECF31/QzesFeRNj
 ep9BRPFYtqO2xaXtxcBk2lml8q+DF3dsLgXPqBy/h6tmV+sVplkZlAW7EFpZ6+PEZYCr
 zYMHC4C+QfiQS3ZLxknmz5yr0yqV3TH8UQUAYXUL6/P4rCtoIeOIRTEASdM0u0B//WoR
 sEfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/47H39SoqXVKcD/g05r1MpvbHNehQTCJ2PDvhtO75Ls=;
 b=8MCeP6UF6Vku3NiSM9FIGzIEs/HMtVyfF7kQMLR72H+DrKDl6cQ+CkYfY85J9/Sl/I
 LS4ZJRIkmeMIk4VXBTMuKjKYVBLO3MtPrpneiL4fUQhwQUnxfIiE8BUZ4Y0cUpXmPAMN
 IGwsEi1xjmxPBMXqR+K6UOGPKFXgqXFA3DB/QDCX2EXzZ4j+IvH90BgAfSBqI3kfI6Uw
 rwk9nd911iEV9G6DOg/T2lgo6ld+RejXOTllCp0fSrJW8lyeyaaadJgmkuaIM0TcOLkw
 HY0TfAfa9WTLJCJUES+EB1BP1gWkDR4zF4so9vPzDYPy4AZHBZ5pJvWRecrZZuhwYpxF
 fLvQ==
X-Gm-Message-State: ACrzQf2b7PkJdLAjLEy2j/PQCFoDCZgxzSmjzX8S0VTGGcjh4syBcJcP
 av3apt87B01XWzljgyBCrV2Hrg==
X-Google-Smtp-Source: AMsMyM7uTU2yjXRFZVbfkCjGNOxT8SnRE+QdDz54DOqZIJVVYwc/o1QD9P1jW0QqvNdd2iE77AB9vw==
X-Received: by 2002:a05:6000:10a:b0:236:6a79:f5cf with SMTP id
 o10-20020a056000010a00b002366a79f5cfmr7953872wrx.470.1666687600642; 
 Tue, 25 Oct 2022 01:46:40 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a05600c444b00b003c6f1732f65sm11050596wmn.38.2022.10.25.01.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 01:46:40 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BC7901FFB7;
 Tue, 25 Oct 2022 09:46:39 +0100 (BST)
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
 <20221006031113.1139454-4-richard.henderson@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: Re: [PATCH 03/24] accel/tcg: Remove disabled debug in translate-all.c
Date: Tue, 25 Oct 2022 09:46:34 +0100
In-reply-to: <20221006031113.1139454-4-richard.henderson@linaro.org>
Message-ID: <87lep48f4g.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> These items printf, and could be replaced with proper
> tracepoints if we really cared.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

