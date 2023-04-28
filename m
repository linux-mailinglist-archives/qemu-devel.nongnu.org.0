Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 840F96F1DED
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 20:22:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psSjW-0000Rq-G3; Fri, 28 Apr 2023 14:22:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psSjV-0000Ps-AC
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 14:22:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psSjU-0001mc-2U
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 14:22:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682706131;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=KcFc5j0DAg8eWHd4kU4TYbFwd6KtQYdFzIBS5glrI/U=;
 b=W/lS7GWXQmxjsOiMijfudl+HyBFdgoS7aoGkis38kZKgPwkeTWp+QfLR75tfa9hmO8DQKv
 wsx8CKjEHZmceSCvoXNR2EkBCXzzp4QNfm3UwOY24cRSevLFVqh8aO2GzAeSzOqawaj5CZ
 5PY+P4hlAKf+vsx+5mrmfzXFoDKpVS8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-75vVhpK3N2mupl6SG6mbyg-1; Fri, 28 Apr 2023 14:22:08 -0400
X-MC-Unique: 75vVhpK3N2mupl6SG6mbyg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f21e35dc08so28354285e9.2
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 11:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682706125; x=1685298125;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KcFc5j0DAg8eWHd4kU4TYbFwd6KtQYdFzIBS5glrI/U=;
 b=WiSrP/BjkFenYdAuM1lrqhH+ZPkNTeFH3bF7mOpN2ccv4jtrODqAcVy+y+dekXfKRG
 T/cyg4B3rV/65Gl6WGu6PM9JLm4bFT85oxhs5Rs5JBDIsbEJLM813bjHjjaKB1KAva/q
 6zHK1qMTmdhVWDpaA/sD2Cq3b7pQ8VpUGmVK7oF/kW+RoPXntZGjWo8FkqS6LkRHHIpW
 fY2SsztqEv6/OeOyqVfrxQnxCpdpaY7jLLkgPzSW+9SucAM4szc0aJAm4D72+Iyt7wC1
 ilICHiS3UftiPp9Go4kQn5JB4+yLcwxfokMZmlyfuZg6xf0VYphW9CN6QwDab3JCbArr
 1z8w==
X-Gm-Message-State: AC+VfDzrB+V3ZcwzyFHo/Bs50K5ij496MPsnQDUyHJfbMreWfvn4c0fx
 B9+SL+j6CCca2Qghz9BtsLy9krzDaOBJq9h0wWJvo5NOlkUVEEAIVFcufutC/nt1twAaudjPtd2
 6fJh3Qpy/2p53rdY=
X-Received: by 2002:adf:f491:0:b0:2f7:780e:ee0a with SMTP id
 l17-20020adff491000000b002f7780eee0amr4718207wro.64.1682706125797; 
 Fri, 28 Apr 2023 11:22:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Y+Sm0+m9UN/aWYyINJBs0MBBLkVe1qkkrK4m8YvDUn+Yy0L+WLwsui7CiyIXq9OuNZlYJ5g==
X-Received: by 2002:adf:f491:0:b0:2f7:780e:ee0a with SMTP id
 l17-20020adff491000000b002f7780eee0amr4718165wro.64.1682706125501; 
 Fri, 28 Apr 2023 11:22:05 -0700 (PDT)
Received: from redhat.com (static-213-163-6-89.ipcom.comunitel.net.
 [89.6.163.213]) by smtp.gmail.com with ESMTPSA id
 r16-20020a5d4e50000000b002c7066a6f77sm21721991wrt.31.2023.04.28.11.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 11:22:05 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  michael.roth@amd.com,  peter.maydell@linaro.org,
 pbonzini@redhat.com,  marcandre.lureau@redhat.com,  berrange@redhat.com,
 thuth@redhat.com,  philmd@linaro.org,  mst@redhat.com,
 imammedo@redhat.com,  anisinha@redhat.com,  eblake@redhat.com,
 kraxel@redhat.com,  kwolf@redhat.com,  hreitz@redhat.com,
 arei.gonglei@huawei.com,  pizhenwei@bytedance.com,  jsnow@redhat.com,
 vsementsov@yandex-team.ru,  eduardo@habkost.net,
 marcel.apfelbaum@gmail.com,  wangyanan55@huawei.com,  peterx@redhat.com,
 leobras@redhat.com,  jasowang@redhat.com,  yuval.shaia.ml@gmail.com,
 pavel.dovgaluk@ispras.ru,  jiri@resnulli.us,  stefanb@linux.vnet.ibm.com,
 stefanha@redhat.com,  lukasstraub2@web.de,  kkostiuk@redhat.com,
 qemu-block@nongnu.org,  victortoso@redhat.com
Subject: Re: [PATCH 14/17] qapi: Section parameter @indent is no longer
 used, drop
In-Reply-To: <20230428105429.1687850-15-armbru@redhat.com> (Markus
 Armbruster's message of "Fri, 28 Apr 2023 12:54:26 +0200")
References: <20230428105429.1687850-1-armbru@redhat.com>
 <20230428105429.1687850-15-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 28 Apr 2023 20:22:04 +0200
Message-ID: <87wn1v6f5f.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
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
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

Reviewed-by: Juan Quintela <quintela@redhat.com>


