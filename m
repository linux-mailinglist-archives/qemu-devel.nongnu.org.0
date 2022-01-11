Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A627F48B1DD
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 17:17:40 +0100 (CET)
Received: from localhost ([::1]:40320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Jq7-0008IB-Hs
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 11:17:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7Jkc-0003M2-Ii
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 11:12:00 -0500
Received: from [2a00:1450:4864:20::334] (port=44949
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7JkY-00068y-Pp
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 11:11:57 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 f141-20020a1c1f93000000b003497aec3f86so2115357wmf.3
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 08:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=xMmA6f0qIEkPOXQgtF4ZIuVic9gcAFhPLAddXnn01jo=;
 b=L5zolGo/Cpw1WRoZKUtLKAf8ev93/6Lek+eMBd8Ek12LgYwB1BuZASHTkYPAVWHKSI
 +IkK9W+t+T2Nb1j575PvtRdDlh4lSGrCx5LfOss2gQlEvQcl6jLO8u8BykhCXZbxJmmr
 VIJ1WbJAbgSJevtP3Hcja/30kYRSDeFzgSxuW2Q+pGaS78vCLs/KY0KTBGhhRsCSeTC5
 O67EfkuVjbiw2SyCgwZdL1O1Kc7O4YT8XeEA0ZMmWS1JX7tlN7tp83Hm7VztC8rr/3d9
 z+92dvyxbpz9/dl3s4Qtwe2GNc0rWrUXLgcuq/XdGwIwccR8R9o40r7hUvsIRN3sULT6
 RRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=xMmA6f0qIEkPOXQgtF4ZIuVic9gcAFhPLAddXnn01jo=;
 b=wkoGPyx2kcbTjOpdfjJNqEpiUyK1z0pbHkj+kD2eRa0OX7ELsc+GdSNyZ6TTp6fMxD
 Oo6qBUozrNZZG5TXS8Tpxfz0Kdfwfs4kHyTuYJgNssPottscBDV/QykcxSo8GD1cFNqm
 Z/NLYBv4mEkZ4R+VRLUgbtL9TeUkq58hd2RKmxz+ZgImP3+9BzFHQH1WWZLjgizB/dEt
 NXFdGreVI/wruSX5bUSpE07CEDyRtgzDqBP0m49Zmzc5XXqO4VejmEvYYTZTog5JBlr8
 Ft6KxxPpJ5Vfqdc8iWJKaZV0dMAMMEQYT3mlxF0IUTOyuyKHRekR3nc297GXqwlfiuIF
 UYDA==
X-Gm-Message-State: AOAM533FXVnmd7Esv8UL0gGmenUG001sTMHl4nepNNV8MTFwYLWPztv2
 e+Qldd0NPHuTensmKyov4ua/cQ==
X-Google-Smtp-Source: ABdhPJxmRwFKCwQTUe90p0H69r5tEEG10lAuYBX4ewFbSnMD+8koPVJcmEm0RhikLbanAs+ISmZ2BQ==
X-Received: by 2002:a1c:a5c2:: with SMTP id o185mr3087731wme.177.1641917480387; 
 Tue, 11 Jan 2022 08:11:20 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f6sm2507869wmq.6.2022.01.11.08.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 08:11:19 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ADF151FFB7;
 Tue, 11 Jan 2022 16:11:18 +0000 (GMT)
References: <20211209145601.331477-1-peter.griffin@linaro.org>
 <20211209145601.331477-8-peter.griffin@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH 7/8] hw/display: add vhost-user-video-pci
Date: Tue, 11 Jan 2022 16:11:13 +0000
In-reply-to: <20211209145601.331477-8-peter.griffin@linaro.org>
Message-ID: <87o84ib6c9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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

> Add boiler plate code for vhost-user-video-pci.
>
> Example
> -device vhost-user-video-pci,chardev=3Dvideo,id=3Dvideo
> -chardev socket,path=3Dvideo.sock,id=3Dvideo
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

