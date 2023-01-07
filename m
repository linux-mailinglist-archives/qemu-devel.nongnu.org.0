Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98368660DD3
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 11:24:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pE6LO-0006vU-OH; Sat, 07 Jan 2023 05:22:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pE6LN-0006vF-0U
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 05:22:29 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pE6LL-0005G9-5T
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 05:22:28 -0500
Received: by mail-wr1-x436.google.com with SMTP id az7so3385521wrb.5
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 02:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/mIhA5k/+SMNLL58qk2mlI7NImUVDDGBmFM3yPXualk=;
 b=IAAWdmz4mQgHfYDoiUe2CwjWsnM7KxRGuRBKnKd/CnZvcgabnB+EL7DNIsDjs1I+e2
 yYUfbOVMBFpCR3eKZtEkuHD+ycr3jVuensbicWOxEE6cy1w25nfSQKfZoCd4S8XcpysM
 OTcER6qtVZdgG54avD0RdNM3MIVi2Ei3pA8r/ZfiNvfOEHHyZLJHH6WDDFgKTNPI1XNQ
 ZugmSvRUD0jzadqqqYtCf2OEXMzfFLJzhqWXF83u2g9TrGhIGrbOsnjTkJ4RI89Zjbs1
 KEDwrdZupIo8WB26FcYZPoj2jHk3MQyKMLuozGDAVHVFRj+oizbDUVwbe0d0dajLcqpr
 Y2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/mIhA5k/+SMNLL58qk2mlI7NImUVDDGBmFM3yPXualk=;
 b=tDk7/L08ADlz5AQqEQsQpNw16MlXAAbpFsFGguVIu41ZbrlGruH1BCSetC19S9a6pp
 fVAIjz/b/uHFe0zZhF02xxU2TdiQIi6cYTvO6ouSF8maq7EGlwgio5sQfXzbTYqSfqAz
 4I9WPzRw3ZSrMpUxmO7rtU0198IiyDOWKrQPFdRvtIMT17L7yQg5AAFXxVtEOmjorTUF
 g2aysxh/DN8hKkp8WGT+M2U4z6LIf7irwiSLQ+Lxy2kHvcM7OCNdn8b5yyv3qJRcpSTX
 iU67C0+bNVTW4b3DW+vHyfCcAWg1jLR0Kay78xnCkKDs/oJ0FG8J+lMJST0tKmLAP3XM
 O4dg==
X-Gm-Message-State: AFqh2krA3uwuQqvxvQFd2+HPPOC5IuU0ECN2FJwiYt/sRgsPWv7/XDRC
 lKkQ7o8BWNyEDa6l2JXjiGx07Q==
X-Google-Smtp-Source: AMrXdXtHn6Wt7AjiVXzAdNMASaZjPcw6btgnaYNbn54QQh15x6hKo2qKmneHLPH3CwGs3OW/iMdHaA==
X-Received: by 2002:adf:f14c:0:b0:26f:63ec:eb79 with SMTP id
 y12-20020adff14c000000b0026f63eceb79mr47132656wro.50.1673086945566; 
 Sat, 07 Jan 2023 02:22:25 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d18-20020adfe852000000b002426d0a4048sm3641511wrn.49.2023.01.07.02.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 02:22:25 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BEFF91FFB7;
 Sat,  7 Jan 2023 10:22:24 +0000 (GMT)
References: <20230103181646.55711-1-richard.henderson@linaro.org>
 <CAFEAcA8K=1CNZfDG8i3bSXXSWT7D2oWg4jyupwYmw8oR7MJVsQ@mail.gmail.com>
 <9f9a6c22-315b-de1e-958e-89963c5e7e90@linaro.org>
 <CAFEAcA8cxJFpB9V826DjSsFOy7VYh5TWXb4vRYDUeOMjQgk-eQ@mail.gmail.com>
 <874jt32ppl.fsf@linaro.org>
 <7e695013-7261-50b5-a779-34640701eb6c@linaro.org>
User-agent: mu4e 1.9.11; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com
Subject: Re: [RFC PATCH 00/40] Toward class init of cpu features
Date: Sat, 07 Jan 2023 10:19:12 +0000
In-reply-to: <7e695013-7261-50b5-a779-34640701eb6c@linaro.org>
Message-ID: <87v8li1w67.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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


Richard Henderson <richard.henderson@linaro.org> writes:

> On 1/6/23 15:43, Alex Benn=C3=A9e wrote:
>> What about cloning objects after they are realised? After all that is
>> what we do for the core CPUClass in user-mode.
>
> No we don't.  Where do you get that idea?

Well linux-user does cpu_copy which involves a create step followed by a
reset and then a bunch of copying state across. Can we assume all CPUs
get reset before they are actively used?

Would it be too hacky to defer the creation of those hash tables to the
reset phase and skip it if already defined?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

