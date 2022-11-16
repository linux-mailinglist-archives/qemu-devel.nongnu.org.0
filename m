Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 044B562C1BF
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 16:05:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovJyA-0006Qm-3g; Wed, 16 Nov 2022 10:04:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bakulinm@ispras.ru>)
 id 1ovJYM-0006bs-IJ
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 09:38:14 -0500
Received: from mail.ispras.ru ([83.149.199.84])
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bakulinm@ispras.ru>)
 id 1ovJYJ-00066U-OA
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 09:38:13 -0500
Received: from rainloop.ispras.ru (unknown [83.149.199.84])
 by mail.ispras.ru (Postfix) with ESMTPSA id 168B340737B8;
 Wed, 16 Nov 2022 14:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 168B340737B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1668609463;
 bh=i4Dla8TiKInV3zmj19ccUys62LAxqdQQLlmob1sOIp8=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References:From;
 b=TYDmYQq6MDKMgKcnjVhaJEwdHqlLn0d3xlOX+zwl5RtP25JOEDdc+zUJaDpc1uNOm
 qb63BTaQ8SkU9dldN3LPmlP/xakC4dOMqjwNrVt9T3C7/WRWc9Q+Ud4qSM8pDzOZAq
 5gTJDxPADCCr6aduUNdzSt+eBW1piq4NBIdzorKY=
MIME-Version: 1.0
Date: Wed, 16 Nov 2022 14:37:43 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: RainLoop/1.14.0
From: bakulinm@ispras.ru
Message-ID: <99df713da53c1f8b726a1fdb63c8473f@ispras.ru>
Subject: Re: [PATCH] tests/avocado: using several workers while testing
To: "=?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?=" <berrange@redhat.com>,
 "Pavel Dovgalyuk" <pavel.dovgalyuk@ispras.ru>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, alex.bennee@linaro.org,
 philmd@redhat.com, crosa@redhat.com, wainersm@redhat.com, bleal@redhat.com
In-Reply-To: <Y3TuYPX/RFLgbLRC@redhat.com>
References: <Y3TuYPX/RFLgbLRC@redhat.com>
 <166860649008.1258000.17066080427505400235.stgit@pasha-ThinkPad-X280>
Received-SPF: pass client-ip=83.149.199.84; envelope-from=bakulinm@ispras.ru;
 helo=mail.ispras.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 16 Nov 2022 10:04:44 -0500
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

Valid point, thank you.=0A=0AI can see three options what to do:=0A1) Ign=
ore older version of make and assume that 4.2 or newer is used (4.1 is in=
 Ubuntu 18.04 that is no longer supported as a build platform as I was to=
ld; 20.04 has 4.2). In this case make provides number of jobs in $MAKEFLA=
GS and this makes getting it trivial. In case of an older make only two o=
ptions will be available: (default) single-threaded, and using all cores.=
=0A2) Use some environment variable to provide number of jobs instead of =
-j. For example NRUNNER_MAX_JOBS=3D4 make check-avocado. I don't like thi=
s option because it is not transparent to the user who doesn't know about=
 this env_var. Maybe a message should be printed when no environment vari=
able is provided (e.g. make check-avocado -> 1 worker is used for check-a=
vocado testing. You can speed up the testing by providing desired number =
of workers with environment variable like this: NRUNNER_MAX_JOBS=3D16 mak=
e check-avocado)=0A3) A harder approach: rewrite python code from scratch=
, as you have suggested.=0A=0AWhich one should I choose?=0A=0ANovember 16=
, 2022 6:06 PM, "Daniel P. Berrang=C3=A9" <berrange@redhat.com> wrote:=0A=
=0A> On Wed, Nov 16, 2022 at 04:48:10PM +0300, Pavel Dovgalyuk wrote:=0A>=
 =0A>> From: bakulinm <bakulinm@gmail.com>=0A>> =0A>> make check-avocado =
