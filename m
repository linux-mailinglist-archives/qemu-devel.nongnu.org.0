Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DF5664CA1
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 20:38:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFKHt-0000dQ-1K; Tue, 10 Jan 2023 14:27:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFKHh-0000cR-0D
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 14:27:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFKHe-0000bq-Ne
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 14:27:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673378861;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fNNPggZOIwpsQZhHOFl126vE235Q5/C4TxrJWTgFblg=;
 b=BJdoQSvKt0KHP/CgmX964xkW8hVn6clq8Rh4ImS/nqlvCK5o/7sD25aeyYt+zXTq1X+CpG
 fKm0WAtAVRPF+Hvfpp2A7NI2rdTRfiiignXKTCqqaYiltRktvcDTqmhKkfPGTX/96N/jXk
 6mUmSTD39QjYkLUynWYyLzXULHzFycg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-mB_OqraMPKag2wObuw2CRw-1; Tue, 10 Jan 2023 14:27:38 -0500
X-MC-Unique: mB_OqraMPKag2wObuw2CRw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF9BB101A52E;
 Tue, 10 Jan 2023 19:27:37 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38685140EBF4;
 Tue, 10 Jan 2023 19:27:36 +0000 (UTC)
Date: Tue, 10 Jan 2023 19:27:33 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: intermittent hang, s390x host, bios-tables-test test, TPM
Message-ID: <Y728JSBMRtdl1VUK@redhat.com>
References: <CAFEAcA-f39VfWEwb-zRabjVoO-XQ-0V=iCFu1PVjg7eYChszbA@mail.gmail.com>
 <32c53c77-5827-7839-94a1-73003bc3f8af@linux.ibm.com>
 <f1da5e4a-82ef-6da5-8669-634664c5d1e0@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1da5e4a-82ef-6da5-8669-634664c5d1e0@linux.ibm.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Tue, Jan 10, 2023 at 01:50:26PM -0500, Stefan Berger wrote:
> 
> 
> On 1/6/23 10:16, Stefan Berger wrote:
>> This here seems to be the root cause. An unknown control channel
>> command was received from the TPM emulator backend by the control channel thread and we end up in g_assert_not_reached().
> > 
> > https://github.com/qemu/qemu/blob/master/tests/qtest/tpm-emu.c#L189
> > 
> > 
> > 
> >          ret = qio_channel_read(ioc, (char *)&cmd, sizeof(cmd), NULL);
> >          if (ret <= 0) {
> >              break;
> >          }
> > 
> >          cmd = be32_to_cpu(cmd);
> >          switch (cmd) {
> >   [...]
> >          default:
> >              g_debug("unimplemented %u", cmd);
> >              g_assert_not_reached();                <------------------
> >          }
> > 
> > I will run this test case in an endless loop on an x86_64 host and see what we get there ...
> 
> I could not recreate the issue running the  test on a ppc64 and x86_64
> host. There we like >100k test runs on ppc64 and >40k on x86_64. Also
> simulating the reception of an unsupported command did not lead to a
> hang like shown here.

Assuming your ppc64 host is running an little endian OS, and
we're only seeing the test failure on s390x, then it points towards
the problem being an endianness issue in the TPM code. Something
missing a byteswap somewhere along the way ?


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


