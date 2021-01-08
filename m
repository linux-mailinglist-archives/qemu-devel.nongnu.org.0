Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD5A2EF5F5
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 17:47:01 +0100 (CET)
Received: from localhost ([::1]:42342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxuui-00035m-Rq
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 11:47:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kxurx-0001dt-Up
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:44:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kxurq-0002q0-17
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:44:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610124239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N9kNWeY9JzS/951Yh3/tb+G6JCtbaHwpFgIIZouz3aE=;
 b=JZTI0tTFfHjpgVpXIO7Xak9cIh4rpU7ynX5/QqZvXtNbB75FWga+RtuQfECFT/5pJnyIuR
 1KvRb/VPM2B+nYnHxHsxFNGFk7iNI9px6+KZqqN8F0DiwtcVBdM8UA92Haf4S4VNRdQDtW
 MZMDgBYxqxZP2ynyjRG8seDppF82kiw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561--gCRckj_OIuWG3AZyOcg6w-1; Fri, 08 Jan 2021 11:43:57 -0500
X-MC-Unique: -gCRckj_OIuWG3AZyOcg6w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E305801817;
 Fri,  8 Jan 2021 16:43:56 +0000 (UTC)
Received: from localhost (ovpn-117-149.rdu2.redhat.com [10.10.117.149])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C751B19C71;
 Fri,  8 Jan 2021 16:43:55 +0000 (UTC)
Date: Fri, 8 Jan 2021 11:43:55 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: =?utf-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Subject: Re: [PATCH] decodetree: Open files with encoding='utf-8'
Message-ID: <20210108164355.GA54056@habkost.net>
References: <20210108151632.277015-1-f4bug@amsat.org>
 <CAFEAcA_5YzU7sGhbVtzP7-=PsaJoe3wMxkCPnO=qdY8q6Bf7rw@mail.gmail.com>
 <CAE2XoE-sDrYDtKjqRQ_+=7XNmnFX3_BoJadULoLj-X3oMDaYbA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAE2XoE-sDrYDtKjqRQ_+=7XNmnFX3_BoJadULoLj-X3oMDaYbA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.247,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jan 09, 2021 at 12:13:31AM +0800, 罗勇刚(Yonggang Luo) wrote:
> On Sat, Jan 9, 2021 at 12:05 AM Peter Maydell <peter.maydell@linaro.org>
> wrote:
> >
> > On Fri, 8 Jan 2021 at 15:16, Philippe Mathieu-Daudé <f4bug@amsat.org>
> wrote:
> > >
> > > When decodetree.py was added in commit 568ae7efae7, QEMU was
> > > using Python 2 which happily reads UTF-8 files in text mode.
> > > Python 3 requires either UTF-8 locale or an explicit encoding
> > > passed to open(). Now that Python 3 is required, explicit
> > > UTF-8 encoding for decodetree sources.
> > >
> > > This fixes:
> > >
> > >   $ /usr/bin/python3 scripts/decodetree.py test.decode
> > >   Traceback (most recent call last):
> > >     File "scripts/decodetree.py", line 1397, in <module>
> > >       main()
> > >     File "scripts/decodetree.py", line 1308, in main
> > >       parse_file(f, toppat)
> > >     File "scripts/decodetree.py", line 994, in parse_file
> > >       for line in f:
> > >     File "/usr/lib/python3.6/encodings/ascii.py", line 26, in decode
> > >       return codecs.ascii_decode(input, self.errors)[0]
> > >   UnicodeDecodeError: 'ascii' codec can't decode byte 0xc3 in position
> 80:
> > >   ordinal not in range(128)
> > >
> > > Reported-by: Peter Maydell <peter.maydell@linaro.org>
> > > Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> > > ---
> > >  scripts/decodetree.py | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/scripts/decodetree.py b/scripts/decodetree.py
> > > index 47aa9caf6d1..fa40903cff1 100644
> > > --- a/scripts/decodetree.py
> > > +++ b/scripts/decodetree.py
> > > @@ -1304,7 +1304,7 @@ def main():
> > >
> > >      for filename in args:
> > >          input_file = filename
> > > -        f = open(filename, 'r')
> > > +        f = open(filename, 'r', encoding='utf-8')
> > >          parse_file(f, toppat)
> > >          f.close()
> >
> > Should we also be opening the output file explicitly as
> > utf-8 ? (How do we say "write to sys.stdout as utf-8" for
> > the case where we're doing that?)
> 
> Can be done with
> ```
>         sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf8",
> errors="ignore")
> ```

In the specific case of decodetree, just assigning this to
`output_fd` is enough, and less hacky than overwriting
`sys.stdout`.

-- 
Eduardo


