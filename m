Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DAC5AFE02
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 09:49:02 +0200 (CEST)
Received: from localhost ([::1]:36538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVpnu-00081H-Lm
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 03:48:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oVplU-0006JT-Jb
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 03:46:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oVplS-0001bn-Ay
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 03:46:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662536785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EB0dML04u0BsrHG8QuYmh06CHNU7AaR8CRlrm25otrs=;
 b=DAvwv5tMKp022Yohj16+VowlabpttXCU/tvTct1FfNRTmWpAvRJe0BFsR23K0xxm9q+uMh
 ri+Lb7eecyGxDQHwmg6vyzADR0WUICIfX52mYTzfqADH50QJyUZfmKF8CRo7hviH0HEoGm
 g6Ha8LKhqjiTJ5lnj1lHKkAWIHixOB0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-394-jl5Ki_kdPfqJdDJcrW0Kdg-1; Wed, 07 Sep 2022 03:46:22 -0400
X-MC-Unique: jl5Ki_kdPfqJdDJcrW0Kdg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02C6629ABA0D;
 Wed,  7 Sep 2022 07:46:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA94D2166B26;
 Wed,  7 Sep 2022 07:46:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 60931180039B; Wed,  7 Sep 2022 09:46:20 +0200 (CEST)
Date: Wed, 7 Sep 2022 09:46:20 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 dinechin@redhat.com
Subject: Re: [PATCH] accel: print an error message and exit if plugin not
 loaded
Message-ID: <20220907074620.3x35brshkoqc6kui@sirius.home.kraxel.org>
References: <20220905101332.1986-1-cfontana@suse.de>
 <5d922305-a559-bfdc-7038-ec1560ae0e00@linaro.org>
 <9bb31e44-e43d-b51a-712a-87e46279a0b5@suse.de>
 <879a973a-c5b0-2a23-bb24-92bf5500f63f@suse.de>
 <20220906095325.5rhnqjyvckjebnmp@sirius.home.kraxel.org>
 <aef3408d-6b48-424b-e539-6230ee38b90e@suse.de>
 <90ec64fb-24fa-aee9-da77-32fc56d3e51e@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90ec64fb-24fa-aee9-da77-32fc56d3e51e@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

> > Ah I noticed only now... I just sent a series, the module_load_qom_all() then is maybe something to discuss further.
> > 
> > Thanks,
> > 
> > Claudio
> > 
> 
> I noticed however that module_load_qom_all() does _not_ pass true for mayfail.
> 
> You changed this behavior in:
> 
> commit 9f4a0f0978cde9d8e27453b3f2d3679b53623c47
> Author: Gerd Hoffmann <kraxel@redhat.com>
> Date:   Thu Jun 24 12:38:17 2021 +0200
> 
>     modules: use modinfo for qom load

Oh.  Not sure this was actually intentional or a cut+paste bug.  The
change looks unrelated.  See also the other reply discussion missing
modules + load_all() sent a few minutes ago.

take care,
  Gerd


