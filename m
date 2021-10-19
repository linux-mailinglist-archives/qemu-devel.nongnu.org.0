Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7F7432E17
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 08:22:17 +0200 (CEST)
Received: from localhost ([::1]:40858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mciVs-000435-5q
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 02:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mciUI-0003Ha-Kw
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 02:20:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mciUG-0001h5-IN
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 02:20:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634624436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J1IZY4Nbx5NdV+mp5/pNEP8kgrb/LDtmhXMbJhZvodI=;
 b=cntJ1b2z+QFdIMS/hs7LGarkx6ZH1tNR9ShjiCHGflr8bUjcSlPd27t9wSCCYJIQQeCYaW
 aCNI5r4jfCnLFnZv208nAkWe1H0+l14CQMt32uZboJPNMgI8Mc7V789zi1ctXcz+twcFrR
 OKkWOSb8m4Yv0j19DAtokXFOAZ8h5RE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-GGnW659DOlerPO-ZIkbAQA-1; Tue, 19 Oct 2021 02:20:34 -0400
X-MC-Unique: GGnW659DOlerPO-ZIkbAQA-1
Received: by mail-wr1-f72.google.com with SMTP id
 j12-20020adf910c000000b0015e4260febdso2714062wrj.20
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 23:20:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=J1IZY4Nbx5NdV+mp5/pNEP8kgrb/LDtmhXMbJhZvodI=;
 b=mL0v55GTjfF78MGc+EejWUInyCwqSuHmTypeEBeHayQLzWmu2u+H3RgeACnRDsXyZs
 LAznPpkAPosP8ViAfKBNejaWGNdawkus5Gv/UYRq0vRc1CQ4mKOisGWpmU1VpgbmoA+9
 RVEsuXyz04SJ2daHk8w5VIHwDuw9ui4jXToiixbA+YYnKMKFTBlTKXuASJJCpRa5RG2I
 MGcpNHSNtS8UJH7hNE3fV7KgaudPiSwlDwrGNC5PiYq3sDdrjUgNRh6zHlhIVnE3enrO
 s54NESyq5g3LV730ZeI9xgRPMDCFH8axixcxIWoZmcnx5ubPmWqbaUvLUejNDgFlM9f9
 0Hdg==
X-Gm-Message-State: AOAM532ISWF4aUuqmANNbltSgrlATIKST+jnpkKQOfA7tvzyY+G3OjVL
 0UWCoNbGF+hs8A26YTuKGEgfGi0SnYSJT7XPxD4oDQdi+1uzMwp19nkqVdMmxmK7hsaK0mkiFVx
 9TjTOIPMLEtKIz5g=
X-Received: by 2002:a1c:80d0:: with SMTP id b199mr4012480wmd.40.1634624433023; 
 Mon, 18 Oct 2021 23:20:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYG8Wm5Q8ayZ2Vz+kZauOSn5qT2HumTYNvfgc7RCopNeZGvjgOBuJlHsGt4unquOC3zBq7Og==
X-Received: by 2002:a1c:80d0:: with SMTP id b199mr4012461wmd.40.1634624432770; 
 Mon, 18 Oct 2021 23:20:32 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id l6sm1348330wmq.17.2021.10.18.23.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 23:20:32 -0700 (PDT)
Date: Tue, 19 Oct 2021 02:20:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: Re: [PATCH v6] Work around vhost-user-blk-test hang
Message-ID: <20211019021558-mutt-send-email-mst@kernel.org>
References: <20211014043216.10325-1-raphael.norwitz@nutanix.com>
 <20211018171738-mutt-send-email-mst@kernel.org>
 <20211018223258.GA11100@raphael-debian-dev>
MIME-Version: 1.0
In-Reply-To: <20211018223258.GA11100@raphael-debian-dev>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 18, 2021 at 10:33:02PM +0000, Raphael Norwitz wrote:
> On Mon, Oct 18, 2021 at 05:50:41PM -0400, Michael S. Tsirkin wrote:
> > On Thu, Oct 14, 2021 at 04:32:23AM +0000, Raphael Norwitz wrote:
> > > The vhost-user-blk-test qtest has been hanging intermittently for a
> > > while. The root cause is not yet fully understood, but the hang is
> > > impacting enough users that it is important to merge a workaround for
> > > it.
> > > 
> > > The race which causes the hang occurs early on in vhost-user setup,
> > > where a vhost-user message is never received by the backend. Forcing
> > > QEMU to wait until the storage-daemon has had some time to initialize
> > > prevents the hang. Thus the existing storage-daemon pidfile option can
> > > be used to implement a workaround cleanly and effectively, since it
> > > creates a file only once the storage-daemon initialization is complete.
> > > 
> > > This change implements a workaround for the vhost-user-blk-test hang by
> > > making QEMU wait until the storage-daemon has written out a pidfile
> > > before attempting to connect and send messages over the vhost-user
> > > socket.
> > > 
> > > Some relevent mailing list discussions:
> > > 
> > > [1] https://urldefense.proofpoint.com/v2/url?u=https-3A__lore.kernel.org_qemu-2Ddevel_CAFEAcA8kYpz9LiPNxnWJAPSjc-3Dnv532bEdyfynaBeMeohqBp3A-40mail.gmail.com_&d=DwIBAg&c=s883GpUCOChKOHiocYtGcg&r=In4gmR1pGzKB8G5p6LUrWqkSMec2L5EtXZow_FZNJZk&m=eDRDFhe3H61BSSpDvy3PKzwQIa2grX5hNMhigtjMCJ8&s=c6OKIl0NMsDqP0-ZNnVjHhDq2psXIVszz-uBKw_8pEo&e= 
> > > [2] https://urldefense.proofpoint.com/v2/url?u=https-3A__lore.kernel.org_qemu-2Ddevel_YWaky-252FKVbS-252FKZjlV-40stefanha-2Dx1.localdomain_&d=DwIBAg&c=s883GpUCOChKOHiocYtGcg&r=In4gmR1pGzKB8G5p6LUrWqkSMec2L5EtXZow_FZNJZk&m=eDRDFhe3H61BSSpDvy3PKzwQIa2grX5hNMhigtjMCJ8&s=B4EM_0f7TXqsh18YEKOg-cFHabUjsVA5Ie1riDXaB7A&e= 
> > > 
> > > Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> > > Reviewed-by: Eric Blake <eblake@redhat.com>
> > 
> > 
> > Um. Does not seem to make things better for me:
> > 
> > **
> > ERROR:../tests/qtest/vhost-user-blk-test.c:950:start_vhost_user_blk: assertion failed (retries < PIDFILE_RETRIES): (5 < 5)
> > ERROR qtest-x86_64/qos-test - Bail out! ERROR:../tests/qtest/vhost-user-blk-test.c:950:start_vhost_user_blk: assertion failed (retries < PIDFILE_RETRIES): (5 < 5)
> > 
> > At this point I just disabled the test in meson. No need to make
> > everyone suffer.
> 
> Makes sense. Do you still want to persue the workaround?
> 
> If so, can you share some details on how you're running the test?
> 
> I've gone through 1000+ iterations using the script I posted here:
> https://lore.kernel.org/qemu-devel/20210827165253.GA14291@raphael-debian-dev/
> without hitting a failure.

Hmm my box was busy... now that it's idle I can't repro the failure.



> >
> > 
> > > ---
> > >  tests/qtest/vhost-user-blk-test.c | 29 ++++++++++++++++++++++++++++-
> > >  1 file changed, 28 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk-test.c
> > > index 6f108a1b62..c6626a286b 100644
> > > --- a/tests/qtest/vhost-user-blk-test.c
> > > +++ b/tests/qtest/vhost-user-blk-test.c
> > > @@ -24,6 +24,7 @@
> > >  #define TEST_IMAGE_SIZE         (64 * 1024 * 1024)
> > >  #define QVIRTIO_BLK_TIMEOUT_US  (30 * 1000 * 1000)
> > >  #define PCI_SLOT_HP             0x06
> > > +#define PIDFILE_RETRIES         5
> > >  
> > >  typedef struct {
> > >      pid_t pid;
> > 
> > 
> > Don't like the arbitrary retries counter.
> > 
> > Let's warn maybe, but on a busy machine we might not complete this
> > in time ...
> 
> So you would like it to warn and keep trying forever? Or would you
> rather set a much more lenient deadline? (1 min? 5 min?)

I'm not entirely sure ... Maybe 1 min is enough.
But we want to check that daemon is alive.
And maybe print something about still waiting for it to come up
every X seconds?

> > 
> > 
> > > @@ -885,7 +886,8 @@ static void start_vhost_user_blk(GString *cmd_line, int vus_instances,
> > >                                   int num_queues)
> > >  {
> > >      const char *vhost_user_blk_bin = qtest_qemu_storage_daemon_binary();
> > > -    int i;
> > > +    int i, retries;
> > > +    char *daemon_pidfile_path;
> > >      gchar *img_path;
> > >      GString *storage_daemon_command = g_string_new(NULL);
> > >      QemuStorageDaemonState *qsd;
> > > @@ -898,6 +900,8 @@ static void start_vhost_user_blk(GString *cmd_line, int vus_instances,
> > >              " -object memory-backend-memfd,id=mem,size=256M,share=on "
> > >              " -M memory-backend=mem -m 256M ");
> > >  
> > > +    daemon_pidfile_path = g_strdup_printf("/tmp/daemon-%d", getpid());
> > > +
> > 
> > Ugh. Predictable paths directly in /tmp are problematic .. mktemp?
> > 
> 
> Ack
> 
> > >      for (i = 0; i < vus_instances; i++) {
> > >          int fd;
> > >          char *sock_path = create_listen_socket(&fd);
> > > @@ -914,6 +918,9 @@ static void start_vhost_user_blk(GString *cmd_line, int vus_instances,
> > >                                 i + 1, sock_path);
> > >      }
> > >  
> > > +    g_string_append_printf(storage_daemon_command, "--pidfile %s ",
> > > +                           daemon_pidfile_path);
> > > +
> > >      g_test_message("starting vhost-user backend: %s",
> > >                     storage_daemon_command->str);
> > >      pid_t pid = fork();
> > > @@ -930,7 +937,27 @@ static void start_vhost_user_blk(GString *cmd_line, int vus_instances,
> > >          execlp("/bin/sh", "sh", "-c", storage_daemon_command->str, NULL);
> > >          exit(1);
> > >      }
> > > +
> > > +    /*
> > > +     * FIXME: The loop here ensures the storage-daemon has come up properly
> > > +     *        before allowing the test to proceed. This is a workaround for
> > > +     *        a race which used to cause the vhost-user-blk-test to hang. It
> > > +     *        should be deleted once the root cause is fully understood and
> > > +     *        fixed.
> > > +     */
> > > +    retries = 0;
> > > +    while (access(daemon_pidfile_path, F_OK) != 0) {
> > > +        g_assert_cmpint(retries, <, PIDFILE_RETRIES);
> > > +
> > > +        retries++;
> > > +        g_usleep(1000);
> > > +    }
> > > +
> > >      g_string_free(storage_daemon_command, true);
> > > +    if (access(daemon_pidfile_path, F_OK) == 0) {
> > > +        unlink(daemon_pidfile_path);
> > > +    }
> > > +    g_free(daemon_pidfile_path);
> > >  
> > >      qsd = g_new(QemuStorageDaemonState, 1);
> > >      qsd->pid = pid;
> > > -- 
> > > 2.20.1
> > 


