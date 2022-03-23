Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 884F44E532C
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 14:34:12 +0100 (CET)
Received: from localhost ([::1]:52666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX17r-0007ti-6M
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 09:34:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nX16F-0006w9-Gw
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 09:32:31 -0400
Received: from [2a00:1450:4864:20::62e] (port=37481
 helo=mail-ej1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nX16D-0000a6-D7
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 09:32:31 -0400
Received: by mail-ej1-x62e.google.com with SMTP id bg10so2880283ejb.4
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 06:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=zIQma5uxf3voeLW01r1a1NdDcsAs6Ft903xA8C2XILY=;
 b=pO6Y4EAEOVuTi91+LIgRNfGjN/Mrj6CBH4mMxEAkykUEFzgSRQdFAnmkOd9GgY6C0e
 ZBqyV+i6Uw2FqOIDcYH2NL+jjo9wrAymmDJnon9UKM1+ItecQMyq3DTaPmlDRP6PFd8K
 N7LcAc98G3k6yGdDwyDUczm3neRsDk2VwWRcy+84R+3VJk6yapWZsLnX62OVzhzm3rnR
 Hp/SM1+VWX4j/IkY//abrN2LkG1l8fonRn4EdMFvzVP3Xby91k17A3AtV381zIBiKbap
 eMP3SgNX1e9q8NLkPzk+oF4+FOpeW9iVEz7npuhJpAbaJXhue7rak3zqtgONwK8plyGL
 iTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=zIQma5uxf3voeLW01r1a1NdDcsAs6Ft903xA8C2XILY=;
 b=B3TEJPLcJcNFOJCHL3JLXFv6JhuuSsOx/hIw7dtLQ8Rn0LLtP1+lCh2t/OvvGD19vE
 xNIfyVOv7qIOq2aDujDE2x6n2wmfaiNBS9QHYI78NI5VjDyqX5p8DyEhmiv3zO5D9hRp
 z7UZIBrQjdLW5wfDjo8ASg8meRZzEVq4NAKEDHmxDfxP+bBwbAoI6QUPvBJl2YzoOK5M
 vy2QMEL/ie8H7DXICxbMYZ4TGB+Dxh5QG/jbsbRUjHSb+ah6N/alNuvjH3RypEMWLYjw
 lo+4/61qO88lymvsnaPW6gfXSN/E7Vy+ujIDMvBbEmlpz90xVG1kl+U3C1UnU5WcFRMO
 zKdg==
X-Gm-Message-State: AOAM532EePh+J9zGGDUT1oYSr+5qS4h0htm2diULL7AA8ZGQWjiavFwQ
 bXnYfnr79af6PFUPTx5ejm/3SA==
X-Google-Smtp-Source: ABdhPJwOi4G9e+uPTO5cloP2Yv1z1LRC+7ELqylfJXa8ZZHoNlKvNRipWx72ru54Qfl7Z8nBKFYf9Q==
X-Received: by 2002:a17:906:3fc3:b0:6ce:3eda:95a4 with SMTP id
 k3-20020a1709063fc300b006ce3eda95a4mr30808623ejj.271.1648042343741; 
 Wed, 23 Mar 2022 06:32:23 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a170906374500b006d5825520a7sm9911601ejc.71.2022.03.23.06.32.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 06:32:22 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 916E31FFB7;
 Wed, 23 Mar 2022 13:32:21 +0000 (GMT)
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
 <20220320171135.2704502-10-richard.henderson@linaro.org>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PULL for-7.1 09/36] util/log: Remove qemu_log_vprintf
Date: Wed, 23 Mar 2022 13:32:01 +0000
In-reply-to: <20220320171135.2704502-10-richard.henderson@linaro.org>
Message-ID: <87bkxw6bh6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> This function is no longer used.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

I don't know why but this patch failed to apply automatically.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

