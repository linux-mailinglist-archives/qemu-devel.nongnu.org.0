Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E2B6656E6
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 10:06:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFX3U-0003Zd-Iq; Wed, 11 Jan 2023 04:05:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFX3T-0003ZP-3R
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 04:05:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFX3P-0001lB-3K
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 04:05:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673427950;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M3uitjB47Dckf2kVHOO11345ZF0TjYkr0HLcIqN/fhE=;
 b=X6YXy4o6LYYg6XU1jaWNylsGr1da1x5Fh+FR5n3jFPwYSyKL2I+fhSobrFGt2ISBtlACWA
 yH2Im9Pv3edhFQZ9lj6/rR3XAcXelw3rjrC5/uOLFyM2nfsLpdDIGhZQdUhi/ijC1AiQHH
 vwTFlC0XfHiaBXpsFTYjPEDXaNrprxQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-218-o_Bv_vFXNwCk5vUjhStcnA-1; Wed, 11 Jan 2023 04:05:48 -0500
X-MC-Unique: o_Bv_vFXNwCk5vUjhStcnA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 579493C1068D;
 Wed, 11 Jan 2023 09:05:48 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.119])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D6E51121318;
 Wed, 11 Jan 2023 09:05:46 +0000 (UTC)
Date: Wed, 11 Jan 2023 09:05:44 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: intermittent hang, s390x host, bios-tables-test test, TPM
Message-ID: <Y7576DXofEJC24q6@redhat.com>
References: <CAFEAcA-f39VfWEwb-zRabjVoO-XQ-0V=iCFu1PVjg7eYChszbA@mail.gmail.com>
 <32c53c77-5827-7839-94a1-73003bc3f8af@linux.ibm.com>
 <f1da5e4a-82ef-6da5-8669-634664c5d1e0@linux.ibm.com>
 <Y728JSBMRtdl1VUK@redhat.com>
 <410f90dd-4ad1-2294-f1b3-9c7f9aeba113@linux.ibm.com>
 <6a0957eb-6108-82ac-675a-fc20de94a2e0@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6a0957eb-6108-82ac-675a-fc20de94a2e0@linux.ibm.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

