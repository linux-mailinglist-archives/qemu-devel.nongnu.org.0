Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2952F4E44A4
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 18:04:55 +0100 (CET)
Received: from localhost ([::1]:33460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWhwD-0004Dr-WC
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 13:04:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWhs1-0000pa-3p
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 13:00:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWhry-0002sG-UR
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 13:00:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647968430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U8oXZ02OTXxow1BnAwMzcGjx/1DNdZ8KE+5tTpyvn6I=;
 b=FbDtlGDdb4KDPkI5jbq1Y0kh0Y7CzaWsp7dztW/FZZgj7QrtxqUounMxJ7QKBPBwW8svX1
 uUGZivqP/T0BtxHi75ypWM13HmtFtDhxy6HFnGRAH9UjcXikTeX7oiBmooh0I+SWfHCAOa
 0QLl7R9/roJJpoi7uqN6mzp8igqC6oY=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-21-58toIhbPMmWiMS2j28l_Xg-1; Tue, 22 Mar 2022 13:00:29 -0400
X-MC-Unique: 58toIhbPMmWiMS2j28l_Xg-1
Received: by mail-ua1-f70.google.com with SMTP id
 q32-20020a05613002a000b0035691ee6ebbso2576027uac.17
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 10:00:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U8oXZ02OTXxow1BnAwMzcGjx/1DNdZ8KE+5tTpyvn6I=;
 b=f1d97SabVRFo5glpNrX0svWtPYKeE2P7MnPBU0gQHghie0rWIlIWtbKElSlkBPTcqm
 WdnHwog9nojkQcFO7rhmKg0gY6Oc/VQfm0incUgWfQ1huG1Fx6WxoZoyY7tDxjlPD8Gu
 x6/DRfxpYzr0k3ZpRk2eBFsuDiwujM95qsPGZyzK2Bj+ytBfarQEsObPJ1orpoKWQsLM
 2s6V2VOyKZFtCIIMDAQRovRVruAk6PImFJuM2BbgULAk4D7qmfE3teoygLQ5imIjL0U2
 J6BqtasTbu6q7YGnjqETWnjr6iJWBKFjl21EvRomGOc0GFVlMKvAVnK1UL6HXv1oYEvE
 FlzA==
X-Gm-Message-State: AOAM533DRU+0wxpEu4KasUU5/sikIuwiCdeZhVG/pG/779EJtB33vCeA
 kSoQbdC75GJTSN6F+8MFeSG2uzPe0PW0IwFSSJJAKOFj0vsvFx5hqSEMynBkbsDQMYXP9npISUx
 nIIL+fZ6mnl0bqb2/eioIh0OIXk6gqKk=
X-Received: by 2002:a05:6102:c8e:b0:321:7348:6c2a with SMTP id
 f14-20020a0561020c8e00b0032173486c2amr10158060vst.11.1647968428392; 
 Tue, 22 Mar 2022 10:00:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHHDE9SZZdFraHogo6whXqBoO50OBmfQ3UeJ2jo4YUP/YCTYQpfmcPcxrGzNKc81K16J/YycnIkZu4dACYa+4=
X-Received: by 2002:a05:6102:c8e:b0:321:7348:6c2a with SMTP id
 f14-20020a0561020c8e00b0032173486c2amr10158045vst.11.1647968428097; Tue, 22
 Mar 2022 10:00:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220318203655.676907-1-jsnow@redhat.com>
 <20220318203655.676907-11-jsnow@redhat.com>
In-Reply-To: <20220318203655.676907-11-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 22 Mar 2022 13:00:17 -0400
Message-ID: <CAFn=p-aQ6BPyH5aNLqpD4jC8R8GvKoOqY63pCY7B+rUTO3gErA@mail.gmail.com>
Subject: Re: [PATCH 10/15] iotests/245: fixup
To: qemu-devel <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 18, 2022 at 4:37 PM John Snow <jsnow@redhat.com> wrote:
>
> (Merge with prior patch.)
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/qemu-iotests/242 | 2 +-

^ Oh, there's the stray import changes that needed to be folded into
patch #1. Fixed for v2.


