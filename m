Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E6F6F08AF
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 17:48:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps3oq-0002o6-8q; Thu, 27 Apr 2023 11:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ps3oF-0001tb-Pa
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:45:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ps3oE-0004ro-2Q
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:45:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682610325;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=CRMFgTYxYj4ZeM75nrZ8sgU5NVkNt1qGb8Pe5/Q+NoA=;
 b=Tg+LUoQUGMTDVx3MZn3SIZxMydnbgs8YJunv6aXakm2FuVGQueFRN2VgX2jftWMAi9jjBL
 t1rJTA+irqpgjSopvpZPLjcF6qVRJqjXxoPhg7LE52R1qb3BnI0kgQ3OUOm9ZuPicCh1tX
 49u6PmVs0swJir4q2rvsv6EmoCSXv5s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495--zQ5YcYyMLKHUgpPT5KhXg-1; Thu, 27 Apr 2023 11:45:05 -0400
X-MC-Unique: -zQ5YcYyMLKHUgpPT5KhXg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f080f53c49so50017415e9.0
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 08:45:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682610301; x=1685202301;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CRMFgTYxYj4ZeM75nrZ8sgU5NVkNt1qGb8Pe5/Q+NoA=;
 b=N6Df6Dql9sIoo+mQj712Tjx3WKXdLUqEN2L3L2b+U6AchQ/4xf3388DesWrZ5pCle/
 VKG1ayTOo4iA7BAbYT1v7mTbLZ3zP4rb/UqtyxCrAr4zKhzdBmcr7WzSsKmn44OQLbYG
 brUga0Ql+4brebtggwHNyPqfcS82RiOOS3wV3yPrfSfNrJ49LHNsS69j2Rscwp7yB8Ce
 cgVYZalpVO8WePMnFGWsSOKUSgAHQ38uWoJHNOvKZLVAaNgQT9Y2Z5gJi1tW8TAkIkZV
 kAZSnrL/q8hItuDB4t+VXz32mwbmo5jtmClApDhAmplQ1vTe787OKvZIS4Jjub2s/0NN
 BhfQ==
X-Gm-Message-State: AC+VfDzhtFTDxbL6OLqZWFfvbtcPO2RPkp+Oyr6BbITJCc5di/0KrFS1
 cRa2xBBMYVYGldr2n5xbIdNqqe0aHUct1sW+DeUQRQpiJlf4BRHOEftx8+U1BOM+OrMU0UL33Sl
 3WNvEOEGoKeUW4XY=
X-Received: by 2002:a1c:f217:0:b0:3f2:5be3:cd6a with SMTP id
 s23-20020a1cf217000000b003f25be3cd6amr1782601wmc.4.1682610300877; 
 Thu, 27 Apr 2023 08:45:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6yNfLZ1aDTv8IQLe6DcAF0sRzT0KhDpHP/nRHmfU2hNRifRyuGNoUUMWAwbDF9VSTFeXwR6w==
X-Received: by 2002:a1c:f217:0:b0:3f2:5be3:cd6a with SMTP id
 s23-20020a1cf217000000b003f25be3cd6amr1782579wmc.4.1682610300558; 
 Thu, 27 Apr 2023 08:45:00 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c314f00b003f1978bbcd6sm22604821wmo.3.2023.04.27.08.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 08:44:59 -0700 (PDT)
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
Subject: Re: [PATCH v2 09/16] qapi: Fix bullet list markup in documentation
In-Reply-To: <87leidqr8a.fsf@pond.sub.org> (Markus Armbruster's message of
 "Thu, 27 Apr 2023 17:28:37 +0200")
References: <20230425064223.820979-1-armbru@redhat.com>
 <20230425064223.820979-10-armbru@redhat.com>
 <87leidqr8a.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 27 Apr 2023 17:44:58 +0200
Message-ID: <87v8hhba85.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
> I'm going to squash in the appended patch and add
>
>     John Snow missed the need for a blank line when converting
>     docs/devel/qapi-code-gen.txt to rST.
>
> to the commit message.

Fine with me O:-)

> diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
> index d81aac7a19..ea0592034a 100644
> --- a/docs/devel/qapi-code-gen.rst
> +++ b/docs/devel/qapi-code-gen.rst
> @@ -934,6 +934,7 @@ Example::
>  
>   ##
>   # Some text foo with **bold** and *emphasis*
> + #
>   # 1. with a list
>   # 2. like that
>   #


