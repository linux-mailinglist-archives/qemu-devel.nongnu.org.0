Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F1F65FEC7
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 11:26:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDjvV-0004pS-LN; Fri, 06 Jan 2023 05:26:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDjvT-0004pJ-Ub
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 05:26:15 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDjvR-0001pw-Vt
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 05:26:15 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 b24-20020a05600c4a9800b003d21efdd61dso763598wmp.3
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 02:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2LzgWtFWFP8DnfT6moFznTYzh9ldKM3GSCZYVlt8zOg=;
 b=ATSURHB9KKT/vjV7rekmOJy4230NmqAYYi68j4/KlTOzGRXNPOk0K3HQu55UssYp3Y
 9cak5g0Nla2TVQQ1GmFAOk55zCSM/Nd7/33ccoQLpfguUoQ1jA+l4yfKaKJtNNMwaAju
 0be+MOeX2oGnLHm0T+iQhFYs+0ZXntx9bkbfpIhxF6hEgnLUsXbJ31q/WuZjepD3/xSo
 zCwbbHPCQRyvtP1AJVPkLSupDOeZyEujBePzcxvcln+a4181S6NhNaA9Mc45L0LTp56M
 1yS+9GZwGmFAyJUbfFl1HuLwGfGmncwy3N6eskEZtXZon5kQp9j9h/E4S0WwbeFmdSiV
 ox5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2LzgWtFWFP8DnfT6moFznTYzh9ldKM3GSCZYVlt8zOg=;
 b=YPuRvgEjIFuheIsGG6MQa+HpEWpli5boBBXHL40IBNbp4IncsiyHxnVfZDo3lvs4Z/
 O1yptxsWddc3nIQL1fFBd8qZh7GfykiAS/z4M1vAdyTm8HV8RCMt7D6JL9nN5BI1E1Nd
 5ZuxNauJJ+FD0FmM9b4pb8/2hBFAle9w6BuAqhBGkIflfFjV2+La+a0hbaz3SMDXYpyj
 d7v6e7uuhlwtwtp42VqGb28StCGR8s2FKNWquOGe3Vm+EneSIWhccRWCU9RHVfITVN1G
 zwj1XhOGcppwSn3woG++TeuSlEHf0HdppRYismP58G7KiBHZnHiszgCBHVz+DD8piYVG
 JtcA==
X-Gm-Message-State: AFqh2ko0nkuOfKUIWRaUZRRV8KSSH1qswcYgvwR+dnR0cGxrXUWWPaDJ
 Phiux7dLw9xbuNMx+7L+DlDnNg==
X-Google-Smtp-Source: AMrXdXujtDUcaARJZ8Ba0ESO16fEV2tEhM9OcJyaebHCzkprszNfD2AYnec/JSfdAFkvY9jkHU4Y9A==
X-Received: by 2002:a05:600c:4da0:b0:3d2:3a53:2cd6 with SMTP id
 v32-20020a05600c4da000b003d23a532cd6mr39400521wmp.9.1673000767568; 
 Fri, 06 Jan 2023 02:26:07 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a05600c198c00b003d9de0c39fasm1053317wmq.36.2023.01.06.02.26.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 02:26:07 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8DAE21FFB7;
 Fri,  6 Jan 2023 10:26:06 +0000 (GMT)
References: <20221201133756.77216-1-thuth@redhat.com>
 <87edsvi3dx.fsf@linaro.org>
 <CAFn=p-ZFhooNAAKB1rhp6rc=i9eacpkryD2JtDgHeMpNGhyF1A@mail.gmail.com>
User-agent: mu4e 1.9.11; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: John Snow <jsnow@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, Peter Maydell
 <peter.maydell@linaro.org>
Subject: Re: [PATCH] .gitlab/issue_templates: Move suggestions into comments
Date: Fri, 06 Jan 2023 10:25:57 +0000
In-reply-to: <CAFn=p-ZFhooNAAKB1rhp6rc=i9eacpkryD2JtDgHeMpNGhyF1A@mail.gmail.com>
Message-ID: <87mt6wot6p.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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


John Snow <jsnow@redhat.com> writes:

> On Mon, Dec 19, 2022 at 2:45 PM Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>>
>>
>> Thomas Huth <thuth@redhat.com> writes:
>>
>> > Many users forget to remove the suggestions from the bug template
>> > when creating a new issue. So when searching for strings like "s390x"
>> > or "Windows", you get a lot of unrelated issues in the results.
>> > Thus let's move the suggestions into HTML comments - so they will
>> > still show up in the markdown when editing the bug, while being
>> > hidden/ignored in the final text or in the search queries.
>> >
>> > Signed-off-by: Thomas Huth <thuth@redhat.com>
>>
>> Queued to testing/next, thanks.
>>
>> --
>> Alex Benn=C3=A9e
>> Virtualisation Tech Lead @ Linaro
>>
>
> Remember to update the default template in the gitlab dashboard. I
> don't believe I have the permission, or I'd just take care of it
> myself.

Should be done now.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

