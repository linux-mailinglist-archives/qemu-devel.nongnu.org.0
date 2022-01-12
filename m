Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D43FF48C24D
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 11:29:09 +0100 (CET)
Received: from localhost ([::1]:60022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7asO-0002HS-S8
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 05:29:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7aqL-0006xX-DY
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 05:27:01 -0500
Received: from [2a00:1450:4864:20::431] (port=34809
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7aqJ-0002h4-F0
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 05:27:00 -0500
Received: by mail-wr1-x431.google.com with SMTP id h10so3365060wrb.1
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 02:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=amGHpxfnDxcK7lKa/PRbYjltN/lFqsf4S82zdvADLVA=;
 b=Q7yA9c+PnN7DLXMhsCZQEEFykvgXh0q0Wamnwelo1fbYBRryEKWyNkj7BMYs/aeLx3
 TEkQA5odIhRcCfymDURvfZYk7W7EV4+xn76J4VqPn+De1+wWSIwHsKWeX3uaw9Gpt2A2
 WA5BmztKuDIgwQiT+i+WUQc5wfdHSZr4VHmgzANwPSnCesIeQBeaaX6eqtAsWJanzVeD
 uV86h8qOiKugqAsaOMxv7XklL98a5LYiAvlJndT+5tB5WeiBZ0o5YUD9ZDgruvnViyzJ
 SCjV6IN1jvvgNfdmX2lJVBtvC7tqBK0QTfsgX8nGz6oR15znzRMFIBB68OQ7yDxpDipI
 WnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=amGHpxfnDxcK7lKa/PRbYjltN/lFqsf4S82zdvADLVA=;
 b=RTS1YBPSm8+U8qfH+tXVd/s2un/5iNnYCza5y9FOR3gLf74WJBGX1TjNakpewn0OUV
 SF5JdHzqqTNbqY9YyakgOHOTpLqxG+jREHrwi6v09ZyS7qrOSavNFtmxL6K5hIEY10Pc
 bUPqlvpWiy0FUTxzlK9tJwbiD/reR1mBJpdaUb5xfZziMK8QShzJOcfy4t+0qDJaOqXn
 hLg+ylglX56nXJ9OCKxa+TMUsZ+YMwON+HmaYoNXfSumvbZ3G2AZ69onPIGQcz7M+Nvw
 k2S8RyLJFPl5657Qpb7aVOBTyAXhvD29u/3Lby0tekteSAWLihGxuVen80B9n7Stxnh1
 DuFg==
X-Gm-Message-State: AOAM531eKRnKH6Y5Ndz4U9sR4mMFkvY52ouTyWUkg/Kj71flHoIzlAUa
 ibRbBS5nbWq7Japail6cNTQQS47QkfZc/EX4lGLDUw==
X-Google-Smtp-Source: ABdhPJyDNUDh/pAwm+o42kVNiXtl54eIpm4qtmvEKUlqVAWioAvkbdzi3cZDH2BBvpdjlLJlRsVotAmoxNxhR2pKn+A=
X-Received: by 2002:a5d:52c4:: with SMTP id r4mr7634901wrv.521.1641983217458; 
 Wed, 12 Jan 2022 02:26:57 -0800 (PST)
MIME-Version: 1.0
References: <20220112102345.79395-1-dgilbert@redhat.com>
In-Reply-To: <20220112102345.79395-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Jan 2022 10:26:46 +0000
Message-ID: <CAFEAcA9b9NtkyWY2aCUpOvm2J5uRVt9qUPj6gPk3MFtkTh6ceQ@mail.gmail.com>
Subject: Re: [PATCH] migration: Add canary to VMSTATE_END_OF_LIST
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: lsoaresp@redhat.com, marcandre.lureau@gmail.com, qemu-devel@nongnu.org,
 peterx@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 12 Jan 2022 at 10:24, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> We fairly regularly forget VMSTATE_END_OF_LIST markers off descriptions;
> given that the current check is only for ->name being NULL, sometimes
> we get unlucky and the code apparently works and no one spots the error.
>
> Explicitly add a flag, VMS_END that should be set, and assert it is
> set during the traversal.

Does 'make check' definitely do the traversal for all vmstate
structs, or do we need to add a "sanity check them all on startup"
bit of test code ?

thanks
-- PMM

