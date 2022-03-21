Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 186774E3139
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 21:09:20 +0100 (CET)
Received: from localhost ([::1]:54276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWOL8-0001CP-Of
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 16:09:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWOJa-0000Qy-LC
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 16:07:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWOJX-0000A1-AW
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 16:07:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647893254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C69x18n+b/OPwUp5jhIlxjpBHqDKQUDoVjB/2JQK+lk=;
 b=H3bY+a2VNzXi+lUPPZ2QvYrPnyRqdnuRzhZEQgtQ5Fz54m3aw/YZc/CBP62+ZyUSfQpFGG
 VkqRaextQVe20MTxXdCBXzcvovrIOF3hbmeEPZwajSbxQAH3ybw7vaIedM9oMkTp9kY+29
 BpaITdBQhaBJuFk26WVeYy4s668KvZg=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-anr8AevfMqGFWyc2dl23fA-1; Mon, 21 Mar 2022 16:07:28 -0400
X-MC-Unique: anr8AevfMqGFWyc2dl23fA-1
Received: by mail-ua1-f69.google.com with SMTP id
 p4-20020ab01544000000b003595f320dfeso108086uae.21
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 13:07:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C69x18n+b/OPwUp5jhIlxjpBHqDKQUDoVjB/2JQK+lk=;
 b=0cOUlq3RAOl9C8f6JbcGiKCK3pk5z97ltBcmlmIh+/7AtFnT5gTR8CyOAjBc/bwOsD
 1TIQLNq3yBmHQuJnULn+YJlUs27yKhRvbrCyCx+g7JhzZvXLZt7tAc1Hua2J8kgV8IlJ
 bEsiVYB9FR2+vAlncLHcINwZbTHEHgYRjZaV39i23h9o1nnYXwPEI5huMJ+9SuXNv5Sq
 5BZKRxgPraZwF7dspg2g6Ig47DyPpcszs3Uayg300SkhZzJUke4b9YSt3MBxKCrhTFZx
 SBh9LsOZ365qY66gQHR195TkWwhA/TcPkmAwTvyui9QQ3LtNXxlMYwmOv6Cj8zGeb4BV
 00CA==
X-Gm-Message-State: AOAM533JZ0+d1qym0UWwBcveVU9aQtCrJyXoSCWTVNPMKlCUNPo941Na
 zA9bBviGJL5WdvIS8kbPvLqDmo3G7eN6I+GuNOu+Duhw5U1R2Up7xJqcbbCxrqkphQOw/UlvlCA
 jWClVgGrvupS9giYbK70kBCpbaeTsIKI=
X-Received: by 2002:a05:6102:1592:b0:324:d1a2:5718 with SMTP id
 g18-20020a056102159200b00324d1a25718mr7181061vsv.35.1647893247987; 
 Mon, 21 Mar 2022 13:07:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQaCKnPGRhjUuxEYfzdv9KqnhZrg3TCCFiygj1uwxeNxeMIAysqgav3g+caIYQjmFBxptshUKeLB2qQDBBlOs=
X-Received: by 2002:a05:6102:1592:b0:324:d1a2:5718 with SMTP id
 g18-20020a056102159200b00324d1a25718mr7181050vsv.35.1647893247707; Mon, 21
 Mar 2022 13:07:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220318203655.676907-1-jsnow@redhat.com>
 <20220318203655.676907-15-jsnow@redhat.com>
 <20220321181600.wblgnqaqhjkkf27z@redhat.com>
In-Reply-To: <20220321181600.wblgnqaqhjkkf27z@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 21 Mar 2022 16:07:16 -0400
Message-ID: <CAFn=p-aeNPkSMbpKmkr=HmaShMvEupo48CwpBYUUKCgVFrt-bQ@mail.gmail.com>
Subject: Re: [PATCH 14/15] iotests: remove qemu_io_silent() and
 qemu_io_silent_check().
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 21, 2022 at 2:16 PM Eric Blake <eblake@redhat.com> wrote:
>
> On Fri, Mar 18, 2022 at 04:36:54PM -0400, John Snow wrote:
> > Like qemu-img, qemu-io returning 0 should be the norm and not the
> > exception. Remove all calls to qemu_io_silent that just assert the
> > return code is zero (That's every last call, as it turns out), and
> > replace them with a normal qemu_io() call.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  tests/qemu-iotests/216                        | 12 +++++-----
> >  tests/qemu-iotests/218                        |  5 ++---
> >  tests/qemu-iotests/224                        |  4 ++--
> >  tests/qemu-iotests/258                        | 12 +++++-----
> >  tests/qemu-iotests/298                        | 16 ++++++--------
> >  tests/qemu-iotests/310                        | 22 +++++++++----------
> >  tests/qemu-iotests/iotests.py                 | 16 --------------
> >  tests/qemu-iotests/tests/image-fleecing       |  4 ++--
> >  .../tests/mirror-ready-cancel-error           |  2 +-
> >  .../qemu-iotests/tests/stream-error-on-reset  |  4 ++--
> >  10 files changed, 39 insertions(+), 58 deletions(-)
>
> > +++ b/tests/qemu-iotests/258
> > @@ -21,7 +21,7 @@
> >  # Creator/Owner: Max Reitz <mreitz@redhat.com>
> >
> >  import iotests
> > -from iotests import log, qemu_img, qemu_io_silent, \
> > +from iotests import log, qemu_img, qemu_io, \
> >          filter_qmp_testfiles, filter_qmp_imgfmt
> >
> >  # Returns a node for blockdev-add
> > @@ -86,15 +86,15 @@ def test_concurrent_finish(write_to_stream_node):
> >          if write_to_stream_node:
> >              # This is what (most of the time) makes commit finish
> >              # earlier and then pull in stream
> > -            assert qemu_io_silent(node2_path,
> > -                                  '-c', 'write %iK 64K' % (65536 - 192),
> > -                                  '-c', 'write %iK 64K' % (65536 -  64)) == 0
> > +            qemu_io(node2_path,
> > +                    '-c', 'write %iK 64K' % (65536 - 192),
> > +                    '-c', 'write %iK 64K' % (65536 -  64))
> >
> >              stream_throttle='tg'
> >          else:
> >              # And this makes stream finish earlier
> > -            assert qemu_io_silent(node1_path,
> > -                                  '-c', 'write %iK 64K' % (65536 - 64)) == 0
> > +            qemu_io(node1_path,
> > +                    '-c', 'write %iK 64K' % (65536 - 64))
>
> This could fit on one line.  But the split matches the instance
> earlier in the hunk that needed two lines.
>
> >
> >              commit_throttle='tg'
> >
> > diff --git a/tests/qemu-iotests/298 b/tests/qemu-iotests/298
> > index fae72211b1..9d6d95d953 100755
> > --- a/tests/qemu-iotests/298
> > +++ b/tests/qemu-iotests/298
> > @@ -129,16 +129,14 @@ class TestTruncate(iotests.QMPTestCase):
> >          os.remove(refdisk)
> >
> >      def do_test(self, prealloc_mode, new_size):
> > -        ret = iotests.qemu_io_silent('--image-opts', '-c', 'write 0 10M', '-c',
> > -                                     f'truncate -m {prealloc_mode} {new_size}',
> > -                                     drive_opts)
> > -        self.assertEqual(ret, 0)
> > +        iotests.qemu_io('--image-opts', '-c', 'write 0 10M', '-c',
> > +                        f'truncate -m {prealloc_mode} {new_size}',
> > +                        drive_opts)
> >
> > -        ret = iotests.qemu_io_silent('-f', iotests.imgfmt, '-c', 'write 0 10M',
> > -                                     '-c',
> > -                                     f'truncate -m {prealloc_mode} {new_size}',
> > -                                     refdisk)
> > -        self.assertEqual(ret, 0)
> > +        iotests.qemu_io('-f', iotests.imgfmt, '-c', 'write 0 10M',
> > +                        '-c',
> > +                        f'truncate -m {prealloc_mode} {new_size}',
>
> And as long as I'm pontificating on line wraps, putting '-c' and
> f'truncate...' on the same line might make sense.
>
> At any rate, whether or not you choose to do anything about my
> observations on cosmetic line wraps:
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
>

Rolled them in, why not.

--js


