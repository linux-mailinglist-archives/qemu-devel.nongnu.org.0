Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FE232308B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 19:22:26 +0100 (CET)
Received: from localhost ([::1]:40608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEcKH-0004kd-T2
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 13:22:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEcIW-000411-Bo
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:20:36 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:35103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEcIS-00059C-IC
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:20:36 -0500
Received: by mail-wm1-x32e.google.com with SMTP id o16so1406082wmh.0
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 10:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=oDGGJYW7v9EdY6kw9McNArr2mqGXl00jaK58hWlFIFg=;
 b=z15AMPR+2xBdK8zi1LuXSl0YpUe2Ax3/jPOpfI0C16FX5rExXlWz5Hxf75kktNm48S
 2uOqmtPouXqeeJPSStstTPtOnKFDG5e8KfXBJSBiXkfx672M3CsPFrPqDFIvzIVLbjKr
 ZMU4FU/gLeqjI8irOYJq47mPCa8hV4vpmO1334EY+M27aNF8y8BNAOSO0pBg82FOZHQJ
 WPCel7Y/rey/t+92e9k/RdNtgrvlmpDHEGfBLmjjxgAh+4jYlmj7QcMZyTGLyERpoj/y
 UHJI5oL3tFh+MgpH+v90HMexg7JqrG+nUfs8SXfTRAiy6HP6PC4TBz5incb0EjlvP75y
 DQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=oDGGJYW7v9EdY6kw9McNArr2mqGXl00jaK58hWlFIFg=;
 b=s8dnYVKLZzjmngRW94tXASE6g3H/9BDCE8LUxeHdAyvKVAANddi89ewk8B38QeD2Q0
 xfkWJx/H5EiQPi9bKSrCLsPTvgBIwNNPuuVSNh3FdyMw4LdVqaNgwzFA5Ya6n1cEp3EH
 keVLAz6/X6d37d+P92ZVoi0FHlVG7+kk5pwlaYapgxqSwtsen/nl+kRgyaEMP08iOJpN
 YgUwOr3C7ZwJgc180fOVS3VgXJeupDwYrqmCoLEdIoGWU9CPocWBFo11hY9lRXYtyeSq
 qWVZZSL61aghCCWdYDC08WXBwtnofK9/AOMbu5u+zhEn+gRwffIJLivjWrV2dde+viy7
 rCCQ==
X-Gm-Message-State: AOAM533LViPChnxv9s2RnhEEDbidLcMt9gyD27qNrwvnsOVFQCiKyriU
 wJPrs9blNJWNbDu9l6appTlMk0rYS2kNYQ==
X-Google-Smtp-Source: ABdhPJznqNVG3I0ek0ICeF50utN75L+GGdWx+5zR8XO2ZG5plR86aQnFnYbXZb0ZiGiBQ3MLFv9FLA==
X-Received: by 2002:a1c:e383:: with SMTP id a125mr18401wmh.125.1614104430337; 
 Tue, 23 Feb 2021 10:20:30 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 36sm35138832wrj.97.2021.02.23.10.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 10:20:29 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9FC7E1FF7E;
 Tue, 23 Feb 2021 18:20:28 +0000 (GMT)
References: <20210219215838.752547-1-crosa@redhat.com>
 <20210219215838.752547-3-crosa@redhat.com> <87im6i4znx.fsf@linaro.org>
 <YDUWdeTcyf0Fwn/w@nautilus.local> <87a6ru4xs5.fsf@linaro.org>
 <20210223172340.GD987581@amachine.somewhere>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH v5 2/4] Jobs based on custom runners: build environment
 docs and playbook
Date: Tue, 23 Feb 2021 18:18:21 +0000
In-reply-to: <20210223172340.GD987581@amachine.somewhere>
Message-ID: <87y2fe3atv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Cleber Rosa <crosa@redhat.com> writes:

> On Tue, Feb 23, 2021 at 03:17:24PM +0000, Alex Benn=C3=A9e wrote:
>>=20
>> Erik Skultety <eskultet@redhat.com> writes:
>>=20
>> > On Tue, Feb 23, 2021 at 02:01:53PM +0000, Alex Benn=C3=A9e wrote:
>> >>=20
>> >> Cleber Rosa <crosa@redhat.com> writes:
>> >>=20
>> >> > To run basic jobs on custom runners, the environment needs to be
>> >> > properly set up.  The most common requirement is having the right
>> >> > packages installed.
>> >> >
>> >> > The playbook introduced here covers the QEMU's project s390x and
>> >> > aarch64 machines.  At the time this is being proposed, those machin=
es
>> >> > have already had this playbook applied to them.
>> >> >
>> >> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
>> >> > ---
>> >> >  docs/devel/ci.rst                      | 30 ++++++++++
>> >> >  scripts/ci/setup/build-environment.yml | 76 ++++++++++++++++++++++=
++++
>> >> >  scripts/ci/setup/inventory             |  1 +
>> >> >  3 files changed, 107 insertions(+)
>> >> >  create mode 100644 scripts/ci/setup/build-environment.yml
>> >> >  create mode 100644 scripts/ci/setup/inventory
>> >> >
>> >> > diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
>> >> > index 585b7bf4b8..a556558435 100644
>> >> > --- a/docs/devel/ci.rst
>> >> > +++ b/docs/devel/ci.rst
>> >> > @@ -26,3 +26,33 @@ gitlab-runner, is called a "custom runner".
>> >> >  The GitLab CI jobs definition for the custom runners are located u=
nder::
>> >> >=20=20
>> >> >    .gitlab-ci.d/custom-runners.yml
>> >> > +
>> >> > +Machine Setup Howto
>> >> > +-------------------
>> >> > +
>> >> > +For all Linux based systems, the setup can be mostly automated by =
the
>> >> > +execution of two Ansible playbooks.  Start by adding your machines=
 to
>> >> > +the ``inventory`` file under ``scripts/ci/setup``, such as this::
>> >> > +
>> >> > +  fully.qualified.domain
>> >> > +  other.machine.hostname
>> >>=20
>> >> Is this really needed? Can't the host list be passed in the command
>> >> line? I find it off to imagine users wanting to configure whole fleets
>> >> of runners.
>> >
>> > Why not support both, since the playbook execution is not wrapped by a=
nything,
>> > giving the option of using either and inventory or direct cmdline invo=
cation
>> > seems like the proper way to do it.
>>=20
>> Sure - and I dare say people used to managing fleets of servers will
>> want to do it properly but in the first instance lets provide the simple
>> command line option so a user can get up and running without also
>> ensuring files are in the correct format.
>>
>
> Like I said before, I'm strongly in favor of a more straightforward
> documentation, instead of documenting multiple ways to perform the
> same task.  I clearly believe that writing the inventory file (which
> will later be used for the second gitlab-runner playbook) is the best
> choice here.
>
> Do you think the command line approach is clearer?  Should we switch?

I think the command line is $LESS_STEPS for a user to follow but I'm
happy to defer to the inventory approach if it's more idiomatic. I'd
rather avoid uses having their pristine source trees being polluted with
local customisations they have to keep stashing or loosing.

>
> Regards,
> Cleber.


--=20
Alex Benn=C3=A9e

