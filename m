Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A4F375BAF
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 21:27:25 +0200 (CEST)
Received: from localhost ([::1]:55598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lejee-0004lN-OP
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 15:27:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lejYz-0000Ze-A0
 for qemu-devel@nongnu.org; Thu, 06 May 2021 15:21:33 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:53154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lejYw-0001DX-Cg
 for qemu-devel@nongnu.org; Thu, 06 May 2021 15:21:32 -0400
Received: by mail-wm1-x32e.google.com with SMTP id g65so3969316wmg.2
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 12:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Yg1I4glWqaS52CpGzVFLIbEPG9mJUqSU8zT79wfMSYY=;
 b=Rz3wmpXtVAdrQ1thoNAPQ/PPtRWrjCHNAGbI+HwCZ56fHeQKzIY2FXYiEYWbJYwLAP
 orathCPW15Fjg0pnVV4jtr2Sb0a2cdJ4glga6Khl3aMlPMMMixUff4KzSFn8oLY6IZsv
 jhpOHZi4+htCTw9xjJv09l4MofgBfJw/b4un11GqghXoEiAVG/bZuYTCsTqqsQJrJtQs
 rFGzICq9MlwNHRm1QiW6iaUqw/UKWNm0OAzn39VkJUof6O7XcAySQJdAoIGQ2C8W3iaQ
 HAV8cCTfqv04FNLeO4ErEHflQvAtsWtaFZK2NZA9BY4KTg0kP8ebbsIywZt3kfwSBenD
 /grA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Yg1I4glWqaS52CpGzVFLIbEPG9mJUqSU8zT79wfMSYY=;
 b=cUc+72k6NmwPGdDW5QJaWgkLyIihCiZr+0zJTpCj81WseYiTPjy/ElH2jhGCt0ejjW
 Cp/IGoMvpagjYFF+a0SVusU16XpQV/OxJ0g9HjKlRD5jroiw556iZHj3XFd6rp+tuKuX
 NM2dG2ylJbcPWNkVrEPml7g8sJBxA2qG+fzMIHXhCJhU71DlClq30YGE/xSq9co/SGBG
 vBycl/bblgMxjPCmitBQscDevmzg7qN2IVnQOuSj2EyPtA1PMBUAwOYxFTzvRRJWdFqv
 tF1QrHFBSKYuHihM+vekPma6jO4Yafe0N0t0YeStjc9MsE+FexSPNAmnL+SYYxGU/h4N
 bRrQ==
X-Gm-Message-State: AOAM533uZRBO1MD21tAH6AdiRnePGvGkwoeMnvd+don+QaYMfWzFY2jf
 rWvllAHbgaNtjALnQELkmFu2PQ==
X-Google-Smtp-Source: ABdhPJwqY14O7WbIKOgN7nshCCu9J2bEWolzDXRzV0lrgqSAVLjIWEtC/lSVYcgKnDH/+C6AoPg57Q==
X-Received: by 2002:a05:600c:220e:: with SMTP id
 z14mr5858595wml.0.1620328888444; 
 Thu, 06 May 2021 12:21:28 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z6sm4285367wmf.9.2021.05.06.12.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 12:21:27 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7349C1FF7E;
 Thu,  6 May 2021 20:21:26 +0100 (BST)
References: <20210506133758.1749233-1-philmd@redhat.com>
 <20210506133758.1749233-7-philmd@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 6/9] gdbstub: Only call cmd_parse_params() with
 non-NULL command schema
Date: Thu, 06 May 2021 20:21:21 +0100
In-reply-to: <20210506133758.1749233-7-philmd@redhat.com>
Message-ID: <87y2crmzwp.fsf@linaro.org>
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
Cc: kvm@vger.kernel.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Move the NULL check on command schema buffer from the callee
> cmd_parse_params() to the single caller, process_string_cmd().
>
> This simplifies the process_string_cmd() logic.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

