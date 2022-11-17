Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFBA62DDDF
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 15:22:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovfm1-0004hu-ID; Thu, 17 Nov 2022 09:21:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ovflp-0004gz-5o
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 09:21:40 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ovflm-00024u-Pg
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 09:21:36 -0500
Received: by mail-wr1-x42a.google.com with SMTP id d9so4063579wrm.13
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 06:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R9/oLhaDdfTSr4h7QqG0xgdOKlLXwDZuLsIbO4wEv8g=;
 b=aq5i8oGBSABsMuJwu8983xDDPsbOXd5KhvZM8kJQKczJ+9w7SAfld3+3uOyVO1MXqw
 XenRbRDe8CJXnrYGaFAEUiYcYfR0uovQ4HoP1X4ZIKImMnfq1XxFQhv3u+o/kEzG+9fK
 TtlmKu8yG2U0tyGU7RQCDbVojLAZiRlWYlSKuuH7Ce7OgHe5cTU7Px8Imx309TSWz0oc
 VzpYEup3N9bcMJDuyOweMkgEFQWsadI+EBu112UKyUNmElyXda6KwMfFEN+DXH/CuV9i
 P0/roR6e7/HqV3IWjbLyXo4WAPHmnTDPWN4qXrJ9qDKvzlkw8qi6jG/tl67KKbSs8agU
 rVfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=R9/oLhaDdfTSr4h7QqG0xgdOKlLXwDZuLsIbO4wEv8g=;
 b=ecuIqEgqK2qZIiZJwxuc8669BiS+0x3mHQmSSvg3tLGnHYDa0Lxb3cTa3Jq16ajWmF
 IpAf7lJmE7HVxubl5j4H7/Qn1+8VJQCrLiVnXJG+aiqcPm9Uw3OTpkWru8Y8esg9bxP4
 VoXAwh054t/pQCEOOeu+QEIDGwiuL+Av4cIdESa+X2BCarP3B8C72zWBmHDYOT6a7CDx
 gtcTN9t6OmCXdrDtQJzm/szPdVAMwp6d9pwC1qlbiZieUEzXmaOSWvfYzGFmVbxlwwJi
 GE9Txw8JIpLTNpRNkzwq9FLwScjPmwtLYKMb3KZ+mXNGbIGUj8RUMEoqf+imsDPv0AZC
 TmYw==
X-Gm-Message-State: ANoB5pmOeaIXi/nj1o0BH0ptfv2rTZlcO/0oCSfGW9ea4puiFClJeQ3g
 HLaNUa5R49PyEj5GJ4QAYJhlAg==
X-Google-Smtp-Source: AA0mqf6tCCwFke7Wlwcm0QNHmM/SA5vWHoYERk7jlRKUfkXQWdJY9uhyC1Mz4xIbZ4MxCMd4hnL8jA==
X-Received: by 2002:adf:dd81:0:b0:236:88a2:f072 with SMTP id
 x1-20020adfdd81000000b0023688a2f072mr1618757wrl.516.1668694891669; 
 Thu, 17 Nov 2022 06:21:31 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j18-20020a05600c191200b003c83465ccbfsm6568141wmq.35.2022.11.17.06.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 06:21:31 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CC9531FFB7;
 Thu, 17 Nov 2022 14:21:30 +0000 (GMT)
References: <20221111145529.4020801-1-alex.bennee@linaro.org>
 <20221111145529.4020801-3-alex.bennee@linaro.org>
 <33e63f5c-8a32-8093-6ce8-2641d0d8e325@kaod.org>
User-agent: mu4e 1.9.2; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com,
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH v2 02/12] tests/avocado: improve behaviour waiting for
 login prompts
Date: Thu, 17 Nov 2022 14:04:29 +0000
In-reply-to: <33e63f5c-8a32-8093-6ce8-2641d0d8e325@kaod.org>
Message-ID: <87edu18xw5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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


C=C3=A9dric Le Goater <clg@kaod.org> writes:

> Hello Alex,
>
> On 11/11/22 15:55, Alex Benn=C3=A9e wrote:
>> This attempts to deal with the problem of login prompts not being
>> guaranteed to be terminated with a newline. The solution to this is to
>> peek at the incoming data looking to see if we see an up-coming match
>> before we fall back to the old readline() logic. The reason to mostly
>> rely on readline is because I am occasionally seeing the peek stalling
>> despite data being there.
>> This seems kinda hacky and gross so I'm open to alternative
>> approaches
>> and cleaner python code.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
> I have pulled this patch in the aspeed tree hoping it would improve tests:
>
>   AST2x00MachineSDK.test_arm_ast2500_evb_sdk
>   AST2x00MachineSDK.test_arm_ast2600_evb_sdk
>
> but the failure rate has increased :/ I have seen failures in these also :
>
>   AST2x00Machine.test_arm_ast2500_evb_buildroot
>   AST2x00Machine.test_arm_ast2600_evb_buildroot
>
> which used to be quite stable.
>
> Sorry, this is not of much help. the issue might be elsewhere.

Do you see what is happening in the logs? I've made a couple of tweaks
since and it gets through the negotiation but then timesout:

  console: looking for 22:(ast2600-default login:), sending None (always=3D=
False)
  /console: [    0.939039] aspeed-pcie 1e7700c0.pcie: [1] : tx idle timeout=
 [0]
  -console: [    1.385144] spi-nor spi0.1: unrecognized JEDEC id bytes: 00 =
00 00 00 00 00
  console: [    1.413028] spi-nor spi2.0: unrecognized JEDEC id bytes: 00 0=
