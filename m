Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0A02E8574
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jan 2021 21:02:13 +0100 (CET)
Received: from localhost ([::1]:59920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvQcm-0000pN-I3
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 15:02:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kvQaz-00005L-VG
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 15:00:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kvQau-0000jq-T4
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 15:00:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609531211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p+6OlXbekPDt1u/c6WBT42/DFFrUcTU8GTQnhJdeSQ0=;
 b=DXey1q1El/lBmHfpo0TFpKGRgNk78XaUAtPu4tEb8Zr89kFEoYeNCEQtWwyQelErsuejs7
 3Ys3uPjYIUiPPFU15xLpuSvttCfswq5kGypu7y/QifXTewwelsjYsyHZ2qtAMsBUvdkGdv
 FOiy9MoXU5UqdE4l9QZsBb0vBQ3/yuk=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-GjhORSG-PMaFoZzhzxQ6wg-1; Fri, 01 Jan 2021 15:00:09 -0500
X-MC-Unique: GjhORSG-PMaFoZzhzxQ6wg-1
Received: by mail-pj1-f69.google.com with SMTP id ob4so8454244pjb.9
 for <qemu-devel@nongnu.org>; Fri, 01 Jan 2021 12:00:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p+6OlXbekPDt1u/c6WBT42/DFFrUcTU8GTQnhJdeSQ0=;
 b=CiiJzrWOMf4C95QPFE7aTSxEF5/uugsTYvLFYFW+oxQizX2TywzumIz909UEsYsRcR
 +TXETOZT/PJEeM1/OhdBH8vN9GRfoSt842hJkbqpuYLMRPmqWtBADd2/Md5hJq+FjtFE
 Q53nwD5K7Nz0b09jUkWWSaZNlwfkB6YtYFppcNc0YrvS/WCUD1tu6QJz/bPv2sItQbje
 ozVm5kS1kvvizbDOJRyHVKvsl0LYcVrkiMqxg1MI6O2xqYjTQbwbDSPnTTn9ZUnqt6xG
 McYWMPdWEH9fEjXLl0WVzLrJweZYTIy/rHNNKE807GcFneKUKac4I2j7Gf9yTE9Yk+6W
 kajw==
X-Gm-Message-State: AOAM531z8cZKJn3axFyG/v9qJ76IsfxdFPCOxpZbAujzH73CnqtN/wfN
 CU9xKXLrynREjiAzezGIubSKXdr3p0XraTXXxBwdmTxtZLB+MGbqIPSctveN34hD27gPHsZYHeO
 Tu73fW9wNohKKg/Ev3xOrd5Lm/2yk7Ao=
X-Received: by 2002:a05:6a00:1506:b029:18b:5a31:ed87 with SMTP id
 q6-20020a056a001506b029018b5a31ed87mr56204078pfu.55.1609531208280; 
 Fri, 01 Jan 2021 12:00:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8dfRgm4V0T5w1PWv3ojfEgdd4kLPbvLLRBywn7NzfAErbZmWXHhloRhVwK1qnAjc/hNoG0liQBx6XleH4npU=
X-Received: by 2002:a05:6a00:1506:b029:18b:5a31:ed87 with SMTP id
 q6-20020a056a001506b029018b5a31ed87mr56204062pfu.55.1609531207932; Fri, 01
 Jan 2021 12:00:07 -0800 (PST)
MIME-Version: 1.0
References: <20201221144447.26161-1-pbonzini@redhat.com>
 <CAFEAcA-h90X=-aXdgz=9YmQuSSa7xWvOU61thcYp+0p+y3ZGSg@mail.gmail.com>
In-Reply-To: <CAFEAcA-h90X=-aXdgz=9YmQuSSa7xWvOU61thcYp+0p+y3ZGSg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 1 Jan 2021 20:59:54 +0100
Message-ID: <CABgObfZnz3aCV+FfTJQmm1xiDeUCJRFedwh6BLzS1Y9Y2Tp5Yw@mail.gmail.com>
Subject: Re: [PULL 00/55] Misc patches for 2020-12-21
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000e772cb05b7dc2f24"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e772cb05b7dc2f24
Content-Type: text/plain; charset="UTF-8"

Il ven 1 gen 2021, 18:05 Peter Maydell <peter.maydell@linaro.org> ha
scritto:

> (why does it print the same failure three times rather than
> stopping after the first one?)
>

It probably has something to do with how make processes rules to rebuild
makefiles.

I will remove the patch that moves xgettext from boolean to feature and
then try to reproduce the failure.

Paolo


> thanks
> -- PMM
>
>

--000000000000e772cb05b7dc2f24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il ven 1 gen 2021, 18:05 Peter Maydell &lt;<a href=3D"=
mailto:peter.maydell@linaro.org" target=3D"_blank" rel=3D"noreferrer">peter=
.maydell@linaro.org</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">(why does it print the same failure three times rather than<br>
stopping after the first one?)<br></blockquote></div></div><div dir=3D"auto=
"><br></div><div dir=3D"auto">It probably has something to do with how make=
 processes rules to rebuild makefiles.</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">I will remove the patch that moves xgettext from boolean to =
feature and then try to reproduce the failure.</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
thanks<br>
-- PMM<br>
<br>
</blockquote></div></div></div>

--000000000000e772cb05b7dc2f24--


