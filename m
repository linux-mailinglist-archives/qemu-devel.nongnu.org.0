Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 195F63F3F39
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 14:17:44 +0200 (CEST)
Received: from localhost ([::1]:39000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHmQ2-0003jL-MF
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 08:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mHmPI-00033n-Dj
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 08:16:56 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:58975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mHmPG-0004Az-Jq
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 08:16:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=v0VC4XFC1zzWVxw8kVgNq0Ql042DmOVXx6bX/71BZ4o=; b=E4Epdh15o/UOzvl9T3W3A1qqmU
 cFG4l7ZV7ZaVSCirz8+Ah8v3bBa9wlQuSbx6k+fYWQwfGBrRmE8lVf0cWNLIKyWTZTUUxOUEtLUMo
 YQpVrEk4GqkpaLHNshhHuS36CrvLB5+IAjNhu/Z439q9GOUcHA/weaE0TxH+j7l/76kJGx9hi0+zk
 vca1Erwcir4/CRxGh/2qrihyScMDZo+NH6wRqABsO/SR5bpOqhPdO4x8Ie2Pbcc6ZIp21SdbqrnM3
 J8jjaBz3OUTWFuMk+J4COiIGSaQJ8kgVVR48NLiKkJUWqQbciQcqnO1e8LsmYmthh3T/GtBTMk+sv
 k6bIkEYjyX13IclNVt4SWfdoFwSisMEVbVJogRMK9q4JOX6LACRDRm0wJCayzKkQ9GhxrOzsEyIXY
 uMA7sykZHvNCHF1naqwZp00NaxQh0djMCrUlBDlTZJFRyJcFd6g7IT+9mRUtzVJQ5qfJ/TBt5O4cQ
 d35nk5k2+kKfr5wu5pGVIAbNrMs9hCKKdCNkgjUAWAaRZ1RT0FdWBTyPpPI6mF6wrDdyAlQW4AhmA
 5HSJYqczAAnbjGmd7oC4RTKRD5RCtbrbOo1BE6HcJwwIcA2HpGx5MjDELsF25ahCpOgEi82KMH4Vw
 C/DSoSIlkrTagdGAHCPWsoUmii+y0uFY14L67BylU=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 2/5] qemu/qarray.h: weak scalar type check in
 QARRAY_CREATE()
Date: Sun, 22 Aug 2021 14:16:48 +0200
Message-ID: <2359803.oK9D7Rh7IG@silver>
In-Reply-To: <85cd9b4b-9137-d4c8-a12e-79d6e5790a36@linaro.org>
References: <cover.1629578875.git.qemu_oss@crudebyte.com>
 <a3f07198ba9e12b45ef38b45fa543e9b597ee70f.1629578875.git.qemu_oss@crudebyte.com>
 <85cd9b4b-9137-d4c8-a12e-79d6e5790a36@linaro.org>
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

On Sonntag, 22. August 2021 06:11:58 CEST Richard Henderson wrote:
> On 8/21/21 1:30 PM, Christian Schoenebeck wrote:
> > Unfortunately something like
> > 
> >    _Static_assert(typeof(a) == typeof(b), "type mismatch");
> > 
> > is currently not suported by C. So for the time being at least
> > check that the size of the scalar types match at compile time.
> 
> Did you try
> _Static_assert(__builtin_types_compatible_p(X, Y), "type mismatch");
> 
> 
> r~

Ah, you are right. I was trying it, but now as you pointed me at it again, I 
realized I was just missing something. The specific use case here is like:

struct Foo {
  ...
} Foo;

Foo *var;

_Static_assert(__builtin_types_compatible_p(Foo, typeof(*var)),
               "type mismatch");

So I was missing the typeof() keyword to deduce the scalar type from the 
passed variable.

I'll send a v2.

Thanks!

Best regards,
Christian Schoenebeck



