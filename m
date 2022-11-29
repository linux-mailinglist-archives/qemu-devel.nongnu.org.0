Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F8F63CB3F
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 23:55:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p09UC-0004dO-1E; Tue, 29 Nov 2022 17:53:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p09UA-0004dE-Ce
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 17:53:54 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p09U8-0001Zq-Nu
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 17:53:54 -0500
Received: by mail-wr1-x434.google.com with SMTP id bs21so24433868wrb.4
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 14:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n3yiX+2jmeld4TSwNBgmCzx931jY9pizUJjV30oUC00=;
 b=I8WXyQBHtpEs9d76uoPTOWBPaOqisAt6NK8JvxK99+BfJpIK5uxNY4D8H9S2T+7FjR
 pceiosm1sRrTkqW80snlpiAkFCGIh/vwgpSPF2CNWMYtUiuKvYwon2mD1gKK43CUkptz
 volLbV/22sf17prymxGFNxzpvmX/81wAQSyLpqj960tvUDul026beggrtw3PHTxfA1MY
 NjF4WLUu2Unrd2MjFfKRrw/5CRB3j2/GTaSNjucntLtht6lzNok32NSzGkV4+6WXrvuj
 t0Fr10y3pSn9ehxuqxOIAPr0WTgoD9sv8VcCElGIC9kch5DIVV4BcWd6dKNedyxaAZtT
 hh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=n3yiX+2jmeld4TSwNBgmCzx931jY9pizUJjV30oUC00=;
 b=6sAJtgj4HoOa34+3/8dbUDBpq9TrQ4rRO5HB58sPECNwQ4qAGOpoSK6jwyRyiAePU0
 RyKk8KJ5QlRlZZ+UIqRZlD31roU+dw+Ur6ILgK4N7K7Pitqh3XnPYgsrX9LvxAptpa2R
 7e9ykiunZrjT9bd9d+rwvF9LmRfy7/Xb/Bu+CdkyWMNxGdm6PvG2C3ExQOtKoqWpZf6Z
 cfKl+TRqARZhECz7ODI18cOdkFiqWJGyrixPP5CuHgiH6ucBPc7mufC1SfzoxcvMeO/b
 jD9VUcZwiPE4OoheLNrHeWz/pw1lrM+4Vz+ijDdmTc57VhYJqAL9V8M8DnhDFrF5xzbg
 vzyg==
X-Gm-Message-State: ANoB5pmzP+fG6ELpeUmDkE/an1fEe6O+SerpD78ixVu7C29MiL6LkdgZ
 +yZa1EQIh0TEyWoInL0mf9rg1A==
X-Google-Smtp-Source: AA0mqf7MKM1WKDuVHm3jQDGHSFJGgwO1oK0gpD3nYl1MbxD0KtmPMH0u+832gX1Ksrw9YVcadTtbcQ==
X-Received: by 2002:adf:f8cf:0:b0:241:c99f:8564 with SMTP id
 f15-20020adff8cf000000b00241c99f8564mr30897552wrq.277.1669762429853; 
 Tue, 29 Nov 2022 14:53:49 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t17-20020a05600c199100b003c7087f6c9asm3655624wmq.32.2022.11.29.14.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 14:53:49 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CD7891FFB7;
 Tue, 29 Nov 2022 22:53:48 +0000 (GMT)
References: <20221128164105.1191058-1-alex.bennee@linaro.org>
 <20221128164105.1191058-5-alex.bennee@linaro.org>
 <CAJSP0QX1R4Z+AC3591MpwzBAG1Tz3rDTe4+o2rbe0v-q6sSKMw@mail.gmail.com>
 <8735a2yigb.fsf@linaro.org>
 <CAJSP0QWxN2UxaNqST64G=tyUVLn8zbwzotLxHNQ6d6xPTeocgg@mail.gmail.com>
User-agent: mu4e 1.9.3; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, slp@redhat.com, mst@redhat.com,
 marcandre.lureau@redhat.com, stefanha@redhat.com,
 mathieu.poirier@linaro.org, viresh.kumar@linaro.org, sgarzare@redhat.com
Subject: Re: [PATCH v3 4/7] hw/virtio: ensure a valid host_feature set for
 virtio-user-gpio
Date: Tue, 29 Nov 2022 22:53:17 +0000
In-reply-to: <CAJSP0QWxN2UxaNqST64G=tyUVLn8zbwzotLxHNQ6d6xPTeocgg@mail.gmail.com>
Message-ID: <871qple5j7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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

> Hi Alex,
> I'm waiting for a v4 or a confirmation that you've retested and I can
> just drop this patch.

I've re-ordered and I'll post the up to date series with the dropped
patch tomorrow. I was hoping for r-b's for the other patches.

>
> Thanks!
>
> Stefan


--=20
Alex Benn=C3=A9e

