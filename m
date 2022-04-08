Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 336C54F8D3C
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 07:13:17 +0200 (CEST)
Received: from localhost ([::1]:59178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncgvr-0003Mx-ME
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 01:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ncgtw-0002aw-C1
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 01:11:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ncgtt-0003U1-06
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 01:11:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649394671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+kvwJRjLipoB5SS2Ezv6Fro7p0kXdykVvYHJIB0xJ44=;
 b=EakXtpD00lvhrbFt17hwM1/zQLPyO8qWE38Zwz7fC/njqV8EJvNZoOrBupi4wmGWq1cJ4f
 LOk1SlF05fmbACj92Dl1HT8v0JYgxNLe8TIurUGOzZjrEmIDZy829bEoeCan3Era9CL3Ap
 NiWXQ2g7E3ogwZ2uXA4jDRuXxRzlW3s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-ywoe7OExMDyjtmXLZf6o9A-1; Fri, 08 Apr 2022 01:11:10 -0400
X-MC-Unique: ywoe7OExMDyjtmXLZf6o9A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98784811E76;
 Fri,  8 Apr 2022 05:11:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6561A401E58;
 Fri,  8 Apr 2022 05:11:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F30A61800607; Fri,  8 Apr 2022 07:11:07 +0200 (CEST)
Date: Fri, 8 Apr 2022 07:11:07 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3] ui/cursor: fix integer overflow in cursor_alloc
 (CVE-2021-4206)
Message-ID: <20220408051107.j2zqmsf435xemea3@sirius.home.kraxel.org>
References: <20220407081712.345609-1-mcascell@redhat.com>
 <CAJ+F1C+HB5Nbsjk4E-KgFQEpyAWFaCkJvswMQj1yu4Rm-rOQ-g@mail.gmail.com>
 <CAFEAcA-OzpiWu5c7-r4Hd42ZW500to3wndtE-=vyiVoed1=1WQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-OzpiWu5c7-r4Hd42ZW500to3wndtE-=vyiVoed1=1WQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Mauro Matteo Cascella <mcascell@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 07, 2022 at 06:46:00PM +0100, Peter Maydell wrote:
> On Thu, 7 Apr 2022 at 10:21, Marc-André Lureau
> <marcandre.lureau@gmail.com> wrote:
> >
> >
> >
> > On Thu, Apr 7, 2022 at 12:23 PM Mauro Matteo Cascella <mcascell@redhat.com> wrote:
> >>
> >> Prevent potential integer overflow by limiting 'width' and 'height' to
> >> 512x512. Also change 'datasize' type to size_t. Refer to security
> >> advisory https://starlabs.sg/advisories/22-4206/ for more information.
> >>
> >> Fixes: CVE-2021-4206
> >
> >
> > (the Starlabs advisory has 2022, I guess it's wrong then)
> >
> >> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> >
> >
> > Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Does this fix (or any of the other cursor-related stuff I've seen
> floating past) need to go into 7.0 ? (ie is it release-critical?)

Yes.  The integer overflow can be triggered easily by guests.  Hitting
the double read race condition is harder but probably possible too.
Pull request sent minutes ago.

take care,
  Gerd


