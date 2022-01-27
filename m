Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2646F49E7F4
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 17:47:27 +0100 (CET)
Received: from localhost ([::1]:57772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD7vh-0008Ic-Qj
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 11:47:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nD6ab-0005sN-Nv
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:21:33 -0500
Received: from [2a00:1450:4864:20::535] (port=46842
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nD6Zw-00043L-AC
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:21:16 -0500
Received: by mail-ed1-x535.google.com with SMTP id m11so4057422edi.13
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 07:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=qF4QcpMuNcMy8kSMfRBvsCnPzYUywg9vOjmsFp6VR/g=;
 b=Gy73PfoccphY2IUbbo5Pyhg1PQB1I6Q4ye0C6LxeRUWyLAAo7ooZjioBQAQSfphcFp
 BT/mxLXbZsZaB9H1AzSGiRpixKdSQoJFeHQTG73oHb9T6Ebu7jumSwcNLOlDq64UqlmN
 EEyJ2WayS8B+904lNli0nwGc3yD2odBi+KSJf51m2DYrgeRgUelD/b6pJOrx856SyeXD
 ibAc1tSFUUgJKcjWuFpDkJ81Ip9iL1Ture8jMlGmHoSwsP68TenhUwGJpPP8XzJco8Q8
 P7399Dqrno1nmic7NNPnrqkTBahy33KKY7etOPpmg2b1g1sxbnH0noLHarbh9XrCl+Yr
 YYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=qF4QcpMuNcMy8kSMfRBvsCnPzYUywg9vOjmsFp6VR/g=;
 b=m7dxfdfNmmKeJbJZumCFQM3/FqJHGyJ4viyoV8PNM6rqQPl/L8NGIhKXCnSJzoa0Cy
 LnyIb9inYknJFItMOv6IDQf5qSFsINIOlV9qbS4ykslBWONo5eWMSfLnmqhAtLGcndrt
 VB7NvurxvKzb8A0X69RZghIRTrLD++2j+LGF0HpRiXuUDLK9SLdo/TQ5rWaQ9r1VWjps
 YkO5S3xxCG5XdKsvZv3NJ2QzLQkS/Iws0v0hB8YfbYg1MhmIRbMOZVWts6fYhoQBXlci
 j1luhLZBCYTrIkCmwzKZU/8NdwRHcJdTG6QpcnTHhIvRtpjlTar3TXyNEBuYMO1xshGW
 ZKVg==
X-Gm-Message-State: AOAM531MIZW9arP60CQO8xt3Fs6mc41LKulFvzgKlqYWtSo4sC4ZSVZh
 44KMuhw+bCik10GtYAZXYbBkXqwqjBFS/g==
X-Google-Smtp-Source: ABdhPJz0a4iNxXTawVST1r8kJdxi07AxAMr2WoJxYsgEi22L5cPr0kLr6LnlV/yTf+luiFdxfQCc2w==
X-Received: by 2002:a05:6402:1e92:: with SMTP id
 f18mr4094949edf.128.1643296836251; 
 Thu, 27 Jan 2022 07:20:36 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w18sm8810774edr.59.2022.01.27.07.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 07:20:35 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DA9921FFB7;
 Thu, 27 Jan 2022 15:20:34 +0000 (GMT)
References: <20211220145624.52801-1-victortoso@redhat.com>
 <87lez1bfhr.fsf@linaro.org> <87h79pp9va.fsf@dusky.pond.sub.org>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] schemas: add missing vim modeline
Date: Thu, 27 Jan 2022 14:36:21 +0000
In-reply-to: <87h79pp9va.fsf@dusky.pond.sub.org>
Message-ID: <87lez18at9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eric Blake <eblake@redhat.com>, Victor Toso <victortoso@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Markus Armbruster <armbru@redhat.com> writes:

> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>
>> Victor Toso <victortoso@redhat.com> writes:
>>
>>> Similar to f7160f3218 "schemas: Add vim modeline"
>>>
>>> Signed-off-by: Victor Toso <victortoso@redhat.com>
>>> ---
>>>  qapi/audio.json  | 1 +
>>>  qapi/compat.json | 1 +
>>>  qapi/replay.json | 1 +
>>>  qapi/trace.json  | 1 +
>>>  4 files changed, 4 insertions(+)
>>>
>>> diff --git a/qapi/audio.json b/qapi/audio.json
>>> index 9cba0df8a4..fe3b506ec3 100644
>>> --- a/qapi/audio.json
>>> +++ b/qapi/audio.json
>>> @@ -1,4 +1,5 @@
>>>  # -*- mode: python -*-
>>> +# vim: filetype=3Dpython
>>
>> I realise we have Emacs mode annotations here as well and I'm not going
>> to start a holy war but I thought we used .editorconfig to avoid messing
>> directly with the individual files. So something like:
>>
>>   [*.json]
>>   indent_style =3D space
>>   emacs_mode =3D python
>>   vim_filetype =3D python
>>
>> should also do the job.
>
> Most schema files have lines for both Emacs and vim.  Some have only the
> former, and this patch adds the latter to them.  Seems fair to me.

No argument from me there.

> Perhaps we could get rid of them all instead.  As far as I can tell,
> .editorconfig doesn't work for stock Emacs out of the box, though.

It does require a package-install although fortunately it's in non-gnu
elpa so should work out of the box with any reasonably recent Emacs. I
personally wrap this stuff up in use-package:

  ;; EditorConfig
  (use-package editorconfig
    :ensure t
    :diminish "EdCf"
    :config
    ;; See https://github.com/editorconfig/editorconfig-emacs/issues/246
    (add-to-list 'editorconfig-exclude-modes 'git-rebase-mode)
    (editorconfig-mode 1))

We also have have a rather embryonic .dir-locals in the root of the
source tree as well.

Our vim-brethren seem to have multiple ways of installing their plugin:

  https://github.com/editorconfig/editorconfig-vim#installation

--=20
Alex Benn=C3=A9e

