Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FCC2F5F1B
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 11:44:15 +0100 (CET)
Received: from localhost ([::1]:56806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l006w-0007RM-F0
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 05:44:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0050-0006mc-TD
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 05:42:14 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:35771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l004y-0002NW-LF
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 05:42:14 -0500
Received: by mail-wr1-x436.google.com with SMTP id l12so12659wry.2
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 02:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=DaoiK+mC33O8fGIJOnn7X8bDMh7iT5LTMA1Noz0OJ6w=;
 b=taZbd7I2j39toDaknJptfjs86WrL1swnU2N2hLpXv8dLBZ0275RB6Nq801D4qB92Es
 5M+PFSJStMLLH+pH4Dbpt94JzBhqAVxIn4cR8c1k+HjwjJLXLufcTRZ//GKs0L3jdwH7
 qcsDh4EzJKQP8ZblfS9OsgQBuaXKorQUO1uOzSmncqmHykxJVaON0PXDWRM3xzyqMUDE
 WGSxGfY+c3I7WViyhGSFS4K1zcx/I+5gXfp1X3HcV99zwnVfQosKJlmeBBnD5U3a8VRI
 BNcDB0GkNW4XU3sOEVPRSooKVLeDow+/vYCQO2eIpjVtKyQ5KwzGhfv/dXz9+ZiXsvW/
 2FEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=DaoiK+mC33O8fGIJOnn7X8bDMh7iT5LTMA1Noz0OJ6w=;
 b=ciQVn5sefEc1iu81jNT0FopLaOSTK9t1C3NTl3ZYLcIKFVFza6W8E5EupAoDlfAUo9
 kzCE+aQVM66OlLKQzW/eC5XCd49xKfcbXgQUxYCaMW5+x9XKATCLJEqi2wO1T8LonQ7X
 oTyym+WzX7Dc1iG2gLRYm9DgXID0rY2t4TqFzYwIMPQt4n6QOZxfqBCGjMsAdvQEgJBa
 UE2mPmhlZe8cq1FLlvo9qFAps8dHvc0uXm79Ka+k6oNmEoWacWbBDEL6Ofy4aNsXie2+
 /Li1TilBgVKCICOekqdfpE2htHQ9DG8lmcKMgGE5MLcNH6cj362epoTiyhIgZwa8DVqX
 qmew==
X-Gm-Message-State: AOAM532dEHriuit+I0X71dOQZBVtCj90huQ3j2Ysc4KlioPIvDnGjdK5
 Ea5AwOajKQUVHUb7dLDRcZlAWRUU2paJbQ==
X-Google-Smtp-Source: ABdhPJy/NR5ZBT/5nQxRa9QyxnlPEI6NIGq0qc/9wfQtxjy2k5BrzRRg419ck5RS1CTSuYAbo4XFHw==
X-Received: by 2002:adf:a201:: with SMTP id p1mr7176842wra.65.1610620930115;
 Thu, 14 Jan 2021 02:42:10 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w21sm7225502wmi.45.2021.01.14.02.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 02:42:08 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1B6341FF7E;
 Thu, 14 Jan 2021 10:42:08 +0000 (GMT)
References: <20210113195238.140945-1-wainersm@redhat.com>
 <d79dad7f-ba62-a79a-3a51-394c8314935f@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] docs/devel: Explain how acceptance tests can be skipped
Date: Thu, 14 Jan 2021 10:30:41 +0000
In-reply-to: <d79dad7f-ba62-a79a-3a51-394c8314935f@redhat.com>
Message-ID: <87turjlrzz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: wrampazz@redhat.com, philmd@redhat.com, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> On 13/01/2021 20.52, Wainer dos Santos Moschetta wrote:
>> Documented under the "Acceptance tests using the Avocado Framework"
>> section in testing.rst how environment variables are used to skip tests.
>>=20
>> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>> ---
>> CI (success): https://gitlab.com/wainersm/qemu/-/pipelines/241249714
>>=20
>>   docs/devel/testing.rst | 62 ++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 62 insertions(+)
>>=20
>> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
>> index 0aa7a13bba..3cdb458565 100644
>> --- a/docs/devel/testing.rst
>> +++ b/docs/devel/testing.rst
>> @@ -871,6 +871,68 @@ qemu_bin
>>=20=20=20
>>   The exact QEMU binary to be used on QEMUMachine.
>>=20=20=20
>> +Skipping tests
>> +--------------
>> +The Avocado framework provides Python decorators which allow for easily=
 skip
