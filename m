Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C976DFE86
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 21:13:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmftz-0007Sv-3z; Wed, 12 Apr 2023 15:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pmftx-0007Sm-7x
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 15:13:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pmftv-0000Rh-5F
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 15:13:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681326781;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mZkUbYbItgdH3zhGW+L1mq0FEeEr5k1COStnYU1tSt0=;
 b=OGxMPC5wWGOBZyuwJby/VD9av9kYAx0p9dE7D3XDk5GZ6zvfYDDkzICEU61f8RuP766Wt7
 1rzTQcrvMTrBWyLJyhF/+mJ1A5B38gT+ez3fTkJVKc27HOUKDUq9gCYUzC5oYEo2PMUITe
 YkcJM0FgNjZVQJcI/1ZkaSuSa5sfYMU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-iuSYVWXvOKGgmzO_Ug5JWA-1; Wed, 12 Apr 2023 15:13:00 -0400
X-MC-Unique: iuSYVWXvOKGgmzO_Ug5JWA-1
Received: by mail-wm1-f70.google.com with SMTP id
 l26-20020a05600c1d1a00b003edf85f6bb1so7438917wms.3
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 12:12:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681326779; x=1683918779;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mZkUbYbItgdH3zhGW+L1mq0FEeEr5k1COStnYU1tSt0=;
 b=k5uuFT+kyn5sZogR8X/XKmHLqkLiZa0c1QK5pOCmDTI7l7dke6tWskZ8zwCjHks/J6
 p3RzFHh+RQLcgIqe+TP9RGrsigjSOatkLg9qVhHVRGOdtAkS7lwQpfEoxNfw01OQtm64
 Wj+je5ZRX8S+sAa6sVvJQmqpbjSXHqqWRNZx3E/OnO6z1EuWnVjK0BkvTckA72xl1mIy
 9uZJGEvMj8nkojtmGHhUvSA3/MTrgJJXwtuBslvqz4ky0MOr5k38jP8tgTTZcUf5Dman
 GW7Vi33/7nlM4BwP5dezrcSeF8bCagfOYYNgcVCPT8jgvlSYP+YL2Yal/1V6BWUVik6V
 R5Zw==
X-Gm-Message-State: AAQBX9cStppxS+oINKiTEpC1Wobe6gJmk9v8M0YMuGRPjPQBInESOpWK
 MPMDYbgyE5dOFKykwzSPfRq3alVXF2cp9KTor83QiG+ZyngvWRD/hvIccvg3Qz69MCpYuZTzAZg
 rYKxnpr/pYPpd/sk=
X-Received: by 2002:adf:f58b:0:b0:2d6:6af:4891 with SMTP id
 f11-20020adff58b000000b002d606af4891mr2471833wro.3.1681326778869; 
 Wed, 12 Apr 2023 12:12:58 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZzU0AISbSaLxjH7cjhRBPejG9ymSjHlH0joyLjvPVkiHx2sQTYdIIZsiMtQHArn0PI+u/JEA==
X-Received: by 2002:adf:f58b:0:b0:2d6:6af:4891 with SMTP id
 f11-20020adff58b000000b002d606af4891mr2471817wro.3.1681326778585; 
 Wed, 12 Apr 2023 12:12:58 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 n18-20020a5d51d2000000b002ef222822d5sm17520305wrv.74.2023.04.12.12.12.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 12:12:57 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,  Daniel P .
 =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH for-8.0 1/3] io: tls: Inherit
 QIO_CHANNEL_FEATURE_SHUTDOWN on server side
In-Reply-To: <20230326172540.2571110-2-peterx@redhat.com> (Peter Xu's message
 of "Sun, 26 Mar 2023 13:25:38 -0400")
References: <20230326172540.2571110-1-peterx@redhat.com>
 <20230326172540.2571110-2-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 12 Apr 2023 21:12:56 +0200
Message-ID: <87h6tkoqx3.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Xu <peterx@redhat.com> wrote:
> TLS iochannel will inherit io_shutdown() from the master ioc, however we
> missed to do that on the server side.
>
> This will e.g. allow qemu_file_shutdown() to work on dest QEMU too for
> migration.
>
> Acked-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


queued


