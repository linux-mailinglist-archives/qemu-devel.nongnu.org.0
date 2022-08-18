Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E49598552
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 16:08:40 +0200 (CEST)
Received: from localhost ([::1]:53686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOgCN-00072B-4q
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 10:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oOgB8-0005WQ-KX
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 10:07:22 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:35619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oOgB6-0006Wc-Ak
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 10:07:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=oMujqwKnc87GoH00yTiH9a7Hri2HJrObhGcct/dwJPQ=; b=G67DTo3N0i9d+6yIQPH+aRYrW7
 3CIpKonua3lyhEmMOwngZigKNLf62oKyxNlI9pw6+ycwlhvrIpn9MiDBOQWtwBbpOGpSr6T93j2dG
 TL//gNpgnjjAt5h/Pd8fGeVFgVUrtEWIjukzO6BzXPQcJR+jpOJDmzxE8jOSMs0LdUlMiZ0Ky7YkF
 +LugmkMJLJq1/DoSwxfPnq1s5rACBTzJFYC484uuz6ZUmjhyuL5wsePQptfv1e/gtMyZyPTOyJGSd
 h4d4/jE+BzaVT/eGeD++SKmUkpoV9zHl+Z3IX/0X/7iaX2B+lv/A/qkttMCbpLGHpzKf5HeDrOLai
 linhVSneI0rQBOlJIIGvBV6A4QUFwYJVPUh+I5+Z3b9ia5tDRjOwmh9/awcfLnaVuiOqVpTd/khWB
 Pf8T+KVGCJs8KALz0W4cOnm6+ITcKIu03dUt0cDkXgu+REUc75zoMCAU+r/nwNtSunFhfchHZxSjh
 PHioudrUaaiTC2wrytDISIMWoaHnHnlsMqLXPflmbcOgQzHE+5OuWv5Q60zb9bFWa0z0hpznglkEo
 uZibpBpoCxmDyN6IrPJtonzXdSxdz0zpg1/w1Hp1abIQgo8fS+vJPRXWS66/qNbTMVbn087y4KzlG
 L3gRm2Nyg5xo/utTME61x42dKbErWsVHXxHzTjHz0=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Nikita Ivanov <nivanov@cloudlinux.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Cc: =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Greg Kurz <groug@kaod.org>, Jason Wang <jasowang@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] error handling: Use TFR() macro where applicable
Date: Thu, 18 Aug 2022 16:07:15 +0200
Message-ID: <1727925.InMztqvFxb@silver>
In-Reply-To: <CAFEAcA80d1Qd3VrzV79_ywEryikfLrLNMbe50hjMEP8_HKNBvg@mail.gmail.com>
References: <CAAJ4Ao9crXap1OYiutSgG5caZHzVkM=WvQYpVD2XN1M8JsD3cQ@mail.gmail.com>
 <CAAJ4Ao9M8CnfBtiricqteAfhPhV9sOhiicSYVsrqtCp7CisK_Q@mail.gmail.com>
 <CAFEAcA80d1Qd3VrzV79_ywEryikfLrLNMbe50hjMEP8_HKNBvg@mail.gmail.com>
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

On Mittwoch, 17. August 2022 17:55:24 CEST Peter Maydell wrote:
> On Wed, 17 Aug 2022 at 15:49, Nikita Ivanov <nivanov@cloudlinux.com> wrote:
> > Well...
> > 
> > What exactly is still under discussion? In my perspective, the main
> > pitfalls have been resolved:
> > 
> > 0. All possible places where TFR() macro could be applied are covered.
> > 1. Macro has been renamed in order to be more transparent. The name has
> > been chosen in comparison with a similar glibc macro. 2. The macro itself
> > has been refactored, in order to replace it entirely with glibc
> > alternative. 3. Problems with statement/expressions differences in qemu
> > and glibc implementation have been resolved.
> > 
> > Is there any room for improvement?
> 
> (a) do we want the statement version or the expression version?

I think the tendency was in favour for the expression version? Markus made it 
clear that the glibc version indeed may evaluate as an expression (GCC 
extension).

> (b) do we want "use the glibc one, with same-semantics version for
> compatibility", or do we want "we have our own thing"?
> 
> I would have voted for following glibc, except that it does
> that cast-to-long thing, which is incorrect behaviour when
> long is 32 bits and the return value from the function being
> tested is 64 bits.

Then simply int64_t as a type instead, and as "our own thing"?

Best regards,
Christian Schoenebeck



