Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA6D46A905
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 22:03:18 +0100 (CET)
Received: from localhost ([::1]:57738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muL8n-0003d4-2J
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 16:03:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1muL6t-0002Hn-TQ
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 16:01:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1muL6o-00059A-2C
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 16:01:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638824473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VOYO6sVekljybIIG/uW4LON4+aq9A+PVKM61GbwgETk=;
 b=A5VWa7CTKTOpaBBcLf0DatxJ72jNtUen0/5ShRwRc3SGeF9t/D4+iCOkGGzyLZHB//WKGN
 fSa9nlSoeKCdY8y2y6/nL5okels/sq9gys3d53Cb99rfVwAUpQBAS2I7v4tskk4drs8UVQ
 GlgD2eJncCsjMkbx6fwuUOy95gZ6p7Q=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-Ji3SlYlxMlO5gT34XQrbzg-1; Mon, 06 Dec 2021 16:01:09 -0500
X-MC-Unique: Ji3SlYlxMlO5gT34XQrbzg-1
Received: by mail-ua1-f71.google.com with SMTP id
 47-20020a9f2632000000b002cefe955beeso6752049uag.9
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 13:01:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VOYO6sVekljybIIG/uW4LON4+aq9A+PVKM61GbwgETk=;
 b=3JItwX3l/JJgUHrOaivlRAmcbNwFrBOfg+G957sJt9j/Tl16608wYUwaR+IN/NSER3
 Hl2/FAnTkfPCAfQ/5RvEkOQ0xA1WxTE0TyK2wlscCrBT7I/ID5Vs7FNqe6zFQZ0QVj8s
 8/JG9RqUYdY7hm/tjhyRmsjUduyRDhV/NH6O2RQfumV4IXhNwqAPrsIR33qz/J3axWIx
 ADbqPmrkReZxtNvb+77eZs0jw1GBO0OVVcObP52FZ89vLJWxX/PqdLuJgi6eanx1251w
 f8b0u7yr/iPE6mqo+yIpFvnrl/Xy92PzPck65YiDPwysZxNtihHy4no3ygsu2rrM+Dgi
 iXwQ==
X-Gm-Message-State: AOAM531c5p5UagiSZJ2+v7k6vAn76pS56+B9niuropsVKsZSRFJyfDWj
 I/gDqBoD/KcaWaRCxYeDlQDxI93CzGp8VMuh9RfaapYNWbt736/OMsiMAifVmZfATHhHTNLLf6V
 WqSOBAsNmu7Dp+UQnqw0Cl4HzbO9RCm0=
X-Received: by 2002:a05:6122:790:: with SMTP id
 k16mr45056913vkr.26.1638824468082; 
 Mon, 06 Dec 2021 13:01:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywE4nhnzsHkePp3/nGgjnatruwcllnZfOQ/q6NgVZ7gtTxYYbNnszxp16FMRC3HW0SW9Jfpi7grYZR4yCOH+4=
X-Received: by 2002:a05:6122:790:: with SMTP id
 k16mr45056866vkr.26.1638824467777; 
 Mon, 06 Dec 2021 13:01:07 -0800 (PST)
MIME-Version: 1.0
References: <20211203122223.2780098-1-vsementsov@virtuozzo.com>
 <20211203122223.2780098-4-vsementsov@virtuozzo.com>
 <CAFn=p-YFHGbfbwXjKYGK0ypiec+-EkdF+raQKkvPqf536gbJ2w@mail.gmail.com>
 <4e2a9e2c-0189-1e0f-7d99-94425796b6b8@virtuozzo.com>
In-Reply-To: <4e2a9e2c-0189-1e0f-7d99-94425796b6b8@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 6 Dec 2021 16:00:56 -0500
Message-ID: <CAFn=p-YeKAsMm=ODB0tOcT7AJW0nD2xv4wGofBQ2G0=23eu3QA@mail.gmail.com>
Subject: Re: [PATCH 3/3] iotests: check: multiprocessing support
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000040675b05d2808eee"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, den@openvz.org,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000040675b05d2808eee
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 6, 2021 at 3:20 PM Vladimir Sementsov-Ogievskiy <
vsementsov@virtuozzo.com> wrote:

> 06.12.2021 21:35, John Snow wrote:
> >
> >
> > On Fri, Dec 3, 2021 at 7:22 AM Vladimir Sementsov-Ogievskiy <
> vsementsov@virtuozzo.com <mailto:vsementsov@virtuozzo.com>> wrote:
> >
> >     Add -j <JOBS> parameter, to run tests in several jobs simultaneously.
> >     For realization - simply utilize multiprocessing.Pool class.
> >
> >     Notes:
> >
> >     1. Of course, tests can't run simultaneously in same TEST_DIR. So,
> >         use subdirectories TEST_DIR/testname/ and SOCK_DIR/testname/
> >         instead of simply TEST_DIR and SOCK_DIR
> >
> >
> > SOCK_DIR was introduced because TEST_DIR was getting too long, and the
> length of the filepath was causing problems on some platforms. I hope that
> we aren't pushing our luck by making the directory longer here. Using the
> test name is nice because a human operator can quickly correlate
> directories to the tests that populated them, but if test names get kind of
> long, I wonder if we'll cause problems again.
> >
> > Just a stray thought.
> >
> >     2. multiprocessing.Pool.starmap function doesn't support passing
> >         context managers, so we can't simply pass "self". Happily, we
> need
> >         self only for read-only access, and it just works if it is
> defined
> >         in global space. So, add a temporary link TestRunner.shared_self
> >         during run_tests().
> >
> >
> > I'm a little confused on this point, see below
> >
> >     Signed-off-by: Vladimir Sementsov-Ogievskiy <
> vsementsov@virtuozzo.com <mailto:vsementsov@virtuozzo.com>>
> >     ---
> >       tests/qemu-iotests/check         |  4 +-
> >       tests/qemu-iotests/testrunner.py | 69
> ++++++++++++++++++++++++++++----
> >       2 files changed, 64 insertions(+), 9 deletions(-)
> >
> >     diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
> >     index 43a4b694cc..0c27721a41 100755
> >     --- a/tests/qemu-iotests/check
> >     +++ b/tests/qemu-iotests/check
> >     @@ -34,6 +34,8 @@ def make_argparser() -> argparse.ArgumentParser:
> >                          help='show me, do not run tests')
> >           p.add_argument('-makecheck', action='store_true',
> >                          help='pretty print output for make check')
> >     +    p.add_argument('-j', dest='jobs', type=int, default=1,
> >     +                   help='run tests in multiple parallel jobs')
> >
> >           p.add_argument('-d', dest='debug', action='store_true',
> help='debug')
> >           p.add_argument('-p', dest='print', action='store_true',
> >     @@ -165,6 +167,6 @@ if __name__ == '__main__':
> >               with TestRunner(env, makecheck=args.makecheck,
> >                               color=args.color) as tr:
> >                   paths = [os.path.join(env.source_iotests, t) for t in
> tests]
> >     -            ok = tr.run_tests(paths)
> >     +            ok = tr.run_tests(paths, args.jobs <http://args.jobs>)
> >                   if not ok:
> >                       sys.exit(1)
> >
> >
> > (OK)
> >
> >     diff --git a/tests/qemu-iotests/testrunner.py
> b/tests/qemu-iotests/testrunner.py
> >     index a9f2feb58c..0feaa396d0 100644
> >     --- a/tests/qemu-iotests/testrunner.py
> >     +++ b/tests/qemu-iotests/testrunner.py
> >     @@ -26,6 +26,7 @@
> >       import json
> >       import termios
> >       import sys
> >     +from multiprocessing import Pool
> >       from contextlib import contextmanager
> >       from typing import List, Optional, Iterator, Any, Sequence, Dict, \
> >               ContextManager
> >     @@ -126,6 +127,31 @@ def __init__(self, status: str, description:
> str = '',
> >
> >
> >       class TestRunner(ContextManager['TestRunner']):
> >     +    shared_self = None
> >
> >     +
> >     +    @staticmethod
> >     +    def proc_run_test(test: str, test_field_width: int) ->
> TestResult:
> >     +        # We are in a subprocess, we can't change the runner object!
> >
> >
> > *can't*, or shouldn't? I thought changing anything would just result in
> the child process diverging, but nothing harmful overall. Am I mistaken?
>
> Yes you are right. "Shouldn't" is OK
>
> >
> >     +        runner = TestRunner.shared_self
> >     +        assert runner is not None
> >     +        return runner.run_test(test, test_field_width, mp=True)
> >     +
> >     +    def run_tests_pool(self, tests: List[str],
> >     +                       test_field_width: int, jobs: int) ->
> List[TestResult]:
> >     +
> >     +        # passing self directly to Pool.starmap() just doesn't
> work, because
> >     +        # it's a context manager.
> >
> >
> > Why, what happens? (Or what doesn't happen?)
> >
> > (I believe you that it doesn't work, but it's not immediately obvious to
> me why.)
>
> Simple check:
>
> diff --git a/tests/qemu-iotests/testrunner.py
> b/tests/qemu-iotests/testrunner.py
> index 0feaa396d0..49c1780697 100644
> --- a/tests/qemu-iotests/testrunner.py
> +++ b/tests/qemu-iotests/testrunner.py
> @@ -130,7 +130,7 @@ class TestRunner(ContextManager['TestRunner']):
>       shared_self = None
>
>       @staticmethod
> -    def proc_run_test(test: str, test_field_width: int) -> TestResult:
> +    def proc_run_test(x, test: str, test_field_width: int) -> TestResult:
>           # We are in a subprocess, we can't change the runner object!
>           runner = TestRunner.shared_self
>           assert runner is not None
> @@ -146,7 +146,7 @@ def run_tests_pool(self, tests: List[str],
>
>           with Pool(jobs) as p:
>               results = p.starmap(self.proc_run_test,
> -                                zip(tests, [test_field_width] *
> len(tests)))
> +                                [(self, t, test_field_width) for t in
> tests])
>
>           TestRunner.shared_self = None
>
>
>
>
> Something like this happens:
>
>    File
> "/work/src/qemu/up/up-iotests-multiprocessing/build/tests/qemu-iotests/./check",
> line 170, in <module>
>      ok = tr.run_tests(paths, args.jobs)
>    File
> "/work/src/qemu/up/up-iotests-multiprocessing/tests/qemu-iotests/testrunner.py",
> line 383, in run_tests
>      results = self.run_tests_pool(tests, test_field_width, jobs)
>    File
> "/work/src/qemu/up/up-iotests-multiprocessing/tests/qemu-iotests/testrunner.py",
> line 149, in run_tests_pool
>      results = p.starmap(self.proc_run_test,
>    File "/usr/lib64/python3.9/multiprocessing/pool.py", line 372, in
> starmap
>      return self._map_async(func, iterable, starmapstar, chunksize).get()
>    File "/usr/lib64/python3.9/multiprocessing/pool.py", line 771, in get
>      raise self._value
>    File "/usr/lib64/python3.9/multiprocessing/pool.py", line 537, in
> _handle_tasks
>      put(task)
>    File "/usr/lib64/python3.9/multiprocessing/connection.py", line 211, in
> send
>      self._send_bytes(_ForkingPickler.dumps(obj))
>    File "/usr/lib64/python3.9/multiprocessing/reduction.py", line 51, in
> dumps
>      cls(buf, protocol).dump(obj)
> TypeError: cannot pickle 'generator' object
>
>
> Hmm, I remember that was cannot pickle context manager.. Probably I
> remember wrong :) Honestly I didn't dig into it except for detecting that
> not passing "self" fixes the problem.
>
>
Oh, I see. Even using a *bound method*, it still wants to pass 'self' as an
argument, but it's unable to do so ... uh, interesting! but having it as
global state somehow works. That's ... fascinating. Well, without spending
much time on it myself, I think your workaround is probably the best
possible thing without really tearing things apart and refactoring.
Asserting that shared_self is None will prevent run_tests_pool from being
called twice concurrently, so the limitation of the workaround is
well-contained.

Good enough.


> >
> >     +        assert TestRunner.shared_self is None
> >     +        TestRunner.shared_self = self
> >     +
> >     +        with Pool(jobs) as p:
> >     +            results = p.starmap(self.proc_run_test,
> >     +                                zip(tests, [test_field_width] *
> len(tests)))
> >     +
> >     +        TestRunner.shared_self = None
> >     +
> >     +        return results
> >     +
> >           def __init__(self, env: TestEnv, makecheck: bool = False,
> >                        color: str = 'auto') -> None:
> >               self.env = env
> >     @@ -219,11 +245,16 @@ def find_reference(self, test: str) -> str:
> >
> >               return f'{test}.out'
> >
> >     -    def do_run_test(self, test: str) -> TestResult:
> >     +    def do_run_test(self, test: str, mp: bool) -> TestResult:
> >               """
> >               Run one test
> >
> >               :param test: test file path
> >     +        :param mp: if true, we are in a multiprocessing
> environment, use
> >     +                   personal subdirectories for test run
> >     +
> >     +        Note: this method may be called from subprocess, so it does
> not
> >     +        change ``self`` object in any way!
> >               """
> >
> >
> > Maybe worth mentioning that it *does* change environment variables, but
> because this is "mp", it won't affect the parent execution environment.
>
>
> Hmm. actually, it does not change it. And yes the reason is that we'll not
> change the original object anyway, so any logic that change the runner
> object in hope that it will make some effect would be wrong.
>
>
> >
> >
> >               f_test = Path(test)
> >     @@ -249,6 +280,12 @@ def do_run_test(self, test: str) -> TestResult:
> >
> >               args = [str(f_test.resolve())]
> >               env = self.env.prepare_subprocess(args)
> >     +        if mp:
> >     +            # Split test directories, so that tests running in
> parallel don't
> >     +            # break each other.
> >     +            for d in ['TEST_DIR', 'SOCK_DIR']:
> >     +                env[d] = os.path.join(env[d], f_test.name <
> http://f_test.name>)
> >     +                Path(env[d]).mkdir(parents=True, exist_ok=True)
> >
> >               t0 = time.time()
> >               with f_bad.open('w', encoding="utf-8") as f:
> >     @@ -291,23 +328,32 @@ def do_run_test(self, test: str) -> TestResult:
> >                                     casenotrun=casenotrun)
> >
> >           def run_test(self, test: str,
> >     -                 test_field_width: Optional[int] = None) ->
> TestResult:
> >     +                 test_field_width: Optional[int] = None,
> >     +                 mp: bool = False) -> TestResult:
> >               """
> >               Run one test and print short status
> >
> >               :param test: test file path
> >               :param test_field_width: width for first field of status
> format
> >     +        :param mp: if true, we are in a multiprocessing
> environment, don't try
> >     +                   to rewrite things in stdout
> >     +
> >     +        Note: this method may be called from subprocess, so it does
> not
> >     +        change ``self`` object in any way!
> >               """
> >
> >               last_el = self.last_elapsed.get(test)
> >               start = datetime.datetime.now().strftime('%H:%M:%S')
> >
> >               if not self.makecheck:
> >     -            self.test_print_one_line(test=test, starttime=start,
> >     -                                     lasttime=last_el, end='\r',
> >     +            self.test_print_one_line(test=test,
> >     +                                     status = 'started' if mp else
> '...',
> >     +                                     starttime=start,
> >     +                                     lasttime=last_el,
> >     +                                     end = '\n' if mp else '\r',
> >
> test_field_width=test_field_width)
> >
> >     -        res = self.do_run_test(test)
> >     +        res = self.do_run_test(test, mp)
> >
> >               end = datetime.datetime.now().strftime('%H:%M:%S')
> >               self.test_print_one_line(test=test, status=res.status,
> >
> >     @@ -321,7 +367,7 @@ def run_test(self, test: str,
> >
> >               return res
> >
> >     -    def run_tests(self, tests: List[str]) -> bool:
> >     +    def run_tests(self, tests: List[str], jobs: int = 1) -> bool:
> >               n_run = 0
> >               failed = []
> >               notrun = []
> >     @@ -332,9 +378,16 @@ def run_tests(self, tests: List[str]) -> bool:
> >
> >               test_field_width = max(len(os.path.basename(t)) for t in
> tests) + 2
> >
> >     -        for t in tests:
> >     +        if jobs > 1:
> >     +            results = self.run_tests_pool(tests, test_field_width,
> jobs)
> >     +
> >     +        for i, t in enumerate(tests):
> >                   name = os.path.basename(t)
> >     -            res = self.run_test(t,
> test_field_width=test_field_width)
> >     +
> >     +            if jobs > 1:
> >     +                res = results[i]
> >     +            else:
> >     +                res = self.run_test(t, test_field_width)
> >
> >                   assert res.status in ('pass', 'fail', 'not run')
> >
> >
> > Looks good and surprisingly minimal, I just have a curiosity about the
> nature of the workaround here.
> >
> > Either way, I believe this will probably work as written, so I can give
> it an ACK at a minimum while I wait for answers.
> >
> > Acked-by: John Snow <jsnow@redhat.com <mailto:jsnow@redhat.com>>
> >
>
> Thanks!
>
> Yes, the workaround is a ugly.. But it's small, so I think we could live
> with.
>

I agree, I just wanted to make sure I understood what was happening and why.


> I don't think that refactoring TestRunner to move all needed things to
> some simple structure supported by Pool is good idea: actually, we don't
> want to copy these data for each subprocess, we are OK with readonly access
> to shared object. And we do call methods on self, and on self.env, so
> refactoring would not be simple.
>
> But about shared object, I didn't find any way to pass a link to shared
> object to Pool.map()..   Something like Pool.map( , ... ,
> shared_state=self) would be good. But were is such an option? Note that
> this is my first experience with multiprocessing.
>
> The only thing I find is passing through global variable. I started with
> real global variably, but then thought that hiding it inside the class
> would be a bit better.
>

Yeah, don't worry about making it absolutely beautiful.  Thanks for
explaining the problem to me, I agree that your workaround is a good
compromise.

Reviewed-by: John Snow <jsnow@redhat.com>

--00000000000040675b05d2808eee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 6, 2021 at 3:20 PM Vladim=
ir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementsov@virtuozzo.com">vsem=
entsov@virtuozzo.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">06.12.2021 21:35, John Snow wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Fri, Dec 3, 2021 at 7:22 AM Vladimir Sementsov-Ogievskiy &lt;<a hre=
f=3D"mailto:vsementsov@virtuozzo.com" target=3D"_blank">vsementsov@virtuozz=
o.com</a> &lt;mailto:<a href=3D"mailto:vsementsov@virtuozzo.com" target=3D"=
_blank">vsementsov@virtuozzo.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Add -j &lt;JOBS&gt; parameter, to run tests in seve=
ral jobs simultaneously.<br>
&gt;=C2=A0 =C2=A0 =C2=A0For realization - simply utilize multiprocessing.Po=
ol class.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Notes:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A01. Of course, tests can&#39;t run simultaneously in=
 same TEST_DIR. So,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0use subdirectories TEST_DIR/testname/=
 and SOCK_DIR/testname/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0instead of simply TEST_DIR and SOCK_D=
IR<br>
&gt; <br>
&gt; <br>
&gt; SOCK_DIR was introduced because TEST_DIR was getting too long, and the=
 length of the filepath was causing problems on some platforms. I hope that=
 we aren&#39;t pushing our luck by making the directory longer here. Using =
the test name is nice because a human operator can quickly correlate direct=
ories to the tests that populated them, but if test names get kind of long,=
 I wonder if we&#39;ll cause problems again.<br>
&gt; <br>
&gt; Just a stray thought.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A02. multiprocessing.Pool.starmap function doesn&#39;=
t support passing<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0context managers, so we can&#39;t sim=
ply pass &quot;self&quot;. Happily, we need<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self only for read-only access, and i=
t just works if it is defined<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in global space. So, add a temporary =
link TestRunner.shared_self<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0during run_tests().<br>
&gt; <br>
&gt; <br>
&gt; I&#39;m a little confused on this point, see below<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Vladimir Sementsov-Ogievskiy &lt;<a =
href=3D"mailto:vsementsov@virtuozzo.com" target=3D"_blank">vsementsov@virtu=
ozzo.com</a> &lt;mailto:<a href=3D"mailto:vsementsov@virtuozzo.com" target=
=3D"_blank">vsementsov@virtuozzo.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tests/qemu-iotests/check=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 4 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tests/qemu-iotests/testrunner.py | 69 ++++++=
++++++++++++++++++++++----<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A02 files changed, 64 insertions(+), 9 deletio=
ns(-)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/tests/qemu-iotests/check b/tests/qemu-=
iotests/check<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 43a4b694cc..0c27721a41 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/tests/qemu-iotests/check<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/tests/qemu-iotests/check<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -34,6 +34,8 @@ def make_argparser() -&gt; argpar=
se.ArgumentParser:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 help=3D&#39;show me, do not run tests&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p.add_argument(&#39;-makecheck=
&#39;, action=3D&#39;store_true&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 help=3D&#39;pretty print output for make check&#39;)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 p.add_argument(&#39;-j&#39;, dest=3D=
&#39;jobs&#39;, type=3Dint, default=3D1,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0help=3D&#39;run tests in multiple parallel jobs&#39;)<b=
r>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p.add_argument(&#39;-d&#39;, d=
est=3D&#39;debug&#39;, action=3D&#39;store_true&#39;, help=3D&#39;debug&#39=
;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p.add_argument(&#39;-p&#39;, d=
est=3D&#39;print&#39;, action=3D&#39;store_true&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -165,6 +167,6 @@ if __name__ =3D=3D &#39;__main_=
_&#39;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with TestRunner(=
env, makecheck=3Dargs.makecheck,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0color=3Dargs.color) as tr:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pa=
ths =3D [os.path.join(env.source_iotests, t) for t in tests]<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ok =3D t=
r.run_tests(paths)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ok =3D t=
r.run_tests(paths, <a href=3D"http://args.jobs" rel=3D"noreferrer" target=
=3D"_blank">args.jobs</a> &lt;<a href=3D"http://args.jobs" rel=3D"noreferre=
r" target=3D"_blank">http://args.jobs</a>&gt;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if=
 not ok:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0sys.exit(1)<br>
&gt; <br>
&gt; <br>
&gt; (OK)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/tests/qemu-iotests/testrunner.py b/tes=
ts/qemu-iotests/testrunner.py<br>
&gt;=C2=A0 =C2=A0 =C2=A0index a9f2feb58c..0feaa396d0 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/tests/qemu-iotests/testrunner.py<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/tests/qemu-iotests/testrunner.py<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -26,6 +26,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0import json<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0import termios<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0import sys<br>
&gt;=C2=A0 =C2=A0 =C2=A0+from multiprocessing import Pool<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0from contextlib import contextmanager<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0from typing import List, Optional, Iterator,=
 Any, Sequence, Dict, \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ContextManager<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -126,6 +127,31 @@ def __init__(self, status: str=
, description: str =3D &#39;&#39;,<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0class TestRunner(ContextManager[&#39;TestRun=
ner&#39;]):<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 shared_self =3D None<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 @staticmethod<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 def proc_run_test(test: str, test_fi=
eld_width: int) -&gt; TestResult:<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # We are in a subproce=
ss, we can&#39;t change the runner object!<br>
&gt; <br>
&gt; <br>
&gt; *can&#39;t*, or shouldn&#39;t? I thought changing anything would just =
result in the child process diverging, but nothing harmful overall. Am I mi=
staken?<br>
<br>
Yes you are right. &quot;Shouldn&#39;t&quot; is OK<br>
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 runner =3D TestRunner.=
shared_self<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert runner is not N=
one<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return runner.run_test=
(test, test_field_width, mp=3DTrue)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 def run_tests_pool(self, tests: List=
[str],<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_field_width: int, jobs: int) -&gt; L=
ist[TestResult]:<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # passing self directl=
y to Pool.starmap() just doesn&#39;t work, because<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # it&#39;s a context m=
anager.<br>
&gt; <br>
&gt; <br>
&gt; Why, what happens? (Or what doesn&#39;t happen?)<br>
&gt; <br>
&gt; (I believe you that it doesn&#39;t work, but it&#39;s not immediately =
obvious to me why.)<br>
<br>
Simple check:<br>
<br>
diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunn=
er.py<br>
index 0feaa396d0..49c1780697 100644<br>
--- a/tests/qemu-iotests/testrunner.py<br>
+++ b/tests/qemu-iotests/testrunner.py<br>
@@ -130,7 +130,7 @@ class TestRunner(ContextManager[&#39;TestRunner&#39;]):=
<br>
=C2=A0 =C2=A0 =C2=A0 shared_self =3D None<br>
<br>
=C2=A0 =C2=A0 =C2=A0 @staticmethod<br>
-=C2=A0 =C2=A0 def proc_run_test(test: str, test_field_width: int) -&gt; Te=
stResult:<br>
+=C2=A0 =C2=A0 def proc_run_test(x, test: str, test_field_width: int) -&gt;=
 TestResult:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # We are in a subprocess, we can&#39;t c=
hange the runner object!<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 runner =3D TestRunner.shared_self<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert runner is not None<br>
@@ -146,7 +146,7 @@ def run_tests_pool(self, tests: List[str],<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with Pool(jobs) as p:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 results =3D p.starmap(self=
.proc_run_test,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 zip(tests, [test_field_width] * len(=
tests)))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [(self, t, test_field_width) for t i=
n tests])<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TestRunner.shared_self =3D None<br>
<br>
<br>
<br>
<br>
Something like this happens:<br>
<br>
=C2=A0 =C2=A0File &quot;/work/src/qemu/up/up-iotests-multiprocessing/build/=
tests/qemu-iotests/./check&quot;, line 170, in &lt;module&gt;<br>
=C2=A0 =C2=A0 =C2=A0ok =3D tr.run_tests(paths, <a href=3D"http://args.jobs"=
 rel=3D"noreferrer" target=3D"_blank">args.jobs</a>)<br>
=C2=A0 =C2=A0File &quot;/work/src/qemu/up/up-iotests-multiprocessing/tests/=
qemu-iotests/testrunner.py&quot;, line 383, in run_tests<br>
=C2=A0 =C2=A0 =C2=A0results =3D self.run_tests_pool(tests, test_field_width=
, jobs)<br>
=C2=A0 =C2=A0File &quot;/work/src/qemu/up/up-iotests-multiprocessing/tests/=
qemu-iotests/testrunner.py&quot;, line 149, in run_tests_pool<br>
=C2=A0 =C2=A0 =C2=A0results =3D p.starmap(self.proc_run_test,<br>
=C2=A0 =C2=A0File &quot;/usr/lib64/python3.9/multiprocessing/pool.py&quot;,=
 line 372, in starmap<br>
=C2=A0 =C2=A0 =C2=A0return self._map_async(func, iterable, starmapstar, chu=
nksize).get()<br>
=C2=A0 =C2=A0File &quot;/usr/lib64/python3.9/multiprocessing/pool.py&quot;,=
 line 771, in get<br>
=C2=A0 =C2=A0 =C2=A0raise self._value<br>
=C2=A0 =C2=A0File &quot;/usr/lib64/python3.9/multiprocessing/pool.py&quot;,=
 line 537, in _handle_tasks<br>
=C2=A0 =C2=A0 =C2=A0put(task)<br>
=C2=A0 =C2=A0File &quot;/usr/lib64/python3.9/multiprocessing/connection.py&=
quot;, line 211, in send<br>
=C2=A0 =C2=A0 =C2=A0self._send_bytes(_ForkingPickler.dumps(obj))<br>
=C2=A0 =C2=A0File &quot;/usr/lib64/python3.9/multiprocessing/reduction.py&q=
uot;, line 51, in dumps<br>
=C2=A0 =C2=A0 =C2=A0cls(buf, protocol).dump(obj)<br>
TypeError: cannot pickle &#39;generator&#39; object<br>
<br>
<br>
Hmm, I remember that was cannot pickle context manager.. Probably I remembe=
r wrong :) Honestly I didn&#39;t dig into it except for detecting that not =
passing &quot;self&quot; fixes the problem.<br>
<br></blockquote><div><br></div><div>Oh, I see. Even using a *bound method*=
, it still wants to pass &#39;self&#39; as an argument, but it&#39;s unable=
 to do so ... uh, interesting! but having it as global state somehow works.=
 That&#39;s ... fascinating. Well, without spending much time on it myself,=
 I think your workaround is probably the best possible thing without really=
 tearing things apart and refactoring. Asserting that shared_self is None w=
ill prevent run_tests_pool from being called twice concurrently, so the lim=
itation of the workaround is well-contained.</div><div><br></div><div>Good =
enough.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert TestRunner.shar=
ed_self is None<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 TestRunner.shared_self=
 =3D self<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with Pool(jobs) as p:<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 results =
=3D p.starmap(self.proc_run_test,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 zip(tests, [=
test_field_width] * len(tests)))<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 TestRunner.shared_self=
 =3D None<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return results<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0def __init__(self, env: TestEn=
v, makecheck: bool =3D False,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 color: str =3D &#39;auto&#39;) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.env =3D env=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -219,11 +245,16 @@ def find_reference(self, test=
: str) -&gt; str:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return f&#39;{te=
st}.out&#39;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 def do_run_test(self, test: str) -&g=
t; TestResult:<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 def do_run_test(self, test: str, mp:=
 bool) -&gt; TestResult:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quo=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Run one test<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:param test: tes=
t file path<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :param mp: if true, we=
 are in a multiprocessing environment, use<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0personal subdirectories for test run<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Note: this method may =
be called from subprocess, so it does not<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 change ``self`` object=
 in any way!<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quo=
t;<br>
&gt; <br>
&gt; <br>
&gt; Maybe worth mentioning that it *does* change environment variables, bu=
t because this is &quot;mp&quot;, it won&#39;t affect the parent execution =
environment.<br>
<br>
<br>
Hmm. actually, it does not change it. And yes the reason is that we&#39;ll =
not change the original object anyway, so any logic that change the runner =
object in hope that it will make some effect would be wrong.<br>
<br>
<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f_test =3D Path(=
test)<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -249,6 +280,12 @@ def do_run_test(self, test: st=
r) -&gt; TestResult:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args =3D [str(f_=
test.resolve())]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env =3D self.env=
.prepare_subprocess(args)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if mp:<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Split =
test directories, so that tests running in parallel don&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # break =
each other.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for d in=
 [&#39;TEST_DIR&#39;, &#39;SOCK_DIR&#39;]:<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 env[d] =3D os.path.join(env[d], <a href=3D"http://f_test.name" rel=
=3D"noreferrer" target=3D"_blank">f_test.name</a> &lt;<a href=3D"http://f_t=
est.name" rel=3D"noreferrer" target=3D"_blank">http://f_test.name</a>&gt;)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 Path(env[d]).mkdir(parents=3DTrue, exist_ok=3DTrue)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t0 =3D time.time=
()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with f_bad.open(=
&#39;w&#39;, encoding=3D&quot;utf-8&quot;) as f:<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -291,23 +328,32 @@ def do_run_test(self, test: s=
tr) -&gt; TestResult:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0casenotrun=3D=
casenotrun)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0def run_test(self, test: str,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0test_field_width: Optional[int] =3D None) -&gt; TestResult:<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0test_field_width: Optional[int] =3D None,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0mp: bool =3D False) -&gt; TestResult:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quo=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Run one test and=
 print short status<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:param test: tes=
t file path<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:param test_fiel=
d_width: width for first field of status format<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :param mp: if true, we=
 are in a multiprocessing environment, don&#39;t try<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0to rewrite things in stdout<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Note: this method may =
be called from subprocess, so it does not<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 change ``self`` object=
 in any way!<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quo=
t;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0last_el =3D self=
.last_elapsed.get(test)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0start =3D dateti=
me.datetime.now().strftime(&#39;%H:%M:%S&#39;)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not self.make=
check:<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.tes=
t_print_one_line(test=3Dtest, starttime=3Dstart,<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0lasttime=3Dlast_el, end=3D&#39;\r&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.tes=
t_print_one_line(test=3Dtest,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0status =3D &#39;started&#39; if mp else &#39;...&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0starttime=3Dstart,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0lasttime=3Dlast_el,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0end =3D &#39;\n&#39; if mp else &#39;\r&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 test_field_width=3Dtest_field_width)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D self.do_run_te=
st(test)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D self.do_run_te=
st(test, mp)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0end =3D datetime=
.datetime.now().strftime(&#39;%H:%M:%S&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.test_print_=
one_line(test=3Dtest, status=3Dres.status,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -321,7 +367,7 @@ def run_test(self, test: str,<b=
r>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return res<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 def run_tests(self, tests: List[str]=
) -&gt; bool:<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 def run_tests(self, tests: List[str]=
, jobs: int =3D 1) -&gt; bool:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n_run =3D 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0failed =3D []<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0notrun =3D []<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -332,9 +378,16 @@ def run_tests(self, tests: Lis=
t[str]) -&gt; bool:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_field_width=
 =3D max(len(os.path.basename(t)) for t in tests) + 2<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for t in tests:<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if jobs &gt; 1:<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 results =
=3D self.run_tests_pool(tests, test_field_width, jobs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for i, t in enumerate(=
tests):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0na=
me =3D os.path.basename(t)<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D =
self.run_test(t, test_field_width=3Dtest_field_width)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if jobs =
&gt; 1:<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 res =3D results[i]<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 res =3D self.run_test(t, test_field_width)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0as=
sert res.status in (&#39;pass&#39;, &#39;fail&#39;, &#39;not run&#39;)<br>
&gt; <br>
&gt; <br>
&gt; Looks good and surprisingly minimal, I just have a curiosity about the=
 nature of the workaround here.<br>
&gt; <br>
&gt; Either way, I believe this will probably work as written, so I can giv=
e it an ACK at a minimum while I wait for answers.<br>
&gt; <br>
&gt; Acked-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"=
_blank">jsnow@redhat.com</a> &lt;mailto:<a href=3D"mailto:jsnow@redhat.com"=
 target=3D"_blank">jsnow@redhat.com</a>&gt;&gt;<br>
&gt; <br>
<br>
Thanks!<br>
<br>
Yes, the workaround is a ugly.. But it&#39;s small, so I think we could liv=
e with.<br></blockquote><div><br></div><div>I agree, I just wanted to make =
sure I understood what was happening and why.<br></div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
I don&#39;t think that refactoring TestRunner to move all needed things to =
some simple structure supported by Pool is good idea: actually, we don&#39;=
t want to copy these data for each subprocess, we are OK with readonly acce=
ss to shared object. And we do call methods on self, and on self.env, so re=
factoring would not be simple.<br>
<br>
But about shared object, I didn&#39;t find any way to pass a link to shared=
 object to Pool.map()..=C2=A0 =C2=A0Something like Pool.map( , ... , shared=
_state=3Dself) would be good. But were is such an option? Note that this is=
 my first experience with multiprocessing.<br>
<br>
The only thing I find is passing through global variable. I started with re=
al global variably, but then thought that hiding it inside the class would =
be a bit better.<br></blockquote><div><br></div><div>Yeah, don&#39;t worry =
about making it absolutely beautiful.=C2=A0 Thanks for explaining the probl=
em to me, I agree that your workaround is a good compromise.</div><div><br>=
</div><div>Reviewed-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com">j=
snow@redhat.com</a>&gt;</div></div></div>

--00000000000040675b05d2808eee--


