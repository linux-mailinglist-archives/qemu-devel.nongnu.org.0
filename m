Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA52C6F1DD0
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 20:09:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psSWs-0002rM-6m; Fri, 28 Apr 2023 14:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psSWg-0002ql-Hy
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 14:08:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psSWe-0007Tl-2X
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 14:08:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682705332;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=c+9Cv2W1z/+/93CMj8MjWzPUVzufHbvjapMgURj1eMY=;
 b=XhJrMquxoX0PJrsqrDC3osCni0ZbicwF4O9ElkepN/ssrLqf9sQhUtBlYmDZ5jEZ0QRmFq
 0L2cpqxoIPgMMi4vw6L4tFDIEeBYUm3HZTyT5Gucw8A287575kDg6u3nuhWmShTlI+H60v
 L6PCuqhluKtmZw+mjsFmKrhim4yJmsQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-278-JLqCMinuMDmOg3ItlVPQ1w-1; Fri, 28 Apr 2023 14:08:51 -0400
X-MC-Unique: JLqCMinuMDmOg3ItlVPQ1w-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-2fbb99cb303so11262f8f.1
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 11:08:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682705330; x=1685297330;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c+9Cv2W1z/+/93CMj8MjWzPUVzufHbvjapMgURj1eMY=;
 b=RG3Srpjgg1GybqHzfi0MgUwb01j/wkjMM/6JvmoXi034NyCHB4Y8yT6t3DVu6j2ekE
 v5CXiXemnMgmQab/hoZghAZNGjJjd4AE4EjiiACbmJdcWKDi1WAsAsAH9FMZ68HIbvGJ
 42mEXIFMg51pyn0NCa6TH7YkTRMzmd4jn1xuGL3hviosOuZGqPwvwhKpIlI4RNWblJnm
 cLcH4felWDOWc5kGJW9NXHGHgPTI1Gyk8+KGQOCWkLjxPxL37PkgW0tJrVnH9R0yo5Fa
 OTJRyA1wKyRlC10hPYFZswKfiFON0WqECb40owVIbVNEXr5VvWDqI1Vh763/uvxaVCrf
 ZFsw==
X-Gm-Message-State: AC+VfDymXOypeRXf2+K9ytpgY3K6qHTTAv7YUTC4YchAXL2ihMnMR8hP
 FqQMQhcWlZTqbMyMEdOe0vc2aViwFcfEf9s16rn4//0Mi1x4S2lVSiULUYp44Z13S0o7UAsJke1
 jgiU+MLzgugjMpFs=
X-Received: by 2002:adf:f491:0:b0:2f7:780e:ee0a with SMTP id
 l17-20020adff491000000b002f7780eee0amr4694213wro.64.1682705330433; 
 Fri, 28 Apr 2023 11:08:50 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5MY3Y0xiznsf7YLV14r+jpJ0kgMk95HXEd9Hzrjqr/Z+X+1prgf99do7yX2h/3tKUH7ddQ5w==
X-Received: by 2002:adf:f491:0:b0:2f7:780e:ee0a with SMTP id
 l17-20020adff491000000b002f7780eee0amr4694189wro.64.1682705330140; 
 Fri, 28 Apr 2023 11:08:50 -0700 (PDT)
Received: from redhat.com (static-213-163-6-89.ipcom.comunitel.net.
 [89.6.163.213]) by smtp.gmail.com with ESMTPSA id
 ay37-20020a05600c1e2500b003f18b52c73asm24817915wmb.24.2023.04.28.11.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 11:08:49 -0700 (PDT)
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
Subject: Re: [PATCH 10/17] tests/qapi-schema/doc-good: Improve argument
 description tests
In-Reply-To: <20230428105429.1687850-11-armbru@redhat.com> (Markus
 Armbruster's message of "Fri, 28 Apr 2023 12:54:22 +0200")
References: <20230428105429.1687850-1-armbru@redhat.com>
 <20230428105429.1687850-11-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 28 Apr 2023 20:08:48 +0200
Message-ID: <87edo37ubz.fsf@secure.mitica>
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
> Improve the comments to better describe what they test.
>
> Cover argument description starting on a new line indented.  This
> style isn't documented in docs/devel/qapi-code-gen.rst.  qapi-gen.py
> accepts it, but messes up indentation: it's stripped from the first
> line, not subsequent ones.  The next commit will fix this.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

>  ##
>  # @Alternate:
>  #
> -# @i: an integer
> +# @i: description starts on the same line
> +#     remainder indented the same
>  #     @b is undocumented
>  #
>  # Features:

Just curious, what is trying to convey this
   @b is undocumented
At the same indentation that the description of @i?


