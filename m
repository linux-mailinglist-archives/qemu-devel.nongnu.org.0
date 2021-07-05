Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 722113BBEA1
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 17:08:15 +0200 (CEST)
Received: from localhost ([::1]:60688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0QCk-0001c0-FL
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 11:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0QBU-0008RW-OX
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 11:06:56 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:55020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0QBS-0003dW-MT
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 11:06:56 -0400
Received: by mail-wm1-x32d.google.com with SMTP id l1so11601045wme.4
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 08:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=oE4pHzr0LNW8FwvocOBjxPKaAlFLrq+7NDnrT7ZtQ/s=;
 b=Dp7NSAAiN8ev6uNHx/93Zp+Ts7v43MwZYzofRQ5BjbJGaNeA/8QcS+n6x1Ah16qm+7
 xi2W1Z4L5Vo40b+T0VS+Mb4LRKwPmrFkTYpAsC+hd0xmL7hIOUWX4g3idMHmaNQt8fH1
 5gNTNABx+RjXeQf4mcVur+nUX+KfTMWUN4o/HecYt0FRpC0T/4eTsqPW7AH2TQygyFHx
 5TSqaXL++s5tD4bAA2etd2UbZufm4eppDtK0mCmysoNTFgDD1+xivb2KbOactPjEmoJQ
 59s+HFr9mpIku/J5+0Ia4pSH/fV/h6pOBG2G1+Hh1y0PmmCyCz6WAPRr9OTb3DT3zvfD
 5Ujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=oE4pHzr0LNW8FwvocOBjxPKaAlFLrq+7NDnrT7ZtQ/s=;
 b=Aj2oFTY2bAOqSZJ5aKpOTIRK6QzgnG7kaaZuPp+FJmzbtAQLgUzVmopd4vMZGPZ/7m
 Ij3vQtifDKmDQyMqOjhcnzE4dwUc+9UBnWSByykWiITYH+nPRbm2Yltyn7AiBr509wX0
 55koRXX0kd68jxsfJyLHt8TMg1OLe0o97uy6GIMXhCYTq7MhgtUniDDGIo3b1NKvq5Yk
 lsKldM70RGWnsuaPAjsVjfBxC0dS+KQmepRlDvGkOKE+JoWL+t/nhuTROehb0xJLtXOH
 IvGIXUWbDQCc7KxKgxlfkm3a7XenD4XEmsWpU4NdGNZ5MiUCW77HSWuQS310WiKSU18z
 Pnqw==
X-Gm-Message-State: AOAM533hqYRm6zPlxvdCfrA7gWS7vDcyliJTyIPlKjoxd3YHHryi6+wr
 u/YnTRX/EAsz+VbDmxKHk48LSw==
X-Google-Smtp-Source: ABdhPJyJx1FDhmOHBrIQXhnn0Ll0GBoTTMy0WwCHccolAOZO3VgSSHQKQhhjD6YE1JD+1FAoImgLtw==
X-Received: by 2002:a1c:26c2:: with SMTP id
 m185mr15781163wmm.146.1625497613344; 
 Mon, 05 Jul 2021 08:06:53 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l7sm12184625wry.0.2021.07.05.08.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 08:06:52 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DEB141FF7E;
 Mon,  5 Jul 2021 16:06:51 +0100 (BST)
References: <YLe+LZ/j0pxVGeBi@humpty.home.comstyle.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Brad Smith <brad@comstyle.com>
Subject: Re: [PATCH] tests/vm: update NetBSD to 9.2
Date: Mon, 05 Jul 2021 16:05:10 +0100
In-reply-to: <YLe+LZ/j0pxVGeBi@humpty.home.comstyle.com>
Message-ID: <87r1gc3ilw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: Philippe
 =?us-ascii?Q?=3D=3Funknown-8bit=3FQ=3FMathieu-Daud=3DC3=3DA9=3F=3D?=
 <philmd@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Brad Smith <brad@comstyle.com> writes:

> tests/vm: update NetBSD to 9.2
>
> Signed-off-by: Brad Smith <brad@comstyle.com>

Queued to testing/next, thanks.

Note: something about your message-id or formatting really confuses b4:

  b4 am -S -t "YLe+LZ/j0pxVGeBi@humpty.home.comstyle.com" -o -
  Looking up https://lore.kernel.org/r/YLe%2BLZ%2Fj0pxVGeBi%40humpty.home.c=
omstyle.com
  Grabbing thread from lore.kernel.org/qemu-devel
  Analyzing 6 messages in the thread
  ---
  Writing /tmp/tmpuc25zyupb4-am-stdout
    [PATCH] tests/vm: update NetBSD to 9.2
      + Tested-by: Gerd Hoffmann <kraxel@redhat.com>
      + Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
      + Acked-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
  Traceback (most recent call last):
    File "/home/alex/.local/bin/b4", line 10, in <module>
      sys.exit(cmd())
    File "/home/alex/.local/lib/python3.7/site-packages/b4/command.py", lin=
e 222, in cmd
      cmdargs.func(cmdargs)
    File "/home/alex/.local/lib/python3.7/site-packages/b4/command.py", lin=
e 40, in cmd_am
      b4.mbox.main(cmdargs)
    File "/home/alex/.local/lib/python3.7/site-packages/b4/mbox.py", line 5=
05, in main
      mbox_to_am(threadmbox, cmdargs)
    File "/home/alex/.local/lib/python3.7/site-packages/b4/mbox.py", line 1=
16, in mbox_to_am
      linkmask=3Dconfig['linkmask'], cherrypick=3Dcherrypick)
    File "/home/alex/.local/lib/python3.7/site-packages/b4/__init__.py", li=
