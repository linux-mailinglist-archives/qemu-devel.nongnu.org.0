Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3725868342B
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 18:44:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMufr-0002Qt-Uq; Tue, 31 Jan 2023 12:44:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pMufq-0002Qf-3V
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 12:44:02 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pMufo-0005ar-E0
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 12:44:01 -0500
Received: by mail-wr1-x42a.google.com with SMTP id q10so14976001wrm.4
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 09:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qqdMhetV+R1kIgfEF81sGBG6V+4DncKQ84RM18je6vs=;
 b=E4UIxNN9yzTACgTA0Y9c0ZMBZj03zDefeegjn5iNHzjgmoeVijSB0gU27nIZlCW/52
 B9TJftmPQGcvLbC8a6Pvb6A1EZKh0VtTRq9KpQWy/8KN1UjbBRiJBMl6bTwJNJj5edS/
 UKACXfHjfKG1OFRf0TJ8lFP9DB9oxh1FsVAmRqPr82liwfBbpUSEAaRiQ9Xv/a18117+
 wxrZosRaKhpW6Vi4rUWQPqDnZG9gdQxkcdKSzXWQOc7wi4IDO1B/ixZld2MB3bNoMjmk
 EJUfjyHr3UFaTlYibzcqMMnOfQwid7yizeyukQZqRK+SJk3bZZ64HiqWskxGcZ/wmjYG
 k+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qqdMhetV+R1kIgfEF81sGBG6V+4DncKQ84RM18je6vs=;
 b=rGPmS/eQkBllRLyhgqhehaCAmeVryak9INbgD30Ql/Oclno/CyaGpHMfqvcT+xfZE6
 F+5Mi+VpsqCN51fNOcRvNCfbQJYQmenAaJu+NOBrdEyAvDU1vaAfquuZF4d9E2JbtpqQ
 80B24MwemVN5XS7dsL/zWL0oxXKa6lZUOIPvoFj/spVZJNNCQERSgTNRGFPkP0SSj/7D
 OJAhRcu2wpyzIoZvW5EXnc8Do7aynKZvSy+eY+dhgs/YMYjcGxP4chDyd0JUz77QmAh0
 ioDE+69qfNvXQGWOPzgHw/huTVQM1XHPEvXB21rYtAj+URJjbJ42Ek5cFuELUcdWNbG5
 Kfrg==
X-Gm-Message-State: AO0yUKWA+kys0vVJrgH1czZKGSommOuG/U7b9c9lErIWv3TLXnaTF/4+
 whZ5B4FLJZp59JDA4wUe/8UXmw==
X-Google-Smtp-Source: AK7set/AcokXNVWea8FCXQ4EmnAQcjxaQ+0fI419QmO/Dbg1ocSYvM5s3z3XZ0LnP13aV0HvQEMJkQ==
X-Received: by 2002:adf:ef8c:0:b0:2bf:c065:fb80 with SMTP id
 d12-20020adfef8c000000b002bfc065fb80mr19851365wro.2.1675187038474; 
 Tue, 31 Jan 2023 09:43:58 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n6-20020adff086000000b002bdbead763csm15764645wro.95.2023.01.31.09.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 09:43:58 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A359D1FFB7;
 Tue, 31 Jan 2023 17:43:57 +0000 (GMT)
References: <CAJSP0QXBKPXj2vf3wuK2QGdX+HZa_Nu3A+RT6hYnXJrUKTY4Fg@mail.gmail.com>
 <CAJSP0QWDMv2yFkORzKt+p45ykiY=AmZCbrS464nZOqEtOz-NqA@mail.gmail.com>
User-agent: mu4e 1.9.18; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: chouhan.shreyansh2702@gmail.com, Gerd Hoffmann <kraxel@redhat.com>,
 Laurent Vivier <Laurent@vivier.eu>, Anton Yakovlev
 <anton.yakovlev@opensynergy.com>, qemu-devel@nongnu.org
Subject: Re: virtio-sound Google Summer of Code project?
Date: Tue, 31 Jan 2023 17:43:16 +0000
In-reply-to: <CAJSP0QWDMv2yFkORzKt+p45ykiY=AmZCbrS464nZOqEtOz-NqA@mail.gmail.com>
Message-ID: <874js661lu.fsf@linaro.org>
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


Stefan Hajnoczi <stefanha@gmail.com> writes:

> On Sun, 29 Jan 2023 at 17:10, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>>
>> Hi Shreyansh, Gerd, and Laurent,
>> The last virtio-sound RFC was sent in February last year. It was a
>> spare time project. Understandably it's hard to complete the whole
>> thing on weekends, evenings, etc. So I wanted to suggest relaunching
>> the virtio-sound effort as a Google Summer of Code project.
>>
>> Google Summer of Code is a 12-week full-time remote work internship.
>> The intern would be co-mentored by some (or all) of us. The project
>> goal would be to merge virtio-sound with support for both playback and
>> capture. Advanced features for multi-channel audio, etc can be stretch
>> goals.
>>
>> I haven't looked in detail at the patches from February 2022, so I
>> don't know the exact state and whether there is enough work remaining
>> for a 12-week internship. What do you think?
>
> Adding Anton.
>
> I have updated the old wiki page for this project idea and added it to
> the 2023 ideas list:
> https://wiki.qemu.org/Internships/ProjectIdeas/VirtioSound
>
> Please let me know if you wish to co-mentor this project!

I'd be happy to help - although if someone was rust inclined I'd also be
happy to mentor a rust-vmm vhost-user implementation of VirtIO sound.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

