Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D0A683588
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 19:44:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMvbR-0006Hf-Lz; Tue, 31 Jan 2023 13:43:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pMvbO-0006E7-EY
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 13:43:30 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pMvbM-00087V-Ld
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 13:43:30 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso8544630wms.4
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 10:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ALN+kcbJfrEO0WEdICpZPBIIa0subLrA4EDlbByihrc=;
 b=KuSc32Ypviy9I8C097yRKeYxbKLu/E81Yya7MXWi8Al6RAPG89IwPG+jSkpbJWeHFg
 troyhlkPH77cdMCWS3zU/UZWYvf6wxqzf1x4Alcmtz/T3jjBl/gDvgw6XejXuOnkPWyo
 AwnuISlToXdE7wHx4q8RUG/5clV2a7vusHlPro9oRm6w36rAuqfV/eZTrKI1ieFJuV38
 GYST4pgZZg55mAQ5V9sNMCGiUQSEUteDYmrDM2qpUmQ6oU/A8oEKByA86RCEhX4hIrlU
 pqo+iYxgzbxHax3odbBqpLbxjCHqell+XZgFhV/WIlS+hmbuDc8hCh8431+J0Bjx3QvE
 EOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ALN+kcbJfrEO0WEdICpZPBIIa0subLrA4EDlbByihrc=;
 b=X0oU9txvxtTOuGTWrnfq/ERpWTz2peWSYZJv+heV2y2g0WDOexiQZJMSXFzxusI6c6
 zEGIS7zGss7VYUMRIR83+Sf8BFUlygY9anmcmrwCml0kefhcOvrmhsFxcD4OcnTA8Weo
 W+DQ8OVbt+sVjtKSWKBy7LiFLtIfaVlk+qoIbJYJE9Y+qP6kP9ChKEuhFpi7Z7SbIDq2
 CT7fddba1fT/QJ7bk75UfcFTIBPfYRm+9Pf3ID/BtqwUILV79J6/XH5mnBSZ0Fzp3plS
 nOYKupWWz+NMlUfpNbcOX+G2FoPVcIpDT8SFIpaadiS3g2wcUTC3sokm1+ZlGS6UC6wf
 AutQ==
X-Gm-Message-State: AO0yUKVdzq0GRcsi7vlW5gC3avo0rBaL0jFFmvsM3LgX6hWxiaYTO9vB
 wMQ2Dx2NlqfQcTg5rKeIIZlP8g==
X-Google-Smtp-Source: AK7set+cHkUhxqdesbEse+CHfKUQBdkSW2BTcLs3pd/5hVFgUjXPuq9wtFd9zmAZJsKgHvlyAFadig==
X-Received: by 2002:a05:600c:3541:b0:3d3:43ae:4d10 with SMTP id
 i1-20020a05600c354100b003d343ae4d10mr425770wmq.11.1675190607079; 
 Tue, 31 Jan 2023 10:43:27 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 x9-20020a05600c21c900b003dc434b39c7sm3440285wmj.0.2023.01.31.10.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 10:43:26 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1FA0B1FFB7;
 Tue, 31 Jan 2023 18:43:26 +0000 (GMT)
References: <CAJSP0QXBKPXj2vf3wuK2QGdX+HZa_Nu3A+RT6hYnXJrUKTY4Fg@mail.gmail.com>
 <CAJSP0QWDMv2yFkORzKt+p45ykiY=AmZCbrS464nZOqEtOz-NqA@mail.gmail.com>
 <874js661lu.fsf@linaro.org>
 <CAJSP0QVN1VVHEms=7p9pwJRDDk6vM+Xvk3Wzi04w7e=+0G+F2g@mail.gmail.com>
User-agent: mu4e 1.9.18; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: chouhan.shreyansh2702@gmail.com, Gerd Hoffmann <kraxel@redhat.com>,
 Laurent Vivier <Laurent@vivier.eu>, Anton Yakovlev
 <anton.yakovlev@opensynergy.com>, qemu-devel@nongnu.org, =?utf-8?Q?Marc-A?=
 =?utf-8?Q?ndr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: virtio-sound Google Summer of Code project?
Date: Tue, 31 Jan 2023 18:42:50 +0000
In-reply-to: <CAJSP0QVN1VVHEms=7p9pwJRDDk6vM+Xvk3Wzi04w7e=+0G+F2g@mail.gmail.com>
Message-ID: <87h6w6tui9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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

> On Tue, 31 Jan 2023 at 12:43, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>>
>> Stefan Hajnoczi <stefanha@gmail.com> writes:
>>
>> > On Sun, 29 Jan 2023 at 17:10, Stefan Hajnoczi <stefanha@gmail.com> wro=
te:
>> >>
>> >> Hi Shreyansh, Gerd, and Laurent,
>> >> The last virtio-sound RFC was sent in February last year. It was a
>> >> spare time project. Understandably it's hard to complete the whole
>> >> thing on weekends, evenings, etc. So I wanted to suggest relaunching
>> >> the virtio-sound effort as a Google Summer of Code project.
>> >>
>> >> Google Summer of Code is a 12-week full-time remote work internship.
>> >> The intern would be co-mentored by some (or all) of us. The project
>> >> goal would be to merge virtio-sound with support for both playback and
>> >> capture. Advanced features for multi-channel audio, etc can be stretch
>> >> goals.
>> >>
>> >> I haven't looked in detail at the patches from February 2022, so I
>> >> don't know the exact state and whether there is enough work remaining
>> >> for a 12-week internship. What do you think?
>> >
>> > Adding Anton.
>> >
>> > I have updated the old wiki page for this project idea and added it to
>> > the 2023 ideas list:
>> > https://wiki.qemu.org/Internships/ProjectIdeas/VirtioSound
>> >
>> > Please let me know if you wish to co-mentor this project!
>>
>> I'd be happy to help - although if someone was rust inclined I'd also be
>> happy to mentor a rust-vmm vhost-user implementation of VirtIO sound.
>
> Maybe Gerd can tell us about the QEMU audio subsystem features that
> may be lost if developing a standalone vhost-user device.
>
> Two things come to mind:
> 1. May not run on all host OSes that QEMU supports if it supports
> fewer native audio APIs than QEMU.
> 2. May not support forwarding audio to remote desktop solutions that
> stream audio over the network. I don't know if/how this works with
> VNC/RDP/Spice, but a separate vhost-user process will need to do extra
> work to send the audio over the remote desktop connection.

Hmm good point. Maybe a stretch goal?

>
> I have CCed Marc-Andr=C3=A9 for information on streaming audio over remot=
e desktop.
>
> Stefan


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

