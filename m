Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A46605BF2
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 12:15:37 +0200 (CEST)
Received: from localhost ([::1]:56186 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olSaN-0003mf-Jw
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 06:15:35 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olSZt-0008BL-5j
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 06:15:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1olSBN-0000LP-SW
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 05:49:50 -0400
Received: from 2.mo552.mail-out.ovh.net ([178.33.105.233]:56839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1olSBL-0006hz-8s
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 05:49:45 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.44])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id A4ED22A1FB;
 Thu, 20 Oct 2022 09:49:39 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Thu, 20 Oct
 2022 11:49:39 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S001ad83f9ac-590d-4fac-99c5-fe5a7a59ad8d,
 1F689060A0B44BE6777CA4BD0FC13A24F8265309) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Thu, 20 Oct 2022 11:49:37 +0200
From: Greg Kurz <groug@kaod.org>
To: Richard Henderson <richard.henderson@linaro.org>
CC: <qemu-devel@nongnu.org>, Alex =?UTF-8?B?QmVubsOpZQ==?=
 <alex.bennee@linaro.org>, "Daniel P . =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 2/2] util/log: Always send errors to logfile when
 daemonized
Message-ID: <20221020114937.3558737e@bahia>
In-Reply-To: <47ea1c0e-9e32-ce9a-7bef-bd2ac70bdbb9@linaro.org>
References: <20221019151651.334334-1-groug@kaod.org>
 <20221019151651.334334-3-groug@kaod.org>
 <47ea1c0e-9e32-ce9a-7bef-bd2ac70bdbb9@linaro.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: 2ea7d311-9ea8-4b26-a329-6a04a4b1e000
X-Ovh-Tracer-Id: 1851823875602291107
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeliedgudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgeekjedtveegkeeileffvdetvddvgedtudduiefghffhgfdvhfegjeetkeehfeeknecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoghhrohhugheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehrihgthhgrrhgurdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdprghlvgigrdgsvghnnhgvvgeslhhinhgrrhhordhorhhgpdgsvghrrhgrnhhgvgesrhgvughhrghtrdgtohhmpdhpsghonhiiihhnihesrhgvughhrghtrdgtohhmpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=178.33.105.233; envelope-from=groug@kaod.org;
 helo=2.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 20 Oct 2022 12:21:27 +1000
Richard Henderson <richard.henderson@linaro.org> wrote:

> On 10/20/22 01:16, Greg Kurz wrote:
> > When QEMU is started with `-daemonize`, all stdio descriptors get
> > redirected to `/dev/null`. This basically means that anything
> > printed with error_report() and friends is lost.
> > 
> > One could hope that passing `-D ${logfile}` would cause the messages
> > to go to `${logfile}`, as the documentation tends to suggest:
> > 
> >        -D logfile
> >                Output log in logfile instead of to stderr
> > 
> > Unfortunately, `-D` belongs to the logging framework and it only
> > does this redirection if some log item is also enabled with `-d`
> > or if QEMU was configured with `--enable-trace-backend=log`. A
> > typical production setup doesn't do tracing or fine-grain
> > debugging but it certainly needs to collect errors.
> > 
> > Ignore the check on enabled log items when QEMU is daemonized. Previous
> > behaviour is retained for the non-daemonized case. The logic is unrolled
> > as an `if` for better readability. Since qemu_set_log_internal() caches
> > the final log level and the per-thread property in global variables, it
> > seems more correct to check these instead of intermediary local variables.
> > 
> > Special care is needed for the `-D ${logfile} -d tid` case : `${logfile}`
> > is expected to be a template that contains exactly one `%d` that should be
> > expanded to a PID or TID. The logic in qemu_log_trylock() already takes
> > care of that for per-thread logs. Do it as well for the QEMU main thread
> > when opening the file.
> 
> I don't understand why daemonize changes -d tid at all.
> If there's a bug there, please separate it out.
> 
> I don't understand the is_main_log_thread checks.
> Why is the main thread special?
> 

The current code base either opens a per-thread file in
qemu_log_trylock() when -d tid is enabled, or only a
single global file in qemu_log_set_internal() in the
opposite case.

The goal of this patch is to go through the `In case we
are a daemon redirect stderr to logfile` logic, so that
other users of stderr, aka. error_report(), can benefit
from it as well. Since this is only done for the global
file, the logic was changed to : _main_ thread to always
use the global file and other threads to use the per-thread
file.

I now realize how terrible a choice this is. It violates
the current logic too much and brings new problems like
"how to identify the main thread"...

> > -    /*
> > -     * In all cases we only log if qemu_loglevel is set.
> > -     * Also:
> > -     *   If per-thread, open the file for each thread in qemu_log_lock.
> > -     *   If not daemonized we will always log either to stderr
> > -     *     or to a file (if there is a filename).
> > -     *   If we are daemonized, we will only log if there is a filename.
> > -     */
> >       daemonized = is_daemonized();
> > -    need_to_open_file = log_flags && !per_thread && (!daemonized || filename);
> > +    need_to_open_file = false;
> > +    if (!daemonized) {
> > +        /*
> > +         * If not daemonized we only log if qemu_loglevel is set, either to
> > +         * stderr or to a file (if there is a filename).
> > +         * If per-thread, open the file for each thread in qemu_log_trylock().
> > +         */
> > +        need_to_open_file = qemu_loglevel && !log_per_thread;
> > +    } else {
> > +        /*
> > +         * If we are daemonized, we will only log if there is a filename.
> > +         */
> > +        need_to_open_file = filename != NULL;
> > +    }
> 
> I would have thought that this was the only change required -- ignoring qemu_loglevel when 
> daemonized.
> 

I was thinking the same at first, but this ended up in the
global file being open with a filename containing a '%d'...
I chose the direction of doing the g_strdup_printf() trick
for the global file as well but then I had to make sure
that qemu_log_trylock() wouldn't try later to open the same
file, hence the _main_ thread check...

The question is actually : where stderr should point to in
the '-daemonize -D foo%d.log -d tid` case ?

> 

> r~


