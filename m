Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 707C137A5D2
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 13:34:09 +0200 (CEST)
Received: from localhost ([::1]:44594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgQeJ-00078x-E8
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 07:34:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgQbd-0005Z3-Rp
 for qemu-devel@nongnu.org; Tue, 11 May 2021 07:31:17 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:47035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgQbc-0006Kj-6F
 for qemu-devel@nongnu.org; Tue, 11 May 2021 07:31:17 -0400
Received: by mail-wr1-x433.google.com with SMTP id x5so19754517wrv.13
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 04:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=jAcEm26UkQQUJTcXkvuYyE5Q3BLrUS6kfRL0m3u2JLtnPFOwaY5Go2kwUJCJdC34Qm
 mk+oFjMuwrasb1RXBtMlZq9SJY/eJpv84LOThYS0BzFFDjLuDYlem20N3wrxdNu12bwv
 1/aqEnBmp4SbZ90yzT1XwiVg15S6WCDKO/z8nOYQVkOw06Ez+MzNa5Mc7IJURrt+xlQm
 p+nNi2aDoEvKo9TsJ0TD/RgyBJLrEoxnJv/XWMt8Lgt67TqJirffJLzm4TGwSh6J9t2m
 Xq5I9N7kMFhKX3wMxXxAINk/+Pmd1OCu6D0agqwzQLylrBde5YS86Oc4rXf5XoMdcLON
 5ahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=Zj8jDvfUcNWi5wv16LZTsMrSI8v0mQphgR7RZmZMvrZ7VJ7s8QCG0Es0vEnYSBYnN9
 THKCCLHj8HnB5lJz/kX6n4s2OjYM07iHfQfDjtbiKsYQ0jTQy0vN+0B38vyyOshptrbg
 x8PFoBNrXezYluHyvYNJQh+bbb2lU5no9pyg1D+io+ZrZX/Uh19NRSMoLWNz5vU4Ao+b
 1FkGkpZTxvJAI7UOyRwdoLoVvptyXcTSnMklwi5xBu65Ov+gbdPdz3W8S5HeDlVcp9Kn
 +O4cZWDZxWpCV7Pkx6+YuenhsSBebNPQ7FnnX0HOByqbMIZnEgO4P+oPJhrjKW2Ve7yS
 arCw==
X-Gm-Message-State: AOAM532eZcNyWY1K3Yx2K4/8Gzh6+tSTgqyYPO0fE62ya34fhBFO1k3c
 4fou8zmuMqD/kkMCW2k+FjQm7g==
X-Google-Smtp-Source: ABdhPJwh8GZP+imL8c9WqDnwGrSgR1VzcNwn7rQZG42PmoEtTBmRZg52M1bHYD5/af2HO2dURc9WYg==
X-Received: by 2002:a05:6000:144f:: with SMTP id
 v15mr36287931wrx.182.1620732674295; 
 Tue, 11 May 2021 04:31:14 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y21sm3416435wmi.15.2021.05.11.04.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 04:31:13 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7AE8B1FF7E;
 Tue, 11 May 2021 12:31:12 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-20-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 19/72] softfloat: Use pointers with ftype_unpack_raw
Date: Tue, 11 May 2021 12:31:07 +0100
In-reply-to: <20210508014802.892561-20-richard.henderson@linaro.org>
Message-ID: <87mtt1jym7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

