Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B42FD48B08E
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 16:13:28 +0100 (CET)
Received: from localhost ([::1]:59760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Ipz-0007EX-1G
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 10:13:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7IaE-0006Uo-7B
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 09:57:10 -0500
Received: from [2a00:1450:4864:20::534] (port=34557
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7IaC-0002cD-Fz
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 09:57:09 -0500
Received: by mail-ed1-x534.google.com with SMTP id u25so68298577edf.1
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 06:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=tMivxM/Xn3iTVERfmk/QndRMyhMbYwZxLgQnEPVXA4g=;
 b=F9I6zTfZi2scDRQyEbe8swWfdVcMaW0Cn8eKKTx0iX1+wN0TQ3c7NO5K6IaklRpp9i
 Ftv88zzj3fyn8y54zuEwiSLUsPjApz/r7/Y99rqsfZ7Jgl1kGnAU5RuBwDOrtMZqGBE1
 ygm+B0evMLFaw0ptQHah+iccEnGh30aPIPR3aS5KV7tM1LNgS3geSFfqEmTvtzhrz/jz
 I7Sl7X/OfIyroI5RYwpj+tGESu0MrH4KwwoZ9rGvAquVrcr5ublcWH6jeZ3bEKG1My1G
 Pw9W7zIrkWg5zuON9vTuJtmoghE4rACTHB1BkEBhGfIQnYwoqc9qZikqVceAkXQyaYl2
 smEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=tMivxM/Xn3iTVERfmk/QndRMyhMbYwZxLgQnEPVXA4g=;
 b=4dlotc392gEq1aZC01UeYgL5twF/3smwMLHRe2XusKGoc6TSx5kGCf3lqm+hhxo9ad
 ThuGmJeiWDXfQ72TnlPXkw/d+uzHiOsiVRA6fvso9qSa4JuX3PoR5Pj3kYL8cSXzXf12
 i3MHfe8X6Ikg3+EGcsQyONx9M0r+fycqUQjm8TPLs1o0TfZVj83kgWZcCzuLLudVHKYA
 O5My0fGzy6fN3nlW8sZYOhyNLX1pKkWaIw1O9XNtdm35xAMrhFnCIJIJTWBLj2/Hhpjf
 HBcykNVSnIvp33Qg7eiG+1EEL0SPwgToJDND/LfQv248hOPdh+NW4X65h3RFUFO1XwNR
 OavA==
X-Gm-Message-State: AOAM531XLCJ/6oM0WNnw3y4KlsPiDiaS0ukjHqRexZBBXmJsjZ4Z07XL
 9Wor70O0al3+b/W76wSSzd93tw==
X-Google-Smtp-Source: ABdhPJxlNL0mN8/5IqyPuIfjofg56DazfEpgRKLd7bphCTJ6doON8P5+JAm4dM6B3y4QxRHTulpTfg==
X-Received: by 2002:a05:6402:148:: with SMTP id
 s8mr4689265edu.221.1641913027106; 
 Tue, 11 Jan 2022 06:57:07 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v10sm5125061edr.37.2022.01.11.06.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 06:57:06 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C9A911FFB7;
 Tue, 11 Jan 2022 14:57:05 +0000 (GMT)
References: <20211209145601.331477-1-peter.griffin@linaro.org>
 <20211209145601.331477-3-peter.griffin@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH 2/8] MAINTAINERS: Add virtio-video section
Date: Tue, 11 Jan 2022 14:57:00 +0000
In-reply-to: <20211209145601.331477-3-peter.griffin@linaro.org>
Message-ID: <871r1ecoce.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, stratos-dev@op-lists.linaro.org,
 qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Griffin <peter.griffin@linaro.org> writes:

> Add myself as maintainer of the virtio-video files added
> in this series.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

