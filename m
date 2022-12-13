Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DDB64B90B
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 16:58:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p57eb-0000SI-4l; Tue, 13 Dec 2022 10:57:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1p57eX-0000Rb-18
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 10:57:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1p57eV-0001oW-60
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 10:57:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670947025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0PPfx008m7TUb3cdmrB5w+KrOnVINKnvcpp+s87fiHI=;
 b=ZvVxVvVK77JFMDWLRkmJQBPAJd3IN8wIaReHUD4gRJnDWO6sJpnGkJij1dmSyVo3Ahkms6
 KORZrPlCri1WTnyw4hA/BgXkytlYICGVb1H52CSLYjnfowqjgRzaMyRa7n8R5PlR868Fgb
 VvYX8wU2vsV668xG7wHpWGXjrmf9ebU=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-149-7jTt5FTyM22cJtoK-E-l2w-1; Tue, 13 Dec 2022 10:57:04 -0500
X-MC-Unique: 7jTt5FTyM22cJtoK-E-l2w-1
Received: by mail-qv1-f69.google.com with SMTP id
 q17-20020a056214019100b004b1d3c9f3acso14888714qvr.0
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 07:57:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0PPfx008m7TUb3cdmrB5w+KrOnVINKnvcpp+s87fiHI=;
 b=C4zupaapMRENGaKixjbM78PF/PcicTITVl/bwZhPntIQPDznzLVheOzU10aJnT0k73
 6DbmMn3CXcc0F3UOFaBrUu3YKWE0gbTsacbyeiYr5fxEo//pwZDreb9Fj/ITkh8bEzMR
 ivGMMuyeLV5oaRNdcv9nn0X7vQK2zA/yVr2Ku3JV2/lzLiIccafwlK4rlCOTP0CV5J4n
 fNHXvdID7h3M8jeH4PxCMvTUf2wkjzeEh5TQwlMYjzLLrCBAb0MTXZYPkKEqd/NxgQE9
 rxWlREt8S3iNtmhT3ifObqv9og6/8Yt4X7BUgeA6cBI3YFlnR2p/s5QmfPtMUP+aJqqh
 Ctdw==
X-Gm-Message-State: ANoB5pkhQgpw2j6pSKm1f/Vqb3/2BcNAXCHdoSQoVamD7rQs6Ov+C3vU
 LIPJRTQ6Eh/l50SAJhconT6zbsP8WybpoGWY9X+VMUUK8eX3g8ve8z/POS1beEjIzuVHQHx2LGg
 COTxXaq5qTX9pNm8zxUolzBVQzllrbKw=
X-Received: by 2002:a05:620a:8016:b0:6fc:c46f:b14c with SMTP id
 ee22-20020a05620a801600b006fcc46fb14cmr18753502qkb.442.1670947023595; 
 Tue, 13 Dec 2022 07:57:03 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5StQKdt8WOphc7oqVUkcRcf15IIr6ISbIxf6kOrHkoK23Lrk8XxS7E1Ax5D3YZ5gksKmtIpRjEV5Y8isQ67L8=
X-Received: by 2002:a05:620a:8016:b0:6fc:c46f:b14c with SMTP id
 ee22-20020a05620a801600b006fcc46fb14cmr18753490qkb.442.1670947023310; Tue, 13
 Dec 2022 07:57:03 -0800 (PST)
MIME-Version: 1.0
References: <20221128141514.388724-1-nsoffer@redhat.com>
 <20221128141514.388724-3-nsoffer@redhat.com>
 <a5923263-befe-30a4-afa2-a80ecb6b1ad2@redhat.com>
In-Reply-To: <a5923263-befe-30a4-afa2-a80ecb6b1ad2@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Tue, 13 Dec 2022 17:56:47 +0200
Message-ID: <CAMRbyyvG4s2c96xy=SNmFv26zG2nwMDH+Da71L_QQ1HjJ6zs5Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] Support format or cache specific out file
To: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 qemu-block@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Mon, Dec 12, 2022 at 12:38 PM Hanna Reitz <hreitz@redhat.com> wrote:
>
> On 28.11.22 15:15, Nir Soffer wrote:
> > Extend the test finder to find tests with format (*.out.qcow2) or cache
> > specific (*.out.nocache) out file. This worked before only for the
> > numbered tests.
> > ---
> >   tests/qemu-iotests/findtests.py | 10 ++++++++--
> >   1 file changed, 8 insertions(+), 2 deletions(-)
>
> This patch lacks an S-o-b, too.
>
> > diff --git a/tests/qemu-iotests/findtests.py b/tests/qemu-iotests/findt=
ests.py
> > index dd77b453b8..f4344ce78c 100644
> > --- a/tests/qemu-iotests/findtests.py
> > +++ b/tests/qemu-iotests/findtests.py
> > @@ -38,31 +38,37 @@ def chdir(path: Optional[str] =3D None) -> Iterator=
[None]:
> >           os.chdir(saved_dir)
> >
> >
> >   class TestFinder:
> >       def __init__(self, test_dir: Optional[str] =3D None) -> None:
> >           self.groups =3D defaultdict(set)
> >
> >           with chdir(test_dir):
> >               self.all_tests =3D glob.glob('[0-9][0-9][0-9]')
> >               self.all_tests +=3D [f for f in glob.iglob('tests/*')
> > -                               if not f.endswith('.out') and
> > -                               os.path.isfile(f + '.out')]
> > +                               if self.is_test(f)]
>
> So previously a file was only considered a test file if there was a
> corresponding reference output file (`f + '.out'`), so files without
> such a reference output aren=E2=80=99t considered test files...
>
> >               for t in self.all_tests:
> >                   with open(t, encoding=3D"utf-8") as f:
> >                       for line in f:
> >                           if line.startswith('# group: '):
> >                               for g in line.split()[2:]:
> >                                   self.groups[g].add(t)
> >                               break
> >
> > +    def is_test(self, fname: str) -> bool:
> > +        """
> > +        The tests directory contains tests (no extension) and out file=
s
> > +        (*.out, *.out.{format}, *.out.{option}).
> > +        """
> > +        return re.search(r'.+\.out(\.\w+)?$', fname) is None
>
> ...but this new function doesn=E2=80=99t check that.  I think we should c=
heck it
> (just whether there=E2=80=99s any variant of `/{fname}\.out(\.\w+)?/` to =
go with
> `fname`) so that behavior isn=E2=80=99t changed.

This means that you cannot add a test without a *.out* file, which may
 be useful when you don't use the out file for validation, but we can
add this later if needed.

I'll change the code to check both conditions.


