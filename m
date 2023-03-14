Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D856B9743
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 15:08:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc56z-000333-2d; Tue, 14 Mar 2023 09:54:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pc56x-00032l-72
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 09:54:43 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pc56u-0003yv-QU
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 09:54:42 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 k25-20020a7bc419000000b003ed23114fa7so4515620wmi.4
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 06:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678802079;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qiIMwJyID1dlHhh3qhyK4ssuGMiZaazm4Fav5QPdHfw=;
 b=zRaCDpfCPnoNZnH0auxywF7nS7Gfla2hqHjdXzTMzvR6yIfWNmp6bwpnAfFcv34xkJ
 3IscoAMS95UF6+BnTpHurwUcltitgWh1K4e8v1nH6ok7qxer9OzGGJl57x6NcmWc5YKS
 7M7C7EvWQ4sCfkPNjvEKxbiaUeTdxV3II2YJJVuaXVuX0/RWaGxrk3yiEhZ49QJ+/KpL
 veOvWgdgeECEof6DfZnYPOnEgDS1qovHQD3LpOHASUd/2X3ECU0D4CWSIYuYfwrfxN3z
 LbarOdBFD37PHCceIlDdzgpDGC2h0rsxg7s2A/BYUWOaaPCrvAS/f5d8ttMSegIc0A5w
 /SGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678802079;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qiIMwJyID1dlHhh3qhyK4ssuGMiZaazm4Fav5QPdHfw=;
 b=P5Gg+RhkDf+gRFC/RMsF3IsZhpWvF9WJwqDCZW0xX0C+V2Ac/PBPiXZ9P2hhWKfWGT
 B6AfDXHEtrxw1kEs1l88kBpM88WyrkcVINQZkTEzXvVp7VklKJgpPSI4JC1pYZI8fEB9
 rdxOgQth9Vkvas37HVm2m9k9p6NxT7OI4c6qh1xlTEzIYnf7QQ7oXjhjIEZGDIedIBnw
 5PmtYu1Ewzx8h+K/WcCaHFTLdPZnXhTYHbCr+TWtEOy0UNHF8FjlKu6LhPszCcVxf0K6
 nm+yXLiiJ2EI7EVsv0jLBFDmKtsHFvZVejTlMfa4vcShRlFxCB0MlILNZzkIc3RfHlk8
 j/LQ==
X-Gm-Message-State: AO0yUKXVSIxyTw4OdrHBeXFTkUXHk9UsK/5IABCKaU/AVzzXgOF36tIY
 uPqgvCfnQUI/+dO70zu/9XQiOA==
X-Google-Smtp-Source: AK7set95BPWNHzAo6Mk6R5zkXoO3KwEWBrn4qtcUTTVgfbaCuQaB0toHHaw1FVY2gTWqAW6ZYB5KBQ==
X-Received: by 2002:a05:600c:4f91:b0:3eb:3908:8541 with SMTP id
 n17-20020a05600c4f9100b003eb39088541mr14805841wmq.2.1678802078929; 
 Tue, 14 Mar 2023 06:54:38 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 i10-20020a05600c290a00b003e8dc7a03basm2898254wmd.41.2023.03.14.06.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 06:54:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4776B1FFB7;
 Tue, 14 Mar 2023 13:54:38 +0000 (GMT)
References: <20230303160727.3977246-1-berrange@redhat.com>
User-agent: mu4e 1.9.22; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf
 <kwolf@redhat.com>, qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v2 0/8] iotests: make meson aware of individual I/O tests
Date: Tue, 14 Mar 2023 13:54:17 +0000
In-reply-to: <20230303160727.3977246-1-berrange@redhat.com>
Message-ID: <87jzzj8mld.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> To just repeat the patch 5 description...
>
<snip>

Queued to for-8.0/tweaks-and-fixes, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

