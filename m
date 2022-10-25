Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E5860CBEF
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 14:35:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onJ7V-0000VE-BN; Tue, 25 Oct 2022 08:33:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1onJ7T-0000PY-Bh
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 08:33:23 -0400
Received: from 6.mo548.mail-out.ovh.net ([188.165.58.48])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1onJ7R-0000rd-Ge
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 08:33:23 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.137])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 1495721916;
 Tue, 25 Oct 2022 12:33:17 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Tue, 25 Oct
 2022 14:33:16 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005f4b7f05a-1311-4a1e-9da0-4154746346d9,
 5AA7337ABCEACBE3F99194CB0234B772833894C4) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Tue, 25 Oct 2022 14:33:15 +0200
From: Greg Kurz <groug@kaod.org>
To: Paolo Bonzini <pbonzini@redhat.com>
CC: <qemu-devel@nongnu.org>, Alex =?UTF-8?B?QmVubsOpZQ==?=
 <alex.bennee@linaro.org>, Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] util/log: do not close and reopen log files when flags
 are turned off
Message-ID: <20221025143315.5697edad@bahia>
In-Reply-To: <20221025092119.236224-1-pbonzini@redhat.com>
References: <20221025092119.236224-1-pbonzini@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: 46f03973-e568-4482-94b5-c83fc9674d84
X-Ovh-Tracer-Id: 15531789216596138464
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrtddtgddvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhfogggtgfhisehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeuueeijedtleeluedthfetjeffieetffeuvefffeeftedvieefueejgfdugeetueenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehgrhhouhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgsohhniihinhhisehrvgguhhgrthdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdprghlvgigrdgsvghnnhgvvgeslhhinhgrrhhordhorhhgpdhrihgthhgrrhgurdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrghdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=188.165.58.48; envelope-from=groug@kaod.org;
 helo=6.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 25 Oct 2022 11:21:19 +0200
Paolo Bonzini <pbonzini@redhat.com> wrote:

> log_append makes sure that if you turn off the logging (which clears
> log_flags and makes need_to_open_file false) the old log is not
> overwritten.  The usecase is that if you remove or move the file
> QEMU will not keep writing to the old file.  However, this is
> not always the desited behavior, in particular having log_append=3D=3D1
> after changing the file name makes little sense.
>=20
> When qemu_set_log_internal is called from the logfile monitor
> command, filename must be non-NULL and therefore changed_name must
> be true.  Therefore, the only case where the file is closed and
> need_to_open_file =3D=3D false is indeed when log_flags becomes
> zero.  In this case, just flush the file and do not bother
> closing it, thus faking the same append behavior as previously.
>=20
> The behavioral change is that changing the logfile twice, for
> example log1 -> log2 -> log1, will cause log1 to be overwritten.
> This can simply be documented, since it is not a particularly
> surprising behavior.
>=20
> Suggested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

Heh I currently have a very similar patch in my tree :-)

Reviewed-by: Greg Kurz <groug@kaod.org>

I'll include this and other bug fixes as prerequisites for my
on-going work on logging when daemonized.

>  util/log.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>=20
> diff --git a/util/log.c b/util/log.c
> index d6eb0378c3a3..06d0173788dc 100644
> --- a/util/log.c
> +++ b/util/log.c
> @@ -44,7 +44,6 @@ static FILE *global_file;
>  static __thread FILE *thread_file;
> =20
>  int qemu_loglevel;
> -static bool log_append;
>  static bool log_per_thread;
>  static GArray *debug_regions;
> =20
> @@ -259,19 +258,19 @@ static bool qemu_set_log_internal(const char *filen=
ame, bool changed_name,
>      daemonized =3D is_daemonized();
>      need_to_open_file =3D log_flags && !per_thread && (!daemonized || fi=
lename);
> =20
> -    if (logfile && (!need_to_open_file || changed_name)) {
> -        qatomic_rcu_set(&global_file, NULL);
> -        if (logfile !=3D stderr) {
> +    if (logfile) {
> +        fflush(logfile);
> +        if (changed_name && logfile !=3D stderr) {
>              RCUCloseFILE *r =3D g_new0(RCUCloseFILE, 1);
>              r->fd =3D logfile;
>              call_rcu(r, rcu_close_file, rcu);
> +            logfile =3D NULL;
>          }
> -        logfile =3D NULL;
>      }
> =20
>      if (!logfile && need_to_open_file) {
>          if (filename) {
> -            logfile =3D fopen(filename, log_append ? "a" : "w");
> +            logfile =3D fopen(filename, "w");
>              if (!logfile) {
>                  error_setg_errno(errp, errno, "Error opening logfile %s",
>                                   filename);
> @@ -290,8 +289,6 @@ static bool qemu_set_log_internal(const char *filenam=
e, bool changed_name,
>              logfile =3D stderr;
>          }
> =20
> -        log_append =3D 1;
> -
>          qatomic_rcu_set(&global_file, logfile);
>      }
>      return true;


