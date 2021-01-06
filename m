Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 228202EC18C
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 17:57:41 +0100 (CET)
Received: from localhost ([::1]:56578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxC7v-00032Z-W3
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 11:57:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kxC6c-0002Xa-2a
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 11:56:18 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:34822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kxC6a-0004Up-25
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 11:56:17 -0500
Received: by mail-wm1-x32e.google.com with SMTP id e25so3215918wme.0
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 08:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=pGe6y2u5DjApFJ+J0st5/6hMcGO48FBTn6VQseYYq6g=;
 b=AzZg7PnapUZ/uOwNaz4demi9yoyuxSyPZ2DeHMCb4Cq0gxa3ytqhoSxKnnS/8JJ6/U
 nYv79zM5egqqzJI8z7TybIvkrlbhTUSd9eDAruiBM2yiEU8PwCzk/rdZEpNnUWiuaK0I
 ZvV1qLyiHyjDE0vTGyaguTIr5gZKv27ZW6ryfuNQ4DnajBF645t42aFL8XxlrZLCKpQA
 EqOKbTG2rnA2LkoCxjrl3GXQh1B7upzY/N6FDpLvGlF65HZ7ejgz8WDgtJmzN/ZieggR
 oe9AbrshAQlTr7HInUgLJ5G9V1WM/yqyW8xsUa4BRmDMeKBrwrGGvzRVuUCWjnnuspiV
 2gbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=pGe6y2u5DjApFJ+J0st5/6hMcGO48FBTn6VQseYYq6g=;
 b=TqEL+1AsBuxX80gDZGYKZxUHZPEJwJPApC6e/yDJFFqp7xiKYnIlTdGrHRH5ZJ5V98
 GxtTB4yLQVgv0tii5ngC1l35SLpcKrCfB72361PbGKLUfmyoHv0w3agEbB/l7HBckTbR
 eqnnrmEf6coWBWgT+p2ws4/Im33ifTfi3lRJyT2/ht1JSq7kN90mjCcWMDP+7wR6zu0u
 4U20JHcUnzEfj4tEbMuYQ4xTzTr77MfNvwORhjZOltspx9TNQFJfJRru6jpIUdOh7yIJ
 KpB3McQ/BmRzApDft9OuAOY9JvuZs0LebXw9tZgkZer3dOIXV0GcXaY+7Ctd1iobzCMB
 hrHg==
X-Gm-Message-State: AOAM530MzUOmwmTDbP7oB81SmxuhHUXt1p+E7GULEgl4kFejnSDj7z/f
 sKrsohK9c0ZyosFfHYJDNQ6CBg==
X-Google-Smtp-Source: ABdhPJyhVi0HJCcDbyBEP1DEx9NNjWH6wnGQaUh5DxVxOeL1S8GEp3/bqSa3uhc1vnAXdujGDllG/g==
X-Received: by 2002:a1c:46c5:: with SMTP id t188mr4503983wma.3.1609952174028; 
 Wed, 06 Jan 2021 08:56:14 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k128sm3964321wma.43.2021.01.06.08.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 08:56:12 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3B2C01FF7E;
 Wed,  6 Jan 2021 16:56:12 +0000 (GMT)
References: <20210104144241.343186-1-pbonzini@redhat.com>
 <CAFEAcA_1MWezZ_X=V8JKBVjMRMO8Z4tY=_qAHV20ROzU+EEm8w@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL v2 00/53] Misc patches for 2020-12-21
Date: Wed, 06 Jan 2021 16:54:20 +0000
In-reply-to: <CAFEAcA_1MWezZ_X=V8JKBVjMRMO8Z4tY=_qAHV20ROzU+EEm8w@mail.gmail.com>
Message-ID: <871rey2edv.fsf@linaro.org>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 4 Jan 2021 at 14:44, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> The following changes since commit 41192db338588051f21501abc13743e62b0a5=
605:
>>
>>   Merge remote-tracking branch 'remotes/ehabkost-gl/tags/machine-next-pu=
ll-request' into staging (2021-01-01 22:57:15 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>>
>> for you to fetch changes up to bac87e979fcca9f884e1c9190132c51d99a86984:
>>
>>   win32: drop fd registration to the main-loop on setting non-block (202=
1-01-02 21:03:38 +0100)
>>
>> ----------------------------------------------------------------
>> From Alex's pull request:
>> * improve cross-build KVM coverage
>> * new --without-default-features configure flag
>> * add __repr__ for ConsoleSocket for debugging
>> * build tcg tests with -Werror
>> * test 32 bit builds with fedora
>> * remove last traces of debian9
>> * hotfix for centos8 powertools repo

Given this might take awhile to get in and the fact I've got more fixes
for regressions since Christmas I might as well include these in a only
testing PR. I'm giving it a final run on the CI systems now before I
send the email, tag for reference:

: To github.com:stsquad/qemu.git
:  * [new tag]               pull-testing-060121-3 -> pull-testing-060121-3
: To gitlab.com:stsquad/qemu.git
:  * [new tag]               pull-testing-060121-3 -> pull-testing-060121-3
: pushed pull-testing-060121-3

--=20
Alex Benn=C3=A9e

