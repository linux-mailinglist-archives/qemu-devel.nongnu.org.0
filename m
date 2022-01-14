Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FB748EBAB
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 15:28:17 +0100 (CET)
Received: from localhost ([::1]:56336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8NYu-0000ce-PA
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 09:28:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n8NDb-0002fT-Cf
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 09:06:19 -0500
Received: from [2a00:1450:4864:20::436] (port=41804
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n8NDA-0002G9-An
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 09:05:49 -0500
Received: by mail-wr1-x436.google.com with SMTP id v6so15775755wra.8
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 06:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=uWPbVkkm7Demt4k3UjuHXCc+keffVtBLyiXBg8HFNjM=;
 b=qzIRvLtRfJHP9c/CeZF9Z9DkpZ4lFSdghtrcXUFKmGqsX0amEPErfwR1qp3OjYiAcw
 0sj8peZd4tKe9HcVnj8OzJJYn3xl1BC1UIGaa/PI9bYO1WRaI1KoAqOoKjiv5eMixz8O
 F+IErejUMvQOpMWrPNFq0iYVoAwxXsTty/MJOeaOqcBNb96oj0GhbVyfJDOTH9inUe8L
 IczscwpUJKKvHH7eo2rnYhrWm5oMNz7+wpUouSOgCBbv38dYI9XUyJksHUGZx6DnxRF0
 WI39F+n9qHUCqd+YrVgogjwyZFm4XZL/0BuA7vTgyr4DpokFeKPCDs/1NUq5isEnnloo
 AXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=uWPbVkkm7Demt4k3UjuHXCc+keffVtBLyiXBg8HFNjM=;
 b=xQJ3I2RjJQlBhcL3JiDzD9BBQZYNt/6vRPoa6OGPeaHKivH35fClXiVIuGpvqE9om+
 2epxONJUsj73RK52HhZbA8sBV6UkxYISvfsSCpPVf09VyXt3jugSp842BHWka2Tig1oU
 dVT4KTHgoV0++GjOn1Sxy3Ox7Aki7XvyC9YTm/K9UYtPegrPAcdHqYvyHPi2sRCKg95z
 J9ZZtejZvfm/2Jb2H0jIUsaOXcaKbi/IlVAqt3SVcKaBVXsUjb7zs4X0SRObx8HT2YXt
 yvv0ooJcX7FPoJwANSOK+mv7uQg47py9i3OiMzvMscKjQsPxr0SIn8Ejck1WtJ5C4hqR
 SjDg==
X-Gm-Message-State: AOAM530LLAWMPoyIWk0HFFnXDGmy1EgKmGPV5MGzqS4zsUQap+Fiqj6Y
 GgpL4FW0r74e0J0H4AF5n5poFuYhkrDJ5g==
X-Google-Smtp-Source: ABdhPJw+4XdyMap6QsYWPWMAcj9EVoAkJzM9LGfALzgoG7kFaIlsYD4JstxP/OaGN8JT25SN/HhLLw==
X-Received: by 2002:a5d:598a:: with SMTP id n10mr2629194wri.604.1642169144670; 
 Fri, 14 Jan 2022 06:05:44 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 83sm5782174wmc.41.2022.01.14.06.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 06:05:43 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 63DD81FFB7;
 Fri, 14 Jan 2022 14:05:42 +0000 (GMT)
References: <cover.1641987128.git.viresh.kumar@linaro.org>
 <5390324a748194a21bc99b1538e19761a8c64092.1641987128.git.viresh.kumar@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 1/2] hw/virtio: add boilerplate for vhost-user-gpio device
Date: Fri, 14 Jan 2022 14:05:36 +0000
In-reply-to: <5390324a748194a21bc99b1538e19761a8c64092.1641987128.git.viresh.kumar@linaro.org>
Message-ID: <874k669zux.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: stratos-dev@op-lists.linaro.org,
 Vincent Guittot <vincent.guittot@linaro.org>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Viresh Kumar <viresh.kumar@linaro.org> writes:

> This creates the QEMU side of the vhost-user-gpio device which connects
> to the remote daemon. It is based of vhost-user-i2c code.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

