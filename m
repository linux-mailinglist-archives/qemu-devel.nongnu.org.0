Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E52CE64EDF6
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 16:31:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Cep-000547-VP; Fri, 16 Dec 2022 10:29:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1p6Ceo-00053z-PE
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 10:29:54 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1p6Cen-0001wY-AR
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 10:29:54 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 06380343EB;
 Fri, 16 Dec 2022 15:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671204591; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pO17bC1/+5bz61XcWGIu9Ck7AzLoXA8bFpsrfpVBjvc=;
 b=1yPy+N31qxThffdJitZBYgWzidYZ1yFkB3LgJ3rNhBfB8WhE3woftsG4nQzySQhnd1z2SP
 qttkFjZeYQEbv31/vlGyOJeGBeVsNTne3pZF30UE7ioG4M7MmEUaCyd+gqLZTms27EL639
 9Ng2gZFfLe/+jh6XLWMhL7zFii/ujHQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671204591;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pO17bC1/+5bz61XcWGIu9Ck7AzLoXA8bFpsrfpVBjvc=;
 b=QU3FJJ2V7D1a8oh/4x4Gk9dINeoEMZjWy6zVl4ovrJC1rrhft6p9gEQcOHzoyN7T4VxL8T
 tNQ6ezM9fe6ZdnDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7F255138F0;
 Fri, 16 Dec 2022 15:29:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id msntEO6OnGODCgAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 16 Dec 2022 15:29:50 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v1 04/10] gdbstub: split GDBConnection from main structure
In-Reply-To: <20221216112206.3171578-5-alex.bennee@linaro.org>
References: <20221216112206.3171578-1-alex.bennee@linaro.org>
 <20221216112206.3171578-5-alex.bennee@linaro.org>
Date: Fri, 16 Dec 2022 12:29:47 -0300
Message-ID: <87sfhfgydw.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> In preparation for moving user/softmmu specific bits from the main
> gdbstub file we need to separate the connection details to what will
> eventually become an anonymous pointer.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  gdbstub/gdbstub.c | 99 +++++++++++++++++++++++++++--------------------
>  1 file changed, 58 insertions(+), 41 deletions(-)
>
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index be88ca0d71..14ce911bf2 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -342,6 +342,20 @@ enum RSState {
>      RS_CHKSUM1,
>      RS_CHKSUM2,
>  };
> +
> +#ifdef CONFIG_USER_ONLY
> +typedef struct {
> +    int fd;
> +    char *socket_path;
> +    int running_state;
> +} GDBConnection;
> +#else
> +typedef struct {
> +    CharBackend chr;
> +    Chardev *mon_chr;
> +} GDBConnection;
> +#endif
> +
>  typedef struct GDBState {
>      bool init;       /* have we been initialised? */
>      CPUState *c_cpu; /* current CPU for step/continue ops */
> @@ -354,14 +368,7 @@ typedef struct GDBState {
>      int line_csum; /* checksum at the end of the packet */
>      GByteArray *last_packet;
>      int signal;
> -#ifdef CONFIG_USER_ONLY
> -    int fd;
> -    char *socket_path;
> -    int running_state;
> -#else
> -    CharBackend chr;
> -    Chardev *mon_chr;
> -#endif
> +    GDBConnection *connection;
>      bool multiprocess;
>      GDBProcess *processes;
>      int process_num;
> @@ -392,6 +399,12 @@ static void init_gdbserver_state(void)
>      gdbserver_state.supported_sstep_flags =3D accel_supported_gdbstub_ss=
tep_flags();
>      gdbserver_state.sstep_flags =3D SSTEP_ENABLE | SSTEP_NOIRQ | SSTEP_N=
OTIMER;
>      gdbserver_state.sstep_flags &=3D gdbserver_state.supported_sstep_fla=
gs;
> +
> +    /*
> +     * The following is differs depending on USER/SOFTMMU, we just
> +     * hid it in the typedef.
> +     */
> +    gdbserver_state.connection =3D g_new(GDBConnection, 1);

Does it need freeing at reset_gdbserver_state()?


