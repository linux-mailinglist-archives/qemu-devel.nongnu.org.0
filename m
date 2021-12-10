Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E990747004E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 12:46:31 +0100 (CET)
Received: from localhost ([::1]:40330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mveMA-0005j4-Bg
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 06:46:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mveKj-0004wo-8N
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 06:45:01 -0500
Received: from [2a00:1450:4864:20::330] (port=36749
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mveKd-0001gs-PI
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 06:45:00 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso8814434wml.1
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 03:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=AXbyYdXP9bE13GOya0q/0LeFMAZ4w4jljUkUSf4KYts=;
 b=nxiAbfZd+somEP9ZhakRnTeDSXPHbEL952pq6yx1a6htUeM9mLVKrqvs3dZLOevhr/
 ogERz5ABiCM8uFUL2lxltG6jRZIQ+ZqrhRczf/eriJ61YgE+w5TxSvXmpuWVWtEGkAZX
 vFLHjScqgyTUahBSwqkMakxIr1jyjAQmkULb0S/8+wbFrKl8bldH2oVCWeUnNQT6ohhO
 tb0ZfJ8yFDweJkOw7LtgA18c/J6SAzkQvetnurBqno4iv+tsXcRBi2M78EVyxg7xgNso
 r39kR7BIblw9GvcAWAh1nc7s8t5JVpHGENGb0rA4vDmKqKo/9Rm7yf4BGHmPYYwqhuDb
 wFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=AXbyYdXP9bE13GOya0q/0LeFMAZ4w4jljUkUSf4KYts=;
 b=JtAJF4eP2AF76nspMZqqukaZhQmLOILRQ5t4U8opBo6Xxp7pW837D3Rh4yB2lc0BUj
 kZZsdEWB5vKBHXC3jh4qcUd+zPCp2cJMwlxlLkCqrtGwYLu4/7mTU4kVKQX7oHYhghgL
 cI3Ul5tGr8oXofF0l+8IMvJ9ylF4RDSNwCxYfkChmrhPVYv8f3zgt6uUSwzzE+e864kN
 qYGSlJQPHrW3F7pqjq+ct0qfO4lG+FVLGY/sckH1IZCmPPdIuyz4t8AyJPwIZTJHwL4S
 GvVArPSVv/7T4QvFiz9Iy8BLoib3UX5EKzbocwvDSmmeDhe9LBTSVh9GXqGQrFke/GLh
 fD4g==
X-Gm-Message-State: AOAM531qqF5IK7VprCN9LPvCm9VjNLLwJwhJS7hf+lz556YtfsQQpbxK
 xcuLZAUH8IC7d0otRHjRdBdKnBWndeE/xw==
X-Google-Smtp-Source: ABdhPJwncjW9mpTQGPZ0e+EZXrkUxJm3D+Cm9JJkCkks5Vi04pOx95cGPeVAJRYhkYmnforYhyX+HA==
X-Received: by 2002:a05:600c:4f0f:: with SMTP id
 l15mr15670273wmq.25.1639136692995; 
 Fri, 10 Dec 2021 03:44:52 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 4sm3457816wrz.90.2021.12.10.03.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 03:44:52 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A5D8A1FF96;
 Fri, 10 Dec 2021 11:44:51 +0000 (GMT)
References: <20211210084718.24758-1-pbonzini@redhat.com>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] configure: remove dead variables
Date: Fri, 10 Dec 2021 11:44:47 +0000
In-reply-to: <20211210084718.24758-1-pbonzini@redhat.com>
Message-ID: <87tufgk7kc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

