Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1A630CDCF
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 22:18:02 +0100 (CET)
Received: from localhost ([::1]:43540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l733h-00038I-4I
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 16:18:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l732P-0002ga-Jq
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 16:16:41 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:56239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l732N-0006QU-Mo
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 16:16:41 -0500
Received: by mail-wm1-x32b.google.com with SMTP id f16so3713027wmq.5
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 13:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=QDSabGjC3iBWdIIm7Pl5D8N8Hs4pXEeorABbCgN3KTI=;
 b=Z8Ku+IineSXRIdjp4LcSEy4jnBCzE9/cgeUNKOXri3yOzn+Pftcyn05DwveSQqjJn7
 6AzRyAgVfPyfVCmb6W+swAp4ij1UPF6LfSh/DgrQd1WtKwyvVeqrOWwohVQTaW0Zm9NC
 oMrep8MHLELYJVNIHCatd/csqEEZ8QMO5Q6qXq2uQjI0NrEZ+eNh+OCcdVClucAAZW8w
 KKI0GtybIRuG04JVR6YKjH6zMvEvROba6+u9+zoXGs7CHcuvHWRh3x62Acde8cE3ZTXf
 qP19fVcTo9ziApi9DD3WPSdmxfj176AMyZXZeuTqFXA5EeN0z3KyKFtq6SJ9oorr2ZZs
 t88A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=QDSabGjC3iBWdIIm7Pl5D8N8Hs4pXEeorABbCgN3KTI=;
 b=amojccEFAwXn4SnxzNnREZ0nN1f86Fpennuh87asVDHRIEQWcgqVP/en/foTbSELKa
 26Kw3EH002STXgF6PxbQJk+GxFQKO87Hyqm/xVRxBB3ogf9rGo3EAN6PDn0yXvlqiNmY
 Bu/pRziVFUrGv1OAYy5gADCtoxnYJ/1EWsrOYDGkXzkpKv/lq8ViCeK2vSNdvNq9nN7H
 REALfn5vgE19gsbcTIjr4mwFktcYsDrdgz5wP79XSG7NwYQi6bRZTovr5t3BeudHNXR6
 fjo1CBhe86u8L2e8eDUD/N/GhZLekpO4aseMPFbII/1YKwShxeawS+Z01QrGpKgB0M1J
 +Eiw==
X-Gm-Message-State: AOAM530ejXYpGGlbGjB26FtVHXXOx92K8hdGSamVDvX6xpgfvJhLt1HR
 RO3iU8QuHyW29WdjHVMo7y96lQ==
X-Google-Smtp-Source: ABdhPJzO1KvK8seXcVV2VviVWvju8kC/80nCKKYlUwgHpaFelwozztT/VTTkonwXidUbc9/GOoJkhA==
X-Received: by 2002:a05:600c:22c8:: with SMTP id
 8mr5243836wmg.11.1612300597581; 
 Tue, 02 Feb 2021 13:16:37 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d10sm9083725wrn.88.2021.02.02.13.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 13:16:36 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9C2731FF7E;
 Tue,  2 Feb 2021 21:16:35 +0000 (GMT)
References: <20210202134001.25738-1-alex.bennee@linaro.org>
 <20210202134001.25738-12-alex.bennee@linaro.org>
 <15438de7-ad2a-b0c3-3d35-1e78c6b1ce13@amsat.org>
 <CAAdtpL7EttPLAJaFWRpvM93n342MyaAREpEtxr6-dmnfmu=wZg@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v1 11/15] tests/tcg: Replace /bin/true by true (required
 on macOS)
Date: Tue, 02 Feb 2021 21:14:25 +0000
In-reply-to: <CAAdtpL7EttPLAJaFWRpvM93n342MyaAREpEtxr6-dmnfmu=wZg@mail.gmail.com>
Message-ID: <87wnvqrwzw.fsf@linaro.org>
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
Cc: Stefan Weil <sw@weilnetz.de>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On Tue, Feb 2, 2021 at 3:23 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>> On 2/2/21 2:39 PM, Alex Benn=C3=A9e wrote:
>> > From: Stefan Weil <sw@weilnetz.de>
>> >
>> > /bin/true is missing on macOS, but simply "true" is available as a she=
ll builtin.
>> >
>> > Signed-off-by: Stefan Weil <sw@weilnetz.de>
>>
>> Reviewed ... :
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg777004.html
>> ... before Peter:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg777010.html
>>
>> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
<snip>

It turns out there isn't an easy way to extract the information direct
from b4 so I just scripted it into Emacs:

  (defun my-git-check-for-updates-with-b4 (id subject)
    "Fetch `id' via the b4 tool and check for new tags."
    (let ((tags)
          (add-dco (rx (: "+ " (group (regexp my-bare-dco-tag-re))))))
      (with-temp-buffer
        (call-process "b4" nil t t "am" id "-o" "-")
        (goto-char 0)
        (when (re-search-forward subject nil t)
          (forward-line)
          (beginning-of-line)
          (while (string-match add-dco (thing-at-point 'line))
            (push (match-string-no-properties 1 (thing-at-point 'line)) tag=
s)
            (forward-line))))
      tags))

  (defun my-commit-update-with-b4 ()
    "Check if the current commit has tags from it's last posting.

  This only works if there is a message id in the buffer to search for."
    (interactive)
    (let ((subj) (id))
      (save-excursion
        (goto-char 0)
        (setq subj (substring-no-properties (thing-at-point 'line)))
        (if (re-search-forward my-capture-msgid-re nil t)
            (setq id (match-string-no-properties 1))))
      (when (and subj id)
        (let ((tags (my-git-check-for-updates-with-b4 id subj)))
          (--map
           (save-excursion
             (goto-char 0)
             (when (not (re-search-forward it nil t))
               (re-search-forward my-capture-msgid-re nil t)
               (beginning-of-line)
               (insert it ?\n))) tags)))))


--=20
Alex Benn=C3=A9e

