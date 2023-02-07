Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC9468E1A8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 21:02:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPU9D-0002hk-8L; Tue, 07 Feb 2023 15:00:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pPU9A-0002gt-3L; Tue, 07 Feb 2023 15:00:56 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pPU96-0005Di-O4; Tue, 07 Feb 2023 15:00:54 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AB5C5336D2;
 Tue,  7 Feb 2023 20:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675800050; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z7H0ePZvWD6czqp5Zh4/0DOugvtwgL90DbE8UPtwyeA=;
 b=uKyLsLRlrOFNg5mqHGaZsxh/7axFicn1KW2sagBqBffod82+/CI708yh/sw+K8QsgkMeY7
 JphKrnyxtu8Fz+pHaKJnZfspILYXg1iN8ZcCxbs/cdOJrTPentno75SCFLzD4d07DgcNV/
 QvS4zwoVc1QwHWx6jR5HevHPX+cF3KI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675800050;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z7H0ePZvWD6czqp5Zh4/0DOugvtwgL90DbE8UPtwyeA=;
 b=zyq8Q3uaDGSOjU2bo7fVVYSTxX98Rq71NbgkJ8dpwfftMbQskj+YPQNgHkNHsye76BsSxk
 cI2fFzlWQgqQjNAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3AD9813467;
 Tue,  7 Feb 2023 20:00:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DP2qAfKt4mMoEQAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 07 Feb 2023 20:00:50 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>, QEMU Developers
 <qemu-devel@nongnu.org>
Cc: Qemu-block <qemu-block@nongnu.org>
Subject: Re: random copy-before-write iotest failure
In-Reply-To: <CAFEAcA8cHCbq64mtyG3G4VqnFe0VkmUsyQzbr1LfkAi=ZXvHyQ@mail.gmail.com>
References: <CAFEAcA8cHCbq64mtyG3G4VqnFe0VkmUsyQzbr1LfkAi=ZXvHyQ@mail.gmail.com>
Date: Tue, 07 Feb 2023 17:00:47 -0300
Message-ID: <87mt5pmej4.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

Peter Maydell <peter.maydell@linaro.org> writes:

> This is on ppc64 (big-endian), a random failure
> (it was while testing the riscv pullreq, but that doesn't touch
> any of the block stuff):
>
> 616/635 qemu:block / qemu-iotests qcow2
>            ERROR
>       101.88s   exit status 1
> =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80  =E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95
> stderr:
> --- /home/pm215/qemu/tests/qemu-iotests/tests/copy-before-write.out
> +++ /home/pm215/qemu/build/all/tests/qemu-iotests/scratch/copy-before-wri=
te/copy-before-wri
> te.out.bad
> @@ -1,5 +1,21 @@
> -....
> +..F.
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +FAIL: test_timeout_break_guest (__main__.TestCbwError.test_timeout_break=
_guest)
> +----------------------------------------------------------------------
> +Traceback (most recent call last):
> +  File "/home/pm215/qemu/tests/qemu-iotests/tests/copy-before-write",
> line 200, in test_ti
> meout_break_guest
> +    self.assertEqual(log, """\
> +AssertionError: 'wrot[90 chars])\nwrote 524288/524288 bytes at offset
> 524288\[151 chars]c)\n' !=3D 'wrot[90 chars])\nwrite failed: Connection
> timed out\nread 10[85 chars]c)\n'
> +  wrote 524288/524288 bytes at offset 0
> +  512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> ++ write failed: Connection timed out
> +- wrote 524288/524288 bytes at offset 524288
> +- 512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> +  read 1048576/1048576 bytes at offset 0
> +  1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> +
> +
>  ----------------------------------------------------------------------
>  Ran 4 tests
>
> -OK
> +FAILED (failures=3D1)
>
> thanks
> -- PMM

FWIW, I've seen that one fail on aarch64 with --enable-debug on the
configure line.

