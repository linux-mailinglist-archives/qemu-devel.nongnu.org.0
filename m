Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2CD664CBE
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 20:46:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFKXv-00030I-OC; Tue, 10 Jan 2023 14:44:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFKXm-0002zK-6C
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 14:44:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFKXk-0003W4-D1
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 14:44:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673379859;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=SjsbNtPVsv1NBtvoR+btrCIPKaxTy1iEX17yJsmht00=;
 b=NUKAN81AiWIr0XXQydR/VehoEoIp9zMeE6qfBWT9tdUzqszGZxz83U9UlvBygT9bNBAoLy
 y93mSas6IlR/fAfhFqQ0wrAiQDJ5D5DNgZ0hv2dvDnI85j9W67G/UCSxWhhUxvtR+jOYig
 Pm7V0aDQhmM465wlSUSg6Ajv6AYCWug=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-OM1PWFXkOFWVyWZMnHrFLw-1; Tue, 10 Jan 2023 14:44:16 -0500
X-MC-Unique: OM1PWFXkOFWVyWZMnHrFLw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2D923C10EDB;
 Tue, 10 Jan 2023 19:44:15 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 13FC0140EBF4;
 Tue, 10 Jan 2023 19:44:13 +0000 (UTC)
Date: Tue, 10 Jan 2023 19:44:11 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: intermittent hang, s390x host, bios-tables-test test, TPM
Message-ID: <Y73AC98T0VLDcnj9@redhat.com>
References: <CAFEAcA-f39VfWEwb-zRabjVoO-XQ-0V=iCFu1PVjg7eYChszbA@mail.gmail.com>
 <32c53c77-5827-7839-94a1-73003bc3f8af@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <32c53c77-5827-7839-94a1-73003bc3f8af@linux.ibm.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Jan 06, 2023 at 10:16:36AM -0500, Stefan Berger wrote:
> 
> 
> On 1/6/23 07:10, Peter Maydell wrote:
> > I'm seeing an intermittent hang on the s390 CI runner in the
> > bios-tables-test test. It looks like we've deadlocked because:
> > 
> >   * the TPM device is waiting for data on its socket that never arrives,
> >     and it's holding the iothread lock
> >   * QEMU is therefore not making forward progress;
> >     in particular it is unable to handle qtest queries/responses
> >   * the test binary thread 1 is waiting to get a response to its
> >     qtest command, which is not going to arrive
> >   * test binary thread 3 (tpm_emu_ctrl_thread) is has hit an
> >     assertion and is trying to kill QEMU via qtest_kill_qemu()
> >   * qtest_kill_qemu() is only a "SIGTERM and wait", so will wait
> >     forever, because QEMU won't respond to the SIGTERM while it's
> >     blocked waiting for the TPM device to release the iothread lock
> >   * because the ctrl-thread is waiting for QEMU to exit, it's never
> >     going to send the data that would unblock the TPM device emulation
> > 
> [...]
> 
> > 
> > Thread 3 (Thread 0x3ff8dafe900 (LWP 2661316)):
> > #0  0x000003ff8e9c6002 in __GI___wait4 (pid=<optimized out>,
> > stat_loc=stat_loc@entry=0x2aa0b42c9bc, options=<optimized out>,
> > usage=usage@entry=0x0) at ../sysdeps/unix/sysv/linux/wait4.c:27
> > #1  0x000003ff8e9c5f72 in __GI___waitpid (pid=<optimized out>,
> > stat_loc=stat_loc@entry=0x2aa0b42c9bc, options=options@entry=0) at
> > waitpid.c:38
> > #2  0x000002aa0952a516 in qtest_wait_qemu (s=0x2aa0b42c9b0) at
> > ../tests/qtest/libqtest.c:206
> > #3  0x000002aa0952a58a in qtest_kill_qemu (s=0x2aa0b42c9b0) at
> > ../tests/qtest/libqtest.c:229
> > #4  0x000003ff8f0c288e in g_hook_list_invoke () from
> > /lib/s390x-linux-gnu/libglib-2.0.so.0
> > #5  <signal handler called>
> > #6  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
> > #7  0x000003ff8e9240a2 in __GI_abort () at abort.c:79
> > #8  0x000003ff8f0feda8 in g_assertion_message () from
> > /lib/s390x-linux-gnu/libglib-2.0.so.0
> > #9  0x000003ff8f0fedfe in g_assertion_message_expr () from
> > /lib/s390x-linux-gnu/libglib-2.0.so.0
> > #10 0x000002aa09522904 in tpm_emu_ctrl_thread (data=0x3fff5ffa160) at
> > ../tests/qtest/tpm-emu.c:189
> 
> This here seems to be the root cause. An unknown control channel command was received from the TPM emulator backend by the control channel thread and we end up in g_assert_not_reached().
> 
> https://github.com/qemu/qemu/blob/master/tests/qtest/tpm-emu.c#L189
> 
> 
> 
>         ret = qio_channel_read(ioc, (char *)&cmd, sizeof(cmd), NULL);
>         if (ret <= 0) {
>             break;
>         }
> 
>         cmd = be32_to_cpu(cmd);
>         switch (cmd) {
>  [...]
>         default:
>             g_debug("unimplemented %u", cmd);
>             g_assert_not_reached();                <------------------
>         }
> 
> I will run this test case in an endless loop on an x86_64 host and see what we get there ...

The QEMU stack trace shows:

#7  0x000002aa1224a2ca in tpm_emulator_cancel_cmd (tb=<optimized out>)
at ../backends/tpm/tpm_emulator.c:500
#8  0x000002aa121e68c4 in tpm_tis_mmio_write (opaque=0x2aa1529ec20,
addr=24, val=64, size=<optimized out>) at
../hw/tpm/tpm_tis_common.c:663


IOW, we're getting CMD_CANCEL_TPM_CMD, which is indeed not handled
by any 'case:' in the switch in qtest/tpm-emu.c


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


