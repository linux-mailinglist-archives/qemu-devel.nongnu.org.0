Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5311C68F3F5
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 18:04:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPnqe-0004bq-7t; Wed, 08 Feb 2023 12:03:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pPnqb-0004Zl-PJ
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:03:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pPnqZ-00052V-G2
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:03:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675875781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e0AuD3ghRmeiPBCl5R6JjGbpMxpLSaxpRQk7rEWYwyk=;
 b=KGx+hYWhBgXKct4B1O7rRyNO2VK+wUT7MC8027WeLl6o5mliJqsTW1uT/ldAQZHhzA5Q25
 H3eqcU98j9vC1V6qEtHq4Mi9fYWlfg1ePwdFUkSbuoOZp1njZQnRy5lCUl6P4FsJd/0dRr
 XorAqkpkdv2/6UjUCg+ZwMaNkF3Fpo0=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-643-kWOkgMmjPTiXuaMD1fWK7A-1; Wed, 08 Feb 2023 12:02:33 -0500
X-MC-Unique: kWOkgMmjPTiXuaMD1fWK7A-1
Received: by mail-pj1-f71.google.com with SMTP id
 e11-20020a17090a77cb00b0022925dd66d3so1558966pjs.4
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 09:02:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e0AuD3ghRmeiPBCl5R6JjGbpMxpLSaxpRQk7rEWYwyk=;
 b=Bd8gMxDmLYmAG/wnIlVtDp1epIYAWL/R6I6K6hvwB2ybx6NMxNBi+wnQ6BqBpMbko5
 FJyDuYlwSZUsWa+qD8nGn7JAtd8om+LfBNVprhS3HzIe6tCsr/BV7ACOlFcWWH/mb0rj
 9J9BMlSP/exBQJl0TpK02DDoBos7B+mVHsux/2v2BQPRhEdE3inNl62gsHAI4RiIR/Lv
 wNRVxTBvPL9tjjtE7Ocvk/6FLz7WfTM5Cltbsycws3TCAFfdzPgCsuqAeiQyBkdeDMbv
 qXfbBcFc7trs1AHn5wllH19nore/qUNFTGNlTGV/AfLYyzd5uRy5I0ttWK+mHlPwMrz+
 GnRg==
X-Gm-Message-State: AO0yUKWRud8JCcGfp4ja+Gy0UN1WU+JU9LivOebscAdubgKlyvfs5jYg
 xylelGG/B5FfAMG326XEhvezU0LM0rvpDtQs97b21IwhFHyB4CpQwW/5MTCAUmbUyVks+Ve2dLi
 VafDNXWuxsgNMOqcfjMbFxEHtKUQOytA=
X-Received: by 2002:a62:7b97:0:b0:5a8:4a2e:b211 with SMTP id
 w145-20020a627b97000000b005a84a2eb211mr445387pfc.31.1675875751859; 
 Wed, 08 Feb 2023 09:02:31 -0800 (PST)
X-Google-Smtp-Source: AK7set9FmtGrpesiA5toNoma6FDB6viYDKttftoCewOF70wf5tBitPltBDJBSTcrXIp/0lJ6Pyz397mr1cnwlZYohT4=
X-Received: by 2002:a62:7b97:0:b0:5a8:4a2e:b211 with SMTP id
 w145-20020a627b97000000b005a84a2eb211mr445378pfc.31.1675875751564; Wed, 08
 Feb 2023 09:02:31 -0800 (PST)
MIME-Version: 1.0
References: <20230208021306.870657-1-jsnow@redhat.com>
 <878rh8unih.fsf@pond.sub.org>
In-Reply-To: <878rh8unih.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Wed, 8 Feb 2023 12:02:20 -0500
Message-ID: <CAFn=p-bUyRuyWU3ROWL7B-2r9SY7ySVC-r0dAzctbu18DNC4Lg@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] qapi: static typing conversion, pt5c
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Feb 8, 2023 at 11:31 AM Markus Armbruster <armbru@redhat.com> wrote:
>
> John Snow <jsnow@redhat.com> writes:
>
> > This is part five (c), and focuses on sharing strict types between
> > parser.py and expr.py.
> >
> > gitlab: https://gitlab.com/jsnow/qemu/-/commits/python-qapi-cleanup-pt5c
> >
> > Every commit should pass with:
> >  - `isort -c qapi/`
> >  - `flake8 qapi/`
> >  - `pylint --rcfile=qapi/pylintrc qapi/`
> >  - `mypy --config-file=qapi/mypy.ini qapi/`
> >
> > Some notes on this series:
> >
> > Patches 2 and 3 are almost entirely superseded by patch 5, but I wasn't
> > as confident that Markus would like patch 5, so these patches aren't
> > squashed quite as tightly as they could be -- I recommend peeking ahead
> > at the cover letters before reviewing the actual patch diffs.
>
> Yes, you're taking a somewhat roundabout path there.

The result of trying 10 different things and seeing what was feasible
through trial and error, and rather less the product of an intentional
design. In the name of just getting the ball rolling again, I sent it
out instead of hemming and hawing over perfection. Publish early,
Publish often! ... is what people doing the publishing say. Apologies
to the reviewer.

>
> I think I like PATCH 5 well enough.  Do you have a tighter squash in
> mind?

Not directly. I could essentially just squash them, but that becomes a
pretty big patch.

>
> > By the end of this series, the only JSON-y types we have left are:
> >
> > (A) QAPIExpression,
> > (B) JSONValue,
> > (C) _ExprValue.
> >
> > The argument I'm making here is that QAPIExpression and JSONValue are
> > distinct enough to warrant having both types (for now, at least); and
> > that _ExprValue is specialized enough to also warrant its inclusion.
> >
> > (Brutal honesty: my attempts at unifying this even further had even more
> > hacks and unsatisfying conclusions, and fully unifying these types
> > should probably wait until we're allowed to rely on some fairly modern
> > Python versions.)
>
> Feels okay to me.

Sorry, best I could do with reasonable effort. I will try to improve
the situation when we bump the Python version!


