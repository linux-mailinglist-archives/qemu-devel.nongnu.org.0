Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B54658FE18
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 16:11:08 +0200 (CEST)
Received: from localhost ([::1]:36286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM8tv-0005cq-3p
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 10:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oM8rl-0002o6-U4
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 10:08:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oM8ri-0003tM-AK
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 10:08:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660226929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nmf1BAX9nyyHm6xwc15jNrAVTOXv3ujsu7i7yjIaFXg=;
 b=HUJuxkV80AWPX3aQ017bWCrGMV8d1cOdhBdh0QHeEGX0VSXEk44Y3f5ESZBQYip1K605Qw
 1os3e5U3ZDx0mVsSN7f5nMVoTu6vAeywweRZgH4nVoGdS/0BDjLCPZZfsjMyGuyVOsGYJW
 OC9WOXmypGGhTAmo6TFv0a6DxVrnqZ8=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-27-JfdoNqY9PfqsY946k6byIg-1; Thu, 11 Aug 2022 10:08:47 -0400
X-MC-Unique: JfdoNqY9PfqsY946k6byIg-1
Received: by mail-vs1-f70.google.com with SMTP id
 d3-20020a671d03000000b0035854b40cb5so2867324vsd.22
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 07:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=Nmf1BAX9nyyHm6xwc15jNrAVTOXv3ujsu7i7yjIaFXg=;
 b=D0Wbg+72JigRYK1l/enFqVQxwnPv9SCaykRkGpz3lGtAgBPzIt0hKpF8dt7Q9Up2pJ
 GYzOqk6e4IyfeKAHKDUIkDpSH6JYb5W7HKjbHTYXvaD583c16pdL7a/ibNDV76Xpq0Lm
 RBWA9x2JfbbZIeUwhEPNm+T8CQNFfqMa1vmIORQjtR4+FtgBCnbxX8PGFC6bi2xTR9n2
 Xcvpt6G5Z8yUlDERn37NxH1nYa57TegU8Ywul2lv/TC5PcDI3Le+ZcXOeN9SmK7XeiLG
 7FgcfjKYlheYlxs3AelHrPgyU0U4dFs++w/Nzw36qT8Hlb61mWcStwEPRDuAKFZkIpTn
 a9KQ==
X-Gm-Message-State: ACgBeo0zg/k4Rc/aV2Iszw59X3iBqzTLBSSE/MTwlGtwaDBdxeLHljuO
 25ZxyJF5nkeh3727CAHkHJIEdWIxrNPx3XN6ytkjae6qpfjgm+GYp2qsU6lKmsfFFbrkR0Xju1B
 ie6Hz0Z8mv/4kedgfnK7SVwUcQi2BjnA=
X-Received: by 2002:a67:cb14:0:b0:35a:23fd:9287 with SMTP id
 b20-20020a67cb14000000b0035a23fd9287mr14942298vsl.11.1660226927206; 
 Thu, 11 Aug 2022 07:08:47 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5bSlC+h0pRrJVa1MnMxYMZXNWA1l2VqEWRyWPWrcPbwrHi5EwNtCewbiT3WORItqZJBGtp8XVWWoNJH4HLfBU=
X-Received: by 2002:a67:cb14:0:b0:35a:23fd:9287 with SMTP id
 b20-20020a67cb14000000b0035a23fd9287mr14942279vsl.11.1660226926959; Thu, 11
 Aug 2022 07:08:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220811114315.3065951-1-alex.bennee@linaro.org>
In-Reply-To: <20220811114315.3065951-1-alex.bennee@linaro.org>
From: John Snow <jsnow@redhat.com>
Date: Thu, 11 Aug 2022 10:08:36 -0400
Message-ID: <CAFn=p-a2zUPHv-XJa3VHDPZUwnkPZ4pgS4Y53oP9T4kGZp7r5Q@mail.gmail.com>
Subject: Re: [RFC PATCH] tests/avocado: apply a band aid to aspeed-evb login
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 11, 2022 at 7:43 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
> This is really a limitation of the underlying console code which
> doesn't allow us to detect the login: and following "#" prompts
> because it reads input line wise. By adding a small delay we ensure
> that the login prompt has appeared so we don't accidentally spaff the
> shell commands to a confused getty in the guest.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: C=C3=A9dric Le Goater <clg@kaod.org>
> Cc: John Snow <jsnow@redhat.com>
> ---
>  tests/avocado/machine_aspeed.py | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspe=
ed.py
> index c54da0fd8f..65d38f4efa 100644
> --- a/tests/avocado/machine_aspeed.py
> +++ b/tests/avocado/machine_aspeed.py
> @@ -101,7 +101,9 @@ def do_test_arm_aspeed_buidroot_start(self, image, cp=
u_id):
>          self.wait_for_console_pattern('Starting kernel ...')
>          self.wait_for_console_pattern('Booting Linux on physical CPU ' +=
 cpu_id)
>          self.wait_for_console_pattern('lease of 10.0.2.15')
> +        # the line before login:
>          self.wait_for_console_pattern('Aspeed EVB')
> +        time.sleep(0.1)
>          exec_command(self, 'root')
>          time.sleep(0.1)
>
> --
> 2.30.2
>

Augh. Sorry my hunch was wrong. I wasn't aware of this problem.

Is ... this 0.1 second sleep really sufficient? I guess it's better
than not having it, and I can't reasonably ask for something more
thorough.

Acked-by: John Snow <jsnow@redhat.com>


