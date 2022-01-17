Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EFF4910B9
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 20:36:21 +0100 (CET)
Received: from localhost ([::1]:56526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Xnf-0007o5-WC
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 14:36:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n9Xjn-0005fq-Jw
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 14:32:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n9Xjl-0004Vv-QL
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 14:32:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642447936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pTZOIWU9VR2z7cPUcsF3DgITHbnbQwN9Z8QPRTVD6Fw=;
 b=FjxDC2IB2tjMs/JxNABGFDbW3gwO97kNCOcDKITkM05J8Zz9+U9WaG6msKyaxJh6azGbYz
 7sj2odq9ai9BUqRvO/ADlhWMIuDl2mkoOOGoDCOYHTbaN+vpisQdfvGyqnLRTGwb7KB7cb
 /DzTKRSNW3LUinNlOWYy5oT4N1I9BdQ=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-lGs8pAoPNZ-dMg78dVzlFA-1; Mon, 17 Jan 2022 14:32:15 -0500
X-MC-Unique: lGs8pAoPNZ-dMg78dVzlFA-1
Received: by mail-ua1-f72.google.com with SMTP id
 v10-20020ab036ca000000b003068cf1e17bso10581573uau.4
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 11:32:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pTZOIWU9VR2z7cPUcsF3DgITHbnbQwN9Z8QPRTVD6Fw=;
 b=Vb5nFTn+nYIWOa3XHTqnVFZGc3itEOPwW3y8Bn7db6KgXxx2LI6kufeRvfEJgM2579
 F2O3dsENwnvLoKJZtzFAZZpZ+uCYbB2GRjox/aqRWt3WnQNTYF/C8qpFH5A3IuNrAYYg
 DeJjjofsKTDw3+rKdO3snrSaaOcRMWn4EC1u9dS084e4tcglueUgSwKrJtxlSb9bO/ED
 mWY411qa3GveOzhTGZliZyHYchxSnkIcZqsYIerpH7UebEAt11fkzdpqikQCXjnc+6wG
 EIV+eRnrybLmEXrZmfwFcx+SCPpYx4mrwy7dfSiSjBMy1SzFxuq/uexpXdbqOyUHjJU8
 LgDw==
X-Gm-Message-State: AOAM530hvWq3XkjaoyqLfY0WvaCD71XveXxnGR1/TyaSKTkzvyC59dlA
 w+HmGwPnQ2bjAkIT1/DCzsOB5KivD4Ijg4jfEo72RQwpARIASb0IBx/xACPXWdYUkyN1R/P1Py9
 rahr9f5SmN4tt0S/fNPq8ZT85UbSTo8E=
X-Received: by 2002:a05:6122:130a:: with SMTP id
 e10mr7224181vkp.24.1642447934560; 
 Mon, 17 Jan 2022 11:32:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGws59x257iCS7OBbK00XqGvM7MtuW9IiPb/51zZD2qFezmgNxB5xIOvIB5l9S0W76hoywUwkQa+aS9prJ9pM=
X-Received: by 2002:a05:6122:130a:: with SMTP id
 e10mr7224162vkp.24.1642447934287; 
 Mon, 17 Jan 2022 11:32:14 -0800 (PST)
MIME-Version: 1.0
References: <20220110232910.1923864-1-jsnow@redhat.com>
 <20220110232910.1923864-24-jsnow@redhat.com>
 <20220114191259.m4vxhpfqpmf75h3z@redhat.com>
In-Reply-To: <20220114191259.m4vxhpfqpmf75h3z@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 17 Jan 2022 14:32:03 -0500
Message-ID: <CAFn=p-aZ4vtLygNfQN7N59U+QhpMCh7vz5fnZ6C4vrob=fPVVg@mail.gmail.com>
Subject: Re: [PATCH v3 23/31] iotests: switch to AQMP
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer Moschetta <wainersm@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 14, 2022 at 2:13 PM Eric Blake <eblake@redhat.com> wrote:
>
> On Mon, Jan 10, 2022 at 06:29:02PM -0500, John Snow wrote:
> > Simply import the type defition from the new location.
>
> definition
>

ACK

> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> > Reviewed-by: Beraldo Leal <bleal@redhat.com>
> > ---
> >  tests/qemu-iotests/iotests.py | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)


