Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 628956F1DA9
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 19:53:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psSHP-0002TV-C1; Fri, 28 Apr 2023 13:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psSHN-0002TC-6s
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 13:53:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psSHL-0003wB-RH
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 13:53:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682704387;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=y3sg3jQgm38a6bc8tM8vNnQY1Was8/2MJ4jjorrBhQw=;
 b=czQEGXqgqvVCr5nXiz9/FGhhgL81Y5GtdV0SJbMVuw54I5lmJyla+eCiWW4gnYmUspefWw
 JLw4LqW/yUVCkt9Jqb/nNCLwJdaehrr5jaY2tCQy41Y28/J1SrRb9fA9uOt6HUSpWG66eA
 jh8MzCi5DAgUFO5Bc7+OrDsR2LH8BQo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-62Ornt7WMiWhuGXZXA-sfg-1; Fri, 28 Apr 2023 13:53:05 -0400
X-MC-Unique: 62Ornt7WMiWhuGXZXA-sfg-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-2fbb99cb244so7323f8f.3
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 10:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682704384; x=1685296384;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y3sg3jQgm38a6bc8tM8vNnQY1Was8/2MJ4jjorrBhQw=;
 b=bgbtcDLWud196LBv4w28mxlyBwvQMGdJk0h+qRQc9uUlfCbnHNHVfyFhfTiFr5ByQX
 wfeWRhFGBQwWWe2gRevr8IHnxc9FbP37qeOLr7tW0r5u16e9eFsKiHGTQTktUC33XMNM
 SILo4r0smpErgX3UZgAGeHL1kPZusQ1pRlVoeULfRQ9Jp11LNWW6K+6UkgwGWSg9IIkW
 Vx7tptaAP21Z6JyCg0CgsL9Zd/I5OlQxnZDdoyKxGrsNbHSj0K0OMtrxcrPf7x7jkpRE
 64Iyx5A/FejJTtnBzasz7M9p2fVem40VPCO+AklKyMU78aERrDHhW04malh3Q46z6m+q
 kz/g==
X-Gm-Message-State: AC+VfDzYQ2norITItPWQy8REqjwCV1gUjLwu1yKCukTkuac0scvt/fEJ
 fbVytcOVUv/Za2DeAogVmZkCaROrB8yeDXUj8C9oa1Q8f2Eba16Qr189v5yi6eJiZUWgBX6exzw
 T1Fp8GYeSBbL3yDs=
X-Received: by 2002:adf:f810:0:b0:2c5:5a65:79a0 with SMTP id
 s16-20020adff810000000b002c55a6579a0mr4858325wrp.53.1682704384262; 
 Fri, 28 Apr 2023 10:53:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5wsQoVR+eFRGNNHP496EK3g+y7nU3hNckXLENO/Ke3UdB3WSU8cozBpoV/9RzTtgiBXZ+qFA==
X-Received: by 2002:adf:f810:0:b0:2c5:5a65:79a0 with SMTP id
 s16-20020adff810000000b002c55a6579a0mr4858319wrp.53.1682704383938; 
 Fri, 28 Apr 2023 10:53:03 -0700 (PDT)
Received: from redhat.com (static-213-163-6-89.ipcom.comunitel.net.
 [89.6.163.213]) by smtp.gmail.com with ESMTPSA id
 t15-20020adfe44f000000b002f00793bd7asm21566450wrm.27.2023.04.28.10.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 10:53:03 -0700 (PDT)
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
Subject: Re: [PATCH 02/17] docs/devel/qapi-code-gen: Turn FIXME admonitions
 into comments
In-Reply-To: <20230428105429.1687850-3-armbru@redhat.com> (Markus Armbruster's
 message of "Fri, 28 Apr 2023 12:54:14 +0200")
References: <20230428105429.1687850-1-armbru@redhat.com>
 <20230428105429.1687850-3-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 28 Apr 2023 19:53:02 +0200
Message-ID: <87h6sz99mp.fsf@secure.mitica>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> We have two FIXME notes.  These FIXMEs are for QAPI developers.  They
> are not useful for QAPI schema developers.  They are marked up as
> admonitions, which makes them look important in generated HTML.
>
> Turn them into comments.  QAPI developers will still see them (they
> read and write the .rst).  QAPI schema developers may still see
> them (if they read the .rst instead of the generated .html), but "this
> is just for QAPI developers" should be more obvious.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


