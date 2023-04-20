Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B746E9DAC
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 23:09:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppbVM-0008W8-4g; Thu, 20 Apr 2023 17:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppbVH-0008VS-6P
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 17:07:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppbVF-0000q1-94
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 17:07:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682024860;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Ma8uiZphVNiXskccS7Cka6O1hhJ6lNqCAto6V9Wg7L8=;
 b=JnBZWk3qqJMES5RdSl+LEptDzKOc51EjGIYSs4kZJ5CCA2k2oM1KYkKdGljfXOUcUqAtCW
 NvKRUaPZj2vZcflc0ZPr29P7tBpOHFtPBVdI2VN4jpgoZQUu92JTqwO/XuUVEanC9G/pfI
 PRrROluZi6psDpWEycuCsw8PtX5nQWE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-UoyJng5TMWyMAUf-ZUYf4A-1; Thu, 20 Apr 2023 17:07:38 -0400
X-MC-Unique: UoyJng5TMWyMAUf-ZUYf4A-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f1793d6363so3509255e9.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 14:07:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682024857; x=1684616857;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ma8uiZphVNiXskccS7Cka6O1hhJ6lNqCAto6V9Wg7L8=;
 b=HqnfBKxrlDNcK+NCDyrzp4o3OJrGhY/2lFNkaOP7jdkH6m0JDe/pn/Ix57mEvNwQ9c
 jSn2eOUI+tY9/6VtUFf1nAbxbrPOT2NDiSr3Yi2s7I9MV9+zMxBE2xANNdcxPMibYIL+
 51Qp4T0bcr/sik72wYxX0/zVd3Czgg2OOrKhE9E5bau64wiea/rZ9TMikUww6QYw6B+W
 s+lsmog0a9SySjww4QhEF1y7kozMvY1ViCYPtwB2OMEQZhYfXIwDTOuoBwq6dzdw3ZZG
 WI92teZRRUpa5m+DhwPwW9pMNEjifTMu6UPsXIMc8vV2RwmP+XigXlJQfHaX4AnVLSZP
 z8Bw==
X-Gm-Message-State: AAQBX9eoc6AjZIujZ8Iwi6mrvOoVNiQNxTkE2rfJGZDMBZAZUtRnBA6g
 5g0IX2qAcPEVL5XyVFE+lIb0yBhF2U75WoYFQLsoJqSdY6PZ6KApiTJgAeiyfWjwCoJI32PbGdW
 or3r4zDTzFy37c4s=
X-Received: by 2002:a05:600c:ac8:b0:3ea:ed4d:38eb with SMTP id
 c8-20020a05600c0ac800b003eaed4d38ebmr179059wmr.24.1682024857445; 
 Thu, 20 Apr 2023 14:07:37 -0700 (PDT)
X-Google-Smtp-Source: AKy350ab7+q++EixGYXy0cGNOKvRq0CsHumw7gSgMQucm3VkXvxZCTCj1HSKbx9O01xVZGLe8SZiQQ==
X-Received: by 2002:a05:600c:ac8:b0:3ea:ed4d:38eb with SMTP id
 c8-20020a05600c0ac800b003eaed4d38ebmr179047wmr.24.1682024857164; 
 Thu, 20 Apr 2023 14:07:37 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 iw18-20020a05600c54d200b003f174cafcdasm6371339wmb.7.2023.04.20.14.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 14:07:36 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org,  Peter Xu <peterx@redhat.com>,  =?utf-8?Q?Marc-?=
 =?utf-8?Q?Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  David Hildenbrand <david@redhat.com>,
 John Snow <jsnow@redhat.com>,  Fam Zheng <fam@euphon.net>,  Hailiang
 Zhang <zhanghailiang@xfusion.com>,  "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-block@nongnu.org,  Gerd Hoffmann <kraxel@redhat.com>,  Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,  Leonardo Bras
 <leobras@redhat.com>,  Markus Armbruster <armbru@redhat.com>,  Stefan
 Hajnoczi <stefanha@redhat.com>,  Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 28/43] migration: Move migrate_use_tls() to options.c
In-Reply-To: <87v8hq744l.fsf@suse.de> (Fabiano Rosas's message of "Thu, 20 Apr
 2023 16:19:54 -0300")
References: <20230420134002.29531-1-quintela@redhat.com>
 <20230420134002.29531-29-quintela@redhat.com> <87v8hq744l.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 20 Apr 2023 23:07:35 +0200
Message-ID: <87a5z2uuso.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Fabiano Rosas <farosas@suse.de> wrote:
> Juan Quintela <quintela@redhat.com> writes:
>
>  
>> +/*
>> + * pseudo capabilities
>> + *
>> + * This are functions that are used in a similar way that capabilities
>> + * check, but they are not a capability.
>
> s/This/These/
> s/that capabilities/to capabilities/
>

Fixed, thanks.


