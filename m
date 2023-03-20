Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F276C19A2
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 16:36:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peHY3-0001Gj-Ml; Mon, 20 Mar 2023 11:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1peHY1-0001GF-Kd
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 11:35:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1peHXy-0000GB-OX
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 11:35:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679326542;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rmUPc4ah2Jxy+O/4xe5HJGenmalFSW4S3Xw9dnuDNwI=;
 b=Rd2T/tVAPMj6F4nradG8Ea7CLYVpoqO2HWY9ePylFb6KqCXLitRLsIQoIq4nomv8WwVN7/
 DUk3W6uw5Jz05uUC5IB49/UOlLC9LL7kw+dmIu2IUZedCM5jjTqp1Oo7X2ML53k1+UyQhh
 Nc+CL/FIgJKlYmH1H4bQZbVwUxUx9uk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-9Fd2v0pPOpK4pg9yObpCmw-1; Mon, 20 Mar 2023 11:35:37 -0400
X-MC-Unique: 9Fd2v0pPOpK4pg9yObpCmw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D0291C29D4C;
 Mon, 20 Mar 2023 15:35:37 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E13FB2166B29;
 Mon, 20 Mar 2023 15:35:35 +0000 (UTC)
Date: Mon, 20 Mar 2023 15:35:33 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Emilio Cota <cota@braap.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 0/2] fix for #285
Message-ID: <ZBh9RV8pKOU7A+jc@redhat.com>
References: <20230205163758.416992-1-cota@braap.org>
 <Y+92tpDQVytnfvnd@cota-l14> <ZBcY+WL+65D7Zi5F@cota-l14>
 <002645e6-75a0-0409-a0ae-90265e4e4d1c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <002645e6-75a0-0409-a0ae-90265e4e4d1c@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Mar 20, 2023 at 04:05:01PM +0100, Philippe Mathieu-Daudé wrote:
> Hi Emilio,
> 
> On 19/3/23 15:15, Emilio Cota wrote:
> > Ping. Any feedback on these two patches?
> > 
> > https://patchew.org/QEMU/20230205163758.416992-1-cota@braap.org/
> > https://lore.kernel.org/qemu-devel/20230205163758.416992-1-cota@braap.org/
> > 
> > Happy to resend if needed.
> 
> Since we are past hard-freeze, this series likely missed the v8.0
> release IMO. Note that doesn't mean maintainers can't queue it and
> send the pull request later when the next development window opens.

This series is a bug fix though, the freeze only applies to
features. For rc0/1 most bug fixes are still permissible.

I'd really recommend we take this series, as it is a clear
bug in linux-user that can be fairly easily reproduced

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


