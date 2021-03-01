Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B77327D60
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 12:36:09 +0100 (CET)
Received: from localhost ([::1]:34572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGgqN-0004Aq-OL
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 06:36:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lGgp2-0003Hk-1w
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:34:45 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:39215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lGgow-0003jn-TG
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:34:41 -0500
Received: by mail-wm1-x330.google.com with SMTP id u125so14096749wmg.4
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 03:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=2DkY5FKQDLjz7HV/P2Zb0ewg0ObbzrHqwB7pqZsNJqA=;
 b=Sde+K6VkFL9M/pkeEm/8ZOWL5sid38/hgqO70sA7aTKTgSIF5+CUFhpiGufi6EGp9V
 I6Toc+q3mf1lffKEUYxjo2JStNVks82ShrWgAWNXDvKBkyI/OGACxnLd7zjAXIizLdir
 afl1GS6uWcvzUwVSoRFqyHTBzzDo+7VspJKEjIhL7mi71jdTdAKDSjZOWi1ZLjsac7qS
 ONdyTCQ9Gg/R0Sm69jZsGXJns0IN+6jqTpNFGubMYVxnMNikgHB5ZopBcYcsGLPHdd4p
 kKN8AF7RuYqGBb0qRRaFO/jHRENOLjhA2tE89Eqc1sKpE2JVPFkEKgNNrGGRW/dwsukn
 2SQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=2DkY5FKQDLjz7HV/P2Zb0ewg0ObbzrHqwB7pqZsNJqA=;
 b=i7OwUoVa/wR8FOBBq3EtbU0HXo4FmbooMifvZb4m+qVlzNsCw0HN+JHIjjLRAbyar+
 s0XlbY3myEAGlw7+H7bXXYtUEvzruFE4SVNanaH/LRBsH3GIlV4k4z+4+Dhg3VrZgyvZ
 IOJXzuc7SaPjMQv1pncK2GisoNdXZ9HnTcsYgNUf0DSwL5Gv0EWktewSw7hvtaytA04x
 FaIiIRJFUIj7y/qPaly7ZIoXoAi69yX2nTWlANHkjz0NJZMkUnHsLVXqgzPkpukAAml1
 ufYnWO6CwBkSl/fYqEyh/jPr/RAC9/vrKAsLyXiIGgm/wk3s0QXF0H1euqzjGUm8pqB8
 EWHg==
X-Gm-Message-State: AOAM5308Isvo0j940ISwxzmfh7gxXY/0eFrqthQzFb+oiooocGq6OpNv
 YEYf1kErbirDtSPlbse5zYynFUwgEbwqcg==
X-Google-Smtp-Source: ABdhPJyFeet19ascsfuTDgh4zPSeU+IZVGAYb/kZR5ELPgoUlsDDWW7Rt24at3l0jL0uJvNGgDZzEA==
X-Received: by 2002:a7b:c842:: with SMTP id c2mr15511878wml.100.1614598475842; 
 Mon, 01 Mar 2021 03:34:35 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 4sm23515020wma.0.2021.03.01.03.34.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 03:34:34 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 218EF1FF7E;
 Mon,  1 Mar 2021 11:34:34 +0000 (GMT)
References: <20210226143413.188046-1-pbonzini@redhat.com>
 <20210226143413.188046-2-pbonzini@redhat.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/3] docs: vhost-user: clean up request/reply description
Date: Mon, 01 Mar 2021 11:33:02 +0000
In-reply-to: <20210226143413.188046-2-pbonzini@redhat.com>
Message-ID: <87ft1fjeet.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: sgarzare@redhat.com, jag.raman@oracle.com, qemu-devel@nongnu.org,
 stefanha@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> It is not necessary to mention which side is sending/receiving
> each payload; it is more interesting to say which is the request
> and which is the reply.  This also matches what vhost-user-gpu.rst
> already does.
>
> While at it, ensure that all messages list both the request and
> the reply payload.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
<snip>
>=20=20
>    When the ``VHOST_USER_PROTOCOL_F_STATUS`` protocol feature has been
>    successfully negotiated, this message is submitted by the master to
> @@ -1351,11 +1375,14 @@ Master message types
>  Slave message types
>  -------------------
>=20=20
> +For this type of message, the request is sent by the slave and the reply
> +is sent by the master.
> +

It may be worth pointing out this language will be changed in a follow
up patch in the commit.

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

