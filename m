Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAB15F2ECB
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 12:28:42 +0200 (CEST)
Received: from localhost ([::1]:50588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofIgj-0003tR-0i
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 06:28:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofIdP-0001GS-S0
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 06:25:16 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:35556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofIdK-0000NN-VP
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 06:25:14 -0400
Received: by mail-wr1-x42a.google.com with SMTP id u10so15884996wrq.2
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 03:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=k9+FDhBPVB1Vrx7EmfII3ij47GLb7oYuvlJVulScN5s=;
 b=MaFsP1VLpLVNAh3oiMMvKDR6VrCp+OmkE5o3gsBU2Pvs4aS4GVHdX37vmcjvkAWoTV
 AnLHlAGtQZXM4Ehs1wCtINbMjI/BV4EiioUpyweGYYArxQykOV+Kp1ylCxDr2wm5QErO
 jXR+ZJY8twPl+B19fraDJPkdCAPJEiXSBqioofFS8JPQaMmbgF3ozoFdNm0OV6XXioYR
 IL9S3jY/nDLpN4rE1oIV/Ucz4a34LjiOizqInCu1tTsTNdifYFXyHFr9teiAmiqn/CLc
 GJsMj3YUM5+11frzMFHgsbFDNalnl0ug/r5wrewrsDxWWSQxeBJbQstWi3SLE9eI1WjR
 QEYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=k9+FDhBPVB1Vrx7EmfII3ij47GLb7oYuvlJVulScN5s=;
 b=hG7AUtlR+eo03/s6IjdDzxJFcP/cPzQmiheRPEG53FUPku+F2CW6NWDW10TZLZ0dqL
 OmrmrQsb9ZYdiIiIQxKBo9CmW6qB5CjJkokH6VSyzcXjdepkZSysPKDcPKfuvuHra8v3
 9LXoMcHwQj4+OpvgMFPMCYWEe3U6Pi6lb3bcr3l03cNR6DzTERbj0uxH0doMReSBsdpc
 AIDMqzlrp31RwmIC7tKVGI9yjUXgVvXLYVSVWtVb3SFhlFnaorHvu3UuA46Nj7WfZEqk
 NXuV2BiOYF+4Mn6ZtLbBTPfG8BFgMz+bhXDwJIVQzSAGJKKuJMcnC5fDhCWPa9/ve8gQ
 heDA==
X-Gm-Message-State: ACrzQf2dWQ0Y0GK0jXgpmdhn55ZShcpB1Kgq0UP5sDI/RRtVAq0WDQ/+
 /356NygcqaquOYfDKAE5sK36+g==
X-Google-Smtp-Source: AMsMyM6PHogbl3vrgp8J+SQ+uWFOWRvZl9l7zdJjeU1Lqz2CZtakUnNN5oh1MwHr6xwx7AjKXRN9aA==
X-Received: by 2002:adf:9dd0:0:b0:22c:d6cc:b387 with SMTP id
 q16-20020adf9dd0000000b0022cd6ccb387mr13252961wre.353.1664792705939; 
 Mon, 03 Oct 2022 03:25:05 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d10-20020a5d6dca000000b0022917d58603sm9411346wrz.32.2022.10.03.03.25.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 03:25:05 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 78ABF1FFB7;
 Mon,  3 Oct 2022 11:25:04 +0100 (BST)
References: <a7da7e40-6f7b-79a4-709b-da0e71def650@redhat.com>
 <93033078-221d-23d2-23e7-13eab59cd439@amsat.org>
 <CACGkMEsQSn_GOBcs64JEDUHt3T7XOBL3LLM7yvqwwR5xvvD2dg@mail.gmail.com>
 <a25c238b-dabd-bf20-9aee-7cda4e422536@redhat.com>
 <87o7utnuzp.fsf@linaro.org>
 <CAFEAcA9YyN802x43+K27Hv1-rvkBbxE2r5sfxxahwmJtFAEP=Q@mail.gmail.com>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, =?utf-8?Q?Marc?=
 =?utf-8?Q?-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Daniel P. Berrange" <berrange@redhat.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, qemu-discuss@nongnu.org
Subject: Re: If your networking is failing after updating to the latest git
 version of QEMU...
Date: Mon, 03 Oct 2022 11:22:27 +0100
In-reply-to: <CAFEAcA9YyN802x43+K27Hv1-rvkBbxE2r5sfxxahwmJtFAEP=Q@mail.gmail.com>
Message-ID: <87k05hnr0f.fsf@linaro.org>
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 3 Oct 2022 at 10:09, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>>
>> Thomas Huth <thuth@redhat.com> writes:
>>
>> > On 29/09/2022 04.32, Jason Wang wrote:
>> >> On Thu, Sep 29, 2022 at 1:06 AM Philippe Mathieu-Daud=C3=A9 <f4bug@am=
sat.org> wrote:
>> >>> Jason, Marc-Andr=C3=A9, could we improve the buildsys check or displ=
ay
>> >>> a more helpful information from the code instead?
>> >> It looks to me we need to improve the build.
>> >
>> > I'm not sure there is anything to improve in the build system -
>> > configure/meson.build are just doing what they should: Pick the
>> > default value for "slirp" if the user did not explicitly specify
>> > "--enable-slirp".
>>
>> Shouldn't it be the other way round and fail to configure unless the
>> user explicitly calls --disable-slirp?
>
> Our standard pattern for configure options is:
>  --enable-foo : check for foo; if it can't be enabled, fail configure
>  --disable-foo : don't even check for foo, and don't build it in
>  no option given : check for foo, decide whether to build in support if
>                    it's present

Don't we make a distinction between libs that are truly optional and
those you probably need. It seems missing working networking is one of
those things we should be telling the user about unless explicitly
disabled. It is after all how we worked before, we would silently
checkout libslirp and build it for you.

>
> -- PMM


--=20
Alex Benn=C3=A9e

