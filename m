Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFD76A4063
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:14:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWbRj-0006Bv-Gr; Mon, 27 Feb 2023 06:13:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pWbRh-00067T-6G
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:13:29 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pWbRe-0001CD-RI
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:13:28 -0500
Received: by mail-wr1-x42b.google.com with SMTP id r18so5801076wrx.1
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 03:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0CUR5eriz6ZQAmAdDWWPwluWPccH1XaT/t4IAOauMxs=;
 b=uF4TY/eFqO1uwwvv4b3Ms1778VdlxTltdmOqlXfVeGy2fuTXRMN6Lwu+Ie4lTXlteY
 d1+TbdaE4se7mnS/qUWg4WP+dfd/8cONRpXe5TgkN0PSW8CIYgifaws7rebh2HQORitd
 us6sctLc+GfZyVXMNFl/nglyWqxEj45RLD+qJBOegMaNX5eVdNHWT18TqG6xZd6GyeFx
 O3fZ1g09iddrYFJvYbs36a/2Q1Lz86wTmZs+hIyHvXRmHdMky6/1u8TXTDiJn3NJyOOy
 Q4zxImr4WiMZ4HKdH3p/30SGBjcbYW1n+qZrbYo+tW6UOmCHpZZq4A3iq4QBnmAS2MO3
 jy0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0CUR5eriz6ZQAmAdDWWPwluWPccH1XaT/t4IAOauMxs=;
 b=cisBOoXvnjMZEajF/LgGt+xaYhB/ByibKcq2r3S96PvDJkQ8h2mUqePeNMVfS8Z2qm
 U2G0o9POTGIXmnb6wtN8cy30nwkU9yZgUE1/VwVivPvwga+HX25du1y9ZJV2n73Ig423
 afi3sQcZYUKSUuAxWXxdpoHzEfI9n1wnVvmYE/KC8MsLyDGID71m6A8iILqDgoE7xjvs
 rOYz0M+e5EmByLZdw/GJO7idUvMDyjrqWfOoR6DYGZWiwzdA9b/knfRqy2tSdoXXkaF4
 +4FFwFOduDoAUe1n7BdM+WH9fa5nI1cUZU2lCMGo5b75QeGXxmkmMCXSkQfymfddSg4N
 FjYA==
X-Gm-Message-State: AO0yUKVcl/QdQwnGY8d9uP278yQfIOSLOKhHY6PWZwvM+4P4OhJhRXZt
 t8rJ8yykzt9kJy3OI9ovK70yuQ==
X-Google-Smtp-Source: AK7set+Dll4msysyvUYl69deV1VbYkVYvqZR4Q8qxx4EKlvyikel+w8DfYybce0MIeECb6bVFr5jUw==
X-Received: by 2002:adf:f247:0:b0:2c7:1e00:d514 with SMTP id
 b7-20020adff247000000b002c71e00d514mr11522473wrp.38.1677496404328; 
 Mon, 27 Feb 2023 03:13:24 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a5d51c5000000b002c70d97af78sm6888569wrv.85.2023.02.27.03.13.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 03:13:24 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A50CC1FFB7;
 Mon, 27 Feb 2023 11:13:23 +0000 (GMT)
References: <20230220091358.17038-1-philmd@linaro.org>
 <20230220091358.17038-10-philmd@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, Richard Henderson
 <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 09/24] hw/ide: Include 'exec/ioport.h' instead of
 'hw/isa/isa.h'
Date: Mon, 27 Feb 2023 11:13:18 +0000
In-reply-to: <20230220091358.17038-10-philmd@linaro.org>
Message-ID: <87mt4zicoc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> The IDEBus structure has PortioList fields, so we need its
> declarations from "exec/ioport.h". "hw/isa/isa.h" is not required.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Message-Id: <20230215112712.23110-9-philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