>> +tests running under certain conditions. For example, on the lack of a b=
inary
>> +on the test system or when the running environment is an CI system. For=
 further
>
> s/is an CI/is a CI/
>
>> +information about those decorators, please refer to::
>> +
>> +  https://avocado-framework.readthedocs.io/en/latest/guides/writer/chap=
ters/writing.html#skipping-tests
>> +
>> +While the conditions for skipping tests are often specifics of each one=
, there
>> +are recurring scenarios identified by the QEMU developers and the use of
>> +environment variables became a kind of standard way to enable/disable t=
ests.
>> +
>> +It follows a not comprehensive list of those variables.
>
> s/It follows a/Here is a/ ?

There now follows a non-comprehensive list of those variables:

?

I'm not sure if that is idiomatic international English or just British
English - it's usually a phrase that precedes our party political
broadcasts on TV ;-)

>
>> +AVOCADO_ALLOW_LARGE_STORAGE
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +Tests which are going to fetch or produce assets considered *large* are=
 not
>> +going to run unless that `AVOCADO_ALLOW_LARGE_STORAGE=3D1` is exported =
on
>> +the environment.
>> +
>> +The definition of *large* is a bit arbitrary here, but it usually means=
 an
>> +asset which occupies at least 1GB of size on disk when uncompressed.
>> +
>> +AVOCADO_ALLOW_UNTRUSTED_CODE
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +There are tests which will boot a kernel image or firmware that can be
>> +considered not safe to run on the developer's workstation, thus they are
>> +skipped by default. The definition of *not safe* is also arbitrary but
>> +usually it means a blob which either its source or build process aren't
>> +public available.
>> +
>> +You should export `AVOCADO_ALLOW_UNTRUSTED_CODE=3D1` on the environment=
 in
>> +order to allow tests which make use of those assets to get running.
>
> maybe better: "... which make use of those kind of assets." ?
>
>> +AVOCADO_TIMEOUT_EXPECTED
>> +~~~~~~~~~~~~~~~~~~~~~~~~
>> +The Avocado framework has a timeout mechanism which interrupt tests to =
avoid the
>
> s/interrupt/interrupts/
>
>> +test suite of getting stuck. The timeout value can be set via test para=
meter or
>> +property defined in the test class, for further details::
>> +
>> +  https://avocado-framework.readthedocs.io/en/latest/guides/writer/chap=
ters/writing.html#setting-a-test-timeout
>> +
>> +Even though the timeout can be set by the test developer, there are som=
e tests
>> +that may not have a well-defined limit of time to finish under certain
>> +conditions. For example, tests that take longer to execute when QEMU is
>> +compiled with debug flags. Therefore, the `AVOCADO_TIMEOUT_EXPECTED` va=
riable
>> +has been used to determine whether those tests should run or not.
>> +
>> +GITLAB_CI
>> +~~~~~~~~~
>> +A number of tests are flagged to not run on the GitLab CI. Usually beca=
use
>> +they proved to the flaky or there are constraints on the CI environment=
 which
>> +would make them fail. If you encounter a similar situation then use that
>> +variable as shown on the code snippet below to skip the test:
>> +
>> +.. code::
>> +
>> +  @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
>> +  def test(self):
>> +      do_something()
>> +
>>   Uninstalling Avocado
>>   --------------------
>>=20=20=20
>
>   Thomas


--=20
Alex Benn=C3=A9e

