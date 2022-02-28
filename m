Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A124C70ED
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 16:47:02 +0100 (CET)
Received: from localhost ([::1]:44036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOiEm-0002dY-WE
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 10:47:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nOiDU-0001t2-JI
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 10:45:40 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:44429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nOiDS-0004Kd-Pa
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 10:45:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=3BIv1SZekoo/3VKgEFjYKjY8w2eIWEFay1EACLH5DwE=; b=fzL1wNkINugVMewCveJkrAfxuu
 i9Hqo6Xi1Tn9aoa48I2X7T+RmT9PSL71b4fRd4FsQ0+EZCS+oqYr3LgUAGIxivzuN4O+LNEFx5tHG
 w6DGTozn3By5eTY5aDsaoBb0WmqqJfgMOVA1dcL5kZxe7YUYHvckLkZIpsrM3Om4JvEv/2EyofQqB
 2LRxw87iQcQqPfx2qDjO9UOvW44X0mdHNV+RU7ZWtxJJEVSyYxMMTpykofWuOduftDOPmQpazMp/G
 6c+azGJv0Fsb9fRIXIQ9NCiy9NuUjaQMK8LqMN8//YEpDvLgCUHLVPbvGcT5OnA5SsTZcCv4JfLFS
 zi4vlF3pCx2IASJEPinE9443E8JkeN5j6ylZFr1A2iP58ulnJaNSNGIWpRkZSzQZAN8ZLEnhDJvJo
 aZ1JIhqMzscooafaalimkeRDRfPAtMiEkMA3frWzYpYVHfiZkcJso7WXN8ELHdkVHjulzvP/F4JIQ
 Sq0y01jF/jZ5mI/vzcVZn0T/P9jKtFM0b9EYTfsopKSaOWWQQkUKrrGGnbzasWyAf5Q4Nv+MOBTw/
 /oU43kJMqpfxxR8VjmGI4A9ghTaifT77md44CEhWvCWnEMU7gstk85Uw59dlRzDVUuhRdPypMcrEV
 mxHjfyGfnyaUsZ8oaTdmcorEzLSbH/OHXroJ+l3TU=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>,
 Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v9 09/11] 9p: darwin: Implement compatibility for mknodat
Date: Mon, 28 Feb 2022 16:45:33 +0100
Message-ID: <3768063.azJo349jol@silver>
In-Reply-To: <CAFEAcA_1-xK9u3jsZ0MyCEsQOsr3Dp0bHRtyXYDj7CDWw4-D8Q@mail.gmail.com>
References: <20220227223522.91937-1-wwcohen@gmail.com>
 <1808194.U6vU4amhyU@silver>
 <CAFEAcA_1-xK9u3jsZ0MyCEsQOsr3Dp0bHRtyXYDj7CDWw4-D8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Montag, 28. Februar 2022 15:06:07 CET Peter Maydell wrote:
> On Mon, 28 Feb 2022 at 13:58, Christian Schoenebeck
> 
> <qemu_oss@crudebyte.com> wrote:
> > On Montag, 28. Februar 2022 14:36:30 CET Thomas Huth wrote:
> > > For lines less than 90 characters, it's just a warning, and I think it's
> > > ok
> > > in such cases to keep it longer than 80 characters, if the result of
> > > breaking it up would look more awkward otherwise.
> > > 
> > >   Thomas
> > 
> > This doesn't look awkward to me:
> >         error_report_once(
> >         
> >             "pthread_fchdir_np() is not available on this version of
> >             macOS"
> >         
> >         );
> 
> I think that looks pretty strange, though "git grep -A3 -- '($'" does show
> other examples of doing it that way. I'd favour leaving it as a single
> line, which the style guide allows ("better to have an 85 character line
> than one which is awkwardly wrapped").
> 
> Personally I would favour just not warning at all about the more-than-80
> less-than-90 lines case: it mostly tends to produce discussions like this
> one and people preferring to break lines that would be better unbroken.
> I know not everybody agrees with that, though.
> 
> -- PMM

There is a practical reason for keeping things <80 chars: some email clients 
like mine do awkward attempts to constrain lines to 80 chars in replies, which 
I then always have to manually fix for the quoted diff being readable again. 
E.g. in this case it screwed it like this:

> +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
> +{
> +    int preserved_errno, err;
> +    if (!pthread_fchdir_np) {
> +        error_report_once("pthread_fchdir_np() not available on this
> version of macOS"); +        return -ENOTSUP;
> +    }
> +    if (pthread_fchdir_np(dirfd) < 0) {
> +        return -1;
> +    }

Anyway, I leave this as-is then, as I seem to have a minority opinion.

Best regards,
Christian Schoenebeck