On Tue, Jan 10, 2023 at 05:02:58PM -0500, Stefan Berger wrote:
> 
> 
> On 1/10/23 14:47, Stefan Berger wrote:
> > 
> > 
> > On 1/10/23 14:27, Daniel P. Berrangé wrote:
> > > On Tue, Jan 10, 2023 at 01:50:26PM -0500, Stefan Berger wrote:
> > > > 
> > > > 
> > > > On 1/6/23 10:16, Stefan Berger wrote:
> > > > > This here seems to be the root cause. An unknown control channel
> > > > > command was received from the TPM emulator backend by the control channel thread and we end up in g_assert_not_reached().
> > > > > 
> > > > > https://github.com/qemu/qemu/blob/master/tests/qtest/tpm-emu.c#L189
> > > > > 
> > > > > 
> > > > > 
> > > > >           ret = qio_channel_read(ioc, (char *)&cmd, sizeof(cmd), NULL);
> > > > >           if (ret <= 0) {
> > > > >               break;
> > > > >           }
> > > > > 
> > > > >           cmd = be32_to_cpu(cmd);
> > > > >           switch (cmd) {
> > > > >    [...]
> > > > >           default:
> > > > >               g_debug("unimplemented %u", cmd);
> > > > >               g_assert_not_reached();                <------------------
> > > > >           }
> > > > > 
> > > > > I will run this test case in an endless loop on an x86_64 host and see what we get there ...
> > > > 
> > > > I could not recreate the issue running the  test on a ppc64 and x86_64
> > > > host. There we like >100k test runs on ppc64 and >40k on x86_64. Also
> > > > simulating the reception of an unsupported command did not lead to a
> > > > hang like shown here.
> > > 
> > > Assuming your ppc64 host is running an little endian OS, and
> > > we're only seeing the test failure on s390x, then it points towards
> > > the problem being an endianness issue in the TPM code. Something
> > > missing a byteswap somewhere along the way ?
> > 
> > Yes, my ppc64 machine is also little endian. If the issue  was not an intermittent but a permanent
> > failure I would look for something like that. I would think it's more some sort of initialization
> > issue, like a value on the stack that occasionally set to an undesirable value -- maybe even in a
> > dependency.
> 
> I found I still had access to an s390x machine. ~2700 loops on this test case
> so far but nothing... it would be good to be able to recreate the issue and
> apply the fix but we'll have to do it without testing then I guess.
> 
> Does this look about right? From my tests with injecting an error it at least
> seems to do what it is intended to do.
> 
> diff --git a/tests/qtest/tpm-emu.c b/tests/qtest/tpm-emu.c
> index 2994d1cf42..dbc308a572 100644
> --- a/tests/qtest/tpm-emu.c
> +++ b/tests/qtest/tpm-emu.c
> @@ -36,11 +36,19 @@ void tpm_emu_test_wait_cond(TPMTestState *s)
>      g_mutex_unlock(&s->data_mutex);
>  }
> 
> +static void tpm_emu_close_data_ioc(void *ioc)
> +{
> +    g_debug("CLOSE DATA IOC");
> +    qio_channel_close(ioc, NULL);
> +}
> +
>  static void *tpm_emu_tpm_thread(void *data)
>  {
>      TPMTestState *s = data;
>      QIOChannel *ioc = s->tpm_ioc;
> 
> +    qtest_add_abrt_handler(tpm_emu_close_data_ioc, ioc);
> +
>      s->tpm_msg = g_new(struct tpm_hdr, 1);
>      while (true) {
>          int minhlen = sizeof(s->tpm_msg->tag) + sizeof(s->tpm_msg->len);
> @@ -77,12 +85,19 @@ static void *tpm_emu_tpm_thread(void *data)
>                            &error_abort);
>      }
> 
> +    qtest_remove_abrt_handler(ioc);
>      g_free(s->tpm_msg);
>      s->tpm_msg = NULL;
>      object_unref(OBJECT(s->tpm_ioc));
>      return NULL;
>  }
> 
> +static void tpm_emu_close_ctrl_ioc(void *ioc)
> +{
> +    g_debug("CLOSE CTRL IOC");
> +    qio_channel_close(ioc, NULL);
> +}
> +
>  void *tpm_emu_ctrl_thread(void *data)
>  {
>      TPMTestState *s = data;
> @@ -119,6 +134,8 @@ void *tpm_emu_ctrl_thread(void *data)
>          s->emu_tpm_thread = g_thread_new(NULL, tpm_emu_tpm_thread, s);
>      }
> 
> +    qtest_add_abrt_handler(tpm_emu_close_ctrl_ioc, ioc);

I'd suggest this be done before starting tpm_emu_tpm_thread,
immediately after the "ioc" is created. 

> +
>      while (true) {
>          uint32_t cmd;
>          ssize_t ret;
> @@ -129,6 +146,9 @@ void *tpm_emu_ctrl_thread(void *data)
>          }
> 
>          cmd = be32_to_cpu(cmd);
> +        //g_debug("cmd=%u", cmd);
> +        //if (cmd == 14)
> +        //    cmd = 100;
>          switch (cmd) {
>          case CMD_GET_CAPABILITY: {
>              ptm_cap cap = cpu_to_be64(0x3fff);
> @@ -190,6 +210,8 @@ void *tpm_emu_ctrl_thread(void *data)
>          }
>      }
> 
> +    qtest_remove_abrt_handler(ioc);
> +
>      object_unref(OBJECT(ioc));
>      object_unref(OBJECT(lioc));
>      return NULL;
> 
> > 
> >     Stefan
> > 
> > > 
> > > 
> > > With regards,
> > > Daniel
> > 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


