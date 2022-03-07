Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4EA4D07C7
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 20:33:55 +0100 (CET)
Received: from localhost ([::1]:35634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRJ7C-0003qV-BV
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 14:33:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nRJ4l-0001La-Bw
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 14:31:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nRJ4h-0008FH-KQ
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 14:31:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646681478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HvBhUZPa8muWYjWlb/hAE/7wv/T5Nu7zQD7s9Zst0Dk=;
 b=e03YdssuVG7Zm8ccK59FOgL+b+cWvzO7knWzM3R/GX6XN4acBUIrG44mFHh+N1/c6FgPXB
 FqlVF750lvjd84nigv5O1qw8rD+wCmttvz7IGwgzrxtdgXIKfUcNMEDhk+euGrdTMHQSP4
 jxM8BoAVKZtUOSUDK82xS6hQfS1f7hE=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-408-VQdX1kPkOsGBHjh2SDyEVA-1; Mon, 07 Mar 2022 14:31:15 -0500
X-MC-Unique: VQdX1kPkOsGBHjh2SDyEVA-1
Received: by mail-vk1-f199.google.com with SMTP id
 m29-20020ac5cfdd000000b00336e9e4a678so1472004vkf.11
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 11:31:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HvBhUZPa8muWYjWlb/hAE/7wv/T5Nu7zQD7s9Zst0Dk=;
 b=tUGLaMo9XohuJBG4ZDloHFuQjh1v6j98x/cj13uclmQ5grrPAu5Y/PUHVdOU/uL6pp
 YF7TmtTk5eUmoERJKufMHugDD8SHxeUfvCZ4Hr0ihBciPwsMsTQNLugNmgExsUoq4B9U
 ItPXvr/ezcCCwsVaDej+9qVRd2erRJG8EJ/ZfSU6DfHu5BFLoDWdn9TeOhGh6CXSoM1s
 I76Mi8avICJVc9rg8vQ9bz4hL9+ihur+3QZdsvc2+KXYdzs4xdkO92xMni6xjiWXVAAY
 6JzBJ1sniqrv0tPBBnXIzvnl6kT0lUOnKwfgbbpn3ehBLyBTfJuHUn7YHQcTfVM5jB60
 qdGQ==
X-Gm-Message-State: AOAM5339us9s+aXcP3GsobDSVi9mSO9GEFezEIy0ZFHepByktTeRMQjP
 8MAnVgESQZfr6W5ZHJpAyoI4a6GrU0qUjnQ4ilxWLwxUY76eCEq7O+XkLMFtAPBMHBOqP+9P7AL
 1qAC1fdKn/wKMdJ5LXPhUzdsFZrN6wiE=
X-Received: by 2002:a05:6102:c94:b0:320:7ae0:8fea with SMTP id
 f20-20020a0561020c9400b003207ae08feamr5027174vst.11.1646681474641; 
 Mon, 07 Mar 2022 11:31:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKUMWbEBtkivJkHe2vSsgHR+WobnHT+20eogAmwxg/JMoi27uT/4ECjA4V/mkE9is82UNZDuXk2vTfR3B8QDw=
X-Received: by 2002:a05:6102:c94:b0:320:7ae0:8fea with SMTP id
 f20-20020a0561020c9400b003207ae08feamr5027164vst.11.1646681474391; Mon, 07
 Mar 2022 11:31:14 -0800 (PST)
MIME-Version: 1.0
References: <20220305105743.2384766-1-peter.maydell@linaro.org>
 <20220305105743.2384766-4-peter.maydell@linaro.org>
In-Reply-To: <20220305105743.2384766-4-peter.maydell@linaro.org>
From: John Snow <jsnow@redhat.com>
Date: Mon, 7 Mar 2022 14:31:03 -0500
Message-ID: <CAFn=p-ZkcsWyiGSAY16AvT-DN-x3rs2Lg+N_eUoenjONaA8hRg@mail.gmail.com>
Subject: Re: [PATCH 3/3] nsis installer: Fix mouse-over descriptions for
 emulators
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Mar 5, 2022 at 5:57 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> We use the nsis.py script to write out an installer script Section
> for each emulator executable, so the exact set of Sections depends on
> which executables were built.  However the part of qemu.nsi which
> specifies mouse-over descriptions for each Section still has a
> hard-coded and very outdated list (with just i386 and alpha).  This
> causes two problems.  Firstly, if you build the installer for a
> configuration where you didn't build the i386 binaries you get
> warnings like this:
>   warning 6000: unknown variable/constant "{Section_i386}" detected, ignoring (macro:_==:1)
>   warning 6000: unknown variable/constant "{Section_i386w}" detected, ignoring (macro:_==:1)
> (this happens in our gitlab CI jobs, for instance).
> Secondly, most of the emulators in the generated installer don't have
> any mouseover text.
>
> Make nsis.py generate a second output file which has the necessary
> MUI_DESCRIPTION_TEXT lines for each Section it creates, so we can
> include that at the right point in qemu.nsi to set the mouse-over
> text.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I opted to put the logic into the Python script, which I think
> many QEMU contributors understand, rather than investigating
> whether NSIS installer script magic might for instance allow
> us to write out only one file rather than two, since I think
> very few of us understand the NSIS installer...

Makes sense.

Python bits:

Reviewed-by: John Snow <jsnow@redhat.com>


> ---
>  qemu.nsi        |  5 +----
>  scripts/nsis.py | 13 ++++++++++++-
>  2 files changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/qemu.nsi b/qemu.nsi
> index a44d2be32a2..aa93adee396 100644
> --- a/qemu.nsi
> +++ b/qemu.nsi
> @@ -228,10 +228,7 @@ SectionEnd
>  ; Descriptions (mouse-over).
>  !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
>      !insertmacro MUI_DESCRIPTION_TEXT ${SectionSystem}  "System emulation."
> -    !insertmacro MUI_DESCRIPTION_TEXT ${Section_alpha}  "Alpha system emulation."
> -    !insertmacro MUI_DESCRIPTION_TEXT ${Section_alphaw} "Alpha system emulation (GUI)."
> -    !insertmacro MUI_DESCRIPTION_TEXT ${Section_i386}   "PC i386 system emulation."
> -    !insertmacro MUI_DESCRIPTION_TEXT ${Section_i386w}  "PC i386 system emulation (GUI)."
> +!include "${BINDIR}\system-mui-text.nsh"
>      !insertmacro MUI_DESCRIPTION_TEXT ${SectionTools} "Tools."
>  !ifdef DLLDIR
>      !insertmacro MUI_DESCRIPTION_TEXT ${SectionDll}   "Runtime Libraries (DLL)."
> diff --git a/scripts/nsis.py b/scripts/nsis.py
> index 383bef70332..462d6cac3b6 100644
> --- a/scripts/nsis.py
> +++ b/scripts/nsis.py
> @@ -33,7 +33,9 @@ def main():
>          subprocess.run(["make", "install", "DESTDIR=" + destdir + os.path.sep])
>          with open(
>              os.path.join(destdir + args.prefix, "system-emulations.nsh"), "w"
> -        ) as nsh:
> +        ) as nsh, open(
> +            os.path.join(destdir + args.prefix, "system-mui-text.nsh"), "w"
> +        ) as muinsh:
>              for exe in sorted(glob.glob(
>                  os.path.join(destdir + args.prefix, "qemu-system-*.exe")
>              )):
> @@ -49,6 +51,15 @@ def main():
>                          arch, exe
>                      )
>                  )
> +                if arch.endswith('w'):
> +                    desc = arch[:-1] + " emulation (GUI)."
> +                else:
> +                    desc = arch + " emulation."
> +
> +                muinsh.write(
> +                    """
> +                !insertmacro MUI_DESCRIPTION_TEXT ${{Section_{0}}} "{1}"
> +                """.format(arch, desc))
>
>          for exe in glob.glob(os.path.join(destdir + args.prefix, "*.exe")):
>              signcode(exe)
> --
> 2.25.1
>


