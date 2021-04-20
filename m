Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F81365641
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 12:35:31 +0200 (CEST)
Received: from localhost ([::1]:36640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYnj8-0006ml-9Q
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 06:35:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYncD-0000Em-JZ
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:28:21 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:43761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYncC-0007Ih-1C
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:28:21 -0400
Received: by mail-wr1-x42d.google.com with SMTP id x7so37012016wrw.10
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 03:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ejF+u+nkxdSlr7pGbQtYxkg+Fsm+cbuh4hId+wG5nLU=;
 b=qMQKXFplCGnPfS3z0jBkgPOdiQ6u+eKkhTcwQ8weC5uhRH3BLspV8oWbCu96LgVPW1
 eeVr6KlIBa9V0QnsbzEkfvil5NpnKAX3BHgbalP/dPswRKeiwsZGjUxH2R5IWeNyYxUP
 Hi12gixk+54T4RA2a9YRYYvGf1ccvM8YD5NAihHlvQFIJI7vmjYF8uPWlQG2wA8c9vE8
 w2LYn4Ucd78kiUKywmhmZV0K9y4MFRlAFcWbYCnJWubFAj7NAT5KiMLhnTlBxzeH28Ak
 88FDeHW4geFjT3HMiY6tOr4z1G+zGSTeQHzvGrle3xF1HrTFWPQqAzaIz1q5WJbBr8q2
 GUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ejF+u+nkxdSlr7pGbQtYxkg+Fsm+cbuh4hId+wG5nLU=;
 b=FPvkKmYe1k1o1mlzXBuDSVToXG63HvZnWt+UO26Q+N4HhCRD7Anw4CP/BUBUWOz2SQ
 p9ItR6lg+88Gqjbc3OPnaskHAjTurqNcPvpXBAcqCQE8ovzbrX+ks6FTkfcPJpTzq8QH
 GMQQVEFZ/nuXvQvbroVWFWG3ORQgXXeJjwbb0kS1kSm4XdgYUWHS3WpApk0rul4w3n6h
 LKIMgYN9zqdZoCFZo0uKufA97+bfizuA4+MbE6YFE5pObTSt+lHlBtO0Ssr1LKB932h2
 WfZJXEiJo3YeUlkGYzt7s/NPNco/kkNNCJEhIDRKc0KB1cGp/K5edFjSdmsxb4JE7K42
 oYHA==
X-Gm-Message-State: AOAM532ZoMuqIdnEIJ36Bz+B3wCA71fHlt/sTPrhuE2qTTdpKX7N5IsA
 QoKFWbSp43gCsSwf3gAr/lXp4Q==
X-Google-Smtp-Source: ABdhPJxOzLMWg1YLxREGuB5z3Fpe9dwH6VWAgyv9UZYHlkArNXrUNqzL0YG+F1ok3/IQFgTRirfflA==
X-Received: by 2002:adf:a40f:: with SMTP id d15mr19336149wra.375.1618914498331; 
 Tue, 20 Apr 2021 03:28:18 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s10sm26664244wrt.23.2021.04.20.03.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 03:28:17 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BE3B01FF7E;
 Tue, 20 Apr 2021 11:28:16 +0100 (BST)
References: <20210416162824.25131-1-cfontana@suse.de>
 <20210416162824.25131-10-cfontana@suse.de>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v14 09/80] target/arm: only build psci for TCG
Date: Tue, 20 Apr 2021 11:28:12 +0100
In-reply-to: <20210416162824.25131-10-cfontana@suse.de>
Message-ID: <87sg3l8d33.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-D?= =?utf-8?Q?aud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> We do not move psci.c to tcg/ because we expect other
> hypervisors to use it (waiting for HVF enablement).
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Cc: Alexander Graf <agraf@csgraf.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

