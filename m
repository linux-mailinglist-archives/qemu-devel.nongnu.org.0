Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC593E391C
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 07:52:49 +0200 (CEST)
Received: from localhost ([::1]:39498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCbjs-0006lW-IW
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 01:52:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mCbgL-00060B-Ex
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 01:49:09 -0400
Received: from mx2.freebsd.org ([2610:1c1:1:606c::19:2]:37476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mCbgJ-0003ZY-Ku
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 01:49:09 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id CD37687786
 for <qemu-devel@nongnu.org>; Sun,  8 Aug 2021 05:49:03 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4Gj7Z74xfNz3hQ1
 for <qemu-devel@nongnu.org>; Sun,  8 Aug 2021 05:49:03 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 86FB61156
 for <qemu-devel@nongnu.org>; Sun,  8 Aug 2021 05:49:03 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qv1-f51.google.com with SMTP id s11so7341985qvz.7
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 22:49:03 -0700 (PDT)
X-Gm-Message-State: AOAM533wRQT48svcEjkGy5VCVQSu++cnoEVKzc3AVfp4L/+nlzy8pIPy
 +LwWCqXcWcBCb+49ZNcZJtxawamzpM+ShJ5ZUpE=
X-Google-Smtp-Source: ABdhPJyrsqE4O5AoCVooim6FNJIBYxIsnCGHhhYJdREYpY6nwwykLF5WO8UQMGSQYGSheE27DHm9QyWmcg+Edi+Ze84=
X-Received: by 2002:a0c:e311:: with SMTP id s17mr5416936qvl.39.1628401743092; 
 Sat, 07 Aug 2021 22:49:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-13-imp@bsdimp.com>
 <bde1f44f-d8a1-4900-e0c6-c6f699d3a8e8@linaro.org>
In-Reply-To: <bde1f44f-d8a1-4900-e0c6-c6f699d3a8e8@linaro.org>
From: Kyle Evans <kevans@freebsd.org>
Date: Sat, 7 Aug 2021 22:48:52 -0700
X-Gmail-Original-Message-ID: <CACNAnaE3dp0Ex7kR58FStcM01PMRi63_sNjRVduVTVOHjO+PVg@mail.gmail.com>
Message-ID: <CACNAnaE3dp0Ex7kR58FStcM01PMRi63_sNjRVduVTVOHjO+PVg@mail.gmail.com>
Subject: Re: [PATCH for 6.2 12/49] bsd-user: implement path searching
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2610:1c1:1:606c::19:2;
 envelope-from=kevans@freebsd.org; helo=mx2.freebsd.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Stacey Son <sson@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Aug 7, 2021 at 10:11 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/7/21 11:42 AM, Warner Losh wrote:
> > +        path = g_strdup(p);
> > +        if (path == NULL) {
>
> Only returns null when the input is null, which you've already eliminated.
>
> > +static bool find_in_path(char *path, const char *filename, char *retpath,
> > +                         size_t rpsize)
> > +{
> > +    const char *d;
> > +
> > +    while ((d = strsep(&path, ":")) != NULL) {
> > +        if (*d == '\0') {
> > +            d = ".";
> > +        }
> > +        if (snprintf(retpath, rpsize, "%s/%s", d, filename) >= (int)rpsize) {
> > +            continue;
> > +        }
> > +        if (is_there((const char *)retpath)) {
> > +            return true;
> > +        }
> > +    }
> > +    return false;
>
> Hmm.  Fixed size retpath buffer isn't ideal.
> Any reason not to use g_find_program_in_path?
>

g_find_program_in_path may work well here, as well...

> I note that we don't search the path at all in linux-user/.
>

IIRC imgact_binmisc will have the resolved path but preserve argv as
it should have been were it not emulated, so we have to re-evaluate
the PATH search here because we try to be faithful to the context.

Thanks,

Kyle Evans

