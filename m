Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3DF552175
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 17:45:45 +0200 (CEST)
Received: from localhost ([::1]:34260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Jay-0007Aw-QV
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 11:45:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3JZK-0006Ih-1j
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:44:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3JZI-0005ug-Ew
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:44:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655739839;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tZGzhAr6Z08fuGqQLzcwsHFH4T8m9dw3EfFApaOmamo=;
 b=YnzUcYJhBhm3zheD+LUkZlm25DH8AUEeBKIM8rRY27EZGSQ+ef72vBoHfvZbOoDonF644X
 3uLXCXdhoymHwszSw+1zCdEpDKYeky2z3Qmvv/5pQ2RmG0NVToUiRVnlWWrg1Q/KwHWIAh
 X2h9rOzAhg0ZBQJXP1nfg7mpTFO6/RQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-YoT_1HZAMA-h71j6ZQkZnw-1; Mon, 20 Jun 2022 11:43:58 -0400
X-MC-Unique: YoT_1HZAMA-h71j6ZQkZnw-1
Received: by mail-wm1-f70.google.com with SMTP id
 k32-20020a05600c1ca000b0039c4cf75023so7031329wms.9
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 08:43:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tZGzhAr6Z08fuGqQLzcwsHFH4T8m9dw3EfFApaOmamo=;
 b=tQGYouMxeP34cqv6B7p/h+PMuJgQ0fjdGai9t84PBMCK6TOiuOjGGD8pGmMB+e94Bp
 qez1+nTrXWMnB8PQnELFrSYAfHrDU/FOq09TCxu+/V0IHAxC3s2HwshYnQSQXxpbXyhM
 aGOaER6doNGzVYu1S2H8l5gcDeuxMBKe4MNaUYY0gCmaRz5C6lj8iQD0CzssoW89x4c0
 K0aXHEJaHy7apKChpLwZd454q1HF7tePIx+YX1+XAiWmYJisjYI2GVFbl8Wfr1gyC22M
 yORTA7xqY9UogkCzR11UmIZfsUCcVuMNNjukoPMnHOqLTZCwqPSpKPMyuE8CnkhtrFI4
 L2Tw==
X-Gm-Message-State: AJIora8HKJORA4a1ONwMvEclenBPR/FQfA1r4wTkGiquj/FMZDzOTAn6
 Sgc/3YnmdADN5waNfFOe4xI8jTJmZWOXZMZ/MOqgQ3641XGmDVrPMMx+YAzXlNqaZf9QgzGas4u
 u2P/+5CXeheBzcwk=
X-Received: by 2002:a05:6000:18c4:b0:21b:8b8e:4994 with SMTP id
 w4-20020a05600018c400b0021b8b8e4994mr8095109wrq.122.1655739837122; 
 Mon, 20 Jun 2022 08:43:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tKnymAw5SLRizu/iXIqSuRdfA1vvhOg2Okxvs3sXYQMmA97tDnp0NqHRD2nX2VTynj6fDRWQ==
X-Received: by 2002:a05:6000:18c4:b0:21b:8b8e:4994 with SMTP id
 w4-20020a05600018c400b0021b8b8e4994mr8095087wrq.122.1655739836904; 
 Mon, 20 Jun 2022 08:43:56 -0700 (PDT)
Received: from localhost ([212.145.226.77]) by smtp.gmail.com with ESMTPSA id
 o10-20020a1c4d0a000000b003942a244ee6sm15170616wmh.43.2022.06.20.08.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 08:43:56 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,  Hailiang
 Zhang <zhang.zhanghailiang@huawei.com>,  Fam Zheng <fam@euphon.net>,
 Hailiang Zhang <zhanghailiang@xfusion.com>
Subject: Re: [PATCH v2 19/21] migration: remove the QEMUFileOps
 'writev_buffer' callback
In-Reply-To: <20220620110205.1357829-20-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Mon, 20 Jun 2022 12:02:03
 +0100")
References: <20220620110205.1357829-1-berrange@redhat.com>
 <20220620110205.1357829-20-berrange@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 20 Jun 2022 17:43:55 +0200
Message-ID: <875ykv1gsk.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> This directly implements the writev_buffer logic using QIOChannel APIs.
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

<this comment applies to more patches on this series>

> -        expect =3D iov_size(f->iov, f->iovcnt);
> -        ret =3D f->ops->writev_buffer(f->ioc, f->iov, f->iovcnt, f->tota=
l_transferred,
> -                                    &local_error);
> +        Error *local_error =3D NULL;
> +        if (qio_channel_writev_all(f->ioc,
> +                                   f->iov, f->iovcnt,
> +                                   &local_error) < 0) {

Why are you splitting this line like this?

It should be ok in two lines, I think it is just 82 chars long, right?

Later, Juan.


