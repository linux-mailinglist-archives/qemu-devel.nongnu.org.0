Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 100B46C14D6
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 15:36:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peGav-0000um-1k; Mon, 20 Mar 2023 10:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1peGat-0000qR-L0
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 10:34:39 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1peGas-0004rT-13
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 10:34:39 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 p13-20020a05600c358d00b003ed346d4522so7667486wmq.2
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 07:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679322876;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nzy7gtN9RUqnwNU6WqaIhR4OIdHsA9NU8aHvQIvK4z4=;
 b=Tq6QulfBpwOqMq5HgvBmYja7/PZr1LfWXFNcRTkWGTpKqft4b8yIlr+K23xRj8u9iW
 hoprzG4QUMj//PcD8db18xXxIxBLy+wxS82KFeW93RpUDhuYnf5GRjt5YO1oU73F7S0j
 EM+byo7LVSL8JCXOI5zj3o9dAXF5vP1lrrJs3SFHyG+u9n4Hm2yuZq+Pvk4cAOiSr6x/
 YKmReqkw7VWLpxYXPTyfKMuvwlZx0J/5xN8jEKYuKbH6cAhlLUeLCd/0fYDgSWr46KL4
 C9wx9E52xlu3DNBvMAwJSvoWM/VK8wkkOIk1EOX81+XFB78xSrZ79jN+Ctc52TGltmUP
 Lf9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679322876;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=nzy7gtN9RUqnwNU6WqaIhR4OIdHsA9NU8aHvQIvK4z4=;
 b=ek6haVEicQCm34JvuhvYSM7mPzvpLAPCYZ7XgWiNFm2m4zyeg4DBXXdl5Wh6WF7Kef
 eHWxP4ZMjHJ10oLbs+MuhK2U5qchlBa9ikwBkDSmjkJ/rlHKGK0iqGxam2F0HzGpsqbR
 vkuSeE5Ml5PkkEKfHHWnYPv9a1vkNmvPA10+7S2WGRINfOqQ2ZpyQy176QdBzzc7z1La
 BEf34wQ2Y5WOFtMaPj0Qu9CxfeEZzg7Yxo2KtSw0JJsfnNrkHYPJuZdAU4Dnh+iBhBUa
 beWKJRTwRzt6aNO0ujaFXG8gPvHhr2Ly/I+8JOrnsAJ+wEu2sgh1/BmXkumpntxa5a9B
 0z0w==
X-Gm-Message-State: AO0yUKVuFR7+FS7//lnNFcPHB5lOxCBf6H1YIm16O2s++BWks2rCeQ9j
 N7KMa9tR3tDX1jSJAWyZBcPShw==
X-Google-Smtp-Source: AK7set8BiLUJHdAYvQxcpol4x5Z5XTDM5JQBHtniz27Bnbu3MOspABt/woz5+X+URG5kG5xOYQviWg==
X-Received: by 2002:a05:600c:548d:b0:3eb:2da5:e19 with SMTP id
 iv13-20020a05600c548d00b003eb2da50e19mr33219180wmb.27.1679322876111; 
 Mon, 20 Mar 2023 07:34:36 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 v26-20020a05600c215a00b003eafc47eb09sm10582293wml.43.2023.03.20.07.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 07:34:35 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 705F61FFB7;
 Mon, 20 Mar 2023 14:34:35 +0000 (GMT)
References: <20230320101035.2214196-1-alex.bennee@linaro.org>
 <20230320101035.2214196-3-alex.bennee@linaro.org>
 <c6e1bf23-618f-410d-a53b-6f4cbd007e7b@suse.de> <87355z8ry2.fsf@linaro.org>
 <34fc1e42-a0f7-c0fe-300f-3ad78deb8e6c@suse.de>
User-agent: mu4e 1.9.22; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Cc: Alessandro Di Federico <ale@rev.ng>, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>, qemu-devel@nongnu.org, Richard Henderson
 <richard.henderson@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Fabiano Rosas
 <fabiano.rosas@suse.com>
Subject: Re: [PATCH 02/10] accel/tcg: move cpu_reloading_memory_map into
 cpu-exec-softmmu
Date: Mon, 20 Mar 2023 14:33:52 +0000
In-reply-to: <34fc1e42-a0f7-c0fe-300f-3ad78deb8e6c@suse.de>
Message-ID: <87y1nr7apw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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


Claudio Fontana <cfontana@suse.de> writes:

> On 3/20/23 14:32, Alex Benn=C3=A9e wrote:
>>=20
>> Claudio Fontana <cfontana@suse.de> writes:
>>=20
>>> How is this conditional on CONFIG_TCG? To me it looks like this breaks =
!CONFIG_TCG.
>>> Careful, the meson.build in accel/tcg/meson.build is always recursed.
>>=20
>> Surely it shouldn't be in accel/tcg then?
>
>
> Hi Alex,
>
> maybe we did not understand each other.
>
> What I mean is that accel/tcg/meson.build is not conditionally read, it i=
s _always_ read.
>
> Therefore TCG-specific code needs to be conditionally included using
> the CONFIG_TCG.

Ahh I see now, right I can fix that up next revision if there is
interest in this approach.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