takes a lot of time, and avocado since version 91 has=0A>> multithreaded =
mode for running several tests simultaneously.=0A>> This patch allows to =
run "make check-avocado -j" to use all cores or,=0A>> for example, "make =
check-avocado -j4" to select number of workers to use.=0A>> By default ("=
make check-avocado") only one worker is used.=0A>> =0A>> Changes:=0A>> 1)=
 Version of avocado in requirements.txt upgraded from 88.1 to <93=0A>> (L=
TS version is used, as mentioned here=0A>> https://avocado-framework.read=
thedocs.io/en/latest/releases/lts/92_0.html )=0A>> 2) Makefile 4.1 (used =
in e.g. Ubuntu 18.04) doesn't provide number of jobs=0A>> in $MAKEFLAGS, =
so python script from here=0A>> https://stackoverflow.com/a/67247743/5936=
122 is used.=0A>> =0A>> diff --git a/tests/jobs.py b/tests/jobs.py=0A>> n=
ew file mode 100644=0A>> index 0000000000..a339192d97=0A>> --- /dev/null=
=0A>> +++ b/tests/jobs.py=0A>> @@ -0,0 +1,42 @@=0A> =0A> No license infor=
mation or attribution put on this code that=0A> you've said was directly =
copied from stackoverflow. AFAICT,=0A> all content on stackoverflow is pl=
aced under the creative=0A> commons license. This is not something we wou=
ld generally=0A> want to be applied to code in QEMU as that's generally=
=0A> considered as a content license.=0A> =0A> Unless the copied code is =
trivial (this case is not), then=0A> stackoverflow should really only be =
used a learning resource,=0A> and then code written from scratch without =
copying, so it=0A> can be placed under the project's usual license.=0A> =
=0A>> +import argparse, os=0A>> +import sys=0A>> +=0A>> +def safe_int(s):=
=0A>> + try:=0A>> + return int(s)=0A>> + except:=0A>> + return -1=0A>> +=
=0A>> +class JobserverArgs:=0A>> + known_names =3D ["jobserver-fds","jobs=
erver-auth"]=0A>> + def __init__(self):=0A>> + self.fds =3D "-1,-1"=0A>> =
+=0A>> + @staticmethod=0A>> + def from_argv():=0A>> + ja =3D JobserverArg=
s()=0A>> + parser =3D argparse.ArgumentParser()=0A>> + for name in Jobser=
verArgs.known_names:=0A>> + parser.add_argument('--'+name, dest=3D"fds")=
=0A>> + parser.parse_known_args(namespace=3Dja)=0A>> + return ja=0A>> +=
=0A>> + def get_fds(self):=0A>> + return tuple([safe_int(fd) for fd in (s=
elf.fds+",").split(",")][:2])=0A>> +=0A>> +fd_in, fd_out =3D JobserverArg=
s.from_argv().get_fds()=0A>> +=0A>> +if fd_in =3D=3D -1 or fd_out =3D=3D =
-1:=0A>> +# if no jobserver is used, but -j is present, use total number =
of cpu cores=0A>> + if '-j' in sys.argv:=0A>> + print(os.cpu_count())=0A>=
> +# use single thread=0A>> + else:=0A>> + print(1)=0A>> +else:=0A>> + os=
.set_blocking(fd_in, False)=0A>> +=0A>> + tokens =3D os.read(fd_in, 1024)=
=0A>> + os.write(fd_out, tokens)=0A>> +=0A>> + print(len(tokens)+1)=0A>> =
\ No newline at end of file=0A>> diff --git a/tests/requirements.txt b/te=
sts/requirements.txt=0A>> index 0ba561b6bd..3b8c4d4706 100644=0A>> --- a/=
tests/requirements.txt=0A>> +++ b/tests/requirements.txt=0A>> @@ -2,5 +2,=
5 @@=0A>> # in the tests/venv Python virtual environment. For more info,=
=0A>> # refer to: https://pip.pypa.io/en/stable/user_guide/#id1=0A>> # No=
te that qemu.git/python/ is always implicitly installed.=0A>> -avocado-fr=
amework=3D=3D88.1=0A>> +avocado-framework<93=0A>> pycdlib=3D=3D1.11.0=0A>=
 =0A> With regards,=0A> Daniel=0A> --=0A> |: https://berrange.com -o- htt=
ps://www.flickr.com/photos/dberrange :|=0A> |: https://libvirt.org -o- ht=
tps://fstop138.berrange.com :|=0A> |: https://entangle-photo.org -o- http=
s://www.instagram.com/dberrange :|