ne 567, in save_am_mbox
      mbx.add(msg.as_bytes(policy=3Demlpolicy))
    File "/usr/lib/python3.7/email/message.py", line 178, in as_bytes
      g.flatten(self, unixfrom=3Dunixfrom)
    File "/usr/lib/python3.7/email/generator.py", line 116, in flatten
      self._write(msg)
    File "/usr/lib/python3.7/email/generator.py", line 195, in _write
      self._write_headers(msg)
    File "/usr/lib/python3.7/email/generator.py", line 418, in _write_heade=
rs
      self._fp.write(self.policy.fold_binary(h, v))
    File "/usr/lib/python3.7/email/policy.py", line 199, in fold_binary
      folded =3D self._fold(name, value, refold_binary=3Dself.cte_type=3D=
=3D'7bit')
    File "/usr/lib/python3.7/email/policy.py", line 205, in _fold
      return value.fold(policy=3Dself)
    File "/usr/lib/python3.7/email/headerregistry.py", line 258, in fold
      return header.fold(policy=3Dpolicy)
    File "/usr/lib/python3.7/email/_header_value_parser.py", line 144, in f=
old
      return _refold_parse_tree(self, policy=3Dpolicy)
    File "/usr/lib/python3.7/email/_header_value_parser.py", line 2631, in =
_refold_parse_tree
      encoded_part =3D part.fold(policy=3Dpolicy)[:-1] # strip nl
    File "/usr/lib/python3.7/email/_header_value_parser.py", line 144, in f=
old
      return _refold_parse_tree(self, policy=3Dpolicy)
    File "/usr/lib/python3.7/email/_header_value_parser.py", line 2631, in =
_refold_parse_tree
      encoded_part =3D part.fold(policy=3Dpolicy)[:-1] # strip nl
    File "/usr/lib/python3.7/email/_header_value_parser.py", line 144, in f=
old
      return _refold_parse_tree(self, policy=3Dpolicy)
    File "/usr/lib/python3.7/email/_header_value_parser.py", line 2631, in =
_refold_parse_tree
      encoded_part =3D part.fold(policy=3Dpolicy)[:-1] # strip nl
    File "/usr/lib/python3.7/email/_header_value_parser.py", line 144, in f=
old
      return _refold_parse_tree(self, policy=3Dpolicy)
    File "/usr/lib/python3.7/email/_header_value_parser.py", line 2631, in =
_refold_parse_tree
      encoded_part =3D part.fold(policy=3Dpolicy)[:-1] # strip nl
    File "/usr/lib/python3.7/email/_header_value_parser.py", line 144, in f=
old
      return _refold_parse_tree(self, policy=3Dpolicy)
    File "/usr/lib/python3.7/email/_header_value_parser.py", line 2652, in =
_refold_parse_tree
      part.ew_combine_allowed, charset)
    File "/usr/lib/python3.7/email/_header_value_parser.py", line 2729, in =
_fold_as_ew
      first_part =3D to_encode[:text_space]
  TypeError: slice indices must be integers or None or have an __index__ me=
thod


> ---
>  tests/vm/netbsd | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/vm/netbsd b/tests/vm/netbsd
> index b9efc269d2..4cc58df130 100755
> --- a/tests/vm/netbsd
> +++ b/tests/vm/netbsd
> @@ -22,8 +22,8 @@ class NetBSDVM(basevm.BaseVM):
>      name =3D "netbsd"
>      arch =3D "x86_64"
>=20=20
> -    link =3D "https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.1/images/NetBSD=
-9.1-amd64.iso"
> -    csum =3D "65bddc95945991c3b2021f9c8ded7f34c25f0a7611b7aa15a15fe23399=
e902307e926ae97fcd01dc1662ac67b5f6e4be643c6a2b581692ddcb616d30125066f9"
> +    link =3D "https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.2/images/NetBSD=
-9.2-amd64.iso"
> +    csum =3D "5ee0ea101f73386b9b424f5d1041e371db3c42fdd6f4e4518dc79c4a08=
f31d43091ebe93425c9f0dcaaed2b51131836fe6774f33f89030b58d64709b35fda72f"
>      size =3D "20G"
>      pkgs =3D [
>          # tools


--=20
Alex Benn=C3=A9e

