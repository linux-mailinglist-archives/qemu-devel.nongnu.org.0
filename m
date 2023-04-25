Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 473676EDC5D
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:20:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prCyk-0008Tw-6T; Tue, 25 Apr 2023 03:20:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prCyh-0008Qt-BL
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:20:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prCyf-0002jU-Nq
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:20:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682407241;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zVbBI+rJLf7x65XcnE3s4+xp4/M1zsHMocXzuDl0Ez4=;
 b=gNGXGdD1PfttnBUF2Sxl+jYQuwKqwm1DplFsnIBd9gEvTse/YPNmgwaaWM8NV1URbD/App
 HEfburNLyaFlmS+vip7AcwYcBjbExxrOpbrewpAOmiBWPp90NYJrKVfl4SvXALogGZ5dW+
 jkyb/mPMGdWpvbmB0rC6lD/x7K2XCkE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-HIZ99ljXOI6hfchAnnwDWg-1; Tue, 25 Apr 2023 03:20:39 -0400
X-MC-Unique: HIZ99ljXOI6hfchAnnwDWg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-2f446161e5aso3106925f8f.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 00:20:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682407238; x=1684999238;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zVbBI+rJLf7x65XcnE3s4+xp4/M1zsHMocXzuDl0Ez4=;
 b=b6w4LW+Kaugp9Ltmnj0g0qn+57qU/WP1m3BexPXfIs6fEpDkUPR9j0QCwxum+z88KE
 J8Z0iYC91OlZ1c8mmEKs8Sdbx5Sty6BrPlYm/8gfewROUiQaMZsxupj3e9dxXhaGXd4v
 AC8U1ktifryjAJHNRqncyQGspEyrKr0afFXuF1Nn4EqA3i4MgqAQ6iszXQoQbNzlqRqT
 3ODn5QagKKzpUvOrA8wdWeCsK/lAM+X7EvWv7tANWxsvmfWcBhOPAWD6XtBYkPAfTidq
 7jlIoNNc4/8Hk7dd3NIZKAg62f19ZyQz36NBAbQYfCxqthGANHQw5Q2n3QRmZk6XMIH6
 MwAQ==
X-Gm-Message-State: AC+VfDwxngoaOSCn9mIMiqHdLJgv/yhRenqO3XdLdYxp6lgmHiQM59aO
 uaVazlR4BUFzNLiS2ipArPJt1QK8RJ4cKdu9e3ybMNbi9p5oGDqtij96s3eiAIpi+SWK/qN3x3y
 iZKrStXYe8is2o/0=
X-Received: by 2002:a5d:5642:0:b0:304:8147:f0ba with SMTP id
 j2-20020a5d5642000000b003048147f0bamr2607500wrw.3.1682407238407; 
 Tue, 25 Apr 2023 00:20:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6K7Um9Iomf7PPsdK9kQ+dBwvoKZOgQekWLWIBPDb9BIT05+QvmT4buufwNwKzDLtb09F6CNQ==
X-Received: by 2002:a5d:5642:0:b0:304:8147:f0ba with SMTP id
 j2-20020a5d5642000000b003048147f0bamr2607486wrw.3.1682407238121; 
 Tue, 25 Apr 2023 00:20:38 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 o4-20020a056000010400b002fa67f77c16sm12334734wrx.57.2023.04.25.00.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 00:20:37 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  michael.roth@amd.com,  eblake@redhat.com,
 kwolf@redhat.com,  hreitz@redhat.com,  pbonzini@redhat.com,
 marcandre.lureau@redhat.com,  arei.gonglei@huawei.com,
 pizhenwei@bytedance.com,  jsnow@redhat.com,  vsementsov@yandex-team.ru,
 eduardo@habkost.net,  marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com,  jasowang@redhat.com,  yuval.shaia.ml@gmail.com,
 stefanha@redhat.com,  kraxel@redhat.com,  kkostiuk@redhat.com,
 qemu-block@nongnu.org,  marcandre.lureau@gmail.com,  david@redhat.com
Subject: Re: [PATCH v2 07/16] qapi: Tidy up examples
In-Reply-To: <20230425064223.820979-8-armbru@redhat.com> (Markus Armbruster's
 message of "Tue, 25 Apr 2023 08:42:14 +0200")
References: <20230425064223.820979-1-armbru@redhat.com>
 <20230425064223.820979-8-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 25 Apr 2023 09:20:36 +0200
Message-ID: <874jp4tol7.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Markus Armbruster <armbru@redhat.com> wrote:
> A few examples neglect to prefix QMP input with '->'.  Fix that.
>
> Two examples have extra space after '<-'.  Delete it.
>
> A few examples neglect to show output.  Provide some.  The example
> output for query-vcpu-dirty-limit could use further improvement.  Add
> a TODO comment.
>
> Use "Examples:" instead of "Example:" where multiple examples are
> given.
>
> One example section numbers its two examples.  Not done elsewhere;
> drop.
>
> Another example section separates them with "or".  Likewise.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


