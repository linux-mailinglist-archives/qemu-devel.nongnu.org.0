Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7CA485053
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 10:48:10 +0100 (CET)
Received: from localhost ([::1]:33574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n52tt-0002cc-OZ
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 04:48:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n52rm-000171-Gi
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 04:45:58 -0500
Received: from [2a00:1450:4864:20::329] (port=45792
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n52ra-0002XN-Qo
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 04:45:47 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so2968721wme.4
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 01:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=fIlHm8r1Sfxa+IDpqtqc4n9OZxvmNHC2w/RCNWD/fuw=;
 b=pLi3BKwsGUaJl87SpZbbCb/L0hiJZ7jVZS9UGXnaYcaxmzdl1tAKUPUyDF5G7VG2Cu
 zh25DfjU/qwnKdKugHMm0ZoFDc3rNzanO8QvpiMnHGf4fYaNKBThrXAfZ//QkTx3/cem
 cNvVmlqMN+XLfH1MpgD4OFMPjxXyRXxNUTEfjZwzeANaPIBp5aCEtUSMj3AU+N25tYas
 wsabIxshClyz133eTrdEBFsM1YH9C1rvZGLJbC6VmBfjcaoU6KZWk/1qVbBPWQvHOZYI
 hXMv4youvtCAoi7tZCCX3OHaDWhOQU/Z6ZTZ3oMKui90uqq37V04ziJtGmrsijvUiadi
 fivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=fIlHm8r1Sfxa+IDpqtqc4n9OZxvmNHC2w/RCNWD/fuw=;
 b=ZQZYb6Y/x8mh1hq/PQpikBw5+8DpObvfiaUsk3wgU+7QFFpV+SY/ehQqap90oYeuy4
 C9XKYokts1hHeICYG1UhQxrACpDDV2WQlw2aYz37m4gSF+oQyxvpKMeFjwGu+8lS4N2H
 hwsZCyusXBMAcIaaq+A3HcaQYuu/kFiJzI0DGEfpmHTyrc2Zv99eoyvqFpW5+/fSphVd
 Sq4Iqamh/cdyP0uVlh6UGQ9UlZQF9ZkFikbVXgegZeYPz/WKR1vpl54sQ+PraihEVCcK
 M4wv/iTvhLzDbfiZ33jZrE7M58JQDb3luph8k65Cc1QU+I6swFY1kdKoEvxeYfG1NJZt
 DSpA==
X-Gm-Message-State: AOAM531kp6UpZBydE4qqoDCfR0tqJNezayB/64UD/inVDMilgTFgQEDy
 s08i4TQw57JGlby2et0x4wQcSIkNV5ss6w==
X-Google-Smtp-Source: ABdhPJwRiKBJj8qqu88rflokPp4YIxf4ryEDYraUW/xJwhUO69cVtrlKvxLT/SfxkmxPXEr+P2Ihmw==
X-Received: by 2002:a1c:2187:: with SMTP id h129mr2104007wmh.34.1641375943599; 
 Wed, 05 Jan 2022 01:45:43 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r7sm39456844wrt.77.2022.01.05.01.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 01:45:42 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3D2C31FFB7;
 Wed,  5 Jan 2022 09:45:42 +0000 (GMT)
References: <20211221111624.352804-1-pbonzini@redhat.com>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] docker: include bison in debian-tricore-cross
Date: Wed, 05 Jan 2022 09:45:37 +0000
In-reply-to: <20211221111624.352804-1-pbonzini@redhat.com>
Message-ID: <87tueijz21.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> Binutils sometimes fail to build if bison is not installed:
>
>   /bin/sh ./ylwrap `test -f arparse.y || echo ./`arparse.y y.tab.c arpars=
e.c y.tab.h arparse.h y.output arparse.output --  -d
>   ./ylwrap: 109: ./ylwrap: -d: not found
>
> (the correct invocation of ylwrap would have "bison -d" after the double
> dash).  Work around by installing it in the container.
>
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

