Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2F66A878A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 18:07:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXmNJ-00016J-GI; Thu, 02 Mar 2023 12:05:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXmN8-00013D-ET
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 12:05:41 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXmN5-0005o0-86
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 12:05:37 -0500
Received: by mail-wr1-x42a.google.com with SMTP id bx12so14068704wrb.11
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 09:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aS7EigyogWQ+GM6QLzPXOzXftjKZdWVVXhkoTRLFJBg=;
 b=IOZJSc9qPP1EfiXLBNfdW5Rm+RTGSikx/JuCi7Yi8DC9LYSgH9dguJdOw+gEhc5iDI
 OS/4LsgtE5cOCYNasJqow8U0mKnZwbC5lGokuDF8876FDwvJPNO6DUaLFDDnTi2khu3d
 VqMjCNoBeoNhpJxs8r1a7v4+VC4SykfvZAZXJyQhWihbLHuuwuVE1AhOa6pGrM3L8T7S
 +lUtx/S8XGdl7kJWP6nz1zNs0vNpxvYJ+Z4O5RnvlvQLptdSyLra9fawT0WBB7w2Q9Ua
 +5Z9HkC+DWUxu7eAhgD2wJMEjLxNjhoCRTIK5bGUI86sJJL19PfZHbjiz0hZzHH/kLvG
 Q75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=aS7EigyogWQ+GM6QLzPXOzXftjKZdWVVXhkoTRLFJBg=;
 b=Z62Xsn1eK4zZ1OSlCs5SweRJ27UhS2B9342ohUUfYrsQHYlUiznGN0zXKW5J8CQCzz
 FxP4xCrr1Atxpf4CvJ5XCx14h3lDvzSRXCWfzL3LhZwOuPxw5n0xub0MX81Z9yM6h1ZD
 WnnbvZWudwEisnxA4WrLy02Zqi/vqu2gSm+NjaI7adoxTEbvfNYzZZnrvj8y9SM4yA39
 1RPtv/dLVG66wqKoZxdQjf1lY754skAgNnGHy8KAbiSywFAbut63F4hfB4fgsgP76ce7
 VqfLIUwEDdf6PCkkrkBR7abAd9IcnxveQGmmIVixw2ehIK7+xnsQdVIqHqz1sZTNQwpQ
 aX8A==
X-Gm-Message-State: AO0yUKUuifbPcilVGQ42RbtgSnD1qJr8am5AjvFz5xq/nnihlndK+xM3
 2aGcLFg3kbTt2XM1dudXru0yzA==
X-Google-Smtp-Source: AK7set8zMW/aHHUa3RM22zJ6pc4UlcrDdixVlpGTWHV/IGN5gXTEoLJIjg7SfKRLXjlsKfVTupzjMQ==
X-Received: by 2002:a5d:4dd2:0:b0:2c9:5675:7def with SMTP id
 f18-20020a5d4dd2000000b002c956757defmr7251965wru.2.1677776729930; 
 Thu, 02 Mar 2023 09:05:29 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a5d4ad2000000b002c5584d0e3dsm15784139wrs.24.2023.03.02.09.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 09:05:29 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0CF841FFB7;
 Thu,  2 Mar 2023 17:05:29 +0000 (GMT)
References: <CAG8fp8S4AErtJ5YjpmW5d7+sRSyqQp+Th6NrJRm248gohNwCiw@mail.gmail.com>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiro Suda <suda.kyoto@gmail.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL v2 20/24] tests/docker: use direct RUNC call to build
 containers
Date: Thu, 02 Mar 2023 17:05:02 +0000
In-reply-to: <CAG8fp8S4AErtJ5YjpmW5d7+sRSyqQp+Th6NrJRm248gohNwCiw@mail.gmail.com>
Message-ID: <87zg8v9j8n.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Akihiro Suda <suda.kyoto@gmail.com> writes:

>> +               $(RUNC) build                           \
>
> There is no `runc build` command.
> Perhaps you meant `$(DOCKER) build`?

No RUNC is defined in config-host.mak now because it can be docker or
podman.

>
> Regards,
> Akihiro Suda


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

