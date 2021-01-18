Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C46B42FA249
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 14:57:22 +0100 (CET)
Received: from localhost ([::1]:36358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1V21-0000xI-DQ
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 08:57:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l1V0L-0000HN-Ma
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 08:55:37 -0500
Received: from relay64.bu.edu ([128.197.228.104]:42031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l1V0G-0005k5-4Z
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 08:55:33 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 10IDswx4032447
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 18 Jan 2021 08:55:02 -0500
Date: Mon, 18 Jan 2021 08:54:58 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: pending fuzzing patches (was Re: [PATCH 2/2] fuzz: log the
 arguments used to initialize QEMU)
Message-ID: <20210118135458.agoc7hiremr2sc6e@mozz.bu.edu>
References: <20210117201014.271610-1-alxndr@bu.edu>
 <20210117201014.271610-3-alxndr@bu.edu>
 <4e63a37a-d9f1-7841-3761-6f8cd7ac9051@redhat.com>
 <84615bb8-564e-5d5f-b134-83fa223cf583@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <84615bb8-564e-5d5f-b134-83fa223cf583@redhat.com>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210118 1030, Thomas Huth wrote:
> On 18/01/2021 09.43, Paolo Bonzini wrote:
> > On 17/01/21 21:10, Alexander Bulekov wrote:
> > > This is useful for building reproducers. Instead checking the code or
> > > the QEMU_FUZZ_ARGS, the arguments are at the top of the crash log.
> > > 
> > > Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> > > ---
> > >   tests/qtest/fuzz/fuzz.c | 11 ++++++++++-
> > >   1 file changed, 10 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/tests/qtest/fuzz/fuzz.c b/tests/qtest/fuzz/fuzz.c
> > > index 238866a037..496d11a231 100644
> > > --- a/tests/qtest/fuzz/fuzz.c
> > > +++ b/tests/qtest/fuzz/fuzz.c
> > > @@ -159,6 +159,8 @@ int LLVMFuzzerInitialize(int *argc, char
> > > ***argv, char ***envp)
> > >       char *target_name;
> > >       const char *bindir;
> > >       char *datadir;
> > > +    GString *cmd_line;
> > > +    gchar *pretty_cmd_line;
> > >       bool serialize = false;
> > >       /* Initialize qgraph and modules */
> > > @@ -217,7 +219,7 @@ int LLVMFuzzerInitialize(int *argc, char
> > > ***argv, char ***envp)
> > >       }
> > >       /* Run QEMU's softmmu main with the fuzz-target dependent arguments */
> > > -    GString *cmd_line = fuzz_target->get_init_cmdline(fuzz_target);
> > > +    cmd_line = fuzz_target->get_init_cmdline(fuzz_target);
> > >       g_string_append_printf(cmd_line, " %s -qtest /dev/null ",
> > >                              getenv("QTEST_LOG") ? "" : "-qtest-log none");
> > > @@ -226,6 +228,13 @@ int LLVMFuzzerInitialize(int *argc, char
> > > ***argv, char ***envp)
> > >       wordexp(cmd_line->str, &result, 0);
> > >       g_string_free(cmd_line, true);
> > > +    if (getenv("QTEST_LOG")) {
> > > +        pretty_cmd_line  = g_strjoinv(" ", result.we_wordv + 1);
> > > +        printf("Starting %s with Arguments: %s\n",
> > > +                result.we_wordv[0], pretty_cmd_line);
> > > +        g_free(pretty_cmd_line);
> > > +    }
> > > +
> > >       qemu_init(result.we_wordc, result.we_wordv, NULL);
> > >       /* re-enable the rcu atfork, which was previously disabled in
> > > qemu_init */
> > > 
> > 
> > Hi Alexander, can you send _me_ a pull request for all the pending
> > fuzzing patches?  I haven't paid much attention, but I have seen
> > external contributions and I have the feeling that they aren't being
> > applied/reviewed promptly.
> 
> I'm normally taking the fuzzing patches through the qtest tree (and also
> merged some contributions last week, see 22ec0c696fd28e and the following
> commits) ... which patch series that got missed did you have in mind?
> 
> Anyway, the amount of fuzzer patches seems to have increased during the last
> weeks, and I'm not very familiar with the fuzzing stuff and also sometimes I
> do not get CC:-ed on fuzzing patches, so it might make sense indeed that
> Alexander now gathers the fuzzing patches and starts sending pull requests
> for these. Alexander, do you want to have a try now?
> 

Sure - I'll wait for both remaining series to be fully reviewed. Then
I'll follow this: https://wiki.qemu.org/Contribute/SubmitAPullRequest
-Alex


>  Thomas
> 

