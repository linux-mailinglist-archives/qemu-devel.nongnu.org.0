Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 612182F1D2E
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 18:56:58 +0100 (CET)
Received: from localhost ([::1]:56442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz1R3-0005xf-6Q
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 12:56:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kz1JI-00019B-I4
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:48:56 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:34832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kz1JF-000549-R4
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:48:56 -0500
Received: by mail-wm1-x32b.google.com with SMTP id e25so66986wme.0
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 09:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=HjFjB02VUOcj2JDmR/K56mtMUPw1JqKruxO3gsfgtG0=;
 b=Z1BLHnk/IllfoIqIlxKJ0XD2wgjI2evX/5XsMH9aGtoY/foB5Zp0OZr8+O18Z54N3P
 vFsoIVlUr7x9Y30UZt1g+VOvY8vJ0NhhFFf2vN/wzVP3Kpz1pVqYsTLQ3muqdwj0v8Y5
 F9VbBO51j75TEHi3Hsgg7/C+0sYNIOp0sLXBtkDC9Q/35JGz6cyiqvyi3+ptkFR33Rvf
 3RBT2H7VMu8ETRySwN8DK70ixgS2jWeoVWpQS1Wylo7thAyY7nH2Kq28D8Zatl3+Bobs
 TdnNFPVrst4l7kXfPxCLsQ62wZ5e8A8OpP+u3d7lU4jKfBn2zsMJ+iKqTpkuPX5Vqm2S
 db4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=HjFjB02VUOcj2JDmR/K56mtMUPw1JqKruxO3gsfgtG0=;
 b=TLF0RKjIBfBeN5Zq48Ibi3ML2t/CGJ3fYcI9ZqLBIfiq38Rkat0Yiv0EsxKmJHlJNZ
 p0AwD7oW3J1HS+1i9ap+GBgxi3tNrkKvis6/a3KScjX8sJi8yXufZOdCXlu/fIwWdcXe
 j69/XPneVSh2zpMWfYRmecNBs8Brlq8G5TETCIiLr3Jg4dygCpRr57Zd/Ds4tKxXV4n4
 MhknoZmntSTJz23ORa2sA9tGmkCaHTPCTZJ0Hmklc7pc0K38wWsnTt6Nv0XljLDy7DtR
 jmL5dmt9HdfZgvlYSs4Nk5cAVT3EfCLdbUVT1msXizIl+h0BNjLjUOPVlwPkY8rUCTuA
 p2ng==
X-Gm-Message-State: AOAM531TQp1dCE8Dnc1f17LQLvtZhubXvFxY7Xx06/FVf9evnJFRpfCe
 qmz1gmpt0/eD5FKIkoAEYwaG8A==
X-Google-Smtp-Source: ABdhPJxFl0pGJIm5UheooE53gyVfAACVfyEjNoEnS7yM3rBuAokl0gYAMKI4jSlEoOleDrcPABVpeg==
X-Received: by 2002:a1c:7213:: with SMTP id n19mr15554wmc.14.1610387332427;
 Mon, 11 Jan 2021 09:48:52 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o3sm396503wrc.93.2021.01.11.09.48.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 09:48:51 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B2CE01FF7E;
 Mon, 11 Jan 2021 17:48:50 +0000 (GMT)
References: <20210111152020.1422021-1-philmd@redhat.com>
 <20210111152020.1422021-3-philmd@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 2/2] sysemu: Let VMChangeStateHandler take boolean
 'running' argument
Date: Mon, 11 Jan 2021 17:48:41 +0000
In-reply-to: <20210111152020.1422021-3-philmd@redhat.com>
Message-ID: <87lfcznz3x.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Amit Shah <amit@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Paul Durrant <paul@xen.org>, Alex Williamson <alex.williamson@redhat.com>,
 qemu-arm@nongnu.org, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-s390x@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> The 'running' argument from VMChangeStateHandler does not require
> other value than 0 / 1. Make it a plain boolean.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Seems reasonable

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

