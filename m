Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D09256DE613
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 22:58:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmL33-00081c-4r; Tue, 11 Apr 2023 16:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pmL31-00081I-7K
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 16:57:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pmL2z-0001Nv-5m
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 16:57:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681246620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EHMo23PxDCTPgYVrqttwLwT5a92zal+vQgck3/8e+/Q=;
 b=PH2dy6Z/aIWU8DWRMibLu/jw2ur0O7VznQO26lBzsjZNunq/ELyAsLvZECThq6cYKHa371
 /fdhU4w/lhP7LVwS65fchHHLkrOfp9aQywEkAvBYqixOs7SOIdZv0EthPTQE5x3Z69ugyk
 BE8G+LKzlbKwme26JCRgD7sZbWbXOE4=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-NJyQZb2wMzuMD8DDxWp9WQ-1; Tue, 11 Apr 2023 16:56:58 -0400
X-MC-Unique: NJyQZb2wMzuMD8DDxWp9WQ-1
Received: by mail-pg1-f200.google.com with SMTP id
 k63-20020a638442000000b0050726979a86so3999050pgd.4
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 13:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681246618;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EHMo23PxDCTPgYVrqttwLwT5a92zal+vQgck3/8e+/Q=;
 b=6zpH8qnSUnmOdnEmztPfwrrSvq+w0cjt/JRK9vdbXb1toJ9QW6ry+H8U6B4etJFqTo
 y9AiQAf0Wxjp/yoX5jxHQsSD7LY3lxOx3DfdwSE7YTMeYbBRoS3tqlNix1fy8XQ6vhTP
 H748koANfGXtW8YwtV+tB1H1epHBhoLrscJ//eI5o3xAZzc2KyBhU5IozGGJDNyH043T
 GhFGAGnpGr+hr1BVzD7+RV2aGPiWqf2Jc2kPdiMUM3KuPdcYxqappUgc4E7FT4qbOgC/
 sdxMQ9Tklo4ceJ4t7RbcIy0ZfoTVGf/CViEgEpvpcadBqbUonzjHixzq1nvJ0k7KEoIh
 Mysg==
X-Gm-Message-State: AAQBX9dkVgL28oOnqQF2kvtcJVE1+DK0IO76t0KT5CGwiinym3QLqOSM
 8fF8K49FCYH3siQUEt3elpAp6pXrlrf43ef5btu8SzWi1eo9w5SqesoLlmo/6WLiF43PWiDaTXu
 k1kmQvZ8r9VC3BkAl6DiHwKPWHCZjIk4=
X-Received: by 2002:a63:2111:0:b0:503:a26e:b4cf with SMTP id
 h17-20020a632111000000b00503a26eb4cfmr4053051pgh.8.1681246617819; 
 Tue, 11 Apr 2023 13:56:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZypdoGoNal+Vr/YdhzXHzvNHCiUYa6/0wQM1lC39C8c4qt3YCrd4zZ+0JWxtmcs6XhTx/BD6t6iKE9tSgP0CU=
X-Received: by 2002:a63:2111:0:b0:503:a26e:b4cf with SMTP id
 h17-20020a632111000000b00503a26eb4cfmr4053026pgh.8.1681246617458; Tue, 11 Apr
 2023 13:56:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230404115912.2829251-1-armbru@redhat.com>
 <20230404115912.2829251-6-armbru@redhat.com>
In-Reply-To: <20230404115912.2829251-6-armbru@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 11 Apr 2023 16:56:46 -0400
Message-ID: <CAFn=p-YcDAfEnyt4qeLRXJaAi0x5TuvfB0R9PeG8DziPBYq8qg@mail.gmail.com>
Subject: Re: [PATCH 05/16] qapi/block-core: Clean up after removal of dirty
 bitmap @status
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, michael.roth@amd.com, eblake@redhat.com, 
 kwolf@redhat.com, hreitz@redhat.com, pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, arei.gonglei@huawei.com, pizhenwei@bytedance.com, 
 vsementsov@yandex-team.ru, eduardo@habkost.net, marcel.apfelbaum@gmail.com, 
 wangyanan55@huawei.com, quintela@redhat.com, jasowang@redhat.com, 
 yuval.shaia.ml@gmail.com, stefanha@redhat.com, kraxel@redhat.com, 
 kkostiuk@redhat.com, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Apr 4, 2023 at 7:59=E2=80=AFAM Markus Armbruster <armbru@redhat.com=
> wrote:
>
> Commit 81cbfd50886 (block: remove dirty bitmaps 'status' field)
> removed deprecated BlockDirtyInfo member @status.  It neglected to
> remove references to its enumeration values from the documentation of
> its replacements.  Do that now.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qapi/block-core.json | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 75f7c62405..eeb2ed3f16 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -582,11 +582,11 @@
>  # @granularity: granularity of the dirty bitmap in bytes (since 1.4)
>  #
>  # @recording: true if the bitmap is recording new writes from the guest.
> -#             Replaces ``active`` and ``disabled`` statuses. (since 4.0)
> +#             (since 4.0)
>  #
>  # @busy: true if the bitmap is in-use by some operation (NBD or jobs)
>  #        and cannot be modified via QMP or used by another operation.
> -#        Replaces ``locked`` and ``frozen`` statuses. (since 4.0)
> +#        (since 4.0)
>  #
>  # @persistent: true if the bitmap was stored on disk, is scheduled to be=
 stored
>  #              on disk, or both. (since 4.0)
> --
> 2.39.2
>

Reviewed-By: John Snow <jsnow@redhat.com>


