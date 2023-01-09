Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC85663250
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 22:10:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEzOy-00009Y-S8; Mon, 09 Jan 2023 16:09:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pEzOw-00007p-Te
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 16:09:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pEzOv-0001Iu-4r
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 16:09:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673298588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xLifNH0Hexderdh3uR9MML8se/HnmzwG0dRjCe1gbBQ=;
 b=K/W1Udj9tv26gpsa0VNzmATm4Az+EhCIQYD0HzG+KUOAeiDytbSUI6zD5VMiD0JT3Jzbil
 tAimWscPNkZXhhxYA4JwDaUOfGA9Hjy3NSNdXceZ0QMUDHMFMVJTUpE/qDgjjJ/IA7BCLt
 523aIBHmcyHXv3CAQ3jUB3OSmKsgJ5M=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-373-pnlXz56DNVa7jRoZeDIMZQ-1; Mon, 09 Jan 2023 16:09:46 -0500
X-MC-Unique: pnlXz56DNVa7jRoZeDIMZQ-1
Received: by mail-lf1-f70.google.com with SMTP id
 f17-20020ac25091000000b004b565e69540so3552422lfm.12
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 13:09:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xLifNH0Hexderdh3uR9MML8se/HnmzwG0dRjCe1gbBQ=;
 b=Ik5yO39jaX5AXXwHISLjjhA6KrIueYCXVaYtSDaDdI1Yh4jGgYKi/wqMy5YtYUpwoU
 OD33QyEtR2GORyfA+L2PKpnfQ+9HFL0b6DeGIVfx2nqDEX69qPZUO1LTmNWRvyhCfQ2j
 RVlxH+XtwuCP6beUtbgjC8kMpaLeutBNcW1aEVIQINVz6TkFRZsEAzS9TWIKspL6ogNT
 7XuXEqCTJA3ApPUmAX6HXffOr4diT5M520MP6BaIKGuO2/Q+RvFQmlDA+pPLrMFYiABU
 azBiQ+C7rJh9p3yfOJpIHI3FkB1SSWfbtlYnj2S3Iguq9Mfqp+XYz4TftcQ61UbV+1I2
 fKUw==
X-Gm-Message-State: AFqh2kqnXI/tsNs/0EMsdX0QJFYEIJNC5RwmAVEGj6HPoiHgL+zIiHOC
 YxJq5powYVWYi5SnjnvzXo2k9F04MYZ8Q0rQtVaqhchGyucSosN71F3DuG0N36T5hfiOCkwYPxq
 kPxjelyuuCQ3UNFYf9blA+y5NeP+u5PY=
X-Received: by 2002:a05:651c:1028:b0:282:9ddb:546e with SMTP id
 w8-20020a05651c102800b002829ddb546emr633243ljm.6.1673298585158; 
 Mon, 09 Jan 2023 13:09:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXto8CFt9v/xjd7Oe1nphnlienUWt+lXlEwg0oRsN37ATRHy7bDPuK/kj23Kad5kaSkkPmpccEgR501QNzAFOHo=
X-Received: by 2002:a05:651c:1028:b0:282:9ddb:546e with SMTP id
 w8-20020a05651c102800b002829ddb546emr633237ljm.6.1673298584922; Mon, 09 Jan
 2023 13:09:44 -0800 (PST)
MIME-Version: 1.0
References: <20220722182508.89761-1-peter@pjd.dev>
 <20220722182508.89761-2-peter@pjd.dev>
 <Yt5dHNDMMrzp/Vah@redhat.com>
In-Reply-To: <Yt5dHNDMMrzp/Vah@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 9 Jan 2023 16:09:32 -0500
Message-ID: <CAFn=p-by++_fpn8cxAE27UvAz0fNmsH=67MR6LTYXf1j_W4Msw@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] python/machine: Fix AF_UNIX path too long on macOS
To: Peter Delevoryas <peter@pjd.dev>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 crosa@redhat.com, bleal@redhat.com, f4bug@amsat.org, wainersm@redhat.com, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Mon, Jul 25, 2022 at 5:06 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Fri, Jul 22, 2022 at 11:25:08AM -0700, Peter Delevoryas wrote:
> > On macOS, private $TMPDIR's are the default. These $TMPDIR's are
> > generated from a user's unix UID and UUID [1], which can create a
> > relatively long path:
> >
> >     /var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/
> >
> > QEMU's avocado tests create a temporary directory prefixed by
> > "avo_qemu_sock_", and create QMP sockets within _that_ as well.
> > The QMP socket is unnecessarily long, because a temporary directory
> > is created for every QEMUMachine object.
> >
> >     /avo_qemu_sock_uh3w_dgc/qemu-37331-10bacf110-monitor.sock
> >
> > The path limit for unix sockets on macOS is 104: [2]
> >
> >     /*
> >      * [XSI] Definitions for UNIX IPC domain.
> >      */
> >     struct  sockaddr_un {
> >         unsigned char   sun_len;        /* sockaddr len including null =
*/
> >         sa_family_t     sun_family;     /* [XSI] AF_UNIX */
> >         char            sun_path[104];  /* [XSI] path name (gag) */
> >     };
> >
> > This results in avocado tests failing on macOS because the QMP unix
> > socket can't be created, because the path is too long:
> >
> >     ERROR| Failed to establish connection: OSError: AF_UNIX path too lo=
ng
> >
> > This change resolves by reducing the size of the socket directory prefi=
x
> > and the suffix on the QMP and console socket names.
> >
> > The result is paths like this:
> >
> >     pdel@pdel-mbp:/var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T
> >     $ tree qemu*
> >     qemu_df4evjeq
> >     qemu_jbxel3gy
> >     qemu_ml9s_gg7
> >     qemu_oc7h7f3u
> >     qemu_oqb1yf97
> >     =E2=94=9C=E2=94=80=E2=94=80 10a004050.con
> >     =E2=94=94=E2=94=80=E2=94=80 10a004050.qmp
> >
> > [1] https://apple.stackexchange.com/questions/353832/why-is-mac-osx-tem=
p-directory-in-weird-path
> > [2] /Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include=
/sys/un.h
> >
> > Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> > ---
> >  python/qemu/machine/machine.py         | 6 +++---
> >  tests/avocado/avocado_qemu/__init__.py | 2 +-
> >  2 files changed, 4 insertions(+), 4 deletions(-)
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

My apologies, I missed this update because it appeared in a thread
underneath the old version.

Peter, may I please ask for you to kindly re-submit this patch with an
incremented version number?

--js


