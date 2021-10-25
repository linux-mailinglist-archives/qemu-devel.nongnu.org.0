Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1614743902E
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 09:18:41 +0200 (CEST)
Received: from localhost ([::1]:44822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meuFk-0000Bq-3z
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 03:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1meuE1-0006tO-2Q
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 03:16:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1meuDz-0004dL-6Z
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 03:16:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635146210;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=AXaPRVztN+4ZHkzs1Vj1+5zUayaUKwlrFVboeLXvCT8=;
 b=c3pRB4y9Y5FMCF9zKjArTORT33yR8IPttrb/gU4xrCZF76ZP9TAQc/hdt2+MNHXLw14ZVs
 /FGYrdPJ1CVCvZsFYAIinO+O9o+sXsMpzySr334pWjM/IDLvgChyRrEf91DzfCtW4M+xpv
 swVX9Q6ePxTW4/Cj9xnXmH8nmoQVMjE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-rCrnUKKZNROSC-N50Hrc9g-1; Mon, 25 Oct 2021 03:16:46 -0400
X-MC-Unique: rCrnUKKZNROSC-N50Hrc9g-1
Received: by mail-wr1-f72.google.com with SMTP id
 x1-20020adfffc1000000b001679fc9c018so2917926wrs.18
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 00:16:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=AXaPRVztN+4ZHkzs1Vj1+5zUayaUKwlrFVboeLXvCT8=;
 b=mYRS0tbvwNXfOLBspsIN97cuN5DOwoTbhOoviKYWIKujiAFcFhNWpKuF0DhPWTJ31I
 Ojc28hb9QfOTnqO1wnjOCzEdn4IaujyYvvNbGRdpf+2eocqGH1nmnhk94G12iCKAgpZ9
 nfuo8jBIUorHN2pW3UmtsJOagh7L1o2hOTtJxrJkgrHF4KxF8XqZVMQisyVE280CO4Ov
 iUtK3YIhlfyphtbXcTeop6elbN0mT74CQUDncgXpsEvDzn8Eh3g+J0lkEP5l73fPu5Lc
 ygqHw+Nc7r9xyplhpqVfFrbngzVs33xyA+WYFDLFc/oM7KbFaojT5/OqMfbRebtO5Ilv
 E5Hw==
X-Gm-Message-State: AOAM533OnOiafsunywMy4In7zTjKm2dT9PpFHKAKye8damAbdvp20yPT
 cRtuj/OeRYsD5Z9Y/wxK6ASHsX9MJqDYPhdCoz+RxQVOXYzJ60ptvXODCtqjKBPXN3ZPxKzvr8O
 GeYCuwLS15pK7UYc=
X-Received: by 2002:adf:ee42:: with SMTP id w2mr21415860wro.227.1635146205151; 
 Mon, 25 Oct 2021 00:16:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZemU/XTJ/mxi69YOtDuALUY8uQZIRn/9tUDgc3pltvHlfdpAK6dwRGN+sB7wFFHX11vHVdg==
X-Received: by 2002:adf:ee42:: with SMTP id w2mr21415848wro.227.1635146205025; 
 Mon, 25 Oct 2021 00:16:45 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id m12sm2755227wrq.69.2021.10.25.00.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 00:16:44 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 2/9] qapi: Mark unstable QMP parts with feature 'unstable'
In-Reply-To: <20211025052532.3859634-3-armbru@redhat.com> (Markus Armbruster's
 message of "Mon, 25 Oct 2021 07:25:25 +0200")
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-3-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 25 Oct 2021 09:16:40 +0200
Message-ID: <87ilxl376v.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 eblake@redhat.com, mdroth@linux.vnet.ibm.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 jsnow@redhat.com, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> wrote:
> Add special feature 'unstable' everywhere the name starts with 'x-',
> except for InputBarrierProperties member x-origin and
> MemoryBackendProperties member x-use-canonical-path-for-ramblock-id,
> because these two are actually stable.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


