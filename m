Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B8B3B16D1
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 11:27:33 +0200 (CEST)
Received: from localhost ([::1]:52616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvzAS-0003t0-NQ
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 05:27:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lvz9F-000376-Kr
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 05:26:17 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:42927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lvz9D-0002dd-Ft
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 05:26:17 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 l7-20020a05600c1d07b02901b0e2ebd6deso866634wms.1
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 02:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=i+gPlB8x6F565TulFMuQRQLZD4n0LXyQSF6/jwOL4Fs=;
 b=sN1uWw3Mh8yzJeVn5xa2QyGYZrVYPf0yTrtXzTSHwn+zmaa2LxxpGG0ZWmErohrtS+
 RD4vuZpAlAU+ddMB657srvWTOMFzHB22smYQjNOn7sPmkv9//T28aMKonbnBQzFwUXMS
 kHVkcLKP2LvaB+g8QjcZTeeHUMxpTK1B6RFAi1N9UjiKXmBEZVBf/3na7LM0IIJK3sy3
 I25LId3VZgZZGiw2HjUIbJ0mFMtsegIH2ykQdKchIlGGi5w9bsnPYzeHI0/Mf7fQlPvd
 Zh/BbzKBS+Q50tRyshC1IXZB25q9T7FVsj6dBjoTcJM8PnlBrrXxGDa80eKUEiYyVK3X
 dc7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=i+gPlB8x6F565TulFMuQRQLZD4n0LXyQSF6/jwOL4Fs=;
 b=razpvPxVYQ9ZmZAjoDR2vUcxSMDMY/iDwCSJnJs6E0dHR5iPrEm1Cat/zP/bCo7x/R
 8opI4Eif+duTzehgDQVrxqG7plRbl5kW1WCSBPYNpY8mluTnoQcP0l3D1LmkgnyJPYF6
 3YgdhJuMkInwU9/zzvvsFV22L+KXRIk9bTpNWn6SzvQ72HAk1i8AxMVXJIqZieJKpvt+
 Gj6hhN5PmyIGZhneJ6UGj996ToCNFZhKedp/E97SK7/CocVsyANXYijFqSpuzPE90o8v
 9Y0hH+73lV/wlnQ3Nsd/WJpgmwJ5Vb7JaPYN55sx8B1b5Uul9TYwItrIbdgKlNl3Rmdg
 ePsQ==
X-Gm-Message-State: AOAM533ZqfmaIaTvvo1GTmHkOkdQrOyoKSSYwzoVa7X3ooDpQA4UDkpV
 yCh672OwGCjM91lNscKknDweog==
X-Google-Smtp-Source: ABdhPJzkoi054ud5cBIyjJvx1aWLHg1wIPVAUwYtt+UnFGcnQ3fFCVxmZdagHwBwZlvfurt6RlNzLA==
X-Received: by 2002:a1c:4955:: with SMTP id w82mr9999125wma.16.1624440372901; 
 Wed, 23 Jun 2021 02:26:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x18sm2211943wrw.19.2021.06.23.02.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 02:26:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 703FB1FF7E;
 Wed, 23 Jun 2021 10:26:11 +0100 (BST)
References: <20210607153155.1760158-1-jsnow@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 0/2] Gitlab: Add issue templates
Date: Wed, 23 Jun 2021 10:25:55 +0100
In-reply-to: <20210607153155.1760158-1-jsnow@redhat.com>
Message-ID: <87k0mlrky4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Peter Krempa <pkrempa@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


John Snow <jsnow@redhat.com> writes:

> Add "Bug" and "Feature Request" templates to the Gitlab interface to
> help improve the quality of newly reported issues.
>
> To see what this looks like, I've temporarily allowed my Gitlab fork to
> diverge with these files merged.  See my fork's "new issue" page to see
> it in action: https://gitlab.com/jsnow/qemu/-/issues/new?issue
>
> (It's outdated a bit for V4, but you get the idea.)
>
> These patches do not add a "default" template, the user still has to
> select one from the list. I recommend that someone with permissions
> updates the default template:
>
> 1. https://gitlab.com/qemu-project/qemu/edit
> 2. ctrl+f "Default description template for issues"
> 3. Update the default to the (suggested) below:

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

