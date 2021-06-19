Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8303ADABA
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 17:49:33 +0200 (CEST)
Received: from localhost ([::1]:38268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ludDw-0006go-Mk
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 11:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ludCp-0005mh-CP
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 11:48:24 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:36388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ludCn-0001Dl-It
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 11:48:23 -0400
Received: by mail-pg1-x532.google.com with SMTP id e33so10413451pgm.3
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 08:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ImLW3PVyylKsIFMvxZdaWRMZHnxWYnP1y2pptHRdqwA=;
 b=zD4ZMT7PeGUQ1r6GZwjqHeOPoVXJpRnAxoizrMErgfT3NC8ItuY7sx/H9GPIyPaDAj
 vrTkw4whyD/avnclQSh7JQdVEjrxCAjmPh914+Yuvi7x2/QJXZE+X/uSsiln66pZ0K9U
 wO7htQKgIH+fmBdDWMaRmgKmaMNCf64GAiak2rb3jEkMeokpoqn9aQ71lAEz9D7Ftpa0
 moNHJEwkbfNGVeglmw7Jy+r93REmnExnOv4Ahclk6IdWqDwn7wO8DlhW2ESGjsjLetOj
 YVmxSLMOpPDgtI6iLO0gJ4y4d+XiWAAQggmAkL+EktOUKPFlg7tzVRTUyekUuK+xvri9
 0Iwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ImLW3PVyylKsIFMvxZdaWRMZHnxWYnP1y2pptHRdqwA=;
 b=Rl2RkRCZbIEXhhutcG7nnqxcE8C65PzbyoDwn7lFVfG7qKPtC+Iul3oDLKqCJyClM8
 3JuIZ7LuBSiWNL854v+r+/2YIq8Trs8sfezZeRK9KJjRbuEsgyIV9bjUCwmkiFw+l+uP
 4UR1GSOIuYS5q7K7Fz6/bZdIb3+fvjXXhAxTLRs1pIf4HXvepfw44gega+rADahrDWtd
 Z8bpVd5ohiBi3ndp46591NRAgsMy4zXMqhWDmDfEhMRradhIKcvz9yo5MU/3kQqXqgbi
 eaejM9dB5z8WuRgdXBSf8n+k3eSGsInpbHk1QIVMCe+v/cOfHU9QVeFzR6cMGC0+3hZ9
 aZtQ==
X-Gm-Message-State: AOAM530WPfpX8RswHN8e8OsqWZj87nl9ptrVg/pAWUb+jbibGU9K2rzD
 /7hDjG5KO8b/ungqIHChfPORmoedw+hAyg==
X-Google-Smtp-Source: ABdhPJx0eft14w8otmbl6ORD/u6Q8Tr5jhCiyHQZ3WtI0nO3TKoaFcrXCEgfJrHz4Iawh5atgZE8pQ==
X-Received: by 2002:a63:d452:: with SMTP id i18mr15813857pgj.0.1624117700124; 
 Sat, 19 Jun 2021 08:48:20 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v7sm11157493pfi.187.2021.06.19.08.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 08:48:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: Re: util/oslib-win32: Fix fatal assertion in qemu_try_memalign
Date: Sat, 19 Jun 2021 08:48:19 -0700
Message-Id: <20210619154819.770299-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611105846.347954-1-sw@weilnetz.de>
References: <20210611105846.347954-1-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: sw@weilnetz.de, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> The function is called with alignment == 0 which caused an assertion.
> Use the code from oslib_posix.c to fix that regression (introduced
> by commit ed6f53f9ca9).
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

I'll queue this to tcg-next, as I'm about to do a PR for that.
I'll add the Fixed: tag as suggested by Phil.


r~

