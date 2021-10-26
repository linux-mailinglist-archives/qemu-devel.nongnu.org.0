Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CE243B5AA
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 17:32:52 +0200 (CEST)
Received: from localhost ([::1]:40582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfORX-0002dW-Kd
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 11:32:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfOCW-0002uM-B9
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:17:26 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:36464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfOCU-0006VR-Mb
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:17:19 -0400
Received: by mail-lj1-x229.google.com with SMTP id q16so16624918ljg.3
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 08:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=wIMyYoZAvtN4V3q7k3RGWl6R2X6iQlmvyjSzIPPaKMg=;
 b=UcPzC51lXis3EOjX/In4Ghz92wRo5m8gFZegqGGtX7r3niw1YIWGB3XlOVLwrBjUOE
 kbeQNff6k7FCUgJO/DWYK0O6uEif3T2kF3Qiq59rfMbPVn+rMyANfiEYWq5zEb1F2P1A
 GiwGxaGbH2A3B+NAkrXrDa612Oag8Ba52YhHa0P3cTdeLOLtj1bnQXTHO5KpMitpDCTu
 aXfV2TjZPg2V7knGzyQdX+iERSnW3Q7pbM/1EJsCXoX3XNJAUu6FIaSlyZoDtPFPMdcI
 52kAgHSWRSgAyjH9Zifz5GXKA1ZivJIvyV8E9dwdwbO31Dhc5AYlqW99eMph5c9w5DpZ
 EZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=wIMyYoZAvtN4V3q7k3RGWl6R2X6iQlmvyjSzIPPaKMg=;
 b=wbb7SVZnK4u4WHi531zHyc+jLHxaY74poAI9g3WRnOEknSe8Zxgsx09mlO6I3sdLDg
 EVo3lF9VA+T/7vMj5Gt0IbkkcIlIshHt2tqnF2RHDpW6X3caIVJJkiIsXLxmDe0hLeTS
 LYlRJYxqLaY1OBfm1bL0pTHXH6YCIn2Zl/l28OUWS8W139KRDuxlnhw9gk74H23VGYJ9
 N0juzLEUEHNarE76Gj0P+ln1qDe9PgXAP8OV04IfIFUqasP3bElS1torek4mz+EkwSP5
 ReWF3L3OwmTJNGsEcBGBAiLZgt0kNhgR4Ed0OtbD0/zUVuntCRl9kLIAkjxYOgheiK3s
 8yCg==
X-Gm-Message-State: AOAM531VHq+axmrS5yeexVBIZD0iZdZAsmf8Fpd1s/0H4QSz7KHOQhr6
 bEce366c0Apxd9QrILGHkEOoIycq6hJzEg==
X-Google-Smtp-Source: ABdhPJztA4b3We97macFhYZsSPxjUeFyd5MOBoX0Fjo+ZPRDVXwQC/vR5eJgByJ7uBHQk+LDYZhvgQ==
X-Received: by 2002:a2e:6808:: with SMTP id c8mr25484885lja.138.1635261435682; 
 Tue, 26 Oct 2021 08:17:15 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l8sm1957810lfh.57.2021.10.26.08.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 08:17:14 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 69E4B1FF96;
 Tue, 26 Oct 2021 16:17:01 +0100 (BST)
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-13-richard.henderson@linaro.org>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 12/48] tcg/optimize: Split out finish_folding
Date: Tue, 26 Oct 2021 16:16:56 +0100
In-reply-to: <20211021210539.825582-13-richard.henderson@linaro.org>
Message-ID: <87ilxj24uq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=alex.bennee@linaro.org; helo=mail-lj1-x229.google.com
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
Cc: luis.pires@eldorado.org.br, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Copy z_mask into OptContext, for writeback to the
> first output within the new function.
>
> Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

