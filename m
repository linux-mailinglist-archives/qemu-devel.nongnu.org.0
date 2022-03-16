Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5898A4DB911
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 20:51:01 +0100 (CET)
Received: from localhost ([::1]:44984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUZff-0004JS-Ve
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 15:50:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nUZeI-0003Qj-Ro
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 15:49:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nUZeF-0000u5-R6
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 15:49:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647460170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HmPkR8F5cUuO9WSmmjvcC0eujKaJVhXkybKoNOXuAPc=;
 b=hJLUjcOao+4p5Mpddn+yeVHXb6FKtqiqFoJg8XT3XNRHkXJQgsG/pFzrMype2hAKVKMwk8
 cJJoFwDrwliPTCNKer3a/yxNqcZbC088I9mX4ygVgLdJE+nwX0TzcNTZDmL/q/uRfSz66E
 FCDk09n3AJcdVuBgkugzfUiPOZq6SCs=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455--_8yIu7gME-VO-lpP_Xusg-1; Wed, 16 Mar 2022 15:49:29 -0400
X-MC-Unique: -_8yIu7gME-VO-lpP_Xusg-1
Received: by mail-yb1-f199.google.com with SMTP id
 k13-20020a25c60d000000b006339008b92fso1995190ybf.1
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 12:49:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HmPkR8F5cUuO9WSmmjvcC0eujKaJVhXkybKoNOXuAPc=;
 b=kB7x+rnnqLEj4QAUd0bvQ8FuZHCQpaJwiDvEriQH8ruvpx/a1VHne/RqCVQ7EnnrRe
 gtsLznfHwIC8nYmhtXHUN4XSsnoH/sQh+lUIwJYXcOE0eJjoMpDbF/5wxRllZ8UGWTzy
 TAkPqwXgi31IUIK4pkLrG7Yp2jFNSDh0cUN34fCrsNb/jjob5fh82Ssm5xTPspuFslVI
 yupxok4AkS1SKQRFmJjIfJXjXTBQVNurCo+pVW/9wrNtv+5CawjKqKxsd3bfHLNji3BH
 AHVi1Rgth+aBH7ZtCdJWM9wwETAoaXJEnuhAxGIZSCCaGVoz//Iwuuws4nXHnAFQ/ENZ
 Qoxw==
X-Gm-Message-State: AOAM530D5ToSuSey0wSIQE/WLX+iZFKnQaamlGySidmpVp3oCKn0PqKT
 0EZkGetwTYGLNKjNv6rpDeG90s+Dep7pG92IMX07exQDpEWLxjx/MxSg15WaSMUDz3yStVTciDj
 T8O4OXs4rLDylBLipy2EcS6/YJU0bplo=
X-Received: by 2002:a81:5dd5:0:b0:2dc:19cf:17ac with SMTP id
 r204-20020a815dd5000000b002dc19cf17acmr2001000ywb.312.1647460169206; 
 Wed, 16 Mar 2022 12:49:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxs4vlxPHCmvEL+QLl58POsRAsEEFv0xU2PEoCp4EY5TZRS202MXzdEQ/4+iJ8gmvsW+OKdw3ICcTS33kiccxg=
X-Received: by 2002:a81:5dd5:0:b0:2dc:19cf:17ac with SMTP id
 r204-20020a815dd5000000b002dc19cf17acmr2000957ywb.312.1647460168968; Wed, 16
 Mar 2022 12:49:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220316095248.2613601-1-marcandre.lureau@redhat.com>
 <dce310d7-35a6-d3df-734a-c9d184fc282c@gmail.com>
 <617011dd-6d19-cb2d-c98d-747e1821d545@redhat.com>
In-Reply-To: <617011dd-6d19-cb2d-c98d-747e1821d545@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 16 Mar 2022 23:49:17 +0400
Message-ID: <CAMxuvawgFL4w73ZUmk9ib5FOmU5Wc05=7gga2ZJqpWpF=VkWFw@mail.gmail.com>
Subject: Re: [PATCH 07/27] Replace GCC_FMT_ATTR with G_GNUC_PRINTF
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Konstantin Kostiuk <kkostiuk@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eric Blake <eblake@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "open list:blkverify" <qemu-block@nongnu.org>,
 Huacai Chen <chenhuacai@kernel.org>, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Jiri Pirko <jiri@resnulli.us>, Kyle Evans <kevans@freebsd.org>,
 Greg Kurz <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paul Durrant <paul@xen.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>, "Richard W.M. Jones" <rjones@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Wed, Mar 16, 2022 at 5:28 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 16/03/2022 14.16, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 16/3/22 10:52, marcandre.lureau@redhat.com wrote:
> >> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >>
> >> One less qemu-specific macro. It also helps to make some headers/units
> >> only depend on glib, and thus moved in standalone projects eventually.
> >>
> >> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >> ---
> >>   audio/audio.h                           |  4 +--
> >>   block/qcow2.h                           |  2 +-
> >>   bsd-user/qemu.h                         |  2 +-
> >>   hw/display/qxl.h                        |  2 +-
> >>   hw/net/rocker/rocker.h                  |  2 +-
> >>   hw/xen/xen_pt.h                         |  2 +-
> >>   include/chardev/char-fe.h               |  2 +-
> >>   include/disas/dis-asm.h                 |  2 +-
> >>   include/hw/acpi/aml-build.h             | 12 +++----
> >>   include/hw/core/cpu.h                   |  2 +-
> >>   include/hw/hw.h                         |  2 +-
> >>   include/hw/virtio/virtio.h              |  2 +-
> >>   include/hw/xen/xen-bus-helper.h         |  4 +--
> >>   include/hw/xen/xen-bus.h                |  4 +--
> >>   include/hw/xen/xen_common.h             |  2 +-
> >>   include/hw/xen/xen_pvdev.h              |  2 +-
> >>   include/monitor/monitor.h               |  4 +--
> >>   include/qapi/error.h                    | 20 ++++++------
> >>   include/qapi/qmp/qjson.h                |  8 ++---
> >>   include/qemu/buffer.h                   |  2 +-
> >>   include/qemu/compiler.h                 | 11 ++-----
> >>   include/qemu/error-report.h             | 24 +++++++-------
> >>   include/qemu/log-for-trace.h            |  2 +-
> >>   include/qemu/log.h                      |  2 +-
> >>   include/qemu/qemu-print.h               |  8 ++---
> >>   include/qemu/readline.h                 |  2 +-
> >>   qga/guest-agent-core.h                  |  2 +-
> >>   qga/vss-win32/requester.h               |  2 +-
> >>   scripts/cocci-macro-file.h              |  2 +-
> >>   tests/qtest/libqos/libqtest.h           | 42 ++++++++++++-----------=
--
> >>   tests/qtest/libqtest-single.h           |  2 +-
> >>   tests/qtest/migration-helpers.h         |  6 ++--
> >>   audio/alsaaudio.c                       |  4 +--
> >>   audio/dsoundaudio.c                     |  4 +--
> >>   audio/ossaudio.c                        |  4 +--
> >>   audio/paaudio.c                         |  2 +-
> >>   audio/sdlaudio.c                        |  2 +-
> >>   block/blkverify.c                       |  2 +-
> >>   block/ssh.c                             |  4 +--
> >>   fsdev/9p-marshal.c                      |  2 +-
> >>   fsdev/virtfs-proxy-helper.c             |  2 +-
> >>   hw/9pfs/9p.c                            |  2 +-
> >>   hw/acpi/aml-build.c                     |  4 +--
> >>   hw/mips/fuloong2e.c                     |  2 +-
> >>   hw/mips/malta.c                         |  2 +-
> >>   hw/net/rtl8139.c                        |  2 +-
> >>   hw/virtio/virtio.c                      |  2 +-
> >>   io/channel-websock.c                    |  2 +-
> >>   monitor/hmp.c                           |  4 +--
> >>   nbd/server.c                            | 10 +++---
> >>   qemu-img.c                              |  4 +--
> >>   qemu-io.c                               |  2 +-
> >>   qobject/json-parser.c                   |  2 +-
> >>   softmmu/qtest.c                         |  4 +--
> >>   tests/qtest/libqtest.c                  |  2 +-
> >>   tests/unit/test-qobject-input-visitor.c |  4 +--
> >>   audio/coreaudio.m                       |  4 +--
> >>   scripts/checkpatch.pl                   |  2 +-
> >>   58 files changed, 130 insertions(+), 137 deletions(-)
> >
> >> diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
> >> index 3baa5e3790f7..f2bd050e3b9a 100644
> >> --- a/include/qemu/compiler.h
> >> +++ b/include/qemu/compiler.h
> >> @@ -79,19 +79,12 @@
> >>   #define QEMU_BUILD_BUG_ON_ZERO(x) (sizeof(QEMU_BUILD_BUG_ON_STRUCT(x=
)) - \
> >>                                      sizeof(QEMU_BUILD_BUG_ON_STRUCT(x=
)))
> >> -#if defined(__clang__)
> >> -/* clang doesn't support gnu_printf, so use printf. */
> >> -# define GCC_FMT_ATTR(n, m) __attribute__((format(printf, n, m)))
> >> -#else
> >> -/* Use gnu_printf (qemu uses standard format strings). */
> >> -# define GCC_FMT_ATTR(n, m) __attribute__((format(gnu_printf, n, m)))
> >> -# if defined(_WIN32)
> >> +#if !defined(__clang__) && defined(_WIN32)
> >>   /*
> >>    * Map __printf__ to __gnu_printf__ because we want standard format
> >> strings even
> >>    * when MinGW or GLib include files use __printf__.
> >>    */
> >> -#  define __printf__ __gnu_printf__
> >> -# endif
> >> +# define __printf__ __gnu_printf__
> >>   #endif
> >
> > Can we also poison GCC_FMT_ATTR? Maybe split in 2 patches, 1 converting
> > and another removing unused & poisoning?
>
> I don't think that poisoning is required here since this macro is not use=
d
> in "#ifdef" statements - so the compiler will complain to you if you stil=
l
> try to use it after the removal.

Yes (same for other macros in this series)
thanks


