Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDCF50690E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 12:48:30 +0200 (CEST)
Received: from localhost ([::1]:49526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nglPI-0007b6-K3
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 06:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nglJ4-0005Zr-Io
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 06:42:02 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:44559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nglJ1-0005gy-W2
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 06:42:02 -0400
Received: by mail-ed1-x535.google.com with SMTP id c64so20663515edf.11
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 03:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=NVLXouzO/rBCyiXdkdL7VqEQca6niKkF8l4atMlrghw=;
 b=TZR9XbRDGvBPE/niC75DvkaL5sbEUP5ZiJveZlLzkKsVi4x9p2mYhLDc+3OsmMleDq
 6F+0K88cLh3SjHsR79Z0ZUxaUNNZGAyhKSPu/XTQ4cLsgsm2blwLrORqEGe9FXb3bp4H
 2W/QhoGT8XrFUWH5P1TjSKNFCeKnvSnUUj2bEpbsVy3C6Kc7/WSsbt0K7yHY9FH3ePa/
 S4BMheiLkTDJ4yWSYhY3+98BkF77qfANV0ZjQ3v9LygtlclrSiMS17ETsmGcGGFo07Ow
 tAugiCDXWs8o+SKyZeGlx2gokYFDdF/6a8QoHnA7XSwf29IPbY8WdMxbBhK1kVIiXOfa
 mInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=NVLXouzO/rBCyiXdkdL7VqEQca6niKkF8l4atMlrghw=;
 b=kQs973Q5ayrUIGxz1+RLnjaaNbcdQiz8IQHypGYVYVW/9KiUcbu4DVtNAbKyZ+C4jw
 0YVMqKLCKWwfebnMp6lG+FLWPXbYj6VXVk9L7A2CG5if/yTL7Q5uIjRIoHG5n9N3l1cb
 q+2hjv+hQJwhFmBA3tvaXUDKBkly4C4bd8ySk6bwRZocezmPpfCkW33jqvHmTA83ysWQ
 6D++4bjevc7St0JpI053oJliFylaL/6Rhwc0OnMXXxHsyf+AKuSBLSDVSvEZ4m71DfbY
 Rr/ipKCx/XqIC5D9nbsUC1EEJ6oUCYfSihKkZmZIEdSvuJH7jC9RllAfTTWXnVIHG7aj
 B2fQ==
X-Gm-Message-State: AOAM532Aqe0IYwQ1m5YymsoRE0XaSfiK1ygyxiB6kyJqqmfEjFJMGPB7
 +S6mV9zg+EC3XSol06cY46h1Hg==
X-Google-Smtp-Source: ABdhPJwU+idJ64lX0pwbsk2OHNxwU9ONv9JKa1qSvf66tvpQyEgSPYXFoX1H/DzJF3u05f5NK47cgw==
X-Received: by 2002:a05:6402:238d:b0:41d:7630:2300 with SMTP id
 j13-20020a056402238d00b0041d76302300mr16831449eda.363.1650364918590; 
 Tue, 19 Apr 2022 03:41:58 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 eq7-20020a056402298700b00419d8d46a8asm7949706edb.39.2022.04.19.03.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 03:41:57 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CF8CC1FFB7;
 Tue, 19 Apr 2022 11:41:56 +0100 (BST)
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-2-richard.henderson@linaro.org>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 01/60] tcg: Add tcg_constant_ptr
Date: Tue, 19 Apr 2022 11:41:52 +0100
In-reply-to: <20220417174426.711829-2-richard.henderson@linaro.org>
Message-ID: <87bkwxxsln.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Similar to tcg_const_ptr, defer to tcg_constant_{i32,i64}.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

