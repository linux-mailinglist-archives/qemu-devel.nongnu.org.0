Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1A4545C49
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 08:35:01 +0200 (CEST)
Received: from localhost ([::1]:54272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzYEW-0000lh-Hc
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 02:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzXo6-0002pg-7j
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 02:07:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzXo4-0006oa-AQ
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 02:07:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654841259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=255Co0nFZufpRQga25AhlPUpaVsVjWTbNMglVVbTFuA=;
 b=NFe415ewjIEbZYZNYTbsRWAEY8lLuBCBW3cTvILQ88LaxAkyMYmUNBWl5Ae0pKnL1jQme+
 suKYLEN46Ur4yQJeju7LXT+4LK00sHy10rXLfTTuwSSnsOZQUEQOsj8T/47wFUBxIRuXYT
 R+c3DE3caTPoJyhZ/vG/BafkER1BMUU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-UWACGe1eN0GtzsAbVuyKCw-1; Fri, 10 Jun 2022 02:07:35 -0400
X-MC-Unique: UWACGe1eN0GtzsAbVuyKCw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E7073C0CD4A;
 Fri, 10 Jun 2022 06:07:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 13430492C3B;
 Fri, 10 Jun 2022 06:07:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D89F218000A3; Fri, 10 Jun 2022 08:07:31 +0200 (CEST)
Date: Fri, 10 Jun 2022 08:07:31 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 0/3] Misc AC97 clean ups
Message-ID: <20220610060731.xlaqpsvw2vgc44y7@sirius.home.kraxel.org>
References: <cover.1650706617.git.balaton@eik.bme.hu>
 <6ff58395-65a8-a50-90ee-571ccb131a8@eik.bme.hu>
 <255fbc8f-3b2d-f121-472-91f4d5e36b81@eik.bme.hu>
 <bc93f5ae-a9a-d9ef-4022-fcb0169863@eik.bme.hu>
 <204fa7f7-6b15-e77e-ecec-c06b1873ef5e@redhat.com>
 <20220609101720.bf6s2uusjaivcru2@sirius.home.kraxel.org>
 <c6a4a4-bbae-cec-4caa-3dbb3df19f1a@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c6a4a4-bbae-cec-4caa-3dbb3df19f1a@eik.bme.hu>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 09, 2022 at 04:12:25PM +0200, BALATON Zoltan wrote:
> On Thu, 9 Jun 2022, Gerd Hoffmann wrote:
> > On Wed, May 18, 2022 at 12:37:18PM +0200, Paolo Bonzini wrote:
> > > On 5/17/22 21:47, BALATON Zoltan wrote:
> > > > On Mon, 9 May 2022, BALATON Zoltan wrote:
> > > > > On Mon, 2 May 2022, BALATON Zoltan wrote:
> > > > > > On Sat, 23 Apr 2022, BALATON Zoltan wrote:
> > > > > > > During trying to implement via-ac97 I did some small clean ups to ac97
> > > > > > > which is in this series. The via-ac97 is not working yet so that's not
> > > > > > > included but these unrelated clean ups could be merged now.
> > > > > > > 
> > > > > > > v3: Fixed misalignments and drop spaces before commas (Víctor Colombo)
> > > > > > > v2: Added R-b and changes from Peter Maydell
> > > > > > 
> > > > > > Ping?
> > > > > > 
> > > > > > https://patchew.org/QEMU/cover.1650706617.git.balaton@eik.bme.hu/
> > > > > 
> > > > > Ping2
> > > > > 
> > > > > Gerd, are you getting these messages?
> > > > 
> > > > I got no reply to this so far so I think Gerd is not seeing my messages.
> > > > Could someone who can reach him bring it to his attention please?
> > > 
> > > I'll queue these in his stead.
> > 
> > [ /me cleaning up my mailbox, looking for pending patches along the way ]
> > 
> > Thanks.  It seems to not have landed in master yet even though.  Still
> > sitting in your queue?  Or should I take it?
> 
> I think they are already in master as commits ab9f0f7d44d...dba2b2941ca so
> all is fine.

Ok, pulling brings them, seems they got merged in the last 1-2 days.

take care,
  Gerd


