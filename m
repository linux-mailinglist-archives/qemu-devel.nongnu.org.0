Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A81621E74
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 22:20:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osW0k-000531-E5; Tue, 08 Nov 2022 16:19:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1osW0j-000510-2z
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 16:19:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1osW0h-0008LY-Dq
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 16:19:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667942394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mFr2A358K4wvwoF+JEZpSP/ZFheL81HyP78Ha2EEf1c=;
 b=Kc/wp7YpmGdCpL1Y03kAgYj4InOpJa2v/rLf5393z95EdhcVQG2wj4zwba06be3mVIQRDj
 MUSalakTaYVTm04CNSoZTbO69wy2C7nZzQz7UE+3Z5hy+kD31LfPe5xOSp4OaA0WCeVn3E
 wHVf/pcVGiobt+S41reljkzylHP1EdE=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-600-P7DX6aRwNy6yjT8yM_g0tw-1; Tue, 08 Nov 2022 16:19:53 -0500
X-MC-Unique: P7DX6aRwNy6yjT8yM_g0tw-1
Received: by mail-lj1-f200.google.com with SMTP id
 e1-20020a2e9841000000b002602ebb584fso5568009ljj.14
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 13:19:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mFr2A358K4wvwoF+JEZpSP/ZFheL81HyP78Ha2EEf1c=;
 b=xlxx5S2ybZLnYAizHmHskzGl1146qABT6LshdAqo3NdvmoZug66Ry8srnQ5/czOQo0
 NF4jJOMEEJ73/KmHLyk8KqagMMcfrB2uwkB8Q6e7cyeuc7u8DhtaGGTHnsh9ut+D0cOu
 DBbccaxSDX9gGXNvy/iFcvtAyTBGSZ1ONwA80ju372SjuDofh0RIp2u9NRiGx4ncs0je
 z4pEpUrPKdpL+IKXk603q/hUqOtk1/iJPdmcvCnwxomh7Lrp9MUD3gK8TTi2hXjK8hzw
 gftRPwQcgf5Dl329wefvgoqfUGIBfl1LewOApimYoDcjDGYwq0MFCI9C/W98XdwrxIdf
 PUXA==
X-Gm-Message-State: ACrzQf3JUIzw/bX3nNKNb5FNRZDvIVMO26I7R/1hcnTH1QnnbXuakffr
 2uroG/hWSwtdUb/utdQY6jfPJttcP6oVB6PZJCE63PmdU8qK32LDUA0v7soHupEI5PKqG+Hh44n
 Vblzbp3JTo/IgkOf1rH/cf216iHnfbAA=
X-Received: by 2002:a2e:90cd:0:b0:277:b13:2934 with SMTP id
 o13-20020a2e90cd000000b002770b132934mr19272528ljg.91.1667942391599; 
 Tue, 08 Nov 2022 13:19:51 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5QZpEQu1yzHco2A8bj4ArCuwA+GVc5DKWn4hyEv3IFzttsInKZhekx8SAz3CIszcRNDDsm9Ktaciuoseajg8Q=
X-Received: by 2002:a2e:90cd:0:b0:277:b13:2934 with SMTP id
 o13-20020a2e90cd000000b002770b132934mr19272523ljg.91.1667942391399; Tue, 08
 Nov 2022 13:19:51 -0800 (PST)
MIME-Version: 1.0
References: <20221108092308.1717426-1-alex.bennee@linaro.org>
 <20221108092308.1717426-3-alex.bennee@linaro.org>
In-Reply-To: <20221108092308.1717426-3-alex.bennee@linaro.org>
From: John Snow <jsnow@redhat.com>
Date: Tue, 8 Nov 2022 16:19:39 -0500
Message-ID: <CAFn=p-bvE2DjSua4GLd5mQoU=JBU1MpcBSVc04RAOs3EgVZPOQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/9] tests/avocado: improve behaviour waiting for login
 prompts
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com, 
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com, 
 stefanha@redhat.com, crosa@redhat.com, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

On Tue, Nov 8, 2022 at 4:26 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
> This attempts to deal with the problem of login prompts not being
> guaranteed to be terminated with a newline. The solution to this is to
> peek at the incoming data looking to see if we see an up-coming match
> before we fall back to the old readline() logic. The reason to mostly
> rely on readline is because I am occasionally seeing the peek stalling
> despite data being there.
>
> This seems kinda hacky and gross so I'm open to alternative approaches
> and cleaner python code.

