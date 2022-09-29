Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 230FA5EF749
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 16:15:17 +0200 (CEST)
Received: from localhost ([::1]:43096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oduJo-0002K0-83
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 10:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odsDO-00081r-Jh
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 08:00:30 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:46724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odsDN-0004vV-0j
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 08:00:30 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 n40-20020a05600c3ba800b003b49aefc35fso607766wms.5
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 05:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=23wpCiJ4V2gEcOEvO8///m/1deUkTXuHYDbU+OR9xwM=;
 b=N3DxQ9qeOOGmdPzAD7UIXtmsxYdBd/bjPiby13/5Sif60Cpb9y+QEjGeVfEGV1Qs4r
 ye1oI2BcKH3dXrKeUIuH4i0UaXyv8dkedLTSBEl1FMVUUansFODf9t620EDcaaco6Njm
 +Ckj59SzIHj+yK32E56OVPI5BhSESO88WdTiEdCDGerqL3v1tOgZr9vKhuoaJzmIpjyJ
 MFy0tsW1qBuniBc3cRAxTY9+wTSAxz+ZVw9L/Te6WmzMJCpZzv6WrHD6kc3kLWZ8DGG4
 ovTN5OgcFDxCzi6P8IaNrVHEg/rY++yV+K1xcnJV4yCSELNCT876DJ7B2FhJyCiyzL9F
 NuKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=23wpCiJ4V2gEcOEvO8///m/1deUkTXuHYDbU+OR9xwM=;
 b=auUzpMwEGVWbmFQQ+8PhiMxjjunCkjRdS4y22m7W9i4ZQRLvW0UDBYwEwWAQ8ajnNK
 Pgi8zmOc/kWWkU+Be/ACYxa9dmVrBn9iZaf76JGbOtmitt+KQgJF0+Hxvghls0adwAqs
 fF1H1j1ICNPj0l6EPZvBNv3IU5J0Zq2mmQsLsNZ8L/78caqaN5knGtuIt9Z24GXY7Qoy
 B9fg9oYS4cevKskHGGp16i46t/z86zL7hCYpC46uvrGTpuvSpAyzmwi5pyui6nrt8+Gf
 2Z/ILx0G0JMzSdZ4CWt3DauwQk1zlyf9Cbw1dgGOTGT/TU3EQsVCxKD/c+RcM+OwuMkm
 0TyA==
X-Gm-Message-State: ACrzQf0mPx67VgVTYU1t1tuJ2ftD75LM8Fo3xZkd/HZIEeMt9+f0fDGp
 7D1jlKWoPcT2/8kDDDH4FXibsg==
X-Google-Smtp-Source: AMsMyM7urQvRGanQYImo7tGujI16+I9XbQmxxpR033CgFK6anBBOgUd4/64FAzr8WRcF8E0fm1GMHg==
X-Received: by 2002:a7b:cc96:0:b0:3b4:ffb5:6366 with SMTP id
 p22-20020a7bcc96000000b003b4ffb56366mr2023250wma.48.1664452827592; 
 Thu, 29 Sep 2022 05:00:27 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h18-20020adfaa92000000b00228dd80d78asm4443837wrc.86.2022.09.29.05.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 05:00:26 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 51BE21FFB7;
 Thu, 29 Sep 2022 13:00:26 +0100 (BST)
References: <20220925105124.82033-1-richard.henderson@linaro.org>
 <20220925105124.82033-6-richard.henderson@linaro.org>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Philippe =?utf-8?Q?Mathieu-D?=
 =?utf-8?Q?aud=C3=A9?= <f4bug@amsat.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 05/17] accel/tcg: Introduce tlb_set_page_full
Date: Thu, 29 Sep 2022 13:00:20 +0100
In-reply-to: <20220925105124.82033-6-richard.henderson@linaro.org>
Message-ID: <875yh61jc5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Now that we have collected all of the page data into
> CPUTLBEntryFull, provide an interface to record that
> all in one go, instead of using 4 arguments.  This interface
> allows CPUTLBEntryFull to be extended without having to
> change the number of arguments.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

