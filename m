Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E406631A7
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:40:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEyvb-0005Xt-8X; Mon, 09 Jan 2023 15:39:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lwhsu@freebsd.org>) id 1pEyvY-0005Xd-AP
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:39:28 -0500
Received: from mx2.freebsd.org ([2610:1c1:1:606c::19:2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lwhsu@freebsd.org>) id 1pEyvW-0008K4-1c
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:39:27 -0500
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 4NrQlt4h0Hz41bX
 for <qemu-devel@nongnu.org>; Mon,  9 Jan 2023 20:39:22 +0000 (UTC)
 (envelope-from lwhsu@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4NrQlt3qc4z4Yy9
 for <qemu-devel@nongnu.org>; Mon,  9 Jan 2023 20:39:22 +0000 (UTC)
 (envelope-from lwhsu@freebsd.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1673296762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7PygCPG4H+Ik/vFiARgbNHHdm4sgDEIgKW78CWFx6rw=;
 b=g376Ce3RdFGk85Ape1eZUbBpZD3VHX104BzqkT5Ody/0peii83+EOUJiSJ7Tp+NFertBiF
 JH47V7aX2K2qvSwcdxZdTEgT558JGnParzFBRZKqTzA6DJUiE7NUX9rdXH2dO4mI/qxbM2
 VjAhNVJ/JFRxMMPnA1Ru2FPIn7MtMuOhMY6XFZkRW6R989STIFDcFkQKKTHJ7EusyPN8vL
 cWaE+jnFjYbpHor56U2qGpECV/vCag9r035/88v1bkjgU5aIrHH/vwnbi8Ol70Yvl3J2iw
 dQuAlrew1tMLvNGp0V3egWzKKMcFiFrfscRXDcKd3hI6Ob+62dlmRbqjpLPMPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1673296762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7PygCPG4H+Ik/vFiARgbNHHdm4sgDEIgKW78CWFx6rw=;
 b=wJTknlQqM70RLqG82VdoMVJEzm/EO+VZuSDahy+UtSqZZRjYl36TY5J+021pIlOVNpLrG7
 bjvTc8hCH+iM1U1xocQEy/dwAMnqdUrGoXUxO2fDncmXjI/12b6GB2k4HIptruVhX9bXfQ
 pHQTV8g47njGWVUVxfvdz6x/jLykYIveIRCke6oy2M1IClY1tSmVu1WoI1GpQRIlKoOgQ9
 sfzzwosniQXw/mTUYGNo/3YJjrW8hRs1yvsnVB36Vq0Qo3zoWzZDRbUm3mUHjZkL7NhEHZ
 xtWsKBL5FEdM1tNY7hHYTdk8L26V2IUj2PHAhTrGTP9TIkeMaRwnF/h72tOkng==
ARC-Authentication-Results: i=1;
	mx1.freebsd.org;
	none
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1673296762; a=rsa-sha256; cv=none;
 b=dmYo/XP5quvtKGr2lMTSKEmEgqeqY6vvh1wxuVgqg0xXX80yuclUmHjkn4kkOEWgrT/O6C
 iLyG0U9tdTq9kNwYAromXCLY4SYSPq7b1U8VDzvC8DhdMmJ1UEt12TnkTRukLaM6H5e60v
 hFBvNvk5xJkQsGZrO3+RbXKVAy/GICAV/TqvVbH8n0jqwZ/AIvyF2jdvev7CWSaN2YxnmD
 Ylhrb0WkoDwBoNkwK3IKq+FYcbYrU6Rm4BoGrfX4KYbJ4XlaMguBKdvPDql/eGczAX/YJB
 TkKutHyZ5cPDyfZpRSeIkHFO1gB5pWX20jp9HSmG1yr+hujCHbrGRfDwdxCC3Q==
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: lwhsu/mail)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 4NrQlt2l9mzdpH
 for <qemu-devel@nongnu.org>; Mon,  9 Jan 2023 20:39:22 +0000 (UTC)
 (envelope-from lwhsu@freebsd.org)
Received: by mail-pf1-f180.google.com with SMTP id c26so2680869pfp.10
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:39:22 -0800 (PST)
X-Gm-Message-State: AFqh2kqnWgm+qz/llv9muvHQ4TqfDV6GtpS/9SrFY3avs0sT+ygUzPG1
 4fbLPw0Q/kczkdh1bdAGzizhM+XbXWOWnoMixkw=
X-Google-Smtp-Source: AMrXdXtxTYsIY3xCINpfeWn92Vw++PlgnaaGhkaxwyfRQ7qy9lkehSOgnOIpCeM0M0XWMpwrFtgeCQs2QRe/6XOn8/Q=
X-Received: by 2002:a63:f649:0:b0:47c:9590:7230 with SMTP id
 u9-20020a63f649000000b0047c95907230mr3551391pgj.299.1673296761026; Mon, 09
 Jan 2023 12:39:21 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA_C0orpsqaOFHc-eNXySUrDiXsi6zmcRfn3aJy-0c-KQQ@mail.gmail.com>
 <Y7xcAThWrjYCVUcv@redhat.com>
In-Reply-To: <Y7xcAThWrjYCVUcv@redhat.com>
From: Li-Wen Hsu <lwhsu@freebsd.org>
Date: Tue, 10 Jan 2023 04:39:08 +0800
X-Gmail-Original-Message-ID: <CAKBkRUwxL1fkzwpK_2FXKGE31415JRAR8N09+O_ht8CNdfVAqQ@mail.gmail.com>
Message-ID: <CAKBkRUwxL1fkzwpK_2FXKGE31415JRAR8N09+O_ht8CNdfVAqQ@mail.gmail.com>
Subject: Re: QEMU cirrus freebsd 13 CI failing with 'Undefined symbol
 "rl_set_timeout"'
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 Thomas Huth <thuth@redhat.com>, Ed Maste <emaste@freebsd.org>
Content-Type: multipart/mixed; boundary="0000000000000bcc2d05f1dac3d9"
Received-SPF: pass client-ip=2610:1c1:1:606c::19:2;
 envelope-from=lwhsu@freebsd.org; helo=mx2.freebsd.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

--0000000000000bcc2d05f1dac3d9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 10, 2023 at 2:25 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Mon, Jan 09, 2023 at 05:14:38PM +0000, Peter Maydell wrote:
> > I've just noticed that our (optional) FreeBSD 13 CI job is
> > failing while running the qemu-iotests, like this:
> >
> > +ld-elf.so.1: /usr/local/bin/bash: Undefined symbol "rl_set_timeout"
> >
> > Full job logs from a couple of sample builds:
> > https://cirrus-ci.com/task/6541458329567232
> > https://cirrus-ci.com/task/6036627739377664
> >
> > Any idea what this is about? It looks at first glance like
> > the bash on the CI system is busted because it can't find
> > libreadline, but maybe I'm missing something. Are we missing
> > some runtime shared library from a config file?
>
> Usually this kind of thing happens when FreeBSD issue a new
> minor release. The ports build will pick up a dependency on
> an API in the new release, and the ports package manager
> never checks that it is running on the current base image.
>
> In this case though, we're already running on FreeBSD 13.1,
> which is most current release, and 13.2 isn't due for at
> least 2 months. So my usual fix of updating the base image
> version won't solve this.
>
> It does feel like the ports 'bash' build is broken.

TL;DR: The workaround would be upgrading readline package or more
extensively, do a `pkg upgrade -y` before install other packages.

rl_set_timeout is in libreadline.so which is installed by readline
pacakge, and that package was pre-installed when installing other
packages needed by the GCP image, which is used for cirrus-ci.  It
seems that the readline package on image is too old and doesn't meet
the requirement of bash and caused this issue.

I can reproduce this and confirmed the workaround.  I attached a patch
and hope that it helps.

Best,
Li-Wen

--0000000000000bcc2d05f1dac3d9
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-Upgrade-all-packages-in-the-VM-to-ensure-the-freshne.patch"
Content-Disposition: attachment; 
	filename="0001-Upgrade-all-packages-in-the-VM-to-ensure-the-freshne.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lcp9nlxh0>
X-Attachment-Id: f_lcp9nlxh0

RnJvbSBkZWYxMzkyNDE3NTlkMmJjYmE3MGVkNWNjN2RmZjUyMmY0Y2I2NzUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBMaS1XZW4gSHN1IDxsd2hzdUBsd2hzdS5vcmc+CkRhdGU6IFR1
ZSwgMTAgSmFuIDIwMjMgMDQ6MzI6MDEgKzA4MDAKU3ViamVjdDogW1BBVENIXSBVcGdyYWRlIGFs
bCBwYWNrYWdlcyBpbiB0aGUgVk0gdG8gZW5zdXJlIHRoZSBmcmVzaG5lc3MKClNpZ25lZC1vZmYt
Ynk6IExpLVdlbiBIc3UgPGx3aHN1QGx3aHN1Lm9yZz4KLS0tCiAuZ2l0bGFiLWNpLmQvY2lycnVz
LnltbCB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS8uZ2l0bGFiLWNpLmQvY2lycnVzLnltbCBiLy5naXRsYWItY2ku
ZC9jaXJydXMueW1sCmluZGV4IDc4NWIxNjNhYTYuLjUwMmRmZDYxMmMgMTAwNjQ0Ci0tLSBhLy5n
aXRsYWItY2kuZC9jaXJydXMueW1sCisrKyBiLy5naXRsYWItY2kuZC9jaXJydXMueW1sCkBAIC01
Myw3ICs1Myw3IEBAIHg2NC1mcmVlYnNkLTEyLWJ1aWxkOgogICAgIENJUlJVU19WTV9JTUFHRV9O
QU1FOiBmcmVlYnNkLTEyLTQKICAgICBDSVJSVVNfVk1fQ1BVUzogOAogICAgIENJUlJVU19WTV9S
QU06IDhHCi0gICAgVVBEQVRFX0NPTU1BTkQ6IHBrZyB1cGRhdGUKKyAgICBVUERBVEVfQ09NTUFO
RDogcGtnIHVwZGF0ZTsgcGtnIHVwZ3JhZGUgLXkKICAgICBJTlNUQUxMX0NPTU1BTkQ6IHBrZyBp
bnN0YWxsIC15CiAgICAgVEVTVF9UQVJHRVRTOiBjaGVjawogCkBAIC02Niw3ICs2Niw3IEBAIHg2
NC1mcmVlYnNkLTEzLWJ1aWxkOgogICAgIENJUlJVU19WTV9JTUFHRV9OQU1FOiBmcmVlYnNkLTEz
LTEKICAgICBDSVJSVVNfVk1fQ1BVUzogOAogICAgIENJUlJVU19WTV9SQU06IDhHCi0gICAgVVBE
QVRFX0NPTU1BTkQ6IHBrZyB1cGRhdGUKKyAgICBVUERBVEVfQ09NTUFORDogcGtnIHVwZGF0ZTsg
cGtnIHVwZ3JhZGUgLXkKICAgICBJTlNUQUxMX0NPTU1BTkQ6IHBrZyBpbnN0YWxsIC15CiAgICAg
VEVTVF9UQVJHRVRTOiBjaGVjawogCi0tIAoyLjM5LjAKCg==
--0000000000000bcc2d05f1dac3d9--

