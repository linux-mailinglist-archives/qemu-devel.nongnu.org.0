Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAD7444678
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:00:13 +0100 (CET)
Received: from localhost ([::1]:39122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miJcS-0004sx-Hh
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:00:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1miJa2-0002Oc-Ta
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 12:57:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1miJZy-0007zM-TN
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 12:57:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635958658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C9+jzT1JtEKishxE/w61FLQ0oyHsGw77Rw0ZMaV5IiQ=;
 b=OwUgHSlj/1mHiy89VaRgSXbpcQvzOpSBbZGKTj1CHf7rqmAneUIliSdllvD517/ZJbAdT2
 EajaiUksYpAYD1nwjwv6GPcl3UdhiQWYfNEiBZeOmsGeP/Z4V7UuOsMUbdULlqnJMnD9I4
 2DZL6Gqr3Zq6XXgEjFlSXeOihRk9Ifc=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-WbSWwZNmNQCl1ogG9lSbKA-1; Wed, 03 Nov 2021 12:57:37 -0400
X-MC-Unique: WbSWwZNmNQCl1ogG9lSbKA-1
Received: by mail-pj1-f71.google.com with SMTP id
 a12-20020a17090aa50cb0290178fef5c227so1052729pjq.1
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 09:57:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C9+jzT1JtEKishxE/w61FLQ0oyHsGw77Rw0ZMaV5IiQ=;
 b=UQZMMmQBRr9B4D/8/TKYgH1dfzaBkqK4tiNGmit9yo+/9At2d+IxNBKPn301sUpKiF
 u9xcmSYJSzrvbOGoaOrRXbGTb785/DR6m9BXDHVi3Wkz9XPIZbQUn35BwBCifeZV5YYq
 E30uUQ6U1k8WLUpy6ccMv+d91HVvleCKVsalVxMQuHfWghW6pd4sLkQGOEVAs0qi0U4z
 KsCNDw8TUc8A2ITTH3ioOd426k812tSJ/QDXOYxngcP+WzATHgaRFSTFT5cPvSYzRADv
 d7bzYZl0JOxnfWn3qtbjTA/u0jh8ll7gX5OawgiL+ywUYDi7ZbHm7MC+zrdHJovdNBk0
 ulQg==
X-Gm-Message-State: AOAM531sYqMHSlQ4oIj+Zefmj/espEQSg957MdFai4WwEe+j7YE8D1HI
 1lLzc3MtTxUWrZPlCKgD+N8LOcaHPbZtembphMlszo12JuTOvRHh7wx2qlM6A7hqJToETnLc5qn
 HrjlH7SeaiQmmMX5wcpQTidAtLEVgnXg=
X-Received: by 2002:a17:902:a3c9:b0:141:8fe0:6e6 with SMTP id
 q9-20020a170902a3c900b001418fe006e6mr37564663plb.3.1635958656134; 
 Wed, 03 Nov 2021 09:57:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzg3+zSgcapwpQv9TVzMXd1upwkMH20GuoS8NDpIuhedERs59XaqhosdQTXs0UtCqR8MpjRLV24Ip0qTLX2t/E=
X-Received: by 2002:a17:902:a3c9:b0:141:8fe0:6e6 with SMTP id
 q9-20020a170902a3c900b001418fe006e6mr37564643plb.3.1635958655916; Wed, 03 Nov
 2021 09:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <20211103144844.1285634-1-jsnow@redhat.com>
 <20211103144844.1285634-6-jsnow@redhat.com>
In-Reply-To: <20211103144844.1285634-6-jsnow@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 3 Nov 2021 13:57:10 -0300
Message-ID: <CAKJDGDYcjGnrtbUTPnz1ohYQu8gegAvghCJdj+0ZoKAktEqJCw@mail.gmail.com>
Subject: Re: [PATCH 5/6] docker: update 'python' dockerfile to use Fedora
 registry
To: John Snow <jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 3, 2021 at 11:50 AM John Snow <jsnow@redhat.com> wrote:
>
> Following the lead of 102cd5c294dc, switch from using Docker hub to the
> Fedora registry itself.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/docker/dockerfiles/python.docker | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