Hm, yeah. I'm not too sure. I guess if it works, it works -- I don't
have better suggestions for you here. I need to rewrite a good bit of
how machine.py works, and time will tell if we still need this kind of
workaround when I do. I guess if it doesn't hurt anything, go for it.

*shrug*

>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  tests/avocado/avocado_qemu/__init__.py | 89 +++++++++++++++++++++++++-
>  1 file changed, 88 insertions(+), 1 deletion(-)
>
> diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avoca=
do_qemu/__init__.py
> index 910f3ba1ea..d6ff68e171 100644
> --- a/tests/avocado/avocado_qemu/__init__.py
> +++ b/tests/avocado/avocado_qemu/__init__.py
> @@ -131,6 +131,58 @@ def pick_default_qemu_bin(bin_prefix=3D'qemu-system-=
', arch=3DNone):
>              return path
>      return None
>
> +def _peek_ahead(console, min_match, success_message):
> +    """
> +    peek ahead in the console stream keeping an eye out for the
> +    success message.
> +
> +    Returns some message to process or None, indicating the normal
> +    readline should occur.
> +    """
> +    console_logger =3D logging.getLogger('console')
> +    peek_len =3D 0
> +    retries =3D 0
> +
> +    while True:
> +        try:
> +            old_peek_len =3D peek_len
> +            peek_ahead =3D console.peek(min_match).decode()
> +            peek_len =3D len(peek_ahead)
> +
> +            # if we get stuck too long lets just fallback to readline
> +            if peek_len <=3D old_peek_len:
> +                retries +=3D 1
> +                if retries > 10:
> +                    return None
> +
> +            # if we see a newline in the peek we can let safely bail
> +            # and let the normal readline() deal with it
> +            if peek_ahead.endswith(('\n', '\r', '\r\n')):
> +                return None
> +
> +            # if we haven't seen enough for the whole message but the
> +            # first part matches lets just loop again
> +            if len(peek_ahead) < min_match and \
> +               success_message[:peek_len] in peek_ahead:
> +                continue
> +
> +            # if we see the whole success_message we are done, consume
> +            # it and pass back so we can exit to the user
> +            if success_message in peek_ahead:
> +                return console.read(peek_len).decode()
> +
> +            # of course if we've seen enough then this line probably
> +            # doesn't contain what we are looking for, fallback
> +            if peek_len > min_match:
> +                return None
> +
> +        except UnicodeDecodeError:
> +            console_logger.log("error in decode of peek")
> +            return None
> +
> +    # we should never get here
> +    return None
> +
>
>  def _console_interaction(test, success_message, failure_message,
>                           send_string, keep_sending=3DFalse, vm=3DNone):
> @@ -139,17 +191,52 @@ def _console_interaction(test, success_message, fai=
lure_message,
>          vm =3D test.vm
>      console =3D vm.console_socket.makefile(mode=3D'rb', encoding=3D'utf-=
8')
>      console_logger =3D logging.getLogger('console')
> +
> +    # Establish the minimum number of bytes we would need to
> +    # potentially match against success_message
> +    if success_message is not None:
> +        min_match =3D len(success_message)
> +    else:
> +        min_match =3D 0
> +
> +    console_logger.debug("looking for %d:(%s), sending %s (always=3D%s)"=
,
> +                         min_match, success_message, send_string, keep_s=
ending)
> +
>      while True:
> +        msg =3D None
> +
> +        # First send our string, optionally repeating the send next
> +        # cycle.
>          if send_string:
>              vm.console_socket.sendall(send_string.encode())
>              if not keep_sending:
>                  send_string =3D None # send only once
> +
> +        # If the console has no data to read we briefly
> +        # sleep before continuing.
> +        if not console.readable():
> +            time.sleep(0.1)
> +            continue
> +
>          try:
> -            msg =3D console.readline().decode().strip()
> +
> +            # First we shall peek ahead for a potential match to cover w=
aiting
> +            # for lines without any newlines.
> +            if min_match > 0:
> +                msg =3D _peek_ahead(console, min_match, success_message)
> +
> +            # otherwise we block here for a full line
> +            if not msg:
> +                msg =3D console.readline().decode().strip()
> +
>          except UnicodeDecodeError:
> +            console_logger.debug("skipped unicode error")
>              msg =3D None
> +
> +        # if nothing came out we continue and try again
>          if not msg:
>              continue
> +
>          console_logger.debug(msg)
>          if success_message is None or success_message in msg:
>              break
> --
> 2.34.1
>
>


