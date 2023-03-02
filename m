Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D4F6A7E48
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 10:44:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXfTv-0008W5-5B; Thu, 02 Mar 2023 04:44:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXfTt-0008Vp-JO
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:44:09 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXfTs-0002lU-27
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:44:09 -0500
Received: by mail-wm1-x32f.google.com with SMTP id k37so10300666wms.0
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 01:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=092wLcFG3TlkyDkzmWSMWCfKl5GHOFXYFVyiZ1xBmHI=;
 b=NT1owtnR6dQrNFKCQytcFI95xsloBYB9RNhDGsb48xLUo4KgZpbGB2cBZDz3Tp4oAJ
 kv2YDRu0ilsItudAZQBtQDXhvrNAvZrLHsRccQ1DD2UsgrcfcQ92eV6RkR6Cmgjy9i6K
 MIrBWCRaxsGU1dEVzZclPrPmFMRfOL4FEHCP5NvMaqypTu3PUgnT2Q2pR0UKCnLF8LIg
 cHbkfE/OYVfIJ64aEEa+cXdyw8h73NFdy+jAyQ1UARY7R/8Uk3b7V1AuAquoktFw0t28
 IOS5bqUBMTszaRSpUnc2vsdX2eVxVoVBgRLwVDG6l/QiOTU9ERxip7+e/lVll9MQniQ8
 UYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=092wLcFG3TlkyDkzmWSMWCfKl5GHOFXYFVyiZ1xBmHI=;
 b=39ksvoI0mO8W5ZTTwUPFflW8jtclwSnQAhIaWO2+Phj2LSHOOy8mpyGcT2KgeTk+cO
 EPZ1Ynt/2UPXXN+0CqpFlfQ3KoXAHOdCzK+678WC6P+LrtzokqSyenzOLkEk86zskWT1
 ZtJmbYT6v+mET7qToQtsifC8OPi6Keqho6PWB9UFgAGNO9Blq3zsQ+ORT58/7VfsGwAZ
 C4S0WPELyQJLdE8HuJa44Y4ntM3dpZ+rBjK9t6zfOUAXMZJuzQJqdZtC6ulhlqMZ1LMs
 n7dUbawRIVYZbNk658ri23d725kqMToqY3Spbr6QjUhdu83ANzPKcUB/Grb1g03EiUFn
 VtxQ==
X-Gm-Message-State: AO0yUKXfwLYfC1UEhdzx+7MWXPpvyW52z/H1GxQFtbArxnFYnDXBfe0A
 LpQiC+qce5fBezDuraQvlw+goA==
X-Google-Smtp-Source: AK7set9p4GmsKCONPV7cH9Gp06u6Mr857l8g+iPLPACRGSXJXB7781yLx0M81Hw4CxGtIRlTmOivZg==
X-Received: by 2002:a05:600c:4aa0:b0:3eb:3f2d:f22f with SMTP id
 b32-20020a05600c4aa000b003eb3f2df22fmr8176621wmp.21.1677750245882; 
 Thu, 02 Mar 2023 01:44:05 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 r15-20020a05600c2f0f00b003eae73f0fc1sm2422623wmn.18.2023.03.02.01.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 01:44:05 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 182681FFB7;
 Thu,  2 Mar 2023 09:44:05 +0000 (GMT)
References: <20230207142535.1153722-1-marcandre.lureau@redhat.com>
 <20230207142535.1153722-7-marcandre.lureau@redhat.com>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Beraldo Leal <bleal@redhat.com>, Eric Blake
 <eblake@redhat.com>, Stefan Weil <sw@weilnetz.de>, Paolo Bonzini
 <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>, Markus Armbruster <armbru@redhat.com>, =?utf-8?Q?Dan?=
 =?utf-8?Q?iel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v3 06/10] monitor: release the lock before calling close()
Date: Thu, 02 Mar 2023 09:34:15 +0000
In-reply-to: <20230207142535.1153722-7-marcandre.lureau@redhat.com>
Message-ID: <87ttz3bi8q.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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


marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> As per comment, presumably to avoid syscall in critical section.
>
> Fixes: 0210c3b39bef08 ("monitor: Use LOCK_GUARD macros")
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

I know this is already merged but as an academic exercise we could have
kept the lock guard with a little restructuring like this:

  void qmp_closefd(const char *fdname, Error **errp)
  {
      Monitor *cur_mon =3D monitor_cur();
      mon_fd_t *monfd;
      int tmp_fd =3D -1;

      WITH_QEMU_LOCK_GUARD(&cur_mon->mon_lock) {
          QLIST_FOREACH(monfd, &cur_mon->fds, next) {
              if (strcmp(monfd->name, fdname) !=3D 0) {
                  continue;
              }

              QLIST_REMOVE(monfd, next);
              tmp_fd =3D monfd->fd;
              g_free(monfd->name);
              g_free(monfd);
              break;
          }
      }

      if (tmp_fd > 0) {
          /* close() must be outside critical section */
          close(tmp_fd);
      } else {
          error_setg(errp, "File descriptor named '%s' not found", fdname);
      }
  }

To my mind it makes it easier to reason about locking but I probably
have an irrational aversion to multiple exit paths for locks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

