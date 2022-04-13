Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B59D74FF841
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 15:59:07 +0200 (CEST)
Received: from localhost ([::1]:43470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nedWU-0008RV-Ks
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 09:59:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nedTg-0006A3-9q
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 09:56:15 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:34339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nedTd-00066C-8S
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 09:56:12 -0400
Received: by mail-ej1-x634.google.com with SMTP id ks6so4157640ejb.1
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 06:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=RhpImjLgfbV/h2Q0B9z2B8FTykSysM9CQYxZQ54C66U=;
 b=AX74n2EPw2RVwMOpHFrnDpgotKbIL51S+fN7OQUYebnTeWH8CSlM0Rp4lpeXlvBC2E
 VtANWE98FD0Ztaj6hrcUihrL6HOmXiyezEYqetjPQdy/nPATEq/5HlVW2/sU2IIlK3kJ
 gRsIO/tEeFWIJ/yn0vTVBUsx2+uVO/2Q5gQLi857R74sWa2J/VXD5W08Kdm3dRT8LTbB
 xNs34b07ZaMGVSrC42HFzAkwea5F+kz7UW9+LsIigeOBfjTQz8MfmJl/xpCxxfRrNTaf
 bTsH/TAfnY/EYjm4nNcojqlRxD85D15ik3RvCjobQyuLdZvt11gqpZ4g/VHKpspNswwB
 M5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=RhpImjLgfbV/h2Q0B9z2B8FTykSysM9CQYxZQ54C66U=;
 b=W5MfQdMd0zOb5ma4FHauWPX4jzkyRK7olHKt+ziRuxRYnzNhBabwzIvax0G1AHAYsf
 y+y6TzgPw4IEL5InDuAgUr0ZPz7B8ygTCtTXsIvXojWR8DM/cy8Fw1ri2ikhg0VoY1WN
 xvbWw202f52V0zOTfiJCGMlbTNgFyn6P7Lr3pdmNWKBg8Wt1CM4lmvr8Q+oi4MwlG0rX
 sQsdtexlSpw600R9mehNuGHMN/m2moloc4pfIZxftYJX3/RWQCUtgwEyIbAke/16og6e
 TXuk/Zz2edfBFTmuVIadvfliv7K/XHodiOVX7BkXr36NZUPrmMkHkomfXueDzstO64z5
 7SNQ==
X-Gm-Message-State: AOAM533HQVxXWy/93tnCRCltXTQPXulsuZWdZ6Ki2sKPhzdOMhGAE2+A
 xL7GMR7/lwXiGuO9wB0KI0PdtKFgLqEQoA==
X-Google-Smtp-Source: ABdhPJyuiTNBVPgQJORZ8EvHXzRyyL8E+zOP2tvTZMHbw+G8OOPG9IQ4+Nc5i7QoSlwphhRCsUClHQ==
X-Received: by 2002:a17:907:7ea6:b0:6e8:92ee:daf8 with SMTP id
 qb38-20020a1709077ea600b006e892eedaf8mr13937633ejc.55.1649858144847; 
 Wed, 13 Apr 2022 06:55:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a509dc3000000b00420195722c7sm269210edk.6.2022.04.13.06.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 06:55:43 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9B3B71FFB7;
 Wed, 13 Apr 2022 14:55:42 +0100 (BST)
References: <20220326132534.543738-1-richard.henderson@linaro.org>
 <20220326132534.543738-21-richard.henderson@linaro.org>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 12/39] exec/translator: Pass the locked filepointer
 to disas_log hook
Date: Wed, 13 Apr 2022 14:55:38 +0100
In-reply-to: <20220326132534.543738-21-richard.henderson@linaro.org>
Message-ID: <87ee21xf35.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> We have fetched and locked the logfile in translator_loop.
> Pass the filepointer down to the disas_log hook so that it
> need not be fetched and locked again.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