0 00 00 00 00=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  console: [    1.617539] aspeed-rtc 1e781000.rtc: hctosys: unable to read =
the hardware clock
  -console: rofs =3D mtd4 squashfs rwfs =3D mtd5 jffs2
  /console: [   14.563495] systemd[1]: Failed to find module 'autofs4'=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  -console: [   18.034371] systemd[176]: /lib/systemd/system-generators/sys=
temd-gpt-auto-generator failed with exit status 1.
  |console: [FAILED] Failed to start Intel Power Control for the Host 0.
  /console: [FAILED] Failed to start Phosphor C=E2=80=A6istening on device =
/dev/ttyS2.
  console: [DEPEND] Dependency failed for Host logger for ttyS2.
  -console: Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro) no=
distro.0 ast2600-default ttyS4
  console: ast2600-default login:
   (always=3DFalse)g for 9:(Password:), sending root
  console: root
  |console: Password:
   (always=3DFalse)g for 23:(root@ast2600-default:~#), sending 0penBmc
  console: Login timed out after 60 seconds.
  |console: Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro) no=
distro.0 ast2600-default ttyS4
  /avocado.test:

>
> Thanks for the time you spend on this.
>
> C.
>
>
>> ---
>> v2
>>    - remove superfluous /r/n
>> ---
>>   tests/avocado/avocado_qemu/__init__.py | 89 +++++++++++++++++++++++++-
>>   1 file changed, 88 insertions(+), 1 deletion(-)
>> diff --git a/tests/avocado/avocado_qemu/__init__.py
>> b/tests/avocado/avocado_qemu/__init__.py
>> index 910f3ba1ea..20cba57161 100644
>> --- a/tests/avocado/avocado_qemu/__init__.py
>> +++ b/tests/avocado/avocado_qemu/__init__.py
>> @@ -131,6 +131,58 @@ def pick_default_qemu_bin(bin_prefix=3D'qemu-system=
-', arch=3DNone):
>>               return path
>>       return None
>>   +def _peek_ahead(console, min_match, success_message):
>> +    """
>> +    peek ahead in the console stream keeping an eye out for the
>> +    success message.
>> +
>> +    Returns some message to process or None, indicating the normal
>> +    readline should occur.
>> +    """
>> +    console_logger =3D logging.getLogger('console')
>> +    peek_len =3D 0
>> +    retries =3D 0
>> +
>> +    while True:
>> +        try:
>> +            old_peek_len =3D peek_len
>> +            peek_ahead =3D console.peek(min_match).decode()
>> +            peek_len =3D len(peek_ahead)
>> +
>> +            # if we get stuck too long lets just fallback to readline
>> +            if peek_len <=3D old_peek_len:
>> +                retries +=3D 1
>> +                if retries > 10:
>> +                    return None
>> +
>> +            # if we see a newline in the peek we can let safely bail
>> +            # and let the normal readline() deal with it
>> +            if peek_ahead.endswith(('\n', '\r')):
>> +                return None
>> +
>> +            # if we haven't seen enough for the whole message but the
>> +            # first part matches lets just loop again
>> +            if len(peek_ahead) < min_match and \
>> +               success_message[:peek_len] in peek_ahead:
>> +                continue
>> +
>> +            # if we see the whole success_message we are done, consume
>> +            # it and pass back so we can exit to the user
>> +            if success_message in peek_ahead:
>> +                return console.read(peek_len).decode()
>> +
>> +            # of course if we've seen enough then this line probably
>> +            # doesn't contain what we are looking for, fallback
>> +            if peek_len > min_match:
>> +                return None
>> +
>> +        except UnicodeDecodeError:
>> +            console_logger.log("error in decode of peek")
>> +            return None
>> +
>> +    # we should never get here
>> +    return None
>> +
>>     def _console_interaction(test, success_message, failure_message,
>>                            send_string, keep_sending=3DFalse, vm=3DNone):
>> @@ -139,17 +191,52 @@ def _console_interaction(test, success_message, fa=
ilure_message,
>>           vm =3D test.vm
>>       console =3D vm.console_socket.makefile(mode=3D'rb', encoding=3D'ut=
f-8')
>>       console_logger =3D logging.getLogger('console')
>> +
>> +    # Establish the minimum number of bytes we would need to
>> +    # potentially match against success_message
>> +    if success_message is not None:
>> +        min_match =3D len(success_message)
>> +    else:
>> +        min_match =3D 0
>> +
>> +    console_logger.debug("looking for %d:(%s), sending %s (always=3D%s)=
",
>> +                         min_match, success_message, send_string, keep_=
sending)
>> +
>>       while True:
>> +        msg =3D None
>> +
>> +        # First send our string, optionally repeating the send next
>> +        # cycle.
>>           if send_string:
>>               vm.console_socket.sendall(send_string.encode())
>>               if not keep_sending:
>>                   send_string =3D None # send only once
>> +
>> +        # If the console has no data to read we briefly
>> +        # sleep before continuing.
>> +        if not console.readable():
>> +            time.sleep(0.1)
>> +            continue
>> +
>>           try:
>> -            msg =3D console.readline().decode().strip()
>> +
>> +            # First we shall peek ahead for a potential match to cover =
waiting
>> +            # for lines without any newlines.
>> +            if min_match > 0:
>> +                msg =3D _peek_ahead(console, min_match, success_message)
>> +
>> +            # otherwise we block here for a full line
>> +            if not msg:
>> +                msg =3D console.readline().decode().strip()
>> +
>>           except UnicodeDecodeError:
>> +            console_logger.debug("skipped unicode error")
>>               msg =3D None
>> +
>> +        # if nothing came out we continue and try again
>>           if not msg:
>>               continue
>> +
>>           console_logger.debug(msg)
>>           if success_message is None or success_message in msg:
>>               break


--=20
Alex Benn=C3=A9e

