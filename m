Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9383CFA4C
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 15:14:58 +0200 (CEST)
Received: from localhost ([::1]:42612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5paL-0000Rp-7b
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 09:14:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5pSY-0002f5-Lw
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:06:54 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:47070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5pSW-0001fQ-W9
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:06:54 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 o30-20020a05600c511eb029022e0571d1a0so2006095wms.5
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 06:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=7IOR20C+yveaqq8GEcCe+Dt3iA742GZcjNtyHb/Qi7A=;
 b=GZWvU5CdRoyql5sVC05pQs7MgxsFPbtgJ0+bHg4NxhbX4iqp8HSJnZGTD25rxTiTi+
 kgp3cDsiPC01Z6hec3GbpSSKjoJUYsGjyYkNfoFC1Khxpmy44HLSen0WXE6Fsv+JpRao
 A4jDmKt2gkieTKYv429YPrPriXwbq/W5qSjCUzlnpVNZU9+QpqdGX7mhbyqjjw0J1QZx
 V0X7RZIXlOn1fFMLveBIOXjO6hqCEdsvkYhtc2/Uxm6ksIKXAFaw+GJxP0eyrPcE4e7g
 ZCXHk/GqjqpRb8ZGcreIyUJB80pNrtgztRCdIRx2ATlvDs6tVfC25PHm9vMkWFV+pxdF
 uRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=7IOR20C+yveaqq8GEcCe+Dt3iA742GZcjNtyHb/Qi7A=;
 b=j+1L8GXDQ8opK2W3rsQZ+OCvYa0PSwZ9YJW6NcPNFHK2HvCnRP3psvS9E4xm8J6vZv
 rGEnhEhEI1367MNjqGdgWJ0JeCBgKC/JoDRDPLFxP/uYPyLhAGwQhNXiHNLYbjeEGOFj
 gjfKZ+rcyPhgDmAQQoGNbGxNXSifsf3SJuSsSuZbVAyLOQslcg7VF+dUXcwB445O1TrA
 L7YbPRFYafb5PklOt7xujPtT+aR1BmoMpWBmY3LV2KjPWNSHwzbsLHYX0Oh7d9bEioVN
 /fDYNoFRlSQOLUnKZ1Ik1NaD+SvQQyOkq/kcsWJPnRTWA/vVnNJ2je01juFyDjtHlkQk
 S7gA==
X-Gm-Message-State: AOAM5312hyKvHP075SIctBpb8u76fMKRFQ9Qf7KQsjG0sY9DN9EJvB7j
 GCAbVr7oCIWStTbPFSOZQ6sA7A==
X-Google-Smtp-Source: ABdhPJyVs1nUO3e5CjA87XgxtlJcQihdZ+341gDuGuqgQ9w6L1BoQgg8DQ9++wYVJIJIvKFhfV2WhA==
X-Received: by 2002:a05:600c:22d2:: with SMTP id
 18mr31226315wmg.63.1626786410686; 
 Tue, 20 Jul 2021 06:06:50 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b15sm10772147wru.97.2021.07.20.06.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 06:06:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F2FBD1FF7E;
 Tue, 20 Jul 2021 14:06:48 +0100 (BST)
References: <20210720011800.483966-1-richard.henderson@linaro.org>
 <20210720011800.483966-11-richard.henderson@linaro.org>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH for-6.1 v5 10/15] target/i386: Implement
 debug_check_breakpoint
Date: Tue, 20 Jul 2021 14:06:29 +0100
In-reply-to: <20210720011800.483966-11-richard.henderson@linaro.org>
Message-ID: <87fsw9m8wn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Return false for RF set, as we do in i386_tr_breakpoint_check.

I got well confused because this goes away later in the series ;-)

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

