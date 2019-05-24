Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C85E02964E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 May 2019 12:48:51 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52308 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hU7kp-0002H5-10
	for lists+qemu-devel@lfdr.de; Fri, 24 May 2019 06:48:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hU7iq-00019l-LM
	for qemu-devel@nongnu.org; Fri, 24 May 2019 06:46:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hU7ip-0003Ca-L0
	for qemu-devel@nongnu.org; Fri, 24 May 2019 06:46:48 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:33095)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hU7io-0003B3-HE
	for qemu-devel@nongnu.org; Fri, 24 May 2019 06:46:47 -0400
Received: by mail-wm1-x343.google.com with SMTP id v19so912757wmh.0
	for <qemu-devel@nongnu.org>; Fri, 24 May 2019 03:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=xOwRLH+tn7mL79FwtNrSYoboYLgchp+WyGGgYXxNA/A=;
	b=nlt6DPNV1EU422b/182j+fWzNaYdvs5Dod8hPspfbpU6+cEbJh2XIHlz0LgLRcDmQE
	w8b95SgKo5CUatXsm3863AFWuOEQQ1if3PU3Yar45HOwraXt64xxZK/0nr37PuMmlLB6
	1f+DAKttgreCh/WQgj5gTeAxq89x3YyeMer/TAZpIqKIduCO0NB0mATpHwsYJbH6G+ly
	DcnQImi2r+xPLddodXUnxThcjAUZTIfYle4zOib3uxYpFtlLsUh1r1YobWzKEaQuGwX+
	vLDuEpuZHgF0suS2w2QCC6j2m3oXTsoLEDBt/ECqTM75HyhnQcY6m7Q+GKp5O/rAU+39
	F+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=xOwRLH+tn7mL79FwtNrSYoboYLgchp+WyGGgYXxNA/A=;
	b=qvHwYkfGB1jHlIhKvc6BUtpahSxOUS/xnF58cTvUXkRXk6Y8LyRZK8y/sHjTCM0hG6
	9MNU3gilmNMmlmPNCk9btmZqnM18EenECtYL8GpPdIcuwKhjj00WWpSTeq0gxAEKqJBF
	TNtboacZgEdOocxkl2dtVG18EQGNc+1KfbJV20QKWL2doJAl+vk1bzBxeYPW8REEAvnY
	MKUE51T/SSsIW34WWquSzdbIAEvnTgI4jEiHaDG8Pfzjl2v/usJR5u1Q9xFdAWPTe1SQ
	PE2/TJhzU0DzaRNEr3+9Rhy4Nch9yIxt60zm5MJjDPHmrE/J68coIvevhJt+j/fz2cnm
	n7dQ==
X-Gm-Message-State: APjAAAW3nxdIN95rFFyUgLdY3AhKYSbS0zDxkcYW6DY6UZfBEiMiPPFe
	PpKsdTWvLsVBSu4R00FlBp9dFQ==
X-Google-Smtp-Source: APXvYqzVyS9ySGdNpcP92a0AKOrUBYHB7jZGcVWJVJ8+r3Yje5z7JNMnk142fn6qEDKPLqKkEbkRpw==
X-Received: by 2002:a1c:bb84:: with SMTP id l126mr15283178wmf.92.1558694804639;
	Fri, 24 May 2019 03:46:44 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id d3sm860552wrs.8.2019.05.24.03.46.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 24 May 2019 03:46:43 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7DAF51FF87;
	Fri, 24 May 2019 11:46:43 +0100 (BST)
References: <20190523102532.10486-1-alex.bennee@linaro.org>
	<20190523102532.10486-4-alex.bennee@linaro.org>
	<CAFEAcA_+=7VfvZRc__q9L3vuHO6YgetrjTPAYJx4eo0mAdcPXg@mail.gmail.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
In-reply-to: <CAFEAcA_+=7VfvZRc__q9L3vuHO6YgetrjTPAYJx4eo0mAdcPXg@mail.gmail.com>
Date: Fri, 24 May 2019 11:46:43 +0100
Message-ID: <877eag165o.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: Re: [Qemu-devel] [PATCH v2 03/28] semihosting: implement a
 semihosting console
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 23 May 2019 at 11:39, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> This provides two functions for handling console output that handle
>> the common backend behaviour for semihosting.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
>> diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
>> index 08363969c14..b2963547c48 100644
>> --- a/include/exec/gdbstub.h
>> +++ b/include/exec/gdbstub.h
>> @@ -44,6 +44,17 @@ void gdb_do_syscall(gdb_syscall_complete_cb cb, const=
 char *fmt, ...);
>>   * argument list.
>>   */
>>  void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_li=
st va);
>> +/**
>> + * gdb_do_console_out:
>> + * @gs: guest address of string to send
>> + * @len: length of string
>> + *
>> + * Sends a string to gdb console. Unlike the system call interface
>> + * there is no callback and we assume the system call always
>> + * succeeds.
>> + */
>> +void gdb_do_console_out(target_ulong s, int len);
>
> I'm not sure about the "no callback" part of this API. The operation
> here is genuinely asynchronous and providing no mechanism for the
> caller to be able to say "ok, now wait til it completes" doesn't
> seem like a good plan.

Well the caller doesn't really get a choice. At least in system mode
gdbstub does a vm_stop(RUN_STATE_DEBUG) and brings everything to a halt
anyway. All we've removed is the ability to tack on a callback (which
can get run in all sorts of contexts) when we restart.

I could just drop the API here and allow the semihosting API to call
gdb_do_syscallv directly?

--
Alex Benn=C3=A9e

