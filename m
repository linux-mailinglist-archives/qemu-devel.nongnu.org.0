Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 730473F5D59
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 13:52:43 +0200 (CEST)
Received: from localhost ([::1]:43792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIUyq-0004aZ-F3
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 07:52:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mIUxe-0003kZ-29
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 07:51:22 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:45949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mIUxb-0003mZ-Uz
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 07:51:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=Bu4GcrH4R2CFkOt/Hf7oREn9Zoifo4fdGpMbJ+6GoFA=; b=SgMSWhl4927XDQSukGggloTJxO
 /L8kSkdoLzWolKhlhfzuBnWwqb/16RjRWJUAjxhu1XTglNJp8FGldpiHy/2hNt6wS/mBsUJA0z0wZ
 6Y6e9ArR+jP2fXLHD6+jecYy2dCiKzMtE9kyOEmsJwAJLIzE+b5RmKL5EaMZpqD1oTs19IzXTUlBg
 aRn5n3SFCazlop4V4+dmjXMwlzlSJNProSwSlQhrx3Dtfu08le2peCh7j28H148dBxpKaXiEh3puY
 ta7CD54mcZHQF+chULCeJAf0bFSy/n5JTEdai94ywG3cVcyp/mIdsCRI8PqKtqqA6eKIGCqVt4lX+
 +zoGOmpTBuvRUVkzJE2Ra6cBg6eLMbITOggSpa0YAVhJtgRRk/97UfUMS8jgW4oix0RNXbNYlQ5ZW
 dohZ8kdt9Kq2mWymmSrh9yBldiA6IL3EyyEvebaYIYAJPwfHk2XXpI7VFXuQ2klG7IzLkfE/8MD2M
 dnIYv2UWJkkahozCpnjBW+56Wc4CPALHcZupa0w0i23L7S88cWFPDvGYg+dv0RTlIesBLJ+10JIG2
 flGMZ3KDZeLu95OjNmYCmS4nxBIxp7wkyqriZJHyL0D0hUPUMlYgHvrTEX+1xH859LM1ldhFB6kBg
 MCMRUbcra4USHM9y4Xxu2+WzKsz/whgXD8J2qDVYU=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v2 1/5] qemu/qarray.h: introduce QArray
Date: Tue, 24 Aug 2021 13:51:13 +0200
Message-ID: <15979909.kkRmxpahtA@silver>
In-Reply-To: <87eeajnter.fsf@dusky.pond.sub.org>
References: <cover.1629638507.git.qemu_oss@crudebyte.com>
 <42e8b7fec3f03487e322be42ef5ca0e09fd9edea.1629638507.git.qemu_oss@crudebyte.com>
 <87eeajnter.fsf@dusky.pond.sub.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Dienstag, 24. August 2021 10:22:52 CEST Markus Armbruster wrote:
> Christian Schoenebeck <qemu_oss@crudebyte.com> writes:
> > Implements deep auto free of arrays while retaining common C-style
> > squared bracket access.
> > 
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> 
> You provide some motivation for this, but only in your cover letter:
> 
>     Patches 1 and 2 introduce include/qemu/qarray.h which implements a deep
> auto free mechanism for arrays. Unlike GArray it does not require special
> macros, function calls or member dereferencing to access the individual
> array elements. So existing C-style array code can be retained with only
> very little changes.
> 
>     In this initial version QArray only supports the concept of unique
> pointers, i.e. it does not support reference counting. The array (and all
> dynamically allocated memory of individual array elements) is auto freed
> once execution leaves the scope of the reference variable (unique pointer)
> associated with the array.
> 
> Please put it into the commit message, so it gets committed.

Sure, np.

> An example to illustrate how QArray is better than GArray (for some
> value of "better") would help make your case that QArray is worth its
> maintenance cost.

Ok, I'll put that into the commit message as well, instead of into the API 
comments.

> > ---
> > 
> >  include/qemu/qarray.h | 150 ++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 150 insertions(+)
> >  create mode 100644 include/qemu/qarray.h
> > 
> > diff --git a/include/qemu/qarray.h b/include/qemu/qarray.h
> > new file mode 100644
> > index 0000000000..9885e5e9ed
> > --- /dev/null
> > +++ b/include/qemu/qarray.h
> > @@ -0,0 +1,150 @@
> > +/*
> > + * QArray - deep auto free C-array
> > + *
> > + * Copyright (c) 2021 Crudebyte
> > + *
> > + * Authors:
> > + *   Christian Schoenebeck <qemu_oss@crudebyte.com>
> > + *
> > + * Permission is hereby granted, free of charge, to any person obtaining
> > a copy + * of this software and associated documentation files (the
> > "Software"), to deal + * in the Software without restriction, including
> > without limitation the rights + * to use, copy, modify, merge, publish,
> > distribute, sublicense, and/or sell + * copies of the Software, and to
> > permit persons to whom the Software is + * furnished to do so, subject to
> > the following conditions:
> > + *
> > + * The above copyright notice and this permission notice shall be
> > included in + * all copies or substantial portions of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > EXPRESS OR + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> > MERCHANTABILITY, + * FITNESS FOR A PARTICULAR PURPOSE AND
> > NONINFRINGEMENT. IN NO EVENT SHALL + * THE AUTHORS OR COPYRIGHT HOLDERS
> > BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER + * LIABILITY, WHETHER IN AN
> > ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, + * OUT OF OR IN
> > CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN + * THE
> > SOFTWARE.
> > + */
> 
> Please use GPLv2+ unless you have a compelling reason not to.
> 
> [...]

Is that a requirement?

It is just my personal license preference. AFAICS there are numerous sources 
in QEMU released under MIT license as well.

Best regards,
Christian Schoenebeck



