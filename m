Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9DC5630F6
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 12:05:48 +0200 (CEST)
Received: from localhost ([::1]:48462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7DX1-0004Ka-48
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 06:05:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o7DQQ-0006nU-17
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 05:58:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o7DQM-0005jE-QZ
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 05:58:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656669533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Jcraa2YE9KAwnOFdUdWaPIkFvsws0J1qu9qXC+7WqfI=;
 b=jTbiQf1aMBZXpeXJ800E2VTirkRSmxhTtIjpEpI/V7hSt588/73O/yrLYuEUBsVLhCxqzd
 k0YZIyf4QewAY2EQ4YmLgqa/ec9e+tGaoVgrYsoMnmPd+BFJwPlnAktBrEs8zBYBtiDxEl
 1ljcUSgIPVdcwSMiE3E2euNW7LQ3MiI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-gDHGNJRROjGdU4xa5Kb0oA-1; Fri, 01 Jul 2022 05:58:50 -0400
X-MC-Unique: gDHGNJRROjGdU4xa5Kb0oA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E43B21019C88;
 Fri,  1 Jul 2022 09:58:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B10CF112131B;
 Fri,  1 Jul 2022 09:58:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3F24C180091D; Fri,  1 Jul 2022 11:58:48 +0200 (CEST)
Date: Fri, 1 Jul 2022 11:58:48 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>, qemu-devel@nongnu.org,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v3 2/2] ui/gtk: a new array param monitor to specify the
 target displays
Message-ID: <20220701095848.sqoxzeplraft7hzc@sirius.home.kraxel.org>
References: <20220630005141.16680-1-dongwon.kim@intel.com>
 <20220630005141.16680-3-dongwon.kim@intel.com>
 <87wncy41s1.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wncy41s1.fsf@pond.sub.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

  Hi,

> > +# @monitor:     Array of numbers, each of which represents physical
> > +#               monitor where GTK window containing a given VC will be
> > +#               placed. Each monitor number in the array will be
> > +#               associated with a virtual-console starting from VC0.
> 
> Drop the hyphen in "virtual-console".
> 
> Is the term "virtual console" obvious?  Gerd?

I think so, same term is used elsewhere too for the same concept.

take care,
  Gerd


